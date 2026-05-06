Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F2A1A6820
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 06:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778048750; cv=none; b=ejes1A9Y69TCbBmU8IlYXuTlU7fzfE0ogAf3wwhyLjnjH0Us3ITaVwvD8YZAyBVDyQWbDQVBk0pYlOS7QzopUV3agHyCXNluJyLqGeFydqGXa44j9sEHk3tBX+UiG/m8k3FptY1qrtOY5CxsB2bGskkXeBkFMqVSG5dMLApcszI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778048750; c=relaxed/simple;
	bh=UjBqsNiiU9KCI7HYTN7euFjJJz+PKYjeOpuER7dUuqI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VPPvk7qQ7l1+35FBVb7cDT3L0VcM0liplnis5dE0mk4Zw+dY7IIuVZeYdHsd1ZWEecsh64H9iWLOMjFwpY6mHM0tZ00EIf08Cz+JMrzK6hRUeQvAb6Gsah4LyXmw1nk3MgNooOPZ73AHHaU9rw9xBXv1P8tAVUiV60es53Uym/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q1lyhs34; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q1lyhs34"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ad21f437eeso4653205ad.0
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 23:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778048748; x=1778653548; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W7nDWMXGjrFtRUXalafYwWf9F5pGmxAL66BqMwA6cUc=;
        b=Q1lyhs34SsOiudlVFRV8ybHurXOiDHQwgtZIY/BRsTfOl870IjU+3TQ1MKprpEqUVb
         kPGokc371lVditO3beTZ/beNOxoO/AK2kS5O2rwEzBp58uAlTe9GKxm62cRtlqQZJxbC
         zT41/02crYVGwGLSzuknuZg7z93fpedcCXnAnB7t3Wf7nGN+kMh9tRUMLJ6o4xvvCE35
         xFKtGob5lVoZT9NKWdRPWzw2c003UDpwzvHLdzGpDofDNflwCiJbei4Sik+LFEi60USS
         vaZiO3Grgs4vdQzXpAre8YGkRhdBuVre198rdJ8XRFhkbmSrvFbCN3Se1j2iXiywE5Hu
         neVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778048748; x=1778653548;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W7nDWMXGjrFtRUXalafYwWf9F5pGmxAL66BqMwA6cUc=;
        b=Xh/8uZHEyGZ4GWmiUX+q7v0i7Dyga2bAGUgdeuOvS5jGFLR312gqrcQ4qNjxC156sW
         t+Dd80S5xo/q2svylrHS5eu9wh2SZVwVtGId5KRhGQPmZDX2WY7FKCQ/8QvLo7PmVxld
         OB7zQ5DATt9ZAhQJRUXF6Z8nLpRcUi1K3Iu5dyOTCvtHFikwks373CvLqyWdS0Kud+c4
         UmtADP9Z2AnZj+guNymo6QvlRHAxEk/o4AhfzMPsAVESk11Ih9H4D0dI/UMj5TikjF2a
         LXpuB6ZVLDql5TbwPw8GLarU5BDvqloHo/eRnacL0Qyk7evIsRMi8mLERM2FhI2ynP5/
         mhBw==
X-Forwarded-Encrypted: i=1; AFNElJ9Ax6xcPoLXbhHJCDYsrCLmOZB2LKaemtBJ9Gpcwx/ZR0hcEZphrCtrRiFCdhag7mLHslDXN4VzvlU2@vger.kernel.org
X-Gm-Message-State: AOJu0YwDM35iiHBNBuC7HvXUf37BhPav35kkU/n2CPFEAffkL5GR+zst
	SI5ETbG7gVBZQZl/pQ/RzfuDEM5ygXzPpZ5iV++b7qsvrCDowVD4WcOh
X-Gm-Gg: AeBDietnUjDjif33n6MOrRVkxEufjzpDEf7Y7w10LT3MLY2+6EFIJppw92i8r+OIDXi
	vE/DI7NMTVERRQXp/FOWApEBaY9b4uAgtCCSsFDqEAlnUZpbuDfic2y6/8e6xvN47n0RpEhiO/y
	mLvdhxNLJC5zvaFIsb/GTrvcg5w6+IW59jpNCxCaC5vv5qd1SG+H9YHc+psziijsKdEYBDTK83z
	DLj9uFhoE2S2PZutxXu+E/A/E0BFsSAzcQEw3rjM3+Qwg9PYN0W8LE1keVk7jPuYu6SLWF1oKyE
	+jG43gjh1F2Fzm9rgKk+VXDz9WcIQTaA7e3Jw46Xyb9nGcbHsqnSmD8iN+17hglh8+t4qQ1Qf2k
	NszdVsrY3AYcpBd/6ziENoc2bwiXuf1yaE39jxB8dloTBdHz8ALri18oRhYh/F5ITUtP7rxBy++
	GR/V3jTt71GQDPKFm4h/qQF5W0JD+2dpqpR0PokqX5X7srNOCR+T2Y8bwxViR9KcFXwDSTvX7Q2
	vngMS1V6KDIJp1LPUJ4cw==
X-Received: by 2002:a17:902:ea12:b0:2ba:6601:8e3d with SMTP id d9443c01a7336-2ba6601985emr33306655ad.9.1778048748474;
        Tue, 05 May 2026 23:25:48 -0700 (PDT)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ba7bd2ab2esm16330865ad.4.2026.05.05.23.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 23:25:47 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
Subject: [PATCH 0/2] Add support for PIXPAPER 4.26 monochrome e-ink panel
Date: Wed, 06 May 2026 14:25:36 +0800
Message-Id: <20260506-bar-v1-0-12195406f4ef@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAODe+mkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDUwNT3aTEIl1TI+M0o2TjNDNLY0sloMqCotS0zAqwKdGxtbUA6yhOo1U
 AAAA=
X-Change-ID: 20260505-bar-523f2c3f6939
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wig Cheng <onlywig@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, LiangCheng Wang <zaq14760@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778048746; l=1346;
 i=zaq14760@gmail.com; h=from:subject:message-id;
 bh=UjBqsNiiU9KCI7HYTN7euFjJJz+PKYjeOpuER7dUuqI=;
 b=4INSpmJ7FzhpAQwBk4GPstZZDtDnhd0yDSWfXPYdhLBJo9n1mxDzQpjOu97rFTpLPeUsFJ+s/
 n5yNe4ibHVBAjeVhs/oaJAsXjoX4FJyR8TGqG12JEwU/nASNPHzDri5
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

The driver has been tested on:
- Raspberry Pi 5
with Linux kernel 7.1.0-rc1.

Feedback is welcome.

Signed-off-by: LiangCheng Wang <zaq14760@gmail.com>
---
LiangCheng Wang (2):
      dt-bindings: display: mayqueen,pixpaper: add pixpaper-426m
      drm/tiny: add support for PIXPAPER 4.26 monochrome e-ink panel

 .../bindings/display/mayqueen,pixpaper.yaml        |  25 +-
 MAINTAINERS                                        |   3 +-
 drivers/gpu/drm/tiny/Kconfig                       |  15 +
 drivers/gpu/drm/tiny/Makefile                      |   1 +
 drivers/gpu/drm/tiny/pixpaper-426m.c               | 828 +++++++++++++++++++++
 5 files changed, 866 insertions(+), 6 deletions(-)
---
base-commit: a293ec25d59dd96309058c70df5a4dd0f889a1e4
change-id: 20260505-bar-523f2c3f6939

Best regards,
-- 
LiangCheng Wang <zaq14760@gmail.com>

