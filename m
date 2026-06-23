Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64400379C2F
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 01:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782178104; cv=none; b=fI6KD40qyLjD8hxVh12DxdvMRvvAmWBe0PZxHg2yCVh2n61fOLf0VeqQK7bKddMVFKn3KI72glYWiGOvF2sP2Be/Jk0Lyv4br/MGmB75YytS5iKVu/m0BcWgUo0B2SUj1051HGobIUqtJ3T1ckJJuf9/FOaq8v4M6IVFSLHNRBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782178104; c=relaxed/simple;
	bh=0c000SH38SEwiT+Ioc5hEE58uKs1vcjeBaRYpwN1jeg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KpNof9dXNvpgLeDu4F0P7HZtM5pn1l/stM6I9F5Z54Pwfxi3EL+V0pFdJZugPppapt2BnNiAs330XiH8T0SlGvSejQ0R+gPWyHbzdE8INFsNMgbWxBdlpFxm92dekTSxVsR8mhJ9uMDl5BdgJJUFZnAW/Qie/ZcWEAcqVDUQJUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=okocWRY6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="okocWRY6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6AC01F00A3E;
	Tue, 23 Jun 2026 01:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782178103;
	bh=EOtJPx+I7g3+TlmBTj/4QkFl4UswXqJVX7pS5IwWP/Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=okocWRY6AsZIlsKjBj5PiKZoHkPdwxeTJylDp2ppZNkNWulkZ1ndJp1wjNJrYesvX
	 BLb9jvk8LOvzmW5rzXT7qB1kzSFwroSUufuf/TpH2YIwGThBGoUo1Y+pto6J55vIOI
	 sQ9cXlj9MeJM0pg81Wf2SF/XCO1X+L1J7ikb/PyjqtkaJ1dF8gLsn00XmBm8lkQDER
	 W8I4TBjCMsoQ29QLYSh4/Ti77Bhj/8f6ygbwSW3Ex7DKbSWWNlb6EjQTZPFOkKGVrS
	 oEDhg7f/XdXrGo0CBd2uzzreKqihZAbX+UDDTsajQW2lSeKpAXDBf/TEUIesJ61QRu
	 YyNUrRgLkzOhA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v33 5/5] i2c: ast2600: Add target mode support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ryan Chen" <ryan_chen@aspeedtech.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260623-upstream_i2c-v33-5-6d5338fc56ed@aspeedtech.com>
References: <20260623-upstream_i2c-v33-0-6d5338fc56ed@aspeedtech.com>
 <20260623-upstream_i2c-v33-5-6d5338fc56ed@aspeedtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 23 Jun 2026 01:28:22 +0000
Message-Id: <20260623012822.B6AC01F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Coalesced STOP and SLAVE_MATCH interrupts incorrectly pass the pre=
vious transaction's buffered RX bytes to the new transaction.
- [High] Unconditional enablement of target interrupts and unmasked checks =
of I2CS_ISR in `ast2600_i2c_controller_xfer()` causes unhandled IRQ storms =
and permanent -EBUSY deadlocks when no slave is registered.
--

commit 12f36e43a7bec16d6ebecb3d928d5bb09f47373e
Author: Ryan Chen <ryan_chen@aspeedtech.com>
Subject: i2c: ast2600: Add target mode support

This commit adds target mode support to the AST2600 I2C driver.
Features include target interrupt handling, address match, and response log=
ic.
This complements the existing controller-mode support to enable dual-role
capability.

> diff --git a/drivers/i2c/busses/i2c-ast2600.c b/drivers/i2c/busses/i2c-as=
t2600.c
> --- a/drivers/i2c/busses/i2c-ast2600.c
> +++ b/drivers/i2c/busses/i2c-ast2600.c

[ ... ]

> @@ -348,6 +353,253 @@ static int ast2600_i2c_recover_bus(struct ast2600_i=
2c_bus *i2c_bus)
> +	case AST2600_I2CS_SLAVE_PENDING | AST2600_I2CS_STOP |
> +	     AST2600_I2CS_TX_NAK | AST2600_I2CS_SLAVE_MATCH | AST2600_I2CS_RX_D=
ONE:
> +	case AST2600_I2CS_SLAVE_PENDING | AST2600_I2CS_WAIT_RX_DMA | AST2600_I2=
CS_STOP |
> +	     AST2600_I2CS_TX_NAK | AST2600_I2CS_SLAVE_MATCH | AST2600_I2CS_RX_D=
ONE:
> +		i2c_slave_event(i2c_bus->target, I2C_SLAVE_STOP, &value);
> +		i2c_slave_event(i2c_bus->target, I2C_SLAVE_WRITE_REQUESTED, &value);
> +		target_rx_len =3D AST2600_I2CC_GET_RX_BUF_LEN(readl(i2c_bus->reg_base +
> +						       AST2600_I2CC_BUFF_CTRL));
> +		for (i =3D 0; i < target_rx_len; i++) {
> +			value =3D readb(i2c_bus->buf_base + i2c_bus->buf_size + i);
> +			i2c_slave_event(i2c_bus->target, I2C_SLAVE_WRITE_RECEIVED, &value);
> +		}

[Severity: High]
Does this incorrectly pass the previous transaction's buffered RX bytes to =
the
new transaction?

The handler in ast2600_i2c_target_packet_buff_irq() emits I2C_SLAVE_STOP and
I2C_SLAVE_WRITE_REQUESTED for the new transaction before delivering the
remaining I2C_SLAVE_WRITE_RECEIVED bytes from the previous transaction.

[ ... ]

> @@ -684,6 +956,21 @@ static int ast2600_i2c_controller_xfer(struct i2c_ad=
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
> +
>  	i2c_bus->cmd_err =3D 0;
>  	i2c_bus->msgs =3D msgs;
>  	i2c_bus->msgs_index =3D 0;
>  	i2c_bus->msgs_count =3D num;
>  	WRITE_ONCE(i2c_bus->stop_pending, false);
>  	reinit_completion(&i2c_bus->cmd_complete);
>  	ret =3D ast2600_i2c_do_start(i2c_bus);
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +	/* avoid race condition target is wait and controller wait 1st target o=
perate */
> +	writel(AST2600_I2CS_PKT_DONE, i2c_bus->reg_base + AST2600_I2CS_IER);
> +#endif

[Severity: High]
Will this logic cause unhandled IRQ storms and permanent -EBUSY deadlocks
when no slave is registered?

When CONFIG_I2C_SLAVE is enabled but no slave is bound (i2c_bus->target is
NULL), ast2600_i2c_controller_xfer() unconditionally writes to I2CS_IER to
re-enable target interrupts. If a target hardware event occurs, it will
trigger an interrupt that ast2600_i2c_bus_irq() ignores, leading to an IRQ
storm.

Additionally, because the interrupt is never handled and I2CS_ISR is never
cleared, subsequent calls to ast2600_i2c_controller_xfer() will see a
non-zero I2CS_ISR and permanently abort with -EBUSY.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260623-upstream_i=
2c-v33-0-6d5338fc56ed@aspeedtech.com?part=3D5
