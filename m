Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44EF63EAC9B
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 09:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778665815; cv=none; b=raQjBo3b0Se5KDpdbP36wetajbLHW7S7+1H0l9vLxjsrVre1HFx4t5u07QL33BeVR2Z0tkP/qjrPH5RMMBkRq9bgClgibkI8pUCqTLuvAc6yGCA3WMbm3AjcxPPQG5QtiKaTKFMx3p5zPBTKYtX3yI76Cz9onqk7dCsFZKf4DWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778665815; c=relaxed/simple;
	bh=uVYsoxVIXinsrUNO2qPk1Z0E1qtPCaft8XkhDwMRN48=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xk9BlepQ/ZDaLlJno2EPTNZLI1KSldky2lg0z8cqNKEYg8dVI9rFtqPW5pv7XYjxG0TVpdxhj3QELFk/9ExFgXoNU40c5fkRaBiaix4QGmlRHSDDTDlTF9//3+PZ1IwMmovd+fS4GOtR6UBA1VIZnPyzY+TgObjvNX2mMBqoftA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-56a86f0a23bso6088513e0c.0
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 02:50:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778665809; x=1779270609;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=imrv8gGof0CUbxurFPeQ8Hwv6N5BbSJLpDwNoIBJTok=;
        b=Xna+TaF4h1BlQmJLsEuYZLkq7gO+u8DmVzcCHJ+uX9hAAIR56XNI7c477Y9ATUNKgx
         Vc7s++bW964hwvR0rSExJVpu+PHVDplmZ9HSyPMVy/42BS3k5uhQXuwKzadSBi5BjqQo
         MPYz3+ZLG/EyW3cFSMQvjbJe9tFia63q/prZOKUSTyRpPR8Yjlt+8wVRXbCwIRr3ZlHu
         GX2YqKD/uzWJMAmMtUSdbcfhVxLaInz4de/IWTSjpvwyKABauuMg+7PT1nB4sNaldsKL
         8cwdIoI/HxrROkIHupvXq1njEtJgEqeQl63pSBguKzF2cWNCLVKBZBeCcaophR33ogZO
         Vp1w==
X-Forwarded-Encrypted: i=1; AFNElJ+M6TH8X0AktBORpvZk7UsYzAK3wMbieLdmQvzRMvpe+mnkWCDtTqePGAIdrLV9Jafi7gxbPvjYovTo@vger.kernel.org
X-Gm-Message-State: AOJu0YwZu6s2ds3UnAqkA+lmwZ3+QHzjkRhJXOyO4H/aDbAZ393bhMVn
	HUBjAJ+DTBftsktLnYDBAORqCEANthv2gUo1A9fFe9ddJ98p45VEdNkOifje9Sy7
X-Gm-Gg: Acq92OEMNlAyjEHVnbZJ+MNIMPVSx9U8YfO+YmNvHKsAYpNGGSFpaCe7Gm0EMtoNgw0
	5RlSrWOVwUMCfmuRn4/cBLCG2K+6Wy35cJpLi+7T5ar6S3wQ28Vg0S1t1kx4oiyO4mZ9dwzTNeE
	UkeCMIb4u0WKRqndCkXnUzTK3T1gApLE0cP+kni7KX02VsZrLBNlIWrZ2UYiHIMfb7+yms6uKXJ
	ienIACKemkjvYgb8s2ecAD13XRVQc7u/zyYuBXbzucJxk1KT9P26qEjyRINWg+GzK8dB6LgUbhB
	1yUeT9QLZebOT/NrngzStp32xBodg1Tf93O92mnRsDEssKcVj5ae6DCCRWxFoVUioavMsMqBlXj
	LWRsOGcYjgpGK0347q+TM6XO6UQKgqZpejmJoJlqP3/4/MO61cJdNSyKR1mpuLrh7qrZU/8Qrh9
	hGMXWuBv47PSBuAm69LleILH+we4H1ZuhaM8E/m+YVevr98fwLD30Rom0WMXy5mvRI
