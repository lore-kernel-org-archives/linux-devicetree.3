Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F73039E6F1
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 20:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785272033; cv=none; b=DXKfomqsrTFPyLNKKyvJVqhsJXUrO9HHQ7z1dIEniHQMLkBnTMEEHJl4ETJ+o95piK3ovLy/yDP/ShPqKjna+qpbtWAnf+iukg9hUSW8r245WIuEDBvWnpeEHzXN0bSH0kDU7cwe8B0/bDfKPan8Hr+3xDdsYGuyBfXr3bGz49Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785272033; c=relaxed/simple;
	bh=eMyyQHSbADU+1p0xTZGQ/LW/1TQ6/xiJoVrI9KxNQzI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WsD+n9XyIrchSmEKnw2B78rPO8+8UB1b+z8dTLYnbTfgCbVuILeaasbdQGhiNGTpwjMVLuPlBMsUlSP1e7PJb6s5sHxAls3DKaVDnDwvmLvG+99MT9ny6O6yferFRHsy6wgHiT94Z8zgUVlQAHMywlCBLIR8vvffpkGxZdNLVx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KgkziKTN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KgkziKTN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F4C51F000E9;
	Tue, 28 Jul 2026 20:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785272031;
	bh=pBgLmCSg70YHBmfrd3LXWD/FyjK9YRIdKTaigRtuhBc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KgkziKTNNVWFwtSuk0rG7Uh4WEDZW8gV2EHj8CTsviXckCahuTMBSKRHVPe7gc6Qq
	 Z9bxJLPbhfvrguABYqqzrEBWBLZ1mF1/pOaafFta80Y1a3mclRp2sp9u0y2yTbuBRl
	 +N+UCVetAZKau3LCkWyoldL9jfBYlmLi1xyboBV5p7ygbXz6+GFPWLkEpbJA1zQ/wE
	 yg2CVDQKwE2ageuD0Ef5CbQoMK/4jWZy5WPg1clF0rw9EveasVeoCWtMauNkKOu+Hg
	 Tk1ttEeb/E/S6IbSXj6GsxpSDQkh5QDXZWMx1zcTML6p36K/82cjAS+RwlnqF/LBo7
	 ixGO65h/vTjUw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V10 2/4] power: supply: sgm41542: Add SG Micro sgm41542
 charger
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260728203832.166402-3-macroalpha82@gmail.com>
References: <20260728203832.166402-1-macroalpha82@gmail.com>
 <20260728203832.166402-3-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 20:53:51 +0000
Message-Id: <20260728205351.6F4C51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] `sgm4154x_charger_get_property()` silently overwrites `sgm->state`=
, destroying the edge detection history required by the IRQ handler.
- [Low] Build failure and missing hardware initialization due to non-existe=
nt `.init` field in `struct power_supply_desc`
- [Low] `sgm4154x_resume()` unconditionally queues the watchdog worker even=
 when the watchdog is disabled.
--

--- Patch [2]: [PATCH V10 2/4] power: supply: sgm41542: Add SG Micro sgm415=
42 charger ---
commit 55bbb1d289f7a6f8202dd62e6767e32f2ffb138b
Author: Chris Morgan <macromorgan@hotmail.com>

power: supply: sgm41542: Add SG Micro sgm41542 charger

Adds support for the SG Micro SGM41542 charger/boost converter.
Driver was adapted from Rockchip BSP driver and confirmed with
vendor datasheet.

[1] https://github.com/rockchip-linux/kernel/blob/develop-6.6/drivers/power=
/supply/sgm41542_charger.c
[2] https://www.sg-micro.de/rect/assets/1e8de70b-657e-4156-be68-a64fdbe8e41=
8/SGM41541_SGM41542.pdf

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
> +	scoped_guard(mutex, &sgm->lock) {
> +		ret =3D sgm4154x_get_state(sgm, &state);
> +		if (ret) {
> +			dev_err(sgm->dev, "get state error!\n");
> +			return ret;
> +		}
> +		sgm->state =3D state;

[Severity: High]
Does this sysfs property read overwrite the state history needed by the IRQ
handler?

If userspace reads a property (like status) after a hardware state change
but before the IRQ handler thread runs and acquires sgm->lock, this will
overwrite the global sgm->state.

[ ... ]

> +static irqreturn_t sgm4154x_irq_handler_thread(int irq, void *private)
> +{
> +	struct sgm4154x_device *sgm =3D private;
> +	struct sgm4154x_state oldstate, state;
> +	int ret;
> +
> +	guard(mutex)(&sgm->lock);
> +
> +	oldstate =3D sgm->state;
> +
> +	ret =3D sgm4154x_get_state(sgm, &state);
> +	if (ret) {
> +		dev_err(sgm->dev, "get state error!\n");
> +		return IRQ_NONE;
> +	}
> +
> +	sgm->state =3D state;
> +
> +	if (state.vbus_gd && !oldstate.vbus_gd) {

Because oldstate was prematurely updated by the sysfs read above, this edge
detection will evaluate to false. Will this bypass the input limit restorat=
ion
logic entirely?

[ ... ]

> +static struct power_supply_desc sgm4154x_power_supply_desc =3D {
> +	.name =3D "sgm4154x-charger",
> +	.type =3D POWER_SUPPLY_TYPE_USB,
> +	.init =3D sgm4154x_hw_init,

[Severity: Low]
Will this cause a build failure?=20

The struct power_supply_desc in the mainline kernel does not have an .init
field.=20

If this assignment is removed to fix the build, the hardware initialization
function sgm4154x_hw_init() will be completely orphaned, leaving the watchd=
og,
limits, and defaults unconfigured. Should this initialization be called
manually from the probe function instead?

[ ... ]

> +static int __maybe_unused sgm4154x_resume(struct device *dev)
> +{
> +	struct i2c_client *client =3D to_i2c_client(dev);
> +	struct sgm4154x_device *sgm =3D i2c_get_clientdata(client);
> +	int ret;
> +
> +	if (sgm->watchdog_enable) {
> +		ret =3D sgm4154x_set_watchdog_timer(sgm, SGM4154X_WDT_TIMER_40S);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	queue_delayed_work(sgm->sgm_monitor_wq,
> +			   &sgm->sgm_delay_work, 0);

[Severity: Low]
Does this unconditionally queue the watchdog worker even when the watchdog
is disabled?

If the watchdog was disabled prior to suspend, queue_delayed_work() will
still execute immediately upon resume. This causes an unnecessary I2C
transaction to reset a disabled watchdog timer before the worker terminates
itself. Should this queue call be moved inside the if block?

> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728203832.1664=
02-1-macroalpha82@gmail.com?part=3D2
