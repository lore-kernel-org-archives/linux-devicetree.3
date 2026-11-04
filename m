Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793792633;
	b=UsJU3exRLrWZeUCFz4CkqbMED1ZM9PSuQVXI9e/p+oNDGkMPvY3UjxvI6NdZw89WbTqi
	 SySGBwCl12YDsIE3KAsTQECJSAp3LfzRHcGaEVjO4zDLusjwNHrBP5y2rOVMjUXDC+NSP
	 VRTegdsRs9ckZnuX//53PZ+48+JoPl/z7qU85KNtzGP6FIFMBPNC+qUhxpnnXl+BiVGQ7
	 PM+B3WS3JQOvHhXDyYf1D0hknI8U1yizHBxZSzuituUNkEkJWBgNh0oXO8NNhUcmn2q4C
	 sAcnYtGKRa+56dPfJeqTiMTnykMyNAbuk77e1XAWh418XZ/0RuuwmBgXgXl0pcwffGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793792633;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=CS23nMGiYphLe/0ej6egsSAB2f8i8m7h8S/Y9UHFc0I=;
	b=J50ubVWL8PsWJFQLPRX7HWkOZvVeRaR8ekjd4EiRsGLibuyYdngP0wMT9qdXxmsv2Nej
	 2zoXNUDuiAMCwkq4PGH8NkeElh3qEaO/UgcT7NWJ8qGrYkQUgm0kP8ufELvB7zVzuu5eY
	 IUqTSitGgqI0D73XlFw4g0mqD4kHipEz4lRCq3W1mWZ0HeUX8ADov8yEObRZG9ADMoL2K
	 2BSdxDc31DEhewIRiT6Czlu1FwsIjU/SLXZtYITDy2PalcLlHyTws9+hHzdOqAQNoHR3q
	 FsNim96fnkFNEZqsYLgr3KXgHHFbGwfSIqzS0wYkDl/wrhhgjc+uJu/XxB03uS/LM1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AlG3bo64;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BBFA606A338
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 11:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AlG3bo64
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 440591F000C1;
	Wed,  4 Nov 2026 11:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793792632;
	bh=CS23nMGiYphLe/0ej6egsSAB2f8i8m7h8S/Y9UHFc0I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AlG3bo64TkwY/7W+PxQLU6vpw6d4VdFu2xw5IUNg/tN6csdAQSB17w/v+lDRmwsR3
	 hrpwp+2uO0dyQolroXYKA9CeDn6IuR9txmVDg3Cs7jjPAb3O/ARzraPlgGVSD6YKt8
	 zYKp3OjrWaTfKdNK01tIA02AiefN4wf2PuSN2SSvjkpZEjn8/YozuO0p58OOwUkEBX
	 JHz0xcZ0ng0ztB8PJNpX/66Zg/R+StH4JIFM5FxQsmvpDVMK1B8yq4eaPeKbcf/kSW
	 smNAtM7lFUkqV6DnClqz6ZcftiAhQTNAQUW0IYWq7YRX3YdjwRrWXkzbClgA2amNUm
	 bu0H2itBNPgxA==
Message-ID: <sashiko-outbox-197205@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/3] i3c: master: Add Qualcomm I3C controller driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mukesh Kumar Savaliya" <mukesh.savaliya@oss.qualcomm.com>, linux-i3c@lists.infradead.org, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20261104111610.3739095-2-mukesh.savaliya@oss.qualcomm.com>
References: <20261104111610.3739095-1-mukesh.savaliya@oss.qualcomm.com>
 <20261104111610.3739095-2-mukesh.savaliya@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 11:43:51 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 10 potential issue=
(s) to consider:
- [High] i3c: qcom-geni: use_7e updated after m_param in geni_i3c_master_pr=
iv_xfers()
- [High] i3c: qcom-geni: broken I3C_ADDR_MASK and DAA handling in geni_i3c_=
perform_daa()
- [High] i3c: qcom-geni: invalid clock lookup and 1 MHz cycle count in geni=
_i3c_clk_map
- [High] i3c: qcom-geni: unsafe I2C DMA mapping and broken DMA reset handli=
ng
- [High] i3c: qcom-geni: broken short RX FIFO reads and early termination i=
n geni_i3c_irq()
- [High] i3c: qcom-geni: NACK error overwrite and status bitmask mismatch i=
n geni_i3c_handle_err()
- [High] i3c: qcom-geni: missing reinit_completion() and TX_RESET_DONE in _=
i3c_geni_execute_command()
- [High] i3c: qcom-geni: TX watermark race and unhandled IRQ storm in geni_=
i3c_irq()
- [Medium] i3c: qcom-geni: double geni_se_resources_off() call in geni_i3c_=
probe()
- [Low] i3c: qcom-geni: unused variable m_stat_mask in geni_i3c_irq()
--

