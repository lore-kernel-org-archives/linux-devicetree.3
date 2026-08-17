Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09C83F7895
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 10:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786963902; cv=none; b=qa816Sf+xXUdJN/vALKC0SPOkOOsg0brNbhqoAsCMfq89r12RXGGxzx2GlkhVfklq++SKiJrOkKt4RFNejrJC+iJEDxxFWJ+mfEdi3f4ywz1fr9WVCbpW0O/S+GEx+kJ5L5gQW6Qe3e1ifNb6kQz9Ms+sew0t5VX79aAmgxL0hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786963902; c=relaxed/simple;
	bh=7YWBD0YyknBY5T8okl9g2FuOFsbY9WSWW1xh0YLZ3Kk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ExEwR3Z/wWLZvgPouCYw3xpOVoQNDM1sjyD1ezEXwylDS3Uf1BgJKTGnUAoskQS1TOcSiRXgexhrPsFdr8acJFr4FFKJkLOKgbFq88185pAaHiSLI8RLxJJZY/sBcDGJQa+U247y6yq8+QmOg6J7RoOPJFh8NE2Mrr3XRjj2Hug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OjAHE3eV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OjAHE3eV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 357761F00A3F;
	Mon, 17 Aug 2026 10:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786963891;
	bh=HFQISIuy+LhXeeJKYVr0XIL/DO1PxnaTfCKVFinVlBs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OjAHE3eVAmE56tDjdJRw9nNKVaymAt3BcbS9oswLfw1pt5VSNIdwUxnoqmANg22lv
	 65L1j85wXirOZb0NVxeeby/1fYl5biNkPXQf6zIbqmW2v33bpXg4obbH3TyHxjJGOq
	 4M4lyDBRUx5IgruCH1DQxEelePeoZSOEjA7P1OvdCtLEebNaRI1MBhXF9sw1x/Ob0H
	 Kex3h/PYzVFNwS+wdpH49x5QM/rQ071hyuSyoIw3+RQZiMmJHiTH0b7ogvjRdrPw2k
	 CTxkFG9jGNNobI+JUwdcmm1VZW3Atb2hJ2jweMgm1u7YZZAsR7LFeM5eXeOvrcN8PH
	 eX5WHXA1/EHkQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v15 7/8] i3c: hub: p3h2x4x: Add support for NXP P3H2x4x
 I3C hub functionality
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: Frank.Li@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, linux-i3c@lists.infradead.org
In-Reply-To: <20260817103844.2142802-8-lakshay.piplani@nxp.com>
References: <20260817103844.2142802-1-lakshay.piplani@nxp.com>
 <20260817103844.2142802-8-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Aug 2026 10:51:30 +0000
Message-Id: <20260817105131.357761F00A3F@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Premature freeing of `struct i3c_master_controller` memory via dev=
res while the driver core may still hold references to its embedded `struct=
 device`.
- [Medium] Mixing goto-based error handling with scope-based cleanup helper=
s in the same function.
- [Medium] The hub driver improperly injects its private context into the p=
arent MFD driver's data structure via a bespoke pointer, tightly coupling t=
he layers.
- [Medium] The SMBus transfer polling timeout is too tight, leading to prem=
ature failures on legal target clock stretching.
- [Medium] Ignored failure to enable explicitly defined regulators.
--

--- Patch [7]: [PATCH v15 7/8] i3c: hub: p3h2x4x: Add support for NXP P3H2x=
4x I3C hub functionality ---
commit e98ff2e22cdda2aa4bb2578e7f060053f335dbde
Author: Aman Kumar Pandey <aman.kumarpandey@nxp.com>

i3c: hub: p3h2x4x: Add support for NXP P3H2x4x I3C hub functionality

This commit introduces the driver for NXP P3H2x4x multiport I3C hubs. It
supports downstream target ports configured as I3C, I2C, or SMBus,
facilitating communication between the host and downstream devices.

