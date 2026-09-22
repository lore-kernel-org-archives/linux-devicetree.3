Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996DD35C6AC
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 14:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790088030; cv=none; b=uwl7d9Y3HdsMxoBHq+oz9/InG5nE+HluGXNET1Q+NijIwMP5REJxOqDPetYXNSkTe6EsWYfLmgy1p64w1g7y30BCGU/aczMwSXzyUgV97d80/gf0XfahKj4mWX14yUyEd/ZSMufEtv6R2pN5eQKjn1QJ9gygGBwO3mx7LHwLV2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790088030; c=relaxed/simple;
	bh=zHlsfWC8sX3pz0/XSFoxgX7FqDI7whEHdUXnwOXIQoM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZmK3lDm7tzUDtcRBgVtik5/ynnlyW8lj21fk0dP0xwqj3KZJkM2Atn74jhsQPEaw9YO3mWRyWIUHdjVVMoKlQG4nEdwOgcFyZnj87W00lxNJmHHAXuN8anhf1FWZA/9c7cu2sIchTDo98igitj2jKLPGPHkj9Xz7wehxUObVdLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-85d43ac8d1fso438077b3.0
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 07:40:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790088027; x=1790692827;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ifr1hHZZAJWVubWKqPeVb9esvq1iy0mCWPvBSTHrG+w=;
        b=yCP2UOY7pnFE5cHbWmMDbgyFHJmVZsh9ncjyUaAsUJTXmfsF4uKata2AOO04jVCA9x
         l+3D+IARww+03gtwXPrvysXxi2j87NLeIBOAJbcW6GOk1fkIbwR/x5Cvffbp29gOyiVe
         ZNiAeN898kix5eJd202yuTOYIQMuM0keoNBguk3/MXLFmGIEkgwp9Q+OhV2wInMqx4Eo
         L0HhjyKC1ChTnBT9GvoCIV5uluVkXQe6MQNHsKYRhVWozl8ekpLBTrUpkz1iWEmoxiFl
         UtcVDAp9wSaAsyx3ELmHl/NtXK3Unb+g7E1ngsyw8PQGLpcuwVDlDHfMdTDw2FkJ2MLV
         Silw==
X-Forwarded-Encrypted: i=1; AKwUvBxvfbgFxffhc5MY5GQqwYN0U+Y4gzx5uIOQ5DsYs1Gunrr6nm4azOQCmJgiUfbNCiddISP1jZiYN2LU@vger.kernel.org
X-Gm-Message-State: AFuF++mCQgSFUzjTLhQ7VEwiylZJA6A9Rmc4F5XAZSt3la4H4d+RHlBE
	gIi/dvx24oEVwCPYwyuY7z419VOivG3FbJsod+LU/eDniqvQqIJfmAMZ2PvodROj
X-Gm-Gg: AYBFou3ZYjpefMdfUsjcfGRRC/jcXnPIVp19oVZbOryM6DfcU8l4msP7T/+niSsroOA
	QYFPKZDDVZdRxkzm2vN2lfv6PMn+4HpHvdM5eOWuY11ZyKN5IDhVtbxxnIlZWlvBjI31L/ipRcj
	IPuAExEqqURPhoAjq/n/yT02YW1kqlA0z6gm6TBjERYk4DCaYGsBIqZCIZw2JEPKSR45C8dDJCk
	LE/xPdBrouETRltJxx7EnUqtwBbUXWj9ycGwFZg5MmfWG+ciBB1AP/Dz8Xynz+RrjH4fyeh0JhD
	RRosq17LS4Vem1vmS/aTSjXzIu8xQ/kUBgFdlsZlvj6uQjPFoYIG6QfNBTtUUebWMzJYh5+dLsq
	RppEelt7nGKTaM5Jujnt31YoBFbhSrBvzzq0PEYHP1d285xvEBEhekn6Xt+FKCSHH+qHscPR8Lf
	LXhuR17X3wQmtlS4sLYDEhuDAkyYS7nzapscndD0Z+CdsWNI1Gv0MUk/kULcVacgWmlhAlnvvjN
	KSfd3JjFmG1yLaDg8rfrPcNdAsrUeqT9VIgiA==
X-Received: by 2002:a05:690c:9988:b0:873:5c0f:279 with SMTP id 00721157ae682-8a25788ef05mr11286957b3.35.1790088027444;
        Tue, 22 Sep 2026 07:40:27 -0700 (PDT)
Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com. [74.125.224.141])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a2c1b02567sm7313007b3.11.2026.09.22.07.40.27
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 07:40:27 -0700 (PDT)
Received: by mail-yx2-f13.google.com with SMTP id 00721157ae682-85d43ac8d1dso7147b3.3
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 07:40:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx4gzCRvFIfDl5fAOFDilGuTt/rNA/d4cC3zg96NTV6mgbddi6Dkn9pLNPm8j/eJsoQ+oCTVId+9eLA@vger.kernel.org
X-Received: by 2002:a05:6122:390a:b0:5c9:a617:580e with SMTP id
 71dfb90a1353d-5c9b8b29cf6mr8586451e0c.11.1790087642750; Tue, 22 Sep 2026
 07:34:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922042707.116378-1-biju.das.jz@bp.renesas.com> <20260922042707.116378-7-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260922042707.116378-7-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 22 Sep 2026 16:33:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVbyktVBAwBh=LoARWHHmb_FrF+omeDvNdR76uxus3mPA@mail.gmail.com>
X-Gm-Features: AclHuK8QDsFUbN6MlA77zfZcOMVCYGTCDIMnum6Wgku5P-WW7MUQq9pjTBb7a98
Message-ID: <CAMuHMdVbyktVBAwBh=LoARWHHmb_FrF+omeDvNdR76uxus3mPA@mail.gmail.com>
Subject: Re: [PATCH v3 6/8] iio: adc: rzg2l_adc: Rename num_channels to max_channels
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	linux-iio@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

Thanks for your patch!

On Tue, 22 Sept 2026 at 06:28, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Rename the num_channels member of struct rzg2l_adc_hw_params to
> max_channels, as it represents the maximum channel supported by

... maximum number of channels...

"the maximum channel" (aka singular "max_channel") would be equal to
the maximum number of channels minus one.

> the ADC hardware rather than a count of channels currently in use.
>
> No functional change intended.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

> --- a/drivers/iio/adc/rzg2l_adc.c
> +++ b/drivers/iio/adc/rzg2l_adc.c
> @@ -62,7 +62,7 @@
>   * @adsmp_mask: ADC sampling period mask (see ADM3 register)
>   * @adint_inten_mask: conversion end interrupt mask (see ADINT register)
>   * @default_adcmp: default ADC cmp (see ADM3 register)
> - * @num_channels: number of supported channels
> + * @max_channels: the maximum channel for the ADC

"maximum number of channels", to avoid confusion.

>   * @adivc: specifies if ADVIC register is available
>   */
>  struct rzg2l_adc_hw_params {

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
