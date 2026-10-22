Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792662394;
	b=oSOR7X/zZEn/L5gDN6I1oZKvICUGWosUE3BuA5aUvDtlzFXs65ou2gl4EzWctCNfdP7f
	 T4/z1NaA045jrimelfPpkWc3ZQ3svg9u8WeXkoCctsMr3i/9N8YXAFy2JvK9YFVqqAxrm
	 p8L88Bm9j+IC2VKAVZ5n9E9yO6iQ2Emsr1KuOM/LwM9wmQnOo9wOVz9b8zY1Dix0j+BWF
	 Jjcj0g96VaYVzDzAnij+5+kVHIovOKXJ8m0z6HeBYuYxK1sJyPE/jk1NMtc6hjafIbad9
	 PHaZD48KFoMGCRXmhRqmXOOOobS6BZ+A2WxHMSEsIR/tBDr/ahpf2hjdIOhPP//6rTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792662394;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=JBtY2REbjZJlCm+wUUQG7qb/B+U8mdvcqm/HFY1lIp0=;
	b=vdxQ9WyOvbmTPqP2zznEMbzR+7CjU6I4dSd+yUES8AY5+kKqrk5rv0REUoxVHBxsnLRP
	 6w0PqXnmyUXizSm1PKne1BOSskr3eUQWURKQ+Jq/CDt99h+9pBsWSRfn0lJ4X1RFlshzm
	 sE8dZAtPjeXTGAdvbi0kzTihtwPyQL/qpIr+uG5T1ZzLvJlPn2GiosC3mE6Qd8Mmn1ROa
	 OQMqny0c8TB6kr6Dc5ils+GXwIYHJ6FCgpGWLVIdGW00CxLfUbXNUPKAOsOf4eL7PgT+X
	 YKovJR0sImv6XxD4D+h8C4IMIoFFUoExtZgZ27hVkuxbwMXkHu4wIxj6zxvBO+uHOug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hm9AyA4Z;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8992D606A31A
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hm9AyA4Z
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B49711F000C1;
	Thu, 22 Oct 2026 09:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792662394;
	bh=JBtY2REbjZJlCm+wUUQG7qb/B+U8mdvcqm/HFY1lIp0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hm9AyA4ZnFy7ox6UertvxgxIUwLEq8gR3CSfsDxj7Qtnvgd51evvSIHli2wqcRcWb
	 xskt54rS/4WkOsIJxf8UTqusmUGsCyUFbx4L9pvZ+MKLnvRfynS/Kfkzvcis0aOPoh
	 lA/4v2S1NpYvgLxwLHzoHpJ+3p2HVa8rVMTTBfKOKIj/lYZjr6nKbxe0gfPqym/WAf
	 H5NXiO9AMu6fFkHOfVw9pTFvNYTR3nwH8PcliGQfW5DmTQkEG2/LaYip14uE0js70G
	 3yUk58FfETZFDI6UiSOOoQSFYJfQyKJasfQtJ0wTIkyxXhXe8p+twVeUA7WlJls+x4
	 K2TgR3lyiPkBw==
Message-ID: <sashiko-outbox-181284@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] i2c: amlogic: Add Amlogic A9 I2C controller
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xianwei Zhao" <xianwei.zhao@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20261022-a9-i2c-v2-2-45e3cef175bf@amlogic.com>
References: <20261022-a9-i2c-v2-0-45e3cef175bf@amlogic.com>
 <20261022-a9-i2c-v2-2-45e3cef175bf@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 09:46:33 +0000
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
- [High] i2c: amlogic-a9: unlocked state init and late IRQ setup in aml_i2c=
_do_start()
- [High] i2c: amlogic-a9: threshold IRQs left enabled on timeout in aml_i2c=
_xfer_msg()
- [High] i2c: amlogic-a9: unhandled IRQ and spurious complete() in aml_i2c_=
irq()
- [High] i2c: amlogic: missing RX drain in aml_i2c_irq() when A9_PHY_DONE i=
s set
- [Medium] i2c: amlogic-a9: unmasked msg->addr in aml_i2c_do_start() corrup=
ts START_LEN
--

commit 10e276126f680fbcf2e402bbde459a690540ef33
Author: Junyi Zhao <junyi.zhao@amlogic.com>

i2c: amlogic: Add Amlogic A9 I2C controller driver

This commit adds a driver for the I2C controller found on Amlogic A9 SoCs,
along with the corresponding Kconfig, Makefile, and MAINTAINERS entries.

> diff --git a/drivers/i2c/busses/i2c-amlogic-a9.c b/drivers/i2c/busses/i2c=
-amlogic-a9.c
> new file mode 100644
> index 0000000000000..d4954a4fd88ef
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-amlogic-a9.c
> @@ -0,0 +1,469 @@

