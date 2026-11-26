Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795653433;
	b=rvBMLmJUWiGOlwPk/C0oT5me+ZcNyHsiKPz2MJ1Q4Kx0dy2eFosqj6csL5Kj+fI1f6t9
	 NfU6ry3C+alzvmtZxKHMpq1Doj6UXpgtduq8hQAnNSoq+4CRVzgdprDWjNpvWmcH6/JPD
	 MJyHgrMpy+kdCcP1xaIDRhrLNXbI4OsSGySXxtL6KC1a9Iq6/LDPJgERVix8PFt26wFiM
	 yBWq0l9uk1D3NT7k2R1ohw4CJqZqyN9tGwu4HapKHgLgSQ9bB+LoFdxgOjCR8KHXg3Ord
	 J0ifMZjtB2eAlx8LH69UfTSuqd3QVLL1ZULr7oVDF2FNBwwRU9bsR/gSRoSf2aRunRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795653433;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=iQcrj1Z2D+KwDkNPYJVOt1V3xyTIYQC8SvlCMLqwpNY=;
	b=uAALvuRcmASGFexF6HhJfKt6wkzwpkKPjxfJTi35qXZQR7c24Bq2N+FAbiwAtuu+ImKI
	 0NhTB3Y0n2AlOzg/5r2MKDHakrtoodCwhgznXuCoh/R9EVmvPDNKWPgqiIaXaqdtmKULz
	 bTjPDJFt7REa3dXlypBkWlbbWcJOIIK8POtXMvHEyg+Ur4ckukG/iL1taQLdoYCfcjMRR
	 IwYSKELkU4VweRkxTd/YGlVRnwhRt3HzmTYauhFmcgf2VLmSAYmeaWTB02TeiZrIWDjjK
	 RieGY1Lc9/9wAf+kzLM4d8kPRVJ4JB80EDSVGq/MOSnJUzqMAYC5e/b9NL6SUKvZ3fQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D4UKR7bk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE605606A323
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 00:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D4UKR7bk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08D861F000CA;
	Thu, 26 Nov 2026 00:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795653432;
	bh=iQcrj1Z2D+KwDkNPYJVOt1V3xyTIYQC8SvlCMLqwpNY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=D4UKR7bkFGHa7kEy45fz4yvZkdvxllWbdC74JjxPanQ1ARsdWYNmIvzTi5ZIIGT+Z
	 zWL1/u9yJTcUftztIhgZnmrq7gxprv+FJiRA7N8viMbQhiscPqTh5PaP/i1iGkadNA
	 CU2DT5tZ2nL0JVXp3ouS4+w8GvicpZ94hP3wPsxLl913M12++QQi3u7gY9DGl0Au/U
	 NaIa1m87MXm2lEIrK8Fqb5YDIJBB20cs9Tulo8g2wPQ7VmMNUYNRoen7IT0ULbV1II
	 gOwkzWmOuH+PzzKUy8UjplSR+4xyNrFOaGb4tgdZbHX9XPe3G3QJTv/pH6WzIuDNcn
	 IT/yskqw+3T+A==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 26 Nov 2026 01:37:05 +0100
Subject: [PATCH 01/20] ARM: dts: ux500: Give memory nodes their unit
 address
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
Message-Id: <20261126-ux500-dts-after-powerdomains-v1-1-791cd62d8870@kernel.org>
References: <20261126-ux500-dts-after-powerdomains-v1-0-791cd62d8870@kernel.org>
In-Reply-To: <20261126-ux500-dts-after-powerdomains-v1-0-791cd62d8870@kernel.org>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
X-Mailer: b4 0.16.0

The root-node schema rejects memory nodes without a unit address.
Name the memory banks after their first address, zero, on the HREF,
Snowball and Nomadik boards. Found with CHECK_DTBS=1.

Fixes: d1b8bfa342ca ("ARM: ux500: Create a DTS hierarchy for ST-Ericsson's HREF boards")
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/boot/dts/st/ste-href.dtsi            | 2 +-
 arch/arm/boot/dts/st/ste-nomadik-stn8815.dtsi | 2 +-
 arch/arm/boot/dts/st/ste-snowball.dts         | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/st/ste-href.dtsi b/arch/arm/boot/dts/st/ste-href.dtsi
index 3150e1d2f656..a85b2c352c69 100644
--- a/arch/arm/boot/dts/st/ste-href.dtsi
+++ b/arch/arm/boot/dts/st/ste-href.dtsi
@@ -8,7 +8,7 @@
 #include "ste-href-family-pinctrl.dtsi"
 
 / {
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x20000000>;
 	};
diff --git a/arch/arm/boot/dts/st/ste-nomadik-stn8815.dtsi b/arch/arm/boot/dts/st/ste-nomadik-stn8815.dtsi
index 4d37c5fb553c..b90c15352c13 100644
--- a/arch/arm/boot/dts/st/ste-nomadik-stn8815.dtsi
+++ b/arch/arm/boot/dts/st/ste-nomadik-stn8815.dtsi
@@ -9,7 +9,7 @@ / {
 	#address-cells = <1>;
 	#size-cells = <1>;
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x04000000>,
 		    <0x08000000 0x04000000>;
diff --git a/arch/arm/boot/dts/st/ste-snowball.dts b/arch/arm/boot/dts/st/ste-snowball.dts
index 1607bfbd9f56..3b629dd7f798 100644
--- a/arch/arm/boot/dts/st/ste-snowball.dts
+++ b/arch/arm/boot/dts/st/ste-snowball.dts
@@ -12,7 +12,7 @@ / {
 	model = "Calao Systems Snowball platform with device tree";
 	compatible = "calaosystems,snowball-a9500", "st-ericsson,u9500";
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x20000000>;
 	};

-- 
2.56.1

