Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3CE84E1408
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 18:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788804989; cv=none; b=RNj6jsZad0J6v652CFzCnYJhX+A6c9STzJErLqBZg/QevZf09ue3zfZU4/bf42vlMyVah281x5+4untPMk3CPD1rwAGhys6nUypmHbApMZy9rfdkGirrZu+5CtOyCjwYPfra1L24so8mayq/I8OjY+OhDcWVf114RoAap4oKjho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788804989; c=relaxed/simple;
	bh=YQNJ+20IZZIKO1hL9rTjk6Mu7PCVYCZzLeAXBFYLwa4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PBCXz4NkggM94dw9w+ba1LRFDNMbfF2YxRqNjk6CicB72VzfWDuw79tI8PoR68BcDfMQflYOW9UqpQClMeNFoja3ZVwQoO+YcRLsRv/bVqarsSH5L81f7r1lAlP6SniXi1dcw7CTxbvmLvvxtekLG/L1da0jgg6I+jcygjwXdzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mzBrt5Zr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mzBrt5Zr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF94C1F00A3A;
	Mon,  7 Sep 2026 18:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788804985;
	bh=4kzVhJ/vfwZBwcKfTfHPYzZitumjGnYfvJDIK/dgcXw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mzBrt5ZrLAYS912YUXiKdK/09GI7M4463Kr33NwRi0g0yooN+BCj+IPcX7Kzk9Frc
	 Z/GqblgC2wxGdR4KmQ8CtbHdfIaJVSxkwdpJqxlrJ5nl6jO2jdeQSHGy90DOe577Ge
	 XtF+ODuGpNpTjUBuZyu79ZzFdC9inv4dy1hzzlDOC2BtnJGnStjyYnI+Q3TL0LiFRC
	 G2EaODiSB+N2ynU+qGTNK0L2YIvdjj3NcF8+J/c9cUKL8o/wbwOIdy+sM7xJA62dBX
	 8QvwaN19yDOr5h4jZ5fBS03b5vYggDCrkGMxpQc7c56aennhyXvSqCZLRNEVBe+dSN
	 znpRL/IVauJFA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] soc: mediatek: cmdq-helper: add legacy GCE ISA
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Roman Vivchar" <rva333@protonmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260907-6572-gce-v2-2-412a5b037290@protonmail.com>
References: <20260907-6572-gce-v2-0-412a5b037290@protonmail.com>
 <20260907-6572-gce-v2-2-412a5b037290@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 18:16:24 +0000
Message-Id: <20260907181624.EF94C1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing Hardware Capability Validation for Legacy ISA APIs
--

commit 28dadad6fede624ec82b707f4b97ba89645a0db7
Author: Roman Vivchar <rva333@protonmail.com>

soc: mediatek: cmdq-helper: add legacy GCE ISA support

Some SoCs, such as mt6572, have different WRITE and POLL instruction
encoding. Instead of 16-bit offset and 8-bit subsystem ID, old GCEs have
22-bit offset and 2-bit subsystem ID.

> diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediate=
k/mtk-cmdq-helper.c
> index f8ee6c9ade898..fb82f2a85a210 100644
> --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c

[ ... ]

> @@ -86,7 +95,7 @@ int cmdq_dev_get_client_reg(struct device *dev,
>  		client_reg->subsys =3D CMDQ_SUBSYS_INVALID;
> =20
>  		/*
> -		 * All GCEs support writing register PA with mask without subsys,
> +		 * GCE v2/v3 support writing register PA with mask without subsys,
>  		 * but this requires extra GCE instructions to convert the PA into
>  		 * a format that GCE can handle, which is less performance than
>  		 * directly using subsys. Therefore, when subsys is available,

[Severity: Medium]
When a client device on a legacy GCE is missing the mediatek,gce-client-reg
property, cmdq_dev_get_client_reg() defaults to assigning cmdq_pkt_write_pa
as the write function:

drivers/soc/mediatek/mtk-cmdq-helper.c:cmdq_dev_get_client_reg() {
    ...
		/*
		 * GCE v2/v3 support writing register PA with mask without subsys,
		 * but this requires extra GCE instructions to convert the PA into
		 * a format that GCE can handle, which is less performance than
		 * directly using subsys. Therefore, when subsys is available,
		 * we prefer to use subsys for writing register PA.
		 */
		client_reg->pkt_write =3D cmdq_pkt_write_pa;
    ...
}

However, cmdq_pkt_write_pa() unconditionally uses SPRs, which legacy GCE
hardware does not support:

drivers/soc/mediatek/mtk-cmdq-helper.c:cmdq_pkt_write_pa() {
    ...
	err =3D cmdq_pkt_assign(pkt, CMDQ_THR_SPR_IDX0, CMDQ_ADDR_HIGH(pa_base));
    ...
}

Does this code need a check for pkt->priv.legacy_isa in cmdq_pkt_write_pa()
to prevent generating unsupported instructions that could cause silent queue
corruption or a GCE hardware fault?

[ ... ]

> @@ -459,10 +474,16 @@ int cmdq_pkt_poll(struct cmdq_pkt *pkt, u8 subsys,
>  {
>  	struct cmdq_instruction inst =3D {
>  		.op =3D CMDQ_CODE_POLL,
> -		.value =3D value,
> -		.offset =3D offset,
> -		.subsys =3D subsys
> +		.value =3D value
>  	};
> +
> +	if (pkt->priv.legacy_isa) {
> +		inst.offset_legacy =3D offset;
> +		inst.subsys_legacy =3D subsys;
> +	} else {
> +		inst.offset =3D offset;
> +		inst.subsys =3D subsys;
> +	}
>  	return cmdq_pkt_append_command(pkt, inst);
>  }

[Severity: Medium]
Similarly, cmdq_pkt_poll_addr() unconditionally relies on GPR registers, wh=
ich
legacy hardware does not implement:

drivers/soc/mediatek/mtk-cmdq-helper.c:cmdq_pkt_poll_addr() {
    ...
	inst.op =3D CMDQ_CODE_POLL;
	inst.dst_t =3D CMDQ_REG_TYPE;
	inst.sop =3D CMDQ_POLL_ADDR_GPR;
    ...
}

Should there be a capability validation for legacy_isa in
cmdq_pkt_poll_addr() as well to avoid generating invalid microcode
instructions?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907-6572-gce-v=
2-0-412a5b037290@protonmail.com?part=3D2
