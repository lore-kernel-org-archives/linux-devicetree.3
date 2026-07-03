Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1C2389E04
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 06:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783061507; cv=none; b=AjKaebE2zCTpz9eV2Sp1W5Wup+inlKAnJA61TuTqKv5DEO93YctxyExqp1i6d9HU7lTlTrlimpZE1BcML5VCCdIO5ZKZyhfMLuD6ywLt7k1W6kx6xo0fe63VTYu/FlekD6HTa1lXsvd8i1OqKp1fcQPd6lZ+ZfkBgo3Az43bVLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783061507; c=relaxed/simple;
	bh=97KY9yD7aJyeFaO9lx3/aKKgODbzwtq99a/1TuTW0pI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=matT+jtVtfbevOdeTZfQwgZJ4QSJaJXkiXFwYyrtbsoXa38vvXoldTkl4Xs28lVia6Su9HyAG0IW7s4VFOO8YcggsfC2gCwXbkA8muYRHXb3j87UCph4kmsA0VPYMNTCCOsZksS7pQc8JxMioLbg4YYoc5ZstBdgEyvf9IUTL4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=AlvI6ZHY; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="AlvI6ZHY"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-691c5776f35so351842a12.3
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 23:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1783061504; x=1783666304; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p6RQlMNeIE75J/aKW5bH4o7BGOBdS+5uo3qC0b6eFZs=;
        b=AlvI6ZHYljx/CZfYqwjlqlgCs9Xn9J6fyRNIZv61uW3qwsAlTuH1dnNptf1JTsEWxy
         RKCVEXnDCdL6RtsmWAeG5OeVjW5liHwoi6Uk/s1UNpG3xRBodXEcKM8qqGxcf0Ij3LmE
         ShbB2na8ekgb2v4ePnZqHXEARqfcMjH/EPwtw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783061504; x=1783666304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p6RQlMNeIE75J/aKW5bH4o7BGOBdS+5uo3qC0b6eFZs=;
        b=mUL/l6sPuWzkDJa7LzNdWM2RJBF8HKTVjX3/Cvmjx6OHWnwHohAqt9WmcIPDwieDrT
         o2JExW6NWo+cyKPhm4BmfkkIEM3+DrdogPfM3Uyxv1bQCr/c3kV8Xpfb0xVCjODPelbu
         mYuA3sNrrlDIXKSffPm0/15w3nwmBjp6beHfE+cMqOV2xBxSVpQmxan+MkeZSy7uiU6y
         V8gAYNJPd8ZvNKw2+DGXEFNxPl7zadZboGJj05/UbCoDeMe9lvFwG4N00QZ6NzeUbwQt
         CCTExOCpCA0+KTROhBDp4GD4vIpeEY9pdjE5ae19ASKfRVOqAQGm+/9pYJd97OoUtlXh
         PsZA==
X-Forwarded-Encrypted: i=1; AHgh+Ro9F+hBB/apG5uk6yLf53LtAof4/mxg5EslqsDUq4rHs2P4wZkCfxqZ7+vhUgByQV+lSdtZsKcmd/95@vger.kernel.org
X-Gm-Message-State: AOJu0Yzpsj5nrLwBUcWG6t6iS6xxRUEMGQTGJsQl4L8IH51hBqa8B3Y3
	6i6VPvHy/WwYC3h8MPX/0qOOOYGbQT/g163eX3QmAQKzE4L8MfXAMoMzuzrMN1wtWko=
X-Gm-Gg: AfdE7cmbFh46cZgnZNlz1O5lQnqeV7nelRaeolJNzXp8i1052JcTTzs6S828JlUNhS3
	nBlLpiZ2WjuRAXGHxRlVS7wDsqAoG5YwYF8Lse83kPLvd8Q2acrnx0V9bahJA5afTdLQo0xhsv9
	Yh0zfVl7lfJmXLtdLn2Vn/tNzb3UV/bw80qA1PEuSHKBz4+eq2r3fkxYOWpHzr1hHLi34fpWaZw
	6Qqs4oyfQVh2LjiJjHcJokpP62B7kHfZIG+jb4WlizeLZ7BBYsU6KLMoEEhZgwZMorRTUO/VHV4
	vj1Nigo43LZLHqkZQ3iSFn26KIAqviFIDwoDcuKV9ZDXEyY/skDzJfRy2/KK+l+PbCSPCXlImy4
	GK9Ap8iLjmd2x2I/06PCWLH4aNOl1j10wn0UGgEAggJfNqriDKPOBZYcF/5YnURm2QE5EPeKad9
	RLRCTKZg7TfAfTyowAltkz8KAZXbG+b3QgYOx0NT/DNW1sMmxN31YHmphwNRa8PrbibTfF/Faok
	0IVBwP1SpI=
X-Received: by 2002:a17:906:dd1:b0:c0f:cbe8:7830 with SMTP id a640c23a62f3a-c12aa13733dmr276973166b.38.1783061504135;
        Thu, 02 Jul 2026 23:51:44 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([2.196.43.95])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62c4695sm235462866b.44.2026.07.02.23.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 23:51:43 -0700 (PDT)
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
Subject: [PATCH v7 06/16] arm64: dts: st: add i2c1 pins for stm32mp25
Date: Fri,  3 Jul 2026 08:48:56 +0200
Message-ID: <20260703065110.1433283-7-dario.binacchi@amarulasolutions.com>
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

