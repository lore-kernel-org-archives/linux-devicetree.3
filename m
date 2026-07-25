Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F8D2D949C
	for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 14:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784988125; cv=none; b=pw+PpwoqpfcLWDGh9i5u6LGSbHMn8Ybsxkbx1ez60ZcyJK3Feoh1t830CosrdG3a8keMBLS1TTLTX/V1T0ri2R3XCTDUUvn0a+bfNE2BXbpPI8+41RYWtJr0zIK6nRWW/rsUN2+mjnbJNZsGEXtueMstNGdhLbLTQlgn+X3nezk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784988125; c=relaxed/simple;
	bh=0Y47VPOoPU3rnqqteaPUXae6nIrM5tpxzsBeCRe8quE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CBBh2h+4H68coeGVcRq9PamvccdclUaaiSU3kztuQzlq/u6QeKuCG1b9fjsG34pcFmoE7rHf/B5lmqDURy3XcZzfCQnZfA9J6M04GIHBwWdi4kFAdik1vtLsybb1kvtxDd95hNiPkRyBXUbkt5ew9CIBkmSijryUyGZ20DL1VRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CjS9Q9K+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CjS9Q9K+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4FDF1F00AC4;
	Sat, 25 Jul 2026 14:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784988124;
	bh=vCrIlQXP09kmuHhL8TLozOh0OWdew95hK2Dv6YDc4q0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CjS9Q9K+q+rrC3yITCiEGQphuMIfRyWz5wncdjZeoMG46skYo4zgQESonNNLE1AZz
	 ljLTtg2gGzpNXOdPmh/9eGXY8DFE2FGUXX4VJOM93j+afnXDDdR7otzTBUp99MJqz6
	 FIBHeFjCfyvC4P7ZfRTlRzwGTylWf7d25hX9w4dE66QX6FCCcGsfEks/PFt5dBM6yg
	 Z4pXJNFQ6xYtlOCWq9NS7+KxMG33N7UooFSTZuHhhixQPZWSx+jqb2q+A4CKS41avT
	 k6TL7ovsf0A1ZGxOc8l7wimt2L9mbtbc505AX4n5t335Z4urGZxGAAUYaz3YZYLMBO
	 fDhETo9vRhxwA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/7] spmi: apple: check transaction status
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Finkelstein" <k@chaosmail.tech>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260725-t603x-spmi-v1-3-e1a29fcd2d38@chaosmail.tech>
References: <20260725-t603x-spmi-v1-0-e1a29fcd2d38@chaosmail.tech>
 <20260725-t603x-spmi-v1-3-e1a29fcd2d38@chaosmail.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 25 Jul 2026 14:02:03 +0000
Message-Id: <20260725140203.C4FDF1F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing serialization locks for SPMI transactions leads to hardwar=
e state corruption.
- [High] Missing RX FIFO flush on timeouts and extra data permanently corru=
pts bus state.
--

--- Patch [3]: [PATCH 3/7] spmi: apple: check transaction status ---
commit acc23a1dd1c948ebf37045f3db6e344612bde6a3
Author: Alba Mendez <me@alba.sh>

spmi: apple: check transaction status

This commit adds parity error checks and command acknowledgement checks for
SPMI read and write transactions. It ensures the reply frame is read instead
of being discarded to properly evaluate the transaction status.

> diff --git a/drivers/spmi/spmi-apple-controller.c b/drivers/spmi/spmi-app=
le-controller.c
> index b4f442d0b4ad7..4678a9e5270aa 100644
> --- a/drivers/spmi/spmi-apple-controller.c
> +++ b/drivers/spmi/spmi-apple-controller.c

[ ... ]

> @@ -73,8 +79,7 @@ static int spmi_read_cmd(struct spmi_controller *ctrl, =
u8 opc, u8 sid,
>  	if (ret)
>  		return ret;

[Severity: High]
This isn't a bug introduced by this patch, but does this function need a
serialization lock for the full multi-step transaction?

The SPMI core subsystem does not serialize read_cmd and write_cmd callbacks,
leaving locking to the controller driver. If multiple threads concurrently
issue SPMI reads or writes via independent client drivers on the same bus,
could their sequences of writing to SPMI_CMD_REG and reading SPMI_RSP_REG
interleave, resulting in hardware state corruption?

Additionally, as another pre-existing issue, if a call to
apple_spmi_wait_rx_not_empty() times out due to a delayed hardware response,
the driver returns an error but doesn't appear to reset the controller or
flush the late response.

If a late response eventually fills the RX FIFO, will the next command's wa=
it
for RX FIFO incorrectly succeed and consume the stale data as its own reply,
corrupting the bus state?

> =20
> -	/* Discard SPMI reply status */
> -	readl(spmi->regs + SPMI_RSP_REG);
> +	reply =3D readl(spmi->regs + SPMI_RSP_REG);
> =20
>  	/* Read SPMI data reply */
>  	while (len_read < len) {

[ ... ]

> @@ -93,6 +98,10 @@ static int spmi_read_cmd(struct spmi_controller *ctrl,=
 u8 opc, u8 sid,
>  	if (!(readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY))
>  		dev_warn(&ctrl->dev, "FIFO has extra data\n");

[Severity: High]
This is a pre-existing issue, but if extra data is detected in the FIFO, the
driver logs a warning but doesn't appear to drain the remaining words.

Since stale data is left in the RX FIFO, couldn't this guarantee corruption
of the next transaction on the bus?

> +	if ((~reply >> SPMI_REPLY_FRAME_PARITY_OFFSET) & ((1 << len) - 1)) {
> +		dev_err(&ctrl->dev, "some frames failed parity check\n");
> +		return -EIO;
> +	}
>  	return 0;
>  }

[ ... ]

> @@ -101,6 +110,7 @@ static int spmi_write_cmd(struct spmi_controller *ctr=
l, u8 opc, u8 sid,
>  {
>  	struct apple_spmi *spmi =3D spmi_controller_get_drvdata(ctrl);
>  	u32 spmi_cmd =3D apple_spmi_pack_cmd(opc, sid, saddr, len);
> +	u32 reply;
>  	size_t i =3D 0, j;
>  	int ret;

[Severity: High]
This is a pre-existing issue, but similar to spmi_read_cmd(), does this
function need a serialization lock for its multi-step write sequence?

Since there is no synchronization around the hardware interactions, multiple
un-synchronized writes to the shared SPMI_CMD_REG from concurrent threads
could interleave and destroy the controller's state machine.

> @@ -119,12 +129,15 @@ static int spmi_write_cmd(struct spmi_controller *c=
trl, u8 opc, u8 sid,
>  	if (ret)
>  		return ret;
> =20
> -	/* Discard */
> -	readl(spmi->regs + SPMI_RSP_REG);
> +	reply =3D readl(spmi->regs + SPMI_RSP_REG);
> =20
>  	if (!(readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY))
>  		dev_warn(&ctrl->dev, "FIFO has extra data\n");
> =20
> +	if (!(reply & SPMI_REPLY_ACK)) {
> +		dev_err(&ctrl->dev, "command not acknowledged\n");
> +		return -EIO;
> +	}
>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260725-t603x-spmi=
-v1-0-e1a29fcd2d38@chaosmail.tech?part=3D3
