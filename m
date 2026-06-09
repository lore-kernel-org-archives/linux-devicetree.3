Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DAE4CA29C
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 18:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781031481; cv=none; b=YEqeSiPZYhbuPjKPEXLOLpDdHBHT/tW8HyJ/s3HfKgmvh24Lie6dHxPbpVZy7nBnllKHMhAKPPnWxfS7EqXanq0necgFWl5lu2Rde7BDmD9w3Wuh1VJhWuGnvnE2iFy32BpLeToU8u6Psefiwtv9vzUPQuFCLp9bq1gJjZDhD2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781031481; c=relaxed/simple;
	bh=mdp5N6pQOfilMfK/PUMGUhkxAL6EJ1ef+4CRwr1AwlA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NNigMVSTuV283nnhL31y/Aslx3c6/L4cTa0IEi+qH/gGZAoE+gDOPzuA6+6gz1FT5n/y34KJ9o8QJ3orl1BTH+WXcRJ/nlIuJ+Nul1+9NmvRD78SoV/fLnS/Q7QaWfHVNC4IB1kJAjxcvaoEVwA5Wkk28aaxMXUEFCFrN90iJMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=RhNe/ioI; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="RhNe/ioI"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490bb83a3f6so49001355e9.0
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 11:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781031475; x=1781636275; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4vMM7Dpw28MiXIgCohTOe5dYzbZ0DClw94YJQlMLEgg=;
        b=RhNe/ioIPH3SXaIhb0WfDyJHklZH+CchbRLq7mwZDcvfMvIMQZNw9hCMhscTCmyG4L
         OTM7D+rEfYPwj+AqBptVMTRd1pdf8yFsKN6MDm+Fu6SE4EZVz1BzIvu8OjaZOOIEJ9M6
         jHt9ZVXlDhDd9jQ50MepBCmiRfPcurHK3XzGF+tgRhuJ09mHNL/TbI/80vec2nc9+qBF
         ibxyt4c36xuyGe/WNHcfGQtwKNSe5VUXU2/04Yct4dTv+MeBTisccpBqpJr1jA6bMWFw
         6xAsibiHO3x7Daz4zk6D2UJHHcVmysCfYfk/sT2KRNvUaJwLM++eM2sr20oQ9aPpSVSc
         7VPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781031475; x=1781636275;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4vMM7Dpw28MiXIgCohTOe5dYzbZ0DClw94YJQlMLEgg=;
        b=Zw6nqngEtuyxAuNbMMav4YVc0JT0hE/x+diZuMqKDnUHihxiFJ9HmvRdv7fZ0DKPPE
         eUNdL1ydTye9Y5Aa6gOHRrWsiGnDRlivGUXtrOH1OoTxxG/U/5GRx1TgaRfcZ/bMAuux
         YayDpINKpw/2byucw4OpzskvBRmfuGHD7Gl1XZ6emLcXPT9aSbUbzVBviRD9+EjFfD5V
         PVYwl7bJAp95WilrSNHCozTixPzAdS/HvsMQSHnMoXMOAevD1BixSSjFp7v0L2SuHwv1
         n1X8d3cuP20OFcZGXS2w8WDnwlPCLhGTWhypcVx/1/2Y+CU/CcxgW4zu6TDXHp8rGsW5
         VD5A==
X-Forwarded-Encrypted: i=1; AFNElJ8Dj3Omrwdw3Y9qWh7IdN3eFDj4b0IPGAaGQrI+7RckzyqxNnJTq5HBzT8EPD/R9h+INECEFn9pWxuv@vger.kernel.org
X-Gm-Message-State: AOJu0YwDFtf6zgBcryBXggJ/l+n+Y3NIDOs3tkIdIO1GlPPkZ4ENn8u2
	+YhOKwCly0fpMiRuap5//KK4pgHW8DhxZ2KHZLskd+N5Ezx3utmKDZMWElRW4mnycyo=
X-Gm-Gg: Acq92OGr4yaY1dP5PQA4RFFMgv96EjZhjDR7ZWnB+S38iKZdcgVKTjrg7eGf0AMiAiA
	NFGLMvpihBMKxa1LgKLbXlV2/OixWAZrCbZzjJpVSDMHL6Vbh6V/wM4N9urmh2ayX4gXyWKjtNM
	qgMCNpGj61E3B2V27SQajNiJbJUNsRE7bkczX4f1sJg++STeQvAzclGcMFingn68l7pQWNfHizZ
	DBbq//jHdTprlKBFPbhinTac/GFGUHuOyGyY3trXtFAcd15+z0MFqlwaZTa1G9pFeWEuqJu5KBW
	Fmu2EemR3bKxmTevgDfbjRVQIqDrCEZdzf6tw/Wtd78xo9v0CDvvbPO8NMGaAYSyOch1JXWXttk
	1n8JisgO+4cL4fHDlLnMRkOtFhxtGzqnIXlctu8JdEmMK7CYYq3hDvMtOz50VxV2wH1AgHzT1yt
	QpFs8SjItqI5nRiBdcZNlKJ5Hb6zg/9pR+/Wbqyp8LFg==
X-Received: by 2002:a05:600c:444f:b0:490:d354:bd01 with SMTP id 5b1f17b1804b1-490d722db58mr49827795e9.26.1781031475289;
        Tue, 09 Jun 2026 11:57:55 -0700 (PDT)
