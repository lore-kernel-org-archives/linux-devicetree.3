Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D523DA7E2
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 03:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789700508; cv=none; b=BAXTNC9AjAKo0xk5Vc7YPMopJklAH/N1/EmldaelJ3Kbj7fanwmvcIG5cnZzP6XXvDmejRGQS3IlcjpTbiLV2wjJ7KzvEXBHz/uDlyB8qPRlWQ9sGvd+K4eXPseQJnryT1NqMC02on+37Ayer6TgSNNVJ0YiakGRSARCfEGaYzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789700508; c=relaxed/simple;
	bh=tt2RAWD+bHSPy7yGLlzDmpcso5w9hUHauQQE1wwIZqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D/CzzZv+SyRkqdLzEoNMLESJPkE2lQwqtXQm3u9e5Z9Dpv0aTAPjdRLZcOWtdQ8u8vOhT7MRlDCyjxyORk8ROLrq8DrF+fGy+lkJ3QdZSQ2HJZL5Dvzb2h7QF5anZ2g2WkDJZj+3SSDCL3j+GsubRkgaMYhKblffjTw9PZ6DZas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RW2i19bb; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RW2i19bb"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc433d52421so92786a12.3
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 20:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789700501; x=1790305301; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d1MvCbfjotTiPMU9xzuQx8OmetQMTdloo3vQR2iBJfs=;
        b=RW2i19bbc3XA3SyMJNQ2sF6TOlcsS81n22E0HIixpBmbrMYqb9YGSUwcberJjDW43d
         IIj20C19M9GYzr5Rn8p6e/cgjZHHfBTW+H7jO9KPwFeK9wG1LeiSUzDaXnyKyiIFflDf
         eCPA2kCpLB/H3+Ip0rYlyub8nxNgOqwM5uhF/0XjTYJ77T+xRpY3XyzEfreQFevc3AaH
         90o2L5+609wdXfIJa+50Fun6Xg6pm2G/EoyfDOytNA9XNfjFJbtc/n7a5yBjsN+tliiC
         pvgK30lpl35Lypkzn/CAsNWr1AeMAzFekPrRmTL+Vmc010+61mvIMlCskyfetrjTfLnk
         jlpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789700501; x=1790305301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d1MvCbfjotTiPMU9xzuQx8OmetQMTdloo3vQR2iBJfs=;
        b=rWdPrbWfB+NO22EwJgktephsaxEmWOd93rJyTwsV+H8TsEVEp7wSZDrvyo07WsbnXq
         RN6OfH8QlIVEyHselV9Xl0GkTmaSeWps+wYIfm3D2i7aZGNE8L8nB+N7rETPHz+WrlO+
         TPv+xJT3ParwsABvmUaFqWkBpuicchIDFgcgfRFaOmtavPOytec47Yoz11Y3LQpIYUfJ
         Mxt44SC9s7MA6nxfWdJU43f9qG21kVWc0O/nzyS02GmLyTasWFleRhn+Pt5zxI+pw5CZ
         JiSJA+EhG9LAuQqJJq/njZ7YObD8Daz8xy0s9Be1zye3c50z+58+HwmDkvNBRDa3xhUx
         29YA==
X-Forwarded-Encrypted: i=1; AKwUvBxF+93WaoUOGVtyVFUA7ukpGtn9qj6hOjNgSASTr37kPpJ47If++RPP2mKRH7PFvaeu9yUeyAdn1xa2@vger.kernel.org
X-Gm-Message-State: AFuF++k0gFeds/rx10BRhs3IoOHGI1egtkJeOOmTu9u1AGM1owlZrxT3
	2rG0AUhJT5GOq3NBsggemz79sZN2+3XpC2CbU3UQUUj1NDvTlXkHOfdb
X-Gm-Gg: AYBFou3UarQ7WKEebc++76zWI/QoHuWXyWAbnar2DNbopJvptNesYGCitkwoaBL0qXN
	+1QpM8gEV96O8+GmXuR4LoVmFoTQH3EVVtvWFlg5S7qfciQeTEGOL2FAahnzBYstAugNf3WDgot
	f0MPW2azeJf3JyLk53h4K6zeMIaU5tyCR4VAx0hwZpSHuL0s+nMsBi+shMaUBBC3nRj16EanvCp
	k4QMK+NU11GZzsgBX5mdhnBR0rHW9PnfOOq7RBGWks4Ra1Vy8Ua+mA9rPZqONenR9U26FEOOLi8
	BTWsrDQswCC59v4CPVVRGDm7304M1Fo/dze/huAv9osaducWjKWl4AWIPLtvaGQ8UcwFtpKlqpK
	e+iseZ/YFg3c3L6KtYN2TEDMzi9SHYW9NCfKsjMZoXxC83UdDitzyMUp8z0tkp6nJSn+8oGzYjQ
	5ui6Hin895rlBDhbA1ovxhaQIiK53ruezYZSoF6C2GjW4pLFjDYk66pQ4jLP72Sc5UI7yOIXoH+
	PJQsGMAMvWNckoxog1JQJyuImz954fUdnRZiehz4AM+U3C+mAfjskdN5atypWM=
X-Received: by 2002:a17:90b:17c1:b0:398:e86b:ce14 with SMTP id 98e67ed59e1d1-39e54e3f526mr2301890a91.20.1789700501279;
        Thu, 17 Sep 2026 20:01:41 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e362e9402sm7969141a91.15.2026.09.17.20.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 20:01:40 -0700 (PDT)
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
Subject: [PATCH v7 2/7] drm/verisilicon: add register-level macros for DC8000
Date: Fri, 18 Sep 2026 11:01:20 +0800
Message-ID: <20260918030125.315978-3-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918030125.315978-1-a0987203069@gmail.com>
References: <20260918030125.315978-1-a0987203069@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add register-level constants needed by the forthcoming DC8000 (DCUltraLite)
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
Reviewed-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
 drivers/gpu/drm/verisilicon/vs_crtc_regs.h          | 1 +
 drivers/gpu/drm/verisilicon/vs_primary_plane_regs.h | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/verisilicon/vs_crtc_regs.h b/drivers/gpu/drm/verisilicon/vs_crtc_regs.h
index c7930e817635c..d4da22b08cd5c 100644
--- a/drivers/gpu/drm/verisilicon/vs_crtc_regs.h
+++ b/drivers/gpu/drm/verisilicon/vs_crtc_regs.h
@@ -54,6 +54,7 @@
 #define VSDC_DISP_GAMMA_DATA(n)			(0x1460 + 0x4 * (n))
 
 #define VSDC_DISP_IRQ_STA			0x147C
+#define VSDC_DISP_IRQ_VSYNC(n)			BIT(n)
 
 #define VSDC_DISP_IRQ_EN			0x1480
 
diff --git a/drivers/gpu/drm/verisilicon/vs_primary_plane_regs.h b/drivers/gpu/drm/verisilicon/vs_primary_plane_regs.h
index cbb125c46b390..67d4b00f294e2 100644
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

