Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA1E41BA83
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 09:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785231969; cv=none; b=RlQJ+zeDzP+fj2yWKCdajWKpbu+IMwVhzJkDD0j26KxsPDzsAAB0Zvi0lrR3rO5Q4ldEDm0ZAnYKG1P8xtrqj7ChAsSltMmBUbt79FqomMhqHEdAKAnBL7wbNlEtMRO211JfOUUkCrwK8/fayY15K5nmqKDYupZ8fEdJ2lCNOGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785231969; c=relaxed/simple;
	bh=I7ntqt15CGHyCf1xzIzWaAk4PAtpJuK2cMRdZqRAqqA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iu1PJT5f7UE4zDoCLA9gJqWhzH8wDJjhWDeXlGvH8IoVWa4QxUa13valdOdX8s1kbV9RpzcQ117ve82h6dXpmtlx6Mk9nVnDU5FBQrEa1cjmtwwVLRyXnlPGNQNzpv/sL/hrv0PCidac+IY00n0nM2Ygom4T9tICkZcDIC1NkEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QxoYiDTo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QxoYiDTo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 141E41F000E9;
	Tue, 28 Jul 2026 09:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785231967;
	bh=OQxlEkifHsd21a44iruvpPKQXK7gcc/txF+26H4rPKA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QxoYiDToaLVHjtQe7IXrloH7r3YBfDcPgd/u9ahaUafmy+UMbTv6fORadx2EnutS7
	 iINHJVM2ul/FOOxMPqjnEAVkYx9kUQ0+tESKAnI5sNHiIynNb1la2ZueQjLdFD8wct
	 vRDTrlzRPTnK85eRdH2R8v5TNgWzKAoByIbPDoS4GxazaAajJWon/TOPUdFNPHb+tR
	 8HyvY63oadmUui8BtbnPrXTi9xRS+16ENjRS5Gj8FfVuwD2dX0RfyVnVOoS6bb0yy/
	 7SRkZjN5zHZwK5XVUtMogjP/N3QWNyWOzyJzfKIzNWtXqqY3LRXQm2RtB2ZR8frvZc
	 hzZi8143pLr7w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/7] spmi: apple: Implement remaining commands
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Finkelstein" <k@chaosmail.tech>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260728-t603x-spmi-v2-4-f43e5f10e583@chaosmail.tech>
References: <20260728-t603x-spmi-v2-0-f43e5f10e583@chaosmail.tech>
 <20260728-t603x-spmi-v2-4-f43e5f10e583@chaosmail.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 09:46:06 +0000
Message-Id: <20260728094607.141E41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] Missing bounds validation allows unmasked data in SPMI_CMD_ZERO_WR=
ITE to corrupt the command opcode.
- [Medium] Missing NACK check on read commands triggers a false 'controller=
 stuck' error and incorrect error handling.

Pre-existing issues:
- [High] Missing locking around shared hardware FIFO registers causes race =
conditions and bus state corruption.
- [High] Unhandled residual data in the RX FIFO leads to permanent transact=
ion desynchronization.
--

--- Patch [4]: [PATCH v2 4/7] spmi: apple: Implement remaining commands ---
commit aad16a3367909482f17e1e9e1da0123341931c90
Author: Alba Mendez <me@alba.sh>
spmi: apple: Implement remaining commands

This commit adds support for zero write and power management commands to the
Apple SPMI driver. It restructures the internal command functions to handle
raw inputs and acknowledgements.

> diff --git a/drivers/spmi/spmi-apple-controller.c b/drivers/spmi/spmi-app=
le-controller.c
> --- a/drivers/spmi/spmi-apple-controller.c
> +++ b/drivers/spmi/spmi-apple-controller.c

[ ... ]

