Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354F84ACC91
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 16:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788367416; cv=none; b=dmU7Mr7/r4VPvxu0XVLbHQ5SflmdtVRniV+BJV7NqTG/G8hveAGi4Y0rbnMHzXImSlLvsBDAkv2PQM6levqxOfRIe+sHworY12abTK/lf5tpnTEEROGt4GRkBKwAlH93Qxe9TJu1ihwtKeU1oNJt34Oo8SIoAefjViQwOhYhWwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788367416; c=relaxed/simple;
	bh=cpj++n5yEucYh17JiW67YDU5AHfejmNI3LdbjDaqbos=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nqa171FZdL6rXJiS8ntSwi/GaBlKGZTz7oqi00BxUr6kRb1gOB9vbBJQeJtCNCkjvOgFOd+YPAhlmI5Hr0ZqNK2S0csNflyVYxyOlwgPXXnLzrpcGhrZ7qj7ZKpOqZV9ZicyZAtwkXSb9o6p9pMlikcNDJX0SbNWLKtmc40Std8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YQ00IuPF; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YQ00IuPF"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49cca4ffdcfso9155045e9.0
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 09:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788367411; x=1788972211; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iIzXwSsGWdM/2DswVIkQqllThw6W06XdbG4kX5z46ho=;
        b=YQ00IuPFcBen5Z5awhKbR6ipx9Rvgi4J+gzUsIiV69iFMiSKy/ee8JqsIK3sZd0i2D
         YCrkDfIgRMQ2uvA2ff63kcnD6jhFezOp3JQwrdQEJXTonFoGdf4r4ECsp4OtWe189V4G
         hlIWrc4lmBO/F2O6XETQ5yJmuiykfTIxsvHkgXcr4u4buA58o8QtwZlIDQp8WGSloig/
         Am13K+//zTRZG3oW8hFmgQOErDJaqBtwycM/ohWr/YFfWLPOZVDABh+yfvGi7HMvkNa3
         wNDl/Cco2rvOD4smzwMzheWp5MBW3UtpaasuI+lowjBGJPuRojOENGNfdj42AukmITi1
         OwwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788367411; x=1788972211;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iIzXwSsGWdM/2DswVIkQqllThw6W06XdbG4kX5z46ho=;
        b=fn7Mn6oYVFQ590fIGfDqaIbPFVrS3YCWnLMuDIPB5aA2SjpheSe99UgcXucLJ/H8zE
         blYkAb/wQ7H6jH5McN8xZXXtphw8Fhy924Fy8WOrqjlgw3KvKAziqLhK8Vn5WYrG6xtX
         b9fTc7L1iZLXIbK9ZIiqri9OoHs0Tu4hApGp8YDXsRWoXm2SkT8ApZXSd0U1IBWeobBl
         QE0PWlULO+F/yREzURHdLZscrE//9MgXSupwdbK5ighT5sUjJftIFgJZ6msyLZv6Z434
         Qlx1c9dJ2OWFgfgzfBD0dyOINMr5uNtV5220ZvQxpU1b8+Av2XXQ/3dTjo7Z6SVfTzfG
         7hLA==
X-Forwarded-Encrypted: i=1; AHgh+RqjhAksNz7/7e1tq29Udndq5dLbuvHm8+vP60fyAVarmlMESwzC4CmjV9NOYuyRxalxn5tVsbtcWnOj@vger.kernel.org
X-Gm-Message-State: AFuF++n7lUJc0TpQksEB4grQraPmzFwsmvQ3lhhpXk5a1loiFWvmg7i6
	gePFebzqYRrhdi2rszU77yYk9N+881jDG8JiJCgmmr5Edpir7H1zZrjG
X-Gm-Gg: AR+sD12jWXl/fk61E9XJd31W0GR8xuyqy+XQIIxMt7b9oyUhqtfCZu606MEwOPVjAnl
	goAySeLm7GpEPpcKlOn1ie8gasCqV/sC6E+W0ExW62UFyuZqkuLAHEpsVONLLmM0t42BjCq1RF7
	mT/igUTYPKtN8V+snvZ8VJQJ4g22GM+MOBuPqE/AnlSvxE/NyZ2iq0BJ61/omM/xegnSNokZ9Yc
	wfmy2Oznm1ZYllMW3GMtYinbKvhrfVAZr6kuSCiAsHTdrKSlWY67cODd+ZpCwCxgX6GzMtXkr5C
	NweWt3CqNAqFLrpC6+0QECjaN57VtQMj3+I4JKbjJq7WwVT+B6w5KpGcrxma4E+mXg44X7gTwRu
	H2PdMfToATZqQ5RqpiuAkkObTssDN7r2FtuT0PQHgwbq6TYpBEFswVa3vt9I/F9YP1HSGzOsa70
	7yGnfgjgUW1JpGnI9qS0yka+FJtVcFb9MJ54kK9R0DnoGa7mfOym1PonY4moJKjIR04whTHyHDi
	aFTecLqQl+zIwOzq5e6o+5SPFJkcr+xKws8QQ==
X-Received: by 2002:a05:600c:c16d:b0:499:db6d:bc97 with SMTP id 5b1f17b1804b1-49ce55cb47cmr139584865e9.0.1788367410945;
        Wed, 02 Sep 2026 09:43:30 -0700 (PDT)
Received: from GLaDOS.station ([187.13.216.247])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5dead1sm3844745e9.11.2026.09.02.09.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 09:43:30 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Luan Rafael Carneiro <luan.r@variscite.com>
Subject: [PATCH v1 1/1] arm64: dts: imx8mp-var-dart-sonata: Fix Sonata SD I/O supply
Date: Wed,  2 Sep 2026 18:43:17 +0200
Message-ID: <20260902164317.45925-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

LDO5 powers the USDHC2 I/O rail on DART-MX8M-PLUS.
Without a regulator consumer, the kernel disables LDO5 during late init,
which removes the SD card and causes filesystem I/O errors.

Reference LDO5 as the Sonata USDHC2 VQMMC supply, so the regulator
remains enabled while the SD interface is active.

Co-developed-by: Luan Rafael Carneiro <luan.r@variscite.com>
Signed-off-by: Luan Rafael Carneiro <luan.r@variscite.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-var-dart-sonata.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-dart-sonata.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-dart-sonata.dts
index 983d67a0c1de..7f78026e70ff 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-dart-sonata.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-dart-sonata.dts
@@ -511,6 +511,7 @@ &usdhc2 {
 	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
 	cd-gpios = <&gpio2 12 GPIO_ACTIVE_LOW>;
 	vmmc-supply = <&reg_usdhc2_vmmc>;
+	vqmmc-supply = <&ldo5>;
 	bus-width = <4>;
 	status = "okay";
 };
-- 
2.47.3

