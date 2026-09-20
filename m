Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75ED443C01
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 12:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789906665; cv=none; b=IF4pcHLp1U63wpw+J0bDPs/avdG+bIs7XrnfTlPb/UIUqbAHXuzwDUTUgIYClUBQ8GZLoRPT/4FwtBZ2TttQWtcPsTlubBMgPQa/fRqXIUR3ogGxsJn+vKzeHTdxoKnMQm/hvOGo3MiBUgz4SL4b5Bly5/nk7xZXjSKz6nPvEpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789906665; c=relaxed/simple;
	bh=TkqlUE6fIX+OUun83ytLDZBxp7rNOcowNHrRstU4SSs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Jc9RTQjurZJhCtJx+32/kv+BebzJ0q5Pthaf5nl2ww7ZvOlMXxgqlguBuYjar4igWCbr33in2IXOfw4pDKQkv8+WkNYl6sNwjGTWM3mPoB4XAkU4mrMjhUsINsGaCBavhTbBDJYbHD8QlDOg9wMxyMmR2FluI3ydNZnsKzwdDa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AnKzNstI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AnKzNstI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 787E71F000FF;
	Sun, 20 Sep 2026 12:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789906653;
	bh=hmK3y7R1awsLU/JP/T/rq0sOg4S1Y38BesHtqC511Nw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AnKzNstIS825FzSQUriNbFwRurwhpZdvRSB+AbhxFvosPqca7aFf1WTdcZsIQcjhM
	 TYbnXE/84sXLN5lH8VRgTCM124xrsQXLLRNzWdsnPrSMSpjknjM/spfdSJ45ScpmNR
	 ZekmGN/qEiUwqqOxR3xR57MnV67eQcPGsDiohSJ7RNogG8mfBAsr7XSNWM/tq0o2EK
	 eDLW0W9kbkZ4e8SDvrSkQSj8JHSzwquNaIFUZpLs5jBGDmG23ATUwMeNgn1ZdpTynR
	 VrS4Itl5ufEloTj1atRceutr36FcxZPv328P7O81MenwQAZW9IT6CVtORfE+s/rj5p
	 iYWlWuQz8CZPQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] i2c: qcom-target: Add driver for Qualcomm I2C
 target controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Viken Dadhaniya" <viken.dadhaniya@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260920-i2c-qcom-slave-v4-2-f7e1020f3bb4@oss.qualcomm.com>
References: <20260920-i2c-qcom-slave-v4-0-f7e1020f3bb4@oss.qualcomm.com>
 <20260920-i2c-qcom-slave-v4-2-f7e1020f3bb4@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 20 Sep 2026 12:17:33 +0000
Message-Id: <20260920121733.787E71F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] i2c: missing adapter owner initialization allows use-after-free
- [High] i2c: incorrect IRQ dispatch order corrupts state on Repeated Start
- [High] i2c: inconsistent clock teardown and resume ordering causes bus ha=
ngs
- [High] i2c: fatal unclocked MMIO access hazard in resume error paths
- [Low] i2c: unused PM sleep callbacks trigger warnings without CONFIG_PM_S=
LEEP
--

commit c5134b7c0f90bc099584b542a4a86588eb8e6053
Author: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
i2c: qcom-target: Add driver for Qualcomm I2C target controller

This commit introduces a new driver for the Qualcomm I2C target controller
found on QDU1000 and related SoCs. It registers with the Linux I2C slave
framework to allow standard slave backends to attach.

> diff --git a/drivers/i2c/busses/i2c-qcom-target.c b/drivers/i2c/busses/i2=
c-qcom-target.c
> index 0000000000000..5cf4bad1b601a
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-qcom-target.c

[ ... ]

