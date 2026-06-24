Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD93123AE62
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 01:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782265470; cv=none; b=VB4lJyWSYBMIJ+CUUxJtu+tazbu1pj+z+TXe5S4dq2yn2orAMJ9+Uynw45evgyyXdo5A4tj1PjeLLGp9LM2QlsPXVHtNTOBLiBwRR62ABfuTn9XQYuj6Znr0NSJp74gtOBYFmVQvocOnIg5806t2/pCjxyxkZbehxWLMcdO4MmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782265470; c=relaxed/simple;
	bh=bx2Wi1mHULzjWeahiXVHb2U888yWS2HK2ZsSvRSTQDc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rgnqqgBJOtqFL6OrbMksAXF/6sD9g0+ys0AxQdypqumKMAL7IhtQKQAPeJIVgOR3Amc50IG8RBauLs5f2g7ky0CLWFFFNGhXgM32NWokPtEAtcGi6dQTg1yRa1EqVz47hnC1z69IXHePeU+JHfPaDnHUElPvz5z6THdt7VTsBeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nLKqgaOs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nLKqgaOs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 577621F000E9;
	Wed, 24 Jun 2026 01:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782265469;
	bh=yJVxbvqVBCfvfwnzMQzrBtjbkBu4BDRsbhkXScNxwbA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nLKqgaOsK900MnX8voGBJD42Q70AdJSfkWr25Bx3anOudXPcixLW8P+wqEQ/fVsSl
	 CaUet94ihFjTxbMP1qc8CfBM8Xxnw1wWqrt1MMKYK8ihZiSsJwDzm+zBiTOhCYivnH
	 gIBYNlu10xOeFf30fraXb6Gw3Y0Uee8Ez2HQkBfD0KOF4xkOe4dELMN1A2DjBXzj3F
	 RjgWFOqvPgKe/QllXei8B3PG1QpVynz/yxMCycQ3CJg9IHkxCGTdqMHjMm8Qblivsc
	 61iPVTwvOCCrUXiJ8TACbuN1sPF8mksJXVcGpPFth8mDJe3ihwSuRNUHsgmG+Swncp
	 sN6UwDLdgJZJQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] net: ipa: Add IPA v5.1 data
Reply-To: sashiko-reviews@lists.linux.dev
To: "Esteban Urrutia via B4 Relay" <devnull+esteuwu.proton.me@kernel.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260622-sm8450-ipa-v1-3-532f0299f96e@proton.me>
References: <20260622-sm8450-ipa-v1-0-532f0299f96e@proton.me>
 <20260622-sm8450-ipa-v1-3-532f0299f96e@proton.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 24 Jun 2026 01:44:28 +0000
Message-Id: <20260624014429.577621F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Driver probe failure on SM8450 due to intentional SMEM size mismat=
ch.
- [High] Overlapping IPA local memory regions will cause silent data corrup=
tion between filter tables and routing statistics.
- [Medium] The AP_MODEM_RX endpoint is incorrectly assigned to the DST_UL r=
esource group, causing resource starvation and unused DST_DL resources.
--

commit 6da897f459f64d1618e077cb44111c9397ad478b
Author: Esteban Urrutia <esteuwu@proton.me>

net: ipa: Add IPA v5.1 data

Add the required ipa_data-v5.1.c file for IPA v5.1 along with changes
that declare IPA v5.1 support. This version of IPA is used in both SM8450
and SM8475 SoCs.

> diff --git a/drivers/net/ipa/data/ipa_data-v5.1.c b/drivers/net/ipa/data/=
ipa_data-v5.1.c
> new file mode 100644
> index 0000000000000..85b21efa1224d
> --- /dev/null
> +++ b/drivers/net/ipa/data/ipa_data-v5.1.c
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

[Severity: Medium]
Will assigning this downlink endpoint to the UL resource group cause
resource starvation?

Since this is the AP_MODEM_RX endpoint, should it be assigned to
IPA_RSRC_GROUP_DST_DL instead?

Later in the ipa_resource_dst[] configuration, 5 data sectors are allocated
to IPA_RSRC_GROUP_DST_DL. If no endpoints are assigned to the DL group,
those sectors will remain unused while AP_MODEM_RX competes with AP_LAN_RX
for the limited DST_UL resources.

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
> +		.id		=3D IPA_MEM_AP_V4_FILTER,
> +		.offset		=3D 0x29b8,
> +		.size		=3D 0x0188,
> +		.canary_count	=3D 2,
> +	},
> +	{
> +		.id		=3D IPA_MEM_AP_V6_FILTER,
> +		.offset		=3D 0x2b40,
> +		.size		=3D 0x0228,
> +		.canary_count	=3D 0,
> +	},
> +	{
> +		.id		=3D IPA_MEM_STATS_FILTER_ROUTE,
> +		.offset		=3D 0x2cd0,
> +		.size		=3D 0x0ba0,
> +		.canary_count	=3D 2,
> +	},

[Severity: High]
Do these memory region offsets overlap and lead to data corruption?

IPA_MEM_STATS_TETHERING starts at 0x2910 and has a size of 0x03c0, which
means it extends up to 0x2cd0.

However, IPA_MEM_AP_V4_FILTER begins at 0x29b8, placing it entirely inside
the tethering region. Similarly, IPA_MEM_AP_V6_FILTER starts at 0x2b40,
which overlaps both the end of the tethering region and the start of
IPA_MEM_STATS_FILTER_ROUTE.

Could hardware updates to the routing and filter stats corrupt the AP
filter tables here?

[ ... ]
> +/* Memory configuration data for an SoC having IPA v5.1 */
> +static const struct ipa_mem_data ipa_mem_data =3D {
> +	.local_count	=3D ARRAY_SIZE(ipa_mem_local_data),
> +	.local		=3D ipa_mem_local_data,
> +	.imem_addr	=3D 0x146a8000,
> +	.imem_size	=3D 0x00002000,
> +	/*
> +	 * While this value is 0xb000 on SM8450 and 0x9000 on SM8475,
> +	 * it has been left set to 0x9000 for compatibility with SM8475
> +	 */
> +	.smem_size	=3D 0x00009000,

[Severity: High]
Will this hardcoded SMEM size cause the driver probe to fail on SM8450?

When the SM8450 bootloader or modem pre-allocates 0xb000 bytes,
qcom_smem_get() will return that actual size.

Looking at ipa_smem_init() in drivers/net/ipa/ipa_mem.c:

	if (ret && actual !=3D size) {
		dev_err(dev, "SMEM item has size %zu, expected %zu\n",
			actual, size);
		return -EINVAL;
	}

Because this strictly validates the returned size against
ipa->mem_data->smem_size, setting this to 0x9000 for SM8475 compatibility
would cause the size check to fail and abort the driver probe.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260622-sm8450-ipa=
-v1-0-532f0299f96e@proton.me?part=3D3
