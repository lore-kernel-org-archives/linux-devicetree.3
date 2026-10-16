Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5674B1293
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 14:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792161691; cv=none; b=MTkowQasZirm++x70jJSMJKWRWqxjhytiH8IfS9Xs3gU0mp1NaL4cdx9ZnZrhhZiC7FLR2Ww2/kM5fN/McPDmz9MsStDK1ZJMtajUCi1vqsybHoKsYACdO7NbVkbPh9KHY2AeqKhF9KufvhcNgwoc5LfIUxa3C70gdhg0sORCMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792161691; c=relaxed/simple;
	bh=Ypdv4ck2LmDWhfMcxtTVZOnd/mxsjho3hvj/YRy/7wE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RBeeNg33AryyDmFKbbKypfVRdHTud3AJqIA21PXHhVECIr++/QM4wa6hJWIORY39Q2KwyVyB0PNhUIVMoTnq7afn2j7fst7QHDk8lVKa9pYke69R3AivzngUY66qNBVxp11HQi/d2j/qqJ0pUQMF1Vt2MvlC9KLAUpR3R9B0g7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NC7w2ZHY; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NC7w2ZHY"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48df4f540ebso1188373f8f.3
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 07:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792161688; x=1792766488; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I93wz8CKpgQy+526q8lOXNd9GCplSJUpEI+oY95QMxs=;
        b=NC7w2ZHYxpUJBoMToD6mmI4Y5siGW2K4mbOcrHt+wA4NzC3oH7XxKmmJr/VwE4f+PX
         2cePwVBq/IKtu7E58glwRdVB1aGI5a9m5Z99cCPXbFzNi3E0jf0sKqHbE6nYH7UkgGLX
         PcEbf8NWiD5hN/EFJzvldahtNVws+NFMmllCliv3wh5RhpgwBP8mP1IffO680vKVZJgY
         gNlgpNHGJU6xocJPD4q9K9y4n5ynbeY8uTP5VQMwuNowosDT5dJeDnbNw5N+08MG6SRA
         QMXX7o7UBBrG15Y//z7/FWbfOGqrvXLTbO72glf+PIZRoBPKgwVvUh8tZmPFFn2YsiuZ
         UksA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792161688; x=1792766488;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I93wz8CKpgQy+526q8lOXNd9GCplSJUpEI+oY95QMxs=;
        b=eoOB5v+8RKTmPcc0AFHGorQ0qvymP31SBhYryT2nn6BVv5MfgmvEZEZpl4XwHTwfuG
         2hx/mkvMzrCVkJ9pWmen5VzkWui18AE/InOadFjYRwnroDQktrGPikqdDC/Bm7F+3KxY
         DVdg6ozc66dztTu/J1hzUXXaCkwtzDTKDtq2cgDZvr3R3/lJHJ8A6bEaHnzzYvj0tdue
         vVYlAmKcxydcMmJKJF9JwBVI0sx0Rf6L/BpIhkN4sR9VXC+24+KH0DatiF3RqM47bMHd
         9ZSJpuRzbNACym9cklq283Dgw6Oq6u/kfigbglpBXUIH6871fHkktFFCqXTjeRqDkvPt
         X/fA==
X-Forwarded-Encrypted: i=1; AKwUvBwiHL9i/4vSgYr5nhqsqqK6avJB0VmNr3mdOV8qfB1NzxDlGMq9zAqroIwkCvbm/u26ai4CGR1ZdGRO@vger.kernel.org
X-Gm-Message-State: AFq9FYIvaK4YmzAcYmUPz1d78uU/bNq4fSRvZvAaDGPazE85jmTQ92eY
	KAaFnFD/Nozr6yGgrUG2wGWCyBmGKGxp9aM33VOvcC+8uGCQEoc0ggirXRrJ8v3IR64=