commit 2ad15e60246cd7898205f431d98abb7e053d2d97
Author: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>

i3c: master: Add Qualcomm I3C controller driver

This commit adds a driver for the Qualcomm QUPv3 GENI-based I3C master
controller supporting I3C SDR and legacy I2C transfers.

> diff --git a/drivers/i3c/master/i3c-qcom-geni.c b/drivers/i3c/master/i3c-=
qcom-geni.c
> new file mode 100644
> index 0000000000000..2fee77e681e26
> --- /dev/null
> +++ b/drivers/i3c/master/i3c-qcom-geni.c
[ ... ]
> +#define I3C_AUTO_SUSPEND_DELAY	250
> +#define PACKING_BYTES_PER_WORD	4
> +#define XFER_TIMEOUT		250
> +
> +#define I3C_ADDR_MASK		(I2C_MAX_ADDR >> 1)
[ ... ]
> +struct geni_i3c_dev {
[ ... ]
> +	u8 *cur_buf;
> +	u8 last_addr;
> +	bool cur_is_write;
> +	int cur_len;
> +	int cur_idx;
> +	DECLARE_BITMAP(newaddrslots, 64);
> +
> +	const struct geni_i3c_clk_settings *clk_cfg;
> +	const struct geni_i3c_clk_settings *clk_od_cfg;
> +};

[Severity: High]
Since I2C_MAX_ADDR is defined as GENMASK(6, 0) (0x7f) in
include/linux/i3c/master.h, shifting it right by 1 makes I3C_ADDR_MASK 0x3f
(6 bits instead of 7 bits), and newaddrslots is only 64 bits wide instead of
I3C_MAX_ADDR + 1 (128).

Later in geni_i3c_perform_daa():

	addr =3D i3c_master_get_free_addr(&gi3c->ctrlr,
					gi3c->last_addr + 1);
	if (addr > I3C_ADDR_MASK)
		return -EINVAL;

	gi3c->last_addr =3D addr;
	set_bit(addr, gi3c->newaddrslots);
	...
	ret =3D i3c_geni_execute_write_command(gi3c, &xfer, tx_buf, 1);
	if (ret)
		break;

Doesn't this reject valid 7-bit dynamic addresses from 0x40 to 0x7d (as well
as truncating negative error codes from i3c_master_get_free_addr() into u8)?

Also, in geni_i3c_perform_daa() and geni_i3c_master_send_ccc_cmd():
- gi3c->last_addr is never reset between DAA runs, so repeated DAA
  invocations will only search above the previous address until the range is
  exhausted.
- set_bit(addr, gi3c->newaddrslots) is called before
  i3c_geni_execute_write_command() sends the dynamic address to the target.
  If that write fails, geni_i3c_perform_daa() breaks out and returns 0 with
  addr still set in newaddrslots, causing geni_i3c_master_do_daa() to call
  i3c_master_add_i3c_dev_locked() for an unassigned address.
- geni_i3c_master_send_ccc_cmd() ignores the return value of
  geni_i3c_perform_daa(gi3c).

Should I3C_ADDR_MASK be I3C_MAX_ADDR (0x7f) with newaddrslots sized to
I3C_MAX_ADDR + 1, and should set_bit(addr, gi3c->newaddrslots) happen only
after the address write succeeds?

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
How does geni_i3c_clk_map_idx() behave on a pure I3C bus or a mixed-slow
bus?

In i3c_bus_set_mode(), when bus->mode is I3C_BUS_MODE_PURE and no i2c-scl-hz
property is set in devicetree, bus->scl_rate.i2c remains 0. Because no entry
in geni_i3c_clk_map[] has clk_freq_out =3D=3D 0, gi3c->clk_od_cfg stays NUL=
L and
geni_i3c_master_bus_init() fails with -EINVAL.

Conversely, in I3C_BUS_MODE_MIXED_SLOW (where i3c_bus_set_mode() clamps
bus->scl_rate.i3c to bus->scl_rate.i2c), i3c_geni_resources_init() hardcodes
gi3c->clk_src_freq to 100 MHz while the 100 kHz, 400 kHz, and 1000 kHz
entries in geni_i3c_clk_map[] all have clk_src_freq set to 19.2 MHz, so
gi3c->clk_cfg stays NULL and geni_i3c_clk_map_idx() also returns -EINVAL.

