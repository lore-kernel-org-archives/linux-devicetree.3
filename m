Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE3441684F
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 17:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784740521; cv=none; b=Rn1ZCEqjhco1YiXbP3WeVUEloigCl2W5UQGWpnG0QcTDZHNo47rmt+cofIWDXnvVOtW2eR1nVxRt6QdaoN4X/iZUvmSI6laHz15Q1NIPCPV2pg8N+Ffyjz6kJNkg9Zs5wjWjzHF9xqL32G2TRM5wEb1HxbRKqHC5dI9XwJGa5Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784740521; c=relaxed/simple;
	bh=ubtdtnPIOQ9G5+zWUrOwjKpEPGbEZ+22DH04DrWdjbM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kApb50lJJIomGPZYc58FNcI6DbLLNd533Sjfvu8xXIlQVnShO2rpU0hJmHeE8NfH80XfTW6rdy8OiqyOB+zNl3NuK8spQxuKWmNmNadt9eoTVLIqii/krW/HL1dWEnLaQQONtG5Tq8T3EdbnWA/BsNIJrmJZ88DgoY/8pbxbOE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xdq1bRcv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xdq1bRcv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC3601F000E9;
	Wed, 22 Jul 2026 17:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784740519;
	bh=6rLrQUTJ/V/00zLL1Z3imoKkU/9C4x8FrQ3ENwMIl00=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Xdq1bRcvenrGT9FTxrUeaxnRdjXlFZ666kGtDJVYgu1uA79BCMZwZf0yshvZ0Q3vR
	 Oqngf9zYgZKSnUnV5etgePfQDP3zSjFpOtYA5FVeFrZmHDZ/l2xLkU3oqHQU+ZQ+6C
	 3vaiqxs1xgX8amLYmZxBnsErSwtfJxmuf9cevzWnTCtUwQfDU4uhh5CcwaO5njaRsp
	 55yKtZ45nhwJr/b9u+Y9dCi2B43aG0p9F4x0Wh7V175RlhJr3gUG3+kfrYwGk5Fk+Y
	 Qa433Tm6ftXzkGpfnFQjQMTEt511tOddENulmTOcjGBEj24FLmRZ307p/AdBADPr/K
	 2EV1T9f7kTskw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V9 2/4] power: supply: sgm41542: Add SG Micro sgm41542
 charger
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260722165806.161020-3-macroalpha82@gmail.com>
References: <20260722165806.161020-1-macroalpha82@gmail.com>
 <20260722165806.161020-3-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 17:15:19 +0000
Message-Id: <20260722171519.AC3601F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] The hardware watchdog timer remains permanently disabled after the=
 first suspend/resume cycle.
- [High] Concurrent sysfs reads mutate internal state without locking, sile=
ntly swallowing IRQ edges.
- [High] The power supply is registered and exposed to userspace before dri=
ver data and hardware defaults are initialized.
- [Medium] Ignored return values from regmap_update_bits during hardware in=
itialization.
- [Low] Pointer type mismatch when calling regmap_read.
--

--- Patch [2]: [PATCH V9 2/4] power: supply: sgm41542: Add SG Micro sgm4154=
2 charger ---
commit be99c7bac70834eb8af0ef1499024eb89ea7f026
Author: Chris Morgan <macromorgan@hotmail.com>
power: supply: sgm41542: Add SG Micro sgm41542 charger

This commit adds support for the SG Micro SGM41542 charger/boost converter.
The driver adapts a vendor BSP implementation to register a power supply,
initialize I2C regmap, and manage charge parameters.

Link: https://github.com/rockchip-linux/kernel/blob/develop-6.6/drivers/pow=
er/supply/sgm41542_charger.c
Link: https://www.sg-micro.de/rect/assets/1e8de70b-657e-4156-be68-a64fdbe8e=
418/SGM41541_SGM41542.pdf

