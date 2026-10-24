Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792851055;
	b=nwKyXOlM8WDnUt99byGh1oV/7SkstAWyK7U79iYXFVplxQ5ZWnrd39Tv2OI4TckgoKES
	 s/BuqPgWvSKpH9VsmluMQYoeeDOw+sUqfzBb/Gd1PxCgvy5MPWwP1ppYd+lJ4hrTzz6DF
	 ANkFetLNz6z00zHJIs4dGGOn4Rr3uYuQRYviFaNCUi8976fdIRjgzb1uNer/qAkeQ+5fW
	 6WD7q+BnU8IUJqTDAOOfaxumFAxrWRs02LJAP2+J6rUccr9nWuGBtZZr2rRIT82Uw4StR
	 mZ5FwVOXIr54vezX8kIvBLxdVTkP9W+YCSAW5lmfClj/7nGydMCRNGEPA6CqjVrnJ8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792851055;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=77L0zCZoOr1z13ZaKANU7WNCtV3LEiZYs/dClJg+u74=;
	b=x9BN5L/HgzLjcU+8+II3BVTjqLXJzDq8tS5SBnrRpa/9ij2c5CUM2J7RSWRQepWnfNIj
	 Wkr5Cbi3x2AAMif8xeWQrG7WVCzJVdTZbkNH/LKHaPMNfKwuRibIVBR7sfcPUyeBobuFJ
	 vWo6FVd2TGy2tn63TBQKjj/MZqnfUgOeKjSUaHLb1kIsDI5mKe/jHSHhRmP1tAQTe79C/
	 3vZhttN/CDi1TiAdaMBPnBivfRHt9JYuVcuXPvJF5kJPpjp9HwvvFFdcmXsHxHGvCAcds
	 28i+pQXcZkMZgJ1xMsepEuq3zeHZYWt+ImntNa+WAcvFhl4aTZZZn/UQ2QM/l3LRLpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O7PQAbc7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5241C606A324
	for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 14:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O7PQAbc7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F11E71F031ED
	for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 14:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792851055;
	bh=77L0zCZoOr1z13ZaKANU7WNCtV3LEiZYs/dClJg+u74=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=O7PQAbc765tV6BQe5z/Q+kEi4GBzWszlyJHrOqDa07Fb4O59K54EyqncHoVX0up7r
	 IBlIivdSRXqyGDMG48VdbfMuSUrKqAEbanFkQRYCfyGaHJV4B8l2lfPbd05zS2e0lP
	 jcYBxVKpflgZPtttF8g9qBukbEWcDmi9DFDGv0IHYR1ygtfoGcUNsGY+0uLk9yeqYb
	 E7JjTPrFlMw8xFKYCQmZsf4Ll7kJ+o3Quth4/PnCPmus0oYB98LkjK3dLZ/mjh9Sy8
	 Uen3Tt5MGuDOt6MdrZLSnPBqNa25HshtZ5IasyK4opT/VNwUwTMFnfXf0C6wf2PnvI
	 LZz8EGzT8MX7Q==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3a5a26c8412so11962721fa.3
        for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 07:10:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByrwKJOTn+F/2y92EZHFY9bCOTFTzxCdmb61c3xpCPLA77ICm2ApHIQXrs2Jgn6OdxTOnJesVjCYHhA@vger.kernel.org
X-Gm-Message-State: AFq9FYJuMD8t9A6aRIqMPl4BT0aTJCHOrW/K847wYHkAjmxqKzfZueBx
	RmFRDdgBrxrdRXL6UcEqpywPatLO83le82pZD4AXNNhoopp+QTdSUYjvtQT33SAg7OUY0+HIY9Z
	rEYjA54WeLIowquV46ykEWEHAvzp8bB4=
X-Received: by 2002:a05:651c:b1f:b0:3a5:e792:2dc8 with SMTP id
 38308e7fff4ca-3ac6fd2b91fmr5065141fa.16.1792851053288; Sat, 24 Oct 2026
 07:10:53 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023-submit-h616-uart-fifo-v1-v1-0-e4a3bae2eba8@gmail.com>
 <20261023-submit-h616-uart-fifo-v1-v1-2-e4a3bae2eba8@gmail.com>
 <atseYvQUYvpMFEIM@ashevche-desk.local> <CADvTj4pRW9q6VyQ=nLi8q0mMF8LgccfO4eqAeqgzzgOkDno1dw@mail.gmail.com>
 <CAGb2v65LVm1GV2kV4bVO8YJd16tkubHOvXUtbJ3uuBw2O3TBsA@mail.gmail.com>
 <atywVnHU5NsP_gOP@ashevche-desk.local> <CAGb2v64P2rM0VnFh0NfNhi+3_xGPYkxt2j+2hmBMu5ZvugHRow@mail.gmail.com>
 <aty37_xHO-QRa7hQ@ashevche-desk.local>
