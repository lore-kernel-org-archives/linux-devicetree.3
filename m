Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D89F3A05E5
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 14:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782658199; cv=none; b=jIoXeBugG+qz8FUNorMmlMh+6lgopnpNBj+q5jtZYsyIo4YSV3CyVwNh2FfBwOEydqilajkKW8XnBatPl1/api3lyvVcADbjOhO+TOobvX1X7uVUVDefjHxvZWO9XkEXcaFCbsz1xMLFJL+n27dJTkw+dTgt4avdjgrsSldA4D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782658199; c=relaxed/simple;
	bh=50O+fTkpsWU06GfKl6jOJvMtuHsNAIiiIYLEF0sS/P4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Vf13R5E88VdaKH9nYu2uHCk8isdxNo9MTQrd7u7z7m5et5Ek8O06qvONXbkuVRvFSPXRgihRPH8kCwOEq88OIPc47GTzzgCgzGhTAgnlNsZEZNmPQlucjOeIec7az+qXhAVBRCCXR0vvXNJpoF9KZjuAag/ZB59ZlhJOhM++GjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QL2a1/Nf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QL2a1/Nf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9ABE1F000E9;
	Sun, 28 Jun 2026 14:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782658198;
	bh=qZC4Bgsir9AnzQWO7LYqxK2mGleJXDku9tV5Bwi4MYE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QL2a1/NfHuIVTwi4y9ODgjKdeYrvl4zPqWYr/R/kpkDaim6qloEdCtGimE4OzFDtW
	 dd1MM6rGAQkTaxSZ3P+L8uictvvbnFlA3MOqhHu6eVKNoVlC1rbLwMfPu+0qdJKZ8M
	 4Hl1YddXkshx0Ibd1vSTAzVnxrqdV/EaqO9WNZuGidN0Evvkd6JiKKjihyRwWfuDRC
	 kwVdXj+yMGZvX1gg9cGbnSNsGeA3Z/8cYngQ1jIkeFPRPi8Dy2HhR2H6peEHIql7EK
	 F7MrQwUu9Wl0AIQpLE5h0bd0t9oJE/bNeYXEmGdH016FjKBAcA1md3QifS1qcqk0sE
	 Inv1QRDLul9NQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 2/3] i2c: qcom-slave: Add driver for Qualcomm I2C
 slave controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Viken Dadhaniya" <viken.dadhaniya@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260628-i2c-qcom-slave-v1-2-8b0a5c01f9f6@oss.qualcomm.com>
References: <20260628-i2c-qcom-slave-v1-0-8b0a5c01f9f6@oss.qualcomm.com>
 <20260628-i2c-qcom-slave-v1-2-8b0a5c01f9f6@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 28 Jun 2026 14:49:57 +0000
Message-Id: <20260628144957.D9ABE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:
- [Critical] Initialization and teardown ordering leaves the interrupt hand=
ler active while the interconnect bandwidth path is disabled, risking fatal=
 bus aborts.
- [Critical] The TX_FIFO_EMPTY interrupt is permanently enabled but never m=
asked when the FIFO is empty, leading to an immediate interrupt storm.
- [High] The driver implements an I2C slave controller by hijacking the mas=
ter `smbus_xfer` API instead of using the standard Linux I2C slave framewor=
k.
- [High] The interrupt handler resets the controller on fatal errors withou=
t holding the driver's spinlock, racing with concurrent userspace read/writ=
e operations.
- [High] The driver writes directly to the hardware TX FIFO without checkin=
g if there is available space, allowing userspace to overflow it.
- [High] Received data from multiple separate I2C transactions is appended =
without resetting the buffer, destroying message boundaries and wedging the=
 RX FIFO.
- [High] Error recovery performs a read-modify-write on a command register =
and immediately overwrites it, potentially canceling recovery.
- [High] Error recovery resets the controller but fails to restore the prog=
rammed I2C slave address.
--

commit 99a7e48b114fde46339ce7f708bbacadb9e1ea19
Author: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Subject: i2c: qcom-slave: Add driver for Qualcomm I2C slave controller

