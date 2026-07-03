Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A112727EB
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 17:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783098856; cv=pass; b=W2KCEz7Bk29RIgZs6Yz1O0KkgyAUnuEw8Jb5AtWKFdsZgP4feIQB7WgqLE/ke3zUJKCsj11O4WQBxV7cChpQrrlEp+SHdv/Y7KCl9IwzjUwaYdI5zZuNYpAyNhx1yhLcJXAi5XNUiZaNuY5fKIGAkPW5/GhS1KsMYXHJRuUYRE0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783098856; c=relaxed/simple;
	bh=VC7ZCv7+aslU/qQ/BrRdM0VLdD94B8717jq32y5ZOfI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BfJhT9hvDjZQU4A+lUEtmfEbe4XVsTbqnmJDbprl3bO+StXtWmXXMCbGtYiZhcRopTLIYzXkDocWKCsx/zGOVrHqAzGJzHWKJXFzNDCrzd5Sq1n2ouGI+DMX3KftnHZAOAXcGbaHfr94oYA6Mf0nYlv0I3swzkSuv4CkwrScEJU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KV6O6hck; arc=pass smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KV6O6hck"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-37de8008910so720601a91.0
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 10:14:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783098854; cv=none;
        d=google.com; s=arc-20260327;
        b=W6tiwR9AjkSuVOIZWODU7z+BWI6mwUsC1xbtivslEmte9nAjJGE1z7oZG/p0wDal2I
         Tc5J/wD1NzuLXUf3HfQaT1z9QC7dBoqI00GeVZKjbS/FWvn5448vn4R0z0LofKOEmREa
         9G/ToXsyk/Wsq8S9SqFqLupB0aH4MY3MggKntvyTgEazvpLQjRcoXfnoTQ5BXrvwc8+u
         PaRww2vocXiQpS+TdLyHSkVZn3ZPfrAQvkXu8UeTtkh/XDUfRjQH22hpgdFWt+V/ESVf
         fBwTYvBKR3ASN9DdudhLmm+KX/rXQHSmFoHVH8A/79nM2d57vLPVQ/Ae+aEd+almvjwH
         8yug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=uaErd3idfCYZ9nBzpwZ4jTIj75xKFGwhc0tNJS1QEx4=;
        fh=7nWVnq5KBtVhthyY1kujNfogxhWHlwn8RUT+EhSz+7Y=;
        b=Jv6RgBHYmVGcXxPzy2916udNDUU8Yj6UZLBF+Uq7fwUMDU9sAJJOm+Vvsmet0YHk61
         fm35Er5eSJQzd8ejghIU31SW80sT4pXjqcAYLMtGHyt/Iuv0TeZi5W/qoTCpq5uB+rfx
         nmd8rZ3tVU+uVlrQ8h3wrpCVdTBbypwha5RN3t1HytNQb4xekTV+OCTkUuoxxpYSk+y1
         lUHPZTDj2dJz9ho26lFmTS9cd9WuGBFh6CZlRK70Yne1TFOUAEM0PktmjHEJ5q8dPb4O
         PEuRgOrE/YAqhEzanfdz4x7gtGDgiqNuaFAFtG3uff5nu9KSGiFmSVoxJN9lZZJt/bmX
         pmzw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783098854; x=1783703654; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uaErd3idfCYZ9nBzpwZ4jTIj75xKFGwhc0tNJS1QEx4=;
        b=KV6O6hckO9VGpywVnRPjGbwu3De06i/K9OP4GhrZNZST84hj2usPh969YP811hl2/4
         a2kDaWpxWa5IuzoXbEYeAlrVOgeaUHJy8ZkcQNu4QWgmzO4AXF2ANuL4jn7LC3XNQbGx
         FFry70bGelHKebH6jztbois0zUjHvE6W3900mqTnDEvjUAqqgxAFJHOUEOXOMztMw03K
         zbTA50ujpLQpiTwp3aasRdgTzhNCoTjtkvoplktltLlPhlWNRygOFo9Hcpy3PMtxWuyH
         977L9NIiCWJFXAiUMGN63QV3sS33aWFWLnF6lYtLoh1Vl04dUGwNcBbHLGDwYjjB9o7Y
         Rwhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783098854; x=1783703654;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uaErd3idfCYZ9nBzpwZ4jTIj75xKFGwhc0tNJS1QEx4=;
        b=FikUGFSspHAmxoGcJvE/DiWiqNiRg0LzUH8FmM/gjjdxtZJHdxutSid0ZbykBh9618
         kmcr70NU6BuNaWRjdflt6Jega9gbJUMmiqC/GN660YTVmYm9nlB2Av9n+CZSZh9gslKW
         9TsXV7b0KX3U80HOLdyrd1xSonuZkA1CE7dyk4KyZrHVedpc6YBo/A5i2Q8s081mlsJK
         BLPY3eD7sHwkqc3dyLxUyrdvaK55bb5lLyiWfiQxKK5UbEChk1//RJqTU1QSU4/ssI6y
         xEpjjVC4+P/osvY5rHYl2B663qmy5iccKk7jL5dWcKBEkmbarpqoZ2SBgEqyHck6cprc
         2wSw==
