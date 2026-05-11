Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02FDA2701B6
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 21:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778535068; cv=none; b=jw/xx11A7pB0NJN8sYh7L6mpCFK+otmdgltFd0NkdEvjKkEfBaVYI0/RywNSolGeLc7XrfmhsoBmOB7+tr12QQopOD6iaeXMToxOWyvEOHm2k3xtnohFyRJkAkjKSsJu8F3gDQTnuzTF5xa7X/aTJbPmFgXWNxIgcT71O3LMoSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778535068; c=relaxed/simple;
	bh=6OCdWQn8IAsO97g2aRy4HUpKD8yKFOJoAY5kq4ma3pE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IAshDWpgkmKHQpBOa1n96o/z5ii3ctSyh4VfUNzv4MRPlKQZe9jo4f6wt8a3tj3ZeJdXsAiZYkbpWhO+LkiMm5aHw1Lyk1q/1bArlhGLfNxIIQHaxhY3qjfflHfN3m/hJjlK9BMx4SdsMRjMCFk+ZKilJUti9YZsl2CBk8rlUBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZcEMXuq3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZcEMXuq3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65AA6C2BCB0;
	Mon, 11 May 2026 21:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778535067;
	bh=6OCdWQn8IAsO97g2aRy4HUpKD8yKFOJoAY5kq4ma3pE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=ZcEMXuq3PvjIcq9Bzz8U/s5Y3f1dzL6TlB3psF4rKyZ4TUNHK0I24ddiNds9ivYsd
	 8MHejBGyUPsOHxpNn2Otjp7s6k4yN/a8S4cisNoXTqeI5SHaPjroH4yJueqenUCnZZ
	 fGKQnfYYLkZtJckAXo4B/kNjHv6LoG01M82MBNhzNfSaWtU0ZurgcyTDn2i5AZo3H7
	 JbOS3i1F7fVz9ZlgsHhhHQRrdnLjX7cl6pzTHcyxRzBzMfW28wiE53TVHijIgDOHJW
	 6mE/P0zt4ReFKJjeJRPu1E1N92igIzwucS1r2N8cG94HoqCUkuFMTFJHhV9tHMhg/t
	 1x24sHMDm0z0Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] usb: typec: bm92txx: add Rohm BM92TXX support
Reply-To: sashiko@lists.linux.dev
To: "Alexandre Hamamdjian via B4 Relay" <devnull+azkali.limited.gmail.com@kernel.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260510-bm92t-v1-1-dff3c9d22426@gmail.com>
References: <20260510-bm92t-v1-1-dff3c9d22426@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 11 May 2026 21:31:06 +0000
Message-Id: <20260511213107.65AA6C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 12 potential issue=
(s) to consider:
- [Critical] Stack buffer overflow when parsing untrusted I2C response leng=
th
- [High] Severe resource leaks and use-after-free vulnerability in driver r=
emoval
- [High] NULL pointer dereference when USB role switch is not present
- [High] Flawed I2C error checking ignores read failures and uses uninitial=
ized data
- [High] Integer underflow in current limit calculation configures max draw=
 on low-power sources
- [High] Unconditional IRQ enablement and disablement crashes systems opera=
ting in polling mode
- [High] Out-of-bounds stack read when parsing Vendor Defined Messages (VDM=
s)
- [High] Permanent IRQ disable due to workqueue coalescing
- [Medium] Debugfs writes are completely broken due to incorrect kstrtouint=
 error checking
- [Medium] Build failure due to undeclared identifier when CONFIG_SWITCH is=
 enabled
- [Medium] Memory leak of fwnode references during probe
- [Medium] I2C protocol violation via improper use of I2C_M_NOSTART flag
--

commit d854d38c83a47c694c7093280f068fdb950d3ba8
Author: CTCaer <ctcaer@gmail.com>
Subject: usb: typec: bm92txx: add Rohm BM92TXX support

This commit adds a driver for the Rohm Semiconductor BM92TXX family of USB=
=20
Type-C and Power Delivery controllers. It exposes the controller through ex=
tcon=20
and a USB role switch, and applies per-PDO charging current limits.

