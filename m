Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF2135C6BA
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 09:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785232771; cv=none; b=ZOH9EL3qgRKPd63LFu78DFssBQeL05TGgYtfQowufups8AxgvzK7vqzN6vi4eRb5RLja3/6RnYDN73wdRolBKqJWAbR47cx1hLu3+6UekNpn+LdHWQuZOutG4Ur1jJuTzG2Eg6HVpFWK9jlNovPjI6T6+OnNYvnu7KcJY28OdJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785232771; c=relaxed/simple;
	bh=QHBKaSHu4gZEsfrStnfBwty76GkA+eZ1uXQWa813UDY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=d5vHAQ3hnxP9ZXtvtDYDyBVMUjCF0VhhoTc24k0gYT6rZJxLlxH+d0sqGKwmJGvpCFI+SfDLioCLMW063G/MnhmaMWKQA9EEHwYYceGGaXw/krCgQ2Ven66brXUuK/lyxz+TuFBf5Ap9uYRsj6QmD0Ip834DW33fa1Lm/rGVKBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IAFmAED2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IAFmAED2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 371331F000E9;
	Tue, 28 Jul 2026 09:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785232770;
	bh=q24BoSkbUaFi5wCbYq+UmagVTMQpNvbxQ56oqEsh+Yo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IAFmAED2ZsWRsqWDEBj0to9qixeZyV8U12WA68OxboWrAgy/eHgAuDy+M1bNdP+A9
	 CfeOpLsb1AlnhMzHYDQny0oBczvLDBMZD6OcngtrdidD3RsulA9ckYaJrJ52ASyU7f
	 QXpou8mA+n3jN/UPklcX6/RZYgmE3cvROH1x4bhKs+2mVSZOZnkovJu+iZFhUX6yDR
	 DDXpPe/igphXNZjToEl5mNlDnA/xKZDDbFgpocE7yU+3NBw4QA4BI+DcerbT2H3212
	 ubmiXTb1MR8YHai1XMCkHBU8Z/VwOlkXPOfJWXeKwGFK8i7yr5tqJsMMDqBLw948i3
	 9jGedzKDko+Kg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] soc: mediatek: cmdq-helper: add legacy GCE ISA
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Roman Vivchar" <rva333@protonmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260728-6572-gce-v1-2-750bba32689e@protonmail.com>
References: <20260728-6572-gce-v1-0-750bba32689e@protonmail.com>
 <20260728-6572-gce-v1-2-750bba32689e@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 09:59:29 +0000
Message-Id: <20260728095930.371331F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The `legacy_isa` feature is completely non-functional because the =
driver fails to add the `mt6572` compatible string to `cmdq_of_ids` and `cm=
dq_get_mbox_priv()` is never updated to initialize the `legacy_isa` field. =
As a result, `pkt->priv.legacy_isa` always defaults to `false` (as packets =
are zero-allocated by callers), rendering the new legacy instruction suppor=
t dead code.
- [High] The bitfield layout for `offset_legacy` and `subsys_legacy` inside=
 the `__packed` struct relies on compiler-dependent little-endian bitfield =
ordering, which breaks on big-endian kernels.
- [High] `cmdq_pkt_poll_addr()` manually constructs a `CMDQ_CODE_POLL` inst=
ruction using standard hardware bitfields (like `sop` and `dst_t`), bypassi=
ng the `legacy_isa` encoding checks. This will emit corrupted instructions =
on MT6572.
--

--- Patch [2]: [PATCH 2/3] soc: mediatek: cmdq-helper: add legacy GCE ISA s=
upport ---
commit 79388ed6a8bb4f65925fd916d2fe04a8f2d226d6
Author: Roman Vivchar <rva333@protonmail.com>

> soc: mediatek: cmdq-helper: add legacy GCE ISA support
>=20
> Some SoCs, such as mt6572, have different WRITE and POLL instruction
> encoding. Instead of 16-bit offset and 8-bit subsystem ID, old GCEs have
> 22-bit offset and 2-bit subsystem ID.
>=20
> Extend cmdq_instruction struct with additional union and struct to hold
> the legacy format of instruction encoding. Add legacy_isa to select
> legacy GCE ISA when writing instruction. Finally, add special handing
> for legacy_isa cases.

> diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediate=
k/mtk-cmdq-helper.c
> index f8ee6c9ade898..0947324050805 100644
> --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> @@ -31,18 +31,27 @@ struct cmdq_instruction {

> [ ... ]

> +		struct {
> +			u32 offset_legacy:22;
> +			u32 subsys_legacy:2;
> +		} __packed;

[Severity: High]
Could this bitfield layout break on big-endian kernels?

C bitfields are packed starting from the least significant bit on
little-endian architectures, but from the most significant bit on big-endian
architectures. If this is compiled on a big-endian kernel, the bit layout
will be inverted and the hardware might receive malformed instruction words.

Would it be better to use explicit bitwise shifts and masks, or an explicit
little-endian bitfield declaration for hardware-facing structures?

> [ ... ]
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

[Severity: High]
Does cmdq_pkt_poll_addr() also need an update for the new legacy format?

While cmdq_pkt_poll() checks for legacy_isa here, cmdq_pkt_poll_addr()
appears to still manually construct a poll instruction using standard hardw=
are
bitfields like sop and dst_t.

If cmdq_pkt_poll_addr() is called on older hardware like mt6572, these bits
might be incorrectly reinterpreted by the hardware as random legacy offsets,
potentially causing hardware faults. Should cmdq_pkt_poll_addr() explicitly
return -EOPNOTSUPP if legacy_isa is active?

> diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h b/include/linux/mai=
lbox/mtk-cmdq-mailbox.h
> index 07c1bfbdb8c46..9fcebc4ca8645 100644
> --- a/include/linux/mailbox/mtk-cmdq-mailbox.h
> +++ b/include/linux/mailbox/mtk-cmdq-mailbox.h
> @@ -72,6 +72,7 @@ struct cmdq_cb_data {
> =20
>  struct cmdq_mbox_priv {
>  	u8 shift_pa;
> +	bool legacy_isa;

[Severity: High]
Is the legacy_isa flag ever initialized to true?

Looking at the driver, it appears the mt6572 compatible string is missing
from cmdq_of_ids, and cmdq_get_mbox_priv() is not updated to initialize
this field.=20

Since packets are zero-allocated by callers, this flag will always default
to false, meaning the new legacy instruction branches will not be executed
and the feature remains non-functional.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728-6572-gce-v=
1-0-750bba32689e@protonmail.com?part=3D2
