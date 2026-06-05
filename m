Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21CC82DA756
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 12:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780662020; cv=none; b=HGz7sSH402duudcDJIxbb8BCJ9WvK/uKlSYerpU9zUhVR/AWdjMNJF3FjBOTRSprEHSh0r1E/HpmQIjKx1eVd4IjJerh++oBtebeOzjuYAsvAIPFvvj9gjfVo8jDF3/6Z2kcBk36PEZodMXwaKdbnE5OAPPnvDKZ7PmvL/jYUB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780662020; c=relaxed/simple;
	bh=smK0LMyu8EXiOot7ocNTu7szAih1Fd4nfquSIb6ZAtE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tV3PMsqXBcRBO6pID/gxn7dMQ2jqgkl2u/zcf5uHLhRLoozx0J9Yakpp2hsUlmictjjsS1/afvHTA8AYbWSqjuDc3HvDXLk65DljjE1aZ+ogXjYUZ7mu1Ql25vIO9lPvFsc/qLT+qEoSQVL8o2GcS2dQp6OQ8qXMdaMy7Lmub1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=SPFeynmE; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="SPFeynmE"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-45ef29c5561so1050789f8f.0
        for <devicetree@vger.kernel.org>; Fri, 05 Jun 2026 05:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780662017; x=1781266817; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DRVbzjeKV1ymytOpSDZJEn1esg8I6P0sJ/LROeeCjqc=;
        b=SPFeynmEIZHojRtCB4fPYvOgzon4G9iiZo51aJswhUyA4ROKrePhCpgyoI2x200WPU
         vBsOPPItVZ4dvmkLZ9fNP1QnR5azdy62qPfMRETt8A6L5+jUgsgOsbN5cjIC7vMeHfUm
         7uvm2yNCGigSQz5KkFC7pbQkY7u1V7O5JCi3w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780662017; x=1781266817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DRVbzjeKV1ymytOpSDZJEn1esg8I6P0sJ/LROeeCjqc=;
        b=M4Sry/a0OEPrtHIZXJriSK3XJh+QM9ifsqI+ZUTWvDKYKsYp/1JAsi1+AX4Bimz4WF
         odp4O1d9AJ+HO5OZZYlH25AiFakE2OsW2UtOp645KKHdzWoUXrbexoMI5cFmbUYBHesm
         NQCKzL8NB2KeFf5REfViWXUPL3GXeD76iI15xCrNZEhDNR07NIe0gABwBMmJHGp7jPJl
         kP+ouunkgJXKITuOvbfScbTLx9+di6VUhBqQkPmGvv8X3rbmb3TG/54K4buBawz+Q1XC
         1voLSCNskXxhowgngvanGjU8rmi/AN0tRt6B7uqiGFS9gfkcCsLRqzg8xwmfC2QAOWkC
         DCdA==
X-Forwarded-Encrypted: i=1; AFNElJ81ANTYYklrzkJuHSyjsPzmlUKCbo2xo2oKc7h6GtHQEoBW8JqsRj3oUeE30Gdad+u3GOaXEsUWfk4j@vger.kernel.org
X-Gm-Message-State: AOJu0YyTtXy9xktt7r6kpH2P9OCpq5BaZhZObcPW1TKHU61IvMECiNO0
	Tsr2TbKrLg+mwF5Qmb08AynxkY15BwUmhXIFi2x7XYXnGcDy9rwoGykhghORmxXI4RE=
X-Gm-Gg: Acq92OEAR2D/Tv/ACMG6sPqv9X8UOx5yax3/BOb67P6U6K5PWILzpvhyHKyYbevzUid
	bMFO/AmprofrnN+l1IV72OrSBIquPFl1zb8kBMOCwOEGQVsExMHFH8OQPrj47X+xzZNE479ikQo
	yNYLui+eK1XuQNpiiR75gU6LtseitV1X/dn5EWI6qAEHo/vXzZw3CEjDDciVlU4AMBYHMX4DOh6
	H9ZaWM7i9rO/OP+EcIOfiaV9CcEsvVIslIgpxv+RlQfJ3FYThTNDsMqgIZpfZWosYWstDuoRBxN
	fyKJeklZSGlL21cA1z5YIQyh6uer2hDgA5aNFz4CtIRVpPzVAfiDjZ3+UlPjVbJlYXs9zrFDdm+
	mGZFziY//0gUhdvxPp5fCwhUIP5FGVcJ6Lv8Y+691hlNqezzN5qm4ROBXxJf/xUIMOHVJH49Xyh
	lUK3kxg4MwLsNvk7FgAa9xWn/QRG8bFVtb31U7WFxIAYu+xBtemBvitcia1+RriUctuSWR/E5G3
	HaGcijKTWv+hFAsTPy2cLyVTEwS9QzGGgJ/0TyiJRBaDBj7H+LN180ZX3p0e4EoKOiSsaeUcS/y
	oNAcevze7NOgCWKnlI0qiDZswhdKXbgcxak=
X-Received: by 2002:a05:6000:b82:b0:460:1301:dec8 with SMTP id ffacd0b85a97d-460302dc4a8mr3890971f8f.3.1780662017493;
        Fri, 05 Jun 2026 05:20:17 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-82-48-44-238.retail.telecomitalia.it. [82.48.44.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcb13sm24785883f8f.2.2026.06.05.05.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 05:20:17 -0700 (PDT)
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
Subject: [PATCH v4 08/14] arm64: dts: st: add sai1 pins for stm32mp25
Date: Fri,  5 Jun 2026 14:18:19 +0200
Message-ID: <20260605121957.78409-9-dario.binacchi@amarulasolutions.com>
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

Add the sai1 pins used on MicroGEA-STM32MP257-RMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index eab8ebe71660..ab1e62cf2bfc 100644
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

