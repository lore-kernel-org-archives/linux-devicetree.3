Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5E730D41D
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 20:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787171247; cv=pass; b=OZ2MsaiOMZjmYGNPBAgkj2TfdFxG9bgUuk02tNKMXKyepr9Fc2MWVjtlcnmQjIySYYwxe/GV8j711HxB9KXcu+g9IC2aVjWJRxJw2ERUXebXG918ZEYqL83dY5n3x6JgqUL5FF4+p2tK4HcD8GTml1rI0fkpMbv7MLg6YCqWstg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787171247; c=relaxed/simple;
	bh=IuI9ArsXBa+KjukmdCWP++NMKTFTvkvUthwrRKEqqvI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YJeM0W6IXsK0HySXI4A+K6nnupJffHa9W3tulsIuf7EC2v+3LKv4y/wow96FIpeJOfgIsTM9L84A3l5WWIDBGpz0M/439PUVGWdxzpY9uT+/5xr9uBenFyYsFla4XvEpK7BaUq64lVSSwe80rs7MjegO9arkEczrIeprwvKb6VY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OJHihFrl; arc=pass smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OJHihFrl"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-4b190cdc9feso1158614b6e.0
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 13:27:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787171245; cv=none;
        d=google.com; s=arc-20260327;
        b=oSGfH5q5A9B3zdmj609Aq+qqyyQWCTUPbm5U8bj4TLYyqR+BxuA9pUBC9SJtSQlQnY
         uIPHAAHQXcGCa1hj58HxoY0vfpGkmYGYZWuqDfNMUKoVgSA1VTqsHOkulhHhd2fKbg1u
         6wVhiGArMbKqqVLKh/9eavgzkpyY1YjdO6DI3UEHkrwsuMNDkJ2FpA5Mxg7HAdyVLlFo
         LSpf8FDNUqWl0Ty2M9Sf+tC7HpQqA3MyIzs6ioebuJX92WNfW/UOJ65ZN33xgJLEGCib
         zSFpZyt8xLDHm3TOSYJuT1Z4QpZ5O60U9vUYf5A1Wjpq9MUy4dyCWeC6f1iYyr+g8b5M
         +52g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WAaYWTPdjZdhu2lEVmJlskXIJIAxn2bNm4PbdW3h2Wc=;
        fh=O629qdfHwi/z4vKA2/tSK+WDkOdE1GNVGQF4eqpNd0Y=;
        b=O1cNQ4/UYIb3JWkxaQa/gPCXIafA9Hn/DXtjtyzPcVZQgaVgck1qVYP8+eIFBu+Jsx
         wDCrMEHYdcy8weIEvHzKmWN6ORq1xzuHLabxhD0vxvjg6C5Q9DQVbNysG3jQm9jcu3Nj
         2h+ULyHYTWvEUafeNqXW/HU9kT20mpgMzhYB8nIwzLJ57b6uZYMDdyYGVG9Sc57vfbTA
         Skw7p880GQd9I9BLcMUJGAF1QYaRE5TkPOyR+5gll3hki+BRJkEECNi66BTlq186Ug8H
         gizQSBtqUTK6G7GgpV9oVHf48ERGm0xtaDXaXPpNt7i9A1b0B0lj9Fx6h61yNaReZDbW
         XyrA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787171245; x=1787776045; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WAaYWTPdjZdhu2lEVmJlskXIJIAxn2bNm4PbdW3h2Wc=;
        b=OJHihFrlMpPrKWSloBOBpB6vB04rAiP9KHeQj52sgzMuMzyK2bpvWG/4VTwlHRHvlz
         KnofuRdSxF/kYTLL8YsQAK0Zd4MzaNuoZggQE4seYwDKfmwuFDitSBClBnwY5Eb2zYqK
         L4hEvxRI8RLwaEwQVbDw0Z093btsEmrlni77vHgam3ql5012CKu5TgZvakq4HnHzHKr4
         y9h9BxeGqC/r62LiBCY1GHmF/quzK+7hFQeX3U7wtF69vazlbDnbpQ4izexO3RW9DDMH
         6tq8Xi6bxz+5JJ90KMAdMH60/sFyW/ZlYD+gyBffcYoTfFup1Uu8KGZDPIuTJiFpiLQ4
         meCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787171245; x=1787776045;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WAaYWTPdjZdhu2lEVmJlskXIJIAxn2bNm4PbdW3h2Wc=;
        b=MENV6iLWdeS+UfKWjdI4ILD/ABo9ZdvRYBHrXO391GfnSsbTAtuXTqEE8kbiRqVMGt
         NE46Kct+RB0niptRXOOtAU0Fq1QqKExCpX9xuLEuO3k7NV7cYi/RZ3vOl8sdt2vp3AJI
         6wjPTt3A1fi95Jy8BK+/EEx/qC2qcldqf2iH0DFVfyKEaR9cJwrOHZEsgg8OGjrNyT9V
         MYKMr9qG/x+Um6saL59WKXWVkzbHcGKk1Tp3AUbojrjjBNAaMAuBxUOA18Ze0NdVPD7m
         EpXgYwAhEzfbA6XU4mk57FoQakmLES9PxvWWrfzdCQTN440Km1TN5zCBSQGWrL+Dbjdd
         my6Q==
