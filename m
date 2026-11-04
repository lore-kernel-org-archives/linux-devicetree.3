Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793761755;
	b=B8267/h1d+d8PsI+TmMxGKhjsxfjBj2przYQi5HBEdlgPQ67M+ccXyzx3T2uozU2Izgn
	 f2pzhrQPAO2MZUDLfz9MvRYgADwJr7iBcF6fsUdUfJFGa+T2ZcotJdrHeSf6V9KY8YKLk
	 va5SuZ3/vISno9V+vHBUu+0y7vfsylzbfWNJbkDDoStxQzOn1a9VaDqhhkRhluyoqC5x1
	 U0Qex09XUHnqFC7A4AQPNqsGmX9ElcncQxA+jAaYHtU/yyjCzHjZXksPoiO3Z4LG8vptS
	 bRbmZBjxFDlUOKAFruQpELu1nOPB5tlJyN9eOyp4dp6YqACV2N0ITbDV+hM2g99BZYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793761755;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=c0S2EO9xfqXAFlLijJmBKBMIi3865J+uVDBzGtc2yVI=;
	b=m0S9xjfgBFCTTgKBEd75OLQICIGzo+GlObsLZSdC/8bNSR76Em9TtnlwiCgZ9k31AbU5
	 F1lD40mssWj0kTf2yoBnG1HxHi3+W5xIpoiXxeO/RJqJY75ry10GXUEuY46sB3JZA3tPK
	 lxa+eafUzPgfyPWzPP5qOrS4N3/cWPrIhi6Nxko/4AqTM7fX2xQW2hNpV2IAtEq7JCeuj
	 m64f2Zp9UpXLPFluFaIT6wwiJweuu6yQr0vhbJMBJvCROq8rkCYyDduwZyf5NVveYmACp
	 cUy5hFNdP0n/zLrZ7ND2VyGRZTyV3RoShDEG19WZVK+J6e6342GdCDL53YsiEsZe5VA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D+QyF4R0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19610606A326
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 03:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D+QyF4R0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3282D1F000C1;
	Wed,  4 Nov 2026 03:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793761754;
	bh=c0S2EO9xfqXAFlLijJmBKBMIi3865J+uVDBzGtc2yVI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=D+QyF4R0/9wQX30FsUSXwdiMLsealhz5WRnUG06Qc24MHm79LH5CtZphvzRgdyxmd
	 gZP1aCDr4dfXtqWwZdzITZwKupWaF42eUZlvQQOnqe10Ni9+yZKLfCG8MQsA8flMMw
	 XBF8aedqiqYDyaRteH7bdOwooZLAxlOqtgVK1j1rg1xHAPmECUfRSfyzdfsn5qd4Q2
	 FNIfwqOl5KL7BmosNreyGpkEJ36lKoeCojpL1MLM4OPbb3f9zhUhvoyiLH18wO53sx
	 9SLQJd3cmHJVaqGU/4wnmf+2kG0BW3pOllOEmBnGEjJjwxlP2k1V+bhPthN5AMskd+
	 skLsujxKhWgDQ==
Message-ID: <sashiko-outbox-196588@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/2] i2c: amlogic: Add Amlogic A9 I2C controller
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xianwei Zhao" <xianwei.zhao@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20261104-a9-i2c-v6-2-baa6171f26f8@amlogic.com>
References: <20261104-a9-i2c-v6-0-baa6171f26f8@amlogic.com>
 <20261104-a9-i2c-v6-2-baa6171f26f8@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 03:09:13 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] i2c: amlogic: unstopped hw transfer on timeout in aml_i2c_xfer_msg=
()
- [Medium] i2c: amlogic-a9: transfer started before IRQ setup in aml_i2c_do=
_start()
- [Medium] i2c: amlogic-a9: missed completion in aml_i2c_irq() on multi-chu=
nk reads
--

commit 9ddec18f810de9926e88d576654fa2be061db0f3
Author: Junyi Zhao <junyi.zhao@amlogic.com>

i2c: amlogic: Add Amlogic A9 I2C controller driver

This commit adds a driver for the I2C controller on Amlogic A9 SoCs, along
with the corresponding Kconfig, Makefile, and MAINTAINERS entries.

> diff --git a/drivers/i2c/busses/i2c-amlogic-a9.c b/drivers/i2c/busses/i2c=
-amlogic-a9.c
> new file mode 100644
> index 0000000000000..e794ac00e95c1
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-amlogic-a9.c
> @@ -0,0 +1,428 @@

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

[Severity: Medium]
As reported by Sashiko on v2 [1], can multi-chunk I2C reads (msg->len >
A9_I2C_FIFO_DEPTH) miss the transfer completion interrupt in aml_i2c_irq()
and time out in aml_i2c_xfer_msg()?

The devicetree binding in Documentation/devicetree/bindings/i2c/amlogic,a9-=
i2c.yaml
specifies a rising-edge-triggered interrupt (IRQ_TYPE_EDGE_RISING). For a
read transfer with msg->len > 32, aml_i2c_do_start() enables
A9_RX_THRESH_READ alongside A9_PHY_DONE and A9_NCK_ERROR, and unlike
A9_STATE_WRITE, A9_STATE_READ never disables A9_RX_THRESH_READ when the
remaining bytes fit within a single 32-byte FIFO chunk.

