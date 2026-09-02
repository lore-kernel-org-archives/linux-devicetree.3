Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D880E415F2E
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 09:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788341191; cv=none; b=HfF0z7MAIl0jApb1B2iFe9NHUNOqmLZwee3OXihtDlSwJmPm0v1HqGbLiF0vlW+LyQKjnC0Wf380zdTf15Ow3ZCeMjNj9+/Lc3TgsbBPeRZAbE+koctJR86l33jfK1hBVncU9yAZh4ctoHubHN3OJ3RfUsv3tjgB6OP2FeHxooA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788341191; c=relaxed/simple;
	bh=pY1JqyzrPr013Y1kqSA+7Vh32zLYtekhef75wkehhKk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lFiwqvAXfy+SzFN1bjOVrxMWoaRY/TqREYpffxIlJFq2ZoYy19rCMvxmzE6uAun6t7EVL8DRAnDXlyU/4QROkqfAvyOBeyoLIs59fRCYqlEXOgetWe/E/TaC85Cu5/2A6R2BVEJxOKMQAN+FbgFsRUhBo8IQRf8M1jtvUVLqijw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hNgmf2+u; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hNgmf2+u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E17CD1F00A3A;
	Wed,  2 Sep 2026 09:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788341189;
	bh=WR1sIUUvBo/P4zSmt+iIqCMFTNd/oDKjyS5EUPu6MV4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hNgmf2+urU3fdW5VLOoe5DDGsJy8db2ppN+mrcj5z1jrlfX1MBTt6aZJ9ja7gLFET
	 cByzDezuwzH1+19YhEf5iZ7YyVuPzFh0/8N39WNVT6JBt0ie9O66U8Z6uRKcWb3e4x
	 FXyGz9gyMnujo76HRoySI3NkdVEqB0DKfWEapdhH/eFyM4WNDmxXBXr0hDc6sNrchu
	 aGojc8fSkII/pmv7SUkXZPRbSkXC9C45KoQKVmC1fYx6Ch2nT8Wmd+BQPqpfg9DW15
	 cmodbdHzObShx9+CwUBQlD8a5lULLmuoZTXqTMuFDD3dNw3he6E992lhhAfug/I4Mu
	 lAyTMKahysg3Q==
From: Dinh Nguyen <dinguyen@kernel.org>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dinguyen@kernel.org,
	devicetree@vger.kernel.org,
	rounakdas2025@gmail.com
Subject: [RFC PATCH 2/2] arm64: dts: socfpga: agilex5: add support for the ECC manager
Date: Wed,  2 Sep 2026 04:25:51 -0500
Message-ID: <20260902092551.488203-3-dinguyen@kernel.org>
X-Mailer: git-send-email 2.42.0.411.g813d9a9188
In-Reply-To: <20260902092551.488203-1-dinguyen@kernel.org>
References: <20260902092551.488203-1-dinguyen@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the EDAC device to the base Agilex5 platform. Add OCRAM and Ethernet ECC
device support to the Agilex5 platform.

Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
v2: move eccmgr out of soc node
    s/38/36 for emac0-rx
---
 .../arm64/boot/dts/intel/socfpga_agilex5.dtsi | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
index b06c6d5d60eed..64e8bffd69df7 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
@@ -149,6 +149,75 @@ qspi_clk: qspi-clk {
 		};
 	};
 
+	eccmgr {
+		compatible = "altr,socfpga-agilex5-ecc-manager",
+			     "altr,socfpga-a10-ecc-manager";
+		altr,sysmgr-syscon = <&sysmgr>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		interrupt-parent = <&intc>;
+		interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 241 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 95 IRQ_TYPE_EDGE_RISING>,
+			     <GIC_SPI 120 IRQ_TYPE_EDGE_RISING>,
+			     <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "global_sbe", "global_dbe", "io96b0" , "io96b1",
+				  "sdm_qspi_sbe", "sdm_qspi_dbe", "sdm_seu";
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		ranges = <0 0 0 0xffffffff>;
+
+		ocram-ecc@108cc000 {
+			compatible = "altr,socfpga-a10-ocram-ecc";
+			reg = <0x108cc000 0x100>;
+			interrupts = <1 IRQ_TYPE_LEVEL_HIGH>, <33 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		emac0-rx-ecc@108c0000 {
+			compatible = "altr,socfpga-eth-mac-ecc";
+			reg = <0x108c0000 0x100>;
+			altr,ecc-parent = <&gmac0>;
+			interrupts = <4 IRQ_TYPE_LEVEL_HIGH>, <36 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		emac0-tx-ecc@108c0400 {
+			compatible = "altr,socfpga-eth-mac-ecc";
+			reg = <0x108c0400 0x100>;
+			altr,ecc-parent = <&gmac0>;
+			interrupts = <5 IRQ_TYPE_LEVEL_HIGH>, <37 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		emac1-rx-ecc@108c0800 {
+			compatible = "altr,socfpga-eth-mac-ecc";
+			reg = <0x108c0800 0x100>;
+			altr,ecc-parent = <&gmac1>;
+			interrupts = <6 IRQ_TYPE_LEVEL_HIGH>, <38 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		emac1-tx-ecc@108c0c00 {
+			compatible = "altr,socfpga-eth-mac-ecc";
+			reg = <0x108c0c00 0x100>;
+			altr,ecc-parent = <&gmac1>;
+			interrupts = <7 IRQ_TYPE_LEVEL_HIGH>, <39 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		emac2-rx-ecc@108c1000 {
+			compatible = "altr,socfpga-eth-mac-ecc";
+			reg = <0x108c1000 0x100>;
+			altr,ecc-parent = <&gmac2>;
+			interrupts = <8 IRQ_TYPE_LEVEL_HIGH>, <40 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		emac2-tx-ecc@108c1400 {
+			compatible = "altr,socfpga-eth-mac-ecc";
+			reg = <0x108c1400 0x100>;
+			altr,ecc-parent = <&gmac2>;
+			interrupts = <9 IRQ_TYPE_LEVEL_HIGH>, <41 IRQ_TYPE_LEVEL_HIGH>;
+		};
+	};
+
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupt-parent = <&intc>;
-- 
2.42.0.411.g813d9a9188

