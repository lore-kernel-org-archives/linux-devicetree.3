Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60ADD19F12D
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 13:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779715737; cv=none; b=jroQ8pfWvT74c7uROD+H0Y+OEpAPsc4BYivSAH+AoReiiCdWLQvvA+zXbgIA4w7QEEuY8fknuRONpaOXx8nT+9aJPBiXVkR9PTAgL/zB6Padf7iAdMV3rhsmnQ3JsTRzdH9OC+Q3bDxrd4Z5rfh05aYVqhqb2/tkjAMDOnjxrVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779715737; c=relaxed/simple;
	bh=4Idw6ett7Q+VkeRrFKCgv18sDv/49oC59pv/6RHpw1s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=l/8sw8+QlH6fP+C13rucTXX0jpVCTdBZ8nRL+VXEB90mpGBJD9T3mCDpnunlJjx1VzgXDWqQjuLkm6LfDoD4DakzqHbj+cM0ozkixjmucdTL+Iazshk/nBrDTl5uDXA4xF6JnbjG/UuX6iXTxhnHyX7uCeMHcxIZMqTvl2Noldc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ec2iiQ5j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ec2iiQ5j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCD411F000E9;
	Mon, 25 May 2026 13:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779715736;
	bh=SwlGF6gPE1Zk2q86LirVTus6MNstqkwv2RwbP3+btGY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ec2iiQ5jHazJQ9Tsq9FS3RE5qGwLudiHz8kCMS+fV1rc+6sBimhEtWK2t2yCfSZ+d
	 N91h++y1km/FHZP8cH7AebR3mLdKx0UukwlbX1dg6f0kZaabQ95icSn4R7kmHHJU5t
	 ZEl+XMYOOJ5/KvRIueEIWH5XCfy6etECSwcSJ+X4c+jwC1X0lTbWg6Ib2WOKcGjmGB
	 D3NcKVFskplyxl+X9aXb+XjMEoG32lV9QuZocQBxgzxE553pvXgtOATCI0WcLjjgjB
	 o4IHavnv44LF2ozht1oJSOl3UmYw5ineDKD5sqAbK+7lvLkyibiHNlqhrZHAPFzhXB
	 s7gRpYkNiITdw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] staging: i3c: add Realtek RTS490x I3C HUB driver
Reply-To: sashiko-reviews@lists.linux.dev
To: zain_zhou@realsil.com.cn
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260525125128.297-2-zain_zhou@realsil.com.cn>
References: <20260525125128.297-2-zain_zhou@realsil.com.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 13:28:55 +0000
Message-Id: <20260525132855.DCD411F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 13 potential issue=
(s) to consider:
- [High] OF node references are not properly managed during DT iteration, c=
ausing memory leaks and dangling pointers.
- [High] Probe error paths fail to unregister successfully added I2C adapte=
rs, leaving dangling pointers to freed memory.
- [High] Missing `reinit_completion()` before starting SMBus transactions c=
auses premature completion following a timeout.
- [High] The driver temporarily overwrites the hub device's `of_node` durin=
g logical bus registration without restoring it.
- [High] Incorrect teardown order in `i3c_hub_remove` allows delayed works =
to execute after resources are destroyed.
- [High] Concurrent transfers corrupt the shared device descriptor's master=
 pointer and cause bus faults.
- [High] Dynamic Address Assignment (DAA) fails to open target ports, preve=
nting devices from receiving addresses.
- [High] GPIO IRQ callbacks use sleeping regmap operations while the IRQ co=
re holds raw spinlocks.
- [High] Dropping a mutex before calling an I2C slave event callback allows=
 concurrent unregistration and freeing of the target driver.
