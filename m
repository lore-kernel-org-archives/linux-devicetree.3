Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C1447DD55
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 13:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780580135; cv=none; b=FGLo/nM8lC4HIrYysvfs+fWRrM8hw6deJS+AckeHSJLhjOa8ljlMMfq3fuafNIFXrzLlQ39RuvyXUrYzIKDngfCEb9/OvpXbCltxowdbnTxgtOXN/7QpLYTEvLJxo65PqmSqjF86MatzNUGlrXhD5PLkP3zPSn+rpmttLE/loGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780580135; c=relaxed/simple;
	bh=DlMJy/HbD7sdsoaWTVD2xSFGx5uxnG9kR+usD6eKtlc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GiksLECqSsZrCh2K/HAINFeskk/BxD7pY51TI3A47Qpdq9MREbLsiyeNCcJVFkqRHSFPlxKMLc00gmscbsYsdtfopv4tG8LQ/arkI1Nfy2tY0VSqwFVtZ3cN8Vbw9BB9bayw6NlCpqS4SvOvuQxBQom8d87crfwDSuirT1r26yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-963a722ed58so481199241.0
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 06:35:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780580132; x=1781184932;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QeesPihQRAsowNF4S9BH5xHDdN+c+plhMp2PuD8yPAU=;
        b=WU1230UqnDsNy2E0pVe8bB2/hWjgPou00glzauBvKUJ1NG8xFkfAN0xKJTkTNknjTo
         49fBbfnzVOSeN5yF0eJtsqqWXCmTiUXOp7/Mdn/tIftMfg06soWmLAESI991f7dMoIFp
         aGJY0HILPOoyjhf25Q0cheI7IlOEJx0heKNuyhCA5Xnrg8+MV4pEX1iAOdUFOtO3HDVu
         AK9XiEBBNkVc+jiayyPVp5ixSMhNbSfmflaGt1hegmw3BSvZSbZ6AdYX18MIWrcsiFv1
         3EtnTbQDT2FySMwKclhy7lKFZsptg6yokjhigl+0SVaKV66Xisn1/6FCSHWaqyAkznMi
         Zw/w==
X-Forwarded-Encrypted: i=1; AFNElJ90s45NiVDmCpukdTIYTOJ92emE7FsEbaj5wlWCZPtXlN3aNQwQafCMn/T95B11WTEV95YOwKcG+XDp@vger.kernel.org
X-Gm-Message-State: AOJu0YxcByNl8mAklRDxkqXA1KplB8HkNtpnF4tAhR7KHlaSno3gl87m
	pobJBB7QDw6+ezyhJgnMDRzDZTlSkjUkNc7dbHwZy74US8qGM5k9uHN/t5CEGDMqF9c=
X-Gm-Gg: Acq92OG2w+ZciFL+t9eDH350xsPLJoXLK3lwSNb3UEQzs7J/+eeGB82m4qEeAEGwlxu
	gR+dpMYHbcW/x9W6+Of2sVYpvf4iiMWL0/qzf0JfHznj/1jn72ZsthBwhnSxocERNeEUw07C5qT
	ufM2lM1lqNUQ7B56COWXJGlhYiMSKtRao9fwaV7ZqRo1FmLJs7zPIa/w3nkl6Mgwd6q+e806aaK
	fORSUj1z4f7Gc9Q17pUcJZrJK4daJf2HZBWUlkAfpBIfHGC5ETkpWazHqLOkVMofVficVQ+b7K5
	5OgoCfswaThGAePiHXQ31NJLH7O/3vQwb7/MG8NaBdt1ox0ZsNeYNhxm+JlhLMgMKtAvEuEaA0s
	slQYJMoAM5Ayw7GDzhRXnF/2mn19gXQJb7x/mB31TEXvKZnJZa4bsFqMTHwry95datAMl6Yha8v
	uZcYXUqF3m2vXalrxE1C8+jXbpcv7Dmu32S+joK8i5WM7d+ZJb1ZGBUMjtcKDjURnODiJWyJ52Z
	mw=
X-Received: by 2002:a05:6102:5092:b0:6c4:5bdb:5e34 with SMTP id ada2fe7eead31-6ec18a97150mr5102321137.0.1780580131942;
        Thu, 04 Jun 2026 06:35:31 -0700 (PDT)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-6eb649b5513sm4870828137.8.2026.06.04.06.35.31
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 06:35:31 -0700 (PDT)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5873983d19eso659407e0c.2
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 06:35:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/RLz75lw13WgXWA9NqD2tTXdowPp5MUW8Aop+QEdfZdKfmJzljGcu++fN1Jv7OdWL+hun3L9XyeH7v@vger.kernel.org
X-Received: by 2002:a05:6123:142:b0:588:2fc:f169 with SMTP id
 71dfb90a1353d-5a6e90e544amr5469012e0c.13.1780580130987; Thu, 04 Jun 2026
 06:35:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528134752.79813-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260528134752.79813-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260528134752.79813-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 4 Jun 2026 15:35:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWjdRLmnXduVv6uu8oxB6orxqxrANKDDm8xGjU7C0qQGw@mail.gmail.com>
