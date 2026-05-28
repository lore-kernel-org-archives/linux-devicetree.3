Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47AF43B47D7
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 09:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779961571; cv=none; b=XLMuPcIn85BCgzubleRMuvinwJjx2gLtpBRrG+BJB4is1aKFduVvm7rzoaSM+9aZ7sxj5BrDray1cC2y0mJq5CkY6b/jZep531ltISCVZ8I7hoRIQ4TJkeBl2WoJ46HK69MDIjsjRAX7U7JV67E/0Mo6O9GFAWO8s/DyuB/Bv1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779961571; c=relaxed/simple;
	bh=CSzmclSTU6fVJ+aJDLHzAu2365vs3rUMFPsswkmbtMk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=D+RtOx1R6Y4o2gvBJTCinnjd2JSL6WuhuzNgGNcCDEPjR0XE4sjXM8GUTIvdGazzc2eFfO5c8J/m0gTgqLBw8y1wGwyVcOD2ev52VcFyHNyWFRnP9HCCjUuSmFGbEBwrQVHanSK5qjqjycyxfq+rLSadYuJ4CLtLiSlSMXGHhuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lIXjUULL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lIXjUULL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8EE11F000E9;
	Thu, 28 May 2026 09:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779961570;
	bh=vrySqI4E/vxVL1HFDYQ/IZkDNdCFbYkFI47iXit5XIY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lIXjUULLBnrY3IDx0JD3r5kSdXPNGR6QSRY50dKndiyRuJGigSQKl0rwoZkxxzGHW
	 ch39RYlo4KnWYynPWWM0Dv1HBdlyfpO5kYLc07Il8ihcao/pemsH1L4Q1LPK2yQ+tH
	 ErQ1qMbT48RgNt3I+3t5ddxHhqtj51nPLIcshK/NjS9SNV0jBZRQ0oPO+njKR4T/7v
	 5RdFp25d+2QwCr309otzI+CRw11IEvsAA8eHcrILoLzNimkL7jRZTSUVgOn1r5O4Qd
	 N79iTduZhCXaJzXmaR/g979IiWKZHOYpC7XsCgvdbJLnw6VAoikc1KsNjTUAjdClW6
	 reBfdBMI/FfSg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v30 5/5] i2c: ast2600: Add target mode support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ryan Chen" <ryan_chen@aspeedtech.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260528-upstream_i2c-v30-5-5d4f9adc3530@aspeedtech.com>
References: <20260528-upstream_i2c-v30-5-5d4f9adc3530@aspeedtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 28 May 2026 09:46:09 +0000
Message-Id: <20260528094609.D8EE11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 10 potential issue=
(s) to consider:

New issues:
- [Critical] Aborting an in-flight controller transfer from the target IRQ =
handler races with controller IRQs, leading to a Use-After-Free.
- [Critical] A Time-Of-Check to Time-Of-Use (TOCTOU) race in `ast2600_i2c_c=
ontroller_xfer` allows target hardware to corrupt the shared I2C buffer.
- [High] Invalid I2C Slave event ordering: STOP events are emitted before W=
RITE_REQUESTED and WRITE_RECEIVED data events.
- [High] The `target_active` flag is permanently leaked as true under speci=
fic hardware interrupt combinations, deadlocking controller transfers.
- [High] Target interrupts are permanently disabled if a target is unregist=
ered and later re-registered.
- [High] A specific target ISR STOP case stalls the I2C target state machin=
e by failing to trigger the hardware command.
- [High] Unhandled target interrupt states fail to re-arm the hardware, per=
manently hanging the I2C bus.
- [High] Checking the raw ISR register to block controller transfers perman=
ently bricks the controller due to uncleared W1C bits.
- [Medium] Target interrupts are unconditionally enabled even when no targe=
t is registered.

Pre-existing issues:
- [High] In controller mode, the received `xfer_len` is not validated again=
st the remaining bounds of the `msg->buf` array.
--

commit fdd43bfe0f52b1390eb013eb7a0a2e7b1131f43e
Author: Ryan Chen <ryan_chen@aspeedtech.com>

i2c: ast2600: Add target mode support

Add target mode support to the AST2600 I2C driver. This complements the=20
existing controller-mode support, enabling dual-role capability.

