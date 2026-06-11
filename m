Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF7B2E62B3
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781156786; cv=none; b=DwUrA18cNPMSP4drO5k/Wih3bCtPmAPXCtgAEkInEh4r9FNgePBaKt1O59q7hNeBQK1pSGeUc26hGk6iIq7LKSPRT0xyHsWGUYDresZrIvY84XiLyLPNilAT4eDR9l9OVd7/aGQTLM05rdi0hRowrhMFQdaSB311UyPBk0RNzRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781156786; c=relaxed/simple;
	bh=xRD6hZRTgRk5bU0aSXz2N5Lr8naHvAHxj6/JWVEfoZw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WL+XQmZoOqEfbrYfYxmo2+i/X7zo1QnbWKB7A+9Gy1O3OZJqSV+x4xoEeQD6UfZfbnLz2nBANhJ5XRryf7Y2Z0NkgHDL7pRamC3ATyXY/nOyM07fn8gGHGHPDakFbqqNGogEG2/9DEOWV1oXKJ/g3THQQCFQEmLNg//KQjfbbSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W3AQhYL+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W3AQhYL+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25BC51F00893;
	Thu, 11 Jun 2026 05:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781156784;
	bh=nUoVYtP/C7KuQmHHma8NQF+c6CF3t5BWiphimxuR9zk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=W3AQhYL+NTelJAv64TibONjawrTMHzYqMypqOQkLXNhjZt1GF4pya7BsNUdSPHfNp
	 LLm4IdUbllv/4YIuewNU94i8ygZyAQlTZHz9/Ig8MQcwmui0PHLn4R/kNu8BexDCqX
	 dHHASOvgvwd+REwzu9S2VR+3DMx4MGxbCF20MciGOgvvTRKMZsZD4yHf1cUnfXWEZa
	 e3YDRNfB7veVoFw9pfR1nL64blmEtjpw+QsWRLKiYmFcg9WY3toa12PEooEPJsR4SN
	 SlbBscjAxHPzdtoglh9v5VeYoSj+Rel3pdhhCUPzrszhcrKQOufjwHJjZjWwtVqLvQ
	 4+PxXbmXHx5RQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v32 4/5] i2c: ast2600: Add controller driver for AST2600
 new register set
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ryan Chen" <ryan_chen@aspeedtech.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260611-upstream_i2c-v32-4-b66eba921d01@aspeedtech.com>
References: <20260611-upstream_i2c-v32-4-b66eba921d01@aspeedtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jun 2026 05:46:23 +0000
Message-Id: <20260611054624.25BC51F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The driver fails to send a NAK on the last byte of an intermediate=
 read message, causing the slave to hold SDA low and block the subsequent R=
epeated Start.
- [High] The interrupt handler does not clear error status bits in the Writ=
e-1-to-Clear (W1C) ISR register, permanently wedging the controller after a=
 single error.
- [Medium] Bus recovery failure and other error interrupts are not enabled =
in the Interrupt Enable Register (IER), leading to needless blocking timeou=
ts.
--

commit 01c0588191421a92b3d96b7bc246be1fe0958d9f
Author: Ryan Chen <ryan_chen@aspeedtech.com>

i2c: ast2600: Add controller driver for AST2600 new register set

The AST2600 introduces a new I2C controller register layout, selectable
at runtime via global control registers. Compared to the legacy layout
used on AST2400/AST2500, the new layout separates controller (master)
and target (slave) registers and adds support for packet-based transfers

> diff --git a/drivers/i2c/busses/i2c-ast2600.c b/drivers/i2c/busses/i2c-as=
t2600.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-ast2600.c

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
Does this logic omit the NAK for intermediate read messages?

The CONTROLLER_TRIGGER_LAST_STOP flag (which applies the hardware NAK via=20
AST2600_I2CM_RX_CMD_LAST) is strictly tied to the absolute final message in
the array. If the transfer contains an intermediate read message, such as a
read before a Repeated Start, the last byte will be ACKed.

