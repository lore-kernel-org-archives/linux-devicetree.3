Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54BB3B14C0
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 07:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782890511; cv=none; b=tQkCQ0gfUoNNh43ObhhtLOFE40ovJ79kgaLzvXQADuya3QxnEZ3wk8mkaPmgRd8tYINzcO13OXG+OgQdrZ5pw+XWlfubxJeze2eatKvtXw2XhSeUwZmKDHFx2MPga1M7T8jIMRPUnlu7Z2xEkUt+6OmLNDmyXO3jW2LJOcDn5QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782890511; c=relaxed/simple;
	bh=0gN9Eot4EkRuZbbZq2foEZFW0sDNpB3jWIizI4TK4fs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ihl9l1R3eB1CSyVGReK6FZC053GQXI3AHxdlMSUX/ZM8SlNSPJHJCyZQCnEP8vxbXB/lOqJRit72IkLWsF0Twx6VR1HnHKh635ZVu1kIFUrGw5BawIQFRBMZrNxC48Xc+fKN0spKqcnGZzJGLXZFmGqNgh5ZUuGJQ0i1H64N1Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WzqriLQv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WzqriLQv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 644591F000E9;
	Wed,  1 Jul 2026 07:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782890509;
	bh=PaZGdD9q9xZamgNJ0r23YnjXVsMdBr4p5FcYZVh9iaE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WzqriLQvnzAWSuGlyePLAM3sPOeBfQld96spd1/SWdNFbrbOoIwPc2TtCcaCYKFPe
	 6bmKMdWMZJGpjnR7OkoIfoONqhDMyM6XrUt4cxUqZ5bxijS1WJJXKjij5vnIrdCZOR
	 9xdUYDMwgi7lqpZ4XEmxaRKgtVEtrv/GXp62P/nghsT31lNYzH418LbIpVOBomgytB
	 KjrGVGrWDoOeEV6JlZXS762oYbyZ2mzu7GU+03iw08BvZ4cW+anE7xzGWYwCcV5Naj
	 2u9DaAaJVAs5qp8RYgQwpmZAkuSeFqwuiMYPDbsmUGCXYOOfbt1be0GQgNphaEjSyd
	 Il3Fr/YxjU9Ig==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 6/7] i3c: hub: p3h2x4x: Add support for NXP P3H2x4x
 I3C hub functionality
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, linux-i3c@lists.infradead.org, Frank.Li@kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20260701065755.2067793-7-lakshay.piplani@nxp.com>
References: <20260701065755.2067793-1-lakshay.piplani@nxp.com>
 <20260701065755.2067793-7-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Jul 2026 07:21:48 +0000