X-Gm-Gg: AYBFou3FFgbODQf3rpAQC8EBLAA8CFT+pN72cpwu7YiysVy08WxZnEr+MJtCo7F4yyB
	Mxre0jnjOzH2ji1SymWQnt54+0Uu9SZc6hfGBaWEZauzqfIhiWsBvaYp11eMm6vBN4Z47T0n7A5
	28YCIx1KI1g6dRWRuv8y/32lar3acxy35/qHaZHL4BznXzhePNPJYAC8yYJxMt8+JqDzTgOSAlM
	MY+bxf0O4xPl/PUUSb/Cj+muLvAWlXfus1g0lNQ3/XaUVV9UnXigxZa3YlHJp0QYUWaSEg1oT22
	+ONlDfbiXeWWHoTLc3kUNT65D40M71BsmdjMZ0aapbhHiKoisVzPVZRDVXpFlp6ZtRywqQDkuYC
	utsamF/OPDlPx9Cufw91X4Bnn1jcWldytmE/sJYBWwz49JSmUdLSaTS26JzdAqRlGRpCeceELDP
	q+avlVay4nN6luGWD6+x/DUqVVJNMr7lZ2UrxkpuAJMaSbETpq2eCfafi54fUs46dkBvb8Z2gcI
	H2vEYN0xPFsI3K5dTkJWywAGKWrNhq41G39SNr8hKtXpwqe6G0Cv3M6AX7erhbrJoGlbJny/+9U
	qa/K
X-Received: by 2002:a05:6000:400d:b0:48b:10c8:2183 with SMTP id ffacd0b85a97d-48dbacdd2afmr41397725f8f.32.1792161687267;
        Fri, 16 Oct 2026 07:41:27 -0700 (PDT)
Received: from z13-ek5.local ([151.41.28.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4ecac3sm5949648f8f.27.2026.10.16.07.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:41:27 -0700 (PDT)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Fri, 16 Oct 2026 16:41:20 +0200
Subject: [PATCH 05/10] ARM: dts: omap: dm816x: refactor and align MMC node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-patch-ektor5-dm8168-dts-v1-5-b4ce30217028@linaro.org>
References: <20261016-patch-ektor5-dm8168-dts-v1-0-b4ce30217028@linaro.org>
In-Reply-To: <20261016-patch-ektor5-dm8168-dts-v1-0-b4ce30217028@linaro.org>
To: Paul Walmsley <paul@pwsan.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Linus Walleij <linusw@kernel.org>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Ettore Chimenti <ettore.chimenti@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792161680; l=1896;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=bQlaSmVrxWRh3eFexaKgbJh5U7ftQwzZnbqVJPILtpg=;
 b=GdQ58uqjcnmGPDtcijnfZlLk3LVb6f9YJJVOwK6BFvPD1G8Wv2rOQyByMakkeuOpx0A87+uRk
 rR2R/Cr5fBcA9PSdu0Th6HGErC8ZzGFOUPpHQrBKzemmH4cIfOEq2mP
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=

From: Andrew Goodbody <andrew.goodbody@linaro.org>

Update the MMC node in the TI Sitara DM816x device tree to align with
the structure used in other similar SoCs. The changes include
refactoring the node to better describe the target module and its
sub-nodes.

Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 arch/arm/boot/dts/ti/omap/dm816x.dtsi | 33 +++++++++++++++++++++++++++------
 1 file changed, 27 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/dm816x.dtsi b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
index 9c9d5e296e90..7f3ef3a00ab8 100644
--- a/arch/arm/boot/dts/ti/omap/dm816x.dtsi
+++ b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
@@ -423,13 +423,34 @@ &edma 20 0 &edma 21 0
 				    "tx2", "rx2", "tx3", "rx3";
 		};
 
-		mmc1: mmc@48060000 {
-			compatible = "ti,omap4-hsmmc";
-			reg = <0x48060000 0x11000>;
+		mmc1_target: target-module@48060000 {
+			compatible = "ti,sysc-omap2", "ti,sysc";
 			ti,hwmods = "mmc1";
-			interrupts = <64>;
-			dmas = <&edma 24 0 &edma 25 0>;
-			dma-names = "tx", "rx";
+			reg = <0x48060000 0x4>,
+			      <0x48060110 0x4>,
+			      <0x48060114 0x4>;
+			reg-names = "rev", "sysc", "syss";
+			ti,sysc-mask = <(SYSC_OMAP2_CLOCKACTIVITY |
+					 SYSC_OMAP2_ENAWAKEUP |
+					 SYSC_OMAP2_SOFTRESET |
+					 SYSC_OMAP2_AUTOIDLE)>;
+			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>;
+			ti,syss-mask = <1>;
+			clocks = <&alwon_clkctrl DM816_MMC1_CLKCTRL 0>;
+			clock-names = "fck";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0x48060000 0x11000>;
+
+			mmc1: mmc@0 {
+				compatible = "ti,omap4-hsmmc";
+				reg = <0x0 0x11000>;
+				interrupts = <64>;
+				dmas = <&edma 24 0 &edma 25 0>;
+				dma-names = "tx", "rx";
+			};
 		};
 
 		timer1_target: target-module@4802e000 {

-- 
2.56.0