- [High] Parsing the I3C port ID using `%i` allows negative indices, bypass=
ing bounds checks.
- [Medium] SMBus target logic incorrectly drops 0-byte writes (e.g., SMBus =
Quick Commands) instead of notifying the I2C slave backend.
- [Medium] Return value of `regmap_write` is ignored before reading buffer =
length.
- [Medium] Early returns in `i3c_hub_delayed_work` error paths leak dynamic=
ally registered logical buses and abort partial initialization.
--

commit 9f58d1e76a5b04c7b2e855b10a1eea1283c0e9ee
Author: Yin Zhou <zain_zhou@realsil.com.cn>

staging: i3c: add Realtek RTS490x I3C HUB driver

Add driver for Realtek RTS490x series I3C HUB devices. It supports DT-based
configuration, LDO and pull-up management, logical I3C bus registration,
SMBus agent functionality, and GPIO expansion.

> diff --git a/drivers/staging/rts490x/rts490xa-i3c-hub.c b/drivers/staging=
/rts490x/rts490xa-i3c-hub.c
> new file mode 100644
> index 0000000000000..fdfff5c6dff5d
> --- /dev/null
> +++ b/drivers/staging/rts490x/rts490xa-i3c-hub.c
[ ... ]
> @@ -354,12 +354,6 @@ static void i3c_hub_tp_of_get_setting(struct device =
*dev,
>  		if (id >=3D priv->dev_info->n_ports) {
>  			dev_warn(dev,
>  				 "Invalid target port index found in DT: %i\n",
>  				 id);
>  			continue;
>  		}
> =20
>  		priv->smbus_port_adapter[id].of_node =3D tp_node;

[Severity: High]
Could this lead to dangling pointers? The iterator loop drops the reference
to the node when it advances, leaving priv->smbus_port_adapter[id].of_node
pointing to freed memory since of_node_get() isn't called.

[ ... ]
> @@ -818,12 +818,7 @@ static void i3c_hub_of_get_conf_runtime(struct devic=
e *dev,
>  	struct device_node *i3c_node;
>  	int i3c_id;
>  	u8 tp_mask;
> =20
>  	for_each_available_child_of_node(node, i3c_node) {
>  		if (!i3c_node->full_name ||
>  		    (sscanf(i3c_node->full_name, "i3c%i@%hhx", &i3c_id,
>  			    &tp_mask) !=3D 2))
>  			continue;
> =20
>  		if (i3c_id < priv->dev_info->n_ports) {

[Severity: High]
Could the use of %i allow negative values like "i3c-1@0" to be parsed?

If i3c_id is negative, it gets promoted to an unsigned value in the bounds
check (i3c_id < priv->dev_info->n_ports), allowing it to bypass the check
and write out of bounds.

>  			priv->logical_bus[i3c_id].available =3D true;
>  			priv->logical_bus[i3c_id].of_node =3D i3c_node;

[Severity: High]
Is an of_node_get() missing here as well before saving i3c_node?

>  			priv->logical_bus[i3c_id].tp_map =3D tp_mask;
>  			priv->logical_bus[i3c_id].priv =3D priv;
>  			priv->logical_bus[i3c_id].tp_id =3D i3c_id;
>  		}
>  	}
>  }
[ ... ]
> @@ -861,15 +861,15 @@ static struct device_node *i3c_hub_get_dt_hub_node(=
struct device_node *node,
> =20
>  			if (!found_id) {
>  				/*
>  				 * Just keep reference to first HUB node with no ID in case no ID
>  				 * matching
>  				 */
>  				if (!hub_node_no_id &&
>  				    priv->hub_dt_sel_id =3D=3D -1 &&
>  				    priv->hub_dt_cp1_id =3D=3D -1)
>  					hub_node_no_id =3D hub_node;
>  			} else {
>  				return hub_node;
>  			}
>  		}
>  	}
> =20
>  	return hub_node_no_id;
>  }

[Severity: High]
Can returning the node directly from the iterator cause a memory leak?

Returning hub_node without releasing the reference held by the loop iterator
appears to leak it. Conversely, if it returns hub_node_no_id, isn't that
pointer already freed since the loop has advanced or completed?

