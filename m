Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574BE3290D9
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 15:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786377159; cv=none; b=pMD1EM1o6ixqLGvacujCs6TqCYOMoz6uCF1YEZRqrBYe46SuuLo9xJ6mrqr0iWkJ39VWasl9mp2P6sswYcdKZmLHGRvEPDdJigLQnVEQ95o52VQms2L/sMmNRsXdr8Y3N8Bz6dE0uB0lI6i0d/I1NY+VisrmnCKB6bwDIrz0gJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786377159; c=relaxed/simple;
	bh=oQC7tAxGpxTUt5g77bLpt7ZJnZq9nke0iMu+YzrNsaE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RubK+Kx9f/e6LI4gxFl9JVgLgWBaRuNh8flnf96DOzeyDcJXpx7D8nlSICUFwqBE/Ll4JKt6Ysftcm4UpEf8IE9I8yWZ/AfLd1cx8GyfqWM/sV9cHsHJFXm5loXiCuUMB7qdqKxIBBglSdDkliPnFzhCIKq8HF7W+7FFTKSQxlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jLBz+Sy3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jLBz+Sy3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 573431F000E9;
	Mon, 10 Aug 2026 15:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786377158;
	bh=vJwMEo14I7N/wfdG1okCOKdr88jV5HqDpFW2My3Y0YQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jLBz+Sy3MDzqG9l6fExR3Taj85L+ZYv0ItO10t/gfhULEIbABFWBcRbPUAwHRlDXe
	 r+00l+ihWid94J/kiPI51s1067PQMHyU7aSxuMZoy/C1BKz2IJv+L0XjpEs29wCxEO
	 d9aXQQa7ReFlMffJtjr5PmT+Y3gMSSRN6JXlbYXNkM9fnCdwRHg4mns2G1nOrZuCyo
	 wOrj9bAdG3PiwI/bvq8760BuSsjrLBccu43nQTTOaLbfeAsQMneAToRW8aEF9bY5Ar
	 o1CT2WciU6Cz8pJTeBYnst16X35Bln99TyAJkMSLnOWgNAe/Mx/+jDKIowWdLguXl3
	 7hkQxy5jkuXIQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/3] serial: 8250: Add Airoha SoC UART and HSUART
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260810152636.658955-4-ansuelsmth@gmail.com>
References: <20260810152636.658955-1-ansuelsmth@gmail.com>
 <20260810152636.658955-4-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 15:52:36 +0000
Message-Id: <20260810155237.573431F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Deadlock (if console) and Log Flooding (if non-console) via unrate=
limited dev_err() under port lock
- [High] Silent probe failure or mismatched baud rate validation due to uni=
nitialized port->uartclk
- [Medium] Driver squats on global UAPI port type namespace
- [Medium] Incomplete rxtrig_bytes initialization sets undefined hardware s=
tate and breaks sysfs reads
--

--- Patch [3]: [PATCH v5 3/3] serial: 8250: Add Airoha SoC UART and HSUART =
support ---
commit 5a2afaf1ec03e067e37973b1f2ee37f044a204f9
Author: Christian Marangi <ansuelsmth@gmail.com>

serial: 8250: Add Airoha SoC UART and HSUART support

This commit adds support for Airoha AN7523 UART and AN7581 HSUART. It provi=
des
a standard 16550 UART driver with custom logic for baud rate handling.

> diff --git a/drivers/tty/serial/8250/8250.h b/drivers/tty/serial/8250/825=
0.h
> index 77fe0588fd6bd..e6b2b94312292 100644
> --- a/drivers/tty/serial/8250/8250.h
> +++ b/drivers/tty/serial/8250/8250.h
> @@ -73,6 +73,12 @@ struct serial8250_config {
>  	unsigned int	flags;
>  };
> =20
> +enum uart_port_type {
> +	/* Internal 8250 only */
> +	UART_PORT_AIROHA		=3D 124,
> +	UART_PORT_AIROHA_HS		=3D 125,
> +};

[Severity: Medium]
Can this driver safely use these values without them being allocated in the
global UAPI header?

The port->type values are part of the global userspace UAPI, defined in
include/uapi/linux/serial_core.h, and are exposed to userspace via the
TIOCGSERIAL ioctl. Since the highest officially allocated port type is 123,
assigning 124 and 125 internally rather than in the UAPI header risks a fut=
ure
collision.=20

If a new generic serial driver is legitimately assigned 124 in the UAPI
header, it will silently collide with UART_PORT_AIROHA, causing uart_config
array index collisions and userspace misidentification of the port type.

