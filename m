Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606EE48988B
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 10:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785925286; cv=none; b=l8AOVSxdrwWBbTPtWnt7SF9239PT/FHcpoA9GXN8Z6HJ3C1pe2L12krOVMc2QM3V/iRt6A9/b/OPzaQBguVBOFOKL+ADj+TLy0P5lMAyTuog5FhI8OeVTNb5bZzT+42LlsxZ7OkC5kUaZ7OajMVfqnlMrrwd0RXFfqYdG23Y1NU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785925286; c=relaxed/simple;
	bh=nIGRSqpr3mRv7+lGex/dcKVFAmJtKHkoFKJ80vurhqM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dgRzOW7S5NWUTM2vj76K58rT92creSYXTJJ20XTSW2AovzUcBRe9PT/V15U00Xd2pOV0DHe7Ue89fmjWtQhPMcBEvjif8NUp1KIq760kDpWk4Lwjf/7Ou5OA6mJ0Q1XrjvUTowAx+65LrWHRKAbQ/XsiavHx+eRy07N8isqnjbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PsqFHifC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PsqFHifC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D21EB1F000E9;
	Wed,  5 Aug 2026 10:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785925285;
	bh=ahUg827rl433Pa0w7DQNSXqw9DD98c/dZsbybHYMKIQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PsqFHifCcOBi3Y93nzRqDIIXrqkbIofQA0gimeiYPEmiYQoSzvnDWT3wOqvlUEInh
	 sPed7FofNmfWE+DHOgHR3E85cxMezydTQIvFZFpftwx8HqKP4L0p8HVWq3vJ/AKBio
	 czcraayB3vvUqZ0a8PynhqYnDmQ7fMVY/7ikJzOSp3vOmvvxPuEjMqrzum0rwyjvxt
	 W1ryNxHDgShRGU6mX/uVsjaOs1jDY7+eprlzNLDclCuiQCE1QwlnoXZb/lyGKXH3+T
	 ObWNcOIFna7lEU6R+8Z8p2H1AqdBz3bXx8kaElyfblOMY1+LnAeIuA1UTkk99/6k29
	 PtRTg2z7y56kA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/6] spmi: apple: Validate FIFO state
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Finkelstein" <k@chaosmail.tech>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260805-t603x-spmi-v4-2-c15a12d9a7d1@chaosmail.tech>
References: <20260805-t603x-spmi-v4-0-c15a12d9a7d1@chaosmail.tech>
 <20260805-t603x-spmi-v4-2-c15a12d9a7d1@chaosmail.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 10:21:24 +0000
Message-Id: <20260805102124.D21EB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] The FIFO flush command is written to the wrong register (`SPMI_RSP=
_REG` instead of `SPMI_ACT_REG`).
- [High] Missing `spmi->prev_fail =3D true` assignment when aborting due to=
 an empty RX FIFO.

Pre-existing issues:
- [High] Bus transactions are not serialized, leading to potential race con=
ditions on the FIFO and controller registers.
--

--- Patch [2]: [PATCH v4 2/6] spmi: apple: Validate FIFO state ---
commit 22dd698ab8c4900ee8f167f7c5d03df7bd152f3b
Author: Alba Mendez <me@alba.sh>

spmi: apple: Validate FIFO state

Check for data before reading the body of a reply, and check for
end of data afterwards.

> diff --git a/drivers/spmi/spmi-apple-controller.c b/drivers/spmi/spmi-app=
le-controller.c
> index 376cf682c43e0..4d5356bf9bbf1 100644
> --- a/drivers/spmi/spmi-apple-controller.c
> +++ b/drivers/spmi/spmi-apple-controller.c
[ ... ]
> @@ -67,6 +71,11 @@ static int spmi_read_cmd(struct spmi_controller *ctrl,=
 u8 opc, u8 sid,

[Severity: High]
This is a pre-existing issue, but since spmi_read_cmd() lacks a mutex or=20
spinlock, what prevents concurrent calls from different client drivers=20
(like regulators or RTC) from interleaving?

Without serialization, concurrent accesses to the controller registers coul=
d=20
corrupt the state or wedge the controller. This pre-existing issue also=20
affects the newly added prev_fail flag, which could be overwritten or=20
misread during interleaved bus operations.

>  	u8 i;
>  	int ret;
> =20
> +	if (spmi->prev_fail) {
> +		writel(SPMI_ACT_FIFO_FLUSH, spmi->regs + SPMI_RSP_REG);

[Severity: High]
Is it intended to write SPMI_ACT_FIFO_FLUSH to SPMI_RSP_REG?=20

It looks like this might have meant to write to the newly defined=20
SPMI_ACT_REG instead. Writing an action command to the response register=20
could leave the FIFO unflushed and leave the controller permanently wedged=
=20
after an error.

> +		spmi->prev_fail =3D false;
> +	}
> +
>  	writel(spmi_cmd, spmi->regs + SPMI_CMD_REG);
> =20
>  	ret =3D apple_spmi_wait_rx_not_empty(ctrl);
[ ... ]
> @@ -78,6 +87,11 @@ static int spmi_read_cmd(struct spmi_controller *ctrl,=
 u8 opc, u8 sid,
> =20
>  	/* Read SPMI data reply */
>  	while (len_read < len) {
> +		if (readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY) {
> +			dev_err_ratelimited(&ctrl->dev,
> +					    "FIFO lacks reply data, controller stuck?\n");
> +			return -EIO;

[Severity: High]
When the loop aborts here due to an empty RX FIFO, shouldn't spmi->prev_fai=
l=20
be set to true before returning?

If the hardware response is slow and causes an early exit without setting=20
this flag, the next transaction will not flush the delayed reply. Could thi=
s=20
cause the subsequent transaction to read stale reply data as its own, leadi=
ng=20
to silent data corruption for downstream PMIC clients?

> +		}
>  		rsp =3D readl(spmi->regs + SPMI_RSP_REG);
>  		i =3D 0;
>  		while ((len_read < len) && (i < 4)) {
[ ... ]
> @@ -97,6 +116,11 @@ static int spmi_write_cmd(struct spmi_controller *ctr=
l, u8 opc, u8 sid,

[Severity: High]
This is a pre-existing issue, but similar to spmi_read_cmd(), the=20
spmi_write_cmd() function also lacks synchronization, leaving it vulnerable=
 to=20
concurrent accesses from different SPMI bus clients.

>  	size_t i =3D 0, j;
>  	int ret;
> =20
> +	if (spmi->prev_fail) {
> +		writel(SPMI_ACT_FIFO_FLUSH, spmi->regs + SPMI_RSP_REG);

[Severity: High]
Does this also need to be written to SPMI_ACT_REG instead of SPMI_RSP_REG?

> +		spmi->prev_fail =3D false;
> +	}
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805-t603x-spmi=
-v4-0-c15a12d9a7d1@chaosmail.tech?part=3D2
