Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF67E48BD2B
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 15:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786635740; cv=none; b=oCERhnCqV3+AjCoK8px27teuatxpKEKQ10MwOorWs18+rRAHq2oQCStTyC6hYWe+SwXuJF82Ug0oH9qe6dpvBRAKk9C+QmnX6l0E1xNrCZjgD/spc5+sHkeSpRZrVzFnCuA2u3KIVXZm8fwfcihqIsbvIBJBmYA0Z/lV1Vw+s7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786635740; c=relaxed/simple;
	bh=vzsqRgKK6xb+qXIWqmZLoli+ye1tIEurLtQ8ZUQVhRQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W/xbmNW8xrebvM/svqWrfJGOOF4FgAOfwK9igCqjAAY8tURMoUd9HKRCQGKQPuqk7s0S3jxbkevHKxtEA42iPEfwoNLFVvd/+2WjLam4foZ/uKaTpxldFKL7vWzB8jZx2Tc1rwqxM2gnAS7UooSEyCPOu866SqakbGmuyabVoAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-39c86945164so7835281fa.1
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 08:42:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786635731; x=1787240531;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8HfO2oqGvHcLZthk9jR7PnHTZYqhjJfeV3Z47WsDvdU=;
        b=kzU/JSf2bGh13TrP1+khyAD2nPLLjulXYYgfqd8hNQ4oxSU2u72YnTqwLnmX+Hhn9I
         k0U2hZeZqyYMnf+1dYeU2WKnWh+YUf6yt8nKEiumW7lFnTwMYGEuJIjX6Vf4fztI7m15
         KBbvG3kJfmKvMZzJ87P1MaCztsToEHthBXAToZ9cLEAp7ln1kTNsTbQMQsZO4Ip4R6gv
         JWUzaigd/9rYV47aMO55jUp9X00jz5p3PZCELHW38NVFz8zWXw0kHfYY5rL4gcUOK59c
         ov6daQqEJspu4sGYmi9PJ9AAg48IoIn+Wuj1Gj8wcGNEKDPcSVBxg0Rsm4rI3VE6vnCq
         W3mA==
X-Forwarded-Encrypted: i=1; AHgh+RppguMKjxk4EhEdU92K1doMpUX6f9t4A81yAYgkuMqqXEgWBViv+OKJMzAiKjBDTg5cl8TGZvn6L6Vb@vger.kernel.org
X-Gm-Message-State: AOJu0YzB7L+tj6Q3cUy875YS6k37OMTBUJXblj8OI0wKDZc1G1n1O2Mh
	ExF359bUU4UvM4uhGcTVRcZDHPEpcjJEgWaJGahsVhDfAyGWxDo/8ePfu7m5T0kRr+g=
X-Gm-Gg: AR+sD12XmEuBXR/LMu+ndRBp/Ww75fHj5VYNkCdVFj/TPsMwJItJoX64qwGN79RFDzG
	W66bLjW0YZzJnfmIQNWKN3BhbKWEtVIUdccIlsWN3DoLV9ECeBKUqhvCqSIy8McmibmzmQ7FF1/
	c84iSvrx8RI85fiTlowmcbfDnnZ19Vtx/pY0xSAjj+M7xmV2SUgEAPZOshBY8qcdtraDutfRlWm
	RMneSdn8so3qQle0GtcoZioJhyMA3aJK1wxbHJ0xFrG+da6Kr1nTrm/4lgbvQKRv7GucFnWWdvS
	+hWIdE7407NYdjRN8Tp2AVqoYaHEkY43bTCtju2HnGQlDg56zLdkpWPBI5CE77bFn8RjXtek4m3
	1VpwluNqK6QROeVFGx89F7rCETAhI/hCkno89L2+u3SpWMFLn4XKOLIK/6sxuaLWoycnu4bRddY
	w5nWh07OnWuuAbAS561V4zmYyc68We74Uw5eZP4NyYptn5VmZWMBSM5Yk+eYtdXyR0Ykof4psa2
	KwVKbWo0ZR8iUTyLsUKrHqVig==
X-Received: by 2002:a05:651c:553:b0:39b:9fc:eb4e with SMTP id 38308e7fff4ca-3a11a700b43mr8782601fa.17.1786635730675;
        Thu, 13 Aug 2026 08:42:10 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com. [209.85.167.53])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a1308a8792sm306531fa.15.2026.08.13.08.42.10
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 08:42:10 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b2aab18795so917671e87.2
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 08:42:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RopztqNLdtY8Wcw2H10xYg37MIA8YKChT1c4m2XzNuyuErWDwrxxYJXNmYgvu4nL+UvhGPbFQsjWvZK@vger.kernel.org
X-Received: by 2002:a05:6402:42d1:b0:6a0:6978:bee0 with SMTP id
 4fb4d7f45d1cf-6a3805dd5f3mr3355685a12.9.1786635382098; Thu, 13 Aug 2026
 08:36:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710113637.1328000-1-claudiu.beznea+renesas@tuxon.dev> <20260710113637.1328000-2-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260710113637.1328000-2-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Aug 2026 17:36:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWLEuC5CFKH4KEUo6H++rp6N=0X7Vd4ffOm2K=hQNPGzg@mail.gmail.com>
