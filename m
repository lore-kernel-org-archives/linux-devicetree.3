Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213B933EB01
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 06:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784096562; cv=none; b=Weefv3Jr23KV62ljA6zq/xq82w65zuiPN/3eNRsKBe9ADltNB8i7xjKKvL9gB1HBYVHWV9OtcDTC4mUL8kUDI2C5GG/nPaQDLTLlUZFRILxHQ4pFhePobVKY81rBC+MRYChrPAjtHt/SZrEt4e5Sqr64bDGfdcchphDSd/Rg+Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784096562; c=relaxed/simple;
	bh=aj2uH9b/bfRzOkvrPYZ2176FA4QkmEK3VTNxofNEdQg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CJM7tGc0oJ2VPAT/tOybq1fQBMp5a8wuajlIpbGPWOHQl8IGe1VdpLiKHU03L4Pg8qbBXlasZJKnyMSJaTYvUZvA4GUArmfALV5xK2IWzySRvZD64WWkf+Ny462UX1wFLzFxTLTv4Fo5zOdCbdtAkq9kmpjm/ZhV6pABW4ORDPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=fFd59GFV; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="fFd59GFV"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c165a41a52bso248334166b.3
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 23:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1784096559; x=1784701359; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W4P3RDq+QoFIrungFJ6qmguRlrjE9G4sn4ESNQyuys8=;
        b=fFd59GFVromca/V+eGbTqgfO98vWVxUfZPWIXxgCw9w9EF2k0o++U2lriqojFAeAsj
         gvGNuYkjsGTx4oQJ/IcxEVauH9beHsrwes9lf3FGUps+W7UphHa+8C6m2ZMXOmc7LH/h
         pxcGl4S9uS490gFhk8g4MvF42atNyBOaGVzFE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784096559; x=1784701359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W4P3RDq+QoFIrungFJ6qmguRlrjE9G4sn4ESNQyuys8=;
        b=ZZhLVoAgcQy1EQEAKN0pkZNzvavfqmq7+NKn/mwlxsPyHqh1JgBI5Y0dDYBv8/6eP/
         3EIoJLi/+2ofvDfWiMYP7PHwDs6FInwI+w1eOA3FfCRiql1H6LIZiTdzP/UxsdPtqFEK
         PRGsfmzHhtyTRoJbaWQbucC2jMbYSNt3AWGE15ON9jPylkJ9xok1Xu25n/42/634m/c7
         EzFhqF61qDO/nq9LVLJ169Uirrmccdcxwp+eSARlucMQlk9a36OQ2ufYMKylSDX526PY
         LSpnWXGoHpUR9F6NkgMkyayjNAhsThua3QXc+Rin1+CGwBGp5Q6CngZe8kMd5QapcStR
         5IMA==
X-Forwarded-Encrypted: i=1; AHgh+Rpi01369BKJeB0JlMDLXy13HRCSseZylUBxlyJ08w924Xva42NzdcANOJs4rWFE9EUQGbKgc+MqZ104@vger.kernel.org
X-Gm-Message-State: AOJu0YwV1Ma6XXTziUeWBI9Uew9SMiI9Zk9qL7fdb+TyWetsjq4AGfsw
	TdIHJyxOJdguskx76WAk03TRh5UMIfrwObqnVWNstTZShrOOQU1U0CIjlBBl/meJESc=
X-Gm-Gg: AfdE7clIt4JLgGfAfVSKcR5geqlc0taHGAzTEAieW128SzpaMqCv4kjCtT0yRia0Gca
	FguO9NCyjuKGhcREkhP1cBPZfzZiDSw/LOFhD/CcwDcLGom49cLw4mXrOSnrmmmjyTKYbm6ZVO1
	71gBNYg1K9StzjhdZ0VBdO1PChXoWywv+7XwaTVjs9tOSfoUHB+wsIdevfypFID5E12JtUz6xM8
	rRcOzslU9qaI6GXKG7KQEur8Vvs/I2ftppdpPcSt713E44eon497wxGvMiExl2I4IUXDgcPUiPc
	xIMRFLcv6RN/uaIgQCU/gM+U3vH4gnnxrAwnmp7x8ihb2Ds/Rg3hy+V8nOYu750Jym7guZtGWNd
	TRPdbHEGS/4X1+V65UIir/bNWwCoh/qpBrfIf/KYNzJyGSZM0rAOUL2glxVWFPB9Hk9hBVQ4YNo
	oczrzvsynfOuR7cOJvosP5mU4sSB1bfBQhu9JjhCK7hkvTmnQrSmjpYAg1cTtf/WMSgouP6ExuT
	3nlrMG3OecSMp2fqnV41bI=
X-Received: by 2002:a17:907:7242:b0:c15:b68a:5e16 with SMTP id a640c23a62f3a-c1667b4f80cmr304878366b.60.1784096559477;
        Tue, 14 Jul 2026 23:22:39 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([2.196.41.101])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15d0c3cf1esm1028820366b.44.2026.07.14.23.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 23:22:38 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	francesco.utel@engicam.com,
	domenico.acri@engicam.com,
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
Subject: [RESEND PATCH v7 13/16] arm64: dts: st: add usart1 pins for stm32mp25
Date: Wed, 15 Jul 2026 08:20:30 +0200
Message-ID: <20260715062201.3599458-14-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260715062201.3599458-1-dario.binacchi@amarulasolutions.com>
References: <20260715062201.3599458-1-dario.binacchi@amarulasolutions.com>
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

