Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D969C3921D8
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 18:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785261739; cv=none; b=X+/VSt8C9Yn9cuz/eEO/g/6lJwZ9Otvbb2QDVzOONQpgi21R40cW7wNV5N+SHg+m1E4U/RIIcIHf1TcsljYDqZN8iC7gJjBX8efi+EIlb8w9lVP/aTCzKmW4NKEHpPk7OIf40ib+3LRaLmTyqs0h2zlPvqTAaowAuJSV2gF16e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785261739; c=relaxed/simple;
	bh=FxNk59cAtvVejjhkuE/0wVtyQP1mS1DppMqY/5aST0c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=twhsRyYpt96z5BY82/ejutx8wR0Uau6yV7dVElV6Wo+iTrLttsdtn858Gujr+V9QFEQIB+spu6deVCvcbc8POoPfLhTMDqBL/+XaHB+lR7CB+ILY4XcRr6QxnCVsgPpEJvudnxGc1zBSHW3QPiIiOe2A2i8fEoTS0+CtaX0FgG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jLrsWN2f; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jLrsWN2f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26B4B1F000E9;
	Tue, 28 Jul 2026 18:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785261737;
	bh=bdHxlK7+QZRMYbvi4htEElffNNIWiYUDaYHq6vcCshk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jLrsWN2fA+jVAKQiwI6s94H+KYpy7suQblEkS7yAmlILiMgiYszw2dvBFREtIkhZz
	 qkTeGpY68LpWCFR8q29eBTJy3oMGP9prFbhO1VBh1xI3BeU1cOxg9K/vwZ98So94KM
	 wJhgJrBxQ92oO1XS9A7HSuQ2LlmMpNCVMOa2/GW9LP0cIfsxSJclwkWEO1P916Y9U+
	 3LFASBMnYs33OIoH1BCDMp8L2EtD/HLNjN7LUsWaDry4X+7w5MHaD2ATAzBjswsw46
	 AMgUf3ETSzhUwq1Z+iXfTV3W3sv30AqDttIOFKAqc00H7ecPWeH1nYTLnP5h59r3Gz
	 o1/yEdzTxNwRA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/8] platform: arm64: qcom-hamoa-ec: Add SoC junction
 temperature reporting
Reply-To: sashiko-reviews@lists.linux.dev
To: "Anvesh Jain P" <anvesh.p@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260728-ec_add_more_commands-v1-2-771abd65ee1a@oss.qualcomm.com>
References: <20260728-ec_add_more_commands-v1-0-771abd65ee1a@oss.qualcomm.com>
 <20260728-ec_add_more_commands-v1-2-771abd65ee1a@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 18:02:16 +0000
Message-Id: <20260728180217.26B4B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Race condition in probe leading to NULL pointer dereference in IRQ=
 handler
- [High] Incorrect error code on device_link_add failure causes permanent p=
robe failure
- [Medium] Missing `io_lock` acquisition in fan control functions breaks EC=
 command serialization
- [Medium] Thermal polling delayed work unconditionally requeues itself eve=
n if no thermal zones were found
- [Medium] Suspend error path permanently disables thermal polling
- [Medium] Integer overflow when accumulating args.args[0] into total leads=
 to heap buffer overflow
--

--- Patch [2]: [PATCH 2/8] platform: arm64: qcom-hamoa-ec: Add SoC junction=
 temperature reporting ---
commit d5d00275c6c452ac414dd45c11ca38e64c17b24a
Author: Anvesh Jain P <anvesh.p@oss.qualcomm.com>

platform: arm64: qcom-hamoa-ec: Add SoC junction temperature reporting
   =20
Add the EC command definitions and handler function for reporting the
SoC junction temperature (Tj) to the EC.

[ ... ]

> diff --git a/drivers/platform/arm64/qcom-hamoa-ec.c b/drivers/platform/ar=
m64/qcom-hamoa-ec.c
> index 5ca7308c60774..4c745b78322c4 100644
> --- a/drivers/platform/arm64/qcom-hamoa-ec.c
> +++ b/drivers/platform/arm64/qcom-hamoa-ec.c

