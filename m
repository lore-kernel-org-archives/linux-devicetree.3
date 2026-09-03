Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 435794A6CD7
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 12:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788439251; cv=none; b=GxzHhAQRFirhAUQ5vPweEQgqsxygv45R0cco6EIiU6TcG/vPM40MmfogLC3jaUVX5ebb6xeonsvqW1cPIh9g4MrArpsTb27tW7psC/wwXGRsV8EV8FQY3GRahXGCCBs7k8zgEFGsIpmmJP0hMpVMwLPrZo2gvDmBaEUJs2DSnKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788439251; c=relaxed/simple;
	bh=owt8VV0sX3I0hSNu370JxdTN3eXzEsQZ3jkDls2/TBc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WPRJsG5JFZUZ2FrK+nactKVQo9/VoWc4AIHP4GMWwoiGMtOCohV7G1pEygqSr3OlaRat1FkcCJsx3uCQ4QQISEaR5diUK8oMPzvAsTnMvBHC71R0YJpWRfUQTSwN61+tnmcfHT09YuXhDwN13JSaCfaI5/B0Mkd1APzU8srXODo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=mwse5ncr; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="mwse5ncr"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48431648f33so668472f8f.0
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 05:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788439247; x=1789044047; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6NNd/n53IWJVafKsKaqyvY1/0PdAbevrRC1wPXZom4k=;
        b=mwse5ncrOC+bv5jDfyBgJFh1Sc89+UC+iat8nzEzCOej5pdxRMU+U2ouWB8eKZLogu
         KdOEB3Fibg2IWIn/ySrE1T/ybLthjAb6jm07qmqEpc3/joNqeTKphsqfRTNhryFuuWhO
         AW0fzPi8KFMeSbeCk/oYOHQHjqy4n1nM2zg9af5/nEwjCnK1EqMAn/jydA5FF5NPqKpF
         LiYzSbunw7F1eJVgFy8aPeeCY55c2Jdk6ZoW4LIPU01TdmGIHLoYfOd1JRLOujb6F49O
         8deIeCcRVDKCnA8DVnjB8PO9JkEbucd/J1KzNXIRyQz9trz18rQ3SyAtR1bOI6DRfSqZ
         URNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788439247; x=1789044047;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6NNd/n53IWJVafKsKaqyvY1/0PdAbevrRC1wPXZom4k=;
        b=U6gijDZgc+1A4RbHJ+vNQclUln/l47EODaNPfgLjHycA4Oxu0gfF0y/mYB+2CmLLja
         hXz1yMWuy4Xf/0q252WQC8+EePl17NtY6LYrJ2dTADh2IFzZlo4uPJWBm0UL3x1zmAgg
         pNah6MxQlkvB2WTF1arhIGlZbx2+14QtN3sy7ZutRjri+cwpk0D1KTY0TKA+FTnzncWP
         FnOhBmq44P78wTsvPW2Hb2FMdTpVE2K2ijUXJYLF5XVHwl5gyeOqT10Qf8vWdRylfr7F
         Hn2pOYFUVs/B7zSuH8NdQiSHVw1b9PS6g1iJhCXgckqwW9csYcmbW6LYNjAVrq5jzXe+
         EHGQ==
X-Forwarded-Encrypted: i=1; AKwUvBy6soxZ0j7lxQhNBBr0gFhl7hjaHzTWOSPlZW0voI3s28oN85yEFDG4M8VZriaT5MKOPic+nqRJ4ezX@vger.kernel.org
X-Gm-Message-State: AFuF++k4xEPG63Nuo+WHmn2pW+gVUXS7jOhrcaHBLyiVuYa6yBUgVT75
	/bvtvbetxQoGdxSOki0gSxenADbBVsX71XKEALXxIeb3VLm/V+zQ6p8vyeKbdAVKscw=
X-Gm-Gg: AYBFou2Ii8T/Q0qoquOwtgQgzB2YZ8QvjzT3CdJYsRmRiRj8rAZZCKtWYGdn+iUJrO8
	BY+Uqqg4w0rT+r81ScFaoHBOKPGGfhl2oj9FIV49DA7Xd4oal/8sZoC6BtJpmj+pGdeCABTPokA
	eaeZsQ6FVvQy2DOlTa2mk5JtzVPdX0vckwy3yAPA5jN8YWRFvrst14ZSJ/9HLaUMfrsfS+ClVW/
	rtGNKRgZ1js+77CeW8dmJpOvVlgqIJM/pdb1i31mg1jqb7YUeljc8X/HaMBZ2hDvyEdZpwGSMRU
	gj19aUq7xXKD/6aqbE2xrLeAF7krYKU5MsTt6tUMPLGkdUE10bdI3pRMV+g+g6b0zLJTBmnICV/
	ut5eSBqh8ILGbryNBAXcqGTF/YKtLZmXi9XbmREG94zC38YrhaWIc8lMVp5wonYdLUpYel8kRDZ
	CINpMNbTmgbg9ROEqVzF21dcTUMKQgT2vi4lasV1Qmr7DNd0WZdEwZ9n0B8LRLlzKwODd3MA==
X-Received: by 2002:a05:600c:3b9b:b0:49c:f13e:e51 with SMTP id 5b1f17b1804b1-49cf15c077amr34714395e9.14.1788439247359;
        Thu, 03 Sep 2026 05:40:47 -0700 (PDT)
