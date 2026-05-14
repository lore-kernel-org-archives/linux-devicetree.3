Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAEC63655F4
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 03:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778728972; cv=none; b=F4feaOlbhPfbj2g2GdXzpF7FjxrN0FrgTHjZ9/B0HPU12PqrdBIryAAnVQqwOB3wPh8Gsy+UjmLTYnIUFvL3pI6UdcTUcIAgVn4bQWOWjU3S1Ky/16ZkxblBe50xNTYVziAzgBaGOH9hREQOGfEjXvlqyEyKgeJbanINhoANn18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778728972; c=relaxed/simple;
	bh=2OIflToktBp3/eaVn7Te74ql4GihHndQrc2Dd0HQHms=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ATWQBC7bKxbnNt6PF/Nn9Y+8yKtSwtYS1zbGS6xDdUnK/0Zp8NTcIPZOU760D+zSeJgR5xjC+INy573V0WQMLy9B9jMqx4CTbpM6Fhy+kCZJaEqQ165fM4oBhtUowBLVbEC2s2RGvza8S/fVaR6LTzQu9LOf8qTFquHw4D7mgmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pZuqpyPu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pZuqpyPu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58D22C19425;
	Thu, 14 May 2026 03:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778728971;
	bh=2OIflToktBp3/eaVn7Te74ql4GihHndQrc2Dd0HQHms=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=pZuqpyPuKEvcsuID6/UXdakP1HjxMB4vc5PlNjaFHmvQG689QVdEt6Jbhcd0WKqll
	 PLVZlJ/zO0JQ8eIPfYs3Gfi7xr2GnWl9stwF7zyvAP7aZ6jK7jPVlUZT/U+v4C0o0l
	 qwCoaEhkqkntb7PQUyasA9Ge0+o0zPcNfNo2TdWJbKXTcCrNB+sCjwIusAHQjxxtjX
	 T9yzbPlhP9oSJklHryN2JhPSGJFinOvl0e7TgMWGfHTfc2MivobRJmkdHsKgFr0ymB
	 zn8aHdp7+c6wnvxc21ndq49ryN5c7Dryknz32IIRW+bCVTdNiK5yWAu4Jj9JfxYYJq
	 NEweD1fnOQmmw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v29 4/4] i2c: ast2600: Add target mode support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ryan Chen" <ryan_chen@aspeedtech.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260513-upstream_i2c-v29-4-fe9926964d55@aspeedtech.com>
References: <20260513-upstream_i2c-v29-4-fe9926964d55@aspeedtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 03:22:50 +0000
Message-Id: <20260514032251.58D22C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 10 potential issue=
(s) to consider:
- [Critical] Aborting an active controller transfer from the target IRQ han=
dler leads to Use-After-Free and Double-Complete.
- [High] The target interrupt handler fails to fully clear `AST2600_I2CS_IS=
R`, causing a permanent controller lockout and interrupt storm.
- [High] Missing buffer length bounds checks allow out-of-bounds MMIO reads=
 and heap buffer overflows.
- [High] The `target_active` state is not reliably cleared, leading to a pe=
rmanent controller deadlock.
- [High] Teardown ordering in `ast2600_i2c_unreg_target` introduces a Use-A=
fter-Free race and leaves interrupts unhandled.
- [High] Target hardware is enabled before the software target pointer is i=
nitialized, causing a race condition.
- [High] Invalid I2C slave event ordering and stalled target state machine =
on coalesced interrupts.
- [High] Target mode uses 8-bit `writeb()` on an MMIO buffer that strictly =
requires 32-bit dword writes.
- [Medium] The driver silently accepts 10-bit target addresses and corrupts=
 adjacent hardware registers.
- [Medium] An uninitialized stack variable is passed to the target subsyste=
m callback, risking a stack memory leak.
--

commit bab1ad91b91880a2b3f51b5f42819d087c2a2196
Author: Ryan Chen <ryan_chen@aspeedtech.com>

i2c: ast2600: Add target mode support
   =20
Add target mode support to the AST2600 I2C driver. Target mode features
implemented include target interrupt handling and address match and response
logic.

