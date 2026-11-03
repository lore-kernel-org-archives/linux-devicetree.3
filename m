Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793675496;
	b=C9A1LHR1aXCNzyx/WQLj0esX8S1VxzP4Jfya8cAp7l9ikvNkXaVOYqnYDBxY60uy4XCR
	 9nTXjCpn13K3ypl58zt/WVcrLVSvS8trbMz2b8aE6kqc7gAB5plI0aKJ5oYM9+uaUinLH
	 /Sle3TB4QzhPw/LW7WrmVP55gn8gPIN3K9TYzkKtMAYc7gbkZOcUpp/8DxvAJ9i/s0v39
	 zex9w9VzU7Ug/70RzCU5EZ9gEu2tzFElTNz9wukBED9i4MajMT12nefd0XRZYu9EFV3Qq
	 sR3Ng73LRNKh8JOuK087OfNNmtBN7V/9nZCpEbsjr4xw+TfcXH5DZjOZY0+shmXdHYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793675496;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=34lnL3/2E9Q5qWjt9BFmVHAcQcUIN41uKsm9o3mcoSM=;
	b=fmy4ELq6IHoow+wf0x7SynHz+ype6nDdkY8MjuR86kpWMgUR15CipPRoXePhxfCoT5fl
	 79EIWZJHsfR2spya0Y4UBvL9NfxcRTdNN8f6O2KCnEKPdCQ02+8XVIwecIn/D+Qzpv7Xf
	 PwUM4q8KvmeeqMmusROGNAnJTJ2JSoC41X5mTA2ETzFBkDiD0W1hAhBW8RRsZ9BCZNE+p
	 rzXXsX3/iNiClSlJRWT49UiexqwJZyDrR6a8DRqPAp7OHZLm4bIv9SioAR9suraBwcFNv
	 +zS/WCNE1HXtFsld6LChveBTvTiwBgcNshDtdqjjEQ0XX3cDLdXh55RMeqX1wrt7Gnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BTBiybBE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA04D606A324
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 03:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BTBiybBE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1014A1F000C1;
	Tue,  3 Nov 2026 03:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793675495;
	bh=34lnL3/2E9Q5qWjt9BFmVHAcQcUIN41uKsm9o3mcoSM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BTBiybBEn7bRifcH6jStCBbkTpuDM3ENzXX45ng2tJ8dDDTcLiv1rnfiNARW5EgJg
	 /BjyS9kNqZ8wdtdEFRabBYcRdmBNH1Hn/4CIU4ygjLsBb7iszrfu7t/aGdFoDSJLWH
	 75gu2bI4KfprtTDuU7h19M8xSik7Ep0mGidsiFeEbJPT0KFsjzzvuLauJzyGld/s1b
	 8wtGk0Cjbb4ezxFTFSCj1UJPjj/2Ejo2TGIafJxtHresLT9lEsTH/6h73BMogtMOsB
	 VwIPmJKBfcSQY74LpLav3KtflJn/g+oesJ+OUr2OjDn10hZgNgo6abvhrp4/AJFkra
	 NpYzg8qvbpIXw==
Message-ID: <sashiko-outbox-194497@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/2] i2c: amlogic: Add Amlogic A9 I2C controller
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xianwei Zhao" <xianwei.zhao@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20261103-a9-i2c-v5-2-86f2dcd179d8@amlogic.com>
References: <20261103-a9-i2c-v5-0-86f2dcd179d8@amlogic.com>
 <20261103-a9-i2c-v5-2-86f2dcd179d8@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 03:11:34 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] i2c: amlogic: unstopped hw transfer on timeout in aml_i2c_xfer_msg=
()
- [Medium] i2c: amlogic-a9: transfer started before IRQ setup in aml_i2c_do=
_start()
- [Medium] i2c: amlogic-a9: missed completion in aml_i2c_irq() on multi-chu=
nk reads
- [Low] i2c: amlogic: use of deprecated master_xfer in aml_i2c_algorithm
- [Low] i2c: amlogic-a9: off-by-one minimum divider check in aml_i2c_set_cl=
k_div()
--

commit 0ce6cfd604c34b299eddac3e8d6a46653816e69c
Author: Junyi Zhao <junyi.zhao@amlogic.com>

i2c: amlogic: Add Amlogic A9 I2C controller driver

This commit adds a driver for the I2C controller found on Amlogic A9 SoCs,
along with the corresponding Kconfig, Makefile, and MAINTAINERS entries.

