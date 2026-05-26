Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D543CAE74
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 09:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779789466; cv=none; b=C1vqyLMH6u2CZUuk/qcbbxsavjlnDIzb+/PldlFXpzFh6xzBXNqyCu9JG67uoR1jH25g7gPk+9lhlhSdlCOQ/lUzIp3ff3aL31KyzT7cGc0wH3bKxaLAYJomwnQ6cK/+R89Kvell9kPHnWqgDW5QXyf3wQ15ogOL5PBGyvpqVXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779789466; c=relaxed/simple;
	bh=Kmq+0JLaZnUA+G7wcCq8VCK1JhVzlHRY2UTpbNvp+v0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eIUBHP9SrHEvi1ag/+C5haBXu8oiolMMwGEeJobI25UY1SMgroZrA4CqyTQrHaWF7hBfLkzJqIFW9bHFbmHxV2Zzw84+/UA0WikTWzx8qZGLa2RNwe4fKKLKRF8eaFr3Q3lJY0Me/XJbq87ZC+TkKz+ffamwJNTNPmQ+ykAy6tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FIpmG9YB; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FIpmG9YB"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c8026aa4d53so7650859a12.3
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 02:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779789465; x=1780394265; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gSOWa+WoGd25f9CoUvwpEs1bBTK5FG4rfD00vKZHrt4=;
        b=FIpmG9YB7AUYlUjE/LRtFbt3M0G4a+5eDaZ45PLmR1ZuWajR1ngkPB7Z2860U9uhWO
         LOnx9xmmYLoR4ywRg7thHlQmK35e0oJxezInTlvrkryjsKquAYGpefQaK4/ChSd+tF8r
         1XP/LdZGYp/mjiHOCLZ2Mdp/O7rHa5TslAF9EPI8exG76JcNVG9Hs4DOaGVYyXhpnbwi
         DSlRkgzdEIDslm29nA21AX9vTEAsuRjmn2OzWIZ+JFdQdqdv/iqfhr9yygkafyckvCYP
         0GN0W3ThpXAd1a0pkQqvOQOpQBtdx4EYKSKSvc6eiovOx09riVP1ju0367o1G6KRaZL8
         aOTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779789465; x=1780394265;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gSOWa+WoGd25f9CoUvwpEs1bBTK5FG4rfD00vKZHrt4=;
        b=ZNi1PV8J7Kmja/f30uEWEupGoD+686DsNATjNnJ7Ik2VEtjTBQ3bz9CXh7K+WZsBBx
         KKuDDatNFsr0vJp3tQlNpCGDvXH74fhYyhEVLJaHx0QO+9sYsJUnRTMIYAxqW9OIwVT5
         PW703CQm8o43kYgXI9CiGhxDkp8PVlHmIboUCr8Dpy7ywa/abaXv/gEaoLLYwShutiSl
         +72WpbYR/fwI4hJ8+3Jro3LTcSRXkyMqJfRaRpnCKvvIoxuX36jWFiz8wAmiwEsWicv7
         Z/RCXExOAUyDJl2LlYx8OhLlxZdujU7AxJ+y1/vXh8rQ1qgPh3du1VluS9vXjmaNkl4I
         KMcw==
X-Forwarded-Encrypted: i=1; AFNElJ86ZSu5x3n/FygHGgbcbXAz0Ctc+H4QLSTgntekwOPivVD76/xJH2pN041F4R4v3gsfzG8MQQP33usA@vger.kernel.org
X-Gm-Message-State: AOJu0YzijuetXAEne51bGO2T1QYAr9nIpKB6PTGGENVMPjNF7qodjwyr
	tC05vl7HEhte7hvEcUUGIJyfBtdC2R1q5gSJQzbpOGZQdZWBWk0jXMA1
X-Gm-Gg: Acq92OG4n4lhgD5++DvdUePwIwdlhKfbLxTaRbjYaKtoQKhn3stZ7RhTTXNwcnrmfqP
	IWNI6iaa3QHDGfELGaqP7iiJEMVvo7GSuQ8gWT3OKMoGyBbPc9BHxF2VlmK2QTCpGGn3oeJ0xPU
	vk5xp0kzVQOuzLpXiW40BvsCaPmnBaXJpkDQYs4n7PCJIo6AfCudWoTz8mRIY9tVYa3vaVbCKbH
	fohhd4cdXwNIArCA4x/PBNGV4usV+9dDGZ2xWLIo6UlQs6x5km47576nNt1drlUkgxmK4GDUN4H
	l2qulJeTZzWjjgkzAqsy/tKDAku9hWkeFKLGHjeBMGerZNbohtD+ZLpvaCH7NQjfoKt00+RelJt
	Npw5JnFBGb3Z0ieZOfeLSVIIz73CmyAOWwqPf3ifCBXXCM50Dmt5GI75P1pKxM4ikLZJ4+5XUsq
	Gd8m6fmw2AsrHj7T7XfGZCn98P/B+5u0tXlsjgr9ktTUIu0VHO6A2sTDs8hyUDRoqEWWL82wzFC
	SZyTLNs++w=
