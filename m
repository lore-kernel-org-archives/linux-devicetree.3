Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B042C2C8
	for <devicetree@vger.kernel.org>; Sun,  9 Aug 2026 12:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786279006; cv=none; b=KgoJnvSAVNk/CEqaV6wRNZcYS4LqACeXwY6DsRvdk1xWazNh0bJsrZ5ZAAji0KRAxiBhAJJ6pWuz8JVg73t18E91lvDdaUlRj5eJdJeVuRcZcLPeQdHjrnQfBBAZqPSqBhD3DHmafZjqdW3yzya8EGZeNJYTlq8GI3V2U4U/lTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786279006; c=relaxed/simple;
	bh=u8+bUW2r3tZinU/Np8OkGKJmJdMv51gkNuOv80tWZuc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bcxMaylWOSgMODHModvsd4gc++NdBLu6o3+NuE0c8WAmujHiWtR69FvoIp4/3a96HypHQDttlPrze186LqDIX/q9n8HlVGDPNINmNvOG/Tpo+9jIVavJjJivijYf14Fm3cBjH9DSj7l2FDsCtp/kM9/CMLoYjtsh7s0sm83vDiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oB67eX33; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oB67eX33"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C98371F000E9;
	Sun,  9 Aug 2026 12:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786279005;
	bh=dXLoba1/8avAAI+aUsJUQjXg0Nt1JY80TcgMPYeINwg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oB67eX33c3MEMlZviisxXsHgr1O81mz7MS8yDGbM5knQ5YKx2N3SV8GfIDU3Wj9U2
	 JFPqDxPxzeuJHEwLhWKy6h9gJZowxyv5x4fVn5Cm6xImpoHkt0tXAiFQg+eHrgeUf4
	 +lg79NQqRJUjIG/8BkzMu/3/rigF8yRm1dMZ1kRdiZoKG+wbWqOWs93ubNmomKzK9/
	 sT5WqiH/OTh7rqjOIysI8ZApqovHqimV1rT1UkN/60/HTahgq+j7uz5ZHvefWKpNi2
	 237E8WKjeVIcuKyIag4NB3DjS+jJoaFLpL+TIgeEnwSAcyPhVN8z6nLvkroaXG0etQ
	 8S52Rj1D59ESw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] serial: 8250: Add Airoha SoC UART and HSUART
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260809121449.574277-3-ansuelsmth@gmail.com>
References: <20260809121449.574277-1-ansuelsmth@gmail.com>
 <20260809121449.574277-3-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 09 Aug 2026 12:36:44 +0000
Message-Id: <20260809123644.C98371F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Critical] Calling dev_err() in airoha_set_divisor() causes a spinlock de=
adlock if the port is the kernel console.
- [High] Writing to the 32-bit `UART_AIROHA_XYD` register using `serial_por=
t_out()` will silently truncate data to 8 bits if the device tree does not =
explicitly specify a 32-bit I/O width.
- [High] The custom `rxtrig_bytes` configurations for Airoha UARTs are inco=
mpletely populated, breaking the generic 8250 trigger level logic and causi=
ng incorrect FIFO trigger values to be programmed.
- [Medium] Defining `UART_PORT_AIROHA` and `UART_PORT_AIROHA_HS` in a priva=
te header improperly extends the global userspace-visible `PORT_*` numberin=
g sequence.
--

--- Patch [2]: [PATCH v4 2/2] serial: 8250: Add Airoha SoC UART and HSUART =
support ---
commit 6a010d96ca9cacd9ae30a034a1c0bf970a220d58
Author: Christian Marangi <ansuelsmth@gmail.com>

serial: 8250: Add Airoha SoC UART and HSUART support
   =20
This patch adds support for Airoha AN7523 UART and AN7581 HSUART. It
implements a standard 16550 UART with custom logic for baud rate handling.

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
Is it safe to define these port type numbers in a private header instead of
include/uapi/linux/serial_core.h?

Since userspace can read this value via the TIOCGSERIAL ioctl, could this l=
ead
to a collision if another port type is assigned the same ID in the global U=
API
header?

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
[ ... ]
> +	/* Couldn't find a valid xyd_x */
> +	if (div_bit < 0) {
> +		dev_err(port->dev, "failed to find suitable clock divisor for baud %u\=
n",
> +			baud);
> +		return;
> +	}

[Severity: Critical]
Can this cause a spinlock deadlock if the port is the kernel console?

The caller serial8250_do_set_termios() holds the port->lock spinlock when
invoking the set_divisor callback. If dev_err() is called and this UART is =
the
active console, printk will synchronously try to acquire the same port->loc=
k in
serial8250_console_write(), leading to a deadlock.

> +
> +	serial_port_out(port, UART_AIROHA_XINCLKDR, BIT(div_bit));
> +	serial_port_out(port, UART_AIROHA_XYD,
> +			FIELD_PREP(UART_AIROHA_XYD_X, xyd_x) |
> +			FIELD_PREP(UART_AIROHA_XYD_Y, XYD_Y));

[Severity: High]
Is there a risk that writing to the 32-bit UART_AIROHA_XYD register using
serial_port_out() will silently truncate the data to 8 bits?

If the device tree is missing the reg-io-width property, the 8250 core will
default to 8-bit I/O. Since the hardware requires 32-bit writes here, should
the driver explicitly set uart.port.iotype to UPIO_MEM32 in the probe funct=
ion
to ensure the generic accessor doesn't invoke writeb() and discard the upper
24 bits?

> diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/825=
0/8250_port.c
> index e94a0802cbddc..11728a789922d 100644
> --- a/drivers/tty/serial/8250/8250_port.c
> +++ b/drivers/tty/serial/8250/8250_port.c
[ ... ]
> +	[UART_PORT_AIROHA_HS] =3D {
> +		.name		=3D "Airoha HSUART",
> +		.fifo_size	=3D 128,
> +		.tx_loadsz	=3D 128,
> +		.fcr		=3D UART_FCR_ENABLE_FIFO | UART_FCR_R_TRIG_01 | UART_FCR_CLEAR_R=
CVR,
> +		.rxtrig_bytes	=3D {1, 4},
> +		.flags		=3D UART_CAP_FIFO,
> +	},

[Severity: High]
Does the incomplete initialization of rxtrig_bytes for UART_PORT_AIROHA_HS
break the generic trigger level logic?

The array defines only the first two elements, leaving indices 2 and 3 as 0.
When bytes_to_fcr_rxtrig() iterates over all states:

        for (i =3D 1; i < UART_FCR_R_TRIG_MAX_STATE; i++) {
                if (bytes < conf_type->rxtrig_bytes[i])

Since bytes is unsigned, bytes < 0 is false, so it will fall through and re=
turn
UART_FCR_R_TRIG_11 for any requested trigger size of 4 or more, which would
program 0 bytes into the hardware's FCR. Should the rest of the elements be
populated?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260809121449.5742=
77-1-ansuelsmth@gmail.com?part=3D2
