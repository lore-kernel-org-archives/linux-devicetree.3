Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929D232AABA
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 22:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786142337; cv=none; b=rMIuQp9+Wa2pYqqINhr6Ckiou1UVhp7CUoPjc12Kba88PtvcL2DV156xLHs9N/SaIsnqiR7YSL7QJ0hNzwROfQBRvR6+dQnnpXvEF9OPiecNds2zjDbITdfWDQ/qC5tzwgR9ngt7DCXXrotalMHu94FVzXAljvMuGr/6PhqaXe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786142337; c=relaxed/simple;
	bh=LLuMeTsrjClk+vn8QLlzLQ+AIO7oNTZ+2zA6RC9lm50=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Fbo5+ib1NfXzxRucZBKwFQFR+1f3RrOyr1tbqMYHlX+vgWS/yt6vtVlLEjPobUQrdtRdwylwUq9RHHu5qbHI29qlD4y1tAMFTU6b3OVlqGEJ3MNRYL3SGvBFRiX60R45JgBtcMXeJyeX5uvA6r9QfV4XNJU0LP8YFyXrPzuXdiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fkTjgJP4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fkTjgJP4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 403CF1F000E9;
	Fri,  7 Aug 2026 22:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786142336;
	bh=fjGekEw06XyzAx9ZWcipYTOUPvwH4Ew5uDtVW5H0LR8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fkTjgJP4h7KjYVxOPz/U+agNi3Z1MzDg9srUGZmPtAV93UNbo7QXKfHuuidw+RTnX
	 y5Q05lTHrrXfW8idhDTUTfoHgJ2Xfc1akpXFmFZtBih3+EmQLqp2vUbf//DGiFDqk5
	 5NE9WGI0uEa2xgiou92JUI/uIvfaz3t6tmnx7Z+8aymcu+PzEYsD04GRfKgB5ze/rP
	 YKPafuhw1fC5lQcCN+eocwTUEmpEzqsMjYfQ+jsJNPgv7mX3AqTLh0dfXcb9BmG5R3
	 BTP4dqv6bTPkSh3g211PmPIhdaxpcv3JPGM/Wy6OY4vodruPpaorEG7L/6V8f7ac9x
	 CUAURf9giN9xw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] serial: 8250: Add Airoha SoC UART and HSUART
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260807222044.208056-3-ansuelsmth@gmail.com>
References: <20260807222044.208056-1-ansuelsmth@gmail.com>
 <20260807222044.208056-3-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 22:38:55 +0000
Message-Id: <20260807223856.403CF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Unhandled high baud rates leave UART hardware in an inconsistent, =
desynchronized state due to mismatched clock limits.
- [Medium] Silent truncation of 32-bit custom register writes if `reg-io-wi=
dth` is omitted from the device tree.
- [Medium] Incorrect initialization of `rxtrig_bytes` array causes FCR misc=
onfiguration and breaks sysfs reads.
--

--- Patch [2]: [PATCH v3 2/2] serial: 8250: Add Airoha SoC UART and HSUART =
support ---
commit af8c5302b76a32f7b1c0a8787d38cbf61806b1bc
Author: Christian Marangi <ansuelsmth@gmail.com>

serial: 8250: Add Airoha SoC UART and HSUART support

Add support for Airoha AN7523 UART and AN7581 HSUART.

These implement a standard 16550 UART with only some custom logic
for baud rate handling.

> diff --git a/drivers/tty/serial/8250/8250_airoha.c b/drivers/tty/serial/8=
250/8250_airoha.c
> index 0000000000000..5cc9b8f8a6181
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

[Severity: High]
If userspace requests a high baud rate that cannot find a valid xyd_x, the
loop completes with div_bit < 0 and returns early. Could this abandon the
divisor setup and leave the hardware completely desynchronized with DLAB set
in the LCR register, since the LCR restore step at the end of the function =
is
skipped?

> +
> +	serial_port_out(port, UART_AIROHA_XINCLKDR, BIT(div_bit));
> +	serial_port_out(port, UART_AIROHA_XYD,
> +			FIELD_PREP(UART_AIROHA_XYD_X, xyd_x) |
> +			FIELD_PREP(UART_AIROHA_XYD_Y, XYD_Y));

[Severity: Medium]
Since this constructs a 32-bit payload, could the upper 24 bits be silently
truncated by an 8-bit writeb() accessor here?

If the optional reg-io-width property is omitted from the device tree,
uart_read_and_validate_port_properties() called during airoha_8250_probe()
defaults uart.port.iotype to UPIO_MEM (8-bit) because it wasn't explicitly =
set
to UPIO_MEM32 beforehand.

> +
> +	/* Restore normal register access. */
> +	serial_port_out(port, UART_LCR, up->lcr);
> +}

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

[Severity: Medium]
The rxtrig_bytes arrays here don't appear to be strictly monotonically
increasing.

If userspace writes '4' to the rx_trig_bytes sysfs file, is it possible this
fails the bytes_to_fcr_rxtrig() loop checks (since 4 < 4 and 4 < 0 are fals=
e),
returning index 3 and misconfiguring the FCR trigger bits?

> +		.flags		=3D UART_CAP_FIFO,
> +	},
> +	[UART_PORT_AIROHA_HS] =3D {
> +		.name		=3D "Airoha HSUART",
> +		.fifo_size	=3D 128,
> +		.tx_loadsz	=3D 128,
> +		.fcr		=3D UART_FCR_ENABLE_FIFO | UART_FCR_R_TRIG_01 | UART_FCR_CLEAR_R=
CVR,
> +		.rxtrig_bytes	=3D {1, 4},
> +		.flags		=3D UART_CAP_FIFO,
> +	},
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807222044.2080=
56-1-ansuelsmth@gmail.com?part=3D2
