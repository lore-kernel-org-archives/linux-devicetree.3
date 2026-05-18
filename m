Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AAD52673AA
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 14:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779114722; cv=none; b=EYVkE+dLi9Opz/kgtpR903j2M6rR87vp/MXeD31mO5ciejvZZ2ag7J+1gTbVdEADIbKDU0/WZtBNASnKEpQmUxSX0vslq3v42lcYXEXg/a+NwVQjv4z+4qAff2XUhbA/xqNyVV7Ej9suFJrSa3w4ckSlaLiubkOaYQdZv+dL270=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779114722; c=relaxed/simple;
	bh=UYDKzbpW8uNNdgSCCcWuM1BfXzCfunE1U8+QaERlfT4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OO85ViYCnpGtMzjdnl1QUY5QZFI+ZqAHBUrH0gxJhq2pPmPt5Dcf1S4C33VX1I27ffD/BXen3DRGwNOqchh2ZvTzavIOoIJkDkFidU+dmsJdsO8upB7KZXeAfxSzbmwfJht78EXukm4O79AsSTJxVOjIGdoeC9crzxEoXYIYoRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=d9/eMKtA; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="d9/eMKtA"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-449de065cb3so2263753f8f.2
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 07:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1779114717; x=1779719517; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g4gGcghC8/VjxZsUokcHk3DMALbk4ZgwiZSR2n7JFnI=;
        b=d9/eMKtAlOqDsH2/ixcojs0zEdrL3vzR3oUgVR45QzLqROkPY5rc7LsraMzuF+JKwi
         /CWz/0doFN03OlS9dZsk38JUYa9t6cRZhQ8hWQHpPij5oum50/MajgOiWM+bhN0zyhTs
         NrWGfMAqcD6GrcAi/qqMLlgPhcINK02TTGZdQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779114717; x=1779719517;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g4gGcghC8/VjxZsUokcHk3DMALbk4ZgwiZSR2n7JFnI=;
        b=nNdkGw+R/qdNBchpg50xHRRsWCm6aev4S88yXHMxWe8pHw848zvkfr0qgQmLCC8vun
         QnIjSSFeFLfQ2Bd0EPOLzljEe0oM74+TeEgC47PkXz1bQcEuS4qH/jjKzMdjj/u7O4fP
         OE5q1UUDGbJRG2HR+7FoLYjE8/sexy9zxiAtPQ2zH7sGwD2tybyz4r7mcTnGfkhh/XCo
         TclHZJryoQCK2C8yudojQUt6biJQvp5SMpEEKoubdPpS91HcqQNMIOpagka46ujdynUj
         GVdNtaGTsfDR71fx1i0/Ds2oEHFqcUZYBkgXaGY436BMXACTKEOAmHOj7YZZ97p4zT7K
         jjQA==
X-Forwarded-Encrypted: i=1; AFNElJ9ZwRMRoc1nkA/UrloKchlHTRNR8UAZBfFjjuxZKq1aWHS3Pe2uoTOQ0KjJw9bwoyBL17VDZDHleyoW@vger.kernel.org
X-Gm-Message-State: AOJu0YzLqNBAI0BBxQeUFiDxohGIfjqVkvhvRUl+7gM0Jfjx6PXiIVJZ
	9wZLNSb1ErXIeS25SaO/HhoNv6tYHZzRWobBBVjYE+CkSeTYJiuUE7dz5VJl3Qn8dk4=
