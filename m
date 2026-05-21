Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35ADF3BCD07
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 12:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779365063; cv=none; b=A12HdNdFFYw/e28eXvXpIO5qSsZhtax91NtAy1mEiZiy3fc1dD45HzxNqtKXsj5DXp2JCGRXBFhA64OSXQCRz+ni+WTBMXbEn7M/xPyGhyy/LPl5Nm1BkaF0hN5vM3F3qsxbXsx0mIcelN0bveQ28lcNGwBZyHwR80/8Vx0tbMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779365063; c=relaxed/simple;
	bh=sUj3Twmg9sv0IDvSRDz8N2kvdStNX/TLH4+TmHaPjNE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qWDa+1DujBt5/6rbCIBbx3goG0eLQjhNAe96i7d0bdmlf9w38zqqnsBNJdZADPqf9xM7w55p4y0+2w3MKa5a1m49CL5r6nEFZfI/tac9h1MdJpZlhpuAMazmrIZ7JeWOuzrz6C+i/VzmkotZxNysKpgPEPIQFTsVajMEO2Pyj28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lHxflUCe; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lHxflUCe"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso37191775e9.0
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 05:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779365060; x=1779969860; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kjahf0mvv6U9uz8GUu7it7h6OHA5HQ2HOSOEgZINcYE=;
        b=lHxflUCeC61k47AfshSEUYR7WBGR1SeMLDN05P3arvCggEdqx6DNzd8ABA8acldvA5
         qanOp3SYwXl8HRfOdKGfTU+s3tDjYTlVe92h8VeH0E6PGHh5Yaqp6Mh+I+jh4x+Oefq/
         Tp2jNDPc9q6Jsmbmu5gF1CnGZ25e7ZYWNyvNS83r1I+dAHZiZ1q52qrpWJrfqif14wiU
         Ai0fd1pNIpZ1WLUjnJgEfzkMQGVaVashLx3/sOuw+D2Up53R5+3wgyjov9hcRtQDzbVQ
         wNshp2ZZGbu8MJldff+zWxVm+W94t7zvwiq7ThCmKm3h9WZSEMI6f4GcM5nHu/rvwDMi
         KqGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779365060; x=1779969860;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kjahf0mvv6U9uz8GUu7it7h6OHA5HQ2HOSOEgZINcYE=;
        b=oMs4oMoZjfgAR9feT3TrUnRIhKfnE/rxyEtE15SLK7Q04S8QmZ2R2NNOpQ8PYUpZ9T
         di6ICTNOMgp57saLM+jfmrDM8VIpW2oEWPuu88yi8McGvr/gJYVV+L5nkRtRSK4itWN0
         ryOzFWb57dkOOBDA6lvMEraXCN7u0TrOfdbJDiZ0Y5W2ExZsMKj9JopqGcxrnqdbbVpj
         J+qOgWS08nHVtZclDY33AuNJHD3xHTBEw9E6VNvGlQRY7I1ExNEz95cvNN9Z9i2wWMC1
         6gTMtvalM/rrXPOGQJ11BvW4lGz5sufz37b5FVOWM9IQIgXnlCZXmchg6Ktm5+CjxMiv
         jI+Q==
X-Forwarded-Encrypted: i=1; AFNElJ8YskTXUPYfpS2yir8vB6pV6FB3XDkcQv6v/DNF0VM9T+dAALU1jlwtA9CGZ9mcs5Lf9KuL3+acneql@vger.kernel.org
X-Gm-Message-State: AOJu0YyHJBs+X8XKgeA7xv4YLp2TlLQNej86h6+Xvu2yRfdTs4JjYf2y
	LYfG/cyZMxEdUok83STGfqID/yb1qtamG8rq0TZYgJ+aIYxXXFxwnch9gRtYvDa7L4w=
