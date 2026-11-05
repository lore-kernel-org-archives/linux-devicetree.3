Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793840952;
	b=Y+SKAbRy+n2j/J3oAn/tQPsrqXOYTRzkORPvjfHNXc6S9VjnjkWvlBeBSouvile77Qw+
	 9ZDOYcFWezKxPYvEy+Rku3PE8qTnXOMzkfKGf3gN/wYq5Pwe82L/rMwJFywvp7a42hsmA
	 cua8mHJzrPwGjhgfA6S+EsyrKlSZrzBIlDYjqW7C5KJMKCMrNtOmKrs0IAC1N/lfH+mLI
	 Ja5e7gJu+gyLQiRA/VWI4pGIpGQY6xh/2WP1V/kjlYcOUAY58lQUwZUBszX9eEtjgllZ4
	 4e05FEevpoVKaJzLCSQ/JcMWAm6n3t6KXZAHtE3ALUjwT29U5cBkdSACJbyT1PjepIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793840952;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=CQurrROuzFaL/bzIbqErWOb2Vd+DZtt8rcZK18O3FYQ=;
	b=bvG3GSRvIFDdi1qyG/myubOoFTAP0U4M+6Vvwp1KHAJK4LQCxNEOrIj4Zh+i+JlzrGLy
	 tAsIrkRtaeWwDyZ0ikiyL3N89kZ+FXoAWdgREsDy6Lpl9BRyZRx+LsvA2qV5dD6rA4k2/
	 DgoBLfD9D3pHx3A0LXFyBe4EzUDqy5/lXQc+3Un1nzuWQ6K15U7h3lYrMKvKlzu+AbPRj
	 alIwhVN7xwBQG2u7aneygDLvrrEaA0EUXVcHud/S9LXcgvAGxQ9Z0m05n18qtB0yvAOku
	 MgJoZO7o2ifBI8UH6kIIDdjVGqOGkWRAM1iwNlh4g1xuIE6lilCKAChnKmG4xAGlHIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DEAC606A326
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 01:09:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DEAC606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3adac5c10e3so866221a91.0
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 17:09:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793840951; x=1794445751;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CQurrROuzFaL/bzIbqErWOb2Vd+DZtt8rcZK18O3FYQ=;
        b=IvOq8UumLVoBcVfYayMUQAu6l137CCNRzsf2sE4BnyVRYQVmS3o9gSSVYvDPEncvHd
         cl5z/UbLvRaPnK+7w3U9XeBOq2KPfIHGAps2L1Z+xUyX2wwOR1GZafHI89CX/4H9Lj1W
         IwqAP5GSi+J4zdKSjltivZLVYJKaeqnZnshfhHlL5yBjdWM12aXKvggeNKpnvDcFIyZF
         jQoDxRb4Rzb1TNyy1UpA9C4I0XcaCiy4FoFmGLYBlM9bgHw0mhl5mdHh3TWXqeINTNRX
         CIMz37TYgwI92XuMdXhk609Km+jutTjp/P7xr43ezusI72V16P5j2q9mlv+clxMmwbSI
         QdJg==
X-Forwarded-Encrypted: i=1; AKwUvByTILjBHqXjmCYnPKHGN2hl1HafeREXfmi1ECM+QPsTwy/9YzW0iRfTWKO7C7+covf/Q7pikXeS8LAS@vger.kernel.org
X-Gm-Message-State: APuU4Z+JguH4HHjWmJbyPtP97ASc2t+tBhlbRJvScgZgun94NuSq1fsS
	vtdP/MB0nazZSjOW2J481AtwaX33ROmXqIdqrexoyzTddvey1oub3exe3YVJS6lz
X-Gm-Gg: AYBFou3MtBgHz8mqJcm0e4/COCXfbxyTJnI59S6qHctODmewqI30MyFDXHBW+Dcz4DB
	ByUJsABEW/hEr4gkYkOGUp4k6M54MZotg/Dq/nol2rPsCTmXmcxHRIFsubzlwztlOrxQPkyEQsQ
	MUTCl7VUanJyHhGfRbCjVhNvHThX3vRBrs/2Rs7Y37sK7NbkS9EI2+c8euLC4jsiF7BbsFvWWB0
	YR6zIYt6JT3PlgGNqXYvreRnKppPzJCQWmBCz8bOfPPMXslUZGJfmJCVv2gQqUqZoMTCA0oThSJ
	yzxmfFtJyb0bScAx6on1ovK/4+/CgFV7YTwSpiSF7dLiGhRhyWCi8pde+/efSB4bz/7KkvgXder
	Tn2pv4To6ZBe4RnHA6d94ITCsk+gBZABOhlWduuSltkrRYGEMgy20FeRZJucanpKaRySobcnpIB
	MJ4hbn3dSQ9uh+2O53cXxYMURrkCqfVcD7wz0rJWTiysRkHpBS1CA72Z61kBII986gEhhv7QB0r
	VFR6tb3nCjYdeeZ/sj3LajVFDEAXY9bh/KbJ9S5PUIcaXlcuqbpSadisyEALb/yk9y3FJx603B+
	DUiNuT7pjyy80UxhzT5mX1/4AnqANefh/tOQiDSZ7Cs7VlOzD01zqgQ+3eoETAhHtOVDbvOuPGG
	FUoHZmnbfcu69gG+Ci9wJ7yPcvlYQQy4XrivIcRFiGEI=
