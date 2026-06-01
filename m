Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4C03672AF
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 11:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780314969; cv=none; b=Opb6y3CeLPsbeAXPQOytT+vwOW7IG9csTnFPpkJnSIKqptSVRk5qNGHLXDEKQ7XIwSI6HCcItvAUafScbfQJK6Y10p66IhuYx99+xmk2LM6ArlNZrPBRU0kKQ5XQRgKGOhB9sCoDgZno3CUHnm5pyQ744qyFa14uo3BcM3uM/Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780314969; c=relaxed/simple;
	bh=eTvLj2MdmCimta1L85xpO05ZuVEAmJXP2qJhDrSsZns=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mBGX8CtpLgq1LNekN0U/T+rthagm+/jS8SumQqN6AUlQf4om6LURN9J0YxAI2uGTNkNYOeuvNVXZ+r4/yNGgLtLLCCz2NoD47feEUBj3ZdUnbvp2VjPEsfnrEdEh06YVUIqCWX6FRNG1PYUL+oC3Rni0z9Wp7gthdzY2UNyt/k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ihUu91TN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ihUu91TN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C55FA1F00893;
	Mon,  1 Jun 2026 11:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780314968;
	bh=zon9RtQ+UB095tg0cZKlTlsvKIcb5kYID/Cyf2ns1Jg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ihUu91TNcNUaUaUAdZP7x5/HxktIHV7wvBpLW2Bzi4YRwNn46Loae4PkdVMVB4GhB
	 ATaLSlyXU7o0ssnThGg5W09/z6GghZxH0gfo+IyssjbDZmyp5hX/WkQXryk9R3F17s
	 Z5cVSkvC6+AfOHOCnS5xpSQGWijrxcSkTBTgTnUqCV1sDgK0ePXoorLbzHmU4R0Ays
	 bc8/DGmFztu2qJaR0fhSepV54jp3RFLbSUDddhLw7S6eB4EP5ds+rXF7rbiA8JgixA
	 JWHEbpGUXnEyzRJAQ2Lh796UlBMhsLahiH+PygUvpPy25P4zGOW9l2SAgbX5Fi6WVW
	 JDf+ty0GpEa5g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] serial: max310x: honour rs485 properties from
 per-channel DT subnode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tapio Reijonen" <tapio.reijonen@vaisala.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260601-b4-max310x-rs485-dt-v2-3-a105105f8e70@vaisala.com>
References: <20260601-b4-max310x-rs485-dt-v2-3-a105105f8e70@vaisala.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 01 Jun 2026 11:56:07 +0000
Message-Id: <20260601115607.C55FA1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [High] Temporarily retargeting `dev->of_node` on a registered device caus=
es TOCTOU race

Pre-existing issues:
- [Critical] Error path blindly processes uninitialized ports, causing NULL=
 pointer dereference
- [High] Unprotected concurrent access to global `max310x_lines` causes rac=
e condition during probe
- [High] Missing `cancel_work_sync()` in error path leads to Use-After-Free
- [High] Interrupt handler requested after port registration causes unhandl=
ed interrupt storm
--

commit 3cfa2d1749d3467560c6e80f4881b8af12a9e51e
Author: Tapio Reijonen <tapio.reijonen@vaisala.com>

serial: max310x: honour rs485 properties from per-channel DT subnode

The MAX310x driver is modified to read rs485 properties from per-channel DT
subnodes for multi-port variants. It walks the child nodes for a matching
"serial@N" node and temporarily retargets the parent device's fwnode so
uart_get_rs485_mode() picks up the subnode properties.

