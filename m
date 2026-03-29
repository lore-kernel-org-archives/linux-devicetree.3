Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F9D35F616
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 13:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774789405; cv=none; b=fV3NG5t1iGwE8aAvef8L5bXoPDl2WqbA4qzJp77Qu7vQ0X7LENdhi1Esg6IRjDCXwi3q/Vdra/edG0PrcDgpWn+ZXHi+7/o2sI5w2j4pqe2gML8SVG97XOkEcPe40b7/9HieNAElZ0JsO5L+QB5AfnXIBUZxFyk38o8xgJ5UVGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774789405; c=relaxed/simple;
	bh=U/R2pAPnxIsAzZzsFQMZKmzU5HLTHhfGOlT1wA7/tYM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nCNDNGmpD/lS+HZ/p9FpXtpY/pgwm2s/2KbEXbJsZpVUo6LGZXEp37RTJVdI8HUdHaqD2lSYwgqBEFpnqGtuntJULZl7+8IoGkw6zYusyAwXs5scL1V/1nnWqqVS9XF38SFlG8GSb+9LDpyykJDBv3DD4uSx+QEUWbJmxeKPHLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IJWEF3+a; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IJWEF3+a"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-486fe655187so45686875e9.2
        for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 06:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774789402; x=1775394202; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=viDNw9XnGj7IgNiXG+l3zPbwcxnl/gxtXwY665wWLdc=;
        b=IJWEF3+atgar6OEs3VzeBeKvalVB+7L5EivTNUE3KS18HtOoeze+hEwBsVjq+LwmdX
         b6Vte4+/PtjSZtF893ze9mw8mu8Co+Rbv5NBn2HA8nxGM9lo+hbgyb3fuRAXVn60CiT6
         /WpaZTkQU/LQO292l3qhFCA1/ffbkf5SdwsMCyw4BW/fROM/i/As7XZ/yjfK4mwlp5sc
         +8Cuu1wMJTG9tT8JISOna+EFGKXOU6M3O0wGAfbB3ECl1lE8GkKqGVsFhg4lGNRqRa+c
         zGcLWQhUGXHxz9KQ1+YGp99faZ6rN+xplnKu5Ul05r2NkMsCXkdcDBRxdf1fD8HD1Qd0
         X8/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774789402; x=1775394202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=viDNw9XnGj7IgNiXG+l3zPbwcxnl/gxtXwY665wWLdc=;
        b=RyULhMUenVpBJVqx5po2fkJ7ReMoN8PFnKr36sAMRcpf/QiDQjCDLXv8LatPrZGwbT
         ZFm/+m2aG9X2P6upujZ/4/ZjDsm3qxijzqR1W8LBt7No7EhUz6rxoeBPl0hkmN6b0D4n
         eSgmBuE/XSFijCr/3Rbxsox81gb7E+Cg0Ud4RZ6akpPOamzSDjwAgKYo1w7KMvKQM5pe
         zv54awnXyxUtsUftgHThIAvu0qEK4SnVVBGWDrkopbYZEWeo2ZDuBFNdpnoCNXApuOX0
         CQLLTBQ1mjk3CgbqQSWh+qZz6YRWu/si8RTVahgFrM/XT4eXXiuls5ULrwJUfdZR93SA
         117g==
X-Forwarded-Encrypted: i=1; AJvYcCXE3NiuPuxyGMhHIYS1bKW5gTU1GT2dIeUBTIbrM6BYIKfiWyH3E0k86hEx8h2Z55CvkEisoeBQZIzG@vger.kernel.org
X-Gm-Message-State: AOJu0YwxvV3ti2HHjjRZwhI1i0/hHjrpSaZwdB8bkVYFwLY2fGwAhLIm
	UBr8IrwsNJoYnC+vGGd8UPtWf4JcATeY11HEfAei9wbRk6foFMtICFxs
X-Gm-Gg: ATEYQzzGCNrQ/R1Ps5wPEhUf3QLciNz0kKVKUmkynOUji9cSYB7ODepXGF2V3GotVyf
	3vBz3W9yfLTcAWkTjMwkvJD3LhwYPmE/Sdg2FtA2rb5YcOSETItEaa+UXmfTylOoK/ohxwElC6u
	qR6Iprf22oN7JekhrHsUhnL9OBkNC+B5c2NbakVYWdT52HCPcg5jcJEsakUGu0k8ksNr0HZaFng
	dvu65Bd+u2gd8IFCalZZIzFflZIajIFaluEmzSc6FPGPRM8G6cqhE6+gPVyCQa2G834MwROfrq4
	CzWy8ZgV3I6tnXOOdvyaDsaKn6tW3RuTJDOMAoEamWI3w1qRkoLwZtH2wOgcBzjDB4Rd5RubCMH
	qD8mYF0ETrm65nVAPLxZ5MjhPNrHSaer41FUcCy1HwlR4pO/vJ9o6CaEYrlAO9Wd29DzcX8UpjH
	LCd0604jJFnW3EToUq5YZWTVK93T/zW/Dd5X+Pm+1Xzyoj5EC+1ddim7i7xZDPotJVIhnr6iuY1
	9A9uFNbKnlCK6oCzg==
X-Received: by 2002:a05:600c:4e15:b0:485:2ce2:4c87 with SMTP id 5b1f17b1804b1-48727d45881mr151705535e9.4.1774789401886;
        Sun, 29 Mar 2026 06:03:21 -0700 (PDT)
