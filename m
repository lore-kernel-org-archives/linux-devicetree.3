Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9243A1A4C;
	Mon, 20 Apr 2026 13:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776691109; cv=none; b=ObbfEA2nElXy5MiJfm65MfYO3EsPYHtxM7P+B+V/y8ZGRNHGk6puLA/lQ49ZvbOa94UBTqGDKJcFc/dtr88yot73l+ltg+vjXaWLMOrvt5w12NYWMv9sikm2dU9zIkfiz+KO+IguBkLzQ25kF0GpIOlYOyEzx+7O8pMJZnolXjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776691109; c=relaxed/simple;
	bh=+6OHH0Gd4uiBxNx0PSacW6RuCgkwWTHAJNw7dL+NAw8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=hBePyD4d/1e7E6y7UAx4XirbnaPi5NpSOMOIJv6vdhSAa9ZQXqtinyAQfEsRXB1ln/LKhnLVOBE3Td2w1ePnoPdSkdl49qgflEkCyioVFzKO6419FZeGjHjfv5KvmNyrCvrKj1KfIHgqjM9W48aPXuiXfKsWpiCn0fM81IrPetc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=TUiouOoP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="TUiouOoP"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c30:51df:7e0d:3bc9:3b1b:3f69])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6D240265D;
	Mon, 20 Apr 2026 15:16:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1776691008;
	bh=+6OHH0Gd4uiBxNx0PSacW6RuCgkwWTHAJNw7dL+NAw8=;
	h=From:Date:Subject:To:Cc:From;
	b=TUiouOoPo5hjHO9uv6a6+NSyGpv/HoIZfZHmrRKShef+pfUoCGdnbwR+cN1uLXKO0
	 KaWjoLp0YnqnvyjtkSPz+T9klp0RE2o4OvHjUY7d1N+gBdCFeAdlio0Owbsb7O4qYw
	 or4lXpKoo02wd+HF0pTfU5Us1P/hg7ZOSBnZfDAM=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 20 Apr 2026 18:48:07 +0530
Subject: [PATCH] riscv: dts: starfive: jh7110: Drop CAMSS node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-starfive_camss_use-v1-1-ec326af71ca7@ideasonboard.com>
X-B4-Tracking: v=1; b=H4sIAI4n5mkC/x3MSwqAMAwA0atI1hZqKopeRaSEGjULPzQqgnh3i
 8u3mHlAOQortNkDkS9R2daEIs8gzLRObGRIBrRY2RKt0YPiKBf7QIuqP5VNTYhNcM5yXUAK98i
 j3P+069/3A0OgqbpkAAAA
X-Change-ID: 20260420-starfive_camss_use-7a229c330e71
To: Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley <conor@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Changhuang Liang <changhuang.liang@starfivetech.com>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3894;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=+6OHH0Gd4uiBxNx0PSacW6RuCgkwWTHAJNw7dL+NAw8=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBp5ieTyo0wnR5PToFo2X9uWTkR61KPZaneY8JpT
 VLjEsIcVguJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaeYnkwAKCRBD3pH5JJpx
 RXL2D/9KHWDEvRkzU/H+4yYw6ECIGe/d8R0V26PQP5NKu/zMIrJCYRp2+jxryo4qid5gMJiy0hx
 njUJep9xtT+9n8jO6O67K6LYxQLhrcJpkaEi5ZVLvmWThQqWVJC9cX/WSwmrqeghsuDi3nh2+lN
 VZEBxRT3l3dhq0XCRj2J5ZxwjT2TjZj/AKiQbaEBgR2K64jZ13HG3mn9a1G7NAbDP4fXDjTqfUZ
 h3E6iymWDKWFtW7ckxupOev6UvPlH+5ZM9EeydBrbCK4wmom/akBUPZb+XZi5Dg4LwQhNQ3je6s
 Q8DR/C8PAbK5wEwj9WQmfUfoFAhJjng3i+lmRL82EKz4wwX3oStd8nZJmBmN1/Vu5jKLyt1XfZP
 RV3Xl78L1Ic1wMha9pM1KZTLqRueRIHgh0Rh5RBDb9Gnb8rU6S1yFES50T4Aj77C+Jq2zVGV4nf
 AX0vYlufoxxAj7GbPN1OPIB4+82Kt5meLmgOVfLW3v/S0DKj7yv9nh7bn6zmNiAJHi71wgPGBo3
 91yv7vMtjZmPXBygqoINpegjBMxyXGTjuckDNpJZIwzq0OnvPev+xCiFdGaQIzN/8y6ZlM0Wfiz
 uib6YizHKsRP5nuEQeHeIxQK8RWKTfpBOPW5xZkHfW0wbNBEKQ2U+jflK/aUiAM32yCR9tY+owK
 27yJnG1ENcAkyEQ==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

