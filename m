Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF45B40626C
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 16:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774541537; cv=none; b=KaSSRljLhdKSy3rKUDKEqBKTZNmqk88dw5rvBSzDyLjWrpddfzDrn/OJAAtAdTiuQG7xd0ezK+EstVUK2En+yru7rSeYJ6j1+NWCIJSeQlyiN42GkgHYn6UVSJyL6IcZpwZXpS1vqDRGQURa8OPBcgurJcrKrX4EOZWc6szM5co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774541537; c=relaxed/simple;
	bh=rNsqYs9XZiNIs58rpzMtgeYcYIlt3WXgo1ohw4icZf4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Im/8kVrcgLi0wbJwTssP/WSgHy7nSmX7afrXJygEyQ6K/VwjccxzbCx3TAz5XE4rn8vN0oHDqCRs06ipnWe6iFHB676HFzHpsAYNwkLsIFz5vDPrhR5kx/9m/bSXCcVbvO1gY3dS9tU7WgYAEa0Auw3dUHuDlr7hJcqasQrZmTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-94dd7178d63so685147241.3
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 09:12:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774541535; x=1775146335;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uSoOoWFbk127jfYcbLQVHGWRDLpMWSdUjX9Ohf2bfKM=;
        b=bz0hEcxOYePla9KCRfvjn9qmfrMm50TYvtpevhPSeceT5llQQItDgkZUgypTOwvOaD
         I8kivBKZxWCiODRIlT4U3T25p8DfIk+XfS/rn9RvxgeFI1GudikswkjPXvmXo2Oyajxt
         Ai4Jlpru1ZSs5n3TaGBA3p/0bGHgbEiAIkyrGet+zKG/MgjReYMPIfD65PbEqavRXarG
         tkFLXU4ksVGfOFBu9ow/W1xoDSJqgDE2AvneBEoMKPMX6ZTmS6rwfhe5J4FjD3rCPMBD
         PfXpcUVUvgxjv9oaLmYSkamdp4ny78izc+XZHfqUzT8AV5CH7i0nt68BFC0092Ksaetk
         mC+w==
X-Forwarded-Encrypted: i=1; AJvYcCXrV2rSNTvBGMSM8ecTaLJUszkAAbAGHl1jtPD0ZB6CFZxwj+4GbNN14WUNsJ9hkhyKSlZeYU3Wh1mX@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+5pyqY/7eIPiU2ZwF5IYZbm+NB8DMwxFRWoxy1qYG3FrYLgnd
	qNY4N/O72th8dqtWa6NcvtbY5RmGig62GOwqJonncMgvkYPiHvWm/nrI3By6b/we38Y=
X-Gm-Gg: ATEYQzwoyB9aCgfbh3rsxo7ZlL79+uwO4Nt/PAZvF15WV0k+bI0wQp8yiS7fVIE9m8G
	58/+lVD6vK9RYO0VodKh1UbVGKyFfatkBah76XLWMk956bpF55253sWMR2U2gMqG1LmXoP9f8UJ
	bRPEG3467nLbz49gokN0whAMIjn3+byL8q9wPYLDxg/d2xWDiBRauR5hVlAtUXi8OW6wIrjIkSB
	YvhlPzrQxREl8mwsGkPWyQwAGv+TM+lDx46Rw//eALerJQX6LgWcC+Wh0e5RRK9dEUX/daeOCDS
	GK+Sde8ZiSNW/yy3KR4FmuQbP9evmSEDMrVKwgSUzD5v3fY7fGCvBAL52rgYz/zkxLJKT0rKjfT
	dLPKZi9pV3ROJVpg1MiBd4kRlG03iTLH+W8oC+hgHSrhsW2k0JNDWCgRpswnMo+NXdpVpa0IVAF
	4N7WXqCywwJFXaWAg2YkO5mC8U9/tNrDebu3cp9km1E9cW1Bkjh0V2oQRh0gBF
X-Received: by 2002:a05:6102:5f02:b0:602:9977:a4e1 with SMTP id ada2fe7eead31-60387235b56mr3662162137.18.1774541534726;
        Thu, 26 Mar 2026 09:12:14 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-604d50677f0sm3645545137.1.2026.03.26.09.12.13
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 09:12:13 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-6028bb29cc9so669030137.0
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 09:12:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX3fc5vsqKRQSYDy9usXpc5xm1RPiVZw1p4VvKRSzoIU+0nBbKSBE6fhQbECm/mkaCB6drEaw3gYQIi@vger.kernel.org
X-Received: by 2002:a05:6102:6c4:b0:5ff:1cc2:aa8c with SMTP id
 ada2fe7eead31-60387536b11mr3781605137.36.1774541533179; Thu, 26 Mar 2026
 09:12:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260319141515.2053556-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260319141515.2053556-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260319141515.2053556-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Mar 2026 17:12:01 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXzWFHxeyR4Z4fLUc-QhwPK1RnB5VTzQODjzoR6oDwKHg@mail.gmail.com>
X-Gm-Features: AQROBzB4lDDc6Paz2lavGGOEVw_oYmGOkaXAJNxgaMlSXZ2W_dPOAbJR1CHRwrA
Message-ID: <CAMuHMdXzWFHxeyR4Z4fLUc-QhwPK1RnB5VTzQODjzoR6oDwKHg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] pinctrl: renesas: rzt2h: Add pin configuration support
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Thu, 19 Mar 2026 at 15:15, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add pin configuration support for the Renesas RZ/T2H SoC. The RZ/T2H SoC
> allows configuring several electrical characteristics through the DRCTLm
> (I/O Buffer Function Switching) registers. These registers control bias
> configuration, Schmitt trigger input, output slew rate, and drive
> strength.
>
> Implement pinconf_ops to allow reading and updating these properties
> through the generic pin configuration framework. The implementation
> supports bias-disable, bias-pull-up, bias-pull-down,
> input-schmitt-enable, slew-rate, and drive-strength-microamp.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2:
> - Updated commit description
> - Dropped 32 bit reg access for DRCTLm registers
> - Switched using to guard for locking in rzt2h_pinctrl_drctl_rmwq
>   helper function
> - Dropped using RENESAS_RZT2H_PIN_CONFIG_DRIVE_STRENGTH instead
>   switched to using the standard PIN_CONFIG_DRIVE_STRENGTH_UA

Thanks for the update!

> --- a/drivers/pinctrl/renesas/pinctrl-rzt2h.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzt2h.c

> @@ -54,6 +56,16 @@
>  #define PFC_PIN_MASK(pin)      (PFC_MASK << ((pin) * 8))
>  #define PFC_FUNC_INTERRUPT     0
>
> +#define DRCTL_PIN_SHIFT(pin)   ((pin) << 3)

"* 8" sounds more logical to me.

> +#define DRCTL_DRV_PIN_MASK(pin)        (GENMASK_ULL(1, 0) << DRCTL_PIN_SHIFT(pin))
> +#define DRCTL_PUD_PIN_MASK(pin)        (GENMASK_ULL(3, 2) << DRCTL_PIN_SHIFT(pin))
> +#define DRCTL_SMT_PIN_MASK(pin)        (BIT_ULL(4) << DRCTL_PIN_SHIFT(pin))
> +#define DRCTL_SR_PIN_MASK(pin) (BIT_ULL(5) << DRCTL_PIN_SHIFT(pin))

I will drop DRCTL_PIN_SHIFT(), and replace it by "((pin) * 8)" while
applying, for consistency with e.g. PFC_PIN_MASK() above.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
