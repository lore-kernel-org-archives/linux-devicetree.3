Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF47134BA20
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781156807; cv=none; b=YtthJncUu0ZPBcyGCGLFoGgvmVYVv01Or9SZV2XnceNoKBLl8v8AdP1Z6vnhVk7TP9PxxgKxIE0qNhu6r+1K+XniOP+5nZcNdeZgqI3XzKZHK8oOnd6PfESJ9Aa5wTnFxNd5Cfo7Xs+rRhFHxd/5QulSOUEZ681YWrY+ryVCMls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781156807; c=relaxed/simple;
	bh=mBnd7hwDnDZ4/6RKj5OnY20wHneCq5znEvFo609x2Qs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pIdqWOFAI4TRN1jHPbOMWj9WcDN9ZraGGCpbDUL8PLQxtyY92/S5BIvMaKY+NBv+08Q+z3EdbNjGOm0e2XLvYuPwa31cxDMlKLd4wb5uU7bgyBHRGkMs3g3V1R2MZmRMNfC7POWfy8XqLAMZFBI8NbaIUFYBWmNF5X2CGT0fD38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e8AbUAMV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e8AbUAMV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FEEF1F00893;
	Thu, 11 Jun 2026 05:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781156805;
	bh=z9UDetcYzsCJ6voQhnYWhnTbyGzhpwjDOBeBXWSaRbA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=e8AbUAMVFhQKeZ2bFF2pRuuazsX6Moz2Zw1zS/f63FhCaYT6nZcmu8LQ0qcGuj5hW
	 YMGrtyvpotKxplmKeRQHqY8A+Tu6NWvJSPguAYaItzK0+6OSZdIzICvK4hVsIpr6/P
	 GoEpVm3AakffbdqXxjjUG2bjPP0ORNOwuyfDGr95koQF5LAqbsbtaOuAbDpu7s9f6o
	 qjCGpVB11YfhOomL9SYf5xxpqCYXamNUYTu4dXQ3k8YD6Qk/lhamhnLXwOFBIG7mcc
	 RWqSlxbNUUCv0LPd0SdNeCCjrVG0k1y5PJ/4gudfBygeKhFRtXZuEml4BEkAEKWdqC
	 H4Nq62J82DChA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v32 5/5] i2c: ast2600: Add target mode support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ryan Chen" <ryan_chen@aspeedtech.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260611-upstream_i2c-v32-5-b66eba921d01@aspeedtech.com>
References: <20260611-upstream_i2c-v32-5-b66eba921d01@aspeedtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jun 2026 05:46:44 +0000
Message-Id: <20260611054645.3FEEF1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Incorrect chronological ordering of I2C slave events and spurious =
event signaling in the target interrupt handler breaks backend state machin=
es.
- [High] Controller mode can be permanently locked out because `target_acti=
ve` is not reliably cleared upon target transaction STOP.
- [High] Race condition in the target mode master-abort fast path leaves st=
ale controller interrupts pending, leading to use-after-free and data corru=
ption of subsequent I2C transfers.
- [High] Failure to W1C-clear target ISR error bits causes a permanent dead=
lock where all subsequent controller transfers fail with -EBUSY.
--

commit e5417daca64552c41b25f31b14fb3eb562d3e134
Author: Ryan Chen <ryan_chen@aspeedtech.com>

i2c: ast2600: Add target mode support

Add target mode support to the AST2600 I2C driver, enabling dual-role=20
capability. This includes adding target interrupt handling and address matc=
h=20
response logic.

> diff --git a/drivers/i2c/busses/i2c-ast2600.c b/drivers/i2c/busses/i2c-as=
t2600.c
> index 70f37dc77468a..aace0c7eeb721 100644
> --- a/drivers/i2c/busses/i2c-ast2600.c
> +++ b/drivers/i2c/busses/i2c-ast2600.c
> @@ -348,6 +353,253 @@ static int ast2600_i2c_recover_bus(struct ast2600_i=
2c_bus *i2c_bus)
[ ... ]
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
> +		WRITE_ONCE(i2c_bus->msgs, NULL);
> +		writel(AST2600_I2CM_PKT_DONE | AST2600_I2CM_BUS_RECOVER,
> +		       i2c_bus->reg_base + AST2600_I2CM_IER);
> +		complete(&i2c_bus->cmd_complete);
> +	}

