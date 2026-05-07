Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A17393DE9
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 12:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778155356; cv=none; b=pz7YR2PVjwBUuHPwaZV63FYrNgyfW82MLtBpR/ug5VxYZGBKhas7Tc7fOWikQIS1J0fnogl6nwGc2tOyeyGysCtVYTlbVGIHNDdKkRbuhYaZidh+PCi8hX4twl7TxD8NHb8dj+JYlX9CAL7+pXOfXgCTlaRNit9vk1bN4fw4APs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778155356; c=relaxed/simple;
	bh=p+XWJXs8Fb2LlH88N+M2IGyKYxsF2z5kQ59hgbl3aTQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tb8zojAQr9Q6Wgb43SaCVIk6cVJKK3BJZmZ7CMzZ6fVBSSdknZFN+Em8Tv0bnT49jRvPNRs7Q2vRRbC+nfScresaqy4Y4w2yDlJGeIt7ueOlxKoinFUG+UENyWnKDXZtPdowGqHaEmuOii+b9Rai+LBOgVqMH6Ar3rO5POL8c1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-56a86f0a23bso783964e0c.0
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 05:02:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778155354; x=1778760154;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=08k+FLSK8wyyvtw3toL3M525xsZ0Tw/gihnmIZ5j7rs=;
        b=HdKPFapUZUk1BHscO1QNaVAYy0nTay+Z/Ulfnx57yI1lpFI+gZ5esjTuheWpBQuZWK
         QY21/f7+vpJGEyviGE9l1vO02FUvb6q3jJGRxnBv2oGwliLkp6BFnIIcrC6SZh77cdSo
         Vr8GmUpHk/EMDVD87FPTScmdNe5EjcIOdccEthxOAbTWCZWxLrHtJ/SJvVnQWRL+w4z2
         a5srRTmzxsl3Bj75gtgmw4sUoIyJwE13WJnnyC66NOy3tRAi9lBROsj3Y0VQ94dSH9PX
         SUm0mPRHT7rj3J9HSWrhRaN+EFRTnmDgfocVxR0C/A7md58t15Z47Hv0OVuoulhtS/oi
         IRSw==
X-Forwarded-Encrypted: i=1; AFNElJ/5KdftJPlmf6ildZ5NDTBtij3Zhl+Pza8IQ0XlMibm24Zc1+w4mIXAgiMTf+5Yuy4eqSaszRH60Ucz@vger.kernel.org
X-Gm-Message-State: AOJu0YwpKIphNLOVXe5ihIQNhSNsaBu7r69iuOnF5NBCxzmBxPJfywdD
	rU6Aydm/porMY1juplrGUUXfS1LvcQv35BKGL2V/U7ICtixZWetPM+qVn6DG9b33ijc=
X-Gm-Gg: AeBDiesWftcoIJT757/yyZmE5jzS0cZh17aRbbQpmJ1frTef84WpiwhE6mCeWsJABs8
	+7bP9gGfR1AfnNBEUgqkLvc5h2AC2HK2A16SI80b+AbQVpp1k+37K9S0cL0jMiR4sGbbIDpRAn9
	t3V14hmqz1hxn5J6VYWkhLLYST+WI2wcuRdLolHflzltjAZovx9882DayjIL+sojnJYTRNj2xDQ
	1BnbNk+8Cx9bTfed/jxzaXHC477llWi6PVMCEcHDNaHm/TcSZkT6xRBcIXer5e8RHkvmJXoqtYu
	ceKBMMPVSAZekdjvRYqHmrfZysr3oYqFVM3ooe7F54OHKUEz343Qo+jTc4tOaPJOkuGJSbKVLym
	yF2kssCLqDJ2pTIbTjb14bfAK8xU6pRFsTIRnyQhZJaoADDfN7UwdvyE5IeH5UjwZBamttMnpGL
	jzPDDfNdSVQzpI7muwqiGc1dB4ZxsAtKqrXAMH8QzMstTyy7Df89utyneBORVqOHqeOJPzzcuZ+
	1M=
