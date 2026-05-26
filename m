Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90CB3BB673
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 07:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779780801; cv=none; b=l9f8b/G3g8w6ei1BRzwaV04T3mAKEOeHvFOuH5DvFUml3DMAe8nRq6JdHnGuXPa0Y0hm5GHWDq3c1cvgSOz28HyL0YqloCIzCxR+NIvHK0Bg3RmMJx7kBWdkCv0s/N8aK6F416xD/YFFs35Ld5XL6ghhE63HDSqniORafgtaErA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779780801; c=relaxed/simple;
	bh=2hbhZXzLpi5I165u4S49bvc8ONnLlZfI2JGZBoM1j5M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ivmbVfsWp0k742Xovo01qgvA9FmuBY2UA1NroqQ3j03C36L0thDLoq084DdqSl1Zb/OsKy+CDk6jchTeNjQXQZ67hSOcbz8XoAmCn61+hftdlixr/qeuOiGuFtG4FRBY5W7vLvbYJvUHgoMt9Kx1QvbDioXdDmlz4Lq0KYXR+Og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=O7tY04ud; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="O7tY04ud"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490686877a1so11012055e9.0
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 00:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779780796; x=1780385596; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5WXRNNHPyXQvvYNRb7UDQ2d4k6RO8dKZjGyn0hWbK7M=;
        b=O7tY04udqNns0hdT3Dwo4uQeyppHfUXnFZjOj9U5NghaMEiKWveKmqblOulk9ns1Ky
         9n7TcKJstbDu6PxyAJhmY/TZCCLvlue39s0a3aeqpNIx8ojLrpICaS3VrG/M6mZJX+b5
         NZL/M90Zk4qI4SzdvLoTAOeJypJrOm2hAcLwcqJnxMTL5AaMO2/XhXI7+LZ3TmNFGIZX
         LjRdKKQ9UHw7VrPhjnfPOK3o/8ID5HcXHU5e08u9L0aL8Y5oZga0sqZWkPsbAYZLNXAo
         DKgGpzXutCT9BhsmUnhFVbLBHMq2iFx6GC1hfaR8zmhiULEepBU9SuL8ysmqc31B9q3R
         Iz+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779780796; x=1780385596;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5WXRNNHPyXQvvYNRb7UDQ2d4k6RO8dKZjGyn0hWbK7M=;
        b=FSpekf1OsxRKw0RGttxSPP3PThQrxzXVg15gK/WC54C4zdBXa7w1Ltj701sDLejUwy
         Z8UTdAvvFkDeG0QTZHqGrE8lFC6z399SYQT21VWH4WuYmHEhytOoKUog2w8PaIUftE6M
         WNpeyjAOZc/j5DT3iiYlOAXiiYX1DjZVdvtsqfqqGx3G3YTQtcdHrNcSHdfqN35TPc6g
         NjoqUenprHeP0G4TOK+dRz7sBb8paRWVFaT7y3yp4+7SNLYw+O9mwJuKc8M9K0sWvNzj
         w1owm8JojbF1pcmzol3AYtQap1intzs+/MwNygKK8q3JfxjMGzKNY7N9Ue5qhsSAo/Rb
         gH/g==
X-Forwarded-Encrypted: i=1; AFNElJ9vrBql5iGAnA08/vOCl0h60PIThek63c1CUalUJ/dcCS8SoKY2ehPnLkcBdede9twS4+OBTyrG9MJR@vger.kernel.org
X-Gm-Message-State: AOJu0YwUlXAC3BEKaG1qWhFgkEw3CMn7FWJqvgZQsQGS8grj5+3FRX4g
	UG5mp6ThqZDOTXtEmaq1BDBPJO+2MSHZIkvXKDnumE/9C6m1rti4UXvMP/ucYRUd21w=
X-Gm-Gg: Acq92OH31uhGhQnYrBH2uBPycHoQ+m5MOsZGNo+xaOA7znYLz+/iGFcchth/VXlZ5A2
	ChV+YnvyuJqe79Juqm9+eHqocHw6nLGw4yGV/HktpjZXpGVDbYW/Xdkn04irLDLn2VkeTWevvUM
	GbFjL2xoVN0QK29JwoM6CnyXTOQ6g2QDaT2Ojlo6WGfifqBGnDSrfWZRMtNuuvji1CvROy+vJpE
	8Hq01YfWcrie1cHBPsGkal1M1CkDCWz5MstqIb5VbKWhftR0sORKizSTyz3pp4gPlyqpWFW06a3
	Klwvch1SP/kb1uJDab9NL/Zo61Ft5docHfMPAElgAzjJS1uh93EscBXviX3Gi5SaNXoTHFTy32w
	QLQtTzKwx1mpExROCqWWQiAgHT6TaYrK66wU/YqSFzooUCRnUuPy/919MLdUW3SA7Zr4I44DIAa
	B7+v0IrUg8RYaX1P9koLJZXQ==
