Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC32330F534
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 06:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780468734; cv=none; b=VG1VfJbYN1UX1Osf5YXQueLya9wV6xoxKew7RzpezibZ/Jrfp0djeO1vHZHWi6o+fkvTfMcBcqolm+0n8BmYAcLsGZGpt/hvN3X0LDwgRaW1ajenJH2CHN8XsDNT19sN/ebDaGs42f/jApQUYZbloKenYhpFmXM0VGwJvqdwHAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780468734; c=relaxed/simple;
	bh=fMjE8bz78lSvhegJztlU3rVzJFmdf8imzASUe0CSXeI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HNzEsye0kolH0vfSrlIzcoqtgbyz/Nk6cr1gdI5E2g7a3NNofx3FPJ6juyPMmGV/FQlDl6O33ktv4LGZRp2iQ0DKKlpxrHvU7zQLEUPZtY1SoQ3aJy5u/NPvxSOasds9PaxDNoBmnnNGyawOJnh4877FBfTed+MT95hOPUNb+Rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TAuEos40; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TAuEos40"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 330301F00893;
	Wed,  3 Jun 2026 06:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780468732;
	bh=XNVmdbtFOERVtVIseI4bEblSMCgSwUCx69WpFo+sSwQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TAuEos40Pq6u7pjY2lGslcOb4Tzk9f5e0XgyXughtZS2tLCltXA1OMeO86krPIOMn
	 MZKq0Y67hXL7f/sMks1ZeebwLBKLqC76UDFXMSDNMSmIf51oY14gW+1xbRYktqBdcD
	 hwGOKKfsNC4GJDRc8AM250TT/HSbTXVMgTrt3f+HuAvUdrIVX9F75wwPeyDpuYIp7i
	 XISvMD56CjOSLryfTyDttSVEvDvG2t5W6tqheT8itllEeLQfJwNdZx32S9AQs+Dym9
	 kECNOVpBzCZt5Dymh9xYYFk2ErKN4yDf6sc24U5KCGiNzufjcpR8uyX6chb4ub/pLu
	 e7HbgT6cpko1w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v31 5/5] i2c: ast2600: Add target mode support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ryan Chen" <ryan_chen@aspeedtech.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260603-upstream_i2c-v31-5-ba7a02714f22@aspeedtech.com>
References: <20260603-upstream_i2c-v31-5-ba7a02714f22@aspeedtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 06:38:51 +0000
Message-Id: <20260603063852.330301F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Target RX data is discarded when a target interrupt aborts a concu=
rrent controller transfer due to premature zeroing of `AST2600_I2CC_BUFF_CT=
RL`.
- [High] Incorrect I2C slave event ordering and generation of spurious even=
ts.
- [High] Missing clamp on target RX buffer length causes out-of-bounds MMIO=
 reads.
- [High] `target_active` is incorrectly set to `false` when a STOP conditio=
n and a new transaction start are coalesced, leading to shared buffer corru=
ption.
- [High] Failing to explicitly W1C-clear error status bits permanently dead=
locks the controller.
- [High] Use-After-Free (UAF) of i2c_bus->msgs due to premature re-enabling=
 of master interrupts.
--

commit d29dcb5ac45f9953b386f06cfe1a4604787fdc18
Author: Ryan Chen <ryan_chen@aspeedtech.com>

i2c: ast2600: Add target mode support

This commit adds target mode support to the AST2600 I2C driver.
It implements target interrupt handling and address match and
response logic to enable dual-role capability.

