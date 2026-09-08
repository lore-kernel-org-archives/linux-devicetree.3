Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189EA3290A5
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 10:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788863967; cv=none; b=mWcbEAtzntodXdXbcDCGX/OBn6yrw640iYMtPyqhVQTIJHZi6R6sx5kdFGEUEdoUNvIqTdXJmP8rGrPxmiEcR11CIvy2iRNuqovl9M/i5UiWD2pFYw6v7FXaZZKbu+PANmreUmjjQih6vgxwEEggQxtNRdt1bvTAwvj+BC+ge58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788863967; c=relaxed/simple;
	bh=ZkWIEmMvDRrXW/o2cCknn5H4UIvxHIShHqe06WYRBP8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JgtyX3AATZvIf6a3DRZMnV3+eyYyjIrxb9h5gxtZBvuTZrRGEye5+C4fPcG1wDpOxR1gRrCk88KErYC/zqnPb9X6SZGpVAtuXHpch/ZRRFp6YlYyrLcj44/RMbLZoEXKS4NDioNAxL+bq88Gj7MRYL/F173RSPF10aCA8ZE/jpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FSQejPjY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FSQejPjY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 605631F00A3D;
	Tue,  8 Sep 2026 10:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788863965;
	bh=juJ4DzLhYeERpJWLTP8Alcr7dztbOTBzDRIhbo64Tk8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FSQejPjYrm3krgK95cXnMXshL+F3RaOB3FINbAYIfiFV1+ZdYZmtXKzkRDww43kL4
	 2gUGn3PDsnNX6i2uttpodkV68SqdKdVYn2L+qH5r68OqTgNpvrLd7x0WfuKlwGhmi4
	 npT9zOnf64trIgpXDVaCtO/5RPd3Vy6WIyYp0ERG++OZDtdSvoMyKcdPgMQTo8udW0
	 SlVKtxtjcWS8kyvNaENAr6+WC0c20pOnWWKr8XstkHlC84wsffH379UCHvBGWKoZwY
	 wA+YyYRT3ibaA2bchdFZ8otqCDyvJ3bvGR3uDwTjgWv1EvMa16dJyTaxFVZ/9ZF7qE
	 mzJ1FLvmm3sZQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] i3c: master: dw: Clamp GETMRL/GETMWL to controller FIFO
 limits
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shubham Patil" <shubhamsanjay.patil@amd.com>
Cc: Frank.Li@kernel.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, conor+dt@kernel.org, linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260908102724.3232660-1-shubhamsanjay.patil@amd.com>
References: <20260908102724.3232660-1-shubhamsanjay.patil@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 10:39:24 +0000
Message-Id: <20260908103925.605631F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The commit message contradicts the implementation and inline com=
ments regarding GET buffer updates on a failed SET command.
--

commit 00d2a5b4dfc14cff243cee94eac37b1733ad5a1d
Author: Shubham Patil <shubhamsanjay.patil@amd.com>

i3c: master: dw: Clamp GETMRL/GETMWL to controller FIFO limits
   =20
The DW master rejects private SDR transfers larger than caps.datafifodepth
with -EOPNOTSUPP. Targets often report MRL/MWL values larger than that
FIFO, so the core stores limits the controller cannot meet.

> After a successful GETMRL/GETMWL, issue Direct SETMRL/SETMWL to the
> same target with lengths capped to the data FIFO (in bytes), then
> rewrite the GET payload so the core keeps the same values. Only update
> the GET buffer once SET is acked, so a failed SET does not leave the
> core and the target disagreeing.

[Severity: Medium]
Is this commit message accurate? The implementation correctly updates the G=
ET
buffer regardless of the SET outcome to protect the controller's FIFO, matc=
hing
the inline comments, but this directly violates the claim here that the buf=
fer
is only updated if SET is acked.

> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i=
3c-master.c
> index 4563d8761ba0b..51defcb577619 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
[ ... ]
> @@ -844,6 +850,130 @@ static int dw_i3c_ccc_get(struct dw_i3c_master *mas=
ter, struct i3c_ccc_cmd *ccc)
> +/*
> + * Cap the limits a target reported through GETMRL to what this controll=
er can
> + * actually transfer, so the core never asks for a private read the data=
 FIFO
> + * cannot hold. The optional IBI payload byte is capped to the IBI queue=
 depth
> + * instead; since that byte is a u8, the IBI cap only ever applies to
> + * controllers whose IBI queue is smaller than 255 bytes.
> + *
> + * Direct SETMRL is optional, so a target may implement GETMRL and NACK =
the SET.
> + * Clamp the values handed back to the core either way: a failed SET onl=
y means
> + * the target keeps its own larger limit, which is harmless as long as t=
he core
> + * stays within ours.
> + */
> +static int dw_i3c_master_clamp_mrl(struct dw_i3c_master *master,
> +				   struct i3c_ccc_cmd *ccc)
> +{
[ ... ]
> +	ret =3D dw_i3c_ccc_set(master, &set_cmd);
> +	if (ret)
> +		dev_dbg(&master->base.dev,
> +			"SETMRL not accepted by target: %d\n", ret);
> +
> +	if (clamp_read) {
> +		mrl->read_len =3D cpu_to_be16(max_fifo_bytes);
> +		dev_dbg(&master->base.dev,
> +			"clamped target MRL from %u to %u bytes (FIFO depth limit)\n",
> +			read_len, max_fifo_bytes);
> +	}

[Severity: Medium]
Could this update in dw_i3c_master_clamp_mrl() lead to developer confusion
regarding core state synchronization? It updates the MRL buffer uncondition=
ally
after a potentially failed SET command, contrary to the commit message.

[ ... ]
> +static int dw_i3c_master_clamp_mwl(struct dw_i3c_master *master,
> +				   struct i3c_ccc_cmd *ccc)
> +{
[ ... ]
> +	ret =3D dw_i3c_ccc_set(master, &set_cmd);
> +	if (ret)
> +		dev_dbg(&master->base.dev,
> +			"SETMWL not accepted by target: %d\n", ret);
> +
> +	mwl->len =3D cpu_to_be16(max_fifo_bytes);

[Severity: Medium]
Similarly, does this unconditional update in dw_i3c_master_clamp_mwl() need
clarification in the commit message to avoid confusion about when the GET
buffer is updated?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908102724.3232=
660-1-shubhamsanjay.patil@amd.com?part=3D1
