Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793263721;
	b=BDDx/XG5mQgzWZmsML4Rj9C2M2MYY+zNq5a/3GtfDqJbvjExvNJGhnY5tf769tXfBLMm
	 K9FxvVcni6/tC7DxBjr6LTkCqK/CBCLPW0BpucJITrcmE5mKW+Ac2ijGYrcpomD5dPbQb
	 6O/3TEBu/aCRuE9xqBGDmXxy0xhGQJfoiTNb73hEqVHct5jeS61UZyFqE0Nd3mKnlvW8q
	 H1n/LGvZBgXuKzOOA/tqDtxDO2IZAcEl2xyw3ZzJ7c952GiOefd7hJ0UOVZZHbQePRqax
	 MTvoPCUCzhtl/a2Uk5owljUPG+0/JnmlkHttSl8UQo1iSQUDh63q2Q4aEw8W1q+VCqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793263721;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=tnI2nqom7NcJjHr4dUpVUoHtjdV7J91r0Zc2bMV/RrM=;
	b=VpZePNm0epJoXCCGcWvwKkPafk252jVEdTBSUetgmLb5BYzt21Xm0YW5kSgcK8Df11E4
	 0tCHyWUKfHjLv8OBFty5i/Ux9fwXGYUpXNa153OfyN83R3hsGAfsPq65pjTf/2h6SFuud
	 SnPN3x38cU1DeB/ZyXtZFYpDoz7rwzeMB4bJApkIZ0PuLf7dwnUPP3zAGre5vVzLbzK0d
	 lXKhSh2Ueo1cZWUifFOeQ4qmfuz0BBIazVQNnZLqXMCsIbn5M76a2ybEpWpQUw1Q2uvq0
	 +JUF9EpN4c6HbRLiqvbD3EPvTZJYTbbIJ+/UcBn2DZ8B22lRWYYJDNWa9eKUXBJK6cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wc5LYktJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6BA606A322
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 08:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wc5LYktJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F1811F031E3;
	Thu, 29 Oct 2026 08:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793263720;
	bh=tnI2nqom7NcJjHr4dUpVUoHtjdV7J91r0Zc2bMV/RrM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Wc5LYktJ+gtmmg9F1tdB29IpMF69ceBJuyKHCstmhe+558HRe3B6taAopBN0eBYd6
	 5k/N5hwlu0lPFPu/tWFZ//Q7LXKLKrjL1tKvpU++NOwtBxBVKzz9nhQXRDK+1TfXbE
	 NI9dzVTgKFUy9tWw8x5p0hUSYkLNpDn6w4a+u1NqNl3As+xieH68FSZUPhHS3w6xnz
	 eBgUign4HgvOoUdWQbXBdzZEhDv3hN4czCC0h7wLZMUKrmcMjBQX9L/zd42vg2cxq5
	 O8AG47aX22fOC7vrlbPxcAGvTjNf9RXx2alCYS1Ju7WSIqn1750RJdeJeevYwuXoBR
	 qSEKtRnr+Pn0A==
Message-ID: <sashiko-outbox-188989@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] i2c: amlogic: Add Amlogic A9 I2C controller
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xianwei Zhao" <xianwei.zhao@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20261029-a9-i2c-v3-2-7b30ccc00533@amlogic.com>
References: <20261029-a9-i2c-v3-0-7b30ccc00533@amlogic.com>
 <20261029-a9-i2c-v3-2-7b30ccc00533@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Oct 2026 08:48:39 +0000
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
- [High] i2c: amlogic-a9: missing threshold IRQ disable on timeout in aml_i=
2c_xfer_msg()
- [Medium] i2c: amlogic-a9: transfer started before IRQ setup in aml_i2c_do=
_start()
- [Medium] i2c: amlogic-a9: spurious TX FIFO write on completion in aml_i2c=
_irq()
--

commit ab8bf627f35c4931f8163555b700d4cca01277db
Author: Junyi Zhao <junyi.zhao@amlogic.com>

i2c: amlogic: Add Amlogic A9 I2C controller driver

This commit adds an I2C controller driver for Amlogic A9 SoCs, along with
corresponding Kconfig, Makefile, and MAINTAINERS entries.

