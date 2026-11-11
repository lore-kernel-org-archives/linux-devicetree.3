Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794364837;
	b=489SFsAM/uE6ZbHEFuvgCNaMdKNdIO2x18JBdjpwKJxyxv/OVPJuNU7MT17o0mhDHAsE
	 4PZ6sPxsCDQtN7AI+w573I3w8JY4+ynMR0o/uPGVuyuA8scxfNrx3cx5RwuauFXsFZEPk
	 FQg5f0PrqWW+mvPYmk9q2NGJopn7553Iw4N/4K8OoV5ZrmBR8DbIrsKVNOyDohlsGDeZ7
	 RkD2ztd3AgZ3IcDFtKZgB8+kHtVj9AVLkpE2bqg1ZQEuIW44ypWVulnvkLga5Zeg3EWOa
	 HxvnLjsgMaF6XGG2CV02dV5e5sXPXHtr/+q7ucH7hk9eB3ln0O3qu8yLiBdGgU6roxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794364837;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ETOZuADHJB+xSe608WoJDHszrcZCBL9xpYPk4eLTpAc=;
	b=VDfB28tKP09b5HhJlDgC1s6PveLU4cxcfg5fd+GgRq/I9flaAyTfvGI4ycxgvYl9Q78R
	 +b8lxe3BkBKIb5jcvcaNTCvH84+9Kn8Hp4TQiKz0njhEWqiq84JaS2EWSVrAxF8fr3nf+
	 EP0/H5BqNeI/6UlduW9VgTr1wa60Flugj5rGIpwYJVJ+IXX4l98KYJ6czYm0aGv3FfVWJ
	 Wf8cgY+FJhccFqcJRFgF1+S8i0Ac05CL2CBRQ90/iTmASW0p72A9almhD+icoJvhSk/22
	 hCXYdBWR3ajZ9DWBSShjSUzarzh2Nbni57FVcYUqeTBYfEuK3VxTTta7yf4rYTWJjgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eJB3wZM0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C67606A33C
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 02:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eJB3wZM0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BDCD1F00A0C;
	Wed, 11 Nov 2026 02:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794364837;
	bh=ETOZuADHJB+xSe608WoJDHszrcZCBL9xpYPk4eLTpAc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eJB3wZM0iLIiHo3mRwVvXBTJBwWCfPelmHkfyKUMSwPu8LX1AWfYny+zsGjIU+HN4
	 lz+i0df+uddulf5ywAtiZ7ygUIj6DyPtqvqeH31/AhLFb29lTiKedmoitzbq9WNSaU
	 50Mo4O/NWEhUG32PEXh1ErsaHDNp0vWJYvz37kdjjpeDEu7jcf0pJvhWtuAlcWNesy
	 06IiXRf2BOLOzz2YwropdKMpv7v2kXTAQqCoRfMbJJNIXO67kuYJseYa4DGtQe8sAk
	 sCx+tiAplU6o1Ot5YBzFrH64H5mPnzo8ecsI7PaK5/lg7TBNW4F4i1o56BDXK6RjEK
	 Pp7zecDeTfpgw==
Message-ID: <sashiko-outbox-208105@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/2] i2c: Add Synopsys Advanced I2C (DWC_i2c) driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aniket Limaye" <a-limaye@ti.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261111-tda54-upstream-i2c-v5-2-280a4a779b24@ti.com>
References: <20261111-tda54-upstream-i2c-v5-0-280a4a779b24@ti.com>
 <20261111-tda54-upstream-i2c-v5-2-280a4a779b24@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 02:40:36 +0000
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
- [High] i2c: dwc-adv: pre-queued reads in dwc_adv_i2c_xfer_msg() hang
  block reads
- [High] i2c: dwc-adv: broken STOP_DET handling in
  dwc_adv_i2c_process_transfer()
--

commit 661b42138a542f38b7cf29c492367e656df39940
Author: Aniket Limaye <a-limaye@ti.com>

i2c: Add Synopsys Advanced I2C (DWC_i2c) driver

This commit adds a platform driver for the Synopsys Advanced I2C
(DWC_i2c) controller in controller mode, discovering per-block register
offsets at runtime via the block header chain.

> diff --git a/drivers/i2c/busses/i2c-dwc-adv.c b/drivers/i2c/busses/i2c-dw=
c-adv.c
> new file mode 100644
> index 0000000000000..990026e09bdce
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-dwc-adv.c

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
> +			/* Avoid rx buffer overrun */
> +			if ((flags & I2C_M_RD) &&
> +			    dev->rx_outstanding >=3D dev->rx_fifo_depth)
> +				break;
> +
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
> +		if (buf_len > 0) {
> +			dev->status |=3D DWC_ADV_I2C_STATUS_SW_WRITE_IN_PROGRESS;
> +			break;
> +		}
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

[Severity: High]
Does dwc_adv_i2c_xfer_msg() pre-queue multiple read commands when an
I2C_M_RECV_LEN message starts with len > 1?

In i2c_smbus_xfer_emulated(), enabling I2C_CLIENT_PEC increments
msg[1].len from 1 to 2 before starting an SMBus block read:

drivers/i2c/i2c-core-smbus.c:i2c_smbus_xfer_emulated() {
    ...
	if (read_write =3D=3D I2C_SMBUS_READ)
		msg[1].len +=3D 1;	/* Until we know the true length */
    ...
}

