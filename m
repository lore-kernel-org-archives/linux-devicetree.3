Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F45D365A13
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 03:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790652413; cv=none; b=eIPpSccQ/Fb6CWNgf1PBp8tnxQyf61mb1ASOaZTY6GQ8M/DZKoWTbtZSKP7mdle7lvFLtdb9xxdT4FcWypFEtINneVBvP2CvewNpfq3RIYsrieVQh7yb1do1dFJXRUSe4aeVriiJNCqagXoTem9bpOM0Wm5cZGtfMLsWIYKqTow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790652413; c=relaxed/simple;
	bh=83KzzLixD3VjyhZ9fyg4UBmDM1fjXtsO8RCJpQNa7NY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SEx3R0wS9tUiUKzGlCKYIaNaM3Y+5crsDMgqHrjL5XuwUDDW49d/8yNeV23H4aLXdFXN8LCS6eeDxGiluyqxe6yFgJAiQlCK2B3HQhOVMiXfAsiBqMcVVEr5olmZRSk7vaoC68DvpkrSmuYawGV1jUed8i2VCDKGGkMKQBm3IUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OviIo/3Y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OviIo/3Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 840B31F000FF;
	Tue, 29 Sep 2026 03:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790652411;
	bh=pdTuxJydGYmDk/kJrzUZkt19hgxXff2XgHgIFyIdva4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OviIo/3YFY1eOi/6gJ4BTu82unaS8t17r2raXo4cVGpruE/l9sini8RNX9IIy/LQQ
	 opLMWSvgE92W4OeBZMO+VeCRLkb61ZOEkcojSgyPLfQP8snx1P3j0DioXLcKCvZi49
	 MAmzd+vUhzb2oLCO6D02zEj8TMs5wjWg48QMqAaXKrPhyEVehFqT9zqg60EsyGDnw0
	 qzPEv+Ul9AwlJ2Ey3YFYu+S1Gvc7Azx6/KOxi5rkWAUuE99hnWz4GDBSwLHvxhSNBw
	 ZDd6SUvaUkZjDG/oKlvKC4B2JKp/ygPpTeoatQG443nhWo6FCRwZt97NavOrslO3zg
	 Bgx6q5L9OodVA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 06/10] firmware: riscv: rpmi-tee: parse system
 information tables
Reply-To: sashiko-reviews@lists.linux.dev
To: "Amirreza Zarrabi" <amirreza.zarrabi@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260928-riscv-rpmi-tee-abi-v1-6-04908b81d885@oss.qualcomm.com>
References: <20260928-riscv-rpmi-tee-abi-v1-0-04908b81d885@oss.qualcomm.com>
 <20260928-riscv-rpmi-tee-abi-v1-6-04908b81d885@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 03:26:51 +0000
Message-Id: <20260929032651.840B31F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] firmware: riscv: rpmi-tee: forward compatibility broken by rejec=
ting unknown tables and flags
- [Medium] firmware: riscv: rpmi-tee: parser improperly rejects omitted SER=
VICE table
--

commit e7385de8b0fcda79d633aac804a487469dcd9e42
Author: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

firmware: riscv: rpmi-tee: parse system information tables

This commit adds parsing for the RPMI TEE descriptor-table SYSINFO format
used during discovery. It validates the headers, table directory, endpoint
role flags, and service mappings for both Self and Whole-system responses.

> diff --git a/drivers/firmware/riscv_rpmi_tee/sysinfo.c b/drivers/firmware=
/riscv_rpmi_tee/sysinfo.c
> new file mode 100644
> index 0000000000000..5829ab6db0426
> --- /dev/null
> +++ b/drivers/firmware/riscv_rpmi_tee/sysinfo.c

[ ... ]

> +	switch (type) {

[ ... ]

> +	case RPMI_TEE_SYSINFO_TABLE_BLOB:
> +		/* BLOB table is defined as raw bytes. */
> +		if (desc_size !=3D 1)
> +			return -EINVAL;
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}

[ ... ]

