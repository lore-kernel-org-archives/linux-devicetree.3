Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2D33ED3C9
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 11:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782472660; cv=none; b=hvsV1hB4FfYEIaW4kvJ5tQBJn4JJ1o40fkZN5p26Q1i9m1z5OMl/36ggYDtlcVBoo8WvmHx+lq4vJ/HWep4ivTh3iGCIu6ykzcyhJUsRZBJHywwNal9tOpcwrH8hngq/duXLwKY3fcMANtHjLmM7GDkHYsr92yWFgxKMIqU9b+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782472660; c=relaxed/simple;
	bh=sXMzf+dpY3Gf1vgo6uwCENPhglBybMN0rS0lqrqI3X4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=psunh1EhZQtumzxnPHmV0J9jyCutMA267o3Ntv7nBAOA97+2NxkOIopMPAgNaLxaPVtXO4T5bTs95hhQKRYHiAJmGb4WmtI2i7dJs/3DyytesBftRNj3lQdn1Rqsn8JnFiG5CTqP97drWNdkupkx9JdR8HDlUPBOz4hF+VlNpik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iKJRpoQq; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iKJRpoQq"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-30c09f29b64so583434eec.0
        for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 04:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782472658; x=1783077458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nvBLBJx+kT93NTleCT7dpiOIClkWaZ9So3A0zf5NePU=;
        b=iKJRpoQqRzfpeQ+zAGvYSRanajTPEQ4FNs/K9Lr0I7vEfLNKFviZ0grNa/kJ/XmuQO
         a10xKw0JVV37eMqwG1kBaRGK89lz5PKjIICLpuURwes77+IDcZ78FIa0VzY/zsYGdMf5
         76QcXbl1OnaH3R9rHEUcptb5RWV/lzcrpAiS4WnzOY0EXGHnjtmlGC0ecXSs+TkgMvtT
         reCZPiRQx2/dnOsMLActszjzX4xHEDe9qAaPDBPmYh7Bu36GA5lVumGDg4S82NwOYpod
         64ltA8SErVRx6bXIwHuyHlu5GOH/obUqDMuUd2IhDrKNKAZ4q7hb0J/wVH+a5NoKTWOo
         qVeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782472658; x=1783077458;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nvBLBJx+kT93NTleCT7dpiOIClkWaZ9So3A0zf5NePU=;
        b=VHgKsd8bbKVDTJ4fEXl/1LytILb3ztOLJFFZXrZAZRU7TWim9C9Femfa+7WA+7JkjK
         NBIcrirh3iz+ZNSImS+vNz5Wk5ZpAgcLrJo078F1t+vXKeAa6NTbrtRVvow9Ou18XEH0
         HxXyiMwDaN+17B2kyKGaQompqj0ki6504KCqyBmtExgrap2aNHpy50Pmo33ux3bF/025
         130NbS6hnw8YYajL4N/FWlTievPuAMevGo9RvZKOrXfT1ISFqMWlWpQVLh5DpSs8+iZa
         jYU1GfsiXpv1GJpsVMVRxRsGSkevZkiyD1/7SH5QiI/cWNcCRVs4mGkxo6Gr4BzGWA1T
         GwSg==
X-Forwarded-Encrypted: i=1; AHgh+RpDD3d/HWW78xDgwWDIlHazKUhfEnZJNTwOPmpoTZ4WAbqO3+n94DVrRPoL47ESOxzDhABBOkPU7mGI@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1d1F+4EzWVgki0T5C9ibBmkNHrPQJ7Rh626OnA8FaMCyoLwVs
	i6MTdk/aDVPNkzqqI+ouBbxO+WF16WNvMfzReJEDKuWdLqnfJ45NcPYH
X-Gm-Gg: AfdE7cnGM0tsZtWWVLStWPX64L09gADEFb05f91QcRUgPrgKKUkiMTM/ACIVPH1E8/w
	gcwWb6bJs+A00GFAO22ms2QLjEGoNpI7G9DLGbSZCcQCYMGkOugJsQMOCDGaSQpB92wGdP13sB7
	oJoFQdzuLS0IeV/F9s66J2WGpLwkfzIrd5iy9HrOMaKw5UdTY+BRyDqUwtPnIUx+K8lLsw89nub
	OCxrIsBvc7YdrMOl5RPYKQmpVN0gdAmNeNkWW/EulOc6fqcB2NkLDdyYWy2+72EvuqJJ3H8kNji
	VTP5x1Tkg/bJ9hutjErsh8DhHaP2AVC+LbVI/Q8jwvJAV2DPKfjnXTHzjlJjtmD4/20XvLfycBr
	JBk21tPiB4mAcuSPflTHVHuWHXPuJTZ39axfzrBLnPo8kqf/Hy2q+U026RdEFdLKQusAvMocHtB
	4r4xAeEynms9sD7aeYEoov26hL8BOZWJat2pbUJynm
