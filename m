Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AAD1472767
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 21:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778536506; cv=none; b=ZK23znnLmKXc0EZ9HdeEVGbznTckYqB7L7AjNC3ygoizBiW4EpYuxXGFVm/sDDZC3AmtnIoE95iOTWrVXEYfTJzKuNgCdSQdA4qW70yXR3kXViGCsWuZqQ2W+3llyiXpoPgAhqgB9nJHMqqHvdEv1c7orkBx05sALzxoercr5K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778536506; c=relaxed/simple;
	bh=49UCQF2Mfjjy+jnVHqQ6gMpH2kim7Eyx4ERBDg+X7Lg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=H0Kjs85Hwmb4HMf6nrZdTbBZQlW2CaR1IWgi3UVQRIDekSBkX7Fl8t5ulrSiBse1s3SE/jbZ1fH0KRzF2Ni757NzUq2p0f0McZap/q3cVu1N8luMYHLRrJkF7wnXkGd9YnrvmFeo0sX+KUfaNlf4K6dawhUqmGUJK9zvJNb3wso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HjXGyvcK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HjXGyvcK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3546AC2BCB0;
	Mon, 11 May 2026 21:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778536506;
	bh=49UCQF2Mfjjy+jnVHqQ6gMpH2kim7Eyx4ERBDg+X7Lg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=HjXGyvcKTyp9hQ8IoEIgLF2ZSqgyHxZXrhRRw1q3TJRvzXuFkJzt0vRYM2nuLTe+A
	 VRlqaLN4/T7HlMxeukCQyQKjuqs7DmAXILk4JnhW0AvdFFuo/sD7iKEabO6SDWCCLt
	 LU4rLmmQzesZxobRQrF28dzFcNr8akZtyjDCak4u8FDVQbe7ZJd7YjpF+4FsjMwKHj
	 kUwQRwBe7IU69Y2B8O/UJq6Bg4l1cM20B8LtpB7SW2dIZPdYz2hYfVOkcC904Vs2pZ
	 7idnP7TJB4utNNy4pvGvIZUeix+wBUQliS+w26A7caSvLhc7k8UzveTiZ5BOGMTAdn
	 32/RTNcgDasnw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] usb: typec: bm92txx: add Rohm BM92TXX support
Reply-To: sashiko@lists.linux.dev
To: "Alexandre Hamamdjian via B4 Relay" <devnull+azkali.limited.gmail.com@kernel.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260511-bm92t-v2-1-2145e4f4386b@gmail.com>
References: <20260511-bm92t-v2-1-2145e4f4386b@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 11 May 2026 21:55:05 +0000
Message-Id: <20260511215506.3546AC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 11 potential issue=
(s) to consider:
- [Critical] Missing cleanup in bm92t_remove and error paths leads to use-a=
fter-free and resource leaks.
- [Critical] Unvalidated I2C message lengths lead to stack buffer overflow =
and out-of-bounds reads.
- [High] Integer underflow in current limit calculation allows over-drawing=
 power from weak sources.
- [High] bm92t_probe succeeds without full initialization when role switch =
is NULL, causing NULL pointer dereference.
- [High] Use of C bitfields to parse hardware responses breaks on big-endia=
n architectures.
- [High] Misuse of disable_irq() and queue_work() causes permanent IRQ disa=
blement.
- [High] I2C_M_NOSTART is incorrectly set for standard standalone writes, v=
iolating I2C protocol.
- [High] Race condition due to unsynchronized access to driver state and gl=
obal arrays.
- [High] Incorrect cancellation of power_work can leave charging enabled af=
ter cable disconnect.
- [Medium] Undeclared variable pd_switch_name causes build failure if CONFI=
G_SWITCH is enabled.
- [Medium] Incorrect return value check for kstrtouint() breaks debugfs int=
erfaces.
--

commit bc2b1e9499614886b3e416da0258ae455e2169d4
Author: CTCaer <ctcaer@gmail.com>
usb: typec: bm92txx: add Rohm BM92TXX support

This commit introduces the driver for the Rohm BM92TXX USB Type-C and
Power Delivery controllers. It provides extcon, USB role switch support,
and VBUS regulation based on PD negotiations.

