Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3881A285061
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 05:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779340114; cv=none; b=PWQsmWG+pGNSlPcChRKiL5TrQYNfiqfQA9TUHiKuaJ82NgeRnk47fs+AhM34rzbtU+4RNqlH3PGvr5Km16ZxUBDGdapCf2K7UVdmGnheuXmi0MbXDXeqkvYOjX2XSrf/CXflXsDI86ACigrM/kDwHjc212RjxPb4zMLC4nlQSNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779340114; c=relaxed/simple;
	bh=U2Up2WX7zyNFefv84X7+rElpgCL9C3JJwrj49nPZCfk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Uv1PqRdBk4S69Go9MOf0T9ufVNyFUzjd/g9+xRQMNLXm3Qr/f5Qzqs2oLzVj2BSJY5w2Zw7pywZwXS7A7wb5ZNZCJOAZSWpRdC8aoocVf6DQ5R8J715QYYJU9GqDGCrSKzNBY6Kc7afchLJsRRLJ0Bb90W7TMy3XrQ2mLCeeTuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HL2NFEOq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HL2NFEOq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 576051F000E9;
	Thu, 21 May 2026 05:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779340112;
	bh=vRvZ7GcGgnp8B/ngUFs5sUdbgDkCtqhyRT1dhjUzm0U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HL2NFEOqQqUSwrCkcrpAPLDOA5PKd2Z7RpQhTF8KOLexE4FtHRqjrv54ilojhTRrx
	 AWgBAdpV8NpA+QKNPe5elTwbXI4fujUmD9nCsOlQZTueTOKwv3aA/3ScZQ87m56xKp
	 PHyVulUDkAonP27olEOk7lP/M49S21kgDi7vDrQYe1OVsTDYfWmQeTG0v4PhmaSRs/
	 gp028EuIkdE7zHOhpDCJZesGaTXQ7vR81zbNT7BolcKltb/kVzjeO9eTqX6EWpcbkF
	 JuU0bt7A2sgO47Pos5UNvrVEKXzlX6N1Wk1fKB2TBJb84fzx7tkhlNEdQxgVt8CMJD
	 y4Ex0o+sTad2g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 3/3] i2c: dwc: Add StarFive JHB100 I2C master/slave
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: lianfeng.ouyang <lianfeng.ouyang@starfivetech.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260521034340.27837-4-lianfeng.ouyang@starfivetech.com>
References: <20260521034340.27837-4-lianfeng.ouyang@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 21 May 2026 05:08:31 +0000
Message-Id: <20260521050832.576051F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 10 potential issue=
(s) to consider:
- [High] Global symbol namespace collisions and overriding of core driver f=
unctions break the generic DesignWare I2C driver.
- [High] Device tree references are leaked and a dangling pointer to the ma=
ster adapter creates a Use-After-Free risk.
- [High] Unsigned arithmetic underflow in the SCL High Count (HCNT) calcula=
tion corrupts hardware timing.
- [High] Hardware timing registers are programmed locklessly, out of sequen=
ce, and lost on resume.
- [High] Unconditional read of the SMBus interrupt register on potentially =
unsupported hardware.
- [Medium] Incorrect register read invalidates the hardware High Speed capa=
bility check.
- [Medium] Slave mode initialization clobbers the interrupt state machine.
- [Medium] Mismatch between bus frequency fallback flag and actual timing v=
alues.
- [Low] Missing inclusion of 'i2c-dwc-core.h' causes compilation to fail du=
e to undeclared identifiers.
- [Low] Missing EXPORT_SYMBOL for i2c_dw_slave_algo creates cross-module li=
nking failures.
--

commit 30ef7c6d2faa5af3ac90a02dd939e51c945c393c
Author: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>

i2c: dwc: Add StarFive JHB100 I2C master/slave support

Add support for the Synopsys DesignWare Core (DWC) I2C controller
found on the StarFive JHB100 platform. The controller supports both
master and slave modes and uses a different register layout compared
to the standard DesignWare I2C IP.

