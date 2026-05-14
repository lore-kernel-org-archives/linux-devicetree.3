Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4CFC3F4133
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 02:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778726856; cv=none; b=ednQ+3F+60Hin3XbH1pnfISE3l3sXWgLZ7P+vcHlqIi1RUn5vfd/1kqoq6iHqSxK+nRSOov54kfHbIYM51b3w7go6QJt6xO4J8MzmElxD+NOhyClng9tg+1aWAS4o5GfCXfKNECQ3pcfHgWgU9UVg41Wvh6FbVN5AM70LnanxoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778726856; c=relaxed/simple;
	bh=si5ZRKQH0ZBK2ZYQGNh6BPXEKriVujTIsTukmE7Vr5Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=p8oIuljC1sWM+hy5wxlaoyZXEoFCLIvfLgbEc8gv+KETP112+0X9ONAwA7TnR50ArtFulhoygPHwxnIzX1+nyR2raEBEAB8I4ts82GZsNyLY+FUEGBnQxo/B1gnn93Y5aCJZcFWAGwTSlUcHFfodiyODKgdI8szw1ss+G+pAa6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W6imFfHv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W6imFfHv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9196C19425;
	Thu, 14 May 2026 02:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778726856;
	bh=si5ZRKQH0ZBK2ZYQGNh6BPXEKriVujTIsTukmE7Vr5Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=W6imFfHvsPXDtrZQnVFuGoCURyFwqd3sPpyFj7hCajFUslASomJ9loLYYr3i90kac
	 MfNTSDCtBw9+sPr3eqQA1C8Ty6JkneFMHomfAaJx7hzjkMyw2jjMPFxuqyU8/7VU7P
	 qRLRG7c44G1qvCvAeNGIjDJdj7MecEUSs+XPH+v6GST6gY4yoG8elgYSN7cdVnYc/L
	 uaf9t5ZzrRdDm5uYqbX8/rb/kPFhuPf4rzPOqRthBLfPs9uSNBl2JkqngQ82mK4lYE
	 g3KQ5w/yVtfEVcoz1V6f4/1W67ZM2WMjXOTQshSEZFsRm3hXd7k6s+oOPprJ1Awr8P
	 VTApaLKH0TX7Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v29 3/4] i2c: ast2600: Add controller driver for
 AST2600 new register set
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ryan Chen" <ryan_chen@aspeedtech.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260513-upstream_i2c-v29-3-fe9926964d55@aspeedtech.com>
References: <20260513-upstream_i2c-v29-3-fe9926964d55@aspeedtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 02:47:35 +0000
Message-Id: <20260514024735.E9196C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 10 potential issue=
(s) to consider:
- [Critical] Zero-byte transfers cause out-of-bounds memory accesses and pr=
otocol violations.
- [Critical] Interrupt handler fails to clear status bits in a write-1-to-c=
lear register, causing IRQ storms.
- [High] Hardware is disabled in `remove()` before the I2C adapter is unreg=
istered.
- [High] Missing synchronization between the timeout path and the interrupt=
 handler causes a Use-After-Free.
- [High] Dynamic buffer size calculation conflicts with hardcoded RX offset=
, causing memory corruption.
- [High] Switch statement on bitmask register drops interrupts and causes t=
imeouts.
- [High] Arithmetic underflow in AC timing configuration corrupts the timin=
g register.
- [Medium] Hardware error interrupts are checked in ISR but never unmasked =
in the Interrupt Enable Register.
- [Medium] Zero-length SMBus block reads corrupt the length byte and trigge=
r redundant reads.
- [Medium] The I2C timeout device tree property is silently truncated due t=
o missing clamping.
--

commit 806e76a70ecd3287089b3f21eee416bd2f1e583e
Author: Ryan Chen <ryan_chen@aspeedtech.com>
Subject: i2c: ast2600: Add controller driver for AST2600 new register set

This commit adds a new I2C controller driver for the AST2600 SoC to support
its updated register layout and packet-based transfers. The driver is selec=
ted
at probe time based on the presence of the aspeed,global-regs property.

> diff --git a/drivers/i2c/busses/i2c-ast2600.c b/drivers/i2c/busses/i2c-as=
t2600.c
> new file mode 100644
> index 0000000000000..787ef6bd62442
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-ast2600.c
> @@ -0,0 +1,808 @@

[ ... ]

