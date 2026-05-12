Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA94282F2A
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 04:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778561056; cv=none; b=W9ZzbCiRNgdU+fDKbAvU9zwsQjQWGVgL82CxaDYVe8YkwMLK2XZDEWPK2AFC75TGu3+kDGkQnkakonnWQiPutvlOsCLvcSZtujvuznivybUYMC1FvoY9GciDm9ONhD4nWFFcDM5ZWO06DTNzCKS6D/FeujHPhHJH55ISMtPcXQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778561056; c=relaxed/simple;
	bh=lKhR0fH18yPdb7j51c+8y28Ad23b0uXX9SQ7zR980UQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eONjirc//X0EGe2o/mp7dDQr3y+ir3M+vgUsQt6jBtGvLhNaOK7269ZBMRyqY1bfYtkDLSOlQb31tPVf021NxNiLoPJI4MEssdvxcNM1NEqrSqShgcPOdrPAurDFB+fj7RJqWMvaNidgI0RdDM5VE9+bSgsMMK9iM2wIXTXxtCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W4Gz90sn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W4Gz90sn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4447C2BCC7;
	Tue, 12 May 2026 04:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778561055;
	bh=lKhR0fH18yPdb7j51c+8y28Ad23b0uXX9SQ7zR980UQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=W4Gz90snfhNG6FINzAnQycvxe1AuQqa/HxJUZpkQjhtNL0PyZ7eyZvdfphUkLqj9z
	 RS6+b5XADzAFkNi/2ca3zW5bEzgyAA/KtM/awAzpvmbrdQC5TAYMGLyN7lmOyPZc2q
	 cqVki4+6rD6dq/EG1lRe2CYe3Q0C4vI/HTmJ0D3aazJOODH3kWklsd9Xfg+wPvEIPV
	 GxPz5gnLsGfCSXqrLV6elA6J+lD3bxX5glTwXYqiSzX0TC1mQT2dYeBvAiolYBO7bz
	 fiLVSLWJORCJe+maSr1mbd7+u3k4JCkmqMdWfkeEZWL8UX6235uFHuaUGMw4bO4VWE
	 SiIFTnyaySbAw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 2/6] platform: arm64: Add driver for EC found on
 Qualcomm reference devices
Reply-To: sashiko@lists.linux.dev
To: "Anvesh Jain P" <anvesh.p@oss.qualcomm.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260511-add-driver-for-ec-v9-2-e5437c39b7f8@oss.qualcomm.com>
References: <20260511-add-driver-for-ec-v9-2-e5437c39b7f8@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 04:44:15 +0000
Message-Id: <20260512044415.A4447C2BCC7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] The driver unconditionally fails to probe if CONFIG_THERMAL is dis=
abled, rendering the Kconfig allowance useless.
- [High] Returning `IRQ_HANDLED` on I2C read failure causes an infinite int=
errupt storm.
- [High] Probe error paths fail to disable EC SCI events, leaving the hardw=
are in an active interrupt-generating state.
- [High] Hardware cleanup in `remove()` races with the still-active devm-ma=
naged thermal cooling devices.
- [High] Insufficient validation of I2C read response lengths leads to unin=
itialized kernel stack memory being used.
- [Medium] The driver fails to re-initialize the EC state after receiving a=
 reset event.
- [Medium] The driver does not implement the temperature sensors claimed in=
 the commit message.
--

commit eeb96765c7d798e7194e02ed8e7a83c95dd5ad82
Author: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

platform: arm64: Add driver for EC found on Qualcomm reference devices
   =20
Add Embedded controller driver support for Hamoa/Purwa/Glymur qualcomm
reference boards.

> Add Embedded controller driver support for Hamoa/Purwa/Glymur qualcomm
> reference boards. It handles fan control, temperature sensors, access
> to EC state changes and supports reporting suspend entry/exit to the
> EC.

The commit message mentions handling "temperature sensors", but I don't
see any logic to register thermal zones, expose hwmon sensors, or read
current temperatures from the EC.

Is the thermistor reading logic missing from this patch?

