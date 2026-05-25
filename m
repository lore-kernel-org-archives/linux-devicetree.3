Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BCCA1A681E
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 09:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779702969; cv=none; b=AgAacHP/OvBJFR/onkEQ1q/Lfd19Kmp5RpHGAuciwi6UNeQVlG9u4bhH+UBu4TZEzMXKHIGOKeIddI874RrY8z3Zc5/z2EAzWWzQdjl+OEBFJbD/KRtEDTzRRNxTNpH7ZUYRLi3YoCCQlPA+iolN4YbCWZ4tRIkur2ogM79fx3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779702969; c=relaxed/simple;
	bh=+GZroY9SpPuzy7FpCbM4h1f4Flt4xzrnMtThUVfbRsw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cnRFZ9tWDgeq9tfpE+fpGqQyEhKgtsagrWGVKYp7BO9HcoXv3NR8HAUmqaF8ImTeE861ARdYO/PHdI3saGQuiK3YQcPmM1xNZXMJJ/42IFvxBrP/oP480JDtcW8ySiihlOdKrQAbFZCDeLmMFo+6fmoK+GB+jubfakCJ25aN9Yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B7vW3da1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B7vW3da1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0C241F000E9;
	Mon, 25 May 2026 09:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779702968;
	bh=SbfKNoH8R5ANEtvNSVTe16rPVbw0dVorucTGTT0x14E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=B7vW3da1rqbGbt9rDG+deBj8hB8FXSFxHxXjNaaEMgNvul/vp4IMqDF7GSvvojrDY
	 LTjAK4V7mDgMgN02qS+mMCyc9uGldBDSYKrTGe+nvi2iDjaBhm2czfCtVHm514Z/TF
	 AbVsd58T9p6ixQYjcoAERtHI4pL1fCEn5pn6ljNrfhV5J8cdf7jCMyDHJvEkSg/9F3
	 fboEu3lORbeJqVyffXyIvRgiW65gocN6QP165aefPEYf24WWhnMj6DgwtGMc7siQ+3
	 AKp70YFOivAGrwroCYPhcaFaU4nzFJLuM3zbIginDBbFvCWh6RelDattV+ami5B9n3
	 aorQu5jYtRRNw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 8/9] i3c: hub: p3h2x4x: Add support for NXP P3H2x4x
 I3C hub functionality
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260525064209.2263045-9-lakshay.piplani@nxp.com>
References: <20260525064209.2263045-9-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 09:56:07 +0000
Message-Id: <20260525095607.D0C241F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 9 potential issue(=
s) to consider:
- [High] Saving an OF node pointer from a scoped iterator without acquiring=
 a reference leads to a dangling pointer.
