Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0D1367B90
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 23:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782687651; cv=none; b=l2m0U38Zttz4pzNaJA5TnGHMw0MlYV/dHvhiMBifpvLOMuq6TgA0Pn1Wv9yIeTuUtD1HMYiS+GJ5Xs2/a34kDZKJvAcWrKzxUM5DXX/GAABvvoGsbADSs+5qA/l7Ja55vVtjoiQg4wPH5JqF57+roaEPTFgqbYAnSF0mVSUGaEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782687651; c=relaxed/simple;
	bh=76+tra5K+1E2ctn0ey/bkzqX3KZ8sVBxeqcOjBPeHPI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fSOWMULWIkgMrlqEVb2gaT7P2TPeAL5V9ACsV8N/wM6HIc/cl/63Jzx9/7TtzWEnglSw+GXrrUjIQZQX5GhoGmDVZTYGNlB634s/R4W0HF9rRZOdpRDu7DD3YdcNyOKhFpyVxQY5WwpKHUnJy0bCdCOvuFBThk7zT0EdGKRicGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XalJPBRw; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XalJPBRw"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3078e0dcd67so4702831eec.0
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 16:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782687649; x=1783292449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DMSY6dG/6BzfHIX/azlkSk4yjSAWJxyQKbMeQY5ofVg=;
        b=XalJPBRwb1tr/Nj6ls18HP5EdVYyFh54tZ+wlGDAGn3DMh2rD/MUYT49Pux/iJuCbu
         7ws/I7EGkygG5oqVLsarMfSThX4d/0E4bJILGyRVK3QGJsLC4mDPWMb+/CvP7QZkL7fA
         Pxrkn+EIGKrH0UKbOxE2e3WCFEC1sq/j2JKntCvYme6Z1sQfLs2jsbS4uixFLvB3gvfn
         /RHLlp8ASREnFvz0abRKxvWuciStPiP1IySSuR11aNJExEXR8MFz8+rLBiD3oRHZuQp5
         Hw6eGpjldRuFUqBXx3oqTRUME+MN+ccjCkyou5rYC/e0vMlp0+D2LU4eGoisBmF79UwN
         Ue4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782687649; x=1783292449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DMSY6dG/6BzfHIX/azlkSk4yjSAWJxyQKbMeQY5ofVg=;
        b=JZ8nPoKhKGS8D5wp6m/SvMW2UFZ41x5l2j0gj/cW8XkBrOi1j3tp/9vBlD0bmrz2K5
         FpASw59zQJTjZFODjZfjU4QiYhtuty8RS2J1pOpKMnycjJbsEnDOUQlHouG0/V0BEHlb
         byi48bfyOPNbkFVTaviKhcuMd8tpfumTHS9yYf2XWWPu/SnNdSUHOMap0mjZ+43yOrSI
         5T0VlHe4byeHsdfk9U03qc1+YEl5NJNDp0gaSSW4a6SRh4bQse78URLruZRW9YmLqLip
         AZ7joKyBZvGHSd6T6qGBJNeKtl6gX6AhTpmrnRbIqEQ4tmGSTiuoo27AAvA+PeZ1sDuw
         hHYg==
X-Gm-Message-State: AOJu0Yy+ltYm6hp8Zk2N9Jlz4JELNb1dyxMaymuzSAN81UakOJcMhlnA
	yw1KpqZKt0liujFD9aqjq5344jVBtLmDKFx/8QuNrDFhjMOUMtkEKRv5B8mDOw==
X-Gm-Gg: AfdE7cmNHWzzwpQFKW01DPWj6o5h3sDHVCkhn9KSMo7/KttREJ0do+OCTLsFSZ4J36O
	ZSh1nGFRcoBvlLGTAmEQ8HdvjrfPDDKUvop5Hu+ng2tMKKIsbMxooljImc+gvhmus367y0J1m+R
	Xj8HA9VqcvFE92cmDqWdE49EVaDraTDp8XnJPK1r2VKH1qyFjx95cUOiMf1bGhS2BYi+yV47b1d
	Mhp41N7X17ESgoxhdARCQ5WWI9wjXaUTRxP2U9bDBbhlfu+mM2zcg1WDBXENTgoiOeQQHRUabYF
	Un2o9FXInPvn/oVJKHk0K6KDI5edk7EmJhBhSP5CvngRt65QpPeb2b0tfVuKe7yK4AId39UajOL
	ERRd44m6HJuuPK8JoWUkS00/QJVT2pVMYiKvtsr7Pd1k9zihMpp5QNB/xyye1fvdALm6cQDAlY8
	muYJnXjN/9Vq8Glwz9UKgRcS9dsmqGrDRkdtv/0m4vHJzv2aV7z7q+1vb8vCozuLP7pjEXs6BPk
	yuBLvKCLQ==
X-Received: by 2002:a05:7022:e98e:b0:138:1569:6f1 with SMTP id a92af1059eb24-139dbb2ab73mr12512388c88.11.1782687649350;
        Sun, 28 Jun 2026 16:00:49 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139d8f318e7sm41359030c88.3.2026.06.28.16.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 16:00:48 -0700 (PDT)
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
Subject: [PATCH 3/4] ARM: dts: helios4: add SATA regulator supplies
Date: Sun, 28 Jun 2026 16:00:41 -0700
Message-ID: <20260628230042.1204293-4-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628230042.1204293-1-rosenp@gmail.com>
References: <20260628230042.1204293-1-rosenp@gmail.com>
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
2.54.0

