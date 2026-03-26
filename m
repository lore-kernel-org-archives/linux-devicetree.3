Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A054B34751C
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 09:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774517995; cv=none; b=q6kJ/zjGGkWekmpMmiYjLE7rhDgq80J6F2e93Wrg1fugyc8mRwWbnlIQcZfQrOtQXcW5qPqYNkpRTCX1RJ1u6dV2f4SPFSzDHNltco86nbC1uhh5Nzb6+agdAOFAxRiAUnQ8DkfS4l6goY9n/1gL8Hctp2efRX9CKQ5jv0ZXMQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774517995; c=relaxed/simple;
	bh=NHnYSCMjp5Qx3uMp5MnlrpoU7A33CYHQ5+y0W37sU9Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YKk41cYSkOe2rVpZ+7xPmHxmeKFDOxttpVrNekS+q+ANKjjI2X9IAP2Scdt40Sbk1Il1jl/L6CbqMyEstcV4JBWv7UI5Y7ZK5NV/2YvfzAChtoVkUk2V60qZuXsEiHxRrlIa5ceqOxlfCPOLOpOOdaVDMKAj4XWpDJYL47QUH24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-56cd842b60bso603610e0c.0
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 02:39:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774517992; x=1775122792;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XXnNgBS8N4ydCp7t00RsBmSBBKjjNhTVmD71YiQWvSU=;
        b=N6x18p+t5WWZWrU2W2TpRC0BcmRxtb4U1sYQ+mkTSfcQJPwyhej3HPrNH99gJ4N6WB
         p76Nz2XfG0tgrt917uazV+Bclt4tuqApOfFOBxX5lHCz1YJquAWjEWNmYtnzaa2zmU8P
         ADKNHOlnnvsCuA/OQZ7KtS5WtrXS+ETkYmxD1KW3NxOOsqI6+T+CBEmQoHtbN8WJDUyr
         pa1mRPeber58dmwN0KDf2SDjfwbk4p4LC/gSQNYkdEA7KqzUDL/ir0guxMUrKqfR2ajG
         dsjqtZgSYNGfOGJ6O3no6jXgM7JCTvLLzIpWEGxcuVP11iIAyqdppFlgZzk678l4Nbfo
         WsPw==
X-Forwarded-Encrypted: i=1; AJvYcCWG0Cp93SzAYYCe5luwfE5RfFfNEgYFnfQHbaua0g+Cr9XJz+b0zaewPKEzsr3ryIFki+Oh846kMf+W@vger.kernel.org
X-Gm-Message-State: AOJu0YxZtkCPdvFgEIj1bRGpkmT3Mz5DkgFerNzNtRAXmn6Vz3gt+nOg
	DxzMFpfFd3ZD6mulUn4iOrqXYSoQgBNSe3+Vwb9dbkr/rbWoG3SKlBNO0WOFQh3GaKI=
X-Gm-Gg: ATEYQzyFESU+VzRRTkxEVd5cfr8vRqEZLWscFh6/3AakKMp107W3Npg+3iR+Bhxf9Vs
	5Z/W4kA3KfpCljg7T4zw+uQ3rQYyh7Ih2mlKaAv8/lpNhlxvVFHiHK1/oG3D6/zomRSypOKZdn5
	UZz/kEJYdVa6DRJ7qnN7J6Mtkfi7iL7gqX5A0ct2aV8rvEpvyBnE2rO04dLChJqqodBpRlRBLe7
	7guy7oHY/+ruODuzXM9QtbecqTy7TdP7HgqfuT2fA5tnTRYgy1HiZzSGjbi7NollJVFYsiLxYY3
	m0cFb9LOJf/apPAol05FpBkF8roqtyFP5ei3hbPJKBLsLzZx/TD5gZlPVVXGhLTO63gFffUs+F/
	dp/4K3qH3bXiVKuBE9+DzJsKEsPTbZrjwjrR7XkiRORIUwd6RVnD6NZrZD4O21RnA+b4cuVxMMH
	3C23MD8hmZZAJbOK1idjJUiSgoShlFJwxZuqn76HUu7R9h2Vw6R4psneZSgg+q0Yj+
