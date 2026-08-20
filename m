Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE743F12CB
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 09:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787217465; cv=none; b=ohFHcVY2zGczk/ezpsT8TCXAhf7kQOyc3wywWYZV42LX5wGCS8n9BnQzWUHqkpf8HKb4zMhfpeuHUG8fBNkqvZ3porF0WHPiE36+kEPdAF2tMqiZYV6QDrtdPTwC+pfKNajKGB3nOxSaFi5ChQXz7Tpeeep1tnMRjvz2U1Eujmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787217465; c=relaxed/simple;
	bh=vQtgT4Rjk5gJR4JBkHU70KDmBhf0zQZS58hasLTVIBI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tQb6YPU3eZnGgZJnPJXQbw2a25xXsO0cEcEGNca51vx8qCVXqxL0Zxt06h1EUNi+Ft6Av5AzPabDusFWc/vGcSxX3E/To2DLh6L9//s912v2rN1osPWx9bSYbQggSKbVs1d0Z+AOIs4p/ENNFxkfbzxGz0eLAK9B3aRSSbTU+NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=F3WHy2V8; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="F3WHy2V8"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47f93b2fe4cso1128362f8f.0
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 02:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1787217460; x=1787822260; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oW27beU6QgKp1gbl/qBDEPHQ8TY/2rtuftNabzT71Xc=;
        b=F3WHy2V8p7+isAf3nSpp4/soFRGBm8z9cZ221Ggu9v2GHcG1+yYegcpQQPLbumj1BP
         eLdZO5PBX/BWor+urJlRwbcSRuuslZLbduFs6C0Y7Ms/thRnagRMPrp6wGGNIsfz4zGi
         4QTYbycjmL5VDzclNCwTLEbPziHvW6nxb6rZs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787217460; x=1787822260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oW27beU6QgKp1gbl/qBDEPHQ8TY/2rtuftNabzT71Xc=;
        b=rLl9SVTSZBuZzB0SgJr6CpzqZP06UALm6g5wkRChpzK/EUnlm+WXpxP7Tzj+sFK1Iu
         Ha4DxEJ8zO1A7SpV0p84okjFVxBGz5Lmp2z4x50j5cYSWkgyjZQmG3SU3X0nytdC4GLY
         4f+V4oOIn+gBx3B/zVQEgNLVX2LzxHfY2XzcuNZoQnI1gt4dVm22ily/VC0BoJbTznpa
         9qjBVdN6210XsooZUgq3mWmTdIwuaPTlWYi1l/vipvMy0W0sfmmP7nc407MOCXdAoqQL
         PLnYxMuDw85XBntRUW2/ork2KYB800Y52dgEB3jiZRENdDjUA9Y43M3hj+uqitYvs8NI
         6D6w==
X-Forwarded-Encrypted: i=1; AHgh+RqAhx2FzJUujtC0HYsQg332K7oDJBzawjWR3ldnEMbfa0N6woZNTtnJJwHHJvJDD+srHOmvhJSUZ11P@vger.kernel.org
X-Gm-Message-State: AFuF++kypne9duV9IWMh/7J1sevwq5AzKYxVD4x4gN5VwtCfUC8eJG7e
	ccN1+/hwUEzf+OHpa5x5PVrDmMTiIdcavdDBoror3/zsPeZWmBDqyPr1CvWJ42YmhOs=
X-Gm-Gg: AR+sD12jFvCw0KXmD00ptcNlD+8lfgf3Cy+70iNTGnhyVepN7sxVvkjsbRER1utUCFg
	AdJ/kaiwO0ds78zDiSf5DsRNJHG6iMgN26kneE/q9ihTpXIF8vpKfHwffGn6xCzVeIETegfwKHR
	Cpg+tpS0gRVu2e/CjH93h6xjn4PxpdhHWqH1ohlpOTi3vU9W9lnHjXBlOVHGbCmCO49o+w4IBRD
	2/rX9P7KMr2LlaMobFOjGQyxe0iOgaSt062p/MDEhBTbqhK1TjiZHDLSdJI7BwKFMMcFhqOQcgO
	od98guMsF0rNv62l5hd2GDkEjByZHGWyRD3cX9ojW6M59VekJ9tSCgH2yxIEDrAjC9gNrAg8tFM
	ZXlCeNAOAWfTni39GSHHDRCMRduoBq6IbH5LhuqxdWmu2Mjg0nFTHlRp/vwYpkykjZA5zrIklZ0
	hlOMjn0b4ucZ/A/eXtJu5+43FRoOQAtI1kBaTENvxLfGVxuGuaNozn4gHTbfWVA8Dwefmi5rvCe
	bfm/HQhW4K1m4p1ujm5kDxVZC1nA4l0J+LNyoF8d5h8LKz1S49slc86AXwevJeYHArxp80ZlW9m
	vMXApdlNdK+GQcns0V2wX7la10fMf91DyZi26EXlqiicKi0EhgXmSwUqboQfeQ==
X-Received: by 2002:a05:6000:382:b0:47f:6f6a:6a7f with SMTP id ffacd0b85a97d-482b1e91ccamr20276156f8f.8.1787217460014;
        Thu, 20 Aug 2026 02:17:40 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-54-86-139.retail.telecomitalia.it. [79.54.86.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14c3775sm10021606f8f.26.2026.08.20.02.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 02:17:39 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: alexandre.torgue@foss.st.com,
	francesco.utel@engicam.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	domenico.acri@engicam.com,
	michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v8 13/16] arm64: dts: st: add usart1 pins for stm32mp25
Date: Thu, 20 Aug 2026 11:12:21 +0200
Message-ID: <20260820091652.43541-14-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820091652.43541-1-dario.binacchi@amarulasolutions.com>
References: <20260820091652.43541-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the usart1 pins used on MicroGEA-STM32MP257D-RMM board.

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

