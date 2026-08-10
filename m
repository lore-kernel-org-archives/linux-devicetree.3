Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5AD3E3159
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 13:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786368458; cv=none; b=lZ+CsZ4PXQ2cTvx/oN32XxrccoBX94ixjvBvBF7AvcBYn9v9XTerMf67NW+1QkjFQYVGg2kzoU9uJzmSbEWK5Y9K2qdTqge0G3xZ4MQuCuCGk42U3tRMqnLYTgouraD2d3wcZBGMkI0PW9OYLNY5rJF7BDfynOmMm/iLDQBLN1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786368458; c=relaxed/simple;
	bh=Gnbgl5mVqU8mPNjloFHOEKfL1fuKrUPNCeupq4lYc2g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tNOD8YwGOxgda9K2b/Ng7K8CRKM8zJ6Vf1Y0wuQKREqpBCJD0Y4X6rHKrstNOxxJL9A2VzJXKoYY0pncdwNZwvaSyL708+nfRCinhONiK64KdgPMZnrpyaEKtn2x36IUg9V9Wgameb2Jbh8nV6nwgYxqtrnbIfvwOGtnKO+NCmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-76535268562so326531137.3
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 06:27:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786368456; x=1786973256;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0ZsTm0/auSNz1xVWhqZv/iaOuFzdnIG6fJxjzkxEKlg=;
        b=fr7WePsgJowZbNXTRyBOmB+DC3nmT0JxOR1ftBMhFHL/N/KuEQAhvYdrLrBMzQwJA4
         bacnfyr3klg+9idq7feG3Iyv7w5uTYUamKU6VXmVi4ZLxzscSlNwlZuH9/A6tkaZLjzS
         J7z4Nd9+OxZoAdcKF7clILWdrUmbc/q/g3ptsS8z3G9xEnmxHSUeBiDXFcqXo+mIvxC2
         lXGwX4ToESOUZxUs/NE3fJa2udGSrj9GxdFOlOvwQSIoEifMFfBL0EfjVYJgkmsKC51G
         JJYiS1ojM3Y0tNYgeaniMPjurAyTkJ80B0jWRbgU7j7T/yLsqWOaw9e8WowbGFhg0aGj
         ZFJw==
X-Forwarded-Encrypted: i=1; AHgh+RrX28GhFQXiUZostHGnaVshbC+9/6lgmoLHNFhS65rB7XBK65w0cjw5VcPqY+dl82o6a8tvVY90AVQS@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf9EWO5jFUY8Y9WROQC/bN4U26aaMOXbWuvuMJ1uUxXpgL1VZz
	8CW+3ArEaiN6yVq0ksFQIuE4URTshe6EIb3GgeA0rNnNHI3ltoAHwAuFmAWnHJhH
X-Gm-Gg: AR+sD12rBHAnCso5ag7Vq32pMlZb64MvZCwtU0Glr1nMtJCTTSaKBg82uW3KlPNLruf
	rMLje2eZBLYv4PyTe6TPGXWZ/RQzPQ/5rXmtq97vb0Lcy6mJxDDiev6rMpwFhwCzqJ8xdA4/z3S
	ooLMP/fXJ0u68F+gsvcvPz4vv3vevHVGdcNQJa5w7KAIBXNttbIr5P9B62BrKBN8jAZpPrp0D9/
	KZiWMbP/EL5GmkCjnq3DCyJVEKorWrehgQdH4WmZPTphDEUW/alCBW2NUvhJjaRS52mtGR8tMX4
	++KNWRswhIM16kYhYK8nAgWnh6/sGw/jWmJNT60hKX6UyE3/xTYkOw9uC6sBDVZNA0ypCn7b96d
	EacM5XD96ZIhEJj9jY//duAGfER3mdksDsL08JtWwNJ9HVlW1P0ujauvjJHPbVpAU5nvNcvV30m
	SZRIZHb5M7VgrbDzco0hgublf/R/gsdEuTHN0tW6PCms3SrGEtJbPvrYuyV9oY7viGQc4KhuTVJ
	kQknFK/uWT1RrmM8AjpHAFHCQ==
X-Received: by 2002:a05:6102:4490:b0:73e:605c:405c with SMTP id ada2fe7eead31-768e8849024mr273098137.12.1786368456160;
        Mon, 10 Aug 2026 06:27:36 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-979f2e53fb5sm3511438241.1.2026.08.10.06.27.35
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 06:27:35 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-977cf5cae50so286684241.0
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 06:27:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp74XxhPLTdo+xDgVo+RhfJJIxoxfKOdfYBlWUh+r984Vym4xsnmgeSq5AjmG8W5R77wt1So+PNuduq@vger.kernel.org
X-Received: by 2002:a05:6102:54a9:b0:726:cd42:d023 with SMTP id
 ada2fe7eead31-768e8119d22mr300436137.11.1786368455456; Mon, 10 Aug 2026
 06:27:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260716095935.13329-4-wsa+renesas@sang-engineering.com> <20260716095935.13329-6-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260716095935.13329-6-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Aug 2026 15:27:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWCWvfFqBAQ40E+czhYHSG_ZuCqMobku6B2iEA8ezF5Cg@mail.gmail.com>
X-Gm-Features: AUfX_mwFov1LfQMLFyyS19GgkrQ9UqEK9GUp4WPrAZqURgAWlGHiGBnolK35VVM
Message-ID: <CAMuHMdWCWvfFqBAQ40E+czhYHSG_ZuCqMobku6B2iEA8ezF5Cg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ARM: dts: renesas: r9a06g032-rzn1d400-eb: enable
 GPIOs on CN12
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Thu, 16 Jul 2026 at 11:59, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> CN12 offers some GPIOs independently of switch settings. Add the nodes.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> --- a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts
> +++ b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts
> @@ -53,6 +53,11 @@ led@1 {
>         };
>  };
>
> +&gpio2b {
> +       pinctrl-0 = <&pins_gpio2b>;
> +       pinctrl-names = "default";
> +};
> +
>  &i2c2 {
>         /* Sensors are different across revisions. All are LM75B compatible */
>         sensor@49 {
> @@ -132,6 +137,17 @@ pins_eth2: pins-eth2 {
>                 bias-disable;
>         };
>
> +       pins_gpio2b: pins-gpio2b {

pins-cn12?

> +               pinmux = <RZN1_PINMUX(164, RZN1_FUNC_GPIO)>,
> +                        <RZN1_PINMUX(165, RZN1_FUNC_GPIO)>,
> +                        <RZN1_PINMUX(166, RZN1_FUNC_GPIO)>,
> +                        <RZN1_PINMUX(167, RZN1_FUNC_GPIO)>,
> +                        <RZN1_PINMUX(168, RZN1_FUNC_GPIO)>,
> +                        <RZN1_PINMUX(169, RZN1_FUNC_GPIO)>;
> +               drive-strength = <6>;
> +               bias-disable;

These pins don't have any external pull-ups, so disabling bias will
make them pick-up random EM noise when left unconnected.

> +       };
> +
>         pins_mdio0: pins-mdio0 {
>                 pinmux = <RZN1_PINMUX(150, RZN1_FUNC_MDIO0_GMAC0)>,
>                          <RZN1_PINMUX(151, RZN1_FUNC_MDIO0_GMAC0)>;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