X-Received: by 2002:a05:7300:a485:b0:30b:8878:9c8e with SMTP id 5a478bee46e88-30c85468412mr5529542eec.2.1782472657813;
        Fri, 26 Jun 2026 04:17:37 -0700 (PDT)
Received: from primary ([223.181.21.17])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7cac87dcsm19391852eec.31.2026.06.26.04.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 04:17:37 -0700 (PDT)
From: Vidhu Sarwal <vidhu.linux@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	Vidhu Sarwal <vidhu.linux@gmail.com>
Subject: [PATCH] ARM: dts: ti: Fix typos in comments
Date: Fri, 26 Jun 2026 16:47:20 +0530
Message-ID: <20260626111720.56688-1-vidhu.linux@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix comment typos found with codespell across DaVinci and OMAP
board files:

  limitaion   -> limitation
  swithes     -> switches
  converstion -> conversion
  differnet   -> different

Signed-off-by: Vidhu Sarwal <vidhu.linux@gmail.com>
---
 arch/arm/boot/dts/ti/davinci/da850-lcdk.dts       | 2 +-
 arch/arm/boot/dts/ti/omap/am3517-evm.dts          | 2 +-
 arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dts | 2 +-
 arch/arm/boot/dts/ti/omap/omap4-panda-es.dts      | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/ti/davinci/da850-lcdk.dts b/arch/arm/boot/dts/ti/davinci/da850-lcdk.dts
index 8390d71b000a..e70edd5274fe 100644
--- a/arch/arm/boot/dts/ti/davinci/da850-lcdk.dts
+++ b/arch/arm/boot/dts/ti/davinci/da850-lcdk.dts
@@ -366,7 +366,7 @@ nand@2000000,0 {
 			 * to NAND block 1 (NAND block 0 is not used by default)".
 			 * The same doc mentions that for ROM "Silicon Revision 2.1",
 			 * "Updated NAND boot mode to offer boot from block 0 or block 1".
-			 * However the limitaion is left here by default for compatibility
+			 * However the limitation is left here by default for compatibility
 			 * with older silicon and because it needs new boot pin settings
 			 * not possible in stock LCDK.
 			 */
diff --git a/arch/arm/boot/dts/ti/omap/am3517-evm.dts b/arch/arm/boot/dts/ti/omap/am3517-evm.dts
index 40f15da81043..a4357fa9f006 100644
--- a/arch/arm/boot/dts/ti/omap/am3517-evm.dts
+++ b/arch/arm/boot/dts/ti/omap/am3517-evm.dts
@@ -213,7 +213,7 @@ &i2c2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c2_pins>;
 	clock-frequency = <400000>;
-	/* User DIP swithes [1:8] / User LEDS [1:2] */
+	/* User DIP switches [1:8] / User LEDS [1:2] */
 	tca6416: gpio@21 {
 		compatible = "ti,tca6416";
 		reg = <0x21>;
diff --git a/arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dts b/arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dts
index 43cf4ade950b..76bfb364777e 100644
--- a/arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dts
+++ b/arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dts
@@ -420,7 +420,7 @@ stmpe811@41 {
 		st,mod-12b = <1>; /* 12-bit ADC */
 		st,ref-sel = <0>; /* internal ADC reference */
 		st,adc-freq = <1>; /* 3.25 MHz ADC clock speed */
-		st,sample-time = <4>; /* ADC converstion time: 80 clocks */
+		st,sample-time = <4>; /* ADC conversion time: 80 clocks */
 
 		stmpe_adc {
 			compatible = "st,stmpe-adc";
diff --git a/arch/arm/boot/dts/ti/omap/omap4-panda-es.dts b/arch/arm/boot/dts/ti/omap/omap4-panda-es.dts
index a933fe560834..70c609811d11 100644
--- a/arch/arm/boot/dts/ti/omap/omap4-panda-es.dts
+++ b/arch/arm/boot/dts/ti/omap/omap4-panda-es.dts
@@ -12,7 +12,7 @@ / {
 	compatible = "ti,omap4-panda-es", "ti,omap4-panda", "ti,omap4460", "ti,omap4430", "ti,omap4";
 };
 
-/* Audio routing is differnet between PandaBoard4430 and PandaBoardES */
+/* Audio routing is different between PandaBoard4430 and PandaBoardES */
 &sound {
 	ti,model = "PandaBoardES";
 
-- 
2.53.0