> diff --git a/drivers/i2c/busses/i2c-amlogic-a9.c b/drivers/i2c/busses/i2c=
-amlogic-a9.c
> new file mode 100644
> index 0000000000000..d7f88d6feb05b
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-amlogic-a9.c
> @@ -0,0 +1,431 @@

[ ... ]

> +/*
> + * SCL =3D clk/b_ratio. if b_ratio<=3D8, SCL =3D clk/8
> + */
> +static int aml_i2c_set_clk_div(struct aml_i2c *i2c)
> +{
> +	unsigned long clk_rate =3D i2c->clk_rate;
> +	unsigned int div;
> +
> +	div =3D DIV_ROUND_UP(clk_rate, i2c->frequency);
> +
> +	/* clock divider has 12 bits */
> +	if (div >=3D (1 << 12)) {
> +		dev_err(i2c->dev, "requested bus frequency too low\n");
> +		return -EINVAL;
> +	} else if (div <=3D 8) {
> +		dev_err(i2c->dev, "requested bus frequency too high\n");
> +		return -EINVAL;
> +	}

[Severity: Low]
In aml_i2c_set_clk_div(), the comment notes that b_ratio <=3D 8 yields
SCL =3D clk / 8. Since div =3D=3D 8 is the minimum divider that produces th=
e exact
clk / 8 frequency without clamping, should this check be div < 8 rather than
div <=3D 8 so that a valid divider of 8 is not rejected with -EINVAL?

[ ... ]

> +static irqreturn_t aml_i2c_irq(int irqno, void *dev_id)
> +{
> +	struct aml_i2c *i2c =3D dev_id;
> +	u8 *buf =3D NULL;
> +	u32 rd_len, i;
> +	u32 rd_val;
> +	u32 irq_state;
> +
> +	spin_lock(&i2c->lock);
> +
> +	irq_state =3D readl(i2c->regs + REG_CFG_IRQ_STATE);
> +	if (i2c->state =3D=3D A9_STATE_IDLE) {
> +		dev_warn(i2c->dev, "i2c irq triggered abnormally, irq_state:0x%x,irq_e=
n:0x%x\n",
> +			 irq_state, readl(i2c->regs + REG_CFG_IRQ_ENABLE));
> +		goto complete_irq_out;
> +	}
> +
> +	if (irq_state & A9_TRANS_ERROR) {
> +		i2c->error =3D -ENXIO;
> +		goto complete_irq_out;
> +	}
> +
> +	switch (i2c->state) {
> +	case A9_STATE_READ:
> +		buf =3D i2c->msg->buf;
> +		rd_len =3D min(i2c->msg->len - i2c->pos, A9_I2C_FIFO_DEPTH);
> +		for (i =3D 0; i < rd_len; i++) {
> +			rd_val =3D readl(i2c->regs + REG_CFG_RX);
> +			buf[i2c->pos++] =3D rd_val & TX_RX_DATA;
> +		}
> +		/* Rx must clear thresh after read fifo */
> +		clear_irq_status(i2c, A9_RX_THRESH_READ);
> +		break;
> +	case A9_STATE_WRITE:
> +		aml_i2c_prepare_xfer(i2c, A9_FIFO_FILL_HALF);
> +		if (i2c->pos =3D=3D i2c->msg->len)
> +			aml_i2c_set_mask(i2c, REG_CFG_IRQ_ENABLE, A9_TX_THRESH_WRITE, 0);
> +		/* Tx must clear thresh after write fifo */
> +		clear_irq_status(i2c, A9_TX_THRESH_WRITE);
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	if (!(irq_state & A9_TRANS_DONE) ||
> +	    (i2c->state =3D=3D A9_STATE_READ && i2c->pos < i2c->msg->len))
> +		goto irq_trans_out;
> +
> +complete_irq_out:
> +	i2c->state =3D A9_STATE_IDLE;
> +	reset_fifo_pos(i2c);
> +	complete(&i2c->done);
> +	aml_i2c_set_mask(i2c, REG_CFG_IRQ_ENABLE, A9_RX_THRESH_READ | A9_TX_THR=
ESH_WRITE, 0);
> +	clear_irq_status(i2c, IRQ_ALL_MASK);
> +irq_trans_out:
> +	spin_unlock(&i2c->lock);
> +
> +	return IRQ_HANDLED;
> +}

[Severity: Medium]
As reported by Sashiko on v2 [1], can multi-chunk I2C read transfers
(msg->len > A9_I2C_FIFO_DEPTH) miss the transfer completion interrupt in
aml_i2c_irq()?

Unlike A9_STATE_WRITE, which disables A9_TX_THRESH_WRITE once the final byt=
es
are queued, A9_STATE_READ leaves A9_RX_THRESH_READ enabled and samples
REG_CFG_IRQ_STATE only once upon entry.

When msg->len is a multiple of 32 (for example, 64), the 32nd byte of the
final chunk triggers A9_RX_THRESH_READ before the I2C STOP condition finish=
es
on the bus. If A9_PHY_DONE asserts while aml_i2c_irq() is draining those 32
bytes from REG_CFG_RX and before A9_RX_THRESH_READ is cleared, the interrupt
line remains continuously asserted without generating a new rising edge, wh=
ile
aml_i2c_irq() takes goto irq_trans_out because the initial irq_state snapsh=
ot
did not have A9_TRANS_DONE set.

Similarly, if both A9_RX_THRESH_READ and A9_PHY_DONE are set when
aml_i2c_irq() enters with more than 32 bytes remaining, aml_i2c_irq() drains
only 32 bytes, clears only A9_RX_THRESH_READ, and exits via irq_trans_out w=
ith
i2c->pos < i2c->msg->len. Because A9_PHY_DONE is already asserted and fewer
than 32 bytes remain to re-trigger A9_RX_THRESH_READ, no further interrupt =
edge
occurs, leaving wait_for_completion_timeout() in aml_i2c_xfer_msg() to time
out with -ETIMEDOUT.

> +
> +static void aml_i2c_do_start(struct aml_i2c *i2c, struct i2c_msg *msg)
> +{
> +	unsigned int reg_val;
> +	unsigned int trans_len;
> +
> +	trans_len =3D msg->len;
> +	reg_val =3D (unsigned int)(((msg->addr & 0x7f) << START_SADDR_SHIFT) |
> +				((msg->flags & I2C_M_RD) ? START_READ : 0) |
> +				((trans_len & 0xfff) << START_LEN_SHIFT) | START_START);
> +	aml_i2c_set_mask(i2c, REG_CFG_START,
> +			 START_START | START_SLAVE_ADDR | START_READ | START_LEN, reg_val);
> +	clear_irq_status(i2c, IRQ_ALL_MASK);
> +	/* enable thresh mode */
> +	if (trans_len > A9_I2C_FIFO_DEPTH) {
> +		reg_val =3D (msg->flags & I2C_M_RD) ? A9_RX_THRESH_READ : A9_TX_THRESH=
_WRITE;
> +		aml_i2c_set_mask(i2c, REG_CFG_IRQ_ENABLE,
> +				 A9_RX_THRESH_READ | A9_TX_THRESH_WRITE, reg_val);
> +	}
> +}

[Severity: Medium]
As reported by Sashiko on v2 [2], in aml_i2c_do_start(), setting START_START
in REG_CFG_START begins the hardware transfer while A9_ENABLE_IRQ_BIT
(A9_NCK_ERROR | A9_PHY_DONE) is already enabled in REG_CFG_IRQ_ENABLE, befo=
re
clear_irq_status(i2c, IRQ_ALL_MASK) is called and before A9_RX_THRESH_READ =
or
A9_TX_THRESH_WRITE is enabled in REG_CFG_IRQ_ENABLE.

If execution is delayed between writing REG_CFG_START and writing
REG_CFG_IRQ_STATE (for example, due to task preemption under CONFIG_PREEMPT=
_RT,
vCPU preemption, or NMI/FIQ latency), the controller can assert A9_NCK_ERROR
on an address NACK or A9_PHY_DONE on a short transfer, which is then wiped =
out
by clear_irq_status(i2c, IRQ_ALL_MASK) before aml_i2c_irq() acquires i2c->l=
ock
and reads REG_CFG_IRQ_STATE. When aml_i2c_irq() runs, it sees
!(irq_state & A9_TRANS_DONE) and exits via irq_trans_out without completing
i2c->done, causing aml_i2c_xfer_msg() to time out.

Should the interrupt status be cleared and the threshold interrupts enabled
before asserting START_START in REG_CFG_START?

> +
> +static int aml_i2c_xfer_msg(struct aml_i2c *i2c, struct i2c_msg *msg, bo=
ol last)
> +{
> +	unsigned long time_left, flags;
> +
> +	i2c->msg =3D msg;
> +	i2c->pos =3D 0;
> +	i2c->error =3D 0;
> +
> +	spin_lock_irqsave(&i2c->lock, flags);
> +	i2c->state =3D (msg->flags & I2C_M_RD) ? A9_STATE_READ : A9_STATE_WRITE;
> +	aml_i2c_prepare_xfer(i2c, A9_FIFO_FILL_FULL);
> +	reinit_completion(&i2c->done);
> +
> +	aml_i2c_set_mask(i2c, REG_CFG_BUS, BUS_NO_STOP, (last ? 0 : BUS_NO_STOP=
));
> +
> +	/* Start the transfer */
> +	aml_i2c_do_start(i2c, msg);
> +	spin_unlock_irqrestore(&i2c->lock, flags);
> +
> +	time_left =3D msecs_to_jiffies(I2C_TIMEOUT_MS);
> +	time_left =3D wait_for_completion_timeout(&i2c->done, time_left);
> +
> +	/*
> +	 * Protect access to i2c struct and registers from interrupt
> +	 * handlers triggered by a transfer terminated after the
> +	 * timeout period
> +	 */
> +
> +	if (!time_left) {
> +		guard(spinlock_irqsave)(&i2c->lock);
> +		i2c->state =3D A9_STATE_IDLE;
> +		aml_i2c_set_mask(i2c, REG_CFG_IRQ_ENABLE,
> +				 A9_RX_THRESH_READ | A9_TX_THRESH_WRITE, 0);
> +		clear_irq_status(i2c, IRQ_ALL_MASK);
> +		reset_fifo_pos(i2c);
> +		return -ETIMEDOUT;
> +	}
> +
> +	return i2c->error;
> +}

[Severity: High]
As reported by Sashiko on v2 [3], when wait_for_completion_timeout() expires
(!time_left) in aml_i2c_xfer_msg(), this timeout path sets i2c->state to
A9_STATE_IDLE, disables the threshold IRQs, clears REG_CFG_IRQ_STATE, and
calls reset_fifo_pos(i2c), but never clears START_START in REG_CFG_START or
otherwise aborts the active hardware transfer while A9_ENABLE_IRQ_BIT remai=
ns
enabled in REG_CFG_IRQ_ENABLE.

If the stalled transfer shifts additional bytes after reset_fifo_pos(i2c), =
the
hardware FIFO pointers become non-zero for the next message. Furthermore, if
the stalled transfer finishes or NACKs after a subsequent aml_i2c_xfer_msg()
has set i2c->state to A9_STATE_READ or A9_STATE_WRITE, aml_i2c_irq() will
process the stale A9_PHY_DONE or A9_NCK_ERROR interrupt against the new
i2c->msg, corrupting i2c->msg->buf, i2c->pos, and i2c->error and prematurely
completing i2c->done. Even if the late interrupt arrives while i2c->state is
still A9_STATE_IDLE, aml_i2c_irq() jumps to complete_irq_out and calls
complete(&i2c->done) when no transfer is waiting.

Also, this function mixes manual spin_lock_irqsave() / spin_unlock_irqresto=
re()
with guard(spinlock_irqsave)(&i2c->lock) without directly including
linux/cleanup.h. Could the hardware transfer be explicitly halted on timeou=
t,
the spurious complete(&i2c->done) when A9_STATE_IDLE avoided, and the locki=
ng
style made consistent across aml_i2c_xfer_msg()?

[ ... ]

> +static const struct i2c_algorithm aml_i2c_algorithm =3D {
> +	.master_xfer	=3D aml_i2c_xfer,
> +	.functionality	=3D aml_i2c_func,
> +};

[Severity: Low]
In struct i2c_algorithm, master_xfer is marked deprecated in include/linux/=
i2c.h
in favor of xfer. Could aml_i2c_algorithm initialize .xfer =3D aml_i2c_xfer
instead?

[1] https://lore.kernel.org/r/sashiko-outbox-181284@kernel.org
[2] https://lore.kernel.org/r/sashiko-outbox-181284@kernel.org
[3] https://lore.kernel.org/r/sashiko-outbox-181284@kernel.org

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103-a9-i2c-v5-=
0-86f2dcd179d8@amlogic.com?part=3D2