X-Forwarded-Encrypted: i=1; AHgh+RpZRf00lxAodtCV6P8cGh/22XB7P9X0C00/xIWlbuGrd5Mca/Uv501Zp2Gu7E9tSF8FT03vyuHbseeq@vger.kernel.org
X-Gm-Message-State: AOJu0Yzcs/D8hl3wtDfE9Of3g2PeTjHtJVufoDHrd2bcsX9MCuj6mPrO
	kOzfwvtj7/ZNaT/0Nywokvw2/Fgwzhn2Z34g3Ylwbkdqu90jvNBwFVQ5tuxVZEml8qDOoUoh4YS
	e+z4q1Wei/w5orWXGeR5Hskc9iguXMDw=
X-Gm-Gg: AfdE7cmHyfdqKFFUzud6snbBG6MMJaSx7JvSXH93N8JQ0C4BzPflqlEAmDHT+odfTOi
	nD5Z/T7Cj1juX3e8kGoDby9Blql6gTeINpJZOHWV3q00LqaQt38l+6m2J1YHgXFdq6IQ19eTFEj
	jaWh/28Hq6+t7TV1hsrEcpz5lTRoVzRaEIBYupSfziazV/SuW58hOTg26kJ/OBCOJcPl6xklsOh
	eb2UM4vhM2d2B7ivUoMcC1LB1G3p8fqFJbpCieSjWtIDYufr3HrqBOurl+T4rLYToGCj+Bomk0A
	Z1P+nQ9QXkBLsZf9V8YhyBDAoeX1brXZF3q9NWuMyqpc7RPF931h
X-Received: by 2002:a17:90b:2fcc:b0:37d:f72c:9636 with SMTP id
 98e67ed59e1d1-38280e981b7mr406598a91.11.1783098854403; Fri, 03 Jul 2026
 10:14:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260703-nanopi-m6-v1-0-8344a1559519@gmail.com>
 <20260703-nanopi-m6-v1-12-8344a1559519@gmail.com> <DJOWK4QYYMI1.F1TOWMR4BM22@cknow-tech.com>
In-Reply-To: <DJOWK4QYYMI1.F1TOWMR4BM22@cknow-tech.com>
From: Joachim Eastwood <joachim.eastwood@gmail.com>
Date: Fri, 3 Jul 2026 19:14:03 +0200
X-Gm-Features: AVVi8CfY39OU8Il_NnWqBVTMmpRn6fLaUzCEyD6qk3aZNRwtsleLFP9BaGWo9Ss
Message-ID: <CAPSPb=ustOuAkeWUL8x6aigO=5wkQUupZh2g5g0Pe=qTa3MeEA@mail.gmail.com>
Subject: Re: [PATCH 12/12] arm64: dts: rockchip: add support for NanoPi M6 board
To: Diederik de Haas <diederik@cknow-tech.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Diederik

