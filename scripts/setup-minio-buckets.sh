#!/bin/bash

# Setup MinIO buckets via mc (MinIO Client)
echo "Setting up MinIO buckets..."
mc alias set minio http://localhost:9000 minioadmin minioadmin
mc mb minio/videos
mc mb minio/audio
mc mb minio/tts
mc mb minio/documents
echo "✅ Buckets created: videos, audio, tts, documents"