Received: from mail-vs2-f42.google.com (mail-vs2-f42.google.com [74.125.227.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 881C8445AE3
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 17:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789407774; cv=none; b=SwpYoNUNdgmJhlNqmV50ASBeS4bEoW+6zrgUcZZitBrJuU9GVk616ceLdWCezQBGoej4pXnHBMLREWo5eMGbOLcA9y9WlXfjyG21IPs3zjS7QyVbALuxBEViYZGULtNM8oeac8eIpyHPZfGAACo85f1bTapocNsf2hHlOHDyW+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789407774; c=relaxed/simple;
	bh=+izH8riELWSAMprbT5C678K1jl8pB7zXElojauJucHg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RBwPRqUgxsPRUV4dcznf7TEe3YEhe+TOODmQrIQLDwInEi9FETD1Bcs8g9iQQJPv+C6uQOh7HquwhxB+LEYW5rlGB+rK9HRXKiphHqptMSQCviBJKAfMlvGvbMUoSIUA6WWUiSZkf4nB5vQRRp0Ml4uqjJhvxYE2uRVHrCtj7JQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f42.google.com with SMTP id 71dfb90a1353d-5c8319dd4a5so938412e0c.1
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 10:42:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789407771; x=1790012571;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gjfZXacAwr82/eq+UL7cs88Dit/YxtI5ifxFAg8Xa84=;
        b=cdpM2wgP/3xwRLFIxDzF9IgfvMkf616ILRA9W4NIUdzUyro5/ValUV3ZOS2Rb7vir0
         9ENgZt4l7xZP7C/79bM8zbJBp4hNTzi8HMFPodAuTtWdpBQuzHixdqtOMts8wl1ITipI
         Sthf0tgcPRZBOT66ASFvX76qoXA6xK4S6Q18z704KcWMFCm/1gxPudUSh/UQg+cTNiYf
         esqzzB7RyiZZ4Co3QN96EQZd1zegUg8qKfdMUHyIf6Fd7NYezefwJguJ/3S8x8wZtpCP
         5Rj4WGhyeAAhSu20Sn7+BuODxdpRc5yuCLA7oaJ320QUJ5xdVx++WdTCaUmX14aD2q/x
         ZBcg==
X-Forwarded-Encrypted: i=1; AKwUvBxt7hTNJIDnhsqt8WGwDA90MqlOFaQKjlmUmlYHuZfk7GEuntDRhK5IYBG0xh1iB0KoByCAqtGB7/RU@vger.kernel.org
X-Gm-Message-State: AFuF++l+ZrU+RZBY6Jk1sEY9gGtiWuXbF5kYltH2p12l6ULIiR/LfXIX
	0C+ahbbjUlU/+09AR4GtBBzEM9mASOsWTqUIEJwQGUlOMYjWXgT7h1WPTd99T+K8
X-Gm-Gg: AYBFou0XcC4oTVEhABAZRNM0/uHXQNhuYgAd7wAgPWC7nBWZP2Td0XkGOy93ehGnP7I
	AfXMnKUDUW3Bm6PdGUBMo9lG7E0Asty3CZKe6No9fHoS3y6M4PEbhUnrTTdNu126dSQIYpPiI0U
	XtM5JrarHaImFxeToTtwHySlZwc6jQ0rUDgwswOTPCT7WgGhSYTaD3iF2bNJXbYPEmOwvS8RSuo
	gsJMaj0dFaKQwJ1ckgbeRtBYl3YtjORqYpJjGtK8dqlcaJ9eKVSxSp7UEFa+j7A3zSVxRjWROKW
	4rK76nbT4adR9dJ+Z0aGkYLvfKMUyyK+IG7W3R0V/gaElOhHFg27LE2iISKRQa537S8307z3J4A
	fKzK8FejFqICoHSXLuoWdhr/d9JSIkm8EMRYLWKR1tGl1bP+ZKOZ4++ycMHRHlifAdFLVzhKzbx
	yW4pYLfzNc1FCxdeT/v0XhHxEgHgLy422K7nA7LvpcXgb65Xaq/WtuLlhCE3D1yhVr8qVL30mwl
	B/8nyiR9aW/UroxqvjBaesk5l2affYbqAOXka0=
X-Received: by 2002:a05:6122:8cc:b0:5bd:71b1:d5c6 with SMTP id 71dfb90a1353d-5c981b4a790mr4925618e0c.4.1789407771059;
        Mon, 14 Sep 2026 10:42:51 -0700 (PDT)
Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com. [74.125.226.204])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c8470ae511sm12770218e0c.5.2026.09.14.10.42.50
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 10:42:50 -0700 (PDT)
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e7c62dde2so732039241.2
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 10:42:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBztLaLP7txByWMmhKCeAnF7u834EUqa8zgx9O0/w8cASGQv4T55mui0HXg0Az1y2JggUk4tDazJfQRv@vger.kernel.org
X-Received: by 2002:a05:6102:54a9:b0:789:5f54:2367 with SMTP id
 ada2fe7eead31-79b579b0d38mr4032527137.4.1789407765732; Mon, 14 Sep 2026
 10:42:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788943229.git.tommaso.merciai.xr@bp.renesas.com> <34a6d23e309aab5fbf369132d75794222097396d.1788943229.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <34a6d23e309aab5fbf369132d75794222097396d.1788943229.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 Sep 2026 19:42:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUYC2m3YgayTrCvZHoTVkj4v+7a5cvO1g=UFxR+6dJiJw@mail.gmail.com>
X-Gm-Features: AcwNN1XJ1dIjrp16s-r0VgwKaAicGc_4VU9cyLbRu-FG27nHPGFdbzVolc0-zaM
Message-ID: <CAMuHMdUYC2m3YgayTrCvZHoTVkj4v+7a5cvO1g=UFxR+6dJiJw@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] arm64: dts: renesas: r9a09g047e57-smarc: Enable
 USB2.0 support
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Tommaso,