On Fri, 3 Jul 2026 at 13:34, Diederik de Haas <diederik@cknow-tech.com> wrote:
>
> Hi,
>
> On Fri Jul 3, 2026 at 12:07 AM CEST, Joachim Eastwood via B4 Relay wrote:
> > From: Joachim Eastwood <joachim.eastwood@gmail.com>
> >
> > The NanoPi M6 board shares most of the features of the R6 boards.
> >
> > Main differences:
> > * M.2 M-key slot with PCIe (Also present on R6C)
> > * M.2 E-key slot with PCIe and USB (from hub)
> > * 1 additional USB 2.0 port from an on-board USB hub
> > * RT5616 audio CODEC
> >
> > Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
> > ---
> >  arch/arm64/boot/dts/rockchip/Makefile              |   1 +
> >  arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dts | 200 +++++++++++++++++++++
> >  2 files changed, 201 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
> > index 761d82b4f4f2..2867830eddf8 100644
> > --- a/arch/arm64/boot/dts/rockchip/Makefile
> > +++ b/arch/arm64/boot/dts/rockchip/Makefile
> > @@ -218,6 +218,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-evb1-v10.dtb
> >  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-gameforce-ace.dtb
> >  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-indiedroid-nova.dtb
> >  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-khadas-edge2.dtb
> > +dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-nanopi-m6.dtb
> >  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-nanopi-r6s.dtb
> >  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-nanopi-r6c.dtb
> >  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-odroid-m2.dtb
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dts b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dts
> > new file mode 100644
> > index 000000000000..64448bf55cf7
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dts
> > @@ -0,0 +1,200 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +
> > +/dts-v1/;
> > +
> > +#include "rk3588s-nanopi.dtsi"
> > +
> > +/ {
> > +     model = "FriendlyElec NanoPi M6";
> > +     compatible = "friendlyarm,nanopi-m6", "rockchip,rk3588s";
> > +
> > +     sound {
> > +             compatible = "simple-audio-card";
> > +             pinctrl-names = "default";
> > +             pinctrl-0 = <&hp_det>;
> > +
> > +             simple-audio-card,name = "realtek,rt5616-codec";
> > +             simple-audio-card,format = "i2s";
> > +             simple-audio-card,mclk-fs = <256>;
> > +
> > +             simple-audio-card,hp-det-gpios = <&gpio1 RK_PC4 GPIO_ACTIVE_LOW>;
> > +
> > +             simple-audio-card,widgets =
> > +                     "Headphone", "Headphones",
> > +                     "Microphone", "Microphone Jack";
> > +             simple-audio-card,routing =
> > +                     "Headphones", "HPOL",
> > +                     "Headphones", "HPOR",
> > +                     "MIC1", "Microphone Jack",
> > +                     "Microphone Jack", "micbias1";
> > +
> > +             simple-audio-card,cpu {
> > +                     sound-dai = <&i2s0_8ch>;
> > +             };
> > +
> > +             simple-audio-card,codec {
> > +                     sound-dai = <&rt5616>;
> > +             };
> > +     };
> > +
>
> [...]
>
> > +&i2c7 {
> > +     clock-frequency = <200000>;
> > +     status = "okay";
> > +
> > +     rt5616: codec@1b {
> > +             compatible = "realtek,rt5616";
> > +             reg = <0x1b>;
> > +             clocks = <&cru I2S0_8CH_MCLKOUT>;
> > +             clock-names = "mclk";
> > +             #sound-dai-cells = <0>;
> > +             assigned-clocks = <&cru I2S0_8CH_MCLKOUT>;
>
> s/I2S0_8CH_MCLKOUT/I2S0_8CH_MCLKOUT_TO_IO/ ?
>
> See these links for details:
> https://lore.kernel.org/linux-rockchip/DJGDSS875DDO.22TYPVYK5X8KZ@cknow-tech.com/
> https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git/commit/?h=v7.2-clk/fixes&id=946352b2f88fd2378f0341312e47dff1e8dc2fac

Thanks for the feedback and pointers.
I will use I2S0_8CH_MCLKOUT_TO_IO for the next version.

Grepping through the other boards there doesn't seem to any other users
of I2S0_8CH_MCLKOUT_TO_IO right now. But I assume the other boards
will be converted over later(?)


best regards,
Joachim Eastwood
