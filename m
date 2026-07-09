Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D358F4499AC
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 21:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783631948; cv=none; b=KrOHkSFKmQEySh98PuDtkYJHlQievm/moym/z3j9AkFLnwrtNftZw4a7zbhAStAjM27BgRnOPZHoT50Vc1aZWmQ/KN0wfKguSI13zmZls2otjtACcZJibh/+FNh8OQ/kOqIQNoiWPVtaoCPGgfMpYNDIbuUp9/5JZzIHzut3sdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783631948; c=relaxed/simple;
	bh=Cg6dzRUahhSfNttpjl9sjCKnwypxg4Ix18MNm4PRD3I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cpU6AoYcIawy+lBhASdEnKYyAc4LFmetB/7thVgGAEuA/nICJ1EmiJHCxStOgV7UdsKcEuYAsnrvTZciLollkf3dwzOm0UoO2xKJ+uN3i4/Mi5agOcl/28W5d6th6r+9Fd9k4cVNzT+DyOrSIMJWnPsR1tDGmDXntiuV4T3rRQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a9cG8Zal; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a9cG8Zal"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2A811F000E9;
	Thu,  9 Jul 2026 21:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783631946;
	bh=Be5Dgwj32lBg9wYKemNqnHPnr5/TigdmF9E9lCiwaSs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=a9cG8ZalIH63d/Y3mvo786/ygJK+LRDshUEdJvQD5LOiGPn7CmJZ6/ataCbPZrtKc
	 sqfVo2fac92fx5c7AOdxPX2Vx2VCVgMynN+wGrObJqcAnNbN/f9wOcc8Xonuo0pWQq
	 Knj54rX+y8mM2Wvnf28jA5p1deTiQwmEeM0P5TW0ERrlbuqxfgh0fZXuRPin/6E631
	 uqFiDshURtqobKCJkOgdWWs6nLJnqFu3aawxNNDTFlw/eP+IX1TqNJGKEKqsHqRYMH
	 rnxnYjbvI8BbXLRM+doeg+hL0FbHv5JUrhPdUczRStoddFJ6rORXdTVt0vPvtkHA2h
	 TwZkZ80GVSgvw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] serial: 8250: Add Airoha SoC UART and HSUART
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260709205656.319531-5-ansuelsmth@gmail.com>
References: <20260709205656.319531-1-ansuelsmth@gmail.com>
 <20260709205656.319531-5-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 21:19:05 +0000
Message-Id: <20260709211905.E2A811F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Hardware registers are accessed without holding the port lock, cau=
sing a critical race condition with interrupt handlers.
- [High] Integer overflow and out-of-bounds truncation in custom baud rate =
calculation.
- [High] Missing NULL pointer check for device_get_match_data() result.
- [Low] Unused static const arrays (dead code).
--

--- Patch [4]: [PATCH 4/4] serial: 8250: Add Airoha SoC UART and HSUART sup=
port ---
commit 787398b7c15179f8d67914a09402fbd411a20806
Author: Christian Marangi <ansuelsmth@gmail.com>

serial: 8250: Add Airoha SoC UART and HSUART support

This commit adds support for Airoha AN7523 UART and AN7581 HSUART.
These implement a standard 16550 UART with custom logic for baud rate handl=
ing.

> diff --git a/drivers/tty/serial/8250/8250_airoha.c b/drivers/tty/serial/8=
250/8250_airoha.c
> new file mode 100644
> index 0000000000000..9ec98cd8de438
> --- /dev/null
> +++ b/drivers/tty/serial/8250/8250_airoha.c
[ ... ]
> +static const struct airoha_8250_clk_div_info airoha_clk_div_info[] =3D {
> +	{ .div =3D 10, .mask =3D BIT(2) },
> +	{ .div =3D 4, .mask =3D BIT(1) },
> +	{ .div =3D 2, .mask =3D BIT(0) },
> +};
> +
> +static const int clock_div_tab[] =3D { 10, 4, 2};
> +static const int clock_div_reg[] =3D {  4, 2, 1};

[Severity: Low]
Are these arrays used anywhere in the driver? It looks like the implementat=
ion
relies on airoha_clk_div_info instead, making these dead code.