On Wed, 9 Sept 2026 at 10:55, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Enable USB2.0 support on the RZ/G3E EVK board. The USB1B_1A_HOST and
> USB5_4_HOST connectors support host operation only, while USB0_OTG
> supports both host and peripheral operation.
>
> renesas-smarc2.dtsi is shared by all boards based on the RZ SMARC
> Carrier II Board. USB2.0 is not yet supported on the RZ/G3L SMARC
> EVK, so disable the common USB2.0 nodes in its board DTS until proper
> support is added.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
> @@ -298,6 +298,28 @@ sd1-data {
>                 };
>         };
>
> +       usb20_pins: usb20 {
> +               ovc {
> +                       pinmux = <RZG3E_PORT_PINMUX(0, 0, 12)>; /* USB20_OVRCURN */
> +                       bias-pull-up;
> +               };
> +
> +               vbus {
> +                       pinmux = <RZG3E_PORT_PINMUX(0, 1, 12)>; /* USB20_VBUSEN */
> +               };
> +       };
> +
> +       usb21_pins: usb21 {
> +               ovc {
> +                       pinmux = <RZG3E_PORT_PINMUX(G, 6, 12)>; /* USB21_OVRCURN */
> +                       bias-pull-up;
> +               };
> +
> +               vbus {
> +                       pinmux = <RZG3E_PORT_PINMUX(K, 3, 12)>; /* USB21_VBUSEN */
> +               };

While these two signals are wired to the SLG46108, which generates
USB1_EN_OC# from that, the latter does not seem to be wired on the
carrier board (SMARC_MODULE_CN P67)?

> +       };
> +
>         usb3_pins: usb3 {
>                 pinmux = <RZG3E_PORT_PINMUX(4, 1, 12)>, /* USB30_VBUSEN */
>                          <RZG3E_PORT_PINMUX(4, 0, 12)>; /* USB30_OVRCURN */

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
