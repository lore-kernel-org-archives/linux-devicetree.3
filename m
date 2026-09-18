Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978FB3DA5A3
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 03:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789700520; cv=none; b=t825R5dJ9NXGdwFrZ4xCyGXUyRN1+4ipS5ROA5JUi3zs6jQBzjHTcKilYmRi2PP1/As7VPIb69o3jV4sOIhvm30nqDCVGH/sHkNMFNh7CAhKMPxkPNI7GVHONPBdA1AUnKhq5kmA/qRe8Mx2g0l6rupDVNd8cuK9qCOXMaYGtMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789700520; c=relaxed/simple;
	bh=ozasnFIBA+8rSKDPSKbh/3Fbquovn2x4fV8LNqAL7Kg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DigE3T+Tupa8Eb73nfcAZqFwZlK9aqjZuFtGU/jpaXeh7OI0I5Nj/FsffjRxsNLTgooiFmoiI2ttjZ1Cx4/fKbZAUreltN/jXW57Ht47Au/lDjp+AsTggmz9toy4H0W6PS57OHwULXoE/TaxebXW30MaR/pRYdDs7wRdU1RVZhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I+PQoGRV; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I+PQoGRV"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-396ccb65437so215669a91.3
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 20:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789700515; x=1790305315; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0r+H74wyT2+5oikV/msCZxyt9ampGlRBgpuDqDj2ToI=;
        b=I+PQoGRV1Br3ZLg8K13kEe7VKD07jxw1ByTISEUsh82Mrqyx7hJx21kFQpl91BRPPv
         0OZIoI9Tn1Do1DSM2uKGzgcHrTBF2UWIKZs6n8GsDK+gpeaaOj7anQ4jNX7ks4T7vDNN
         Re7fv0YP1yZczHs2WEKjSX8+5R1UFWu2NMnS+P/thhwE98/yFivCglW5Cm9vCoclK/z/
         etedSCC4/Qjwovlf17SwFRf8kLqkk4BNG+rX1f3UaGWjd9AiVzw79YKgqzwZhOcVJGpG
         HO9k6oXUq7xlXrESlY7tBkxI7HN4Aml0By9zGdjt0WPser8kqPhOix54oueJ0NcKCDzr
         tyOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789700515; x=1790305315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0r+H74wyT2+5oikV/msCZxyt9ampGlRBgpuDqDj2ToI=;
        b=BpAIrnaDZkE3+befE8/bUxiSG5lFqnfKfqFMtYQ9lemQ2XFaSeMpxyKuDVJBgxnTDl
         VuP9diGfHqRu+Au9JlHZ7MOO1ZVyczp7+j5H3biLExafiFbysjG2/cq0NcMfOfTGczFS
         hR3XlcvcRzaWP2yJv02iIbeG6OJpXl25dIyv/dGQaMrpothLpVUue8paHGjkfJKRSwZ5
         U05JFocUP8fy45ZVYf/WkgdlkNqSzcfPylra9qzJQlN/nf/gR7qIqLrS8Vphk05Vcb2d
         Uc29jiEIcUz5cLrveAqsHa11cmmJ7HsO8Zz4TBCL79BTxpOxreJwnNUjydBHyGpBetsn
         ZFYQ==
X-Forwarded-Encrypted: i=1; AKwUvBxlcQF/Yat5FUW3wz+Hro5ppYCiDan9Y7WHE41AzBAO2k8GOxVuLr61iq+lhD33QPGqbllEfmzFleTM@vger.kernel.org
X-Gm-Message-State: AFuF++lgLHdUqc0MjY4kaVVisxM57533tgdw/N6diYH6XEHsIiSdwziV
	vaIJVOu7zjGFa89YXNy+XJ+t69JMGjOXKfyyGNj9ViMM64Zk91sDNtEx
X-Gm-Gg: AYBFou3/hhHyPt+9gO5XcEVVKXI4+dmm2RPpKc+dXifoPF8+evhn1SMBscAM2yGSv/I
	Ay3nDQ5HT50cJG3mO1Dj6HHM5QgkUjjwzuW0WhmmwhM4IO1/745FgNiNOT2oETZ3HFzkvLbWClo
	/T9fsagBAory+wYpzSkMr+S9aV+kk5E+XWmdXvCwb4KXFdGZE+O1lCANDY3pC9fR1KptzA3cnQ6
	fpLiSqCOFM4Mu//cinor9f312Hrn5FBVBka5XtGnYLaa5waIlEqTXSjI8dCR4edaV/E7ms6J3ZU
	pQPD2QhIzz7t74uu8ssYVrUtCii9xrXhbwvdyANunUNVD/gF7/rSRGe0mtmG5wlAfnRKutqRL2U
	ePkBPw4rFWC6+SfrskKsZW3K/76pzcDyr3+Pdo5IwxOj+KQBHObn9j6TKFud9+ns4+WNn4aK2DQ
	jeb5CONdAcPkSEE8iW83awtXxFTAgqUunDDReZZLSqJrrMOYavkW134HCw3dNiZWxqw6O35vgyB
	vN/sOcV6NhblwxUeS4PsOxrPGY3cxgOOMWee7ACGP7/F+1l1EsGjFkcWvzMuDI=
X-Received: by 2002:a17:90b:4b87:b0:39e:345b:3323 with SMTP id 98e67ed59e1d1-39e54fb121dmr2271373a91.22.1789700514999;
        Thu, 17 Sep 2026 20:01:54 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e362e9402sm7969141a91.15.2026.09.17.20.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 20:01:54 -0700 (PDT)
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
Subject: [PATCH v7 6/7] drm/verisilicon: extend Kconfig to support ARCH_MA35 platforms
Date: Fri, 18 Sep 2026 11:01:24 +0800
Message-ID: <20260918030125.315978-7-a0987203069@gmail.com>
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

