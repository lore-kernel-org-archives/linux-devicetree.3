Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C544C31E845
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 06:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784096560; cv=none; b=iU3Vm/MeXTEcvBqgEwhIs3CLi/iIt3Begtjtyf6Mi87+ou1P+A5+tr6K/YwORjg1g3O6ObWP/kQy9I5Y0+7jIHj+VpKB8MAEd9ffDn9m8mLyNdpWXZzGaDrB/Ww7ljHsIDYe1eDInaTId1eq/ruH8k9q3sSiNmZJMh72VLDJqbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784096560; c=relaxed/simple;
	bh=NXfXIGVIGeCVikB9TgfoNEer690zMfYo8lkyy6VHVv4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nVr0fbBlrdR2tZc1hzkg7tQ8augqz6l6o6u+Xv+heyY3eFQNATN8OvStnnQ7gDJl6G8D0i8anH3NEvv9y2yc8C1bWRxhYE/FxD99BRVwCNQS0IijE+VWLgfooC42F4EiS3sEgHMZ2XWS/qD9HRAsemCit2XOC/Mj53c7K+yv4a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=YRagZMJx; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="YRagZMJx"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-698a9f11776so2957385a12.1
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 23:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1784096557; x=1784701357; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q8e2F85Jk42cknJBTKAisusI5iJFywDQWX2RRkkLus4=;
        b=YRagZMJxxZ2sMinRywRI8dE+RsRFf9nyxykqEnx3O3JIi7fzY4ujre2ziIzTvKQMJc
         UJEejUutJfU3ryH11uT5JpgdJxbn39DAbVWPqTQCFaHzL4krIcyCdG3q/auTEwM5Xoab
         dWBxMOcntEyHRsD5b/KoXBcrHgZz4dOepxyHk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784096557; x=1784701357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q8e2F85Jk42cknJBTKAisusI5iJFywDQWX2RRkkLus4=;
        b=VLNmBtfm9krju/ExwS4cQyl5Ry9albdZVm5MEEg+7J5G8AcdZ0ev0cNdcf0pAMrCed
         9Fkv8e2bePN0fQ0mDl+YgVFWtmti/gyXx6uV/oXGdQKO4ohdgnVu5laZLI/92+0OPE/N
         0mWY7t8Fvn4Q5pDmRHT7GyS9/emp6kgONeGlrbzfl5lKs8ZfHfvVOLGJgQcotzrq8ia3
         w+vjfTxEqo9fpVN+yBFKQDVOLUWNbAdgHz68h7U23OVpFwXGc9As1DJ0iuqzSjIB6YuZ
         dBN4PU0HmhkyTb/ctgGhKv5XWvOejl6BUpkwcxroQ7Cbijfv8dd1bOd//wcFzXiQyY+0
         pcKw==
X-Forwarded-Encrypted: i=1; AHgh+Rru6bYBReeFs5IfoSCWgwQB+U0b54ZkkC+EdhIN5w2eYjl/ejUjCW1DnZmcxroFjcyCzpx1IA+Jz9g8@vger.kernel.org
X-Gm-Message-State: AOJu0YxJvRCEe4IMBRYt8XvBu4Zxfn1eEoLFxb7Gyhck7zwwJyLTdQ0N
	7hDqWUYGXpWTZYAufnqTpjy8fNdPp6BTLwYYCJ+0WqW2d6DCHb9L5YmK2qirxTlfXEg=
X-Gm-Gg: AfdE7cn93vJUqgeUBul1hENbZ5U07cdtiFXKIyxHpqa13GyVlfKxBP/XQ2WwbiX0y4L
	BlxvpLoHiX70YiYvGP0RjkW5aJk4R9IfKHoTIZDZYwceyCiS0LE2bEzYAg5AqGqJ171jcoA40e5
	+an8tbuYIekK5/lALUEikn5UYABQKmXB11D8fHwVrYAayup4uLpEXqxV7NFM4SriAqG7iMY1Baq
	S4xs1cgI/wPWV9oyTF0PqDjZuwqLaHl/cuTDS5UhiOjrqqAOVK4LGEhBJqktXLUKRR/8ENqrljE
	Gpg6TBkKuEvPvNozEtq9lE3rPjUsOL5cUgyQ/C/JJrrWurGhQO+TqKNNtXjWPESwXtTmaRWnVKT
	rbo473VrbG7WpImsifZIkOOfG3g1XPQTlLrpjx1v1K1tG3aGG81aJ0QgT9qMGR9BayxoKk+XEIU
	lWgxARftWe3+GwclysUshKDmP6YrOvdaSVIEdvUsJfDtOUcMR1xuJbI3OdTUNZn0DXZ0cqsEFpY
	zBTDtcMMuc9vznzPbfo9+I=
X-Received: by 2002:a17:907:9d19:b0:c16:6f41:8bf1 with SMTP id a640c23a62f3a-c166f419610mr273689066b.3.1784096557067;
        Tue, 14 Jul 2026 23:22:37 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([2.196.41.101])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15d0c3cf1esm1028820366b.44.2026.07.14.23.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 23:22:36 -0700 (PDT)
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
Subject: [RESEND PATCH v7 12/16] arm64: dts: st: add spi1 pins for stm32mp25
Date: Wed, 15 Jul 2026 08:20:29 +0200
Message-ID: <20260715062201.3599458-13-dario.binacchi@amarulasolutions.com>
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

Add the spi1 pins used on MicroGEA-STM32MP257-RMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index c816a6aece47..4e570e2e5157 100644
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