This commit adds support for the dedicated Qualcomm I2C slave controller
found on QDU1000 and related SoCs. It registers the controller as an SMBus
adapter and handles read/write requests, IRQ events, and power management.

> diff --git a/drivers/i2c/busses/i2c-qcom-slave.c b/drivers/i2c/busses/i2c=
-qcom-slave.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-qcom-slave.c
[ ... ]
> +static void qcom_i2c_slave_write_fifo(struct qcom_i2c_slave *slave)
> +{
> +	int i;
> +
> +	if (!slave->tx_count) {
> +		dev_err(slave->dev, "TX FIFO write count is zero\n");
> +		return;
> +	}
> +
> +	for (i =3D 0; i < slave->tx_count; i++) {
> +		dev_dbg(slave->dev, "Data to TX FIFO: 0x%x\n",
> +			slave->tx_msg_buf[i]);
> +		writel(slave->tx_msg_buf[i], slave->base + I2C_S_TX_FIFO);
> +	}

[Severity: High]
Does this loop write to the TX FIFO without verifying available hardware
capacity? If userspace provides a payload larger than the FIFO depth, could
this overflow the hardware FIFO?=20

Should this check TX_FIFO_COUNT_MASK in I2C_S_FIFOS_STATUS first?

> +
> +	slave->tx_count =3D 0;
> +}
[ ... ]
> +static void qcom_i2c_slave_read_fifo(struct qcom_i2c_slave *slave)
> +{
[ ... ]
> +	for (i =3D 0; i < rx_data_count &&
> +	     slave->rx_count < I2C_SLAVE_MAX_MSG_SIZE; i++) {
> +		slave->rx_msg_buf[slave->rx_count] =3D
> +			readl_relaxed(slave->base + I2C_S_RX_FIFO);
> +		dev_dbg(slave->dev, "Data from RX FIFO: 0x%x\n",
> +			slave->rx_msg_buf[slave->rx_count]);
> +		slave->rx_count++;
> +	}
> +}

[Severity: High]
Does this append data from multiple separate I2C transactions together with=
out
resetting the buffer on message boundaries?=20

Also, if slave->rx_count reaches I2C_SLAVE_MAX_MSG_SIZE, will this stop
draining the hardware FIFO and leave the controller permanently asserting
RX interrupts?