- [High] The driver destructively overwrites the parent hub device's `of_no=
de` pointer with a child's node pointer.
- [High] Successfully registered I2C adapters are leaked and trigger Use-Af=
ter-Free on probe failure.
- [High] The I3C master controllers are unregistered twice during device re=
moval, causing a double-free.
- [High] Oversized I2C messages are skipped while continuing the transactio=
n, breaking transaction atomicity.
- [High] Missing hardware completion polling for SMBus transactions causes =
race conditions.
- [High] Missing bounds check on combined I2C read/write messages allows ou=
t-of-bounds reads on hardware registers.
- [Medium] Using a dynamically calculated value as the bitmask in `regmap_u=
pdate_bits()` prevents clearing hardware configuration bits.
- [Medium] Zero-length I2C transfers cause `regmap_bulk_write` / `regmap_bu=
lk_read` to fail with `-EINVAL`.
--

commit 7dceee0c4bff8a7704988551b364e4b12cae5cdc
Author: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
Subject: i3c: hub: p3h2x4x: Add support for NXP P3H2x4x I3C hub functionali=
ty

This commit adds support for the NXP P3H2x4x family of multiport I3C hubs.
It enables configuration of downstream target ports as I3C, I2C, or SMBus,
and provides transparent communication with downstream devices.

diff --git a/drivers/i3c/hub/p3h2840_i3c_hub_common.c b/drivers/i3c/hub/p3h=
2840_i3c_hub_common.c
--- /dev/null
+++ b/drivers/i3c/hub/p3h2840_i3c_hub_common.c
@@ -0,0 +1,347 @@
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
> +		mode |=3D (hub->hub_config.tp_config[tp].mode !=3D P3H2X4X_TP_MODE_I3C=
) ?
> +			P3H2X4X_SET_BIT(tp) : 0;
> +		smbus |=3D (hub->hub_config.tp_config[tp].mode =3D=3D P3H2X4X_TP_MODE_=
SMBUS) ?
> +			 P3H2X4X_SET_BIT(tp) : 0;
> +		target_port |=3D (hub->tp_bus[tp].tp_mask =3D=3D P3H2X4X_SET_BIT(tp)) ?
> +			       hub->tp_bus[tp].tp_mask : 0;
> +	}
> +
> +	ret =3D regmap_update_bits(hub->regmap, P3H2X4X_TP_PULLUP_EN, pullup, p=
ullup);

[Severity: Medium]
Is it intentional to use the dynamically calculated value as the bitmask?
This prevents clearing hardware configuration bits, as only bits that are 1
in the mask are updated.

> +	if (ret)
> +		return ret;
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
> +			p3h2x4x_i3c_hub->tp_bus[tp_port].of_node =3D dev_node;

[Severity: High]
Can this result in a dangling pointer?

The scoped iterator for_each_available_child_of_node_scoped() automatically
calls of_node_put() on dev_node at the end of each iteration. Storing the n=
ode
pointer into the tp_bus struct without calling of_node_get() means it will
refer to a released OF node.

> +			p3h2x4x_i3c_hub->tp_bus[tp_port].tp_mask =3D P3H2X4X_SET_BIT(tp_port);
> +			p3h2x4x_i3c_hub->tp_bus[tp_port].p3h2x4x_i3c_hub =3D p3h2x4x_i3c_hub;
> +			p3h2x4x_i3c_hub->tp_bus[tp_port].tp_port =3D tp_port;
> +		}
> +	}
> +}
[ ... ]
> +static void p3h2x4x_i3c_hub_remove(struct platform_device *pdev)
> +{
> +	struct p3h2x4x_i3c_hub_dev *p3h2x4x_i3c_hub =3D platform_get_drvdata(pd=
ev);
> +	struct p3h2x4x_dev *p3h2x4x =3D dev_get_drvdata(pdev->dev.parent);
> +	u8 i;
> +
> +	for (i =3D 0; i < P3H2X4X_TP_MAX_COUNT; i++) {
> +		if (!p3h2x4x_i3c_hub->tp_bus[i].is_registered)
> +			continue;
> +
> +		if (p3h2x4x_i3c_hub->hub_config.tp_config[i].mode =3D=3D P3H2X4X_TP_MO=
DE_SMBUS)
> +			i2c_del_adapter(p3h2x4x_i3c_hub->tp_bus[i].tp_smbus_adapter);
> +		else if (p3h2x4x_i3c_hub->hub_config.tp_config[i].mode =3D=3D P3H2X4X_=
TP_MODE_I3C)
> +			i3c_master_unregister(&p3h2x4x_i3c_hub->tp_bus[i]
> +					      .hub_controller.controller);

[Severity: High]
Will this cause a double-free of the I3C master controllers?

A devm action (p3h2x4x_unregister_i3c_master) was registered during probe to
unregister the controllers, but they are also manually unregistered here du=
ring
device removal.

> +	}
> +}
[ ... ]
diff --git a/drivers/i3c/hub/p3h2840_i3c_hub_i3c.c b/drivers/i3c/hub/p3h284=
0_i3c_hub_i3c.c
--- /dev/null
+++ b/drivers/i3c/hub/p3h2840_i3c_hub_i3c.c
@@ -0,0 +1,124 @@
[ ... ]
> +int p3h2x4x_tp_i3c_algo(struct p3h2x4x_i3c_hub_dev *p3h2x4x_hub)
> +{
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
Does this destructively overwrite the parent hub device's of_node pointer w=
ith
a child's node pointer? Modifying the shared platform device's state in this
way can break device tree queries and power management operations for the
parent device.

> +
> +		struct i3c_hub_controller *hub_controller =3D
> +				&p3h2x4x_hub->tp_bus[tp].hub_controller;
[ ... ]
diff --git a/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c b/drivers/i3c/hub/p3h2=
840_i3c_hub_smbus.c
--- /dev/null
+++ b/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c
@@ -0,0 +1,269 @@
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
Does this miss hardware completion polling?

Waiting for a fixed time and reading the status once without checking the
P3H2X4X_SMBUS_TRANSACTION_FINISH_FLAG bit might yield a false TXN_OK if
the transaction is delayed (e.g., due to clock stretching), causing the
driver to prematurely read invalid data.

> +	if (ret)
> +		return ret;
[ ... ]
> +static int p3h2x4x_tp_i2c_xfer_msg(struct p3h2x4x_i3c_hub_dev *p3h2x4x_i=
3c_hub,
> +				   struct i2c_msg *xfers,
> +				   u8 target_port,
> +				   u8 nxfers_i, u8 rw)
> +{
[ ... ]
> +	if (!(rw % 2)) {
> +		ret =3D regmap_bulk_write(p3h2x4x_i3c_hub->regmap,
> +					P3H2X4X_CONTROLLER_AGENT_BUFF_DATA,
> +					xfers[nxfers_i].buf, xfers[nxfers_i].len);

[Severity: Medium]
Will this fail with -EINVAL for zero-length transfers?

If xfers[nxfers_i].len is 0 (such as for SMBus Quick Command or i2c-detect),
regmap_bulk_write() and regmap_bulk_read() will reject the operation with
-EINVAL.

> +		if (ret)
> +			goto out;
> +	}
[ ... ]
> +	if (rw) {
> +		if (rw =3D=3D 2)
> +			nxfers_i +=3D 1;
> +
> +		ret =3D regmap_bulk_read(p3h2x4x_i3c_hub->regmap,
> +				       P3H2X4X_CONTROLLER_AGENT_BUFF_DATA + write_length,
> +				       xfers[nxfers_i].buf, xfers[nxfers_i].len);

[Severity: High]
Is there a missing bounds check on combined I2C read/write messages?

When rw =3D=3D 2, the read message length validation from p3h2x4x_tp_i2c_xf=
er()
is skipped for the read message. There also doesn't seem to be a check if
the sum of both lengths exceeds the physical 88-byte buffer, potentially
allowing arbitrary out-of-bounds reads from subsequent hardware registers.

> +		if (ret)
> +			goto out;
> +	}
[ ... ]
> +static s32 p3h2x4x_tp_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg =
*msgs, int num)
> +{
[ ... ]
> +	for (msg_count =3D 0; msg_count < num; msg_count++) {
> +		if (msgs[msg_count].len > P3H2X4X_SMBUS_PAYLOAD_SIZE) {
> +			dev_err(p3h2x4x_i3c_hub->dev,
> +				"Message nr. %d not sent - length over %d bytes.\n",
> +				msg_count, P3H2X4X_SMBUS_PAYLOAD_SIZE);
> +			continue;
> +		}

[Severity: High]
Can this break I2C transaction atomicity?

Skipping an oversized message with "continue" instead of aborting the
entire transaction means partial sequences might be executed (e.g.,
executing a read without the preceding address write), leaving the
target in an unpredictable state.

> +
> +		rw =3D (msgs[msg_count].flags & I2C_M_RD) ? 1 : 0;
[ ... ]
> +int p3h2x4x_tp_smbus_algo(struct p3h2x4x_i3c_hub_dev *hub)
> +{
[ ... ]
> +		/* Register adapter */
> +		ret =3D i2c_add_adapter(smbus_adapter);
> +		if (ret) {
> +			devm_kfree(hub->dev, smbus_adapter);
> +			return ret;
> +		}

[Severity: High]
Will this leak successfully registered I2C adapters if i2c_add_adapter()
fails for a subsequent port?

The previously added adapters are not unregistered on this error path.
Since their memory is managed by devres via devm_kzalloc(), it will be
freed on probe failure, leaving the I2C core with dangling pointers.

> +
> +		hub->tp_bus[tp].is_registered =3D true;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260525064209.2263=
045-1-lakshay.piplani@nxp.com?part=3D8
