Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 003403CC334
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 18:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784918594; cv=none; b=Tv9MAb9Dll21Dsjk3a3iHo7Moc1/Xx1GnuxShM6ujVcU8oPESn9doNotKh7jzZcR4v4EpyAEJGGiRfi8ceP7OcFZJhgcVAwet/grkLrS4HVjgXjnF1kDzy6QnUATAS6wBI2Va6iQSCRt291tsm6uUzIxMB4VVzSwPynDIKERdXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784918594; c=relaxed/simple;
	bh=AQMfvkE7D8thReUS22q5UTdV5lxuBu8JX0NKtnpOPpI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IudIWpHmFXD33lZ0HBvh4hbGQsYafw+cDAEI/Qtbw7LWuvsqur2E4jDoObbQd6WSKPRJo1GwYUmxjZ4Dt/1O3qs1g14oSPwZGQ/tHudhk96CnK0uL5uHFlB7Z9799kezSiOsHzpBl+TqMVP9pmm9negmhEvlKOrlW8xsujSO6ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HOdw6h5C; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HOdw6h5C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 283A21F000E9;
	Fri, 24 Jul 2026 18:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784918587;
	bh=7+4k+SWPAbf27RtWcic4jc+LDQaafX4PgMtsy+chol0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HOdw6h5CmwXl5HCXkuLQfhNssla6tUdQt0dgqjgS6I5RZJcF/Z0YKwzj/NKo2Xgcp
	 crISXqugW91bHiuciWRWqTQsrGnm1gmbjb9vfTOLeIN2RZcn7QJRhYYdMzaQgwLhqG
	 pKRudj+OpcDncVmmn0ugIFWPNcFZmGf0YEB61CcStPi++vGuU3aBxyuH9zmk+ZkQ6H
	 xEfitY4jtsaVlNOX07ycatFl1LZt+U/YQHkngAFrS3Z0NY07A65/eORhn1MgZkvntr
	 urw0Yggljq2vWLhAg4qrGL4uglcX/jWryxR16w8ylarErAvne8e2wVeP7ANmsaOFcy
	 r2ZroCDRASxKQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] serial: 8250: Add Airoha SoC UART and HSUART
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260724183007.188172-3-ansuelsmth@gmail.com>
References: <20260724183007.188172-1-ansuelsmth@gmail.com>
 <20260724183007.188172-3-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 18:43:06 +0000
Message-Id: <20260724184307.283A21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] 32-bit arithmetic overflow during baud rate calculation before ass=
ignment to a 64-bit variable.
- [High] Calculated baud rate divisor `xyd_x` exceeds its 16-bit register f=
ield for high baud rates, causing silent truncation.
- [High] Failure to enforce 32-bit I/O access causes the 32-bit custom baud=
 register write to be silently truncated to 8 bits.
- [High] Incomplete initialization of the `rxtrig_bytes` array breaks sysfs=
 configuration and writes invalid trigger states to the hardware.
- [Medium] Premature integer division in the baud rate calculation amplifie=
s fractional truncation errors.
- [Medium] The custom baud rate calculation hardcodes a 20MHz crystal clock=
, bypassing the framework's clock frequency synchronization.
--

--- Patch [2]: [PATCH v2 2/2] serial: 8250: Add Airoha SoC UART and HSUART =
support ---
commit 19616a2ff2ea1d768e60b410919225285f078ea9
Author: Christian Marangi <ansuelsmth@gmail.com>

serial: 8250: Add Airoha SoC UART and HSUART support

Add support for Airoha AN7523 UART and AN7581 HSUART. These implement a
standard 16550 UART with only some custom logic for baud rate handling.

