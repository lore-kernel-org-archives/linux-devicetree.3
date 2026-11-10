Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794300096;
	b=1cvYBwTG2oYSiMEpA+jIvoxl7X/6XrHOEwo05c5U7RKbTjj9RVxKEhUa2h5O92s+kK5b
	 PYIv8dEl5eZ+HDyc1RWA20e+ioEpQhThAQp9AEWvxmSB1Idi2Ea4x+i8AzEbOAwpJBgL0
	 Ix3jd9SJ7WTDMV8leLIzioZGEUnWfdcy7aXurb+Bo65Yf3KFsa6iDcY6ewahbBwO2CP8H
	 DB7y7n21tKB6HVo6vRLt5vG9GDWSb5doqg+DFXen/A2yVdybtIh2wlR4fFGYrIB/bbobB
	 56f0t+jfNprKVlIQxZ5K7bFdvTfR+zBy1T0En8XhIkqZFahqLX3Ayjmw3phaKfd0W/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794300096;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=9rgKTlMw6fcRUkwTOQ8CZeZpTsNKklCiCM9n3CCbhXk=;
	b=A3EqlpmM0PUifYX4c0DqA8uXq5B2SOK4KTlODn8NHwoO83O1pqiiae9BG7iduUDIS08V
	 cEr3CLnhR2of6PpFd04/wLw671DTLVXbt68YZwAycrB6zomm+NoWY3kRUSVJhGUzTcMbI
	 BYp+YCfzsF6L4x43DEG8gbqE2btE2+aD9u1JlFmiwPCyHYK8yPv+/TvXET4jXKk+O2+Vf
	 1lWRXzMYg08WwSuRTCmO9OY+2RTdfRtkLib/340eRBn2SClAQASX2zrqFtxA+QFhvUdzY
	 H6IpWLy2ZTKXLU8Ad/kxi8akyAxCLn2gYlpFc4Z8t/mbhVFi17GZgp43S4L3dCw2z7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SojWknHx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9CAD606A31C
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 08:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SojWknHx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 140D11F0089F;
	Tue, 10 Nov 2026 08:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794300095;
	bh=9rgKTlMw6fcRUkwTOQ8CZeZpTsNKklCiCM9n3CCbhXk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SojWknHxjS4uEng8btn35+eRYdK06tIb2Mmsme34lyTvTpyi1NCltR+0XOuUAlL+/
	 y6iJXRYPGGKQ6CkWyEejqCz0slbgNWrmWli8H4wI2AgQSoUKpftiK3k0HxPJ7Jz7iS
	 4alOle1RSFCFiaWj+BN8mSePq0VQ9NuVAS+Mn96CdBKhnCDksozHxXa4szfE/FAjgn
	 kMooxubWz8MyXSXY//5Hjmh6ydmCW5m7VyXzJBV+o3jJzGSA9t8+3JhZ6YpYREMbpM
	 A5Z531gYThchvZANKk6LTEE3IO5sBTM1ckI1OM9/p60YQ7aYDReH6QptJLoVefFOr2
	 HoK2ieeOBYLrg==
Message-ID: <sashiko-outbox-206651@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 2/2] i2c: amlogic: Add Amlogic A9 I2C controller
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xianwei Zhao" <xianwei.zhao@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20261110-a9-i2c-v8-2-1e9d2682f86b@amlogic.com>
References: <20261110-a9-i2c-v8-0-1e9d2682f86b@amlogic.com>
 <20261110-a9-i2c-v8-2-1e9d2682f86b@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 08:41:34 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] i2c: amlogic-a9: transfer started before IRQ setup in
  aml_i2c_do_start()
- [Medium] i2c: amlogic-a9: stale irq_state and edge IRQ miss in
  aml_i2c_irq()
--

commit 75985e9b577bcde7a76a8a6f844a5a7564d2426a
Author: Junyi Zhao <junyi.zhao@amlogic.com>

i2c: amlogic: Add Amlogic A9 I2C controller driver