[Severity: High]
Could this fast path abort leave stale controller interrupts pending?

If the hardware asynchronously asserts PKT_DONE or PKT_ERROR shortly after =
the
W1C ISR read here, the complete() call wakes the waiting thread, which might
immediately start a new controller transfer.

Would the stale interrupt then fire and incorrectly apply to the new transf=
er,
potentially leading to a use-after-free on the new msgs buffer?

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
> +		i2c_slave_event(i2c_bus->target, I2C_SLAVE_STOP, &value);
> +		WRITE_ONCE(i2c_bus->target_active, false);
> +		return;
> +	}

[Severity: High]
Does this early return fail to clear the AST2600_I2CS_INACTIVE_TO bit from
the hardware register?

Since it is never W1C-cleared, the ISR register might remain non-zero
permanently.

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
Is the event ordering inverted here?

This unconditionally emits I2C_SLAVE_STOP first, and then falls through to
emit I2C_SLAVE_WRITE_REQUESTED and I2C_SLAVE_WRITE_RECEIVED.

Emitting the STOP condition prior to receiving the write data leaves backend
state machines (like i2c-slave-eeprom) without a terminating event for the
data, which typically causes writes to be dropped.

[ ... ]
> +	case AST2600_I2CS_SLAVE_MATCH | AST2600_I2CS_WAIT_TX_DMA | AST2600_I2CS=
_RX_DONE:
> +	case AST2600_I2CS_WAIT_TX_DMA | AST2600_I2CS_RX_DONE:
> +	case AST2600_I2CS_WAIT_TX_DMA:
> +		if (sts & AST2600_I2CS_SLAVE_MATCH)
> +			i2c_slave_event(i2c_bus->target, I2C_SLAVE_WRITE_REQUESTED, &value);

[Severity: High]
Can this spuriously emit I2C_SLAVE_WRITE_REQUESTED during a repeated start
transitioning to a Master Read (WAIT_TX_DMA)?

If so, it would reset the backend's internal write pointers, corrupting
previously received write data before I2C_SLAVE_READ_REQUESTED is processed.

[ ... ]
> +	if (cmd)
> +		writel(cmd, i2c_bus->reg_base + AST2600_I2CS_CMD_STS);
> +
> +	writel(AST2600_I2CS_PKT_DONE, i2c_bus->reg_base + AST2600_I2CS_ISR);
> +	readl(i2c_bus->reg_base + AST2600_I2CS_ISR);
> +
> +	if ((sts & AST2600_I2CS_STOP) && !(sts & AST2600_I2CS_SLAVE_PENDING))
> +		WRITE_ONCE(i2c_bus->target_active, false);
> +}

[Severity: High]
Is this condition too strict?

For standard target write transactions, the hardware explicitly combines
AST2600_I2CS_STOP and AST2600_I2CS_SLAVE_PENDING in the same interrupt even=
t.

If this evaluates to false in those normal cases, target_active would
remain permanently true, locking out all subsequent controller mode
transfers with -EBUSY.

> @@ -682,6 +954,21 @@ static int ast2600_i2c_controller_xfer(struct i2c_ad=
apter *adap, struct i2c_msg
>  			return ret;
>  	}
> =20
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +	if (READ_ONCE(i2c_bus->target_active))
> +		return -EBUSY;
> +	/*
> +	 * Controller and target share the same buffer register. A target
> +	 * transaction can update buffer state asynchronously via IRQ, so block
> +	 * controller transfers while target is active to avoid buffer corrupti=
on.
> +	 */
> +	writel(0, i2c_bus->reg_base + AST2600_I2CS_IER);
> +	if (readl(i2c_bus->reg_base + AST2600_I2CS_ISR) || READ_ONCE(i2c_bus->t=
arget_active)) {
> +		writel(AST2600_I2CS_PKT_DONE, i2c_bus->reg_base + AST2600_I2CS_IER);
> +		return -EBUSY;
> +	}
> +#endif

[Severity: High]
If AST2600_I2CS_INACTIVE_TO is left uncleared in the target interrupt handl=
er,
will this check permanently return -EBUSY for all subsequent controller
transfers?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260611-upstream_i=
2c-v32-0-b66eba921d01@aspeedtech.com?part=3D5