> diff --git a/drivers/tty/serial/8250/8250_airoha.c b/drivers/tty/serial/8=
250/8250_airoha.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/tty/serial/8250/8250_airoha.c
[ ... ]
> +static void airoha_set_divisor(struct uart_port *port, unsigned int baud,
> +			       unsigned int quot, unsigned int quot_frac)
> +{
> +	const struct airoha_8250_clk_div_info *clk_div_info;
> +	struct uart_8250_port *up =3D up_to_u8250p(port);
> +	u32 xindiv_clk;
> +	u64 xyd_x, nom;
> +	int i;
[ ... ]
> +	/*
> +	 * Calculate XYD_x and XINCLKDR register by searching
> +	 * through a table of crystal_clock divisors.
> +	 */
> +	nom =3D baud * XYD_Y;

[Severity: High]
Since baud and XYD_Y are both 32-bit integers, will this multiplication
overflow for standard baud rates (like 115200) before being assigned to the
64-bit nom variable? Should one of the operands be cast to u64?

> +	for (i =3D 0 ; i < ARRAY_SIZE(airoha_clk_div_info) ; i++) {
> +		clk_div_info =3D &airoha_clk_div_info[i];
> +
> +		xindiv_clk =3D XINDIV_CLOCK / clk_div_info->div;

[Severity: Medium]
This logic relies on a hardcoded 20MHz XINDIV_CLOCK macro. Does this bypass
the framework's clock frequency synchronization, and should it use
port->uartclk instead to respect the clock-frequency Device Tree property?

> +		xyd_x =3D div_u64(nom, xindiv_clk) * 16;

[Severity: Medium]
Does performing the integer division before multiplying by 16 discard
fractional data too early and amplify truncation errors? Would
div_u64(nom * 16, xindiv_clk) preserve better precision?

> +
> +		/* For the HSUART xyd_x needs to be scaled by a factor of 2 */
> +		if (port->type =3D=3D UART_PORT_AIROHA_HS)
> +			xyd_x /=3D 2;
> +
> +		if (xyd_x < XYD_Y)
> +			break;
> +	}
> +
> +	serial_port_out(port, UART_AIROHA_XINCLKDR, clk_div_info->mask);
> +	serial_port_out(port, UART_AIROHA_XYD,
> +			FIELD_PREP(UART_AIROHA_XYD_X, xyd_x) |

[Severity: High]
For high baud rates, can xyd_x exceed 65535 when it exits the loop? If so,
does FIELD_PREP() silently mask the oversized value to fit into the 16-bit
UART_AIROHA_XYD_X mask, writing a truncated and incorrect divisor to the
hardware?

> +			FIELD_PREP(UART_AIROHA_XYD_Y, XYD_Y));
> +
> +	/* Restore normal register access. */
> +	serial_port_out(port, UART_LCR, up->lcr);
> +}
> +
> +static int airoha_8250_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	uart.port.dev =3D dev;
> +	if (device_is_compatible(dev, "airoha,an7581-hsuart"))
> +		uart.port.type =3D UART_PORT_AIROHA_HS;
> +	else
> +		uart.port.type =3D UART_PORT_AIROHA;
> +	uart.port.flags =3D UPF_BOOT_AUTOCONF | UPF_FIXED_PORT |
> +			  UPF_FIXED_TYPE | UPF_IOREMAP;

[Severity: High]
Is uart.port.iotype =3D UPIO_MEM32 missing here?

Without enforcing 32-bit I/O access, if the Device Tree omits=20
reg-io-width =3D <4>, the port defaults to UPIO_MEM. This causes the 32-bit
register writes in airoha_set_divisor() to use 8-bit writeb() accessors,
silently truncating the configuration.

> +	uart.port.set_divisor =3D airoha_set_divisor;
> +	uart.port.get_divisor =3D airoha_get_divisor;
[ ... ]
> diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/825=
0/8250_port.c
> index e94a0802cbddc..13abfb471d185 100644
> --- a/drivers/tty/serial/8250/8250_port.c
> +++ b/drivers/tty/serial/8250/8250_port.c
[ ... ]
> @@ -311,6 +311,22 @@ static const struct serial8250_config uart_config[] =
=3D {
>  		.rxtrig_bytes	=3D {1, 8, 16, 30},
>  		.flags		=3D UART_CAP_FIFO | UART_CAP_AFE,
>  	},
> +	[UART_PORT_AIROHA] =3D {
> +		.name		=3D "Airoha UART",
> +		.fifo_size	=3D 8,
> +		.tx_loadsz	=3D 1,
> +		.fcr		=3D UART_FCR_ENABLE_FIFO | UART_FCR_R_TRIG_01 | UART_FCR_CLEAR_R=
CVR,
> +		.rxtrig_bytes	=3D {1, 4},

[Severity: High]
Does leaving the trailing indices of rxtrig_bytes uninitialized (which
implicitly become 0) break sysfs configuration?

When the user requests 4 bytes, bytes_to_fcr_rxtrig() checks
bytes < conf_type->rxtrig_bytes[i]. 4 < 4 is false, and it will fall
through to evaluate 4 < 0 for the uninitialized indices, eventually returni=
ng
an undefined hardware state.

Should this array be fully populated with monotonically increasing values,
like {1, 4, 4, 4}?

> +		.flags		=3D UART_CAP_FIFO,
> +	},
> +	[UART_PORT_AIROHA_HS] =3D {
> +		.name		=3D "Airoha HSUART",
> +		.fifo_size	=3D 128,
> +		.tx_loadsz	=3D 128,
> +		.fcr		=3D UART_FCR_ENABLE_FIFO | UART_FCR_R_TRIG_01 | UART_FCR_CLEAR_R=
CVR,
> +		.rxtrig_bytes	=3D {1, 4},

[Severity: High]
The same uninitialized rxtrig_bytes issue appears to be present here as wel=
l.

> +		.flags		=3D UART_CAP_FIFO,
> +	},
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724183007.1881=
72-1-ansuelsmth@gmail.com?part=3D2