In-Reply-To: <aty37_xHO-QRa7hQ@ashevche-desk.local>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sat, 24 Oct 2026 23:10:40 +0900
X-Gmail-Original-Message-ID: <CAGb2v66jqrrix903k2OT-z0kV-9XWm6LpXmHQsCyLL5P6uXD7Q@mail.gmail.com>
X-Gm-Features: AclHuK8in-RebYr4WdGY52-xcg2ve7F2PHG1dtE5MpFbEAzuaEhl8yb8pdBRewE
Message-ID: <CAGb2v66jqrrix903k2OT-z0kV-9XWm6LpXmHQsCyLL5P6uXD7Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] serial: 8250_dw: configure the Allwinner H616 UART
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: James Hilliard <james.hilliard1@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 24, 2026 at 10:51=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Sat, Oct 24, 2026 at 10:41:55PM +0900, Chen-Yu Tsai wrote:
> > On Sat, Oct 24, 2026 at 10:19=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Sat, Oct 24, 2026 at 10:10:33PM +0900, Chen-Yu Tsai wrote:
> > > > On Sat, Oct 24, 2026 at 12:12=E2=80=AFAM James Hilliard
> > > > <james.hilliard1@gmail.com> wrote:
> > > > > On Fri, Oct 23, 2026 at 2:44=E2=80=AFAM Andy Shevchenko
> > > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > > On Fri, Oct 23, 2026 at 01:33:50AM -0600, James Hilliard wrote:
>
> ...
>
> > > > > > >       /* Internal 8250 only */
> > > > > > >       UART_PORT_AIROHA                =3D 124,
> > > > > > >       UART_PORT_AIROHA_HS             =3D 125,
> > > > > > > +     UART_PORT_DW_APB_256    =3D 126,
> > > > > >
> > > > > > Why? Besides the poorly chosen name, what prevents us from modi=
fying the
> > > > > > corresponding parameters at probe time by leaving the one of th=
e existing
> > > > > > types?
> > > > >
> > > > > The new type was primarily a way to reuse the core's FIFO configu=
ration
> > > > > table, including the RX trigger mapping. H616 uses thresholds of =
1, 64,
> > > > > 128 and 254 bytes, whereas PORT_16550A maps the same FCR bits to =
1, 4, 8
> > > > > and 14 bytes. Overriding only fifosize and tx_loadsz would leave
> > > > > rx_trig_bytes reporting and selecting the wrong thresholds.
> > > > >
> > > > > The core already has get_rxtrig/set_rxtrig callbacks, though. I'l=
l rework
> > > > > this to retain PORT_16550A, supply the H616 FIFO parameters durin=
g setup,
> > > > > and use those callbacks for the correct trigger mapping.
> > > >
> > > > Please consider just taking the FIFO size from the DT. On some chip=
s
> > > > not every UART has the same size FIFO, so we already need to deal w=
ith
> > > > it.
> > > >
> > > > Also, FIFO size is a standard UART DT property, though somehow not =
included
> > > > for dw-uart.
> > >
> > > FWIW, it supports all standard properties for UART.
> > > Check what uart_read_port_properties() does.
> >
> > Ah, that's nice. I hacked up something [1] in the past to get it to
> > work, but that was probably before you added the helper. I never got
> > around to splitting up the commits and sending it out.
>
> Hmm... The helper is in the kernel for the past 2.5 years.
> Maybe you rebased it and it lost original dates?

I had been carrying the changes locally without committing them. I only
committed them recently to back them up remotely. So yeah, the dates are
not accurate.

> But if it's not working, we need to address that, I believe it should wor=
k out
> of the box, because the same function is used across dozen of serial driv=
ers.

The new helper probably works fine. I can rework my code to use the values
given by the helpers and give it a try sometime next week.

> It might be an issue in 8250_dw.c, but I can't tell for sure.
>
> > [1] https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git/comm=
it/?id=3De7e0741fa04f349ad9f94a4059e32467a30ef5d9
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
