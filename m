Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10B62F5A12
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 15:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782834075; cv=none; b=tCl6JLa3DzMtb4N1KADKwgW7+J3lobwSPlIKaflgPqYjV4gwsEagl15p6OgjtGUBbE9xVjNc+SGzPdL4QHIZ5ppn/BefMjEhtTCptmFuNrcdqxq/JOteD3kC36K7xHt242+jq2erXIzqs9wrvYucPA3RrNu68ruXobaPjaJtqfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782834075; c=relaxed/simple;
	bh=HECdCdoiVcKsHL9ieEZjduz0kz0EHHXfKnn7LggCP2M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PUj0SEcL9wzQeCA6k3boHkTwKRQ4MFZosiTC0Uo6lAwbAKp80l3pNlpBSNQf4tZAi98NiSOxyFa/ZLMjHcKqTfuvJiq7+LSv7LfUVlMhn5ZX3ZwJKHr/zUkbQNZlxvZz4dDef6WYLS97m9f/v2qkcd6f8dSE+PKpPkVDFyr78fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5bbd26a2729so4340157e0c.0
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 08:41:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782834074; x=1783438874;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8FudzaGflml93J0qLROb0/HyeenVr7sqBJ6ASEnUvtg=;
        b=IV9g6gbTnb3YzYovPij7TubEeAwKuWZ/UNI3YH3UghwC2w4/lMx1UlskpwdaHw37rk
         FsEPW60powZOCO+eQKto5cR1PNr+8+4fIWOdoVt+IAZGyaaIJFUyWnT9CbzWtiBdo1jf
         USk/ly1l86dGgEMilWW83ZnwgOpc8xKfqQB0A4IQUMiofx4lIi1WIinCCyqwR6Sbu2CC
         GJojH5x1k6/WyMTcTtS26ahbgZd8UrNTQ0Jnepn/G/Ajc3cy3lenjjeNRSxiJpPHzKPh
         6US5cDuPMnkkZsNDEG3vNxiD2tMSHywQnJGSm5aZsnKFol43ISLHCoOpjtiX3sRtyruZ
         oVDA==
X-Forwarded-Encrypted: i=1; AHgh+RrUpErI+AhC8Czq9nUo1scDXtYCllQ7gF0jqZE1OXcxNUEHgcZK45giHftHN4xX7yfYa/8jiBZU/IZn@vger.kernel.org
X-Gm-Message-State: AOJu0YyD56/7JotSRjmRVmbIVfyHtDfDHJFOarTQUERMP2tUf9antJe3
	GB3TXnNTjpG2gR7YFBeB5HfdnaE2AuDoRJv721PfN00Fvg1KelS4AD9k5pdmtqQwkCw=
X-Gm-Gg: AfdE7cn/TEcuTugdBKdlgxxshDgbj3TnR9SVhrAeUc6bkgok8C8t8II0ZbxeX81Waaa
	igpmVV05zhhx/NK8YNkWgT66uPu7+QzLdj59qZo/skz2JL4NnramDS0nF+rnmAAYcWwv57TmtrZ
	XYpH2ZONangqgHkYn61MNciKvO7BjgR7oUzd/kJHFhzImri5BrXZL58O891mBt54/rxF3/sJrJn
	lBXHZUd6rWmPuT/GcMH5U+hWwfKH7Gj0wslpRnW51fGEFhTakZS0poJvHvclJWU2chf1A3voAN8
	aV/6IOIn0+JZM6a11SaAf2ewlsYjBdCzZhQguJpYIwujylcZlsdW8O/+LP5atjo5clczo2N4/2/
	gcXGrSfRG7mRLdJWhgeSy7yyGtAiIl7jYI9jZDGiReU58fGKyiUm6trke6v4cftaViB2MC84XoB
	xjfMapUBdBA21ccVFcLxnAz1Q+rSK9XqDeiHxeAa1rV5NVsCIsvEKoAsTTMQPA
X-Received: by 2002:a05:6122:4582:b0:5bd:bcb1:453b with SMTP id 71dfb90a1353d-5bdbed729bamr1879681e0c.10.1782834073750;
        Tue, 30 Jun 2026 08:41:13 -0700 (PDT)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96966904ec6sm1060904241.13.2026.06.30.08.41.12
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 08:41:12 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-7383cdb7800so2012257137.1
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 08:41:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rr8M0fz194+AntqINMlpBtWZ2PvWlFSAKdq9J+JA/SDddkJrwDPSDrwNYH8ySY5KC8PWNRp6PBDUnD6@vger.kernel.org
X-Received: by 2002:a05:6102:598c:b0:737:5c42:858b with SMTP id
 ada2fe7eead31-73a36aee835mr2136553137.11.1782834071816; Tue, 30 Jun 2026
 08:41:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260626180326.9593-1-wsa+renesas@sang-engineering.com> <20260626180326.9593-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260626180326.9593-3-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 30 Jun 2026 17:41:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUi74DDa_xoJ8Lo=eV54w4q9Jhu-1N02vUkNGCKgEywow@mail.gmail.com>
X-Gm-Features: AVVi8CcUvJP0aecjrianzUPa4AqYvcUMhpUwuDQPV--pueaST2jff09tZFzGmBc
Message-ID: <CAMuHMdUi74DDa_xoJ8Lo=eV54w4q9Jhu-1N02vUkNGCKgEywow@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] spi: dt-bindings: snps,dw-apb-ssi: add
 'power-domains' property
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Herve Codina <herve.codina@bootlin.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-spi@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Sat, 27 Jun 2026 at 11:20, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> This SPI controller likely belongs to a power domain for all the SoCs
> listed. For sure, it belongs to one on the Renesas RZ/N1 SoC, so
> enable the property to be able to describe its power domain in DTs.
>
> Suggested-by: Herve Codina <herve.codina@bootlin.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Herve Codina <herve.codina@bootlin.com>
> ---
>
> Change since v3:
> * reworded commit message to make clear other SoCs likely use a
>   power-domain, too (Krzysztof)
> * change Reported-by to Suggested-by (Krzysztof)
> * add Rev-by (Herve)

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
> +++ b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
> @@ -87,6 +87,9 @@ properties:
>        - const: ssi_clk
>        - const: pclk
>
> +  power-domains:
> +    maxItems: 1
> +
>    resets:
>      maxItems: 1
>

RZ/N1 definitely needs a power-domains property, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
I don't know about the others, they don't seem to have it in their DTS.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
