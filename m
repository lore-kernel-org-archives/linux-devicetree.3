Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D793A48382C
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 15:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786635800; cv=none; b=E26OrnYWRf1RlA7ak3dbID4aTsO0zPg+2Z2DaWHjcPB3hDEBUQXXb8Ag/ycyXV810KZyXc2YbK4DcmEydNQR/HKM80JlYEzBUI6/3UiYZHq1XshfhqVhyHsn8T7dIBkLK62rqpdgWssjCWv2ErBA2ikU5cynphnKoLtL9GwJt8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786635800; c=relaxed/simple;
	bh=GY640qtsu1SDkXg/qpZjw5AVg1oBJIZPusqb/qNK3PM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tDwYdSeKVG04YbPYXSpBR2BNVqGKg5d6bvPsFCJ3eMB52i/6BG+LX9tlNI9tcI+UwEfsHPFdTp4K3dSaibHcy3vqP44ofJLGdfdFztRGh2HDgDJcgy2jzZ7SO12Mnll2wgOfqOcrgAH2C6c2bOsa2REAXFSJxAgGeYduN141Z6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c169ae1cb26so202892766b.1
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 08:43:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786635797; x=1787240597;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aPYhCdtqz3bibVAFDWmRXBuIoXULoG3VemeqJBNfpCA=;
        b=h1Kkplv0LnOAEDLkjS0z0g4zUvqEqORX6W2HBjq9TodBEt+12UtyqqfUJN5W4kLENF
         DPTbxXg0rvW5dN+vtj4nAHJ1TFoEsihoy7VboGHnxgNe06qVYjZvT9Iw8M9jLIrACuiZ
         UtNDGgLVqBUmQmVWVlnlCRC/k5s626ugHB/P5qMCczX/ISsETJF4PqQpxLkO0dJoUbb0
         QL53WVLYbDVIWqmOB9lQI+xKIyo/yy7NnJZ+OdKFmP5YszIG9poP0yjPol+2lC6EVXIv
         in8dzLJ+g1YLUmHkkuj16r7DVG3KshFhjYU2qrE+mCd5/wgjvtZUwUdX/GefumIAiLLJ
         1sMA==
X-Forwarded-Encrypted: i=1; AHgh+RoXFet1fsGXCRI8iqIx7Mzs5xlNzwzRkpXVdkRw6/5gW/YW/RHBYo7XRxWReKv4UDZrA5UFAkkHUx6X@vger.kernel.org
X-Gm-Message-State: AOJu0YxvOpZjQB7IUgqKK0MtPhLLBZInTxMfgil+G3XriZI3QFIJbFqq
	hHBIOnDaIsnKtxdyoRtcmocUV1atNs5GrId2iNSkodeRW+ejpvWTEWqJ0PWApLMC6+Y=
X-Gm-Gg: AR+sD10Tm09PeDgSBB1uj38mwpE6p+D3jKpPbTOpUPfzyGqenLDGRhm/wE41RmdKWRq
	MyIVj+ZUO2OlWm3vhJMS76MWDOh8bC37YNKBooBgpJfsfSJVuY6sKGGGj2kjXmTEL0CuZDwZQm0
	kLUi1O7+gJijEbwIbAFiAH6xwkGGxTKusO57IEY3HU9rY93/O2n0ccBC2Y0o7+zU1QPUBIXZxdY
	qa0e//f/pjKCyTWIktUoCNDa3TU3+zRf8xThr3glV7YNNLtYtEXw/V5hHFXAn1qVWo7iTsrzQW7
	78BaSWBC7uS55ESNkAFygxXWrAjjAiKqM6C+oN/xpOyeEVhwYxDDZidK53Ue/NbYDjwLvcgSuJJ
	nZUP2WZykNd+woOqjyRmdowqrmN0C55FsTG6nyz6Vy8qKREFLlfaq/7u82ZTdAMslMJT7tFzl1/
	uQpY/U0LMJ0kkEaYfA9Wck3JlQqLAYhvWHBUJSVHI2R0UUSv5zslk0Yw1yywGjTrHtM5qsKDqFJ
	kK01wox+BB3O4d7hqoYfEFGPA==