X-Received: by 2002:a05:6122:513:b0:56b:1eb:d396 with SMTP id 71dfb90a1353d-56d220d0d3amr3475402e0c.14.1774517992572;
        Thu, 26 Mar 2026 02:39:52 -0700 (PDT)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-951be185991sm3007231241.6.2026.03.26.02.39.51
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 02:39:51 -0700 (PDT)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-56ce07a54e8so570082e0c.2
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 02:39:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVPWu7KnmAhbmy2yzwStA1pEEY0D/+vurwvnIyg0eqo4xtsTfS3wo2DVCq9Sr9znf9rehqM9nJuFsSs@vger.kernel.org
X-Received: by 2002:a05:6122:a22:b0:56c:c76f:1bb0 with SMTP id
 71dfb90a1353d-56d2207b027mr3161587e0c.9.1774517991567; Thu, 26 Mar 2026
 02:39:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203131048.421708-1-biju.das.jz@bp.renesas.com> <20260203131048.421708-11-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260203131048.421708-11-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Mar 2026 10:39:38 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUEW0+qFTG_VikJ3YnA13+ki5uzA0w4HC=13DOwKEJgDQ@mail.gmail.com>
X-Gm-Features: AQROBzAkkx7uK68_pBJG5VkSb1IDNDxV2iKw2QNetnGau0d1sNmy4UGKBV4TPp4
Message-ID: <CAMuHMdUEW0+qFTG_VikJ3YnA13+ki5uzA0w4HC=13DOwKEJgDQ@mail.gmail.com>
Subject: Re: [PATCH v2 10/10] arm64: dts: renesas: rzg3l-smarc-som: Enable
 eth1 (GBETH1) interface
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Tue, 3 Feb 2026 at 14:10, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Enable the Gigabit Ethernet Interface (GBETH1) populated on the RZ/G3L
> SMARC EVK. Also add pincontrol definitions for GBETH{0,1}.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi

> @@ -53,3 +69,79 @@ phy0: ethernet-phy@7 {
>                 txd3-skew-psec = <0>;
>         };
>  };
> +
> +&mdio1 {
> +       phy1: ethernet-phy@7 {
> +               compatible = "ethernet-phy-id0022.1640",
> +                            "ethernet-phy-ieee802.3-c22";

Drop the latter?

> +               reg = <7>;
> +               rxc-skew-psec = <1400>;
> +               txc-skew-psec = <1400>;
> +               rxdv-skew-psec = <0>;
> +               txdv-skew-psec = <0>;

txen-skew-psec?

> +               rxd0-skew-psec = <0>;
> +               rxd1-skew-psec = <0>;
> +               rxd2-skew-psec = <0>;
> +               rxd3-skew-psec = <0>;
> +               txd0-skew-psec = <0>;
> +               txd1-skew-psec = <0>;
> +               txd2-skew-psec = <0>;
> +               txd3-skew-psec = <0>;
> +       };
> +};
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
> +                                <RZG3L_PORT_PINMUX(C, 2, 1)>, /* PHY_INTR */
> +                                <RZG3L_PORT_PINMUX(C, 1, 1)>, /* RXD3 */
> +                                <RZG3L_PORT_PINMUX(C, 0, 1)>, /* RXD2 */
> +                                <RZG3L_PORT_PINMUX(B, 7, 1)>, /* RXD1 */
> +                                <RZG3L_PORT_PINMUX(B, 6, 1)>, /* RXD0 */
> +                                <RZG3L_PORT_PINMUX(B, 0, 1)>, /* RXC */
> +                                <RZG3L_PORT_PINMUX(A, 2, 1)>, /* RX_CTL */
> +                                <RZG3L_PORT_PINMUX(B, 5, 1)>, /* TXD3 */
> +                                <RZG3L_PORT_PINMUX(B, 4, 1)>, /* TXD2 */
> +                                <RZG3L_PORT_PINMUX(B, 3, 1)>, /* TXD1 */
> +                                <RZG3L_PORT_PINMUX(B, 2, 1)>, /* TXD0 */
> +                                <RZG3L_PORT_PINMUX(A, 3, 1)>; /* TX_CTL */
> +                                power-source = <1800>;
> +               };
> +       };

Please spin adding EHT0 pin control off into a separate patch.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
