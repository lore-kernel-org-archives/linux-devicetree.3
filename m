Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4693A43CEEB
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 14:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780066054; cv=none; b=tuJw1l3myr0BR1ewDPVICz/oWOYSB2CyuJKq85n7CJbC5vybaKtji4eHxPwmbJNfhUwZMtDT/VK9i4/yXdC6e8N0Lyd9Aibg4iBvhNkP45AlIeHhkLXfAdNTReZK+d9jmwEca6S3YJnLxUt3ELzbMtd+mbRyPvCei1fVv/KLs+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780066054; c=relaxed/simple;
	bh=0CbxIVBYXVwiSrXOvX8E9FYo1CJPet4hsL45pHulX6k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RTSpAyHtWBjmTlNB3sMSaJxfJWo3Ia3ZFT9oVLI/p8dNVHP83nkKw+2/gYCmRevkH3vKYJlUF2qiefCJiXXqKqn9iw5eCzksOJHTu0slfg/baKB8iCYLkwteras+l4wxoIdmgHaSL+b9Ht40ptxi32wv93qLgxtZOgTJa9cpVKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=kJGBKsQu; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="kJGBKsQu"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-45eee266c6cso1076107f8f.1
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 07:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780066052; x=1780670852; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kXBts3WbuCXiU0EHch1WC7B0zhmdg6BYHc3PSPue6D4=;
        b=kJGBKsQu/Q7yJz/kQp9c3LJ9DulmKm5JfmIib9KklOwedSsctyQNxKnelDfEHzv4CY
         r7H8Fwi8q2WIKpklfDDDx1nFWwdJCyX5YZpCAgonic+Pr0ruYeCDVruh09GJnxAVpdev
         4pQuW/IPCYLWhDWCi5QKlgZYPKbYbgczvEe3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780066052; x=1780670852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kXBts3WbuCXiU0EHch1WC7B0zhmdg6BYHc3PSPue6D4=;
        b=c7s0vWtEdT9d7fCNa0DUowUPKoqXdL6GCDyElJVeo6fhaCJzko7tCCPieRg4u+j2M3
         E45xJHc2srCViLptKNuwGG0grZF5BR303hiAFBanseirKevMp9n3w+qT7UHLPkW5pyzQ
         HF6yzRXe8PwWebyYYrdKr/4/v0QL+sh3IcPmkZNcOVCf6G25aRRZIP6ubARnJKrEigz3
         ASSHku2NuaEumWC0+tAl936r9zD/2gymVPU35UcUe84YjeyYlpDAxwvD1MVKgDBmuoAt
         3wyK/DwG6KZhal47dOg/vVxZuHsjw0WUu03N1FLtgrvmB3eYVKjD+TnPk+8IhPQvmYTL
         1V9w==
X-Forwarded-Encrypted: i=1; AFNElJ8nbOvzRq5RuRbHMvdjKUOSrh0IkB78cD3k5TOSKT7snTgOAEj+dpNE6WbxmqklHK2jmS+3QKIrY3wG@vger.kernel.org
X-Gm-Message-State: AOJu0YynOZk3EsHNJrvIudku9Zw3xmE2//659asq3YfD73o+p+bWwJ1I
	0GEOGPXYDgBbMM45iXs6CjDoD32FMKLjF1frJRUMZJW2SK2HnhjilBaNnD0I+o6FZrQ=
X-Gm-Gg: Acq92OF1rZc7/wjS6Au2ZcapewQKSDIhv9orrF/qhsdAMnm5WCiJtMJ9ysSs3PHIhRE
	T6OEZRQOEH7VBTL/pqcBv6pWMoDBhPDTXLcGq6/zIgChN0Jdjcm9TkTL3bLhtFuNnlGtu4RGgws
	Y3S89uCVyxyrTn5W+5yT5A1Hk1deWCS4mVsleyzbjLDJi3EUIE8czkA9PIO527nfK6h3k24ABEr
	X+fV5qB9aHedUnOGJ4lZ9dFu1G+feMVHPUZSauLB9nneLqipy/WYIkUw+Nh0M0lQfxGpTD+xRF1
	KnaIpNn2B81yriC3XGD7mNH5pZtUn3W05mIZwztiLKSNcIT8wLPL1dW09ks26KJwSs7ZPPWRa3a
	fNxVHR1MO6W16AotpbpPWmxkK1uCq1mLhzUyHaSr9DDysAa38rWETWyEvrOJHb76WdG49x2LE+D
	818Sk/Pb+5s44Hc3KCMHxGoBs0GWUGN8lLBDRc2gay9SYZREfoYncyndN36r9AxfktRd/inAzyH
	UwWdxBu5QOAcHwxgua4xibPH9Sy5VHTPFQrc0Uu2ajT8+qTWwTKXdipT1/bkSfSe2PHxQ==
