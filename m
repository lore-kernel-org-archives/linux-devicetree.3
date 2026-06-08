Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A923D812C
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 14:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780928556; cv=none; b=Y4VFncDShZATv1lb4BTZ1CK6bDwOy+r8i78BuyVTEoyFxPDpR2OmGYS7qUHQ79wsXd3SX7R1EUAZjNrytzEgrA7QnyE8KxAUPKHO01HO3iguK+ABzuxUMPoIaO9mNA4k5w/9m/Y0IRjDbepN8IbybRHeHES0f6zRVnBdJ3Oet7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780928556; c=relaxed/simple;
	bh=GZ78QjzKDDNGoyRoAn/QMrlXryuc3bKg/B9njaywveA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uvixDyvC+2iGvi6EQccLcCMMDdcoi1uIDYcyhe/Cm7gnKzFMdW0cd9TdGm9FQmKGVR76CWcwmCfpcDXfK9sLwPY+DJKvvpieGs5F6GVq19hoUwMNv5lkkkH2+QokwKrWWU0aX+qaAKpEME5EeQgEg3ddYB1vV0FjXeKDG1quw9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=dFoDY22a; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="dFoDY22a"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-bef8b97655eso859290266b.0
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 07:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780928554; x=1781533354; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yc3m6zr0epBkIc8UOZHvvBVuU4YMP+mrPgxq2NBKnzg=;
        b=dFoDY22auEoOJxyw7MEz8TqE3+qwg+nmwpSZULctBoF9928tUA8UlS19CYk1Mp/xiX
         lsoPc1lsG1QSlvxDkEbRdsIF6BBzwKmfIB/vscTwV65b9CUzKPknkFeoLnUxNCJMMGRP
         Fm1np/TSxqtanKHodhDbQ1yxlxhHVMx3l7s7s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780928554; x=1781533354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yc3m6zr0epBkIc8UOZHvvBVuU4YMP+mrPgxq2NBKnzg=;
        b=ietpP9+L0D8Hkmb8kzC74Cp7PY6HzBfV/8X7edVMhttSzHJxycsHUYYdBtH2bo2B12
         2LT6NQyZG+31u0Q6rX4ct9bWBet3tVw9/niOLFbEQZksqQmD9nGJyOcuSCDvsOXB6nG8
         nwBkugnDnvseTlNlEBzoAF97fj27WW48iq6higiPN9rRrI8m7Iq85S2dCyfLS0cc3kpR
         jwtJiYwP0DsNWb0PASdWBq0UFffW//bxkaO/4lt34cHqyNkdTmhunQCkshUbaWwbD3+A
         1MBVkMjo5s+jurUNnXHvxbi40JzkLflqJZFrFd8G+asE3nOrtAibjffj//7S31HV39SS
         wY5Q==
X-Forwarded-Encrypted: i=1; AFNElJ9M7B+6d0b5AuNbF45jRfGXG0QdHmmNMQ8jxS3dNCYsaazVXp1At3eVV+qv4rOcgh05nsR6dpSgeUm6@vger.kernel.org
X-Gm-Message-State: AOJu0YyEkBAUOjkbS6U3A3Y5OIkbSykvtFIV5bRcsOjidXPwKOhxkGCV
	H9GJIIJnQojFB3zgxKAhxhp8c5v7ciHNcXFziViAArEzWr+Y+93tHBzVEWmSKo96m2s=
X-Gm-Gg: Acq92OEWlEBffTyo5CtRe68X8vgV6XjqK15D5EU6Qm76vR0WIajDfYeXzB2WjqFVZvt
	irEaQrNNbvZR/zqNfay1dQuDwm7oVfULhmW9rEBcM1r5vQx3HHNAmpcBpeIkA2cQNgIx8MOfb+u
	GcBqKlVwGvQtVgIeI2q51CASs8ReXeLccYJ00ovQ3WjJl3wDTUaf4Mhv39hjgsv4jMIgbfdxk9G
	wgYzcYhQW/Q3Y0a+STwx0MePIznzdLWJdnu1XGx5S+LNAO04PI2vYzCM88xwR/mwXkWydysyyI+
	yhdNMjgWFOHnYhLgD+ZlnPPfWfpQ5FnSO5XVoTxyu5mfwpdGf5TJZK0FYnHJCS8oOt/r5y/Y0Ui
	22octbNMpnzZjfg+5gtxfxByOa9VXcXh74nfrxmOo7r1aV5rIyvj3fD0PCN6oXXtRWcxowGXnbU
	OewMQrDps976Qg2iQxZKNpo4h4gDoh/fMRkcX5QJKWE7YREFFqh+ePnKtl2h/GMwum58ZdRqfi6
	rUIMb3HzsvuAgKlHMdtV+9uLlugFYhPWlHK2Wl9Fk+RXcS5qDVWppXIt0Y=
X-Received: by 2002:a17:907:1c83:b0:bf0:e345:68b with SMTP id a640c23a62f3a-bf3a8f1269emr641900566b.18.1780928553442;
        Mon, 08 Jun 2026 07:22:33 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.42.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf055307a35sm881847066b.52.2026.06.08.07.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:22:33 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	domenico.acri@engicam.com,
	michael@amarulasolutions.com,
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
Subject: [PATCH v5 04/16] arm64: dts: st: add SDMMC2 support on stm32mp25
Date: Mon,  8 Jun 2026 16:20:21 +0200
Message-ID: <20260608142221.952245-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260608142221.952245-1-dario.binacchi@amarulasolutions.com>
References: <20260608142221.952245-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SDMMC2 controller supports SD cards, eMMC memories and SDIO devices.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v3)

Changes in v3:
- Add power-domains property. Suggested by Sashiko.

 arch/arm64/boot/dts/st/stm32mp251.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index b3416c928c08..cd85527ec450 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -1668,6 +1668,22 @@ sdmmc1: mmc@48220000 {
 				status = "disabled";
 			};
 
+			sdmmc2: mmc@48230000 {
+				compatible = "st,stm32mp25-sdmmc2", "arm,pl18x", "arm,primecell";
+				arm,primecell-periphid = <0x00353180>;
+				reg = <0x48230000 0x400>, <0x44230800 0x8>;
+				interrupts = <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&rcc CK_KER_SDMMC2>;
+				clock-names = "apb_pclk";
+				resets = <&rcc SDMMC2_R>;
+				cap-sd-highspeed;
+				cap-mmc-highspeed;
+				max-frequency = <120000000>;
+				access-controllers = <&rifsc 77>;
+				power-domains = <&CLUSTER_PD>;
+				status = "disabled";
+			};
+
 			ethernet1: ethernet@482c0000 {
 				compatible = "st,stm32mp25-dwmac", "snps,dwmac-5.20";
 				reg = <0x482c0000 0x4000>;
-- 
2.43.0

