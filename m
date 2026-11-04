Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793796209;
	b=xL3L+OmEX4E8TsVnSxQc5AUdN+gGk3FxxcCFYZr33DiY4XujvVETsGKxTj/gSLAP+EN5
	 rTjCVdczl7E6nbTfoxljkczwwBNdWQ1SQGdxRTJGxmfGdbTV2WDeLxDMf+AIx4Lp42gy/
	 amQbhDmwNywBcmsoBmxpm28vlljWvsMrLKLOGG7VwK4PNWQb+7r5lfNViJWu7uhMUYocK
	 i5vOa7Z0PGU2I9ViHPm1fqg94/PSNgZWSOri3OWJR+oRqFsbc5+hq3FFThKLR/QvOQt7U
	 /MtxHg3Y1kaYUU3GUuP5U59FDhoN0BLEOZY0HXqwHcs1NuEimWQ8ghOrwAoP1qC3g4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793796209;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=MqFeY4ofqsmBTQsOorBAW31xUhyXxQdHTugXt57wPyE=;
	b=jMQQ0mrrdhiNQc2HMHi602lWo9SXXvkaeUVHZ7HirY7D3fJUTUco+BbyXN/ceHyVjeiS
	 Uk1/RTM8mgBK6FJHt59mOM0gyCXJLk58C3dqEOvLr1JlaRiGEGXCWeFQQPXnj56RSwX+s
	 DNDwI/LHn+7kfPNI+OXCqFChModQ0lViQVe/+o/QZllVbjt4gIahri45dHsp5Nf5XHUST
	 XmAS2mpL9eoRKsr2+5DUnOHPjQSbukFx0Dxxq4bLgVQy0yerVnAfvqZ/LD0sElq4voj21
	 j3Ywjv/h/F7+wG7a1Gv62pKVbLqpJoSwCxwi3G+vp6T7SXTBJYqilPcY8BXfNlmtwoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iQi4w8ku;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5AF606A31B
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 12:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iQi4w8ku
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D3721F000C1;
	Wed,  4 Nov 2026 12:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793796208;
	bh=MqFeY4ofqsmBTQsOorBAW31xUhyXxQdHTugXt57wPyE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iQi4w8kuBfiH2E+eXwX8TigT9mLcFadHb6A+fA+KXZmohX/hMwDMXBJjYaQMPEFEI
	 daE/jEyqRClSXg9Fs0yRdVKIsBufIa9nwrvIvItUH9jUyCuVWW2ZaPKkuRANCbq1Ey
	 aqPpL47VwtISTwaCB4tcbiOTPxaPJQOye5dNlABpMZ0rux2a25ZmuqYXwB2yBy3Bc5
	 zFOJOmf3O+SiFtNIiVbN97MOuQxmn2nj530n1Eoj6mfaIEz/XLhW1rJt5KKMeuAn8q
	 VKU1ytz5dkuuP99Ke3A0wPLmtRyeFh3D1NXJQ8FBQZZZ6nyafKABqzofOAxvmuX2mC
	 O9H6EfhT1ZcxQ==
Message-ID: <sashiko-outbox-197287@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/3] i3c: master: Add Qualcomm I3C controller driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mukesh Kumar Savaliya" <mukesh.savaliya@oss.qualcomm.com>, linux-i3c@lists.infradead.org, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20261104122155.3789346-3-mukesh.savaliya@oss.qualcomm.com>
References: <20261104122155.3789346-1-mukesh.savaliya@oss.qualcomm.com>
 <20261104122155.3789346-3-mukesh.savaliya@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 12:43:28 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 12 potential issue=
(s) to consider:
- [Critical] i3c: master: unsafe DMA mapping of i2c_msg in geni_i3c_master_=
i2c_xfers()
- [High] i3c: master: clock lookup failure in geni_i3c_clk_map_idx()
- [High] i3c: master: 6-bit address truncation and DAA bugs in geni_i3c_per=
form_daa()
- [High] i3c: master: use_7e is never set in geni_i3c_master_priv_xfers()
- [High] i3c: master: NACK clobbering and DMA reset bugs in geni_i3c_irq()
- [High] i3c: qcom-geni: missing reinit_completion() and TX_RESET_DONE in D=
MA xfer
- [High] i3c: qcom-geni: broken short read and RX_LAST handling in geni_i3c=
_irq()
- [High] i3c: qcom-geni: unclocked register access and disabled IRQ when !C=
ONFIG_PM
- [High] i3c: qcom-geni: unlocked command start and TX watermark IRQ storm =
race
- [Medium] i3c: master: double geni_se_resources_off() on geni_i3c_hw_init(=
) error
- [Medium] i3c: qcom-geni: unchecked geni_se_resources_off() in runtime sus=
pend
- [Low] i3c: qcom-geni: unused variable m_stat_mask in geni_i3c_irq()
--

commit 142dbd5b9e6edda42ed3407ef95befa8d7a473b4
Author: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>

i3c: master: Add Qualcomm I3C controller driver

This commit adds the Qualcomm QUPv3 GENI-based I3C master controller driver
supporting SDR mode, CCC commands, dynamic address assignment, and I2C
transfers.

