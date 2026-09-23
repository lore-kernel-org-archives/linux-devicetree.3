Received: from mail-yx2-f43.google.com (mail-yx2-f43.google.com [74.125.224.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EBA83F1640
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 14:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790175552; cv=none; b=G81YANegpZacnKjGpDmsHMw+R997ztTXXFGWzmHzoHgMKyKVdWz7rHeT1PMSH5coE0Lo4AATLlUPYodaZOPfymSQO+tQvg3IfKtLqgmMiEeaI4lM7//q9/gccBUxSRh67kVgpn4dCCGxmNCBTCqYA7//zcFLUULsJm8QFEHnMfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790175552; c=relaxed/simple;
	bh=AfFgK5O94TRbSz0v+n2agZrfGhkoCKVuFplQhBhnZO0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tMO8/DnNCFoX6iJnZO/Dlrg2A6JpzzhrX1DLa4Bk/7DhIf+wjRoOXZdH6SsWvOMKryhdR9tJX6hTAxZALaXYol0rWO+/QTaB2NQF6sPsph9KTpwzO/c7LdZjC7AWyjj9jsMtx+hICv0Nul3UQEqrgqxDmFcY29P6d3Rvl83bKCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.224.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx2-f43.google.com with SMTP id 00721157ae682-85d43db0c17so16343767b3.3
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 07:59:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790175546; x=1790780346;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OTVINLgc5+4Z1oNwbQRG/rtTEB6pkVDW8ACRGjhrMlE=;
        b=pTAAkMt25xqnG7k5HHe4P0s+WpWKu1ATQ/cNZuMP7D6rzR2aBF4wnERZ9UxqqrjLXV
         o+4M0itzF9j/vCUXW05pa06A1koy5xUlalX1k7L6Q1Xrq2rZM/m00C5e8Mb6zrhsZSpD
         msPtboQfaX00Yy9GTqcbf6vMimDiQBr+gqcLBCcqMKOo9LAJPPTmkSQ/5JcwUlcZzX1t
         2zM+Wg4yY+1stKaYjbAPm6S5Ba9x7oOozP7kLw7zD4aPrFB1FzTEU51WKOx3HZhEwgk0
         ACGdOWaK0CUdOJKXNKVlGuhmbV7j8Eq35r8c89foq3l+PRiprHZYfrfzJS8WRCQuR3vz
         /k+Q==
X-Forwarded-Encrypted: i=1; AKwUvBxfPuij9ujbfI8DnMycWJ1v3lnLPGjDJ9H7wlifFQ9DeBbE7BicEVZAzTtR68Esy599yDzUouulU3tM@vger.kernel.org
X-Gm-Message-State: AFuF++mWnl49GbFnzKCxACarB9S7fy5wbQV7202CH3qdec+S9Yp/Jc4C
	Mbf6hJ5KiENy8Y5ATx2jVKaPdPwtybQQaxoQ9wUGrfh5m2Qg+gtflYxQARqXZD0Eq8w=
X-Gm-Gg: AYBFou2UbIgxidg9QfZekTimi9RymzmFJyTWYbL43jxQBgE/u9TUw/C5iCe8qeKo/g/
	fa+ZMZQw+EBpjvjCJkXl8hcXQar63Dt/kT3Ehwk5cuRrRrUz9MLCLMYoKUmsQnbyemafoo9gzfG
	RKPde+g1kldQG/hP7nFJRAUd6a5bb1+a6EXEzU7rtnSoW4bsLTm9uXxFDOiHfeyUtRb+A4p2Tdk
	74IeX1ZRSjDiu4kOyBm9rkOEkvCixl6P2AsI1dU4/dHNrpq8dR61ckEisZyoMnyhKxIzLQIXtXo
	DE+XKULM91cRjQM7jVVv0NXEhjcUL/jj0HHAzfthcorac3gpuZjDwCHy+RWcZL/zjHGpa0n4H9l
	nLJPcfyfspQr4HPN7rxBD1eo2+cfrkfpwPp/R90lFFQprV/ehCr5YrERo4NDVTT2lzXUxlEsm3J
	83PA8LPr15x65f07O0H1soK1BdSwZU6ewm7/zIeB+edY0uGAWWHTBJ4WnV1acofDdI8zCqqt9my
	RM03+B7xt08eh2ofXcZPDjOVmS5s+qO3t8SOQ==
X-Received: by 2002:a05:690c:6b01:b0:873:5c6b:a310 with SMTP id 00721157ae682-8a45c07ddd5mr15507667b3.62.1790175545571;
        Wed, 23 Sep 2026 07:59:05 -0700 (PDT)
Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com. [74.125.224.140])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a466ab7e7csm10588727b3.44.2026.09.23.07.59.05
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 07:59:05 -0700 (PDT)
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66e4ab20f4bso1292571d50.0
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 07:59:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwVnlQ74TsC2TfJ/6iIME5ak2ETtBbs2G9b1Vr+iQv0QGZWqgYHPO6G8nlqqGvzH5YIwURfRrJRwKGl@vger.kernel.org
X-Received: by 2002:a05:6102:370a:b0:7a7:3485:33ea with SMTP id
 ada2fe7eead31-7ac1db33f0dmr2430482137.19.1790175126732; Wed, 23 Sep 2026
 07:52:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-rzg2-sr-boards-v8-0-94c4674927e8@solid-run.com> <20260904-rzg2-sr-boards-v8-6-94c4674927e8@solid-run.com>
In-Reply-To: <20260904-rzg2-sr-boards-v8-6-94c4674927e8@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 16:51:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV5HkURikoQjpm_tw7qnHfGbLFtug4nBMgO7vEtpyjA2g@mail.gmail.com>
X-Gm-Features: AclHuK-gsUhfafKUl3WYFPzbbNPmdS5PRweR7PwdMXMcSw8FWUkpxbAv7z94Jqg
Message-ID: <CAMuHMdV5HkURikoQjpm_tw7qnHfGbLFtug4nBMgO7vEtpyjA2g@mail.gmail.com>
Subject: Re: [PATCH v8 06/11] arm64: dts: renesas: add support for solidrun
 rzg2lc som and hb-iiot evb
To: Josua Mayer <josua@solid-run.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benjamin Bara <benjamin.bara@skidata.com>, 
	Linus Walleij <linusw@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Jon Nettleton <jon@solid-run.com>, Mikhail Anikin <mikhail.anikin@solid-run.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Josua,

On Fri, 4 Sept 2026 at 13:56, Josua Mayer <josua@solid-run.com> wrote:
> Add support for the SolidRun RZ/G2LC SoM [1] on HummingBoard IIoT [2].
>
> The SoM features:
> - 100Mbps Ethernet with PHY
> - eMMC
> - 1/2GB DDR
> - WiFi + Bluetooth
> - SDHI Mux switching between eMMC and Carrier Board
>
> The HummingBoard IIoT features:
> - 3x USB-2.0 Type A connector
> - 1x 100Mbps RJ45 Ethernet
> - USB Type-C Console Port
> - microSD connector
> - RTC with backup battery
> - RGB Status LED
> - 1x M.2 B-Key connector with USB-2.0 + SIM card holder
> - 1x DSI Display Connector
> - GPIO header
> - 2x RS232/RS485 ports (configurable)
>
> The RZ/G2LC SoM was designed to be pin compatible to G2L SoM, with
> slightly reduced feature set.
>
> Descriptions for eMMC, microSD, and RS485 are shared with G2L.
>
> [1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2lc-som/
> [2] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2l-iot-sbc/
>
> Signed-off-by: Josua Mayer <josua@solid-run.com>

Thanks for your patch!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-iiot.dts

> +&eth0 {
> +       phy-handle = <&phy0>;
> +       pinctrl-0 = <&eth0_pins>;
> +       pinctrl-names = "default";
> +       /*
> +        * ravb driver does not configure mac internal delays for RZ/G2L(C),
> +        * instead delays are added by the ADIN1200 phy driver.
> +        */
> +       phy-mode = "rgmii-id";
> +       status = "okay";
> +
> +       phy0: ethernet-phy@0 {
> +               reg = <0>;
> +               /* Level interrupts are typical for phy but not supported on rz/g2l gpios. */

Nit: "RZ/G2L" (in all patches)

> +               interrupts-extended = <&pinctrl RZG2L_GPIO(27, 0) IRQ_TYPE_EDGE_FALLING>;
> +       };
> +};

I didn't compare with the board schematics, but the rest LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
