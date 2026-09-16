Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DFC34E1C83
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 18:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789584216; cv=none; b=hXUncKbeQkADyOKw2SED+Cvjdcsjh75hsV9X93xwymj5ZvfglRF18ZCW0CSQe5ioASU7w9JvTXVkKrMAFjgT9puSXgGzxrU9b35Nhvh2m8gKUpeHCm2hdS4LNFedjcI27o1i1JAmpFTIEUN2/GqQU5yxgQflVZSsYOfRpyLUU4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789584216; c=relaxed/simple;
	bh=kee/71fHs7Ju/5WKcZqYY2kLwTGhwT16EnSnVdQmACg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=X8t/epFjd4SddLTXhdFWNiUrO9njLohU/uUDNcUTugaHaNDKNquebMs5i3XYQe1kYiPIsAHGkMhIyl8mgBhJuVxjWYvPYwGvyvCGJS2A//gO4Cc9B1cXSPTlvNZAT/o06ZdzFSwRNQHvNGtnaO8vz+1Oe3OrxgaJbFTJ3IsBt1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oE117oSg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oE117oSg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C6661F000FF;
	Wed, 16 Sep 2026 18:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789584206;
	bh=P+2RGy2rLbJ8/rXgPYxpLBrUXWom2Wr97rcX00RO2c8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oE117oSgjP5J4q3Rrqk9amUI6a05RKj9A9Ni5fC+6JSn8pilTnfuYJlIaiRN7ECE2
	 S4JlEuNYLm48QVeBkJqeIj11JaxG7SiPXiQG6YaDLCpCXvUrQ6GlBF3TAqFK8mopEz
	 TVN73YbIOrB7k7BXSpXi91zYzhFm/fzatOxJhS4KNkucHfcCs20lOhOfcbvMaQlJdg
	 dahAVbTL2IiUu7WQKDgmMUh1yOQ9dUqQu9EhJIzESFqdePhWOKX+dMrha8hyfd3U55
	 73CAqYvKkKI3meL8wsVyYsbeUfkS3DmL6JtwjRX4LxvGJ13gzvnkqX0DrklAnTBCRL
	 JoDpK/Q4DuOwQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] pps: clients: gpio: release pins to an inactive
 state on remove and shutdown
Reply-To: sashiko-reviews@lists.linux.dev
To: "Eliav Farber" <farbere@amazon.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260916182641.9768-3-farbere@amazon.com>
References: <20260916134744.46354-1-farbere@amazon.com>
 <20260916182641.9768-1-farbere@amazon.com>
 <20260916182641.9768-3-farbere@amazon.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 18:43:25 +0000
Message-Id: <20260916184326.4C6661F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] pps-gpio: unconditional probe failure for boards without pinctrl b=
indings
- [Medium] pps-gpio: pins left in 'default' state on probe failure
--

commit 8a9e09ee4e79423b318933ea7fb883c1d285a638
Author: Eliav Farber <farbere@amazon.com>

pps: clients: gpio: release pins to an inactive state on remove and shutdown

This patch looks up an optional "inactive" pinctrl state in probe and
selects it on remove and shutdown to release the pins. The goal is to
prevent pins from staying stuck in the GPIO function for subsequent
executions like kexec or after the driver is unbound.

> diff --git a/drivers/pps/clients/pps-gpio.c b/drivers/pps/clients/pps-gpi=
o.c
> index 73ec2c7335e51..e619c7bb2f78a 100644
> --- a/drivers/pps/clients/pps-gpio.c
> +++ b/drivers/pps/clients/pps-gpio.c

[ ... ]

> @@ -96,6 +99,51 @@ static void pps_gpio_echo_timer_callback(struct timer_=
list *t)
>  	gpiod_set_value(info->echo_pin, 0);
>  }
> =20
> +/*
> + * Look up the optional "inactive" pinctrl state: the mux to restore when
> + * pps-gpio is unbound or the system is shut down. It is only meaningful
> + * paired with a "default" state, which the driver core applies before p=
robe
> + * to mux the pins for PPS use. A board that describes neither is unaffe=
cted;
> + * one that describes "inactive" without "default" is rejected, since
> + * releasing pins that were never put into a defined PPS state is incohe=
rent.
> + */
> +static int pps_gpio_get_pins(struct device *dev)
> +{
> +	struct pps_gpio_device_data *data =3D dev_get_drvdata(dev);
> +	struct pinctrl_state *pins_default;
> +
> +	data->pinctrl =3D devm_pinctrl_get(dev);
> +	if (IS_ERR(data->pinctrl))
> +		return dev_err_probe(dev, PTR_ERR(data->pinctrl),
> +				     "failed to get pinctrl\n");

[Severity: High]
If a board doesn't have explicit pinctrl bindings, won't devm_pinctrl_get()
return -ENODEV?

The driver core typically ignores -ENODEV to support devices without explic=
it
pinmuxes. Would treating it as a fatal error here cause the probe to fail
unconditionally on those boards and break existing setups?

> +
> +	/* The "inactive" state is optional; without it there is nothing to do.=
 */
> +	data->pins_inactive =3D pinctrl_lookup_state(data->pinctrl, "inactive");
> +	if (IS_ERR(data->pins_inactive)) {
> +		data->pins_inactive =3D NULL;
> +		return 0;
> +	}

[ ... ]

> @@ -161,6 +209,11 @@ static int pps_gpio_probe(struct platform_device *pd=
ev)
>  	if (ret)
>  		return ret;
> =20
> +	/* pinctrl setup (optional states) */
> +	ret =3D pps_gpio_get_pins(dev);
> +	if (ret)
> +		return ret;
> +
>  	/* IRQ setup */
>  	ret =3D gpiod_to_irq(data->gpio_pin);
>  	if (ret < 0) {

[Severity: Medium]
If an error occurs later in the probe function, for example in gpiod_to_irq=
()
or pps_register_source(), the function returns early:

pps_gpio_probe() {
	...
	ret =3D gpiod_to_irq(data->gpio_pin);
	if (ret < 0) {
		dev_err(dev, "failed to map GPIO to IRQ: %d\n", ret);
		return -EINVAL;
	}
	...
}

Since the driver core applies the 'default' pinctrl state before probe begi=
ns,
and these error paths exit without calling pps_gpio_release_pins(), would
the pins be left stuck in the 'default' state if probe fails?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916182641.9768=
-1-farbere@amazon.com?part=3D2
