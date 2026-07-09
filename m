Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0862396579
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 00:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783558213; cv=none; b=A+CTb7El3Vz1BLZjAMWBGyccnGKqvo7X1u/W3kSRQYMW6vh28wGtXWGVo99hLNG6DG4qxud5Wi4ndR9aH9Zv6q5VGxt9iPtN5yrH7Sa+TkUGhnaaaZjnr8yoOlC83/hX6b1sI7GYC6SuMuNw13oWUWXx/nHn0tu6tnqWC6KMd2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783558213; c=relaxed/simple;
	bh=+/FS7thM1NORJsqWMjqPQXR/TDNreGWLIX2sjrM+wT0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p6F/k9/HIT7ot8jylIfpwtmNkUw1ZNsX7eHW8qeCZVJu0NHs5H0RQgJRA9Ns4t2pyEBFnJzt6J1+bU57uBVqIZI2s3UW1R0Ag1SEqB+vwKm4Q9OltZJ89LY0f/1q41GzR0bAxLJColPzudfhg7zttXerJ92BxFCv1Yb+p4MxLH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nsc0OBAL; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nsc0OBAL"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2c6b67d5fa1so3474405ad.2
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 17:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783558212; x=1784163012; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4Jcyaehq/+QqsulhvvKI66SG0KEO38Prj04gQdC0eF4=;
        b=Nsc0OBALCmMb6A3vZsvs7j4aa07wD8QPwW3lvkLPL8XKUqkBJLUbQfWnIAXWE44w+3
         2BrDNYDZiXPNCt2o5AIJ8Allv7uf7HYemOv0da70KSX/xpyp4ac1+z86QRJ3m0nxFP95
         isb7pbUsCXNrQIfZAgs5j8jTiBuAjHuhws3pLo2guOcykkBuv9CqRuQuiesHMbNJh/Xa
         JD/hADL63hOgo4v5rd/sUkrWY3y6idvpcWjp5y13L5JxxFFMdPFlHSNGBqYvoJZjOm7d
         PGWAcs/VqIWJGNHiOJ1rBIy1betCXl7SmuK69dGuFOL1TQD9ioDHV8xRTj3xlKZh8K7a
         3KTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783558212; x=1784163012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4Jcyaehq/+QqsulhvvKI66SG0KEO38Prj04gQdC0eF4=;
        b=VYZcEEaXUCKA1u9XC2soZoDWVVCFE7g7ULrDf8WiRDarYBSLsJIalFToW9RcjAY3gc
         1SAWxD3uID4Qiqf2Y6XXqc2UQ3ynRvdnRgczNcdR+kGQ5k6QyD6xO9AmVOg6MgbCA0Kn
         VKYqb/PI70VP+Bl7ofNQ8f1koOgXll1/Ji4epBMX/636alUTZlnKQkVyoHJ9yNhPaV59
         FXcILm04ISkG2HYNMEcZZ//uK4MISXtl9WZ3SPDTxWIGEicAGw9VIW9BIzNGXfU6njv4
         xvNF01H6LDbWTs/0vKDJwDs47Ds6Fk/6TKU1FXREcWt86ts33QO0/zAhs5A2Uknc2rta
         iLBw==
X-Gm-Message-State: AOJu0YwKG26LqehxQ4zmW/f44pj3EAj39c0kwOsz3wod3vn+kUdgFqoL
	378ESqewNx1B4+IYXjLBqv7hocL6rpNVk9/GwsETEnCaNrt/aTnnTBkMC260ZQ==
X-Gm-Gg: AfdE7ckxU6jKpQ1Tl9zR0H/GCTa/Yi7EoPWlXLYXtf/M/53qIaJ1VPRchOzKnBoRd6I
	tGnGlxJ5lAf1oK4EAsY7a0EicYQtsDb6adbf1JVm5vIlqMGsMwXSA90n1fqQtyntUCeX0AOHHyF
	tsaf7tIeAYNSbrpfYRUWDTLur2Ru7p0nvKcWarrWOKaVopwdYCspAcN9gAW5TRcYNvx9+mNNZK4
	jep2oHYT4i4/zJSVyBjjGC+6I/PnODzQmp5drzN1gG0dcMkdqP1pgYm51Uv5naNbkYqbL0ebxCe
	yA81fszxlpm/Dv5OvCr/hRbYIeqeIB9mjE9ZB9sbcQ8y+ptjfKc21qJQoABtNkkXg/EO/fRqiFO
	tBX894N0/HZVOYZl6QvkbPyoP3xQ+YgmTwEWa0GXuPd1qhocYzx6XVzQ9Knq16AytIQoCwU5uMo
	MhJJ+2RrPZ38cLu0L0VQo6XjN/Pn8NMgmU7yyuvOLc9BPdxizeSszEMuVeMoRuwdm7cvke18IWZ
	yqKaYUlrKHWQm2gSWXSaQFK4wYlEz8hJe6n0iBIAJLF8CQw51E2cHbxsVwiGcxk4Ria+AjjTNUK
X-Received: by 2002:a17:902:ef08:b0:2ca:d151:383a with SMTP id d9443c01a7336-2ccea3ca6bdmr51355305ad.20.1783558212088;
        Wed, 08 Jul 2026 17:50:12 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d59e51sm35604605ad.76.2026.07.08.17.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 17:50:11 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dennis Gilmore <dennis@ausil.us>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,...),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2 3/3] ARM: dts: helios4: add SATA regulator supplies
Date: Wed,  8 Jul 2026 17:50:05 -0700
Message-ID: <20260709005005.1587852-4-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260709005005.1587852-1-rosenp@gmail.com>
References: <20260709005005.1587852-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ahci-mvebu driver and libahci_platform request three supplies
on SATA controller and port nodes:
  - ahci-supply  (controller power)
  - phy-supply   (PHY power)
  - target-supply (disk power per port)

Without them the regulator core prints notices at boot, e.g.:
  supply ahci not found, using dummy regulator
  supply phy not found, using dummy regulator
  supply target not found, using dummy regulator

The SATA controller and PHY inside the Armada 388 SoC are powered
by the 3.3V I/O rail; the four disk bays are powered by the 5V HDD
rail.  Wire the existing fixed regulators accordingly.

Fixes: ced8025b569e ("ARM: dts: armada388-helios4")
Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/marvell/armada-388-helios4.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/marvell/armada-388-helios4.dts b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
index cf0432a0e71a..626a7339a5d0 100644
--- a/arch/arm/boot/dts/marvell/armada-388-helios4.dts
+++ b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
@@ -222,13 +222,17 @@ sata@a8000 {
 				status = "okay";
 				#address-cells = <1>;
 				#size-cells = <0>;
+				ahci-supply = <&reg_3p3v>;
+				phy-supply = <&reg_3p3v>;
 
 				sata0: sata-port@0 {
 					reg = <0>;
+					target-supply = <&reg_5p0v_hdd>;
 				};
 
 				sata1: sata-port@1 {
 					reg = <1>;
+					target-supply = <&reg_5p0v_hdd>;
 				};
 			};
 
@@ -236,13 +240,17 @@ sata@e0000 {
 				status = "okay";
 				#address-cells = <1>;
 				#size-cells = <0>;
+				ahci-supply = <&reg_3p3v>;
+				phy-supply = <&reg_3p3v>;
 
 				sata2: sata-port@0 {
 					reg = <0>;
+					target-supply = <&reg_5p0v_hdd>;
 				};
 
 				sata3: sata-port@1 {
 					reg = <1>;
+					target-supply = <&reg_5p0v_hdd>;
 				};
 			};
 
-- 
2.55.0

