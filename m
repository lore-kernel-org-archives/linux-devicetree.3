Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB640280335
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 10:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779704370; cv=none; b=rZkgsruEjGXU741FrZ5DOFDcCwI/d+/xuy0TDozvASO+pXWnTPrrzOddrrfUuINQdQRqidqQiPl7c2Y34y+o0fH4xUY0ClTwc1Gze3tibiU4sD52+xl653ErD6a9Y/puhDzs6hQSkzC1LzAKv6X6pjrW/0vhYKWD5+AsmKdnWMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779704370; c=relaxed/simple;
	bh=Gp+XvPAaBFz1WroPUGw8wQkKd9i0sSJkVtZdW0lTC8o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PRKxzRpJfQKt/kemGZPMuoXZF7A3f6cuhKw54lqEDxBJYWNPTAJPTYHldJmJB/Axu+D+LtDmEiDM/HIG0umZbJTiusS0HQjDsGGarxv8Zyxjclef0if+Qx6uSp2LPiEWSxzoq83NAA3T+FbJ61FilYe9z1ig8Sp+EM5fCaaZWxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZwDhNc6a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZwDhNc6a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FB1E1F000E9;
	Mon, 25 May 2026 10:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779704368;
	bh=mDIL5uauuV5AnOq4G8XqN02Sc/+Kru76nNYTlTrHP+g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZwDhNc6axZ6sBDc8bToSqXI7cBpv3fPipv4v1kXKHBaMGi/qzvZTFQuuWx07Jl60O
	 h9X/uwxq4jL2QltiHjpz20UrNK7uJLRwtFITIokTW5f43a7g0cI+n/BVb4SVE1xfry
	 AX/sPAdKQDvurE5Dq+fvt5hHNFqNWUGUuhQ1wv0Y9e4lXoLGwLojgKw4jXMslrYLEm
	 uuFjzAW9PQUP6SeXiLLNPFTHSw5toVYKSqhkBIiI8vSESFTOjTgvQCNARBCVbQ2E78
	 lxCckX5QzR1kh0iijYxUV9teIwrneoJll/W4ubQwejpD1WzZQR9wIJqXMRJ2dEn6fM
	 lJwCGONWj0utA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] serial: max310x: register GPIO controller before
 adding UART ports
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tapio Reijonen" <tapio.reijonen@vaisala.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260525-b4-max310x-rs485-dt-v1-1-e6c19b4d5592@vaisala.com>
References: <20260525-b4-max310x-rs485-dt-v1-1-e6c19b4d5592@vaisala.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 10:19:27 +0000
Message-Id: <20260525101928.1FB1E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] The `out_uart` error path unregisters ports using uninitialize=
d line numbers, potentially corrupting global driver state by unregistering=
 another device's active port.
- [High] A Time-of-Check to Time-of-Use (TOCTOU) race condition in UART lin=
e allocation allows concurrent probes to allocate the same UART line.
- [High] The `out_uart` error path fails to cancel initialized workqueues, =
potentially leading to a use-after-free when the driver structure is freed.
- [High] `devm_request_threaded_irq()` is called after `uart_add_one_port()=
`, creating a window where an unhandled interrupt storm can occur.
- [High] `max310x_probe()` unconditionally suspends the port hardware after=
 exposing it to userspace, which can interfere with an active connection.
--

commit 84fe457ab09a7a2f5a59d11cc26941770e4d041d
Author: Tapio Reijonen <tapio.reijonen@vaisala.com>
Subject: serial: max310x: register GPIO controller before adding UART ports

This commit splits the per-port setup into two passes to register the
gpio_chip before calling uart_add_one_port(). This allows device-tree
consumers referencing the chip's own GPIOs to resolve them properly
during port registration instead of encountering probe deferral.

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

[Severity: Critical]
This is a pre-existing issue, but the out_uart error path unregisters ports
using uninitialized line numbers.

Because the driver state is allocated with devm_kzalloc(), port.line defaul=
ts
to 0 for ports that haven't been successfully assigned a line yet. If probe
fails here or earlier (for example, if devm_gpiochip_add_data() fails),
the cleanup loop will test and clear bit 0:

max310x_probe() {
...
out_uart:
    for (i =3D 0; i < devtype->nr; i++) {
        if (test_and_clear_bit(s->p[i].port.line, max310x_lines))
            uart_remove_one_port(&max310x_uart, &s->p[i].port);
    }
...
}

Could this forcefully unregister another max310x device's active port if it
has already successfully claimed line 0, leading to memory corruption?

> +		}
> +		s->p[i].port.line =3D line;
> +
> +		/* Register port */
> +		ret =3D uart_add_one_port(&max310x_uart, &s->p[i].port);
> +		if (ret)
> +			goto out_uart;

[Severity: High]
This is a pre-existing issue, but does the out_uart error path miss cancell=
ing
initialized workqueues?

The probe function initializes work structures (like md_work) per port earl=
ier
in the first loop. During uart_add_one_port(), the serial core can
synchronously invoke uart_ops->set_mctrl(), which schedules md_work.

If probe subsequently fails and jumps to out_uart, the ports are unregister=
ed
but cancel_work_sync() is never called. Returning an error causes devres to
free the driver state.

Will the scheduled work item eventually execute and access the freed memory?

> +
> +		set_bit(line, max310x_lines);

[Severity: High]
This isn't a bug introduced by this patch, but is there a race condition
in the UART line allocation?

The driver allocates the line using find_first_zero_bit() earlier, but does
not reserve the bit with set_bit() until after the blocking
uart_add_one_port() call completes.

Can concurrent probes of multiple max310x devices read the same free bit
during this window, resulting in line collisions in the UART core?

> +
> +		/* Go to suspend mode */
> +		max310x_power(&s->p[i].port, 0);

[Severity: High]
This is a pre-existing issue, but does this unconditionally suspend the port
hardware after it has been exposed to userspace?

uart_add_one_port() makes the TTY device available to userspace. If userspa=
ce
opens the port immediately, max310x_startup() powers the port on.

If that happens, this call forces the hardware back into suspend mode while
the serial core and userspace still consider the port active. Could this le=
ad
to dropped frames and unresponsive I/O?

> +	}
> +
>  	/* Setup interrupt */
>  	ret =3D devm_request_threaded_irq(dev, irq, NULL, max310x_ist,

[Severity: High]
This isn't a bug introduced by this patch, but does registering the IRQ han=
dler
after adding the UART ports create a window for an unhandled interrupt stor=
m?

Since uart_add_one_port() makes the device available to userspace, a user
process opening the device immediately triggers max310x_startup(), which
enables hardware interrupts.

If the hardware asserts the shared IRQ line before devm_request_threaded_ir=
q()
registers the handler, will the kernel receive unhandled interrupts,
potentially disabling the shared IRQ line permanently?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260525-b4-max310x=
-rs485-dt-v1-0-e6c19b4d5592@vaisala.com?part=3D1