> diff --git a/drivers/i3c/master/i3c-qcom-geni.c b/drivers/i3c/master/i3c-=
qcom-geni.c
> new file mode 100644
> index 0000000000000..2fee77e681e26
> --- /dev/null
> +++ b/drivers/i3c/master/i3c-qcom-geni.c
> @@ -0,0 +1,1133 @@

[ ... ]

> +#define I3C_AUTO_SUSPEND_DELAY	250
> +#define PACKING_BYTES_PER_WORD	4
> +#define XFER_TIMEOUT		250
> +
> +#define I3C_ADDR_MASK		(I2C_MAX_ADDR >> 1)

[ ... ]

> +	int cur_len;
> +	int cur_idx;
> +	DECLARE_BITMAP(newaddrslots, 64);

[ ... ]

> +static const struct geni_i3c_clk_settings geni_i3c_clk_map[] =3D {
> +	{
> +		.clk_freq_out =3D 100 * HZ_PER_KHZ,
> +		.clk_src_freq =3D 19200 * HZ_PER_KHZ,
> +		.clk_div =3D 1,
> +		.i2c_t_high_cnt =3D 76,
> +		.i2c_t_low_cnt =3D 90,
> +		.i3c_t_high_cnt =3D 7,
> +		.i3c_t_cycle_cnt =3D 8,
> +		.i2c_t_cycle_cnt =3D 192,
> +	},
> +	{
> +		.clk_freq_out =3D 400 * HZ_PER_KHZ,
> +		.clk_src_freq =3D 19200 * HZ_PER_KHZ,
> +		.clk_div =3D 1,
> +		.i2c_t_high_cnt =3D 12,
> +		.i2c_t_low_cnt =3D 24,
> +		.i3c_t_high_cnt =3D 7,
> +		.i3c_t_cycle_cnt =3D 8,
> +		.i2c_t_cycle_cnt =3D 48
> +	},
> +	{
> +		.clk_freq_out =3D 1000 * HZ_PER_KHZ,
> +		.clk_src_freq =3D 19200 * HZ_PER_KHZ,
> +		.clk_div =3D 1,
> +		.i2c_t_high_cnt =3D 4,
> +		.i2c_t_low_cnt =3D 9,
> +		.i3c_t_high_cnt =3D 7,
> +		.i3c_t_cycle_cnt =3D 0,
> +		.i2c_t_cycle_cnt =3D 19
> +	},
> +	{
> +		.clk_freq_out =3D 12500 * HZ_PER_KHZ,
> +		.clk_src_freq =3D 100000 * HZ_PER_KHZ,
> +		.clk_div =3D 1,
> +		.i2c_t_high_cnt =3D 45,
> +		.i2c_t_low_cnt =3D 63,
> +		.i3c_t_high_cnt =3D 6,
> +		.i3c_t_cycle_cnt =3D 7,
> +		.i2c_t_cycle_cnt =3D 110
> +	}
> +};
> +
> +static int geni_i3c_clk_map_idx(struct geni_i3c_dev *gi3c)
> +{
> +	const struct geni_i3c_clk_settings *clk_table_idx =3D geni_i3c_clk_map;
> +	struct i3c_master_controller *m =3D &gi3c->ctrlr;
> +	struct i3c_bus *bus =3D i3c_master_get_bus(m);
> +
> +	for (int i =3D 0; i < ARRAY_SIZE(geni_i3c_clk_map); i++, clk_table_idx+=
+) {
> +		if (clk_table_idx->clk_freq_out =3D=3D bus->scl_rate.i3c &&
> +		    clk_table_idx->clk_src_freq =3D=3D gi3c->clk_src_freq)
> +			gi3c->clk_cfg =3D clk_table_idx;
> +
> +		if (clk_table_idx->clk_freq_out =3D=3D bus->scl_rate.i2c)
> +			gi3c->clk_od_cfg =3D clk_table_idx;
> +	}
> +
> +	if (!gi3c->clk_cfg || !gi3c->clk_od_cfg)
> +		return -EINVAL;
> +
> +	return 0;
> +}

[Severity: High]
Will geni_i3c_clk_map_idx() fail with -EINVAL during
geni_i3c_master_bus_init() on pure I3C buses and mixed-slow buses?

In drivers/i3c/master.c, i3c_bus_set_mode() only populates
i3cbus->scl_rate.i3c when i3cbus->mode =3D=3D I3C_BUS_MODE_PURE, leaving
i3cbus->scl_rate.i2c as 0 unless an optional i2c-scl-hz property is present=
 in
firmware. Because no entry in geni_i3c_clk_map[] has clk_freq_out =3D=3D 0,
gi3c->clk_od_cfg stays NULL and geni_i3c_clk_map_idx() returns -EINVAL.

Conversely, in I3C_BUS_MODE_MIXED_SLOW, i3c_bus_set_mode() clamps
bus->scl_rate.i3c to bus->scl_rate.i2c (at most 1 MHz). However,
i3c_geni_resources_init() hardcodes gi3c->clk_src_freq to 100 MHz, while the
100 kHz, 400 kHz, and 1000 kHz entries in geni_i3c_clk_map[] all use a
19.2 MHz clk_src_freq, leaving gi3c->clk_cfg NULL.

