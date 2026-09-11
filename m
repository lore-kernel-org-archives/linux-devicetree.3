Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4837947CA96
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 12:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789131340; cv=none; b=ZMRoteNbq1bhgJKomzT46m9ZW5Eg6hCYtk7Ns1NEssLekdIlCDC+gtpaMcPEknZOr1B0E2rVBfpbto2A5dcNkd4HNW+lj8WUFLmpB8oG2P82Tl4O7jqUtJvokfNAj0G6l2PgDd+avM8f2OZVFCRGdqON/H7xrPuP/OIKc8Hwi4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789131340; c=relaxed/simple;
	bh=q5hfUmnX5cI2moI5VNKfCuehyKZytH+0Gd0A3JKIhQ8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Ybt0MylPvr98midpezN7zo0dSLCcKNQPycwVSsZwOMn84megMxCugbkZIyORp6vuJXrU4keFcgp1MHf/ROST9hVc01Rof8yXwsS/qLLuYkTHzmt15cqHXMuQqzbO8mMLvULOmr9KJ75TNAOVqM1LFJbt30wDe7H0cvLpc8LCZkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=l712AHn6; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="l712AHn6"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48583cc7ab1so373701f8f.2
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 05:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789131328; x=1789736128; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V+ZHt1Hv90ZffrGNuf1k0Rp2yL5IB44JRHsPcN8IeA0=;
        b=l712AHn6ZQlA87zJAL+6vDSvIafCY05BuvIWVrZgNDNMfnK48n9G4OYqhQyzlEW8h9
         eM2PqI1DyXWsSSWBy+BmmEc8JOXmfvM5nqD++IJJXwoybolslwIfs7OhWpT9kPziAQv/
         SsrL2lsOvfB91snEpGIqxPVI21eRRHTfovvY2piaD/O4risdWR2ksl6HUAucATPyZmYL
         8GznCPHvTYeeYlqD+r6W2y2a3CMrDmdqSuRPv863IErlEEwGuxtunmiYnxUJ6RlIPIBD
         R1YY8fGJLDOM4ai+7+kWl+M5U1JFISKTQaKpbIBJdCm75Ky2X6XzK8Ivn5cJ5wIPf7g2
         Gu+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789131328; x=1789736128;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V+ZHt1Hv90ZffrGNuf1k0Rp2yL5IB44JRHsPcN8IeA0=;
        b=KUtRZoW+IxG4hDX/dXqskiNSYMVZ1GWJPeABeKcPPcND5g8HLffaNN0giyR6g3YkAY
         4pfV5iAAOJPAdrHVGzHIEOPHwp0+4ntxpIKkn5rxBRPS257OAIu5Y5yhKYGe41pyNQn5
         l2EBe++jj/yBx+BihLAiTrbDlGHv5rPkunTnkYVTMYrYCVlFn9qvfh3erV/MkYoyQy7M
         nRk6hy/T8l57EQACkr8zetvDtyNtJq4WLXJZB41VLOEdCWFRwce1mboEfDxUVqgLPzoq
         77qe4zIY+5QskZ/P0NF3oeoLZfbaJsQ6wcnqla2R0dURI+kQI8VPU0YqFx0LQgzlOj8V
         o/iw==
X-Forwarded-Encrypted: i=1; AKwUvBxkGxQq85yInnfZ4KbdzWoYiRSV1mNhIelvrLAElsx2gmCUOVFbcqstpPaWW1nUUQ7lJf9rUQkUF4GG@vger.kernel.org
X-Gm-Message-State: AFuF++laqG0jfMGpPE9sFeE8y2xugwmecS/ROJHUfGP2XnIKGZn38zeU
	WhLStOtmC0lo7T6plVqnY0dRsduWFV2mgq0YW60238XueKnNBKoJG80dZULzPZ+UEsM=
X-Gm-Gg: AYBFou3NzebmRWTzC5cNiDmuDGD04msXpndrfC+67uXuhQU7rItEOiOBvX7J3qOeAF5
	mS2Gn29pKp4v9/mPR66GwUiekaDGnP65AeQ95Avq4lUhMd5PqOhFHk7We1573b28xhKV3mOWdTe
	hoCyygsjnVHnNQrfc5a4mJc/mmFTHIBGguAK32no765NnRTcmfsFVzm/cpTobT/9XoR1uZvwwVt
	TwmMndV99tDioMic/Fck+CRAwB7PzVnKUIpr1NzTSSymYNW+XeRUUUceHyJcgma1RTckRr4MBcx
	GuVz5EsDLZsCPsm8k7iiqPY2nwLbCqdG5G8rPNnrSq4ZKeCxAAU56nlIz7qcQ76KYfElwBSPpR/
	m1Gbp80EmXSDU+9SXJTqQ5tnFa8Hwx7xwhvhJMbLAB6vReLF0dj5Lcs4NsJZ2kktygrl6SXI0xJ
	eWVXlrIJ/Ntz6zeYQD0G6NXCgqt7opicStjF3uqPau48JwgKg243ydTB+kZKvaKN5xuCShVhEoz
	n7pjnQoAnTybusyG8s=
