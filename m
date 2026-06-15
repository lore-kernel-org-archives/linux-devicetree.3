Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066443168EF
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 10:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781519956; cv=none; b=O5m9E19g+kEVWHik4F5LqG0hJ2zXOFV2+ry9VSu8p55mgn1Ji8PDcQEc9liScNA8BIYrmmj38xiKR1SMZ5DW3hlRygcDzFFfX2Cx9Hds9NhXcGKBgfbzBQSMY+XFGQeD5TLAKfR6AE+L+DQsKKcllqPoxOoQXmkSsGNSwCqEC9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781519956; c=relaxed/simple;
	bh=LzhYUMusFeDGiTAeXRRg+YJR4mxUvvrUTDMk3aK2ieg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=agAmOUEv5Vh8zS6Pb0xy49Ax7LYgzXCkyeIc89eNWtoucweIvZNY+q/a51KDQMyc7ZBUSf9vx+RKmfIA5mLmTIPd8Uw4FOdy+dh0sFvRQcBzI/nUA+Jg69ehwZnDeoD3Lk6vTfYJ3jqGqARI5q2vbUzuS1SaIkbPfq6lhXDj4n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H8Yy9ggi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H8Yy9ggi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 179AA1F000E9;
	Mon, 15 Jun 2026 10:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781519954;
	bh=Nw+ElU2h2wZ6pE5Ca/WZJn6vMvU25J0rbNPDhNpdE8g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H8Yy9ggi+XrMv3pMv/mw/EDMaIioqQKAuOWO0MYMe8EDKRboFxL3YDGXxRobfVKHX
	 c/ltHV8yfFMeDxVWdnWgk6X45ZOJaIpthkVIhHxIrPuB7Q5GdDHmlNpLittPQaCZqG
	 zKun5rz0COoNeEDBNZo+1I4Om5Zy+uifWwZpVGa4jh44wTc5fHrVfBoxdMEHsb9AAz
	 wdHRNioWBF5CUlmBO7kbJiDRiZjqkPm1VEAxhg5MpMKFPaJTPIeWRGuJPaaAFP3mfv
	 mWBjbAMlKvmlE10jD2zpRC+crMA9GJe8KW0oxcd67RmX8G7FW2e4Ukiqe5r7aqYCTo
	 7P3nPFULLKHsQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] serial: max310x: honour rs485 properties from
 per-channel DT subnode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tapio Reijonen" <tapio.reijonen@vaisala.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260615-b4-max310x-rs485-dt-v3-3-7e79f064bdd7@vaisala.com>
References: <20260615-b4-max310x-rs485-dt-v3-3-7e79f064bdd7@vaisala.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 10:39:13 +0000
Message-Id: <20260615103914.179AA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [Medium] Temporary modification of registered device's `fwnode` creates a=
 data race with sysfs/bus iterators.

Pre-existing issues:
- [Critical] Uninitialized port line values in `out_uart` cleanup path caus=
e deregistration of other devices' serial ports.
- [High] Unprotected global bitmap `max310x_lines` allows concurrent probes=
 to allocate the same UART line, leading to state corruption.
- [High] Missing registration ordering: UART port is exposed to userspace b=
efore its interrupt handler is registered.
--

commit 0bd4955b2ec9441be6e7a42bfe7ca700f31859d2
Author: Tapio Reijonen <tapio.reijonen@vaisala.com>

serial: max310x: honour rs485 properties from per-channel DT subnode

This commit updates the MAX310x driver to parse rs485 properties from
per-channel device tree subnodes by temporarily retargeting the parent
device's fwnode. It falls back to the top-level node for single-channel
variants.

