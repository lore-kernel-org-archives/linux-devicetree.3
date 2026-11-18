Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794987645;
	b=WsmgZCIG7TQ9TOkGR3dU9kw7SHdrrl8RGIbcjDwaiNyVprNIZDL2Vjcxghp6f3gWL8mh
	 +6mxhb7RX2Y1T0QcJhV/3af/FI3HG4ZTtSdrwP2TyG337eTX4OMAbghROKdqNwkel2QRH
	 5j7nJko0vWZY4jsudDdF8lcA0irXjQ7SWDmcKL/sH85sHpxcOvIlBwqp9cRPp1OqqKVDC
	 USLUAh8YCgRjDLtlFZipGlFg9yMoCOaElJ6F271yfECDAMbIOMOJnvwx9daHXzVqUZxZv
	 OXX2LkmUlGePckTNOR8TXbIhqd/cjny3gDEpLcw711fl+prwaV5/Z45sPMwgtQce+gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794987645;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=fwcTKS4wj4k6U6GuJD2rx7VTQUh26juZW+bkpxx6fFc=;
	b=ocJkpSgsOpDEJyLEZhKI62BoB9cuKeKfz27kZvu3bKCA9VTPvEoo3a2Q7o91/xH8Bgre
	 YGhnotmrsFbQnAsaMWlUoRnz9XiPi9dUpCC6G8Z1Ov/a9xRYj4+u+VgdUCmLxCKVCewjk
	 A3ihwh6NWTnlgvIuaOSR2qDcPliuJg/te9J7+D4HbLCSKlXbuuBe979/jIxKuTRARkLl3
	 YqrblA6vALV8WiA6WFwN2kTQxpIEYx3SPciAeWcKSpjsQT8Udcl751Lq3Ha6GazDFYfX8
	 tmykUBU5Bu5qTyEtSKyqEGgSeJhXzU9qm05MyNaTC5AOAd0oh/fShIorXBLPVR/rWkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KGk1klND;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1FC606A31C
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 07:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KGk1klND
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 749F61F000C4;
	Wed, 18 Nov 2026 07:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794987644;
	bh=fwcTKS4wj4k6U6GuJD2rx7VTQUh26juZW+bkpxx6fFc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KGk1klNDRPdTEvZetYbAqPP9OvCM8p7hO+NiZwDYQqPSa2yFejbupZwhp5N+O9cL8
	 AqGJJCXwCxX7U4AYNTZb/zT0MEaqFRAMMkbozOGVQ9030AbwUGTUH+ZOIl9RI0EDgA
	 bt0Krb4hHXGSVuEr9XI6OMAkdZJJICeSm0mk+dfYo3jLXjYBrGZ9AR12TLJOGHaqb+
	 BSvJHSJ1x2z7QfruiWazNJjBX9346Nih4xs9s9RUvYDe0j0TQLhfxudmmwRaut/7mn
	 SoPKuVnJZcQlFNeNcGXSuVuok95IRFCtbA0G4l4LrVPt+vNQFbRsjRGUdWaWjsb1vL
	 n7a8sgb+oK+aA==
Message-ID: <sashiko-outbox-220323@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 2/2] i2c: amlogic: Add Amlogic A9 I2C controller
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xianwei Zhao" <xianwei.zhao@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20261118-a9-i2c-v11-2-68a3e79ff43a@amlogic.com>
References: <20261118-a9-i2c-v11-0-68a3e79ff43a@amlogic.com>
 <20261118-a9-i2c-v11-2-68a3e79ff43a@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 07:40:43 +0000
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

commit f0387049df50978b17672f0e9a9fea887c6cbc34
Author: Junyi Zhao <junyi.zhao@amlogic.com>

i2c: amlogic: Add Amlogic A9 I2C controller driver

This commit adds a driver for the I2C controller on Amlogic A9 SoCs along
with Kconfig, Makefile, and MAINTAINERS entries.

> diff --git a/drivers/i2c/busses/i2c-amlogic-a9.c b/drivers/i2c/busses/i2c=
-amlogic-a9.c
> new file mode 100644
> index 0000000000000..db1a081b2a148
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
> +	    (i2c->state =3D=3D A9_STATE_READ && i2c->pos < i2c->msg->len))
> +		return IRQ_HANDLED;

[Severity: Medium]
Can multi-chunk transfers miss the completion interrupt and time out when
A9_PHY_DONE asserts before clear_irq_status() clears the threshold bit?

The devicetree binding specifies a rising-edge interrupt
(IRQ_TYPE_EDGE_RISING), which needs the controller's interrupt output to
drop to 0 and transition back to 1 to latch a new interrupt in the GIC:

Documentation/devicetree/bindings/i2c/amlogic,a9-i2c.yaml:
    interrupts =3D <0 164 1>;

On a 64-byte read, the 32nd byte of the second chunk asserts
A9_RX_THRESH_READ as soon as it enters the RX FIFO, before the NACK and
STOP condition finish on the bus.  If A9_PHY_DONE asserts in
REG_CFG_IRQ_STATE while the loop is reading the 32 bytes from REG_CFG_RX,
clearing A9_RX_THRESH_READ afterward leaves the interrupt line
continuously high without generating a new rising edge.  Because
irq_state was sampled only once at entry, the check against A9_TRANS_DONE
sees the stale value without A9_PHY_DONE and returns IRQ_HANDLED without
completing i2c->done, hanging wait_for_completion_timeout() for 500 ms.

Similarly, if both A9_RX_THRESH_READ and A9_PHY_DONE are already set at
entry when more than 32 bytes remain to be read, aml_i2c_irq() reads only
32 bytes, clears only A9_RX_THRESH_READ, and returns early because
i2c->pos < i2c->msg->len.  With A9_PHY_DONE still asserted and fewer than
32 tail bytes left in the FIFO, the interrupt output stays high and no
further edge interrupt fires to drain the rest of the message.

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
Can clear_irq_status(i2c, IRQ_ALL_MASK) wipe out status bits for the
transfer that START_START just launched?

aml_i2c_do_start() writes START_START to REG_CFG_START while
A9_ENABLE_IRQ_BIT (A9_NCK_ERROR | A9_PHY_DONE) is already enabled in
REG_CFG_IRQ_ENABLE, and only then clears IRQ_ALL_MASK and enables the
threshold interrupts.  If the CPU is delayed between those MMIO writes
(for example under CONFIG_PREEMPT_RT or vCPU preemption) and an address
NACK or short transfer completes in the meantime:

aml_i2c_xfer_msg()
  aml_i2c_do_start()
    aml_i2c_set_mask(..., REG_CFG_START, ..., START_START)
    /* hardware finishes or NACKs, asserting A9_NCK_ERROR / A9_PHY_DONE */
    clear_irq_status(i2c, IRQ_ALL_MASK)  <-- clears new status bits
  unlock(&i2c->lock)
  <hardirq>
    aml_i2c_irq()
      irq_state =3D readl(... + REG_CFG_IRQ_STATE)  /* reads 0 */
      /* misses A9_TRANS_ERROR, reads garbage from REG_CFG_RX */
      if (!(irq_state & A9_TRANS_DONE) || ...)
        return IRQ_HANDLED;  <-- never completes i2c->done

wait_for_completion_timeout() then stalls for 500 ms and fails with
-ETIMEDOUT.  Clearing REG_CFG_IRQ_STATE and enabling the threshold
interrupts before setting START_START avoids this race.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118-a9-i2c-v11=
-0-68a3e79ff43a@amlogic.com?part=3D2
