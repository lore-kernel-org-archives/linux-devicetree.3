Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C3C355057
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 10:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782123425; cv=none; b=PaGYifpA4er6uN5vJrrrkfRx5lFY49UL885mwHA6WaJ3vxs52G/leCjNzPbbYcWmPtfxEBQV6g2ANvxcoOHIdqVNXQWTIG7AFgmfrAetymo8dyy9/903/zfWn+j+kWImx7u+HZZuSSriKzhlo+1aIvq3VM0E5GVmNI9tM/4goXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782123425; c=relaxed/simple;
	bh=rF9MBMecl2KEOBvLP7nqkUZMnynYbMz7Qmy4vIKnXFQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I+FqwP6hXO14CfX3GpcuDgRpKmUdbLC/IzpE785APV7kP/STjUKBXlygDCFqKUcUTrSJ4RCxqWkCXhPy8XxiCCw2Zsc+pIOSt3GhgAAznMZqsZTv+IexGdzSDph3mNjn/00I+sO82Ignd+d4XC9B3Hw1iRszpMk9agAjgtCw0Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-9670c23ca7fso962707241.1
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 03:17:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782123422; x=1782728222;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZE6Dqpb/1jL1qyrKK5dTrMmULFcUq6fRF5GQUlTLM54=;
        b=F6KFagGuFuDJ8f4T11WYWcLt8IkK4f+mfT5I3yVGw8NGOyWhbIc5OzIWIFgHNSvnCc
         sgcZAbVK5A1cOfCGPjCYBrU3Gjty4F50jIk3c0ZERAOxx3owXpULEl/y91CI7dCVVbEA
         tnZMTbL69w1LwzKcBjKx/w9k9+xhIhwQ5EF8sGP/wV92rp7RLT2TDSRNL2Cj3pEDDirB
         p/Uw/sPgQN0s7ijz7TdaLySo3ltC3HJMfKJLLtRSMfFBO/3D5jlOlO5OqoNLK9YhACFU
         wpYGHAalYO5goW9ixPHEaxiYlDs7WKkTDOS4kBEkipAW8LyXiNNIYuhFCkHQUUbNLqm8
         JKMg==
X-Forwarded-Encrypted: i=1; AFNElJ+r1YWUW8BgWldAbK3aJN0ReSpRzlTSPogVi/6W0rQRVB5LNKs784wNf/7cLVF6M6gRdd9kRQAGl6uZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyUO6Hq5/DYDs4m5qAp8Fop2ihixkxWgWLFLmfzUOSfmFu4CsiY
	/WEBozJIeR3qgv4zarkPOfHxE8m44CwMJOVnASeeYiNia9QFhx/Aj5rnQChWiIfm
X-Gm-Gg: AfdE7cmUf+bLPvNZki6ThJNDroX43l2Oc5jukAHrxBBCc9lno52D5PRygTobSolvmcM
	au83avuqRRqsGbcHtQmixiBDNUN7XOklw/r2dUUu0IawSSGTsEPZe6Lr7vAJNWdBJ/JIkqiFExn
	tcZhnZguzVgVXRZjQ54EAsQG+6MjjI/wFGqEhlAz1wSDKdiCbGy32jVfhLCpX031fB+yvHWeyFp
	vwThu/eKP2PaU8mb6zavG8Yjfo5VvYfFPY85f1j5IwC3H7MWCSLNV1RQe6vLypbo+yXc1MV85JP
	NXJhNKZpINc7sEUonLmiX5bRjPKd/StitUMqhX1MlLxxslixJnA03vZ20n2nE9cJA03TB5ZJbpC
	JptF6RVcJyOuvGkPWJ5y2lANsSfXaT0vxsWcIdQpSPCNy/1bNTYNioqXa9Sj4IJOkgdIXDNEnSc
	zK4KIUaSaHXDXCEvhaMU6ejp11mEnXSLyPFukgK4j4DxTZzYCVkQ==
X-Received: by 2002:a05:6102:f9c:b0:639:1e8b:ecd9 with SMTP id ada2fe7eead31-72a03d9e389mr7649214137.20.1782123421994;
        Mon, 22 Jun 2026 03:17:01 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-72ba4f2905csm5755308137.8.2026.06.22.03.17.01
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 03:17:01 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-96358d0a024so3139517241.3
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 03:17:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+/Le0pckQ4tNv5+zvNdWMSu61MkmUSFaeknKspHGpfQWhNV09DsOMfTsdzlF/iPzuOYJOX8kfAQKgg@vger.kernel.org
X-Received: by 2002:a05:6102:fa0:b0:6f0:3c5b:ce7a with SMTP id
 ada2fe7eead31-72a03545558mr8210500137.17.1782123421256; Mon, 22 Jun 2026
 03:17:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610074702.1743334-1-john.madieu.xa@bp.renesas.com> <20260610074702.1743334-2-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260610074702.1743334-2-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Jun 2026 12:16:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXquncHh8wxEF4TxKhJNyVB3rCqcGLVtipVkC_H0M2TBQ@mail.gmail.com>
