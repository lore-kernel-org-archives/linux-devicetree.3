Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794495446;
	b=OBNDRB5rGQKuFkzBs8ULrJQEbgH+UZwHbs5gUYSMzwMPlFmLlEgGbn1vbgNGCM/mX7bv
	 g676CGlv6wKyc3Xx4xEV3qBzMkn6Q9bDAWRcqq/uxbMuMm1On79jB+J//GM7NsRyxDrGK
	 pgCiyDmzdKmDE02zhKhCdD69cGEq5FVgzICVsgHQtZuCq8VQp6YadHRG0UCBFfXuSB502
	 JIowz/ncoO6doDhS+J4/e9L7JPvG+d2w6ZWys41gdE4DmuKqh9G4VBSzgiromH60/mJdQ
	 DjO1Z16sWtjbQs6S5xVEjgV//jl+JtduVLpgEuOrLq1VMELEuPPOiPVrOR/UCOsaXwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794495446;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=mS1ut25pAkhX06KpI5+b6SzLMFwF8RaPMcofkkPb8+I=;
	b=WIX/nU1+CoF/pwW+QV3+pdEk2EeHlys/qzuq5+6/t96zrcLeYAilpZGgsvZTRxKayOGY
	 b6A7V2bC3Z7ogWSXr5TOjb/jCJRU2d2ExS7D6tiLwy75Xr8yTo8dkN3x9EhYmOS2peB1w
	 OX9S5tBn6owfaqGnw/HyrrunR16CKRRzdVvtlztJfXtItbupyHvGKHapOioTWIyxAhTNL
	 nflTsXaANwkY8775p6a1qFdKoQ1qiCN4SkfZW0x6H2OGKrhDVowgRZ2mChTEZQDiZ9JYn
	 pZdAWsgjrA3FLhr4bXfva/Do28wImyaly+yp72RdhEYMSnNc/Bs6LQVkabuE0NHTLcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.52
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB17606A323
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 14:57:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EB17606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-9950a7530d9so2268347241.2
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 06:57:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794495445; x=1795100245;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mS1ut25pAkhX06KpI5+b6SzLMFwF8RaPMcofkkPb8+I=;
        b=02NNxj9gCrl3JLjseOAfMe40wKzc7FmTUN80yyG+11zlF/6bqC3CmNb3oOrgh9O9sv
         u4vZ3ajGRwJOn5+OTTPOQouC/YfAu9myJ7z1c7C0sHm0SGpULviffiXhe9gS8gn1/prs
         v7cXBPuhTCaJh5hZqypP6Jei88cp9AtK72X7iAAgexB55y85BE8In0tbobx8/jI7PgBZ
         bSnXjvb+q5vWQhli07vdlM9NhwFZsqQoZiqoH0ziX5jiAIZ7JBa+GqWd10gx38Y7iE9h
         PfB5IgHzQ32z45ZDccmko3rjL4yqrDH5PBOU5s7fbACrR+YbYyxHxLtITvSOfp5w3Y65
         BoEw==
X-Forwarded-Encrypted: i=1; AL+hErGmJ6K77+2o3etJ1mmtxUc5qwdD7XKZ56p5Lqgf16L58RSed/ub/lq+MbrT+vjoBj54+0OL1iJMOr/p@vger.kernel.org
X-Gm-Message-State: APuU4Z8jd/KyZulxV8t8wOwRGAziML+eJ3XreuDHkLJKO4p57hd/hPHY
	beFB8Fez6USTIuU//ItbFAZE0YPs4heya3fV5ril4e4LYldRatq5NWFW3Sx5KHJEaPs=
X-Gm-Gg: AYBFou0YPj1YKhJhBqlyR46Riry6ItPUUwyRCFBKkWlgcE2AN+MvdiRjEQ0eaFh3VQ7
	kFa1Y3tU4QUvlvICdWo58mOBkhQ/Y1Us8F6vYhgIc7wII3hLKpn1pFqVO67jmtiiSeuJYvCxfu1
	cAm3cNSTCvf5xV/pTjXiYPYQrJ1hN0xMLaUBV2Y398Cja7HX48rhypzzp8cU17Ox2xSZx38LJvS
	Ot6YbZJngQ5nIrGxAvO2Xbd2ANURbUpHkPJjZLv6MQz0sIbNGffxKKtrvXBPBkrCN9tBP/DqAup
	fXa+oT+Bl+QfOZE+qyfVxAUEd/RT5y4ZSnF9knRxtqSKO36P3QUiN01YZ1L18EkKzrGyJm7pxCa
	b5+Ft4CEeMKVVmr0bHxWhZdPf6dJ0u3PCAZ4gqE10HQjFr/mC4NCr9X0Xl72r6a5inFyuIv1SOD
	F4ly4J/maJfk7SXT5hDePCaRzRAf+spahprVtxDi2PDtjbBZgXOL+NOAzB6jt4NiyiM9+FZEUjL
	VjVmI4nvBFAYlQLUmjP5qtvZeXcwPXT8jt/BOks6CNigxHaTTZEmc50p3owKo5pFMpTVG0Qgvjh
	36qdzMHsbeYe8zfmqFSgBlsB7lFuErK8VAIer2IMrQ1g82omwrKtJTTc3xt71GBPTB9JdgIczKt
	oq1semIT+RSD1
