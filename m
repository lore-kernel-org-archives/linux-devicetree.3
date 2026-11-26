Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795653469;
	b=V09w/5++HmjULwv4YgMIQ2rFUYB13KMY3EIff4nSCutVMMp8Ka/RRmkDRzjZuTWfLvGg
	 0Kw/ir1mEeKt+valcLwbHt6mA2mT3nP5wuI59717PrMPUHaqG9G4tK2JsE1Q5Um4GyYkL
	 bs0MXsToqHj6yM/+mmYzxgbX3idlIm+MLhKzpGr5a/1Erys5RqxI1Nn/HdMCrCrtLTI9m
	 uyj7x8jGr5jp+DVPaKjVMGxh8A/XHIGkHMXF+3v3PRxfbKttC+9eebdodb08w/PVCO48u
	 JuK/WmU8afOEfOxXVvver1vII8zOE3lO4KQpGbptg+aPGTQFnXoVCeEYtSYea0teIlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795653469;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=YA+5eXzAu39dXCnzS9V3VNc/CsEscIPke2TJ0P7uJzs=;
	b=D7zNJKjMLNQ6cjpxtEkozS/EnlMIJJ4JC6yU4Ka1kEpgivJs985QJTUZHGeqxjkyzsRc
	 tSteCN7K8IFOrEr+Cm/pToXddk0w3+6/pagPhGUwJZBExQXnkT08b8ZWD4QoHNn9xwpOI
	 0SKShlHayzCXHO/Iva18uUS0TD34iyOfkZzMLwVhUvFU9tI1g5rtknut2G9N7m0ApJc9s
	 UsXLwF9PTsFjb9ASaqLVPEYaKW4KerUESRp1qomoYPkCKbWenBO4K1qCNWNnkDNjn46rk
	 W/hljHMIMr5LifpaIx/EHhHK05y4dXL4WanQRmdW1DmDz90pw2d/ip/dgGydGdcsxUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iZPP+QD0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5785606A31E
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 00:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iZPP+QD0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2267B1F000D4;
	Thu, 26 Nov 2026 00:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795653469;
	bh=YA+5eXzAu39dXCnzS9V3VNc/CsEscIPke2TJ0P7uJzs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=iZPP+QD0LaNy8bzxpQWq1e0jm3NLT9wrjFAhkgDubnN2/oOmHsLU0oNDmcQ5rYrDV
	 JUcBbxy1d7KTOANqIRv8oU0ynt9Fq/wfn77zz3J8Yd58xoYLQo/1XqqEXBiZTeSZB6
	 zDXOWMBalzuhmb2AIUzpg/GSNWAANNO5ClqA1LLHXJL6zgxl/0/pJ0h2PxSxvrvYuP
	 /3+17ET3x6dDVTQKXaAan6A0S/PTYnHD6e8ZDy90t/DWBIHRNlx8PFeP5LZoEUBd57
	 VAiESILiXMhjWsC8mXUw3UCijGzhp61UREoCf09ywlqGCV2rnFsyZqpagCPxGtoE5c
	 ha69TkdijBKZQ==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 26 Nov 2026 01:37:23 +0100
Subject: [PATCH 19/20] ARM: dts: ux500: Move addressless devices out of the
 simple bus
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-ux500-dts-after-powerdomains-v1-19-791cd62d8870@kernel.org>
References: <20261126-ux500-dts-after-powerdomains-v1-0-791cd62d8870@kernel.org>
In-Reply-To: <20261126-ux500-dts-after-powerdomains-v1-0-791cd62d8870@kernel.org>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
X-Mailer: b4 0.16.0

The PMU, power-domain provider and static CoreSight replicator have
no register resources. Move them to the root, preserving the PMU
interrupt parent and the existing power-domain links.

Fixes: b557457f638b ("ARM: ux500: add CoreSight blocks to DTS file")
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/boot/dts/st/ste-dbx5x0.dtsi | 111 ++++++++++++++++++-----------------
 1 file changed, 56 insertions(+), 55 deletions(-)