> diff --git a/drivers/i2c/busses/i2c-ast2600.c b/drivers/i2c/busses/i2c-as=
t2600.c
> index a06d0483865ed..7e609fdfa1a19 100644
> --- a/drivers/i2c/busses/i2c-ast2600.c
> +++ b/drivers/i2c/busses/i2c-ast2600.c
[ ... ]
> @@ -337,6 +342,249 @@ static int ast2600_i2c_recover_bus(struct ast2600_i=
2c_bus *i2c_bus)
>  	return ret;
>  }
> =20
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +static void ast2600_i2c_target_packet_buff_irq(struct ast2600_i2c_bus *i=
2c_bus, u32 sts)
> +{
> +	u8 value =3D 0;
> +	int target_rx_len =3D 0;
> +	u32 cmd =3D 0;
> +	int i;
> +
> +	/* due to controller target is common buffer, need force the master sto=
p not issue */
> +	if (readl(i2c_bus->reg_base + AST2600_I2CM_CMD_STS) & GENMASK(15, 0)) {
> +		writel(0, i2c_bus->reg_base + AST2600_I2CM_CMD_STS);
> +		writel(0, i2c_bus->reg_base + AST2600_I2CM_IER);
> +		writel(readl(i2c_bus->reg_base + AST2600_I2CM_ISR),
> +		       i2c_bus->reg_base + AST2600_I2CM_ISR);
> +		i2c_bus->cmd_err =3D -EBUSY;
> +		writel(0, i2c_bus->reg_base + AST2600_I2CC_BUFF_CTRL);
> +		complete(&i2c_bus->cmd_complete);
> +		writel(AST2600_I2CM_PKT_DONE | AST2600_I2CM_BUS_RECOVER,
> +		       i2c_bus->reg_base + AST2600_I2CM_IER);
> +	}

[Severity: Critical]
Does calling complete() here race with re-enabling the controller interrupt=
s?

If the controller thread wakes up immediately and frees the locally allocat=
ed
msgs array, could a subsequent delayed hardware interrupt cause
ast2600_i2c_controller_packet_irq() to dereference the freed msgs pointer?

> +
> +	/* Handle i2c target timeout condition */
> +	if (sts & AST2600_I2CS_INACTIVE_TO) {
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

[Severity: High]
Does falling through here emit events in the wrong order?

The I2C slave API expects I2C_SLAVE_STOP to be the final event indicating
the end of a transaction. If we fall through to the block that issues
I2C_SLAVE_WRITE_REQUESTED and I2C_SLAVE_WRITE_RECEIVED, could this corrupt
the state machine of backend devices?

[ ... ]
> +	case AST2600_I2CS_SLAVE_PENDING | AST2600_I2CS_RX_DONE |
> +	     AST2600_I2CS_WAIT_TX_DMA | AST2600_I2CS_STOP:
> +		target_rx_len =3D AST2600_I2CC_GET_RX_BUF_LEN(readl(i2c_bus->reg_base +
> +						       AST2600_I2CC_BUFF_CTRL));
> +		for (i =3D 0; i < target_rx_len; i++) {
> +			value =3D readb(i2c_bus->buf_base + i2c_bus->buf_size + i);
> +			i2c_slave_event(i2c_bus->target, I2C_SLAVE_WRITE_RECEIVED, &value);
> +		}
> +		i2c_slave_event(i2c_bus->target, I2C_SLAVE_STOP, &value);
> +		i2c_slave_event(i2c_bus->target, I2C_SLAVE_READ_REQUESTED, &value);
> +		writel(value, i2c_bus->buf_base);
> +		break;

[Severity: High]
Is this case missing an assignment to cmd?

Since cmd defaults to 0 and is not updated here, the driver will not write
a command to AST2600_I2CS_CMD_STS. Could this leave the hardware state mach=
ine
hanging or stretching the clock indefinitely?

[ ... ]
> +	default:
> +		dev_dbg(i2c_bus->dev, "unhandled target isr case %x, sts %x\n", sts,
> +			readl(i2c_bus->reg_base + AST2600_I2CC_STS_AND_BUFF));
> +		break;
> +	}
> +
> +	if (cmd)
> +		writel(cmd, i2c_bus->reg_base + AST2600_I2CS_CMD_STS);

[Severity: High]
Does an unhandled interrupt state hang the I2C bus?

If we hit the default case, cmd remains 0. Without writing a valid command
to acknowledge and proceed, will the hardware remain paused and stretch
the clock?

> +
> +	writel(AST2600_I2CS_PKT_DONE, i2c_bus->reg_base + AST2600_I2CS_ISR);
> +	readl(i2c_bus->reg_base + AST2600_I2CS_ISR);
> +
> +	if ((sts & AST2600_I2CS_STOP) && !(sts & AST2600_I2CS_SLAVE_PENDING))
> +		WRITE_ONCE(i2c_bus->target_active, false);
> +}

[Severity: High]
Can the target_active flag become permanently stuck as true?

The switch statement above explicitly handles combined interrupt cases where
both AST2600_I2CS_STOP and AST2600_I2CS_SLAVE_PENDING are set. In those
cases, target_active will remain true.

Since a STOP occurred, no further interrupts will arrive for this transacti=
on.
Will this cause all future controller transfers to permanently return -EBUS=
Y?

