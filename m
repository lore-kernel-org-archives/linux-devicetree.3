Received: from mail-vs2-f0.google.com (mail-vs2-f0.google.com [74.125.227.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63060402B98
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 10:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.0
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783678500; cv=none; b=ZKMu2Zygl7BbUtldQ/NWNL8UiNVOU9PlKzgib3sWF8ifPIbOVaPumXyZZfUtuSGDvO7Cz0K+CUQK7d2K/ttdyHYQ0bB8O9W7RdRKTUOpAXzBE3hLG490SbpWiU33KW4cqzsec6qbwCfngJ0WvrbfUg3Y1L5CE9b2vK0VQ4QPgUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783678500; c=relaxed/simple;
	bh=jStoTu7RQA8BRTqGbaAV34VwUP2BPEMz29vPuO1fGCc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QOWImEEI4ux9jjGy1KJL7RhwmEy7ZCqVn5HI3fUOJq7GetbC9Lr4oPvSaVwxi8O5dpexf0310QUBpC21dsjej5wGhwTV/ktUeGw98HPXY4yEZnRtz4BCzMVwYKM0PrKxwzxwjpOSQ8k12ZpqESLK090HuUl7yYXdON/6Wdg2XyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f0.google.com with SMTP id ada2fe7eead31-71f13d1d7b7so164396137.0
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 03:14:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783678498; x=1784283298;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GbEWAG6xIcV+3P2phIYnj4SrZfkvn8WstI+WFIFJ95k=;
        b=DkkZN4xTMYzOkFMsGEumQuLc2cN6lS1K83kG2onw4snwwLtCwEQ+gdAF4HeVSlSp44
         n3nT6W3cAbfQJWx7BOVuPpXdWWvsSnXXCCEcDEQ43NrsTmSy8KHOJN24bfcm/zJKVCUD
         hx1NgA+KNtl9PZNzuqdIO3+wDNqggdROX6qCkUEgJbgy/4gMhk/EWmPd1FWYMtlGx4BW
         cAHDEd9E1rxhyxCSf3+WaPlWVY7gD8mWRnn6rAAswGT+oxsNO7OdpGbe0WyTQn2aehRO
         ziZmLvI/NXRdZewMbOafqwmgqYCkYYIOC8XSthk4fr2R2KpgW+pPUUlIXC0+7RfwglMU
         rBJg==
X-Forwarded-Encrypted: i=1; AHgh+RqRxDIhE9P+KVD/iXTBZ8JphNaJ4vRRtYH4cC+sfN0M/7iNbiBvFxr74aMrZG+5mOJBEZn2aloF33t0@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1l/LVHfMnDMAt49y6gYGO1HEdYie9XpZTjLF+sN9ORH6F03hW
	dtBN0k3MvBWrSGqeKPSpeSxmwhL+Yj4zkg3hhiwQ2tnBkzN/E6QAaUlGIi4E3pe7bncd1A==
X-Gm-Gg: AfdE7cmx2BaP1gFefht//cCoo/7/KY0KQwyr0BmF3EeAcDMLFoIpCN197MjfX5Y0zdB
	YemcneePw2d2UsYQs6DYKYjz/YIVh5Z00ndOE2XPRO/YYb58PfW1vrtncxL/D6rc5tzUEz/kj7g
	AAl3K6vOHucGY/7UG/Up/KDq3S7f91z1Re6Uo7GT5F+QNsI7tcxuFATVp9xvJMr0+BuKN5AhAXG
	Q0cdaqhwPiMLHJK3u8px/9HcQsCjiEu1n5IHEdK9Nc0BuCx2yBFg62Yd8BIvGwqMTXkAXYls4P3
	GsCqFIcxsywVNUv2DWxfpvK6EsoRRCJXQLXU/irYZ39cOdOM/x5YHTLZUz3mqMW4BhFuOMx4MEt
	P9y2cCP8IXXhWDcHgk0X5x7SuQAEbVfqyOUosTZHCTshc6xDUsLopcxvGuH/9Ebtq1VnDv+bp7i
	F83HOW455UEnXnVXfxrQexktnf5KmUIJ7e+YW4CyllV8KTGoYnDg==
X-Received: by 2002:a05:6102:50a8:b0:73e:e4ab:1c84 with SMTP id ada2fe7eead31-7450d0b7eecmr1621831137.5.1783678498423;
        Fri, 10 Jul 2026 03:14:58 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-744d6a3eb8esm4836452137.3.2026.07.10.03.14.56
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 03:14:57 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-736eec08c43so661510137.1
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 03:14:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq/x67acntApXHz29LSnxuw3DsbXxI1LOS6Q/uChYkvN5DbQN7eIk3OgkHaeEBrYLDNMUcEjbnS4oyq@vger.kernel.org
X-Received: by 2002:a05:6102:40cb:20b0:744:f2bf:44d2 with SMTP id
 ada2fe7eead31-7450c6bee09mr1278940137.3.1783678496645; Fri, 10 Jul 2026
 03:14:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709182332.876408-1-claudiu.beznea+renesas@tuxon.dev> <20260709182332.876408-3-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260709182332.876408-3-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Jul 2026 12:14:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWeCpR70fQ52NYsB_p+Feth0gewdfjSBCbpLWfUCCDvQw@mail.gmail.com>
X-Gm-Features: AUfX_mxSD2HzC_Ku4zRdh3S4Ewoz9pnRW_48syvAhXfLnIrebj7osOYA05aUezc
Message-ID: <CAMuHMdWeCpR70fQ52NYsB_p+Feth0gewdfjSBCbpLWfUCCDvQw@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] dt-bindings: can: renesas,rcar-canfd: Document
 RZ/G3S SoC
To: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
Cc: mkl@pengutronix.de, mailhol@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	mturquette@baylibre.com, sboyd@kernel.org, bmasney@redhat.com, 
	biju.das.jz@bp.renesas.com, claudiu.beznea.uj@bp.renesas.com, 
	fabrizio.castro.jz@renesas.com, claudiu.beznea@tuxon.dev, 
	linux-can@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Claudiu,

On Thu, 9 Jul 2026 at 20:23, Claudiu Beznea
<claudiu.beznea+renesas@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The CAN FD controller found on the Renesas RZ/G3S SoC is largely compatible
> with the variant present on the RZ/G3E SoC. The main differences are:
> - the RZ/G3S provides only two CAN FD channels
> - the RZ/G3S supports only CAN FD operation; the Channel n CAN FD
>   Configuration Register does not implement the bits used to select
>   classical CAN-only mode (bit 30) or CAN FD-only mode (bit 28);
>   consequently, bit 31 (CAN FD Frame Distinction Enable) of the same
>   register is also not implemented
> - some bits in several registers (mainly reserved or status bits) are
>   read-write on the RZ/G3S but read-only on the RZ/G3E; their behavior is
>   otherwise identical: the bits read back as 0 on both SoCs and software
>   is allowed to write only 0 to them on the RZ/G3S
> - the RZ/G3S provides 128 acceptance filters, compared to 64 on the
>   RZ/G3E
> - the RZ/G3S can use PCLK clock as the CAN FD clock source through an
>   internal clock divider, while also supporting an external CAN FD clock
>   source
>
> Since:
> - the SoC clock generator provides to the CAN IP only the peripheral and
>   the RAM clocks
> - when sourced from the peripheral clock, the CAN-FD clock is obtained
>   inside the IP itself by dividing the peripheral clock
> - the assigned-clocks and assigned-clock-rates properties are specific to
>   the CAN-FD clock
> the assigned-clocks and assigned-clock-rates properties were dropped from
> the required properties list of the Renesas RZ/G3S SoC.
>
> Add documentation for the Renesas RZ/G3S SoC.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v2:
> - forbid renesas,no-can-fd and renesas,fd-only since the IP supports
>   only CAN-FD; for this didn't collect Biju's tag

Thanks for the update!

> --- a/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml
> +++ b/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml
> @@ -267,6 +267,7 @@ allOf:
>            contains:
>              enum:
>                - renesas,r9a09g077-canfd
> +              - renesas,r9a08g045-canfd

Please preserve sort order (alphabetical).

>                - renesas,rcar-gen3-canfd
>                - renesas,rzg2l-canfd
>      then:

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
