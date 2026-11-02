Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793606898;
	b=fL9FM/jW+vuajQTidGWscD/u1zIXsaIq99rLZygpEx6De5ISrbHLGznSMrttkal50Ykw
	 nVFhZmrY/fIcnSrX+T+KWoWSh5X0P3CfXwAb25YSrK5doHFT8OcLVAycLVdKOnicNQXAj
	 dIvV/bM5OLxsLBxVx9/JVvUKoRpDIODF6eHfnBZ7oxtxHP2fiDsPOnLASsjtWjtToCzhH
	 zNcZ8ZI1F6MVapkY9x18TWjb0Cx+mra4JDIIj5fRatLd40gEpx5puljK7nr37TaKJ7JU3
	 h2q2Zp6rhruKihaJHNoUdvreLNNuzi4VVTWzizeAd0dmxYaL+rfzQ3Y6ft1rGoBepsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793606898;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=1cz2jBIqweP+i+KbVD7KlRSnB7Ie8AUwscH2jSglJfc=;
	b=Q0inoJGtkcCE0tHkqLrOP2tpsu00yJQlZ9qL5eSWnMx2fNd1L31hT+uAPDkfHKGkr4zS
	 P3+EFRp/HTkEVNSFCvLjv7EuYvcOU3EiLFNbz/1lVabyMTyz5oNv0eUb8G8bcgu5BVeOF
	 0AV4B8M9dw05zkY1uubRK4bPUvspfuBwc3Nb/u6CR2ICA3S2XR7owr/lp9jk6c2ZP7pvA
	 xDJgtRU48hFL8Zh8Uw06xqIL90JlMJpeJwXreStl+nPd3cap2607sNknHaCQv+s8N23iS
	 IGhE03dmuGN/xcCUde55VE26/L8D0qxgY26vy/IZ135DF0ZjlqCVICFFBssKJh2wABQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Iyrj2W9f;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6BBE606A324
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 08:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Iyrj2W9f
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D7EF1F000C1;
	Mon,  2 Nov 2026 08:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793606897;
	bh=1cz2jBIqweP+i+KbVD7KlRSnB7Ie8AUwscH2jSglJfc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Iyrj2W9fWY9Tnt/S+nrsw48En+S4diQgAe37uTqKn8jnPLWgG0D4fLkEGh9ZCFSYt
	 3h/QZlCFcIW4A+B+93IWG1XntQKHGj4Jp9oxrbiKOZBMRfbtDd05T6argmElSLGuNn
	 oVndnBq4KfBxml1al0iB6q9fW+Ei6Wd0AIPCAnO+Z2khsXyo6HtfETAFB+fgPS2gQx
	 GVVnsOwWK1Vj5cUINQxRAfUBM83QkIrJdktjmegcDq793/iz1Fz8FctV02vKmicwWh
	 RZCndedP8kSdEK++vxzhwtfLril7BlCO4fXHNEgp3urwETavGUtAQKfQ9GXStEt0wh
	 SrL/tGb9V1YXQ==
Message-ID: <sashiko-outbox-193079@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] i2c: amlogic: Add Amlogic A9 I2C controller
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xianwei Zhao" <xianwei.zhao@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20261102-a9-i2c-v4-2-5a169215b8e9@amlogic.com>
References: <20261102-a9-i2c-v4-0-5a169215b8e9@amlogic.com>
 <20261102-a9-i2c-v4-2-5a169215b8e9@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 08:08:16 +0000
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
- [Medium] i2c: amlogic-a9: broken SMBus quick functionality in aml_i2c_fun=
c()
- [Medium] i2c: amlogic-a9: transfer started before IRQ setup in aml_i2c_do=
_start()
--

commit ec2db63448dbaa6c5f6ad34fda6b44addba5015f
Author: Junyi Zhao <junyi.zhao@amlogic.com>

i2c: amlogic: Add Amlogic A9 I2C controller driver

This commit adds a driver for the I2C controller found on Amlogic A9 SoCs,
along with its Kconfig, Makefile, and MAINTAINERS entries.

> diff --git a/drivers/i2c/busses/i2c-amlogic-a9.c b/drivers/i2c/busses/i2c=
-amlogic-a9.c
> new file mode 100644
> index 0000000000000..8f33411b778e8
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
> +		goto complete_irq_out;
> +	}

