Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B559335555
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 08:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781254073; cv=none; b=AuCy5T/uyyGl48rTwQDouYajVaCRNe3mILGke0tVeiLlIlJ/KX9sw5ogai3ZZnM7EOt4EGEoqhOv2So1awr9Ug85XzkLX9B6hOufiLZ8L3V+AtQNWtqnY9cd86xL+qvZv6R3tD6Ilbk8EloqKgj1EHxyh2jhJvyXs4ABPu5nD4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781254073; c=relaxed/simple;
	bh=65uwZgvej5il4TwgSj3WG4tlATD19TKgvXSd8rKCPgQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oWs2FAkseVdCrOfIDLMJOKO+va6Abvu+FoGV8/2A488mLG7e1KBRSQKLzgZJNOFUKfoJZvc5D3lnqzFONKA27S39is9Yvz1Sxe07U6Gy2DJayEzJuvNJ67cw6lZIXdWge3oAAjaXFb+obGd2LoDEEUM3Hm5rFPD46Kwgn2E/I08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5b22b023e1dso412656e0c.2
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 01:47:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781254071; x=1781858871;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tQlK0t9ztcQvgDtgl79EcKdVjd3bkrWM0eY0EPTL4QA=;
        b=YMsuy/oK6z2sBCJOliaVPbhrK/vd8G1LTHTsEWy6RUCd/T0ikS2zh63dkwXTpbDXtj
         7pHG9NCNRAuKcXMnkaEtwhLQN94OjqezahPMc2mk1LwUAJSjLnLFNFVdPeLQ2Jgj3LTz
         ORiKXqYMJA/4zP73Aod1YBgWhRvrkHDAzW4Razo47cY72syAZHatX7KDinSANfw56+1g
         csdwpSsvSiJyIitn/AjyQiShXBvMCdsm++ay4ZKf+vTTqW0G2t+/QIAgLDsGJ8+BC63e
         gADNc8ouXSrDDswsG7BaxJ8E3Oq9f6itJCFOOfPkSIZioC67fBIkcaDnfExTBIjvC08W
         hcdA==
X-Forwarded-Encrypted: i=1; AFNElJ+i1P6wvgZDE+46eEH0OmQq6DcFyKptVwaPzeC7XCqpSXD0ND2yiT5FOlJTZ/94SOUzwMaB6E2BnrSV@vger.kernel.org
X-Gm-Message-State: AOJu0YwZuxsrle3bO6SZgQKUNdlmCZaI1Y+W2SiOEEEDmw7GeUrC/lWw
	WYx8jQBl5z8QdidIAE/hMfmK8X2GK1EgMAd+4vxmiGT9zSIIeA2mSTYPHLfgevyd
X-Gm-Gg: Acq92OGrON5h+Twq1LHAZygoerfIt2EHdNRJk3KzVFodfkpCTi8G7iI0bwJZrUzzYc5
	Y6yNc3a5LfPGJmQrfhFae8eALx0vf+xq+Lj3clV8L7WOwbvhCdFBYOvZYqUjnnC0aJwTGeayemZ
	lFl76i29RdTiCvhLjoLz48be5OQP4n+ESJnpeGwcg/YJi0vTxqA97Jzua2vhxnxzN25OAz12UQs
	ivzuByRc8STEdDvnWksO1sks7EgIKQE4MXJvwH8tDFwoQIXdq0i48I6+9k2xTdjQtPC+tDzg3xY
	eXcxmgX9+Rcr4VVSSMyTzTGCkjfUSNyNoqFK1rAU0IM6AF+8+yQ1twrBz8aogeoGIVeuBtIv9iR
	sV2DDM+Co18OXe08upIq/2puYwZnmD6khHMRsvvxVsgFFTXxtb9uahPtx//Oc7ydNSAcjZbbz/Q
	NvNsOyM0zhC+zJVZ7wBtX3q3WCZ9tTYKuEMRaVe/YW/iLCXMA8HEGY4D2jFIaq
X-Received: by 2002:a05:6122:1d89:b0:576:1a8d:8989 with SMTP id 71dfb90a1353d-5bb6bddd1d0mr756179e0c.0.1781254071296;
        Fri, 12 Jun 2026 01:47:51 -0700 (PDT)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bb691bc485sm1935462e0c.12.2026.06.12.01.47.50
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 01:47:50 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-6c4db0bf752so485372137.0
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 01:47:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/I1w/vHACInFHALP62d1vMNJ+zfTmL7sMTLFqASwHXNuoBy9YoBGks5CVhrWT6Ou7oXMmK4dUkbVc1@vger.kernel.org
X-Received: by 2002:a05:6102:2ac3:b0:643:80f1:350a with SMTP id
 ada2fe7eead31-71e88b99e6emr940155137.2.1781254070220; Fri, 12 Jun 2026
 01:47:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260612080354.57459-4-wsa+renesas@sang-engineering.com> <20260612080354.57459-6-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260612080354.57459-6-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 12 Jun 2026 10:47:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWEJT8JYuSGQmNsbUZuU+zx7prwMHVikOuOS-iXYKenbw@mail.gmail.com>
X-Gm-Features: AVVi8CffWxOPh1eaDcqwf9PB86jCpddX7GaCPj1O4xWGWk3HI6WTfQ9pJBKeEFw
Message-ID: <CAMuHMdWEJT8JYuSGQmNsbUZuU+zx7prwMHVikOuOS-iXYKenbw@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: renesas: r9a06g032-rzn1d400-eb: Enable SPI-FRAM
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Fri, 12 Jun 2026 at 10:04, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Activate the FRAM and the SPI bus which it is attached to.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> --- a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts
> +++ b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts

> @@ -152,6 +156,13 @@ pins_sdio1_clk: pins-sdio1-clk {
>                 drive-strength = <12>;
>         };
>
> +       pins_spi1: pins-spi1 {
> +               pinmux = <RZN1_PINMUX(156, RZN1_FUNC_SPI0_M)>,
> +                        <RZN1_PINMUX(157, RZN1_FUNC_SPI0_M)>,
> +                        <RZN1_PINMUX(158, RZN1_FUNC_SPI0_M)>,
> +                        <RZN1_PINMUX(159, RZN1_FUNC_GPIO)>;
> +       };
> +
>         pins_uart2: pins-uart2 {
>                 pinmux = <RZN1_PINMUX(105, RZN1_FUNC_UART2)>,
>                          <RZN1_PINMUX(106, RZN1_FUNC_UART2)>,
> @@ -168,6 +179,20 @@ &sdio1 {
>         status = "okay";
>  };
>
> +&spi1 {
> +       pinctrl-0 = <&pins_spi1>;
> +       pinctrl-names = "default";

Please document that this depends on SW2-4 being OFF.

> +       status = "okay";
> +
> +       cs-gpios = <&gpio2a 31 GPIO_ACTIVE_LOW>;

It doesn't work with hardware chip-select?

> +
> +       fram: fram@0 {
> +               compatible = "cypress,fm25", "atmel,at25";
> +               reg = <0>;
> +               spi-max-frequency = <12500000>;

The actual FRAM part seems to support 40 MHz, but that may
be limited by the board wiring.

> +       };
> +};
> +
>  &switch {
>         pinctrl-0 = <&pins_eth1>, <&pins_eth2>, <&pins_eth3>, <&pins_eth4>,
>                     <&pins_mdio1>;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
