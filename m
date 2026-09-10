Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34F3385D68
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 03:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789009920; cv=none; b=QhCfoeZqFFBI0aDWSOenEjnv58RUv+w0X4iJPH6TpaYAB6MsGzrL0qtzOnUU+mFYPPoGHE+PVY8/VNEtaPVm2OU2M2qeNz8RMxcHRApzUJf54UGYr9r835QOr+6CVL0f0keV6qgQg+r+r6QCVY+N8olblW637+UIEpRmXVSX3R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789009920; c=relaxed/simple;
	bh=a5bd7NwlaErNyrh5B/iLgDgmSb0cD11kHXJJXAfNKx4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=H7jr5/OZzfdYSxZFlxHjVFIMJ9mReZRHFMiw7Y6b3NDsZJyIcsVg2hEe95PLZiM/HRLl8JrZVeO4r41Oyb8DWVaIE7nEptHkU4DbVu4zrEFSqqZHng06jZApIxm472+E5MtbiunLEtKjyauiWt6JMOYaDwqNdikADAiO5uBfxsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=leosDmEK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="leosDmEK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 501301F000FF;
	Thu, 10 Sep 2026 03:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789009918;
	bh=OGvEJnYfC8JDpWrXG1psIzyyBQzuyE7D7fW09kY2FjI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=leosDmEKhVOSonhjNHhzUQVAIJeXYIuc8ntMevMxddZfnO0bG02RglxxI7sIlQTLr
	 lgLKfalCC7aHf8h/w+7kl3fEhbR7zQZVRc6K6RC8JmDsWq+ZrnbJ6ov4RaeaUPaD6G
	 7XfYQzqT2jdzBidIo2SVrGCBvGsamUzJc8r3dB7YQnqk3aqTDg7ZQwXlofUWhpoIjK
	 98LsFKhq/NNJAezGI50MPLsUAGPtoGi9wVzkzy/FDMwtv8UlJpwuG3gOTNGUiibYGt
	 eIedYddz8kvsO3z1ten8qyU8V6pUuBeavoRa8anF/TTWQv51s3alBmr4MjVng7fTYu
	 hItAIK9PoQt6Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] net: ipa: Add IPA v5.1 configuration data
Reply-To: sashiko-reviews@lists.linux.dev
To: "Esteban Urrutia" <esteuwu@proton.me>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260909-sm8450-ipa-v2-2-2deb8b4e91a5@proton.me>
References: <20260909-sm8450-ipa-v2-0-2deb8b4e91a5@proton.me>
 <20260909-sm8450-ipa-v2-2-2deb8b4e91a5@proton.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 03:11:57 +0000
Message-Id: <20260910031158.501301F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The canaries for the IPA_MEM_STATS_FILTER_ROUTE memory region over=
lap with the IPA_MEM_STATS_TETHERING memory region, causing data corruption.
- [High] The IPA_ENDPOINT_AP_MODEM_RX endpoint is incorrectly assigned to t=
he DST_UL resource group instead of DST_DL.
- [Low] Undeclared identifier 'IPA_MEM_MODEM_STATS_DROP' causes a compilati=
on error.
--

commit 072920040c7663b1214df96432603178023826d5
Author: Esteban Urrutia <esteuwu@proton.me>

net: ipa: Add IPA v5.1 configuration data

This commit adds the configuration data required for IPA v5.1, which is
used in the Qualcomm SM8450 SoC.

> diff --git a/drivers/net/ipa/data/ipa_data-v5.1.c b/drivers/net/ipa/data/=
ipa_data-v5.1.c
> new file mode 100644
> index 0000000000000..7d7bc193b774c
> --- /dev/null
> +++ b/drivers/net/ipa/data/ipa_data-v5.1.c
> @@ -0,0 +1,476 @@
> +// SPDX-License-Identifier: GPL-2.0
[ ... ]
> +/* Endpoint configuration data for an SoC having IPA v5.1 */
> +static const struct ipa_gsi_endpoint_data ipa_gsi_endpoint_data[] =3D {
[ ... ]
> +	[IPA_ENDPOINT_AP_MODEM_RX] =3D {
> +		.ee_id		=3D GSI_EE_AP,
> +		.channel_id	=3D 1,
> +		.endpoint_id	=3D 23,
> +		.toward_ipa	=3D false,
> +		.channel =3D {
> +			.tre_count	=3D 256,
> +			.event_count	=3D 256,
> +			.tlv_count	=3D 9,
> +		},
> +		.endpoint =3D {
> +			.config =3D {
> +				.resource_group	=3D IPA_RSRC_GROUP_DST_UL,

[Severity: High]
Is the AP_MODEM_RX endpoint incorrectly assigned to the DST_UL resource gro=
up
instead of DST_DL?

Looking at the destination resource limits in ipa_resource_dst, it appears
DST_DL is allocated 5 data sectors that remain completely unused by any
endpoint. Meanwhile, DST_UL has only 6 data sectors but must handle both
LAN_RX and MODEM_RX traffic.

Will this cause resource starvation for both datapaths under load?

[ ... ]
> +/* Destination resource configuration data for an SoC having IPA v5.1 */
> +static const struct ipa_resource ipa_resource_dst[] =3D {
> +	[IPA_RESOURCE_TYPE_DST_DATA_SECTORS] =3D {
> +		.limits[IPA_RSRC_GROUP_DST_UL] =3D {
> +			.min =3D 6,	.max =3D 6,
> +		},
> +		.limits[IPA_RSRC_GROUP_DST_DL] =3D {
> +			.min =3D 5,	.max =3D 5,
> +		},

[ ... ]
> +/* IPA-resident memory region data for an SoC having IPA v5.1 */
> +static const struct ipa_mem ipa_mem_local_data[] =3D {
[ ... ]
> +	{
> +		.id		=3D IPA_MEM_STATS_TETHERING,
> +		.offset		=3D 0x2910,
> +		.size		=3D 0x03c0,
> +		.canary_count	=3D 0,
> +	},
> +	{
> +		.id		=3D IPA_MEM_STATS_FILTER_ROUTE,
> +		.offset		=3D 0x2cd0,
> +		.size		=3D 0x0ba0,
> +		.canary_count	=3D 2,
> +	},

[Severity: High]
Is there a risk of memory layout overlap corrupting the tethering statistic=
s?

During initialization in ipa_mem_config(), the driver writes canary values
(0xdeadbeef) before each region's offset. Since IPA_MEM_STATS_FILTER_ROUTE
starts at 0x2cd0 and has a canary_count of 2, eight bytes of canaries will =
be
written to 0x2cc8 through 0x2ccf.

However, the IPA_MEM_STATS_TETHERING region spans from 0x2910 to 0x2cd0
(size 0x03c0). Can we expect the last 8 bytes of the tethering stats
memory to be overwritten by the next region's canaries?

[ ... ]
> +	{
> +		.id		=3D IPA_MEM_MODEM_STATS_DROP,
> +		.offset		=3D 0x4fe8,
> +		.size		=3D 0x0018,
> +		.canary_count	=3D 0,
> +	},
> +};

[Severity: Low]
Could this result in a compilation error?

It appears that IPA_MEM_MODEM_STATS_DROP is not defined in enum ipa_mem_id,
which would lead to a build failure.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909-sm8450-ipa=
-v2-0-2deb8b4e91a5@proton.me?part=3D2
