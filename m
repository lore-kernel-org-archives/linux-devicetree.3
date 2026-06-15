Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F94F33C507
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 10:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781520240; cv=none; b=leJdc1K1yWtknYCxrkhCJf9msz1zLkbVsLJ94rW39ANyev03IyJg0dQQ3KpjrT1Gnn004PAwn7iXIRmbvOvhJLlME/NYoU2yjcx9a7H1xxOm4QttE6RwMeoB6uupaGlXQw5EuirCWm1jHb5ykb77L8GcQc5wMc/AFO1ofl60Csk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781520240; c=relaxed/simple;
	bh=DkN36UAAQ+ZPLuBwJhl7I1IRAgSyeOQdCYgB39cEdb4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OCcH/wCuLh/1srsHUyG+u1bFM4XGpKhz1MLO0WgOtNEOtDi0KW9KAK81JhqAQr4LkLV7sRr6I0oJZHUgYApTAvzGBLzMl4aZMJcvS3wOQvyycHlWHOCpTl/1yZk6LdVASwQ6yuLhBHgNA9JMLTpfYyKMVoclArsJKftdEx4E/5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OaKzhpG9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OaKzhpG9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8D901F000E9;
	Mon, 15 Jun 2026 10:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781520238;
	bh=Ds/Ddpv44bPJ/kbTJyFf7sdmvIXZirAG2RVbf9zYkj4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OaKzhpG9YybBDGv6zVL5K9g9nnSO0UEtDXNGhg3Mz4FVvqT0lARhBuckF6bQEL4Rq
	 LwPML7+scXVNS5t11P1gwEEpXR/Pw5T5g8iFI4tHXTPVEaVZzH5AM/TT2QvEwpqSFY
	 I2IRttPY7XkAqSDcd5+w3WUQSB8I9E1fUcGMJZpIx1GUQBaqQTtvaKLJrAt6CAus9T
	 7DQeOLOYpo/aDS49V155llKQ3kD2NkCoNa70C9+sw+q/z9cH2lwQC7tow8YbE+kUX3
	 Z5pzrhr2byIevxs0bEr3OeGkXtgyVxF6He9ak5JWVX3cnlWVTNR4wtedZcZEqplK2g
	 NSpi3ScwffyKw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/3] serial: max310x: register GPIO controller before
 adding UART ports
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tapio Reijonen" <tapio.reijonen@vaisala.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260615-b4-max310x-rs485-dt-v3-1-7e79f064bdd7@vaisala.com>
References: <20260615-b4-max310x-rs485-dt-v3-1-7e79f064bdd7@vaisala.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 10:43:57 +0000
Message-Id: <20260615104358.A8D901F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The `out_uart` error path relies on zero-initialized `port.line` v=
alues, causing it to erroneously clear line 0 from the global bitmap.
- [High] Concurrent allocation of UART lines using the global `max310x_line=
s` bitmap lacks locking, leading to race conditions and probe failures.
- [High] The shared IRQ handler is registered after the UART ports are expo=
sed to userspace, creating an unhandled interrupt window.
- [High] Missing `cancel_work_sync()` in the `out_uart` error path leaks sy=
nchronously queued work items, leading to a Use-After-Free.
- [High] The driver unconditionally powers off the device after registering=
 the port, introducing a TOCTOU race with concurrent userspace access.
- [High] The driver accesses and modifies the `uart_port` state completely =
outside of `port->lock`, violating fundamental serial core locking rules.
--

commit e3ed4a711cf7a4f6df5863f1c7baec8925661b6f
Author: Tapio Reijonen <tapio.reijonen@vaisala.com>

serial: max310x: register GPIO controller before adding UART ports

The MAX310x exposes four GPIOs per UART port via an in-driver
gpio_chip. devm_gpiochip_add_data() used to run after the per-port
uart_add_one_port() loop, so a device-tree consumer referencing one of
the chip's own GPIOs (for example rs485-term-gpios =3D <&max310x 0 ...>)
could not resolve it during port registration: the GPIO provider it
waits for is the very driver still trying to register, and the lookup
returns -EPROBE_DEFER on its own provider, deferring probe forever.

Split the per-port setup into two passes around the gpio_chip
registration.

> diff --git a/drivers/tty/serial/max310x.c b/drivers/tty/serial/max310x.c
> index ac7d3f197c3a5..5cb7d01e40466 100644
> --- a/drivers/tty/serial/max310x.c
> +++ b/drivers/tty/serial/max310x.c

