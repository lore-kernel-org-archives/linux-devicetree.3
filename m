Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795653446;
	b=MTDuN2xMOfvjnZ4hM/cv+CN4xZbGB3CZcgzKqLYWntbt0/IauCjsYVpSI+hk1Nd/sj3f
	 gG+UeteS8CCPmiOudUYFj/Wj7ugtLXZK+ryVQEpEVwIuR2ZUaZ38cco/sTkh7MyM2GQty
	 LYVjp2xrexUEVS0EfasrVSY5BpkMDtWxLy7873RCPpk5gz4QsV3xFtFoR4Tz1M/o3vFzs
	 N6Fj8q8xIkgwaMxfOq2lOsMnHjZwLLV8hwdOvrhhmKFB/ZAEfyFFzzqmE8sbVmFQEIOad
	 4LL8NDuCYo6bc5KUrO+mP6SP+/X74YFJmxm4+iIl85HL275Pd5Ax1/EYS1yZ9CSYNew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795653446;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=NCQTtxn/Sil4DrmbNSeKcCD6R/mM62YVDCQe+KaRvfk=;
	b=XD9UncYz0IrKuTfOwxwte/6S5LfXHKLDnVqHqIChn2ixLNkHq8E5IH4mtWuwd5YyRgJf
	 dzzJ11WEdUwdL5PLp+k/u2SJnU2RfotPr2osWXOHow2UOFm29GpyaQKscURmSGUUNKJJt
	 /WCxFwmsO9c+tz9IshxeARmrm7RFRHQ2Z56DFUkylqiLYtvPYKqsHqgT/xFDChNCaix7+
	 WSnyk6RZnJbW5ykZYu36l+xQ6PDdjaJElE1rDWOtZ5Ir/0DEooHwtkHksD9tkBGN4v/4s
	 fc8vOv9BIWQZZayKCvUy4VqrhCrmxMUC7m6L3MOW/MtOfkkPmeIrAEM5zLTyBSeB0/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HKbh0d3w;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51DB2606A31E
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 00:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HKbh0d3w
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 812A51F000D4;
	Thu, 26 Nov 2026 00:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795653445;
	bh=NCQTtxn/Sil4DrmbNSeKcCD6R/mM62YVDCQe+KaRvfk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=HKbh0d3wY3fle5r6+bAaq41TZh/NK9OTmfPjg7C6Dkm3i/jgRJYadFd9Fox84t1iU
	 EiiUmfNTDPyRsGubBHazqvbbw3jmkqDq+1BSfaOm8gUisO5kQnadp4eps6aEyZYez1
	 8UkrSfmf89xE5+Ej0qA7LDpeznv+PPXs6rlqrM32ut/I7XJ+uZdzxd9hv515qfHfjX
	 QEf2AAAzyRWBpLayejpG0jASaiwlbV6FuAgx0nPsYFj45Kj3b5MAeTLpDPft9Dq5jT
	 tFnGe/UMLqMB4j+k1PbUnRzSETdcr/oJeUDLajyn1iidF3NQSjgxhZ52sdlDTH2DNH
	 bYMqHObIkrcYA==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 26 Nov 2026 01:37:12 +0100
Subject: [PATCH 08/20] ARM: dts: ux500: Give DSI panels their unit
 addresses
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
Message-Id: <20261126-ux500-dts-after-powerdomains-v1-8-791cd62d8870@kernel.org>
References: <20261126-ux500-dts-after-powerdomains-v1-0-791cd62d8870@kernel.org>
In-Reply-To: <20261126-ux500-dts-after-powerdomains-v1-0-791cd62d8870@kernel.org>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
X-Mailer: b4 0.16.0

The panel children have reg = <0> and must be named panel@0. This also
allows the DSI controller schema to match them. Found with CHECK_DTBS=1.

Fixes: f4bdfcc29a8b ("ARM: dts: Ux500: Add MCDE and Samsung display")
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/boot/dts/st/ste-href-stuib.dtsi          | 2 +-
 arch/arm/boot/dts/st/ste-href-tvk1281618-r2.dtsi  | 2 +-
 arch/arm/boot/dts/st/ste-href-tvk1281618-r3.dtsi  | 2 +-
 arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dts   | 2 +-
 arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dts | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/st/ste-href-stuib.dtsi b/arch/arm/boot/dts/st/ste-href-stuib.dtsi
index a7a7146980bd..09c8be0ad7ea 100644
--- a/arch/arm/boot/dts/st/ste-href-stuib.dtsi
+++ b/arch/arm/boot/dts/st/ste-href-stuib.dtsi
@@ -199,7 +199,7 @@ mcde@a0350000 {
 			status = "okay";
 
 			dsi@a0351000 {
-				panel {
+				panel@0 {
 					compatible = "samsung,s6d16d0";
 					reg = <0>;
 					vdd1-supply = <&ab8500_ldo_aux1_reg>;
diff --git a/arch/arm/boot/dts/st/ste-href-tvk1281618-r2.dtsi b/arch/arm/boot/dts/st/ste-href-tvk1281618-r2.dtsi
index 391e69769941..fb9d796c77cc 100644
--- a/arch/arm/boot/dts/st/ste-href-tvk1281618-r2.dtsi
+++ b/arch/arm/boot/dts/st/ste-href-tvk1281618-r2.dtsi
@@ -214,7 +214,7 @@ mcde@a0350000 {
 			status = "okay";
 
 			dsi@a0351000 {
-				panel {
+				panel@0 {
 					compatible = "samsung,s6d16d0";
 					reg = <0>;
 					vdd1-supply = <&ab8500_ldo_aux1_reg>;
diff --git a/arch/arm/boot/dts/st/ste-href-tvk1281618-r3.dtsi b/arch/arm/boot/dts/st/ste-href-tvk1281618-r3.dtsi
index c5acb60c15c9..1764ddcdf08b 100644
--- a/arch/arm/boot/dts/st/ste-href-tvk1281618-r3.dtsi
+++ b/arch/arm/boot/dts/st/ste-href-tvk1281618-r3.dtsi
@@ -156,7 +156,7 @@ mcde@a0350000 {
 			status = "okay";
 
 			dsi@a0351000 {
-				panel {
+				panel@0 {
 					compatible = "sony,acx424akp";
 					reg = <0>;
 					vddi-supply = <&ab8500_ldo_aux1_reg>;
diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dts
index dad2844169b1..61023711f113 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dts
@@ -481,7 +481,7 @@ mcde@a0350000 {
 			pinctrl-0 = <&dsi_default_mode>;
 
 			dsi@a0351000 {
-				panel {
+				panel@0 {
 					/*
 					 * NT35510-based Hydis HVA40WV1
 					 * Apparently some Kyle models can have a NT35512 fitted
diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dts
index 9aaf42014efe..a10710beff32 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dts
@@ -472,7 +472,7 @@ mcde@a0350000 {
 			pinctrl-0 = <&dsi_default_mode>;
 
 			dsi@a0351000 {
-				panel {
+				panel@0 {
 					/* NT35510-based Hydis HVA40WV1 */
 					compatible = "hydis,hva40wv1", "novatek,nt35510";
 					reg = <0>;

-- 
2.56.1