X-Received: by 2002:a05:600c:5288:b0:490:3890:605b with SMTP id 5b1f17b1804b1-4909d376fe3mr56784445e9.31.1780066051755;
        Fri, 29 May 2026 07:47:31 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.43.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909d6eb470sm38694785e9.10.2026.05.29.07.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 07:47:31 -0700 (PDT)
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
Subject: [PATCH v2 09/15] arm64: dts: st: add sdmmc2 pins for stm32mp25
Date: Fri, 29 May 2026 16:46:23 +0200
Message-ID: <20260529144707.3931919-10-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260529144707.3931919-1-dario.binacchi@amarulasolutions.com>
References: <20260529144707.3931919-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the sdmmc2 pins used on MicroGEA-STM32MP257-RMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 80 +++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index ab1e62cf2bfc..62f898a55d45 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -622,6 +622,86 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	sdmmc2_b4_pins_a: sdmmc2-b4-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('E', 13, AF12)>, /* SDMMC2_D0 */
+				 <STM32_PINMUX('E', 11, AF12)>, /* SDMMC2_D1 */
+				 <STM32_PINMUX('E', 8, AF12)>, /* SDMMC2_D2 */
+				 <STM32_PINMUX('E', 12, AF12)>, /* SDMMC2_D3 */
+				 <STM32_PINMUX('E', 15, AF12)>; /* SDMMC2_CMD */
+			slew-rate = <1>;
+			drive-push-pull;
+			bias-pull-up;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('E', 14, AF12)>; /* SDMMC2_CK */
+			slew-rate = <2>;
+			drive-push-pull;
+			bias-pull-up;
+		};
+	};
+
+	/omit-if-no-ref/
+	sdmmc2_b4_od_pins_a: sdmmc2-b4-od-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('E', 13, AF12)>, /* SDMMC2_D0 */
+				 <STM32_PINMUX('E', 11, AF12)>, /* SDMMC2_D1 */
+				 <STM32_PINMUX('E', 8, AF12)>, /* SDMMC2_D2 */
+				 <STM32_PINMUX('E', 12, AF12)>; /* SDMMC2_D3 */
+			slew-rate = <1>;
+			drive-push-pull;
+			bias-pull-up;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('E', 14, AF12)>; /* SDMMC2_CK */
+			slew-rate = <2>;
+			drive-push-pull;
+			bias-pull-up;
+		};
+		pins3 {
+			pinmux = <STM32_PINMUX('E', 15, AF12)>; /* SDMMC2_CMD */
+			slew-rate = <1>;
+			drive-open-drain;
+			bias-pull-up;
+		};
+	};
+
+	/omit-if-no-ref/
+	sdmmc2_b4_sleep_pins_a: sdmmc2-b4-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('E', 13, ANALOG)>, /* SDMMC2_D0 */
+				 <STM32_PINMUX('E', 11, ANALOG)>, /* SDMMC2_D1 */
+				 <STM32_PINMUX('E', 8, ANALOG)>, /* SDMMC2_D2 */
+				 <STM32_PINMUX('E', 12, ANALOG)>, /* SDMMC2_D3 */
+				 <STM32_PINMUX('E', 14, ANALOG)>, /* SDMMC2_CK */
+				 <STM32_PINMUX('E', 15, ANALOG)>; /* SDMMC2_CMD */
+		};
+	};
+
+	/omit-if-no-ref/
+	sdmmc2_d47_pins_a: sdmmc2-d47-0 {
+		pins {
+			pinmux = <STM32_PINMUX('E', 10, AF12)>, /* SDMMC2_D4 */
+				 <STM32_PINMUX('E', 9, AF12)>, /* SDMMC2_D5 */
+				 <STM32_PINMUX('E', 6, AF12)>, /* SDMMC2_D6 */
+				 <STM32_PINMUX('E', 7, AF12)>; /* SDMMC2_D7 */
+			slew-rate = <1>;
+			drive-push-pull;
+			bias-pull-up;
+		};
+	};
+
+	/omit-if-no-ref/
+	sdmmc2_d47_sleep_pins_a: sdmmc2-d47-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('E', 10, ANALOG)>, /* SDMMC2_D4 */
+				 <STM32_PINMUX('E', 9, ANALOG)>, /* SDMMC2_D5 */
+				 <STM32_PINMUX('E', 6, ANALOG)>, /* SDMMC2_D6 */
+				 <STM32_PINMUX('E', 7, ANALOG)>; /* SDMMC2_D7 */
+		};
+	};
+
 	/omit-if-no-ref/
 	spi3_pins_a: spi3-0 {
 		pins1 {
-- 
2.43.0