The starfive-camss driver and bindings were dropped, as they were no
longer being worked upon for destaging.

Drop the relevant node as well to avoid the following build warning:
"failed to match any schema with compatible: ['starfive,jh7110-camss']"

Fixes: 644673fc8fb04 ("media: dt-bindings: Drop starfive,jh7110-camss from staging")
Reported-by: Conor Dooley <conor@kernel.org>
Closes: https://lore.kernel.org/all/20260420-very-cartel-645595ffd1c7@spud/
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
Ideally this patch should have gone in the original series, before the
one that dropped the bindings which is now merged in mainline.

I've added a Fixes tag so it gets picked in the RC cycles for 7.1.
---
 arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 27 +-----------------------
 arch/riscv/boot/dts/starfive/jh7110.dtsi        | 28 -------------------------
 2 files changed, 1 insertion(+), 54 deletions(-)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
index 8cfe8033305d80cbe6179ed26601ca057ee00f16..a7a1c09a2c9075711f3a214a49618911fdc7b421 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
@@ -135,29 +135,6 @@ &tdm_ext {
 	clock-frequency = <49152000>;
 };
 
-&camss {
-	assigned-clocks = <&ispcrg JH7110_ISPCLK_DOM4_APB_FUNC>,
-			  <&ispcrg JH7110_ISPCLK_MIPI_RX0_PXL>;
-	assigned-clock-rates = <49500000>, <198000000>;
-
-	ports {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		port@0 {
-			reg = <0>;
-		};
-
-		port@1 {
-			reg = <1>;
-
-			camss_from_csi2rx: endpoint {
-				remote-endpoint = <&csi2rx_to_camss>;
-			};
-		};
-	};
-};
-
 &csi2rx {
 	assigned-clocks = <&ispcrg JH7110_ISPCLK_VIN_SYS>;
 	assigned-clock-rates = <297000000>;
@@ -175,9 +152,7 @@ port@0 {
 		port@1 {
 			reg = <1>;
 
-			csi2rx_to_camss: endpoint {
-				remote-endpoint = <&camss_from_csi2rx>;
-			};
+			/* remote CAMSS endpoint */
 		};
 	};
 };
diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
index 6e56e9d20bb064e86b57a92d4cb05be330cca01a..9c3e4598747eb5541effe697044484715569a285 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -1199,34 +1199,6 @@ csi_phy: phy@19820000 {
 			#phy-cells = <0>;
 		};
 
-		camss: isp@19840000 {
-			compatible = "starfive,jh7110-camss";
-			reg = <0x0 0x19840000 0x0 0x10000>,
-			      <0x0 0x19870000 0x0 0x30000>;
-			reg-names = "syscon", "isp";
-			clocks = <&ispcrg JH7110_ISPCLK_DOM4_APB_FUNC>,
-				 <&ispcrg JH7110_ISPCLK_ISPV2_TOP_WRAPPER_C>,
-				 <&ispcrg JH7110_ISPCLK_DVP_INV>,
-				 <&ispcrg JH7110_ISPCLK_VIN_P_AXI_WR>,
-				 <&ispcrg JH7110_ISPCLK_MIPI_RX0_PXL>,
-				 <&syscrg JH7110_SYSCLK_ISP_TOP_CORE>,
-				 <&syscrg JH7110_SYSCLK_ISP_TOP_AXI>;
-			clock-names = "apb_func", "wrapper_clk_c", "dvp_inv",
-				      "axiwr", "mipi_rx0_pxl", "ispcore_2x",
-				      "isp_axi";
-			resets = <&ispcrg JH7110_ISPRST_ISPV2_TOP_WRAPPER_P>,
-				 <&ispcrg JH7110_ISPRST_ISPV2_TOP_WRAPPER_C>,
-				 <&ispcrg JH7110_ISPRST_VIN_P_AXI_RD>,
-				 <&ispcrg JH7110_ISPRST_VIN_P_AXI_WR>,
-				 <&syscrg JH7110_SYSRST_ISP_TOP>,
-				 <&syscrg JH7110_SYSRST_ISP_TOP_AXI>;
-			reset-names = "wrapper_p", "wrapper_c", "axird",
-				      "axiwr", "isp_top_n", "isp_top_axi";
-			power-domains = <&pwrc JH7110_PD_ISP>;
-			interrupts = <92>, <87>, <90>, <88>;
-			status = "disabled";
-		};
-
 		voutcrg: clock-controller@295c0000 {
 			compatible = "starfive,jh7110-voutcrg";
 			reg = <0x0 0x295c0000 0x0 0x10000>;

---
base-commit: c1f49dea2b8f335813d3b348fd39117fb8efb428
change-id: 20260420-starfive_camss_use-7a229c330e71

Best regards,
-- 
Jai Luthra <jai.luthra@ideasonboard.com>

