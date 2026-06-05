Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E86409134
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 06:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780640967; cv=none; b=m+y3czbLF9LZOVJlSH3tGoJkBq0KXUJ6hJ4GqXh/2y0jIex5flHu50TE5P0Ryckgj2E2XFUohWTtoxxIzBZXPf1oVdCoMZRT3m5KEmCKiSKnuZMyGApRBrvwCQ69FGwkjV4ooiz5fr7fucvOm/peP3K9231r3QovyVtW/KSTyZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780640967; c=relaxed/simple;
	bh=0CbxIVBYXVwiSrXOvX8E9FYo1CJPet4hsL45pHulX6k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XG/UhNlhKdI0cyKbsevyMjFHJFRwJ36/0kp/vac3Xo+1bhd9PBkXBAWGItJ6ou+FHftD8iswXDltpfYMB+GWNXCrrmqOwslXs93Oku9KmmhWRd19tA23OLSet4tAB25Nhiz4M4KDHmYE6Tis62AypZe0QfkNrQuoFD3KYZzaI/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=ruYxvIIP; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="ruYxvIIP"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-45fd461e4a5so1061113f8f.0
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 23:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780640963; x=1781245763; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kXBts3WbuCXiU0EHch1WC7B0zhmdg6BYHc3PSPue6D4=;
        b=ruYxvIIP6fSe6GqRjMxWIE15eNqGOtCVjRrAogbEcw+gHqD7GFSsx+Dh8VLewgVi/r
         nix9A+O16FlaxsnnEgXgMbK16rVQnxPGGoZ8kgyF6KYNtfo4RBLW1izoH6wdrkF3r74l
         SBEFmqJsbIASNCJkKpu+VTXTqGxhb7MzYSZgE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780640963; x=1781245763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kXBts3WbuCXiU0EHch1WC7B0zhmdg6BYHc3PSPue6D4=;
        b=czgxmvtjUBOJtn32x9OpwOlg1c01cBcmNsa4eRAavGrVEFeQJPRl5EDl6hcjXLOgEo
         f7TXUpKKwQ7YzNuMeqP6lhdjJFhWm4JQDwXvX1CPwmdWOla0yUL3TCLJiArM+Oxpm1sQ
         QkUkhBzsYyBCkztTvB8sGB18Bqvqdx2+BHrkS6nLbZJZeF1brThksxe4LOde1a1oDBIw
         h4gbh7/CxNRqWtWeAPaSrMV+CicfbzWPRICIXuFCplInsMo7b2FCJLGR/gO83tqVX33k
         AmCJbrFUilJDHCp2Gqs0StsD/ulGir4m0JwPHFZqj6Z82ooKkj9JQu+bL82UP6Njw6Rf
         lSFw==
X-Forwarded-Encrypted: i=1; AFNElJ9mNgg1hCMwkzFHT7yY2+gPGGlaKgfjRwrmqVOLFR5uDekbCYYSN0FtOe938bSYTojh90bi3NTGV5jH@vger.kernel.org
X-Gm-Message-State: AOJu0YxzqERxzHJY1xr2vwGDj5q2Ad0Osu7a2lLG2MIs3G/NGUtICbYQ
	D1DL/pJRGaDHaPjgPR1IoxzQBBhrmBs3V0QVy6y/FdFK46LfGgHsp3EIh8idUPvJSG4=
X-Gm-Gg: Acq92OGfyNdGpV0s2YcgOTJz4zk5sWqMOjocyR66zJitWyAY8c5fLnOyxlLjtk9KvGz
	n0FD1UMZxn4w33T3c4LGX2ZrCqo7HdmArBChO2hlGwtiBZJlXSC9Rg3r/SscUPObFk5m1QWDMew
	3h5PaRIglNbscBPC9y/XQbCf1giylRcAo/XRzzekcSx2JEkT7GRarHWHTSjlejipuRy0jOKe9iS
	nGbWsKRdMWWnpgMyWRzAJ3JhkEPMjWGFl2C1PKWbMqMRq49ajoJmcK7n7b0DdVfQpD81lOXjWro
	ki8QhNRfQ+iZHn/nXUtHhFPU6KQR6rw2peD1UjkkQAcm616PDxKF7CBoGHFMdafG10PRq/zpqdT
	ZU7Yw8wX+lmwLvdwkcmmGQf/hAMpDpxHtl9qBL/LYLRswFCVVPagUCTw9+zmQ8/pU5+RsawRW2O
	Pdh/voyXeQ/WS0SOy88pEC6kRXtykqqVytqjeQ8OXclY+EPjCqjPi8QyxUVgPV+QRJiE3UiXj5I
	GXASHp5eXYt3If1a9+HUPnG4kQ8p/a9oEYteqjoJen815QXQ/m/4Y7M+g/FwYVQb7FVJXIyn8+e
	iT3YXM2kBK5X0/aO68uhxsVqcTrkQDiQcpQ=
