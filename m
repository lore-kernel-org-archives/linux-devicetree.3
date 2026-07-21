Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85DC40244D
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 17:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784654448; cv=none; b=TbS9E0OepobeLNTkRGXvm0GmQdBbFM4F19tFYvCQ3WDL0Le2G9ANXe14mszRIv81iGcMq3eD8vlpaNQl8r+Rrmt7welUPQoSKUevY5MevyCAX0cTFF4l9IG4nZyV7TaKlP45ap2/OQOgzMYG7fu88kiQDIsEUO55+/za12eksOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784654448; c=relaxed/simple;
	bh=YrSszC7tlvvgvm9mjq6GDIMiQozCdI4j2t2LrHov+E4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZjO1oi+GB6Q2jv3Xj0uQRX8iowZARpCRB6isQL5MemtskNWXhrLcy6brqWiCiNhnP3D95cNh4Jw3zHUAlDcp088tl48lUtPJlsolDrKRl5C5lyFp07QoMH1zWJ86s4LQ8BlIAZp/rufn6VXOJDaPHoTEa3QeHIllAM/8RwEGC84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bZrbk4Hr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bZrbk4Hr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 888271F000E9;
	Tue, 21 Jul 2026 17:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784654446;
	bh=3tS9AZRkYTKslCpYPdmyqkQgmXEUhaZtsYXkFnYwn5E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bZrbk4HrmFxWJboRT2Luk5JwSW/pU1BTHj/rtVVnImM/GsLoGOBS4APSFVP6t/5eO
	 vLfehrNjyaP6QwOf6rTmPrFk8Oqyt1yH4uVOedeDtMFQ0pOMsd+gqnic0MWEc9uPq7
	 F+x7ghVdpCIeNTDqiGD+EJnfxYJaQA610I1gb1J8I/7+Ag7jAAvfawPHmSmG4mzi2R
	 JKwXHNiAiPrjS1N0Ju6OGAE1X/ew40StkFU27fYWZguLDIEtGJXY/rbvyszICIY52U
	 vJo73WUPBi8l/J5mi6ivRGmdetBMWizxG1ImuBEHqRa2lSH7S2rW4pr9CpMcuVkNSs
	 pisC1SkBTdqyQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V8 2/4] power: supply: sgm41542: Add SG Micro sgm41542
 charger
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260721170907.131731-3-macroalpha82@gmail.com>
References: <20260721170907.131731-1-macroalpha82@gmail.com>
 <20260721170907.131731-3-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 17:20:46 +0000
Message-Id: <20260721172046.888271F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Lockless update of cached device state in `get_property` causes lo=
st IRQ edge detection and data tearing.
- [High] The hardware charger watchdog is permanently disabled after the fi=
rst system suspend/resume cycle.
- [Medium] The power supply is registered and exposed to userspace before i=
ts initialization data is populated, causing a race condition on sysfs prop=
erty accesses.
- [Low] Missing dependency on REGULATOR in Kconfig causes build failures.
--

--- Patch [2]: [PATCH V8 2/4] power: supply: sgm41542: Add SG Micro sgm4154=
2 charger ---
commit 3abcd77069baeaee08cbb10755bbd687ee39d41c
Author: Chris Morgan <macromorgan@hotmail.com>
Date:   Tue Jul 21 17:09:05 2026 +0000

    power: supply: sgm41542: Add SG Micro sgm41542 charger
   =20
    Add support for the SG Micro SGM41542 charger/boost converter.
    Driver was adapted from Rockchip BSP driver and confirmed
    with vendor datasheet.
   =20
    [1] https://github.com/rockchip-linux/kernel/blob/develop-6.6/drivers/p=
ower/supply/sgm41542_charger.c
    [2] https://www.sg-micro.de/rect/assets/1e8de70b-657e-4156-be68-a64fdbe=
8e418/SGM41541_SGM41542.pdf

> diff --git a/drivers/power/supply/Kconfig b/drivers/power/supply/Kconfig
> --- a/drivers/power/supply/Kconfig
> +++ b/drivers/power/supply/Kconfig
> @@ -866,6 +866,14 @@ config CHARGER_S2M
>  	  devices provide USB power supply information and also required
>  	  for USB OTG role switching.
> =20
> +config CHARGER_SGM41542
> +	tristate "SGM41542 charger driver"
> +	depends on I2C
> +	depends on GPIOLIB || COMPILE_TEST
> +	select REGMAP_I2C

