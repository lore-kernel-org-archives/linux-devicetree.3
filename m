Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C76285CAD
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 11:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781695130; cv=none; b=CPs6Rs8Xv4AKvQxmW7a6PD9sJpqwa67yYyBlayjI/qqk1BXNjZLwRBcFjNuPHrf0cGm+MlZFp7HIE0HFF6zmeOWPk5iGfpVgd71Lsr1D9KpCei4PO2it0mnjthjnlxFiQ2kcr2uCD+U1rIhQI4sWIgrlgZhnpJcVJzd0tYhqZpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781695130; c=relaxed/simple;
	bh=wJWIUNsmyq7Fw5CVCzGiEhWTgjXaeCRkSJ50QQm7u1w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YvN/2Ppx0J2kOujdIkgInjFQbfuxhNHUVxQkbClQAXstOoNb9ywX0I6xgyKrGknxuUdLmauJwbwguuwg9bPjPlarJIdqg2kHSFvMtgsyOwpVr6Qt7IvQ8CJCOLxZqwNvXL6SgkjS6Q34ew4i9+CUNNbBY8C4/6MpPQy/O9YqSvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MPPwPF6y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MPPwPF6y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAB851F000E9;
	Wed, 17 Jun 2026 11:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781695127;
	bh=/ggDIh5HpxDzxQfMuZNmvcq2gxXxOJ5/RLT0nk2nkQg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MPPwPF6yLJmh/XY5aat+IIx5qolx1yD7eTJNTT7TnH8lM8QWlm+9OF2Fw+szGcQ7J
	 5DbI9aYMKyo6JD8J73Y5pT+177qY3YTkI3coPGjO1V+IGC1ktbJwyAYg002OQ69LRV
	 /FdKROH/Gr4hwTs4TMAT5fCt/iSyAm0dA0RjMwyvBqAGsOYO+FCoM9ag3LKbnlUrlK
	 bY46EGlQr+uEkARa1Ufue8fVrPAX4kL4ZxAmjPuI1hWo8LX/X1Cyd7Kk21ij7Q6xLE
	 sjwPs/jbduOliV6ul7MovE8QlULr4yV3E+VpgRdJwZqD1DvfaLpwpxYhF46ZpruDE3
	 ahnHmsgOwnXUw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 6/7] i3c: hub: p3h2x4x: Add support for NXP P3H2x4x
 I3C hub functionality
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, linux-i3c@lists.infradead.org, Frank.Li@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260617110355.1591844-7-lakshay.piplani@nxp.com>
References: <20260617110355.1591844-1-lakshay.piplani@nxp.com>
 <20260617110355.1591844-7-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 17 Jun 2026 11:18:46 +0000
Message-Id: <20260617111846.EAB851F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] The SMBus transaction wait logic uses a fixed sleep instead of pol=
ling the hardware completion flag, leading to premature reads of incomplete=
 transactions and data corruption.
- [High] Overwriting the parent device's `of_node` pointer iteratively caus=
es a memory leak of the original parent node, a double-free of the target p=
ort nodes, and state corruption.
- [Medium] Potential `of_node` reference leak in `p3h2x4x_get_target_port_d=
t_conf()` if multiple child nodes specify the same target port index.
- [Medium] The hub's protected registers remain permanently unlocked if the=
 hardware configuration or bus registration fails during probe.
- [Low] Comment describes a read followed by a write, but the code implemen=
ts a write followed by a read.
--

commit 1c982ecf71c6fb3b765caf255191a821a5e37cb5
Author: Aman Kumar Pandey <aman.kumarpandey@nxp.com>

i3c: hub: p3h2x4x: Add support for NXP P3H2x4x I3C hub functionality

Add I3C hub functionality for the NXP P3H2x4x family of multiport hubs.
These devices support downstream target ports that can be configured
as I3C, I2C, or SMBus.

> diff --git a/drivers/i3c/hub/p3h2840_i3c_hub_common.c b/drivers/i3c/hub/p=
3h2840_i3c_hub_common.c
> new file mode 100644
> index 0000000000000..05e19bff20d5c
> --- /dev/null
> +++ b/drivers/i3c/hub/p3h2840_i3c_hub_common.c
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
Could this leak the of_node reference if a malformed device tree specifies
multiple child nodes with the same target port index?

If multiple child nodes specify the same reg value, the pointer is
overwritten with a new of_node_get() result, which abandons the previous
reference.