> diff --git a/drivers/i2c/busses/i2c-ast2600.c b/drivers/i2c/busses/i2c-as=
t2600.c
> --- a/drivers/i2c/busses/i2c-ast2600.c
> +++ b/drivers/i2c/busses/i2c-ast2600.c
[ ... ]
> @@ -346,6 +351,253 @@ static int ast2600_i2c_recover_bus(struct ast2600_i=
2c_bus *i2c_bus)
>  	return ret;
>  }
> =20
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +static void ast2600_i2c_target_packet_buff_irq(struct ast2600_i2c_bus *i=
2c_bus, u32 sts)
> +{
> +	u8 value =3D 0;
> +	int target_rx_len =3D 0;
> +	u32 cmd =3D 0;
> +	int i;
> +
> +	/* due to controller target is common buffer, need force the master sto=
p not issue */
> +	if (readl(i2c_bus->reg_base + AST2600_I2CM_CMD_STS) & GENMASK(15, 0)) {
> +		writel(0, i2c_bus->reg_base + AST2600_I2CM_CMD_STS);
> +		writel(0, i2c_bus->reg_base + AST2600_I2CM_IER);
> +		writel(readl(i2c_bus->reg_base + AST2600_I2CM_ISR),
> +		       i2c_bus->reg_base + AST2600_I2CM_ISR);
> +		i2c_bus->cmd_err =3D -EBUSY;
> +		writel(0, i2c_bus->reg_base + AST2600_I2CC_BUFF_CTRL);

[Severity: High]
Does zeroing AST2600_I2CC_BUFF_CTRL here discard the target's received RX
buffer length?=20

When the handler subsequently reads this register to determine the target RX
length, it will get 0, potentially dropping any received target data.

> +		complete(&i2c_bus->cmd_complete);
> +		writel(AST2600_I2CM_PKT_DONE | AST2600_I2CM_BUS_RECOVER,
> +		       i2c_bus->reg_base + AST2600_I2CM_IER);

[Severity: High]
Could this cause a use-after-free of i2c_bus->msgs?=20

Waking the master thread with complete() before re-enabling master interrup=
ts
allows the thread to resume and clear msgs to NULL. If a hardware master
interrupt fires concurrently, the racing IRQ handler might access
i2c_bus->msgs before it is NULLed out.

> +	}
> +
> +	/* Handle i2c target timeout condition */
> +	if (sts & AST2600_I2CS_INACTIVE_TO) {
> +		/* Reset timeout counter */
> +		u32 ac_timing =3D readl(i2c_bus->reg_base + AST2600_I2CC_AC_TIMING) &
> +				AST2600_I2CC_AC_TIMING_MASK;
> +
> +		writel(ac_timing, i2c_bus->reg_base + AST2600_I2CC_AC_TIMING);
> +		ac_timing |=3D AST2600_I2CC_TTIMEOUT(i2c_bus->timeout);
> +		writel(ac_timing, i2c_bus->reg_base + AST2600_I2CC_AC_TIMING);
> +		writel(TARGET_TRIGGER_CMD, i2c_bus->reg_base + AST2600_I2CS_CMD_STS);
> +		writel(AST2600_I2CS_PKT_DONE, i2c_bus->reg_base + AST2600_I2CS_ISR);

[Severity: High]
Is it possible for the controller to permanently deadlock here?

The AST2600_I2CS_ISR register uses write-1-to-clear bits, but only
AST2600_I2CS_PKT_DONE is written. The AST2600_I2CS_INACTIVE_TO error bit
remains set, which might cause subsequent controller transfers to
unconditionally evaluate readl(I2CS_ISR) as true and return -EBUSY.

> +		i2c_slave_event(i2c_bus->target, I2C_SLAVE_STOP, &value);
> +		WRITE_ONCE(i2c_bus->target_active, false);
> +		return;
> +	}
> +
> +	sts &=3D ~(AST2600_I2CS_PKT_DONE | AST2600_I2CS_PKT_ERROR);
> +
> +	if (sts & AST2600_I2CS_SLAVE_MATCH)
> +		WRITE_ONCE(i2c_bus->target_active, true);
> +
> +	switch (sts) {
> +	case AST2600_I2CS_SLAVE_PENDING | AST2600_I2CS_WAIT_RX_DMA |
> +		 AST2600_I2CS_SLAVE_MATCH | AST2600_I2CS_RX_DONE | AST2600_I2CS_STOP:
> +	case AST2600_I2CS_SLAVE_PENDING |
> +		 AST2600_I2CS_SLAVE_MATCH | AST2600_I2CS_RX_DONE | AST2600_I2CS_STOP:
> +	case AST2600_I2CS_SLAVE_PENDING |
> +		 AST2600_I2CS_SLAVE_MATCH | AST2600_I2CS_STOP:
> +		i2c_slave_event(i2c_bus->target, I2C_SLAVE_STOP, &value);
> +		fallthrough;

[Severity: High]
Will emitting I2C_SLAVE_STOP before falling through to emit
I2C_SLAVE_WRITE_REQUESTED and I2C_SLAVE_WRITE_RECEIVED break backend state
machines?=20

Some backends, like i2c-slave-eeprom, rely on the STOP event to commit writ=
es,
so the order here might cause them to mishandle the transaction.

> +	case AST2600_I2CS_SLAVE_PENDING |
> +		 AST2600_I2CS_WAIT_RX_DMA | AST2600_I2CS_SLAVE_MATCH | AST2600_I2CS_RX=
_DONE:
> +	case AST2600_I2CS_WAIT_RX_DMA | AST2600_I2CS_SLAVE_MATCH | AST2600_I2CS=
_RX_DONE:
> +	case AST2600_I2CS_WAIT_RX_DMA | AST2600_I2CS_SLAVE_MATCH:
> +		i2c_slave_event(i2c_bus->target, I2C_SLAVE_WRITE_REQUESTED, &value);
> +		cmd =3D TARGET_TRIGGER_CMD;
> +		if (sts & AST2600_I2CS_RX_DONE) {
> +			target_rx_len =3D AST2600_I2CC_GET_RX_BUF_LEN(readl(i2c_bus->reg_base=
 +
> +						       AST2600_I2CC_BUFF_CTRL));
> +			for (i =3D 0; i < target_rx_len; i++) {
> +				value =3D readb(i2c_bus->buf_base + i2c_bus->buf_size + i);

[Severity: High]
Could this loop read out-of-bounds mapped I/O memory?=20

The target_rx_len extracted from the hardware register is not clamped to the
software-defined i2c_bus->buf_size. If the hardware reports a length up to =
63,
iterating up to target_rx_len directly could cause an out-of-bounds MMIO re=
ad
from i2c_bus->buf_base.

> +				i2c_slave_event(i2c_bus->target, I2C_SLAVE_WRITE_RECEIVED, &value);
> +			}
> +		}
[ ... ]
> +	case AST2600_I2CS_SLAVE_MATCH | AST2600_I2CS_WAIT_TX_DMA | AST2600_I2CS=
_RX_DONE:
> +	case AST2600_I2CS_WAIT_TX_DMA | AST2600_I2CS_RX_DONE:
> +	case AST2600_I2CS_WAIT_TX_DMA:
> +		if (sts & AST2600_I2CS_SLAVE_MATCH)
> +			i2c_slave_event(i2c_bus->target, I2C_SLAVE_WRITE_REQUESTED, &value);

[Severity: High]
Does emitting I2C_SLAVE_WRITE_REQUESTED for a read match (WAIT_TX_DMA) corr=
upt
backend state?=20

This appears to generate a spurious write request before properly requesting
the read data.

> +
> +		if (sts & AST2600_I2CS_RX_DONE) {
[ ... ]
> +	if (cmd)
> +		writel(cmd, i2c_bus->reg_base + AST2600_I2CS_CMD_STS);
> +
> +	writel(AST2600_I2CS_PKT_DONE, i2c_bus->reg_base + AST2600_I2CS_ISR);
> +	readl(i2c_bus->reg_base + AST2600_I2CS_ISR);
> +
> +	if (sts & AST2600_I2CS_STOP)
> +		WRITE_ONCE(i2c_bus->target_active, false);

[Severity: High]
Could clearing target_active unconditionally on AST2600_I2CS_STOP lead to
shared buffer corruption?

If the hardware coalesces a STOP condition from a previous transaction with=
 a
SLAVE_MATCH for a new transaction, target_active is set to false while the
target hardware is still transmitting. A concurrent controller transfer mig=
ht
then see the bus as free and overwrite the shared I2C buffer.

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603-upstream_i=
2c-v31-0-ba7a02714f22@aspeedtech.com?part=3D5