X-Received: by 2002:a17:906:f58f:b0:c20:f9d5:8d71 with SMTP id a640c23a62f3a-c2109f45faamr294962966b.5.1786635797079;
        Thu, 13 Aug 2026 08:43:17 -0700 (PDT)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com. [209.85.218.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c21234c69b0sm8127966b.18.2026.08.13.08.43.16
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 08:43:16 -0700 (PDT)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c20ce3c118aso217656466b.0
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 08:43:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpueDeWaVpmgPOTfDQzzDuUFH67qVLfl08DS3YcVT1NN1KLHFEQte1x5UGrU6JIbbAv8NGvfm9O5orJ@vger.kernel.org
X-Received: by 2002:a17:907:608c:b0:c20:7166:cc16 with SMTP id
 a640c23a62f3a-c210a26f8cdmr362136666b.15.1786635796639; Thu, 13 Aug 2026
 08:43:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710113637.1328000-1-claudiu.beznea+renesas@tuxon.dev> <20260710113637.1328000-5-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260710113637.1328000-5-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Aug 2026 17:43:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWfzr0FTq5796ymJbrJMTYcHko0SPoE_hPYJxNi-pLG1Q@mail.gmail.com>
X-Gm-Features: AUfX_myjkFFweUQc-pTKMuHXcf3jvSHPslpABu71PbitoSzzI_g3EH2qpqjRiDo
Message-ID: <CAMuHMdWfzr0FTq5796ymJbrJMTYcHko0SPoE_hPYJxNi-pLG1Q@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] pinctrl: renesas: rzg2l: Add RZ/G3S support for
 selecting the I3C power source
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
> The Renesas RZ/G3S I3C pins can be powered at either 1.8V or 1.2V. The
> pin controller provides a register to select between these two options.
> Update the Renesas RZ/G2L pin controller driver to allow selecting the
> I3C power source on RZ/G3S SoC.
>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -69,6 +69,7 @@
>  #define PIN_CFG_PVDD1833_OTH_AWO_POC   BIT(19) /* known on RZ/G3L only */
>  #define PIN_CFG_PVDD1833_OTH_ISO_POC   BIT(20) /* known on RZ/G3L only */
>  #define PIN_CFG_WDTOVF_N_POC           BIT(21) /* known on RZ/G3L only */
> +#define PIN_CFG_IO_VMC_I3C             BIT(22)
>
>  #define RZG2L_SINGLE_PIN               BIT_ULL(63)     /* Dedicated pin */
>  #define RZG2L_VARIABLE_CFG             BIT_ULL(62)     /* Variable cfg for port pins */
> @@ -186,6 +187,9 @@
>  #define PVDD_3300              0       /* I/O domain voltage >= 3.3V */
>  #define PVDD_MASK              0x3
>
> +#define PVDD_I3C_1200          1       /* I3C I/O domain voltage 1.2V */
> +#define PVDD_I3C_1800          0       /* I3C I/O domain voltage 1.8V */

This repeats the existing pattern of having both #defines...

> +
>  #define PWPR_B0WI              BIT(7)  /* Bit Write Disable */
>  #define PWPR_PFCWE             BIT(6)  /* PFC Register Write Enable */
>  #define PWPR_REGWE_A           BIT(6)  /* PFC and PMC Register Write Enable on RZ/V2H(P) */

> @@ -441,6 +455,7 @@ struct rzg2l_pinctrl {
>  };
>
>  static const u16 available_ps[] = { 1800, 2500, 3300 };
> +static const u16 available_i3c_ps[] = { 1200, 1800 };

... and arrays for the possible values.

>
>  static u64 rzg2l_pinctrl_get_variable_pin_cfg(struct rzg2l_pinctrl *pctrl,
>                                               u64 pincfg,

>
>  static int rzg2l_pwr_reg_val_to_ps(u8 val, u32 caps)
>  {
> +       if (caps & PIN_CFG_IO_VMC_I3C) {
> +               switch (val) {
> +               case PVDD_I3C_1200:
> +                       return 1200;
> +               case PVDD_I3C_1800:
> +                       return 1800;
> +               }

Look-up uses the defines...

> +
> +               return -EINVAL;
> +       }
> +
>         switch (val) {
>         case PVDD_1800:
>                 return 1800;
> @@ -1121,6 +1152,19 @@ static int rzg2l_pwr_reg_val_to_ps(u8 val, u32 caps)
>
>  static int rzg2l_ps_to_pwr_reg_val(u8 *val, u32 ps, u32 caps)
>  {
> +       if (caps & PIN_CFG_IO_VMC_I3C) {
> +               switch (ps) {
> +               case 1200:
> +                       *val = PVDD_I3C_1200;
> +                       return 0;
> +               case 1800:
> +                       *val = PVDD_I3C_1800;
> +                       return 0;
> +               }

... just like reverse look-up...

> +
> +               return -EINVAL;
> +       }
> +
>         switch (ps) {
>         case 1800:
>                 *val = PVDD_1800;
> @@ -1194,12 +1238,21 @@ static int rzg2l_set_power_source(struct rzg2l_pinctrl *pctrl, u32 pin, u32 caps
>         return 0;
>  }
>
> -static bool rzg2l_ps_is_supported(u16 ps)
> +static bool rzg2l_ps_is_supported(u16 ps, u32 caps)
>  {
> -       unsigned int i;
> +       unsigned int i, len;
> +       const u16 *array;
>
> -       for (i = 0; i < ARRAY_SIZE(available_ps); i++) {
> -               if (available_ps[i] == ps)
> +       if (caps & PIN_CFG_IO_VMC_I3C) {
> +               array = available_i3c_ps;
> +               len = ARRAY_SIZE(available_i3c_ps);
> +       } else {
> +               array = available_ps;
> +               len = ARRAY_SIZE(available_ps);
> +       }
> +
> +       for (i = 0; i < len; i++) {
> +               if (array[i] == ps)
>                         return true;
>         }

... while validity checks use the arrays.

I guess one could drop the defines, and always use the arrays?

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
