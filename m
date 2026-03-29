Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACCF7175A7D
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 11:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774785232; cv=none; b=JSSa9E+FrmqmwbquEuu+arzKIkW2/I3DyB5kA0Q61eUndMIE8KLI6mDeSV+HQJqTVLDVbUbchMRxEgqeWpK1qSs8ein8CcUsBVOPzv3cEF9cn21Srw9jx/uhxctb7/CIcozG2h1dDUca9sBwQXk6NI0OeP9SxXV5F85Mg4ZdNYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774785232; c=relaxed/simple;
	bh=0uzZvIZYDJmESSspvl3mpEvCQbbAZdCXxvcd536qHqw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xc8t5efbkagZgx1JwGQmyPxD3feDA8eLyPSa7rQHy1bGwcHQcf3iIWSRzMrf6pHM+UgIUWzA63mFVkH1YT6UNrqpyd/DU1SYxJ4reF2wY0/7k5EJBzUg5Rj6jEph5I2LPm0NroUSzQdOL0lYT+ozol7xE7PicvMccqrNASFknPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TzdgfJ7b; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TzdgfJ7b"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48538c5956bso34854775e9.0
        for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 04:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774785229; x=1775390029; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uU0NTK7NMSNT2kDGknARBu8N7YysrPeJ5XlwaOTRHqc=;
        b=TzdgfJ7bxxUJQ5ZmWKrbdmqc5giaxWdGcf/TMH4MzC3rumlSt9YW7iadG+755CgBNk
         UpaAUFkPp4gGwyiSCxkJvG3LAcpglNzwu5N8zNl4ZMDiReRyKB3S72Nz6ObDxzWxCRLW
         NzIqWWlMoQOP2WtBGPkn7dHI3ivWKtBi0CiT0cpUT9Nlygc5QCK3fRHSewYPet6ynkdS
         3YacAja0T3R6a3GbVue4hzvwYSL0A4iNn9DUtuu7G/solrnqiJLbN4OE2Xw/rVYNRd7v
         UFcDYBo0+sQuIjLesLX9D+pn9wUG8gBP9OHoRJn2igG/dszASzN86kD5Yeg1/cx7rpRx
         uwug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774785229; x=1775390029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uU0NTK7NMSNT2kDGknARBu8N7YysrPeJ5XlwaOTRHqc=;
        b=LotQt/ASoDnCea9SsVfnM2k3dzw6xmWMkUGWSMTcpVqSH4PL9LFBg0x2z18z4ZyN3G
         1mZbnvAz/Qzv2vTAXqTgTNrDKwsu6DAZ3UaZYaNrc6QZ/YUjOYDCi7C27FOTs1fQRJBD
         79o1Jeo5IXZ/c7p6Ntitm3QaLcjC5PfuFQ9IbnuxB+F714+0WlqEBOeeSProUzJP5jrK
         sZwdntd7CKCNR1b1fA8YqeVbutorFjRFJge8PeU2DfMTpMl+P5+IYvVfpxgs0t3DnBdg
         hQcRQFQ6ih4l47ALz+edNTo+mMEye/9yKQw6AC+b6r5/4fYCGiU1FcwUYkE4mgXFldx2
         My2g==
X-Gm-Message-State: AOJu0YwTjZvvLPZzHqN+7xF72rhJhGzhNAqsDT1i+iQ88bf8Bk221Ng0
	CXasHAq/mT3HhZfrP779OpuCNKqX2Di7BDT5uFfQAJrmor9LOR4luCG/
X-Gm-Gg: ATEYQzxOjVGRsRDbukQfOEzIEKB+9kxa+QAN1XyFbmPT549HvTWqKeEE81yr7r1Iyf4
	WIMr7KYCl84XEDBB1V/89xmE8hmfVeYKQ2BnAUzjnlEg9wvYyxlnDAN7MFQMeA7Wl5gYk2e9qpz
	JFf/a/t4aogvZDTn/T38ak2DkWOvIOyYsckI3g+4Dw2hm8rNeczelCSeWf5f7ygFKKu2usyeQRB
	Ni2nh6hPolDlONbzlnCq7AA+fICseVajnWRG4hpjVGETLY0PeMwEPDaorcj3ZI86cVdWqRDTGCW
	+xDRbJ8KcN3PMdFOmMIls4HA0wY/J19358m25AFiDqsd1FH6r34sq6MUV7i+P/7aadl2YoVE55g
	tbUWpkWZPbCbl3XcZds1rf8rYLRlKcmcqPkW3wL1hgnYdh8h1hM2/pZQ7ECB3Iaj4biYbh6eWZs
	jR5Y2e3Va8GOoLtKBFY1ukmBiE6g62Foo455EiNcSNCp9vQS80VDtcNPXjuPJ57M5N+O8sthLe8
	IZl42EuiLUkGwvunw==