[ ... ]
> +static void qcom_i2c_slave_hw_init(struct qcom_i2c_slave *slave)
> +{
> +	writel(CLEAR_TX_FIFO | CLEAR_RX_FIFO, slave->base + I2C_S_CONTROL);
> +	writel(QCOM_I2C_SLAVE_ALL_IRQ, slave->base + I2C_S_IRQ_EN);

[Severity: High]
Is the TX_FIFO_EMPTY interrupt permanently enabled here via
QCOM_I2C_SLAVE_ALL_IRQ?=20

If the FIFO is initially empty, will this cause an immediate interrupt
storm upon probe since the handler doesn't mask it when there is no data
to transmit?

> +	writel(slave->slave_addr, slave->base + I2C_S_DEVICE_ADDR);
> +	writel(CORE_EN, slave->base + I2C_S_CONFIG);
> +}
[ ... ]
> +static irqreturn_t qcom_i2c_slave_interrupt(int irq, void *dev_id)
> +{
> +	struct qcom_i2c_slave *slave =3D dev_id;
> +	u32 irq_stat;
> +
> +	irq_stat =3D readl_relaxed(slave->base + I2C_S_IRQ_STATUS);
> +	if (!irq_stat)
> +		return IRQ_NONE;
> +
> +	dev_dbg(slave->dev, "IRQ status: 0x%x\n", irq_stat);
> +
> +	/*
> +	 * ERR_CONDITION and CLOCK_LOW_TIMEOUT require full recovery.
> +	 * Return early after handling to avoid processing stale irq_stat bits.
> +	 */
> +	if (irq_stat & (BIT(ERR_CONDITION) | BIT(CLOCK_LOW_TIMEOUT))) {
> +		enum qcom_i2c_slave_irq irq_type =3D (irq_stat & BIT(ERR_CONDITION)) ?
> +						    ERR_CONDITION : CLOCK_LOW_TIMEOUT;
> +		dev_err(slave->dev, "%s\n", qcom_i2c_slave_irq_names[irq_type]);
> +		qcom_i2c_slave_dump_regs(slave);
> +		qcom_i2c_slave_set_bits(slave, I2C_S_SW_RESET_REG, SW_RESET);

[Severity: High]
Is this software reset performed without holding slave->lock? If a concurre=
nt
thread is executing qcom_i2c_slave_write() and modifying the TX FIFO, could
this cause hardware state corruption?

[Severity: High]
Does SW_RESET clear the hardware registers, including I2C_S_DEVICE_ADDR?
If so, does this recovery path leave the controller without its configured
slave address, causing it to drop off the bus?

> +		qcom_i2c_slave_clear_irq(slave, QCOM_I2C_SLAVE_ALL_IRQ);
> +		writel(QCOM_I2C_SLAVE_ALL_IRQ, slave->base + I2C_S_IRQ_EN);
> +		qcom_i2c_slave_set_bits(slave, I2C_S_CONTROL,
> +					CLEAR_TX_FIFO | CLEAR_RX_FIFO);
> +		qcom_i2c_slave_set_bits(slave, I2C_S_CONFIG, CORE_EN);
> +		writel(NACK, slave->base + I2C_S_CONTROL);

[Severity: High]
Does this writel() immediately overwrite the I2C_S_CONTROL register that was
just modified by qcom_i2c_slave_set_bits()? Since it only writes the NACK
bit, will it unintentionally clear the FIFO command bits and other control
state before the hardware can process them?

> +		return IRQ_HANDLED;
> +	}
[ ... ]
> +static int qcom_i2c_slave_xfer(struct i2c_adapter *adap, u16 addr,
> +			       unsigned short flags, char read_write,
> +			       u8 command, int protocol,
> +			       union i2c_smbus_data *data)
> +{
[ ... ]
> +static u32 qcom_i2c_slave_func(struct i2c_adapter *adap)
> +{
> +	return I2C_FUNC_SMBUS_BYTE      |
> +	       I2C_FUNC_SMBUS_BYTE_DATA |
> +	       I2C_FUNC_SMBUS_WORD_DATA |
> +	       I2C_FUNC_SMBUS_BLOCK_DATA;
> +}
> +
> +static const struct i2c_algorithm qcom_i2c_slave_algo =3D {
> +	.smbus_xfer	=3D qcom_i2c_slave_xfer,
> +	.functionality	=3D qcom_i2c_slave_func,
> +};

[Severity: High]
Does this driver register a master SMBus algorithm (smbus_xfer) for a purely
slave IP?=20

Would this break interoperability with standard I2C slave backends (like
i2c-slave-eeprom) which expect the standard Linux I2C slave framework inste=
ad
of intercepting master ioctls?

[ ... ]
> +static int qcom_i2c_slave_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	ret =3D devm_request_irq(dev, slave->irq, qcom_i2c_slave_interrupt, 0,
> +			       dev_name(dev), slave);
> +	if (ret) {
> +		dev_err(dev, "request_irq failed for IRQ %d: %d\n",
> +			slave->irq, ret);
> +		return ret;
> +	}
> +
> +	ret =3D qcom_i2c_slave_icc_init(slave);
> +	if (ret)
> +		return ret;

[Severity: High]
Is the interrupt requested before the interconnect bandwidth path is
initialized?=20

If an external master sends a transaction in this window, could the interru=
pt
fire and access hardware registers over a disabled interconnect, leading to
a bus abort?

[ ... ]
> +static void qcom_i2c_slave_remove(struct platform_device *pdev)
> +{
> +	struct qcom_i2c_slave *slave =3D platform_get_drvdata(pdev);
> +
> +	i2c_del_adapter(&slave->adap);
> +	icc_disable(slave->icc_path);

[Severity: High]
Does this disable the interconnect while the devm-managed interrupt and
hardware are still active?=20

If an interrupt fires after icc_disable() but before devres cleanup, could
this trigger a panic?

> +	/* clocks are disabled automatically by devm */
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260628-i2c-qcom-s=
lave-v1-0-8b0a5c01f9f6@oss.qualcomm.com?part=3D2
