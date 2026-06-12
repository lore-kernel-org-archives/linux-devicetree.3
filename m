Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E1238F951
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 11:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781264391; cv=none; b=C2vghjvN4ZglEYaRQ+gHcyXG52k0UKs01cUgyyWDt2lShGiNXRVW1jRyFSa+NYlC8mQ1u6Uo+Codig/ypmvjr0ltYP3JIZN521BQRFNVZ0PbaBFXKyQ7Gpv3TztUmzEAyxMo2gMGpHVfCreOOoJ/QA6LVLCIdQVnOqvsODQjmQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781264391; c=relaxed/simple;
	bh=1yRdsdQb1CWJE8nqoPo6A4nD/UUMKfUsxnjyOEMP6vE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GPz//pTduHajfVGyidSPSx6zVmSSwK4ESYPInHo3cyuUBv9mo2gGY4/80KrhCwqdi4Fn94EqUsXkJw4GxRijjuk37io8CERKhtYiB7wVYmOi1R3cqgKFLd+rhtKJH0uTqbluMa5dNpwZA+qwhaYKjEohORvXOPpI/fVf/7VEhG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MaGkRvOy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MaGkRvOy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F33BF1F000E9;
	Fri, 12 Jun 2026 11:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781264389;
	bh=bECiRRUcArm9LAJvqO45enZwy1z6yFFFElOymO6m/iE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MaGkRvOyLJMAEOOzdnt10WfPYYDXUMK18jdD6kSSg+1wYIyMcEXLr5N4tneLGA2PF
	 ZqEzqfyapcsjFTbkjFI09QPbfQZMHmFIMQUvLJJ2LXfwd7QK5Rp8VAW8f9gUXrhRsp
	 R8TahD55LTL1r91PfgxOc4ajVTGRQGLJFj17DJFvtYq1ckSRKx3crBf5/JrEjOx72O
	 wRtcr89CuX6WAzUQpPP1U15guVrNMiy8E3twa27bXIq/mRUGmatZthZ43jZjZ2YsjY
	 38SehvdGJK871nbiM3kQbhz83jN1qcpdY8jRdXKJeQRiL2m6R64h6VYWrAeZGZi09u
	 J8xXoBpKt5AAg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 8/9] i3c: hub: p3h2x4x: Add support for NXP P3H2x4x
 I3C hub functionality
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: Frank.Li@kernel.org, linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260612111816.3688240-9-lakshay.piplani@nxp.com>
References: <20260612111816.3688240-9-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 12 Jun 2026 11:39:48 +0000
Message-Id: <20260612113948.F33BF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 10 potential issue=
(s) to consider:
- [High] Regulator devres cleanup actions are erroneously attached to the p=
arent device instead of the child device being probed.
- [High] SMBus I2C adapters are not unregistered on probe error paths, caus=
ing a Use-After-Free.
- [High] In-Band Interrupt (IBI) remains requested and enabled on probe fai=
lure, causing a Use-After-Free.
- [High] Unsafe reliance on non-deterministic delays without polling the SM=
Bus finish flag causes premature data reads.
- [High] The driver dynamically overwrites the shared platform device's `of=
_node` pointer, corrupting the core device tree state.
- [High] `regmap_update_bits` uses the configuration value as the bitmask, =
failing to clear stale bits.
- [High] DAA is performed on the upstream bus before the downstream target =
ports are physically enabled.
- [Medium] Target port device tree node references acquired during probe ar=
e leaked on error paths.
- [Medium] Default configuration structures are populated with enum values =
instead of Ohms, causing misconfiguration.
- [Low] Dead code due to incorrect `IS_ERR` check on `devm_kzalloc` return =
value.
--

commit 8d18a29a52d0297c45635edaf397ce828e709ef9
Author: Aman Kumar Pandey <aman.kumarpandey@nxp.com>

i3c: hub: p3h2x4x: Add support for NXP P3H2x4x I3C hub functionality

Add I3C hub functionality for the NXP P3H2x4x family of multiport hubs.
These devices support downstream target ports that can be configured
as I3C, I2C, or SMBus.

> diff --git a/drivers/i3c/hub/p3h2840_i3c_hub_common.c b/drivers/i3c/hub/p=
3h2840_i3c_hub_common.c
> new file mode 100644
> index 0000000000000..fedcb978f07ee
> --- /dev/null
> +++ b/drivers/i3c/hub/p3h2840_i3c_hub_common.c

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
> +		ret =3D devm_regulator_get_enable_optional(dev->parent, supplies[i]);

[Severity: High]
Could this leak devres memory on the parent device? By passing dev->parent
(the MFD parent device) instead of dev (the child hub device), the regulator
cleanup actions are attached to the parent. If the hub driver fails probe
or is repeatedly bound/unbound, it looks like these regulators won't be
disabled and the references will be leaked.

[ ... ]

> +static int p3h2x4x_configure_tp(struct device *dev)
> +{
> +	struct p3h2x4x_i3c_hub_dev *hub =3D dev_get_drvdata(dev);
> +	u8 mode =3D 0, smbus =3D 0, pullup =3D 0, target_port =3D 0;
> +	int tp, ret;
> +
> +	for (tp =3D 0; tp < P3H2X4X_TP_MAX_COUNT; tp++) {
> +		pullup |=3D hub->hub_config.tp_config[tp].pullup_en ? P3H2X4X_SET_BIT(=
tp) : 0;

[ ... ]

> +	ret =3D regmap_update_bits(hub->regmap, P3H2X4X_TP_PULLUP_EN, pullup, p=
ullup);

[Severity: High]
Does this fail to clear stale bits? The third argument to regmap_update_bit=
s()
is the mask. By using 'pullup' as the mask, it seems this only applies
operations to bits that are 1. Any bit that is 0 in 'pullup' is ignored,
which might leave stale hardware state (like pullups enabled by the
bootloader) unmodified. Should this use a proper mask covering all relevant
bits?

[ ... ]

> +static void p3h2x4x_get_target_port_dt_conf(struct device *dev,
> +					    const struct device_node *node)
> +{
> +	struct p3h2x4x_i3c_hub_dev *p3h2x4x_i3c_hub =3D dev_get_drvdata(dev);
> +	u64 tp_port;
> +
> +	for_each_available_child_of_node_scoped(node, dev_node) {
> +		if (of_property_read_reg(dev_node, 0, &tp_port, NULL))
> +			continue;
> +
> +		if (tp_port < P3H2X4X_TP_MAX_COUNT) {
> +			p3h2x4x_i3c_hub->tp_bus[tp_port].of_node =3D of_node_get(dev_node);

[Severity: Medium]
Is there a resource leak here on probe error paths? This manually increments
the reference count of the child nodes using of_node_get(). While
p3h2x4x_i3c_hub_remove() correctly drops these references, if
p3h2x4x_i3c_hub_probe() fails and returns an error, the remove callback
isn't executed. Without a devm cleanup action, could these OF nodes leak
memory?

[ ... ]

> +static void p3h2x4x_default_configuration(struct device *dev)
> +{
> +	struct p3h2x4x_i3c_hub_dev *p3h2x4x_i3c_hub =3D dev_get_drvdata(dev);
> +	int tp_count;
> +
> +	p3h2x4x_i3c_hub->hub_config.tp0145_pullup =3D P3H2X4X_TP_PULLUP_500R;

[Severity: Medium]
Are these default configuration values being set correctly? These fields
appear to be designed to store physical Ohm measurements, but they are
initialized to macros like P3H2X4X_TP_PULLUP_500R which evaluate to enum
indices (e.g., 1). When the default value 1 is later processed by
p3h2x4x_pullup_dt_to_reg() using find_closest(), it would resolve to the
closest table entry 250 instead of the intended 500. Should these initialize
with real-world units?

[ ... ]

> +static int p3h2x4x_i3c_hub_probe(struct platform_device *pdev)
> +{

[ ... ]

> +	/* Register virtual I2C adapters for SMBus target ports */
> +	ret =3D p3h2x4x_tp_smbus_algo(p3h2x4x_i3c_hub);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to add i2c adapter\n");
> +
> +	/* Lock access to protected registers */
> +	ret =3D regmap_write(p3h2x4x_i3c_hub->regmap, P3H2X4X_DEV_REG_PROTECTIO=
N_CODE,
> +			   P3H2X4X_REGISTERS_LOCK_CODE);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to lock HUB's protected registe=
rs\n");

[Severity: High]
Are the SMBus I2C adapters cleaned up if this final regmap_write() fails?
p3h2x4x_tp_smbus_algo() registers adapters using i2c_add_adapter(), which
requires an explicit i2c_del_adapter(). If the probe fails here, the adapte=
rs
are never unregistered, which leaves the I2C core with active references to
devm-freed memory. Could this cause a use-after-free?

> +
> +	return 0;
> +}

> diff --git a/drivers/i3c/hub/p3h2840_i3c_hub_i3c.c b/drivers/i3c/hub/p3h2=
840_i3c_hub_i3c.c
> new file mode 100644
> index 0000000000000..38505dda0e81b
> --- /dev/null
> +++ b/drivers/i3c/hub/p3h2840_i3c_hub_i3c.c

[ ... ]

> +int p3h2x4x_tp_i3c_algo(struct p3h2x4x_i3c_hub_dev *p3h2x4x_hub)
> +{

[ ... ]

> +	p3h2x4x_hub->hub =3D devm_kzalloc(p3h2x4x_hub->dev,
> +					sizeof(*p3h2x4x_hub->hub),
> +					GFP_KERNEL);
> +
> +	if (!p3h2x4x_hub->hub)
> +		return -ENOMEM;
> +
> +	i3c_hub_init(p3h2x4x_hub->hub,
> +		     &p3h2x4x_hub_ops,
> +		     p3h2x4x_hub->i3cdev);
> +
> +	if (IS_ERR(p3h2x4x_hub->hub))
> +		return PTR_ERR(p3h2x4x_hub->hub);

[Severity: Low]
Is this IS_ERR() check necessary? devm_kzalloc() returns either a valid
pointer or NULL on failure, never an error pointer. It seems this block of
code might be dead.

[ ... ]

> +	for (tp =3D 0; tp < P3H2X4X_TP_MAX_COUNT; tp++) {
> +		if (!p3h2x4x_hub->tp_bus[tp].of_node ||
> +		    p3h2x4x_hub->hub_config.tp_config[tp].mode !=3D P3H2X4X_TP_MODE_I3=
C)
> +			continue;
> +
> +		/* Assign DT node for this TP */
> +		p3h2x4x_hub->dev->of_node =3D p3h2x4x_hub->tp_bus[tp].of_node;

[Severity: High]
Can dynamically overwriting the platform device's of_node pointer corrupt t=
he
core device tree state? By changing p3h2x4x_hub->dev->of_node in a loop
without saving and restoring the original, it looks like this permanently
changes the node the device points to. Could this break device tree links,
sysfs topologies, or devres lookups that rely on the original parent hub
of_node?

[ ... ]

> +		/* Perform DAA */
> +		ret =3D i3c_master_do_daa(parent);
> +		if (ret)
> +			return ret;
> +
> +		ntwk_mask |=3D p3h2x4x_hub->tp_bus[tp].tp_mask;
> +		p3h2x4x_hub->tp_bus[tp].is_registered =3D true;
> +		p3h2x4x_hub->hub_config.tp_config[tp].always_enable =3D true;
> +	}

[ ... ]

> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +	ret =3D i3c_device_request_ibi(p3h2x4x_hub->i3cdev, &p3h2x4x_ibireq);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D i3c_device_enable_ibi(p3h2x4x_hub->i3cdev);

[Severity: High]
If a subsequent step in p3h2x4x_i3c_hub_probe() fails, are the IBIs safely
cleaned up? The devm framework would free the p3h2x4x_i3c_hub structure,
but the IBI might remain active on the master. If an interrupt fires later
and accesses the freed structure via i3cdev_get_drvdata(i3cdev), could this
trigger a use-after-free?

> +	if (ret) {
> +		i3c_device_free_ibi(p3h2x4x_hub->i3cdev);
> +		return ret;
> +	}
> +#endif
> +	ret =3D regmap_write(p3h2x4x_hub->regmap, P3H2X4X_TP_NET_CON_CONF, ntwk=
_mask);

[Severity: High]
Does performing DAA here actually reach the downstream targets? The DAA is
executed earlier on the upstream bus inside the target port loop, but the
downstream target ports don't appear to be logically connected to the upstr=
eam
bus until ntwk_mask is written to P3H2X4X_TP_NET_CON_CONF at the end of the
function. Will downstream targets receive the ENTDAA command if DAA is done
before the physical ports are enabled?

> diff --git a/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c b/drivers/i3c/hub/p3=
h2840_i3c_hub_smbus.c
> new file mode 100644
> index 0000000000000..edb75f790e92e
> --- /dev/null
> +++ b/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c

[ ... ]

> +static int p3h2x4x_read_smbus_transaction_status(struct p3h2x4x_i3c_hub_=
dev *hub,
> +						 u8 target_port_status,
> +						 u8 data_length)
> +{
> +	u32 status_read;
> +	u8 status;
> +	int ret;
> +
> +	fsleep(P3H2X4X_SMBUS_400kHz_TRANSFER_TIMEOUT(data_length));
> +
> +	ret =3D regmap_read(hub->regmap, target_port_status, &status_read);

[Severity: High]
Could relying on a fixed timeout instead of polling the hardware finish flag
cause the driver to read stale data? Because the top 4 bits of the status
register are initialized to 0 before the transaction begins, they remain 0
while the hardware is busy. If the transaction exceeds the timeout (e.g., d=
ue
to clock stretching), status evaluates to 0
(P3H2X4X_SMBUS_CNTRL_STATUS_TXN_OK). Should this code poll the
P3H2X4X_SMBUS_TRANSACTION_FINISH_FLAG instead to ensure completion?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260612111816.3688=
240-1-lakshay.piplani@nxp.com?part=3D8
