Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793895095;
	b=S08EZaGlvR9BM+Z4LiyUxP+H175AFliGuCCNhjFI6Cd/GKLA/7ifPvB66ze9vFOd/P3z
	 b6F4OVDb9g7g5d+6HvG0z4LLWb5I6TgdRF4iegZwV2Wf/r2H954VEABI4iamkRNbXCNh6
	 sHzhHZ15oGJPYeOqiQiizKR2nFEekQonhSwwUywuYph5gH3Qyn3tzkqRe4ba4juSlmAm5
	 Sw84uahx4qJtZD8vC979cLm3UCfmn0eLyvw/mGRwG0AyvZ1iX+OBgtVZzZDWlQpAzNQzU
	 DeN6TNV8PcXbrHxMEEKdxQjWTOn1Iv7rapD+g11Nc1lUJgYoNoaD+10lSDTdfOHU7Aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793895095;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=eiGQ/KpVn28drSeD6y/HniotQ99k6/RC44L8mEzJXXc=;
	b=iaCkRMadae1ZJV8jiWP2GG5dgbuae22NCrd65jx0LZRm9svE9V3jCfhsjKeFbAqm2StQ
	 TAe85RwdpVBlJ7u4kQzqmP+lbXvdRtRBPRuIKkZ9JPtZENDbskNI9xvEcPSMSe1TvAwLT
	 0SgZV99m+7i/FP7SDoOH363UTBNZci35+3a1lM6C4ILdfBtyND9+qgSs3Lx4uvY2rkj8W
	 U5qWtDWrEYGEa3yp8NzBOro5/YU4jK8/PiFRGXOErqScYGVF2BXW1JB83M8H4bUXEvYeu
	 4jtTttTzq4z9rSyO1CsKIl1a3+UYYldfMvhKdgaiK3k8C4pQ5t5sj0TX/iZ3fnAwhSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VJbass+R;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274F8606A32D
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 16:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VJbass+R
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 725B81F00919;
	Thu,  5 Nov 2026 16:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793895094;
	bh=eiGQ/KpVn28drSeD6y/HniotQ99k6/RC44L8mEzJXXc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VJbass+RCsxXhH++7ThcFapzSE1a3iQGBUsW8DN5J3GMJuWoQW5rK5/XK24ztkpLb
	 aZ1H5eS9fy15yQsXmDD/5N903tyTk7qgn0pZ8RAPAIOEunUjTaV9ryKWV8YoMqI38P
	 Bw/51ZA81yvOgZqVFRDmOTxVCxSay0ZaiM5tJD0Zc19Mo37ZdlT/dwFBBtMTen5upl
	 gAuVj8EXAgQkoEL6NW8MZPtUm24IELv/SoqssctoV1jD3ZESn3mNOxhzu/KLWqp2RK
	 xlLXFTptZdJ53zbNwE29eOHUL5IUxTzVNtZtofeXaDe1Di1KtjYiekJn43FqdGfU/A
	 HGmNQkrGxu51Q==
Message-ID: <sashiko-outbox-199446@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/2] i2c: amlogic: Add Amlogic A9 I2C controller
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xianwei Zhao" <xianwei.zhao@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20261104-a9-i2c-v7-2-b31f2b53faf4@amlogic.com>
References: <20261104-a9-i2c-v7-0-b31f2b53faf4@amlogic.com>
 <20261104-a9-i2c-v7-2-b31f2b53faf4@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 16:11:34 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] i2c: amlogic: unstopped hw transfer on timeout in aml_i2c_xfer_msg=
()
- [High] i2c: amlogic-a9: race between complete() and reinit_completion() o=
n timeout
- [Medium] i2c: amlogic-a9: transfer started before IRQ setup in aml_i2c_do=
_start()
- [Medium] i2c: amlogic-a9: stale irq_state and edge IRQ miss in aml_i2c_ir=
q()
--

commit c27eb9a87c5b273047db1979d97f8c36648a9931
Author: Junyi Zhao <junyi.zhao@amlogic.com>

i2c: amlogic: Add Amlogic A9 I2C controller driver

This commit adds an I2C controller driver for Amlogic A9 SoCs along with its
Kconfig, Makefile, and MAINTAINERS entries.

> diff --git a/drivers/i2c/busses/i2c-amlogic-a9.c b/drivers/i2c/busses/i2c=
-amlogic-a9.c
> new file mode 100644
> index 0000000000000..d282f275d4d32
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-amlogic-a9.c
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
> +		clear_irq_status(i2c, IRQ_ALL_MASK);
> +		spin_unlock(&i2c->lock);
> +		return IRQ_HANDLED;
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
> +	    (i2c->state =3D=3D A9_STATE_READ && i2c->pos < i2c->msg->len)) {
> +		spin_unlock(&i2c->lock);
> +		return IRQ_HANDLED;
> +	}

