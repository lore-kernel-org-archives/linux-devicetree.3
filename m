Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07C630D416
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 12:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780662015; cv=none; b=PJZZVg6tXaNZb6dlIHKWNDlcWBWB6kMzgxtsalnrCJyJlyutCt6c6bK+iCIIQ/tjUYw45iNP4Ny3GS73rpF24jpUZtl0/TErr7da5wLVNE0zSlrn31CQB2/hLAEyW1s5hRPYhYEjoxIP3jMLUvtBpvjIo/c+TJMYWcrWjcGFhgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780662015; c=relaxed/simple;
	bh=97KY9yD7aJyeFaO9lx3/aKKgODbzwtq99a/1TuTW0pI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qG3CHh5FDPvv3K+YkhCOoQNJJ/6PQ9LZKmW0VotGx87vkBmrU3Qvc7ne79S+NhDd8wdUSrG6K+cBl9qS+FUgT845t0sv6BQ5yz3Xe41Iip7oxG3euzFWJH7alZGp+Mr2H+jTEv+zeEDkF3beBLhQWR2Kb+HjqHkFGVvEslwRwLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=P0ZeMozn; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="P0ZeMozn"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490b8a97b11so20413145e9.0
        for <devicetree@vger.kernel.org>; Fri, 05 Jun 2026 05:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780662011; x=1781266811; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p6RQlMNeIE75J/aKW5bH4o7BGOBdS+5uo3qC0b6eFZs=;
        b=P0ZeMoznLGa6Vtzls+qRbz/OlFAgQqW84Sbb9HbRoTH+UJ6SU0ZT6m0xz1f29E7Fwz
         3oeN6RH9Xd+nwe75KEl+LeZDJHTkr+8gxYhnxgFXQrwhtgdedCKLtrlLp5O7+zkIzKgv
         l88PltDgLm5B/70O4CV+ZUpRDSdPA8JBl9uGQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780662011; x=1781266811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p6RQlMNeIE75J/aKW5bH4o7BGOBdS+5uo3qC0b6eFZs=;
        b=bA2XDE1YwQmku24HY6Bs9xty69LG/OJIXyH+wdbJeuNeornkDosrwCzBmXE71/e3q8
         qKRPxyZ65einxqjam8A5lOzqjbSynzf2gkCkNoiKbufX9+RCUl1FcTlHoAZEM3Es2nFP
         OhPuFxmBZFvCSKe12p5yrVy8RzJ1M8aDw//aet6rXHmmoD45cDS+VUpa4X+PTtEb7Fd+
         Pd/v8OL/wPc8boUQ7SG96bOuXlPTAgWgatNBAz5Ep7P7rlnX6piGM2TTk8ZhfzOYI5JB
         BDjHdYVMNH3p9cTzT1JMzdk0g5jgHjshysgMJ/Wll73ouKx9o4gz6QjZ0eojD87yGlZ5
         +TEw==
X-Forwarded-Encrypted: i=1; AFNElJ9ty5eiMZ9b3g8ptnpYOwsOvsPSk4Ez9AMDEIQqaiYQKb/L3kX+Dcuo8kqrL2by3O7Wl4DBkA+/xbq9@vger.kernel.org
X-Gm-Message-State: AOJu0YxI8ItOOMZyQzKcw6BMoOrv1Vmvhxe5ItSF7C7NtHFzI/3bIH4L
	vfkiS0joBVWeidocTUFQoiOLZMje99amtGF0FjJDFLI5EkwZTyAB8mu1Kcdubr2Uf2s=
X-Gm-Gg: Acq92OG+SKq60/2SiYrxBIeOmmqRYrSvgv9i2LxzuCfbC7sBppn+wgcImp4N2Gah+4r
	uTevUPtj3iW/d8wifYQvWgbdOj6fGEEdBV4AX7TFTMe6NWOZ3dKid71bgfS+by3LFINXjI18b21
	Bf4T+eiT416uVVx71njbvxQhP5Qo1eEkL56R8kTYu+jimPoQX+hIXspPnWZnUT+bJjCwLKd4fLm
	rwF88s1wEZ2JUM1vAiBPb84+IJBYSZoRFITG0UzAGJ5mD6jTWQNy7kbQlOZexPjyyXD3p0DU4Ts
	DkXqNFbrVgyK5C/g0qaEeuiYcsK0i/sEI61BcnYuShtj/qczrBOWf6UqD9EqYoBr+nvBNq42qK7
	f3T2o5S5Ycax1B6KJgda7s/J7FOESibAxWz++xKkvSI/SWGhR4zJePoPwCrC1BCCJhFXDxeZ94e
	4suUYUn9A/wGQINGkKSFY6PRpJZ6bGve9xyARfVB7cLCqRpbOJ9x/F5ohRk3Ebt0N5MgR2Ya2pR
	vnyhcltKQJAfGb7ooZy8clyZO6DQhZ1rJmxxc95hKHRf/vsttdZgwVjM1jA/gDzsK5yVQxd2wXo
	CIkK4u4Wy1g4DN4BTl1kmwZTiZmbULsr7eM=
X-Received: by 2002:a05:600c:4e13:b0:490:bd1d:4732 with SMTP id 5b1f17b1804b1-490c25eea3bmr56648835e9.23.1780662011047;
        Fri, 05 Jun 2026 05:20:11 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-82-48-44-238.retail.telecomitalia.it. [82.48.44.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcb13sm24785883f8f.2.2026.06.05.05.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 05:20:10 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
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
Subject: [PATCH v4 04/14] arm64: dts: st: add i2c1 pins for stm32mp25
Date: Fri,  5 Jun 2026 14:18:15 +0200
Message-ID: <20260605121957.78409-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605121957.78409-1-dario.binacchi@amarulasolutions.com>
References: <20260605121957.78409-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the i2c1 pins used on MicroGEA-STM32MP257-RMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 456ece7f8ebc..db485b9ed904 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -203,6 +203,25 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	i2c1_pins_a: i2c1-0 {
+		pins {
+			pinmux = <STM32_PINMUX('G', 13, AF9)>, /* I2C1_SCL */
+				 <STM32_PINMUX('A', 2, AF10)>; /* I2C1_SDA */
+			bias-disable;
+			drive-open-drain;
+			slew-rate = <0>;
+		};
+	};
+
+	/omit-if-no-ref/
+	i2c1_sleep_pins_a: i2c1-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('G', 13, ANALOG)>, /* I2C1_SCL */
+				 <STM32_PINMUX('A', 2, ANALOG)>; /* I2C1_SDA */
+		};
+	};
+
 	/omit-if-no-ref/
 	i2c2_pins_a: i2c2-0 {
 		pins {
-- 
2.43.0

