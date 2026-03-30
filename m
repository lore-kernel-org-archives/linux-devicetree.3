Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0DEC21ADB7
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 12:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774872786; cv=none; b=sXmIaygCivTL8RVwBJorbXg8fb7K63p0hBOrN2YMgi1XR/VnKqsstHhuGTew/1fiOEB540UEjFrGcTbB3JEHSnzL70sVJQIGOithRjcueQX/Zpmrud2sfJ+psj2fBw6OmxHMrM3gZ5d4+tZLfnUV+ZR/RciXLFJ1khSPWALg/64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774872786; c=relaxed/simple;
	bh=gu2bg73xFS0jBgND2oeThYTBnkCQBKCEGzyuQqD4MTE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O64SBw/ZgKDmIqWbrPKtXf0K3s9k0Yi5XTxbHcEQWz9CIFtfTRhf3D/U9lkDuZOnPjc4Y0QCmWDUkkVQJTKWJTJYCKtwbiaPcqWSLLfCdwy49JT3PaDdRk3UA8Cz/35ac7HVcARtT5D1xbAcAlqzNl7lJomPNCqzQ72jWFsw7A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-56d357797acso3141244e0c.1
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 05:13:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774872784; x=1775477584;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u2SCNNGrJmTLDn5Ig7RgkFDYfrdLEqp1DryMV/htQms=;
        b=VioRfC8ThQ8w5KIZ3WLgAsekrRE+rRFDZKhpApnc+ZMafsZyWAL2lSdlwJZyt/8BHY
         M+xAcBwn3i1A8pt4tv9TiwRoQ0MC1cSUQLAXAkS7MjBcXvBXOpu9hCwpF/bMGaWE7lk/
         E1fA5k6GL0FtkhDeRXcusmF7fgemNEUfqoJG2PQKTi+07RCvs2rAoqgl/61zpFMMRcM/
         cTV14y6qMl0bVu0I3ul9TAMiAX6zXcAyfleuLcsKOO+WBm3fQR+OQ/fAROUY2QyzT2Nn
         Etny6zzIrCkxm6eVliTs1r82yKFTJGCkkMvgf3fZ+mRjxFmQZcCj3qBzqJ5uYDRcAD0x
         VB8A==
X-Forwarded-Encrypted: i=1; AJvYcCVGXcLzjCpU8LhPUT3XLQFgYxmm7H2yX11wVgRS5zuORQuzcgoZ4pH6XfAupaOLRBV40G0o7CUHyfx2@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+ITFAnGpciSQDxdmy5l7CfU465NxqfmmtbuQAJ7bCnvUIPWK6
	JRM6j5NjvYbKWa1/5E5Jm1+RxNq307clxFOeR3ShFWGP1IK0pc2stT9JtGlTLIs4
X-Gm-Gg: ATEYQzzsS0kNvm7XTZN0E49i1a3t6tLpkg0uciQKekYL4SHf6HiKzuPPuuxzR9mJK7/
	bEvlgWHW8YA7WvBdRTmY241X85nG98bwkguTRuL6h9IHoJUplE4ziGAH47DF7Keq1EtMNomJtrw
	jVysf2dygUHV4LcP3S1dNkrtaCQcdqu9sY0izOi9Pg8OpE51gsYX24e6apFv+SaIL7fUu3oO6rY
	ssP35ilY10YEoCGxZS5ixooqjstIaj4oEIrj2Ac45PF9IDJu0Kql8nfzcsxChI8w3mnEJpJrTh3
	KdO6WpC7XWW7HTMLpTYpMpjC8EGCZuQ55gDa46LHQKX1kykXWg6j5be6qfq/pZZGI7Jm1JA9qsl
	nc/fwcrzTYd2t0jjaB3tzJOq8iPYD9wk0HLxP0+HSeFPqHT7AtlCPZm+p52L6/MOwlHDzjpTjl3
	TYHdsvt1f7fkKo+XCYGZOsx/rkFanRR3UInqyEZID0HHbuXM8zVy0Qp3Q/woRA