X-Received: by 2002:a17:902:ce8e:b0:2b2:4f43:b48c with SMTP id d9443c01a7336-2beb0381369mr203545545ad.14.1779789464668;
        Tue, 26 May 2026 02:57:44 -0700 (PDT)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b2d47sm147055165ad.45.2026.05.26.02.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 02:57:43 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
Subject: [PATCH v2 0/2] drm/tiny: add support for PIXPAPER 4.26 monochrome
 e-ink panel
Date: Tue, 26 May 2026 17:57:15 +0800
Message-Id: <20260526-bar-v2-0-c66df9a840c4@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHtuFWoC/zWMywrDIBBFfyXMuhYfUbCr/kfIwtoxGWhi0SItw
 X+vFbo8l3vOARkTYYbLcEDCQpni3kCeBvCr2xdkdG8MkkvDNdfs5hLTUgXpVTBWWWjPZ8JA716
 Z5sYr5VdMnx4t4rf+fdP9IhhnQgqrR27CiOG6bI4eZx83mGutX0IBFuqWAAAA
X-Change-ID: 20260505-bar-523f2c3f6939
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wig Cheng <onlywig@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, LiangCheng Wang <zaq14760@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779789463; l=1797;
 i=zaq14760@gmail.com; h=from:subject:message-id;
 bh=Kmq+0JLaZnUA+G7wcCq8VCK1JhVzlHRY2UTpbNvp+v0=;
 b=H20lFZ57zk7aLVD9tzw2j8UNuMfNWBa3MKA5sXBHiXJmdmFROxPxHaCPGx/w/yU34eWDDAUXZ
 pgYnO/HpbeIB5T8zuWr/aDgC+EEg/JnKGg4LLGiEJGXw+g1avjDnKhI
X-Developer-Key: i=zaq14760@gmail.com; a=ed25519;
 pk=5IaLhzvMqasgGPT47dsa8HEpfb0/Dv2BZC0TzSLj6E0=

This patch series adds support for the Mayqueen Pixpaper 4.26
monochrome e-ink display panel, controlled via SPI.

The series includes:
- Device tree binding updates for the Pixpaper 4.26 panel
- A DRM tiny driver implementation for the Pixpaper 4.26 panel
- A MAINTAINERS update for the Pixpaper DRM drivers and binding

The panel supports 800x480 resolution with XRGB8888 framebuffer
input and uses SPI, along with GPIO lines for reset, busy, and
data/command control.

Tested on:
- Raspberry Pi 5 with Linux kernel 7.1.0-rc1

Feedback is welcome.

Signed-off-by: LiangCheng Wang <zaq14760@gmail.com>
---
Changes in v2:
- Explain why pixpaper-426m requires a distinct compatible string despite
  sharing the same SPI and GPIO properties with the existing Pixpaper panel.
- Drop the duplicated pixpaper-426m DT binding example.
- Update the binding description for multiple Pixpaper panels.
- Select DRM_GEM_SHMEM_HELPER instead of DRM_GEM_DMA_HELPER for the
  pixpaper-426m driver.
- Link to v1: https://lore.kernel.org/r/20260506-bar-v1-0-12195406f4ef@gmail.com

---
LiangCheng Wang (2):
      dt-bindings: display: mayqueen,pixpaper: add pixpaper-426m
      drm/tiny: add support for PIXPAPER 4.26 monochrome e-ink panel

 .../bindings/display/mayqueen,pixpaper.yaml        |  13 +-
 MAINTAINERS                                        |   3 +-
 drivers/gpu/drm/tiny/Kconfig                       |  16 +
 drivers/gpu/drm/tiny/Makefile                      |   1 +
 drivers/gpu/drm/tiny/pixpaper-426m.c               | 828 +++++++++++++++++++++
 5 files changed, 855 insertions(+), 6 deletions(-)
---
base-commit: a293ec25d59dd96309058c70df5a4dd0f889a1e4
change-id: 20260505-bar-523f2c3f6939

Best regards,
-- 
LiangCheng Wang <zaq14760@gmail.com>

