Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6EA93AE1A4
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 10:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774606628; cv=pass; b=khNx1XzSQ3tlLufEbUQGES+pKKib0n7m8fFrgvRzsjxN3I1zyV3eU4J4dhBiF3dwh87Yz8MkaQXpf+ud1WHlwaf3cSgup8KLReCfk+eBSWr4mCWGik3/kcpoVJrTCyEE2jZhxMUJetDw4zDFJe7mYMP1Ke75qX6yrL8JrGJPtrU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774606628; c=relaxed/simple;
	bh=qS2Q9O7bG/xoCokg+S7YRoYhx+f6F9kSCLDT8bvQ+58=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RpRQ/iPPr7hFWbE9mGQRALj9HI5fsb4DT66Vc/CaCbKBBOR+IRSbgdTyeuSnz0Sa8E4T92K84NGRCZbGlPOGHi8R9jGXOgqH7pqpWEb1Rwb0w8d0v20NISxl1lMeiIlroRclnDuVTd4/1N5gNUaDT/CEsGh/HBeK1lBv0YC61nc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qn6UBzLC; arc=pass smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qn6UBzLC"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-486b96760easo21319865e9.2
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 03:17:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774606625; cv=none;
        d=google.com; s=arc-20240605;
        b=jq0WoyhMNFAMsSEfu9kvChaCrH8mMRV2uGj3sKHDL+CNIfP7dBp33TkjkIRDGL2r/0
         oscMXKjNOlDpgvhpSX4PQsVsqQQs6g6PV08y19iqsbdBJdltwLTsxdrP3rfP+IvHqXwK
         cnQ/Rk7yjWBaL4OvQpJDDR71gW5ofLvhpGQG6zgdUIT6d7m+K6AVB+3Yslv8YlzqCyry
         lIRe6NtWnJwnBHBzf3wW0TNyUsccPaSS7GdXXR7yyhAyNkQ6BmfL7uNH0vwDzJO/8p+C
         qQ9iIsiHol2+UIvdFZofs+unUKHhynhKhrV10fmuTo31K0QGGh8ADjZliNMIfckG0xKi
         P8ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MD962DJa2d+eTZumSAmw+2SavlPnEgh1c+O5EkQB1zw=;
        fh=5xIT+696OvuBGl4H31AFurBa5fOWNmq0P3mvzuoW/tc=;
        b=DgW0j73sVVWFhYqPRYg1nuj1gcy0jM3RkcAhOHB0NaClkvS9tXrYch3pU/9odj6ixO
         zsblr9lDanhOsqyFN3ttIXiSzdVwF1xDoQp74qSHv1QpjeH/zccyWvRn4xKsAnOvD5Rc
         2fyG9Sqiorimp9GjMXDKMcQyhUH93SpmVUHhFzxssPqoulZ9QjRycWaa+70FJRDy6OV8
         fNvxbdjt2Zss9q3VGvHAhGoGMSt85IjcilMwEJwxhcJgD7GqJ7Sk0lVDk+TB4rFQWFBu
         FofUr4RVvldX9wCO1IvlQC2vZeOQPIm22Sk3yIIkVdH2Fm4iTUWjAZTyXhgbwBTS0Oyp
         TbOQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774606625; x=1775211425; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MD962DJa2d+eTZumSAmw+2SavlPnEgh1c+O5EkQB1zw=;
        b=Qn6UBzLCj1XJ+cF8re6vgTipiZbzuYeTwOyEJodUpmiQvQ4Wp6yeVkkFnfrRz/QwXW
         afDlZ7QFYyFQxk64enp+IM3lTYwA2tlVfk0f++Ts/mUu+8kUksoLhZKTzgwNWeVZb93o
         /unh3umxrVCU7ZLRR2Qh7YBoZf9+gpbMDyzfiyRP4gHfCGUY09q41+agfze/tGuD9rfl
         HrGtT89aKSMZIuh9inOkK3wuNnKUtcoVASi++39J9agqsmnj05YZX2tGoC415gaKeE+b
         9dE9tF+bl82RqxlivYRThHsyjYZLkiL75SEzittSVqBx2djmEWrRH7T6O3YOduAIGqlk
         3a0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774606625; x=1775211425;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MD962DJa2d+eTZumSAmw+2SavlPnEgh1c+O5EkQB1zw=;
        b=cK6Ru3ufr5i+6bOYZs8KTLoZ2ocEKm7/pcszGcphusI9mfI9BpVfpXDHcZQNMPlV5a
         6+3coN7gGiww8ZsrvH5YOX5L5+GibTuqelyPuYxT2XVfk/s+nERm3A7dmsYrzgyxOK2z
         xzkUGFhGlD9pfaL+jE7tSmAJtUJEw1XDi+NxjZgYije7Vrb+w/ZtTNp+iq0Ub6Z5E/NW
         +JFPqRqyWS098flOvg2xXkoUtfdqFJCWFckKzbEbtwUAAZpW4RoTRbp4sKNq2C1147X2
         kdL7JNsBQL8BUgKxySpxOpqgaqtqaTaPGY4HZUftVG+qHOvAqk7O75FI467qod8kthkn
         K9jA==