> -static int spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
> -			 u16 saddr, u8 *buf, size_t len)
> +static int spmi_raw_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
> +			 u16 param, const u8 *buf, size_t len, u8 *ibuf, size_t ilen)
>  {
>  	struct apple_spmi *spmi =3D spmi_controller_get_drvdata(ctrl);
> -	u32 spmi_cmd =3D apple_spmi_pack_cmd(opc, sid, saddr, len);
> +	u32 spmi_cmd =3D apple_spmi_pack_cmd(opc, sid, param);
>  	u32 reply, rsp;
>  	size_t len_read =3D 0;
> -	u8 i;
> +	size_t i =3D 0, j;
>  	int ret;
> =20
>  	writel(spmi_cmd, spmi->regs + SPMI_CMD_REG);

[Severity: High]
This is a pre-existing issue, but does spmi_raw_cmd() need locking to seria=
lize
access to the shared hardware FIFO registers? Since the SPMI framework does
not serialize transactions, if two threads perform concurrent commands, cou=
ld
their reads and writes to SPMI_CMD_REG and SPMI_RSP_REG interleave, resulti=
ng
in hardware FIFO corruption or reading another transaction's response?

> +
> +	while (i < len) {
> +		j =3D 0;
> +		spmi_cmd =3D 0;
> +		while ((j < 4) & (i < len))
> +			spmi_cmd |=3D buf[i++] << (j++ * 8);
> +
> +		writel(spmi_cmd, spmi->regs + SPMI_CMD_REG);
> +	}
> +
>  	ret =3D apple_spmi_wait_rx_not_empty(ctrl);
>  	if (ret)
>  		return ret;
> @@ -82,15 +91,15 @@ static int spmi_read_cmd(struct spmi_controller *ctrl=
, u8 opc, u8 sid,
>  	reply =3D readl(spmi->regs + SPMI_RSP_REG);
> =20
>  	/* Read SPMI data reply */
> -	while (len_read < len) {
> +	while (len_read < ilen) {
>  		if (readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY) {
>  			dev_err(&ctrl->dev, "FIFO lacks reply data, controller stuck?\n");
>  			return -EIO;
>  		}

[Severity: Medium]
Will this error path incorrectly trigger for unacknowledged read commands?
Because the NACK check below is restricted to commands with no input payload
(!ilen), if a read command is NACKed (e.g., when probing an empty bus addre=
ss),
it bypasses the NACK check and enters this loop. Could this result in hitti=
ng
the empty FIFO check and raising a misleading "controller stuck?" error ins=
tead
of gracefully handling the normal NACK condition?

>  		rsp =3D readl(spmi->regs + SPMI_RSP_REG);
>  		i =3D 0;
> -		while ((len_read < len) && (i < 4)) {
> -			buf[len_read++] =3D ((0xff << (8 * i)) & rsp) >> (8 * i);
> +		while ((len_read < ilen) && (i < 4)) {
> +			ibuf[len_read++] =3D ((0xffU << (8 * i)) & rsp) >> (8 * i);
>  			i +=3D 1;
>  		}
>  	}
> @@ -98,47 +107,67 @@ static int spmi_read_cmd(struct spmi_controller *ctr=
l, u8 opc, u8 sid,
>  	if (!(readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY))
>  		dev_warn(&ctrl->dev, "FIFO has extra data\n");

[Severity: High]
This is a pre-existing issue, but does the RX FIFO need to be drained when
residual data is detected? If the PMIC pushes more frames than expected or =
the
transaction returns early, leaving this extra data could cause subsequent
transactions to read the stale residual words, permanently desynchronizing =
the
bus.

> -	if ((~reply >> SPMI_REPLY_FRAME_PARITY_OFFSET) & ((1 << len) - 1)) {
> +	if (!ilen && !(reply & SPMI_REPLY_ACK)) {
> +		dev_err(&ctrl->dev, "command not acknowledged\n");
> +		return -EIO;
> +	}

[ ... ]

> +static int spmi_write_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
> +			  u16 saddr, const u8 *buf, size_t len)
> +{
> +	switch (opc) {
> +	case SPMI_CMD_WRITE:
> +		return spmi_raw_cmd_ack(ctrl, opc | saddr, sid, buf[0] << 8 | saddr, N=
ULL, 0);
> +	case SPMI_CMD_ZERO_WRITE:
> +		return spmi_raw_cmd_ack(ctrl, opc | buf[0], sid, buf[0] << 8 | saddr, =
NULL, 0);

[Severity: High]
Does this code allow unmasked user data to corrupt the command opcode? If a
caller provides a data payload for SPMI_CMD_ZERO_WRITE where bits 4-7 are s=
et,
bitwise ORing it directly with the opcode (opc | buf[0]) without masking
(e.g., buf[0] & 0x0F) could overwrite the upper opcode bits, potentially
executing unintended commands on the PMIC.

> +	case SPMI_CMD_EXT_WRITE:
> +	case SPMI_CMD_EXT_WRITEL:
> +		return spmi_raw_cmd_ack(ctrl, opc | (len - 1), sid, saddr, buf, len);
>  	}
> -	return 0;
> +	return -EINVAL;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728-t603x-spmi=
-v2-0-f43e5f10e583@chaosmail.tech?part=3D4