> diff --git a/drivers/i2c/busses/i2c-ast2600.c b/drivers/i2c/busses/i2c-as=
t2600.c
> index 787ef6bd62442..137aaf7e26b51 100644
> --- a/drivers/i2c/busses/i2c-ast2600.c
> +++ b/drivers/i2c/busses/i2c-ast2600.c
[ ... ]
> @@ -337,6 +342,243 @@ static int ast2600_i2c_recover_bus(struct ast2600_i=
2c_bus *i2c_bus)
>  	return ret;
>  }
> =20
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +static void ast2600_i2c_target_packet_buff_irq(struct ast2600_i2c_bus *i=
2c_bus, u32 sts)
> +{
> +	int target_rx_len =3D 0;
> +	u32 cmd =3D 0;
> +	u8 value;

Could this result in leaking uninitialized stack memory?

The local variable value is uninitialized, but it is passed by reference to
i2c_slave_event() below during events like I2C_SLAVE_STOP.

> +	int i;
> +
> +	/* due to controller target is common buffer, need force the master sto=
p not issue */
> +	if (readl(i2c_bus->reg_base + AST2600_I2CM_CMD_STS) & GENMASK(15, 0)) {
> +		writel(0, i2c_bus->reg_base + AST2600_I2CM_CMD_STS);
> +		i2c_bus->cmd_err =3D -EBUSY;
> +		writel(0, i2c_bus->reg_base + AST2600_I2CC_BUFF_CTRL);
> +		complete(&i2c_bus->cmd_complete);
> +	}

Is there a risk of a use-after-free and double-complete here?

If an ongoing controller transfer is aborted and complete() is called
immediately, the waiting thread in ast2600_i2c_controller_xfer() might exit
and free the i2c_bus->msgs buffers.=20

The hardware could have already asserted the master interrupt, or it might
assert it as a result of the abort. When the controller IRQ handler eventua=
lly
processes this, it could use the freed i2c_bus->msgs pointer and call
complete() again.

[ ... ]
> +	switch (sts) {
> +	case AST2600_I2CS_SLAVE_PENDING | AST2600_I2CS_WAIT_RX_DMA |
> +		 AST2600_I2CS_SLAVE_MATCH | AST2600_I2CS_RX_DONE | AST2600_I2CS_STOP:
> +	case AST2600_I2CS_SLAVE_PENDING |
> +		 AST2600_I2CS_SLAVE_MATCH | AST2600_I2CS_RX_DONE | AST2600_I2CS_STOP:
> +	case AST2600_I2CS_SLAVE_PENDING |
> +		 AST2600_I2CS_SLAVE_MATCH | AST2600_I2CS_STOP:
> +		i2c_slave_event(i2c_bus->target, I2C_SLAVE_STOP, &value);
> +		fallthrough;
> +	case AST2600_I2CS_SLAVE_PENDING |
> +		 AST2600_I2CS_WAIT_RX_DMA | AST2600_I2CS_SLAVE_MATCH | AST2600_I2CS_RX=
_DONE:

Could this event ordering stall the target state machine?=20

For combined interrupts, this emits I2C_SLAVE_STOP before falling through to
emit I2C_SLAVE_WRITE_REQUESTED and I2C_SLAVE_WRITE_RECEIVED. This appears to
violate the API contract and might cause the backend to terminate the
transaction prematurely.

[ ... ]
> +		cmd =3D TARGET_TRIGGER_CMD;
> +		if (sts & AST2600_I2CS_RX_DONE) {
> +			target_rx_len =3D AST2600_I2CC_GET_RX_BUF_LEN(readl(i2c_bus->reg_base=
 +
> +							       AST2600_I2CC_BUFF_CTRL));

Should we bound check target_rx_len against i2c_bus->buf_size here?

It looks like up to 63 bytes can be read from the register without validati=
on,
which might allow reading beyond the mapped MMIO SRAM region, potentially
causing a synchronous external abort.

Also, looking at ast2600_i2c_controller_packet_irq(), it trusts the xfer_len
from this same register without bounding it against msg->len. Since this IRQ
handler zeroes BUFF_CTRL during an abort, races could lead to corrupted
lengths and out-of-bounds writes to the kernel msg->buf allocation.

> +			for (i =3D 0; i < target_rx_len; i++) {
> +				value =3D readb(i2c_bus->buf_base + 0x10 + i);
> +				i2c_slave_event(i2c_bus->target, I2C_SLAVE_WRITE_RECEIVED, &value);
> +			}
> +		}
[ ... ]
> +	case AST2600_I2CS_SLAVE_PENDING | AST2600_I2CS_RX_DONE |
> +	     AST2600_I2CS_WAIT_TX_DMA | AST2600_I2CS_STOP:
> +		target_rx_len =3D AST2600_I2CC_GET_RX_BUF_LEN(readl(i2c_bus->reg_base +
> +								 AST2600_I2CC_BUFF_CTRL));
> +		for (i =3D 0; i < target_rx_len; i++) {
> +			value =3D readb(i2c_bus->buf_base + 0x10 + i);
> +			i2c_slave_event(i2c_bus->target, I2C_SLAVE_WRITE_RECEIVED, &value);
> +		}
> +		i2c_slave_event(i2c_bus->target, I2C_SLAVE_STOP, &value);
> +		i2c_slave_event(i2c_bus->target, I2C_SLAVE_READ_REQUESTED, &value);
> +		writeb(value, i2c_bus->buf_base);

Does this MMIO access require 32-bit dword writes?=20

A comment in ast2600_i2c_setup_buff_tx() mentions that the controller's
buffer register supports dword writes only, but this code is using writeb().
Could this lead to ignored writes or bus faults?

> +		break;
[ ... ]
> +	if (cmd)
> +		writel(cmd, i2c_bus->reg_base + AST2600_I2CS_CMD_STS);
> +	writel(AST2600_I2CS_PKT_DONE, i2c_bus->reg_base + AST2600_I2CS_ISR);
> +	readl(i2c_bus->reg_base + AST2600_I2CS_ISR);

Will this fully clear the hardware status register?

AST2600_I2CS_ISR is typically a write-1-to-clear register. Since this only
writes AST2600_I2CS_PKT_DONE back, active bits like SLAVE_MATCH, STOP, or
RX_DONE remain uncleared in the hardware. This could leave the IRQ line
asserted, causing an interrupt storm, and potentially lock out future
controller transfers since ast2600_i2c_controller_xfer() checks for a non-z=
ero
ISR.

> +
> +	if ((sts & AST2600_I2CS_STOP) && !(sts & AST2600_I2CS_SLAVE_PENDING))
> +		WRITE_ONCE(i2c_bus->target_active, false);
> +}

Is it possible for target_active to remain true indefinitely here?=20

For standard coalesced interrupts, SLAVE_PENDING might be set alongside STO=
P,
meaning this condition fails. This would leave target_active true and
permanently block future master transfers.

[ ... ]
> +static int ast2600_i2c_reg_target(struct i2c_client *client)
> +{
> +	struct ast2600_i2c_bus *i2c_bus =3D i2c_get_adapdata(client->adapter);
> +	u32 cmd =3D TARGET_TRIGGER_CMD;
> +
> +	if (i2c_bus->target)
> +		return -EINVAL;
> +
> +	dev_dbg(i2c_bus->dev, "target addr %x\n", client->addr);

Should we check if the client address uses the I2C_CLIENT_TEN flag?

Without validation, the upper bits of a 10-bit address could overflow into =
the
adjacent ADDR2 hardware configuration bits when written to
AST2600_I2CS_ADDR_CTRL.

> +
> +	writel(0, i2c_bus->reg_base + AST2600_I2CS_ADDR_CTRL);
> +	writel(AST2600_I2CC_SLAVE_EN | readl(i2c_bus->reg_base + AST2600_I2CC_F=
UN_CTRL),
> +	       i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
> +
> +	writel(cmd, i2c_bus->reg_base + AST2600_I2CS_CMD_STS);
> +	i2c_bus->target =3D client;

Could there be a race condition here?=20

Setting AST2600_I2CC_SLAVE_EN enables the target hardware before
i2c_bus->target is assigned the client pointer. If a transaction starts in
this window, the interrupt handler might fire while target is still NULL,
skipping processing and causing an interrupt storm.

> +	/* Set target addr. */
> +	writel(client->addr | AST2600_I2CS_ADDR1_ENABLE,
> +	       i2c_bus->reg_base + AST2600_I2CS_ADDR_CTRL);
> +
> +	return 0;
> +}
> +
> +static int ast2600_i2c_unreg_target(struct i2c_client *client)
> +{
> +	struct ast2600_i2c_bus *i2c_bus =3D i2c_get_adapdata(client->adapter);
> +	u32 val;
> +
> +	/* Turn off target mode. */
> +	val =3D readl(i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
> +	writel(val & ~AST2600_I2CC_SLAVE_EN, i2c_bus->reg_base + AST2600_I2CC_F=
UN_CTRL);
> +	val =3D readl(i2c_bus->reg_base + AST2600_I2CS_ADDR_CTRL);
> +	writel(val & ~AST2600_I2CS_ADDR1_MASK, i2c_bus->reg_base + AST2600_I2CS=
_ADDR_CTRL);
> +
> +	synchronize_irq(i2c_bus->irq);
> +	i2c_bus->target =3D NULL;

Does this teardown ordering introduce a use-after-free race?

If an interrupt fires just after SLAVE_EN is disabled but before
synchronize_irq completes, the IRQ handler might run concurrently with
unregistration and pass the freed target pointer to the subsystem callback.

Additionally, the AST2600_I2CS_IER target interrupt enable bit is never
cleared. If a spurious or pending target interrupt fires after unregistrati=
on,
the handler will skip target processing, failing to clear the interrupt and
causing an interrupt storm.

Also, does target_active need to be cleared to false here? If a target is
unregistered while active, it appears controller mode transfers might be
permanently blocked.

> +
>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513-upstream_i=
2c-v29-0-fe9926964d55@aspeedtech.com?part=3D4