[ ... ]

> @@ -1434,6 +1425,27 @@ static int max310x_probe(struct device *dev, const=
 struct max310x_devtype *devty
>  		goto out_uart;
>  #endif
> =20
> +	for (i =3D 0; i < devtype->nr; i++) {
> +		unsigned int line;
> +
> +		line =3D find_first_zero_bit(max310x_lines, MAX310X_UART_NRMAX);

[Severity: High]
This is a pre-existing issue, but does the allocation of UART lines using
the global max310x_lines bitmap lack locking?

Multiple instances of the driver probing concurrently on different buses
could simultaneously find the same zero bit and assign the same line number.

Since set_bit is deferred until after uart_add_one_port completes, the
second instance to call uart_add_one_port would fail with -EINVAL. Could
this cause the probe to abort and jump to the out_uart cleanup path?

> +		if (line =3D=3D MAX310X_UART_NRMAX) {
> +			ret =3D -ERANGE;
> +			goto out_uart;
> +		}
> +		s->p[i].port.line =3D line;
> +
> +		/* Register port */
> +		ret =3D uart_add_one_port(&max310x_uart, &s->p[i].port);
> +		if (ret)
> +			goto out_uart;
> +
> +		set_bit(line, max310x_lines);
> +
> +		/* Go to suspend mode */
> +		max310x_power(&s->p[i].port, 0);

[Severity: High]
This is a pre-existing issue, but is there a race condition with userspace
access when unconditionally powering off the device here?

The port is exposed to userspace via uart_add_one_port just before this.
If userspace opens the port in the exact window between these two calls,
max310x_startup will properly power the device on, but then this thread
will immediately execute the power-off sequence.

Could this leave an active port unpowered and completely unresponsive?

> +	}
> +
>  	/* Setup interrupt */
>  	ret =3D devm_request_threaded_irq(dev, irq, NULL, max310x_ist,
>  					IRQF_ONESHOT | IRQF_SHARED, dev_name(dev), s);

[Severity: High]
This is a pre-existing issue, but does registering the shared IRQ handler
after exposing the UART ports to userspace create an unhandled interrupt
window?

Userspace can immediately open the port, invoking max310x_startup, which
synchronously enables chip-level hardware interrupts via MAX310X_IRQEN_REG.
If the hardware asserts the IRQ line before devm_request_threaded_irq is
called here, the kernel receives an unhandled interrupt.

Since the interrupt is requested with IRQF_SHARED, could this unhandled
interrupt trigger the spurious interrupt detector to permanently disable
the shared interrupt line, causing the device to hang?

[Severity: High]
This is another pre-existing issue, but can the out_uart cleanup path clear
the wrong bit in the max310x_lines bitmap?

If find_first_zero_bit or devm_gpiochip_add_data fails, the code jumps
to out_uart. Because the port structures are zero-initialized via
devm_kzalloc, the port.line field defaults to 0.

The cleanup loop iterates over all ports:

out_uart:
    for (i =3D 0; i < devtype->nr; i++) {
        if (test_and_clear_bit(s->p[i].port.line, max310x_lines))
            ...

If another max310x device successfully claimed line 0, would its bit be
wrongfully cleared, permanently corrupting the resource tracking for future
allocations?

[Severity: High]
This is also a pre-existing issue, but does the out_uart error path leak
synchronously queued work items?

During port registration, uart_add_one_port invokes max310x_rs485_config
if SER_RS485_ENABLED is set, which unconditionally schedules one->rs_work.

If a subsequent initialization step fails and the probe jumps to out_uart,
the driver structure is freed by devres. However, cancel_work_sync is not
called for rs_work.

When the workqueue scheduler later executes the pending work, will it
dereference freed memory?

[Severity: High]
Finally, this is a pre-existing issue, but does the driver modify the
uart_port state outside of the port->lock?

In max310x_handle_tx, the transmit FIFO is modified using
kfifo_out_linear_ptr and uart_xmit_advance is called. Similarly,
max310x_port_irq calls uart_handle_cts_change.

None of these execution paths acquire spin_lock(&port->lock). Could this
lead to data corruption and inconsistent state when racing with concurrent
TTY core operations, such as tty_write modifying the FIFO?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260615-b4-max310x=
-rs485-dt-v3-0-7e79f064bdd7@vaisala.com?part=3D1