X-Received: by 2002:a05:600c:3ba9:b0:49c:fa21:e73e with SMTP id 5b1f17b1804b1-49e619c0558mr56438145e9.20.1789131327727;
        Fri, 11 Sep 2026 05:55:27 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e61a34cacsm41600045e9.0.2026.09.11.05.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 05:55:27 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Long Zhao via B4 Relay
 <devnull+longzhao.ambarella.com@kernel.org>, Arnd Bergmann
 <arnd@arndb.de>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: Long Zhao <longzhao@ambarella.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>, Ilpo =?utf-8?Q?J=C3=A4rvi?=
 =?utf-8?Q?nen?=
 <ilpo.jarvinen@linux.intel.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Long Zhao
 <zl020895@163.com>, Lee Jones <lee@kernel.org>, mfd@lists.linux.dev,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski
 <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v6 00/13] Ambarella CV75 SoC minimal bring-up
In-Reply-To: <46d21889-6b52-4c09-8f77-7c08dba93777@kernel.org>
References: <20260904-cv75-v5-v6-0-e918514cb3b1@ambarella.com>
 <1jwlt1ld6c.fsf@starbuckisacylon.baylibre.com>
 <46d21889-6b52-4c09-8f77-7c08dba93777@kernel.org>
Date: Fri, 11 Sep 2026 14:55:25 +0200
Message-ID: <1jld986j7m.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On ven. 04 sept. 2026 at 08:56, Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On 04/09/2026 08:54, Jerome Brunet wrote:
>> On ven. 04 sept. 2026 at 14:38, Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org> wrote:
>>>
>>>  .../devicetree/bindings/arm/ambarella.yaml         |  24 +
>>>  .../bindings/clock/ambarella,cv75-rct.yaml         |  64 ++
>>>  .../devicetree/bindings/gpio/pl061-gpio.yaml       |  32 +-
>>>  Documentation/devicetree/bindings/mfd/syscon.yaml  |   1 +
>>>  .../bindings/pinctrl/ambarella,cv75-pinctrl.yaml   | 239 +++++++
>>>  .../bindings/serial/snps-dw-apb-uart.yaml          |   1 +
>>>  .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
>>>  MAINTAINERS                                        |  14 +
>>>  arch/arm64/Kconfig.platforms                       |   6 +
>>>  arch/arm64/boot/dts/Makefile                       |   1 +
>>>  arch/arm64/boot/dts/ambarella/Makefile             |   3 +
>>>  arch/arm64/boot/dts/ambarella/cv75-evk.dts         |  30 +
>>>  arch/arm64/boot/dts/ambarella/cv75.dtsi            | 177 +++++
>>>  arch/arm64/configs/defconfig                       |   1 +
>>>  drivers/clk/Kconfig                                |   1 +
>>>  drivers/clk/Makefile                               |   1 +
>>>  drivers/clk/ambarella/Kconfig                      |  13 +
>>>  drivers/clk/ambarella/Makefile                     |   6 +
>>>  drivers/clk/ambarella/ccu-cv75.c                   | 296 ++++++++
>>>  drivers/clk/ambarella/ccu_common.c                 |  60 ++
>>>  drivers/clk/ambarella/ccu_common.h                 |  25 +
>>>  drivers/clk/ambarella/ccu_mux_div.c                | 234 +++++++
>>>  drivers/clk/ambarella/ccu_mux_div.h                |  35 +
>>>  drivers/clk/ambarella/ccu_pll.c                    | 421 ++++++++++++
>>>  drivers/clk/ambarella/ccu_pll.h                    |  70 ++
>>>  drivers/gpio/Kconfig                               |   2 +
>>>  drivers/gpio/gpio-pl061.c                          | 342 +++++----
>>>  drivers/gpio/gpio-regmap.c                         |  24 +-
>>>  drivers/pinctrl/Kconfig                            |  15 +
>>>  drivers/pinctrl/Makefile                           |   2 +
>>>  drivers/pinctrl/pinctrl-ambarella-cv75.c           | 561 +++++++++++++++
>>>  drivers/pinctrl/pinctrl-ambarella.c                | 761 +++++++++++++++++++++
>>>  drivers/pinctrl/pinctrl-ambarella.h                |  50 ++
>>>  drivers/tty/serial/8250/8250_dw.c                  |  34 +
>>>  include/dt-bindings/clock/ambarella,cv75-rct.h     |  15 +
>>>  include/linux/amba/bus.h                           |   1 +
>>>  include/linux/gpio/regmap.h                        |  13 +
>>>  37 files changed, 3439 insertions(+), 138 deletions(-)
>> 
>> That is a lot of stuff mixed into a single series that could easily split
>
> Well, not easily, because each split patchset would rely on non-existing
> CONFIG which could trigger warnings.
>
> Contributors follow here the correct and documented process of new SoC
> platform, I don't get why now only this patchset has to be split...

Are you referring to this or something else ?

"""
one patchset containing new arch/foo/Kconfig entry, DTS files, MAINTAINERS file entry and *optionally initial drivers* with their Devicetree bindings
"""

No problem with that, I was merely trying to say that mixing 4 or 5 trees
in a single patchset is pushing it a little and it does not solve the
dependency problem you've mentioned, it just move it.

>
>
> Best regards,
> Krzysztof

-- 
Jerome
