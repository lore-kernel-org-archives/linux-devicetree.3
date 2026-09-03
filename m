Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2DEE4A64F1
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 12:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788439249; cv=none; b=pxHpHfEX0mUXzSm+XBEgEhbEdiD8LuEeJmxEma7POlgHvtOpTU0+9hIv3nTNxQ+sWe1x2LyhyAwcFRqHx/mkfr4mWwHAfb3BC4y7BgzOIx2Ir3QwGwEo0g8cEb+BtY8M+2Q32dw1ZQzIhL2lNhwGYFy/xxVhnmhmJNhh0taIlmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788439249; c=relaxed/simple;
	bh=DH50lV/dqbquT6Sm3x8Cg+FWHILrsd8o5PxQFy+G9AY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sw5DMmHGFFwXiEUf+C5p+VVxsXnxRbhLiJ2edACtzUxQRuByAEs+oS5vdETNgwlJuxv69HWOlORNDiVwz2M3NxPmdzpuwbUq/3cWVDoKaSZ/O1HdRkg80RL0UdgbKj17LpsH/pKA6oDsRQ7D03wlpQX9rMnqoJZTr1MmbeJNruo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=O7SAZ813; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="O7SAZ813"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49b9320423cso23296635e9.0
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 05:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788439245; x=1789044045; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TLTaF4F3F/RF0AsKabQCWTXBlZKCu3a7EnZSO2FPDV4=;
        b=O7SAZ813EWlgAFePqlDBZjq4VtPTW4rT1DjDJKvP/6EOWjTEWByVycFG736Fi9LLDt
         Fj6STNNsp7vacmbT8xH6JsNORTz94/zEJVSVzPnqsmfvkoJk2q3NCKIK1aS9RWFEYYYg
         NHyeQ6AhbdK0CDQO1ITrniWTr+Lc2ntaPBgKCYrliM3LD2D0WcjYQ/HUUNnG2IHnfkJx
         kugusxDIYJVhRAvhwfraGoUjQEjCnVf7SUc/lSR5e8YPAKraNZdEY2dui6mCX0Ksseer
         GmdaLpUpK1SUFDUB1/Os3ZkLlBQKKT/owd0hz2LIvyx+LLqulxdbRyWstrBFTa2HAyBV
         Fh+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788439245; x=1789044045;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TLTaF4F3F/RF0AsKabQCWTXBlZKCu3a7EnZSO2FPDV4=;
        b=hO62wIg7cY6gy2rJmAkMcDCpAgMAaEr4M4BFaj6gv7ij3FbljLbHlU8QrIenK5/KMK
         YokgCTJia2t5kVbrL8TV0zKrYzAB03PDFBu0pTABTCUSt6AMI68Gfz3WJqgOxOMGHeCt
         +2TZhIicPzW1v6ir5NdIG0+sfk1L9C5QRnVv/CXlkKKOw7YxiqgDTr3K+RQkztOdFgbC
         2bNvKMSrYy/dHe0k30jK7PmphNSp/jLOyKSqTyj63YzSeZ3P6WsPPTpcrniYR1+kQ606
         4NMtMMSG4/UWQgy1AJiUQ+k73UkHM29dJkWNk6ZmzX8QfpC8f/t0r2Iok1I1FQaoswww
         G33Q==
X-Forwarded-Encrypted: i=1; AKwUvBzNL/eVXFlRx5RbND3GwLQ6boI8RARxJssdhGQBvPGcNAbhzt6JBlDCCDgy9hz/3vMoWqDlMYD7YHjR@vger.kernel.org
X-Gm-Message-State: AFuF++nS/q9/O65L02GkDcOp9LahzCAG5t6R1JNBqPdBz/0+aEMLZiPF
	ZfwqFNPEB39BSVhXdaj+PCQa3I8+4iso7AaLHYG01F2lTfSsLOsgsrO7pboR9YWjXLA=
X-Gm-Gg: AYBFou2y275v3Bqjpa0X0VJ1iZH09NHsV2BspaUAkjEBuqI/qupN1AyNb+hNr7hdCtX
	8ZHY/0LxL3+QMu5ohRBm3lsfZozPvmfEdpjjQPDbzt5I+5gprlBn2wDvjsQXz0A5crRL/0FqxNY
	YTbJTNTnQ8E00b4nmdsd7NW5SAN8KAObMXhrrTHkuHWFYJP/2J9kjQhwIK4kEH8hzDlic8ZZslZ
	mI7Z1NS/o0wA7ymOt2BQubZQE5boWAo2RWJ74OIN53VtPHu2tyWbb7wXI0kyRqdZhQo2FX+AoJy
	xenTOZrwsEXIvslFJowNSOf02tkb/b0AoG8ohCLx1fTUBxUKWr+VK/cLRnoyJHALA/9QZy6pWn3
	E3yAEsHFtBV9d/TVg47X19CBYCFeEipXGeHefatQ15ZJzUvz0tGVMVqg6kX19DqJE/0OweU/ORW
	FsFZeHuspsewRBEDMIDp1E8oplDTmaem4ucX0PSCSCvvpv6ejJjdYHlUmDqOWRSS9zsGw/mlunc
	uVyAnY1