[Severity: Low]
Since this driver provides a regulator via devm_regulator_register(), should
this also depend on REGULATOR to prevent build failures when the regulator
subsystem is disabled?

[ ... ]

> diff --git a/drivers/power/supply/sgm41542_charger.c b/drivers/power/supp=
ly/sgm41542_charger.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/power/supply/sgm41542_charger.c

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
Could this lockless update of sgm->state interfere with the edge detection =
in
the IRQ handler?

If a sysfs read calls this function concurrently with an interrupt, it upda=
tes
sgm->state before the IRQ handler can read the old state:

sysfs read thread:
    sgm4154x_get_state(sgm, &state);
    sgm->state =3D state; // updated to the new state

IRQ thread (sgm4154x_irq_handler_thread):
    struct sgm4154x_state oldstate =3D sgm4154x->state; // reads newly upda=
ted state
    ...
    if (state.vbus_gd && !oldstate.vbus_gd) { // fails because oldstate alr=
eady has vbus_gd

This could cause the driver to miss edge transitions, like failing to apply
the input current limit on cable insertion. Additionally, since the state
struct is multi-byte, can this assignment cause data tearing if readers are
accessing it concurrently?

[ ... ]

> +static int sgm4154x_probe(struct i2c_client *client)
> +{
> +	struct device *dev =3D &client->dev;
> +	struct sgm4154x_device *sgm;
> +	int ret;

[ ... ]

> +	sgm->sgm_monitor_wq =3D devm_alloc_ordered_workqueue(dev, "sgm-monitor-=
wq",
> +			WQ_MEM_RECLAIM | WQ_FREEZABLE);
> +	if (!sgm->sgm_monitor_wq)
> +		return -EINVAL;
> +
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

[Severity: Medium]
Is there a race condition here if userspace accesses sysfs properties
immediately after power supply registration?

devm_power_supply_register() (called via sgm4154x_power_supply_init) exposes
the device before sgm4154x_hw_init() populates the safety limits in
sgm->init_data.

If a udev rule or userspace polling attempts to configure charge limits
during this window, could it bypass the intended hardware bounds because the
limit variables are still zeroed?

[ ... ]

> +static int __maybe_unused sgm4154x_suspend(struct device *dev)
> +{
> +	struct i2c_client *client =3D to_i2c_client(dev);
> +	struct sgm4154x_device *sgm =3D i2c_get_clientdata(client);
> +
> +	/*
> +	 * Disable watchdog during suspend and stop delayed work. When
> +	 * delayed work is restarted after resume watchdog will be
> +	 * re-enabled if it was previously enabled.
> +	 */
> +	sgm4154x_set_watchdog_timer(sgm, SGM4154X_WDT_TIMER_DISABLE);
> +	cancel_delayed_work_sync(&sgm->sgm_delay_work);
> +	return 0;
> +}
> +
> +static int __maybe_unused sgm4154x_resume(struct device *dev)
> +{
> +	struct i2c_client *client =3D to_i2c_client(dev);
> +	struct sgm4154x_device *sgm =3D i2c_get_clientdata(client);
> +
> +	queue_delayed_work(sgm->sgm_monitor_wq,
> +			   &sgm->sgm_delay_work, 0);
> +	return 0;
> +}

[Severity: High]
Will the charger watchdog be permanently disabled after the first suspend
and resume cycle?

When sgm4154x_suspend() calls sgm4154x_set_watchdog_timer() with=20
SGM4154X_WDT_TIMER_DISABLE, it destructively clears sgm->watchdog_enable
to false.

On resume, queue_delayed_work() schedules the monitor work, but
sgm_charger_work() checks this flag:

static void sgm_charger_work(struct work_struct *work)
{
    ...
    if (sgm->watchdog_enable)
        queue_delayed_work(...)
}

Because the flag was wiped during suspend, the timer is never requeued or=20
re-enabled, potentially leaving the hardware unprotected against overchargi=
ng
if the system were to crash later.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721170907.1317=
31-1-macroalpha82@gmail.com?part=3D2