X-Received: by 2002:a05:6122:1796:b0:56c:c76f:1bb0 with SMTP id 71dfb90a1353d-56d4a60385fmr4620360e0c.9.1774872783751;
        Mon, 30 Mar 2026 05:13:03 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d58a58a18sm8060722e0c.16.2026.03.30.05.13.01
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 05:13:02 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-602a0648aa3so2980440137.2
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 05:13:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX9a6cnWIhkTpYjOWMhATMaeu6NxHwugmv9EcPu1OW4+Ci99TiE7lAxHzSrmejpGJfpi2K9DohPW9xR@vger.kernel.org
X-Received: by 2002:a05:6102:8091:b0:605:3bf8:d7ed with SMTP id
 ada2fe7eead31-6053bf90f72mr1025174137.10.1774872781056; Mon, 30 Mar 2026
 05:13:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250527171504.346696-2-u.kleine-koenig@baylibre.com>
 <a14be34c-de2a-4bea-9282-1fac7780b9a4@kernel.org> <crk42dsypmbyqk7avldghjq32vslmalfmmouwxzgtdci4agfhz@rkbmxj5z22fx>
 <20250606141324.GA1383279-robh@kernel.org> <erst43cabswj3cwnszssolgyoh4dsgrlnjjxhb7luk3qkqhyay@6zyoixljvwwg>
In-Reply-To: <erst43cabswj3cwnszssolgyoh4dsgrlnjjxhb7luk3qkqhyay@6zyoixljvwwg>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 30 Mar 2026 14:12:47 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXDZD6QAbKgny1utfYhagUEZ5pcgiDCTTfJKNVVZLOUYg@mail.gmail.com>
X-Gm-Features: AQROBzCz5K9CVhDhcMpmA7U1tBX0huemhEHllmKL7cyhyBhjBEZSpl6cn-J6aWU
Message-ID: <CAMuHMdXDZD6QAbKgny1utfYhagUEZ5pcgiDCTTfJKNVVZLOUYg@mail.gmail.com>
Subject: Re: New default binding for PWM devices? [Was: Re: [PATCH]
 dt-bindings: timer: xlnx,xps-timer: Make PWM in example usable]
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Sean Anderson <sean.anderson@seco.com>, 
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, Chris Packham <Chris.Packham@alliedtelesis.co.nz>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Uwe,

On Sat, 7 Jun 2025 at 09:23, Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
> On Fri, Jun 06, 2025 at 09:13:24AM -0500, Rob Herring wrote:
> >    reg:
> > >      maxItems: 1
> > >
> > > -  '#pwm-cells': true
> > > +  '#pwm-cells':
> > > +    const: 3
> > >
> > >    xlnx,count-width:
> > >      $ref: /schemas/types.yaml#/definitions/uint32
> > > @@ -82,7 +83,7 @@ examples:
> > >      };
> > >
> > >      timer@800f0000 {
> > > -        #pwm-cells =3D <0>;
> > > +        #pwm-cells =3D <3>;
> > >          clock-names =3D "s_axi_aclk";
> > >          clocks =3D <&zynqmp_clk 71>;
> > >          compatible =3D "xlnx,xps-timer-1.00.a";
> > >
> > > There is however one concern that I want to get resolved first to
> > > prevent churn:
> > >
> > > In principle I think it's bad that a phandle to a PWM must contain a
> > > period and flags specifying the polarity. For some use cases the peri=
od
> > > might not matter or is implicitly given or more than one period lengt=
h
> > > is relevant.
> >
> > Why can't the period be 0 and no flags set if they aren't needed?
>
> I don't say they cannot, and probably that's the most sane option if
> there is no fixed default period and flags and we're sticking to 3
> cells.

So zero should have been used for drivers/pwm/pwm-argon-fan-hat.c?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
