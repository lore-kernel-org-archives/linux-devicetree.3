Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1B140BCA1
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 10:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785925627; cv=none; b=qrZPXfYVQTm5OlnsairxCXYC/dC3t12h7+6qmCaDJfCNTaxeDSCzoOL4G3cXuafMo9sObbIQ7hmgC27cU54VCAEmxb1D4Fzt3Qm8Bei29Vt5oI/go0Vcw23ok28B/pqobfYDCOT+aemt3cjsLVoWRHWa4/BncntT5LAWco2oG8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785925627; c=relaxed/simple;
	bh=vRd2I2uGtBgjymNGQ2R2Hv86hP3gW93Kc3YRsQ/rL0c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YfRE8BsuXvNQkpayUHOrPKNVF5x0D7LGhbeEZGCNG34dMhrA5vxuE98aksvlr5gm/kOrdSPuu7/I/FrCY0fRmrdkaOoqctYJ4QPngSbthlkn940PCJNeqcI/fwTppecVhl/RybG9Fsf6niR7QqNxdqKl+/4JbbRr1zVgcTZpXzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OhC1s7EY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OhC1s7EY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6AE51F00A3D;
	Wed,  5 Aug 2026 10:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785925626;
	bh=l15kFdhgmVs6Zhvq2AcfgZXFMhbqRV0SJvIUbq7p6NM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OhC1s7EYtzr6HiOOh1QXiWML92GkH95IdHXne3f8FpIepZa7YlgeSDDFzXWzjcu4X
	 xM5+l9QovE3v1GqdW2OIppdkKT+EM0l4S9uOTXNUx3Vs4etoPhIB3o2A/S+06GSbcl
	 vO/X+Uwhv96Tf3mEFRKGgiVKzTgbiNvPJMnR9bFzbEz2KV05ODivpq2WtATEKrpaxE
	 BDxJw6b2YSsKZvxeCnOTDNWyGyCne262eXc5xF6qTt2vHzBKk2rTgZLDg/Za+4PJt0
	 PvCUpmCJdJNdV1FScmKpGpGzbPf5RxGrV3j7rsEQ4nZ45JHadJMJZcZC+69oH+w6QG
	 A0Fl47OypXWzQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/6] spmi: apple: check transaction status
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Finkelstein" <k@chaosmail.tech>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260805-t603x-spmi-v4-3-c15a12d9a7d1@chaosmail.tech>
References: <20260805-t603x-spmi-v4-0-c15a12d9a7d1@chaosmail.tech>
 <20260805-t603x-spmi-v4-3-c15a12d9a7d1@chaosmail.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 10:27:04 +0000
Message-Id: <20260805102705.D6AE51F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing synchronization in SPMI controller read/write callbacks al=
lows concurrent bus transactions to corrupt controller registers and shared=
 state.
- [High] The error recovery logic writes the FIFO flush command to the read=
-only response register instead of the action register.
- [High] Multiple signed integer overflows due to unsafe bitwise shifts res=
ult in undefined behavior.
--

--- Patch [3]: [PATCH v4 3/6] spmi: apple: check transaction status ---
commit 879bd117b98da2cbe05de1381fdc2003dc4e22ae
Author: Alba Mendez <me@alba.sh>

spmi: apple: check transaction status

This patch updates the Apple SPMI controller driver to check for parity err=
ors
and missing command acknowledgments during transactions. By verifying the p=
arity
status and ACK bits in the reply frame, the driver can now detect and report
transaction failures instead of silently ignoring them.

Signed-off-by: Alba Mendez <me@alba.sh>
Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>

> diff --git a/drivers/spmi/spmi-apple-controller.c b/drivers/spmi/spmi-app=
le-controller.c
> index 4d5356bf9bbf1..7ebf899edf173 100644
> --- a/drivers/spmi/spmi-apple-controller.c
> +++ b/drivers/spmi/spmi-apple-controller.c

[ ... ]

> @@ -66,7 +74,7 @@ static int spmi_read_cmd(struct spmi_controller *ctrl, =
u8 opc, u8 sid,
>  {
>  	struct apple_spmi *spmi =3D spmi_controller_get_drvdata(ctrl);

[Severity: High]
This isn't a bug introduced by this patch, but does the lack of a lock here
allow concurrent bus transactions to corrupt controller registers and shared
state?

The SPMI framework does not serialize read_cmd and write_cmd controller
callbacks. Multiple PMIC device drivers on the same SPMI bus could initiate
transactions concurrently.

Without a spinlock or mutex, wouldn't concurrent accesses interleave writes
to SPMI_CMD_REG and cause race conditions when handling the shared
spmi->prev_fail state?

>  	u32 spmi_cmd =3D apple_spmi_pack_cmd(opc, sid, saddr, len);

[Severity: High]
This is a pre-existing issue, but do multiple bitwise shifts in this driver
invoke undefined behavior via signed integer overflow?

In apple_spmi_pack_cmd(), when packing the command:

return opc | sid << 8 | saddr << 16 | (len - 1) | (1 << 15);

If saddr is >=3D 0x8000, it gets promoted to a signed int and shifted by 16,
which overflows into the sign bit.

Similarly, in spmi_write_cmd() where buf[i++] is shifted by 24 (when >=3D 1=
28),
and in spmi_read_cmd() where 0xff is shifted by 24, these shift signed ints
into the sign bit.

Could this allow the compiler to miscompile the addressing and data unpacki=
ng
logic?

> -	u32 rsp;
> +	u32 reply, rsp;
>  	size_t len_read =3D 0;
>  	u8 i;

[ ... ]

> @@ -82,12 +90,12 @@ static int spmi_read_cmd(struct spmi_controller *ctrl=
, u8 opc, u8 sid,
>  	if (ret)
>  		return ret;
> =20
> -	/* Discard SPMI reply status */
> -	readl(spmi->regs + SPMI_RSP_REG);
> +	reply =3D readl(spmi->regs + SPMI_RSP_REG);
> =20
>  	/* Read SPMI data reply */
>  	while (len_read < len) {
>  		if (readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY) {
> +			spmi->prev_fail =3D true;

[Severity: High]
This isn't a bug introduced by this patch, but since we are actively setting
spmi->prev_fail to true here, does the error recovery logic write the FIFO
flush command to the wrong register?

When recovering from a previous failure, the driver does:

writel(SPMI_ACT_FIFO_FLUSH, spmi->regs + SPMI_RSP_REG);

SPMI_RSP_REG is a read-only response register. Shouldn't this flush command
be written to the action register (SPMI_ACT_REG) instead? Otherwise, the
FIFO might never be flushed, leading to a permanently stuck controller stat=
e.

>  			dev_err_ratelimited(&ctrl->dev,
>  					    "FIFO lacks reply data, controller stuck?\n");
>  			return -EIO;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805-t603x-spmi=
-v4-0-c15a12d9a7d1@chaosmail.tech?part=3D3