> diff --git a/drivers/i2c/busses/i2c-dwc-master.c b/drivers/i2c/busses/i2c=
-dwc-master.c
> new file mode 100644
> index 0000000000000..6e8d1828f99e6
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-dwc-master.c
> @@ -0,0 +1,441 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Synopsys DWC I2C adapter driver (master only).
> + *
> + * Based on the TI DAVINCI I2C adapter driver.
> + *
> + * Copyright (C) 2006 Texas Instruments.
> + * Copyright (C) 2007 MontaVista Software Inc.
> + * Copyright (C) 2009 Provigent Ltd.
> + */
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/errno.h>
> +#include <linux/export.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/i2c.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/pinctrl/consumer.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +#include <linux/reset.h>
> +#include <linux/units.h>
> +
> +#include "i2c-designware-core.h"

[Severity: Low]
Is there a missing include for "i2c-dwc-core.h" here? It looks like macros
like DWC_IC_CTRL are used in this file but not declared.

[ ... ]

> +/**
> + * i2c_dwc_scl_hcnt() -  Calculate SCL HCNT
> + * @ic_clk: Input clock in kHz
> + * @thigh: Duration in ns of logic 1 to generate
> + * @tr: SCL rise time in ns
> + * @spk_cnt: Spike count
> + */
> +static u32 i2c_dwc_scl_hcnt(u32 ic_clk, u32 thigh, u32 tr, u32 spk_cnt)
> +{
> +	u64 min_thigh_cnt, rise_cnt;
> +
> +	/* Formula: cnt =3D f_kHz * t_ns * 10^(-6) */
> +	min_thigh_cnt =3D DIV_ROUND_CLOSEST_ULL((u64)ic_clk * thigh, MICRO);
> +	rise_cnt =3D DIV_ROUND_CLOSEST_ULL((u64)ic_clk * tr, MICRO);
> +
> +	return max(5, min_thigh_cnt + rise_cnt - spk_cnt - 3);

[Severity: High]
Could the subtraction here cause an unsigned arithmetic underflow?

If the input clock frequency is low and the controller is in High Speed mod=
e,
spk_cnt + 3 could exceed min_thigh_cnt + rise_cnt, which would result in a
huge positive value being written to the hardware register.

[ ... ]

> +static int i2c_dwc_set_timings_master(struct dw_i2c_dev *dev)
> +{
> +	u32 scl_falling_time =3D 0, scl_rising_time =3D 0;
> +	u32 scl_high_time =3D 0, scl_low_time =3D 0;
> +	struct i2c_timings *t =3D &dev->timings;
> +	unsigned int comp_param1;
> +	u32 ic_clk, spk_cnt;
> +	int ret;
> +
> +	ret =3D i2c_dw_acquire_lock(dev);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D regmap_read(dev->map, DWC_IC_CTRL, &comp_param1);

[Severity: Medium]
Should this register read be from DW_IC_COMP_PARAM_1 instead of DWC_IC_CTRL?

The later code checks for DWC_IC_COMP_PARAM_1_SPEED_MODE_HIGH in
comp_param1, but DWC_IC_CTRL is at offset 0x24 while DW_IC_COMP_PARAM_1
is at 0xf4.

> +	i2c_dw_release_lock(dev);
> +	if (ret)
> +		return ret;
> +
> +	ic_clk =3D i2c_dw_clk_rate(dev);
> +
> +	/* 50ns maximum spike */
> +	spk_cnt =3D DIV_ROUND_CLOSEST_ULL((u64)ic_clk * 50, MICRO);
> +
> +	regmap_write(dev->map, DWC_IC_HS_SPKLEN, spk_cnt);
> +	regmap_write(dev->map, DWC_IC_SPKLEN, spk_cnt);

[Severity: High]
Are these registers being programmed locklessly and out of sequence?

The bus lock was released above, and this is happening before the controller
is disabled by __i2c_dw_disable(). Also, because this configuration is done
during probe, will the SPKLEN settings be lost upon resuming from suspend?

[ ... ]

> +	/* Check is high speed possible and fall back to fast mode if not */
> +	if ((dev->master_cfg & DWC_IC_CTRL_SPEED_MASK) =3D=3D DWC_IC_CTRL_SPEED=
_HIGH) {
> +		if ((comp_param1 & DWC_IC_COMP_PARAM_1_SPEED_MODE_MASK)
> +			!=3D DWC_IC_COMP_PARAM_1_SPEED_MODE_HIGH) {
> +			dev_err(dev->dev, "High Speed not supported!\n");
> +			t->bus_freq_hz =3D I2C_MAX_FAST_MODE_FREQ;
> +			dev->master_cfg &=3D ~DWC_IC_CTRL_SPEED_MASK;
> +			dev->master_cfg |=3D DWC_IC_CTRL_SPEED_FAST;
> +			dev->hs_hcnt =3D 0;
> +			dev->hs_lcnt =3D 0;
> +
> +			/* Replace with I2C_MAX_FAST_MODE_PLUS_FREQ */
> +			scl_rising_time =3D max(scl_rising_time, 120);
> +			scl_falling_time =3D max(scl_falling_time, 120);
> +			scl_high_time =3D 260;	/* tHIGH_min =3D 260 ns */
> +			scl_low_time =3D 500;	/* tLOW_min =3D 500 ns */

[Severity: Medium]
Is there a mismatch here between the fallback bus frequency and the timing
values?

The bus frequency is set to I2C_MAX_FAST_MODE_FREQ (400kHz), but the
hardcoded timing values correspond to I2C_MAX_FAST_MODE_PLUS_FREQ (1MHz).

[ ... ]

> +int i2c_dw_init(struct dw_i2c_dev *dev)

[Severity: High]
Does defining a strong global function i2c_dw_init() here break the generic
DesignWare I2C driver?

If CONFIG_I2C_DWC_CORE is enabled, all standard DesignWare controllers might
execute this DWC-specific logic instead of their own, accessing incorrect
register offsets.

> +{
> +	int ret;

[ ... ]

> +void i2c_dw_configure_master(struct dw_i2c_dev *dev)

[Severity: High]
Like i2c_dw_init() above, will defining i2c_dw_configure_master() here also
override the generic DesignWare implementation and break other generic hard=
ware?

> +{
> +	struct i2c_timings *t =3D &dev->timings;

[ ... ]

> +int i2c_dw_probe_master(struct dw_i2c_dev *dev)

[Severity: High]
Will defining i2c_dw_probe_master() here cause namespace collisions and ove=
rride
the generic i2c-designware-core driver implementation?

> +{
> +	struct i2c_adapter *adap =3D &dev->adapter;
> +	unsigned int ic_ctrl;
> +	int ret;

[ ... ]

> diff --git a/drivers/i2c/busses/i2c-dwc-slave.c b/drivers/i2c/busses/i2c-=
dwc-slave.c
> new file mode 100644
> index 0000000000000..5369eb8812382
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-dwc-slave.c
> @@ -0,0 +1,180 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Synopsys DWC I2C adapter driver (slave only).
> + *
> + * Based on the Synopsys DWC I2C adapter driver (master).
> + *
> + * Copyright (C) 2016 Synopsys Inc.
> + */
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/errno.h>
> +#include <linux/i2c.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/of_platform.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +
> +#include "i2c-designware-core.h"

[Severity: Low]
Should "i2c-dwc-core.h" be included here to prevent build failures from
undeclared identifiers like DWC_IC_DAR?

> +
> +void i2c_dw_set_mode(struct dw_i2c_dev *dev, int mode)
> +{
> +	if (dev->mode =3D=3D DW_IC_SLAVE && mode =3D=3D DW_IC_SLAVE) {
> +		regmap_write(dev->map, DWC_IC_DAR, dev->slave->addr);
> +		__i2c_dw_enable(dev);
> +		dev->status =3D 0;

[Severity: Medium]
Could clearing dev->status unconditionally here clobber the interrupt state
machine?

Because the hardware is active and interrupts are already unmasked, an
interrupt might fire and update dev->status concurrently.

> +	}
> +}

[ ... ]

> +u32 i2c_dw_read_clear_intrbits_slave(struct dw_i2c_dev *dev)
> +{
> +	unsigned int stat;
> +	unsigned int smbus_stat;
> +
> +	/*
> +	 * The IC_INTR_STAT register just indicates "enabled" interrupts.
> +	 * The unmasked raw version of interrupt status bits is available
> +	 * in the IC_RAW_INTR_STAT register.
> +	 *
> +	 * That is,
> +	 *   stat =3D readl(IC_INTR_STAT);
> +	 * equals to,
> +	 *   stat =3D readl(IC_RAW_INTR_STAT) & readl(IC_INTR_MASK);
> +	 *
> +	 * The raw version might be useful for debugging purposes.
> +	 */
> +	regmap_read(dev->map, DW_IC_INTR_STAT, &stat);
> +	regmap_read(dev->map, DWC_IC_SMBUS_INTR_STAT, &smbus_stat);

[Severity: High]
Is it safe to unconditionally read DWC_IC_SMBUS_INTR_STAT here?

The SMBus block is optional, and accessing unmapped or disabled IP block
registers might cause imprecise external aborts or bus faults on some
architectures. Should this check DWC_IC_CAPABILITIES_IC_SMBUS first?

[ ... ]

> +const struct i2c_algorithm i2c_dw_slave_algo =3D {
> +	.master_xfer =3D i2c_dwc_xfer_ms,
> +	.functionality =3D i2c_dw_func,
> +	.reg_slave =3D i2c_dw_reg_slave,
> +	.unreg_slave =3D i2c_dw_unreg_slave,
> +};

[Severity: Low]
Does i2c_dw_slave_algo need an EXPORT_SYMBOL_GPL()?

It is referenced by i2c-designware-common.c, which could cause a cross-modu=
le
linking failure if the drivers are built as separate modules.

[ ... ]

> +int i2c_dw_probe_slave(struct dw_i2c_dev *dev)

[Severity: High]
Similar to the master driver, will defining a strong i2c_dw_probe_slave()
function here override the generic DesignWare implementation and break other
I2C controllers?

> +{
> +	struct i2c_adapter *adap =3D &dev->adapter;
> +	struct device_node *ms_node;
> +	int ret;
> +
> +	ret =3D i2c_dwc_init_slave(dev);
> +	if (ret)
> +		return ret;
> +
> +	snprintf(adap->name, sizeof(adap->name), "Synopsys DWC I2C Slave adapte=
r");
> +
> +	/* Get the specified I2C master adapter from DTS for MCTP */
> +	ms_node =3D of_parse_phandle(dev->dev->of_node, "starfive,mctp-i2c-ms",=
 0);
> +	if (ms_node) {
> +		struct platform_device *ms_pdev =3D of_find_device_by_node(ms_node);
> +
> +		if (ms_pdev) {
> +			struct dw_i2c_dev *ms_dev =3D platform_get_drvdata(ms_pdev);
> +
> +			if (ms_dev)
> +				dev->ms_adapter =3D &ms_dev->adapter;

[Severity: High]
Are we leaking device tree references and risking a Use-After-Free here?

of_parse_phandle() and of_find_device_by_node() increment reference counts,
but of_node_put() and put_device() are never called. Also, a raw pointer to
the master adapter is stored in dev->ms_adapter without taking a proper
reference. If the master device is unbound, dev->ms_adapter could become a
dangling pointer.

> +		}
> +	}
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(i2c_dw_probe_slave);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521034340.2783=
7-1-lianfeng.ouyang@starfivetech.com?part=3D3
