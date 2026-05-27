Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C20540F8F4
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 14:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779892098; cv=none; b=RF6WMCSEWH9V/xxZHcPFIIhUwPakqKkoWjBwFCejkfFaso+39ltUjujbRZzQyBafjm3amWWLxJ+S6g7WHMJTf1L3l6E6+CfKBjTe7eOOXQzRhQ2lO9CxkEqUEyISSfdjgtxp3GeSHZ7ZJ7d2J1UWoB3zgMEoNTj0WH9Z1n1bV80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779892098; c=relaxed/simple;
	bh=+3l+6y9ewRC4AXsaL+0Jmm/WnR4XE92YiTVGpA0ishE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YM/rZx6rDWLbb6Pa8jSywOexmbeBr2bNHdx7Yh4G6KnaNqiai8GMTkOFOLXtCBxpBrAxOO2kFLHKLHcgbIvGXUiwGcvC5Z5QJP3jxvyh3H+SuknXaAUpco03CqcEWvxEWgH66kxKRiTMSpUjCPMse39LfRvMQKB0cX7snepJsMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6870a365c77so14143123a12.0
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 07:28:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779892092; x=1780496892;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c3prSOuZ3fI29cRYCO/JPEKU1fRK4LWYePkpcpuj9ak=;
        b=Gp4Pq47skLv0ZdIJZIakml6z5DjT96xVUtoJYO2fH8uLoR3hUDKHE36OOe8AUvS8HK
         4DRy5Aakiy0t88dOLWakbG6qxPoS3YWcQKFUKWRucEN9+G+oop/9KvDrSv5j5a/mTCji
         JbPVgIuXIOi3HsF2+Cvw8RrUI7YjQxYdP6phJ4Jln9M7GCwAWMMVBkKS0n/hERtp1jUb
         tpE76sq34c0Jor9UDQTj6k1Xdzu1+OPBXrhB7fWJWbVc1cCEGygUBRTmWYu+Un9DvwJQ
         ZsBHoCIzELLsJAqBg/OLmwaRNQiae+Qz3QTwbr4wzNu5OCo8WrwSccG0TEY2R78G6OZi
         0Mww==
X-Forwarded-Encrypted: i=1; AFNElJ/404bxj/fk5oH4lSokbTpZYSr2Ogx/ozZGo/hkzbhlLVs9LdwNtE0jeyUuy8rIIv2T9a1vA4KOAKWf@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv0cIg9AesstXq/gU9VE8CM5FqY7tOm00fry75DLEsVlOQzvo6
	vNgmIU77VP7r2Ag5Q1meGWXup0XQuOYLn+4MW5rUSq3Qj8KbGJZzw1pAcW4iDkODRME=
X-Gm-Gg: Acq92OH011aIXpoCxu38MHn2J+J+eg7w+48U22OEXmC0vb4AmGoRvw2H6V2PHi4R+x6
	LccKdeMOcHGcsljjsOwcj7mrlio6m/8YoWD4d9fjnHgZzukLTra5w/3Xk1Di29lTn8rRyuxrxoc
	MTv/stJ/mrb5Qv5qCk41I9IHT2zzIlfH8PuZhf4ZXIyIWihvURNukoniYUhj3Xoel8bdNsxTHZ+
	yGOulshVeYDCmJnDYPhUeQLR2ZLNIP9gzD7TSJG5xZwuXP+M3/vlVlD5bt7fZHUdS1/iBhfW5jz
	YIFSNkzqsa7nqn69YMmONKVn5r5Ji2jPEKl91HlWq7VUmHJcdv5LDL/MVOfgMaTvG/6b6fuFR5k
	/0uxWoAYmO0zqvptMh9lhIGbrqmnUJOp0gBVn/jeOgwgbx8WZXiwclP3vX3fT8txbzySedgtcGo
	g2UDtgrueSKmm/jmXC8ulJBz42Dsg53b4gEywFjr9SBIrQwQReUaKcP73QeBYf