X-Received: by 2002:a17:90a:ec90:b0:3ab:189b:6981 with SMTP id 98e67ed59e1d1-3ae898311d9mr13885674a91.48.1793840951481;
        Wed, 04 Nov 2026 17:09:11 -0800 (PST)
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com. [74.125.82.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b31f8804sm1034555a91.17.2026.11.04.17.09.10
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 17:09:10 -0800 (PST)
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3514b90bb89so2543728eec.1
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 17:09:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxDGM1FXY3tSqpj9oxxm+z3ILQtxXoICkX7BxxBqNf4ndkrNkeqdBe/t1T0x599uPwX+dP6QgZIqHoc@vger.kernel.org
X-Received: by 2002:a05:693c:6211:b0:36a:1cbc:1093 with SMTP id
 5a478bee46e88-36a42417707mr24317606eec.30.1793840950169; Wed, 04 Nov 2026
 17:09:10 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sf19a2890-sysm-v1-0-a4fac07df823@telaak.dev>
 <20261104-sf19a2890-sysm-v1-3-a4fac07df823@telaak.dev> <20261104-remote-festive-1e6d807ef014@spud>
In-Reply-To: <20261104-remote-festive-1e6d807ef014@spud>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 4 Nov 2026 20:08:57 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ5Q7BJuay6D0F6-yvjruHvOO4UQaP1wHKK9_exbH=hUxw@mail.gmail.com>
X-Gm-Features: AclHuK_2FUPcxo1PWKolFGMOegNvDHrx-kpQJpfPG4duyjujJtN05LYWI2fgwq8
Message-ID: <CAPY4CJ5Q7BJuay6D0F6-yvjruHvOO4UQaP1wHKK9_exbH=hUxw@mail.gmail.com>
Subject: Re: [PATCH 3/4] dt-bindings: clock: Add Siflower SF19A2890 peripheral
 clock/reset managers
To: Conor Dooley <conor@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Chuanhong Guo <gch981213@gmail.com>, Yao Zi <me@ziyao.cc>, 
	linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> This binding looks like things that we often see that are actually
> incorrect models of the devices in question - things that should be a
> syscon but not implemented as one. I'd like to see what the actual dts
> for this device looks like before signing off (or really even reviewing
> this at all). Given how the clocks look, it is probably accurate but I
> wanna be sure.

The dts is a separate series I'm holding until the bindings settle. In
it, each manager is a node like this one:

uart_crm: clock-controller@19e24c00 {
compatible = "siflower,sf19a2890-uart-crm";
reg = <0x19e24c00 0x10>;
clocks = <&clk CLK_MUXDIV_PBUS>, <&clk CLK_MUXDIV_PBUS>,
<&clk CLK_MUXDIV_PBUS>, <&clk CLK_MUXDIV_UART>,
<&clk CLK_MUXDIV_UART>, <&clk CLK_MUXDIV_UART>;
#clock-cells = <1>;
#reset-cells = <1>;
};

with twelve of them, at 0x19e04400 (gmac), 0x19e08000 (wlan24),
0x19e08800 (rf), 0x19e0c000 (usb), 0x19e0c400 (wlan5), 0x19e24400 (i2c),
0x19e24800 (spi), 0x19e24c00 (uart), 0x19e25400 (pwm), 0x19e25800
(timer), 0x19e25c00 (wdt) and 0x19e2b400 (gpio).

You may well be right. I dumped the first 256 bytes of each block from
U-Boot: all twelve have the same four registers at 0x0-0xc (reset, clock
gate, one I have no documentation for, and bus output enable), and five
have more past that: the GMAC's interface and RGMII delay registers at
0x40-0x4c, the USB PHY's at 0x40-0x8c, one register at 0x50 in each WLAN
block, and two at 0x48 in the SPI block. So each block looks like a
small system controller for its peripheral, with the clock and reset
manager at its start.

If that should be one syscon node per block, providing the clocks and
resets and holding the peripheral's control registers, I'll restructure
the binding, the GMAC glue and the USB PHY that way. I can also post the
dts series now if that helps.