X-Received: by 2002:a05:600c:5306:b0:49c:c9ac:a4f3 with SMTP id 5b1f17b1804b1-49ce5810b6amr242693105e9.1.1788439244839;
        Thu, 03 Sep 2026 05:40:44 -0700 (PDT)
Received: from localhost ([2001:4090:a244:80d4:4373:6c2f:4372:b8ac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce7ac52c3sm92330065e9.4.2026.09.03.05.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 05:40:44 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Thu, 03 Sep 2026 14:39:28 +0200
Subject: [PATCH v8 7/9] arm64: dts: ti: k3-am62a: Split r5f memory region
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-topic-am62a-ioddr-dt-v6-19-v8-7-74c650dfdea6@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5457; i=msp@baylibre.com;
 h=from:subject:message-id; bh=DH50lV/dqbquT6Sm3x8Cg+FWHILrsd8o5PxQFy+G9AY=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhqyZWZuc1pYm/wh9XdQbysHzl1/QI/r4LH/h9x1sETXvx
 SVnblnTUcrCIMbFICumyNKZGJr2X37nseRFyzbDzGFlAhnCwMUpABPZ843hD+/0hS/OB+lNshTa
 /fWx0kKveLFnTjsqXzNN39Txeo2vkTrDL+b+NbMlfC2eT23h+Zl4RjG1r2iDxi2m/AOsc85+37c
 ujRUA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

Split the firmware memory region in more specific parts so it is better
described where to find which information. Specifically the LPM metadata
region is important as bootloader software like U-Boot has to know where
that data is to be able to read that data.

Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi   | 28 ++++++++++++++++++++--
 .../boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi      | 10 ++++++--
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts            | 28 ++++++++++++++++++++--
 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts           | 28 ++++++++++++++++++++--
 4 files changed, 86 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
index 53c096da68b5..7fa19ced1a23 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
@@ -65,9 +65,33 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 			no-map;
 		};
 
-		wkup_r5fss0_core0_memory_region: memory@9c900000 {
+		wkup_r5fss0_core0_ipc_region: memory@9c900000 {
 			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0x1e00000>;
+			reg = <0x00 0x9c900000 0x00 0x100000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_lpm_fs_stub_region: memory@9ca00000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9ca00000 0x00 0x8000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_lpm_metadata_region: memory@9ca08000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9ca08000 0x00 0x1000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_lpm_rest_region: memory@9ca09000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9ca09000 0x00 0x97000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_dm_region: memory@9caa0000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9caa0000 0x00 0x1c60000>;
 			no-map;
 		};
 
diff --git a/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
index 06d4e815b167..94c1d60d8d7a 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
@@ -65,8 +65,14 @@ &wkup_r5fss0 {
 &wkup_r5fss0_core0 {
 	mboxes = <&mailbox0_cluster0>, <&mbox_r5_0>;
 	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
-			<&wkup_r5fss0_core0_memory_region>;
-	memory-region-names = "dma", "firmware";
+			<&wkup_r5fss0_core0_ipc_region>,
+			<&wkup_r5fss0_core0_lpm_fs_stub_region>,
+			<&wkup_r5fss0_core0_lpm_metadata_region>,
+			<&wkup_r5fss0_core0_lpm_rest_region>,
+			<&wkup_r5fss0_core0_dm_region>;
+	memory-region-names = "dma", "ipc", "lpm-stub",
+			      "lpm-metadata", "lpm-context",
+			      "dm-firmware";
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
index 6e5419de8e35..871ec227def9 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
@@ -59,9 +59,33 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 			no-map;
 		};
 
-		wkup_r5fss0_core0_memory_region: memory@9c900000 {
+		wkup_r5fss0_core0_ipc_region: memory@9c900000 {
 			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0x1e00000>;
+			reg = <0x00 0x9c900000 0x00 0x100000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_lpm_fs_stub_region: memory@9ca00000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9ca00000 0x00 0x8000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_lpm_metadata_region: memory@9ca08000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9ca08000 0x00 0x1000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_lpm_rest_region: memory@9ca09000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9ca09000 0x00 0x97000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_dm_region: memory@9caa0000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9caa0000 0x00 0x1c60000>;
 			no-map;
 		};
 
diff --git a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
index a8c794d07343..7cba3ff99e6a 100644
--- a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
@@ -65,13 +65,37 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 			no-map;
 		};
 
-		wkup_r5fss0_core0_memory_region: memory@9c900000 {
+		wkup_r5fss0_core0_ipc_region: memory@9c900000 {
 			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0x1e00000>;
+			reg = <0x00 0x9c900000 0x00 0x100000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_lpm_fs_stub_region: memory@9ca00000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9ca00000 0x00 0x8000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_lpm_metadata_region: memory@9ca08000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9ca08000 0x00 0x1000>;
 			no-map;
 			bootph-pre-ram;
 		};
 
+		wkup_r5fss0_core0_lpm_rest_region: memory@9ca09000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9ca09000 0x00 0x97000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_dm_region: memory@9caa0000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9caa0000 0x00 0x1c60000>;
+			no-map;
+		};
+
 		secure_ddr: optee@9e800000 {
 			reg = <0x00 0x9e800000 0x00 0x01800000>; /* for OP-TEE */
 			no-map;

-- 
2.55.0

