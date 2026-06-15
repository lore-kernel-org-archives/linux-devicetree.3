Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C07366045
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 06:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781503800; cv=none; b=NT2Xg7Rd60m5Pt61NLLSjc7finrtswR8+GyI6CPSr8JvxQMwkmdOe05slYzlOyMqZHr854cwOFTGMtmDldPvOky/CvezL4xwMGg04/dDvX2P6UMzboqBfj2AyULG121w1hVqtiCgqpZfGDbCBq9Z9AMFyarp92u9BqNuNszIvtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781503800; c=relaxed/simple;
	bh=K/4d84GpQFmc0eB6x/Tbw8WPQCN3i2zINsMix9OHcq4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=p1NydO9SzCP9gGjKYD8lPqNp1UKIYOvmzXRDhQG1fhOhwBRauhZsjvRk7Lh5PS9WD1TlXCSbuMlfvsPhueRcxEKqBXXBPa7en2F+1C3QhOpbdGXnyBlUIDwJ/nIhp1crtUNWO5F7D9Wv3s5E/uVLvWSr1x1x+BV0z519SiLrK7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pj8vyvhe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pj8vyvhe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53AD21F000E9;
	Mon, 15 Jun 2026 06:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781503798;
	bh=rKSzHhX4bGkK9IIONBI+7MX2w9DJwgTPJsUDG5qMtFc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Pj8vyvheEIFPJx4ilVQpANEvN5dcw4c0K9Zv0baBbJhVBpXWfUenzq4o7UMirqr7X
	 dy1b2gIXb2oUhZqgowx1CyekUSWDQIIngf40EP9lslobT6MoyVuO8GWX+ZVo47jCUf
	 46wKQgUFBDnTl8tug3+i+ouIF2XujgkbmOYIhiOUxD5q5swo5PCNAWDH0sVUDRs87/
	 71ISSNEC9Txn2hI+LDek25v/x99W/km/vkKHV4Cv5ITgA+lIT4jHw041WhPHSYLcgo
	 Z2Tc3Nhsx4Nn8S75Y0vXzLq8HlMci2MGA6JpSD4RV6GLWS6oxUVXfxfDiz3Vjf2iGh
	 DEuGZrTlEN6bQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] usb: typec: ucsi: Add ITE IT885x Type-C PD
 controller driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Amber Kao" <amber.kao@ite.com.tw>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260615-ucsi-itepd-feature-v1-2-a826cfd0df6a@ite.com.tw>
References: <20260615-ucsi-itepd-feature-v1-2-a826cfd0df6a@ite.com.tw>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 06:09:57 +0000
Message-Id: <20260615060958.53AD21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 12 potential issue=
(s) to consider:
- [High] DMA safety violation passing stack-allocated variables directly to=
 `i2c_transfer()`.
- [High] Incorrect `devm` unwind ordering causes Use-After-Free of Type-C r=
esources during workqueue flush.
- [High] Race condition during driver removal causing Use-After-Free by des=
troying the UCSI instance and workqueue before unregistering the interrupt =
callback.
- [High] Out-of-bounds array access due to unvalidated port index extracted=
 from UCSI commands and hardware responses.
- [High] Race condition during probe where premature interrupt callback reg=
istration causes a NULL pointer dereference of the `ucsi` instance.
- [High] Uninitialized variables `ret` and `data` in `ucsi_itepd_connector_=
change_work` lead to undefined behavior and stack data leaks.
- [High] Missing lock protection when reading `itepd->altmode_cb` leads to =
data races and potential TOCTOU NULL pointer dereference.
- [High] Use of uninitialized stack memory during UCSI response parsing (`m=
sg_in`).
- [High] Multi-byte native types (u64, u32, u16) are copied directly to/fro=
m I2C byte buffers, breaking on Big Endian architectures.
- [High] A pending initial hardware interrupt is explicitly acknowledged du=
ring probe but the event is permanently dropped.
- [Medium] `free_irq()` is called unconditionally during cleanup, even if t=
he IRQ was never successfully requested.
- [Medium] Data races on `dp_en` and `con_change_processed` flags due to mi=
ssing synchronization between workqueues.
--

commit 06a7873d268be15ee101449d82fa1a3ba9e341f7
Author: Amber Kao <amber.kao@ite.com.tw>

