Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B413F20ED
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 09:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787217466; cv=none; b=LludJpIpCIcizND+Wt5qak6ONKo+1+7roSw3j70OYdSYUaBLZQw6imK75BdWE8n8SthAsWPDdynhqyvk2nsV+vA56Scfi1lmqnNNkWPr9HeV0QIITOKKS8dBEMDIFU5tZcHIraXu4T1JmDctu2qUeK4cUKJ2QoeegGDDEXMqmw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787217466; c=relaxed/simple;
	bh=XHfr4CRXrnWN0Kfjzk3rhS0x4FlNEV12xPYeP2Bs2Rk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AsDYmuZJTYJ77RAgmuVZAPnp10MxJUDH5u+/7I/LJ/kK/bf87rYCyjI/FNWqo7Cr1SHbI0Nl5JOdSjEgi7WGoM2MxzimAh5TCVKCbFO7NDpEvW0RHME+R84DoFAk9LYbvoTWart//Bgjr7qFECRSp9vaQDBqApSbzcDWOUlvrjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=eI+I4Zx3; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="eI+I4Zx3"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47fd66a094eso714648f8f.3
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 02:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1787217458; x=1787822258; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mRBLPmx92VoSXdxagzqJ2+naqi+PaAYwGcy9TRSqAhs=;
        b=eI+I4Zx3XtkpIwLCt75hHXutmhNE65+z7zcBrqvgSbpukRMDenz5GB9i5zjPUNRT7h
         mKBp6SqsYf01x4xonHeJFC1+2kRZbOjQjP9T+NS14e0pQ5uvBLNaylYHP8SwbzVd1BKa
         GZF7DHXt0ax/bP2FLp6icmpOBsDPQChPvguH0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787217458; x=1787822258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mRBLPmx92VoSXdxagzqJ2+naqi+PaAYwGcy9TRSqAhs=;
        b=A9CPNbTTp5AX23/FOMQ0l1i4dfv/LHBf3DdND6P4DXimUPvzZS5naW57AKrm5n40HI
         87OaWyN28vnAcnUDkL2WO3U3ztLzJEhvTSGqv/K3saK2dPECOZkOIOVQ9vMkqOKmg+Sf
         PR5d4iRUKLgJEOjgCPYxpwJCloIuGYDI1Sh6s0Sb0Y6eZXF2dsPsIx4n9ojXY9lTsK/O
         m2Rx2JKcMsKjKrswF+t79XcSvFypT9GJcEWsXS7GZ2jdfaWy7ZA1PNjbWeMGEYpJs3WQ
         9c+1e/HpBg9BJFtrw0F2vfEXNblr2XBgMIRh3UN5h3v2KU3bxwIgolGC5+RAhoq5bOfU
         73Pw==
X-Forwarded-Encrypted: i=1; AHgh+RoG4hKObXg5MH28KrUkk03Yh0ujygKDH+Ultu2+68qadxymOcO+2hEIf7x70xzfzkwylfZor4iIPh+J@vger.kernel.org
X-Gm-Message-State: AFuF++kbueIlxYNe1hwmjqeZ5Q+BNrcOWWddAP19QISW/XHMQOPbfLnW
	sd2GAK9PMzNeakwPsPs3m2+ZIpNvecM4nRvHpI1rw6LR2XWAVZJffiSWH1lFYgBv2BA=
X-Gm-Gg: AR+sD13gXv3PO2g8Pn3Qr9BQ3jSq9ZUPYMVBgZ2FDBK7o1SYOc7oW+Q6YiLvD1dMGQf
	6OelDTap3bTC7Vouj5zBOQF06vDtmNwzPpnOTWUNwuR2bhAPwmq30zZUS6qqSvDoIG/KFZtdTXY
	cAmlejLVyLK/1grsF8X/IV0YVgQDU9E+Sovc2gNMhQZVDmoKkjdW1fxGB5aBsNLgLRucd2FUWfK
	xVt4mdW43urxh3SjHTm7i4ozBIs5Uu0Ml91/WgdnRYgfBRa9ca4KP5SLDQHWTWpYfzR3uJWt7aZ
	4LIhv6vARwXrWQwN4TofBcRxiMtrXZ/7JmSt/+reh+GiUPyoevy/KfoPY1KnXwcgLz14YEKZZ9g
	2ILxC+dtMc0Y8JJs9jHOc2qsDic4N2ggk5D2CAIz4xNDvfBa0DtI+B+6xTXr2LHSOmPqS12SKVq
	4uKjt0neQJeyorepP68Lw7musf2I30mL52D5+v47zLclXEyKRDz5ia0y7kpfGrIru2nNXHTPrrm
	TAKaR7lZkJXSQ3igxPMhD77UxONleFdJiXfCDqMDSLonkOxMojh/TxrTd7kTtdcWHy/2k0SlDd9
	5jorzoDLw//FiLi6YOHPOSBvHTkkEi4QOGJzCldMz0SXKmB0YFr5fn0HCHVz0g==
X-Received: by 2002:a05:6000:454e:b0:482:b886:4ce7 with SMTP id ffacd0b85a97d-482b88654b7mr5730485f8f.12.1787217457904;
        Thu, 20 Aug 2026 02:17:37 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-54-86-139.retail.telecomitalia.it. [79.54.86.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14c3775sm10021606f8f.26.2026.08.20.02.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 02:17:37 -0700 (PDT)
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
Subject: [PATCH v8 12/16] arm64: dts: st: add spi1 pins for stm32mp25
Date: Thu, 20 Aug 2026 11:12:20 +0200
Message-ID: <20260820091652.43541-13-dario.binacchi@amarulasolutions.com>
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

Add the spi1 pins used on MicroGEA-STM32MP257D-RMM board.

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

