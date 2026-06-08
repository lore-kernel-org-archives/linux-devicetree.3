Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68182313E00
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 02:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780885972; cv=none; b=IYK3tjQ238R9/b6roOU5wki4yvOyRIy6bZLZrMVY1rBujXUtYxl4IORMR5QVQmW11GiwITW+ArLTsVZ6GmUwfQyMf/mFZw+O1nV9QqCgmjY+WCS5kReBhqXtGO8S8W4RrK/ZCIoJwhP+os3dAeAR8umJH6mxdhLx99uqW2fB1go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780885972; c=relaxed/simple;
	bh=4EbfEqKPkpxq1DREInvkthLhyDGUtt3IiuKNCpx40yY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fOLg/Yx1tU6RD0yQWtUxE9Oxr0dP7U/0xE62gYeHI847RioUegehZmfyM8cIjdMkhDrf+D6TySbgoFhPNokk4VuyRA5ZWqJXcSkJG7eb0/OydOmjB7fZorce+0mamuup/c2Ti+/VQuSjcKE4a8usRcdxvvN/jIVmwwZF3BfQGpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LmsOGt8j; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LmsOGt8j"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2c0c2c7e0c5so25304675ad.1
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 19:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780885971; x=1781490771; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p0zPEFGhfG3QKVaGDZG1h1mxGzWJiUcHgpOMB7FKbFE=;
        b=LmsOGt8j2xrplMTrcnG2VLHS7M4HQvqv+CYKSm/0JME6wSjU5LFfta1F/HTDTy98Mt
         sW8VL6YaJYGg6ZD1pG21PQ5EO1iQpawpBV4BOZFOk5y4oSLSi9Ladwui8fxlyW/PNbBU
         ZcWqp0D+djx432KuGY9ULiKw2sj8cBw007Sd+u9+WbiPT/d+XBGYTom38Fho7GTEksPQ
         uHnBUj5zk7yEsn3EYHplkJQtN0cWH3Nn3xLJ60HDV5mNiotcbp96CYq6ll1Iuu3FVfD4
         Tvp3g6emb7e2YaujkVQ9JNVxUBkbSrWK7/glm9slMh+Ossv1CnjyS/F/SsGvXG46OtiV
         xXNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780885971; x=1781490771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p0zPEFGhfG3QKVaGDZG1h1mxGzWJiUcHgpOMB7FKbFE=;
        b=SpwEzNNpCvN1kQilHVBsrqYc+QyeHz6y2HAeKHSGIvRO6KW3vpXTfAZyn2crHQ+6DG
         bspUDJxx3gjj+LyoHuW9XPXpaqq8XCNjcd+Qe9z5MoOp/iizUrm+s5PMnoz4qZbWx9vx
         XKViZh+rQcR/wWaQdHsuN3f00vFMfl6N7u+mgxXbzH3hxSF27jNygBP4oF5gtYv0yZEf
         dyocBpzBuIRuX6e63AmZa57JeES0ytCl8vvqV8tHmUkgzoh7AQdU+Z4lqpekVj9Rir7e
         AyO1B5sJn24L+1eHRnT172FpKAikRpyDC2AmAasFqzMysS3ObedYpWcRZGu1ftwtV7Gt
         /GCw==
X-Forwarded-Encrypted: i=1; AFNElJ952Hd9ZN0bzfrAJunX2q+iW0AquxtaWOff0bfC7LCdiKghw7eIWleNXvXSMXv0j1ffAfOgnARbCEBP@vger.kernel.org
X-Gm-Message-State: AOJu0YwlKD0MZO3yneuaV8uOqv1NOpG60QwtHHKBiDFWTqNhrao2rQEJ
	qJRP32d3lEXomh4S8YUVy9amnWaxw5SMuj0Mutt8gaHI99N9vsOQpeZq