[Severity: Medium]
As reported by Sashiko on v2 [1], in aml_i2c_irq(), can multi-chunk I2C read
transfers (where msg->len > A9_I2C_FIFO_DEPTH) miss the transfer completion
interrupt and time out in wait_for_completion_timeout()?

In Documentation/devicetree/bindings/i2c/amlogic,a9-i2c.yaml, the controller
interrupt is configured as rising-edge triggered (IRQ_TYPE_EDGE_RISING), wh=
ich
requires a 0-to-1 signal transition to latch a new pending interrupt in the
GIC.

For a read transfer with msg->len > A9_I2C_FIFO_DEPTH, aml_i2c_do_start()
enables A9_RX_THRESH_READ in REG_CFG_IRQ_ENABLE alongside A9_PHY_DONE and
A9_NCK_ERROR. Unlike A9_STATE_WRITE, which disables A9_TX_THRESH_WRITE once
the final bytes are written to the TX FIFO, A9_STATE_READ never disables
A9_RX_THRESH_READ when the remaining bytes fit in a single FIFO chunk.

Because irq_state =3D readl(i2c->regs + REG_CFG_IRQ_STATE) is sampled only =
once
at the start of aml_i2c_irq() before reading up to 32 bytes from REG_CFG_RX:

1. When msg->len is a multiple of 32, the 32nd byte of the final chunk can
trigger A9_RX_THRESH_READ before the I2C NACK and STOP condition finish on =
the
bus. If A9_PHY_DONE asserts in REG_CFG_IRQ_STATE during the loop reading
REG_CFG_RX before clear_irq_status(i2c, A9_RX_THRESH_READ) runs, the
controller interrupt output stays continuously high without generating a new
rising edge, while aml_i2c_irq() checks the stale irq_state snapshot and
returns early without completing i2c->done even though i2c->pos =3D=3D
i2c->msg->len.

2. Similarly, if both A9_RX_THRESH_READ and A9_PHY_DONE are asserted in
REG_CFG_IRQ_STATE when more than 32 bytes remain (so i2c->pos < i2c->msg->l=
en
after reading one 32-byte chunk), aml_i2c_irq() clears only A9_RX_THRESH_RE=
AD
and returns early with A9_PHY_DONE still asserted and fewer than 32 bytes l=
eft
in the RX FIFO. Because A9_PHY_DONE remains asserted continuously, no new
0-to-1 edge occurs to re-trigger the interrupt handler for the remaining
bytes.

> +
> +complete_irq_out:
> +	i2c->state =3D A9_STATE_IDLE;
> +	reset_fifo_pos(i2c);
> +	aml_i2c_set_mask(i2c, REG_CFG_IRQ_ENABLE, A9_RX_THRESH_READ | A9_TX_THR=
ESH_WRITE, 0);
> +	clear_irq_status(i2c, IRQ_ALL_MASK);
> +	spin_unlock(&i2c->lock);
> +	complete(&i2c->done);
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
As reported by Sashiko on v2 [2], in aml_i2c_do_start(), could starting the
hardware transfer before clearing REG_CFG_IRQ_STATE and enabling the FIFO
threshold interrupts lose a fast completion or NACK status bit?

In aml_i2c_xfer() -> aml_i2c_xfer_msg() -> aml_i2c_do_start(),
aml_i2c_set_mask() writes START_START to REG_CFG_START while A9_ENABLE_IRQ_=
BIT
(A9_NCK_ERROR | A9_PHY_DONE) is already enabled in REG_CFG_IRQ_ENABLE, befo=
re
clear_irq_status(i2c, IRQ_ALL_MASK) is called and before A9_RX_THRESH_READ =
or
A9_TX_THRESH_WRITE is enabled.

If execution is delayed between writing REG_CFG_START and writing
REG_CFG_IRQ_STATE (for example due to task preemption while holding spinloc=
k_t
on PREEMPT_RT, vCPU preemption, or interrupt/firmware latency), the hardware
can assert A9_NCK_ERROR or A9_PHY_DONE and have it immediately wiped out by
clear_irq_status(i2c, IRQ_ALL_MASK) before aml_i2c_irq() acquires i2c->lock
and reads REG_CFG_IRQ_STATE. When aml_i2c_irq() then runs, it sees irq_state
=3D=3D 0, misses A9_TRANS_ERROR, touches REG_CFG_RX or REG_CFG_TX unconditi=
onally,
and exits at !(irq_state & A9_TRANS_DONE) without calling complete(&i2c->do=
ne),
causing wait_for_completion_timeout() in aml_i2c_xfer_msg() to hang for 500=
 ms
and return -ETIMEDOUT.

