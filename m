Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428B7481FD9
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 14:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779114732; cv=none; b=BGqHXkTMhY9PVEnjhr0CYwW3dZR3qJoC0NE2qfzFIV1Abm0zvszhNUHUQAhw0qyf+mjq2+xQ27Mf9T1oknw3eTKrmxkmID7GnX/mYP3kd9mvjZ0JIqg0HyYWh/2jrSGHeHeJt44atyZNG8D+L3lM17qiVftQJ7+4bzHQro60nZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779114732; c=relaxed/simple;
	bh=E9+s2+ReKBccXhTR5//5jcgGoceFbTsFVIWPZ8S0Lfo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LOqIhqPKbOntz/tk4BPIZIUNAC/hwW18hMr6LiaFXQUrQQRAdcyquvHiL6Mf3T0HnvT3gw9XHsCRFxNBzwuZ3dNCziGlzGeLFw5bYyMKXdbdHD9m1vzlrqfr2L6WMyLc0atXHEYPEXqxRy9eCPu6f1K6dOrzujj41IvCTCj3OPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=Rf6I524w; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="Rf6I524w"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-441209fb77eso1368059f8f.1
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 07:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1779114726; x=1779719526; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x8+XcZgP8957SPKwPpk0bkCHSO0BbZnOhhuPRsGrILw=;
        b=Rf6I524wvhhrWix6Wz3TUApNVKRIHQu88gccc4Yu43vYSljKbEEgjVcYoAkhE4InSE
         XZSdAiE/SnLZCKlSJz2x7+FdlH60YqmtN0dSK0hBZdk8rfdcKXxqcmv7OqOeWwuxfvsS
         INbN2+0aK3C/meceEHTOvWAEwQrlesSpjd9ME=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779114726; x=1779719526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=x8+XcZgP8957SPKwPpk0bkCHSO0BbZnOhhuPRsGrILw=;
        b=iXIMeNuixy+UE1fHsZPpnYQIJxw+pNvrFtW3WGFQBeNZtpgtTXA9Nkt55mDFuwKkgm
         X0wVaSG0VU/W5lUMLbnXBESokKT9zviXugu3XF6n0EEbcDyOm1E7RphEyjq03MEOybvM
         I2Nicl7YuAfsXxKHXPdRQ3toc+QOmqGDP9IxYCMeFz8emrSqiqyPj2FQznDoyJ2jmeSR
         rRiUUR+99hLxXrG7dz0l7/bEW/O76fT157JAdOsC9KNPzAhq5hCdTkPJZXF+NunX481y
         2BRRQybQUPdYmK1u+kiN7utWfni3BwvczREJUT4XW6QZvkBaAHwQFxQXRgTQhpOKpYJ+
         IvHA==
X-Forwarded-Encrypted: i=1; AFNElJ9Ufa/LuaKEmq3t+2oewKuTAkAsNthRVMVyCCg6n1eoKkichBGYJQm94KyZF9GpVQ3Epw4azuhTjhs+@vger.kernel.org
X-Gm-Message-State: AOJu0YxWLfSLL+ppWcj6QrKZQVz6dysDe5vtFF1BsqDUQL+JWpVZqUNO
	2sdCft7jrl58NNBcR2nTCG9aC5RUl0ALvnkqvBsPxSADnyTlAxkKz+yYbep8B8Lz5Xg=
X-Gm-Gg: Acq92OGmqFHOV7rshgcHp3aQGgCdEO5/2ydjrH73nttI6tQXuPGZHe+S9CvzLDupmGF
	LkQXDs+ehQ9mnopZZCXdEhIyk7dyGsh4isRY92EnlOs8P0gPbAhT8yu7huVenozWgZm4Q4IuND7
	tioUevLIQ3i3W4Uifzf73Frhf1UlyFh5mJucaKjrumiQHuDBCEnEnZ/VX0g/PDdSC20lI5K//Dn
	grabsrTv1cMNrWYkK82GaKX+fzU+JwkBJhN2OyUv43yfpDfHlQ8H14SvIFsoGAUqTbXKX8POTOk
	iKMsX1S2Z3bO8k0rSHUMmiRcCl+U9Dv55AOF2dKjA3IPq+Gz8u84kQBsikxKcS9M4+jnwC+Tnyw
	q7h06AjOv/qgXW1NCfR+LEI5Pmql2WPtKOqfsx54y0VT7FJzSBgIZ5WiFVifF0Nsm6s09nnS0CY
	Lkq8abtfV3EQZcEC8l0TmU/vGtEp3Br7hCiqF60cwSP/Bu48bC7Y1KO6DQpWwY4n1UaB/365fDW
	ywdOK+kTTorDYtnPUUzHGtYa1s+mC/xFqhp8tkRSGTBI6S6
X-Received: by 2002:a05:6000:2087:b0:449:31ca:5e53 with SMTP id ffacd0b85a97d-45e5b75624cmr24382596f8f.8.1779114726004;
        Mon, 18 May 2026 07:32:06 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.43.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a1aeafsm39564572f8f.23.2026.05.18.07.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 07:32:05 -0700 (PDT)
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
Subject: [PATCH 04/15] arm64: dts: st: add i2c1 pins for stm32mp25
Date: Mon, 18 May 2026 16:31:19 +0200
Message-ID: <20260518143150.3138712-5-dario.binacchi@amarulasolutions.com>
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

Add the i2c1 pins used on MicroGEA-STM32MP257-RMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

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