diff --git a/drivers/usb/typec/bm92txx.c b/drivers/usb/typec/bm92txx.c
--- a/drivers/usb/typec/bm92txx.c
+++ b/drivers/usb/typec/bm92txx.c
@@ -359,6 +359,13 @@
> +struct __packed pd_object {
> +	unsigned int amp:10;
> +	unsigned int volt:10;
> +	unsigned int info:10;
> +	unsigned int type:2;
> +};

Does the use of C bitfields to parse hardware responses via memcpy() break
protocol parsing on big-endian architectures?

[ ... ]

@@ -550,6 +550,13 @@
> +static int bm92t_write_reg(struct bm92t_info *info,
> +			   unsigned char *buf, unsigned int len)
> +{
> +	struct i2c_msg xfer_msg[1];
> +
> +	xfer_msg[0].addr =3D info->i2c_client->addr;
> +	xfer_msg[0].len =3D len;
> +	xfer_msg[0].flags =3D I2C_M_NOSTART;
> +	xfer_msg[0].buf =3D buf;

Does setting I2C_M_NOSTART on a single-message transfer violate the I2C
protocol? This might cause standard I2C adapter drivers to reject the write.

[ ... ]

@@ -1285,6 +1285,13 @@
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

Can this subtraction underflow since charging_limit is unsigned? If the sou=
rce
advertises an amperage less than the reserve, this could wrap around to a
large positive value and bypass the min() checks, potentially setting a lar=
ge
current limit on a weak source.

[ ... ]

@@ -1310,6 +1310,13 @@
> +static void bm92t_extcon_cable_set_init_state(struct work_struct *work)
> +{
> +	struct bm92t_info *info =3D container_of(to_delayed_work(work),
> +					       struct bm92t_info, oneshot_work);
> +
> +	disable_irq(info->i2c_client->irq);
[ ... ]
> +	queue_work(info->event_wq, &info->work);
> +}

And in the interrupt handler:

@@ -1910,6 +1910,13 @@
> +static irqreturn_t bm92t_interrupt_handler(int irq, void *handle)
> +{
> +	struct bm92t_info *info =3D handle;
> +
> +	disable_irq_nosync(info->i2c_client->irq);
> +	queue_work(info->event_wq, &info->work);
> +	return IRQ_HANDLED;
> +}

Could this sequence permanently disable the interrupt? If the interrupt han=
dler
and the delayed work both call disable_irq() and then queue_work(), the
workqueue might deduplicate the work item. The work will only execute once =
and
enable the IRQ once, leaving the disable depth unbalanced.

[ ... ]

@@ -1335,6 +1335,13 @@
> +static bool bm92t_check_pdo(struct bm92t_info *info)
> +{
> +	int i, err, pdos_no;
> +	struct device *dev;
> +	unsigned char pdos[29];
> +	struct pd_object pdo[7];
[ ... ]
> +	err =3D bm92t_read_reg(info, READ_PDOS_SRC_REG, pdos, sizeof(pdos));
> +	pdos_no =3D pdos[0] / sizeof(struct pd_object);
[ ... ]
> +	memcpy(pdo, pdos + 1, pdos[0]);

Does this code overflow the pdo[] array? The size pdos[0] is read directly =
from
the I2C device and used in memcpy() into a 28-byte array without validation.

Similarly, in the event handler:

@@ -1765,6 +1765,13 @@
> +	case VDM_ACCEPT_DISC_SVID_REPLY:
> +		if (bm92t_is_success(alert_data)) {
> +			/* Check discovered SVIDs */
> +			err =3D bm92t_read_reg(info, INCOMING_VDM_REG, vdm,
> +					     sizeof(vdm));
> +
> +			if (vdm[1] =3D=3D (VDM_ACK | VDM_CMD_DISC_SVID)) {
> +				dev_info(dev, "Supported SVIDs:\n");
> +				for (i =3D 0; i < ((vdm[0] - 4) / 2); i++) {
> +					dev_info(dev, "SVID%d %04X\n", i,
> +						 vdm[5 + i * 2] |
> +						 (vdm[6 + i * 2] << 8));
> +				}

Can this loop read past the end of the vdm[] stack buffer? The length vdm[0]
is read from the hardware and used as the loop bound without bounds checkin=
g.

[ ... ]

@@ -1550,6 +1550,13 @@
> +static void bm92t_usbhub_led_cfg_wait(struct bm92t_info *info,
> +	unsigned char duty, unsigned char time_on,
> +	unsigned char time_off, unsigned char fade)
> +{
> +	int retries =3D 100;
> +
> +	if (info->state =3D=3D NINTENDO_CONFIG_HANDLED) {
> +		bm92t_state_machine(info, VDM_ND_CUSTOM_CMD_SENT);
> +		bm92t_usbhub_led_cfg(info, duty, time_on, time_off, fade);
> +		while (info->state !=3D NINTENDO_CONFIG_HANDLED) {
> +			retries--;
> +			if (retries < 0)
> +				break;
> +			usleep_range(1000, 1500);
> +		}
> +	}
> +}

Is there a race condition here? The driver state and global arrays like
vdm_usbhub_led_msg are modified concurrently from the workqueue, debugfs
write handlers, and PM suspend/resume callbacks without locking.

[ ... ]

@@ -1682,6 +1682,13 @@
> +	if (alert_data & ALERT_PLUGPULL) {
> +		if (!bm92t_is_plugged(status1_data)) { /* Pull event */
> +src_fault:
> +			/* Cancel any pending charging enable work */
> +			cancel_delayed_work(&info->power_work);
> +
> +			/* Disable VBUS in case it's enabled */
> +			bm92t_set_vbus_enable(info, false);
> +
> +			/* Disable charging */
> +			if (info->pd_charging_enabled) {

Should this use cancel_delayed_work_sync()? Using the non-sync version might
leave bm92t_power_work() executing on another CPU, which could re-enable
charging right after the unplug handler disables it.

[ ... ]

@@ -1918,6 +1918,13 @@
> +static void bm92t_remove(struct i2c_client *client)
> +{
> +	struct bm92t_info *info =3D i2c_get_clientdata(client);
> +
> +#ifdef CONFIG_DEBUG_FS
> +	debugfs_remove_recursive(info->debugfs_root);
> +#endif
> +}

Does this code leak the workqueue, fwnode handles, and switch device?

Furthermore, since the IRQ is non-devm and the work items are not synchrono=
usly
canceled, can this cause a use-after-free when the devm-managed memory is f=
reed
but the IRQ or delayed works fire later?

[ ... ]

@@ -2110,6 +2110,13 @@
> +static ssize_t bm92t_cmd_write(struct file *file,
> +		     const char __user *userbuf, size_t count, loff_t *ppos)
> +{
[ ... ]
> +	ret =3D kstrtouint(buf, 0, &val);
> +
> +	if (ret =3D=3D 1) {
> +		cmd =3D val;
> +		bm92t_send_cmd(info, &cmd);
> +	} else {
> +		dev_err(&info->i2c_client->dev, "Cmd syntax is: cmd\n");
> +		return -EINVAL;
> +	}

Does kstrtouint() return 0 on success? Checking for a return value of 1 will
cause the debugfs interfaces to reject valid inputs with -EINVAL.

[ ... ]

@@ -2413,6 +2413,13 @@
> +	info->role_sw =3D fwnode_usb_role_switch_get(remote);
> +	if (IS_ERR_OR_NULL(info->role_sw)) {
> +		err =3D PTR_ERR(info->role_sw);
> +		dev_err(&client->dev, "Failed to retrieve fwnode: %d\n", err);
> +		return err;
> +	}
> +
> +	i2c_set_clientdata(client, info);

If fwnode_usb_role_switch_get() returns NULL, IS_ERR_OR_NULL is true and err
is set to PTR_ERR(NULL) which is 0. Does this cause the probe function to
succeed without calling i2c_set_clientdata(), leading to a NULL pointer
dereference later when bm92t_remove() retrieves it?

[ ... ]

@@ -2514,6 +2514,13 @@
> +#ifdef CONFIG_SWITCH
> +	info->pd_switch.name =3D pd_switch_name;
> +	err =3D switch_dev_register(&info->pd_switch);
> +	if (err)
> +		dev_err(&client->dev, "failed to register pd switch, err=3D%d\n", err);
> +#endif

Is pd_switch_name declared anywhere? Referencing an undeclared variable will
cause a build failure when CONFIG_SWITCH is enabled.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511-bm92t-v2-0=
-2145e4f4386b@gmail.com?part=3D1