> +			p3h2x4x_i3c_hub->tp_bus[tp_port].tp_mask =3D P3H2X4X_SET_BIT(tp_port);
> +			p3h2x4x_i3c_hub->tp_bus[tp_port].p3h2x4x_i3c_hub =3D p3h2x4x_i3c_hub;
> +			p3h2x4x_i3c_hub->tp_bus[tp_port].tp_port =3D tp_port;
> +		}
> +	}
> +}
[ ... ]
> +static int p3h2x4x_i3c_hub_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	/* Unlock access to protected registers */
> +	ret =3D regmap_write(p3h2x4x_i3c_hub->regmap, P3H2X4X_DEV_REG_PROTECTIO=
N_CODE,
> +			   P3H2X4X_REGISTERS_UNLOCK_CODE);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to unlock HUB's protected regis=
ters\n");
> +
> +	ret =3D p3h2x4x_configure_hw(dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to configure the HUB\n");

[Severity: Medium]
Are the hub's protected registers left permanently unlocked if probe fails
during p3h2x4x_configure_hw() or bus registration?

The driver unlocks the hardware registers at the start of probe and locks
them at the very end. However, if any initialization step fails and returns
an error, the function exits immediately without locking the registers agai=
n.

Could this be mitigated by using a devm_add_action_or_reset() callback or
explicit error handling labels to ensure the registers are safely relocked?

> +
> +	/* Register virtual I3C master controllers for I3C target ports */
> +	if (p3h2x4x->i3cdev) {
[ ... ]
> diff --git a/drivers/i3c/hub/p3h2840_i3c_hub_i3c.c b/drivers/i3c/hub/p3h2=
840_i3c_hub_i3c.c
> new file mode 100644
> index 0000000000000..8adb235b992c0
> --- /dev/null
> +++ b/drivers/i3c/hub/p3h2840_i3c_hub_i3c.c
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
Does overwriting the parent device's of_node pointer iteratively cause a
memory leak of the original parent node and a double-free of the target port
nodes?

The loop over target ports directly mutates the shared pdev->dev.of_node
pointer which was populated in probe using device_set_of_node_from_dev().
This leaks the reference to the original parent node, and leaves
dev->of_node pointing to the last target port node.

When the driver is unbound, the driver core will drop a reference on
dev->of_node, but p3h2x4x_put_target_port_of_nodes() also drops a reference
on the same node, which can cause a use-after-free or double-free refcount
underflow. Mutating dev->of_node also creates a race with sysfs/uevent.

Should the driver assign the node to controller->dev.of_node directly
instead of mutating the parent's pointer?

> +
> +		struct i3c_hub_controller *hub_controller =3D
> +				&p3h2x4x_hub->tp_bus[tp].hub_controller;
[ ... ]
> diff --git a/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c b/drivers/i3c/hub/p3=
h2840_i3c_hub_smbus.c
> new file mode 100644
> index 0000000000000..cf664425af071
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
Does using a hardcoded sleep based on bytes transferred instead of polling a
hardware completion status bit lead to premature reads of incomplete
transactions?

If the downstream device performs clock stretching or is slow to respond,
the transfer will take longer than the hardcoded timeout. The driver then
reads target_port_status and shifts to check the status bits.

Since an ongoing transaction leaves the status bits at 0
(P3H2X4X_SMBUS_CNTRL_STATUS_TXN_OK), the driver will incorrectly assume the
transaction has finished successfully. It will then proceed to read stale or
uninitialized memory buffers and return garbage data.

Could this be updated to use a polling loop checking the finish flag?

> +	if (ret)
> +		return ret;
> +
> +	status =3D (u8)status_read;
[ ... ]
> +static s32 p3h2x4x_tp_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg =
*msgs, int num)
> +{
[ ... ]
> +		rw =3D (msgs[msg_count].flags & I2C_M_RD) ? 1 : 0;
> +		if (!rw) {
> +			/* If a read message is immediately followed by a write message to
> +			 * the same address,  consider combining them into a single transacti=
on.
> +			 */

[Severity: Low]
This isn't a bug, but the comment describes a read followed by a write while
the code implements a write followed by a read.

The actual code block checks !rw for the first message and flags & I2C_M_RD
for the second message, which accurately handles a write message immediately
followed by a read message.

> +			if (msg_count + 1 < num &&
> +			    msgs[msg_count].addr =3D=3D msgs[msg_count + 1].addr &&
> +			    (msgs[msg_count + 1].flags & I2C_M_RD)) {
> +				if (msgs[msg_count].len + msgs[msg_count + 1].len >
> +				    P3H2X4X_SMBUS_PAYLOAD_SIZE)
> +					return -EINVAL;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260617110355.1591=
844-1-lakshay.piplani@nxp.com?part=3D6