> diff --git a/drivers/i3c/hub/p3h2840_i3c_hub_common.c b/drivers/i3c/hub/p=
3h2840_i3c_hub_common.c
> --- /dev/null
> +++ b/drivers/i3c/hub/p3h2840_i3c_hub_common.c
> @@ -0,0 +1,428 @@
[ ... ]
> +static int p3h2x4x_configure_ldo(struct device *dev)
> +{
> +	static const char * const supplies[] =3D {
> +		"vcc1",
> +		"vcc2",
> +		"vcc3",
> +		"vcc4"
> +	};
> +	int ret, i;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(supplies); i++) {
> +		ret =3D devm_regulator_get_enable_optional(dev, supplies[i]);
> +		if (ret =3D=3D -EPROBE_DEFER)
> +			return -EPROBE_DEFER;
> +
> +		if (ret && ret !=3D -ENODEV)
> +			dev_warn(dev, "Failed to enable %s (%d)\n",
> +				 supplies[i], ret);

[Severity: Medium]
Is it safe to ignore a failure when enabling explicitly defined regulators?

If devm_regulator_get_enable_optional() fails with an error other than
-ENODEV or -EPROBE_DEFER, the driver logs a warning and proceeds. Ignoring =
an
actual failure could lead the driver to attempt communication with unpowered
hardware, which might cause transaction timeouts or access to undefined
register states.

Should the initialization be aborted and the error propagated instead?

> +	}
> +
> +	/* This delay is required for the regulator to stabilize its output vol=
tage */
> +	fsleep(5000);
> +
> +	return 0;
> +}
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

[Severity: High]
Can the use of devm_kzalloc here lead to a use-after-free?

The p3h2x4x_i3c_hub_dev structure embeds multiple i3c_master_controller
instances, which in turn embed struct device instances registered later via
i3c_master_register_fwnode().

If the driver unbinds, devres will immediately free the p3h2x4x_i3c_hub_dev
block. However, if a user holds a reference to an I3C master sysfs attribute
(e.g., while reading files under /sys/class/i3c/), the driver core might
still hold a reference to the embedded struct device. When the final
reference is dropped and the device release callback is invoked, the core
would access freed memory.

Should this allocation be managed by reference counting instead of devres?