> diff --git a/drivers/usb/typec/bm92txx.c b/drivers/usb/typec/bm92txx.c
> index 0000000000000..39e20a4394c11
> --- /dev/null
> +++ b/drivers/usb/typec/bm92txx.c
> @@ -0,0 +1,2634 @@
> [ ... ]
> +static int bm92t_write_reg(struct bm92t_info *info,
> +			   unsigned char *buf, unsigned int len)
> +{
> +	struct i2c_msg xfer_msg[1];
> +
> +	xfer_msg[0].addr =3D info->i2c_client->addr;
> +	xfer_msg[0].len =3D len;
> +	xfer_msg[0].flags =3D I2C_M_NOSTART;

Is it valid to set the I2C_M_NOSTART flag for a single-message transfer her=
e?
This flag instructs the master controller to skip sending the START conditi=
on
and slave address, which is a protocol violation for an independent register
write and is rejected by most upstream I2C master drivers with -EOPNOTSUPP.

> +	xfer_msg[0].buf =3D buf;
> +
> +	dev_dbg(&info->i2c_client->dev,
> +		     "write reg cmd =3D 0x%02X len =3D %d\n", buf[0], len);
> +	return (i2c_transfer(info->i2c_client->adapter, xfer_msg, 1) !=3D 1);
> +}
> +
> +static int bm92t_read_reg(struct bm92t_info *info,
> +			  unsigned char reg, unsigned char *buf, int num)
> +{
> [ ... ]
> +	err =3D i2c_transfer(info->i2c_client->adapter, xfer_msg, 2);
> +	if (err < 0)
> +		dev_err(&info->i2c_client->dev,
> +		      "transfer error %d\n", err);
> +	return (err !=3D 2);
> +}

Does returning a boolean condition here cause issues for the callers?
The expression (err !=3D 2) evaluates to 0 on success and 1 on failure.

