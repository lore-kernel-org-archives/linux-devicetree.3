Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A5D1EA84
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 12:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778155283; cv=none; b=rGdZQJAaYOKVU/wnNxoTSN5saClD6l+P2lRPR0JSfXm6muwbhz0Atb5dkZ7EZEFV53oZw5FS/5/lC7kwy4P5W1eltEg4pLTJm06BY4gy/jWFCuzuXPwT+w5NkSziLuDC3LxgfZpIIVHIj+LRcZ1T9P4M2CHwC6KvZOvWd7uoUMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778155283; c=relaxed/simple;
	bh=T26lUs/zZCWaWl3yD133dU+jEapsN5Vpw1J7XoMk44Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NmdiO9ffBTM6z6tuscdP0lBJa4eMrvaNXoDqI1UgchK4CgAGX117CbUtd9kcKU20vRJodgl7uAEaYrskAF/P9mA+91TCfuSm7vQUBFy7D+StnyEU+xi5DnnwYMTGPp9DmA6bhZaO+ZWJLtcxzRse1idSMC695HSoqlR5pwqShYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-94e2ad66abcso224083241.1
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 05:01:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778155280; x=1778760080;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rTVg2QbVjMu7RTowrSQYkhY+K3Bi7scPf1n5U5IL2+A=;
        b=SR6dLva2541osU3gA2aJVTE0Jfq/59hf3eP2ouI37fJaDX9OXVQbW9CKYA2hdOpooh
         hEDg2UFc1YYrhsGUxlFxr5B9kyF2b5vV05nXnRoT5jUzVT9ewOV79EKTVAmbeJkgF5ew
         Nrs/nmcfDmdOLTtR2m+ubvgTqnTsEwFXM40BiStWAFuj5s2H4y4YMBoEZrgCGlaAVkKb
         TEO1E7niMOQJShvMK+Q2n69DGtidNxSvNMRjPVRrR28cp2TkrFxKfJnJbCGvitqQQXo2
         5sf+i4nkVsacnlMFBenoiblrWNgz6UGczUMv0zuxEqPDEVWvDDCZd5Oo70qwDmJ8+9Xa
         M0og==
X-Forwarded-Encrypted: i=1; AFNElJ+kW4x4xskle0MezVPpgfGhhyJva+QnnbruphWRI9EIDrlja1fZ3zPhW8+vT1q0qUCJvYSqinhga6YY@vger.kernel.org
X-Gm-Message-State: AOJu0YwSkvAQhnQubzZDiMrLuCYlqQugueaIAUiyUcttmpri+pPLXXwn
	VdJi6WG1J9dUZwmWIBmUq9QcWiTlhmPYzw3icV/xsbapqt/9pXwBMSgjQD7yelr3i4c=
X-Gm-Gg: AeBDiesy+UkS7wnX82hZ50KtFuDVD1X7h4btWWNirLO3E9UEpZMAxi9J3jI29PYyC1r
	WCaGa9aRjJ705SHFjt/FtlocVNVqqN1lQDDSUXQFgjRik1LVK0pQrlHh/vAy4gefWHvsx23szw6
	lS+mOSeCh88FquQwVzeAx0Ma2S+p9w37OqCaf3u4Irsm24yS9PDT68Fzk5wkBoPboRsTph/wJUW
	mdUXWKfmQgqKMSEC4l0tucHO0Br+bdnuNXsYG4qiFhoPDrnrtEKm8pPCYKOATeSGNackezVdWXe
	32WegYSHW1mzQ1ndeFuHUUHgRVA6HUnks4m5RHWUcWU8AIMxXP379JrMrjwbVDO1F247AuFUb55
	oWltxoKnEk40LmcWTyZbE8wk1ARqg7gJABEyWnJrBOq00pr9+xSzzXw4PMFX23T2aHP2WsYdDEu
	fUZ2Zcw9TwuHaTwE20ci9shHCr5GhDtvjM+ulj09go0FJs+eHYPxu2Foz7S5Xo9e13W5P44ChbS
	1M=
