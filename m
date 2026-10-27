Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102408;
	b=zft/v1euJlu9PO3+XvFMnUZtW5JrtnxAHo6Z7SptNkuWHB10Ie5L8XXsU4Tg4A1P4cbh
	 cISOUHCPE4AS/0IOyyTwq2w/ly5t/V00yeQ1y1SIhXFaIM5YiIS8OT1sgNjsACdoLINtI
	 AgLAuVX6dEkZ6OLzEP1LalNWh/2bUPx5lHj5ZONQHvAyb6qUvCBSbyeeHjc59F2rOKjsr
	 VvP39ygu8GsVLr63o1uKJmWlhyfCTl1NzOf6hokSCgJttvWKvxwdMlLfJbITLG0hX8WJX
	 eMeOXQ3okUUm3yaRQ/o+x8Pv0Sle5sFKDE9M0SIqa3GbE99WSJkiEhJTNNEWEy7fE1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102408;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=6IUGVOTUcev13udqDXIfFvIWE6rI4hxIBib+NAbAhsE=;
	b=ABudoL9NFR+/e6YfZzS9gNS2mTYYKl2a0FwCeps9T4MMM8TJvR1i107YO0H72Rd6ICaD
	 bMA2x3+WDKAOgX1/xdgjRdvDSQGFrQONv4evhHXvo0AKJHEOmVIJhUgSkMQrPKZXXhcUq
	 T2PQexJZMDiMveF0Q3wYfWq4HfZJDk4eo2ieu7JlbJEy9KgBd/gBVias9CTbNIkmVtyDd
	 ShhAlWXqo9kunYVZ9OBVmoNkmFyTR3mg0sLVHe3p3AJO/b72avH60qYhpK15EUn2UFVso
	 xf6GNxjvuawQluRJ4ai9HnYMMUfvw+eO6awVqDNSMQJP0jjYz6+4jYzch6iuR9CCtYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bwKLhqpT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2792606A322
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 12:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bwKLhqpT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FE1D1F01825;
	Tue, 27 Oct 2026 12:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793102407;
	bh=6IUGVOTUcev13udqDXIfFvIWE6rI4hxIBib+NAbAhsE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bwKLhqpTCypcLd6kbKIQuCJW1o73sl9DuWXaK4n6FTNqQSJRsAtBCgPDlXSHL84Rd
	 Cfcw2V0ETb02HQ1ENCJAGUPCTslVyCJiupSGFwK0ZwL/WsftA5SuLEgRnypJjIv48K
	 r3VzUMIlN9sulAhprI+dKA8nVbvqQp1AY9n2Kniog9HHbrEMOrTxEgeVuEl9pMpqcC
	 esoByvjeEotGmUulQKNGlCVS+74UBqJy821OTdUXCcZMzC1OTjSTRZqhZuaMHQzOky
	 kPIqbAtBj64vJI1gpaDGhCoKRxaPoe3Jk+wAei4cJCQ7gCt78MCXfdBErmFInXMrqM
	 uw97PtD/XIrag==
Message-ID: <sashiko-outbox-186492@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] i2c: Add Synopsys Advanced I2C (DWC_i2c) driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aniket Limaye" <a-limaye@ti.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261027-tda54-upstream-i2c-v4-2-ebeeaf87d181@ti.com>
References: <20261027-tda54-upstream-i2c-v4-0-ebeeaf87d181@ti.com>
 <20261027-tda54-upstream-i2c-v4-2-ebeeaf87d181@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 12:00:05 +0000
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
- [High] i2c: dwc-adv: IRQ storm and read deadlocks in dwc_adv_i2c_xfer_msg=
()
- [High] i2c: dwc-adv: lost repeated START on reads in dwc_adv_i2c_xfer_msg=
()
- [High] i2c: dwc-adv: false spurious STOP error in dwc_adv_i2c_process_tra=
nsfer()
- [High] i2c: dwc-adv: unclocked MMIO access in dwc_adv_i2c_isr() when PM d=
isabled
- [High] i2c: dwc-adv: unclocked MMIO access in dwc_adv_i2c_prepare_recover=
y()
--

commit 65be539e602e2870e8d704876155ca1ec922d703
Author: Aniket Limaye <a-limaye@ti.com>

i2c: Add Synopsys Advanced I2C (DWC_i2c) driver