> +
> +/*
> + * Airoha UART baud rate calculation logic
[ ... ]
> +static void airoha_set_termios(struct uart_port *port, struct ktermios *=
termios,
> +			       const struct ktermios *old)
> +{
> +	const struct airoha_8250_clk_div_info *clk_div_info;
> +	struct uart_8250_port *up =3D up_to_u8250p(port);
> +	unsigned int xyd_x, nom, denom;
> +	unsigned int baud;
> +	int i;
> +
> +	serial8250_do_set_termios(port, termios, old);
> +
> +	baud =3D serial8250_get_baud_rate(port, termios, old);
> +
> +	/* Set DLAB to access the baud rate divider registers (BRDH, BRDL) */
> +	serial_port_out(port, UART_LCR, up->lcr | UART_LCR_DLAB);

[Severity: High]
Does this sequence leave the port registers unprotected?

Looking at serial8250_do_set_termios(), it acquires and then releases the
port lock. Modifying UART_LCR here to set the DLAB bit without holding the
port lock leaves a race window.

If a UART RX or TX interrupt fires concurrently, the interrupt handler
(serial8250_handle_irq) will acquire the port lock and attempt to read UART=
_RX
or write UART_TX at offset 0. Since DLAB=3D1, offset 0 becomes the UART_DLL
register, which could lead to silently overwriting the baud rate divisor or
reading corrupted data.

Additionally, does this access registers without an active runtime PM refer=
ence?

> +
> +	/* Set baud rate calculation defaults (BRDIV ([BRDH,BRDL]) to 1) */
> +	serial_port_out(port, UART_AIROHA_BRDL, UART_BRDL_20M);
> +	serial_port_out(port, UART_AIROHA_BRDH, UART_BRDH_20M);
> +
> +	/*
> +	 * Calculate XYD_x and XINCLKDR register by searching
> +	 * through a table of crystal_clock divisors.
> +	 */
> +	for (i =3D 0 ; i < ARRAY_SIZE(airoha_clk_div_info) ; i++) {
> +		clk_div_info =3D &airoha_clk_div_info[i];
> +
> +		denom =3D (XINDIV_CLOCK / 40) / clk_div_info->div;
> +		nom =3D baud * (XYD_Y / 40);
> +		xyd_x =3D ((nom / denom) << 4);

[Severity: High]
Could the calculation for nom silently overflow on high baud rates?

If baud is very high (e.g., 3,000,000 or 4,000,000 for HSUARTs), multiplying
it by 1625 (XYD_Y / 40) exceeds the maximum capacity of a 32-bit unsigned i=
nt,
resulting in an incorrectly calculated baud rate.

> +		/* For the HSUART xyd_x needs to be scaled by a factor of 2 */
> +		if (port->type =3D=3D UART_PORT_AIROHA_HS)
> +			xyd_x =3D xyd_x >> 1;
> +		if (xyd_x < XYD_Y)
> +			break;
> +	}
> +
> +	serial_port_out(port, UART_AIROHA_XINCLKDR, clk_div_info->mask);
> +	serial_port_out(port, UART_AIROHA_XYD, (xyd_x << 16) | XYD_Y);

[Severity: High]
If the loop terminates without finding a valid divider and xyd_x remains
large, will the left shift of xyd_x by 16 silently overflow a 32-bit integer
here before the write to UART_AIROHA_XYD?

> +
> +	/* unset DLAB */
> +	serial_port_out(port, UART_LCR, up->lcr);
> +}
> +
> +static int airoha_8250_probe(struct platform_device *pdev)
> +{
> +	const struct airoha_8250_data *data;
> +	struct uart_8250_port uart =3D { };
> +	struct device *dev =3D &pdev->dev;
> +	struct airoha_8250_priv *priv;
> +	struct resource *res;
> +	int ret;
> +
> +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res)
> +		return dev_err_probe(dev, -EINVAL, "invalid address\n");
> +
> +	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	data =3D device_get_match_data(dev);
> +
> +	uart.port.dev =3D dev;
> +	uart.port.type =3D data->type;

[Severity: High]
Is it possible for device_get_match_data() to return NULL here?

If a platform device is manually bound via sysfs without a Device Tree node,
it would lack OF match data, causing device_get_match_data() to return NULL.
This would lead to a NULL pointer dereference when accessing data->type.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709205656.3195=
31-1-ansuelsmth@gmail.com?part=3D4
