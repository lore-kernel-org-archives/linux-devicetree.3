Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794997206;
	b=uDOC1Xpl3tshd6l2QtCiG2TvaQ3tQ3C8FNUay5MJmb25VUnKc0pkNVoTR+GyWmHkHQs7
	 V/q1qCNPvo/51af1Dxc8ERZCO/cGhr/WygjD4lTrEsA5a34HGT5l/2QHCKgS9rQH3N96I
	 oJKWuHCtbRPBkoQNkadxpVBCkbRbYRlUBm5GD4eXD4oky9Hn6SJBrE1FRwWodfd/9jzBk
	 RBZVPlt+JDTBmQGP+jj84wHyjhVtkSgIy+obE+tbDWaR6yFdsU8BAiK50IKzglU7+a2U+
	 iphVDj91n+3QDVs2OaE2iUalVsJSB1bSKmqheEaYBkq49Njet0bMVT9W/tIBUaV1LHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794997206;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=JnsQmCXjRdvCfa7rFtMJClu/GumOzSB9b5qlE0ziBHA=;
	b=OPfepUygW1O3H1UCabNFGwqHhLgF53/0XsnOHdi/9d8+dupbcjed1qaRAprUZ1FVMK72
	 VCd/cb8orQqcLYKo6QDxoN0ByUU6vjWEGeEkj7kM3jsdqwGMBtb3OvvkoeKGEl5MTB+35
	 rMPL7Za2DPu91y4RI3tyjOcA/tK+cYA9W1Yiycrrv48rnBEE7ymJy0QycWASKQVKBeil1
	 dF2gUUCUCJWgmwbQbazaVPK5k/9uWvK+M2c18cAWnusavoeJMr5ni24EN4vExHYawf//A
	 Mm61N3+RIG+3CZF4GhgpiGOb4MwgdMMeA7LPrf+pWiaDgG27uJVmx3t5KLIZbnQghjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DOkxgQz+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AFBE606A31C
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 10:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DOkxgQz+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AF201F000C6;
	Wed, 18 Nov 2026 10:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794997205;
	bh=JnsQmCXjRdvCfa7rFtMJClu/GumOzSB9b5qlE0ziBHA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DOkxgQz+JPegfqu3sirjOmlV2+as8VLnUcmyRcgOm4CXt5YEQj4Nc5XoxTL9xGnnv
	 YyStur6uB9erivrqnaW3AqbP3xoTvpvSlUb2HySJBQw37utjj4xnWp6RTHyOjq7ens
	 KW06u74VURVhTn/E1SvTuRYdeylAsNqYAeQggzN54gRIo3Fhs4Nu5+kYwBCI6qFSaZ
	 GCnTU1MTej7z7CA34HOXUXDRCXQ07eZ0TzLTg0rJMZ3+WQWlbxAjDaR6IP+P3usCaX
	 BsF/dSfDj1i+Iu9QjidxMdjXHgBlrDlxsvmQ6O3bAEKYunF7+ZlirI/TpcEZGDnopF
	 5YKQeKfOTNy/g==
Message-ID: <sashiko-outbox-220673@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 2/2] i2c: amlogic: Add Amlogic A9 I2C controller
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xianwei Zhao" <xianwei.zhao@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20261118-a9-i2c-v12-2-fc83c53121e6@amlogic.com>
References: <20261118-a9-i2c-v12-0-fc83c53121e6@amlogic.com>
 <20261118-a9-i2c-v12-2-fc83c53121e6@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 10:20:04 +0000
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

commit ce6e05692c16fd50e5f34df38eaf42209813110e
Author: Junyi Zhao <junyi.zhao@amlogic.com>

i2c: amlogic: Add Amlogic A9 I2C controller driver

This commit adds the I2C controller driver for Amlogic A9 SoCs along with i=
ts
Kconfig, Makefile, and MAINTAINERS entries.

> diff --git a/drivers/i2c/busses/i2c-amlogic-a9.c b/drivers/i2c/busses/i2c=
-amlogic-a9.c
> new file mode 100644
> index 0000000000000..d25bd50e78f6d
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
> +	    (i2c->state =3D=3D A9_STATE_READ && i2c->pos < i2c->msg->len))
> +		return IRQ_HANDLED;