Should clear_irq_status(i2c, IRQ_ALL_MASK) and the REG_CFG_IRQ_ENABLE setup
happen before asserting START_START in REG_CFG_START?

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

[Severity: High]
Can a late interrupt from a completing transfer race with the timeout path =
and
a subsequent call to reinit_completion(&i2c->done) in aml_i2c_xfer_msg()?

In aml_i2c_irq(), the complete_irq_out path sets i2c->state =3D A9_STATE_ID=
LE,
releases i2c->lock via spin_unlock(&i2c->lock), and then calls
complete(&i2c->done) outside i2c->lock. Meanwhile, aml_i2c_xfer_msg()
initializes i2c->msg, i2c->pos, and i2c->error before acquiring i2c->lock a=
nd
calling reinit_completion(&i2c->done).

If a transfer finishes on CPU 1 just as wait_for_completion_timeout() expir=
es
on CPU 0:

CPU 1 (aml_i2c_irq)                CPU 0 (aml_i2c_xfer_msg)
-------------------                ------------------------
spin_unlock(&i2c->lock);
                                   /* !time_left timeout path */
                                   spin_lock_irqsave(&i2c->lock, flags);
                                   ...
                                   spin_unlock_irqrestore(&i2c->lock, flags=
);
                                   return -ETIMEDOUT;

                                   /* next message starts */
                                   i2c->msg =3D msg;
                                   spin_lock_irqsave(&i2c->lock, flags);
                                   i2c->state =3D A9_STATE_READ;
                                   reinit_completion(&i2c->done);
                                   aml_i2c_do_start(i2c, msg);
                                   spin_unlock_irqrestore(&i2c->lock, flags=
);
                                   wait_for_completion_timeout(&i2c->done, =
...);
complete(&i2c->done);

In this case, CPU 1's delayed complete(&i2c->done) wakes
wait_for_completion_timeout() immediately while the new transfer is still
active in hardware. That allows aml_i2c_xfer_msg() to return early while
aml_i2c_irq() can still access i2c->msg and write to i2c->msg->buf after the
caller frees or pops the buffer, or while the next message in aml_i2c_xfer()
overwrites i2c->msg, i2c->pos, and i2c->error without holding i2c->lock.

Should complete(&i2c->done) be called while holding i2c->lock, and should
i2c->msg, i2c->pos, and i2c->error be accessed under i2c->lock?

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
> +		spin_lock_irqsave(&i2c->lock, flags);
> +		i2c->state =3D A9_STATE_IDLE;
> +		aml_i2c_set_mask(i2c, REG_CFG_IRQ_ENABLE,
> +				 A9_RX_THRESH_READ | A9_TX_THRESH_WRITE, 0);
> +		clear_irq_status(i2c, IRQ_ALL_MASK);
> +		reset_fifo_pos(i2c);
> +		spin_unlock_irqrestore(&i2c->lock, flags);
> +		return -ETIMEDOUT;
> +	}

[Severity: High]
As reported by Sashiko on v2 [3], when wait_for_completion_timeout() expires
in aml_i2c_xfer_msg(), does the timeout cleanup leave the hardware transfer
running on the bus?

In the !time_left block, the driver resets i2c->state =3D A9_STATE_IDLE,
disables A9_RX_THRESH_READ | A9_TX_THRESH_WRITE in REG_CFG_IRQ_ENABLE, clea=
rs
REG_CFG_IRQ_STATE, and calls reset_fifo_pos(i2c), but it never clears
START_START in REG_CFG_START (or otherwise halts the controller) while
A9_ENABLE_IRQ_BIT (A9_NCK_ERROR | A9_PHY_DONE) remains enabled in
REG_CFG_IRQ_ENABLE.

If a stalled bus transfer continues shifting bytes after reset_fifo_pos(i2c=
),
it will advance the hardware FIFO pointers before the next transfer calls
aml_i2c_prepare_xfer(). Furthermore, if the stalled transfer finishes
(A9_PHY_DONE) or NACKs (A9_NCK_ERROR) after a subsequent call to
aml_i2c_xfer_msg() has set i2c->state to A9_STATE_READ or A9_STATE_WRITE and
released i2c->lock, aml_i2c_irq() will service that stale interrupt against
 the new i2c->msg, corrupting i2c->msg->buf, i2c->pos, and i2c->error and
prematurely completing i2c->done.

Should the timeout path clear START_START in REG_CFG_START to abort the act=
ive
hardware transfer under i2c->lock?

[1] https://lore.kernel.org/r/sashiko-outbox-181284@kernel.org
[2] https://lore.kernel.org/r/sashiko-outbox-181284@kernel.org
[3] https://lore.kernel.org/r/sashiko-outbox-181284@kernel.org

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-a9-i2c-v7-=
0-b31f2b53faf4@amlogic.com?part=3D2
