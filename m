Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA19450406
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 07:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789112867; cv=none; b=ab72qceTAY/27shS6W4w5XOuokYy2sg1+hKS5K/2TtCF/ILZZNj7F48uVvpHkTLG+cqQKlqGsy5b76/8VC2Fx3h5b/eb6Pss3hjpLhs43XODB6je/BTFBpWksreMyGg+QFZQiDf+FXoNywnjGJmaKUN6L9BDUIBYZ3dTc6Fzprg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789112867; c=relaxed/simple;
	bh=ZAF7/Z/W14YsiYPnpK6br4OmllFz2BNQppIG9qI6HLo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Q43gBfwP67+/fXCZTqzGci1VoA3iZKrW2wzB8mrC/DCe+VpyO1Q1uT3GWVLTs7aKTcFuJC103/phqCkdI0WsEE60Di7WfJ2mYec852/cWI0SI0ONVz6Nz7J7nns9klI+9EFGMK49iWgh813PTZlceQoLNgVN2F0GYq8dqwLPY9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DV/n9MRg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DV/n9MRg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AA601F000FF;
	Fri, 11 Sep 2026 07:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789112865;
	bh=k93uoZnMQuOWpfjn7jQ1AQ/DRwUUhPe0HhVRshORLuo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DV/n9MRgAPbJ6nvC+xnGWeOd0PrtXKfEf36UkYdIWdQUa6MZcQacrymm79TLacZrs
	 H9QywoFO384133rP3eyqKeXmFaVhQRRj7nvPmJkAvtn44bMMMRGiN4CWFK+O8Q2ura
	 4GweeEu62vE8uUDyGYHfinLKJ6EZQNiDynr9e47F2I8ddZ+CgytPrx05CYYpZnWBrC
	 W7I3cqeUHnpQym0um8EFDOt9X5XDJFL2r21bUzbtbSGg4g8SJz+1VHcvkCtVtlcsmS
	 sxtr0wKpB5CbAe6SlPUyz+63Xivd/GyuOyGKBuxwIqeYOvMmXyRcUjW8YydtCq8QQX
	 Y+JlPHX2sjlgA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 RESEND 2/2] usb: typec: Add onsemi FUSB15201 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260911073414.16711-3-shengchao.guo@oss.qualcomm.com>
References: <20260911073414.16711-1-shengchao.guo@oss.qualcomm.com>
 <20260911073414.16711-3-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 07:47:44 +0000
Message-Id: <20260911074745.0AA601F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Dangling fwnode pointer in the Type-C port device due to missing r=
eference increment.
- [Medium] Data race on driver state and hardware updates during probe.
- [Medium] Unhandled hardware interrupts may cause an IRQ storm.
--

commit 8e96d9a2937eced73eec22a51fca02079409de61
Author: Shawn Guo <shengchao.guo@oss.qualcomm.com>
usb: typec: Add onsemi FUSB15201 driver

This commit adds a new driver for the onsemi FUSB15201 dual-port USB Type-C=
=20
and Power Delivery controller. It registers a Type-C port for each connecto=
r=20
described in the firmware, reporting attach/detach events and roles, and=20
drives the USB role switch for OTG support.

> diff --git a/drivers/usb/typec/fusb15201.c b/drivers/usb/typec/fusb15201.c
> new file mode 100644
> index 0000000000000..897b2fabc449e
> --- /dev/null
> +++ b/drivers/usb/typec/fusb15201.c

[ ... ]