[ ... ]

> +static irqreturn_t aml_i2c_irq(int irqno, void *dev_id)
> +{
> +	struct aml_i2c *i2c =3D dev_id;
> +	u8 *buf =3D NULL;
> +	int ret;
> +	u32 rd_len, i;
> +	u32 rd_val;
> +
> +	spin_lock(&i2c->lock);
> +	ret =3D controller_is_error(i2c);
> +	if (ret) {
> +		i2c->error =3D ret;
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
> +		if ((i2c->pos + A9_I2C_HALF_FIFO) >=3D i2c->msg->len)
> +			aml_i2c_set_mask(i2c, REG_CFG_IRQ_ENABLE, A9_TX_THRESH_WRITE, 0);
> +		i2c->pos +=3D i2c->count;
> +		/* Tx must clear thresh after write fifo */
> +		clear_irq_status(i2c, A9_TX_THRESH_WRITE);
> +		break;
> +	case A9_STATE_IDLE:
> +		dev_warn(i2c->dev, "i2c irq triggered abnormally, irq_state:0x%x,irq_e=
n:0x%x\n",
> +			 readl(i2c->regs + REG_CFG_IRQ_STATE),
> +			 readl(i2c->regs + REG_CFG_IRQ_ENABLE));
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	if (!controller_is_done(i2c)) {
> +		goto irq_trans_out;
> +	} else {
> +		if (i2c->state =3D=3D A9_STATE_READ && (i2c->msg->len - i2c->pos))
> +			goto irq_trans_out;
> +	}

[Severity: High]
Can a multi-chunk read (msg->len > A9_I2C_FIFO_DEPTH) hang in
drivers/i2c/busses/i2c-amlogic-a9.c:aml_i2c_irq() if the remaining bytes
finish arriving before A9_RX_THRESH_READ is cleared?

In aml_i2c_xfer() -> aml_i2c_xfer_msg() -> aml_i2c_do_start(), a read with
msg->len > 32 enables A9_RX_THRESH_READ alongside A9_PHY_DONE, with
I2C_RX_THR configured to 32. When the first 32 bytes arrive, A9_RX_THRESH_R=
EAD
asserts. If interrupt handling is slightly delayed or the remaining tail by=
tes
finish arriving while the A9_STATE_READ loop is reading the first 32 bytes
from REG_CFG_RX, A9_PHY_DONE will already be set in REG_CFG_IRQ_STATE before
clear_irq_status(i2c, A9_RX_THRESH_READ) runs.

Because A9_STATE_READ only drains up to A9_I2C_FIFO_DEPTH bytes per call,
i2c->msg->len - i2c->pos remains non-zero, and the controller_is_done(i2c)
branch takes goto irq_trans_out without draining the remaining tail bytes or
completing i2c->done. Since A9_PHY_DONE is already asserted and fewer than =
32
bytes remain to re-trigger A9_RX_THRESH_READ, no new rising edge will occur=
 on
the interrupt line, leaving wait_for_completion_timeout() in
aml_i2c_xfer_msg() to time out with -ETIMEDOUT.

Should aml_i2c_irq() drain the remaining bytes in the RX FIFO when
controller_is_done(i2c) is true during A9_STATE_READ before completing the
transfer?

> +
> +complete_irq_out:
> +	reset_fifo_pos(i2c);
> +	complete(&i2c->done);
> +	i2c->state =3D A9_STATE_IDLE;
> +	aml_i2c_set_mask(i2c, REG_CFG_IRQ_ENABLE, A9_RX_THRESH_READ | A9_TX_THR=
ESH_WRITE, 0);
> +	clear_irq_status(i2c, IRQ_ALL_MASK);
> +irq_trans_out:
> +	spin_unlock(&i2c->lock);
> +
> +	return IRQ_HANDLED;
> +}

[Severity: High]
What happens in drivers/i2c/busses/i2c-amlogic-a9.c:aml_i2c_irq() when an
interrupt arrives while i2c->state is A9_STATE_IDLE?

First, controller_is_error(i2c) is checked before inspecting i2c->state. If=
 a
late A9_NCK_ERROR interrupt fires after a transfer has already timed out and
transitioned to A9_STATE_IDLE, aml_i2c_irq() sets i2c->error =3D -ENXIO, ju=
mps
to complete_irq_out, and calls complete(&i2c->done).

Second, in the switch statement, the A9_STATE_IDLE case logs a warning and
breaks into the completion checks:

	if (!controller_is_done(i2c)) {
		goto irq_trans_out;
	}

If a threshold interrupt fires while in A9_STATE_IDLE and controller_is_don=
e()
is false, aml_i2c_irq() jumps to irq_trans_out and returns IRQ_HANDLED with=
out
clearing REG_CFG_IRQ_STATE or masking the threshold interrupt in
REG_CFG_IRQ_ENABLE, leaving the interrupt asserted. Conversely, if
controller_is_done() is true (such as a late A9_PHY_DONE), execution falls
through to complete_irq_out and spuriously signals i2c->done while idle.

Should aml_i2c_irq() check for A9_STATE_IDLE up front, disable threshold
interrupts, clear REG_CFG_IRQ_STATE, and return without calling
complete(&i2c->done)?

> +
> +static void aml_i2c_do_start(struct aml_i2c *i2c, struct i2c_msg *msg)
> +{
> +	unsigned int reg_val;
> +	unsigned int trans_len;
> +
> +	trans_len =3D msg->len;
> +	reg_val =3D (unsigned int)((msg->addr << START_SADDR_SHIFT) |
> +				((msg->flags & I2C_M_RD) ? START_READ : 0) |
> +				((trans_len & 0xfff) << START_LEN_SHIFT) | START_START);
> +	aml_i2c_set_mask(i2c, REG_CFG_START,
> +			 START_START | START_SLAVE_ADDR | START_READ | START_LEN, reg_val);

[Severity: Medium]
In drivers/i2c/busses/i2c-amlogic-a9.c:aml_i2c_do_start(), could upper bits=
 in
msg->addr corrupt the START_LEN field of REG_CFG_START?

When userspace submits an I2C_RDWR ioctl on /dev/i2c-*, msg->addr is a u16
passed through i2cdev_ioctl_rdwr() -> i2c_transfer() -> aml_i2c_xfer() ->
aml_i2c_xfer_msg() -> aml_i2c_do_start() without masking. Because
msg->addr << START_SADDR_SHIFT is not masked to 7 bits (or START_SLAVE_ADDR)
before being ORed with (trans_len & 0xfff) << START_LEN_SHIFT and written v=
ia
aml_i2c_set_mask() under the combined mask START_START | START_SLAVE_ADDR |
START_READ | START_LEN, any bits set in msg->addr[15:11] shift into
START_LEN (GENMASK(23, 12)) and alter the hardware transfer length.

Should msg->addr be masked (for example with 0x7f, since 10-bit addressing =
is
not advertised in aml_i2c_func()) before shifting by START_SADDR_SHIFT?

> +	clear_irq_status(i2c, IRQ_ALL_MASK);
> +	/* enable thresh mode */
> +	if (trans_len > A9_I2C_FIFO_DEPTH) {
> +		reg_val =3D (msg->flags & I2C_M_RD) ? A9_RX_THRESH_READ : A9_TX_THRESH=
_WRITE;
> +		aml_i2c_set_mask(i2c, REG_CFG_IRQ_ENABLE,
> +				 A9_RX_THRESH_READ | A9_TX_THRESH_WRITE, reg_val);
> +	}
> +}
> +
> +static int aml_i2c_xfer_msg(struct aml_i2c *i2c, struct i2c_msg *msg, bo=
ol last)
> +{
> +	unsigned long time_left, flags;
> +	int ret =3D 0;
> +
> +	i2c->msg =3D msg;
> +	i2c->pos =3D 0;
> +	i2c->count =3D 0;
> +	i2c->error =3D 0;
> +
> +	i2c->state =3D (msg->flags & I2C_M_RD) ? A9_STATE_READ : A9_STATE_WRITE;
> +	spin_lock_irqsave(&i2c->lock, flags);
> +	aml_i2c_prepare_xfer(i2c, A9_FIFO_FILL_FULL);
> +	i2c->pos +=3D i2c->count;
> +	spin_unlock_irqrestore(&i2c->lock, flags);
> +	reinit_completion(&i2c->done);
> +
> +	if (last)
> +		aml_i2c_set_mask(i2c, REG_CFG_BUS, BUS_NO_STOP, 0);
> +	else
> +		aml_i2c_set_mask(i2c, REG_CFG_BUS, BUS_NO_STOP, BUS_NO_STOP);
> +	/* Start the transfer */
> +	aml_i2c_do_start(i2c, msg);

[Severity: High]
Can starting the hardware transfer before clearing IRQ status and enabling
threshold interrupts in drivers/i2c/busses/i2c-amlogic-a9.c:aml_i2c_do_star=
t(),
without holding i2c->lock across transfer setup in aml_i2c_xfer_msg(), race
with aml_i2c_irq()?

In aml_i2c_do_start(), setting START_START in REG_CFG_START kicks off the
hardware transaction before clear_irq_status(i2c, IRQ_ALL_MASK) and before
enabling A9_RX_THRESH_READ or A9_TX_THRESH_WRITE in REG_CFG_IRQ_ENABLE:

	aml_i2c_set_mask(i2c, REG_CFG_START,
			 START_START | START_SLAVE_ADDR | START_READ | START_LEN, reg_val);
	clear_irq_status(i2c, IRQ_ALL_MASK);
	/* enable thresh mode */
	if (trans_len > A9_I2C_FIFO_DEPTH) {
		reg_val =3D (msg->flags & I2C_M_RD) ? A9_RX_THRESH_READ : A9_TX_THRESH_WR=
ITE;
		aml_i2c_set_mask(i2c, REG_CFG_IRQ_ENABLE,
				 A9_RX_THRESH_READ | A9_TX_THRESH_WRITE, reg_val);
	}

If the task is preempted or interrupted after writing REG_CFG_START, or if =
the
controller quickly asserts A9_NCK_ERROR (such as on an address NACK) or
A9_PHY_DONE before clear_irq_status() runs, clear_irq_status(i2c, IRQ_ALL_M=
ASK)
can wipe out the newly asserted IRQ status bits and cause
wait_for_completion_timeout() to time out. Similarly, if aml_i2c_irq() runs
and completes on an early NACK before aml_i2c_do_start() updates
REG_CFG_IRQ_ENABLE, the unlocked read-modify-write in aml_i2c_do_start() can
re-enable A9_RX_THRESH_READ or A9_TX_THRESH_WRITE after complete_irq_out
already cleared them.

In addition, in aml_i2c_xfer_msg(), i2c->msg, i2c->pos, i2c->count,
i2c->error, and i2c->state are initialized outside i2c->lock, and i2c->lock=
 is
released before reinit_completion(&i2c->done), REG_CFG_BUS configuration, a=
nd
aml_i2c_do_start(). If a late interrupt from a previous timed-out transfer
arrives while i2c->state is already set to A9_STATE_READ or A9_STATE_WRITE,
aml_i2c_irq() can modify i2c->pos and access the new i2c->msg->buf before t=
he
new transfer begins (and if i2c->pos exceeds the new msg->len in
A9_STATE_READ, the signed subtraction i2c->msg->len - i2c->pos in
min(i2c->msg->len - i2c->pos, A9_I2C_FIFO_DEPTH) will wrap to a large u32 in
rd_len and overflow buf[i2c->pos++]).

Could the state initialization, reinit_completion(), bus configuration, IRQ
status clearing, threshold IRQ setup, and START_START trigger all be perfor=
med
under a single spin_lock_irqsave(&i2c->lock, flags) critical section, with
clear_irq_status() and REG_CFG_IRQ_ENABLE configured before asserting
START_START?

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
> +	spin_lock_irqsave(&i2c->lock, flags);
> +	if (!time_left) {
> +		i2c->state =3D A9_STATE_IDLE;
> +		clear_irq_status(i2c, IRQ_ALL_MASK);
> +		reset_fifo_pos(i2c);
> +		ret =3D -ETIMEDOUT;
> +	}

[Severity: High]
When a transfer with msg->len > A9_I2C_FIFO_DEPTH times out in
drivers/i2c/busses/i2c-amlogic-a9.c:aml_i2c_xfer_msg(), aren't the threshold
interrupts in REG_CFG_IRQ_ENABLE and the active transfer in REG_CFG_START l=
eft
enabled?

In aml_i2c_do_start(), transfers with trans_len > A9_I2C_FIFO_DEPTH enable
A9_RX_THRESH_READ or A9_TX_THRESH_WRITE in REG_CFG_IRQ_ENABLE, and only
update REG_CFG_IRQ_ENABLE when trans_len > A9_I2C_FIFO_DEPTH. On normal
completion in aml_i2c_irq(), complete_irq_out clears A9_RX_THRESH_READ |
A9_TX_THRESH_WRITE in REG_CFG_IRQ_ENABLE, but the !time_left timeout path in
aml_i2c_xfer_msg() does not disable those threshold IRQ bits or stop the
transfer in REG_CFG_START.

If a >32-byte write times out and the next transfer is a short read with
msg->len <=3D 32, wouldn't A9_TX_THRESH_WRITE remain enabled and fire during
A9_STATE_READ, causing aml_i2c_irq() to read from an empty REG_CFG_RX FIFO
into msg->buf?

[ ... ]

> +MODULE_DESCRIPTION("Amlogic I2C Bus driver");
> +MODULE_AUTHOR("Junyi Zhao <junyi.zhao@amlogic.com>");
> +MODULE_LICENSE("GPL");

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022-a9-i2c-v2-=
0-45e3cef175bf@amlogic.com?part=3D2
