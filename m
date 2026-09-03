Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3C44DF4CD
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 15:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788449543; cv=none; b=Td5NS/74DyBZXVJu/bb+PeLCaJgaSWrV4uMFbz1Qno7uveKQOogJNIcTOIh+vLUb3yJdWwHrIsJ5ln3UyyqveDJSfKIRWbx7CpvD9H8stuVn51190S1hDLd5Fhv8nMfpx5WHe7BoHvbwMR52MmdHlkzxe8zEIxr4zqOj+85iKK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788449543; c=relaxed/simple;
	bh=O1T/S/tnLkdqmvZL1LvuEUmH7Qo5CdEtlWyLMpBc4J0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XAdvra2q5baDrvUzhdMvHtYPzAzJnmLODvYHIqzF/A19citoKJlYYTdmD6//ShEMwXhit/HwlGyKgiFb2KKcjzZxDfX5YjGYnpr72CwMo4HKe3vs4Q83PmgsoYXAvahuT8hXPprmWnmqp3KQja6b9VYpPW/Lg5DRBJrZEbVQaf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5bfa4c51c2aso1389e0c.0
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 08:32:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788449541; x=1789054341;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=smhgAnbElT93Xc14KAwXUjbx11QNBeL7p1UChIAHiR4=;
        b=fmwycM7td3+QOWfr4xE3f7UHNI2yhPUGFWerWqdVwHAK0QGg/3KSKPcnzKoZ5shg+O
         /DZzJ/HqITATMhLZv42GXMHIzXhjTzSgkjDgLvsJyBhqWF7HlkTmHuGrZWLxcR/5DOZ5
         qjE5guQqy1kPo8s9+eyGElRjmGN+uwnFkBD48bsFIlc86yW7v8UOd/Oq9mn2zsWafjyP
         5A/GRE/6saGr1PM3kJqVlZwkHUIyX1cARPG3urfa0+i0TM8GiXRtrtFVaogPYknNxm3+
         BSAENGSboPfRXyL09MzPDX6PzQWEjIcyIBoiC/RA2JbSo+Uu387FuI0zOLlMc2GTO+Wz
         7L1g==
X-Forwarded-Encrypted: i=1; AKwUvBzlamqReETY1dEQNM9vFs/xMT2zd2pA3Fw1WWAJvbtSUl7H84RkSkvctKauorR8CJwPPmNCIsk6FhD1@vger.kernel.org
X-Gm-Message-State: AFuF++k81pc93zFhN32kqdjd8OFrkKtHr95eXa9CsPKCN2alE7XmpLCz
	ol2TlgJe5osYa0A3rUTOVLnyttJvAZ8O1p8vh4lOMUkYXBtxVxaYOvnfepY5V4FNyq4=
X-Gm-Gg: AYBFou3TXhyjW17Q2GjfIzhD+FCpv9IT4uilObc2iMkZPh75658LucO23R7rPhVIpep
	BM07uCW/SSEzSjDgu3hwcj1hSOCyeeb7LGaC0y7WVnrD2tRj6X/+iuwUoVAGg8/uXaiiOdYbY5y
	P293RSOBAQxV7ofGew+DDUalD/R+9zXK1/Go+gjoVZP6Fl7qwZvsoO0uS7RvNZVhZlrDB5pYiHv
	961q0lYoDkYxO9ODK6qwYYn7h/al8Swlz+aWukrHeuYtMC22R0NOUd/v9d74IDzLlY779WF7tJB
	4nql251zSk5diqk/+4VadPx8eRBZPojn9nnNfgcXyN0awlnTFGXhsZ6JogKzgy0rRs1pnmss4gU
	cKd4HyrwbD3UNfXMq4LO5IpnJCbpi+3FG9J6Renka71qHZmEWBFEV3t9YQFed/ic9p4FOt0TSry
	D2HpbMSfFRM44OoEugV1noTx2O+qhi00rBaMdJaU9x+v7VgJMLGT4MxcSpoJl4NrydFYBkzdqjx
	SbUyjxrqY6xumgEXDmFFxWyaw==