> +	info->data =3D data;
> +	info->len =3D len;
> +	for (i =3D 0; i < table_count; i++) {
> +		const struct rpmi_tee_sysinfo_table_desc *desc;
> +		int ret;
> +
> +		desc =3D rpmi_tee_sysinfo_desc_at(header, i);
> +		ret =3D rpmi_tee_sysinfo_get_table(info, desc);
> +		if (ret)
> +			return ret;

[Severity: Medium]
If a future firmware update introduces a new, unrecognized table type,
rpmi_tee_sysinfo_get_table() falls through to the default case and returns
-EOPNOTSUPP, which causes rpmi_tee_sysinfo_init() to completely abort
initialization.

Since desc_size validation handles minor version size extensions, should
unknown table types be safely ignored here instead to maintain forward
compatibility with newer firmware revisions?

> +	}
> +
> +	return 0;
> +}

[ ... ]

> +/* Validate endpoint records and their service ranges. */
> +static int rpmi_tee_sysinfo_validate_endpoints(struct rpmi_tee_sysinfo *=
info,
> +					       bool require_single_ree,
> +					       u32 *self_ep_id)
> +{
> +	const struct rpmi_tee_sysinfo_table *service_table;
> +	const struct rpmi_tee_sysinfo_table *ep_table;
> +	const struct rpmi_tee_sysinfo_endpoint *ep;
> +	u32 ree_count =3D 0, ep_idx;
> +
> +	ep_table =3D &info->tables[RPMI_TEE_SYSINFO_TABLE_ENDPOINT];
> +	service_table =3D &info->tables[RPMI_TEE_SYSINFO_TABLE_SERVICE];
> +	/* Endpoint table should exist and not empty; service table can be empt=
y. */
> +	if (!ep_table->present || !ep_table->count || !service_table->present)
> +		return -EINVAL;

[Severity: Medium]
The comment directly above notes that the service table can be empty, but
this condition returns -EINVAL if !service_table->present.

If valid firmware omits the service table descriptor entirely (e.g., when no
services are available to save directory space), will this spuriously reject
a fully compliant SYSINFO response?

> +
> +	for (ep_idx =3D 0; ep_idx < ep_table->count; ep_idx++) {
> +		rpmi_tee_sysinfo_entry_at(ep_table, ep_idx, ep);
> +
> +		/* struct rpmi_tee_sysinfo_endpoint. */
> +		u32 ep_id =3D get_unaligned_le32(&ep->id);
> +		u32 parent_id =3D get_unaligned_le32(&ep->parent_id);
> +		u32 ep_flags =3D get_unaligned_le32(&ep->flags);
> +		u32 service_first =3D get_unaligned_le32(&ep->service_first);
> +		u32 service_range_count =3D
> +			get_unaligned_le32(&ep->service_count);
> +
> +		bool is_physical =3D
> +			ep_flags & RPMI_TEE_SYSINFO_ENDPOINT_F_PHYSICAL;
> +		bool is_ree =3D ep_flags & RPMI_TEE_SYSINFO_ENDPOINT_F_REE;
> +		/* Require exactly one endpoint location and security role. */
> +		if (is_physical =3D=3D
> +			    !!(ep_flags & RPMI_TEE_SYSINFO_ENDPOINT_F_PROXIED) ||
> +		    is_ree =3D=3D !!(ep_flags & RPMI_TEE_SYSINFO_ENDPOINT_F_TEE) ||
> +		    ep_flags & ~RPMI_TEE_SYSINFO_ENDPOINT_F_MASK)
> +			return -EINVAL;

[Severity: Medium]
Similar to the unknown tables issue above, the strict check against
~RPMI_TEE_SYSINFO_ENDPOINT_F_MASK completely rejects endpoints if they
set newly introduced flags.

Could this strict mask validation cause older kernels to fail to initialize
when running on newer firmware that utilizes new bits in ep_flags?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928-riscv-rpmi=
-tee-abi-v1-0-04908b81d885@oss.qualcomm.com?part=3D6