Also, in the 1000 kHz entry of geni_i3c_clk_map[] (the default I2C rate for
mixed-fast and mixed-limited buses), i3c_t_cycle_cnt is 0 while i3c_t_high_=
cnt
is 7. When qcom_geni_i3c_conf() configures OPEN_DRAIN_MODE, is writing 0 to
SE_I3C_SCL_CYCLE intentional while the 100 kHz and 400 kHz entries use 8?

[ ... ]

> +static void geni_i3c_handle_err(struct geni_i3c_dev *gi3c, u32 status)
> +{
> +	dev_dbg(gi3c->se.dev, "len:%d, %s\n",
> +		gi3c->cur_len, gi3c->cur_is_write ? "write" : "read");
> +
> +	if (status & M_GP_IRQ_0_EN) {
> +		gi3c->err =3D -EINVAL;
> +		dev_dbg(gi3c->se.dev, "I3C slave early read termination\n");
> +	}
> +
> +	if (status & M_GP_IRQ_1_EN) {
> +		gi3c->err =3D -ENOTCONN;
> +		dev_dbg(gi3c->se.dev, "NACK: slave unresponsive, check power/reset\n");
> +	}
> +
> +	if (status & M_GP_IRQ_2_EN) {
> +		gi3c->err =3D -EINVAL;
> +		dev_dbg(gi3c->se.dev, "CRC or parity error\n");
> +	}
> +
> +	if (status & M_GP_IRQ_3_EN) {
> +		gi3c->err =3D -EPROTO;
> +		dev_dbg(gi3c->se.dev, "Bus proto Error, noisy/unexpected start/stop\n"=
);
> +	}
> +
> +	if (status & M_GP_IRQ_4_EN) {
> +		gi3c->err =3D -EBUSY;
> +		dev_dbg(gi3c->se.dev, "NACK on 7E, unexpected protocol error\n");
> +	}
> +
> +	if (status & M_GP_IRQ_5_EN) {
> +		gi3c->err =3D -EINVAL;
> +		dev_dbg(gi3c->se.dev, "NACK on IBI\n");
> +	}
> +
> +	if (status & M_CMD_OVERRUN_EN) {
> +		gi3c->err =3D -EIO;
> +		dev_dbg(gi3c->se.dev, "Cmd overrun, check GENI cmd-state machine\n");
> +	}
> +
> +	if (status & M_ILLEGAL_CMD_EN) {
> +		gi3c->err =3D -EILSEQ;
> +		dev_dbg(gi3c->se.dev, "Illegal cmd, check GENI cmd-state machine\n");
> +	}
> +
> +	if (status & M_CMD_ABORT_EN) {
> +		gi3c->err =3D -ETIMEDOUT;
> +		dev_dbg(gi3c->se.dev, "Abort after timeout successful\n");
> +	}
> +
> +	if (status =3D=3D GENI_TIMEOUT) {
> +		gi3c->err =3D -ETIMEDOUT;
> +		dev_dbg(gi3c->se.dev, "I3C transaction timed out\n");
> +	}
> +}

[Severity: High]
Does geni_i3c_handle_err() overwrite earlier NACK error codes (-ENOTCONN and
-EBUSY) with -ETIMEDOUT during timeout and abort recovery?

When M_GP_IRQ_1_EN or M_GP_IRQ_4_EN fires in geni_i3c_irq() without
M_CMD_DONE_EN set, geni_i3c_handle_err() sets gi3c->err to -ENOTCONN or
-EBUSY, and _i3c_geni_execute_command() waits for the timeout to abort the
command. On timeout, _i3c_geni_execute_command() and geni_i3c_abort_xfer()
call geni_i3c_handle_err(gi3c, GENI_TIMEOUT), followed by M_CMD_ABORT_EN in
geni_i3c_irq(). Because both branches unconditionally set
gi3c->err =3D -ETIMEDOUT, the original NACK error is lost, preventing
geni_i3c_master_send_ccc_cmd() from reporting I3C_ERROR_M2.

Also, status in geni_i3c_handle_err() mixes hardware SE_GENI_M_IRQ_STATUS b=
it
flags with the enum value GENI_TIMEOUT (which is 9, equal to
M_CMD_FAILURE_EN | M_CMD_DONE_EN). And when geni_i3c_irq() enters the error
path via dm_rx_st & DM_I3C_CB_ERR or M_CMD_FAILURE_EN without M_GP_IRQ_0..4=
_EN
set in m_stat, geni_i3c_handle_err(gi3c, m_stat) leaves gi3c->err as 0 (whi=
le
M_GP_IRQ_5_EN is omitted from SE_I3C_ERR). Should geni_i3c_handle_err()
preserve an existing non-zero gi3c->err and separate hardware status bits f=
rom
driver error codes?