In aml_i2c_irq(), irq_state is sampled only once before the A9_STATE_READ
loop reads up to 32 bytes from REG_CFG_RX and clears A9_RX_THRESH_READ.
When msg->len is a multiple of 32 (or when draining the first byte frees
FIFO space for the final byte to complete), if A9_PHY_DONE asserts in
REG_CFG_IRQ_STATE during those MMIO reads before clear_irq_status(i2c,
A9_RX_THRESH_READ) runs, the controller interrupt output remains
continuously high across the clear without generating a new rising edge,
while the completion check uses the stale irq_state snapshot and jumps to
irq_trans_out without completing i2c->done.

Similarly, if both A9_RX_THRESH_READ and A9_PHY_DONE are already set in
irq_state when aml_i2c_irq() enters with more than 32 bytes remaining,
aml_i2c_irq() reads only 32 bytes, clears only A9_RX_THRESH_READ, and
exits via irq_trans_out with A9_PHY_DONE still asserted and fewer than 32
bytes left, so no new rising edge occurs to finish draining the tail
bytes.

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
As reported by Sashiko on v2 [1], in aml_i2c_do_start(), doesn't setting
START_START in REG_CFG_START before calling clear_irq_status(i2c,
IRQ_ALL_MASK) and enabling A9_RX_THRESH_READ or A9_TX_THRESH_WRITE in
REG_CFG_IRQ_ENABLE create a race window with the hardware?

Because A9_ENABLE_IRQ_BIT (A9_NCK_ERROR | A9_PHY_DONE) is already enabled
in REG_CFG_IRQ_ENABLE when aml_i2c_xfer() -> aml_i2c_xfer_msg() ->
aml_i2c_do_start() runs, if execution is delayed between the write to
REG_CFG_START and the write to REG_CFG_IRQ_STATE (for example due to task
preemption under CONFIG_PREEMPT_RT, vCPU preemption, or NMI/FIQ latency),
the controller can assert A9_NCK_ERROR on an address NACK or A9_PHY_DONE
on a short transfer and then have those bits wiped out by
clear_irq_status(i2c, IRQ_ALL_MASK).

When aml_i2c_irq() then acquires i2c->lock and reads REG_CFG_IRQ_STATE, it
sees irq_state =3D=3D 0, misses A9_TRANS_ERROR, unconditionally accesses
REG_CFG_RX or REG_CFG_TX in the switch (i2c->state) block, and exits via
irq_trans_out because !(irq_state & A9_TRANS_DONE) is true, leaving
wait_for_completion_timeout() in aml_i2c_xfer_msg() to time out with
-ETIMEDOUT.

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
As reported by Sashiko on v2 [1], if a transfer times out in
aml_i2c_xfer_msg(), how is the active hardware transfer stopped so that a
late completion cannot corrupt a subsequent message?

In the !time_left branch of aml_i2c_xfer_msg(), the driver sets i2c->state
to A9_STATE_IDLE, disables the threshold IRQs, clears REG_CFG_IRQ_STATE,
and calls reset_fifo_pos(i2c), but never clears START_START in
REG_CFG_START (or otherwise aborts the controller) while A9_ENABLE_IRQ_BIT
stays enabled in REG_CFG_IRQ_ENABLE. If the stalled transfer shifts more
bytes after reset_fifo_pos(i2c), the FIFO pointers become non-zero before
the next message is loaded, and if the stalled transfer finishes or NACKs
after the next aml_i2c_xfer_msg() sets i2c->state to A9_STATE_READ or
A9_STATE_WRITE, aml_i2c_irq() will service the stale interrupt against the
new i2c->msg and prematurely complete i2c->done. Also, when a late
interrupt arrives while i2c->state =3D=3D A9_STATE_IDLE, aml_i2c_irq() jumps
to complete_irq_out and calls reset_fifo_pos(i2c) and complete(&i2c->done)
even though no transfer is waiting.

In addition, in complete_irq_out of aml_i2c_irq(), complete(&i2c->done) is
called before disabling A9_RX_THRESH_READ | A9_TX_THRESH_WRITE, clearing
REG_CFG_IRQ_STATE, and releasing i2c->lock, whereas aml_i2c_xfer_msg()
writes i2c->msg, i2c->pos, and i2c->error before acquiring i2c->lock and
reads i2c->error after wait_for_completion_timeout() without holding
i2c->lock. Can aml_i2c_xfer_msg() wake up on another CPU and overwrite
i2c->msg, i2c->pos, and i2c->error for the next message in aml_i2c_xfer()
while the previous interrupt handler still holds i2c->lock?

Finally, this isn't a bug, but aml_i2c_xfer_msg() mixes manual
spin_lock_irqsave() / spin_unlock_irqrestore() with
guard(spinlock_irqsave)(&i2c->lock) in the same function without directly
including linux/cleanup.h. Should this function use consistent locking
primitives and include linux/cleanup.h if guard() is used?

[1] https://lore.kernel.org/r/sashiko-outbox-181284@kernel.org

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-a9-i2c-v6-=
0-baa6171f26f8@amlogic.com?part=3D2
