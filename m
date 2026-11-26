Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795653455;
	b=rXzETCxO+z7ar3XnDjemz3LA2Dw1RdguvFDE/GR0H9qHHto/csB6y9bxosgU9I2436rq
	 b364YkvPMKdmPbUSmwPX7oFVBl4TJB3PpPp7kpKwRGes9H2RHszNQBJohTl6zkJ2JhCGU
	 lbOUpyOniEJQRxCf3yj5j1Zz6yAVlf5BZD/iGFtarbBA8n3jN1veI0eQHYMWbx1Iz9O8O
	 HuhVve7KqCpTR0mgIvfd+feOCRqwtN2mzTKb7gglFZyI/lZlO3Mki1sRDfcZwfCdFebhA
	 TyB5BZQl8pSsElQb9Dn2kOX5hVN6kIMjNoiQvkhz3Tnsgsd1sgtAn1Vz2AHjFvPasiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795653455;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=Yjf1nlid2RxibMkFZUC9F480BQC7qNJljbiK4xF8UDk=;
	b=URmE1YGWrVrlIPGhV29hVq8le4ZumPqpZ31WOPbbpasFcqGB5AeVU18jxqZPiym4BO7x
	 ozhpNo6v/IPqL9Jj8ui7DUDdKXPrbhYCN37Y25arogbycWZMetYhlS+5W7grk0Cllne8p
	 SlTX3YbFVR/17u50hMX/GoPkD6LXXWBN2HU+q2/OnBPDVc187C38nSDipNokaYc2qUbWW
	 mcekQ68loK44/36aDLnWXrRyg/Ioj/d0jeLRnWA+90bW+KZ0nMiSpSSg8jZ3RFKZqmIjL
	 lXGYblsnvugGkwP/pQsuK83ykPIMwm+QWXqDKRW0XS1Tsrb4epsfFCB5uZtz4BflLgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HRXGlQyF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60331606A31E
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 00:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HRXGlQyF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8508B1F000F4;
	Thu, 26 Nov 2026 00:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795653455;
	bh=Yjf1nlid2RxibMkFZUC9F480BQC7qNJljbiK4xF8UDk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=HRXGlQyFOJIiYY6JJr/klzenYd8IG9NMhYp+IiTJbFuGn1wWrpzZk+yg+nCw/BghA
	 4LDSX5naELQt2sqC7tKRaSV3E2y0F6D26r6y1zz1yN4VE7+NAVrJoLmlSlWhgm+odm
	 O28Jk5CmbORk1PvuQn6apxwW9QUMQLf7M8NuNwSjz4GFi7Rw/UzXjnTTlwPub+MlYP
	 euFDYaI81zCcaIlzhKmhcO9Yv+VAMJ290XHNzVmVOofQnBomh+bk7FqOZEoC1N95H2
	 CM0yRfbwQk5tnsadg5rsKJgFnAesLn6wMhkG3ln1PTWRdEL5TzqDGjdy+wJ0oC0+OY
	 E6L0SMdZ/1A2Q==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 26 Nov 2026 01:37:16 +0100
Subject: [PATCH 12/20] ARM: dts: ux500: Correct the PL011 functional clock
 names
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
Message-Id: <20261126-ux500-dts-after-powerdomains-v1-12-791cd62d8870@kernel.org>
References: <20261126-ux500-dts-after-powerdomains-v1-0-791cd62d8870@kernel.org>
In-Reply-To: <20261126-ux500-dts-after-powerdomains-v1-0-791cd62d8870@kernel.org>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
X-Mailer: b4 0.16.0

The PL011 binding calls the functional clock uartclk. Use that name
for all three UARTs; the clock specifiers stay unchanged. Found with
CHECK_DTBS=1.

Fixes: 5a323fb4f759 ("ARM: ux500: Supply the UART clocks lookup to the DBX500 DT")
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/boot/dts/st/ste-dbx5x0.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/st/ste-dbx5x0.dtsi b/arch/arm/boot/dts/st/ste-dbx5x0.dtsi
index 2682e250b23c..7bb09b45698d 100644
--- a/arch/arm/boot/dts/st/ste-dbx5x0.dtsi
+++ b/arch/arm/boot/dts/st/ste-dbx5x0.dtsi
@@ -881,7 +881,7 @@ serial0: serial@80120000 {
 			dma-names = "rx", "tx";
 
 			clocks = <&prcc_kclk 1 0>, <&prcc_pclk 1 0>;
-			clock-names = "uart", "apb_pclk";
+			clock-names = "uartclk", "apb_pclk";
 			power-domains = <&pm_domains DOMAIN_VAPE>;
 			resets = <&prcc_reset DB8500_PRCC_1 DB8500_PRCC_1_RESET_UART0>;
 
@@ -898,7 +898,7 @@ serial1: serial@80121000 {
 			dma-names = "rx", "tx";
 
 			clocks = <&prcc_kclk 1 1>, <&prcc_pclk 1 1>;
-			clock-names = "uart", "apb_pclk";
+			clock-names = "uartclk", "apb_pclk";
 			power-domains = <&pm_domains DOMAIN_VAPE>;
 			resets = <&prcc_reset DB8500_PRCC_1 DB8500_PRCC_1_RESET_UART1>;
 
@@ -915,7 +915,7 @@ serial2: serial@80007000 {
 			dma-names = "rx", "tx";
 
 			clocks = <&prcc_kclk 3 6>, <&prcc_pclk 3 6>;
-			clock-names = "uart", "apb_pclk";
+			clock-names = "uartclk", "apb_pclk";
 			power-domains = <&pm_domains DOMAIN_VAPE>;
 			resets = <&prcc_reset DB8500_PRCC_3 DB8500_PRCC_3_RESET_UART2>;
 

-- 
2.56.1

