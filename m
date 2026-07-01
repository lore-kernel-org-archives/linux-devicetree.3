Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F78048A2DE
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 12:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782909660; cv=none; b=A3wqGE8Q8mGhqI8TOuxXxljB/IXH+YRxMkZUQ2jmmAneH2sPZbEG7fh0/I9/ykzzlwvdNBJf2W+b52vNiFQ2FjAGpbUj44PWHVQ1L8LuO8bNbrhiN3dLyJl7nk4smY4GMgWpF1Pad1tHLVereZRpHgh7oE1wzzJ8+Zoes/G2C6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782909660; c=relaxed/simple;
	bh=hhLOVviNovSyV3jCQbGI+vZbPMnJi+hWYd14KZ/n2h0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hiap4rHkuMJxKmlAF3gwBnVIb92yjEZEeYnQGzqnYC7rgB0L0dfPQ16UBh+2l1nldQb9TX6+h0z72/vi0r3UYwkVgkxtH8xlSUNMUVXJziI6nnS3Eg1fjk7vZE+XI0ukK5YOzJTV3F4IOa0dGFfxkLG0sA5YnyNwBCQGzJqtYPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=VTNC0mEc; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="VTNC0mEc"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47231f1f8f3so765828f8f.1
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 05:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782909657; x=1783514457; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rLSqKzoS0MDBgH85oxBP3pDE47WSrruOac4uchD3dFY=;
        b=VTNC0mEc5WuzqV6yOzIgEjZZGOnjXsGXBvRmVkVhYvLG4k41WjsBh4rM7dZBjj0nPv
         EHqddxyegfUPddkSOPOw5+GKk2lKvpIcX3IT7JVWA22lzHuWb/zUTxH9ulGf61cybkEA
         t4AYOsXDv2213Tr0V1+5wxqGuNXFeSu5OkDy44/VurCQCTK5o5ZUChX+hKk7RdLsIGDH
         n0V+5oomjt8eFb3gOk4eXadFLz8gEMf00DKtNIxKqTNwFzf8UVd9ISoBJdj/84OT2FBs
         /TxUWJtKoo1jIgC4b9aINp/jTfgCi9UhUm2RLv3hhy/RKjrC19D/10FjJcUHm8F++ETR
         n0lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782909657; x=1783514457;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rLSqKzoS0MDBgH85oxBP3pDE47WSrruOac4uchD3dFY=;
        b=K2I8aQTpAOH76hIm9Hyija5HTbtdj3o403RAXRb6c+sJe848bRdc0LZ3zznp20NW+g
         XgZs+kYDQI8ksfgjyLnHDNjJ9YrCrkBuJ1w4B8/1aJyqhr+xEAQaZr9+6yK3Tg2oL6wN
         vGzQDXQ8i8N1JyV5ACJ7JguaGdwcsPaKrVMMrpJMGOHYrD5vGYe7NsUrJ8oFQklVoltI
         /Tz7U8Pv0lx5ByWGv9TYjq2DFmwliTv0s5jNAO8CQaQHxWmlYyI3cMGF+xv3k/OUhv8A
         WUbYJmOk6Mwe21Qg31fYNvhMemUdFvAwGn8JR2+FgwqX+PNhPJJpf1hzAirvdv57iJmf
         qG1g==
X-Forwarded-Encrypted: i=1; AHgh+Rp6qCP9eBepDyh37lcrgOy73V6Xs7wY23UcUkZN2TZAy3AcZyB+F/wDhgpJl+GH76Cz1zipEXkCz2rd@vger.kernel.org
X-Gm-Message-State: AOJu0YyFq1Z7Bc8CqIbHnXwBIrQn1hP74wnKq01iK1MtyP7bo3EbqUqz
	uNogpJbO82OeEHO1dKjjJCPtPAX1NJalNZdf7LM6b8VUdPgoDut9SeCB0XzlORxwl5U=
X-Gm-Gg: AfdE7cl9A/rRXr7UEoc92eLG2a/J5TftZh3J2vNNQ+glH3rPQnLyctR/aE/pyCPttPF
	q4kp+M5PhxOVKqUcKwyZ0nunxKa9xjmILhuqwqE/ZtV8hVjQOX28MaGayAnUb6VpFggjPxEEpnR
	bFnsD7S3NF5Q2DCK5uD7vrvxSGL/YNnumPyLncNCLvZ39ounjzmz1MDaLH6G32fKHsdfQyKfX1Q
	9bv9TwoOkNZDrT5qdLPP8w1QL5pWSOZ8mj4casP6/7DFklQDYdbNCvbzQEqb0gW1+teawn3Xl77
	/QNE92o2fkihYwdPz0G6N8U58FFDLx23rwR41l8ujPLk0qql1MPT4ziOv9oSzi51Oc8V2THHz8j
	pFrsd2mHEruSPN74Uiyc2QXdX+9NOlCrt06JSwjq7OPWtbq1zzG8GItkToqGTEO+COWcFLWRVyq
	CZ27GvvNY4Kw==
X-Received: by 2002:a05:600c:9a3:b0:492:4723:166b with SMTP id 5b1f17b1804b1-493c3cd70e6mr5739425e9.13.1782909656935;
        Wed, 01 Jul 2026 05:40:56 -0700 (PDT)
Received: from localhost ([2001:4090:a246:8638:a73d:f626:6582:90ca])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-476792758aasm9625656f8f.11.2026.07.01.05.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 05:40:56 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Wed, 01 Jul 2026 14:39:19 +0200
Subject: [PATCH v7 07/11] arm64: dts: ti: k3-am62a-ti-ipc-firmware: Move
 wkup reserved memory
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-topic-am62a-ioddr-dt-v6-19-v7-7-e9db8b16821a@baylibre.com>
References: <20260701-topic-am62a-ioddr-dt-v6-19-v7-0-e9db8b16821a@baylibre.com>
In-Reply-To: <20260701-topic-am62a-ioddr-dt-v6-19-v7-0-e9db8b16821a@baylibre.com>
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
 h=from:subject:message-id; bh=hhLOVviNovSyV3jCQbGI+vZbPMnJi+hWYd14KZ/n2h0=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhixXrhWm1kv4d5+ckVewTliyr9Fg9vXEV3fK1xy0ZTL9l
 GK/xtOho5SFQYyLQVZMkaUzMTTtv/zOY8mLlm2GmcPKBDKEgYtTACZyby7Df8dz2WfUzl/41pXL
 8mPfjyPqRjUnOV/xnVQPbYvnfMBWPYHhn6FlChPbfNGHPWsfJ25ZlvHw0E754+nxfk2OfkcXzTI
 6ww0A
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
index 08c73cae26c73993a613372110bfd5611c403846..27801c22a550330b52c4424f919d80f10dc76403 100644
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