diff --git a/arch/arm/boot/dts/st/ste-dbx5x0.dtsi b/arch/arm/boot/dts/st/ste-dbx5x0.dtsi
index 05d91367a38a..1770828a1d69 100644
--- a/arch/arm/boot/dts/st/ste-dbx5x0.dtsi
+++ b/arch/arm/boot/dts/st/ste-dbx5x0.dtsi
@@ -115,6 +115,62 @@ pinctrl: pinctrl {
 		prcm = <&prcmu>;
 	};
 
+	pmu {
+		compatible = "arm,cortex-a9-pmu";
+		interrupt-parent = <&intc>;
+		interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	pm_domains: power-controller {
+		compatible = "stericsson,ux500-pm-domains";
+		#power-domain-cells = <1>;
+		power-domains = <&pm_domains DOMAIN_VAPE>,
+				<&pm_domains DOMAIN_VAPE>,
+				<&pm_domains DOMAIN_VAPE>,
+				<&pm_domains DOMAIN_VAPE>,
+				<&pm_domains DOMAIN_VAPE>,
+				<&pm_domains DOMAIN_VAPE>;
+		power-domains-child-ids = <DOMAIN_SVA_MMDSP>,
+					 <DOMAIN_SVA_PIPE>,
+					 <DOMAIN_SIA_MMDSP>,
+					 <DOMAIN_SIA_PIPE>,
+					 <DOMAIN_SGA>,
+					 <DOMAIN_B2R2_MCDE>;
+	};
+
+	replicator {
+		compatible = "arm,coresight-static-replicator";
+		clocks = <&prcmu_clk PRCMU_APEATCLK>;
+		clock-names = "atclk";
+		power-domains = <&pm_domains DOMAIN_VARM>;
+
+		out-ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				replicator_out_port0: endpoint {
+					remote-endpoint = <&tpiu_in_port>;
+				};
+			};
+			port@1 {
+				reg = <1>;
+				replicator_out_port1: endpoint {
+					remote-endpoint = <&etb_in_port>;
+				};
+			};
+		};
+
+		in-ports {
+			port {
+				replicator_in_port0: endpoint {
+					remote-endpoint = <&funnel_out_port>;
+				};
+			};
+		};
+	};
+
 	soc {
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -259,39 +315,6 @@ funnel_in_port1: endpoint {
 			};
 		};
 
-		replicator {
-			compatible = "arm,coresight-static-replicator";
-			clocks = <&prcmu_clk PRCMU_APEATCLK>;
-			clock-names = "atclk";
-			power-domains = <&pm_domains DOMAIN_VARM>;
-
-			out-ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				port@0 {
-					reg = <0>;
-					replicator_out_port0: endpoint {
-						remote-endpoint = <&tpiu_in_port>;
-					};
-				};
-				port@1 {
-					reg = <1>;
-					replicator_out_port1: endpoint {
-						remote-endpoint = <&etb_in_port>;
-					};
-				};
-			};
-
-			in-ports {
-				port {
-					replicator_in_port0: endpoint {
-						remote-endpoint = <&funnel_out_port>;
-					};
-				};
-			};
-		};
-
 		tpiu@80190000 {
 			compatible = "arm,coresight-tpiu", "arm,primecell";
 			reg = <0x80190000 0x1000>;
@@ -357,28 +380,6 @@ L2: cache-controller@a0412000 {
 			cache-level = <2>;
 		};
 
-		pmu {
-			compatible = "arm,cortex-a9-pmu";
-			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
-		};
-
-		pm_domains: power-controller {
-			compatible = "stericsson,ux500-pm-domains";
-			#power-domain-cells = <1>;
-			power-domains = <&pm_domains DOMAIN_VAPE>,
-					<&pm_domains DOMAIN_VAPE>,
-					<&pm_domains DOMAIN_VAPE>,
-					<&pm_domains DOMAIN_VAPE>,
-					<&pm_domains DOMAIN_VAPE>,
-					<&pm_domains DOMAIN_VAPE>;
-			power-domains-child-ids = <DOMAIN_SVA_MMDSP>,
-						 <DOMAIN_SVA_PIPE>,
-						 <DOMAIN_SIA_MMDSP>,
-						 <DOMAIN_SIA_PIPE>,
-						 <DOMAIN_SGA>,
-						 <DOMAIN_B2R2_MCDE>;
-		};
-
 		clocks@8012f000 {
 			compatible = "stericsson,u8500-clks";
 			/*

-- 
2.56.1