> +static irqreturn_t qcom_i2c_target_irq(int irq, void *dev)
> +{
> +	struct qcom_i2c_target *target =3D dev;
> +	u32 irq_stat, rx_bits;

[ ... ]

> +	if (irq_stat & BIT(RESTART_DETECTED)) {
> +		dev_dbg(target->dev, "Repeated start bit detected\n");
> +		target->status =3D 0;
> +		/*
> +		 * Keep clock stretch asserted when STRCH_RD is co-asserted so
> +		 * qcom_i2c_target_handle_strch_rd() can fill TX FIFO first.
> +		 */
> +		if (!(irq_stat & BIT(STRCH_RD)))
> +			writel(ACK_RESUME, target->base + I2C_S_CONTROL);
> +		writel(BIT(RESTART_DETECTED), target->base + I2C_S_IRQ_CLR);
> +	}
> +
> +	if (irq_stat & BIT(STRCH_RD))
> +		qcom_i2c_target_handle_strch_rd(target);
> +
> +	/*
> +	 * Coalesce all write-phase Rx bits into a single drain+ACK. When the
> +	 * RX FIFO fills at threshold, RX_FIFO_FULL, RX_DATA_AVAIL and STRCH_WR
> +	 * can all assert in the same irq_stat snapshot. Pass the combined mask
> +	 * so ACK_RESUME is written exactly once and all bits are cleared toget=
her.
> +	 */
> +	rx_bits =3D irq_stat & (BIT(RX_FIFO_FULL) | BIT(RX_DATA_AVAIL) |
> +			      BIT(STRCH_WR));
> +	if (rx_bits)
> +		qcom_i2c_target_handle_rx_data(target, rx_bits);

[Severity: High]
Is there a state corruption issue here if a Repeated Start occurs immediate=
ly
following a write phase?

If the hardware asserts both RESTART_DETECTED and RX_DATA_AVAIL in the same
interrupt, target->status is cleared to 0 first, which wipes the
WRITE_IN_PROGRESS flag. When qcom_i2c_target_handle_rx_data() is called rig=
ht
after, could this cause the backend to receive an erroneous
I2C_SLAVE_WRITE_REQUESTED event and interpret the trailing data from the
previous write as the start of a brand new transaction?

[ ... ]

> +static int qcom_i2c_target_adap_init(struct qcom_i2c_target *target)
> +{
> +	target->adap.algo =3D &qcom_i2c_target_algo;
> +	target->adap.dev.parent =3D target->dev;
> +	target->adap.dev.of_node =3D target->dev->of_node;
> +	strscpy(target->adap.name, "qcom-i2c-target",
> +		sizeof(target->adap.name));
> +	i2c_set_adapdata(&target->adap, target);
> +
> +	return i2c_add_adapter(&target->adap);
> +}

[Severity: High]
Is the adapter missing the .owner initialization?

Without setting target->adap.owner =3D THIS_MODULE, the I2C core won't be a=
ble
to properly manage module refcounts. Can this lead to a use-after-free if t=
he
module is removed while an unprivileged userspace process holds the charact=
er
device open?

[ ... ]

> +static void qcom_i2c_target_remove(struct platform_device *pdev)
> +{
> +	struct qcom_i2c_target *target =3D platform_get_drvdata(pdev);
> +
> +	writel(0, target->base + I2C_S_CONFIG);
> +	i2c_del_adapter(&target->adap);
> +	devm_free_irq(&pdev->dev, target->irq, target);
> +	icc_set_bw(target->icc_path, 0, 0);
> +	clk_disable_unprepare(target->xo_clk);
> +	clk_disable_unprepare(target->ahb_clk);
> +}

[Severity: High]
Does this code tear down the clocks in the correct order?

In qcom_i2c_target_probe(), xo_clk is enabled before ahb_clk. Here in remove
(and similarly in suspend below), xo_clk is disabled before ahb_clk. Does
this sequence risk a bus lockup or controller hang?

> +static int qcom_i2c_target_suspend(struct device *dev)
> +{
> +	struct qcom_i2c_target *target =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	disable_irq(target->irq);
> +	writel(0, target->base + I2C_S_IRQ_EN);
> +	writel(0, target->base + I2C_S_CONFIG);
> +
> +	ret =3D icc_set_bw(target->icc_path, 0, 0);
> +	if (ret)
> +		dev_err(dev, "icc_set_bw failed on suspend: %d\n", ret);
> +
> +	clk_disable_unprepare(target->xo_clk);
> +	clk_disable_unprepare(target->ahb_clk);
> +
> +	return 0;
> +}

[Severity: Low]
Could these PM callbacks cause unused function warnings?

When CONFIG_PM_SLEEP is disabled, SET_SYSTEM_SLEEP_PM_OPS becomes empty,
rendering qcom_i2c_target_suspend and qcom_i2c_target_resume unreferenced in
the source. This might trigger compiler warnings that break builds using
CONFIG_WERROR.

> +static int qcom_i2c_target_resume(struct device *dev)
> +{
> +	struct qcom_i2c_target *target =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret =3D clk_prepare_enable(target->ahb_clk);
> +	if (ret) {
> +		dev_err(dev, "failed to enable AHB clock\n");
> +		enable_irq(target->irq);
> +		return ret;
> +	}

[Severity: High]
There appear to be two issues in this error path.

First, does resume enable the clocks in the opposite order compared to the
probe sequence? It enables ahb_clk before xo_clk, which might contradict
standard hardware initialization sequences.

Second, does enable_irq() unmask the interrupt while the bus clocks are
disabled? If the IRQ line is asserted, the CPU will jump to
qcom_i2c_target_irq(), which immediately executes a readl_relaxed() on
I2C_S_IRQ_STATUS. Could this cause a fatal bus error (synchronous external
abort) due to an unclocked MMIO access?

[ ... ]

> +err_disable_ahb:
> +	clk_disable_unprepare(target->ahb_clk);
> +	enable_irq(target->irq);
> +
> +	return ret;
> +}

[Severity: High]
Similar to the observation above, does enabling the IRQ here while clocks a=
re
completely disabled risk an unclocked MMIO access and a resulting kernel pa=
nic
if the interrupt fires?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260920-i2c-qcom-s=
lave-v4-0-f7e1020f3bb4@oss.qualcomm.com?part=3D2