> [ ... ]
> +static void bm92t_calculate_current_limit(struct bm92t_info *info,
> +	unsigned int voltage, unsigned int amperage)
> +{
> +	int i;
> +	unsigned int charging_limit =3D amperage;
> +	struct bm92t_platform_data *pdata =3D info->pdata;
> +
> +	/* Subtract a USB2 or USB3 port current */
> +	if (voltage > 5000)
> +		charging_limit -=3D (PD_POWER_RESERVE_UA / voltage);
> +	else
> +		charging_limit -=3D (NON_PD_POWER_RESERVE_UA / voltage);

Can this calculation underflow if the source advertises an amperage less th=
an
the reserve amount? If charging_limit wraps around, the min() macro below
will select the configured maximum limit, potentially commanding the regula=
tor
to draw more current than a low-power source can support.

> +
> +	/* Set limits */
> +	switch (voltage) {
> [ ... ]
> +static void bm92t_extcon_cable_set_init_state(struct work_struct *work)
> +{
> +	struct bm92t_info *info =3D container_of(to_delayed_work(work),
> +					       struct bm92t_info, oneshot_work);
> +
> +	disable_irq(info->i2c_client->irq);

Is it safe to unconditionally call disable_irq() here? The driver allows
polling mode where client->irq might be <=3D 0, so this could manipulate in=
valid
IRQ descriptors or core system interrupts.

Also, since this work item is queued, and the interrupt handler also calls
disable_irq_nosync() before queueing info->work, could the workqueue core
collapse the requests? The IRQ disable depth would increment multiple times,
but enable_irq() would only execute once at the end of the handler, leaving
the interrupt permanently disabled.

> +
> +	bm92t_set_vbus_enable(info, false);
> [ ... ]
> +static bool bm92t_check_pdo(struct bm92t_info *info)
> +{
> +	int i, err, pdos_no;
> +	struct device *dev;
> +	unsigned char pdos[29];
> +	struct pd_object pdo[7];
> +	unsigned int prev_wattage =3D 0;
> +	unsigned int amperage, voltage, wattage, type;
> +
> +	dev =3D &info->i2c_client->dev;
> +
> +	memset(&info->cable, 0, sizeof(struct bm92t_device));
> +
> +	err =3D bm92t_read_reg(info, READ_PDOS_SRC_REG, pdos, sizeof(pdos));
> +	pdos_no =3D pdos[0] / sizeof(struct pd_object);
> +
> +	/* Check if errors or no pdo received */
> +	if (err || !pdos_no)
> +		return 0;
> +
> +	dev_info(dev, "Supported PDOs:\n");
> +	memcpy(pdo, pdos + 1, pdos[0]);

Could a malfunctioning device provide an untrusted pdos[0] length greater t=
han
28? The destination pdo array is sized for 7 elements (28 bytes), so this c=
ould
cause a stack buffer overflow if a length up to 255 is provided.

> +	for (i =3D 0; i < pdos_no; ++i) {
> [ ... ]
> +static void bm92t_event_handler(struct work_struct *work)
> +{
> [ ... ]
> +	err =3D bm92t_read_reg(info, ALERT_STATUS_REG,
> +			     (unsigned char *) &alert_data,
> +			     sizeof(alert_data));
> +	if (err < 0)
> +		goto ret;

Since bm92t_read_reg() returns 0 or 1, checking if (err < 0) will always be
false. Does this cause the driver to silently ignore read failures and cont=
inue
executing with uninitialized stack variables like alert_data?

> [ ... ]
> +	case VDM_ACCEPT_DISC_MODE_REPLY:
> +		if (bm92t_is_success(alert_data)) {
> +			/* Check incoming VDM */
> +			err =3D bm92t_read_reg(info, INCOMING_VDM_REG, vdm,
> +					     sizeof(vdm));
> +
> +			/* Check if DisplayPort Alt mode is supported */
> +			if (vdm[0] > 4 && /* Has VDO objects */
> +			    vdm[1] =3D=3D (VDM_ACK | VDM_CMD_DISC_MODE) &&
> +			    vdm[2] =3D=3D VDM_STRUCTURED &&
> +			    vdm[3] =3D=3D 0x01 && vdm[4] =3D=3D 0xFF && /* SVID DP */
> +			    vdm[5] & VDO_DP_UFP_D &&
> +			    vdm[5] & VDO_DP_SUPPORT) {
> +				dev_info(dev, "DisplayPort Alt Mode supported");
> +				for (i =3D 0; i < ((vdm[0] - 4) / 4); i++) {
> +					dev_info(dev, "DPCap%d %08X\n",
> +						 i, vdm[5 + i * 4]      |
> +						 (vdm[6 + i * 4] << 8)  |
> +						 (vdm[7 + i * 4] << 16) |
> +						 (vdm[8 + i * 4] << 24));

Can this loop go out of bounds? vdm is declared as unsigned char vdm[29].
If vdm[0] is large, the loop could calculate indices past the end of the ar=
ray,
leading to an out-of-bounds stack read that gets logged by dev_info().

> +				}
> [ ... ]
> +static void bm92t_remove(struct i2c_client *client)
> +{
> +	struct bm92t_info *info =3D i2c_get_clientdata(client);
> +
> +#ifdef CONFIG_DEBUG_FS
> +	debugfs_remove_recursive(info->debugfs_root);
> +#endif
> +}

Does this function leak the threaded IRQ, the dedicated workqueue, and the
scheduled delayed works? The probe function manually allocates these resour=
ces,
and if they are not explicitly torn down here before the devm-allocated info
structure is freed, it could lead to a use-after-free panic during module
unload.

> [ ... ]
> +static ssize_t bm92t_cmd_write(struct file *file,
> +		     const char __user *userbuf, size_t count, loff_t *ppos)
> +{
> +	struct bm92t_info *info =3D (struct bm92t_info *) (file->private_data);
> +	unsigned int val;
> +	unsigned short cmd;
> +	char buf[8];
> +	int ret;
> +
> +	count =3D min_t(size_t, count, (sizeof(buf)-1));
> +	if (copy_from_user(buf, userbuf, count))
> +		return -EFAULT;
> +
> +	buf[count] =3D 0;
> +
> +	ret =3D kstrtouint(buf, 0, &val);
> +
> +	if (ret =3D=3D 1) {

Is it possible for kstrtouint() to return 1? It returns 0 on success and a
negative error code on failure. Checking for 1 means valid inputs are rejec=
ted,
rendering the debugfs interface non-functional. (This also applies to
bm92t_usbhub_dp_sleep_write).

> +		cmd =3D val;
> +		bm92t_send_cmd(info, &cmd);
> +	} else {
> +		dev_err(&info->i2c_client->dev, "Cmd syntax is: cmd\n");
> +		return -EINVAL;
> +	}
> +
> +	return count;
> +}
> [ ... ]
> +static int bm92t_probe(struct i2c_client *client)
> +{
> [ ... ]
> +	ep =3D fwnode_graph_get_endpoint_by_id(
> +		dev_fwnode(&client->dev), 0, 0, 0);
> +	if (!ep) {
> +		dev_err(&client->dev, "Endpoint not found\n");
> +		return -ENODEV;
> +	}
> +
> +	remote =3D fwnode_graph_get_remote_endpoint(ep);
> +	if (!remote) {
> +		dev_err(&client->dev, "Remote not found\n");
> +		return -ENODEV;
> +	}
> +
> +	info->role_sw =3D fwnode_usb_role_switch_get(remote);
> +	if (IS_ERR_OR_NULL(info->role_sw)) {
> +		err =3D PTR_ERR(info->role_sw);
> +		dev_err(&client->dev, "Failed to retrieve fwnode: %d\n", err);
> +		return err;

If info->role_sw is NULL, PTR_ERR returns 0. The probe function would then =
exit
early and return 0 without calling i2c_set_clientdata(). Would this lead to=
 a
NULL pointer dereference later when bm92t_remove() or suspend callbacks try=
 to
fetch the clientdata?

Also, do the fwnode references for ep and remote need to be released using
fwnode_handle_put() to prevent a memory leak?

> +	}
> +
> +	i2c_set_clientdata(client, info);
> [ ... ]
> +#ifdef CONFIG_SWITCH
> +	info->pd_switch.name =3D pd_switch_name;

Is pd_switch_name declared anywhere? This looks like it would cause a build
failure due to an undeclared identifier when CONFIG_SWITCH is enabled.

> +	err =3D switch_dev_register(&info->pd_switch);
> +	if (err)
> +		dev_err(&client->dev, "failed to register pd switch, err=3D%d\n", err);
> +#endif

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260510-bm92t-v1-0=
-dff3c9d22426@gmail.com?part=3D1