X-Received: by 2002:a05:600c:46ce:b0:477:9890:9ab8 with SMTP id 5b1f17b1804b1-487290a929fmr129053725e9.3.1774785228954;
        Sun, 29 Mar 2026 04:53:48 -0700 (PDT)
Received: from jernej-laptop.localnet (118.red-213-98-130.staticip.rima-tde.net. [213.98.130.118])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4872714ef38sm54949225e9.21.2026.03.29.04.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 04:53:48 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>,
 Michal Piekos <michal.piekos@mmpsystems.pl>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Michal Piekos <michal.piekos@mmpsystems.pl>
Subject: Re: [PATCH] arm64: dts: allwinner: enable h616 timer support
Date: Sun, 29 Mar 2026 13:53:45 +0200
Message-ID: <5977334.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20260329-h616-timer-v1-1-5966d0420a66@mmpsystems.pl>
References: <20260329-h616-timer-v1-1-5966d0420a66@mmpsystems.pl>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne nedelja, 29. marec 2026 ob 13:43:04 Srednjeevropski poletni =C4=8Das je=
 Michal Piekos napisal(a):
> Add support for timer by reusing existing sun4i timer driver.
>=20
> H616 timer is compatible with earlier sunxi timer variants and provides
> both clocksource and clockevent functionality. It runs from 24 MHz
> oscillator. It can serve as broadcast clockevent for wake up from idle
> states.
>=20
> Tested on Orange Pi Zero 3:
> - timer is registered as clocksource:
> - switching clocksource at runtime works
> - timer operates as a broadcast clockevent device
> - no regression observed compared to arch_sys_counter
>=20
> Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
> ---
> Test results:
>=20
> Clocksource switching:
>   cat /sys/devices/system/clocksource/clocksource0/available_clocksource
>     arch_sys_counter timer
>   echo timer > /sys/devices/system/clocksource/clocksource0/current_clock=
source
>     [ 5031.105997] clocksource: Switched to clocksource timer
>=20
> Clockevent configuration:
>   cat /proc/timer_list
>     ...
>     Tick Device: mode:     1
>     Broadcast device
>     Clock Event Device: sun4i_tick
>      max_delta_ns:   178956969070
>      min_delta_ns:   1000
>      mult:           51539608
>      shift:          31
>      mode:           1
>      next_event:     9223372036854775807 nsecs
>      set_next_event: sun4i_clkevt_next_event
>      shutdown:       sun4i_clkevt_shutdown
>      periodic:       sun4i_clkevt_set_periodic
>      oneshot:        sun4i_clkevt_set_oneshot
>      resume:         sun4i_clkevt_shutdown
>      event_handler:  tick_handle_oneshot_broadcast
>     ...
>=20
> Cyclictest measurements:
>   Dominated by system scheduler latency and do not reflect clocksource
>   precision.
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/=
boot/dts/allwinner/sun50i-h616.dtsi
> index 8d1110c14bad..bf054869e78b 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> @@ -228,6 +228,15 @@ cpu_speed_grade: cpu-speed-grade@0 {
>  			};
>  		};
> =20
> +		timer0: timer@3009000 {
> +			compatible =3D "allwinner,sun50i-h616-timer",
> +				     "allwinner,sun8i-a23-timer";

You have to add above combo to DT bindings.

Best regards,
Jernej

> +			reg =3D <0x03009000 0xa0>;
> +			interrupts =3D <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&osc24M>;
> +		};
> +
>  		watchdog: watchdog@30090a0 {
>  			compatible =3D "allwinner,sun50i-h616-wdt",
>  				     "allwinner,sun6i-a31-wdt";
>=20
> ---
> base-commit: be762d8b6dd7efacb61937d20f8475db8f207655
> change-id: 20260328-h616-timer-046e6ac3549e
>=20
> Best regards,
>=20