Unlike i2c_dw_xfer_msg(), the loop in dwc_adv_i2c_xfer_msg() does not
break after queuing the single length-byte read when I2C_M_RECV_LEN is
set.  When initial len > 1, it queues multiple read commands without
DWC_ADV_I2C_DATA_CMD_STOP and raises dev->rx_outstanding >=3D 2, which sets
regs.rx_tl >=3D 1 so RX_FULL does not fire when the length byte arrives.
Once dwc_adv_i2c_recv_len() runs, if the total message length is less
than or equal to the already queued dev->rx_outstanding (such as when the
target returns an invalid block length clamped to count =3D 1, or when
I2C_RDWR passes a larger initial len), dev->tx_buf_len becomes 0 and no
final read command with DWC_ADV_I2C_DATA_CMD_STOP is ever queued, hanging
the bus until the transfer times out.

Also, checking buf_len > 0 before flags & I2C_M_RECV_LEN means that
breaking out of the loop after queuing only the first byte of a message
with initial len > 1 skips masking DWC_ADV_I2C_INTR_TX_EMPTY.

[ ... ]

> +static u32 dwc_adv_i2c_read_clear_intrbits(struct dwc_adv_i2c_dev *dev)
> +{
> +	u32 stat =3D dwc_adv_reg_read(dev, dev->regs.intr_stat);
> +
> +	if (stat & DWC_ADV_I2C_INTR_RX_UNDER)
> +		dwc_adv_i2c_ack_intr(dev, DWC_ADV_I2C_INTR_CLR_RX_UNDER);
> +	if (stat & DWC_ADV_I2C_INTR_RX_OVER)
> +		dwc_adv_i2c_ack_intr(dev, DWC_ADV_I2C_INTR_CLR_RX_OVER);
> +	if (stat & DWC_ADV_I2C_INTR_TX_OVER)
> +		dwc_adv_i2c_ack_intr(dev, DWC_ADV_I2C_INTR_CLR_TX_OVER);
> +	if (stat & DWC_ADV_I2C_INTR_RD_REQ)
> +		dwc_adv_i2c_ack_intr(dev, DWC_ADV_I2C_INTR_CLR_RD_REQ);
> +	if (stat & DWC_ADV_I2C_INTR_TX_ABRT) {
> +		dev->abort_source =3D dwc_adv_reg_read(dev, dev->regs.tx_abrt_source);
> +		dwc_adv_i2c_ack_intr(dev, DWC_ADV_I2C_INTR_CLR_TX_ABRT);
> +	}
> +	if (stat & DWC_ADV_I2C_INTR_RX_DONE)
> +		dwc_adv_i2c_ack_intr(dev, DWC_ADV_I2C_INTR_CLR_RX_DONE);
> +	if (stat & DWC_ADV_I2C_INTR_ACTIVITY)
> +		dwc_adv_i2c_ack_intr(dev, DWC_ADV_I2C_INTR_CLR_ACTIVITY);
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
> +	if (stat & DWC_ADV_I2C_INTR_RX_FULL) {
> +		dwc_adv_i2c_read(dev);
> +		/* Re-evaluate RX_TL and TX_EMPTY for the reads still pending */
> +		stat |=3D DWC_ADV_I2C_INTR_TX_EMPTY;
> +	}
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
> +
> +tx_aborted:
> +	if (((stat & (DWC_ADV_I2C_INTR_TX_ABRT | DWC_ADV_I2C_INTR_STOP_DET)) ||
> +	     dev->msg_err) && dev->rx_outstanding =3D=3D 0)
> +		complete(&dev->cmd_complete);
> +}

[Severity: High]
Can dwc_adv_i2c_process_transfer() falsely abort a multi-batch read with
-EIO and leave DWC_ADV_I2C_INTR_STOP_DET unacknowledged when STOP_DET
arrives before the final RX_FULL?

dwc_adv_i2c_read_clear_intrbits() skips clearing DWC_ADV_I2C_INTR_STOP_DET
when dev->rx_outstanding > 0 and DWC_ADV_I2C_INTR_RX_FULL is not set, but
still returns stat with DWC_ADV_I2C_INTR_STOP_DET set.  On any read that
takes more than one RX_FULL interrupt (such as a read larger than
rx_fifo_depth / 2 or an I2C_M_RECV_LEN block read), the earlier
dwc_adv_i2c_read() leaves DWC_ADV_I2C_STATUS_SW_READ_IN_PROGRESS set in
dev->status.  If STOP_DET then fires before the final RX_FULL,
dwc_adv_i2c_process_transfer() treats it as a spurious STOP, zeroes
dev->rx_outstanding, sets dev->msg_err =3D -EIO, and completes
dev->cmd_complete without draining the RX FIFO.

Because dev->msg_err is set after dwc_adv_i2c_xfer_msg() has already run,
the if (dev->msg_err) intr_mask =3D 0; check in dwc_adv_i2c_xfer_msg() is
also bypassed on that interrupt, leaving interrupts unmasked and STOP_DET
asserted in hardware.  Similarly, if a premature STOP occurs during a
single-batch read after all read commands were queued (so neither
SW_WRITE_IN_PROGRESS nor SW_READ_IN_PROGRESS is set while
dev->rx_outstanding > 0 and RX_FULL is clear), STOP_DET is neither cleared
nor masked, causing an interrupt storm.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111-tda54-upst=
ream-i2c-v5-0-280a4a779b24@ti.com?part=3D2