X-Gm-Gg: Acq92OFZabvk2xJPeWnkWjncYv6VGtRRhV3nxpy2GQc4DUDWlIUmjbi81F/d93dkfjS
	g4rzMMinssbqVuN17l/C/2rcO6nuMs0tTY5nmynPQ1kVJap8PKlH1qBQlJmwAsmjKwlKPqwHnLX
	gYJ+wapURUV6SsZOLTa1yOiUsVbkjf/Xucd9Wi5tRfGM1qAap8ADMMaAvUto2OZ/DNaumoD8StM
	i8kBe6u9GcIGQVUxPm0o+CXhQzAk2ox06knMvNak8RE5t6/8NiehyXYVKafg3mB/wRwaOkCC3aa
	0siTM0i9MjC3REVED/0HT+BivJfddPntN7dI0BpOyUS/vLawDN6b7UyNgUFdeJvpVk85NlXBZtm
	MLODbrDlKafDVzPs5mC1nyGjJ4ugDikkVuau8Og7oV+LrFIttw7G+PM27csFRp1ugW1Mq3LlPj+
	53tmgnbwrOqjh+VT99d01EGF7Ugw0VfXMdoGGsuWYL0Sb4Bz+pgFYmQYREn/Ydv9uKpE052G8Di
	6VtVPSH6WfiEqNnBn/y+BVaLPBSjaK9f+HHmAHyZqTmk5GN
X-Received: by 2002:a05:6000:2383:b0:449:9aee:4575 with SMTP id ffacd0b85a97d-45e5c5ccbf6mr24920170f8f.30.1779114717015;
        Mon, 18 May 2026 07:31:57 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.43.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a1aeafsm39564572f8f.23.2026.05.18.07.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 07:31:56 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	domenico.acri@engicam.com,
	francesco.utel@engicam.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Christophe Parant <c.parant@phytec.fr>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Eric Biggers <ebiggers@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Michal Simek <michal.simek@amd.com>,
	Rob Herring <robh@kernel.org>,
	Sven Peter <sven@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 00/15] arm64: support Engicam MicroGEA-STM32MP257-RMM board
Date: Mon, 18 May 2026 16:31:15 +0200
Message-ID: <20260518143150.3138712-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds initial support for the Engicam MicroGEA-STM32MP257-RMM
board based on the MicroGEA-STM32MP257 SoM.

The support includes device tree descriptions for both the SoM and the
carrier board, together with the required pinctrl definitions for the
peripherals used.

The series also updates the arm64 defconfig accordingly and performs a
small cleanup to keep it consistent with the newly added configurations.


Dario Binacchi (15):
  dt-bindings: arm: stm32: support Engicam MicroGEA-STM32MP257-RMM board
  arm64: dts: st: add SDMMC2 support on stm32mp25
  arm64: dts: st: add CAN1 support on stm32mp25
  arm64: dts: st: add i2c1 pins for stm32mp25
  arm64: dts: st: add ltdc pins for stm32mp25
  arm64: dts: st: add can1 pins for stm32mp25
  arm64: dts: st: add pwm2/pwm4 pins for stm32mp25
  arm64: dts: st: add sai1 pins for stm32mp25
  arm64: dts: st: add sdmmc2 pins for stm32mp25
  arm64: dts: st: add spi1 pins for stm32mp25
  arm64: dts: st: add usart1 pins for stm32mp25
  arm64: dts: st: support Engicam MicroGEA-STM32MP257 SoM
  arm64: dts: st: support Engicam MicroGEA-STM32MP257-RMM board
  arm64: defconfig: cleanup the defconfig
  arm64: defconfig: enable configs for Engicam MicroGEA-STM32MP257-RMM

 .../devicetree/bindings/arm/stm32/stm32.yaml  |   7 +
 arch/arm64/boot/dts/st/Makefile               |   1 +
 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 328 ++++++++++++++++++
 arch/arm64/boot/dts/st/stm32mp251.dtsi        |  15 +
 arch/arm64/boot/dts/st/stm32mp253.dtsi        |  15 +
 .../st/stm32mp257-engicam-microgea-rmm.dts    | 321 +++++++++++++++++
 .../dts/st/stm32mp257-engicam-microgea.dtsi   |  64 ++++
 arch/arm64/configs/defconfig                  | 293 ++++++----------
 8 files changed, 862 insertions(+), 182 deletions(-)
 create mode 100644 arch/arm64/boot/dts/st/stm32mp257-engicam-microgea-rmm.dts
 create mode 100644 arch/arm64/boot/dts/st/stm32mp257-engicam-microgea.dtsi

-- 
2.43.0

base-commit: 70eda68668d1476b459b64e69b8f36659fa9dfa8
branch: stm32mp257d-microgea
