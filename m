Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41BB840626C
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 06:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780640958; cv=none; b=iZkEWogKrqCsiOURP6jV36ekjANpFSrAr/cmuIHeCo1B4wD67APBN9hlwAshAZV4kUFUknQIt2vcArbHJzQBa5LwK0bAXu0WwZIJ2Bgs0Ftn9yvhTivTGRLic0offCf06swFBSr3cLlD9V3SfXX7/838b5acNL58DvIbiOmVAX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780640958; c=relaxed/simple;
	bh=97KY9yD7aJyeFaO9lx3/aKKgODbzwtq99a/1TuTW0pI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HboConKhE2LIQRUsbJ02MrgLP9PVl9wxoB3AStGwS/d26xLXnNW8rWLsgaDmWCpMQZV5qVYmCEM6T7WFpVwSAVYGKqkBovjM3o2OnIbOGM0+x59lA4d7nr2xyQx73yUz24QyqcCvDCSnlo8jShhWoOW35ec0sLxylnn3XfSpIIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=mJEngLBG; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="mJEngLBG"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490b8a97b11so16595355e9.0
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 23:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780640954; x=1781245754; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p6RQlMNeIE75J/aKW5bH4o7BGOBdS+5uo3qC0b6eFZs=;
        b=mJEngLBG5lMIrGZdBgrRnBg5bHE655soKBu0sm2RxrgdsZBK1mKF1e3X0lyk5iwdfD
         ixisqCdBS12N5r2+DtB/mdMGk2Tw8L489Zk5xfNV9I+/L5UZ9cCwm9gvEjOKxZbkaUF3
         0D1R14obH9TInXpM+NRUCKGLtfR9KA6rarpM8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780640954; x=1781245754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p6RQlMNeIE75J/aKW5bH4o7BGOBdS+5uo3qC0b6eFZs=;
        b=Mj3X2IBZ0cIuHXtdNMrLVsLFbBVae0iU2tYFTIo2iwnwhWdq3+t8vjw6FdwNcpUCKV
         m/Gozn2MDUWvFN7zzT9TiVL+ion/WdOZ5amkYT+Qci2wSiMaOGpAA/nrSILuylUMJzEe
         3qy1fX4otSMriEd35uLPwcBfos6nmfDZIbdlAwyQw2md4aEp/8T2EQP7RSWA8TJqRT/f
         uuyn/YoIY1NsysQU2d+WKGRDah1YLuCEyYn9a82XozBwA+ICuTfh+YWQCMUe8U8SCpnk
         VIDrmejXk4K3oDPKgm4X/n3SyWFNFDri7LRZyPxT9mf75VYWClBIrNytzGMeGZY0HLj5
         80uA==
X-Forwarded-Encrypted: i=1; AFNElJ+h5GZpuqp0xRBuo2XxGmFsAVCsI+48/O05qgKGr69XmXZt0jcQCyrjN5F+Q3EfGQEneWEz0bjj2xmO@vger.kernel.org
X-Gm-Message-State: AOJu0YxwzxtyGj830l0ertmKIlke5OdBoPPSTpQZR5OrjOz7d5qm0+n3
	tiM1tGKyrthUmaDrjSNWmqbfQTDE0NxUVqfH4dVI41ekgIk+M5KE+J4IFKWOW5g9aWM=
X-Gm-Gg: Acq92OFrpizqElOFQPtoIael1ZOVzoqqZkLW8ioDuobr0ZMcwBqNplDSq5rxFXfxtCI
	rPaPh++daNfqueJJweQ4Xg+IPtafBtP4QgGPFaqLtyFVA7Rg7ZEcHMn7JFBGlN30IkVP1IQH6fN
	g+Rs9+wp9skbKFxK/zIZLiLIcDiY4uOULZgSeV55QsqAmCHF+UUCSXXFYLbQgFIXPBb5xkROFH0
	lAe1xeFOalTg/3vkUwt6ECqELOFR6dflXctq0niasGYp0K9hmuK3xbrgEiJF4xb+gegaNyNcXAR
	8cgiZW9n9bAYU9bwp+cHZ5YxhmRGpKOPrI7lUZ/IXKA6NYXttMBA0/VK2Xz0yHYjEt2DxBtImzv
	vyXx34wIxesjDX7tyxxh4nR2KcaRCh2O5KPT07+zQZuqX0dKEpXiZFeR5XMtTe6knSfmLWKSFKx
	RQ3UXVyqWX4qF4tch+SnlmkroStGH6JatuEsECTnVhf/q2CJerTtxrxg/vOC5tJyrvSaROZHfOs
	jFrdx8tv/mKkwz92X15CmI/wTYUbDlUAtCXmVHWBOyZOUsAWepZ/XXAw/8qEOb62U70hdTkUyQU
	aXhlxoxfg9BdRkMiY0xsF12oRxkQdDe18p0=
X-Received: by 2002:a05:600c:4444:b0:490:b9c3:6c59 with SMTP id 5b1f17b1804b1-490c260579fmr26752135e9.29.1780640953655;
        Thu, 04 Jun 2026 23:29:13 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-82-48-44-238.retail.telecomitalia.it. [82.48.44.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344148sm23022648f8f.19.2026.06.04.23.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 23:29:13 -0700 (PDT)
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
Subject: [PATCH v3 04/14] arm64: dts: st: add i2c1 pins for stm32mp25
Date: Fri,  5 Jun 2026 08:27:32 +0200
Message-ID: <20260605062900.368376-5-dario.binacchi@amarulasolutions.com>
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