Message-Id: <20260701072149.644591F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Unprotected and temporary reassignment of a live device's `of_node=
` creates a data race, and missing restoration on the error path causes ref=
erence count leaks and a double-free.
- [High] `regmap_read_poll_timeout` is configured with a 10ms sleep interva=
l that vastly exceeds the actual total timeout, artificially delaying every=
 transaction and causing spurious timeouts.
- [High] Failure to allocate memory for an I2C adapter leaves previously re=
gistered adapters active but with freed backing memory, leading to a Use-Af=
ter-Free.
- [Medium] Loop counters `msg_count` and `nxfers_i` are `u8`, causing infin=
ite loops if the transfer count `num` is >=3D 256.
- [Medium] Race condition between the I3C hub driver and other MFD child dr=
ivers over the shared `P3H2X4X_DEV_REG_PROTECTION_CODE` register.
--

commit 37198d19f613736872b6f1fd4f9a75597b1f0ab1
Author: Aman Kumar Pandey <aman.kumarpandey@nxp.com>

i3c: hub: p3h2x4x: Add support for NXP P3H2x4x I3C hub functionality

This patch adds I3C hub functionality for the NXP P3H2x4x family of multipo=
rt
hubs. It enables I3C/I2C communication between host and hub, downstream dev=
ice
support, and target port configuration.

> diff --git a/drivers/i3c/hub/p3h2840_i3c_hub_common.c b/drivers/i3c/hub/p=
3h2840_i3c_hub_common.c
> --- a/drivers/i3c/hub/p3h2840_i3c_hub_common.c
> +++ b/drivers/i3c/hub/p3h2840_i3c_hub_common.c
[ ... ]
> +static int p3h2x4x_i3c_hub_probe(struct platform_device *pdev)
> +{
> +	struct p3h2x4x_dev *p3h2x4x =3D dev_get_drvdata(pdev->dev.parent);
> +	struct p3h2x4x_i3c_hub_dev *p3h2x4x_i3c_hub;
> +	struct device *dev =3D &pdev->dev;
> +	struct device_node *node;
> +	int ret, i;
[ ... ]
> +	/* Unlock access to protected registers */
> +	ret =3D regmap_write(p3h2x4x_i3c_hub->regmap, P3H2X4X_DEV_REG_PROTECTIO=
N_CODE,
> +			   P3H2X4X_REGISTERS_UNLOCK_CODE);

[Severity: Medium]
Could this global unlock race with other MFD child drivers (such as the
on-die regulator)?=20

Because the protected configuration registers are unlocked at the start of
p3h2x4x_i3c_hub_probe() and left unlocked during the entire hardware
configuration and device discovery window (which includes sleeping in
i3c_master_do_daa()), a concurrent MFD child driver could access its own
registers and re-lock the protection code. If that happens, subsequent
hardware configuration writes in this function might fail silently.

> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to unlock HUB's protected regis=
ters\n");
> +
> +	ret =3D devm_add_action_or_reset(dev, p3h2x4x_lock_registers_action,
> +				       p3h2x4x_i3c_hub);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D p3h2x4x_configure_hw(dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to configure the HUB\n");
[ ... ]

> diff --git a/drivers/i3c/hub/p3h2840_i3c_hub_i3c.c b/drivers/i3c/hub/p3h2=
840_i3c_hub_i3c.c
> --- a/drivers/i3c/hub/p3h2840_i3c_hub_i3c.c
> +++ b/drivers/i3c/hub/p3h2840_i3c_hub_i3c.c
[ ... ]
> +int p3h2x4x_tp_i3c_algo(struct p3h2x4x_i3c_hub_dev *p3h2x4x_hub)
> +{
> +	struct i3c_master_controller *parent =3D i3c_dev_get_master(p3h2x4x_hub=
->i3cdev->desc);
> +	struct device_node *orig_of_node;
> +	u8 tp, ntwk_mask =3D 0;
> +	int ret;
[ ... ]
> +	for (tp =3D 0; tp < P3H2X4X_TP_MAX_COUNT; tp++) {
> +		if (!p3h2x4x_hub->tp_bus[tp].of_node ||
> +		    p3h2x4x_hub->hub_config.tp_config[tp].mode !=3D P3H2X4X_TP_MODE_I3=
C)
> +			continue;
> +
> +		/*
> +		 * i3c_master_register() derives bus population from the parent device=
's
> +		 * OF node. Temporarily switch the hub device to the target-port node =
for
> +		 * registration, then restore the original node immediately.
> +		 */
> +		orig_of_node =3D p3h2x4x_hub->dev->of_node;
> +		p3h2x4x_hub->dev->of_node =3D p3h2x4x_hub->tp_bus[tp].of_node;
> +
> +		struct i3c_hub_controller *hub_controller =3D
> +				&p3h2x4x_hub->tp_bus[tp].hub_controller;
> +		struct i3c_master_controller *controller =3D &hub_controller->controll=
er;
> +
> +		hub_controller->parent =3D parent;
> +		hub_controller->hub =3D p3h2x4x_hub->hub;
> +
> +		dev_set_drvdata(&controller->dev, hub_controller);
> +
> +		ret =3D i3c_hub_reserve_parent_addrslots_from_dt(hub_controller,
> +							       p3h2x4x_hub->tp_bus[tp].of_node);
> +		if (ret)
> +			return ret;

[Severity: High]
Will this leak the original parent node reference and cause a double-free on
the target node if i3c_hub_reserve_parent_addrslots_from_dt() returns an
error?

If the early return is taken, dev->of_node is never restored to
orig_of_node. When the probe unwinds, the devres cleanup function
p3h2x4x_put_target_port_of_nodes() drops the target node's reference.
Later, when the device core destroys the device, it will call
of_node_put(dev->of_node) which now incorrectly points to the target node
again, causing a double-free.

Concurrently, modifying dev->of_node without synchronization creates a data
race for concurrent sysfs or uevent reads.

> +
> +		ret =3D i3c_master_register(controller,
> +					  p3h2x4x_hub->dev,
> +					  i3c_hub_master_ops(),
> +					  false);
> +
> +		p3h2x4x_hub->dev->of_node =3D orig_of_node;
[ ... ]

> diff --git a/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c b/drivers/i3c/hub/p3=
h2840_i3c_hub_smbus.c
> --- a/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c
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
> +	ret =3D regmap_read_poll_timeout(hub->regmap, target_port_status,
> +				       status_read,
> +				       status_read & P3H2X4X_SMBUS_TRANSACTION_FINISH_FLAG,
> +				       P3H2X4X_POLLING_ROLL_PERIOD_MS * 1000,
> +				       P3H2X4X_SMBUS_400kHz_TRANSFER_TIMEOUT(data_length));

[Severity: High]
Does this polling configuration cause spurious timeouts or severe performan=
ce
penalties?

The sleep_us parameter is set to P3H2X4X_POLLING_ROLL_PERIOD_MS * 1000,
which is 10,000us (10ms). However, the total timeout_us parameter provided
by P3H2X4X_SMBUS_400kHz_TRANSFER_TIMEOUT(data_length) is significantly smal=
ler
(e.g., between 100us and 2,000us depending on data length).

If the transaction is not complete on the very first read, the thread will
sleep for a full 10ms, drastically overshooting the intended timeout and
potentially returning a spurious -ETIMEDOUT depending on the state when it
wakes up.

> +	if (ret)
> +		return ret;
[ ... ]
> +static s32 p3h2x4x_tp_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg =
*msgs, int num)
> +{
> +	int ret_sum =3D 0, ret;
> +	u8 msg_count, rw;
> +
> +	struct tp_bus *bus =3D i2c_get_adapdata(adap);
> +	struct p3h2x4x_i3c_hub_dev *p3h2x4x_i3c_hub =3D bus->p3h2x4x_i3c_hub;
> +
> +	guard(mutex)(&p3h2x4x_i3c_hub->etx_mutex);
> +	guard(mutex)(&bus->port_mutex);
> +
> +	for (msg_count =3D 0; msg_count < num; msg_count++) {

[Severity: Medium]
Can this loop run infinitely if the transfer count (num) is greater than
or equal to 256?

The parameter num is a signed 32-bit integer, but msg_count is declared as
u8. If an in-kernel driver submits an I2C transfer with 256 or more
messages, msg_count will wrap around to 0 before ever reaching num, making
the loop condition perpetually true and causing a CPU lockup.

> +		if (msgs[msg_count].len > P3H2X4X_SMBUS_PAYLOAD_SIZE) {
> +			dev_err(p3h2x4x_i3c_hub->dev,
> +				"Message nr. %d not sent - length over %d bytes.\n",
> +				msg_count, P3H2X4X_SMBUS_PAYLOAD_SIZE);
> +			return -EINVAL;
> +		}
[ ... ]
> +int p3h2x4x_tp_smbus_algo(struct p3h2x4x_i3c_hub_dev *hub)
> +{
> +	int ret;
> +	u8 tp;
> +
> +	for (tp =3D 0; tp < P3H2X4X_TP_MAX_COUNT; tp++) {
> +		if (!hub->tp_bus[tp].of_node ||
> +		    hub->hub_config.tp_config[tp].mode !=3D P3H2X4X_TP_MODE_SMBUS)
> +			continue;
> +
> +		/* Allocate adapter */
> +		struct i2c_adapter *smbus_adapter =3D
> +			devm_kzalloc(hub->dev, sizeof(*smbus_adapter), GFP_KERNEL);
> +		if (!smbus_adapter)
> +			return -ENOMEM;

[Severity: High]
Will this early return on allocation failure cause a use-after-free for
previously registered I2C adapters?

In this loop, if devm_kzalloc() fails for a given port, the function returns
-ENOMEM immediately without calling p3h2x4x_unregister_smbus_adapters().

Any adapters successfully registered in earlier loop iterations will remain
active in the I2C subsystem. Because the devres unregister action
(p3h2x4x_unregister_smbus_adapters_action) is only added at the end of the
probe() function, it will not execute. However, devres will automatically
free the memory allocated by devm_kzalloc(), leaving the I2C subsystem to
dereference freed memory when it interacts with those remaining dangling
adapters.

> +
> +		/* Initialize adapter */
> +		smbus_adapter->owner =3D THIS_MODULE;
> +		smbus_adapter->class =3D I2C_CLASS_HWMON;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701065755.2067=
793-1-lakshay.piplani@nxp.com?part=3D6