> diff --git a/drivers/tty/serial/max310x.c b/drivers/tty/serial/max310x.c
> index 5cb7d01e40466..aee3b75fff000 100644
> --- a/drivers/tty/serial/max310x.c
> +++ b/drivers/tty/serial/max310x.c
> @@ -1426,6 +1426,9 @@ static int max310x_probe(struct device *dev, const =
struct max310x_devtype *devty
[ ... ]
>  	for (i =3D 0; i < devtype->nr; i++) {
> +		struct fwnode_handle *saved_fwnode =3D dev_fwnode(dev);
> +		struct device_node *port_np =3D NULL;
> +		struct device_node *child;
>  		unsigned int line;
> =20
>  		line =3D find_first_zero_bit(max310x_lines, MAX310X_UART_NRMAX);

[Severity: High]
This is a pre-existing issue, but does this code leave max310x_lines open to
a race condition?

The line number is allocated here using find_first_zero_bit(), but set_bit()
is not called until after uart_add_one_port() completes successfully later =
in
the function.

If two max310x devices probe concurrently, could they observe the same zero
bit, assign the same line, and attempt to register it?

>  		if (line =3D=3D MAX310X_UART_NRMAX) {
>  			ret =3D -ERANGE;
>  			goto out_uart;
>  		}
>  		s->p[i].port.line =3D line;
> =20
> +		/* Locate the matching "serial@i" DT subnode, if any. */
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

[Severity: High]
The commit message states "Probe is serialised, so the swap is safe."
Is this swap safe against lockless readers in other subsystems?

Since the parent device is already registered and globally visible to the
device model, could a concurrent lockless lookup via of_find_device_by_node=
()
or bus_find_device_by_of_node() observe the temporarily swapped dev->of_nod=
e?

If so, this might cause a concurrent lookup for the parent device's phandle
to spuriously fail, or a lookup for the child node to erroneously return the
parent device.

Would it be better to read subnode properties by explicitly passing the tar=
get
fwnode rather than temporarily replacing the parent device's identity?

> +			ret =3D uart_get_rs485_mode(&s->p[i].port);
> +			device_set_node(dev, saved_fwnode);
> +			of_node_put(port_np);
> +			if (ret)
> +				goto out_uart;

[Severity: Critical]
This isn't a bug introduced by this patch, but does the out_uart cleanup
path handle partially initialized devices correctly if we goto out_uart her=
e?

The out_uart cleanup loop unconditionally iterates over all devtype->nr por=
ts.
For ports that haven't been initialized yet, s->p[i].port.line evaluates to=
 0.
Could test_and_clear_bit(0, max310x_lines) return true if line 0 is current=
ly
in use by another instance?

If it does, this would call uart_remove_one_port() on an unregistered port.
Could this lead to a NULL pointer dereference in serial_core_unregister_por=
t()
since port->port_dev would be NULL?

[Severity: High]
This is also a pre-existing issue, but is it safe to let devres free the
device context without canceling pending work if we take this goto?

The driver initializes md_work, tx_work, and rs_work for each port. During
uart_add_one_port(), the serial core synchronously invokes callbacks like
set_mctrl() and rs485_config(), which can schedule these work items.

If an error occurs and the ports are removed in out_uart, there is no call =
to
cancel_work_sync(). Could asynchronously executing work items dereference t=
he
freed memory?

> +		} else if (devtype->nr =3D=3D 1) {
> +			ret =3D uart_get_rs485_mode(&s->p[i].port);
> +			if (ret)
> +				goto out_uart;
> +		}
> =20
>  		/* Register port */
>  		ret =3D uart_add_one_port(&max310x_uart, &s->p[i].port);

[Severity: High]
This isn't a bug introduced by this patch, but could this registration order
cause an unhandled interrupt storm?

Calling uart_add_one_port() exposes the TTY device to userspace. If a
userspace program opens it immediately, max310x_startup() can enable TX/RX
interrupts on the device.

Because devm_request_threaded_irq() is called outside and after this loop,
there is a window where the device can generate interrupts without a
registered handler.

Since the interrupt line is shared, would the kernel forcefully disable the
IRQ line if an interrupt fires during this window?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260601-b4-max310x=
-rs485-dt-v2-0-a105105f8e70@vaisala.com?part=3D3
