Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795179864;
	b=ArMJTQrzPlpEpZxf/SIumVuWcRF6hwS1JKMk2pQQNDUhSSlhQxVzXfiFQJiCiMOMseh4
	 HdiYRMndc+lTdcQ3h7zfO7aSbOmQYXLorLVEfjTSArBQwJ1RdjzWbn3fiDpyDDvbgV00O
	 f/B+PpwoIeJbmBxWKw84TDDeYVhUE61Xs7t8S1GW1KPqH9zputHNEyrx8WaXMNpFxR/IB
	 QbmKNS/hJk2k/1vOFJsflBVS/YFXPq5pQqva4OcebAFxzSheB33jeQWPOr2IqIGh/f1Em
	 GuOvo5Re4tyJyP9KTME8uvy+9+nJs9gEw7hn/XgToJO4iCQ+wP7M1LZkT43xi3UiknQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795179864;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=+h9WanPVyW95i/jM7vLnjP8yYqwXvUbwgQl9DDxnzh0=;
	b=dGFiq7BCEr1ze0p0mTsGvazdT/j9Bsac5KT5QeBTGQ37TCs9FDw+rSFQG2a/9wqcR0mI
	 d2jT01s5cCLKH/HMPN5neVzQ1+9hmBPJxBb1bw8iqEkWQ0bPgHmh25C5F/Lx1V9+fdnSv
	 VV6D7DyYIuNRajTrk0Aw56YHs8lXkpa47OrrtQvI97SmrdihTZzgrI/6DmI9Ulau3YHek
	 jW3PnpVuegeD88kCuDJrsbYg+Oc4hhrKrI8nPeRHgw6XtZEN9YeKo0uykWrsSv9a0w95D
	 uC8ya1qhlVe4Lu1wI96AKKdFgfpmj6hi4bFxUVdYHsKmnttRayUfgMexEgDQZ3PiXpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.176
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A36606A326
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:04:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99A36606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8b4c685c751so7348917b3.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 05:04:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795179863; x=1795784663;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+h9WanPVyW95i/jM7vLnjP8yYqwXvUbwgQl9DDxnzh0=;
        b=fpo/di/AAUR+qTluK1J8RL1B85pfg5x9VG912skpccgoG42CumBWw2MLzGxyUhwJw0
         ACMb45TooRrfIbzD6al2iQ7AvqFsKFgBKFtm1Y7ayPgC7MYeh+ZvR3iYLzybEwOz5n/+
         WJ8JBRD0NetWL3HMDPqdVkgw16/9Azcyk+JhMItIZaNDsWtYwn9MTCF1oAwP2aG77Ofi
         gMV85tZ50XYppax5O+mpO04+7OD+oMFPSQufto5kPB7lkhx1qBslnTO5iHxQd8TN/aBq
         C6R8rBP8OESnGRhoUtUFXm+SO7z+mnVHx1M5PPBaS7YndsSB5lTJkNSSVBb9nlWu3WKS
         d3Eg==
X-Forwarded-Encrypted: i=1; AL+hErHRTV1KVvHVZCKqRhi5j9VbJy149/9HhdSyHxcc6sHtwAdUIs5DhuWOWrT16RLf8sFSppLDS1Kt0hJa@vger.kernel.org
X-Gm-Message-State: APuU4Z82kGUzir1VkyvxHYZIoRC/qcC5qhlIeFuzNeI/4kDBeCrngO6v
	JRK4BBbqGFwNOh627Ho835jNGemdR+pELb30tSnackV3HNdF+mumZE4HaVZ+9D/6
