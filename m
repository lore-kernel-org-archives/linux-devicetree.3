Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2762E7375
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 07:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785483326; cv=none; b=Ft+F8HCeIJ+MTq9PbmawWQqd019pyDmc909HOWx+/TeEaRmWpcjoEnxb6dGZaYgPxI3Hf/G9sKg2D5twPwyqRrQ2rn+Bqf3Vp+pj31bqYz1HiWEJQkZzpg58PwUgQ2ZrUVv2QmYJ6y0sPVwmHsTVPsTaM8B4dVj76S8j5gl9rVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785483326; c=relaxed/simple;
	bh=PAxsVrS1U1pzwO2AkaMj93cMOBDbU1QslMc309ubI7E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sJjuOaFIEWdJ7VgeSTbZpE/dObBaUmaTSkZUGCLSaDGvQ7qRVl6FEirmoDNeryeMD0wRlI0uWpaYcX5pTdFqB6RsL3kFS8AlfvWTU8YPw3haykdWIDf0Mav/57gos8/8Jabd/KS2heB2rnL34OiI57bF/uV0RvHNYZqTf/YTyMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CdoWbW8V; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CdoWbW8V"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5b2aa3be376so496028e87.0
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 00:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785483323; x=1786088123; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZuZR99NGerWZTb+AnZM24uaAIuNkIxHXPHc6dFsDDnA=;
        b=CdoWbW8VhBv+ezUm6qAeDgQqMGgdzK0j9Hl7CWfxBi5mShnkpeHZr1fzA/TmGTTlHe
         AOxRIX/Sm+68MQkLQiCj9Gio5vi22IHrlxhDKd2St9euz75s2tumIfj9Ttv9TtQC1ZeO
         e39RQnxvj29wfQ3lpaGMv7nYDV4WGlIKM96giXe8PrigUeFBQUREsYwKY9asK5FT+Gdq
         Co022lYz3OpJ0U3ovem0xGUV8n7dD5GE2FDvaDXIGkbPgvkKAEMfP7NbZC02/yBiCO3k
         9wOA5phVLTBGvKBH1k1vd685LlPTKiSnuirbJMJCK9qf/dM2KuJ0F6cHbg6fuVAd+c5e
         okbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785483323; x=1786088123;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZuZR99NGerWZTb+AnZM24uaAIuNkIxHXPHc6dFsDDnA=;
        b=lsuSWJZRHm74Wk/HTZPhp4lTf3gKa+GJx8a33sI1pUKjfWVbOdren3mL2AoL9fDCQd
         CMNUtPZJvdjejcoA/CWcvTGSJS4mYYRjJTEm/r+D29bsonqBgBEQCge/c/H4CLq9qBOc
         rbDZ8l/WZsY9sy7TTn+BfuX6fODvPPSXWbJYBDfyEfpPsx1q4DYFo2QVDCK1MsTVR2YT
         C8yuqUgOmGiA6EnnkvtxmummSsLIIGePVhGe5xZyg4GIqiBnUlP6lpHA5j3izTPg7uvI
         dSPBSihnQLicmbMrXAiz9hbuFRSEem7d1TMgHYJIAAOO9i1IikYzKb5stx91/lyJFKR5
         z8IQ==
X-Gm-Message-State: AOJu0Yx9V4UPpQS5f4BWkjyQTerPexj2pBJ2Im/rIBbE3Rbz7jwEmHDj
	UA4M9PjLBwA7mGXsoPMUCRZ1p2y2dcZbX+NPgALA5ie+ex9wvY//iX5l