X-Received: by 2002:a05:6102:4429:b0:602:8ad9:1f6f with SMTP id ada2fe7eead31-630f901b15amr3367367137.5.1778155278757;
        Thu, 07 May 2026 05:01:18 -0700 (PDT)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-62bfbb75140sm10895266137.5.2026.05.07.05.01.18
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 05:01:18 -0700 (PDT)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5752b279662so228065e0c.2
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 05:01:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8W2E/1KwlxmD38s+6uNndA00DpMUnBBHFQ7NSQtwsqKchLcgL9z0D/hG0emcMUA7/aUfmwGov+c62P@vger.kernel.org
X-Received: by 2002:a05:6122:3209:b0:56f:7300:37c9 with SMTP id
 71dfb90a1353d-575596aac1fmr3878971e0c.10.1778155276818; Thu, 07 May 2026
 05:01:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430125342.439755-1-biju.das.jz@bp.renesas.com> <20260430125342.439755-6-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260430125342.439755-6-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 7 May 2026 14:01:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW_qKgNjWD_ktPF==M6SGyhdu8pEvbyO1gt3_B_Cep9dQ@mail.gmail.com>
X-Gm-Features: AVHnY4KZNtx0X6b3me6zkJlGEIJEG7fMv60j1sOJQihhPmGmiq134B3u5_qjEhI
Message-ID: <CAMuHMdW_qKgNjWD_ktPF==M6SGyhdu8pEvbyO1gt3_B_Cep9dQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] arm64: dts: renesas: rzg3l-smarc-som: Add pinctrl
 configuration for ETH0
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Thu, 30 Apr 2026 at 14:53, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add pin control configuration for the ETH0 Ethernet interface on the
> RZ/G3L SMARC SoM board and also enable hotplug support.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v3:
>  * Split from patch#6
>  * Added hotplug support.

Thanks for the update!

> --- a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi

> @@ -52,3 +55,32 @@ phy0: ethernet-phy@7 {
>                 txd3-skew-psec = <0>;
>         };
>  };
> +
> +&pinctrl {
> +       eth0_pins: eth0 {
> +               txc {
> +                       pinmux = <RZG3L_PORT_PINMUX(B, 1, 1)>;  /* ETH0_TXC_REF_CLK */
> +                       power-source = <1800>;
> +                       output-enable;
> +                       drive-strength-microamp = <5200>;
> +               };
> +
> +               ctrl {
> +                       pinmux = <RZG3L_PORT_PINMUX(A, 1, 1)>, /* MDC */
> +                                <RZG3L_PORT_PINMUX(A, 0, 1)>, /* MDIO */
> +                                <RZG3L_PORT_PINMUX(C, 2, 15)>, /* PHY_INTR */
> +                                <RZG3L_PORT_PINMUX(C, 1, 1)>, /* RXD3 */
> +                                <RZG3L_PORT_PINMUX(C, 0, 1)>, /* RXD2 */
> +                                <RZG3L_PORT_PINMUX(B, 7, 1)>, /* RXD1 */
> +                                <RZG3L_PORT_PINMUX(B, 6, 1)>, /* RXD0 */

I will sort in ascending order while applying.

> +                                <RZG3L_PORT_PINMUX(B, 0, 1)>, /* RXC */
> +                                <RZG3L_PORT_PINMUX(A, 2, 1)>, /* RX_CTL */
> +                                <RZG3L_PORT_PINMUX(B, 5, 1)>, /* TXD3 */
> +                                <RZG3L_PORT_PINMUX(B, 4, 1)>, /* TXD2 */
> +                                <RZG3L_PORT_PINMUX(B, 3, 1)>, /* TXD1 */
> +                                <RZG3L_PORT_PINMUX(B, 2, 1)>, /* TXD0 */

Likewise.

> +                                <RZG3L_PORT_PINMUX(A, 3, 1)>; /* TX_CTL */
> +                                power-source = <1800>;
> +               };
> +       };
> +};

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
