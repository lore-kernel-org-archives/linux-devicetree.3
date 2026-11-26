Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795653436;
	b=NoMyfnoSrc638FJlRB42pl6LINXsfwhdo02J+wvfNhldgmHnwXdjse1yznF3UKl2ow6z
	 yxkERUqccxt72KJijj64Zy5uWGu8jRxwtcbOIGHapeVfnlu/tIwHQMoL5D0U09Q0Z7F2n
	 EZPH4qIY2Umld0+M6tTgC2JwzkN7pKGPcCpMPyh499gDL/VKHL12CE+EegNjMBIEY17eH
	 llbysjEo9vt8mgJvIEbzDufizbVlGPeTWo7u/xKFrkkq5JBLATuVjYj2jDUZ+Y9rnlztQ
	 eFQSE65zrA+jK1r+5R9JnKdSeHRAezkbQeDNpq5rwhOKuKHozzl5TZpQfkzkI9M3qfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795653436;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=1VBRDqcHt2mhINg0GWtS/jFrH3vPdeVvBrzmi+p2094=;
	b=ZW/HJjL66+9G4J55uv2e7Ukm7VZW2TgEal9uVPtAEacTay1cMfeQduD/cwz7r4AXWOWJ
	 f2gTCTTOT2+/BapgLQZcigVwLts0Jy0MbUa3opxnzakgCfiLZnEoDpSdBOmFwkTHAJJtR
	 4MsHCwIoVEbK4Y6HJyhrFs87uJ+Fu8YQYpD/2yWhbri86E+Hn2Qb8x6Htfybl2rN/MRw3
	 z3OLrvuE9zik/eD21w1UKBFr6nCeJKZQBIEkJYb9reu2feouhQz6d2MKW+1DnKlBZd6BE
	 bECgCl/gZZzPgxEoKant4qJo4mh5f4xsKPAxjEpqFsp4nWOTDr9uF+Mpdy9hIdAYrvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SOOpcgZK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C547606A31E
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 00:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SOOpcgZK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CEF11F000C6;
	Thu, 26 Nov 2026 00:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795653436;
	bh=1VBRDqcHt2mhINg0GWtS/jFrH3vPdeVvBrzmi+p2094=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=SOOpcgZKvrGJF5SeBKnl18qpjfFps4iTpZTg9dvPMfigzqTDKjw39ZcdmFSulMtz/
	 ir+++YejxuNjT2Uz+75A6Z5T44tA44Eq0HTTKdZRoIgI3gj4LZaSQhbTrjD84LYq5m
	 H/JwWMqViSvT1atELnqp6HCVKjVT0/ChgdwzjU2mHrGhKiF0SAN8NmaeaIJ/jH4Q7i
	 Zwn2exlavGjNEbYdnCVqnEJUbXo96RR4pHkJbYYSiExeVgOPN+bTB1P6985ur9xlH9
	 4SntrAnGbsIWX/K/lN5RbQW8+0QRbtKcGRZWsD2KetEWOMWC9LyFfBm4oaKnSuOg2O
	 YxH2vvi/oc2yQ==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 26 Nov 2026 01:37:07 +0100
Subject: [PATCH 03/20] ARM: dts: ux500: Correct HREF thermistor and pin
 group names
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
Message-Id: <20261126-ux500-dts-after-powerdomains-v1-3-791cd62d8870@kernel.org>
References: <20261126-ux500-dts-after-powerdomains-v1-0-791cd62d8870@kernel.org>
In-Reply-To: <20261126-ux500-dts-after-powerdomains-v1-0-791cd62d8870@kernel.org>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
X-Mailer: b4 0.16.0

The thermistors have no address and must not have unit addresses.
The pin configuration container named gpios is mistaken for a GPIO
specifier by the generic GPIO schema. Use descriptive node names
without changing their labels. Found with CHECK_DTBS=1.

Fixes: 695055861a36 ("ARM: dts: ux500: Add thermistors to the HREF")
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/boot/dts/st/ste-hrefv60plus.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/st/ste-hrefv60plus.dtsi b/arch/arm/boot/dts/st/ste-hrefv60plus.dtsi
index b23966c16a32..c9e9ef830988 100644
--- a/arch/arm/boot/dts/st/ste-hrefv60plus.dtsi
+++ b/arch/arm/boot/dts/st/ste-hrefv60plus.dtsi
@@ -49,7 +49,7 @@ map0 {
 	 * Thermistors on the board, formally to monitor battery temperatures
 	 * but what they measure is the board temperature.
 	 */
-	therm1: thermistor@0 {
+	therm1: thermistor-0 {
 		compatible = "murata,ncp18wb473";
 		io-channels = <&gpadc 0x06>; /* AUX1 */
 		pullup-uv = <1800000>;
@@ -58,7 +58,7 @@ therm1: thermistor@0 {
 		#thermal-sensor-cells = <0>;
 	};
 
-	therm2: thermistor@1 {
+	therm2: thermistor-1 {
 		compatible = "murata,ncp18wb473";
 		io-channels = <&gpadc 0x07>; /* AUX2 */
 		pullup-uv = <1800000>;
@@ -361,7 +361,7 @@ hrefv60_cfg2 {
 					};
 				};
 			};
-			gpios {
+			dangling-pins {
 				/* Dangling GPIO pins */
 				gpios_hrefv60_mode: gpios_hrefv60 {
 					default_cfg1 {

-- 
2.56.1