> +static irqreturn_t fusb15201_irq(int irq, void *data)
> +{
> +	struct fusb15201 *chip =3D data;
> +	irqreturn_t ret =3D IRQ_NONE;
> +	unsigned int i;
> +
> +	guard(mutex)(&chip->lock);
> +
> +	for (i =3D 0; i < FUSB15201_NUM_PORTS; i++) {
> +		struct fusb15201_port *port =3D &chip->ports[i];
> +		unsigned int pending;
> +
> +		if (!port->port)
> +			continue;
> +
> +		if (regmap_read(chip->regmap, FUSB15201_REG_INTERRUPT(i),
> +				&pending))
> +			continue;
> +
> +		pending &=3D FUSB15201_INT_ALL;
> +		if (!pending)
> +			continue;
> +
> +		/* Write one to clear */
> +		regmap_write(chip->regmap, FUSB15201_REG_INTERRUPT(i), pending);

[Severity: Medium]
Will this leave unknown interrupt bits permanently asserted, causing an IRQ
storm? If the hardware asserts an unhandled interrupt bit, it is masked out
from `pending` before the 'write one to clear' operation, so it is never
cleared.

[ ... ]

> +static int fusb15201_register_port(struct fusb15201 *chip,
> +				   struct fwnode_handle *fwnode)
> +{
> +	struct fusb15201_port *port;
> +	unsigned int index;
> +	int ret;

[ ... ]

> +	port->cap.revision =3D USB_TYPEC_REV_2_0;
> +	port->cap.orientation_aware =3D true;
> +	port->cap.driver_data =3D port;
> +	port->cap.ops =3D &fusb15201_typec_ops;
> +
> +	port->port =3D typec_register_port(chip->dev, &port->cap);

[Severity: High]
Does this create a dangling pointer to the fwnode?

The fwnode passed into typec_register_port() via `port->cap` is from
the device_for_each_child_node_scoped() iterator in fusb15201_probe().
Since the Type-C class does not take its own reference to the fwnode when
saving it to the device structure, the fwnode becomes a dangling pointer as
soon as the loop iteration ends and the scoped reference is dropped.

[ ... ]

> +static int fusb15201_hw_init(struct fusb15201 *chip)
> +{
> +	bool source_only =3D true;
> +	unsigned int i;
> +	int ret;
> +
> +	for (i =3D 0; i < FUSB15201_NUM_PORTS; i++) {
> +		struct fusb15201_port *port =3D &chip->ports[i];
> +
> +		if (!port->port) {
> +			/* Nothing describes this port, keep it quiet. */
> +			ret =3D regmap_write(chip->regmap,
> +					   FUSB15201_REG_INT_MASK(i),
> +					   FUSB15201_INT_ALL);
> +			if (ret)
> +				return ret;
> +
> +			continue;
> +		}
> +
> +		if (port->cap.type !=3D TYPEC_PORT_SRC)
> +			source_only =3D false;
> +
> +		ret =3D regmap_write(chip->regmap, FUSB15201_REG_INT_MASK(i), 0);

[Severity: Medium]
Does writing 0 unmask all interrupt bits for the active port, including any
undocumented ones? If the hardware asserts an unhandled interrupt, it might
not be cleared in fusb15201_irq() because it gets masked out, potentially
leading to an IRQ storm.

[ ... ]

> +static int fusb15201_probe(struct i2c_client *client)
> +{
> +	struct device *dev =3D &client->dev;
> +	struct fusb15201 *chip;
> +	unsigned int i, nports =3D 0;
> +	int ret;

[ ... ]

> +	ret =3D fusb15201_hw_init(chip);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to initialise\n");
> +
> +	/* Seed the Type-C class with the current state before arming the IRQ */
> +	for (i =3D 0; i < FUSB15201_NUM_PORTS; i++) {
> +		if (chip->ports[i].port)
> +			fusb15201_hw_update(&chip->ports[i]);
> +	}

[Severity: Medium]
Can this race with concurrent sysfs operations?

fusb15201_hw_update() updates shared driver state (like `port->status`)
without holding `chip->lock`.

Meanwhile, since the port is already registered and exposed to sysfs,
userspace can concurrently access it, invoking fusb15201_dr_set() ->
fusb15201_command(), which correctly acquires `chip->lock` but reads
the racing `port->status`.

> +
> +	ret =3D devm_request_threaded_irq(dev, client->irq, NULL, fusb15201_irq,
> +					IRQF_ONESHOT, dev_name(dev), chip);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to request irq\n");
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911073414.1671=
1-1-shengchao.guo@oss.qualcomm.com?part=3D2
