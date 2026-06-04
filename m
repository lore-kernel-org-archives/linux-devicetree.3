Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD62344D001
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 12:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780575942; cv=none; b=EkphRCTicV5l1sPs7UdpDLyHAjlTpmIY7+tUGvfR0VADvG50k+KRuMAluqOYbbxjFbMLs6kVK7I7OLDlPVA3jWNvW6nZF6k0IJRczY23dFDtsAT1CftK/PrQsR2MSc4rzxmtZ1TSOiufCDmYL30JFw3FMnwHY4DnvCd/3pboq8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780575942; c=relaxed/simple;
	bh=ZVR9x8tWd6AFCeFuB4BHv4sPK8zCkEI3GNQIoDCb/Xo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C9aGwNZSvs+G1Hr106AKVKClk4nqu4CjgenGPYvC6BXENFjaI7nBNpdkYyBdRKdQSoT2V4x86UBzwRoyfu3Pr4iI+extJ4DXlJDeiTGxgtXr0S5C45CEriyivx3NyaxrSX9EgC+6sAXL3z1s7nfgWo70ek4l0oGr3ilfBVfDjMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-963a722ed58so439177241.0
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 05:25:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780575940; x=1781180740;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iyWpTw37mylw5bzav8uUBiWBa2W/YfP061QKPLyDS7o=;
        b=tACDmSA+DoCH4UiTzz3eS2J5lv74cIsNfzm/xKdcjw7b1xZFrfm74t/cjPDv124/9L
         zj7aqDYoKxq3dpg+I/wqZ/l9qnPpFpkjGlkgWAXdkR+qGn39XLapY7A7ONqVU2/DAyDr
         xg3YXFmtBFk8ARpS29czmrw42HJ5bFIhSxbhNzfEwbs7A4V9M3OexogKcp0N4y+9wFaa
         F/No8mF08hITA4ADC4BsfizKsFGbKfWEUjNgvB6hlrj2lSeqpQl/UyD70z9NnTo+jI8i
         Lw/Ds7jfE4q3CoaUyM9xOG1/OTgF3U81DgclmAe58YTKK+Q/UFrgZ7/oqW7jG7D8bEiK
         4WQQ==
X-Forwarded-Encrypted: i=1; AFNElJ++AygJHkpaVX7j0ABRQgRvSSuFGTjkGNBWPJ02d4aH6S7sh+HhIli5wdbdW4WDo0q6exBcnMyy49Ft@vger.kernel.org
X-Gm-Message-State: AOJu0YxJzp+LuQ4Yv6HIe7KgWOl38/MSrxdxBFPA/DixWxndMJn04U3P
	pAl+viUV/VrRDXGUVDnFQM7SKBoqK/DZKgcLP5/au4Q1AzqAeM3q7W/1MDpVnDg8eCc=
X-Gm-Gg: Acq92OHObEEWGRS434qcyz0muGyBSkOjNm505edBaDENepL/4pAdRPrF9IxDBFvq0+c
	DjXDd6+94msMfJUs7VFSBJQfrIF8Xfu5Tq6fadCsIboe7dB6uZEPjFn4kXsjWlhvZsrfLPAKfMz
	dYrwg1jEkD6sfMPn1nynuIoPkKbeanOm+MUN1oRF30mf6yhDekO6cXVnucO6GGjSv3XrCKSSjVW
	IyH+8USOmBdfdOFFbYmVxRf4DkLHftB0N7/5XFhaSJezvouFyCH5PNC/epwn4J58s6fRHindaBB
	5SCH8F99e0stEUGp74lBBMk7lBaI2Z6jJiB4Dw6Y+7FgsjdaTEUzw25sKe1cAmO0RwAcbmcMcqX
	2RWMpCrQFCPEQ2jEKWuau7ELd31RM/6vL2v55H2Xank5S3u07gUW7/EbIPHMv5LQv0RlH6+nMka
	TPc1jYRv92N6kGLTpucWFDQgwy03eHiu+Bvid46yrHDrAZdlaQbWhlloTaKWZVkCkCG12fSOs3S
	ac=
X-Received: by 2002:a05:6102:41ab:b0:632:73ad:6c8 with SMTP id ada2fe7eead31-6ec2cf575f6mr4870179137.7.1780575939688;
        Thu, 04 Jun 2026 05:25:39 -0700 (PDT)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-6eb55494b46sm4758702137.1.2026.06.04.05.25.37
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 05:25:37 -0700 (PDT)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-59bbe027424so503567e0c.3
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 05:25:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8t9eUOIk8S2lPoByJMHGAnhD/aUkK8zXTTQwsL34YbtFP0xuxgBBT8kQnb9OwpKkADiGpFcGUW+Y77@vger.kernel.org
X-Received: by 2002:a05:6122:e14e:b0:5a0:3d17:f939 with SMTP id
 71dfb90a1353d-5a6e7e57815mr4955258e0c.9.1780575936747; Thu, 04 Jun 2026
 05:25:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260525110603.4018170-1-john.madieu.xa@bp.renesas.com> <20260525110603.4018170-5-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260525110603.4018170-5-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 4 Jun 2026 14:25:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX5ivj=WdCH=kQUwaAwqiS-pDaTgq3tyf_CF5SRT+qzQA@mail.gmail.com>
X-Gm-Features: AVVi8Cf4Ujm0MLmye5A9UxakzZtSS845oRUcwVlQZvUP1y9AtjAcdgWbu9vD6MY
Message-ID: <CAMuHMdX5ivj=WdCH=kQUwaAwqiS-pDaTgq3tyf_CF5SRT+qzQA@mail.gmail.com>
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

size 0x20000. to include the SCU DMAC?

> +                             <0 0x13c20000 0 0x10000>, /* ADG */
> +                             <0 0x13c30000 0 0x1000>,  /* SSIU */
> +                             <0 0x13c31000 0 0x1F000>, /* SSI */

0x1f000 (lower case)

> +                             <0 0x13c50000 0 0x10000>; /* Audio DMAC peri peri */
> +                       reg-names = "scu", "adg", "ssiu", "ssi", "audmapp";
> +                       clocks = <&cpg CPG_MOD 245>,    /* ssi-all */
> +                                <&cpg CPG_MOD 385>,    /* ssi-0 */

Please use hexadecimal module clock numbers, for easier matching with
the documentation.

[...]

> +                       power-domains = <&cpg>;
> +                       resets = <&cpg 225>,    /* ssi-all */
> +                                <&cpg 226>, <&cpg 227>, <&cpg 228>,

Please use hexadecimal module reset numbers.

> +                                <&cpg 229>, <&cpg 230>, <&cpg 231>,
> +                                <&cpg 232>, <&cpg 233>, <&cpg 234>,
> +                                <&cpg 235>,
> +                                <&cpg 236>,    /* scu */
> +                                <&cpg 238>,    /* adg */
> +                                <&cpg 237>;    /* audmapp */

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
