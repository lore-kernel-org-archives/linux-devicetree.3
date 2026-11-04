Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.67.36.66
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793806047;
	b=kcEIxtO5l8jWYo7cVmmDdAkc+HyfZPHcI9fEojV2n0HP19maBGvyF4WEC+DqlBr9JNG+
	 Wjqop0RjCihOvHKgz3OCE7+o5ob2k45X1a2AK0nzBscKiTG9nE6Rz+N8N2tj9JCv00C/1
	 QNr8vu6CP+mbyloEu1WjI1gG4XDCVoxXZDhOaVk8ibyKeCzTUfB+sMzFwHdWeJTTMnRSs
	 nx0c1FRXnMw7cO3eDxJYsXkU/8+djAd677AitH1vENPVEmgcVjZfrq05GloKDgEXtzO9E
	 Qg4RDQy+7/U1haHBPa7j96l4jtHDJW+xm9lPge2dgr+avgUaNRxsfRtoRoz5MtyKvKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793806047;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Ux6OxlGrhrdw3ZXA1Gnjmo5HO2HQkPqq4M1z1Nbcc0M=;
	b=jpuVUiK4rnrl9OjocUPb1GJ97S++VcBbMyFyvcUyVVvGwx42ndKAPvNhHoyH4O2hcqQC
	 DS1sDKlaXtetvm+/hwOXAaLdwcGWTnPbcXa0Z9xdpWQ9xuKirsQYzWkA4pwAh3CNPno5q
	 zftX7FqDFP2m9XGyTsBy1wVDBH5gdrV612uRww9JfHEt4gTBIg6yR9SgrAKRn9vLSb14t
	 At99bLLo+/ayr4hAN/Z2rSjYcoNwSSIyXtCIlISmQfpOZ/VSVDOMBSc8SnKAU0beLzNzc
	 YR2frKc2QaaLwxTdS5exwN9xsyBmSL+HjGfhOFE+iT8lD/Qtou/Y+7Jr8emk6Myh+6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=posteo.net;
	spf=pass smtp.mailfrom=posteo.net;
	dkim=pass header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=1984.8680eb header.b=F1ZTjfF0;
	arc=none smtp.remote-ip=185.67.36.66
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A349B606A32D
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 15:27:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A349B606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=1984.8680eb header.b=F1ZTjfF0
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 28A10240103
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 16:27:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1793806045;
	bh=Ux6OxlGrhrdw3ZXA1Gnjmo5HO2HQkPqq4M1z1Nbcc0M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:From;
	b=F1ZTjfF0Qv23wFDY+WzM++6mKq+twJgK7DGdhWY91iOsL8kzEt7usdI6NNHy9TEEg
	 OKcFSMFHRZ60wLbsrMxMct4gSHWJNnsOoxS3vcYbLC48jqy5EV54dLtwvkQQqH5dpe
	 gzqPf6K3u2SsYQlwJyyX9XNkh+jaWv8FY7Q73ldj+b+R1mU/c/vM1cMgINww6e4QD0
	 cxtekUtm8UNUKAnB8zH74HATlGeBOTZ/yYZyzmREXSmFAPRlvIuRLHyKd1sbiHfbky
	 RhiM8sQWrlI/IMcJBED2l7C0GvKel6K2QHR+yAr2b0+hEDdfSIYk5up+fLHpr5HrAo
	 HozVgvi6ORmvA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4jKTp30yDcz9rxM;
	Wed,  4 Nov 2026 16:27:23 +0100 (CET)
From: Mateusz Nowicki <mateusz.nowicki@posteo.net>
To: Ulf Hansson <ulfh@kernel.org>,
	linux-mmc@vger.kernel.org
Cc: Mateusz Nowicki <mateusz.nowicki@posteo.net>,
	Russell King <linux@armlinux.org.uk>,
	Linus Walleij <linusw@kernel.org>,
	Yann Gautier <yann.gautier@foss.st.com>,
	Christophe Kerello <christophe.kerello@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/5] arm64: dts: st: remove sdmmc2 pins_b from stm32mp25