> diff --git a/drivers/platform/arm64/Kconfig b/drivers/platform/arm64/Kcon=
fig
> index 10f905d7d6bfa..e32e01b2a9bdd 100644
> --- a/drivers/platform/arm64/Kconfig
> +++ b/drivers/platform/arm64/Kconfig
> @@ -90,4 +90,17 @@ config EC_LENOVO_THINKPAD_T14S
> =20
>  	  Say M or Y here to include this support.
> =20
> +config EC_QCOM_HAMOA
> +	tristate "Embedded Controller driver for Qualcomm Hamoa/Glymur referenc=
e devices"
> +	depends on ARCH_QCOM || COMPILE_TEST
> +	depends on I2C
> +	depends on THERMAL || THERMAL=3Dn

[ ... ]

> diff --git a/drivers/platform/arm64/qcom-hamoa-ec.c b/drivers/platform/ar=
m64/qcom-hamoa-ec.c
> new file mode 100644
> index 0000000000000..a018f7bf35d2a
> --- /dev/null
> +++ b/drivers/platform/arm64/qcom-hamoa-ec.c

[ ... ]

> +static int qcom_ec_probe(struct i2c_client *client)
> +{

[ ... ]

> +	for (i =3D 0; i < ec->thermal_cap.fan_cnt; i++) {
> +		struct qcom_ec_cooling_dev *ec_cdev =3D &ec->ec_cdev[i];
> +		char name[EC_FAN_NAME_SIZE];
> +
> +		scnprintf(name, sizeof(name), "qcom_ec_fan_%u", i);
> +		ec_cdev->fan_id =3D i + 1;
> +		ec_cdev->parent_dev =3D dev;
> +
> +		ec_cdev->cdev =3D devm_thermal_of_cooling_device_register(dev, NULL, n=
ame, ec_cdev,
> +									&qcom_ec_thermal_ops);
> +		if (IS_ERR(ec_cdev->cdev)) {
> +			return dev_err_probe(dev, PTR_ERR(ec_cdev->cdev),
> +					     "Failed to register fan%d cooling device\n", i);
> +		}
> +	}
> +
> +	return 0;
> +}

If CONFIG_THERMAL is disabled, devm_thermal_of_cooling_device_register()
evaluates to a stub that returns ERR_PTR(-ENODEV).

Does this cause qcom_ec_probe() to always fail when THERMAL=3Dn?

Should the driver handle -ENODEV gracefully to allow non-thermal functional=
ity
to work as intended by the Kconfig allowance?

> +static int qcom_ec_read(struct qcom_ec *ec, u8 cmd, u8 resp_len, u8 *res=
p)
> +{
> +	int ret;
> +
> +	ret =3D i2c_smbus_read_i2c_block_data(ec->client, cmd, resp_len, resp);
> +	if (ret < 0)
> +		return ret;
> +	else if (ret =3D=3D 0 || ret =3D=3D 0xff)
> +		return -EOPNOTSUPP;
> +
> +	if (resp[0] >=3D resp_len)
> +		return -EINVAL;
> +
> +	return 0;
> +}

[ ... ]

