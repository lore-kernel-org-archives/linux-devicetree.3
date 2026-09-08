Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D5951E429
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 09:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788859737; cv=none; b=lxyP/RkTQJIJywFDIOjg9xndCkE8L/KNWQHz6Zh2Gm6i8rk9aHjPDFq7l4By58z2yduSHhkKy0s+SmSv4rhTb6+tr1tNLtAjESQZDSnFdjmXkhX72UmDyTMdji6ExMetmpfN5EKOBhbwtYEJKhPrwDfp2EULpBTVZCwkhnBl8Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788859737; c=relaxed/simple;
	bh=tt2RAWD+bHSPy7yGLlzDmpcso5w9hUHauQQE1wwIZqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nrxImABZjjCEzfq4ZSKqBubuMQPQ1nI3Q4cKTYFChpGdQv37J1Zpf0fP6rRgps9YNXECRKvTi7bukeNRJsyaozB87a1baLZn9jjTDXEWRDLbE1YHe5XlbkisQlfbgwLhOn7aOIEXN2ChtTVnbcmP6pYvREsI8zPae5a0XpIGGlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WK/xO0MK; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WK/xO0MK"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc48fe04342so793907a12.0
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 02:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788859735; x=1789464535; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d1MvCbfjotTiPMU9xzuQx8OmetQMTdloo3vQR2iBJfs=;
        b=WK/xO0MKeMAJgw/ZD7+DzFmmU+Xo5cxEa7ScCAF/Ff8a0yiG6Ms0Q4GtLeWrnnmhCi
         6miYzQda1ChoMlR0Xqd45xBOr7AeuBSUutuvhG07yqfFyGAvzErXfodwc983O5K7Khd9
         ZVMrN2M+qTj1hItHCYrCosLn5xRZ9w1wUN4sOc7Ay1MtoJ7D2WLIr8mmiBbqdw8g3UIj
         3r22D1tjsx8crfitD7WqTh9XFZtb04poq04KBBA6YudSN2DgYJHhR2juuGDREZ/y/5GS
         0eb/Zqfof0uOpmgecJ+aqDvjs79DkSKpNEBOPVjvN0k05q3lN/oZp8rycvEQpxDSLUMZ
         GSGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788859735; x=1789464535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d1MvCbfjotTiPMU9xzuQx8OmetQMTdloo3vQR2iBJfs=;
        b=gEsIhRyJQbr6DjuV2w2kj5SGMuXK5sl/c4sAa+6u7VlBHvkXeQ/pLzNomQjK0kOEZh
         wBkAYWAl+NAa+featn5D4g7pojW19ZRUs90GFFm1QWDSaQ+nxBgJoqk55h3OR0dmnmOS
         vT2cH1NsC/8ssluDpWr89vYjI7iz7lX/13DJbHNNPq2sGnyw94DS4OvgOGnDl4nsgrpK
         QCseQviCPGLEslcqGBm0dJ6VaCNPt65Ix/1sALWo/rGRwdckXd3qYxT1igkVGRGFj9jl
         BSQQPmoXfvUXO6iDYvcpnnFGcsyXb+94G2Hl2vkKpA86+kyEl9SFlgsVDiNnyOsQPmm5
         G24g==
X-Forwarded-Encrypted: i=1; AKwUvBzozMu1392HQaG0Zbu0FEJikQ6cIXbjYMjMOfoGvB9wedyhLtzV4TeQVM78wIBZPa65hUoo1e8YwuT2@vger.kernel.org
X-Gm-Message-State: AFuF++lC0C5jnnGkTd+/OKhIhlciU+PNFvxfzWOku79ITq0KGPC4L/IU
	golciBfnDMjsLnqRcvU80rY/jh6PUmnAXrCt3VcJMsXsK3/q0EeT/5MC
X-Gm-Gg: AYBFou343wusdQAOxavHh8qQsNAdM1dwehu8GfzZnMuRfo5AQRrogOAtKpHy31ihidf
	/n0JJUe9zqsvMJ4syDOH6j41cjwIxxXHWGhtFE6qN0GIz7djjnXqmOELELfIkbUamHTt+LsQann
	TGp6uMZWB+ui+2WSEIhRu58FjC+gp0qsjj031QbVv/H/XvXuHQodgnVed20V2DGc30CCN6DDE7p
	IYp0g7nkdmlNjSg2GPXQaiLNnuJ69MvjR3mQUSKVeb63lyIe96HTVSq/iztkFg50EgkiZP+3mfb
	Yxq3BybbCaO2uZYLnOza9I0u2ftALV+w5HZzhkKR8mIV2NjLK24qLtwHShWh4Lkzjr0ie1pJBQU
	zN1d4KLoCnUSeXoTGVDBpK4xbal9Bm5DNFUrpRcDlTe8ZGu5nsCo2Nhn+RqSS42hTvQ+2jP+Bx5
	2GYE2DgjtjOISB3jFt96G0+eSU3zRq2NFoyDJKvVLvYlny+10nCzXrXeOA8jAhpzqoMT/uH3NeL
	gOalZ0Cc1rkw+AkX4/18t/lENMVBtl8inxp/P6VJbOJySShDDVoyhNHyg6vmDfh
X-Received: by 2002:a17:90b:4c52:b0:396:d27b:89b9 with SMTP id 98e67ed59e1d1-39b2612ccddmr41681971a91.10.1788859735196;
        Tue, 08 Sep 2026 02:28:55 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08c39227sm32109846a91.9.2026.09.08.02.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:28:54 -0700 (PDT)
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
Subject: [PATCH v6 2/6] drm/verisilicon: add register-level macros for DC8000
Date: Tue,  8 Sep 2026 17:28:36 +0800
Message-ID: <20260908092840.225220-3-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260908092840.225220-1-a0987203069@gmail.com>
References: <20260908092840.225220-1-a0987203069@gmail.com>
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