Also, in the 1000 kHz entry of geni_i3c_clk_map[], i3c_t_cycle_cnt is 0 whi=
le
i3c_t_high_cnt is 7 (whereas the 100 kHz and 400 kHz entries use
i3c_t_cycle_cnt =3D 8). Is programming SE_I3C_SCL_CYCLE to 0 when
qcom_geni_i3c_conf(gi3c, OPEN_DRAIN_MODE) selects the 1000 kHz entry
intentional?

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
[ ... ]
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
Won't geni_i3c_handle_err() clobber an earlier NACK error (-ENOTCONN or
-EBUSY) with -ETIMEDOUT when a transfer times out and aborts?

When a NACK interrupt fires without M_CMD_DONE_EN set, geni_i3c_irq() recor=
ds
-ENOTCONN or -EBUSY in gi3c->err and waits for the timeout path in
_i3c_geni_execute_command() to abort the command. Both the timeout path
(passing GENI_TIMEOUT) and the subsequent M_CMD_ABORT_EN interrupt overwrite
gi3c->err with -ETIMEDOUT, so geni_i3c_master_send_ccc_cmd() no longer sees
-ENOTCONN or -EBUSY and cannot set cmd->err =3D I3C_ERROR_M2.

In addition, status in geni_i3c_handle_err() is checked both as an
SE_GENI_M_IRQ_STATUS bitmask and for equality with the enum constant
GENI_TIMEOUT (which has value 9, or M_CMD_FAILURE_EN | M_CMD_DONE_EN). And
if geni_i3c_irq() enters the error branch due to dm_rx_st & DM_I3C_CB_ERR or
M_CMD_FAILURE_EN alone, geni_i3c_handle_err(gi3c, m_stat) leaves gi3c->err =
as
0. Should gi3c->err only be updated when it is not already set, with a
fallback error code when none of the specific M_GP_IRQ_* bits match?

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

[Severity: High]
What happens in geni_i3c_irq() when an I3C target returns a valid short read
response (for example, a 2-byte response to a 5-byte GETMXDS or 3-byte GETM=
RL
CCC read) or terminates a read early via the T-bit?

First, RX_FIFO_WC_MSK in SE_GENI_RX_FIFO_STATUS counts 32-bit FIFO words, a=
nd
valid bytes in the final partial word are indicated by RX_LAST and
RX_LAST_BYTE_VALID_MSK. Computing avail =3D rxcnt * 4 rounds a 2-byte respo=
nse
up to 4 bytes, so geni_i3c_master_send_ccc_cmd() sets
cmd->dests[i].payload.actual_len =3D gi3c->cur_idx to 4 (for GETMXDS, causi=
ng
i3c_master_getmxds_locked() to fail with -EIO) or 3 (for GETMRL, reading a
padding byte as max_ibi_len).

Second, M_GP_IRQ_0_EN ("I3C slave early read termination") is included in
SE_I3C_ERR and sets gi3c->err =3D -EINVAL in geni_i3c_handle_err(). Because
the FIFO RX handler is in an else-if branch after if (m_stat & SE_I3C_ERR .=
..),
an early-terminated read fails with -EINVAL and leaves the received words
unread in the RX FIFO.