> diff --git a/drivers/power/supply/sgm41542_charger.c b/drivers/power/supp=
ly/sgm41542_charger.c
> new file mode 100644
> index 0000000000000..dbce7ed2f8796
> --- /dev/null
> +++ b/drivers/power/supply/sgm41542_charger.c
> @@ -0,0 +1,1118 @@
[ ... ]
> +static int sgm4154x_get_state(struct sgm4154x_device *sgm,
> +			      struct sgm4154x_state *state)
> +{
> +	int reg, ret;
> +
> +	ret =3D regmap_read(sgm->regmap, SGM4154X_CHRG_STAT, &reg);

[Severity: Low]
Does passing an int pointer to regmap_read() cause a compiler warning here
since the API expects an unsigned int pointer?

[ ... ]
> +static int sgm4154x_charger_get_property(struct power_supply *psy,
> +					 enum power_supply_property psp,
> +					 union power_supply_propval *val)
> +{
> +	struct sgm4154x_device *sgm =3D power_supply_get_drvdata(psy);
> +	struct sgm4154x_state state;
> +	int ret;
> +
> +	ret =3D sgm4154x_get_state(sgm, &state);
> +	if (ret) {
> +		dev_err(sgm->dev, "get state error!\n");
> +		return ret;
> +	}
> +	sgm->state =3D state;

[Severity: High]
Could this un-locked assignment overwrite the cached state and break
interrupt edge detection?

If a sysfs read races with a VBUS insertion interrupt, this might update
sgm->state.vbus_gd to true before the IRQ thread runs. Then in
sgm4154x_irq_handler_thread():

    if (state.vbus_gd && !oldstate.vbus_gd) {

Since oldstate caches the overwritten sgm->state, it would evaluate to
false and silently drop the plug-in event, failing to apply the input
current limit. Should this assignment be protected by sgm->lock, or removed
if the getter only needs local state?

[ ... ]
> +static int sgm4154x_hw_init(struct sgm4154x_device *sgm)
> +{
[ ... ]
> +	regmap_update_bits(sgm->regmap,
> +			   SGM4154X_CHRG_CTRL_D,
> +			   SGM4154X_JEITA_EN,
> +			   0);
> +
> +	regmap_update_bits(sgm->regmap,
> +			   SGM4154X_CHRG_CTRL_A,
> +			   SGM4154X_IINDPM_INT_MASK,
> +			   SGM4154X_IINDPM_INT_MASK);
> +
> +	regmap_update_bits(sgm->regmap,
> +			   SGM4154X_CHRG_CTRL_A,
> +			   SGM4154X_VINDPM_INT_MASK,
> +			   SGM4154X_VINDPM_INT_MASK);

[Severity: Medium]
Is it intentional to ignore the return values from these hardware
configuration writes, unlike the surrounding calls in this function?

If the I2C bus encounters a communication error, this could silently fail
to configure the JEITA and DPM interrupt masks.

[ ... ]
> +static void sgm_charger_work(struct work_struct *work)
> +{
> +	struct sgm4154x_device *sgm =3D
> +		container_of(work,
> +			     struct sgm4154x_device,
> +			     sgm_delay_work.work);
> +
> +	sgm4154x_watchdog_timer_reset(sgm);
> +	if (sgm->watchdog_enable)
> +		queue_delayed_work(sgm->sgm_monitor_wq,
> +				   &sgm->sgm_delay_work,
> +				   msecs_to_jiffies(1000 * 5));
> +}

[Severity: High]
Can the hardware watchdog timer remain permanently disabled after a
suspend and resume cycle?

During suspend, sgm4154x_suspend() calls sgm4154x_set_watchdog_timer()
with SGM4154X_WDT_TIMER_DISABLE. Upon resume, sgm4154x_resume() restarts
this workqueue.

The worker function above pets the watchdog by setting WDT_RST, but does
it ever re-program the CHRG_CTRL_5 configuration register to re-enable the
timer duration? It seems the safety mechanism might remain turned off.

[ ... ]
> +static int sgm4154x_probe(struct i2c_client *client)
> +{
[ ... ]
> +	ret =3D devm_delayed_work_autocancel(dev, &sgm->sgm_delay_work,
> +					   sgm_charger_work);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Unable to register delayed work\n");
> +
> +	ret =3D sgm4154x_power_supply_init(sgm, dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to register power supply\n");
> +
> +	ret =3D sgm4154x_hw_init(sgm);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Cannot initialize the chip.\n");

[Severity: High]
Does registering the power supply before hw_init expose uninitialized
limits to userspace?

If userspace triggers a sysfs write to change the charge voltage
immediately after registration but before sgm4154x_hw_init() populates
the default limits, sgm4154x_set_chrg_volt() might clamp the request
against a zero-value sgm->init_data.max_vreg, potentially misconfiguring
the hardware to its absolute minimum voltage. Should the hardware limits
be initialized before registering the power supply?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722165806.1610=
20-1-macroalpha82@gmail.com?part=3D2