X-Received: by 2002:a05:600c:8599:b0:48f:e230:29f4 with SMTP id 5b1f17b1804b1-490426ade02mr179110335e9.15.1779780796190;
        Tue, 26 May 2026 00:33:16 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:4a0c:b15a:3467:f4ed])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-490454ea134sm338481635e9.8.2026.05.26.00.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 00:33:15 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
 <sboyd@kernel.org>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Xianwei Zhao <xianwei.zhao@amlogic.com>,
  Kevin Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  jian.hu@amlogic.com,
  linux-kernel@vger.kernel.org,  linux-clk@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-amlogic@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 00/10] Add support for A9 family clock controller
In-Reply-To: <20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com> (Jian Hu via's
	message of "Mon, 11 May 2026 20:47:22 +0800")
References: <20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 26 May 2026 09:33:14 +0200
Message-ID: <1jldd662x1.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On lun. 11 mai 2026 at 20:47, Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org> wrote:

> There are 4 clock controllers in A9 SoC:
> - SCMI clock controller: these clocks are managed by the
>   Trusted Firmware-A(TF-A) and handled through SCMI.
> - PLL clock controller.
> - peripheral clock controller.
> - AO clock controller.
>
> There are reserved register regions placed between individual PLLs, so a
> separate driver is implemented for each PLL, similar to T7.
>
> Compared to previous SoCs PLLs, the A9 PLL controller introduces 4 new features:
> 1.PLL l_detect signal supports active-high configuration.
>   Previous A7 and T7 l_detect signals are active-low.
> 2.PLL reset signal supports active-low configuration.
>   Previous reset signals are active-high.
> 3.Support POWER_OF_TWO for the PLL pre-divider N;
>   the N pre-divider follows the same calculation rule as OD.
> 4.The PLL input path includes an inherent divide-by-2 divider.
>
> Implement the first three features in clk-pll.c (verified on A9 and T7),
> with no impact to PLL logic on existing SoCs. Add a fixed divide-by-2 to
> A9 PLL driver for the fourth feature.
>  
> A9 PLL is composed as follows:
>  
>                        PLL
>           +---------------------------------+
>           |                                 |
>           |             +--+                |
>    in/2 >>---[ /2^N ]-->|  |      +-----+   |
>           |             |  |------| DCO |----->> out
>           |  +--------->|  |      +--v--+   |
>           |  |          +--+         |      |
>           |  |                       |      |
>           |  +--[ *(M + (F/Fmax) ]<--+      |
>           |                                 |
>           +---------------------------------+
>  
>   out = in / 2  * (m + frac / frac_max) / 2^n
>
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> ---
> Jian Hu (10):
>       dt-bindings: clock: Add Amlogic A9 SCMI clock controller
>       dt-bindings: clock: Add Amlogic A9 PLL clock controller
>       dt-bindings: clock: Add Amlogic A9 peripherals clock controller
>       dt-bindings: clock: Add Amlogic A9 AO clock controller
>       clk: amlogic: PLL l_detect signal supports active-high configuration
>       clk: amlogic: PLL reset signal supports active-low configuration
>       clk: amlogic: Support POWER_OF_TWO for PLL pre-divider
>       clk: amlogic: Add A9 PLL clock controller driver
>       clk: amlogic: Add A9 peripherals clock controller driver
>       clk: amlogic: Add A9 AO clock controller driver
>
>  .../bindings/clock/amlogic,a9-aoclkc.yaml          |   76 +
>  .../clock/amlogic,a9-peripherals-clkc.yaml         |  150 ++
>  .../bindings/clock/amlogic,a9-pll-clkc.yaml        |  110 +
>  drivers/clk/meson/Kconfig                          |   28 +
>  drivers/clk/meson/Makefile                         |    2 +
>  drivers/clk/meson/a9-aoclk.c                       |  494 +++++
>  drivers/clk/meson/a9-peripherals.c                 | 2317 ++++++++++++++++++++
>  drivers/clk/meson/a9-pll.c                         |  831 +++++++
>  drivers/clk/meson/clk-pll.c                        |   79 +-
>  drivers/clk/meson/clk-pll.h                        |    6 +
>  include/dt-bindings/clock/amlogic,a9-aoclkc.h      |   76 +
>  .../clock/amlogic,a9-peripherals-clkc.h            |  352 +++
>  include/dt-bindings/clock/amlogic,a9-pll-clkc.h    |   55 +
>  include/dt-bindings/clock/amlogic,a9-scmi-clkc.h   |   51 +
>  14 files changed, 4609 insertions(+), 18 deletions(-)

For the next version, please split things up.
There is no hard dependency between the different controllers. This will
ease the review.

The PLL controllers are bringing a new contraints in. The global/static
nature of the controllers is something that has been bothering me for a
while but there was no real reason to address it so far. Please give me
some time to think about. Feel free to re-post the other controllers in the
meantime. 

> ---
> base-commit: ca89c88bcf69daca829044c638a8163d5ce47af0
> change-id: 20260511-b4-a9_clk-67652c1ae56e
>
> Best regards,

-- 
Jerome