X-Received: by 2002:a05:6122:3a16:b0:575:3b1b:eef4 with SMTP id 71dfb90a1353d-575e704b70cmr939313e0c.10.1778665809480;
        Wed, 13 May 2026 02:50:09 -0700 (PDT)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-574a6ef4012sm24107825e0c.18.2026.05.13.02.50.09
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 02:50:09 -0700 (PDT)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-57516e08474so4083053e0c.3
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 02:50:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+bVHW2INV5E7eNEZhAZhHL5hYJX5s1JpwB/fUEDGhEly/MzNyfu+KM5hRKcVEGFTWWbcGUxSwDda+Z@vger.kernel.org
X-Received: by 2002:a05:6122:4d04:b0:56f:a329:6859 with SMTP id
 71dfb90a1353d-575e6f9a7d3mr1048517e0c.7.1778665323607; Wed, 13 May 2026
 02:42:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260512182631.3842065-1-john.madieu.xa@bp.renesas.com> <20260512182631.3842065-10-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260512182631.3842065-10-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 13 May 2026 11:41:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWx84+=UMB_zPgRgqAWWO4qmTkOkUEQLzhJ8UD4zLFx7Q@mail.gmail.com>
X-Gm-Features: AVHnY4Kr-XCAHViwq5wXvuNDFdIDqB9sk9joGebrZRK91CK4SGoxuuFnaauWCrs
Message-ID: <CAMuHMdWx84+=UMB_zPgRgqAWWO4qmTkOkUEQLzhJ8UD4zLFx7Q@mail.gmail.com>
Subject: Re: [PATCH v6 09/16] ASoC: rsnd: ssui: Add RZ/G3E SSIU BUSIF support
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Biju Das <biju.das.jz@bp.renesas.com>, john.madieu@gmail.com, 
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi John,

On Tue, 12 May 2026 at 20:28, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> Add support for the SSIU found on the Renesas RZ/G3E SoC, which
> provides a different BUSIF layout compared to earlier generations:
>
>  - SSI0-SSI4: 4 BUSIF instances each (BUSIF0-3)
>  - SSI5-SSI8: 1 BUSIF instance each (BUSIF0 only)
>  - SSI9: 4 BUSIF instances (BUSIF0-3)
>  - Total: 28 BUSIFs
>
> RZ/G3E also differs from Gen2/Gen3 implementations in that only two
> pairs of BUSIF error-status registers are available instead of four,
> and the SSI always operates in BUSIF mode with no PIO fallback.
>
> Rather than scattering SoC-specific checks across functional code,
> introduce an extra capability flags in the match data:
>
>  - RSND_SSIU_BUSIF_STATUS_COUNT_2: only two BUSIF error-status
>    register pairs are present. Used in rsnd_ssiu_busif_err_irq_ctrl()
>    and rsnd_ssiu_busif_err_status_clear() to limit register iteration.
>
> Future SoCs sharing these constraints can set the flags without
> requiring code changes.
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

Thanks for your patch!

> --- a/sound/soc/renesas/rcar/core.c
> +++ b/sound/soc/renesas/rcar/core.c
> @@ -107,7 +107,8 @@ static const struct of_device_id rsnd_of_match[] = {
>         { .compatible = "renesas,rcar_sound-gen4", .data = (void *)RSND_GEN4 },
>         /* Special Handling */
>         { .compatible = "renesas,rcar_sound-r8a77990", .data = (void *)(RSND_GEN3 | RSND_SOC_E) },
> -       { .compatible = "renesas,r9a09g047-sound", .data = (void *)(RSND_RZ3 | RSND_RZG3E) },
> +       { .compatible = "renesas,r9a09g047-sound", .data = (void *)(RSND_RZ3 | RSND_RZG3E |
> +                                                               RSND_SSIU_BUSIF_STATUS_COUNT_2) },

Nit: please split the line after the comma instead of after the pipe character.

>         {},
>  };
>  MODULE_DEVICE_TABLE(of, rsnd_of_match);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
