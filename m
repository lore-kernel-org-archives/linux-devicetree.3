Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1787B42668E
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 15:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779894773; cv=none; b=XKZGHvNWBF3eqD12/cebdnPeicsc5kuSMn3DOqyDvLmkvFObXEH9BsgV36BsifrKprL11noT44TNogZqvVueYWJ7r5y1Dq2rktxaaLW7ILY3vyCQQ/EzTUdhk4b15cqWC0IPKTO3Gv8qMIJF5y76zjSewZ88HUZ25majEo6oFLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779894773; c=relaxed/simple;
	bh=ljNqmkT5Nj3SfGAv3trp69sk/AmsPJkjscqXWPMbyAE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZOaMdIyQr2Efdvj/KO97W8rOsm8nXC2E5GTKuABVVnkTbOdjhi5znk/93M4IbTFJ+A2Ii9d4h5x9QcBeOGvpFs3Vv5322d2ZBRkRa/DLFQCCIHajJzDoDXthTTYkBoX7h3EQM6fH4w0igYErGDHPnID+ZeKSR1pfZCwaWLrHF4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NPev1eHt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NPev1eHt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F9541F000E9;
	Wed, 27 May 2026 15:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779894771;
	bh=T0i899Hwpq4z86EybCcebLYZOqbTdxLUOzrnGh+Rxyk=;
	h=From:To:Cc:Subject:Date;
	b=NPev1eHtWAf8aydzynf/xacwDmlP2ou9GlQ/WPsfNf3720fRV5AHUkFofYz8hulNY
	 miIK/s4I3256ybCJC9SHaQlTKKzkTBdw8t8vA07aFtl0ZrvimW755Bn9SyPeBN6oR5
	 Uni2EKzOtIqbbavceSYA28wHRC2r9Saz0xYWYKwBzFaWascGQT1lJwkw1jTZjSigD/
	 z1Of2dPTSwQ/vHi7Peh453Wmz37I+Hy41dRSaqAvz7BBXOhIvCOuvbEFeF0oTJImtS
	 I7kBbB+cVoLfLauQxiCuRLOdYkL5/2LHeTdwU0I2jCxbDjZORRIqFrkBE4guZmHv/X
	 XOd0UBU0p141g==
From: Dinh Nguyen <dinguyen@kernel.org>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dinguyen@kernel.org,
	adrian.ho.yin.ng@altera.com,
	devicetree@vger.kernel.org
Subject: [PATCH] arm64: dts: socfpga: agilex5: popuplate reset property for I3C and NAND
Date: Wed, 27 May 2026 10:12:39 -0500
Message-ID: <20260527151239.55650-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.42.0.411.g813d9a9188
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The I3C and NAND nodes are missing the reset property that is needed to
bring the IP out of reset.

Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
 arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
index b06c6d5d60eed..7d7b3b4706cb5 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
@@ -244,6 +244,7 @@ i3c0: i3c@10da0000 {
 			reg = <0x10da0000 0x1000>;
 			#address-cells = <3>;
 			#size-cells = <0>;
+			resets = <&rst I3C0_RESET>;
 			interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clkmgr AGILEX5_L4_MP_CLK>;
 			status = "disabled";
@@ -255,6 +256,7 @@ i3c1: i3c@10da1000 {
 			reg = <0x10da1000 0x1000>;
 			#address-cells = <3>;
 			#size-cells = <0>;
+			resets = <&rst I3C1_RESET>;
 			interrupts = <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clkmgr AGILEX5_L4_MP_CLK>;
 			status = "disabled";
@@ -313,6 +315,7 @@ nand: nand-controller@10b80000 {
 			cdns,board-delay-ps = <4830>;
 			iommus = <&smmu 4>;
 			dma-coherent;
+			resets = <&rst NAND_RESET>;
 			status = "disabled";
 		};
 
-- 
2.42.0.411.g813d9a9188

