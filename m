Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794917964;
	b=dQNOCWOTTmUgGwCkDzlk33pcMq41wA+jAlAaTB4t554ojQRiP7GveU0phZ7DPOAeBtZ9
	 JJT6gzunZHeCnJycr32Hfx+9NztPFwCaOwXaY/0PItAcDsQ7XCNdsTsJn+yFelPQbxSoz
	 Mj6OfEtoEGvoiOjD/fNWetefKCZMpJ8E5tlOtqLqMt7Q9VbKRIAEeW6bim3CjDqi85Iyo
	 MsKJY8pt1nIb7cL5HZjigauhSB5pSg8fEOx0O7gYIFlbiIFvlMShk64mEzOjs3RW0a98g
	 Nvct4kDaPU6D7gG5ZnOZA1NlIEVC+tQFxyE6Cove/wS5T1Do09joU7L/MUmNWWysEvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794917964;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=n4usXxho+0YSlUHhlo9YvGu77QGGm3+v9Q+5ElnUTrg=;
	b=UgUNx8ZECl5iiBxGA699vo6CuLAbaPzcMzB/xuzlT+ryANa6J7GUXkMoJLFE44lLYDbs
	 nNmESaKE7+Izl3BdD8unZHYcL02ank5emUiAhIrY8Ce/ig1c3ACGaCbgppoZVxvloZpit
	 c/QLHFfGGPYZvDm1n3DuD1XkBpQz4nAQnhbiKIPHr664qp1tXKjl2RXL62XoLCJBC5k8s
	 rrptG6vvy17/YyeyRqubUAXOYpGazNtlJtygbH/HiKB3o1wNBwnFWMCfAtFW7X51kRJfn
	 Bpfo8i4FVt/Vu1aIk9zhpd9mTzHN+yj4iBZW8eb341PsBgsT7HwBRATC16Oc5CguEhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IDZA63TX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6B9606A88D
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 12:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IDZA63TX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94D851F000C7;
	Tue, 17 Nov 2026 12:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794917963;
	bh=n4usXxho+0YSlUHhlo9YvGu77QGGm3+v9Q+5ElnUTrg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IDZA63TX5IHkBK76DI4pPcZ42VU6/mIySKOQEqxuD9AufzUTqIuaWiXwojBxYy+Pz
	 xEJ591gcQLn+Aw3GzeFXIO+yVTgwYT3nu+aLLcSammxCU4BScHa7YUrGc76R7btHsP
	 Ea0nhdqqWJqJjE23uU5j27T97Wvo+80N7/y+pn4KfwudgqCN5rYeF6JOPtfpjSU/jn
	 U+wi8T7EUIFpe62MHSG5HwVOdKqEtDcVFL0Jl4H6piPhv8RtZ7VWAmRZXSggVUgCLx
	 saQGTSeuufmkFRhu3uRArF4a1S5WEeDlWLb5Ds9o2TwGosJVXtOQMOB6+iU9qNofi1
	 +F9ZuWY2VnOtQ==
Message-ID: <sashiko-outbox-218765@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 2/2] i2c: amlogic: Add Amlogic A9 I2C controller
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xianwei Zhao" <xianwei.zhao@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20261117-a9-i2c-v10-2-33ea9aefce20@amlogic.com>
References: <20261117-a9-i2c-v10-0-33ea9aefce20@amlogic.com>
 <20261117-a9-i2c-v10-2-33ea9aefce20@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 12:19:23 +0000
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

commit daa2538f35c86990807d57e4002f2ef5ba34903b
Author: Junyi Zhao <junyi.zhao@amlogic.com>

i2c: amlogic: Add Amlogic A9 I2C controller driver

This commit adds a driver for the I2C controller on Amlogic A9 SoCs,
along with its Kconfig, Makefile, and MAINTAINERS entries.

> diff --git a/drivers/i2c/busses/i2c-amlogic-a9.c b/drivers/i2c/busses/i2c=
-amlogic-a9.c
> new file mode 100644
> index 0000000000000..8ec199eb414ae
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
Can aml_i2c_irq() miss the completion interrupt on multi-chunk transfers
and time out in aml_i2c_xfer_msg()?

The devicetree binding specifies a rising-edge interrupt:

Documentation/devicetree/bindings/i2c/amlogic,a9-i2c.yaml:
        interrupts =3D <0 164 1>;

In aml_i2c_irq(), irq_state is sampled once before draining REG_CFG_RX or
filling REG_CFG_TX.  On a 64-byte read, the 32nd byte of the second chunk
triggers A9_RX_THRESH_READ before the NACK and STOP finish on the bus.  If
A9_PHY_DONE asserts in REG_CFG_IRQ_STATE while the handler is reading the
32 bytes from REG_CFG_RX, clearing A9_RX_THRESH_READ leaves the interrupt
line continuously high (since A9_PHY_DONE is already asserted and enabled)
without generating a new rising edge, while the check against the stale
irq_state sees A9_TRANS_DONE =3D=3D 0 and returns early without completing
i2c->done.

Similarly, if both A9_RX_THRESH_READ and A9_PHY_DONE are already set in
irq_state when more than 32 bytes remain to be read, aml_i2c_irq() reads
only 32 bytes, clears only A9_RX_THRESH_READ, and returns because
i2c->pos < i2c->msg->len.  With fewer than 32 tail bytes left in the RX
FIFO and A9_PHY_DONE left asserted, no rising edge will fire to drain the
remaining bytes or complete the transfer.

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
Should aml_i2c_do_start() clear REG_CFG_IRQ_STATE and enable threshold
interrupts before setting START_START?

Writing START_START starts the hardware transfer immediately while
A9_NCK_ERROR and A9_PHY_DONE are already enabled in REG_CFG_IRQ_ENABLE.
If execution is delayed between writing REG_CFG_START and calling
clear_irq_status(i2c, IRQ_ALL_MASK) (for example under vCPU preemption or
PREEMPT_RT), an address NACK or short fast transfer can assert
A9_NCK_ERROR or A9_PHY_DONE before clear_irq_status() wipes it out.  When
aml_i2c_irq() then runs and reads irq_state =3D=3D 0, it misses A9_TRANS_DO=
NE
and returns without completing i2c->done, causing aml_i2c_xfer_msg() to
time out.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-a9-i2c-v10=
-0-33ea9aefce20@amlogic.com?part=3D2