X-Forwarded-Encrypted: i=1; AHgh+Rqw6wj1v71w4IzdPsCThjUpAyqYfegDtmZFidGS3HK/KsukOpOTcxaMqUgbmDm+z4EZuzj6l0TjY7Kx@vger.kernel.org
X-Gm-Message-State: AOJu0YywfHZVuLnu4D8hs+NCO4C9Y41wcB0Mcm/L7bO2RvLj8DauQtGv
	uLAUM/cMgwXBsukTK+3HjjTtKkcXTcvH7YwenWOEFoEkaStWW26EWOcwbJlRCMl6RWcmpAEr2Yp
	fJbd1FzLTIVCjV/lG5hUyA3c4gxsbSH8=
X-Gm-Gg: AR+sD12A+4wgY3hIafm8S0hMzTq+FAJNn0Tv53Fp9DCtfOIkglTkQrajkMnInjHtG9P
	LeJNoNcLrmhffYpE3zEhPhsi+fX40kA0MSh/5vdsew0OhQqG+QRYp1ntbPk6gl9b5R6Li9ZqJa0
	IMY6IQhJQt6U1d16/JlKn+70iOM6duiDTAPsb+RAecOFPqVKryHXgGZLE59nVrVfzJh7quTwjQy
	gu0ySaiTHwH4sk+ZShr7njHRXkfEO/kEakuDRkhY3E9fM1RiEnZocmeC0nzoYBnIrIvvyNmqIRE
	netZ/fJToh4CUtkMuo7Dy8ADs/cfXx+nLt5D20o6XiH7CRYCsyhJh41DltEeAz5FsN04yL+5lHD
	kO+CQJPCKZjB+tV+pRA==
X-Received: by 2002:a05:6808:4fce:b0:48b:5dcb:85ab with SMTP id
 5614622812f47-4b2bc9a5f1bmr6676268b6e.8.1787171243751; Wed, 19 Aug 2026
 13:27:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260816193905.218112-4-mmyangfl@gmail.com> <20260818171027.4020346-1-kuba@kernel.org>
In-Reply-To: <20260818171027.4020346-1-kuba@kernel.org>
From: David Yang <mmyangfl@gmail.com>
Date: Thu, 20 Aug 2026 04:26:47 +0800
X-Gm-Features: AcwNN1XdkSBGFMcpevYyOrH9h5-_3jHwbxITx96-MyaoLkzIBsanpPveobuyS5Y
Message-ID: <CAAXyoMOJBRg9h9RDOi+PoQkH2GcB89u6DZs-aK7CjvrDzr2JYQ@mail.gmail.com>
Subject: Re: [PATCH net-next v10 3/4] net: dsa: motorcomm: Add LED support
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, andrew@lunn.ch, olteanv@gmail.com, 
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 19, 2026 at 1:10=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wr=
ote:
> > @@ -4581,6 +4580,12 @@ static int yt921x_dsa_setup(struct dsa_switch *d=
s)
> >       if (res)
> >               return res;
> >
> > +#if IS_ENABLED(CONFIG_NET_DSA_YT921X_LEDS)
> > +     res =3D yt921x_leds_setup(priv);
> > +     if (res)
> > +             dev_warn(dev, "Failed to setup LEDs: %d\n", res);
> > +#endif
> > +
> >       return 0;
> >  }
>
> [Severity: Low]
> Can this dev_warn() ever be reached?  yt921x_leds_setup() discards the
> result of every yt921x_leds_setup_port() call and has a single
>
>         return 0;
>
> as its only exit, so res is always zero here.

