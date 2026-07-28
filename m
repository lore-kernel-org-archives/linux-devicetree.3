Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9681A3F0ABE
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 09:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785231721; cv=none; b=V4Fier9xZca5hwjkPSZIpz8E3Y5DZVRaEkDNwCXfaamElaEQEBHduLYgwvf+Klmgu/r/aaHHRjS/Ob/tEQP3GqQ13d+M1DozqsKzfhtE5uBPuMNHLxE/bq3ivYdxWm4133J2XfO8Q8DZBHUigj1UgPZNjhsXuGoHcMa+x+Njdyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785231721; c=relaxed/simple;
	bh=+6QlufWOKVHuphqolP0BEuZGH7XLPkLPXXZ4N4TUVoU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Li5lPuwE55L5xMjFZZetJAHbzrapoTRNb8+o/aSyu3tSuwG8Lu7IgsH+jB6AAdiiOfo1uiXCOzhJUlqF3RNjpLX+r2LOrPAfGD8Aq7G8xzbqkxb6lkzq0YEUnKVXGIQjv8U1OJO4tgAXKHeZmM1OGdzqEbiqeQN1cEwOVz5Q4kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DDLTpy7t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DDLTpy7t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A25801F000E9;
	Tue, 28 Jul 2026 09:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785231720;
	bh=YtYWYlPP8G8MA8pdikfmkwfgsuyNy5YpMRRdmxQ8fyA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DDLTpy7t51RQg9X3BPeydux0+62ZvSPTOOkdTVQyAp19fpT9ilnqTBtsBfN6QyOaK
	 vcRMzGug+pKQPEk7rn/p+AUSQoIhiL+c8DRdpeoluQjCgjM3We8DsuqYVCm1bnXkpF
	 8efza9gaENKr5VbK+LxcU5BeJ3d5WHMXJZbwcu3+8x8RaClgqy6/EGUi45qCdMNKLL
	 H+MSiEBsFvFLd5l7HN5E+MV382Udsr6WnH5RIrhTHTPk2vsVeNBCpLQJV4tpOHab1t
	 mbagy9dBwWIvdm69e7V9unrkratKOchFTebpitPYl8c9CbWb8516m2jAulEaVk6sFd
	 IbgbatlLj3KfA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/7] spmi: apple: check transaction status
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Finkelstein" <k@chaosmail.tech>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260728-t603x-spmi-v2-3-f43e5f10e583@chaosmail.tech>
References: <20260728-t603x-spmi-v2-0-f43e5f10e583@chaosmail.tech>
 <20260728-t603x-spmi-v2-3-f43e5f10e583@chaosmail.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 09:41:58 +0000
Message-Id: <20260728094159.A25801F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing synchronization (lock) around SPMI register accesses leads=
 to hardware register corruption.
- [High] The driver does not flush the RX FIFO before initiating a new comm=
and, making it highly vulnerable to stream desynchronization.
--

--- Patch [3]: [PATCH v2 3/7] spmi: apple: check transaction status ---
commit 9becb223fa5ce2e2f70eb92ec4088e2171b28c87
Author: Alba Mendez <me@alba.sh>

spmi: apple: check transaction status

This commit adds checks for parity errors and missing command ACKs in the
Apple SPMI controller driver. It reads the reply status from the SPMI
response register and returns an error if the transaction fails.

> diff --git a/drivers/spmi/spmi-apple-controller.c b/drivers/spmi/spmi-app=
le-controller.c
> index b4f442d0b4ad7..4678a9e5270aa 100644
> --- a/drivers/spmi/spmi-apple-controller.c
> +++ b/drivers/spmi/spmi-apple-controller.c
[ ... ]
> @@ -62,7 +68,7 @@ static int spmi_read_cmd(struct spmi_controller *ctrl, =
u8 opc, u8 sid,
>  {
>  	struct apple_spmi *spmi =3D spmi_controller_get_drvdata(ctrl);
>  	u32 spmi_cmd =3D apple_spmi_pack_cmd(opc, sid, saddr, len);

[Severity: High]
This isn't a bug introduced by this patch, but since we are modifying
spmi_read_cmd(), is there a missing lock around the SPMI register accesses?

When the SPMI command is written to the hardware register via
writel(spmi_cmd, spmi->regs + SPMI_CMD_REG), concurrent SPMI transactions
from different client drivers (like regulators or RTCs) could interleave
their command writes and FIFO reads. Since the SPMI core does not serialize
these callbacks, shouldn't the controller driver implement its own locking
to prevent overwriting SPMI_CMD_REG before a transaction completes?

[Severity: High]
This is also a pre-existing issue, but does the driver need to flush the
RX FIFO before initiating a new command?

When a new command is issued via writel(spmi_cmd, spmi->regs + SPMI_CMD_REG=
),
if a previous transaction timed out or a slave responded with excess data,
leftover bytes might remain in the RX FIFO. Won't a subsequent transaction
inadvertently read this stale data instead of its own response, potentially
returning corrupted values to client drivers?

> -	u32 rsp;
> +	u32 reply, rsp;
>  	size_t len_read =3D 0;
>  	u8 i;
>  	int ret;

[ ... ]

> @@ -101,6 +110,7 @@ static int spmi_write_cmd(struct spmi_controller *ctr=
l, u8 opc, u8 sid,
>  {
>  	struct apple_spmi *spmi =3D spmi_controller_get_drvdata(ctrl);
>  	u32 spmi_cmd =3D apple_spmi_pack_cmd(opc, sid, saddr, len);

[Severity: High]
This is a pre-existing issue, but similar to spmi_read_cmd(), are we
missing a lock around the hardware register accesses in spmi_write_cmd()?

Write operations also access the shared hardware controller without
synchronization when writing to SPMI_CMD_REG, exposing it to concurrent
overwrites.

[Severity: High]
This is a pre-existing issue, but does spmi_write_cmd() also need to
ensure the RX FIFO is drained of stale data before writing a new command?

Write commands similarly fail to flush the RX FIFO prior to execution,
making them vulnerable to stream desynchronization if earlier commands
timed out.

> +	u32 reply;
>  	size_t i =3D 0, j;
>  	int ret;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728-t603x-spmi=
-v2-0-f43e5f10e583@chaosmail.tech?part=3D3