> +		} else if ((m_stat & M_TX_FIFO_WATERMARK_EN) &&
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

[Severity: High]
Can M_TX_FIFO_WATERMARK_EN cause an unhandled interrupt storm if gi3c->cur_=
buf
becomes NULL while gi3c->cur_idx < gi3c->cur_len?

In _i3c_geni_execute_command():

	geni_se_setup_m_cmd(&gi3c->se, xfer->m_cmd, xfer->m_param);
	...
	if (xfer->mode =3D=3D GENI_SE_FIFO && len > 0) /* Get FIFO IRQ */
		writel_relaxed(1, gi3c->se.base + SE_GENI_TX_WATERMARK_REG);

Because geni_se_setup_m_cmd() is called before enabling
SE_GENI_TX_WATERMARK_REG without holding gi3c->irq_lock, an immediate error
or abort interrupt can run first and clear SE_GENI_TX_WATERMARK_REG, after
which _i3c_geni_execute_command() writes 1 to SE_GENI_TX_WATERMARK_REG and
sets gi3c->cur_buf =3D NULL. Likewise, on a transfer timeout,
_i3c_geni_execute_command() sets gi3c->cur_buf =3D NULL without clearing
SE_GENI_TX_WATERMARK_REG.

When M_TX_FIFO_WATERMARK_EN then fires in geni_i3c_irq() with
gi3c->cur_buf =3D=3D NULL and gi3c->cur_idx < gi3c->cur_len, neither the TX
branch nor the cur_idx =3D=3D cur_len check disables SE_GENI_TX_WATERMARK_R=
EG,
leaving the level-triggered watermark interrupt asserted continuously.

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
[ ... ]
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
In _i3c_geni_execute_command() and geni_i3c_irq(), how is gi3c->done
synchronized across multi-command loops and DMA FSM resets?

1. Callers only call reinit_completion(&gi3c->done) once before their
   transfer loops rather than in _i3c_geni_execute_command() before each
   command and before waiting on SE_DMA_TX_FSM_RST / SE_DMA_RX_FSM_RST.
2. In geni_i3c_irq(), the DMA completion check handles RX_RESET_DONE in
   dm_rx_st, but omits TX_RESET_DONE in dm_tx_st, so waiting for
   SE_DMA_TX_FSM_RST in _i3c_geni_execute_command() will always time out
   before geni_se_tx_dma_unprep() unmaps the buffer.
3. Because m_stat is not masked with SE_GENI_M_IRQ_EN, if M_CMD_DONE_EN is
   set in m_stat while dma_mode is active, geni_i3c_irq() can complete
   gi3c->done before TX_DMA_DONE or RX_DMA_DONE fires, causing
   _i3c_geni_execute_command() to unmap the DMA buffer while DMA is still in
   flight and leaving an extra completion in gi3c->done for the next comman=
d.

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
[ ... ]
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
In geni_i3c_master_priv_xfers(), use_7e is initialized to false and only set
to (i =3D=3D nxfers - 1) after xfer.m_param |=3D (use_7e) ? USE_7E : 0 has =
already
been evaluated.

On iterations i < nxfers - 1, use_7e is false; on the final iteration
i =3D=3D nxfers - 1, use_7e is still false when xfer.m_param is built and o=
nly
becomes true right before the loop exits. As a result, USE_7E is never set =
on
any transfer (and shouldn't USE_7E be set on the first transfer i =3D=3D 0,=
 as in
geni_i3c_master_send_ccc_cmd() and geni_i3c_perform_daa()?).

> +
> +			if (xfers[i].rnw) {
[ ... ]
> +static int geni_i3c_master_i2c_xfers(struct i2c_dev_desc *dev, struct i2=
c_msg *msgs, int num)
> +{
[ ... ]
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
> +		if (ret)
> +			break;
> +	}

[Severity: High]
In geni_i3c_master_i2c_xfers(), when msgs[i].len > (gi3c->tx_depth / 2),
msgs[i].buf is passed directly to GENI_SE_DMA and mapped with
dma_map_single() in geni_se_tx_dma_prep() / geni_se_rx_dma_prep().

Since i2c_msg buffers are not guaranteed to be DMA-safe (as noted in the
struct i3c_master_controller_ops documentation in include/linux/i3c/master.=
h),
should this use i2c_get_dma_safe_msg_buf() and i2c_put_dma_safe_msg_buf()?

Also, for GENI_SE_DMA transfers:
- In _i3c_geni_execute_command(), geni_se_setup_m_cmd() starts the hardware
  command before geni_se_tx_dma_prep() or geni_se_rx_dma_prep() sets up the
  DMA transfer (or falls back to GENI_SE_FIFO).
- In i3c_geni_resources_init(), avg_bw is set on GENI_TO_CORE and
  CPU_TO_GENI, but gi3c->se.icc_paths[GENI_TO_DDR].avg_bw is left at 0.

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
> +static int geni_i3c_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	ret =3D geni_se_resources_on(&gi3c->se);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "Error turning resources ON\n");
> +
> +	ret =3D geni_i3c_hw_init(gi3c, pdev);
> +	geni_se_resources_off(&gi3c->se);
> +	if (ret)
> +		return ret;
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
If geni_i3c_hw_init() fails, it calls geni_se_resources_off(&gi3c->se) befo=
re
returning, and then geni_i3c_probe() calls geni_se_resources_off(&gi3c->se)=
 a
second time. Won't this underflow the enable/prepare counts on se->clk and
the shared QUP wrapper clocks?

Also, in geni_i3c_runtime_suspend(), if geni_se_resources_off(&gi3c->se)
fails (for instance if pinctrl_pm_select_sleep_state() returns an error
before clocks are disabled), should the error be propagated after re-enabli=
ng
gi3c->irq?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104111610.3739=
095-1-mukesh.savaliya@oss.qualcomm.com?part=3D2