usb: typec: ucsi: Add ITE IT885x Type-C PD controller driver

Add core, UCSI, and Alternate Mode support for the ITE IT885x
Type-C Power Delivery controller over I2C. The driver uses the
auxiliary bus to spawn UCSI and Alternate Mode child devices from
the main I2C core driver.

> diff --git a/drivers/usb/typec/ucsi/itepd.c b/drivers/usb/typec/ucsi/itep=
d.c
> new file mode 100644
> index 0000000000000..39ac1c1361572
> --- /dev/null
> +++ b/drivers/usb/typec/ucsi/itepd.c
[ ... ]
> +static int itepd_read_reg(struct itepd *itepd, u8 reg, void *data, u32 l=
en)
> +{
> +	struct i2c_client *client =3D itepd->client;
> +	struct i2c_msg msg[] =3D {
> +		{
> +			.addr	=3D client->addr,
> +			.flags	=3D 0x0,
> +			.len	=3D 1,
> +			.buf	=3D &reg,
> +		},
> +		{
> +			.addr	=3D client->addr,
> +			.flags	=3D I2C_M_RD,
> +			.len	=3D len,
> +			.buf	=3D (u8 *)data,
> +		}
> +	};

[Severity: High]
Could this cause DMA mapping errors? The stack-allocated msg array passes
the addresses of the local variables reg and data. The I2C subsystem
requires all buffers passed to i2c_transfer to be DMA-safe. If the I2C
adapter utilizes DMA, mapping stack memory can cause cache coherency issues
or trigger a panic if CONFIG_DMA_API_DEBUG is enabled.

[ ... ]
> +static int itepd_write_reg(struct itepd *itepd, u8 reg, const void *data=
, u32 len)
> +{
[ ... ]
> +	buf[0] =3D reg;
> +	memcpy(buf + sizeof(reg), (u8 *)data, len);

[Severity: High]
Might this break on big-endian architectures? When a multi-byte native
type like u64 or u32 is passed into data and copied directly into the I2C
buffer via memcpy, the most significant bytes are placed first on a big
endian system. Should this use explicit byte-order conversions like
cpu_to_le64 or le32_to_cpu?

[ ... ]
> +int itepd_mode(struct device *dev, u8 port, u8 mux, u32 config, u32 stat=
us)
> +{
[ ... ]
> +		itepd->altmode_data[port].dp_status =3D status;
> +		if (itepd->altmode_cb)
> +			itepd->altmode_cb->notify(itepd->altmode_cb->priv,
> +						  &itepd->altmode_data[port]);

[Severity: High]
Is there a potential TOCTOU race condition here? The altmode callback point=
er
is checked and invoked without holding the cb_lock mutex. If
itepd_altmode_remove unregisters the callback concurrently, altmode_cb
could become NULL right after the check, leading to a dereference panic.
Does itepd_hpd share this same unprotected pattern?

[ ... ]
> +static int itepd_probe(struct i2c_client *client)
> +{
[ ... ]
> +	desc =3D devm_gpiod_get(dev, NULL, GPIOD_IN);
> +
> +	if (IS_ERR(desc)) {
> +		dev_info(dev, "get gpios from DTS failed\n");
> +	} else {
> +		if (gpiod_get_value(desc))
> +			itepd_irq_process(itepd);
> +	}

[Severity: High]
Could this manually trigger an interrupt drop? At this point in the probe
sequence, the auxiliary devices and callbacks are not yet added. Calling
itepd_irq_process clears the pending hardware events by writing to
ITEPD_VENDOR_WC_INT, but since the callbacks are NULL, the event data is
discarded without notifying the UCSI or altmode subsystems.

[ ... ]
> +out_release_altmode_aux:
> +	if (itepd->client_mask & BIT(ITEPD_CLIENT_ALTMODE))
> +		itepd_del_aux_device(itepd->altmode_aux);
> +out_free_irq:
> +	free_irq(itepd->irq, itepd);
> +	return ret;
> +}
> +
> +static void itepd_remove(struct i2c_client *client)
> +{
> +	struct itepd *itepd =3D i2c_get_clientdata(client);
> +
> +	if (itepd->client_mask & BIT(ITEPD_CLIENT_UCSI))
> +		itepd_del_aux_device(itepd->ucsi_aux);
> +	if (itepd->client_mask & BIT(ITEPD_CLIENT_ALTMODE))
> +		itepd_del_aux_device(itepd->altmode_aux);
> +	free_irq(itepd->irq, itepd);
> +}

[Severity: Medium]
Is it safe to unconditionally call free_irq here? The probe function correc=
tly
checks if itepd->irq > 0 before calling request_threaded_irq, but the error
handling and remove paths free the IRQ regardless. If the device was probed
without a valid IRQ, wouldn't this attempt to free an unassigned IRQ line
and trigger a warning?

> diff --git a/drivers/usb/typec/ucsi/itepd_altmode.c b/drivers/usb/typec/u=
csi/itepd_altmode.c
> new file mode 100644
> index 0000000000000..a88ae2fb6e798
> --- /dev/null
> +++ b/drivers/usb/typec/ucsi/itepd_altmode.c
[ ... ]
> +static int itepd_altmode_probe(struct auxiliary_device *adev,
> +			       const struct auxiliary_device_id *id)
> +{
[ ... ]
> +		alt_port->ordered_wq =3D alloc_ordered_workqueue("itepd_altmode_%u", 0=
, port);
> +		if (!alt_port->ordered_wq) {
> +			fwnode_handle_put(fwnode);
> +			return -ENOMEM;
> +		}
> +
> +		ret =3D devm_add_action_or_reset(dev, itepd_altmode_destroy_wq,
> +					       alt_port->ordered_wq);
> +		if (ret) {
> +			fwnode_handle_put(fwnode);
> +			return ret;
> +		}
[ ... ]
> +		alt_port->typec_mux =3D fwnode_typec_mux_get(fwnode);
> +		if (IS_ERR(alt_port->typec_mux)) {

[Severity: High]
Does this devm initialization order create a use-after-free risk during
device removal? The action to destroy the workqueue is added before the
typec_mux, typec_retimer, and typec_switch are acquired and their put actio=
ns
registered. Since devm unwinds in LIFO order, the workqueue flush will
execute after the Type-C resources have been freed. If a worker is pending,
it might dereference the already freed typec resource pointers.

> diff --git a/drivers/usb/typec/ucsi/ucsi_itepd.c b/drivers/usb/typec/ucsi=
/ucsi_itepd.c
> new file mode 100644
> index 0000000000000..ea55ff7b866ee
> --- /dev/null
> +++ b/drivers/usb/typec/ucsi/ucsi_itepd.c
[ ... ]
> +static void ucsi_itepd_connector_change_work(struct work_struct *work)
> +{
> +	struct ucsi_itepd_work *worker =3D container_of(work, struct ucsi_itepd=
_work, work);
> +	struct ucsi_itepd *ucsi_itepd =3D worker->ucsi_itepd;
> +	u8 data[11];
> +	u8 num_vdos;
> +	u32 status;
> +	u64 cmd;
> +	int ret;
> +
> +	if (ucsi_itepd->con_change_processed[worker->port])
> +		goto out;
> +
> +	ucsi_itepd->con_change_processed[worker->port] =3D true;

[Severity: Medium]
Is there a data race on these array flags? The flags dp_en and
con_change_processed are modified in ucsi_itepd_connector_status, which runs
on the core system_long_wq, but they are read and modified here on the local
ordered_wq. Without mutual exclusion, could this result in skipped
evaluations or out-of-order state transitions?

> +	if (ucsi_itepd->dp_en[worker->port]) {
> +		/* UCSI_GET_ATTENTION_VDO (0x16) */
> +		cmd =3D UCSI_COMMAND(UCSI_GET_ATTENTION_VDO) |
> +		      UCSI_CONNECTOR_NUMBER(worker->port + 1);
> +		ret =3D ucsi_send_command(ucsi_itepd->ucsi, cmd, data, 11);
> +	}
> +	if (ret < 0)
> +		goto out;

[Severity: High]
Can this lead to uninitialized stack variable usage? If dp_en is false, the
block that calls ucsi_send_command is skipped, leaving ret and data
uninitialized. Depending on the garbage value of ret, it might skip the
connector change notification or proceed to read random stack values from
data to pass into itepd_hpd.

[ ... ]
> +static void ucsi_itepd_response_hook(struct ucsi_itepd *ucsi_itepd,
> +				     u32 *cci, u8 *msg_in)
> +{
> +	u8 recipient;
> +	u8 offset;
> +	struct ucsi_itepd_work *worker;
> +
> +	if (((*cci & UCSI_CCI_COMMAND_COMPLETE) =3D=3D 0) &&
> +	    UCSI_CCI_CONNECTOR(*cci)) {
> +		worker =3D kmalloc_obj(*worker, GFP_KERNEL);
> +		if (!worker) {
> +			dev_err(ucsi_itepd->dev,
> +				"out of memory, skip attention check\n");
> +			ucsi_connector_change(ucsi_itepd->ucsi,
> +					      UCSI_CCI_CONNECTOR(*cci));
> +		} else {
> +			worker->port =3D UCSI_CCI_CONNECTOR(*cci) - 1;
> +			worker->ucsi_itepd =3D ucsi_itepd;
> +			worker->cci =3D *cci;

[Severity: High]
Is the worker->port index sufficiently validated? The port index is derived
directly from the hardware CCI register and can be up to 126. It is then
passed to the workqueue where it indexes bounded arrays like
con_change_processed and dp_en which are sized by ITEPD_MAX_PORTS. Would
a faulty or unexpected hardware response cause out-of-bounds memory
corruption here?

[ ... ]
> +		switch (UCSI_COMMAND(ucsi_itepd->cmd)) {
> +		case UCSI_GET_CONNECTOR_STATUS:
> +			ucsi_itepd->connected[ucsi_itepd->cmd_port] =3D
> +				!!(msg_in[2] & BIT(3));
> +			ucsi_itepd->orientation[ucsi_itepd->cmd_port] =3D
> +				FIELD_GET(BIT(6), msg_in[10]);
> +			break;

[Severity: High]
Could this read past the end of the populated response data? The driver cop=
ies
the I2C payload into a local msg_in buffer based on the length provided in
the CCI register. If the hardware responds with a shorter message, reading
msg_in[10] unconditionally evaluates uninitialized stack memory.

[ ... ]
> +static int ucsi_itepd_probe(struct auxiliary_device *adev,
> +			    const struct auxiliary_device_id *id)
> +{
[ ... ]
> +	ret =3D itepd_register_cb(dev, ITEPD_CLIENT_UCSI, ucsi_itepd_cb);
> +	if (ret)
> +		goto out_destroy_wq;
> +
> +	ucsi_itepd->ucsi =3D ucsi_create(dev, &ucsi_itepd_ops);

[Severity: High]
Does registering the callback early create a race condition? The interrupt =
on
the parent I2C device is already active. If an interrupt fires immediately
after itepd_register_cb, it will invoke ucsi_itepd_notify which ultimately
dereferences ucsi_itepd->ucsi. Since ucsi_create has not been called yet,
could this result in a NULL pointer dereference?

[ ... ]
> +static void ucsi_itepd_remove(struct auxiliary_device *adev)
> +{
> +	struct ucsi_itepd *ucsi_itepd =3D dev_get_drvdata(&adev->dev);
> +
> +	if (ucsi_itepd->ordered_wq) {
> +		flush_workqueue(ucsi_itepd->ordered_wq);
> +		destroy_workqueue(ucsi_itepd->ordered_wq);
> +	}
> +
> +	ucsi_unregister(ucsi_itepd->ucsi);
> +	ucsi_destroy(ucsi_itepd->ucsi);
> +	usleep_range(2000, 2500);
> +	itepd_register_cb(&adev->dev, ITEPD_CLIENT_UCSI, NULL);
> +}

[Severity: High]
Might this teardown sequence result in a use-after-free? The workqueue is
destroyed and the ucsi instance is freed before the callback is unregistere=
d.
If an interrupt occurs concurrently, the handler could invoke the callback,
attempting to queue a task on the destroyed workqueue or dereference the
freed ucsi structure. Should the callback be cleared before resources are
freed?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260615-ucsi-itepd=
-feature-v1-0-a826cfd0df6a@ite.com.tw?part=3D2