X-Gm-Features: AVVi8CeEHcvE3XW-KNNE60oqtPnFlFK01RuCAZUrkg9U-_-leTNgXIWxLpkdWeo
Message-ID: <CAMuHMdXquncHh8wxEF4TxKhJNyVB3rCqcGLVtipVkC_H0M2TBQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] arm64: dts: renesas: r9a09g047: Add RZ/G3E Sound support
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: magnus.damm@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, john.madieu@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi John,

On Wed, 10 Jun 2026 at 09:47, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
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
> v5:
>  - Use hexadecimal CPG module clock numbers, for easier matching with the
>    documentation.
>  - Use hexadecimal CPG module reset numbers.
>  - Lowercase the SSI reg size: 0x1F000 -> 0x1f000.
>  - Extend the SCU reg region from 0x10000 to 0x20000 to cover the SCU DMAC.
>  - Drop the per-line clock/reset comments now that the numbers are hex and
>    the names are self-documenting, and pack clocks/resets two entries per
>    line so each line lines up with its clock-names/reset-names counterpart.

Thanks for the update!

> --- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> @@ -912,6 +912,468 @@ rsci9: serial@12803000 {
>                         status = "disabled";
>                 };
>
> +               snd_rzg3e: sound@13c00000 {
> +                       compatible = "renesas,r9a09g047-sound";
> +                       reg = <0 0x13c00000 0 0x10000>, /* SCU */
> +                             <0 0x13c20000 0 0x10000>, /* ADG */
> +                             <0 0x13c30000 0 0x1000>,  /* SSIU */
> +                             <0 0x13c31000 0 0x1f000>, /* SSI */
> +                             <0 0x13c50000 0 0x10000>; /* Audio DMAC peri peri */
> +                       reg-names = "scu", "adg", "ssiu", "ssi", "audmapp";
> +                       clocks = <&cpg CPG_MOD 0xf5>,
> +                               <&cpg CPG_MOD 0x181>, <&cpg CPG_MOD 0x182>,

Please align the opening braces with the previous line...

> +                               <&cpg CPG_MOD 0x183>, <&cpg CPG_MOD 0x184>,
> +                               <&cpg CPG_MOD 0x185>, <&cpg CPG_MOD 0x186>,
> +                               <&cpg CPG_MOD 0x187>, <&cpg CPG_MOD 0x188>,
> +                               <&cpg CPG_MOD 0x189>, <&cpg CPG_MOD 0x18a>,
> +                               <&cpg CPG_MOD 0x174>, <&cpg CPG_MOD 0x175>,
> +                               <&cpg CPG_MOD 0x176>, <&cpg CPG_MOD 0x177>,
> +                               <&cpg CPG_MOD 0x178>, <&cpg CPG_MOD 0x179>,
> +                               <&cpg CPG_MOD 0x17a>, <&cpg CPG_MOD 0x17b>,
> +                               <&cpg CPG_MOD 0x17c>, <&cpg CPG_MOD 0x17d>,
> +                               <&cpg CPG_MOD 0x172>, <&cpg CPG_MOD 0x173>,
> +                               <&cpg CPG_MOD 0x172>, <&cpg CPG_MOD 0x173>,
> +                               <&cpg CPG_MOD 0x170>, <&cpg CPG_MOD 0x171>,
> +                               <&cpg CPG_MOD 0xfb>, <&cpg CPG_MOD 0xfc>,
> +                               <&cpg CPG_MOD 0xfd>, <&cpg CPG_MOD 0xfa>,
> +                               <&cpg CPG_MOD 0x180>,
> +                               <&cpg CPG_MOD 0xf6>, <&cpg CPG_MOD 0xf7>,
> +                               <&cpg CPG_MOD 0x17e>,
> +                               <&cpg CPG_MOD 0x160>, <&cpg CPG_MOD 0x161>,
> +                               <&cpg CPG_MOD 0x162>, <&cpg CPG_MOD 0x163>,
> +                               <&cpg CPG_MOD 0x164>, <&cpg CPG_MOD 0x165>,
> +                               <&cpg CPG_MOD 0x166>, <&cpg CPG_MOD 0x167>,
> +                               <&cpg CPG_MOD 0x168>, <&cpg CPG_MOD 0x169>,
> +                               <&cpg CPG_MOD 0xf8>, <&cpg CPG_MOD 0xf9>;
> +                       clock-names = "ssi-all",
> +                                      "ssi-0", "ssi-1",

... and the double quotes...

> +                                      "ssi-2", "ssi-3",
> +                                      "ssi-4", "ssi-5",
> +                                      "ssi-6", "ssi-7",
> +                                      "ssi-8", "ssi-9",
> +                                      "src-0", "src-1",
> +                                      "src-2", "src-3",
> +                                      "src-4", "src-5",
> +                                      "src-6", "src-7",
> +                                      "src-8", "src-9",
> +                                      "mix-0", "mix-1",
> +                                      "ctu-0", "ctu-1",
> +                                      "dvc-0", "dvc-1",
> +                                      "audio-clka", "audio-clkb",
> +                                      "audio-clkc", "audio-clki",
> +                                      "ssif_supply",
> +                                      "scu", "scu_x2",
> +                                      "scu_supply",
> +                                      "adg-ssi-0", "adg-ssi-1",
> +                                      "adg-ssi-2", "adg-ssi-3",
> +                                      "adg-ssi-4", "adg-ssi-5",
> +                                      "adg-ssi-6", "adg-ssi-7",
> +                                      "adg-ssi-8", "adg-ssi-9",
> +                                      "audmapp", "adg";
> +                       power-domains = <&cpg>;
> +                       resets = <&cpg 0xe1>,
> +                                <&cpg 0xe2>, <&cpg 0xe3>,
> +                                <&cpg 0xe4>, <&cpg 0xe5>,
> +                                <&cpg 0xe6>, <&cpg 0xe7>,
> +                                <&cpg 0xe8>, <&cpg 0xe9>,
> +                                <&cpg 0xea>, <&cpg 0xeb>,
> +                                <&cpg 0xec>, <&cpg 0xee>,
> +                                <&cpg 0xed>;
> +                       reset-names = "ssi-all",
> +                                      "ssi-0", "ssi-1",

... here too.

> +                                      "ssi-2", "ssi-3",
> +                                      "ssi-4", "ssi-5",
> +                                      "ssi-6", "ssi-7",
> +                                      "ssi-8", "ssi-9",
> +                                      "scu", "adg",
> +                                      "audmapp";
> +                       status = "disabled";
> +
> +                       ctu {
> +                               ctu00: ctu-0 { };
> +                               ctu01: ctu-1 { };
> +                               ctu02: ctu-2 { };
> +                               ctu03: ctu-3 { };
> +                               ctu10: ctu-4 { };
> +                               ctu11: ctu-5 { };
> +                               ctu12: ctu-6 { };
> +                               ctu13: ctu-7 { };
> +                       };
> +
> +                       dvc {
> +                               dvc0: dvc-0 {
> +                                       dmas = <&dmac0 0x1db3>, <&dmac1 0x1db3>,
> +                                              <&dmac2 0x1db3>, <&dmac3 0x1db3>,
> +                                              <&dmac4 0x1db3>;
> +                                       dma-names = "tx", "tx", "tx", "tx", "tx";
> +                               };
> +                               dvc1: dvc-1 {
> +                                       dmas = <&dmac0 0x1db4>, <&dmac1 0x1db4>,
> +                                              <&dmac2 0x1db4>, <&dmac3 0x1db4>,
> +                                              <&dmac4 0x1db4>;
> +                                       dma-names = "tx", "tx", "tx", "tx", "tx";
> +                               };
> +                       };
> +
> +                       mix {
> +                               mix0: mix-0 { };
> +                               mix1: mix-1 { };
> +                       };
> +
> +                       src {
> +                               src0: src-0 {
> +                                       interrupts = <GIC_SPI 902 IRQ_TYPE_LEVEL_HIGH>;
> +                                       dmas = <&dmac0 0x1d9f>, <&dmac0 0x1da9>,
> +                                              <&dmac1 0x1d9f>, <&dmac1 0x1da9>,
> +                                              <&dmac2 0x1d9f>, <&dmac2 0x1da9>,
> +                                              <&dmac3 0x1d9f>, <&dmac3 0x1da9>,
> +                                              <&dmac4 0x1d9f>, <&dmac4 0x1da9>;
> +                                       dma-names = "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx";

These lines are way too long (checkpatch?).

[...]

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
