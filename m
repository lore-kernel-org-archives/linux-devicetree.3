Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B793407CD6
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 06:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780640960; cv=none; b=g9Cz6zbiawpjgVYWX1H5CNFxIu8jNuthym5ijTEc2972A1AgPjFpXnLfuRpKCwT91V32Aet/hPZ9lNjX3ELuAcyrbf/niYSeJubh34NO3OwWj07dk+aWhtuaGYJw5ARNiBESOaMZYs0YddQY9GDgjdStCqtMW4SZkriLB+N+d2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780640960; c=relaxed/simple;
	bh=J844s6CJDpVgbP/YQJjGJqkHKNJYIZ5Jgwd9Gtevtr8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mYP7Rd9HhdwFTdjZBK98Qh/bfGknyT+ukH4Bs8bCHij8UdRNA5BZNRxkJsrATKQP6+z1JHTFAZlun0X0s9rXf1HE8vBJdqPtxFZlDvSsfg/vEBSd4nSFyyzvVeUSTvTzcUPF48vIf9RxUNy16ezHl4EeTK6bSX6nWtVFhxeNHgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=OSPh5iLs; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="OSPh5iLs"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490be03d47bso12051975e9.0
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 23:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780640958; x=1781245758; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S0e8wESPhIuGnKBPbF3YDifoYbOSIP99q8OpeirAYTs=;
        b=OSPh5iLsWhD5/rQBJc9N+lDXpUk4eqH6Pqe3QPF7/ourfFFnd5XHjLZ3b5NUnsYgnZ
         Jpzu0F89Jl3Ziwcr2tPEhJbf3M9pUG/mlIH10H2Ji3cecJiglXpV75vfC5U+gsn6dx7h
         2QnGhq+3da2uYm3hKP9gi9PjCWQGAM+RqPVV8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780640958; x=1781245758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S0e8wESPhIuGnKBPbF3YDifoYbOSIP99q8OpeirAYTs=;
        b=hsj0UHXQuKJ9mDWMrVVkOHLt6XXPfNhbFX7sHpq64yVuJg3QI2StehuEYYcHRuedgU
         Ml311tXwrF2Y3TlkyUTrZ5dB/eun51FtNMywI14mTUmeGcRHceoLRNBhzoMxXktchP24
         pCbhga2cRTK/Qifon8rBv4Cf6SMg1WnU0ifmKL8NqqxbrqL97YEQPRTLusdbublxfrvn
         kN/X9cY/jerzXNQSZ1WJz2wvjAAAoZIynnz5hZbusjKD3rcDCfW/+Ae/2AbL0MKaKh3t
         jOlGsY/77UdWZhrkzfuRDbOF/qjewIhgN6Tapl0dbW37ajJYtGuA3KXy2DAhnQhA7XU4
         hk0A==
X-Forwarded-Encrypted: i=1; AFNElJ+lC7Bip16llSUk2OhXApkwe8muHKtqSmBkOM5o+NzbZz/1GLfhFJQwmiuAvLZ8a6o6Pg8IQAo7UPiF@vger.kernel.org
X-Gm-Message-State: AOJu0Yw69UWS69Z08HAcYrMfl6lDOf04eFyBgUuneNqePKfycWB4TtWe
	8mhKHZQcvjdXV5Hpmc9+/IkCDmKwkzUd3z8fgZ9RxlvJq/h5YxRDH6j78+Tls2l/+lc=
X-Gm-Gg: Acq92OHOBswIvwwSVJjVd7ZLyOHGB9yStUeTSul9qEa5vVnbzvN2oLUmIF0BcB6TKz4
	I9kJLeWGhN4jN3jstAGN/c2Ja1p7bNtaM3eZ+gvchUBnYpl0YnEOFre/5dpyL6rT9FZQVEpjBRi
	GSd4XXtN/EiP2MjG8G4G9AfqaoJB12sR4RF8RELTsShEnT+FOWbgPGNexu+hXYEHETkIn2Wtz04
	utzk8yQA6ZXYHmVHKRqUAPMbe2GKsXdTViAzjkEzpBoeDQhsCde4Q2tBnOggojYzPd+1Arx96M+
	5vzX5xTZ3wAPzf3BKeSQx4kSCCp5HUZpyEd2UweDIqPOE2aBDhVKHo1Rmt9hDBi3to6I3sY9N3t
	sl/sUq0l7ELyrJInaxCsY4UXDMTl5pjWKYhgqXqmowgZOgY0J8gzWZOmB+ELOJafPTRL0oXl5Oh
	hgwIbF3zze54tLa4iOR2DOt8t6Jg4t99ti5vHi3wKyNS96qKhcE+rnIvgxbXETeCEHT5y9IJG/1
	+aA7Rv1wVsamDpDAi+8DyoiIKtie4oi3fmWah6CttFR7xe7yYGBK9UzMDQUzAMzi+ZAuyFKiRaa
	g5eTMuVhCkhGLNA2l9B6SuuVXw2GdYDku7Q=
X-Received: by 2002:a05:600c:a088:b0:48e:5fb8:f80f with SMTP id 5b1f17b1804b1-490c25f9100mr28298805e9.24.1780640957790;
        Thu, 04 Jun 2026 23:29:17 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-82-48-44-238.retail.telecomitalia.it. [82.48.44.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344148sm23022648f8f.19.2026.06.04.23.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 23:29:17 -0700 (PDT)
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
Subject: [PATCH v3 06/14] arm64: dts: st: add can1 pins for stm32mp25
Date: Fri,  5 Jun 2026 08:27:34 +0200
Message-ID: <20260605062900.368376-7-dario.binacchi@amarulasolutions.com>
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

Add the can1 pins used on MicroGEA-STM32MP257-RMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 05bd07a0a561..4be01a6574c7 100644
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

