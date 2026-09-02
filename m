Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B0437F739
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 05:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788325936; cv=none; b=awmfBqn2/2Rbj537mj49B056TJcJ/uW6ou1w8ZXW9M3xYx/sfPvfvhu/FNuOJmlgE9L+BGNOMz/DstOGECg/c2nvcLNl6YXDnaL59VPHLMO/5zhH1a0eei3QUMU5mC+xkdR1+pjtQJ4pgZQ18O5e87gGsmgRxdtqPMmzoy9+azE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788325936; c=relaxed/simple;
	bh=qJF93KztwCM/zWcfk18nbYdw+lbZKukvBRUT5Co1Oh8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NzwAsK53zEIRqoC6Z7CzC4VOxJM2MFXjfZ3mIPzoL6NfaawU+jEZUJPakeOT76oAzl7EVkKVBlF5LKqZbIXBdsOKtcsu6Gaf12AuNkEJ+nQhqBEqz/OG7PG/rDCpoL9V5qZofynwf02FNwGyibMHe8A0ttwxzhaGaYbp9qwQ9Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HcLiHoiy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HcLiHoiy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FC1B1F000E9;
	Wed,  2 Sep 2026 05:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788325931;
	bh=39RHCgNAQgMzGaZQNMiJYRlN0aoSbOa5Hza583Np1GA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HcLiHoiyrlv8R19RYEbM72ydEKsQ0lSVRfp4Xyoog+EJHxxF+QjAMJj41VT7DBfjs
	 DJuzj6Ojo5ENp35jm+luxovZrlMvQFC+rzXmLw2o29+8Xk7c0jBlf7FvAkal2/SJdy
	 17xPZCJ6F354sGR9+ZCrXxr7DuO7oudFSKetE2SMAVTv6nEikLr0417RlVOmvc23US
	 YxmO0gy8hk6zODoKperbJwY9tlMY11ii6jc0rPllJSDgLceU0gXtDOw9cKLGhpp4P3
	 TVUnmguDlkhVKUzxem+xV3wIXubHCoh2rUHIqjdidIKx40QlJyPAoKWkQ6UnOCxfyK
	 DkbTjQDks6jtQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] usb: typec: Add onsemi FUSB15201 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260902045938.184221-3-shengchao.guo@oss.qualcomm.com>
References: <20260902045938.184221-1-shengchao.guo@oss.qualcomm.com>
 <20260902045938.184221-3-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 05:12:11 +0000
Message-Id: <20260902051211.9FC1B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Flawed interrupt handling leaves unknown bits unmasked and unclear=
ed, leading to persistent interrupt storms.
- [High] The driver incorrectly enables global Dual Role Power (DRP) toggli=
ng if any port is configured as Sink-only, violating the port capabilities.
- [Medium] The USB role switch is not reset to USB_ROLE_NONE during driver =
unbind, leaving the external USB controller in an active state.
--

commit 6b9e1b8d15d5c504ba4fc579e782da3b1bebac98
Author: Shawn Guo <shengchao.guo@oss.qualcomm.com>

usb: typec: Add onsemi FUSB15201 driver

The commit introduces the onsemi FUSB15201 dual-port USB Type-C and Power
Delivery controller driver. It handles Type-C state detection, PD negotiati=
on,
and allows for role swapping via sysfs.

> diff --git a/drivers/usb/typec/fusb15201.c b/drivers/usb/typec/fusb15201.c
> new file mode 100644
> index 0000000000000..920c561b62761
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

[Severity: High]
If the hardware asserts an undocumented or reserved interrupt bit (e.g.
bits 3-7), does this masking leave those bits permanently uncleared? Since
they are masked out of the pending variable here, regmap_write won't clear
them. This might cause a persistent level-triggered IRQ storm if an unknown
bit triggers.

[ ... ]

> +static void fusb15201_put_role_sw(void *data)
> +{
> +	usb_role_switch_put(data);
> +}

[Severity: Medium]
Does this leave the external USB controller stuck in an active state if the
driver is unbound while attached? The driver correctly sets the role to
USB_ROLE_NONE on detach during normal operation, but that doesn't appear
to be called during this devres cleanup path.

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

[Severity: High]
Since FUSB15201_INT_ALL is 0x07, does writing it to the mask register
mask bits 0-2 but leave bits 3-7 unmasked? This could expose the system to
the un-clearable interrupts mentioned above for unconfigured ports.

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

[Severity: High]
Writing 0 appears to unmask all 8 bits, not just the known bits 0-2. Could
this also allow unknown interrupts to trigger and cause an IRQ storm on
configured ports?

> +		if (ret)
> +			return ret;
> +
> +		/* Discard anything that happened before we got here */
> +		ret =3D regmap_write(chip->regmap, FUSB15201_REG_INTERRUPT(i),
> +				   FUSB15201_INT_ALL);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	/*
> +	 * Dual role toggling is the only configurable part of the Type-C state
> +	 * machine, and it is chip wide rather than per port, which is why it is
> +	 * set up here instead of from a port_type_set() callback.
> +	 */
> +	return regmap_update_bits(chip->regmap, FUSB15201_REG_MASTER_CONTROL,
> +				  FUSB15201_MASTER_DRP_DISABLE,
> +				  source_only ? FUSB15201_MASTER_DRP_DISABLE : 0);
> +}

[Severity: High]
If a port is configured as Sink-only (TYPEC_PORT_SNK), source_only becomes
false, which clears the MASTER_DRP_DISABLE bit. Doesn't this globally
enable Dual Role Power (DRP) toggling? If so, it would force fixed
Sink-only ports to periodically advertise as Sources, which could backdrive
power into attached devices or cause detection failures.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902045938.1842=
21-1-shengchao.guo@oss.qualcomm.com?part=3D2
