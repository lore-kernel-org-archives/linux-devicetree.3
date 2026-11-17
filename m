Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794895636;
	b=Ze9yZ2nvJ4512gBxMfuLmYIMA3BanYw2okMqYLz9yXDwm3gXanvjhn87AGK0Fesng0gd
	 I9OkjmttzrCRZtxfv7xrs07bQhVQ9+uA5vdAaDS99yzP8FPMMYKCov6LkWcApSVvpu0Tl
	 WNCGRwqAgt19EglGI2ZDe5LiRyaQI7jVX/wNsIuRd28x6DLbUlpBwfCe1Lh2AzBgkOVR4
	 xit7+OJfgYEhQVbjCX0eW8B2q4wFgLiljYi65udhE6bkulOZYUTzpNl6JY/j7/gw5QKd2
	 aCk7oxLvfANgxIZWT6yUKEI7mOVAUtCkc2GMBtCSvuX+VU9dBoHY2MZqV4OdOaqarkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794895636;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Pkj1bOJmGhwStbcVBtig6+X3xOLp8HKGqfSBHFXYFWg=;
	b=CrcGuDD6J4BbEWTRXDc7uvRpWG+yHysF78fHWhBDBzRdlrHiVzsRvqXHM771seDN06SR
	 nct7iJ484MD0Akgu6/cgdqGJc4B11E2SAlqn2tja6+rlGNISzmPZoD9Vx6xIt7YZYgxJb
	 9QgRkAFhJSf0HV1hPHN4zJczw++C9rr0HpRuDDwo5Wd1o7qNuEr9K1PYBY7V5FKHCT8h8
	 dw1cXHGhiB1GMVQggdjqDNga6cE+rzdeic2coWiMWHD3TRVjrMjKGGEVs0Umfj0WojvOP
	 wfCvOZ7Tt9UaqSqtPYK9aIJae8HafLadtVM6TDNnVpC285j6xlGv0Yu9heLio4/oPTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E0EscKcz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE138606A31C
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 06:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E0EscKcz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6A741F000C4;
	Tue, 17 Nov 2026 06:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794895636;
	bh=Pkj1bOJmGhwStbcVBtig6+X3xOLp8HKGqfSBHFXYFWg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=E0EscKczHQfqmh4Uzm0CLi+wSI3ByuoAV73srujafaKWc8h+Y+ahLYcmh9Qim5MX9
	 JcRE7GUGA5NLZ+lHjSmD45Poe1ACtsvSRUW6JWeZjjToPZzCtrn/HmM5hoySbrq0yX
	 lV3S5TaILzScYc87/4R9wMQt0ABKuCzUfNc4/8F4qjWH+kWGKX4WUPfYMwyy5h5mOG
	 uxSqR0NVXlWp6Q65idwAHctigFehOvHBHL1gbsWo4IOl6QkapbQJq5S4uQCM7KfooS
	 E9BIfe4KFGlD9np0Mk49oCYJNN9+Oi1iqlvgP16G9jGHA5X3vjAY3KmvX5SH3H66NU
	 SDv0KUifwsYfw==
Message-ID: <sashiko-outbox-218238@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 2/2] i2c: amlogic: Add Amlogic A9 I2C controller
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xianwei Zhao" <xianwei.zhao@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20261117-a9-i2c-v9-2-7b303c894fea@amlogic.com>
References: <20261117-a9-i2c-v9-0-7b303c894fea@amlogic.com>
 <20261117-a9-i2c-v9-2-7b303c894fea@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 06:07:15 +0000
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

commit 03c13e6537d771dbf45284639a6d6d31511b9ee4
Author: Junyi Zhao <junyi.zhao@amlogic.com>

i2c: amlogic: Add Amlogic A9 I2C controller driver

This commit adds an I2C controller driver for Amlogic A9 SoCs, along with
Kconfig, Makefile, and MAINTAINERS entries.

> diff --git a/drivers/i2c/busses/i2c-amlogic-a9.c b/drivers/i2c/busses/i2c=
-amlogic-a9.c
> new file mode 100644
> index 0000000000000..8492c13680aab
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
> +	guard(spinlock)(&i2c->lock);
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
> +		return IRQ_HANDLED;
> +	}

[Severity: Medium]
Can multi-chunk read transfers miss the A9_PHY_DONE interrupt and time out =
in
aml_i2c_xfer_msg()?

Documentation/devicetree/bindings/i2c/amlogic,a9-i2c.yaml specifies a
rising-edge interrupt (interrupts =3D <0 164 1>), which requires a 0-to-1
transition on the interrupt line to latch a new pending interrupt in the GI=
C.
Unlike A9_STATE_WRITE, A9_STATE_READ never disables A9_RX_THRESH_READ when
the remaining bytes fit in the 32-byte FIFO, and irq_state is sampled only
once before reading up to 32 bytes from REG_CFG_RX.

On a 64-byte read, the 32nd byte of the second chunk asserts A9_RX_THRESH_R=
EAD
as soon as it enters the FIFO, before the bus NACK and STOP finish:

aml_i2c_irq()
  irq_state =3D readl(REG_CFG_IRQ_STATE)  /* A9_RX_THRESH_READ */
  readl(REG_CFG_RX) x 32
  /* hardware finishes STOP and sets A9_PHY_DONE in REG_CFG_IRQ_STATE */
  clear_irq_status(A9_RX_THRESH_READ)
    /* A9_PHY_DONE stays high; no 0->1 edge on the IRQ line */
  if (!(irq_state & A9_TRANS_DONE) || ...)
    return IRQ_HANDLED;                 <-- never completes i2c->done

Likewise, if both A9_RX_THRESH_READ and A9_PHY_DONE are already set in
irq_state when more than 32 bytes remain, aml_i2c_irq() drains 32 bytes,
clears only A9_RX_THRESH_READ, and returns early because i2c->pos <
i2c->msg->len.  Because A9_PHY_DONE remains asserted without a new rising
edge and fewer than 32 tail bytes remain in the FIFO, no further interrupt
fires and wait_for_completion_timeout() hangs for 500 ms before returning
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
Should clear_irq_status() and the REG_CFG_IRQ_ENABLE update happen before
setting START_START in REG_CFG_START?

A9_ENABLE_IRQ_BIT (A9_NCK_ERROR | A9_PHY_DONE) is already enabled in
REG_CFG_IRQ_ENABLE from aml_i2c_probe().  If execution is delayed after
writing START_START (for example under CONFIG_PREEMPT_RT or a hypervisor) a=
nd
the transfer immediately NACKs the address or finishes, clear_irq_status(i2=
c,
IRQ_ALL_MASK) wipes out A9_NCK_ERROR or A9_PHY_DONE before aml_i2c_irq()
reads REG_CFG_IRQ_STATE.  aml_i2c_irq() then sees irq_state =3D=3D 0, misses
A9_TRANS_ERROR, reads unpopulated bytes from REG_CFG_RX on a read message,
and returns early without completing i2c->done, causing aml_i2c_xfer_msg() =
to
time out after 500 ms.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-a9-i2c-v9-=
0-7b303c894fea@amlogic.com?part=3D2
