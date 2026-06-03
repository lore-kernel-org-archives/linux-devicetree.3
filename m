Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D533921DD
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 06:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780467953; cv=none; b=XFedufGcBcRqn2IOty8gOYaNUgLmsrpcGXh42Pvaq+k57PXU9f6lGUgBcxkHUetAfgXRoRBdd+PWM1BFg/TufsvRq7B1sCD8hmXNbmJ2gr2CbinmKaMMLBhvU7HQ5jI9dX/t6zbWkFhRSmd6rkXxNH3xbCTMeNT3v5EikLX6cu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780467953; c=relaxed/simple;
	bh=rfYGZ6cHyYKQU7HKfShWjTlcSoXjBBPn6nhkdwc25yE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gwDu7WvHHOkVo8kkqsaoSr7uAeHWQ3aWSQsAwKWtfTUUoR+Kxcy75K/oEm9fYeBLQnnPiW6Qlr7G/IUJ0up/YpPQ9peLaQgJv/Xw1GHAfOPdgXqKNnrcifPca+1PibPoGVnOd1/64W7xDB7VwVDz50vFKL6QYrvmz6Hx27B4YC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EL+ka7KX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EL+ka7KX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C00A21F00898;
	Wed,  3 Jun 2026 06:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780467952;
	bh=XicfxWCBxSOy+Ew6/9q8z6boLkaRkd6pU19QFi3UkYM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EL+ka7KXREZIU4W7B072Fv91ado8ln80PfXe3PpjEzW4g2gAbLqZUDgK4ZI94AaxG
	 yjyMO8rwGKzG4GT2Y+kRI2l3ROEeQea0N51/asHJoaZXyMEjPRf52V0Xv8DJ7yWo+2
	 uBzpv+V1vPsfoQug774IxHrFjeqCI6DUvLnzyIp4V1U8q8QQ95QOKSVM3jN2mh27GO
	 o1RwYZ+qzh2DqMI+K3KqzYus3DqyqSGBnJEozxkGXEGF70Y4Yp8CfUWGMHhGXeKSvo
	 kVOvwhc4ZRO5tPuciD/rO37+mWg7QH83Hq+P9lSrYypHRrWyx6OExB0e7K03ZAkL2W
	 KjUwltOEGjyOA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v31 4/5] i2c: ast2600: Add controller driver for AST2600
 new register set
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ryan Chen" <ryan_chen@aspeedtech.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260603-upstream_i2c-v31-4-ba7a02714f22@aspeedtech.com>
References: <20260603-upstream_i2c-v31-4-ba7a02714f22@aspeedtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 06:25:51 +0000
Message-Id: <20260603062551.C00A21F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 10 potential issue=
(s) to consider:
- [High] A 0-length SMBus block read completes without issuing a STOP condi=
tion, permanently hanging the I2C bus.
- [High] Returning early in the IRQ handler when `i2c_bus->msgs` is NULL sk=
ips clearing the interrupt status, causing an infinite interrupt storm.
- [High] Calling `i2c_transfer` with `num =3D=3D 0` causes an out-of-bounds=
 access or NULL pointer dereference on the `msgs` array.
- [High] A race condition in the I2C transfer timeout path can lead to a Us=
e-After-Free of the `i2c_bus->msgs` buffer.
- [High] Trailing interrupts unconditionally overwrite previous error codes=
 and improperly resume aborted transactions, leading to Use-After-Free.
- [High] The interrupt handler accesses `i2c_bus->msgs[msgs_index]` without=
 checking if `msgs_index` is within bounds.
- [High] A malformed device tree can cause a divide-by-zero kernel panic by=
 setting `clock-frequency =3D <0>`.
- [High] The I2C controller interrupt handler fails to clear all packet sta=
tus bits in the Write-Clear ISR register, leading to stale status bits and =
spurious timeouts.
- [Medium] Uninitialized variables `clk_div_reg` and `global_ctrl` are used=
 if `regmap_read` fails.
- [Medium] The `AST2600_I2CM_BUS_RECOVER_FAIL` interrupt is not enabled in =
the interrupt enable register (`IER`), causing bus recovery failures to unn=
ecessarily time out.
--