X-Gm-Gg: AR+sD11ySVpS6P+jerYe9uNiEJBveERQI8sK34uuvOPE+1fw9kFI4jIZOnAwhkrq33i
	uKvPvS7DUgAMXlVWX6DdOdbHJT9Cj8wRmsApb2MbhFwbkQHdxMnTb8LwV1+dDWDIV0W9uvM+QXZ
	VpVTGoDjdKjD/ks9ZDluaPW0tExfDC9W7aZrIQ5haeloLLc1xMdS/6Kzok0N0fUaXuQiGcaAaA+
	JruUJa9n2yE5RylDGEdqhv7cHVUVsYxe7JbXAIc1TA2kJ8w9CzmF4zNgdONL6H9rCBqAVPMXHKO
	6ypctd0SFfMvS+URizYbg7HVxGnAjTmMqO511hs7fRZ4XyGLGjZc+Qqdc+zGhbG1jvGvst9xDPg
	3IyBcsu3zm1hklRXVpGwfx94fgBVqWpRQIFp44YyaGXm1Vx7y4/zoxBRK/GQGAdhLEKF61StFRY
	27TFYsL6Pq4fks8GEwZyFBOEyplnW0WNmtSJFwib+OPwmGBBXwXKqyZFXP42o1T42nPKYqisXAf
	C0v
X-Received: by 2002:a05:6512:3e09:b0:5b1:5451:d969 with SMTP id 2adb3069b0e04-5b2e1fc802bmr243809e87.25.1785483323048;
        Fri, 31 Jul 2026 00:35:23 -0700 (PDT)
Received: from gentoo.sknt.ru ([95.161.221.172])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2e23cbeedsm143653e87.30.2026.07.31.00.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 00:35:21 -0700 (PDT)
From: Alexander Shiyan <eagle.alexander923@gmail.com>
To: linux-media@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>
Subject: [PATCH 0/2] media: i2c: Add onsemi AR0234 camera sensor driver
Date: Fri, 31 Jul 2026 10:35:03 +0300
Message-ID: <20260731073505.2278769-1-eagle.alexander923@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds a driver for the onsemi AR0234 CMOS image sensor.
The AR0234 is a 1/2.6-inch global-shutter sensor with a 1940x1220
pixel array, capable of 1920x1200 resolution at up to 120 fps.
It supports MIPI CSI-2 output with 1 to 4 data lanes, raw Bayer
(8/10-bit) and monochrome formats, as well as DPCM 10->8 compression.

The driver has been tested with 2 and 4 lanes on an ARM64 Rockchip
RK3568 platform with a 27 MHz external clock. Both 8-bit and 10-bit
raw Bayer modes are functional.

Notes:
- 1-lane mode is currently disabled; attempts to use it produced no
  valid image.

[root@diasom-evb ~]# v4l2-compliance -u 2
v4l2-compliance 1.28.1, 64 bits, 64-bit time_t

Compliance test for device /dev/v4l-subdev2:

Driver Info:
ar0234 9-0018: =================  START STATUS  =================
ar0234 9-0018: ==================  END STATUS  ==================
        Driver version   : 7.1.0
        Capabilities     : 0x00000000
        Client Capabilities: 0x0000000000000002
interval-uses-which
Required ioctls:
        test VIDIOC_SUDBEV_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/v4l-subdev2 open: OK
        test VIDIOC_SUBDEV_QUERYCAP: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 20 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
        test VIDIOC_G/S_PARM: OK (Not Supported)
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK (Not Supported)
        test VIDIOC_TRY_FMT: OK (Not Supported)
        test VIDIOC_S_FMT: OK (Not Supported)
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK (Not Supported)
        test Composing: OK (Not Supported)
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_REMOVE_BUFS: OK
        test VIDIOC_EXPBUF: OK (Not Supported)
        test Requests: OK (Not Supported)

Total for device /dev/v4l-subdev2: 45, Succeeded: 45, Failed: 0, Warnings: 0

Alexander Shiyan (2):
  dt-bindings: media: i2c: Add onsemi AR0234 image sensor binding
  media: i2c: Add onsemi AR0234 image sensor driver

 .../bindings/media/i2c/onnn,ar0234.yaml       |  123 ++
 drivers/media/i2c/Kconfig                     |   12 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/ar0234.c                    | 1265 +++++++++++++++++
 4 files changed, 1401 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/onnn,ar0234.yaml
 create mode 100644 drivers/media/i2c/ar0234.c

-- 
2.52.0

