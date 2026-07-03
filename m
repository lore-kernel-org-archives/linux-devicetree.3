Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 660803876CF
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 06:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783061540; cv=none; b=i6ALNH2zRh+h334OFlTQV2mD4FJ0aNEpDhcucGEbJnYxhjnfuK9nNCnvPdMPTS0CD0v+Uf4wsw9JvAlMtBEXPacUnY9wlipYqApGhjMWVUsQ/QhKNfsWIb2EQ4PMjko5nDAgow+c7sRlB0/sco4exI632GviAP0JACbErvyoLoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783061540; c=relaxed/simple;
	bh=aj2uH9b/bfRzOkvrPYZ2176FA4QkmEK3VTNxofNEdQg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bP2o9qqTAoe1MP0cjljkaP4bokBT22QHvg8ttLy/yT7uCBIGjyJVArUcfWac/9/vnz7eSj0cCCvUtFmnXR9CP53sn42gxTgH/cAjFBdOziD7hZykM3kfHd5Amk3+wVyzkc9yLjdxWKX8XyxAKP+p4zt5ptIY9UDwvqklHwcMvms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=YX0BNBtE; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="YX0BNBtE"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c12c22d0f86so30892866b.0
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 23:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1783061538; x=1783666338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W4P3RDq+QoFIrungFJ6qmguRlrjE9G4sn4ESNQyuys8=;
        b=YX0BNBtEtR75Qdcj954cCjkwmvG4dQlSlr1BDyaW8xf4Ypu5vjDX0BVfpL1ClfD+Xd
         axW16Do20avB8BrLY8gePvNFqdoQozsP4mfe6Y/F3AklGqiFUzXCVgU3zMoT+hKwQe1a
         uaWkAn/HsXkMV1uL/YBwd0v2BLKLOFUc6tMxM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783061538; x=1783666338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W4P3RDq+QoFIrungFJ6qmguRlrjE9G4sn4ESNQyuys8=;
        b=XJwDkc8WnfusEyOKOYDSW5QZvtiHoW+3ONIKIo2foPfFpjLkOJ56vSX78khfdeSP0R
         A8H7JSinVSOlZl1gxLUCikGg7SNjsKXabp8WgRNmm6x+AatLluxtZMS2zeOzPu4jDwfg
         ZS7ywYKDIjGP6bFLTC0NspLaCmWyVXa0nlz3x6NzIOEc3tDxnT6sEazsJ1WQhHqzKVIP
         Q/DFM+jIHoiZJrDGcHiZz60qbQs+ADnvR5JCdq0M/g82ggwHeutrEpLbYFWTR0ffQu5+
         3nK2L82YwH8oYsIf8t3gAfkYSUgvQBLLKJz79iq3HShITlgpZyq/UyOi/feQHkaQajdP
         9xSA==
X-Forwarded-Encrypted: i=1; AHgh+RqwmWmJH3dB1gqJhU/OHAmMV0nwTv5Ty/W+2CanTnrG8XLb1glj9/R7cxX6Ze2MTk6tFqK4teXEThlx@vger.kernel.org
X-Gm-Message-State: AOJu0Ywo30J2P/rJ/7NGhTCcquNZlF9SWIfIdvYuY1vdg/BlDSpyk5SX
	kCpBgsngr46w0qm0icMYg/+jEgztg4VzVhi/ZIAQi89Kh97dpS6hM+LDP0yM94dUqgIMhry1wWR
	H1N4/duo=
X-Gm-Gg: AfdE7cls90EAAVZTtaXYjMRzBcJGH+7OyIrWHIRkC6F/S12XcyrWPL+ohmi6cqtRHxR
	UdO5CtCidDzTz0IRmlM9MvsacSLYmMIYT6gxh6RZ/FCjP3FmZGRHF8k6ZiXWLaszkM4lrAtOMcF
	LGssRVRYN7a1UezRS9FjXJMqHhp6dw44Fc1gIvVEHbvhc4QLvb5xqNjsiRgCq1r39oFKE8rc1rq
	OiUa2alPxvEFQ4wDpKK5sqhgwKffkQ0wKWydLL7SF4pRCR8MWVNpY01M9CrjHU8/BH/OoD5UyY6
	pnpOlaEIBk+As9R5WeoXQHyfXiscGIpXvJpOxOMp1dZsQlCyOzROWjBgIV/6TjiQN24CK+hCGJ6
	Dqwhyd2PKPzZM9YtSZuqWoKIbngT13FPiWJ7nFIz2fFlA2cZL7IbviuyNC8rhTRCyNsoSPDje6w
	lrrxcnys1Eb11PwiJMWuq5EgbYOt4NmZu6ks2KiSoBYqrBU2R/QEhptslGpomdPdzuks4pRAzoR
	1fi5no1isBQ3RFLufTUOw==
X-Received: by 2002:a17:907:808:b0:c12:9bee:3b86 with SMTP id a640c23a62f3a-c12c9de19cfmr147004466b.4.1783061537641;
        Thu, 02 Jul 2026 23:52:17 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([2.196.43.95])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62c4695sm235462866b.44.2026.07.02.23.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 23:52:16 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	francesco.utel@engicam.com,
	domenico.acri@engicam.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v7 13/16] arm64: dts: st: add usart1 pins for stm32mp25
Date: Fri,  3 Jul 2026 08:49:03 +0200
Message-ID: <20260703065110.1433283-14-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260703065110.1433283-1-dario.binacchi@amarulasolutions.com>
References: <20260703065110.1433283-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the usart1 pins used on MicroGEA-STM32MP257-RMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 4e570e2e5157..d515e44832d7 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -766,6 +766,39 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	usart1_pins_b: usart1-1 {
+		pins1 {
+			pinmux = <STM32_PINMUX('B', 8, AF6)>; /* USART1_TX */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('B', 10, AF6)>; /* USART1_RX */
+			bias-disable;
+		};
+	};
+
+	/omit-if-no-ref/
+	usart1_idle_pins_b: usart1-idle-1 {
+		pins1 {
+			pinmux = <STM32_PINMUX('B', 8, ANALOG)>; /* USART1_TX */
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('B', 10, AF6)>; /* USART1_RX */
+			bias-disable;
+		};
+	};
+
+	/omit-if-no-ref/
+	usart1_sleep_pins_b: usart1-sleep-1 {
+		pins {
+			pinmux = <STM32_PINMUX('B', 8, ANALOG)>, /* USART1_TX */
+				 <STM32_PINMUX('B', 10, ANALOG)>; /* USART1_RX */
+		};
+	};
+
 	/omit-if-no-ref/
 	usart2_pins_a: usart2-0 {
 		pins1 {
-- 
2.43.0