> diff --git a/drivers/i2c/busses/i2c-amlogic-a9.c b/drivers/i2c/busses/i2c=
-amlogic-a9.c
> new file mode 100644
> index 0000000000000..503511734fe26
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-amlogic-a9.c
[ ... ]
> +static void aml_i2c_put_data(struct aml_i2c *i2c, u8 *buf, int len)
> +{
> +	int i;
> +
> +	/* When this I2C module transfers 0 bytes, it must still send at least =
1 byte. */
> +	if (!i2c->msg->len) {
> +		writel(0x00, i2c->regs + REG_CFG_TX);
> +		return;
> +	}
> +
> +	for (i =3D 0; i < len; i++, buf++)
> +		writel(*buf, i2c->regs + REG_CFG_TX);
> +}
> +
> +static void aml_i2c_prepare_xfer(struct aml_i2c *i2c, enum fifo_fill_mod=
e mode)
> +{
> +	bool write =3D !(i2c->msg->flags & I2C_M_RD);
> +
> +	if (!write)
> +		return;
> +
> +	i2c->count =3D min(i2c->msg->len - i2c->pos,
> +			 mode =3D=3D A9_FIFO_FILL_FULL ? A9_I2C_FIFO_DEPTH : A9_I2C_HALF_FIFO=
);
> +	aml_i2c_put_data(i2c, i2c->msg->buf + i2c->pos, i2c->count);
> +}
> +
> +static irqreturn_t aml_i2c_irq(int irqno, void *dev_id)
> +{
[ ... ]
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
> +		if ((i2c->pos + A9_I2C_HALF_FIFO) >=3D i2c->msg->len)
> +			aml_i2c_set_mask(i2c, REG_CFG_IRQ_ENABLE, A9_TX_THRESH_WRITE, 0);
> +		i2c->pos +=3D i2c->count;
> +		/* Tx must clear thresh after write fifo */
> +		clear_irq_status(i2c, A9_TX_THRESH_WRITE);
> +		break;

[Severity: Medium]
When a zero-length write message (i2c->msg->len =3D=3D 0) is submitted via
aml_i2c_xfer() -> aml_i2c_xfer_msg(), aml_i2c_prepare_xfer() calls
aml_i2c_put_data() and writes 0x00 to REG_CFG_TX before starting the
transfer.

When the transfer finishes and A9_PHY_DONE triggers aml_i2c_irq(), the
A9_STATE_WRITE case runs unconditionally without checking if bytes remain to
be written or if A9_TX_THRESH_WRITE is set. Because i2c->msg->len is still =
0,
aml_i2c_prepare_xfer() -> aml_i2c_put_data() writes a second dummy 0x00 byte
to REG_CFG_TX during completion.

Also, given the comment in aml_i2c_put_data() noting that the hardware must
send at least 1 byte when transferring 0 bytes, does a 0-byte transfer
actually transmit a data byte on the bus? If the controller cannot perform
true zero-length transfers, should aml_i2c_quirks set I2C_AQ_NO_ZERO_LEN
since aml_i2c_func() advertises I2C_FUNC_SMBUS_EMUL (which includes SMBus
Quick commands)?

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
In aml_i2c_do_start(), START_START is written to REG_CFG_START before
clear_irq_status(i2c, IRQ_ALL_MASK) is called and before the threshold
interrupts are enabled in REG_CFG_IRQ_ENABLE.

If execution is delayed between writing REG_CFG_START and clearing
REG_CFG_IRQ_STATE (for instance on PREEMPT_RT where spin_lock_irqsave() does
not disable preemption, or due to an NMI or hypervisor preemption), can the
hardware assert A9_NCK_ERROR or A9_PHY_DONE for the new transfer only for
clear_irq_status(i2c, IRQ_ALL_MASK) to immediately wipe it out, causing
aml_i2c_irq() to miss A9_TRANS_DONE and wait_for_completion_timeout() in
aml_i2c_xfer_msg() to time out?

> +
> +static int aml_i2c_xfer_msg(struct aml_i2c *i2c, struct i2c_msg *msg, bo=
ol last)
> +{
[ ... ]
> +	if (!time_left) {
> +		spin_lock_irqsave(&i2c->lock, flags);
> +		i2c->state =3D A9_STATE_IDLE;
> +		clear_irq_status(i2c, IRQ_ALL_MASK);
> +		reset_fifo_pos(i2c);
> +		spin_unlock_irqrestore(&i2c->lock, flags);
> +		return -ETIMEDOUT;
> +	}

[Severity: High]
When a transfer with msg->len > A9_I2C_FIFO_DEPTH (32 bytes) is started,
aml_i2c_do_start() enables A9_RX_THRESH_READ or A9_TX_THRESH_WRITE in
REG_CFG_IRQ_ENABLE.

If that transfer times out in aml_i2c_xfer_msg(), this timeout path resets
i2c->state, clears REG_CFG_IRQ_STATE, and resets the FIFO pointers, but
unlike complete_irq_out in aml_i2c_irq(), it does not disable
A9_RX_THRESH_READ | A9_TX_THRESH_WRITE in REG_CFG_IRQ_ENABLE, nor does it
clear START_START in REG_CFG_START to halt the controller.

When a subsequent transfer with msg->len <=3D A9_I2C_FIFO_DEPTH runs,
aml_i2c_do_start() skips updating REG_CFG_IRQ_ENABLE:

	if (trans_len > A9_I2C_FIFO_DEPTH) {
		reg_val =3D (msg->flags & I2C_M_RD) ? A9_RX_THRESH_READ : A9_TX_THRESH_WR=
ITE;
		aml_i2c_set_mask(i2c, REG_CFG_IRQ_ENABLE,
				 A9_RX_THRESH_READ | A9_TX_THRESH_WRITE, reg_val);
	}

Because aml_i2c_irq() dispatches strictly on i2c->state without checking
which bit in irq_state triggered the interrupt, won't a stale
A9_TX_THRESH_WRITE interrupt left enabled from a timed-out write fire during
a subsequent <=3D 32-byte read (i2c->state =3D=3D A9_STATE_READ), causing
aml_i2c_irq() to read from an empty REG_CFG_RX FIFO into i2c->msg->buf while
leaving A9_TX_THRESH_WRITE uncleared?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261029-a9-i2c-v3-=
0-7b30ccc00533@amlogic.com?part=3D2