X-Received: by 2002:a05:6123:2e5:b0:56c:d5cd:1e7c with SMTP id 71dfb90a1353d-57559559f3emr4471053e0c.5.1778155354229;
        Thu, 07 May 2026 05:02:34 -0700 (PDT)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95ce0902d6dsm10451048241.6.2026.05.07.05.02.33
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 05:02:33 -0700 (PDT)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-56a86f0a23bso783937e0c.0
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 05:02:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8b0k5JveunyogQ7RpAdFATZumklnyHXhJ1Ezrtkq0FiiA81KHPpbHKjtEI+XBLeYd0Mmkp+MlT9u9y@vger.kernel.org
X-Received: by 2002:a05:6123:2e5:b0:56c:d5cd:1e7c with SMTP id
 71dfb90a1353d-57559559f3emr4470964e0c.5.1778155353016; Thu, 07 May 2026
 05:02:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430125342.439755-1-biju.das.jz@bp.renesas.com> <20260430125342.439755-7-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260430125342.439755-7-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 7 May 2026 14:02:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV9_UQ7ucnxGZ4GJFbzsVZOvewG=VtwsBj2XwkRJPQa3A@mail.gmail.com>
X-Gm-Features: AVHnY4ISlb6BiUDz7sER5C3jekDZJDnjIykmuY5F806Vt0AJOxMiMVOOAVqLUqc
Message-ID: <CAMuHMdV9_UQ7ucnxGZ4GJFbzsVZOvewG=VtwsBj2XwkRJPQa3A@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] arm64: dts: renesas: rzg3l-smarc-som: Enable eth1
 (GBETH1) interface
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
> Enable the Gigabit Ethernet Interface (GBETH1) populated on the RZ/G3L
> SMARC EVK.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * Dropped ethernet-phy-ieee802.3-c22 from mdio1 device node.
>  * Fixed typo txdv-skew-psec -> txen-skew-psec.
>  * Added hotplug support.

Thanks for the update!

> --- a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
> @@ -83,4 +117,31 @@ ctrl {
>                                  power-source = <1800>;
>                 };
>         };
> +
> +       eth1_pins: eth1 {
> +               txc {
> +                       pinmux = <RZG3L_PORT_PINMUX(E, 1, 1)>;  /* ETH1_TXC_REF_CLK */
> +                       power-source = <1800>;
> +                       output-enable;
> +                       drive-strength-microamp = <5200>;
> +               };
> +
> +               ctrl {
> +                       pinmux = <RZG3L_PORT_PINMUX(D, 1, 1)>, /* MDC */
> +                                <RZG3L_PORT_PINMUX(D, 0, 1)>, /* MDIO */
> +                                <RZG3L_PORT_PINMUX(F, 2, 15)>, /* PHY_INTR */
> +                                <RZG3L_PORT_PINMUX(F, 1, 1)>, /* RXD3 */
> +                                <RZG3L_PORT_PINMUX(F, 0, 1)>, /* RXD2 */
> +                                <RZG3L_PORT_PINMUX(E, 7, 1)>, /* RXD1 */
> +                                <RZG3L_PORT_PINMUX(E, 6, 1)>, /* RXD0 */

I will sort in ascending order while applying.

> +                                <RZG3L_PORT_PINMUX(E, 0, 1)>, /* RXC */
> +                                <RZG3L_PORT_PINMUX(D, 2, 1)>, /* RX_CTL */
> +                                <RZG3L_PORT_PINMUX(E, 5, 1)>, /* TXD3 */
> +                                <RZG3L_PORT_PINMUX(E, 4, 1)>, /* TXD2 */
> +                                <RZG3L_PORT_PINMUX(E, 3, 1)>, /* TXD1 */
> +                                <RZG3L_PORT_PINMUX(E, 2, 1)>, /* TXD0 */

Likewise.

> +                                <RZG3L_PORT_PINMUX(D, 3, 1)>; /* TX_CTL */
> +                                power-source = <1800>;
> +               };
> +       };
>  };

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