yt921x_leds_setup() is allowed to fail (not now, but in the future),
like all other init callbacks.

> > +static int
> > +yt921x_led_force_set(struct yt921x_priv *priv, int port, int group, bo=
ol on)
> > +{
> > +     struct yt921x_port *pp =3D &priv->ports[port];
> > +     struct yt921x_led *led =3D pp->leds[group];
> > +     u32 ctrl;
> > +     u32 mask;
> > +
> > +     led->use_cycle =3D false;
> > +     led->use_duty =3D false;
> > +
> > +     mask =3D YT921X_LED2_PORT_FORCEn_M(group);
> > +     ctrl =3D on ? YT921X_LED2_PORT_FORCEn_ON(group) :
> > +            YT921X_LED2_PORT_FORCEn_OFF(group);
> > +     return yt921x_reg_update_bits(priv, YT921X_LED2_PORTn(port), mask=
,
> > +                                   ctrl);
> > +}
>
> [Severity: Low]
> Should use_cycle/use_duty only be cleared once the register update has
> succeeded?  If the SMI/MDIO transfer in yt921x_reg_update_bits() fails,
> the LED keeps hardware-blinking while the driver records that this group =
no
> longer uses the shared per-port duty and cycle fields.
>
> The same pattern appears in yt921x_led_trigger_set(), which clears both
> flags before two fallible yt921x_reg_update_bits() calls and never
> restores them on failure.

IO transfers are not expected to fail. If that does happen, we won't
have much control over HW consistency, nor can safely revert the
register changes. In that case, sacrificing an LED seems a better
solution.

>
> > +     /* The chip seems to jam a while if changing duty directly */
> > +     res =3D yt921x_reg_read(priv, YT921X_LED2_PORTn(port), &val);
> > +     if (res)
> > +             return res;
> > +
> > +     ctrl =3D val & ~YT921X_LED2_PORT_FORCEn_M(group);
> > +     ctrl |=3D YT921X_LED2_PORT_FORCEn_DONTCARE(group);
> > +     if (val !=3D ctrl) {
> > +             res =3D yt921x_reg_write(priv, YT921X_LED2_PORTn(port), c=
trl);
> > +             if (res)
> > +                     return res;
> > +     }
>
> [ ... ]
>
> > +     res =3D yt921x_reg_update_bits(priv, YT921X_LED1_PORTn(port), mas=
k, ctrl);
> > +     if (res)
> > +             return res;
>
> [Severity: Low]
> This is a multi-register sequence: FORCE is first switched to DONTCARE, s=
o
> the LED immediately follows whatever activity bits happen to be programme=
d,
> then the shared YT921X_LED1_PORTn duty and OTHER_BLINK fields are updated=
,
> then forced blinking is selected.  Both intermediate error returns leave
> the earlier writes in place with no unwind.
>
> Since the conflict check earlier in this function trusts use_cycle and
> use_duty to decide whether another group owns the shared timing fields, c=
an
> a later request silently retime a sibling LED that is still blinking, or
> leave an LED driven by stale activity bits?

Again register reversion dilemma.

> > +             yt921x_leds_setup_port(priv, port);
> > +             /* Allow partial configuration: LEDs are optional */
> > +     }
> > +
> > +     return 0;
> > +}
>
> [Severity: Low]
> These two functions are the ones that make the dev_warn() in
> yt921x_dsa_setup() unreachable, as noted above.  Is the "LEDs are optiona=
l"
> policy meant to coexist with that warning, or should one of them go?

dev_warn() in yt921x_dsa_setup() is for interface consistency.