Received: from jernej-laptop.localnet (118.red-213-98-130.staticip.rima-tde.net. [213.98.130.118])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722d23679sm397412475e9.9.2026.03.29.06.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 06:03:21 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Michal Piekos <michal.piekos@mmpsystems.pl>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: allwinner: enable h616 timer support
Date: Sun, 29 Mar 2026 15:03:17 +0200
Message-ID: <4721811.LvFx2qVVIh@jernej-laptop>
In-Reply-To: <n2bupd37br2mp7ls6c5z5ueoancr53tn4mywg2vvrlpyhmkex4@lxe6tfdhwz5e>
References:
 <20260329-h616-timer-v1-1-5966d0420a66@mmpsystems.pl>
 <5977334.DvuYhMxLoT@jernej-laptop>
 <n2bupd37br2mp7ls6c5z5ueoancr53tn4mywg2vvrlpyhmkex4@lxe6tfdhwz5e>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne nedelja, 29. marec 2026 ob 14:07:19 Srednjeevropski poletni =C4=8Das je=
 Michal Piekos napisal(a):
> On Sun, Mar 29, 2026 at 01:53:45PM +0200, Jernej =C5=A0krabec wrote:
> > Dne nedelja, 29. marec 2026 ob 13:43:04 Srednjeevropski poletni =C4=8Da=
s je Michal Piekos napisal(a):
> > > Add support for timer by reusing existing sun4i timer driver.
> > >=20
> > > H616 timer is compatible with earlier sunxi timer variants and provid=
es
> > > both clocksource and clockevent functionality. It runs from 24 MHz
> > > oscillator. It can serve as broadcast clockevent for wake up from idle
> > > states.
> > >=20
> > > Tested on Orange Pi Zero 3:
> > > - timer is registered as clocksource:
> > > - switching clocksource at runtime works
> > > - timer operates as a broadcast clockevent device
> > > - no regression observed compared to arch_sys_counter
> > >=20
> > > Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
> > > ---
> > > Test results:
> > >=20
> > > Clocksource switching:
> > >   cat /sys/devices/system/clocksource/clocksource0/available_clocksou=
rce
> > >     arch_sys_counter timer
> > >   echo timer > /sys/devices/system/clocksource/clocksource0/current_c=
locksource
> > >     [ 5031.105997] clocksource: Switched to clocksource timer
> > >=20
> > > Clockevent configuration:
> > >   cat /proc/timer_list
> > >     ...
> > >     Tick Device: mode:     1
> > >     Broadcast device
> > >     Clock Event Device: sun4i_tick
> > >      max_delta_ns:   178956969070
> > >      min_delta_ns:   1000
> > >      mult:           51539608
> > >      shift:          31
> > >      mode:           1
> > >      next_event:     9223372036854775807 nsecs
> > >      set_next_event: sun4i_clkevt_next_event
> > >      shutdown:       sun4i_clkevt_shutdown
> > >      periodic:       sun4i_clkevt_set_periodic
> > >      oneshot:        sun4i_clkevt_set_oneshot
> > >      resume:         sun4i_clkevt_shutdown
> > >      event_handler:  tick_handle_oneshot_broadcast
> > >     ...
> > >=20
> > > Cyclictest measurements:
> > >   Dominated by system scheduler latency and do not reflect clocksource
> > >   precision.
> > > ---
> > >  arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi | 9 +++++++++
> > >  1 file changed, 9 insertions(+)
> > >=20
> > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/ar=
m64/boot/dts/allwinner/sun50i-h616.dtsi
> > > index 8d1110c14bad..bf054869e78b 100644
> > > --- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> > > @@ -228,6 +228,15 @@ cpu_speed_grade: cpu-speed-grade@0 {
> > >  			};
> > >  		};
> > > =20
> > > +		timer0: timer@3009000 {
> > > +			compatible =3D "allwinner,sun50i-h616-timer",
> > > +				     "allwinner,sun8i-a23-timer";
> >=20
> > You have to add above combo to DT bindings.
> >=20
> > Best regards,
> > Jernej
>=20
> Not sure I understand your comment correctly but binding for h616 is alre=
ady
> there:
>=20
> Documentation/devicetree/bindings/timer/allwinner,sun4i-a10-timer.yaml:21=
=2D27
>   - items:
>     - enum:
>         - allwinner,sun20i-d1-timer
>         - allwinner,sun50i-a64-timer
>         - allwinner,sun50i-h6-timer
>         - allwinner,sun50i-h616-timer
>     - const: allwinner,sun8i-a23-timer
>=20
> BR
> Michal

Sorry, sometimes tooling fails me. All good.

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>=20
> >=20
> > > +			reg =3D <0x03009000 0xa0>;
> > > +			interrupts =3D <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>,
> > > +				     <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
> > > +			clocks =3D <&osc24M>;
> > > +		};
> > > +
> > >  		watchdog: watchdog@30090a0 {
> > >  			compatible =3D "allwinner,sun50i-h616-wdt",
> > >  				     "allwinner,sun6i-a31-wdt";
> > >=20
> > > ---
> > > base-commit: be762d8b6dd7efacb61937d20f8475db8f207655
> > > change-id: 20260328-h616-timer-046e6ac3549e
> > >=20
> > > Best regards,
> > >=20
> >=20
> >=20
> >=20
> >=20
>=20




