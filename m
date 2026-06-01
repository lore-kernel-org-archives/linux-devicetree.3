Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C6738947F
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 11:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780312946; cv=none; b=TE2RzOOWZiMMz7LSdKXxfdMnLXZmsZsE/RToay0NCqXF6fn9QLmRO7R/4ndRUX46CxD/dn6lvuWP7/hZMtojkmdm+ZyYtucSyEuXstZAodnJudxXfQVRdfoHTz828yque+Y4Az+eHp9FS74GPbgfcp+++PpXAE5g/w3zyRzITAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780312946; c=relaxed/simple;
	bh=h5f4D8tweakqsDWps2Yfz2m94qI1xhJYCIc4lNjd/4c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JltPKwaQl1Sk5XY48Yev+rMujNCdsXYiIcbeXHkjA5pNRL6cGdUBsrKZNsiLZLgfO0162MSTpbsdGk9i8uQU1lK9IeCm2lI+NsYexRP+g7DUXjXK/EGmBl50balpz/f4wN9SKQwoly+feO91lZDSaI3jtZ8Rir8Q7FnKGtYSiNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lyIbjTXJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lyIbjTXJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 526B91F00893;
	Mon,  1 Jun 2026 11:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780312945;
	bh=5B1FMeGJ5EMt8V8y1ERUV/YVOGhW+kasIZ0vTzoOUpc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lyIbjTXJYXKctZ5HYXHPhvDpwTyQMid2Q/MPC9goSqP9lutLeOCNCS/4TdBqnovfY
	 1ZkxvUYC6m/NwBVxi9sCzr25fkFvg5UzNFLmv554xnIg1v6E516zls6f1EvhNaby6V
	 JlmJ/hEegvYMjtXZZhlIEItm7pzyX5oNcQnUE3g6My48mBmWAylyKf/11vF2BWT28P
	 qykM6414w3zM8CmYBu8aKy+iGiKP1mBuJupxwl1AlARCnVz+G91m1lpH/f4/yk0cnn
	 qD1gKouyFo9t6xPvfHHBlCdqEwJaapssog5K/lqYgbUYG8mMBTua3SYcVE/P2mCt/7
	 uAvUSn9NYwGng==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] serial: max310x: register GPIO controller before
 adding UART ports
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tapio Reijonen" <tapio.reijonen@vaisala.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260601-b4-max310x-rs485-dt-v2-1-a105105f8e70@vaisala.com>
References: <20260601-b4-max310x-rs485-dt-v2-1-a105105f8e70@vaisala.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 01 Jun 2026 11:22:24 +0000
Message-Id: <20260601112225.526B91F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The `out_uart` error path erroneously unregisters other devices' U=
ART ports and causes a NULL pointer dereference due to zero-initialized `po=
rt.line` values.
- [High] A Time-of-Check to Time-of-Use (TOCTOU) race condition in UART lin=
e allocation allows concurrent probes to acquire the same line, leading to =
a NULL pointer dereference in the error path.
- [High] Pending workqueues are not cancelled on the probe error path, lead=
ing to use-after-free when the device structure is freed.
- [High] The UART port is exposed to userspace before its power state is fi=
nalized and before its IRQ handler is registered.
--

commit e8c5104244fd289030c824c8273ba426d9f96078
Author: Tapio Reijonen <tapio.reijonen@vaisala.com>

serial: max310x: register GPIO controller before adding UART ports

The MAX310x exposes four GPIOs per UART port via an in-driver gpio_chip.
This patch splits the per-port setup into two passes around the gpio_chip
registration to prevent -EPROBE_DEFER issues during port registration.

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
> +		if (line =3D=3D MAX310X_UART_NRMAX) {
> +			ret =3D -ERANGE;
> +			goto out_uart;

[Severity: High]
This is a pre-existing issue, but does this error path cause a NULL pointer
dereference?

Because devm_kzalloc() zeroes s, s->p[i].port.line is initialized to 0 for
all ports. If we jump to out_uart here (or if devm_gpiochip_add_data()
failed earlier), the cleanup loop unconditionally tests bit 0 for the
uninitialized ports:

max310x_probe() {
    ...
out_uart:
    for (i =3D 0; i < devtype->nr; i++) {
        if (test_and_clear_bit(s->p[i].port.line, max310x_lines))
            uart_remove_one_port(&max310x_uart, &s->p[i].port);
    }
    ...
}

Could this clear the line 0 bit correctly owned by another device, and
attempt to unregister it using this failing device's partially-initialized
uport?

> +		}
> +		s->p[i].port.line =3D line;
> +
> +		/* Register port */
> +		ret =3D uart_add_one_port(&max310x_uart, &s->p[i].port);
> +		if (ret)
> +			goto out_uart;

[Severity: High]
This is a pre-existing issue, but does this error path leak pending workque=
ues?

During uart_add_one_port(), the serial core can invoke callbacks like
rs485_config() or set_mctrl(), which synchronously schedule rs_work or md_w=
ork.

If a subsequent port registration fails and we jump to out_uart, the ports
are unregistered but cancel_work_sync() is never called for these workqueue=
s.
When devres subsequently frees the device memory (s), could a delayed execu=
tion
of the scheduled work dereference the freed memory leading to a use-after-f=
ree?

> +
> +		set_bit(line, max310x_lines);

[Severity: High]
This is a pre-existing issue, but does this create a Time-of-Check to
Time-of-Use (TOCTOU) race condition during line allocation?

The find_first_zero_bit() function is called before uart_add_one_port(),
but the line isn't actually reserved with set_bit() until after
uart_add_one_port() returns.

Could concurrent probes of multiple max310x devices find the same free line,
leading to the second one failing uart_add_one_port() with -EINVAL,
jumping to out_uart, and erroneously clearing the bit correctly set by the
first device?

> +
> +		/* Go to suspend mode */
> +		max310x_power(&s->p[i].port, 0);
> +	}
> +
>  	/* Setup interrupt */
>  	ret =3D devm_request_threaded_irq(dev, irq, NULL, max310x_ist,
>  					IRQF_ONESHOT | IRQF_SHARED, dev_name(dev), s);

[Severity: High]
This is a pre-existing issue, but does exposing the port before finalized
setup cause missed interrupts or clobbered power states?

Because uart_add_one_port() makes the port visible to userspace, an
immediate open of the port will invoke the .startup callback and turn the
device power on.

However, the probe function immediately calls max310x_power(..., 0), which
would force the active session back into suspend mode. Furthermore, since
devm_request_threaded_irq() happens after all ports are added, could early
userspace activity trigger interrupts that are completely missed?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260601-b4-max310x=
-rs485-dt-v2-0-a105105f8e70@vaisala.com?part=3D1