> diff --git a/drivers/tty/serial/max310x.c b/drivers/tty/serial/max310x.c
> --- a/drivers/tty/serial/max310x.c
> +++ b/drivers/tty/serial/max310x.c
[ ... ]
> @@ -1426,6 +1426,9 @@ static int max310x_probe(struct device *dev, const =
struct max310x_devtype *devty
>  #endif
> =20
>  	for (i =3D 0; i < devtype->nr; i++) {
> +		struct fwnode_handle *saved_fwnode =3D dev_fwnode(dev);
> +		struct device_node *port_np =3D NULL;
> +		struct device_node *child;
>  		unsigned int line;
> =20
>  		line =3D find_first_zero_bit(max310x_lines, MAX310X_UART_NRMAX);

[Severity: High]
This is a pre-existing issue, but does this lockless read of the global
bitmap allow concurrent probes to allocate the same UART line?

Since find_first_zero_bit() is called here, but set_bit() is only called
much later after port registration and DT parsing, multiple asynchronous
probes could observe the same zero bit.=20

Could the second thread fail in uart_add_one_port() due to a collision, jump
to the cleanup path, and erroneously clear the bit that the first thread
successfully registered?

>  		if (line =3D=3D MAX310X_UART_NRMAX) {
>  			ret =3D -ERANGE;
>  			goto out_uart;
>  		}
>  		s->p[i].port.line =3D line;
> =20
> +		/* Locate the matching "serial@i" DT subnode, if any. */
> +		for_each_available_child_of_node(dev->of_node, child) {
[ ... ]
> +		/*
> +		 * Temporarily retarget dev's fwnode to the per-port subnode
> +		 * so uart_get_rs485_mode() picks up the per-port properties.
> +		 * For single-port variants, fall back to the chip's own
> +		 * fwnode so legacy DTs that declare rs485 properties at the
> +		 * top level keep working.
> +		 */
> +		if (port_np) {
> +			device_set_node(dev, of_fwnode_handle(port_np));

[Severity: Medium]
Does temporarily swapping the fwnode on a live device create a data race
with sysfs or bus iterators?

Since the parent SPI/I2C device is already registered with the driver core
and visible in sysfs at this stage, locklessly modifying dev->fwnode and
dev->of_node could expose a torn pointer state to concurrent udev events or
subsystem iterators.

> +			ret =3D uart_get_rs485_mode(&s->p[i].port);
> +			device_set_node(dev, saved_fwnode);
> +			of_node_put(port_np);
> +			if (ret)
> +				goto out_uart;
> +		} else if (devtype->nr =3D=3D 1) {
> +			ret =3D uart_get_rs485_mode(&s->p[i].port);
> +			if (ret)
> +				goto out_uart;
> +		}
> =20
>  		/* Register port */
>  		ret =3D uart_add_one_port(&max310x_uart, &s->p[i].port);

[Severity: High]
This is a pre-existing issue, but could this ordering lead to unhandled
interrupts if the port is opened immediately?

Because uart_add_one_port() makes the port available to userspace, udev or a
getty could open it before the probe loop finishes. If the port is opened
and powers on, the hardware might assert the IRQ line before
devm_request_threaded_irq() is called later in max310x_probe(), potentially
causing the IRQ core to permanently disable the shared interrupt line.

>  		if (ret)
>  			goto out_uart;

[ ... ]

>  out_uart:
>  	for (i =3D 0; i < devtype->nr; i++) {
>  		if (test_and_clear_bit(s->p[i].port.line, max310x_lines))
>  			uart_remove_one_port(&max310x_uart, &s->p[i].port);
>  	}

[Severity: Critical]
This is a pre-existing issue, but can this cleanup path unregister active
ports belonging to completely different devices?

During early probe failure, the allocated port structures are zeroed out,
meaning uninitialized elements have their port.line set to 0. Since this
loop unconditionally iterates over all devtype->nr elements, it will call
test_and_clear_bit() on line 0.

If another max310x instance has already probed and owns line 0, couldn't
this accidentally clear the other device's bit and forcefully unregister its
active port via uart_remove_one_port(), leading to a kernel panic or
use-after-free?

>  out_clk:
>  	clk_disable_unprepare(s->clk);
> =20
>  	return ret;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260615-b4-max310x=
-rs485-dt-v3-0-7e79f064bdd7@vaisala.com?part=3D3