[Severity: Medium]
Can aml_i2c_irq() miss A9_TRANS_DONE on multi-chunk transfers and cause
wait_for_completion_timeout() to time out?

The binding specifies a rising-edge interrupt (IRQ_TYPE_EDGE_RISING), which
requires (REG_CFG_IRQ_STATE & REG_CFG_IRQ_ENABLE) to drop to 0 and transiti=
on
back to 1 to latch a new interrupt in the GIC:

Documentation/devicetree/bindings/i2c/amlogic,a9-i2c.yaml:
    ...
        interrupts =3D <0 164 1>;
    ...

On a multi-chunk read whose length is a multiple of A9_I2C_FIFO_DEPTH (32),
such as 64 bytes, A9_RX_THRESH_READ remains enabled for the final 32-byte
chunk and fires as soon as the 32nd byte enters the RX FIFO, before the fin=
al
NACK and STOP finish on the bus:

CPU0                              I2C HW
aml_i2c_irq()
  irq_state =3D readl(REG_CFG_IRQ_STATE)
  /* A9_RX_THRESH_READ only */
  read 32 bytes from REG_CFG_RX
                                  STOP finishes:
                                  REG_CFG_IRQ_STATE |=3D A9_PHY_DONE
  clear_irq_status(A9_RX_THRESH_READ)
  /* A9_PHY_DONE keeps IRQ line high; no new rising edge */
  !(irq_state & A9_TRANS_DONE)
    return IRQ_HANDLED            <-- completion missed, hangs 500 ms

Because irq_state is not re-read after draining or filling the FIFO, the sa=
me
miss happens if A9_PHY_DONE or A9_NCK_ERROR asserts while A9_STATE_WRITE is
filling REG_CFG_TX before clear_irq_status(i2c, A9_TX_THRESH_WRITE).

Similarly, if both A9_RX_THRESH_READ and A9_PHY_DONE are already set in
irq_state when more than 32 bytes remain to be read, aml_i2c_irq() reads on=
ly
32 bytes, clears only A9_RX_THRESH_READ, and returns early because
i2c->pos < i2c->msg->len, leaving A9_PHY_DONE continuously asserted with no
further rising edge to read the remaining bytes or complete the transfer.

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
Can clear_irq_status(i2c, IRQ_ALL_MASK) wipe out interrupt status bits for
the transfer that was just started by writing START_START to REG_CFG_START?

CPU0                              I2C HW
aml_i2c_xfer_msg()
  aml_i2c_do_start()
    writel(..., REG_CFG_START)
                                  address NACK or fast transfer finishes:
                                  REG_CFG_IRQ_STATE |=3D A9_NCK_ERROR
                                  GIC latches rising-edge IRQ
    clear_irq_status(IRQ_ALL_MASK)
  spin_unlock_irqrestore()
aml_i2c_irq()
  irq_state =3D readl(REG_CFG_IRQ_STATE) /* 0 */
  switch (i2c->state)
    /* reads empty RX FIFO or writes extra TX FIFO bytes */
  !(irq_state & A9_TRANS_DONE)
    return IRQ_HANDLED            <-- never completes, times out

If the CPU is delayed between writing REG_CFG_START and clearing
REG_CFG_IRQ_STATE (for example under CONFIG_PREEMPT_RT where spinlock_t is
preemptible, or on a vCPU), clearing IRQ_ALL_MASK after asserting START_STA=
RT
discards the newly asserted status bits.  When aml_i2c_irq() runs for the
already-latched edge interrupt, it sees irq_state =3D=3D 0, misses A9_TRANS=
_ERROR,
unconditionally accesses the FIFO in the switch (i2c->state) block, and
returns without completing i2c->done.

Clearing REG_CFG_IRQ_STATE and enabling the threshold interrupts in
REG_CFG_IRQ_ENABLE before asserting START_START in REG_CFG_START would avoid
this race.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118-a9-i2c-v12=
-0-fc83c53121e6@amlogic.com?part=3D2