[ ... ]
> @@ -1429,20 +1429,19 @@ static int i3c_hub_read_transaction_status(struct=
 i3c_hub *priv, u8 target_port,
>  					   u8 target_port_status, u32 data_len)
>  {
>  	unsigned int status_read;
>  	int ret;
>  	struct i2c_adapter_group *smbus =3D
>  		&priv->smbus_port_adapter[target_port];
>  	u32 smbus_clk =3D priv->settings.tp[target_port].clock_frequency / 1000;
>  	u8 status;
>  	u8 ret_code;
> =20
>  	if (!priv->settings.tp[target_port].poll_interval_ms) {
>  		ret =3D wait_for_completion_timeout(&smbus->completion,
>  						  smbus->i2c.timeout);

[Severity: High]
Should there be a call to reinit_completion() before starting the SMBus
transaction?

If a timeout occurs, a delayed hardware interrupt might call complete()
later. The next transaction would then return immediately from
wait_for_completion_timeout() because the leftover completion count wasn't
consumed.

[ ... ]
> @@ -1664,15 +1664,13 @@ static void i3c_hub_bus_cleanup(struct i3c_master=
_controller *controller)
>  {
>  	controller->this =3D NULL;
>  }
> =20
>  static int i3c_hub_attach_i3c_dev(struct i3c_dev_desc *dev)
[ ... ]
> @@ -1714,14 +1714,10 @@ static void i3c_hub_detach_i3c_dev(struct i3c_dev=
_desc *dev)
>  static int i3c_hub_do_daa(struct i3c_master_controller *controller)
>  {
>  	struct i3c_master_controller *parent =3D
>  		parent_from_controller(controller);
>  	int ret;
> =20
>  	down_write(&parent->bus.lock);
>  	ret =3D parent->ops->do_daa(parent);
>  	up_write(&parent->bus.lock);
>  	return ret;
>  }

[Severity: High]
Is this missing a call to i3c_hub_trans_pre_cb(bus) before doing DAA?

Without opening the logical bus's target port beforehand, devices on that
port wouldn't receive ENTDAA broadcasts or dynamic addresses.

[ ... ]
> @@ -1742,16 +1742,14 @@ static int i3c_hub_send_ccc_cmd(struct i3c_master=
_controller *controller,
>  static int i3c_hub_priv_xfers(struct i3c_dev_desc *dev,
>  			      struct i3c_xfer *xfers, int nxfers,
>  			      enum i3c_xfer_mode mode)
>  {
>  	struct i3c_master_controller *parent =3D
>  		parent_controller_from_i3c_desc(dev);
>  	struct i3c_master_controller *orig_parent;
>  	struct logical_bus *bus =3D bus_from_i3c_desc(dev);
>  	int res;
> =20
>  	i3c_hub_trans_pre_cb(bus);
>  	orig_parent =3D update_i3c_i2c_desc_parent(&dev->common, parent);
>  	down_read(&parent->bus.lock);
>  	res =3D parent->ops->i3c_xfers(dev, xfers, nxfers, mode);
>  	up_read(&parent->bus.lock);
>  	restore_i3c_i2c_desc_parent(&dev->common, orig_parent);
>  	i3c_hub_trans_post_cb(bus);
> =20
>  	return res;
>  }

[Severity: High]
Could concurrent transfers to the same device cause data corruption and bus
faults?

Since update_i3c_i2c_desc_parent() modifies the shared desc->master without
synchronization, and the I3C core holds the bus lock only as a reader,
concurrent accesses might restore incorrect pointers.

Additionally, if two threads communicate on the same port concurrently, won=
't
the first thread to finish close the target port in i3c_hub_trans_post_cb
while the second is still communicating?

[ ... ]
> @@ -2037,21 +2037,18 @@ static void i3c_hub_delayed_work(struct work_stru=
ct *work)
>  	for (i =3D 0; i < priv->dev_info->n_ports; ++i) {
>  		bus =3D &priv->logical_bus[i];
>  		if (bus->available) {
>  			ret =3D regmap_update_bits(priv->regmap,
>  						 I3C_HUB_TP_NET_CON_CONF,
>  						 GENMASK(bus->tp_id, bus->tp_id),
>  						 bus->tp_map);
>  			if (ret) {
>  				dev_warn(dev,
>  					 "Failed to open Target Port(s)\n");
>  				return;
>  			}
> =20
>  			dev->of_node =3D bus->of_node;

[Severity: High]
Does this permanently overwrite the physical hub device's dev->of_node
pointer?

By not restoring it after registration, it gets left pointing to its last
processed child port, which might break subsequent DT lookups.

>  			ret =3D i3c_hub_logic_register(&bus->controller, dev);
>  			if (ret) {
>  				dev_warn(dev,
>  					 "Failed to register i3c controller - bus id:%i\n",
>  					 i);
>  				return;
>  			}

[Severity: Medium]
Will returning early here leak any logical buses that were successfully
registered in previous loop iterations? The early return also aborts the DAA
sequence and scheduling of the polling works, leaving the hub in a partially
initialized state.

[ ... ]
> @@ -2091,18 +2091,18 @@ static int send_smbus_target_data_to_backend(stru=
ct i2c_adapter_group *smbus,
>  					     u8 address, u8 *local_buffer,
>  					     u8 len)
>  {
>  #if IS_ENABLED(CONFIG_I2C_SLAVE)
>  	struct smbus_backend *backend;
>  	struct i2c_client *client;
>  	int i, ret;
>  	u8 tmp;
> =20
>  	mutex_lock(&smbus->mutex);
> =20
>  	list_for_each_entry(backend, &smbus->backend_entry, list) {
>  		client =3D backend->client;
>  		if (client->addr =3D=3D address >> 1) {
>  			mutex_unlock(&smbus->mutex);
>  			ret =3D i2c_slave_event(client, I2C_SLAVE_WRITE_REQUESTED,
>  					      &address);

[Severity: High]
Can dropping the mutex here lead to a use-after-free?

This breaks synchronization with unreg_i2c_target(), allowing a target
driver to concurrently unregister and free the backend structure while
i2c_slave_event() is invoking the callback using the pointer derived from
the freed backend.

[ ... ]
> @@ -2126,20 +2126,17 @@ static int read_smbus_target_buffer_page(struct i=
2c_adapter_group *smbus,
>  					 u8 target_buffer_page, u8 *address,
>  					 u8 *local_buffer, u8 *len)
>  {
>  	struct i3c_hub *hub =3D smbus->priv;
>  	struct device *dev =3D i3cdev_to_dev(hub->i3cdev);
>  	u32 status;
>  	int ret;
> =20
>  	mutex_lock(&hub->page_mutex);
>  	regmap_write(hub->regmap, I3C_HUB_PAGE_PTR, target_buffer_page);

[Severity: Medium]
Should the return value of regmap_write() be checked here? If this write
fails, the subsequent reads will silently operate on whatever page was
previously selected.

> =20
>  	ret =3D regmap_read(hub->regmap, I3C_HUB_TARGET_BUFF_LENGTH, &status);
>  	if (ret)
>  		goto error;
> =20
>  	*len =3D status - 1;
>  	if (!*len)
>  		goto error;

[Severity: Medium]
Will this incorrectly drop 0-byte writes, such as SMBus Quick Commands?

For a quick command containing only the address byte, status is 1, making
*len evaluate to 0. Jumping to error skips sending the event to the I2C
slave backend.

[ ... ]
> @@ -2598,16 +2598,12 @@ static void i3c_hub_gpio_irq_mask(struct irq_data=
 *d)
>  {
>  	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
>  	struct i3c_hub *hub =3D gpiochip_get_data(gc);
>  	struct hub_gpio *gpio =3D &hub->gpio;
>  	u8 reg, hwirq =3D 0, mask =3D 0;
> =20
>  	hwirq =3D irqd_to_hwirq(d);
> =20
>  	reg =3D hwirq % GPIO_BANK_SZ ? I3C_HUB_TP_SDA_IN_DETECT_IBI_EN :
>  				     I3C_HUB_TP_SCL_IN_DETECT_IBI_EN;
>  	mask =3D BIT(gpio->tp[hwirq / GPIO_BANK_SZ]);
> =20
>  	regmap_update_bits(hub->regmap, reg, mask, 0);
>  }

[Severity: High]
Does calling regmap_update_bits() here cause a "scheduling while atomic" BU=
G?

The generic IRQ subsystem holds the IRQ descriptor's raw spinlock while
invoking the irq_mask/irq_unmask/irq_set_type callbacks, but regmap over I3C
acquires a mutex and can sleep.

[ ... ]
> @@ -2880,14 +2880,14 @@ static int i3c_hub_probe(struct i3c_device *i3cde=
v)
> =20
>  	/* Register logic for native smbus ports */
>  	for (i =3D 0; i < priv->dev_info->n_ports; i++) {
>  		priv->smbus_port_adapter[i].used =3D 0;
>  		if (priv->settings.tp[i].mode =3D=3D I3C_HUB_DT_TP_MODE_SMBUS) {
>  			ret =3D i3c_hub_smbus_tp_algo(priv, i);
>  			if (ret)
>  				dev_warn(dev,
>  					 "Failed to setup SMBus adapter, port: %d\n",
>  					 i);
>  		}
>  	}
[ ... ]
>  	/* IBI */
>  	ibireq.handler =3D i3c_hub_ibi_handler;
>  	ibireq.max_payload_len =3D IBI_MAX_PAYLOAD_LEN;
>  	ibireq.num_slots =3D IBI_SLOT_NUMS;
> =20
>  	ret =3D i3c_device_request_ibi(i3cdev, &ibireq);
>  	if (ret) {
>  		dev_err(dev, "Failed to requeset ibi!\n");
>  		goto error;
>  	}

[Severity: High]
If an error occurs after registering the SMBus adapters, does jumping to the
error labels bypass unregistering the I2C adapters?

Since priv is managed by devm_kzalloc and gets freed when probe fails,
wouldn't the I2C subsystem retain references to freed memory?

[ ... ]
> @@ -2965,11 +2965,11 @@ static void i3c_hub_remove(struct i3c_device *i3c=
dev)
>  {
>  	struct i3c_hub *priv =3D i3cdev_get_drvdata(i3cdev);
>  	int i;
> =20
>  	i3c_device_disable_ibi(i3cdev);
>  	i3c_device_free_ibi(i3cdev);
> =20
>  	for (i =3D 0; i < priv->dev_info->n_ports; i++) {
>  		if (priv->smbus_port_adapter[i].used) {
>  			cancel_delayed_work_sync(&priv->smbus_port_adapter[i].delayed_work_po=
lling);
>  			i2c_del_adapter(&priv->smbus_port_adapter[i].i2c);
>  		}
> =20
>  		if (priv->logical_bus[i].registered)
>  			i3c_master_unregister(&priv->logical_bus[i].controller);
>  	}
> =20
>  	cancel_delayed_work_sync(&priv->delayed_work);

[Severity: High]
Is this teardown order safe?

By canceling priv->delayed_work after tearing down the polling works and
logical buses, if priv->delayed_work runs concurrently, it could schedule
new polling works or register logical buses right before the device is
removed, leading to resource leaks or use-after-free conditions.

>  	debugfs_remove_recursive(priv->debug_dir);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260525125128.297-=
1-zain_zhou@realsil.com.cn?part=3D2