X-Forwarded-Encrypted: i=1; AJvYcCWHgAzO4wVMBsmRauQv3mB0foK0PPg9Q/i9srNw6IgQS/PLmACGngGw0H6jh+nnxOleHIKzmk984qfK@vger.kernel.org
X-Gm-Message-State: AOJu0YyAbIeh9uXek/wKdSBE1gXGzs/RMPy7FQGZnmsr4FQc5r3E3g/5
	Z9lF2m7z1W1w5YlZgJx4/rSha8MBjN+rfjXneT5n8tGb9cxGJoOlxvU8+zAWjTO0HGJgLtvrfKW
	4bgMJUvlasO8xlrwr1/lLc0zGuLnKR0biY6ReMUI=
X-Gm-Gg: ATEYQzwvguabsCFSE4A+Q6Cz7I02TwCwfO60DABwtSDl1hoGXrNjpcQ3cKLabuUrfSl
	OiFBZLQqDhMrmze8JpV0z+0Z/jO0urA7YImYQsQmvzCvar38IP1u7NplrwiYhtp4Ad8P6sjy4bT
	ojFvzBGm6aBJB0jWTqGLVO9g8QInFDG8PJ2Mg9YHUFQ5dK7Fdl9GteOnGj8X1Gj280wei5f/6hR
	JXO6RrUpYf49gd5WaoJ74qm8idQthjXEFRzCGHk5GUDnGj0Ss+gFsi0lHpY9q7BbFcyo+qHUxRQ
	PlPcanV4VoSU1LFhfB+MhAyBflXFCBL0N7pMI3mYf84v91pEG9/sXH0WxYa24dgOjvM0Bw==
X-Received: by 2002:a05:6000:2c10:b0:439:bd70:610f with SMTP id
 ffacd0b85a97d-43b9eab26famr2859930f8f.44.1774606624710; Fri, 27 Mar 2026
 03:17:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260319141515.2053556-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260319141515.2053556-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdXzWFHxeyR4Z4fLUc-QhwPK1RnB5VTzQODjzoR6oDwKHg@mail.gmail.com>
In-Reply-To: <CAMuHMdXzWFHxeyR4Z4fLUc-QhwPK1RnB5VTzQODjzoR6oDwKHg@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 27 Mar 2026 10:16:38 +0000
X-Gm-Features: AQROBzA351V4-u031sU_LWBz8AfXD44IpEZr_5GEUWRa6g-PutLuycoQAmmlEFY
Message-ID: <CA+V-a8sRgOePfrEG2HfMp3XnCYXRay58s9fWjjg8yLjqYFvdnA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] pinctrl: renesas: rzt2h: Add pin configuration support
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Thu, Mar 26, 2026 at 4:34=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Thu, 19 Mar 2026 at 15:15, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add pin configuration support for the Renesas RZ/T2H SoC. The RZ/T2H So=
C
> > allows configuring several electrical characteristics through the DRCTL=
m
> > (I/O Buffer Function Switching) registers. These registers control bias
> > configuration, Schmitt trigger input, output slew rate, and drive
> > strength.
> >
> > Implement pinconf_ops to allow reading and updating these properties
> > through the generic pin configuration framework. The implementation
> > supports bias-disable, bias-pull-up, bias-pull-down,
> > input-schmitt-enable, slew-rate, and drive-strength-microamp.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v1->v2:
> > - Updated commit description
> > - Dropped 32 bit reg access for DRCTLm registers
> > - Switched using to guard for locking in rzt2h_pinctrl_drctl_rmwq
> >   helper function
> > - Dropped using RENESAS_RZT2H_PIN_CONFIG_DRIVE_STRENGTH instead
> >   switched to using the standard PIN_CONFIG_DRIVE_STRENGTH_UA
>
> Thanks for the update!
>
> > --- a/drivers/pinctrl/renesas/pinctrl-rzt2h.c
> > +++ b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
>
> > @@ -54,6 +56,16 @@
> >  #define PFC_PIN_MASK(pin)      (PFC_MASK << ((pin) * 8))
> >  #define PFC_FUNC_INTERRUPT     0
> >
> > +#define DRCTL_PIN_SHIFT(pin)   ((pin) << 3)
>
> "* 8" sounds more logical to me.
>
Ok.

> > +#define DRCTL_DRV_PIN_MASK(pin)        (GENMASK_ULL(1, 0) << DRCTL_PIN=
_SHIFT(pin))
> > +#define DRCTL_PUD_PIN_MASK(pin)        (GENMASK_ULL(3, 2) << DRCTL_PIN=
_SHIFT(pin))
> > +#define DRCTL_SMT_PIN_MASK(pin)        (BIT_ULL(4) << DRCTL_PIN_SHIFT(=
pin))
> > +#define DRCTL_SR_PIN_MASK(pin) (BIT_ULL(5) << DRCTL_PIN_SHIFT(pin))
>
> I will drop DRCTL_PIN_SHIFT(), and replace it by "((pin) * 8)" while
> applying, for consistency with e.g. PFC_PIN_MASK() above.
>
Ok, thank you for taking care of it.

Cheers,
Prabhakar

> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-pinctrl for v7.1.
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds
>