Date: Wed, 04 Nov 2026 15:27:24 +0000
Message-ID: <20261104152657.14909-6-mateusz.nowicki@posteo.net>
In-Reply-To: <20261104152657.14909-1-mateusz.nowicki@posteo.net>
References: <20261104152657.14909-1-mateusz.nowicki@posteo.net>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sdmmc2 pins_b groups were only added for the eMMC of the
STM32MP257F-DK, which uses pins_a again. Nothing else references them,
remove them.

Suggested-by: Christophe Kerello <christophe.kerello@foss.st.com>
Signed-off-by: Mateusz Nowicki <mateusz.nowicki@posteo.net>
---
 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 58 -------------------
 1 file changed, 58 deletions(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 56c2c99a05d4..75d08fe33ec5 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -757,51 +757,6 @@ pins3 {
 		};
 	};
 
-	/omit-if-no-ref/
-	sdmmc2_b4_pins_b: sdmmc2-b4-1 {
-		pins1 {
-			pinmux = <STM32_PINMUX('E', 13, AF12)>, /* SDMMC2_D0 */
-				 <STM32_PINMUX('E', 11, AF12)>, /* SDMMC2_D1 */
-				 <STM32_PINMUX('E', 8, AF12)>, /* SDMMC2_D2 */
-				 <STM32_PINMUX('E', 12, AF12)>, /* SDMMC2_D3 */
-				 <STM32_PINMUX('E', 15, AF12)>; /* SDMMC2_CMD */
-			slew-rate = <2>;
-			drive-push-pull;
-			bias-pull-up;
-		};
-		pins2 {
-			pinmux = <STM32_PINMUX('E', 14, AF12)>; /* SDMMC2_CK */
-			slew-rate = <3>;
-			drive-push-pull;
-			bias-disable;
-		};
-	};
-
-	/omit-if-no-ref/
-	sdmmc2_b4_od_pins_b: sdmmc2-b4-od-1 {
-		pins1 {
-			pinmux = <STM32_PINMUX('E', 13, AF12)>, /* SDMMC2_D0 */
-				 <STM32_PINMUX('E', 11, AF12)>, /* SDMMC2_D1 */
-				 <STM32_PINMUX('E', 8, AF12)>, /* SDMMC2_D2 */
-				 <STM32_PINMUX('E', 12, AF12)>; /* SDMMC2_D3 */
-			slew-rate = <2>;
-			drive-push-pull;
-			bias-pull-up;
-		};
-		pins2 {
-			pinmux = <STM32_PINMUX('E', 14, AF12)>; /* SDMMC2_CK */
-			slew-rate = <3>;
-			drive-push-pull;
-			bias-disable;
-		};
-		pins3 {
-			pinmux = <STM32_PINMUX('E', 15, AF12)>; /* SDMMC2_CMD */
-			slew-rate = <2>;
-			drive-open-drain;
-			bias-pull-up;
-		};
-	};
-
 	/omit-if-no-ref/
 	sdmmc2_d47_pins_a: sdmmc2-d47-0 {
 		pins {
@@ -914,19 +869,6 @@ pins {
 		};
 	};
 
-	/omit-if-no-ref/
-	sdmmc2_d47_pins_b: sdmmc2-d47-1 {
-		pins {
-			pinmux = <STM32_PINMUX('E', 10, AF12)>, /* SDMMC2_D4 */
-				 <STM32_PINMUX('E', 9, AF12)>, /* SDMMC2_D5 */
-				 <STM32_PINMUX('E', 6, AF12)>, /* SDMMC2_D6 */
-				 <STM32_PINMUX('E', 7, AF12)>; /* SDMMC2_D7 */
-			slew-rate = <2>;
-			drive-push-pull;
-			bias-pull-up;
-		};
-	};
-
 	/omit-if-no-ref/
 	spi1_pins_a: spi1-0 {
 		pins1 {
-- 
2.56.0

