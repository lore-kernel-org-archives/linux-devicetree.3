Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A236442FB7
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 07:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789543395; cv=none; b=n4jSJxnokp+Qf6vUrNEK+FwSvJOYF0+gi2ysbcD1749jkzsy9mvielmOAl3xvYuCvB+QHKGQJEl8nThwjMjMrh9lfsoNQC+LFCLQzmgP68gOuBKy/KfPsFG293gVtpYmXHAh7Iwy+tfW8erXINDVjqrJt1Xizdig/YLcDcUhQmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789543395; c=relaxed/simple;
	bh=QPc7f2dun9um9enKd+vZBehqhPvOXTyuugdtp0p32dI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bdszN6wddHpoTXuzRXExRWJZ1zxXfoWX9oYfJnDM2ahnnV3TfqQukf82SMWaIOMcD32HyHzlPkD5glZmBK/3QLGGDpErOPOAHK7Vdx/Gc6AtLopTZLTqVuM9cgb9esclboj5oOL7jtx2eTyUX1sim2HaenBODT3zT1KZybwjaTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e5fRudep; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e5fRudep"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C2C11F000FF;
	Wed, 16 Sep 2026 07:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789543369;
	bh=EcU7CN7CjVsnYuSepN3N2pAdFOqIDqrxhG5JtYEvsKE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=e5fRudepLUbzldkPkhvmH8KsVsNtyKgW4n26oGtxMqRwZRNXTN+n6Rrq7hWGBy+D8
	 BSitPsfBfdF0Y4gNhq4cloajLT/rkJi9gs+FtT9Daq+RzGYouahQwXwAOFqh3Zz74Z
	 vODteIiEwVjtpYg7oo/BvWuIQPUVjObX5OwPGjiEJb8kPVgk7ioXchnz7xE1K+o0ky
	 OAuecDCyY5DqEuJZMTh5ultn8EJAhk733yvyOSZoZoTxhdFTWK7qFRP12aD+TpQ1Ea
	 IZVKzDuWUz0uenSJWPoMGhvovriy3i/aKoIEb0t3kBnHEakPOmtiD1LB2Ua70bi8pQ
	 EGgT52Q2m2GbA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v19 7/8] i3c: hub: p3h2x4x: Add support for NXP P3H2x4x
 I3C hub functionality
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: devicetree@vger.kernel.org, Frank.Li@kernel.org, linux-i3c@lists.infradead.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260916070728.1088801-8-lakshay.piplani@nxp.com>
References: <20260916070728.1088801-1-lakshay.piplani@nxp.com>
 <20260916070728.1088801-8-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 07:22:48 +0000
Message-Id: <20260916072249.3C2C11F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] i3c: UAF of i3c_master_controller due to devres and device_unregis=
ter mismatch
- [High] i3c: Race condition in target port connection causes early transfe=
rs to fail
--

commit 9976472402f2b50b56d71088f609b4b246b5e249
Author: Aman Kumar Pandey <aman.kumarpandey@nxp.com>

    i3c: hub: p3h2x4x: Add support for NXP P3H2x4x I3C hub functionality
   =20
    Add I3C hub functionality for the NXP P3H2x4x family of multiport hubs.
    These devices support downstream target ports that can be configured
    as I3C, I2C, or SMBus.

> diff --git a/drivers/i3c/hub/p3h2840_i3c_hub_common.c b/drivers/i3c/hub/p=
3h2840_i3c_hub_common.c
> --- /dev/null
> +++ b/drivers/i3c/hub/p3h2840_i3c_hub_common.c
[ ... ]
> +static int p3h2x4x_i3c_hub_probe(struct platform_device *pdev)
> +{
> +	struct p3h2x4x *p3h2x4x =3D dev_get_drvdata(pdev->dev.parent);
> +	struct p3h2x4x_i3c_hub_dev *p3h2x4x_i3c_hub;
> +	struct device *dev =3D &pdev->dev;
> +	struct device_node *node;
> +	int ret, i;
> +
> +	p3h2x4x_i3c_hub =3D devm_kzalloc(dev, sizeof(*p3h2x4x_i3c_hub), GFP_KER=
NEL);
> +	if (!p3h2x4x_i3c_hub)
> +		return -ENOMEM;

[ ... ]

> diff --git a/drivers/i3c/hub/p3h2840_i3c_hub_i3c.c b/drivers/i3c/hub/p3h2=
840_i3c_hub_i3c.c
> --- /dev/null
> +++ b/drivers/i3c/hub/p3h2840_i3c_hub_i3c.c
[ ... ]
> +static void p3h2x4x_unregister_i3c_master(void *data)
> +{
> +	struct i3c_master_controller *controller =3D data;
> +
> +	i3c_master_unregister(controller);
> +}
[ ... ]
> +int p3h2x4x_tp_i3c_algo(struct p3h2x4x_i3c_hub_dev *p3h2x4x_hub)
> +{
[ ... ]
> +	for (tp =3D 0; tp < p3h2x4x->num_target_ports; tp++) {
[ ... ]
> +		ret =3D i3c_master_register_fwnode(controller,
> +						 p3h2x4x_hub->dev,
> +						 of_fwnode_handle(p3h2x4x_hub->tp_bus[tp].of_node),
> +						 &i3c_hub_master_ops,
> +						 false);
> +		if (ret)
> +			return ret;
> +
> +		ret =3D devm_add_action_or_reset(p3h2x4x_hub->dev,
> +					       p3h2x4x_unregister_i3c_master,
> +					       controller);
> +		if (ret)
> +			return ret;

[Severity: High]
Does this create a use-after-free risk during driver removal?

The p3h2x4x_i3c_hub structure embeds the i3c_master_controller instances
and is allocated with devm_kzalloc() in p3h2x4x_i3c_hub_probe(). When the
driver unbinds, devres will execute p3h2x4x_unregister_i3c_master() which
calls i3c_master_unregister().

Unlike i2c_del_adapter(), i3c_master_unregister() calls device_unregister()
without waiting for the device reference count to reach zero. Because the
devm cleanup phase executes without blocking for final device release, the
devm_kzalloc memory can be freed before the deferred release callback=20
(i3c_masterdev_release) runs. If userspace holds a reference (e.g., via
sysfs), this will result in a use-after-free crash when the final reference
is dropped.

> +
> +		ntwk_mask |=3D p3h2x4x_hub->tp_bus[tp].tp_mask;
> +		p3h2x4x_hub->tp_bus[tp].is_registered =3D true;
> +		p3h2x4x_hub->hub_config.tp_config[tp].always_enable =3D true;
> +	}
> +	return regmap_write(p3h2x4x_hub->regmap, P3H2X4X_TP_NET_CON_CONF, ntwk_=
mask);
> +}

[Severity: High]
Does this leave a race window where early transfers on newly registered por=
ts
can fail?

When i3c_master_register_fwnode() (called earlier in the loop) returns, the
virtual master is exposed to the system and can begin accepting transfers.
Immediately after, always_enable is set to true, disabling the software
enable_port callback logic. However, the hardware port enable write to
P3H2X4X_TP_NET_CON_CONF happens outside the loop.

If a child device probes or a transfer is initiated on a port before the
loop finishes, the enable_port callback will check always_enable, see it is
true, and return without enabling the port in hardware. This would send the
transfer to a disconnected physical port and cause I/O errors or timeouts.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916070728.1088=
801-1-lakshay.piplani@nxp.com?part=3D7