This commit adds an I2C controller driver for Amlogic A9 SoCs along with its
Kconfig, Makefile, and MAINTAINERS entries.

> diff --git a/drivers/i2c/busses/i2c-amlogic-a9.c b/drivers/i2c/busses/i2c=
-amlogic-a9.c
> new file mode 100644
> index 0000000000000..3e08a0333ceea
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
> +	irq_state =3D readl(i2c->regs + REG_CFG_IRQ_STATE);
> +	if (i2c->state =3D=3D A9_STATE_IDLE) {
> +		dev_warn(i2c->dev, "i2c irq triggered abnormally, irq_state:0x%x,irq_e=
n:0x%x\n",
> +			 irq_state, readl(i2c->regs + REG_CFG_IRQ_ENABLE));
> +		goto irq_trans_out;
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
Can multi-chunk reads (msg->len > A9_I2C_FIFO_DEPTH) miss the completion
interrupt and time out in aml_i2c_xfer_msg()?

Documentation/devicetree/bindings/i2c/amlogic,a9-i2c.yaml:
        interrupts =3D <0 164 1>;

The interrupt is rising-edge-triggered (IRQ_TYPE_EDGE_RISING), so the
controller's enabled interrupt output must drop to 0 and transition back to=
 1
to latch a new interrupt in the GIC.

In aml_i2c_irq(), irq_state is sampled once before draining up to 32 bytes
from REG_CFG_RX.  On a 64-byte read, the 32nd byte of the second chunk asse=
rts
A9_RX_THRESH_READ before the final NACK and STOP finish on the bus.  If
A9_PHY_DONE asserts while the handler is reading REG_CFG_RX, prior to
clear_irq_status(i2c, A9_RX_THRESH_READ), the interrupt output stays
continuously high across the clear without generating a new rising edge, wh=
ile
aml_i2c_irq() checks the stale irq_state snapshot and returns without
completing i2c->done.

Similarly, if both A9_RX_THRESH_READ and A9_PHY_DONE are already set in
irq_state while more than 32 bytes remain to be read, aml_i2c_irq() reads 32
bytes, clears only A9_RX_THRESH_READ, and returns early because i2c->pos <
i2c->msg->len.  Because A9_PHY_DONE remains asserted in REG_CFG_IRQ_STATE a=
nd
fewer than 32 tail bytes remain in the FIFO, no new rising edge is generated
and wait_for_completion_timeout() hangs for 500 ms before returning
-ETIMEDOUT.

> +
> +complete_irq_out:
> +	i2c->state =3D A9_STATE_IDLE;
> +	reset_fifo_pos(i2c);
> +	aml_i2c_set_mask(i2c, REG_CFG_IRQ_ENABLE, A9_RX_THRESH_READ | A9_TX_THR=
ESH_WRITE, 0);
> +	complete(&i2c->done);
> +irq_trans_out:
> +	clear_irq_status(i2c, IRQ_ALL_MASK);
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
Does writing START_START to REG_CFG_START before clearing IRQ_ALL_MASK and
enabling threshold interrupts race with hardware completion or NACK?

If execution is delayed between writing REG_CFG_START and calling
clear_irq_status(i2c, IRQ_ALL_MASK) (for example due to vCPU preemption or
PREEMPT_RT spinlock preemption), an address NACK or short transfer can asse=
rt
A9_NCK_ERROR or A9_PHY_DONE and then have its status bits wiped out by
clear_irq_status().  When aml_i2c_irq() then runs, it reads irq_state =3D=
=3D 0,
misses A9_TRANS_ERROR or A9_TRANS_DONE, and returns without completing
i2c->done, causing wait_for_completion_timeout() to time out.  Clearing
REG_CFG_IRQ_STATE and configuring REG_CFG_IRQ_ENABLE before asserting
START_START avoids this window.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110-a9-i2c-v8-=
0-1e9d2682f86b@amlogic.com?part=3D2