X-Gm-Gg: Acq92OHRr8KQMrvUNWaAeco8Eg7h1tSlx/yGoleBns62gW02OiURVfWfErc0iqOY/Tz
	OvSL/e3ORjX4RFXw8hbpKu+6dFA3XooQyqyuRKlqB75lpppojeCx2O2Luqi9RWXw/OUPMFqtA3g
	1nQaJqsTa5c95UHWU8i+HqHnZt9j/16HFMid/jJeH5nL9A64EyH4aFRB64hYPd3+fkkCzZLDMDj
	Hme5o01GVJWu9BfFdIgpjKqKK1tcMPyA98JhjhhXs5EQ9oLhl/IjOmFis35tEtpaOR1AMNs45/M
	qIcqSdOuWS0yrNXXVgGPfFU7ogg/NyriRpnPGM6KL/7ZGO0wGq9ks1PkxsV1I+Gudy+quFfNDBR
	3kXKiR8MChsMDlZE770obG7zjUaS7+KLqV42YIYl7EyZKscolrsPWz1UGLtCs6FsTF6OyXgKPdZ
	Y7bZnXXEsCYXCN4Om3JIbmGeC8MTU3i+6uzw==
X-Received: by 2002:a05:600c:6c8:b0:489:1d74:56d with SMTP id 5b1f17b1804b1-490360c52e4mr22056995e9.29.1779365060197;
        Thu, 21 May 2026 05:04:20 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.55.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903c99d807sm25117975e9.5.2026.05.21.05.04.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 05:04:19 -0700 (PDT)
Message-ID: <ac559877-f4f2-48d7-b00c-4cf24fc64489@linaro.org>
Date: Thu, 21 May 2026 13:04:18 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: x1-dell-thena: bump linux,cma to
 256 MiB
To: Michael Scott <mike.scott@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org
Cc: vkoul@kernel.org, neil.armstrong@linaro.org,
 dmitry.baryshkov@oss.qualcomm.com, wesley.cheng@oss.qualcomm.com,
 abelvesa@kernel.org, faisal.hassan@oss.qualcomm.com,
 linux-phy@lists.infradead.org, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, val@packett.cool, laurentiu.tudor1@dell.com,
 alex.vinarskis@gmail.com, linux-kernel@vger.kernel.org
References: <20260521010935.1333494-1-mike.scott@oss.qualcomm.com>
 <20260521010935.1333494-5-mike.scott@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20260521010935.1333494-5-mike.scott@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 21/05/2026 02:09, Michael Scott wrote:
