Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167F943CEFB
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 14:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780066056; cv=none; b=WChb1GsVqyU3Ap9vUeHL4S8qPqbLW5elGiuexer50QkwKBe/Qoy30GX0o6X2+RODjkBgn0LP0njPxfdFohTN9jApdwp92Uz66oj4cGz3GEMmfpPMoOVeYeAR4WCn8fMVDi5nMpwhoHdR6C8tIB8EhQnxCvYGUWZOON5FHoFYxkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780066056; c=relaxed/simple;
	bh=xm9o/8BeY4wIz/OiA0rY2K8FPUtC6PGvOrywQYvKq+w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NmpTXn5QpYe1No/+lQW2WU/qkeV97H/2ANWPHMcxXBR/0bhUjubmPb1r2kSPJzew01dsUOx4dcMub8KUDHmpXQNP1++2vnWYvag4hlLs6kPDeSzQ+r3TVnelMTRXr0g0rvuCLUbFQE2q84DrSqRTlvnvFk8tdtixyC6g++ZomYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=Z8DcA+zV; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="Z8DcA+zV"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49048e043e5so61932825e9.1
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 07:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780066053; x=1780670853; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rQ4ASpkWIwpAgEFSrqIIvG0Nmxdm6HTzVKFF+4kwu28=;
        b=Z8DcA+zVs487wE7SPswVg+9+ArhYJlugON8qE9yFMS8tMKOPlJgcSciVxie+jPd9zi
         B6LDhNC3YiEwmC7b65HTgjsMONtBBP+Q01RVhEf8+SVFMi+E/KFWRkTblPXvybGh6CRV
         If8BSoJmQrNEdTjpQP6NxyC/fQLsbwq7HMIyI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780066053; x=1780670853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rQ4ASpkWIwpAgEFSrqIIvG0Nmxdm6HTzVKFF+4kwu28=;
        b=KAkB1MdYS86ucsTLgUQTQPZqxZerXCrsim2sG5ePUW/iVe7fXC3n6+Fx9oszSNp15a
         VgnJCeNnEinfjfKZz+rFXjyBJIgMtFgGHiElwBSW8+ZPl/SHSur0YNITkSXpXRT7SMRr
         rM9AV2IZSYBKes3/3EFgKUJVEPb17kll1w1OwCItKIvZks5y4B8pwYQuYUvEBk8MJyvU
         opt/KWbQjVwAQIp7VQCkK4VN9H3Xksc181UfE5Xsc1Av59TLeic8U+2QQqBIWtiJJwJZ
         Q+8/3zmmnFVjgChgIWbH9bhOfq+rPSPZ0w9xdo4KAE3qvd21Vf/iYdqIXP9THAeJ8haZ
         0lpA==
X-Forwarded-Encrypted: i=1; AFNElJ9NN8tqf9tVFe3Gx57FQkkbt32PKfCTWF40oE2AAaU+dXLqcYOubqI63/V2pFGyqBLej492VsyaDaF2@vger.kernel.org
X-Gm-Message-State: AOJu0Yw30vv0DZHgDJ52Ys09y5OM1S4v2QZcjS8HTfY2y9Wf0YUHcq08
	sPvId50xHW+9CFxl5lPIMXD/nn1BnY9a0lpcIB0zF+Ffrwm5m3XbyhFUeAVQIRmURYk=
X-Gm-Gg: Acq92OHTncE9h+VJxBaAHhOXrZOeKVI0n0AcC0Fyww47yg7WM3xo/1T57LMNGZVGPbh
	MsP73NWttpRa+JhBDZHVNbno23KpYB1agsVVdjk0QCqAk9ZduOClmyy3JEbk706MqG0BtIRJxfy
	59UQwU9cgBeHMfIQT0cd0SIXBDsXsxjuKU8GdiZKQZaWf/xCA+Qv4B1Z69NJl+KBOwMnI7f4s12
	ZJEKG2Wv+3Al68hHqsETRzsgr9B561TsDTSBVKBoSTA+1at0evy0bk8/mpp7zjUZtrRGRqw/wqc
	D72vlnSd2YBoMAUUgemWZCPofj793QYIR7tAFS+BCC55xuAbpdTC6xjJou+rTIVm6Tnf0zN7nkY
	fQ1DIkLkqCAKdaQ8W2rqx8BNkk+V4XWKQ4i7llAE5HgY4RB4Hc83t6bBPSfALUp6khF2YgaFCwF
	JkrgbbIvbEOmcNaWInFhOtpvonUrHC+9iwz1ZSiJq2BjlFYm4+oPeY6yZEJbEz2nnBF8SlgPYH7
	crzWeSRVekZGqKxsPls7+6R0W+6XDAjPGVwkkxR2pzE81SVlcZAgIXRB2Q=
X-Received: by 2002:a05:600c:5298:b0:490:59cc:999f with SMTP id 5b1f17b1804b1-4909c072254mr59473585e9.4.1780066053568;
        Fri, 29 May 2026 07:47:33 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.43.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909d6eb470sm38694785e9.10.2026.05.29.07.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 07:47:33 -0700 (PDT)
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
Subject: [PATCH v2 10/15] arm64: dts: st: add spi1 pins for stm32mp25
Date: Fri, 29 May 2026 16:46:24 +0200
Message-ID: <20260529144707.3931919-11-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260529144707.3931919-1-dario.binacchi@amarulasolutions.com>
References: <20260529144707.3931919-1-dario.binacchi@amarulasolutions.com>
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
index 62f898a55d45..46c5197dcd63 100644
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

