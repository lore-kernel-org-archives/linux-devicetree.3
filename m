Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1327F3DCDAC
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 14:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780928574; cv=none; b=Eyd8Fn2X83agjNZqSEm/9i7aqToJQlRLIdQgh4Mek3xYVIaWPzYdFMeKZCQ3Y37b8nAXGPEVzuvviXPWW/F0BT0SW37tO5zfCNk0BljA6HXLLtXrxfNg5NfRedKHdPtJKE7jYSEkScezQBErX4UthQ5Y9GL0b8nVuU8NMCU7NjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780928574; c=relaxed/simple;
	bh=aj2uH9b/bfRzOkvrPYZ2176FA4QkmEK3VTNxofNEdQg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KF0+2TEUgpu1IlfoRYsokshgD41g4IPVfDNDPS4aW0Am4ruuNrFI0wKcF1/y5h/kL+dPhvNFnQ4KAlrO58taw5iZNgmQIzpnKDlnEYEB/VaRznp6FyLEJYLZR4r53YJH+dkRjW/ykHsNkNnvIanl53Vm2cWSUhTtAs2IfHkNRU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=LLNRQq6v; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="LLNRQq6v"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-becfa735b9aso606841566b.1
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 07:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780928570; x=1781533370; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W4P3RDq+QoFIrungFJ6qmguRlrjE9G4sn4ESNQyuys8=;
        b=LLNRQq6vtM//MszM9Oyj0UkGCGvfNFwTEUcQYWW2o2hV2rFKbhem+hE4zxgrplH+/8
         MoW/q4AhDc2cmFe2kZLTyMqF+2zk0LGDf4BPDrJ3nJ96NjeODwbBFiNK7JSmDf4WYHwY
         X10xb+/++jbLM5ypV9tzfrhdjWfJsD/O67osw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780928570; x=1781533370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W4P3RDq+QoFIrungFJ6qmguRlrjE9G4sn4ESNQyuys8=;
        b=gt0hAN07La4TQMWmW6lCRG+guLvLT2/hrwALrOG2xC8dysFJRsqHxBTSkKK29XIFBG
         Uc7ooe1gXXqabRKLL/yNMyGs3In+e+7WMtYZjlzvkAMg2k62rUTKyERmaJOuuI3+a+Ho
         SpOVLYcVp3j9L4eoMuYIst0GgdsLXTxAyScedS++CjMxtaalvwoqpX2uykKpctSVqv0h
         zsfoa99Bg5zvUIhXqZDcrri/DIH6P+JfjnPNKbWbQ20m1YrUOY2sMWo6KmIGXkLsUseH
         NY95AMPzOCuzt624JtDdwvVLKhc2D5q1H9VbxcwrfvZ8vznvjpmk9foYVepbErdELLWw
         N3/Q==
X-Forwarded-Encrypted: i=1; AFNElJ9fnP9EnQsY7iK/tQIbXD36KE2d9JTkAEPypB7UF6k/l1YOUkPT0vMxqKgP4dzWtaH4tujCO2VXestZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyIYxUOlo1uiu98RgUWgbg64ORIWRr0uBMFAFRjHlComh21P/N+
	4a/z1oMDnbBrGnWU/2VDg8AObiuEI63RDtT9iJsDcALUuG68OO6cvKuXcY3yhpTB93E=
X-Gm-Gg: Acq92OG0lPSYJHupvQLIPUQbsY2wutFsfimtORHwuHZTIJ63596xifBpRZ7d9DAeygI
	2xaVo5eWqeKo2NOV9qtsefRkNVtdIWbD9VM1M6YoqDPGKy/Yaq16eUJerQCmUkoAfBoA1WlHoEs
	Za3BspbxAVyJbZCZh4taUyJhKLySdVJIwW8RjYbXpXm4v5Q9QmQd9zEVMmC86DInVhvRHPwowjT
	MMVLg4vNZGA/7l8K18s1pOPgejWuOkjFvpIel2QRbiybh3xxMrUIJJ9R5U/SNEbCSQ/tHUuYfjX
	K0QGV5w+453Jtr8Hy9Ie/KHr23NeegRPRhex8Ic2jMZSV62j2MTv4RN81oWEeHTTHfmCRYIgfAH
	K2/Q88Yp/XW7KbnwucKAeSzAbQBh5LVfXAUtAgWNvv80vBw7bZYjtE9kpqB1Elt95j1wX0Odfpy
	ete+ZGzB6Xfl2Dp8nPVm7blJ3GBreAhVhGtWQ9Lcjlva6HLfnkYkgTA0sHdOHB7twrOCUO9zy/y
	bBCXfKZKljhGiljuVBJUU/R/tYOM53v9OcIO5YQwPRq4TX96b0/lqcfqpYplR2K+AJVYw==
X-Received: by 2002:a17:906:6a01:b0:bdb:6077:a168 with SMTP id a640c23a62f3a-bf372151453mr726500766b.26.1780928570303;
        Mon, 08 Jun 2026 07:22:50 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.42.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf055307a35sm881847066b.52.2026.06.08.07.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:22:49 -0700 (PDT)
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
Subject: [PATCH v5 13/16] arm64: dts: st: add usart1 pins for stm32mp25
Date: Mon,  8 Jun 2026 16:20:30 +0200
Message-ID: <20260608142221.952245-14-dario.binacchi@amarulasolutions.com>
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