> +	if (!p3h2x4x_i3c_hub)
> +		return -ENOMEM;
[ ... ]
> +	/* Register virtual I3C master controllers for I3C target ports */
> +	if (p3h2x4x->i3cdev) {
> +		p3h2x4x_i3c_hub->i3cdev =3D p3h2x4x->i3cdev;
> +		/*
> +		 * Publish the hub context in the MFD parent struct rather than
> +		 * via i3cdev_set_drvdata(), which would overwrite the parent's
> +		 * drvdata (struct p3h2x4x) that the IBI handler and other MFD
> +		 * callbacks rely on. Publish it before p3h2x4x_tp_i3c_algo()
> +		 * enables IBI, since the IBI handler dereferences it.
> +		 */
> +		p3h2x4x->i3c_hub_priv =3D p3h2x4x_i3c_hub;

[Severity: Medium]
Does writing the child hub driver's context directly into the parent MFD
driver's data structure violate MFD isolation guidelines?

The driver injects a backpointer into p3h2x4x->i3c_hub_priv. MFD subsystem
guidelines generally mandate that parent-child data sharing must use standa=
rd
APIs (like dev_get_drvdata) and prohibit writing bespoke accessors or holdi=
ng
child state directly in the parent.

Could this create tight coupling between layers and risk use-after-free bugs
if lifetimes mismatch?

> +
> +		/*
> +		 * Register the clear action before enabling IBI so that, on the
[ ... ]
> diff --git a/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c b/drivers/i3c/hub/p3=
h2840_i3c_hub_smbus.c
> --- /dev/null
> +++ b/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c
> @@ -0,0 +1,337 @@
[ ... ]
> +static int p3h2x4x_read_smbus_transaction_status(struct p3h2x4x_i3c_hub_=
dev *hub,
> +						 u8 target_port_status,
> +						 u8 data_length)
> +{
> +	unsigned int timeout_us, sleep_us;
> +	u32 status_read;
> +	u8 status;
> +	int ret;
> +
> +	timeout_us =3D P3H2X4X_SMBUS_400kHz_TRANSFER_TIMEOUT(data_length);
> +	sleep_us =3D clamp(timeout_us / P3H2X4X_SMBUS_POLL_COUNT,
> +			 P3H2X4X_SMBUS_POLL_INTERVAL_MIN_US,
> +			 P3H2X4X_SMBUS_POLL_INTERVAL_MAX_US);
> +
> +	ret =3D regmap_read_poll_timeout(hub->regmap, target_port_status,
> +				       status_read,
> +				       status_read & P3H2X4X_SMBUS_TRANSACTION_FINISH_FLAG,
> +				       sleep_us,
> +				       timeout_us);

[Severity: Medium]
Could this timeout be too tight for standard SMBus targets?

The timeout_us calculation allows a maximum of 100us overhead for the entire
transaction. However, the SMBus specification permits targets to stretch the
clock for much longer periods (up to 35 milliseconds).

If a target legally stretches the clock, regmap_read_poll_timeout() will hit
the timeout and abort the software transaction while the hardware is still
executing the transfer.

Should a larger, more standard timeout be used here to accommodate clock
stretching?

> +	if (ret)
> +		return ret;
[ ... ]
> +int p3h2x4x_tp_smbus_algo(struct p3h2x4x_i3c_hub_dev *hub)
> +{
> +	struct p3h2x4x *p3h2x4x =3D dev_get_drvdata(hub->dev->parent);
> +	int ret, ret2;
> +	u8 tp;
> +
> +	mutex_lock(&p3h2x4x->protected_reg_lock);
> +
> +	ret =3D regmap_write(hub->regmap, P3H2X4X_DEV_REG_PROTECTION_CODE,
> +			   P3H2X4X_REGISTERS_UNLOCK_CODE);
> +	if (ret)
> +		goto out_unlock_mutex;
> +
> +	ret =3D regmap_write(hub->regmap, P3H2X4X_TP_SMBUS_AGNT_IBI_CONFIG, P3H=
2X4X_IBI_DISABLED);
> +
> +	ret2 =3D regmap_write(hub->regmap, P3H2X4X_DEV_REG_PROTECTION_CODE,
> +			    P3H2X4X_REGISTERS_LOCK_CODE);
> +	if (!ret && ret2)
> +		ret =3D ret2;
> +
> +out_unlock_mutex:
> +	mutex_unlock(&p3h2x4x->protected_reg_lock);
> +	if (ret)
> +		return ret;
> +
> +	for (tp =3D 0; tp < p3h2x4x->num_target_ports; tp++) {
> +		if (!hub->tp_bus[tp].of_node ||
> +		    hub->hub_config.tp_config[tp].mode !=3D P3H2X4X_TP_MODE_SMBUS)
> +			continue;
> +
> +		/* Allocate adapter */
> +		struct i2c_adapter *smbus_adapter =3D
> +			devm_kzalloc(hub->dev, sizeof(*smbus_adapter), GFP_KERNEL);
> +		if (!smbus_adapter) {
> +			p3h2x4x_unregister_smbus_adapters(hub);
> +			return -ENOMEM;
> +		}
> +
> +		/* Initialize adapter */
> +		smbus_adapter->owner =3D THIS_MODULE;
> +		smbus_adapter->class =3D I2C_CLASS_HWMON;
> +		smbus_adapter->algo =3D &p3h2x4x_tp_i2c_algorithm;
> +		smbus_adapter->quirks =3D &p3h2x4x_tp_i2c_quirks;
> +		smbus_adapter->dev.parent =3D hub->dev;
> +		smbus_adapter->dev.of_node =3D hub->tp_bus[tp].of_node;
> +		snprintf(smbus_adapter->name, sizeof(smbus_adapter->name),
> +			 "p3h2x4x-i3c-hub.tp-port-%d", tp);
> +
> +		i2c_set_adapdata(smbus_adapter, &hub->tp_bus[tp]);
> +
> +		/*
> +		 * Publish the callback-visible state before i2c_add_adapter(),
> +		 * which can synchronously probe a DT slave and invoke
> +		 * reg_slave() that inspects is_registered/tp_smbus_client and
> +		 * sets ibi_en. Seeding defaults here keeps reg_slave()'s view
> +		 * consistent and avoids clobbering its ibi_en update. Do not
> +		 * hold etx_mutex across the call, since reg_slave() also takes it.
> +		 */
> +		scoped_guard(mutex, &hub->etx_mutex) {

[Severity: Medium]
Is it appropriate to mix goto-based error handling and scoped cleanup macros
in the same function?

This function uses a goto out_unlock_mutex sequence for error handling of
protected_reg_lock, but later uses the scoped_guard() macro for etx_mutex.

According to kernel cleanup guidelines, mixing goto-based error handling wi=
th
scope-based cleanup helpers in the same function is discouraged because it =
can
create confusing ownership semantics and increase the risk of resource leaks
or double-unlocks during future modifications.

Could all resources in this routine be converted to scope-based cleanup, or
none of them?

> +			hub->tp_bus[tp].tp_smbus_adapter =3D smbus_adapter;
> +			hub->tp_bus[tp].tp_smbus_client =3D NULL;
> +			hub->tp_bus[tp].is_registered =3D true;
> +			hub->hub_config.tp_config[tp].ibi_en =3D false;
> +		}
> +
> +		/* Register adapter */

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817103844.2142=
802-1-lakshay.piplani@nxp.com?part=3D7
