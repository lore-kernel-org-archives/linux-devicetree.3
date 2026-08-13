Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429AA492516
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 16:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786637114; cv=none; b=npJwaNz0LJZWOfFPfY4xwfV1Iqj9EBU3nSuN9wWUZa/yX8+Zy7a3GaYEAYJWDJ5lfeddWjuc+jghwLDWv4xtUEa4BfI10MRD36dEtZQQfz/Lr/2SwoDnouY6quq4/P0NgZqM7VxCMjVCMvXMOmmatSFG9Dh8sgKoc01SfVjlX9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786637114; c=relaxed/simple;
	bh=Vvuwbpl1iWq+jA2XzIb8GdMabWZZHJ+44mDjrj2euOY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sLW+tFJcsaFyLTjmbxrn44VVBAO1trJ3OY3LrPyx2iJJeIIFNOpszhM+DioNRerjNfpcNVypPg/7lcsJAbvIYmPLEL6JR5b3GGNPSbA3Xo6b+IB72nfdv42TI3goCZ7hv7zKMl9/KXhWZIUUHYPA9WrPDH+ZEE8Cvm0JBLayGYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JR7g4Z8v; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JR7g4Z8v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 393D51F00A3A;
	Thu, 13 Aug 2026 16:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786637112;
	bh=JR9tQuu3UOUQ5kIbt4JfzZK5OX/v3pbLCqdZD2wNZvg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JR7g4Z8vcrjp1q2XRngI7gPZREdXBcQMvFz3KugkK9OomD+6qzz+ZCqYjgzx6jm9q
	 ydIduEnYKHDgdg6usU1pN2kTV/oxoU4dAYI3WhbA9nglxnV318oLnci3taGMiCUU7n
	 iL4WBFI12Yr0b5MN1sriOWMd1Ty5yhtyG9rQDYmKE2xxVYEx+Tdph6kN1LS3huw0Du
	 oYqgczMcVXTk1Et/81Fg7MUphg1419f3TuJZG8dSlkAcY/JoCB0khlP7lyEPh0VDXC
	 R0ykDzra/ldi16af53APBBfa3M006v2awUXfyMcGHunMlg/1TihvG/tVp/ASY1e4kZ
	 mpBaDjruAHo9Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] i2c: qcom-target: Add driver for Qualcomm I2C
 target controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Viken Dadhaniya" <viken.dadhaniya@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260813-i2c-qcom-slave-v3-2-1d3742e2ad47@oss.qualcomm.com>
References: <20260813-i2c-qcom-slave-v3-0-1d3742e2ad47@oss.qualcomm.com>
 <20260813-i2c-qcom-slave-v3-2-1d3742e2ad47@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 16:05:11 +0000
Message-Id: <20260813160512.393D51F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Calling usleep_range() from the hardirq handler will cause a 'sche=
duling while atomic' kernel panic.
- [High] Risk of synchronous external abort due to clocks being disabled be=
fore the IRQ is freed in the remove path.
- [High] The driver calls sleeping functions (clock APIs and icc_set_bw) fr=
om a `noirq` power management context.
- [High] Premature clock stretch release during a Repeated Start condition.
- [Medium] Missing cleanup of clocks and interconnect bandwidth vote on pro=
be error paths.
--

--- Patch [2]: [PATCH v3 2/2] i2c: qcom-target: Add driver for Qualcomm I2C=
 target controller ---
commit 1029beb1e1d38e9f7984ad5331b9a78f18027431
Author: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Subject: i2c: qcom-target: Add driver for Qualcomm I2C target controller

QDU1000 and related Qualcomm SoCs include a dedicated I2C target
controller that operates exclusively in target mode. This patch registers
the controller with the Linux I2C slave framework and handles IRQ events,
clocks, and power management.

> diff --git a/drivers/i2c/busses/i2c-qcom-target.c b/drivers/i2c/busses/i2=
c-qcom-target.c
> new file mode 100644
> index 0000000000000..277ea944eedb6
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-qcom-target.c

[ ... ]

> @@ -187,15 +187,15 @@ static int qcom_i2c_target_drain_rx_fifo(struct qco=
m_i2c_target *target)
>  static void qcom_i2c_target_hw_reset(struct qcom_i2c_target *target)
>  {
>  	/* Clear error bits before SW_RESET; the reset may not be instantaneous=
 */
>  	writel(BIT(ERR_CONDITION) | BIT(CLOCK_LOW_TIMEOUT),
>  	       target->base + I2C_S_IRQ_CLR);
>  	writel(SW_RESET, target->base + I2C_S_SW_RESET_REG);
>  	/*
>  	 * I2C_S_SW_RESET_REG is write-only so completion cannot be polled.
>  	 * Use a conservative delay to allow the reset to finish before
>  	 * reconfiguring the controller.
>  	 */
>  	usleep_range(10, 20);

[Severity: High]
Does calling usleep_range() here cause a scheduling while atomic kernel
panic?

qcom_i2c_target_hw_reset() is called from qcom_i2c_target_handle_error(),
which is invoked directly from the hardirq handler qcom_i2c_target_irq()
when an error condition or clock low timeout occurs.

>  	qcom_i2c_target_hw_init(target);
>  	writel(target->slave->addr, target->base + I2C_S_DEVICE_ADDR);
>  	writel(I2C_S_CORE_EN, target->base + I2C_S_CONFIG);
>  }