> +static int qcom_ec_read_fw_version(struct device *dev)
> +{
> +	struct i2c_client *client =3D to_i2c_client(dev);
> +	struct qcom_ec *ec =3D i2c_get_clientdata(client);
> +	struct qcom_ec_version *version =3D &ec->version;
> +	u8 resp[EC_FW_VERSION_RESP_LEN];
> +	int ret;
> +
> +	ret =3D qcom_ec_read(ec, EC_FW_VERSION_CMD, EC_FW_VERSION_RESP_LEN, res=
p);
> +	if (ret < 0)
> +		return ret;
> +
> +	version->main_version =3D resp[3];
> +	version->sub_version =3D resp[2];
> +	version->test_version =3D resp[1];

When i2c_smbus_read_i2c_block_data() succeeds, it returns the actual number
of bytes read. If a short read occurs, the remainder of the resp buffer
is untouched.

Since callers like qcom_ec_read_fw_version() allocate resp on the stack
without initialization, could this result in using uninitialized stack memo=
ry
if ret does not equal the expected length?

> +static irqreturn_t qcom_ec_irq(int irq, void *data)
> +{
> +	struct qcom_ec *ec =3D data;
> +	struct device *dev =3D &ec->client->dev;
> +	int val;
> +
> +	val =3D i2c_smbus_read_byte_data(ec->client, EC_SCI_EVT_READ_CMD);
> +	if (val < 0) {
> +		dev_err_ratelimited(dev, "Failed to read EC SCI Event: %d\n", val);
> +		return IRQ_HANDLED;
> +	}

If the I2C read fails here, the event is not actually cleared on the EC.

If this is a level-triggered interrupt line, will returning IRQ_HANDLED
trick the kernel's spurious interrupt detector into thinking the interrupt
was serviced, resulting in an endless loop and an interrupt storm?

Would returning IRQ_NONE be more appropriate?

> +	switch (val) {
> +	case EC_FAN1_STATUS_CHANGE_EVT:
> +		dev_dbg_ratelimited(dev, "Fan1 status changed\n");
> +		break;

[ ... ]

> +	case EC_RECOVERED_FROM_RESET_EVT:
> +		dev_dbg_ratelimited(dev, "EC recovered from reset\n");
> +		break;

When the EC resets, it typically loses volatile state like the SCI event
mask and active fan debug overrides.

Does the driver need to re-initialize the EC hardware state here to prevent
it from silently stopping events or dropping thermal overrides?

> +static int qcom_ec_probe(struct i2c_client *client)
> +{
> +	struct device *dev =3D &client->dev;
> +	struct qcom_ec *ec;
> +	unsigned int i;
> +	int ret;
> +
> +	ec =3D devm_kzalloc(dev, sizeof(*ec), GFP_KERNEL);
> +	if (!ec)
> +		return -ENOMEM;
> +
> +	ec->client =3D client;
> +
> +	ret =3D devm_request_threaded_irq(dev, client->irq, NULL, qcom_ec_irq,
> +					IRQF_ONESHOT, "qcom_ec", ec);
> +	if (ret < 0)
> +		return ret;
> +
> +	i2c_set_clientdata(client, ec);
> +
> +	ret =3D qcom_ec_read_fw_version(dev);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to read EC firmware version\n");
> +
> +	ret =3D qcom_ec_sci_evt_control(dev, true);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to enable SCI events\n");
> +
> +	ret =3D qcom_ec_thermal_capabilities(dev);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to read thermal capabilities\n"=
);

If probe fails at qcom_ec_thermal_capabilities() or during the subsequent
cooling device registration, devres will automatically free the IRQ handler.

However, qcom_ec_sci_evt_control(dev, true) has already configured the
hardware to assert interrupts.

Could this cause an unhandled IRQ storm after the handler is removed?
Should the SCI events be disabled on probe failure, perhaps using
devm_add_action_or_reset()?

> +static void qcom_ec_remove(struct i2c_client *client)
> +{
> +	struct qcom_ec *ec =3D i2c_get_clientdata(client);
> +	struct device *dev =3D &client->dev;
> +	int ret;
> +
> +	ret =3D qcom_ec_sci_evt_control(dev, false);
> +	if (ret < 0)
> +		dev_err(dev, "Failed to disable SCI events: %d\n", ret);
> +
> +	for (int i =3D 0; i < ec->thermal_cap.fan_cnt; i++) {
> +		struct qcom_ec_cooling_dev *ec_cdev =3D &ec->ec_cdev[i];
> +
> +		qcom_ec_fan_debug_mode_off(ec_cdev);
> +	}
> +}

Because the cooling devices are registered with
devm_thermal_of_cooling_device_register(), they are still active when
qcom_ec_remove() runs and are only cleaned up afterward.

Is there a race condition here where the thermal core or userspace could
call qcom_ec_fan_set_cur_state() concurrently with or immediately after
qcom_ec_fan_debug_mode_off()? This would turn the fan debug mode back on
and defeat the cleanup.

Should the fan debug mode cleanup be managed via devm_add_action_or_reset()
registered before the cooling devices, so it executes in the correct order?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511-add-driver=
-for-ec-v9-0-e5437c39b7f8@oss.qualcomm.com?part=3D2
