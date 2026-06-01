Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D42C282F38
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 12:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780317386; cv=none; b=cHehPh4xKxr+mNl7bunvVSia84wx3jeZ0Q6//kXJsnJRLgHGap3trQpLLtf0ydSfxAsPuYL1SivP7nu30g1xSz0xMSHcjxItcs04iyJM4Vefw87ZQJVSZIoc1bmAsOoNb8Sh0VIXsvPYDY8UbaZyidVpoMuNrAa+zGu9zCywmp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780317386; c=relaxed/simple;
	bh=rjOsS+1xuSg8DHO+dlVvOQ4CkedKy3xu/KJHRuxD1uo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Lae8GGXZRal2L+qXTWDWetHK6+rLxeISsySjG73VVDXRGAsBlt3UowqkM23F4vm283auqzCAn+ou4XyWvgEjjFC5syXRNt6Lg0LnQwFuYii6qFr5TRgrYgr0l9OSnRqiHD/C6aEII3eSsgPRdZ/fRhNmHCb0rrOqz78kyRzGsxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a9tZayii; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a9tZayii"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8423f53332aso422327b3a.3
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 05:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780317384; x=1780922184; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ulq7zD4ctN0+5WRFW+oZ1/qxY6rbHFNEsFrgeGiPH/c=;
        b=a9tZayii1BuIHat8HuO7fIktmxsMQ/jJKp4crwBd6+IUYLwpplhW1odkaqrnc4t2Ky
         cCmRVW++xyeIdfBynG7qdGwrNYSvxrZU38tKvW/zY4YjHtSIUgtlsz8NWW2eVn8qZ0bt
         44ML7PFrf7KZuFRUnMeP0EWctTWloJc1j6ebnbiG31WJR1QOBZI4/WmuItYkIzvj1VI9
         bN6zn7GoHVJ/UAL7WCZ5o1kaM8J3ozbcHmRgwSmD3zwPcnfR6UN0KgHMSBXQ6qvJdtTD
         oL4Xo5zeki9p35stvTZeLTrjFWHkAUwJ2tzlkaztFlxeO3gednH63Q1ONd56yG/UU0zb
         Op6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780317384; x=1780922184;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ulq7zD4ctN0+5WRFW+oZ1/qxY6rbHFNEsFrgeGiPH/c=;
        b=YDQ6NBKykebOwFbwqzPocTJ0c77a6VLLDyPV7Yo2MpzEyBLGtq1xNEHDkC35R9R4vA
         0ZdznBL8l51bRl4GAQoLPXF4Gw38knDgAxg7cU2dHfPWS2Na14UFvcX19vSEK/etDp/Y
         l0Rtu6fpQIiQyoTA250zpjzZTZPpzEe+uKxacWyJzbRvr6iPuhbJiIhPqnjIJjTrvFc1
         u6my7VghpNqrpAkemCxL1c1Cwf12fk0Q5ao/AmzsCg9FfrNEW2xu7fuTfL2Wt8yb0wOF
         0tPAXmjgRdapdxpdfB5dvplIzTlGSGN3UdDFJjxwnrdOTC95XVqmP7m7NYetE0/CYVQn
         seBg==
X-Forwarded-Encrypted: i=1; AFNElJ8d6E6x6NSXhxmicf0J5MIOMXkEkCgroDQ6U2+SHiOkB99A2LNt13TuFvtaKlwn1MOrHMHTZzE2h7L9@vger.kernel.org
X-Gm-Message-State: AOJu0YwyLk6035LSLlFUHqltEAO1+r+ne9o8QVf1M3clnPy7sxkD7q3e
	ezgObrsFkWlEV7tpkt6kgVvlAi2D8S3pjW6Z+oWsCu1ruAS94x00WSi1
X-Gm-Gg: Acq92OFLzplOMFE93MZ1na6kkLFMJtHXhNoMiFutEm0zpcJHRJEl1ITJCAyAG29xhQU
	4pYkFxs0EJA/+dslj1zSDYHK8HfShUyDBXeNG5ek/iSCFbekg6qJvN6RSoGsiKlIn6DW/xnYjWd
	TD7pf0NSL/Ri+kZH7YwEHj0U4eNLLs02GKqb5TrSZbdOzODtLZD6XVTBIt+eprfOPs7HQISdSHi
	or9ypBNS/mQM3w74KkTUQyO1dSPkaZoG/rFQcIaIQqTi4Y0kKfXgPyfw/01co+YbUx4MLbegxJC
	vMN99VX+qXrRlUtPbe7cpOWwRLRCL+dGOodW7QXjN9l9ThVgPHQAEghAM+iLbcckSZhWRWlYhdw
	Vt9FOqwvw9BeSa/EK8NqUZZLkmkmmFmsbtPxycFIDzdwIJolEV6OaxcL0slMlHzj3ICYWk/TyBS
	7vVxXtyu6PisD0qvmZrCnjfo/8TnfsLF59Pgb9+ZrztZL8gsMh6lA=
X-Received: by 2002:a05:6a00:4296:b0:82f:5726:be23 with SMTP id d2e1a72fcca58-8422575fed2mr10037266b3a.49.1780317384389;
        Mon, 01 Jun 2026 05:36:24 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:9c6f:e28:3da8:7980])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8424defc024sm3765997b3a.47.2026.06.01.05.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 05:36:21 -0700 (PDT)
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>
Subject: [PATCH 0/1] arm64: dts: rockchip: add Vicharak Axon board support
Date: Mon,  1 Jun 2026 18:06:02 +0530
Message-ID: <20260601123603.129679-1-hrushirajg23@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds initial device tree support for the Vicharak Axon
single-board computer, which is based on the Rockchip RK3588 SoC.

The Vicharak Axon is a feature-rich SBC targeting developer and embedded
use cases. It ships with:

  - Rockchip RK3588 (4x Cortex-A76 + 4x Cortex-A55)
  - RK806 PMIC providing all SoC power domains
  - eMMC 5.1 (on-board) and microSD slot
  - Gigabit Ethernet via RGMII (RTL8211F)
  - Dual HDMI 2.1 output and one HDMI 2.0 input (receiver)
  - PCIe 3.0 x4 and two PCIe 2.0 slots
  - SATA 3.0
  - SDIO Wi-Fi
  - USB 2.0 host ports (EHCI/OHCI)
  - NXP PCA9554 I/O expander for status LEDs
  - Haoyu HYM8563 RTC

This patch adds the DTS file and wires it into the Makefile. Binding
documentation for the vendor prefix "vicharak" and the compatible string
"vicharak,axon" will be submitted as a follow-up to this series.

Hrushiraj Gandhi (1):
  arm64: dts: rockchip: add Vicharak Axon board

 arch/arm64/boot/dts/rockchip/Makefile        |    1 +
 arch/arm64/boot/dts/rockchip/rk3588-axon.dts | 1069 ++++++++++++++++++
 2 files changed, 1070 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-axon.dts

-- 
2.47.3