> The 128 MiB linux,cma reserved-memory pool on dell-thena is too small
> to support the camera pipeline in parallel with the normal Linux
> desktop. On a freshly-booted system with GNOME running, the typical
> runtime consumers — msm DRM framebuffers (Wayland triple buffering on
> the eDP panel), qcom_iris video codec buffers, qcom_camss VFE
> pre-allocated buffers — already occupy ~100 MiB of the pool, leaving
> only ~25 MiB free.
> 
> The libcamera "simple" pipeline handler used by /dev/media0 on
> dell-thena allocates four ABGR8888 frames at 1920×1088 = 32 MiB total.
> That request fails on the fourth frame:
> 
>      ERROR DmaBufAllocator: dma-heap allocation failure for frame-3
>      ERROR Allocator: Stream is not part of /base/.../camera@10 active configuration
>      Can't allocate buffers
>      Failed to start camera session
> 
> resulting in gnome-snapshot's "Could not play camera stream" and any
> other libcamera-mediated app being unable to actually stream.
> 
> Bumping linux,cma to 256 MiB (a 0.9% reservation on these laptops'
> typical 27 GiB RAM) leaves ~150 MiB free at runtime — sufficient for
> the libcamera buffer set plus headroom for video playback or other
> CMA-hungry workloads in parallel.
> 
> Tested on Dell Latitude 7455: with the 256 MiB pool, CmaFree at
> GNOME-desktop idle is ~150 MiB, gnome-snapshot streams the OV02E10
> camera cleanly, and `cam -c 1 --capture=2` succeeds.
> 
> The companion board files dell-inspiron-14-plus-7441 and the upstream
> .dts variants inherit from x1-dell-thena.dtsi, so this changes the
> pool size for every dell-thena-based laptop in one place.
> 
> Signed-off-by: Michael Scott <mike.scott@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
> index d6de4da02dcd..714988a81384 100644
> --- a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
> @@ -167,7 +167,7 @@ led-camera-indicator {
>   	reserved-memory {
>   		linux,cma {
>   			compatible = "shared-dma-pool";
> -			size = <0x0 0x8000000>;
> +			size = <0x0 0x10000000>;
>   			reusable;
>   			linux,cma-default;
>   		};

How old is your version of libcamera ?

With CONFIG_UDMA=y you don't need a contiguous memory area at all and 
you will get juicy and delicious GPUISP.

Instead of allocating in the kernel just use a better version of libcamera

┌─[deckard@inspiron14p-linux] - [~/Development/libcamera] - [Thu May 21, 
13:03]
└─[$] <git:(0.7.0-multipass-v0*)> zcat /proc/config.gz | grep UDMA
CONFIG_UDMABUF=y
┌─[deckard@inspiron14p-linux] - [~/Development/libcamera] - [Thu May 21, 
13:03]
└─[$] <git:(0.7.0-multipass-v0*)> cam -v
libcamera version v0.7.1
┌─[deckard@inspiron14p-linux] - [~/Development/libcamera] - [Thu May 21, 
13:03]
└─[$] <git:(0.7.0-multipass-v0*)> qcam
[68:50:10.493478857] [438859]  INFO Camera camera_manager.cpp:340 
libcamera v0.7.1
[68:50:10.511134091] [438863] ERROR V4L2 v4l2_subdevice.cpp:1192 
'ov02e10 10-0010': Unable to get rectangle 2 on pad 0/0: Inappropriate 
ioctl for device
[68:50:10.511201590] [438863]  WARN CameraSensor 
camera_sensor_legacy.cpp:402 'ov02e10 10-0010': The PixelArraySize 
property has been defaulted to 1928x1088
[68:50:10.511206069] [438863] ERROR V4L2 v4l2_subdevice.cpp:1192 
'ov02e10 10-0010': Unable to get rectangle 1 on pad 0/0: Inappropriate 
ioctl for device
[68:50:10.511209559] [438863]  WARN CameraSensor 
camera_sensor_legacy.cpp:413 'ov02e10 10-0010': The 
PixelArrayActiveAreas property has been defaulted to (0, 0)/1928x1088
[68:50:10.511213778] [438863] ERROR V4L2 v4l2_subdevice.cpp:1192 
'ov02e10 10-0010': Unable to get rectangle 0 on pad 0/0: Inappropriate 
ioctl for device
[68:50:10.511216590] [438863]  WARN CameraSensor 
camera_sensor_legacy.cpp:421 'ov02e10 10-0010': Failed to retrieve the 
sensor crop rectangle
[68:50:10.511219559] [438863]  WARN CameraSensor 
camera_sensor_legacy.cpp:427 'ov02e10 10-0010': The sensor kernel driver 
needs to be fixed
[68:50:10.511221746] [438863]  WARN CameraSensor 
camera_sensor_legacy.cpp:429 'ov02e10 10-0010': See 
Documentation/sensor_driver_requirements.rst in the libcamera sources 
for more information
[68:50:10.511327474] [438863]  WARN CameraSensorProperties 
camera_sensor_properties.cpp:538 No static properties available for 
'ov02e10'
[68:50:10.511330599] [438863]  WARN CameraSensorProperties 
camera_sensor_properties.cpp:540 Please consider updating the camera 
sensor properties database
[68:50:10.511334089] [438863]  WARN CameraSensor 
camera_sensor_legacy.cpp:617 'ov02e10 10-0010': Rotation control not 
available, default to 0 degrees
[68:50:10.511340912] [438863]  WARN CameraSensor 
camera_sensor_legacy.cpp:502 'ov02e10 10-0010': No sensor delays found 
in static properties. Assuming unverified defaults.
[68:50:10.512362985] [438863]  WARN IPAProxy ipa_proxy.cpp:196 
Configuration file 'ov02e10.yaml' not found for IPA module 'simple', 
falling back to '/usr/share/libcamera/ipa/simple/uncalibrated.yaml'
[68:50:10.512372828] [438863] ERROR V4L2 v4l2_subdevice.cpp:1192 
'ov02e10 10-0010': Unable to get rectangle 0 on pad 0/0: Inappropriate 
ioctl for device
[68:50:10.512377464] [438863]  WARN CameraSensor 
camera_sensor_legacy.cpp:881 'ov02e10 10-0010': The analogue crop 
rectangle has been defaulted to the active area size
[68:50:10.512386578] [438863]  WARN IPASoft soft_simple.cpp:104 IPASoft: 
Failed to create camera sensor helper for ov02e10
[68:50:10.512505275] [438863]  INFO Camera camera_manager.cpp:223 Adding 
camera '/base/soc@0/cci@ac16000/i2c-bus@1/camera@10' for pipeline 
handler simple
[68:50:10.548026157] [438859]  INFO Camera camera.cpp:1216 configuring 
streams: (0) 1920x1088-ABGR8888/sRGB
[68:50:10.548323081] [438863]  INFO IPASoft soft_simple.cpp:258 IPASoft: 
Exposure 1-2242, gain 16-248 (1)
[68:50:10.548402247] [438863]  INFO SoftwareIsp software_isp.cpp:278 
Input 1928x1088-GRBG-10-CSI2P stride 2416
Zero-copy enabled
[68:50:10.636862424] [438866]  INFO eGL egl.cpp:288 EGL: EGL_VERSION: 1.5
[68:50:10.636899299] [438866]  INFO eGL egl.cpp:289 EGL: EGL_VENDOR: 
Mesa Project
[68:50:10.636902112] [438866]  INFO eGL egl.cpp:290 EGL: 
EGL_CLIENT_APIS: OpenGL OpenGL_ES
[68:50:10.636904768] [438866]  INFO eGL egl.cpp:291 EGL: EGL_EXTENSIONS: 
EGL_ANDROID_blob_cache EGL_ANDROID_native_fence_sync 
EGL_EXT_config_select_group EGL_EXT_create_context_robustness 
EGL_EXT_image_dma_buf_import EGL_EXT_image_dma_buf_import_modifiers 
EGL_EXT_query_reset_notification_strategy EGL_EXT_surface_compression 
EGL_IMG_context_priority EGL_KHR_cl_event2 EGL_KHR_config_attribs 
EGL_KHR_context_flush_control EGL_KHR_create_context 
EGL_KHR_create_context_no_error EGL_KHR_fence_sync 
EGL_KHR_get_all_proc_addresses EGL_KHR_gl_colorspace 
EGL_KHR_gl_renderbuffer_image EGL_KHR_gl_texture_2D_image 
EGL_KHR_gl_texture_3D_image EGL_KHR_gl_texture_cubemap_image 
EGL_KHR_image_base EGL_KHR_no_config_context EGL_KHR_reusable_sync 
EGL_KHR_surfaceless_context EGL_EXT_pixel_format_float EGL_KHR_wait_sync 
EGL_MESA_configless_context EGL_MESA_gl_interop 
EGL_MESA_image_dma_buf_export EGL_MESA_query_driver 
EGL_MESA_x11_native_visual_id EGL_NV_context_priority_realtime
[68:50:10.643064652] [438866]  INFO eGL egl.cpp:332 EGL: GL_VERSION: 
OpenGL ES 3.2 Mesa 26.0.6-arch1.1
[68:50:12.667202273] [438866]  INFO Benchmark benchmark.cpp:89 Debayer 
processed 30 frames in 228802us, 7626 us/frame
┌─[deckard@inspiron14p-linux] - [~/Development/libcamera] - [Thu May 21, 
13:03]
└─[$] <git:(0.7.0-multipass-v0*)>
