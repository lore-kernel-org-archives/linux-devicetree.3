Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60DE33CB54F
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 09:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787217443; cv=none; b=I25q/a1FZ8+lNMu3JoItyf5ywEmG/DYskFNWtQq0A+GHEvAK7ICFNtZYe+qldAsA64WuP3r8bJI0GZeL4+x4kcQUbO4r2a3MSjP0HOVufMYav3h9fUrqJIPMLGU8aOla2wo+91FV/UNbbB8o0yq/rNtnkAPmT8NrQVP1CQ9g6Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787217443; c=relaxed/simple;
	bh=N1drtXs8SQVDUGBwf8jt0k7jq6QUto6H9cpreMfk51U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fb0HoIMcs9H+g7XpUh66Xm2VhveGUhaIXqNmxxQex8h3WCQSEXtld5jafAh6mVp7rKF+13mFSZLsqc7UKMhjg/DbPzBSavAI9QGsf2AjqZfwPhxZqPpaokQz0yyYmx4h8Un2Zdv3pvnOd54QTqgqlEYFgPB8h3WUtU7fFfrLjEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=gMv767UU; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="gMv767UU"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4954a9e8490so4910455e9.1
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 02:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1787217441; x=1787822241; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lP0X+h9e7/fNZIF32Rt952fZ5LhoAYl7zja0UrW/vTk=;
        b=gMv767UUSTd5CjVqUdsvOlAci7pNUTYmSvoZxCcc7GzelgA0Kbs1n8foBIZJkIsa2D
         qoQ2FWhucF990Yy7sgzvo7HZ55pSM6trrk8fEvpGnYePOICmwvbOwNQPOaN7ip2zI82o
         weoWUcd2DgKzEuyz8/lVr4DMys0kJpfvcVykQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787217441; x=1787822241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lP0X+h9e7/fNZIF32Rt952fZ5LhoAYl7zja0UrW/vTk=;
        b=bHUFZzzBqKa3p5iOIZs9W6QEyX6iTRuK2UfLkbBHBpYKcVXagGK/Ezztqdnof3O1y+
         hNuzefy+LNX4aMHF7F03uL28nzQTBCaBabhTUzOmINNYkVD+vNoymoqf6nWXs28IzSaU
         RrcycCLvN5X03ih6fRirtcmJhfCQSUleU0ugXuTUawIvKEO4fWuTd8xHnZYwFrvxsFFM
         tJjnV6hYkvOqeldYQNjqrJjqTHa+py8iDVI6T6bqtU4kcW3mCmx/qCycY40449BXg4r+
         qPZjniPClvrcQ+Gcn2JgAxzjIWbko/8cbP7YtizzrcLMsZxQLhz9t9WvotmBOSvwbssE
         WR3w==
X-Forwarded-Encrypted: i=1; AHgh+RrJ3jB163W5jgMMfzdET0644Z/esFGx4q2STBVfovNXa+AUcwzt8ukdu/35rdjYX7OCPaudtjNHj0/G@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4HVGDrR+DA1rGCM6SAnG3a2hORFJXJFQyQmKiK1hHmA/tZ97s
	FylrXTauUzX1FRGaTyoJat83HaHl7f32PJ+c5aV422CNmqQnN1f8+KIUwAdiZ8r2pDo=
X-Gm-Gg: AR+sD11mUBTZBR6KOWkRCzavFQGJ2zakHBvz5Vx4scZMPJxJxEThKan5t9sKMH/bvOm
	WDd3bOvjFc3BTMXVLmniZPZ8qtdYSg2TSeh6Z/6/WJI8UHRXTncdQdCVapKSjXtfuvvQZd7/nKU
	5/d/xzleOxT8hRXjkh5mFm9eutO/mt+9wKUkqU3kZRVTd2j5vx4iFP7uIGGAJ87oWYdmhi3cCh3
	iJQlRram/8KSxV+OSlZbQQhZrG/Oo5HHGrLYSa+xsTsMjP6DsZkZB7TbFNwVeSuG3f46co+yDsc
	IPHLdo901XPfoetuT+P5umj8DySJH5Du1Zt1F6aFGeNbHTblFaAQWheXWeZ+j2FSzGA2f2eOwbH
	5q+1mS3zc7nHIgZlj85PJ50mCuMQ9s8CDLBRpcqv12xf8eRvt30/QRRh+uRaPGgD6WAzTn/lYcB
	wfhOj82h06rcHIYDch6cGgg9qYMV3NV38BfMG7c7OmmsdGE7lG7/9M5/ZlyqJX4TwSsMcLwVJZk
	WTeebqhS/6V94RJnV3QF2mLju+GNp9WMnPQlXxXzCa4vTFpViXxnxG+GTPjx9vlpsvNv3r61vDg
	Q49MtoWXY9qXsCl3bFeXaw/vh2Ha1FZOOt3rLhhV1TxL5hVlnY/vqrMAeSC3ng==
X-Received: by 2002:a05:600c:a11:b0:499:a0a5:e13f with SMTP id 5b1f17b1804b1-499b06a5952mr46947375e9.2.1787217440660;
        Thu, 20 Aug 2026 02:17:20 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-54-86-139.retail.telecomitalia.it. [79.54.86.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14c3775sm10021606f8f.26.2026.08.20.02.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 02:17:20 -0700 (PDT)
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
Subject: [PATCH v8 06/16] arm64: dts: st: add i2c1 pins for stm32mp25
Date: Thu, 20 Aug 2026 11:12:14 +0200
Message-ID: <20260820091652.43541-7-dario.binacchi@amarulasolutions.com>
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

Add the i2c1 pins used on MicroGEA-STM32MP257D-RMM board.

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