commit e2c4f0c2ecd8a3e8e1c9e3768ae911afff057121
Author: Ryan Chen <ryan_chen@aspeedtech.com>
Date:   Wed Jun 3 05:50:16 2026 +0000

    i2c: ast2600: Add controller driver for AST2600 new register set
   =20
    This commit adds an AST2600-specific I2C controller driver implementing=
 the
    new register layout, including support for packet-based transfers. It p=
robes
    based on the presence of the "aspeed,global-regs" device tree property.

> diff --git a/drivers/i2c/busses/i2c-ast2600.c b/drivers/i2c/busses/i2c-as=
t2600.c
> new file mode 100644
> index 0000000000000..35f38e1f47999
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-ast2600.c
> @@ -0,0 +1,864 @@
[ ... ]
> +static void ast2600_i2c_ac_timing_config(struct ast2600_i2c_bus *i2c_bus)
> +{
> +	unsigned long base_clk[16];
> +	int baseclk_idx =3D 0;
> +	int divisor =3D 0;
> +	u32 clk_div_reg;
> +	u32 scl_low;
> +	u32 scl_high;
> +	u32 data;
> +
> +	regmap_read(i2c_bus->global_regs, AST2600_I2CG_CLK_DIV_CTRL, &clk_div_r=
eg);

[Severity: Medium]
If regmap_read() fails for the syscon I/O, does it leave clk_div_reg
uninitialized before using it in the divisor calculation below?

> +
> +	for (int i =3D 0; i < ARRAY_SIZE(base_clk); i++) {
> +		if (i =3D=3D 0)
> +			base_clk[i] =3D i2c_bus->apb_clk;
> +		else if (i < 5)
> +			base_clk[i] =3D (i2c_bus->apb_clk * 2) /
> +			   (((clk_div_reg >> ((i - 1) * 8)) & GENMASK(7, 0)) + 2);
> +		else
> +			base_clk[i] =3D base_clk[4] >> (i - 4);
> +
> +		if ((base_clk[i] / i2c_bus->timing_info.bus_freq_hz) <=3D 32) {

[Severity: High]
If the device tree specifies clock-frequency =3D <0>, does i2c_parse_fw_tim=
ings()
leave bus_freq_hz as 0, resulting in a divide-by-zero kernel panic here?

[ ... ]
> +static int ast2600_i2c_setup_buff_rx(u32 cmd, struct ast2600_i2c_bus *i2=
c_bus)
> +{
> +	struct i2c_msg *msg =3D &i2c_bus->msgs[i2c_bus->msgs_index];
> +	int xfer_len =3D msg->len - i2c_bus->controller_xfer_cnt;
> +
> +	cmd |=3D AST2600_I2CM_PKT_EN | AST2600_I2CM_RX_BUFF_EN | AST2600_I2CM_R=
X_CMD;
> +
> +	if (cmd & AST2600_I2CM_START_CMD)
> +		cmd |=3D AST2600_I2CM_PKT_ADDR(msg->addr);
> +
> +	if (msg->flags & I2C_M_RECV_LEN) {
> +		dev_dbg(i2c_bus->dev, "smbus read\n");
> +		xfer_len =3D 1;
> +	} else if (xfer_len > i2c_bus->buf_size) {
> +		xfer_len =3D i2c_bus->buf_size;
> +	} else if (i2c_bus->msgs_index + 1 =3D=3D i2c_bus->msgs_count) {
> +		cmd |=3D CONTROLLER_TRIGGER_LAST_STOP;
> +	}

[Severity: High]
If this is an SMBus block read and the peripheral later returns a length of=
 0,
does the driver complete the message without ever issuing a STOP condition,
leaving the I2C bus permanently busy? The I2C_M_RECV_LEN check bypasses the
CONTROLLER_TRIGGER_LAST_STOP setup for the first byte.

[ ... ]
> +static int ast2600_i2c_do_start(struct ast2600_i2c_bus *i2c_bus)
> +{
> +	struct i2c_msg *msg =3D &i2c_bus->msgs[i2c_bus->msgs_index];

[Severity: High]
If the I2C subsystem calls i2c_transfer() with num =3D=3D 0, does this code
dereference a NULL pointer or empty array since there are no checks on the
number of messages?

[ ... ]
> +static void ast2600_i2c_controller_packet_irq(struct ast2600_i2c_bus *i2=
c_bus, u32 sts)
> +{
> +	struct i2c_msg *msg;
> +	int xfer_len;
> +	int i;
> +
> +	if (!i2c_bus->msgs)
> +		return;

[Severity: High]
If a trailing hardware interrupt fires when no transfer is active, does
returning here without acknowledging the interrupt in the Write-Clear regis=
ter
cause an infinite interrupt storm?

> +	msg =3D &i2c_bus->msgs[i2c_bus->msgs_index];

[Severity: High]
If a spurious or trailing interrupt arrives after a transfer completes but
before msgs is set to NULL, can msgs_index equal msgs_count here?
If so, does this cause an out-of-bounds pointer calculation and a subsequent
out-of-bounds read in ast2600_i2c_clamp_len()?

> +
> +	sts &=3D ~AST2600_I2CM_PKT_DONE;
> +	writel(AST2600_I2CM_PKT_DONE, i2c_bus->reg_base + AST2600_I2CM_ISR);

[Severity: High]
Since AST2600_I2CM_ISR is a Write-Clear register, does writing only
AST2600_I2CM_PKT_DONE fail to clear the other status bits contained in sts?
Will those stale bits accumulate and cause subsequent transfers to fall
through the switch statement below and timeout?

[ ... ]
> +static int ast2600_i2c_controller_irq(struct ast2600_i2c_bus *i2c_bus)
> +{
> +	u32 sts =3D readl(i2c_bus->reg_base + AST2600_I2CM_ISR);
> +	u32 ctrl;
[ ... ]
> +	i2c_bus->cmd_err =3D ast2600_i2c_irq_err_to_errno(sts);

[Severity: High]
If an error like arbitration loss occurs, and the hardware later issues a
trailing NORMAL_STOP interrupt before the process context cleans up, does t=
his
unconditionally overwrite the existing error code and improperly resume the
next step of an already failed transaction?

[ ... ]
> +static int ast2600_i2c_controller_xfer(struct i2c_adapter *adap, struct =
i2c_msg *msgs, int num)
> +{
[ ... ]
> +	ret =3D ast2600_i2c_do_start(i2c_bus);
> +	if (ret)
> +		goto controller_out;
> +	timeout =3D wait_for_completion_timeout(&i2c_bus->cmd_complete, i2c_bus=
->adap.timeout);
> +	if (timeout =3D=3D 0) {
> +		u32 ctrl =3D readl(i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
[ ... ]
> +		writel(AST2600_I2CM_PKT_DONE | AST2600_I2CM_BUS_RECOVER,
> +		       i2c_bus->reg_base + AST2600_I2CM_IER);

[Severity: High]
If a late completion interrupt fires concurrently on another CPU right after
the IER is re-enabled here, but before msgs is set to NULL at the end of th=
is
function, does this create a use-after-free where the interrupt handler
accesses the caller's freed message buffer?

[Severity: Medium]
Should AST2600_I2CM_BUS_RECOVER_FAIL also be enabled in the IER here?
The interrupt handler checks for this flag to return -EPROTO immediately.
Without it, will bus recovery failures silently block until the full softwa=
re
timeout expires?

[ ... ]
> +static int ast2600_i2c_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	regmap_read(i2c_bus->global_regs, AST2600_I2CG_CTRL, &global_ctrl);
> +	if ((global_ctrl & AST2600_GLOBAL_INIT) !=3D AST2600_GLOBAL_INIT) {

[Severity: Medium]
If regmap_read() returns an error for the syscon I/O, does this evaluate an
uninitialized global_ctrl variable?

[ ... ]
> +	writel(AST2600_I2CM_PKT_DONE | AST2600_I2CM_BUS_RECOVER,
> +	       i2c_bus->reg_base + AST2600_I2CM_IER);

[Severity: Medium]
Similar to the timeout path, does the omission of AST2600_I2CM_BUS_RECOVER_=
FAIL
here cause initial bus recoveries to also hit the full timeout instead of
fast-failing?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603-upstream_i=
2c-v31-0-ba7a02714f22@aspeedtech.com?part=3D4