X-Received: by 2002:a05:6102:5798:b0:7cc:1274:aba3 with SMTP id ada2fe7eead31-7d50610a96bmr2479321137.22.1794495445534;
        Thu, 12 Nov 2026 06:57:25 -0800 (PST)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99c200004e7sm5966171241.3.2026.11.12.06.57.24
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 06:57:25 -0800 (PST)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-7d2bf046d7fso2477243137.3
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 06:57:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErF3PWEn1b0vtURctfNaEqeiMnuZhFeQcBjrD1IZ1CGUSuASYHYTbNwesZjd7aZjzUhOi51gXptle05N@vger.kernel.org
X-Received: by 2002:a05:6102:f10:b0:7c3:9982:67d7 with SMTP id
 ada2fe7eead31-7d50609c9damr2546296137.16.1794495444511; Thu, 12 Nov 2026
 06:57:24 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-0-1b2072e8c37e@ideasonboard.com>
 <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-5-1b2072e8c37e@ideasonboard.com>
In-Reply-To: <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-5-1b2072e8c37e@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Nov 2026 15:57:11 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUUvhf=zEmd2tfodo7zf1hh9n8m88Okk7KZpq0n=mDR2A@mail.gmail.com>
X-Gm-Features: AclHuK_otbzgK2u3WYfd1DmRW9SD98NHgBcVxYwHNEPtms-IkWdgisCPqESp0Ec
Message-ID: <CAMuHMdUUvhf=zEmd2tfodo7zf1hh9n8m88Okk7KZpq0n=mDR2A@mail.gmail.com>
Subject: Re: [PATCH v4 05/13] arm64: renesas: r8a78000: Add FCPVD and VSPD nodes
To: Paul Elder <paul.elder+renesas@ideasonboard.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Ulf Hansson <ulfh@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-media@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"

Hi Paul,

On Mon, 9 Nov 2026 at 14:35, Paul Elder
<paul.elder+renesas@ideasonboard.com> wrote:
> Add DT nodes for the FCPVD and VSPD IP cores in the R-Car X5H SoC.
>
> Use the SGD1 clock as it is likely to be the clock used for data flow.
>
> Signed-off-by: Paul Elder <paul.elder+renesas@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r8a78000.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a78000.dtsi
> @@ -1574,6 +1574,196 @@ mdlc_aon: system-controller@c1338000 {
>                         bootph-all;
>                 };
>
> +               fcpvd0: fcp@c5010000 {

Please preserve sort order:
  1. Sort by unit address,
  2. Keep similar nodes together.

[...]

> +               fcpvd9: fcp@c5019000 {

> +               vspd0: vsp@c4800000 {

Do you want to sort the VSPs within the VSP group by unit address,
or by label?

By unit address:

    "vspd0: vsp@c4800000"
    "vspb0: vsp@c50c0000"

Note that adding the vspd* in a later patch than the vspb*
means the latter need to be moved in front of the fcp* :-(

By label:

    "vspb0: vsp@c50c0000"
    "vspd0: vsp@c4800000"

> +               vspd1: vsp@c4808000 {

> +               vspd2: vsp@c4810000 {

> +               vspd3: vsp@c4818000 {

> +               vspd4: vsp@c4820000 {

> +               vspdb0: vsp@c4828000 {

> +               vspdb1: vsp@c4830000 {

> +               vspdb2: vsp@c4838000 {

> +               vspdb3: vsp@c4840000 {

> +               vspdb4: vsp@c4848000 {

>                 fcpvi0: fcp@c5030000 {

Shouldn't we keep al FCP nodes together?
Same for the VSP nodes.

>                         compatible = "renesas,fcpv";
>                         reg = <0 0xc5030000 0 0x1000>;

For the contents of the nodes (except for the renesas,fcp properties,
as I couldn't find the VSP<->FCP links in the documentation):
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
