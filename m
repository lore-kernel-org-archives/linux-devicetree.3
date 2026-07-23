Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389213EDE78
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 20:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784838230; cv=none; b=Dz7W00MzWY4b5LItWNx0SSa2Ku9MOAE6UWjCoQOnwA1sUJjtiYtcWV8bxXk1AFS5BItTruB0D9POJya94/ORxvXRWd7qMjju0uWkN9JosH55yyA1pn8PG2mU2p596HV+puBwmbfdwFYQ9t1kIGLt6/W0+E0Pd+9UUx4k7J2RtMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784838230; c=relaxed/simple;
	bh=oEgR6Cwjsw54hBTqXrbpuOoHhTs7nuHW3pJ2pa+5yFQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P5qJYN4EqWTsysCbN88+xsPLBVOzw2VWeK3MQTPvpU5m7DI2JtO2KAMQQDb3lR+cJvN2GhmW++M08tdoga41J1phWJ1HNWtOt/sAGUfMmloGnOKXn6OBgEuR5QdNY8MXTI0t38WiipQ286PMN8l3hZ55rA1mXk1uLOcrE4yYjSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=GoDt+cuG; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="GoDt+cuG"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-471eeac43bfso1004534f8f.3
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 13:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1784838227; x=1785443027; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TAzh6OwkGuIfCY27rZc+4yNvhijgFF8ObLrHWvLSurM=;
        b=GoDt+cuGLICOwjql2EGUXmA2QMbypTm4ZOS5kTZfXQexi+vkgvG3qYa0bs7H5ZEHZi
         O2iUIwg2nnt8t9dnGgF6qUkUtATSMt+28kV8vKhzm9XDJvvWKPRE+mfSWUTw1VRhjXUG
         EEAmHERT69WreUkl9GxnfTVq1JeRote9faWMk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784838227; x=1785443027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TAzh6OwkGuIfCY27rZc+4yNvhijgFF8ObLrHWvLSurM=;
        b=jN49UViPwD9F6iSdEyVjw7ytOktw3tzflbG4HqAGt0kUNPsTfrIWNss0eDZIjHeZyL
         qv/dnzgtAEW45RIpxhh890yNW2J6nRYXxdTvhi/tLp7pSlQJYPYRJZnRhyuFMa5Y21Ag
         nWomKhQcoEB8wwWjLA+vOwR+9yU8AqDPDQOBRSxiuPaI/tgP7mff5RwWmFiZ/4PiVXA1
         hkHVNAU5lhcEOqMh6xOWeIH/84mTfmvNwEIlDXPcUFIM8Q7ryli9tkih70AABcaASY/Z
         7ehiknMdOBTNOX6tUSySLtzi2IjKB9f3T4TdmZq3X4Vg1ULQ1+M9HO15oxdSPtIxBgw+
         EpRQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp9rECI1H+palzyMH3BBU9s/uxdXF2U+9LxOxu12T7NaEM3dSV3qxOWE5kJPvO3EBzla/07FQ5uVB7+@vger.kernel.org
X-Gm-Message-State: AOJu0YzlaZCNE39QZw2MLj6hKYQrgsiqvpBI0vG/oeS/3uiofPGmxYC7
	iQhN/rcBrFD9cGm0aeqbo8IMo5mlI0kcUejgMp4qNt7U1Ry1JazG45D7xOXq86nH3eY=
X-Gm-Gg: AR+sD12kD5yGgxJdxQkAix6TUUV23hxVdOmrNHbDOyVmUyLfQcqev3F+nnx9LttPOrK
	aNwgHDd5Acm65THZ1T3jSndJ6YmTpw3pSOvbxLopApC7N2IGtwiy6WDC6sZpvm5jup/JjJewtGV
	iy/wRCYefDhACuee5XFboN43E3XaRGYFlrOitxh+m4bdLzWf6sE0VwryFfP3/Nes+DpkHF71Xj3
	JzkPey+Z2I3Y8MrEl8cQRrfySMyk0qwx66mA0C5tNh+4thxh2H27P7WyNfErMHCgoesIE3R3MOa
	n37aFRlGB+LOW67jK1qzoj8R6EORoZTIqd6ciHxA+RX+F197bI104+8Pdi4oJ0WAZqCD3k8AqME
	E79+oCyOC7qB3LdrYodwbzjOgD+bM8IMSEvVnyNHtJUbwZYGCKxXfGBO4o8CvUY2I8MZ9QSM+Xl
	EtuMoVn/TcT/gB385QGKhS/6NRhXkLZXTBzFNNGlkqomSj5Q9YuJFBaPVrNbVyU6v0CUlbBPyMF
	6GS84kze2L56axU3Tuu3N32tfE/Zo2CicoZ/rW5QeepGM3mbZstpESocQOXVjaph6J/MQgBpHJx
X-Received: by 2002:a05:6000:178f:b0:47d:ef38:260 with SMTP id ffacd0b85a97d-47f8d72d3a4mr5490133f8f.27.1784838227551;
        Thu, 23 Jul 2026 13:23:47 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com (host-79-17-119-233.retail.telecomitalia.it. [79.17.119.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c631fdsm17516051f8f.28.2026.07.23.13.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 13:23:47 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 3/3] ARM: dts: stm32: add missed arm,num-irq-priority-bits for stm32h743
Date: Thu, 23 Jul 2026 22:23:35 +0200
Message-ID: <20260723202339.974529-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723202339.974529-1-dario.binacchi@amarulasolutions.com>
References: <20260723202339.974529-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missed arm,num-irq-priority-bits to fix below CHECK_DTBS warning:

arch/arm/boot/dts/st/stm32h747i-disco.dtb: interrupt-controller@e000e100 (arm,armv7m-nvic): 'arm,num-irq-priority-bits' is a required property
	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,nvic.yaml

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm/boot/dts/st/stm32h743.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32h743.dtsi b/arch/arm/boot/dts/st/stm32h743.dtsi
index 2f19cfbc57ad..845d13c61da8 100644
--- a/arch/arm/boot/dts/st/stm32h743.dtsi
+++ b/arch/arm/boot/dts/st/stm32h743.dtsi
@@ -732,6 +732,10 @@ gpiok: gpio@58022800 {
 	};
 };
 
+&nvic {
+	arm,num-irq-priority-bits = <4>;
+};
+
 &systick {
 	clock-frequency = <250000000>;
 	status = "okay";
---
base-commit: d326f83e819c53aa05c40d64f5805d6237b6aa1b
branch: stm32-nvic-irq-priority-bits

-- 
2.43.0