X-Gm-Gg: AZFdTZc+YfcZkPavTACD6zauXNuiC1W95fhn8aqYZUWhUHUW1vuI7oNK+G/ArdYMaxn
	Qd344pZ0+yNBq50sFw5S4Dcfd7buJRPu+uICPxhnhRdcIrakTqaGU0h0sEvcVtImNKIn7MrDrYR
	pyDhpz1L+20URKA4xjBNgcg7GW9xpULR9IP2XeQwFNjrDyN33NXbTSJlc2r682zhQv+ZTKq4Bvr
	LFA/F3l2D8sVOnSId++HmDO3YE8Ot1ulcd+qmujLi8KfEhFRDkaYUVZukI4c+h1IHmrDHUDIuOs
	01iiX0xUk67vOrI87WNoairoJVRv/CtYCkzQAa2DqEQ113/6Rr4+IbY29Zj5EIqXGhb/X69mnHI
	CVqp92jaM8PP6EhxQp9rbJKsF2KRS2w+LTMRPJXcGe3sdjyrj59lgJG6cQyG5Lh2myFRIJHEo2Z
	tepJWA4Whddy9GsTNyIsHgBYkrYvLWGc2M7zZuHUpXW+BCXC8tdCruc9RX2F3JKsnUXJFJn87u5
	xrz2o4DDQmT90Ea15ul7rYWjTnqrOv0TfCBp1GiwBkV63QH8PvjxqVYoQA17RO05kpc2dWxjhhN
	BLYfb6Ns2RS1tZdRhKl5OhDq+yWxdi48evK90OASA/r7lS165uxRjrqvZQTeoKEr7joZjTs=
X-Received: by 2002:a05:690c:4b8f:b0:8b0:e10d:1975 with SMTP id 00721157ae682-8b520435695mr11159347b3.29.1795179863499;
        Fri, 20 Nov 2026 05:04:23 -0800 (PST)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b52033f7c0sm12347097b3.40.2026.11.20.05.04.23
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 05:04:23 -0800 (PST)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5c9e7731b34so617076e0c.2
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 05:04:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFc88uk5mFIQU6DER2FEZ89wuZIziGlQLW1sTI77Gxt3AkEdU4mZvVysdPyxrZUBCGAK3qEKxoE193c@vger.kernel.org
X-Received: by 2002:a05:6122:488e:b0:5ee:415e:3f41 with SMTP id
 71dfb90a1353d-5ee8af0e00bmr1534352e0c.7.1795179863003; Fri, 20 Nov 2026
 05:04:23 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-sdhi_rzg3l-v1-0-ca30b209615d@bp.renesas.com> <20261112-sdhi_rzg3l-v1-2-ca30b209615d@bp.renesas.com>
In-Reply-To: <20261112-sdhi_rzg3l-v1-2-ca30b209615d@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Nov 2026 14:04:12 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUKe9XBEzJjGq756FBh_7KxWTm65zTzCYG_ciKeJ+pGWA@mail.gmail.com>
X-Gm-Features: Aa3M54qZmgJNvwjJpvCbf1Dypm4EnLng6ZEIN-JT-GreMyTUTy4luuL7Zr9nQ7c
Message-ID: <CAMuHMdUKe9XBEzJjGq756FBh_7KxWTm65zTzCYG_ciKeJ+pGWA@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: renesas: rzg3l-smarc-som: Enable SD/eMMC
 on SDHI0
To: Biju Das <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Thu, 12 Nov 2026 at 19:48, Biju Das <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add support for enabling SD card or eMMC on SDHI0 on the RZ/G3L SMARC
> SoM. The selection between SD and eMMC is controlled by the
> SW_SD0_DEV_SEL macro in the board DTS, which must match the position
> of switch SYS.1 on the SoM. By default, eMMC is enabled.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi

> +
> +       sdhi0_usd_pins: sd0-usd {
> +               sd0-cd {
> +                       pinmux = <RZG2L_PORT_PINMUX(5, 0, 8)>; /* SD0_CD */
> +               };

> +       sdhi0_usd_uhs_pins: sd0-usd-uhs {
> +               sd0-cd {
> +                       pinmux = <RZG2L_PORT_PINMUX(5, 0, 8)>; /* SD0_CD */
> +               };

With s/RZG2L_PORT_PINMUX/RZG3L_PORT_PINMUX/g:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