> +
> +static irqreturn_t geni_i3c_irq(int irq, void *dev)
> +{
> +	struct geni_i3c_dev *gi3c =3D dev;
> +	u32 m_stat_mask, dm_tx_st, dm_rx_st;
> +	u32 m_stat, rx_st, dma_mode;
> +
> +	m_stat =3D readl_relaxed(gi3c->se.base + SE_GENI_M_IRQ_STATUS);
> +	m_stat_mask =3D readl_relaxed(gi3c->se.base + SE_GENI_M_IRQ_EN);

[Severity: Low]
In geni_i3c_irq(), m_stat_mask is assigned here but never used, which will
trigger an unused-but-set-variable compiler warning. Should m_stat be masked
with m_stat_mask, or should m_stat_mask be removed?

> +	rx_st =3D readl_relaxed(gi3c->se.base + SE_GENI_RX_FIFO_STATUS);
> +	dm_tx_st =3D readl_relaxed(gi3c->se.base + SE_DMA_TX_IRQ_STAT);
> +	dm_rx_st =3D readl_relaxed(gi3c->se.base + SE_DMA_RX_IRQ_STAT);
> +	dma_mode =3D readl_relaxed(gi3c->se.base + SE_GENI_DMA_MODE_EN);
> +
> +	scoped_guard(spinlock, &gi3c->irq_lock) {
> +		if (m_stat & SE_I3C_ERR || dm_rx_st & DM_I3C_CB_ERR) {
> +			geni_i3c_handle_err(gi3c, m_stat);
> +			/* Disable the TX Watermark interrupt to stop TX */
> +			if (!dma_mode)
> +				writel_relaxed(0, gi3c->se.base + SE_GENI_TX_WATERMARK_REG);
> +		} else if (dma_mode) {
> +			dev_dbg(gi3c->se.dev, "i3c dma tx:0x%x, dma rx:0x%x\n", dm_tx_st, dm_=
rx_st);
> +		} else if ((m_stat & (M_RX_FIFO_WATERMARK_EN | M_RX_FIFO_LAST_EN)) &&
> +			    !gi3c->cur_is_write && gi3c->cur_buf) {
> +			/* FIFO RX handling */
> +			u32 rxcnt =3D rx_st & RX_FIFO_WC_MSK;
> +			int avail =3D rxcnt * 4;
> +			int need  =3D gi3c->cur_len - gi3c->cur_idx;
> +			int n     =3D min(need, avail);
> +
> +			if (n > 0) {
> +				i3c_readl_fifo(gi3c->se.base + SE_GENI_RX_FIFOn,
> +					       gi3c->cur_buf + gi3c->cur_idx, n);
> +				gi3c->cur_idx +=3D n;
> +			}
> +		} else if ((m_stat & M_TX_FIFO_WATERMARK_EN) &&

[Severity: High]
How does FIFO RX in geni_i3c_irq() handle short or variable-length I3C read=
s?

When an I3C target terminates a read early via the T-bit, the controller se=
ts
M_GP_IRQ_0_EN ("I3C slave early read termination"). Because M_GP_IRQ_0_EN is
included in SE_I3C_ERR, geni_i3c_irq() takes the error branch, sets
gi3c->err =3D -EINVAL, and skips draining the RX FIFO.

In addition, the FIFO RX calculation uses avail =3D rxcnt * 4 without check=
ing
RX_LAST and RX_LAST_BYTE_VALID_MSK in SE_GENI_RX_FIFO_STATUS. If a target
returns a short response that is not a multiple of 4 bytes and is smaller t=
han
gi3c->cur_len (for example, a 2-byte response to a 5-byte I3C_CCC_GETMXDS o=
r a
3-byte I3C_CCC_GETMRL), avail is rounded up to 4 bytes, so gi3c->cur_idx and
cmd->dests[i].payload.actual_len are over-counted, causing
i3c_master_getmxds_locked() to fail with -EIO or i3c_master_getmrl_locked()=
 to
read an uninitialized byte.

> +			   gi3c->cur_is_write && gi3c->cur_buf) {
> +			/* FIFO TX handling */
> +			int avail =3D gi3c->tx_wm * 4;
> +			int need  =3D gi3c->cur_len - gi3c->cur_idx;
> +			int n     =3D min(need, avail);
> +
> +			if (n > 0) {
> +				i3c_writel_fifo(gi3c->se.base + SE_GENI_TX_FIFOn,
> +						(void *)(gi3c->cur_buf + gi3c->cur_idx), n);
> +				gi3c->cur_idx +=3D n;
> +			}
> +		}
> +
> +		if (!dma_mode && gi3c->cur_idx =3D=3D gi3c->cur_len)
> +			writel_relaxed(0, gi3c->se.base + SE_GENI_TX_WATERMARK_REG);
> +	}
> +
> +	if (m_stat)
> +		writel_relaxed(m_stat, gi3c->se.base + SE_GENI_M_IRQ_CLEAR);
> +
> +	if (dma_mode) {
> +		if (dm_tx_st)
> +			writel_relaxed(dm_tx_st, gi3c->se.base + SE_DMA_TX_IRQ_CLR);
> +		if (dm_rx_st)
> +			writel_relaxed(dm_rx_st, gi3c->se.base + SE_DMA_RX_IRQ_CLR);
> +	}
> +
> +	/* if this is err with done-bit not set, handle that through timeout. */
> +	if (m_stat & (M_CMD_DONE_EN | M_CMD_ABORT_EN)) {
> +		writel_relaxed(0, gi3c->se.base + SE_GENI_TX_WATERMARK_REG);
> +		complete(&gi3c->done);
> +	} else if ((dm_tx_st & TX_DMA_DONE) || (dm_rx_st & (RX_DMA_DONE | RX_RE=
SET_DONE))) {
> +		complete(&gi3c->done);
> +	}
> +
> +	return IRQ_HANDLED;
> +}