This commit adds a new platform driver for the Synopsys Advanced I2C
(DWC_i2c) controller in controller mode, discovering block register offsets
at runtime by walking the block header chain.

> diff --git a/drivers/i2c/busses/i2c-dwc-adv.c b/drivers/i2c/busses/i2c-dw=
c-adv.c
> new file mode 100644
> index 0000000000000..1c5b7b154bed8
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-dwc-adv.c
> @@ -0,0 +1,1333 @@

[ ... ]

> +static void dwc_adv_i2c_init(struct dwc_adv_i2c_dev *dev)
> +{
> +	__dwc_adv_i2c_disable(dev);
> +
> +	dwc_adv_i2c_write_timings(dev);
> +
> +	if (dev->sda_hold_time)
> +		dwc_adv_reg_write(dev, dev->regs.sda_hold, dev->sda_hold_time);
> +
> +	dwc_adv_reg_write(dev, dev->regs.tx_tl, dev->tx_fifo_depth / 2);
> +	dwc_adv_reg_write(dev, dev->regs.rx_tl, 0);
> +	dwc_adv_reg_write(dev, dev->regs.con, dev->ctrlr_cfg);
> +}

[ ... ]

> +static void dwc_adv_i2c_xfer_msg(struct dwc_adv_i2c_dev *dev)
> +{
> +	struct i2c_msg *msgs =3D dev->msgs;
> +	u32 intr_mask =3D DWC_ADV_I2C_CTRLR_INTR_MASK;
> +	int tx_limit, rx_limit;
> +	u32 buf_len =3D dev->tx_buf_len;
> +	u8 *buf =3D dev->tx_buf;
> +	u32 cmd;
> +	int rx_tl;
> +
> +	for (; dev->msg_write_idx < dev->msgs_num; dev->msg_write_idx++) {
> +		u32 flags =3D msgs[dev->msg_write_idx].flags;
> +
> +		if (!(dev->status & DWC_ADV_I2C_STATUS_SW_WRITE_IN_PROGRESS)) {
> +			buf =3D msgs[dev->msg_write_idx].buf;
> +			buf_len =3D msgs[dev->msg_write_idx].len;
> +		}
> +
> +		tx_limit =3D dev->tx_fifo_depth - dwc_adv_reg_read(dev, dev->regs.txfl=
r);
> +		rx_limit =3D dev->rx_fifo_depth - dwc_adv_reg_read(dev, dev->regs.rxfl=
r);
> +
> +		while (buf_len > 0 && tx_limit > 0 && rx_limit > 0) {
> +			cmd =3D 0;
> +
> +			/*
> +			 * The bus is held while the TX FIFO is empty unless
> +			 * STOP is requested in IC_DATA_CMD, so always set it
> +			 * on the last byte of the last message.
> +			 *
> +			 * i2c-core always sets the buffer length of
> +			 * I2C_FUNC_SMBUS_BLOCK_DATA to 1. The length will be
> +			 * adjusted when receiving the first byte. Thus we
> +			 * can't stop the transaction here.
> +			 */
> +			if (dev->msg_write_idx =3D=3D dev->msgs_num - 1 &&
> +			    buf_len =3D=3D 1 && !(flags & I2C_M_RECV_LEN))
> +				cmd |=3D DWC_ADV_I2C_DATA_CMD_STOP;
> +
> +			/*
> +			 * A RESTART is only issued automatically when the
> +			 * direction changes. Request it explicitly at the
> +			 * start of each following message.
> +			 */
> +			if (dev->need_restart) {
> +				cmd |=3D DWC_ADV_I2C_DATA_CMD_RESTART;
> +				dev->need_restart =3D false;
> +			}
> +
> +			if (msgs[dev->msg_write_idx].flags & I2C_M_RD) {
> +				/* Avoid rx buffer overrun */
> +				if (dev->rx_outstanding >=3D dev->rx_fifo_depth)
> +					break;

[Severity: High]
Can dwc_adv_i2c_xfer_msg() lose the repeated start condition between
consecutive I2C_M_RD messages when dev->rx_outstanding reaches
dev->rx_fifo_depth?

When a message finishes queueing (buf_len =3D=3D 0), dwc_adv_i2c_xfer_msg()
sets dev->need_restart =3D true and advances dev->msg_write_idx to the next
message. If the next message is an I2C_M_RD message and at least one
previously queued command has been popped from the TX FIFO into the shift
register (tx_limit > 0) while the RX FIFO is not yet full (rx_limit > 0),
execution enters the inner while loop:

    if (dev->need_restart) {
        cmd |=3D DWC_ADV_I2C_DATA_CMD_RESTART;
        dev->need_restart =3D false;
    }

    if (msgs[dev->msg_write_idx].flags & I2C_M_RD) {
        /* Avoid rx buffer overrun */
        if (dev->rx_outstanding >=3D dev->rx_fifo_depth)
            break;

If dev->rx_outstanding >=3D dev->rx_fifo_depth, the loop breaks before
writing cmd to dev->regs.data_cmd, discarding cmd after dev->need_restart
has already been cleared to false. When RX_FULL later drains the RX FIFO
and dwc_adv_i2c_xfer_msg() resumes queueing the first byte of that read
message, dev->need_restart is false, so DWC_ADV_I2C_DATA_CMD_RESTART is
never issued on the bus.

Should the dev->rx_outstanding >=3D dev->rx_fifo_depth check happen before
consuming dev->need_restart?

> +				dwc_adv_reg_write(dev, dev->regs.data_cmd,
> +						  cmd | DWC_ADV_I2C_DATA_CMD_READ);
> +				rx_limit--;
> +				dev->rx_outstanding++;
> +			} else {
> +				dwc_adv_reg_write(dev, dev->regs.data_cmd, cmd | *buf++);
> +			}
> +			tx_limit--;
> +			buf_len--;
> +		}
> +
> +		dev->tx_buf =3D buf;
> +		dev->tx_buf_len =3D buf_len;
> +
> +		/*
> +		 * Because we don't know the buffer length in the
> +		 * I2C_FUNC_SMBUS_BLOCK_DATA case, we can't stop the
> +		 * transaction here. Also disable the TX_EMPTY IRQ while
> +		 * waiting for the data length byte to avoid a flood of
> +		 * bogus interrupts.
> +		 */
> +		if (flags & I2C_M_RECV_LEN) {
> +			dev->status |=3D DWC_ADV_I2C_STATUS_SW_WRITE_IN_PROGRESS;
> +			intr_mask &=3D ~DWC_ADV_I2C_INTR_TX_EMPTY;
> +			break;
> +		}
> +
> +		if (buf_len > 0) {
> +			dev->status |=3D DWC_ADV_I2C_STATUS_SW_WRITE_IN_PROGRESS;
> +			break;
> +		}
> +		dev->status &=3D ~DWC_ADV_I2C_STATUS_SW_WRITE_IN_PROGRESS;
> +		dev->need_restart =3D true;
> +	}
> +
> +	/*
> +	 * If i2c_msg index search is completed, we don't need TX_EMPTY
> +	 * interrupt any more.
> +	 */
> +	if (dev->msg_write_idx =3D=3D dev->msgs_num)
> +		intr_mask &=3D ~DWC_ADV_I2C_INTR_TX_EMPTY;
> +
> +	if (dev->msg_err)
> +		intr_mask =3D 0;
> +
> +	/*
> +	 * Size the RX FIFO threshold to the reads already queued, so the
> +	 * controller raises one RX_FULL for the whole burst instead of one per
> +	 * received byte. While messages remain to be queued, cap it so RX_FULL
> +	 * still arrives in time to drain the FIFO and let the next TX_EMPTY
> +	 * queue the rest.
> +	 */
> +	rx_tl =3D dev->rx_outstanding;
> +	if (dev->msg_write_idx < dev->msgs_num)
> +		rx_tl =3D min_t(int, rx_tl, dev->rx_fifo_depth / 2);
> +	dwc_adv_reg_write(dev, dev->regs.rx_tl, rx_tl ? rx_tl - 1 : 0);
> +
> +	dwc_adv_reg_write(dev, dev->regs.intr_mask, intr_mask);
> +}

[Severity: High]
Can the FIFO threshold and DWC_ADV_I2C_INTR_TX_EMPTY handling in
dwc_adv_i2c_xfer_msg() and dwc_adv_i2c_read() cause a hardirq storm on
reads larger than rx_fifo_depth, or a transfer timeout on I2C_M_RECV_LEN
reads?

There appear to be three related issues here:

1. On a read transfer larger than dev->rx_fifo_depth (32 bytes on
ti,tda54-i2c), dwc_adv_i2c_init() sets dev->regs.tx_tl to
dev->tx_fifo_depth / 2 (16), so DWC_ADV_I2C_INTR_TX_EMPTY asserts whenever
txflr <=3D 16. Meanwhile, while dev->msg_write_idx < dev->msgs_num,
dwc_adv_i2c_xfer_msg() caps rx_tl to dev->rx_fifo_depth / 2 (16) and writes
rx_tl - 1 (15) to dev->regs.rx_tl, so DWC_ADV_I2C_INTR_RX_FULL only asserts
when rxflr >=3D 16.

After the initial TX_EMPTY interrupt queues 32 read commands
(dev->rx_outstanding =3D 32), the controller pops the 16th read command from
the TX FIFO into the shift register at the start of clocking that byte on
the bus. At that point txflr drops to 16 and asserts TX_EMPTY, while only
15 bytes have arrived in the RX FIFO (rxflr =3D=3D 15, or fewer if write by=
tes
preceded the read), so RX_FULL is not set and dwc_adv_i2c_read() does not
run. dwc_adv_i2c_xfer_msg() then sees dev->rx_outstanding >=3D
dev->rx_fifo_depth, breaks out of the loop without writing to
dev->regs.data_cmd, and leaves DWC_ADV_I2C_INTR_TX_EMPTY unmasked in
dev->regs.intr_mask. Because txflr remains <=3D 16, the level-triggered
TX_EMPTY interrupt will re-fire in a tight hardirq loop until the 16th byte
finishes shifting in.

2. In dwc_adv_i2c_xfer_msg(), flags & I2C_M_RECV_LEN is checked before
buf_len > 0:

    if (flags & I2C_M_RECV_LEN) {
        dev->status |=3D DWC_ADV_I2C_STATUS_SW_WRITE_IN_PROGRESS;
        intr_mask &=3D ~DWC_ADV_I2C_INTR_TX_EMPTY;
        break;
    }

    if (buf_len > 0) {
        dev->status |=3D DWC_ADV_I2C_STATUS_SW_WRITE_IN_PROGRESS;
        break;
    }

If an I2C_M_RECV_LEN message is reached when tx_limit =3D=3D 0, rx_limit =
=3D=3D 0,
or dev->rx_outstanding >=3D dev->rx_fifo_depth (for example, after preceding
messages filled the FIFO), the inner while loop does not execute and
buf_len remains 1. Checking I2C_M_RECV_LEN before buf_len > 0 masks
DWC_ADV_I2C_INTR_TX_EMPTY before the initial 1-byte length read command has
even been queued into the TX FIFO, stalling the transfer until timeout.

3. When an I2C_M_RECV_LEN message has its initial 1-byte read command
queued after earlier read bytes such that dev->rx_outstanding > 16 (for
example, a 20-byte read message followed by an I2C_M_RECV_LEN message,
giving dev->rx_outstanding =3D=3D 21), dwc_adv_i2c_xfer_msg() masks
DWC_ADV_I2C_INTR_TX_EMPTY and caps dev->regs.rx_tl to 15. When the first 16
bytes arrive, RX_FULL fires and dwc_adv_i2c_read() drains 16 bytes,
reducing dev->rx_outstanding to 5 and returning early because the first
message still has 4 bytes remaining. Because TX_EMPTY is masked and
dwc_adv_i2c_read() does not update dev->regs.rx_tl, dev->regs.rx_tl stays
at 15 while only 5 bytes remain in flight, so RX_FULL never fires again to
reach dwc_adv_i2c_recv_len() and re-enable TX_EMPTY.

[ ... ]

> +static u32 dwc_adv_i2c_read_clear_intrbits(struct dwc_adv_i2c_dev *dev)
> +{
> +	u32 stat =3D dwc_adv_reg_read(dev, dev->regs.intr_stat);
> +

[ ... ]

> +	if (stat & DWC_ADV_I2C_INTR_STOP_DET &&
> +	    (dev->rx_outstanding =3D=3D 0 || (stat & DWC_ADV_I2C_INTR_RX_FULL)))
> +		dwc_adv_i2c_ack_intr(dev, DWC_ADV_I2C_INTR_CLR_STOP_DET);
> +	if (stat & DWC_ADV_I2C_INTR_START_DET)
> +		dwc_adv_i2c_ack_intr(dev, DWC_ADV_I2C_INTR_CLR_START_DET);
> +	if (stat & DWC_ADV_I2C_INTR_GEN_CALL)
> +		dwc_adv_i2c_ack_intr(dev, DWC_ADV_I2C_INTR_CLR_GEN_CALL);
> +
> +	return stat;
> +}
> +
> +static void dwc_adv_i2c_process_transfer(struct dwc_adv_i2c_dev *dev, u3=
2 stat)
> +{
> +	if (stat & DWC_ADV_I2C_INTR_TX_ABRT) {
> +		/* TX_ABRT flushes the TX/RX FIFOs, nothing left to process */
> +		dev->cmd_err |=3D DWC_ADV_I2C_INTR_TX_ABRT;
> +		dev->status &=3D ~DWC_ADV_I2C_STATUS_SW_MASK;
> +		dev->rx_outstanding =3D 0;
> +		dwc_adv_reg_write(dev, dev->regs.intr_mask, 0);
> +		goto tx_aborted;
> +	}
> +
> +	if (stat & DWC_ADV_I2C_INTR_RX_FULL)
> +		dwc_adv_i2c_read(dev);
> +
> +	if (stat & DWC_ADV_I2C_INTR_TX_EMPTY)
> +		dwc_adv_i2c_xfer_msg(dev);
> +
> +	/* A STOP in the middle of a read or write is an error */
> +	if ((stat & DWC_ADV_I2C_INTR_STOP_DET) &&
> +	    (dev->status & (DWC_ADV_I2C_STATUS_SW_WRITE_IN_PROGRESS |
> +			     DWC_ADV_I2C_STATUS_SW_READ_IN_PROGRESS))) {
> +		dev_err(dev->dev, "spurious STOP, status 0x%x\n", dev->status);
> +		dev->rx_outstanding =3D 0;
> +		dev->msg_err =3D -EIO;
> +	}

[Severity: High]
Won't dwc_adv_i2c_process_transfer() falsely abort valid multi-batch read
transfers with -EIO when DWC_ADV_I2C_INTR_STOP_DET is raised before the
final DWC_ADV_I2C_INTR_RX_FULL?

In dwc_adv_i2c_read_clear_intrbits(), DWC_ADV_I2C_INTR_STOP_DET is kept
pending in hardware when dev->rx_outstanding > 0 and
DWC_ADV_I2C_INTR_RX_FULL is not set, because STOP_DET can assert at the end
of a read transfer before the final byte triggers RX_FULL. However,
dwc_adv_i2c_read_clear_intrbits() still returns stat with
DWC_ADV_I2C_INTR_STOP_DET set.

On a read transfer where an earlier partial RX FIFO drain in
dwc_adv_i2c_read() set DWC_ADV_I2C_STATUS_SW_READ_IN_PROGRESS in
dev->status (such as a read larger than rx_fifo_depth / 2 or an
I2C_M_RECV_LEN block read), if STOP_DET fires before RX_FULL is set in
stat, dwc_adv_i2c_read() is not called, so
DWC_ADV_I2C_STATUS_SW_READ_IN_PROGRESS remains set.
dwc_adv_i2c_process_transfer() then sees stat & DWC_ADV_I2C_INTR_STOP_DET
with DWC_ADV_I2C_STATUS_SW_READ_IN_PROGRESS set, logs "spurious STOP",
sets dev->rx_outstanding =3D 0 and dev->msg_err =3D -EIO, and completes the
transfer early with an error instead of waiting for RX_FULL to drain the
remaining bytes.

> +
> +tx_aborted:
> +	if (((stat & (DWC_ADV_I2C_INTR_TX_ABRT | DWC_ADV_I2C_INTR_STOP_DET)) ||
> +	     dev->msg_err) && dev->rx_outstanding =3D=3D 0)
> +		complete(&dev->cmd_complete);
> +}

[ ... ]

> +static irqreturn_t dwc_adv_i2c_isr(int irq, void *dev_id)
> +{
> +	struct dwc_adv_i2c_dev *dev =3D dev_id;
> +	irqreturn_t ret;
> +	int pm;
> +
> +	pm =3D pm_runtime_get_if_active(dev->dev);
> +	if (!pm)
> +		return IRQ_NONE;
> +
> +	ret =3D dwc_adv_i2c_handle_irq(dev);
> +
> +	if (pm > 0)
> +		pm_runtime_put_autosuspend(dev->dev);
> +
> +	return ret;
> +}

[Severity: High]
Should dwc_adv_i2c_isr() check if (pm <=3D 0) instead of if (!pm)?

pm_runtime_get_if_active() returns -EINVAL when runtime PM is disabled
(dev->power.disable_depth > 0). Because if (!pm) only checks for 0, a
-EINVAL return falls through to dwc_adv_i2c_handle_irq(), which performs
MMIO reads on dev->base while the clocks are disabled.

This can happen during system suspend/resume between dwc_adv_i2c_suspend()
(which runs in suspend_late and calls pm_runtime_force_suspend(), disabling
runtime PM and gating pclk and clk) and noirq IRQ disable/enable, or during
driver teardown because dwc_adv_i2c_probe() registers devm_request_irq()
before devm_add_action_or_reset(..., dwc_adv_i2c_pm_teardown, ...), so
pm_runtime_disable() runs before the IRQ is freed.

[ ... ]

> +static void dwc_adv_i2c_prepare_recovery(struct i2c_adapter *adap)
> +{
> +	struct dwc_adv_i2c_dev *dev =3D i2c_get_adapdata(adap);
> +
> +	__dwc_adv_i2c_disable(dev);
> +	reset_control_assert(dev->rst);
> +	dwc_adv_i2c_prepare_clk(dev, false);
> +}
> +
> +static void dwc_adv_i2c_unprepare_recovery(struct i2c_adapter *adap)
> +{
> +	struct dwc_adv_i2c_dev *dev =3D i2c_get_adapdata(adap);
> +	int ret;
> +
> +	ret =3D dwc_adv_i2c_prepare_clk(dev, true);
> +	if (ret) {
> +		dev_err(dev->dev, "failed to enable clock for recovery: %d\n", ret);
> +		reset_control_deassert(dev->rst);
> +		return;
> +	}
> +
> +	reset_control_deassert(dev->rst);
> +	dwc_adv_i2c_init(dev);
> +}

[Severity: High]
Can I2C bus recovery trigger unclocked MMIO accesses in dwc_adv_i2c_isr()
or in callers of i2c_recover_bus()?

1. When i2c_recover_bus() is called from dwc_adv_i2c_wait_bus_not_busy() or
dwc_adv_i2c_xfer_one_part(), the device is held in RPM_ACTIVE by
dwc_adv_i2c_xfer(). dwc_adv_i2c_prepare_recovery() asserts dev->rst and
disables dev->clk and dev->pclk, without masking interrupts in
dev->regs.intr_mask or disabling the IRQ. Because the device remains
RPM_ACTIVE throughout i2c_generic_scl_recovery(), pm_runtime_get_if_active()
in dwc_adv_i2c_isr() returns 1, so any interrupt firing during recovery will
call dwc_adv_i2c_handle_irq() and read MMIO registers while pclk is disabled
and reset is asserted. (Similarly, in dwc_adv_i2c_probe(),
devm_request_irq() is called before dwc_adv_i2c_init() disables the
controller and while TX_EMPTY is unmasked at reset.)

2. In dwc_adv_i2c_unprepare_recovery(), if dwc_adv_i2c_prepare_clk(dev, tru=
e)
fails, it returns early with dev->clk and dev->pclk disabled. However, both
callers of i2c_recover_bus() immediately access MMIO registers afterwards:

dwc_adv_i2c_wait_bus_not_busy():
    i2c_recover_bus(&dev->adap);
    status =3D dwc_adv_reg_read(dev, dev->regs.status);

dwc_adv_i2c_xfer_one_part():
    i2c_recover_bus(&dev->adap);
    dwc_adv_i2c_init(dev);

In addition, because the device is still marked RPM_ACTIVE, subsequent
dwc_adv_i2c_runtime_suspend() will call dwc_adv_i2c_prepare_clk(dev, false)
and unbalance the clock enable count.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027-tda54-upst=
ream-i2c-v4-1-ebeeaf87d181@ti.com?part=3D2