> +
> +static int ast2600_i2c_target_irq(struct ast2600_i2c_bus *i2c_bus)
> +{
> +	u32 ier =3D readl(i2c_bus->reg_base + AST2600_I2CS_IER);
> +	u32 isr =3D readl(i2c_bus->reg_base + AST2600_I2CS_ISR);
[ ... ]
> +	isr &=3D ~(AST2600_I2CS_ADDR_INDICATE_MASK);
> +
> +	if (AST2600_I2CS_ADDR1_NAK & isr)
> +		isr &=3D ~AST2600_I2CS_ADDR1_NAK;
> +
> +	if (AST2600_I2CS_ADDR2_NAK & isr)
> +		isr &=3D ~AST2600_I2CS_ADDR2_NAK;

[Severity: High]
Are these Write-1-to-Clear (W1C) bits being left set in the hardware?

The bits are masked out of the local isr variable but are never written back
to AST2600_I2CS_ISR to clear them in hardware. Because they remain set,
will later checks against AST2600_I2CS_ISR always evaluate to true, blocking
all future controller transfers?

[ ... ]
>  	case AST2600_I2CM_RX_DONE:
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +		/*
> +		 * Workaround for controller/target packet mode enable rx done stuck i=
ssue
> +		 * When controller go for first read (RX_DONE), target mode will also =
effect
> +		 * Then controller will send nack, not operate anymore.
> +		 */
> +		if (readl(i2c_bus->reg_base + AST2600_I2CS_CMD_STS) & AST2600_I2CS_PKT=
_MODE_EN) {
> +			u32 target_cmd =3D readl(i2c_bus->reg_base + AST2600_I2CS_CMD_STS);
> +
> +			writel(0, i2c_bus->reg_base + AST2600_I2CS_CMD_STS);
> +			writel(target_cmd, i2c_bus->reg_base + AST2600_I2CS_CMD_STS);
> +		}
> +		fallthrough;
> +#endif
>  	case AST2600_I2CM_RX_DONE | AST2600_I2CM_NORMAL_STOP:
>  		xfer_len =3D AST2600_I2CC_GET_RX_BUF_LEN(readl(i2c_bus->reg_base +
>  							     AST2600_I2CC_BUFF_CTRL));

[Severity: High]
This is a pre-existing issue, but does xfer_len need bounds checking here?

The xfer_len value is read directly from hardware and used unconditionally =
in
the copy loop below. If the hardware reports a length longer than the
remaining message size, could it overflow the msg->buf array?

[ ... ]
> @@ -599,12 +867,31 @@ static int ast2600_i2c_controller_xfer(struct i2c_a=
dapter *adap, struct i2c_msg
>  			return ret;
>  	}
> =20
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +	if (i2c_bus->target_active)
> +		return -EBUSY;
> +	/*
> +	 * Controller and target share the same buffer register. A target
> +	 * transaction can update buffer state asynchronously via IRQ, so block
> +	 * controller transfers while target is active to avoid buffer corrupti=
on.
> +	 */
> +	writel(0, i2c_bus->reg_base + AST2600_I2CS_IER);
> +	if (readl(i2c_bus->reg_base + AST2600_I2CS_ISR) || i2c_bus->target_acti=
ve) {
> +		writel(AST2600_I2CS_PKT_DONE, i2c_bus->reg_base + AST2600_I2CS_IER);
> +		return -EBUSY;
> +	}
> +#endif
> +
>  	i2c_bus->cmd_err =3D 0;
>  	i2c_bus->msgs =3D msgs;
>  	i2c_bus->msgs_index =3D 0;
>  	i2c_bus->msgs_count =3D num;
>  	reinit_completion(&i2c_bus->cmd_complete);
>  	ret =3D ast2600_i2c_do_start(i2c_bus);

[Severity: Critical]
Is there a race condition between software checks and the hardware state ma=
chine?

Disabling CPU interrupts via AST2600_I2CS_IER does not pause the autonomous
hardware state machine since AST2600_I2CC_SLAVE_EN is still active. Can an
external I2C master address the target right after the check, causing the
hardware to overwrite the shared buffer while ast2600_i2c_do_start() is
preparing the master transfer?

[ ... ]
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +static int ast2600_i2c_reg_target(struct i2c_client *client)
> +{
> +	struct ast2600_i2c_bus *i2c_bus =3D i2c_get_adapdata(client->adapter);
> +	u32 cmd =3D TARGET_TRIGGER_CMD;
[ ... ]
> +	writel(cmd, i2c_bus->reg_base + AST2600_I2CS_CMD_STS);
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
> +	writel(0, i2c_bus->reg_base + AST2600_I2CS_IER);

[Severity: High]
Will target interrupts remain permanently disabled if a target is unbound a=
nd
then rebound?

The ast2600_i2c_unreg_target() function disables target interrupts, but
ast2600_i2c_reg_target() does not re-enable them. Does this break target
functionality on subsequent registrations?

[ ... ]
> @@ -784,6 +1138,9 @@ static int ast2600_i2c_probe(struct platform_device =
*pdev)
> =20
>  	writel(AST2600_I2CM_PKT_DONE | AST2600_I2CM_BUS_RECOVER,
>  	       i2c_bus->reg_base + AST2600_I2CM_IER);
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +	writel(AST2600_I2CS_PKT_DONE, i2c_bus->reg_base + AST2600_I2CS_IER);
> +#endif
> =20
>  	ret =3D i2c_add_adapter(&i2c_bus->adap);

[Severity: Medium]
Is it safe to unconditionally enable target interrupts here?

Since i2c_bus->target is NULL until a target is registered, ast2600_i2c_bus=
_irq
will ignore target interrupts. If the hardware asserts an interrupt before
a target is bound, could this lead to an unhandled interrupt storm?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260528-upstream_i=
2c-v30-0-5d4f9adc3530@aspeedtech.com?part=3D5