X-Received: by 2002:a05:6122:8d5:b0:5c7:ae9a:a056 with SMTP id 71dfb90a1353d-5c7d28b7ffdmr5547483e0c.8.1788449540967;
        Thu, 03 Sep 2026 08:32:20 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7cd92817asm4695199e0c.17.2026.09.03.08.32.20
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 08:32:20 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-97bf91b2e6eso10832241.2
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 08:32:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzq1iDV/jclPKsXNS/cgV+ICqRmab51gcSD61SRPV+gwENAcQx0lvGZOOU6ueqXAW/mxJWxDqMOC38t@vger.kernel.org
X-Received: by 2002:a05:6102:e0d:b0:789:5f54:2367 with SMTP id
 ada2fe7eead31-78a1f1f13e9mr4112330137.4.1788449534923; Thu, 03 Sep 2026
 08:32:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903113327.1217457-1-claudiu.beznea+renesas@tuxon.dev> <20260903113327.1217457-4-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260903113327.1217457-4-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 3 Sep 2026 17:32:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV9C6LVBqYWo=Njgf3v4a5R1LhBwKuB5H3TFctOCr338g@mail.gmail.com>
X-Gm-Features: AcwNN1WnpoMcG4OiqSwpOhcE41-w5QvCDbZ1B83z-OJyrnfhHqNepFiL_pVw_TE
Message-ID: <CAMuHMdV9C6LVBqYWo=Njgf3v4a5R1LhBwKuB5H3TFctOCr338g@mail.gmail.com>
Subject: Re: [PATCH v6 3/5] pinctrl: renesas: rzg2l: Unify the power source handling
To: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
Cc: linusw@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, magnus.damm@gmail.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, claudiu.beznea@tuxon.dev, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Claudiu,

On Thu, 3 Sept 2026 at 13:34, Claudiu Beznea
<claudiu.beznea+renesas@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The previous code handled power sources using a mixture of power
> source specific definitions and lookups in the available_ps[] array.
> Unify the power source handling by introducing
> struct rzg2l_pinctrl_ps_desc, whose purpose is to describe a power
> source through its power source value, associated register value,
> associated capabilities (e.g. Ethernet), and associated IOLH index.
>
> Introduce two new functions, rzg2l_ps_to_desc() and
> rzg2l_pwr_reg_val_to_desc(), using the
> RZG2L_PINCTRL_PS_DESC_MEMBER_TO_DESC_FUNC() macro, as their
> implementations are similar.
>
> These functions retrieve a power source descriptor based on either a
> power source value or a power source register value. Other functions
> that need to perform power source specific operations can call them to
> retrieve the corresponding power source descriptor.
>
> The register values for the soft power sources were kept to zero since
> they are not used across the driver's code.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v6:
> - described all the available power sources in the available_ps[]
>   array and dropped to wildcard approach to avoid letting the user
>   selecting unavailable power source for pins
> - simplified RZG2L_PINCTRL_PS_DESC_MEMBER_TO_DESC_FUNC()
> - for these two points ^ didn't collect the Wolfram's Tb tag
> - dropped rzg2l_ps_is_supported()
> - used conditional operator in rzg2l_ps_to_iolh_idx()
> - adjusted the patch description

Thanks for the update!

> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c