This will cause the slave to expect another byte and hold SDA low, leading =
to
an arbitration loss or bus hang when attempting the Repeated Start.

[ ... ]

> +static int ast2600_i2c_controller_irq(struct ast2600_i2c_bus *i2c_bus)
> +{
> +	u32 sts =3D readl(i2c_bus->reg_base + AST2600_I2CM_ISR);
> +	u32 ctrl;
> +
> +	sts &=3D ~AST2600_I2CM_SMBUS_ALERT;
> +
> +	if (sts & AST2600_I2CM_BUS_RECOVER_FAIL) {
> +		writel(AST2600_I2CM_BUS_RECOVER_FAIL, i2c_bus->reg_base + AST2600_I2CM=
_ISR);
> +		ctrl =3D readl(i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
> +		writel(0, i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
> +		writel(ctrl, i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
> +		WRITE_ONCE(i2c_bus->msgs, NULL);
> +		i2c_bus->cmd_err =3D -EPROTO;
> +		complete(&i2c_bus->cmd_complete);
> +		return 1;
> +	}
> +
> +	if (sts & AST2600_I2CM_BUS_RECOVER) {
> +		writel(AST2600_I2CM_BUS_RECOVER, i2c_bus->reg_base + AST2600_I2CM_ISR);
> +		WRITE_ONCE(i2c_bus->msgs, NULL);
> +		i2c_bus->cmd_err =3D 0;
> +		complete(&i2c_bus->cmd_complete);
> +		return 1;
> +	}
> +
> +	i2c_bus->cmd_err =3D ast2600_i2c_irq_err_to_errno(sts);
> +	if (i2c_bus->cmd_err) {
> +		WRITE_ONCE(i2c_bus->msgs, NULL);
> +		writel(AST2600_I2CM_PKT_DONE, i2c_bus->reg_base + AST2600_I2CM_ISR);
> +		complete(&i2c_bus->cmd_complete);
> +		return 1;
> +	}

[Severity: High]
Will this permanently wedge the controller after a single error?

When an error occurs, the error path explicitly writes only
AST2600_I2CM_PKT_DONE to the ISR. W1C error bits like AST2600_I2CM_ARBIT_LO=
SS
or AST2600_I2CM_TX_NAK are never written back and will remain set.

Because the error path calls complete() successfully, the timeout fallback
path that could reset the controller is bypassed. On the very next I2C
transaction, a new PKT_DONE interrupt will cause the handler to read the
stale error bits, instantly fail the transaction, and loop in this state.

The same issue appears to exist in ast2600_i2c_controller_packet_irq() for
bits like AST2600_I2CM_PKT_ERROR.

[ ... ]

> +static int ast2600_i2c_probe(struct platform_device *pdev)
> +{

[ ... ]

> +	ret =3D devm_request_irq(dev, i2c_bus->irq, ast2600_i2c_bus_irq, 0,
> +			       dev_name(dev), i2c_bus);
> +	if (ret < 0) {
> +		ret =3D dev_err_probe(dev, ret, "Unable to request irq %d\n",
> +				    i2c_bus->irq);
> +		goto err;
> +	}
> +
> +	writel(AST2600_I2CM_PKT_DONE | AST2600_I2CM_BUS_RECOVER,
> +	       i2c_bus->reg_base + AST2600_I2CM_IER);
> +
> +	ret =3D i2c_add_adapter(&i2c_bus->adap);

[Severity: Medium]
Are bus recovery failure interrupts intentionally left disabled?

The interrupt enable register is configured here without including the
AST2600_I2CM_BUS_RECOVER_FAIL bit. If a bus recovery attempt fails, the
hardware will assert the bit in the ISR, but the interrupt handler will
never be triggered.

This will cause the driver to needlessly block for the entire duration of
wait_for_completion_timeout() instead of handling the failure immediately.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260611-upstream_i=
2c-v32-0-b66eba921d01@aspeedtech.com?part=3D4