X-Gm-Features: AUfX_mzZK_XqQEToCXzSXsA3RQo5nMa-PCSiTS9b3hgORV81WkefGByzaZwI1FY
Message-ID: <CAMuHMdWLEuC5CFKH4KEUo6H++rp6N=0X7Vd4ffOm2K=hQNPGzg@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] pinctrl: renesas: rzg2l: Generalize the power
 source code
To: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
Cc: linusw@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, magnus.damm@gmail.com, claudiu.beznea@tuxon.dev, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"

Hi Claudiu,

On Fri, 10 Jul 2026 at 13:36, Claudiu Beznea
<claudiu.beznea+renesas@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The current functions used to get/set the pin power source check the
> OTHER_POC register, which is specific to the RZ/G3L SoC only. To allow the
> code to be extended for other power source functionalities (e.g. I3C on
> RZ/G3S), generalize the functions used to get/set the pin power source.
>
> For this, introduce the struct rzg2l_register_masks data structure whose
> purpose is to store SoC specific register bit masks. The members of this
> structure are then used in rzg2l_caps_to_pwr_reg() to retrieve the bitmask
> corresponding to a SoC specific power source capability.
>
> The conversion between HW specific power source values and SW specific
> power source values is now handled through rzg2l_pwr_reg_val_to_ps() and
> rzg2l_ps_to_pwr_reg_val().
>
> Finally, to keep the code generic, the register update in
> rzg2l_set_power_source() was changed to a read-modify-write approach to
> cover all cases.
>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c

>  static int rzg2l_caps_to_pwr_reg(const struct rzg2l_register_offsets *regs,
> -                                u32 caps, u8 *mask)
> +                                const struct rzg2l_register_masks *masks,
> +                                u32 caps, u16 *offset, u8 *mask)

Yes, always returning an offset and mask is what I had in mind before.

>  {
> -       if (caps & PIN_CFG_IO_VMC_SD0)
> -               return SD_CH(regs->sd_ch, 0);
> -       if (caps & PIN_CFG_IO_VMC_SD1)
> -               return SD_CH(regs->sd_ch, 1);
> -       if (caps & PIN_CFG_IO_VMC_ETH0)
> -               return ETH_POC(regs->eth_poc, 0);
> -       if (caps & PIN_CFG_IO_VMC_ETH1)
> -               return ETH_POC(regs->eth_poc, 1);
> -       if (caps & PIN_CFG_IO_VMC_QSPI)
> -               return QSPI;
> +       *mask = PVDD_MASK;
> +
> +       if (caps & PIN_CFG_IO_VMC_SD0) {
> +               *offset = SD_CH(regs->sd_ch, 0);
> +               return 0;
> +       }
> +       if (caps & PIN_CFG_IO_VMC_SD1) {
> +               *offset = SD_CH(regs->sd_ch, 1);
> +               return 0;
> +       }
> +       if (caps & PIN_CFG_IO_VMC_ETH0) {
> +               *offset = ETH_POC(regs->eth_poc, 0);
> +               return 0;
> +       }
> +       if (caps & PIN_CFG_IO_VMC_ETH1) {
> +               *offset = ETH_POC(regs->eth_poc, 1);
> +               return 0;
> +       }
> +       if (caps & PIN_CFG_IO_VMC_QSPI) {
> +               *offset = regs->qspi;
> +               return 0;
> +       }
>         if (caps & PIN_CFG_OTHER_POC_MASK) {
> +               *offset = regs->other_poc;
>                 if (caps & PIN_CFG_PVDD1833_OTH_AWO_POC)
> -                       *mask = BIT(0);
> +                       *mask = masks->other_poc_pvdd1833_oth_awo_poc;
>                 else if (caps & PIN_CFG_PVDD1833_OTH_ISO_POC)
> -                       *mask = BIT(1);
> +                       *mask = masks->other_poc_pvdd1833_oth_iso_poc;
>                 else
> -                       *mask = BIT(2);
> +                       *mask = masks->other_poc_wdtovf_n_poc;
> +               return 0;
> +       }
>
> -               return OTHER_POC;
> +       return -EINVAL;
> +}
> +
> +static int rzg2l_pwr_reg_val_to_ps(u8 val, u32 caps)
> +{
> +       switch (val) {
> +       case PVDD_1800:
> +               return 1800;
> +       case PVDD_2500:
> +               return 2500;
> +       case PVDD_3300:
> +               return 3300;
> +       }
> +
> +       return -EINVAL;
> +}

This function returns a valid value, or an error code...

> +
> +static int rzg2l_ps_to_pwr_reg_val(u8 *val, u32 ps, u32 caps)
> +{
> +       switch (ps) {
> +       case 1800:
> +               *val = PVDD_1800;
> +               return 0;
> +       case 2500:
> +               if (!(caps & (PIN_CFG_IO_VMC_ETH0 | PIN_CFG_IO_VMC_ETH1)))
> +                       return -EINVAL;
> +               *val = PVDD_2500;
> +               return 0;
> +       case 3300:
> +               *val = PVDD_3300;
> +               return 0;
>         }
>
>         return -EINVAL;

... while the inverse function stores the value in an output pointer
on succes. Perhaps this should be changed, for consistency?

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
