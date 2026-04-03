Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF36126ED45
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 07:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775201828; cv=none; b=DTQ/9o+q71fbqMa1YVQiij2pkU/gPu7hXcn+jyOOD7L8nkyusHtqsnNwvdlEeii+9sXS+flfrD5+W0WiRmsxHRfF9s3IHtjAUVGxN1hpcxy5G9Bf/icguZGYiSveNR7Waqa2WwOGi17TQoQGrktzBuhYW203Cc8EQ6Z/L+e0+Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775201828; c=relaxed/simple;
	bh=RQFIDvkQ6UcLgwztbD8oBHl4tS+ZCKb3aINkg7VeBsY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bQEGkpJPvP2xbGKOYSR7mweR+y94sdNZbCH7eL/ahQCFTjq3HrS7ZzdNHDk9NaBN3LvCnC2Qr4pTH7Iu3DlOxo7HsgjysT3qXZt+XdzzXXd4sENA+Tf7Et11CmNqa4pS7MNJULCLBmTKVO1Ce2U0C8HOcLVm+NprLreFlpm7xnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-56b6c7c8d00so1280309e0c.3
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 00:37:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775201826; x=1775806626;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d4N0YKA/XUUd7O8Nr0votH0EtcIVeq9XRBqx9j9NkIk=;
        b=nU2DFT24pM0rQmNc/HJoGocI4ZHne1Ngfn/VSPgW0y0jLv4jLDIag6AmAyf0Bpcvnq
         nbrkFZhBENqUWGjvSrhmTL2tMOXs9logsj6jVVeEyRvr/ppp5nmjKHXkzVGa0S5w8GLT
         bRgpqNfYpYi4jfGX/tj/JW/cDpFRuIPq2j2rUUzDBVA1MSA/CtB2trAzvnvgKuGXwwp/
         277jzB4tzATHHVsPqeSBq0QIiGwyCUKqROYeI36GwGEyjd093hZt9+XcGIhjtSgIcqh6
         ytgPvLVvvkP3UJRBVfLErXG20FeeOiDLFje6M8/ZwtE82VyKveU1J06H0YXHyfdxF5rt
         4IRA==
X-Forwarded-Encrypted: i=1; AJvYcCUiGRI76KAfgE/8eglb4r5HpvNR1M1AOGvUk+3Z8Lf5468v0iZTbpP2phBn8DNpcwLyiQ9PCMoSW+YC@vger.kernel.org
X-Gm-Message-State: AOJu0YwDYIZGraYNB+2Icj6cFlAIXQljRn1lwBwn9IWSPmd5gGGhlfZa
	f/e7kvuzD8vuqFdA8IjZWGs12wpAjBhvmDNc1scOtEB4gBpLHMMQxJgFzYMM8ZaJ
X-Gm-Gg: AeBDieuQ/0BmwiPAgFm4SxZfxTzXHL0YDytk9mA0+DHiokOuLzIMjQApF3Tu4JhNVXq
	76sdl95xeIyn2AIaojVXgYhhTcJiNzSiZ0WsN671K1WroJJ/4snbNqysMcfduUlx04g0gcpbCv1
	B/ZZoWALB+LI5AoWTMjyv3kVLxnJRdFEPnRvmr588ZrCHY2cKpXiJJgnscFeDiQFCiC8cSfWny7
	UjdAfG9lv9u9DRI7Hl0T23z7OFGaj0/PlUde4W5D51SpUUuHLpPxvkSw+JYDN/WGDJAXaILMvs1
	IEhFCNXmfTOJ96poYPbzLRm9uw8Xl+xcOo4upKOTVmrU8fPYf/DpQhqFfJ/fBRy8reiSE6SeUzw
	qhXNoCBnXMULlIbrKWHz1VTPi4HksqIgiaIIarUqbltxLNq+wIVLMRdFBg0DQIxNo0QYhzmD+Br
	G5xbv+0rW8xSnvD9mDut23xI4tXoSFjqARPd01nCX06DCZyqmcgz1fmuTiTEwJ
X-Received: by 2002:a05:6122:1687:b0:56c:d582:42d3 with SMTP id 71dfb90a1353d-56dab9f0300mr732749e0c.14.1775201825540;
        Fri, 03 Apr 2026 00:37:05 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d9bc9bc41sm6006176e0c.11.2026.04.03.00.37.03
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 00:37:04 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-953943f7a33so788398241.0
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 00:37:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWVK9npMrWV/tRjW2HpbY6AQku1WO1YBw8jilqOIQXkpcikaAp/RFUztDyogxufE7DdmC2LL3VK/1fo@vger.kernel.org
X-Received: by 2002:a05:6102:f0d:b0:605:315f:49f7 with SMTP id
 ada2fe7eead31-605a4d81988mr717338137.6.1775201823680; Fri, 03 Apr 2026
 00:37:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260402162436.12059-1-john.madieu.xa@bp.renesas.com> <20260402162436.12059-10-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260402162436.12059-10-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Apr 2026 09:36:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUHzcq_f8t0hi-FjiG2FByNmx8k2sz9-QEqzroLSWqXNg@mail.gmail.com>
X-Gm-Features: AQROBzCXZAB5loNy5rsTC4EAiI9aKFN2pLERVORaR-uHChRoGZT6taMr9lCmLJs
Message-ID: <CAMuHMdUHzcq_f8t0hi-FjiG2FByNmx8k2sz9-QEqzroLSWqXNg@mail.gmail.com>
Subject: Re: [PATCh v3 09/14] ASoC: rsnd: Add ADG reset support for RZ/G3E
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Biju Das <biju.das.jz@bp.renesas.com>, john.madieu@gmail.com, 
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi John,

On Thu, 2 Apr 2026 at 18:53, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> RZ/G3E requires the ADG reset line to be deasserted for the audio
> subsystem to operate. The ADG module clock is already managed via
> rsnd_adg_clk_enable/disable() through adg->adg, so no additional
> clock handling is needed.
>
> Add support for the optional "adg" reset control on Renesas RZ/G3E SoC.
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

Thanks for your patch!

> --- a/sound/soc/renesas/rcar/adg.c
> +++ b/sound/soc/renesas/rcar/adg.c
> @@ -771,6 +771,7 @@ void rsnd_adg_clk_dbg_info(struct rsnd_priv *priv, struct seq_file *m)
>
>  int rsnd_adg_probe(struct rsnd_priv *priv)
>  {
> +       struct reset_control *rstc;
>         struct rsnd_adg *adg;
>         struct device *dev = rsnd_priv_to_dev(priv);
>         int ret;
> @@ -779,8 +780,13 @@ int rsnd_adg_probe(struct rsnd_priv *priv)
>         if (!adg)
>                 return -ENOMEM;
>
> +       rstc = devm_reset_control_get_optional_exclusive(dev, "adg");
> +       if (IS_ERR(rstc))
> +               return dev_err_probe(dev, PTR_ERR(rstc),
> +                                    "failed to get adg reset\n");

Given this file already uses lines longer than 80 characters, the
above statement would fit on a single line.

> +
>         ret = rsnd_mod_init(priv, &adg->mod, &adg_ops,
> -                     NULL, NULL, 0, 0);
> +                     NULL, rstc, 0, 0);

This one fits for sure.

>         if (ret)
>                 return ret;
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
