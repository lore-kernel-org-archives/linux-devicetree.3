Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894FE3F0749
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 09:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787217455; cv=none; b=BcK3iGYF7IpDZFQej0mz6dQ9qF+5BnTqJHCdvyZwfVYgaC6WQwjW7yYfNjvjVTuQuArhUjZZWTOmIIiZFr7z9ALqcex+LwJHZ9FMincpuK8L4geFwCktPTfokWhgYM+zfIuElPsCteHdxwsxKLIfMlqVmX/H4aPwm1ZqVwkBaiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787217455; c=relaxed/simple;
	bh=2ro3N2gu216X+b4jus4PeTqnAmT6QDenUUpDthH9IKo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GFE2jmUmgtB5AhHOYOEH5KsPTXzzSltnoTDrBXFxp36OkmyidbG8Z3BXTmVhrFIYqQ+Ptt+sQFuIi/CVvlnbLvTvzesx6itypjJVtfbVlPIvVjvsKiBPOHULe4vIyVCAx/KU/g+jMgTCZ6LF3Fx39OfXc9sUNQNqeYUV2+ubwWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=XRxFEiUu; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="XRxFEiUu"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-471eeac43bfso1594424f8f.3
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 02:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1787217453; x=1787822253; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V/TgA1ms5o1kz/OHwnBtI4m8pkTBDPOZtX/J4iEGrn8=;
        b=XRxFEiUulBOila1lB6UNLniWdjbPKxIbt7BTYVghYc9otwc5yvJmcEKVszJ4M+tmZC
         tcs43z9zC6ezxUSVbzby5id8+BIfYQ0fHJRY4Av55srXRHe4TM597SMC6cWdlyx1H3EQ
         fI/NiYOCa8heOlvSe8J1P0ZI6J2N9j+bYR5jc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787217453; x=1787822253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V/TgA1ms5o1kz/OHwnBtI4m8pkTBDPOZtX/J4iEGrn8=;
        b=WeVGEQKrFVelOmYCEHljWYwRV4PMwoB0EXnfSsBhdHxXt4ld2XycxZfytNnD9zbUeC
         ekZUP5yHkcY8AUPqFLwYX+Q1GUM1GFKgvjAenFHLIpPtnhO15Rn7yIyIMS8yxkWEmpEp
         OQ8Nvt4Z/HOnOINt2H4jEqP/nT29uaomCVNq6kAUIaFNYy7e65JkQFkS/D1dTeDFbSXE
         QCPhxHnfnyYqSpmLQQ+k3Umc9s5Klb46IJ/rl1Dz80QjRtfnNtCkv3Nev9CJ6HkwsFO9
         vnVKMrfS43t9BVJ3xEZUAhEktL/0Wl6uBmc7TpNcb4+FlCLZQtLL3Vfu85NMe7VE0669
         0WLw==
X-Forwarded-Encrypted: i=1; AHgh+RoiffFIzUta3EjZ2t0Y8sSPshfHdbQ2wDzMNzLhxm0cB4wS+T0gD3VzK/+PVT/0dkiN2fUUQxR5/UW4@vger.kernel.org
X-Gm-Message-State: AFuF++m9gB8Jl5yvVqkRSUix06mYw37qv4M6ZvaXcE5CSNPUVMT4iz9G
	a6aUW2JEKk8oVFliHTI3X11GaeStxekUE3mT/6jRBRlj9crAT2Cy2arxn+Y5Wx0hRnA=
X-Gm-Gg: AR+sD12gCqmEpmb2hL7Pu20QaPq/8pgXw3uJmaEROJ3xtzcvbTqAL9vSqDOxOWTxAFq
	TmCSksCBFenayKfF+3F2FvdosLijHc9UPgeZ+/IDLZb/grOYkL8b1apJea277tzhl5jxUj4V1tE
	8k8NKi7G5XTWUR3VCGwHQKYwZawx0vb7Av22ouyS+pN4QgR+HdtZvKnwf9hLXjQaVQ4ykyPh6qr
	01FxrZA3mgT4nUi8YueENp+TyqKPaoptg5bvi4xTDFV4yFL1CEd4Fnsr7yd9epk2GRwUxPjWpsj
	PnFDH/3uWSY68V4DMZv5bAE39kFQRY8Yara1qJEk5/wH70Cx6BpeQMKk81BjqMAxdeUnL4Cutsm
	XqZX0/NQRiNCe6BBxkq2G6RT76tSp4+K9JaiDxt2pwb24GoSt0OdUYL/RffYNgcmBrXAUnH+wpu
	3beclBASMpDPgo0zxxRPnylISHalcfBJZMPapqFuNyxZXlG2GglS0fZ6i7JT2vckVP8U4amrCA2
	YwmbB4kNHcbrdJ1lIiHAnbK0f/F2qzRPVB0orsla0tHZRWTYHwM4RLZv43y7t2XRbCol7q5xubK
	eIE6hpQgteG7vKjV7uSgaLPadtkg6k5n/vS5CditUxpWxiiFK5Dc6ZObTTMOhw==
X-Received: by 2002:a5d:6f1c:0:b0:481:bb82:3f31 with SMTP id ffacd0b85a97d-482b1e9cd64mr19985456f8f.10.1787217452857;
        Thu, 20 Aug 2026 02:17:32 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-54-86-139.retail.telecomitalia.it. [79.54.86.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14c3775sm10021606f8f.26.2026.08.20.02.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 02:17:32 -0700 (PDT)
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
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v8 10/16] arm64: dts: st: add sai1 pins for stm32mp25
Date: Thu, 20 Aug 2026 11:12:18 +0200
Message-ID: <20260820091652.43541-11-dario.binacchi@amarulasolutions.com>
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

Add the sai1 pins used on MicroGEA-STM32MP257D-RMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Olivier Moysan <olivier.moysan@foss.st.com>

---

(no changes since v7)

Changes in v7:
- Add Reviewed-by tag of Olivier Moysan

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 695c9d771853..002fbc724b9d 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -520,6 +520,51 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	sai1a_pins_a: sai1a-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('D', 9, AF3)>, /* SAI1_SD_A */
+				 <STM32_PINMUX('D', 8, AF3)>, /* SAI1_FS_A */
+				 <STM32_PINMUX('D', 10, AF3)>; /* SAI1_SCK_A */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <1>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('D', 11, AF3)>; /* SAI1_MCLK_A */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <2>;
+		};
+	};
+
+	/omit-if-no-ref/
+	sai1a_sleep_pins_a: sai1a-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('D', 9, ANALOG)>, /* SAI1_SD_A */
+				 <STM32_PINMUX('D', 8, ANALOG)>, /* SAI1_FS_A */
+				 <STM32_PINMUX('D', 10, ANALOG)>, /* SAI1_SCK_A */
+				 <STM32_PINMUX('D', 11, ANALOG)>; /* SAI1_MCLK_A */
+		};
+	};
+
+	/omit-if-no-ref/
+	sai1b_pins_a: sai1b-0 {
+		pins {
+			pinmux = <STM32_PINMUX('D', 4, AF4)>; /* SAI1_SD_B */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+	};
+
+	/omit-if-no-ref/
+	sai1b_sleep_pins_a: sai1b-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('D', 4, ANALOG)>; /* SAI1_SD_B */
+		};
+	};
+
 	/omit-if-no-ref/
 	sdmmc1_b4_pins_a: sdmmc1-b4-0 {
 		pins1 {
-- 
2.43.0

