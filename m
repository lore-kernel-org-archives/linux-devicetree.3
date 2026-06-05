Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36C640963B
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 06:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780640968; cv=none; b=iukbMz0Mg86xK1f9NXFks1Xk4R71UqvHwAzzkfD8rN5Hgy63Z5liFtiZuxxKxyPsrSstd4q4ilBE+r8okn4LO6AAVn7P1OW6HFdR91C/Yt+uIlOwXcEuMOvqSqspg6a0eeEnaKW1uan9XFrcOwq82CuVpZZQGtnkBLsRHrhasZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780640968; c=relaxed/simple;
	bh=xm9o/8BeY4wIz/OiA0rY2K8FPUtC6PGvOrywQYvKq+w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vbfsqx1/dGFlokzfy4d5A7GSwaihwOmnfda0fDmGmOY5WTkrDUEt+9yxY4nlMiG1Ru3/P+aFGhf5Zv3CzYeOlV0h1kjhkr7JhhlVJ4cTSmGJd/l5irwPT+KDinURPUY1BWDnDkQGAV9Z/n1BMRKEiaQgXO+jqYUfuk7R5dAP57k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=ff+5sh2c; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="ff+5sh2c"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-46015dc517aso1251656f8f.2
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 23:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780640965; x=1781245765; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rQ4ASpkWIwpAgEFSrqIIvG0Nmxdm6HTzVKFF+4kwu28=;
        b=ff+5sh2c3+7303UI7o8GBMOaqMDueG1FWxFvWAIAXDxN3NJASdrIdu+JiMdz3V93DQ
         n7ZGCKXXTR4UIMJvoRZBdqQs0jsA8p8/K36kFe2HfDZrMW/e50gLG96+4gcgRrH/Rb7L
         zzezWFkQSkFvfazciNWwuYc5caw7y/zf+dBY4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780640965; x=1781245765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rQ4ASpkWIwpAgEFSrqIIvG0Nmxdm6HTzVKFF+4kwu28=;
        b=rLlRjJC3GtWKjqIrvwV3l94b12/mDJqGUn8hcbnZUV6Oo/Qaf1TvQHB0Zyz2LkRSij
         I/9zR3HrG6XhWCxSycChpxE99g1A9Tr/NbWF1HmFteBbkXut8jIEQ975Wkx6N+aqtKvp
         xhCqfChRqNEmmz4Mr6gsh859J7UydJoilH/ReVY51z8hOZfsJm0+35fa0hTGv/WgjdGJ
         g/5JUy0KCpwX+CjKBCS/ojfuSPO7A4kAC5fVsm0dlfTZz0KokGHXjkKfSxu9oOID84Wh
         GLqQjlAziiDZwmKhaa5bXmwevznRWt0UErDakE0cpVuIl+LbJ7K1PRNKWb4SydGmfNBb
         iSuQ==
X-Forwarded-Encrypted: i=1; AFNElJ/bhyYeh/ektyA3lEh0IYM7IAZlMtqgzlF/6ZooJBlxTcmtAV3ulCfVxQnwFGKKmr+jkBNixN+XpC3s@vger.kernel.org
X-Gm-Message-State: AOJu0YxmG26Hvrewn7DlStCm96xp84dW6gLPz//+MuNQaNyATg2DvOhn
	dZ/CyH3f6FfsmTVDkTIAJX4p3LMp7r0mmI003SCbZYnTAS6L2bfX0LhjVVt9Q/2UNQM=
X-Gm-Gg: Acq92OEJ0KA6r/2mKTNU8RhPYztiia3bMgsLwe5zlSsUA+Mf27kLeUNHG5QnQQn8sbl
	M7jr36ANeG/SYVcDEZDlHtMyh7jLIW0sVBCIKOppQYmpvEDwSoTKKdZPjccoCV0lU+Pps5UIxNC
	vbbH77wDD17urWLU1HmT5dUwBM/weN5bDqT1XgcV0exGDeBYDK1PObeiNC4KSl6lu5lnCRVahWN
	vRY2YLFoS+9n+t/qqLcJFCz0VSOGrR6tBkCHYvtskmmlvDWdZQSVoPoLTqmJ3aXSSQkMnpowiwP
	tEvlss6bAf/tt3Qo7H1p8exKPrSpB7ZPDYoMLKj/3M1wkRV/T+36Guoh0X0xqwV+oUuG/jfrz3e
	OuP0z6KeEo07IhS9+TrmLkd2w9R+uCvnJg6z+3UQWxGO4x/kea1EQehP9lkDgqsMP15kKrtKZva
	MVCyxFlZIZ5tcTpMO2/TUaECdCbatTVT9czqo+hVG0e6Nqprn7Gzj6bewxeqUPrW4i9Pp2As7ch
	dn7OM6L9xLe20IGkyXkJhrAQcOFmiaqX2jKuMyz3K2YmVEbxIlz6wJC9yU7+JE/gmFkEz3jO6mD
	pmXFHa0jMjRL/qT9j53vSG2N9K7G2nRBC09mJCZ6VunAFg==
X-Received: by 2002:a05:600c:34c1:b0:485:4388:3492 with SMTP id 5b1f17b1804b1-490c25716dcmr26314855e9.11.1780640965299;
        Thu, 04 Jun 2026 23:29:25 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-82-48-44-238.retail.telecomitalia.it. [82.48.44.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344148sm23022648f8f.19.2026.06.04.23.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 23:29:24 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: domenico.acri@engicam.com,
	francesco.utel@engicam.com,
	michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v3 10/14] arm64: dts: st: add spi1 pins for stm32mp25
Date: Fri,  5 Jun 2026 08:27:38 +0200
Message-ID: <20260605062900.368376-11-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605062900.368376-1-dario.binacchi@amarulasolutions.com>
References: <20260605062900.368376-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the spi1 pins used on MicroGEA-STM32MP257-RMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 62f898a55d45..46c5197dcd63 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -702,6 +702,30 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	spi1_pins_a: spi1-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('G', 6, AF3)>, /* SPI1_SCK */
+				 <STM32_PINMUX('I', 5, AF3)>; /* SPI1_MOSI */
+			drive-push-pull;
+			bias-disable;
+			slew-rate = <1>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('F', 12, AF3)>; /* SPI1_MISO */
+			bias-disable;
+		};
+	};
+
+	/omit-if-no-ref/
+	spi1_sleep_pins_a: spi1-sleep-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('G', 6, ANALOG)>, /* SPI1_SCK */
+				 <STM32_PINMUX('I', 5, ANALOG)>, /* SPI1_MOSI */
+				 <STM32_PINMUX('F', 12, ANALOG)>; /* SPI1_MISO */
+		};
+	};
+
 	/omit-if-no-ref/
 	spi3_pins_a: spi3-0 {
 		pins1 {
-- 
2.43.0

