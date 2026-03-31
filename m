Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB16A3ED13D
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 09:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774948893; cv=none; b=QvIJhRUDPvKbTHECxSLe9OOLTaGl2MRiyWcbm2j1mCePn29GJX23n8Z8nMjg8d5192GWuygKOGHK8Ty8eRM23AELU498yM0+Ar7tjy9FB28OsYsa7cM1AlKIYNbNjUoh6OB/F0RJJaaPMfDLxD5t3si9XI988Rtk5Wpgabw9V2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774948893; c=relaxed/simple;
	bh=v3wmLYmQg77QEc7sqHGbVbnyNA/JY333o7aiBU0y/XU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bhT+83zWJCRtx22Cz8INcWCM0hQR/Jn8Z1MJUIoy28dMoo0KPF5LupwwqxRIhhOSbUEcA1+4gvcr7J8p0pEwqH4oUZKqaiNyhiYa8Yqc6niNI+d59n3aNljtc8COn32i0Q9MXRcnBq1PjCg/OBeuCv4uCqPPycyE/YR+Zo64eJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cru44ih1; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cru44ih1"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-486507134e4so62769055e9.0
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 02:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774948889; x=1775553689; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cE0PWmhtnEqQSnWYYYOuzSEl1gB3SuYtUjjS/Ucvahw=;
        b=cru44ih1svYdNpLLHW8g6uBZQlSa1Ww8HxHviLJQ2IlI1oioyKh8jL425fev5Jwypv
         66p1ICo10Jl+MT/rcSlai7pHwNiobr5iiF2LKOXvt1ztIkx0W0ICEs+Er2EUgnDZGXO0
         nBSuafZ+q06ATI4zdxiWodYSMdLAg60kE6yccpwxSWPS8cAlzq9CE3ndJBFy8pfHLBmN
         AxdVwdlbW6wUwWsvtpH6RvTGPFQUaVTO5Owj4DaxE9LDBxLjat138QEJRG3KxccaIRdc
         0M4XnYVc2mEV0X6cQ58uD4RJ21Iv7nTWvlX5tHjfDjkONeWojjCy7//wdAyRWzBvGGmk
         Fm0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774948889; x=1775553689;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cE0PWmhtnEqQSnWYYYOuzSEl1gB3SuYtUjjS/Ucvahw=;
        b=ELctpCf/LuOZnQXWK8OI8wmTZhDoHEkKrcsRSwFDBx3UNZYoIhiW+4Q0YHdlIt0ezC
         J9geiCX/TENTPaH2Lq/xpworWUS/O2eJajrDIb4VxESWwV7QZgeuF8/D6CA5u5shogXE
         iF/Wsqfl9UtwozHyWSmVEVSzfJf9KA2xNi74H47nJN2tYBdux4nMDOh3jv/K0fk2bPNU
         OU17sc8BB16pB8k+w7z+JyJaVqjnV5P+HFLAotUHdGgIkOkWvZbXhTTDdOGyg/UyEzqb
         9eNvm2f3XYQ3AiTTq9QlEMd7orsuMjvhLnvccbzPf5ymg41OMGfysnrQjmLregSRSj1f
         tIFA==
X-Forwarded-Encrypted: i=1; AJvYcCVSR6NJ6hrd4+7KNX0sldk0KgTZLFw2HQclTX2OztzMb/c0xVUeqkrGmPur5a13rbga7ifkYnMp2mcs@vger.kernel.org
X-Gm-Message-State: AOJu0YyaQwjDbJADXzvJIMSmHbZ3GOX5yKwo67qY4CpIGvehFJ9hJPcG
	BVUdlfU5VGc+MVFiRDfBjRd+yYDsLMIKPkGj+kGhxWtyDHDhs7MP+BLi
X-Gm-Gg: ATEYQzygl62mMdsGkH1IpvvvdhLXjecdXFodWQR2lDdCMzcqakNtj+Ua6Lhd6aaGp6L
	1Rph0q+d+hEEoDY7qaTdkS1SPR/npONjK9+NBiuo4b5WISqLEklGZ93MBPtMy5dBhN0CHQmcfAA
	exM8+L3yUYcR5GJl/Srv8E+m//N+s9t3sDOAVaA5cW1nAihhOqVIakMkOIcdvaHiYaMpGCr7Gmp
	7tFYeRjAwpzoNxiKgba5DECCLL5IYoQMcXMLfeBMnpSD5kfOjKQOigDMcikm3vi6vie53DVoRkQ
	Aobiw+5LPqbp8Bbgb6f2az4wOXIXkpcXAXWNWdf/i9icAxOA7m0i2vmvqJrRqfuhND5Ih7ea5zh
	Qls2doCVmbaYnGenQRH8SwppBuDxX7CUHzhDO9ZRXXKwSi0HvcUQRBFj9OWP+9+ddlzJ6iXGpUg
	eYLun6Sgpo08tkf1m/XbV3SU8Is6T+WSONLBUDBluCd+e1PEmA9BXkTevOHRV0St/KCxLyakkp7
	Ho/4u/MUrhVRoj3yxV8FAe8c4dqhrJilcknCBlAuISew84=
X-Received: by 2002:a05:600c:4744:b0:485:4278:2558 with SMTP id 5b1f17b1804b1-48727d5a313mr266045295e9.6.1774948888897;
        Tue, 31 Mar 2026 02:21:28 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-20-233.cust.dsl.teletu.it. [93.144.20.233])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e7e96fcsm25474495e9.2.2026.03.31.02.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 02:21:28 -0700 (PDT)
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
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 1/1] arm64: dts: imx91-var-dart-sonata: add RGB enable supply for PCA6408
Date: Tue, 31 Mar 2026 11:21:12 +0200
Message-ID: <20260331092112.7876-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

RGB enable pin, labeled as RGBSEL, is a board-level enable signal on
the Sonata carrier board.

The two PCA6408 GPIO expanders depend on this signal being asserted, so
model it as a fixed regulator and use it as their vcc-supply.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - Fixed commit message and RGB pin references.

 arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dts b/arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dts
index afa39dab240a..3f0fd321d95f 100644
--- a/arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dts
+++ b/arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dts
@@ -90,6 +90,13 @@ reg_vref_1v8: regulator-adc-vref {
 		regulator-max-microvolt = <1800000>;
 	};
 
+	reg_rgb_sel: regulator-rgb-enable {
+		compatible = "regulator-fixed";
+		regulator-name = "RGBSEL";
+		gpio = <&pca9534 7 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
 	reg_usdhc2_vmmc: regulator-vmmc-usdhc2 {
 		compatible = "regulator-fixed";
 		pinctrl-names = "default";
@@ -195,6 +202,7 @@ pca6408_1: gpio@20 {
 		#gpio-cells = <2>;
 		interrupt-parent = <&gpio1>;
 		interrupts = <10 IRQ_TYPE_LEVEL_LOW>;
+		vcc-supply = <&reg_rgb_sel>;
 	};
 
 	pca6408_2: gpio@21 {
@@ -204,6 +212,7 @@ pca6408_2: gpio@21 {
 		#gpio-cells = <2>;
 		interrupt-parent = <&gpio1>;
 		interrupts = <10 IRQ_TYPE_LEVEL_LOW>;
+		vcc-supply = <&reg_rgb_sel>;
 	};
 
 	pca9534: gpio@22 {
-- 
2.47.3

