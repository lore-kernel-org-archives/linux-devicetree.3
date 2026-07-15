Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A249A332909
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 06:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784096554; cv=none; b=SVQsM+7CT9CMUkq7FIb+YYb1IX8aOm8ERHIqXuQ/ATpmFiLgFwC4XBpa72Sda5mAV+sgycc2tAI0qh2U29qWsdnueljzpiJvkjVsAxozCKNpf9NLvYHoi57wZmyB2u1vBgASG2Q9La/ah0rlIvgteRXS0s8354rmkNHtY/R39mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784096554; c=relaxed/simple;
	bh=QGlJqg03ZdMuDaIsMrA23hhc5s89rjWq4ym3XRlGfDY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ealM1mY/YAytooPVMdorhNAuCr8M2FQoa+BsFQYG/mqF2LF+a+ZB8QYalKSj+RgPDrqX7VGeOWr1KZw1266Qk8DOqPAIMl/AusNv60gcWZzJDSke8jRx66tqKmdHpb4Q2ro8GBnr0NA8coGhzpqj7dumL92OZN3ovovPum3xPCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=bjLuXSet; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="bjLuXSet"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c15bf399d3bso219315766b.2
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 23:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1784096551; x=1784701351; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y9eicy7qFkVmMZW611/qMDh6GaEBG59Bdrl7IT5yIvE=;
        b=bjLuXSetGv7LWUeXH+GOp5rKXdFfDpocrD/oLjoNWUe1zWSfXLdGTv03xT8ewB1mn4
         BDoaJsxb4w2oWKGF6GhA8NUOMQF7djyekEmrPRd3P1YCw6URPma1zeY/1bDHTSCPkODV
         l2hFFpYagl/MySD43JCJ8WnvLbNisTkeACSQ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784096551; x=1784701351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y9eicy7qFkVmMZW611/qMDh6GaEBG59Bdrl7IT5yIvE=;
        b=n/SaVqEXcPhqXuhVu1gNuZkRmGoXYouGta8/eiVuKCSA4O+ymbwLcOrldA/LLtDqPg
         y6j90gy2igjzP96a6RytFg6dhCB5DtDRHCESUwqz13u8rIXL6iHETgwqh4Tl+0bCjEaF
         SY2pK8t+Y29wIVHx+wfB+h2ibDtb2mIaoiD7s1JLlAJRit5n+1+qHxSp19tWkWAVzUIx
         HtI3pcfGngWZLTyni6qVOMWy0+PhhF6rZVrgv3HeEcEFft2arKyv4wEIymklQJSB7P+d
         LN4MjJsvNR9Y3uaUGZHejNXA8CM6l2f1C3F3mbZz8ntlatcnZ+iQHtswITdPdDv4S/lK
         e69A==
X-Forwarded-Encrypted: i=1; AHgh+RqgrhDS2TsRmoXZFbjJzBrW3yOHJ6DEm2BeEnaoXQth1aYrjA+8nMlmLPBvyYPVO3Ld2VzUhuKtNVfI@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0rdzcXgPBxze+vhyvJnsHh+0ZbrfO839uuTZeh9XKMkv3YNT2
	OS47U9VXHP5tez+NIY0HY1rditcUzuf1OB1rKf+EWu/FO7Q+7o6KiO3KQdhmafWuQAE=
X-Gm-Gg: AfdE7ck+JZ+6Tm89C0g+w3vA64uaLtSJfObx1yvcZ6j7FDgplE2Bq7MwaNV7sTAr4T1
	0Ls71M5vLW98cW43ajJrumOfvyQcXTt0gpcYaml8vQolIW6hUpk18Uz0eQ2xiwHV1HSPEfGouhM
	3fh/FHdQNzYko3qqunh1acl6iPm/L18kZ1dc9ssmgt1vcONSHQ9ZsBn2nj/J64dG4Lki3Bk/a4d
	r2lYciom3H+DOYSic80BeoY66oeo1FSqmjvyDR8nwsXkxrYO+hRIUd1+4huDD7/4l71AqTg4DlZ
	rg2w4TouIIFr7d5jjvHk3F3ArWMdlI67Tr5f31QXLInR9NzzidKQmHdnBkYV4ldSjvi4ZaEB4eg
	oHEsdxj1cgBF9VG6u4AxZWoGytnxZuHXSe/9UEEquNIgxinZJRVzZc4YzAQFs5nG3dkm6HRIlmQ
	JrHOLJUVaTaOymCTsnWxeUfMgrtn8gVqh8M2G4ZCeNip/k6XyucYeshqJIfF8vkb/3feu2Zg7Ry
	HdNggIPvTzb
X-Received: by 2002:a17:907:97d5:b0:c12:b2dc:4834 with SMTP id a640c23a62f3a-c161ea6d217mr823641266b.57.1784096550856;
        Tue, 14 Jul 2026 23:22:30 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([2.196.41.101])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15d0c3cf1esm1028820366b.44.2026.07.14.23.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 23:22:30 -0700 (PDT)
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
Subject: [RESEND PATCH v7 09/16] arm64: dts: st: add pwm2/pwm4 pins for stm32mp25
Date: Wed, 15 Jul 2026 08:20:26 +0200
Message-ID: <20260715062201.3599458-10-dario.binacchi@amarulasolutions.com>
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

Add the pwm2 and pwm4 pins used on MicroGEA-STM32MP257-RMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 6482dd47e977..695c9d771853 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -433,6 +433,23 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	pwm2_pins_a: pwm2-0 {
+		pins {
+			pinmux = <STM32_PINMUX('I', 7, AF7)>; /* TIM2_CH1 */
+			bias-pull-down;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm2_sleep_pins_a: pwm2-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('I', 7, ANALOG)>; /* TIM2_CH1 */
+		};
+	};
+
 	/omit-if-no-ref/
 	pwm3_pins_a: pwm3-0 {
 		pins {
@@ -450,6 +467,23 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	pwm4_pins_a: pwm4-0 {
+		pins {
+			pinmux = <STM32_PINMUX('A', 12, AF7)>; /* TIM4_CH1 */
+			bias-pull-down;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm4_sleep_pins_a: pwm4-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('A', 12, ANALOG)>; /* TIM4_CH1 */
+		};
+	};
+
 	/omit-if-no-ref/
 	pwm8_pins_a: pwm8-0 {
 		pins {
-- 
2.43.0

