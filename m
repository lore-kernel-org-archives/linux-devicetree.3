Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543DE303C8A
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 14:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779114746; cv=none; b=aob8lSs0lP1OTLllWpCyWX9pah3fu2uckcgNqFhN387vAOPHozzBAuLsi7pX7Nwxyjybnam8N4skWY8mLMh6+zfWFJleuSJUupnS5Wyr++NSQFS67V8AsHSwoSvkKQ7GyUi0OE20hc+YKYg7XdW4DJLAQ62AhBo7itYKmTCUu8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779114746; c=relaxed/simple;
	bh=TfZpadNwH25BfOjqAtz6ohkwyLLJpocHlfSYHcNsMdc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dNUeOTm0wnUUBTvb5o6Yu1BgaLVRqgtS0US4qJNNda6DPurzmGseh2cIXY1ZfgUlQ5zIS+PDY3QTux6PeOlTuweDh3LRyCkjuwELEoZLRj+FBG7wpK0iZj5W3PVBUmGzBAFv9TfiysohUycT0ryQ9ANc/X3xAOwzJOyaYxaVAw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=F+HtXaO2; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="F+HtXaO2"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-bccd251d622so410712866b.3
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 07:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1779114740; x=1779719540; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RCHIPZwacuOf0o7fSIdc7VQhv0GmhSFgjV6dD0HjIec=;
        b=F+HtXaO2p2wsFaDm7vFpp7pWPmkr/V2aqK8EfirsJa9LuwfBuqt+NvXZODmvWpqxpv
         b+Rl+Vw6N+bu5diVkJJHVD4HkRWb+TooM1+DZ2YqjZGthKFdleaS8Lp82gabh/Q4+IVt
         MpjzgwxGihTkRPpv8RD+eW8hYjtevBW6bgHI0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779114740; x=1779719540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RCHIPZwacuOf0o7fSIdc7VQhv0GmhSFgjV6dD0HjIec=;
        b=bkRqIqYNg+8Y1aAZQzcrDBKmqu5bp2N1Mq0CkkX+NmnJKVCEqwNt60YBJcaBPY3mnR
         8y3E3t9yUmNX4vfSY/4um+ISiWrpQ2xXCbiGzOiEddzTe7J1YS6Jlcho8nZyAqoZDkiQ
         ny64JU7/x6AEXdK26IUnlb2wNEomg3GUylxQp7m/622vep7lv6QyEEIXhpgwkmdE4LvX
         O9Oumky08KsYtp70TLgwUGzEzikq2Sy/N3Qmr6mDOsVf32rWS6d+S5W9bUK8HTmiqOaY
         jxqxqtfixZ1m7uWNUs83gW8NPWSY52CZ9vcCoOL0YqaBSPsgRi3EsHq7Jy/nfq2jVBL1
         1L4A==
X-Forwarded-Encrypted: i=1; AFNElJ8OuZLkdKKLazTVnMPz3gH+MK4zPMEYcgGFu+3Dsb41jIZfgr8RdC+peMIOWtZnu9dNvErUqfDWPCBS@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp6KI4r6PDHUXEhFpDviyH5fCKF1V7VhqCvD7R6giifOiKZOoX
	At8VUq7eIO49YUHmilbX4zhR5rxvyHIrJwg/V/24ITDHkFtkDLfD4P6bg9T+N0+BIC4=
X-Gm-Gg: Acq92OF0LRTIQlqGIidht+aeMQ0Zqyty3zrNleF2NNrJXHGWBtP/CQbFm5GTCySeWzA
	cCmc3k2gwo5vaP6aO6zNuxZK9mdWZW+QdVpqq/6wKTO44y4499KNpWekTweOc1Eo9TqWeho8isb
	0Xf5C5upw6Wn5BHrjxfsXwznmGgZjaZXkxg9JBQ/q/H++KnhmWZAffcen4O8G3PkaKMR39z26sd
	HxAt0JrMCmQ0YUKjfP0j+QrJIB4DG1JjeYG4ynzJLoal2zX6C6odM6/f6bu5sQellH1wcVBgkIQ
	QUWj8cE2PRhmd4sulrEEQfEzM8iYANzGVLVP8eGmZW6xGQtGpGXIyhou6idLLT+rWvcfqD66ZYG
	nbNcxEoPPpAuQ1NcypYTARlAh9j3quR+bruQmdvZq/Osz0Q1L6JZZxqmsAnctnoRAttQZ29D8Sw
	cZu/X6UFMls3jsGsgBysWYGspfwFz3Cl85ppzzZfzZOGMPHmKIgAULCBM3/e7px165hopyQpk/D
	DZlliuym4e6HFTyYDuX+Gs/BTZkOE6Cy3UmlONhpCRtZVwfBTL4In5k7e0=
X-Received: by 2002:a17:907:272b:b0:bd4:4593:33bb with SMTP id a640c23a62f3a-bd517ad5b94mr840117066b.43.1779114740148;
        Mon, 18 May 2026 07:32:20 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.43.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a1aeafsm39564572f8f.23.2026.05.18.07.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 07:32:19 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	domenico.acri@engicam.com,
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
Subject: [PATCH 11/15] arm64: dts: st: add usart1 pins for stm32mp25
Date: Mon, 18 May 2026 16:31:26 +0200
Message-ID: <20260518143150.3138712-12-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260518143150.3138712-1-dario.binacchi@amarulasolutions.com>
References: <20260518143150.3138712-1-dario.binacchi@amarulasolutions.com>
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

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 46c5197dcd63..a72c458b2c6e 100644
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