> +static void ast2600_i2c_ac_timing_config(struct ast2600_i2c_bus *i2c_bus)
> +{
[ ... ]
> +	baseclk_idx =3D min(baseclk_idx, 15);
> +	divisor =3D min(divisor, 32);
> +	scl_low =3D min(divisor * 9 / 16 - 1, 15);
> +	scl_high =3D (divisor - scl_low - 2) & GENMASK(3, 0);

If divisor evaluates to 1 or 0, divisor * 9 / 16 - 1 becomes -1.

Since -1 is compared against 15 using min(), it returns -1. When this is
assigned to the u32 scl_low variable, it underflows to 0xFFFFFFFF.

Could this completely overwrite bits 12 through 31 of the
AST2600_I2CC_AC_TIMING register when left-shifted and combined into data?

> +	data =3D (scl_high - 1) << 20 | scl_high << 16 | scl_low << 12 | basecl=
k_idx;
> +	if (i2c_bus->timeout) {
> +		data |=3D AST2600_I2CC_TOUTBASECLK(AST_I2C_TIMEOUT_CLK);
> +		data |=3D AST2600_I2CC_TTIMEOUT(i2c_bus->timeout);
> +	}

The AST2600_I2CC_TTIMEOUT macro applies a bitwise mask of GENMASK(4, 0).

If a large timeout is configured in the device tree, will this silently
truncate the value instead of clamping it?

[ ... ]

> +static int ast2600_i2c_setup_buff_tx(u32 cmd, struct ast2600_i2c_bus *i2=
c_bus)
> +{
[ ... ]
> +	if (xfer_len) {
> +		cmd |=3D AST2600_I2CM_TX_BUFF_EN | AST2600_I2CM_TX_CMD;
[ ... ]
> +		writel(AST2600_I2CC_SET_TX_BUF_LEN(xfer_len),
> +		       i2c_bus->reg_base + AST2600_I2CC_BUFF_CTRL);
> +	}
> +
> +	writel(cmd, i2c_bus->reg_base + AST2600_I2CM_CMD_STS);
> +
> +	return 0;
> +}

For a 0-byte write, this skips setting the TX_BUF_LEN register, leaving a
stale length in the hardware.

When the TX_ACK interrupt occurs, it will read this stale length:

ast2600_i2c_controller_packet_irq() {
    ...
    case AST2600_I2CM_TX_ACK:
        xfer_len =3D AST2600_I2CC_GET_TX_BUF_LEN(...);
        i2c_bus->controller_xfer_cnt +=3D xfer_len;
    ...
}

This causes i2c_bus->controller_xfer_cnt to exceed msg->len. On the
next setup call, xfer_len becomes negative, and the unsigned comparison
promotes it to a large value, forcing it to i2c_bus->buf_size.

Could this transmit arbitrary kernel memory out-of-bounds to the I2C bus?

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
> +	writel(AST2600_I2CC_SET_RX_BUF_LEN(xfer_len), i2c_bus->reg_base + AST26=
00_I2CC_BUFF_CTRL);

If xfer_len is 0, the AST2600_I2CC_SET_RX_BUF_LEN(0) macro calculates
((0 - 1) & 0x1F) << 16.

Does this command the hardware to read 32 bytes instead of 0, which would t=
hen
cause the interrupt handler to loop 32 times writing to msg->buf and overfl=
ow
the buffer?

[ ... ]

> +static void ast2600_i2c_controller_packet_irq(struct ast2600_i2c_bus *i2=
c_bus, u32 sts)
> +{
> +	struct i2c_msg *msg =3D &i2c_bus->msgs[i2c_bus->msgs_index];
> +	int xfer_len;
> +	int i;
> +
> +	sts &=3D ~AST2600_I2CM_PKT_DONE;
> +	writel(AST2600_I2CM_PKT_DONE, i2c_bus->reg_base + AST2600_I2CM_ISR);
> +	switch (sts) {

Is it safe to use a switch statement with exact-match case labels for a
register that can assert multiple independent bit flags simultaneously?

If the hardware reports a bit combination not explicitly listed here, it fa=
lls
through to the default case without calling complete(), which will cause the
active transfer to hang until it times out.

[ ... ]

> +	case AST2600_I2CM_RX_DONE:
> +	case AST2600_I2CM_RX_DONE | AST2600_I2CM_NORMAL_STOP:
[ ... ]
> +		if (msg->flags & I2C_M_RECV_LEN) {
> +			u8 recv_len =3D AST2600_I2CC_GET_RX_BUFF(readl(i2c_bus->reg_base
> +						       + AST2600_I2CC_STS_AND_BUFF));
> +			msg->len =3D min_t(unsigned int, recv_len, I2C_SMBUS_BLOCK_MAX);
> +			msg->len +=3D ((msg->flags & I2C_CLIENT_PEC) ? 2 : 1);
> +			msg->flags &=3D ~I2C_M_RECV_LEN;
> +			if (!recv_len)
> +				i2c_bus->controller_xfer_cnt =3D 0;
> +			else
> +				i2c_bus->controller_xfer_cnt =3D 1;

If recv_len is 0, i2c_bus->controller_xfer_cnt is set to 0 but msg->len
becomes 1.

Will this mismatch cause the end-of-transfer logic to incorrectly invoke
ast2600_i2c_setup_buff_rx() to read an additional byte, which then overwrit=
es
msg->buf[0] and corrupts the legitimate 0-length indicator?

[ ... ]

> +static int ast2600_i2c_controller_irq(struct ast2600_i2c_bus *i2c_bus)
> +{
> +	u32 sts =3D readl(i2c_bus->reg_base + AST2600_I2CM_ISR);

This function selectively clears PKT_DONE, BUS_RECOVER_FAIL, and BUS_RECOVE=
R.

Since the AST2600 I2CM_ISR is a write-1-to-clear register, shouldn't it also
write back and clear the other active status bits like TX_ACK, RX_DONE,
NORMAL_STOP, PKT_ERROR, and ARBIT_LOSS?

Leaving these bits asserted in the hardware register could cause the interr=
upt
handler to execute continuously in an IRQ storm.

[ ... ]

> +static int ast2600_i2c_controller_xfer(struct i2c_adapter *adap, struct =
i2c_msg *msgs, int num)
> +{
[ ... ]
> +	timeout =3D wait_for_completion_timeout(&i2c_bus->cmd_complete, i2c_bus=
->adap.timeout);
> +	if (timeout =3D=3D 0) {
[ ... ]
> +		ret =3D -ETIMEDOUT;
> +	} else {
> +		ret =3D i2c_bus->cmd_err;
> +	}
> +
> +	dev_dbg(i2c_bus->dev, "bus%d-m: %d end\n", i2c_bus->adap.nr, i2c_bus->c=
md_err);
> +
> +controller_out:
> +	return ret;
> +}

When wait_for_completion_timeout expires, this function returns -ETIMEDOUT
without synchronizing with the interrupt handler.

If a delayed or concurrent interrupt fires and the caller has already freed
or reused the msgs array, could ast2600_i2c_controller_packet_irq
dereference the invalid array or write to msg->buf, leading to a
use-after-free?

[ ... ]

> +static int ast2600_i2c_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	buf_base =3D devm_platform_get_and_ioremap_resource(pdev, 1, &res);
> +	if (IS_ERR(buf_base))
> +		return dev_err_probe(dev, PTR_ERR(buf_base), "Missing buffer resource\=
n");
> +	i2c_bus->buf_base =3D buf_base;
> +	i2c_bus->buf_size =3D resource_size(res) / 2;

This calculates buf_size dynamically. For transmission, the driver writes
up to buf_size starting at buf_base + 0.

However, for reception, the read offset is hardcoded to 0x10:

ast2600_i2c_controller_packet_irq() {
    ...
    case AST2600_I2CM_RX_DONE:
        for (i =3D 0; i < xfer_len; i++)
            msg->buf[...] =3D readb(i2c_bus->buf_base + 0x10 + i);
    ...
}

If the Device Tree provides a resource larger than 32 bytes, a transmission
might write past offset 0x0F. Does this completely overwrite the RX buffer
expected at 0x10?

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

This writes only PKT_DONE and BUS_RECOVER to the Interrupt Enable Register.

Since error interrupts like BUS_RECOVER_FAIL, SCL_LOW_TO, ABNORMAL, and
ARBIT_LOSS are not enabled, will the controller silently hang until the
1-second software timeout expires when these hardware errors occur?

> +
> +	ret =3D devm_i2c_add_adapter(dev, &i2c_bus->adap);
> +	if (ret)
> +		goto err;
> +
> +	return 0;

[ ... ]

> +static void ast2600_i2c_remove(struct platform_device *pdev)
> +{
> +	struct ast2600_i2c_bus *i2c_bus =3D platform_get_drvdata(pdev);
> +
> +	/* Disable everything. */
> +	writel(0, i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
> +	writel(0, i2c_bus->reg_base + AST2600_I2CM_IER);
> +}

By using devm_i2c_add_adapter(), the adapter unregistration is deferred
until the devres cleanup phase, which runs after ast2600_i2c_remove()
returns.

Because remove() completely disables the hardware by writing 0 to the
FUN_CTRL and IER registers, if any I2C client device attempts to communicate
during its own remove() callback (triggered during i2c_del_adapter()),
will the transaction fail or hang because the underlying controller is
already turned off?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513-upstream_i=
2c-v29-0-fe9926964d55@aspeedtech.com?part=3D3
