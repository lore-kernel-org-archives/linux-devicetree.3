Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BEA1315D3E
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 06:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784096551; cv=none; b=sMi8+e8T/QYdEMGjhnp7c9rwIgyJdGAwhCjEHUxuYGRCQDuWGm70bYBWN+4E9QJ3AkcTDVLYwr8pmvXjIOay206IlsV22SsU6cW2XOLqYI8RFLh8JveTE3OqvnehH74f6vWt/1WD6Om7kahXVKY4ALQ1R5NsNF0UvpPdY9EqXV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784096551; c=relaxed/simple;
	bh=H2YwgLpeEoUgwkXMc0nAyFKniAzF3scYINRPengKJHA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ErZJrA/9cYHbLfl1q7Mb6romndqBNbf6res2Y+R0+d/HZWuaSzISe1k3ObsX7Mr3dNX32obCC8qH79GnpCOOyUSdbX/zCHxQPrYNTH3PBM6QhYgJxyEPZoyI43csJnKpilyRu/zScUFMM05SYCWI/Wl4s+MaHDR7EfLwY2wWut8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=h/rp6IbB; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="h/rp6IbB"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c166f1bbeaeso174625766b.0
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 23:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1784096548; x=1784701348; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mf08+e18iQyaBCmXia6is7dzqtiU26q8LvKBSudwg7A=;
        b=h/rp6IbBaV6XqHYI7YyFniTCjEMdsFsjWlNZ4lxqcUtAXx9KXdi3vYpD+69WvAGYlQ
         ElwcNIB8Urv1q+zyQFBEUmc6nQ2UocO9IN50A4VNRxuKgm3EAWSb8rWckeuhrlrvN48f
         3oREKmEvAHnzVyofVFNpF64xyo7yJhnVjEVrU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784096548; x=1784701348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mf08+e18iQyaBCmXia6is7dzqtiU26q8LvKBSudwg7A=;
        b=k6W9e53jj8fTZHytiVN/iv3Aaw9qpn4SOvVyU0U+NGS746xF9PwDX6lFtqj4Ri3XwB
         0zjt2vniPuA1uEdMT+Zdwiz2ZOI7/l92EUEv1UCTEMwnOiFwTX803BRZnWe4lFVzJTxI
         OobYcN7p6vrWUNApoansuY0XkDraB6kKI/H6xs2Z+QZO7HpSLvh0dfEHw2VkglIezbT+
         VTTi6OzgSqhkpZ2D47IFbKHQO4+bL0warq3NowNA6742RI2lVso1lXV2s9MkN9Sjmd4+
         AR5DOi7di0vUiqbo+ahA2k5bMJsXv6bg5B5A+Izqk8Mv4cw22FS7HrmJxb9UZzT7kSYe
         ZKIA==
X-Forwarded-Encrypted: i=1; AHgh+RpRLH7cQyxCBiosywW4ADM43NJPehUUHH45g/yg2QjHrMxNiY8szeHkS+fVKs5fsBin+MW4d87HDuxu@vger.kernel.org
X-Gm-Message-State: AOJu0YwCVkXixDRQ1Tb6l+190Axz8r9y6WBdIxH3O65FyvasUxQFl3ud
	ROoMGRs0QOWNTjfmsFhbakeNg6p3H0lf/HT83FAQy0h3C7knNbBbQV9My1Edk/Ais90=
X-Gm-Gg: AfdE7ckjwaMrAXFe21aMGVBvcYXIFaELo2XmLIXnWYNR+EQ6iB6vYi4AVEDwMgM9em6
	iD7jmWEQyBqeH5L3o6P59my/V0SeGUXGxeMm4EBwGdxd2zXbJCVrHTMOLQBLnaEJOHLuVo+yTYw
	ZpGxYi6omp+RRmkA/kwSZv5Xp8fnZ/S7yg+R/doy8lEGLZIPKL/S6eH+D22IxyzpFwFBoZktad8
	QN1JYMKCV1dhzvPZOj9dIXVLBqpvLAKZu8AEuq5S/1yZqGri8YyC4z+ctFWO8N70oC8xz4YHYnn
	eIdV+uyUwavfx1Ec1x8r1eFoJ2d0Xh4PAvvAnrPurQLyZITjkbQnvnTsv6VfAIUocq1wqbMbf+1
	9l0GcTA53dLAZvbXcPQFdaTsTssls8rF4PmEGoJR3lZWAYga20HisGkknoqc3uN1Gi01eCK0q+a
	zBPpm1uhehL8t3IGeXCdoK/9Eq5PVaUBqyrxq3ebplXJwUIk1t5sGi9rrXnTqmg7N7fw9jucpGO
	EVGZZQ1iWmTv5Qh7KgzrUg=
X-Received: by 2002:a17:907:962a:b0:c15:f69f:a175 with SMTP id a640c23a62f3a-c16619b70b4mr339217766b.62.1784096548575;
        Tue, 14 Jul 2026 23:22:28 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([2.196.41.101])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15d0c3cf1esm1028820366b.44.2026.07.14.23.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 23:22:27 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	francesco.utel@engicam.com,
	domenico.acri@engicam.com,
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
Subject: [RESEND PATCH v7 08/16] arm64: dts: st: add can1 pins for stm32mp25
Date: Wed, 15 Jul 2026 08:20:25 +0200
Message-ID: <20260715062201.3599458-9-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260715062201.3599458-1-dario.binacchi@amarulasolutions.com>
References: <20260715062201.3599458-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the can1 pins used on MicroGEA-STM32MP257-RMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 50f454630cf2..6482dd47e977 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -331,6 +331,28 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	m_can1_pins_a: m-can1-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('B', 9, AF7)>; /* CAN1_TX */
+			slew-rate = <1>;
+			drive-push-pull;
+			bias-disable;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('B', 11, AF7)>; /* CAN1_RX */
+			bias-disable;
+		};
+	};
+
+	/omit-if-no-ref/
+	m_can1_sleep_pins_a: m-can1-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('B', 9, ANALOG)>, /* CAN1_TX */
+				 <STM32_PINMUX('B', 11, ANALOG)>; /* CAN1_RX */
+		};
+	};
+
 	/omit-if-no-ref/
 	ospi_port1_clk_pins_a: ospi-port1-clk-0 {
 		pins {
-- 
2.43.0