Received: from localhost ([2001:4091:a245:857c:bd97:47c2:83e4:8d45])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2f5612sm62772292f8f.15.2026.06.09.11.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 11:57:54 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Tue, 09 Jun 2026 20:56:19 +0200
Subject: [PATCH v6 07/11] arm64: dts: ti: k3-am62a-ti-ipc-firmware: Move
 wkup reserved memory
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-topic-am62a-ioddr-dt-v6-19-v6-7-16afba97fbe0@baylibre.com>
References: <20260609-topic-am62a-ioddr-dt-v6-19-v6-0-16afba97fbe0@baylibre.com>
In-Reply-To: <20260609-topic-am62a-ioddr-dt-v6-19-v6-0-16afba97fbe0@baylibre.com>
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
 Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Sebin Francis <sebin.francis@ti.com>, Kendall Willis <k-willis@ti.com>, 
 Akashdeep Kaur <a-kaur@ti.com>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Hari Nagalla <hnagalla@ti.com>, 
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4480; i=msp@baylibre.com;
 h=from:subject:message-id; bh=mdp5N6pQOfilMfK/PUMGUhkxAL6EJ1ef+4CRwr1AwlA=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhiyNJOZHv2Lv/BWK/CUgcDicV03nnk2w29PNMQeci5UbQ
 x/dFpfvKGVhEONikBVTZOlMDE37L7/zWPKiZZth5rAygQxh4OIUgInomjP8lcv/w1fNJn74k+2V
 ZsNdns5vFO0VLgu45jI+KWYujpqzjOF/yu99+z1sDWb5HLpQpvml8GCP6TTxjMfCX4VUTmuwZZ3
 mBQA=
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

Move the reserved memory regions used for wkup_r5fss0_core0 to the
k3-am62a-ti-ipc-firmware.dtsi. These are all the same for the other
boards as well, so we can combine them here similar to what is already
done for the mcu_r5fss0_core0 memory regions.

It also moves the bootph-pre-ram flags from k3-am62d2-evm.dts into the
firmware dtsi so that all boards inherit them.

Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi     | 12 ------------
 arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi | 14 ++++++++++++++
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts              | 12 ------------
 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts             | 17 -----------------
 4 files changed, 14 insertions(+), 41 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
index e13da7c95a30459e7649f284689039b89a95f651..228ffa4be4be7b32e43a06d807d3fee073d203dc 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
@@ -59,18 +59,6 @@ linux,cma {
 			linux,cma-default;
 		};
 
-		wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c800000 0x00 0x100000>;
-			no-map;
-		};
-
-		wkup_r5fss0_core0_memory_region: memory@9c900000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0x01d00000>;
-			no-map;
-		};
-
 		secure_tfa_ddr: tfa@9e780000 {
 			reg = <0x00 0x9e780000 0x00 0x80000>;
 			alignment = <0x1000>;
diff --git a/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
index 06d4e815b1670beafb8852b76a3f6a79295ce8ca..682b1c9f3071ddf23044c1fde1e88f2b901ec64c 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
@@ -29,6 +29,19 @@ mcu_r5fss0_core0_memory_region: memory@9b900000 {
 		reg = <0x00 0x9b900000 0x00 0xf00000>;
 		no-map;
 	};
+
+	wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0x9c800000 0x00 0x100000>;
+		no-map;
+	};
+
+	wkup_r5fss0_core0_memory_region: memory@9c900000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0x9c900000 0x00 0x01d00000>;
+		no-map;
+		bootph-pre-ram;
+	};
 };
 
 &mailbox0_cluster0 {
@@ -67,6 +80,7 @@ &wkup_r5fss0_core0 {
 	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
 			<&wkup_r5fss0_core0_memory_region>;
 	memory-region-names = "dma", "firmware";
+	bootph-pre-ram;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
index 63a4fb03dc0acac63bc573e290ec613617f492f0..8dda657f854cc4456c38dae812f9e00646c6c0d0 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
@@ -53,18 +53,6 @@ linux,cma {
 			linux,cma-default;
 		};
 
-		wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c800000 0x00 0x100000>;
-			no-map;
-		};
-
-		wkup_r5fss0_core0_memory_region: memory@9c900000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0x01d00000>;
-			no-map;
-		};
-
 		secure_tfa_ddr: tfa@9e780000 {
 			reg = <0x00 0x9e780000 0x00 0x80000>;
 			alignment = <0x1000>;
diff --git a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
index 463a3f6130b8f2927a032137e87c01df446cffda..dd6937789a9c6b7c92ef5ad1fcc3ae94a90e2353 100644
--- a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
@@ -59,19 +59,6 @@ secure_tfa_ddr: tfa@80000000 {
 			no-map;
 		};
 
-		wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c800000 0x00 0x100000>;
-			no-map;
-		};
-
-		wkup_r5fss0_core0_memory_region: memory@9c900000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0x01d00000>;
-			no-map;
-			bootph-pre-ram;
-		};
-
 		secure_ddr: optee@9e800000 {
 			reg = <0x00 0x9e800000 0x00 0x01800000>; /* for OP-TEE */
 			no-map;
@@ -776,10 +763,6 @@ partition@3fc0000 {
 	};
 };
 
-&wkup_r5fss0_core0 {
-	bootph-pre-ram;
-};
-
 &mcu_r5fss0_core0 {
 	firmware-name = "am62d-mcu-r5f0_0-fw";
 };

-- 
2.53.0

