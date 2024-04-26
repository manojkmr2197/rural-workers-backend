package com.app.ruralworkers.handler;

import com.app.ruralworkers.constants.FileConstants;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.OffsetDateTime;

@RestController
@RequestMapping("/api/v1/file")
public class FileHandler {

    @GetMapping(value = "/user/image/{fileName:.+}", produces = MediaType.IMAGE_JPEG_VALUE)
    public Resource getUserImage(@PathVariable String fileName) {

        Path imagePath = Paths.get(FileConstants.FILE_BASE_PATH+FileConstants.USER_PROFILE_PATH + fileName);
        try {
            Resource resource = new UrlResource(imagePath.toUri());
            if (resource.exists() || resource.isReadable()) {
                return resource;
            } else {
                throw new RuntimeException("Failed to load the image: " + fileName);
            }
        } catch (IOException e) {
            throw new RuntimeException("Failed to load the image: " + fileName, e);
        }
    }



    @PostMapping("/user/image/upload")
    public ResponseEntity uploadUserImage(@RequestParam("file") MultipartFile file,@RequestParam("userId") Integer userId, RedirectAttributes redirectAttributes) {
        // Check if the file is empty
        if (file.isEmpty()) {
            redirectAttributes.addFlashAttribute("message", "Please select a file to upload");
            return ResponseEntity.badRequest().body("Please select a file to upload");
        }
        // Check if the file has a JPG/JPEG extension
        String filename = file.getOriginalFilename();
        if (filename != null && !filename.toLowerCase().endsWith(".jpg") && !filename.toLowerCase().endsWith(".jpeg")) {
            redirectAttributes.addFlashAttribute("message", "Please upload a JPG or JPEG file");
            return ResponseEntity.badRequest().body("Please upload a JPG or JPEG file");
        }
        try {
            filename = OffsetDateTime.now().toEpochSecond()+"-"+filename;
            // Get the file and save it somewhere
            byte[] bytes = file.getBytes();
            Files.createDirectories(Paths.get(FileConstants.FILE_BASE_PATH+FileConstants.USER_PROFILE_PATH));
            Path path = Paths.get(FileConstants.FILE_BASE_PATH+FileConstants.USER_PROFILE_PATH + filename);
            Files.write(path, bytes);
            redirectAttributes.addFlashAttribute("message", "You successfully uploaded '" + filename + "'");
            return ResponseEntity.ok("You successfully uploaded '" + filename + "'");
        } catch (IOException e) {
            redirectAttributes.addFlashAttribute("message", "Could not upload the file: " + filename + "!");
            return ResponseEntity.ok("Your uploading failed '" + filename + "' "+e.getMessage());
        }
    }
}