Received: from localhost ([2001:4090:a244:80d4:4373:6c2f:4372:b8ac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee60d8a6sm68280925e9.10.2026.09.03.05.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 05:40:47 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Thu, 03 Sep 2026 14:39:30 +0200
Subject: [PATCH v8 9/9] arm64: dts: ti: Add wkup R5F nodes to pre-ram
 bootphase
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-topic-am62a-ioddr-dt-v6-19-v8-9-74c650dfdea6@baylibre.com>
References: <20260903-topic-am62a-ioddr-dt-v6-19-v8-0-74c650dfdea6@baylibre.com>
In-Reply-To: <20260903-topic-am62a-ioddr-dt-v6-19-v8-0-74c650dfdea6@baylibre.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Judith Mendez <jm@ti.com>, Daniel Schultz <d.schultz@phytec.de>, 
 Andrew Davis <afd@ti.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Paresh Bhagat <p-bhagat@ti.com>, Bryan Brattlof <bb@ti.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, Devarsh Thakkar <devarsht@ti.com>, 
 Beleswar Padhi <b-padhi@ti.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Stefano Radaelli <stefano.radaelli21@gmail.com>, 
 Nick Desaulniers <ndesaulniers@google.com>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Sebin Francis <sebin.francis@ti.com>, Kendall Willis <k-willis@ti.com>, 
 Akashdeep Kaur <a-kaur@ti.com>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Hari Nagalla <hnagalla@ti.com>, 
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5070; i=msp@baylibre.com;
 h=from:subject:message-id; bh=owt8VV0sX3I0hSNu370JxdTN3eXzEsQZ3jkDls2/TBc=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhqyZWXu9tctj2M02CkhvnD9HST9gKluSqCubiNBv91tn5
 KQ+Wyd2lLIwiHExyIopsnQmhqb9l995LHnRss0wc1iZQIYwcHEKwESqehn+p2r1FEUozjkWfLvx
 s6Hjkad9M1PzL+9x0dkp+nb3ohKdIkaGJb9XvLPbvYrZc9nGA+ei3nEc/jVpR7Pe0pe3pkmcW2/
 2iBsA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

For IO+DDR the wkup_r5fss0_core0 and the
wkup_r5fss0_core0_lpm_metadata_region need to be accessed before RAM
setup is done. These are used to read the lpm metadata region in
which data is stored to resume. This needs to be done before RAM is
in use to avoid overwriting data.

Add the bootph-pre-ram flag to the wkup_r5fss0_core0 node in both
ipc-firmware dtsi files and to the lpm metadata region nodes of the
AM62A and AM62P boards.

The board level bootph-pre-ram flag of k3-am62d2-evm.dts becomes
redundant with the dtsi-wide flag and is dropped.

Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi     | 1 +
 arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi | 1 +
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts              | 1 +
 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts             | 4 ----
 arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi | 1 +
 arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi          | 1 +
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts              | 1 +
 arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi        | 1 +
 8 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
index 7fa19ced1a23..34c3b70e36ac 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
@@ -81,6 +81,7 @@ wkup_r5fss0_core0_lpm_metadata_region: memory@9ca08000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x9ca08000 0x00 0x1000>;
 			no-map;
+			bootph-pre-ram;
 		};
 
 		wkup_r5fss0_core0_lpm_rest_region: memory@9ca09000 {
diff --git a/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
index 94c1d60d8d7a..9e97e10b88fa 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
@@ -73,6 +73,7 @@ &wkup_r5fss0_core0 {
 	memory-region-names = "dma", "ipc", "lpm-stub",
 			      "lpm-metadata", "lpm-context",
 			      "dm-firmware";
+	bootph-pre-ram;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
index 871ec227def9..f2059a90ffbd 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
@@ -75,6 +75,7 @@ wkup_r5fss0_core0_lpm_metadata_region: memory@9ca08000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x9ca08000 0x00 0x1000>;
 			no-map;
+			bootph-pre-ram;
 		};
 
 		wkup_r5fss0_core0_lpm_rest_region: memory@9ca09000 {
diff --git a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
index 7cba3ff99e6a..f87d6d515e2b 100644
--- a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
@@ -800,10 +800,6 @@ partition@3fc0000 {
 	};
 };
 
-&wkup_r5fss0_core0 {
-	bootph-pre-ram;
-};
-
 &mcu_r5fss0_core0 {
 	firmware-name = "am62d-mcu-r5f0_0-fw";
 };
diff --git a/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
index 84dfbfd1986c..a343166b815e 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
@@ -53,6 +53,7 @@ &wkup_r5fss0_core0 {
 			      "lpm-metadata", "lpm-context",
 			      "dm-firmware";
 	status = "okay";
+	bootph-pre-ram;
 };
 
 &mcu_r5fss0 {
diff --git a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
index 45ab9d947b3a..8976c0424cd1 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
@@ -184,6 +184,7 @@ wkup_r5fss0_core0_lpm_metadata_region: memory@9ca08000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x9ca08000 0x00 0x1000>;
 			no-map;
+			bootph-pre-ram;
 		};
 
 		wkup_r5fss0_core0_lpm_rest_region: memory@9ca09000 {
diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
index bb027c65eddd..c5f6ab73fcc8 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
@@ -71,6 +71,7 @@ wkup_r5fss0_core0_lpm_metadata_region: memory@9ca08000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x9ca08000 0x00 0x1000>;
 			no-map;
+			bootph-pre-ram;
 		};
 
 		wkup_r5fss0_core0_lpm_rest_region: memory@9ca09000 {
diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
index 31f670fdd91d..9e87a59c5def 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
@@ -85,6 +85,7 @@ wkup_r5fss0_core0_lpm_metadata_region: r5f-memory@9ca08000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x9ca08000 0x00 0x1000>;
 			no-map;
+			bootph-pre-ram;
 		};
 
 		wkup_r5fss0_core0_lpm_rest_region: r5f-memory@9ca09000 {

-- 
2.55.0