> +static const struct rzg2l_pinctrl_ps_desc available_ps[] = {
> +       /* Ethernet I/O voltage domains */
> +       RZG2L_PINCTRL_PS_DESC(1800, 1, PIN_CFG_IO_VMC_ETH0 | PIN_CFG_IO_VMC_ETH1,
> +                             RZG2L_IOLH_IDX_1V8),
> +       RZG2L_PINCTRL_PS_DESC(2500, 2, PIN_CFG_IO_VMC_ETH0 | PIN_CFG_IO_VMC_ETH1,
> +                             RZG2L_IOLH_IDX_2V5),
> +       RZG2L_PINCTRL_PS_DESC(3300, 0, PIN_CFG_IO_VMC_ETH0 | PIN_CFG_IO_VMC_ETH1,
> +                             RZG2L_IOLH_IDX_3V3),
> +
> +       /* SD I/O voltage domains */
> +       RZG2L_PINCTRL_PS_DESC(1800, 1, PIN_CFG_IO_VMC_SD0 | PIN_CFG_IO_VMC_SD1 |
> +                             PIN_CFG_IO_VMC_SD2, RZG2L_IOLH_IDX_1V8),
> +       RZG2L_PINCTRL_PS_DESC(2500, 2, PIN_CFG_IO_VMC_SD0 | PIN_CFG_IO_VMC_SD1 |
> +                             PIN_CFG_IO_VMC_SD2, RZG2L_IOLH_IDX_2V5),

Before (see below), only Ethernet could select the 2.5V domain, so
shouldn't this entry be dropped?

> +       RZG2L_PINCTRL_PS_DESC(3300, 0, PIN_CFG_IO_VMC_SD0 | PIN_CFG_IO_VMC_SD1 |
> +                             PIN_CFG_IO_VMC_SD2, RZG2L_IOLH_IDX_3V3),
> +
> +       /* QSPI I/O voltage domains */
> +       RZG2L_PINCTRL_PS_DESC(1800, 1, PIN_CFG_IO_VMC_QSPI, RZG2L_IOLH_IDX_1V8),
> +       RZG2L_PINCTRL_PS_DESC(2500, 2, PIN_CFG_IO_VMC_QSPI, RZG2L_IOLH_IDX_2V5),

Same here?

> +       RZG2L_PINCTRL_PS_DESC(3300, 0, PIN_CFG_IO_VMC_QSPI, RZG2L_IOLH_IDX_3V3),
> +
> +       /* AWO I/O voltage domains */
> +       RZG2L_PINCTRL_PS_DESC(1800, 1, PIN_CFG_PVDD1833_OTH_AWO_POC,
> +                             RZG2L_IOLH_IDX_1V8),
> +       RZG2L_PINCTRL_PS_DESC(3300, 0, PIN_CFG_PVDD1833_OTH_AWO_POC,
> +                             RZG2L_IOLH_IDX_3V3),
> +
> +       /* ISO I/O voltage domains */
> +       RZG2L_PINCTRL_PS_DESC(1800, 1, PIN_CFG_PVDD1833_OTH_ISO_POC,
> +                             RZG2L_IOLH_IDX_1V8),
> +       RZG2L_PINCTRL_PS_DESC(3300, 0, PIN_CFG_PVDD1833_OTH_ISO_POC,
> +                             RZG2L_IOLH_IDX_3V3),
> +
> +       /* WDTOVF I/O voltage domains */
> +       RZG2L_PINCTRL_PS_DESC(1800, 1, PIN_CFG_WDTOVF_N_POC, RZG2L_IOLH_IDX_1V8),
> +       RZG2L_PINCTRL_PS_DESC(3300, 0, PIN_CFG_WDTOVF_N_POC, RZG2L_IOLH_IDX_3V3),
> +
> +       /* Software voltage domains */
> +       RZG2L_PINCTRL_PS_DESC(1800, 0, PIN_CFG_SOFT_PS, RZG2L_IOLH_IDX_1V8),
> +       RZG2L_PINCTRL_PS_DESC(2500, 0, PIN_CFG_SOFT_PS, RZG2L_IOLH_IDX_2V5),
> +       RZG2L_PINCTRL_PS_DESC(3300, 0, PIN_CFG_SOFT_PS, RZG2L_IOLH_IDX_3V3),

I never really understood PIN_CFG_SOFT_PS...

> +};

> -static int rzg2l_ps_to_pwr_reg_val(u32 ps, u32 caps)
> +static int rzg2l_ps_to_pwr_reg_val(u16 ps, u32 caps)
>  {
> -       switch (ps) {
> -       case 1800:
> -               return PVDD_1800;
> -       case 2500:
> -               if (!(caps & (PIN_CFG_IO_VMC_ETH0 | PIN_CFG_IO_VMC_ETH1)))
> -                       return -EINVAL;
> -               return PVDD_2500;
> -       case 3300:
> -               return PVDD_3300;
> -       }
> +       const struct rzg2l_pinctrl_ps_desc *desc;
>
> -       return -EINVAL;
> +       desc = rzg2l_ps_to_desc(ps, caps);
> +       if (!desc)
> +               return -EINVAL;
> +
> +       return desc->pwr_reg_val;
>  }
>
>  static int rzg2l_get_power_source(struct rzg2l_pinctrl *pctrl, u32 pin, u32 caps)

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