[ ... ]

> +static int _i3c_geni_execute_command(struct geni_i3c_dev *gi3c, struct g=
eni_i3c_xfer_params *xfer)
> +{
> +	bool is_write =3D gi3c->cur_is_write;
> +	dma_addr_t tx_dma =3D 0, rx_dma =3D 0;
> +	unsigned long time_remaining;
> +	u32 len =3D gi3c->cur_len;
> +	int ret;
> +
> +	geni_se_select_mode(&gi3c->se, xfer->mode);
> +
> +	gi3c->err =3D 0;
> +	gi3c->cur_idx =3D 0;
> +
> +	if (is_write) {
> +		dev_dbg(gi3c->se.dev, "I3C cmd:0x%x param:0x%x WRITE len:%d\n",
> +			xfer->m_cmd, xfer->m_param, len);
> +
> +		writel_relaxed(len, gi3c->se.base + SE_I3C_TX_TRANS_LEN);
> +		geni_se_setup_m_cmd(&gi3c->se, xfer->m_cmd, xfer->m_param);
> +
> +		if (xfer->mode =3D=3D GENI_SE_DMA) {
> +			ret =3D geni_se_tx_dma_prep(&gi3c->se, gi3c->cur_buf, len, &tx_dma);
> +			if (ret) {
> +				xfer->mode =3D GENI_SE_FIFO;
> +				geni_se_select_mode(&gi3c->se, xfer->mode);
> +			}
> +		}
> +
> +		if (xfer->mode =3D=3D GENI_SE_FIFO && len > 0) /* Get FIFO IRQ */
> +			writel_relaxed(1, gi3c->se.base + SE_GENI_TX_WATERMARK_REG);
> +	} else {
> +		dev_dbg(gi3c->se.dev, "I3C cmd:0x%x param:0x%x READ len:%d\n",
> +			xfer->m_cmd, xfer->m_param, len);
> +		writel_relaxed(len, gi3c->se.base + SE_I3C_RX_TRANS_LEN);
> +		geni_se_setup_m_cmd(&gi3c->se, xfer->m_cmd, xfer->m_param);
> +		if (xfer->mode =3D=3D GENI_SE_DMA) {
> +			ret =3D geni_se_rx_dma_prep(&gi3c->se, gi3c->cur_buf, len, &rx_dma);
> +			if (ret) {
> +				xfer->mode =3D GENI_SE_FIFO;
> +				geni_se_select_mode(&gi3c->se, xfer->mode);
> +			}
> +		}
> +	}
> +
> +	time_remaining =3D wait_for_completion_timeout(&gi3c->done, XFER_TIMEOU=
T);
> +	if (!time_remaining) {
> +		unsigned long flags;
> +
> +		dev_dbg(gi3c->se.dev, "Timeout completing transfer\n");
> +		spin_lock_irqsave(&gi3c->irq_lock, flags);
> +		geni_i3c_handle_err(gi3c, GENI_TIMEOUT);
> +		gi3c->cur_buf =3D NULL;
> +		spin_unlock_irqrestore(&gi3c->irq_lock, flags);
> +		geni_i3c_abort_xfer(gi3c);
> +	}

[Severity: High]
Can starting the command in _i3c_geni_execute_command() without holding
gi3c->irq_lock, or clearing gi3c->cur_buf on timeout without zeroing
SE_GENI_TX_WATERMARK_REG, cause an infinite M_TX_FIFO_WATERMARK_EN interrupt
storm?

In _i3c_geni_execute_command(), geni_se_setup_m_cmd() starts the hardware
command before SE_GENI_TX_WATERMARK_REG is set to 1. If the command
immediately fails on the bus (such as on an address or 0x7E NACK),
geni_i3c_irq() can run, clear SE_GENI_TX_WATERMARK_REG to 0, and complete
gi3c->done before _i3c_geni_execute_command() writes 1 to
SE_GENI_TX_WATERMARK_REG and sets gi3c->cur_buf =3D NULL. Likewise, on a
transfer timeout, _i3c_geni_execute_command() sets gi3c->cur_buf =3D NULL w=
hile
gi3c->cur_idx < gi3c->cur_len without writing 0 to SE_GENI_TX_WATERMARK_REG.

When M_TX_FIFO_WATERMARK_EN then fires in geni_i3c_irq() with
gi3c->cur_buf =3D=3D NULL and gi3c->cur_idx < gi3c->cur_len, neither the TX=
 FIFO
branch nor the gi3c->cur_idx =3D=3D gi3c->cur_len check disables
SE_GENI_TX_WATERMARK_REG, leaving the level-triggered watermark interrupt
asserted indefinitely.

> +
> +	if (xfer->mode =3D=3D GENI_SE_DMA) {
> +		if (gi3c->err) {
> +			if (is_write)
> +				writel_relaxed(1, gi3c->se.base + SE_DMA_TX_FSM_RST);
> +			else
> +				writel_relaxed(1, gi3c->se.base + SE_DMA_RX_FSM_RST);
> +
> +			time_remaining =3D wait_for_completion_timeout(&gi3c->done, XFER_TIME=
OUT);
> +			dev_dbg(gi3c->se.dev, "Timeout completing DMA transfer\n");
> +		}
> +
> +		if (is_write)
> +			geni_se_tx_dma_unprep(&gi3c->se, tx_dma, len);
> +		else
> +			geni_se_rx_dma_unprep(&gi3c->se, rx_dma, len);
> +	}

[Severity: High]
Are there completion synchronization and DMA reset issues between
_i3c_geni_execute_command() and geni_i3c_irq()?

1. reinit_completion(&gi3c->done) is only called once before the outer loop=
s in
   geni_i3c_master_send_ccc_cmd(), geni_i3c_master_priv_xfers(), and
   geni_i3c_master_i2c_xfers(), rather than before each command in
   _i3c_geni_execute_command() and before the SE_DMA_TX_FSM_RST /
   SE_DMA_RX_FSM_RST wait.

2. In geni_i3c_irq(), m_stat & (M_CMD_DONE_EN | M_CMD_ABORT_EN) calls
   complete(&gi3c->done) even when dma_mode is active. In GENI_SE_DMA mode,
   if M_CMD_DONE_EN is observed before TX_DMA_DONE or RX_DMA_DONE, gi3c->do=
ne
   is completed early (unmapping the DMA buffer while DMA is still active) =
and
   then completed a second time when DMA finishes, leaving gi3c->done
   pre-signaled for the next transfer in a multi-message loop (such as the
   stack-allocated rx_buf and tx_buf transfers in geni_i3c_perform_daa()).

3. When gi3c->err is set on a DMA write, _i3c_geni_execute_command() writes=
 1
   to SE_DMA_TX_FSM_RST and waits on gi3c->done, but geni_i3c_irq() only ch=
ecks
   (dm_tx_st & TX_DMA_DONE) || (dm_rx_st & (RX_DMA_DONE | RX_RESET_DONE)) a=
nd
   never checks TX_RESET_DONE in dm_tx_st.

4. In _i3c_geni_execute_command(), geni_se_setup_m_cmd() is called before
   geni_se_tx_dma_prep() / geni_se_rx_dma_prep(); if DMA mapping fails, it
   calls geni_se_select_mode() after the hardware command has already start=
ed.

[ ... ]

> +static int geni_i3c_perform_daa(struct geni_i3c_dev *gi3c)
> +{
> +	struct geni_i3c_xfer_params xfer =3D { GENI_SE_FIFO };
> +	bool first_device =3D true;
> +	int ret;
> +
> +	while (1) {
> +		u8 rx_buf[8], tx_buf[1];
> +		u8 addr;
> +		u64 pid;
> +
> +		/* Read PID[47:0], BCR, DCR during ENTDAA flow */
> +		xfer.m_cmd =3D I2C_READ;
> +		xfer.m_param =3D STOP_STRETCH | CONTINUOUS_MODE_DAA;
> +
> +		if (first_device) {
> +			xfer.m_param |=3D USE_7E;
> +			first_device =3D false;
> +		}
> +
> +		ret =3D i3c_geni_execute_read_command(gi3c, &xfer,
> +						    rx_buf, sizeof(rx_buf));
> +		if (ret) {
> +			dev_dbg(gi3c->se.dev,
> +				"DAA complete, no more slave devices\n");
> +			break;
> +		}
> +
> +		pid =3D FIELD_PREP(GENMASK_ULL(47, 40), (u64)rx_buf[0]) |
> +		      FIELD_PREP(GENMASK_ULL(39, 32), (u64)rx_buf[1]) |
> +		      FIELD_PREP(GENMASK_ULL(31, 24), (u64)rx_buf[2]) |
> +		      FIELD_PREP(GENMASK_ULL(23, 16), (u64)rx_buf[3]) |
> +		      FIELD_PREP(GENMASK_ULL(15, 8),  (u64)rx_buf[4]) |
> +		      FIELD_PREP(GENMASK_ULL(7, 0),   (u64)rx_buf[5]);
> +
> +		dev_dbg(gi3c->se.dev, "DAA device PID: 0x%012llx\n", pid);
> +
> +		addr =3D i3c_master_get_free_addr(&gi3c->ctrlr,
> +						gi3c->last_addr + 1);
> +		if (addr > I3C_ADDR_MASK)
> +			return -EINVAL;
> +
> +		gi3c->last_addr =3D addr;
> +		set_bit(addr, gi3c->newaddrslots);
> +
> +		/* Dynamic address + odd parity bit */
> +		tx_buf[0] =3D (addr & I3C_ADDR_MASK) << 1;
> +		tx_buf[0] |=3D !parity8(addr & I3C_ADDR_MASK);
> +
> +		xfer.m_cmd =3D I2C_WRITE;
> +		xfer.m_param =3D STOP_STRETCH | BYPASS_ADDR_PHASE;
> +
> +		ret =3D i3c_geni_execute_write_command(gi3c, &xfer, tx_buf, 1);
> +		if (ret)
> +			break;
> +	}
> +
> +	return 0;
> +}

[Severity: High]
Does I3C_ADDR_MASK truncate 7-bit I3C dynamic addresses to 6 bits in
geni_i3c_perform_daa()?

In include/linux/i3c/master.h, I2C_MAX_ADDR and I3C_MAX_ADDR are both defin=
ed
as GENMASK(6, 0) (0x7f). Defining I3C_ADDR_MASK as (I2C_MAX_ADDR >> 1)
evaluates to 0x3f (63) and newaddrslots is sized to 64 bits, so
geni_i3c_perform_daa() rejects all valid 7-bit dynamic addresses from 0x40 =
to
0x7d.

There also appear to be a few related issues in the DAA flow:

1. i3c_master_get_free_addr() returns a negative errno (-ENOMEM) on failure,
   which is truncated into u8 addr.

2. gi3c->last_addr is never reset to 0 before DAA starts, so subsequent DAA
   runs or address searches past 0x3f will fail to wrap around to lower free
   addresses.

3. set_bit(addr, gi3c->newaddrslots) is called before
   i3c_geni_execute_write_command(); if writing the dynamic address fails, =
the
   unassigned address remains set in newaddrslots and
   geni_i3c_master_do_daa() will pass it to i3c_master_add_i3c_dev_locked(),
   permanently marking the address slot as used.

4. In geni_i3c_master_send_ccc_cmd(), the return value of
   geni_i3c_perform_daa(gi3c) is ignored, so returning -EINVAL after reading
   the 8-byte PID/BCR/DCR with STOP_STRETCH | CONTINUOUS_MODE_DAA drops the
   error and leaves the bus stalled without a STOP condition.

[ ... ]

> +static int geni_i3c_master_priv_xfers(struct i3c_dev_desc *dev, struct i=
3c_xfer *xfers,
> +				      int nxfers, enum i3c_xfer_mode mode)
> +{
> +	struct i3c_master_controller *m =3D i3c_dev_get_master(dev);
> +	struct geni_i3c_dev *gi3c =3D to_geni_i3c_master(m);
> +	bool use_7e =3D false;
> +	int ret;
> +
> +	scoped_guard(mutex, &gi3c->lock) {
> +		reinit_completion(&gi3c->done);
> +		ret =3D pm_runtime_get_sync(gi3c->se.dev);
> +		if (ret < 0) {
> +			dev_err(gi3c->se.dev, "error turning on SE resources:%d\n", ret);
> +			pm_runtime_put_noidle(gi3c->se.dev);
> +			pm_runtime_set_suspended(gi3c->se.dev);
> +			return ret;
> +		}
> +
> +		qcom_geni_i3c_conf(gi3c, PUSH_PULL_MODE);
> +
> +		for (int i =3D 0; i < nxfers; i++) {
> +			bool stall =3D (i < (nxfers - 1));
> +			struct geni_i3c_xfer_params xfer =3D { GENI_SE_FIFO };
> +
> +			xfer.m_param  =3D (stall ? STOP_STRETCH : 0);
> +			xfer.m_param |=3D FIELD_PREP(SLAVE_ADDR_MASK, dev->info.dyn_addr);
> +			xfer.m_param |=3D (use_7e) ? USE_7E : 0;
> +
> +			/* use_7e =3D true only for last transfer */
> +			use_7e =3D (i =3D=3D nxfers - 1);

[Severity: High]
In geni_i3c_master_priv_xfers(), is USE_7E ever set on any transfer?

use_7e is initialized to false, and inside the loop xfer.m_param |=3D (use_=
7e) ?
USE_7E : 0 is evaluated before use_7e =3D (i =3D=3D nxfers - 1). For all it=
erations
before the last one, use_7e remains false; on the last iteration (i =3D=3D =
nxfers -
1), use_7e is still false when xfer.m_param is constructed and is only set =
to
true right before the loop exits. Should USE_7E be set on the first transfer
(i =3D=3D 0), matching geni_i3c_master_send_ccc_cmd() and geni_i3c_perform_=
daa()?

Also, if nxfers =3D=3D 0, ret still holds the return value of
pm_runtime_get_sync(), which can be 1 when the device is already active.

[ ... ]

> +static int geni_i3c_master_i2c_xfers(struct i2c_dev_desc *dev, struct i2=
c_msg *msgs, int num)
> +{
> +	struct i3c_master_controller *m =3D i2c_dev_get_master(dev);
> +	struct geni_i3c_dev *gi3c =3D to_geni_i3c_master(m);
> +	int ret;
> +
> +	guard(mutex)(&gi3c->lock);
> +	reinit_completion(&gi3c->done);
> +
> +	ret =3D pm_runtime_get_sync(gi3c->se.dev);
> +	if (ret < 0) {
> +		dev_err(gi3c->se.dev, "Error turning on SE resources:%d\n", ret);
> +		pm_runtime_put_noidle(gi3c->se.dev);
> +		pm_runtime_set_suspended(gi3c->se.dev);
> +		return ret;
> +	}
> +
> +	qcom_geni_i3c_conf(gi3c, OPEN_DRAIN_MODE);
> +
> +	for (int i =3D 0; i < num; i++) {
> +		struct geni_i3c_xfer_params xfer;
> +
> +		xfer.m_cmd    =3D (msgs[i].flags & I2C_M_RD) ? I2C_READ : I2C_WRITE;
> +		xfer.m_param  =3D (i < (num - 1)) ? STOP_STRETCH : 0;
> +		xfer.m_param |=3D FIELD_PREP(SLAVE_ADDR_MASK, msgs[i].addr);
> +		xfer.mode     =3D msgs[i].len > (gi3c->tx_depth / 2) ?
> +				GENI_SE_DMA : GENI_SE_FIFO;
> +		if (msgs[i].flags & I2C_M_RD)
> +			ret =3D i3c_geni_execute_read_command(gi3c, &xfer, msgs[i].buf,
> +							    msgs[i].len);
> +		else
> +			ret =3D i3c_geni_execute_write_command(gi3c, &xfer, msgs[i].buf,
> +							     msgs[i].len);

[Severity: Critical]
Is it safe to pass msgs[i].buf directly to GENI_SE_DMA in
geni_i3c_master_i2c_xfers() without i2c_get_dma_safe_msg_buf()?

The I2C/I3C core does not guarantee that i2c_msg buffers are DMA-safe (for
instance, i3c_master_i2c_funcs() advertises I2C_FUNC_SMBUS_EMUL, where
i2c_smbus_xfer_emulated() passes stack-allocated buffers up to 34 bytes). W=
hen
msgs[i].len > (gi3c->tx_depth / 2), _i3c_geni_execute_command() calls
geni_se_tx_dma_prep() / geni_se_rx_dma_prep(), which maps msgs[i].buf direc=
tly
with dma_map_single(). Should this use i2c_get_dma_safe_msg_buf() and
i2c_put_dma_safe_msg_buf() like i2c-qcom-geni.c does?

Also, in i3c_geni_resources_init(), gi3c->se.icc_paths[GENI_TO_DDR].avg_bw =
is
left at 0 before calling geni_icc_set_bw(&gi3c->se), so the DDR interconnect
path is not voted for when GENI_SE_DMA is used.

[ ... ]

> +static int geni_i3c_hw_init(struct geni_i3c_dev *gi3c, struct platform_d=
evice *pdev)
> +{
> +	u32 proto, fifo_disable;
> +
> +	proto =3D geni_se_read_proto(&gi3c->se);
> +	if (proto !=3D GENI_SE_I3C) {
> +		geni_se_resources_off(&gi3c->se);
> +		return dev_err_probe(gi3c->se.dev, -ENXIO, "Invalid proto %d\n", proto=
);
> +	}
> +
> +	fifo_disable =3D readl_relaxed(gi3c->se.base + GENI_IF_DISABLE_RO);
> +	if (fifo_disable) {
> +		geni_se_resources_off(&gi3c->se);
> +		return dev_err_probe(gi3c->se.dev, -ENXIO, "GPI DMA mode not supported=
\n");
> +	}

[ ... ]

> +	ret =3D devm_request_irq(&pdev->dev, gi3c->irq, geni_i3c_irq,
> +			       IRQF_NO_AUTOEN, dev_name(&pdev->dev), gi3c);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "Error registering core IRQ\n");
> +
> +	ret =3D geni_se_resources_on(&gi3c->se);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "Error turning resources ON\n");
> +
> +	ret =3D geni_i3c_hw_init(gi3c, pdev);
> +	geni_se_resources_off(&gi3c->se);
> +	if (ret)
> +		return ret;

[Severity: Medium]
If geni_i3c_hw_init() fails, doesn't geni_i3c_probe() call
geni_se_resources_off(&gi3c->se) a second time?

Both error paths in geni_i3c_hw_init() already call
geni_se_resources_off(&gi3c->se) before returning, and geni_i3c_probe() then
unconditionally calls geni_se_resources_off(&gi3c->se) again, underflowing =
the
clock enable/prepare counts on se->clk and the parent QUP wrapper clocks.

[Severity: High]
What happens during geni_i3c_probe() when CONFIG_PM is disabled?

geni_i3c_probe() requests gi3c->irq with IRQF_NO_AUTOEN and calls
geni_se_resources_off(&gi3c->se) before i3c_master_register(). When CONFIG_=
PM
is disabled, pm_runtime_resume_and_get() in geni_i3c_master_bus_init() and
pm_runtime_get_sync() in the transfer paths do not invoke
geni_i3c_runtime_resume(), so qcom_geni_i3c_conf() will access unclocked GE=
NI
registers during i3c_master_register() and the IRQ will remain disabled.

[ ... ]

> +static int geni_i3c_runtime_suspend(struct device *dev)
> +{
> +	struct geni_i3c_dev *gi3c =3D dev_get_drvdata(dev);
> +
> +	disable_irq(gi3c->irq);
> +	geni_se_resources_off(&gi3c->se);
> +
> +	return 0;
> +}

[Severity: Medium]
Should geni_i3c_runtime_suspend() check the return value of
geni_se_resources_off()?

If pinctrl_pm_select_sleep_state() fails inside geni_se_resources_off(), the
clocks remain enabled while geni_i3c_runtime_suspend() leaves gi3c->irq
disabled and returns 0, causing the next runtime resume to call
geni_se_resources_on() again and leak the clock enable count.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104122155.3789=
346-1-mukesh.savaliya@oss.qualcomm.com?part=3D2
