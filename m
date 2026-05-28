Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5253A544A
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 09:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779959313; cv=none; b=MvHJBEzA6xDJUGQj7zOma24DlIAl1XXgIFxYt8C2r5oVy9YTLm4bwrt/IjdQQJ9I26zHeo9K0Z2mVIXtXwkHrXNzT+aLshnUSs5FfqDqRROAxCUYqgVwMp6UtF5DuYuYOHbgfbngfJRgMdiu/e5x+83PRhE95EkoQCFjXas+2qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779959313; c=relaxed/simple;
	bh=jVN7MsMqRJvvwbh0PqsozTdjYW5NQUSu/qNqOeqxfyw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RUlukaU4TzYda9hunHWDw4wNiOjGxQTqsP9miM9ubtb7LYyNMxMKjuLaIDkCpOjNMnnzduhoXL030MlzfesVMK4HMM1xlpoM5ciIQ+XgLiRqkY3yosvE06+hV94VO6IPy6BYDaCphoGnfYHxFhK00XQsbrnhaD2rE2dEBIE9deo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nIupeqyM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nIupeqyM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 589FB1F000E9;
	Thu, 28 May 2026 09:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779959309;
	bh=4+fxjqv8QEJtHei6ueMHvuPh6+E48Y7zzDKPyRU1eXY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nIupeqyMLrTAWNCGI9ppx7rvkSoLNdh+pjQQcjmmHEknzMaEA71DiwBchh5f6K9MH
	 y1DmgQMvAIHQ7l/hh+shYq/1XICi0cYymEwMHo9p5LjmAlBte2qzSJSuyUA/YNOA4J
	 egKqjrP4zPHrUCXLKwnNzE+1BRfohumK6ZRxOTaYWiAZOZnyfbU3GeEr3ggKRV8WSF
	 al3nQCclI5SkwIbHS0/4QtL9ZcJsEnOAk0b3wiM3q6AtH9lab7yvUPbEhL9QuK3uge
	 xEzQoUfpMy73EHD78bqn6gcRtJ2TInt2r2Fv8BxJGHcMSuseu3m2/Bv/fLCYpMCXNc
	 AZMTJMAfzcbfA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v30 4/5] i2c: ast2600: Add controller driver for AST2600
 new register set
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ryan Chen" <ryan_chen@aspeedtech.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260528-upstream_i2c-v30-4-5d4f9adc3530@aspeedtech.com>
References: <20260528-upstream_i2c-v30-4-5d4f9adc3530@aspeedtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 28 May 2026 09:08:28 +0000
Message-Id: <20260528090829.589FB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [Critical] Missing lifecycle validation of `i2c_bus->msgs` on transfer ti=
meout leads to a Use-After-Free (UAF) and memory corruption.
- [Critical] The RX interrupt handler blindly trusts the hardware's RX buff=
er length, leading to a potential out-of-bounds memory write (buffer overfl=
ow).
- [High] Non-atomic read-modify-write of a shared global syscon register cl=
obbers existing bits and introduces a TOCTOU race.
- [High] SMBus Block Read with a block length of 0 corrupts the length byte=
 in the receive buffer.
- [High] Unaborted bus recovery operations on timeout lead to cross-transfe=
r completion races.
--

commit 00d3297d874ae70d7ea1c3a5e963a09c214da736
Author: Ryan Chen <ryan_chen@aspeedtech.com>
Subject: i2c: ast2600: Add controller driver for AST2600 new register set

The AST2600 introduces a new I2C controller register layout, selectable at
runtime via global control registers. This patch adds an AST2600-specific I=
2C
controller driver implementing the new register layout, including support f=
or
packet-based transfers.

> diff --git a/drivers/i2c/busses/i2c-ast2600.c b/drivers/i2c/busses/i2c-as=
t2600.c
> new file mode 100644
> index 0000000000000..a06d0483865ed
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-ast2600.c

[ ... ]

