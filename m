Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14BC525A9E
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 09:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788859752; cv=none; b=rqtDyTcWw1RfN7fGh55nky2vyVm7lhEWeRev5uyvlr0gcMJodQQTd4krcyNcjSiLnMDBwhkIispatCT8MWh1NxSa0LhZa7d0qI5jiFHQBsWd3b6+7IqcXnOjZDQqbv/WTq3UVtLMHKaFjm7j9ZMOG+MWe6a94a1OyndpG1b4wBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788859752; c=relaxed/simple;
	bh=ozasnFIBA+8rSKDPSKbh/3Fbquovn2x4fV8LNqAL7Kg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ESWmkR7WsRjG5Qtu3KwmpAUOLfq5rEd/Qyd4BBpPJRX8n3IuXuJ0LH24dNsD134WAFulRBoL5q31pzfl2+3XbYsMat9WP+cbuazxRK3PkynM2nS5cnP9zhIrmQsjfdSzNAb+yxpRccZs28Dgg62hoIO4pYHk7HSLzbPoE6Ze5rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ETHw8fHW; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ETHw8fHW"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-39675172593so3470155a91.2
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 02:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788859750; x=1789464550; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0r+H74wyT2+5oikV/msCZxyt9ampGlRBgpuDqDj2ToI=;
        b=ETHw8fHWgAjjvCO8jook7piCgyHCDX3x5uvbucHtE2q7QUKxmSyqoXp04hlCPBcIpi
         ruLuBvkEUx6JOdKGxsq5ZFJweC3Lh7ZPPCuVbJ5BnCxsE6UIbS4t77U3G3Znx74LcdyX
         UAX+VkagQ/Zw4Scnb3Td+0jGp99M0MM7eNNgizZSd+1s1c+1lYDYahAtra9LC8bkCiL+
         lhS0R/oftrF0tL7IinZ0u7+mo27UmfGkoCk0kCrZk9/L2q4PGETcO/qRJCVYesjmpKQp
         9ikJO28ushdKF66PC4vb3D/Cdtn9HdXvZoLrFG672Zkt6+TUtcOU5x21If5YE2S9m4/R
         OeRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788859750; x=1789464550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0r+H74wyT2+5oikV/msCZxyt9ampGlRBgpuDqDj2ToI=;
        b=j9EAyKt5h80O1u4z+p6UPQcdN9UPLXfSOlAvw2F5ALzpXyoC5T6xnqQ8kO22krTMcm
         nIEh6x9ggO8BF6uf5ylPP/Lp04P06p2r5k7ncxMB6xljaLl9/KdqkE6Xl5jJZKV6nJU3
         mm4CyK1EDCEFKTW8dZZNAk9qesV3HXYnb/I/PtDLdMiuRUyR5vHpZzvzWEuGoB0IoIW+
         lY9+XUEilqKI5qXAy3DS5COrdyAwVwb2zySftN4T5Kp1ApeZQaSG9cyRoQxn3uASzs8/
         4hHx7f1sfuuWnfsQ+bjzrSqqFd5g7MQt19Z/62b+HbXY/bjDQYMJDIwB/sJgZ3jVtPG7
         cRXg==
X-Forwarded-Encrypted: i=1; AKwUvByK0wiWQnOWQDdx8U/ePcTnTFXeT7nOkXugQmqLJxniOtBUz35CbDhtvuuNpTV7lw7k5Y/zCY2BRYWG@vger.kernel.org
X-Gm-Message-State: AFuF++lhlcdWH7LxJWEeIE5jzXMXko3DeO2Jo28d14Pfid6BlbjsDs4f
	RJUXhzSlocSHX469BqFudQVRY6jfw46r0OtfHolYBM/erLKODPZJaalq
X-Gm-Gg: AYBFou0Vb1G2d5Qg8JhnZWGOkCmsKrxTLalBuPVy8dn9FcFCL+QF9pi0cNNb5FN3Krx
	db7vvn6qk8x52IUbVN3JsYNtOfzE8DcakOTLTyGLsflDo24K8uVd5jua4huzZXlFEucMpDdQaj4
	u5wcOYU5yMEmIRYPt7FC7/WrQJur17zdBLRLeHhdR9YmZ5kKYbCJ8I8f8zoGovfXtwP0Q63IqlZ
	YD5928J9/xhabezG3h2ak28ZXbciV5ieBWPPYLYmcufNowvPPWdfvNiMMGNdLhNkpeF1hDkL4l9
	cWxfXiNEqAxVww9scqE3zIeleLkBI/h8dJ9JEcrdQWqoI72LzRzz6RZ9g8YW7a6U1xTAYIsxLjq
	anYX4r2Mlr+Oz5Q53OJ1ShUKGHyZH/3rBQI2mF1y7ab0zvcd0dk4ax9VaT7K6wqopFtsJcB2GhO
	OFzwnmmuGngBLST9KDdZaMLQIFyI+h9mQlLEtSUvi/BgL9MytruCF+DH0+sZsQ71b/eN3N8UvO+
	5s3enYridoPB54pWzadzSGsVZQtNDSDy3WX1RnRT6tx/T/TYm/Y
X-Received: by 2002:a17:90a:d644:b0:398:9c00:29ec with SMTP id 98e67ed59e1d1-39b26245cfcmr43975973a91.20.1788859750448;
        Tue, 08 Sep 2026 02:29:10 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08c39227sm32109846a91.9.2026.09.08.02.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:29:09 -0700 (PDT)
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
Subject: [PATCH v6 6/6] drm/verisilicon: extend Kconfig to support ARCH_MA35 platforms
Date: Tue,  8 Sep 2026 17:28:40 +0800
Message-ID: <20260908092840.225220-7-a0987203069@gmail.com>
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

Add ARCH_MA35 to the platform dependencies to allow the driver to be
built for Nuvoton MA35D1.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
Reviewed-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
 drivers/gpu/drm/verisilicon/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/verisilicon/Kconfig b/drivers/gpu/drm/verisilicon/Kconfig
index 7cce86ec8603c..295d246eb4b40 100644
--- a/drivers/gpu/drm/verisilicon/Kconfig
+++ b/drivers/gpu/drm/verisilicon/Kconfig
@@ -2,7 +2,7 @@
 config DRM_VERISILICON_DC
 	tristate "DRM Support for Verisilicon DC-series display controllers"
 	depends on DRM && COMMON_CLK
-	depends on RISCV || COMPILE_TEST
+	depends on RISCV || ARCH_MA35 || COMPILE_TEST
 	select DRM_BRIDGE_CONNECTOR
 	select DRM_CLIENT_SELECTION
 	select DRM_DISPLAY_HELPER
-- 
2.43.0