X-Received: by 2002:adf:e3ce:0:b0:43f:ea25:20ff with SMTP id ffacd0b85a97d-46030751cf2mr2327348f8f.29.1780640963362;
        Thu, 04 Jun 2026 23:29:23 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-82-48-44-238.retail.telecomitalia.it. [82.48.44.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344148sm23022648f8f.19.2026.06.04.23.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 23:29:22 -0700 (PDT)
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
Subject: [PATCH v3 09/14] arm64: dts: st: add sdmmc2 pins for stm32mp25
Date: Fri,  5 Jun 2026 08:27:37 +0200
Message-ID: <20260605062900.368376-10-dario.binacchi@amarulasolutions.com>
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

Add the sdmmc2 pins used on MicroGEA-STM32MP257-RMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 80 +++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index ab1e62cf2bfc..62f898a55d45 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -622,6 +622,86 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	sdmmc2_b4_pins_a: sdmmc2-b4-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('E', 13, AF12)>, /* SDMMC2_D0 */
+				 <STM32_PINMUX('E', 11, AF12)>, /* SDMMC2_D1 */
+				 <STM32_PINMUX('E', 8, AF12)>, /* SDMMC2_D2 */
+				 <STM32_PINMUX('E', 12, AF12)>, /* SDMMC2_D3 */
+				 <STM32_PINMUX('E', 15, AF12)>; /* SDMMC2_CMD */
+			slew-rate = <1>;
+			drive-push-pull;
+			bias-pull-up;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('E', 14, AF12)>; /* SDMMC2_CK */
+			slew-rate = <2>;
+			drive-push-pull;
+			bias-pull-up;
+		};
+	};
+
+	/omit-if-no-ref/
+	sdmmc2_b4_od_pins_a: sdmmc2-b4-od-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('E', 13, AF12)>, /* SDMMC2_D0 */
+				 <STM32_PINMUX('E', 11, AF12)>, /* SDMMC2_D1 */
+				 <STM32_PINMUX('E', 8, AF12)>, /* SDMMC2_D2 */
+				 <STM32_PINMUX('E', 12, AF12)>; /* SDMMC2_D3 */
+			slew-rate = <1>;
+			drive-push-pull;
+			bias-pull-up;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('E', 14, AF12)>; /* SDMMC2_CK */
+			slew-rate = <2>;
+			drive-push-pull;
+			bias-pull-up;
+		};
+		pins3 {
+			pinmux = <STM32_PINMUX('E', 15, AF12)>; /* SDMMC2_CMD */
+			slew-rate = <1>;
+			drive-open-drain;
+			bias-pull-up;
+		};
+	};
+
+	/omit-if-no-ref/
+	sdmmc2_b4_sleep_pins_a: sdmmc2-b4-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('E', 13, ANALOG)>, /* SDMMC2_D0 */
+				 <STM32_PINMUX('E', 11, ANALOG)>, /* SDMMC2_D1 */
+				 <STM32_PINMUX('E', 8, ANALOG)>, /* SDMMC2_D2 */
+				 <STM32_PINMUX('E', 12, ANALOG)>, /* SDMMC2_D3 */
+				 <STM32_PINMUX('E', 14, ANALOG)>, /* SDMMC2_CK */
+				 <STM32_PINMUX('E', 15, ANALOG)>; /* SDMMC2_CMD */
+		};
+	};
+
+	/omit-if-no-ref/
+	sdmmc2_d47_pins_a: sdmmc2-d47-0 {
+		pins {
+			pinmux = <STM32_PINMUX('E', 10, AF12)>, /* SDMMC2_D4 */
+				 <STM32_PINMUX('E', 9, AF12)>, /* SDMMC2_D5 */
+				 <STM32_PINMUX('E', 6, AF12)>, /* SDMMC2_D6 */
+				 <STM32_PINMUX('E', 7, AF12)>; /* SDMMC2_D7 */
+			slew-rate = <1>;
+			drive-push-pull;
+			bias-pull-up;
+		};
+	};
+
+	/omit-if-no-ref/
+	sdmmc2_d47_sleep_pins_a: sdmmc2-d47-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('E', 10, ANALOG)>, /* SDMMC2_D4 */
+				 <STM32_PINMUX('E', 9, ANALOG)>, /* SDMMC2_D5 */
+				 <STM32_PINMUX('E', 6, ANALOG)>, /* SDMMC2_D6 */
+				 <STM32_PINMUX('E', 7, ANALOG)>; /* SDMMC2_D7 */
+		};
+	};
+
 	/omit-if-no-ref/
 	spi3_pins_a: spi3-0 {
 		pins1 {
-- 
2.43.0