X-Gm-Gg: Acq92OF5jzZwBeG8fENknerJvZ3GVnTgNR/J5DJAi5UZfgDriDPeK6ZqXtLl5FnRnjt
	HpdjU3ZpRIO/642omm69lYftGssMtin7udv02Xcqj72Xk9yt/3Td0G0I+hEtqDePspPCgjwW/+/
	LiiwBBEMzEacXkTbXFQGtsaHNumxQ0k9cTEyz7K/4VIqZCVmBnaGA0z75H3Y+ygEyfwqGbVWquT
	LS2cr9AP/4BBm8kmN6X0jEu0gFKkNchDa/sS/Id1O3qzh1yRip92DMKcG8O8Xsdpv7H/7WRT9la
	nxO1bw7CrCdCAUNyQFHvUEaWFg6dkgxiOS/n6oNjjwI8SwBOtm9f1/xAIiup/TwBOs2o1rMFlFL
	nNi12T8nFqZtAMlDiVR8B65BrBbmmwatTesyKN9NxIjFdqJqRtZFZXW5f/N1KSuGDEsWVKLHKkA
	ieS001EYe3fG5gLPefsTzUQkLwmnpcY/JdknclhQWgr1cmre3jgInDRtZFeCkdqsn5chmt3J//3
	NOJg/jgePY6A3LLTTwxeCs=
X-Received: by 2002:a17:902:f606:b0:2c0:ccdb:e02c with SMTP id d9443c01a7336-2c1e7b3fcdbmr158771995ad.7.1780885970776;
        Sun, 07 Jun 2026 19:32:50 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c245dd3b5dsm38143485ad.81.2026.06.07.19.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 19:32:50 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: zhengxingda@iscas.ac.cn,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH v3 2/5] drm/verisilicon: add register-level macros for DCU Lite
Date: Mon,  8 Jun 2026 10:32:34 +0800
Message-ID: <20260608023237.305036-3-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260608023237.305036-1-a0987203069@gmail.com>
References: <20260608023237.305036-1-a0987203069@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add register-level constants needed by the forthcoming DCUltraLite
hardware ops:

  VSDC_DISP_IRQ_VSYNC(n) in vs_crtc_regs.h: bit mask for per-output
  VSYNC interrupt bits in DISP_IRQ_STA (0x147C) / DISP_IRQ_EN (0x1480),
  which are the IRQ registers used by DCUltraLite in place of the DC8200
  TOP_IRQ_ACK / TOP_IRQ_EN registers.

  VSDC_FB_CONFIG_ENABLE (bit 0), VSDC_FB_CONFIG_VALID (bit 3) and
  VSDC_FB_CONFIG_RESET (bit 4) in vs_primary_plane_regs.h: control bits
  in the FB_CONFIG register used by DCUltraLite for framebuffer enable
  and per-frame commit handshake.

No behaviour change for existing DC8200 platforms.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 drivers/gpu/drm/verisilicon/vs_crtc_regs.h          | 1 +
 drivers/gpu/drm/verisilicon/vs_primary_plane_regs.h | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/verisilicon/vs_crtc_regs.h b/drivers/gpu/drm/verisilicon/vs_crtc_regs.h
index c7930e817635..d4da22b08cd5 100644
--- a/drivers/gpu/drm/verisilicon/vs_crtc_regs.h
+++ b/drivers/gpu/drm/verisilicon/vs_crtc_regs.h
@@ -54,6 +54,7 @@
 #define VSDC_DISP_GAMMA_DATA(n)			(0x1460 + 0x4 * (n))
 
 #define VSDC_DISP_IRQ_STA			0x147C
+#define VSDC_DISP_IRQ_VSYNC(n)			BIT(n)
 
 #define VSDC_DISP_IRQ_EN			0x1480
 
diff --git a/drivers/gpu/drm/verisilicon/vs_primary_plane_regs.h b/drivers/gpu/drm/verisilicon/vs_primary_plane_regs.h
index cbb125c46b39..67d4b00f294e 100644
--- a/drivers/gpu/drm/verisilicon/vs_primary_plane_regs.h
+++ b/drivers/gpu/drm/verisilicon/vs_primary_plane_regs.h
@@ -16,6 +16,9 @@
 #define VSDC_FB_STRIDE(n)			(0x1408 + 0x4 * (n))
 
 #define VSDC_FB_CONFIG(n)			(0x1518 + 0x4 * (n))
+#define VSDC_FB_CONFIG_ENABLE			BIT(0)
+#define VSDC_FB_CONFIG_VALID			BIT(3)
+#define VSDC_FB_CONFIG_RESET			BIT(4)
 #define VSDC_FB_CONFIG_CLEAR_EN			BIT(8)
 #define VSDC_FB_CONFIG_ROT_MASK			GENMASK(13, 11)
 #define VSDC_FB_CONFIG_ROT(v)			((v) << 11)
-- 
2.43.0