[ ... ]
> diff --git a/drivers/tty/serial/8250/8250_airoha.c b/drivers/tty/serial/8=
250/8250_airoha.c
> new file mode 100644
> index 0000000000000..fe72a39561c28
> --- /dev/null
> +++ b/drivers/tty/serial/8250/8250_airoha.c
[ ... ]
> +static void airoha_set_divisor(struct uart_port *port, unsigned int baud,
> +			       unsigned int quot, unsigned int quot_frac)
> +{
> +	struct uart_8250_port *up =3D up_to_u8250p(port);
> +	u32 xindiv_clk;
> +	u64 xyd_x, nom;
> +	int div_bit;
[ ... ]
> +	/* Couldn't find a valid xyd_x */
> +	if (div_bit < 0) {
> +		dev_err(port->dev, "failed to find suitable clock divisor for baud %u\=
n",
> +			baud);
> +		return;
> +	}

[Severity: High]
Is it safe to call dev_err() here?

This function is invoked via serial8250_do_set_termios() with the raw
spinlock port->lock held. If this port is the active serial console,
dev_err() invokes printk(), which synchronously calls
serial8250_console_write(). The console write function will attempt to
acquire the exact same port->lock, resulting in an instant self-deadlock.

If the port is not the console, the error is unratelimited. This allows a
local user with write access to the TTY device to spam the kernel log by
requesting unsupported high baud rates via the TCSETS2 ioctl in a tight loo=
p.

[ ... ]
> +static int airoha_8250_probe(struct platform_device *pdev)
> +{
> +	struct uart_8250_port uart =3D { };
> +	struct device *dev =3D &pdev->dev;
> +	struct airoha_8250_priv *priv;
> +	struct resource *res;
> +	int ret;
[ ... ]
> +	uart.port.mapbase =3D res->start;
> +	uart.port.mapsize =3D resource_size(res);
> +
> +	ret =3D uart_read_and_validate_port_properties(&uart.port);

[Severity: High]
Does this code need to initialize uart.port.uartclk before parsing properti=
es?

The hardcoded divisor logic in airoha_set_divisor() relies on a 20 MHz
crystal (XINDIV_CLOCK =3D 20 * HZ_PER_MHZ). However, uartclk isn't explicit=
ly
set before or after calling uart_read_and_validate_port_properties().

If the device tree omits the legacy clock-frequency property (e.g., using t=
he
modern clocks property instead), uartclk remains 0. This causes
serial8250_register_8250_port() to reject the port with -EINVAL, resulting =
in
a silent probe failure.

If the device tree specifies a different frequency (like a 100MHz APB bus
clock), the serial core will bound baud rates based on that incorrect
frequency. This would allow unsupported high baud rates to reach the hardco=
ded
20MHz divisor logic, repeatedly triggering the deadlock or log-flooding iss=
ue
above.

[ ... ]
> diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/825=
0/8250_port.c
> index e94a0802cbddc..11728a789922d 100644
> --- a/drivers/tty/serial/8250/8250_port.c
> +++ b/drivers/tty/serial/8250/8250_port.c
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
> +		.rxtrig_bytes	=3D {1, 4, 4, 4},
> +		.flags		=3D UART_CAP_FIFO,
> +	},
> +	[UART_PORT_AIROHA_HS] =3D {
> +		.name		=3D "Airoha HSUART",
> +		.fifo_size	=3D 128,
> +		.tx_loadsz	=3D 128,
> +		.fcr		=3D UART_FCR_ENABLE_FIFO | UART_FCR_R_TRIG_01 | UART_FCR_CLEAR_R=
CVR,
> +		.rxtrig_bytes	=3D {1, 4},

[Severity: Medium]
Will this partially initialized rxtrig_bytes array break sysfs reads?

The rxtrig_bytes array is 4 elements long, but only two are initialized her=
e,
leaving the remaining elements as implicitly 0.=20

When a root user configures a trigger level > 4 via
/sys/class/tty/ttyS*/rx_trig_bytes, bytes_to_fcr_rxtrig() iterates over this
array checking bytes < conf_type->rxtrig_bytes[i]. Because the uninitialized
elements are 0, the condition evaluates to false, and the function returns =
an
undefined trigger state (UART_FCR_R_TRIG_11).

When sysfs later tries to read the value via fcr_get_rxtrig_bytes(), it will
fetch 0 from the array and return -EOPNOTSUPP. Padding the array with
identical maximum values (e.g., {1, 4, 4, 4}) like the standard Airoha UART
would avoid this.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810152636.6589=
55-1-ansuelsmth@gmail.com?part=3D3