[ ... ]

> @@ -77,10 +89,14 @@ struct qcom_ec_cooling_dev {
>  };
> =20
>  struct qcom_ec {
> +	struct i2c_client *client;
>  	struct qcom_ec_cooling_dev *ec_cdev;
> +	struct thermal_zone_device **soc_tj_zones;
> +	struct delayed_work soc_tj_work;
> +	struct mutex io_lock; /* serializes EC command sequences */

[Severity: Medium]
Does this mutex also need to be acquired in existing fan control functions
like qcom_ec_set_fan_profile()?

Because the thermal framework can invoke fan control at any time, these
commands might interleave with the new background thermal polling delayed
work, which could violate the intended EC firmware serialization.

>  	struct qcom_ec_thermal_cap thermal_cap;
>  	struct qcom_ec_version version;
> -	struct i2c_client *client;
> +	int num_soc_tj_zones;
>  };

[ ... ]

> +static int qcom_ec_setup_soc_tj_zones(struct qcom_ec *ec)
> +{
> +	struct device *dev =3D &ec->client->dev;
> +	struct device_node *np =3D dev->of_node;
> +	int nproviders, total, i;
> +
> +	nproviders =3D of_property_count_elems_of_size(np, "qcom,tsens",
> +						     2 * sizeof(u32));
> +	if (nproviders <=3D 0)
> +		return 0;
> +
> +	total =3D 0;
> +	for (i =3D 0; i < nproviders; i++) {
> +		struct of_phandle_args args;
> +
> +		if (of_parse_phandle_with_fixed_args(np, "qcom,tsens", 1, i, &args))
> +			return -EINVAL;
> +
> +		of_node_put(args.np);
> +		total +=3D args.args[0];

[Severity: Medium]
Is it possible for the total accumulation to overflow if the device tree
provides large values for the qcom,tsens property?

If the sum surpasses the maximum integer value, devm_kcalloc() would alloca=
te
an undersized array, and the subsequent loop could cause a heap buffer
overflow when writing to ec->soc_tj_zones.

> +	}
> +
> +	ec->soc_tj_zones =3D devm_kcalloc(dev, total, sizeof(*ec->soc_tj_zones),
> +					GFP_KERNEL);
> +	if (!ec->soc_tj_zones)
> +		return -ENOMEM;
> +
> +	for (i =3D 0; i < nproviders; i++) {
> +		struct of_phandle_args args;
> +		struct platform_device *sensor_pdev;
> +		u32 id;
> +
> +		if (of_parse_phandle_with_fixed_args(np, "qcom,tsens", 1, i, &args))
> +			return -EINVAL;
> +
> +		sensor_pdev =3D of_find_device_by_node(args.np);
> +		if (!sensor_pdev) {
> +			of_node_put(args.np);
> +			return -EPROBE_DEFER;
> +		}
> +
> +		/* Ensure we unbind before the sensor frees its zones */
> +		if (!device_link_add(dev, &sensor_pdev->dev, DL_FLAG_AUTOREMOVE_CONSUM=
ER)) {
> +			dev_err(dev, "Failed to link to sensor %pOF\n", args.np);
> +			put_device(&sensor_pdev->dev);
> +			of_node_put(args.np);
> +			return -ENODEV;

[Severity: High]
Should this return -EPROBE_DEFER instead of -ENODEV?

If the EC driver is probing and the sensor is not yet bound to a driver,
device_link_add() refuses to create a managed link and returns NULL.
Returning -ENODEV causes the probe to fail permanently, whereas returning
-EPROBE_DEFER would allow it to try again once the sensor driver binds.

> +		}
> +		put_device(&sensor_pdev->dev);

[ ... ]

> +static void qcom_ec_soc_tj_work_fn(struct work_struct *work)
> +{
> +	struct qcom_ec *ec =3D container_of(work, struct qcom_ec, soc_tj_work.w=
ork);
> +
> +	qcom_ec_send_soc_tj_temp(ec);
> +
> +	queue_delayed_work(system_percpu_wq, &ec->soc_tj_work, EC_SOC_TJ_TEMP_P=
OLL_JIFFIES);

[Severity: Medium]
Should the work item only be requeued if thermal zones were actually found?

If ec->num_soc_tj_zones is 0, qcom_ec_send_soc_tj_temp() evaluates valid as=
 0
and does nothing, and then the work unconditionally requeues itself every
125ms, creating a permanent timer tick on systems without these sensors.

> +}
> +
>  static int qcom_ec_resume(struct device *dev)

[ ... ]

>  static int qcom_ec_suspend(struct device *dev)
>  {
>  	struct i2c_client *client =3D to_i2c_client(dev);
> +	struct qcom_ec *ec =3D i2c_get_clientdata(client);
> +	int ret;
> =20
> -	return i2c_smbus_write_byte_data(client, EC_MODERN_STANDBY_CMD,
> -					 EC_MODERN_STANDBY_ENTER);
> +	disable_delayed_work_sync(&ec->soc_tj_work);
> +
> +	mutex_lock(&ec->io_lock);
> +	ret =3D i2c_smbus_write_byte_data(client, EC_MODERN_STANDBY_CMD,
> +					EC_MODERN_STANDBY_ENTER);
> +	mutex_unlock(&ec->io_lock);
> +
> +	return ret;

[Severity: Medium]
If the I2C write for the modern standby command fails, does the error path
leave the thermal polling permanently disabled?

The PM core aborts the system suspend on error but does not call the resume
callback for the device that failed suspend, so enable_delayed_work() won't
be called. Should the error path re-enable the delayed work before returnin=
g?

>  }
> =20
>  static int qcom_ec_probe(struct i2c_client *client)

[ ... ]

> @@ -370,10 +587,24 @@ static int qcom_ec_probe(struct i2c_client *client)
>  	if (ret < 0)
>  		return dev_err_probe(dev, ret, "Failed to enable SCI events\n");
> =20
> +	ret =3D devm_add_action_or_reset(dev, qcom_ec_sci_evt_disable, dev);
> +	if (ret)
> +		return ret;
> +
>  	ret =3D qcom_ec_thermal_capabilities(dev);
>  	if (ret < 0)
>  		return dev_err_probe(dev, ret, "Failed to read thermal capabilities\n"=
);
> =20
> +	ret =3D qcom_ec_setup_soc_tj_zones(ec);

[Severity: High]
Can an SCI event trigger the IRQ handler before the probe finishes, causing
a NULL pointer dereference?

The IRQ is requested and SCI events are enabled on the EC prior to calling
qcom_ec_setup_soc_tj_zones(), which allocates ec->ec_cdev further down in
the probe function.

If an event fires in this widened window, or if the setup fails and returns
an error, qcom_ec_irq() can execute before devres disables the IRQ. The
handler checks if the fan_id is less than ec->thermal_cap.fan_cnt, which
would be true, and then dereferences the unallocated ec_cdev array.

> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to setup SoC Tj thermal zones\n=
");
> +
> +	ret =3D devm_delayed_work_autocancel(dev, &ec->soc_tj_work, qcom_ec_soc=
_tj_work_fn);
> +	if (ret)
> +		return ret;
> +
> +	queue_delayed_work(system_percpu_wq, &ec->soc_tj_work, EC_SOC_TJ_TEMP_P=
OLL_JIFFIES);

[Severity: Medium]
Could we avoid queueing the work initially if ec->num_soc_tj_zones is 0?

Similar to the requeue path, this starts a background polling process even
if no thermal zones were found during setup.

> +
>  	if (ec->thermal_cap.fan_cnt =3D=3D 0) {
>  		dev_warn(dev, FW_BUG "Failed to get fan count, firmware update require=
d\n");
>  		return 0;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728-ec_add_mor=
e_commands-v1-0-771abd65ee1a@oss.qualcomm.com?part=3D2