[ ... ]

> @@ -279,15 +279,15 @@ static irqreturn_t qcom_i2c_target_irq(int irq, voi=
d *dev)
>  	if (!READ_ONCE(target->slave)) {
>  		writel(irq_stat, target->base + I2C_S_IRQ_CLR);
>  		return IRQ_HANDLED;
>  	}
> =20
>  	if (irq_stat & (BIT(ERR_CONDITION) | BIT(CLOCK_LOW_TIMEOUT)))
>  		return qcom_i2c_target_handle_error(target, irq_stat);
> =20
>  	if (irq_stat & BIT(STOP_DETECTED))
>  		return qcom_i2c_target_handle_stop(target, irq_stat);
> =20
>  	if (irq_stat & BIT(RESTART_DETECTED)) {
>  		dev_dbg(target->dev, "Repeated start bit detected\n");
>  		target->status =3D 0;
>  		writel(ACK_RESUME, target->base + I2C_S_CONTROL);

[Severity: High]
If a repeated start occurs and STRCH_RD is co-asserted, does writing
ACK_RESUME here release the clock stretch prematurely?

Releasing it here would happen before the STRCH_RD handler below has a
chance to write the required payload to I2C_S_TX_FIFO, potentially corrupti=
ng
the data sent to the I2C master.

>  		writel(BIT(RESTART_DETECTED), target->base + I2C_S_IRQ_CLR);
>  	}
> =20
>  	if (irq_stat & BIT(STRCH_RD))
>  		qcom_i2c_target_handle_strch_rd(target);

[ ... ]

> @@ -482,15 +482,15 @@ static int qcom_i2c_target_probe(struct platform_de=
vice *pdev)
>  	target->ahb_clk =3D devm_clk_get(dev, "ahb");
>  	if (IS_ERR(target->ahb_clk))
>  		return dev_err_probe(dev, PTR_ERR(target->ahb_clk),
>  				     "failed to get AHB clock\n");
> =20
>  	ret =3D clk_prepare_enable(target->xo_clk);
>  	if (ret)
>  		return dev_err_probe(dev, ret, "failed to enable XO clock\n");
> =20
>  	ret =3D clk_prepare_enable(target->ahb_clk);
>  	if (ret) {
>  		clk_disable_unprepare(target->xo_clk);
>  		return dev_err_probe(dev, ret, "failed to enable AHB clock\n");
>  	}
> =20
>  	target->irq =3D platform_get_irq(pdev, 0);
>  	if (target->irq < 0)
>  		return target->irq;

[Severity: Medium]
Are xo_clk and ahb_clk leaked here if platform_get_irq() fails?

It appears clk_disable_unprepare() is missing for both clocks in this error
path, as well as in the subsequent qcom_i2c_target_icc_init() and
devm_request_irq() error paths.

> =20
>  	ret =3D qcom_i2c_target_icc_init(target);
>  	if (ret)
>  		return ret;

[ ... ]

> @@ -511,11 +511,11 @@ static void qcom_i2c_target_remove(struct platform_=
device *pdev)
>  {
>  	struct qcom_i2c_target *target =3D platform_get_drvdata(pdev);
> =20
>  	writel(0, target->base + I2C_S_CONFIG);
>  	i2c_del_adapter(&target->adap);
>  	icc_set_bw(target->icc_path, 0, 0);
>  	clk_disable_unprepare(target->xo_clk);
>  	clk_disable_unprepare(target->ahb_clk);

[Severity: High]
Since the IRQ is devm-managed, can it fire after the clocks are disabled he=
re?

If the interrupt fires during this window, the handler will read
I2C_S_IRQ_STATUS while the clocks are off, which could cause a synchronous
external abort.

>  }
> =20
>  static int qcom_i2c_target_suspend(struct device *dev)

[ ... ]

> @@ -561,11 +561,11 @@ static int qcom_i2c_target_resume(struct device *de=
v)
>  	return 0;
> =20
>  err_disable_xo:
>  	clk_disable_unprepare(target->xo_clk);
>  err_disable_ahb:
>  	clk_disable_unprepare(target->ahb_clk);
>  	return ret;
>  }
> =20
>  static const struct dev_pm_ops qcom_i2c_target_pm_ops =3D {
>  	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(qcom_i2c_target_suspend,
>  				      qcom_i2c_target_resume)

[Severity: High]
Does using the noirq PM macros here cause a scheduling while atomic panic
during suspend and resume?

SET_NOIRQ_SYSTEM_SLEEP_PM_OPS binds the callbacks to the suspend_noirq and
resume_noirq phases, which run with local interrupts disabled. However,
qcom_i2c_target_suspend() and qcom_i2c_target_resume() both call
clk_disable_unprepare() or clk_prepare_enable(), and icc_set_bw(), which
can sleep.

>  };
> =20
>  static const struct of_device_id qcom_i2c_target_dt_match[] =3D {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813-i2c-qcom-s=
lave-v3-0-1d3742e2ad47@oss.qualcomm.com?part=3D2