X-Received: by 2002:a17:907:9d17:b0:be3:9977:e1c7 with SMTP id a640c23a62f3a-be39977e94bmr417779666b.19.1779892092349;
        Wed, 27 May 2026 07:28:12 -0700 (PDT)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com. [209.85.218.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc5eced0asm625421266b.39.2026.05.27.07.28.12
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 07:28:12 -0700 (PDT)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-bdbac72ac1fso1233535666b.3
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 07:28:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/7IlS0hvs9oYBcLDXoaU7A03XjHdfHsWFRk9FSxTt5ucY9Xv/ifmIHZ7XZ3Pp1l1WCqt256GXjVt1a@vger.kernel.org
X-Received: by 2002:a17:906:9c9:b0:bcb:d9c7:c6f with SMTP id
 a640c23a62f3a-bdd22a454a7mr999392966b.7.1779891783475; Wed, 27 May 2026
 07:23:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260525110603.4018170-1-john.madieu.xa@bp.renesas.com> <20260525110603.4018170-5-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260525110603.4018170-5-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 May 2026 16:22:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXj8o+K5M+t_D-G_CGRGYgc1jBz0z21ye6UhAzWs0iJ8g@mail.gmail.com>
X-Gm-Features: AVHnY4KJG1smVEhyqmGQ6O4ZxxblTfhIdfIGaVVy0daiVThaQXAOe2q8bvr14ho
Message-ID: <CAMuHMdXj8o+K5M+t_D-G_CGRGYgc1jBz0z21ye6UhAzWs0iJ8g@mail.gmail.com>
Subject: Re: [PATCH v4 4/8] arm64: dts: renesas: r9a09g047: Add RZ/G3E Sound support
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	bmasney@redhat.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, john.madieu@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi John,

On Mon, 25 May 2026 at 13:07, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> Add the snd_rzg3e node for the RZ/G3E SoC with all sub-components:
>
> - SSI (Serial Sound Interface) units 0-9
> - SSIU (Serial Sound Interface Unit) units 0-27
> - SRC (Sample Rate Converter) units 0-9
> - CTU (Channel Transfer Unit) units 0-7
> - DVC (Digital Volume Control) units 0-1
> - MIX (Mixer) units 0-1
>
> Sub-node names follow the new RZ/G3E sound binding: unprefixed
> 'ssi', 'ssiu', 'src', 'dvc', 'mix', 'ctu' wrapper nodes instead of
> the legacy 'rcar_sound,xxx' R-Car prefix.
>
> Wire up all 5 DMA controllers (dmac0-dmac4) for each audio sub-node
> with repeated channel names, so that the DMA core can pick the first
> available controller.
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
>
> Changes:
>
> v4:
>  - Rename the indexed clock-names and reset-names from the dotted
>    form (ssi.N, src.N, adg.ssi.N, clk_a, clk_b, clk_c, clk_i) to the
>    hyphenated form (ssi-N, src-N, adg-ssi-N, audio-clka, audio-clkb,
>    audio-clkc, audio-clki), matching the new RZ/G3E sound binding.
>  - Rename the sub-nodes from the legacy rcar_sound,{ctu,dvc,mix,src,
>    ssi,ssiu} prefix to the unprefixed ctu/dvc/mix/src/ssi/ssiu names
>    used by the new RZ/G3E sound binding.
>  - Reorder the clocks and resets phandle lists into ascending index
>    order and annotate each entry with a per-line comment naming the
>    clock / reset.
>  - Drop the #sound-dai-cells and #clock-cells explanatory comment
>    blocks from the node.
>  - Align the continuation lines of the dmas property.
>  - Fix the commit message: the node label is snd_rzg3e (v3 referred
>    to it as rzg3e_sound), and add a paragraph noting the unprefixed
>    sub-node names.

Thanks for the update!

> --- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> @@ -912,6 +912,482 @@ rsci9: serial@12803000 {
>                         status = "disabled";
>                 };
>
> +               snd_rzg3e: sound@13c00000 {
> +                       compatible = "renesas,r9a09g047-sound";
> +                       reg = <0 0x13c00000 0 0x10000>, /* SCU */
> +                             <0 0x13c20000 0 0x10000>, /* ADG */
> +                             <0 0x13c30000 0 0x1000>,  /* SSIU */
> +                             <0 0x13c31000 0 0x1F000>, /* SSI */
> +                             <0 0x13c50000 0 0x10000>; /* Audio DMAC peri peri */
> +                       reg-names = "scu", "adg", "ssiu", "ssi", "audmapp";
> +                       clocks = <&cpg CPG_MOD 245>,    /* ssi-all */
> +                                <&cpg CPG_MOD 385>,    /* ssi-0 */
> +                                <&cpg CPG_MOD 386>,    /* ssi-1 */
> +                                <&cpg CPG_MOD 387>,    /* ssi-2 */
> +                                <&cpg CPG_MOD 388>,    /* ssi-3 */
> +                                <&cpg CPG_MOD 389>,    /* ssi-4 */
> +                                <&cpg CPG_MOD 390>,    /* ssi-5 */
> +                                <&cpg CPG_MOD 391>,    /* ssi-6 */
> +                                <&cpg CPG_MOD 392>,    /* ssi-7 */
> +                                <&cpg CPG_MOD 393>,    /* ssi-8 */
> +                                <&cpg CPG_MOD 394>,    /* ssi-9 */
> +                                <&cpg CPG_MOD 372>,    /* src-0 */
> +                                <&cpg CPG_MOD 373>,    /* src-1 */
> +                                <&cpg CPG_MOD 374>,    /* src-2 */
> +                                <&cpg CPG_MOD 375>,    /* src-3 */
> +                                <&cpg CPG_MOD 376>,    /* src-4 */
> +                                <&cpg CPG_MOD 377>,    /* src-5 */
> +                                <&cpg CPG_MOD 378>,    /* src-6 */
> +                                <&cpg CPG_MOD 379>,    /* src-7 */
> +                                <&cpg CPG_MOD 380>,    /* src-8 */
> +                                <&cpg CPG_MOD 381>,    /* src-9 */
> +                                <&cpg CPG_MOD 370>,    /* mix-0 */
> +                                <&cpg CPG_MOD 371>,    /* mix-1 */
> +                                <&cpg CPG_MOD 370>,    /* ctu-0 */
> +                                <&cpg CPG_MOD 371>,    /* ctu-1 */
> +                                <&cpg CPG_MOD 368>,    /* dvc-0 */
> +                                <&cpg CPG_MOD 369>,    /* dvc-1 */
> +                                <&cpg CPG_MOD 251>,    /* audio-clka */
> +                                <&cpg CPG_MOD 252>,    /* audio-clkb */
> +                                <&cpg CPG_MOD 253>,    /* audio-clkc */
> +                                <&cpg CPG_MOD 250>,    /* audio-clki */
> +                                <&cpg CPG_MOD 384>,    /* ssif_supply */
> +                                <&cpg CPG_MOD 246>,    /* scu */
> +                                <&cpg CPG_MOD 247>,    /* scu_x2 */
> +                                <&cpg CPG_MOD 382>,    /* scu_supply */
> +                                <&cpg CPG_MOD 352>,    /* adg-ssi-0 */
> +                                <&cpg CPG_MOD 353>,    /* adg-ssi-1 */
> +                                <&cpg CPG_MOD 354>,    /* adg-ssi-2 */
> +                                <&cpg CPG_MOD 355>,    /* adg-ssi-3 */
> +                                <&cpg CPG_MOD 356>,    /* adg-ssi-4 */
> +                                <&cpg CPG_MOD 357>,    /* adg-ssi-5 */
> +                                <&cpg CPG_MOD 358>,    /* adg-ssi-6 */
> +                                <&cpg CPG_MOD 359>,    /* adg-ssi-7 */
> +                                <&cpg CPG_MOD 360>,    /* adg-ssi-8 */
> +                                <&cpg CPG_MOD 361>,    /* adg-ssi-9 */
> +                                <&cpg CPG_MOD 248>,    /* audmapp */
> +                                <&cpg CPG_MOD 249>;    /* adg */

Please drop these comments...

> +                       clock-names = "ssi-all",
> +                                     "ssi-0", "ssi-1", "ssi-2",
> +                                     "ssi-3", "ssi-4", "ssi-5",
> +                                     "ssi-6", "ssi-7", "ssi-8", "ssi-9",
> +                                     "src-0", "src-1", "src-2",
> +                                     "src-3", "src-4", "src-5",
> +                                     "src-6", "src-7", "src-8", "src-9",
> +                                     "mix-0", "mix-1",
> +                                     "ctu-0", "ctu-1",
> +                                     "dvc-0", "dvc-1",
> +                                     "audio-clka", "audio-clkb",
> +                                     "audio-clkc", "audio-clki",
> +                                     "ssif_supply",
> +                                     "scu", "scu_x2", "scu_supply",
> +                                     "adg-ssi-0", "adg-ssi-1",
> +                                     "adg-ssi-2", "adg-ssi-3",
> +                                     "adg-ssi-4", "adg-ssi-5",
> +                                     "adg-ssi-6", "adg-ssi-7",
> +                                     "adg-ssi-8", "adg-ssi-9",
> +                                     "audmapp", "adg";

... as clock-names already serves this purpose.


> +                       power-domains = <&cpg>;
> +                       resets = <&cpg 225>,    /* ssi-all */
> +                                <&cpg 226>, <&cpg 227>, <&cpg 228>,
> +                                <&cpg 229>, <&cpg 230>, <&cpg 231>,
> +                                <&cpg 232>, <&cpg 233>, <&cpg 234>,
> +                                <&cpg 235>,
> +                                <&cpg 236>,    /* scu */
> +                                <&cpg 238>,    /* adg */
> +                                <&cpg 237>;    /* audmapp */
> +                       reset-names = "ssi-all",
> +                                     "ssi-0", "ssi-1", "ssi-2",
> +                                     "ssi-3", "ssi-4", "ssi-5",
> +                                     "ssi-6", "ssi-7", "ssi-8", "ssi-9",
> +                                     "scu", "adg", "audmapp";

Same for resets and reset-names.

> +                       status = "disabled";

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
