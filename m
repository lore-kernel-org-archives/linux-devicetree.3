Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13F63DDAF9
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 07:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785138715; cv=none; b=FNuxlNZQ7nEjwlpORcxBFownUII4cxHlBhk6XDL2wZUcybeJYZJ0r0FRMO9GdEtSO13ZWTVXIOSXYNTLRgCySMSDaeDIIIxs5BBH76sJ30pHa7QPIxQa7hIz753+u3ytJWDgRsAWoHbNroM2R8eZ4HLp05xphbntyLEpfiOmIUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785138715; c=relaxed/simple;
	bh=MG18BmVmTJ68dCHbleeZDtF/cEq/+5yCeWr/UZ4uQQs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EjbYGvIcwFMJV4qkay3Dy1f2+QToxIM6RajcVI0SbjKQ255Azu1vaFFrPP38cGAdE1kLehbCyDqHylL+aOOSNBZhLb5N0ucXZS9kxub+Yf5aStJtFMWF7cK8IfROfQfx0pU9serVmk8JO9WdrKYwHVXDgMAz9kHv9MlIbw8wjrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=doRwLRfA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="doRwLRfA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F9111F000E9;
	Mon, 27 Jul 2026 07:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785138713;
	bh=pV5pyB5oVlqCLjFS/72rNo3McapBHDfe/3IJpJCnY3w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=doRwLRfAgfxR3mfzaAQa6izjADcOevoxPi/J3YxIrQJs188r6wzFO9W2nhcbX3RRK
	 YqkzHyY2vB1+MdGrAV5iVEOo0dewD/cHQdgvvVjz28gJQvvU72rQzTVg0lrpz8UQIE
	 ibaHv+7S7i38NgLD54o/dlOFRAl6MfI5+fTDA0mH/6ngHIh1pAFiy86D039oiiuth1
	 NbvDOVWzHw5Oyrxj81LZmZIFDzJAR7hm1USsZE05FDnS7bcJMcb+uIqGWg11wgVv/5
	 e3PyFB2y5JqNG4g1qB3tnw65hEoHtbQ9yhljHg9Q5CPxhxLP82bhTS0cUma5lf4/1o
	 ScJOxumA+Q9hw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] serial: 8250_mtk: honor DT serial aliases
Reply-To: sashiko-reviews@lists.linux.dev
To: "Carlo Caione" <ccaione@baylibre.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260727-ccaione-genio-serial-aliases-v2-2-0f2ae41a8e89@baylibre.com>
References: <20260727-ccaione-genio-serial-aliases-v2-0-0f2ae41a8e89@baylibre.com>
 <20260727-ccaione-genio-serial-aliases-v2-2-0f2ae41a8e89@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 07:51:52 +0000
Message-Id: <20260727075153.4F9111F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver registers the 8250 port before enabling runtime PM, vio=
lating TTY subsystem guidelines and causing circular dependencies during pr=
obe.
- [High] An integer overflow in baud rate calculation can cause a divide-by=
-zero kernel panic and incorrect fractional divisor calculations.
--

--- Patch [2]: [PATCH v2 2/2] serial: 8250_mtk: honor DT serial aliases ---
commit 6b60029ee6f08f62cd575815bb6a017e9c0d10a3
Author: Carlo Caione <ccaione@baylibre.com>

serial: 8250_mtk: honor DT serial aliases

The Genio board DTs provide serial aliases for all enabled UARTs, but
the MTK 8250 driver still registered every port with the default line
number. This patch reads the serial alias during OF probe and seeds
uart.port.line before registering the port so the 8250 core reserves
the requested ttyS slot.

> diff --git a/drivers/tty/serial/8250/8250_mtk.c b/drivers/tty/serial/8250=
/8250_mtk.c
> --- a/drivers/tty/serial/8250/8250_mtk.c
> +++ b/drivers/tty/serial/8250/8250_mtk.c

[ ... ]

> @@ -575,6 +576,10 @@ static int mtk8250_probe(struct platform_device *pde=
v)
>  #endif
> =20
>  	if (is_of_node(fwnode)) {
> +		line =3D of_alias_get_id(pdev->dev.of_node, "serial");
> +		if (line >=3D 0)
> +			uart.port.line =3D line;
> +
>  		/* Disable Rate Fix function */
>  		writel(0x0, uart.port.membase +
>  			(MTK_UART_RATE_FIX << uart.port.regshift));

[Severity: High]
This is a pre-existing issue, but while looking at mtk8250_probe(), I notic=
ed
a potential circular dependency during port registration.

Further down in mtk8250_probe(), the driver registers the 8250 port before
enabling runtime PM:

    data->line =3D serial8250_register_8250_port(&uart);
    if (data->line < 0)
        return data->line;

    data->rx_wakeup_irq =3D platform_get_irq_optional(pdev, 1);

    pm_runtime_set_active(&pdev->dev);
    pm_runtime_enable(&pdev->dev);

During port registration, the TTY core may synchronously invoke the driver's
pm() callback, mtk8250_do_pm(). If that callback invokes pm_runtime_get_syn=
c()
before runtime PM is initialized on the device, it can cause blocked tasks =
and
hung worker threads.

Could this be fixed by moving pm_runtime_set_active() and pm_runtime_enable=
()
above the call to serial8250_register_8250_port()?

[Severity: High]
This is another pre-existing issue, but I noticed a potential integer overf=
low
in the baud rate calculation inside mtk8250_set_termios():

    } else {
        serial_port_out(port, MTK_UART_HIGHS, 0x3);
        quot =3D DIV_ROUND_UP(port->uartclk, 256 * baud);
    }

If a custom baud rate of exactly 16,777,216 is requested, does the 32-bit
arithmetic in 256 * baud overflow to 0? This would result in a kernel panic
due to division by zero in DIV_ROUND_UP().

Additionally, a bit further down in the same function:

    fraction =3D ((port->uartclk  * 100) / baud / quot) % 100;

Does port->uartclk * 100 overflow on clocks larger than 42.94 MHz, leading =
to
incorrect fractional divisor calculations?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727-ccaione-ge=
nio-serial-aliases-v2-0-0f2ae41a8e89@baylibre.com?part=3D2
