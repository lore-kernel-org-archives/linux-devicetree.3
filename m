Received: from mta0.migadu.com (out-39.mta0.migadu.com [91.218.175.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0314483A0
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 11:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787917561; cv=none; b=ox5V63wSDe910NdGRLZ08jpnF7aboVf/2nMd5EOEOM9IeVro5wQI4wxZGv2e+ygmnJkpCdlA/zlDSWSjufUOOeMdL6SkJM96qeTvOKWd+7uejVJOoig4GLhnutJd5w2M8QPPo5lnv65HeuoIYlTJy/ivBWd/uzCiyGAtG7+vmOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787917561; c=relaxed/simple;
	bh=KJSKVfVDA4BnilE2RrZaUQRN55DrOrdNl6twBREZKDE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nkwTTIO8Y83p0kWfY37U1TlOgGTs9Rge+/xacfXraP8MZ4FQwYNZICjYm07A7j74YnLOhzNXwGK+EBZA7Af9jQcq/j7t15rxJqiwYDjIKX4t0la1GUAGIj/MAonwm8KPCAufu7I6Urq7mC5EJl2j+qXPrewtWI3LyjkR/46NuyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com; spf=pass smtp.mailfrom=cknow-tech.com; dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b=TPXSYFoP; arc=none smtp.client-ip=91.218.175.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b="TPXSYFoP"
X-Envelope-To: devicetree@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=KJSKVfVDA4BnilE2RrZaUQRN55DrOrdNl6twBREZKDE=;
 c=simple/simple; d=cknow-tech.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787917550; v=1; x=1788522350;
 b=TPXSYFoP/8A/ZLUBCcG3l83HNSxL733EySUyQJOHgcdsOA3xFtxJFQPmegZaWAhRIV/2aX/m
 v33V+nVnUU2H0glHWsPIVuCPhO1ygQvneBTU3s3wwNFenf9Tc40//xkaiCk2fbROvBlklklTxY1
 Yx/PuG8cmDGU0tIg+mk2fjg9RUS4n6Zpalqbelylzy2n+bKUCBN90U8WkkN1nm8QwVn3zTUsehk
 gxsMGOGTzlB66D1NY6qMXS9ytqTGvu2225ggV9kKQU6irYpnijOVZE7QlrRs9lDE5hcHtLfTO2Y
 sS9h4pxUrKnSihqHJipfQvvD3RUZKe9ktvwcW2IaEP8WA==
X-Envelope-To: devicetree@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 326993ff3a397364;
	Fri, 28 Aug 2026 11:45:50 +0000
X-Mizu-Trace-ID: 326993ff3a397364
X-Migadu-Flow: FLOW_OUT
From: Diederik de Haas <diederik@cknow-tech.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Ricardo Pardini <ricardo@pardini.net>,
	Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>,
	Daniele Briguglio <hello@superkali.me>,
	Hugh Cole-Baker <sigmaris@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Diederik de Haas <diederik@cknow-tech.com>
Subject: [PATCH 2/7] arm64: dts: rockchip: Fix PCIe 2 pinctrl names and sorting on NanoPC-T6
Date: Fri, 28 Aug 2026 13:43:02 +0200
Message-ID: <20260828114530.1315798-3-diederik@cknow-tech.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260828114530.1315798-1-diederik@cknow-tech.com>
References: <20260828114530.1315798-1-diederik@cknow-tech.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the pinctrl names as used in the schematics and use natural sort order
by property names for the PCIe 2 nodes.

Signed-off-by: Diederik de Haas <diederik@cknow-tech.com>
---
 .../boot/dts/rockchip/rk3588-nanopc-t6.dtsi   | 36 +++++++++----------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
index fc49b927ef73..16c35250bacf 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
@@ -195,8 +195,8 @@ vdd_mpcie_3v3: regulator-vdd-mpcie-3v3 {
 		compatible = "regulator-fixed";
 		enable-active-high;
 		gpio = <&gpio4 RK_PC2 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&pcie_m2_1_pwren_pin>;
 		pinctrl-names = "default";
-		pinctrl-0 = <&pcie_m2_1_pwren>;
 		regulator-name = "vdd_mpcie_3v3";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
@@ -207,8 +207,8 @@ vcc3v3_pcie_m2_0: regulator-vcc3v3-pcie-m2-0 {
 		compatible = "regulator-fixed";
 		enable-active-high;
 		gpios = <&gpio2 RK_PC5 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&pcie_m2_0_pwren_pin>;
 		pinctrl-names = "default";
-		pinctrl-0 = <&pcie_m2_0_pwren>;
 		regulator-name = "vcc3v3_pcie_m2_0";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
@@ -629,26 +629,26 @@ map1 {
 };
 
 &pcie2x1l0 {
+	pinctrl-0 = <&pcie_25glan_perstb_b_pin>;
+	pinctrl-names = "default";
 	reset-gpios = <&gpio4 RK_PB3 GPIO_ACTIVE_HIGH>;
 	vpcie3v3-supply = <&vcc_3v3_s3>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&pcie2_0_rst>;
 	status = "okay";
 };
 
 &pcie2x1l1 {
+	pinctrl-0 = <&pcie_wifi_perstn_pin>;
+	pinctrl-names = "default";
 	reset-gpios = <&gpio4 RK_PA2 GPIO_ACTIVE_HIGH>;
 	vpcie3v3-supply = <&vdd_mpcie_3v3>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&pcie2_1_rst>;
 	status = "okay";
 };
 
 &pcie2x1l2 {
+	pinctrl-0 = <&pcie_25glan_perstb_pin>;
+	pinctrl-names = "default";
 	reset-gpios = <&gpio4 RK_PA4 GPIO_ACTIVE_HIGH>;
 	vpcie3v3-supply = <&vcc_3v3_s3>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&pcie2_2_rst>;
 	status = "okay";
 };
 
@@ -716,25 +716,25 @@ ir_receiver_pin: ir-receiver-pin {
 	};
 
 	pcie {
-		pcie2_0_rst: pcie2-0-rst {
-			rockchip,pins = <4 RK_PB3 RK_FUNC_GPIO &pcfg_pull_none>;
-		};
-
-		pcie2_1_rst: pcie2-1-rst {
-			rockchip,pins = <4 RK_PA2 RK_FUNC_GPIO &pcfg_pull_none>;
+		pcie_25glan_perstb_pin: pcie-25glan-perstb-pin {
+			rockchip,pins = <4 RK_PA4 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 
-		pcie2_2_rst: pcie2-2-rst {
-			rockchip,pins = <4 RK_PA4 RK_FUNC_GPIO &pcfg_pull_none>;
+		pcie_25glan_perstb_b_pin: pcie-25glan-perstb-b-pin {
+			rockchip,pins = <4 RK_PB3 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 
-		pcie_m2_0_pwren: pcie-m20-pwren {
+		pcie_m2_0_pwren_pin: pcie-m2-0-pwren-pin {
 			rockchip,pins = <2 RK_PC5 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 
-		pcie_m2_1_pwren: pcie-m21-pwren {
+		pcie_m2_1_pwren_pin: pcie-m2-1-pwren-pin {
 			rockchip,pins = <4 RK_PC2 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
+
+		pcie_wifi_perstn_pin: pcie-wifi-perstn-pin {
+			rockchip,pins = <4 RK_PA2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
 	};
 
 	usb {
-- 
2.55.0