X-Gm-Features: AVVi8CdIzcWNzyVXA_Tw_6icOkxcSEk37xtaCQR10UrJHR4-KQNi5o_SyT4ZfIA
Message-ID: <CAMuHMdWjdRLmnXduVv6uu8oxB6orxqxrANKDDm8xGjU7C0qQGw@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: renesas: rzt2h-n2h-evk: Configure ETH pins
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Thu, 28 May 2026 at 15:48, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Update the gmac1 (ETH3) and gmac2 (ETH2) pin configurations on the
> RZ/T2H and RZ/N2H EVK boards to comply with the electrical specifications
> defined in Table 58.11 of the hardware user manual.
>
> While restructuring the nodes into pin groups, fix a copy-paste comment
> typo in the RZ/N2H device tree where the ETH3_TXD1 pin mux configuration
> was mistakenly labeled as ETH3_TXD0.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.3.

> --- a/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
> @@ -258,23 +258,54 @@ can0_pins: can0-pins {
>          *
>          * SW2[8] ON - use pins P33_2-P33_7 and P34_0-P34_5 for Ethernet port 3
>          */
> -       gmac1_pins: gmac1-pins {
> -               pinmux = <RZT2H_PORT_PINMUX(33, 2, 0xf)>, /* ETH3_TXCLK */
> -                        <RZT2H_PORT_PINMUX(33, 3, 0xf)>, /* ETH3_TXD0 */
> -                        <RZT2H_PORT_PINMUX(33, 4, 0xf)>, /* ETH3_TXD1 */
> -                        <RZT2H_PORT_PINMUX(33, 5, 0xf)>, /* ETH3_TXD2 */
> -                        <RZT2H_PORT_PINMUX(33, 6, 0xf)>, /* ETH3_TXD3 */
> -                        <RZT2H_PORT_PINMUX(33, 7, 0xf)>, /* ETH3_TXEN */
> -                        <RZT2H_PORT_PINMUX(34, 0, 0xf)>, /* ETH3_RXCLK */
> -                        <RZT2H_PORT_PINMUX(34, 1, 0xf)>, /* ETH3_RXD0 */
> -                        <RZT2H_PORT_PINMUX(34, 2, 0xf)>, /* ETH3_RXD1 */
> -                        <RZT2H_PORT_PINMUX(34, 3, 0xf)>, /* ETH3_RXD2 */
> -                        <RZT2H_PORT_PINMUX(34, 4, 0xf)>, /* ETH3_RXD3 */
> -                        <RZT2H_PORT_PINMUX(34, 5, 0xf)>, /* ETH3_RXDV */
> -                        <RZT2H_PORT_PINMUX(26, 1, 0x10)>, /* GMAC1_MDC */
> -                        <RZT2H_PORT_PINMUX(26, 2, 0x10)>, /* GMAC1_MDIO */
> -                        <RZT2H_PORT_PINMUX(34, 6, 0x2)>, /* ETH3_REFCLK */
> -                        <RZT2H_PORT_PINMUX(27, 2, 0x0)>; /* IRQ3 */
> +       gmac1_pins: gmac1-group {
> +               txclk-pins {
> +                       pinmux = <RZT2H_PORT_PINMUX(33, 2, 0xf)>; /* ETH3_TXCLK */
> +                       drive-strength-microamp = <11800>;
> +                       slew-rate = <1>;
> +                       input-schmitt-disable;
> +               };
> +
> +               txd-en-pins {
> +                       pinmux = <RZT2H_PORT_PINMUX(33, 3, 0xf)>, /* ETH3_TXD0 */
> +                                <RZT2H_PORT_PINMUX(33, 4, 0xf)>, /* ETH3_TXD1 */
> +                                <RZT2H_PORT_PINMUX(33, 5, 0xf)>, /* ETH3_TXD2 */
> +                                <RZT2H_PORT_PINMUX(33, 6, 0xf)>, /* ETH3_TXD3 */
> +                                <RZT2H_PORT_PINMUX(33, 7, 0xf)>; /* ETH3_TXEN */
> +                       drive-strength-microamp = <11800>;
> +                       slew-rate = <1>;
> +               };
> +
> +               rx-pins {

I guess you want me to sort all subnodes while applying? ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