[ ... ]

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
As reported by Sashiko on v2 [1], in aml_i2c_do_start(), aml_i2c_set_mask()
writes START_START to REG_CFG_START to start the hardware transfer before
calling clear_irq_status(i2c, IRQ_ALL_MASK) and before enabling
A9_RX_THRESH_READ or A9_TX_THRESH_WRITE in REG_CFG_IRQ_ENABLE.

If execution is delayed between writing REG_CFG_START and writing
REG_CFG_IRQ_STATE (for example, under CONFIG_PREEMPT_RT or hypervisor
preemption), could the hardware assert A9_NCK_ERROR on an address NACK or
A9_PHY_DONE on a short transfer and have that status wiped out by
clear_irq_status(i2c, IRQ_ALL_MASK)? When aml_i2c_irq() then runs, it would
observe !(irq_state & A9_TRANS_DONE) and exit via irq_trans_out without
completing i2c->done, causing wait_for_completion_timeout() in
aml_i2c_xfer_msg() to time out.

Should clear_irq_status(i2c, IRQ_ALL_MASK) and the REG_CFG_IRQ_ENABLE update
happen before setting START_START in REG_CFG_START?

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
As reported by Sashiko on v2 [2], when wait_for_completion_timeout() expires
in aml_i2c_xfer_msg(), the !time_left block resets i2c->state to
A9_STATE_IDLE, disables the threshold interrupts, clears REG_CFG_IRQ_STATE,
and calls reset_fifo_pos(i2c), but never clears START_START in REG_CFG_START
or otherwise aborts the hardware controller while A9_ENABLE_IRQ_BIT remains
enabled in REG_CFG_IRQ_ENABLE.

If a stalled transfer continues shifting bytes after reset_fifo_pos(i2c), t=
he
hardware FIFO pointers will advance again before the next message starts. A=
nd
if the timed-out transfer finishes or NACKs after a subsequent call to
aml_i2c_xfer_msg() has set i2c->state to A9_STATE_READ or A9_STATE_WRITE,
wouldn't aml_i2c_irq() service the stale A9_PHY_DONE or A9_NCK_ERROR interr=
upt
against the new i2c->msg, corrupting its state and completing i2c->done
prematurely?

Also, aml_i2c_xfer_msg() mixes manual spin_lock_irqsave() /
spin_unlock_irqrestore() with guard(spinlock_irqsave)(&i2c->lock) in the sa=
me
function without including linux/cleanup.h. Could this function use a
consistent locking style and clear START_START on timeout?

[ ... ]

> +static u32 aml_i2c_func(struct i2c_adapter *adap)
> +{
> +	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
> +}
> +
> +static const struct i2c_adapter_quirks aml_i2c_quirks =3D {
> +	.max_read_len =3D A9_I2C_MAX_XFER_SIZE,
> +	.max_write_len =3D A9_I2C_MAX_XFER_SIZE,
> +	.flags =3D I2C_AQ_NO_ZERO_LEN,
> +};

[Severity: Medium]
In aml_i2c_func(), the driver advertises I2C_FUNC_SMBUS_EMUL, which includes
I2C_FUNC_SMBUS_QUICK, while aml_i2c_quirks sets I2C_AQ_NO_ZERO_LEN.

Because aml_i2c_algorithm does not provide an smbus_xfer callback,
i2c_smbus_xfer_emulated() translates I2C_SMBUS_QUICK into a zero-length
i2c_msg, which i2c_check_for_quirks() then rejects with -EOPNOTSUPP due to
I2C_AQ_NO_ZERO_LEN. This also causes i2c_default_probe() and tools like
i2cdetect to attempt SMBus Quick transfers and fail instead of falling back=
 to
I2C_FUNC_SMBUS_READ_BYTE.

Should aml_i2c_func() mask out I2C_FUNC_SMBUS_QUICK and return
I2C_FUNC_I2C | (I2C_FUNC_SMBUS_EMUL & ~I2C_FUNC_SMBUS_QUICK)?

[1] https://lore.kernel.org/r/sashiko-outbox-181284@kernel.org
[2] https://lore.kernel.org/r/sashiko-outbox-181284@kernel.org

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-a9-i2c-v4-=
0-5a169215b8e9@amlogic.com?part=3D2
