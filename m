Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28E53D34A4
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 14:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780928564; cv=none; b=pPnDiuNyW+ATMbQTPeMX8JIStCDIIhmtxSqGS2gJXFQdhhlEcHVqWo+14q4I00W8o0lYg7IQhpTbthqfgaZN1gt3E6DP23JSxnGvSVrYMC5RkwBcsbG6mPAIe3EKQfpqDhAL6phT3OGALff368FCHkMA2EDx58x53ZUPCNldXKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780928564; c=relaxed/simple;
	bh=H2YwgLpeEoUgwkXMc0nAyFKniAzF3scYINRPengKJHA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L2mO0q6Fd2aXIK4d5PgvRbres7R89OzSas8fIiyGSZSXa3DNF4mnkDohRp5O0JZupA/P4PhTlkJ3dr6j3FotNQ3Y+P7PFGHbYapsykuvKH+8h1WH2jepk7HPF2LvKQAfLkfgsgsuZkzvwWe7raeDA4fkG1pmlDgB3oWuWjhZyGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=qE/zaBuj; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="qE/zaBuj"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-bec3ffb95dbso678664566b.0
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 07:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780928561; x=1781533361; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mf08+e18iQyaBCmXia6is7dzqtiU26q8LvKBSudwg7A=;
        b=qE/zaBujKoKIBOqisPEPQbmX2lLoQhz5K3B/rM3Vi/0YkO6WL3ehFBwSAQxDd1HtWJ
         ue71pZdq7NWOdgDoHzMvt1g7uTPC4UJOfxJ7BlgfgUu2xpwGVf4fRT/xW6cs1vIQaBBY
         lO+eXmKsqOoa+2CmkBQ9RIDXxALQvRftmT7sU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780928561; x=1781533361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Mf08+e18iQyaBCmXia6is7dzqtiU26q8LvKBSudwg7A=;
        b=edmgJxTCNoz7/Lne8f26T0TSxcvXhwwWzaUdQDUA+LXdGkvlbY+r/sXsZ2iFlszWYN
         n+DgNvnQI8xGr0OyBtr1mMpAoPn1wZqXm4M+c0H0nHSNdBMSKQ3T53+dUPhXVH0wXBvC
         HTPWjryOLn5JAX2HqenmbxEu+7REzRr1/DsJfR4btoRFC55jTkUhr7oK0TYnhj41al12
         0hYFZpwqEqOtEswC3U0TlkCkLiu+pQpoG1lrNphW/NzBvifmKkOzuOke/iz5YM0pIhNg
         tU4CrOvV7umq/TvrJvU9UKMEusqVZ6KBN4IjoSuzBaQIazd4C4xHsqfR4B/cnjVRiO+H
         gDBQ==
X-Forwarded-Encrypted: i=1; AFNElJ8T+jkCJvbCZGWM3ix51pErB3/PZ5aUUvlrZFPGKHACzXBj1zGglfOI3nh+vnYqyc6nx6Oa3hTOJVvL@vger.kernel.org
X-Gm-Message-State: AOJu0YwsRifopoXT+7lE0PPtC7nrWhoYVZBenL9aKrbSn9SdbBo4Sdyx
	5fBF3FSC9HRuSBIVASIRbQke0Do4S/ovJWMM1uFO0R+uR5+OixTf327rAwHLBVzsx/c=
X-Gm-Gg: Acq92OHUr5jOx9gkipfg8mg9nPgLzvCG+mZo1KGCE+yeTLbfYazOY4nblqAgASbYAP6
	vm9jtADu0VASCjbhXoJyti/bckjcu/fvagrbuOQ6+2sszXxS2oZsG/KgKX+L0BFalzdVNRNgISo
	02cvjn4205gVO5/tL5mP8DNVpoMUlFR3fYR/3ZwrKsSNlyGLv3u9afMMUH61HoYhKUU7wi0VK5i
	+9/zvISbuGavNh2vDHoZ7wfSsAUpuhtQ1i3XqwYmxlVreZgW3ZuO4ocE3G91V5yse0WH3oIdOpq
	O2JWH9v1xGzVpia3pXsHSNpjDBBWlQOIYmiTsU7o4onPB7SfJl8xS4r3czTGhpGfVRKklVmLbVp
	rjzIN9uctRhtyzM1u4UMrhYSdkX8+dsquw7Rn/Nl9LHZSsBMi0GJxeAxIFAJzWGrS1zM49ABcmN
	FRmsRDvEItqBvB+ZXP8TRvH30BjQNhFziadB04en3j3Zao/tqqybcxAn2n3AdFnVfcth5qDtUK9
	v7gNYxOsIQCmuD8AtTRFxq7poFwYVms/DyBufZteduu4/5qoe9KQeVwfsw=
X-Received: by 2002:a17:907:9483:b0:beb:f459:718d with SMTP id a640c23a62f3a-bf3729338e1mr767674666b.34.1780928561050;
        Mon, 08 Jun 2026 07:22:41 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.42.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf055307a35sm881847066b.52.2026.06.08.07.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:22:40 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	domenico.acri@engicam.com,
	michael@amarulasolutions.com,
	francesco.utel@engicam.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v5 08/16] arm64: dts: st: add can1 pins for stm32mp25
Date: Mon,  8 Jun 2026 16:20:25 +0200
Message-ID: <20260608142221.952245-9-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260608142221.952245-1-dario.binacchi@amarulasolutions.com>
References: <20260608142221.952245-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the can1 pins used on MicroGEA-STM32MP257-RMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 50f454630cf2..6482dd47e977 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -331,6 +331,28 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	m_can1_pins_a: m-can1-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('B', 9, AF7)>; /* CAN1_TX */
+			slew-rate = <1>;
+			drive-push-pull;
+			bias-disable;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('B', 11, AF7)>; /* CAN1_RX */
+			bias-disable;
+		};
+	};
+
+	/omit-if-no-ref/
+	m_can1_sleep_pins_a: m-can1-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('B', 9, ANALOG)>, /* CAN1_TX */
+				 <STM32_PINMUX('B', 11, ANALOG)>; /* CAN1_RX */
+		};
+	};
+
 	/omit-if-no-ref/
 	ospi_port1_clk_pins_a: ospi-port1-clk-0 {
 		pins {
-- 
2.43.0