> +static int ast2600_i2c_recover_bus(struct ast2600_i2c_bus *i2c_bus)
> +{

[ ... ]

> +	/* Check SDA/SCL status in the status register. */
> +	state =3D readl(i2c_bus->reg_base + AST2600_I2CC_STS_AND_BUFF);
> +	if (!(state & AST2600_I2CC_SDA_LINE_STS) && (state & AST2600_I2CC_SCL_L=
INE_STS)) {
> +		writel(AST2600_I2CM_RECOVER_CMD_EN, i2c_bus->reg_base + AST2600_I2CM_C=
MD_STS);
> +		r =3D wait_for_completion_timeout(&i2c_bus->cmd_complete, i2c_bus->ada=
p.timeout);
> +		if (r =3D=3D 0) {
> +			dev_dbg(i2c_bus->dev, "recovery timed out\n");
> +			return -ETIMEDOUT;

[Severity: High]
Does returning immediately on timeout leave the hardware in a state that co=
uld
corrupt future transfers?

If the delayed hardware recovery operation from the previous attempt finish=
es
later, it will trigger the BUS_RECOVER interrupt. This could execute
complete(&i2c_bus->cmd_complete), prematurely completing the wait for a new,
unrelated transfer and tricking the state machine into treating an incomple=
te
transfer as successful.

> +		} else if (i2c_bus->cmd_err) {
> +			dev_dbg(i2c_bus->dev, "recovery error\n");
> +			ret =3D -EPROTO;
> +		}
> +	}

[ ... ]

> +static void ast2600_i2c_controller_packet_irq(struct ast2600_i2c_bus *i2=
c_bus, u32 sts)
> +{

[ ... ]

> +	case AST2600_I2CM_RX_DONE:
> +	case AST2600_I2CM_RX_DONE | AST2600_I2CM_NORMAL_STOP:
> +		xfer_len =3D AST2600_I2CC_GET_RX_BUF_LEN(readl(i2c_bus->reg_base +
> +							     AST2600_I2CC_BUFF_CTRL));
> +		for (i =3D 0; i < xfer_len; i++)
> +			msg->buf[i2c_bus->controller_xfer_cnt + i] =3D
> +				readb(i2c_bus->buf_base + i2c_bus->buf_size + i);

[Severity: Critical]
Is there a missing bounds check on xfer_len here?

If the hardware malfunctions, misinterprets the bus state, or returns a lar=
ger
length than expected, this loop could write data past the end of the
dynamically allocated msg->buf. Could this cause a kernel buffer overflow?

> +
> +		if (msg->flags & I2C_M_RECV_LEN) {
> +			u8 recv_len =3D AST2600_I2CC_GET_RX_BUFF(readl(i2c_bus->reg_base
> +						       + AST2600_I2CC_STS_AND_BUFF));
> +			msg->len =3D min_t(unsigned int, recv_len, I2C_SMBUS_BLOCK_MAX);
> +			msg->len +=3D ((msg->flags & I2C_CLIENT_PEC) ? 2 : 1);
> +			msg->flags &=3D ~I2C_M_RECV_LEN;
> +			if (!recv_len)
> +				i2c_bus->controller_xfer_cnt =3D 0;

[Severity: High]
Could setting controller_xfer_cnt to 0 corrupt the block length byte?

If recv_len is 0, msg->len is updated to 1 to perform a 1-byte read.
When the hardware receives this next byte and triggers RX_DONE again, the l=
oop
above copies the new byte into msg->buf[i2c_bus->controller_xfer_cnt + i].

Since controller_xfer_cnt was reset to 0, does this unconditionally overwri=
te
and corrupt the block length byte in msg->buf[0]?

> +			else
> +				i2c_bus->controller_xfer_cnt =3D 1;
> +		} else {

[ ... ]

> +static int ast2600_i2c_controller_xfer(struct i2c_adapter *adap, struct =
i2c_msg *msgs, int num)
> +{

[ ... ]

> +	i2c_bus->cmd_err =3D 0;
> +	i2c_bus->msgs =3D msgs;
> +	i2c_bus->msgs_index =3D 0;
> +	i2c_bus->msgs_count =3D num;
> +	reinit_completion(&i2c_bus->cmd_complete);
> +	ret =3D ast2600_i2c_do_start(i2c_bus);
> +	if (ret)
> +		goto controller_out;
> +	timeout =3D wait_for_completion_timeout(&i2c_bus->cmd_complete, i2c_bus=
->adap.timeout);
> +	if (timeout =3D=3D 0) {

[Severity: Critical]
Does this timeout path need to clear i2c_bus->msgs?

If wait_for_completion_timeout() times out, the function returns -ETIMEDOUT
and the I2C subsystem will free the msgs array. However, the driver never
clears the i2c_bus->msgs pointer.

If a delayed hardware response (such as a spurious PKT_DONE or RX_DONE)
later triggers an interrupt, the ast2600_i2c_controller_packet_irq()
handler will unconditionally dereference the dangling i2c_bus->msgs
pointer. Could this lead to a use-after-free or out-of-bounds memory
write causing kernel memory corruption?

> +		u32 ctrl =3D readl(i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);

[ ... ]

> +static int ast2600_i2c_probe(struct platform_device *pdev)
> +{

[ ... ]

> +	i2c_bus->global_regs =3D
> +		syscon_regmap_lookup_by_phandle(dev_of_node(dev), "aspeed,global-regs"=
);
> +	if (IS_ERR(i2c_bus->global_regs))
> +		return PTR_ERR(i2c_bus->global_regs);
> +
> +	regmap_read(i2c_bus->global_regs, AST2600_I2CG_CTRL, &global_ctrl);
> +	if ((global_ctrl & AST2600_GLOBAL_INIT) !=3D AST2600_GLOBAL_INIT) {
> +		regmap_write(i2c_bus->global_regs, AST2600_I2CG_CTRL, AST2600_GLOBAL_I=
NIT);

[Severity: High]
Does this non-atomic write clobber existing bits in the shared control regi=
ster?

Because AST2600_I2CG_CTRL is shared across multiple I2C controllers,
using regmap_write() to unconditionally overwrite the register with
AST2600_GLOBAL_INIT destroys any other configuration bits that may have
been set by the bootloader or other subsystems.

Also, concurrent probing of multiple buses could introduce a Time-Of-Check-
To-Time-Of-Use race. Should this use regmap_update_bits() instead to
atomically modify only the relevant bits?

> +		regmap_write(i2c_bus->global_regs, AST2600_I2CG_CLK_DIV_CTRL, I2CCG_DI=
V_CTRL);
> +	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260528-upstream_i=
2c-v30-0-5d4f9adc3530@aspeedtech.com?part=3D4
