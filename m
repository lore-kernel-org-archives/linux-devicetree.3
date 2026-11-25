Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795647721;
	b=Ldwifg+1s5HP6osnuYF7GmZ1j1IJqkBFqY+xHknsvgFYpTm505a8l6/iz1snIHq9DCG0
	 Lls5uBRtdFyB1Fl3rVXnK1kGSeM00WhbV6C2rkxTqKb/woc3PLyOMMH0h4H8HdmpHnsc7
	 YNMR1BvZoMExjsRIE+WIEjfMAj9XWndyiM+ZxqDfSsXDa3lRWfs1RZxw1fEV4sLKJvjwK
	 gBEwLDqphiKdFagpKQZlSTrBTxQ68TQRsZ2txDMr3v9tyNDLPubXfE9j/UbHEXyk9pxT7
	 u3W0razkevFUVOvcbulRt1RRIO75QSY+869WngdwRGitTtbkUHrx0red/9u4tjjtcKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795647721;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=WBdSoNEoT62ps/egLDRn9sSDtlG11kdmdeS3kZNhFM0=;
	b=HTSKAk0Ob4ASnlHMKER/0/l0e6H4byxfC//mFpDlN88IDpMy7nLv8qi7RcgvnWg6c5xl
	 AOcqXIB1zW0iGy+IRu41kZtCaan7TiXEnDOKfRHRLRMTP/+YIiVsF+NXPop7GRL/5EYvr
	 zhe/dJnUpkwmtac3q9uVMFayMcSSxYoXTZg8ztxy/eB3gLMjG5VZWk+DoszDNfyEtXi+R
	 FqNAVbhdLd7yFoUpRSAniN48YvSWfCaXej/qom1ePWV6ooQqNOcts85mcV7m5IZW46imq
	 ek8TZ+1Tf3eCstmJCTdpEDGboW4gAimGLXFCsncMPClmE53566eELl1nIfUvNwBHudQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fOF9Ep2a;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3863606A31E
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 23:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fOF9Ep2a
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 686F91F000C4;
	Wed, 25 Nov 2026 23:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795647720;
	bh=WBdSoNEoT62ps/egLDRn9sSDtlG11kdmdeS3kZNhFM0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fOF9Ep2aMoNBKY8AyHEsCB05ro8c/foyEdAPyIE/UtPF/eXg5syCrwOVsTxNvYZ3s
	 5Sw4wn5wxGNBCS0305yvTcoreH92QFiUPva3Yy1KQK3a7JMkdJv3YqNhK4E2tJoQaB
	 FKUftYpkbAuzvo8fSte0aDX+p1GubB5ya/KVRY/mEmNlwxYhQMewxD00LMiN+YeKVe
	 E4YsZgFHawlXLyGKMW/jFva/VW5QcCPWa41SOE3gWGiLLOqoL4/flQhhtGOk9kPD7J
	 gfZpbmRoGdLSA8wYs7auevOKQe2bSlG56eOFDaYrJj4E6YzoCvxYfjDaWN8lQGpyH/
	 Bsx4EkcW10AKA==
Message-ID: <sashiko-outbox-234346@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 3/3] net: ipa: add SC8180X (IPA v4.1)
 configuration data
Reply-To: sashiko-reviews@lists.linux.dev
To: "Robert Ijtsma" <robertijtsma@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261125-qcom-ipa-sc8180x-v1-3-48a889acbe6b@gmail.com>
References: <20261125-qcom-ipa-sc8180x-v1-0-48a889acbe6b@gmail.com>
 <20261125-qcom-ipa-sc8180x-v1-3-48a889acbe6b@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 23:02:00 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] net: ipa: tre_count exceeds event_count on v4.1 AP_COMMAND_TX
  channel
- [Low] net: ipa: unused resource enums, raw BCR hex, and extra modem
  endpoints
--

commit aa6515fd37eb0fd75ac7af4e3c2122ec4fe34431
Author: Robert Ijtsma <robertijtsma@gmail.com>

net: ipa: add SC8180X (IPA v4.1) configuration data

This commit adds IPA v4.1 configuration data for the Qualcomm SC8180X SoC
and binds it to the qcom,sc8180x-ipa compatible string.

> diff --git a/drivers/net/ipa/data/ipa_data-v4.1.c b/drivers/net/ipa/data/=
ipa_data-v4.1.c
> new file mode 100644
> index 0000000000000..9b52c60b5cc7f
> --- /dev/null
> +++ b/drivers/net/ipa/data/ipa_data-v4.1.c
> @@ -0,0 +1,319 @@

[ ... ]

> +/** enum ipa_resource_type - IPA resource types for an SoC having IPA v4=
.1 */
> +enum ipa_resource_type {
> +	/* Source resource types; first must have value 0 */
> +	IPA_RESOURCE_TYPE_SRC_PKT_CONTEXTS		=3D 0,
> +	IPA_RESOURCE_TYPE_SRC_DESCRIPTOR_LISTS,
> +	IPA_RESOURCE_TYPE_SRC_DESCRIPTOR_BUFF,
> +	IPA_RESOURCE_TYPE_SRC_HPS_DMARS,
> +	IPA_RESOURCE_TYPE_SRC_ACK_ENTRIES,
> +
> +	/* Destination resource types; first must have value 0 */
> +	IPA_RESOURCE_TYPE_DST_DATA_SECTORS		=3D 0,
> +	IPA_RESOURCE_TYPE_DST_DPS_DMARS,
> +};
> +
> +/* Resource groups used for an SoC having IPA v4.1 */
> +enum ipa_rsrc_group_id {
> +	/* Source resource group identifiers */
> +	IPA_RSRC_GROUP_SRC_LWA_DL	=3D 0,
> +	IPA_RSRC_GROUP_SRC_UL_DL,
> +	IPA_RSRC_GROUP_SRC_UNUSED_2,
> +	IPA_RSRC_GROUP_SRC_UC_RX_Q,
> +	IPA_RSRC_GROUP_SRC_COUNT,	/* Last in set; not a source group */
> +
> +	/* Destination resource group identifiers */
> +	IPA_RSRC_GROUP_DST_LWA_DL	=3D 0,
> +	IPA_RSRC_GROUP_DST_UL_DL_DPL,
> +	IPA_RSRC_GROUP_DST_UNUSED_2,
> +	IPA_RSRC_GROUP_DST_UC_RX_Q,
> +	IPA_RSRC_GROUP_DST_COUNT,	/* Last; not a destination group */
> +};

[ ... ]

> +/* Endpoint data for an SoC having IPA v4.1 */
> +static const struct ipa_gsi_endpoint_data ipa_gsi_endpoint_data[] =3D {
> +	[IPA_ENDPOINT_AP_COMMAND_TX] =3D {
> +		.ee_id		=3D GSI_EE_AP,
> +		.channel_id	=3D 4,
> +		.endpoint_id	=3D 5,
> +		.toward_ipa	=3D true,
> +		.channel =3D {
> +			.tre_count	=3D 512,
> +			.event_count	=3D 256,
> +			.tlv_count	=3D 20,
> +		},

[Severity: High]
Can setting tre_count (512) higher than event_count (256) on
IPA_ENDPOINT_AP_COMMAND_TX cause an out-of-bounds access in
channel->trans_info.map[]?

In gsi_channel_init_one(), tre_count > event_count triggers a warning and
clamps channel->tre_count to 256, but gsi_ring_alloc() still allocates
channel->tre_ring with the unclamped data->channel.tre_count (512):

drivers/net/ipa/gsi.c:gsi_channel_init_one() {
	...
	if (channel->tre_count > channel->event_count) {
		channel->tre_count =3D channel->event_count;
		...
	}

	ret =3D gsi_ring_alloc(gsi, &channel->tre_ring, data->channel.tre_count);
	...
}

gsi_channel_trans_init() then allocates channel->trans_info.map with
channel->tre_count (256) entries, whereas gsi_trans_map() and
gsi_channel_trans_mapped() index trans_info.map modulo
channel->tre_ring.count (512).  Because IPA_ENDPOINT_AP_COMMAND_TX is not
reset across modem crash/stop cycles, tre_ring.index advances across
command transactions and writes past the end of trans_info.map once it
reaches 256.  Setting .tre_count =3D 256 (matching the other IPA v4.x/v5.x
configurations) avoids the mismatch.

[ ... ]

> +	[IPA_ENDPOINT_MODEM_COMMAND_TX] =3D {
> +		.ee_id		=3D GSI_EE_MODEM,
> +		.channel_id	=3D 1,
> +		.endpoint_id	=3D 4,
> +		.toward_ipa	=3D true,
> +	},
> +	[IPA_ENDPOINT_MODEM_LAN_RX] =3D {
> +		.ee_id		=3D GSI_EE_MODEM,
> +		.channel_id	=3D 4,
> +		.endpoint_id	=3D 14,
> +		.toward_ipa	=3D false,
> +	},
> +	[IPA_ENDPOINT_MODEM_AP_TX] =3D {
> +		.ee_id		=3D GSI_EE_MODEM,
> +		.channel_id	=3D 0,
> +		.endpoint_id	=3D 3,
> +		.toward_ipa	=3D true,
> +		.endpoint =3D {
> +			.filter_support	=3D true,
> +		},
> +	},
> +	[IPA_ENDPOINT_MODEM_AP_RX] =3D {
> +		.ee_id		=3D GSI_EE_MODEM,
> +		.channel_id	=3D 3,
> +		.endpoint_id	=3D 13,
> +		.toward_ipa	=3D false,
> +	},
> +};
> +
> +/* Source resource configuration data for an SoC having IPA v4.1 */
> +static const struct ipa_resource ipa_resource_src[] =3D {
> +	{
> +		.limits[0] =3D { .min =3D 1, .max =3D 63 },
> +		.limits[1] =3D { .min =3D 1, .max =3D 63 },
> +		.limits[2] =3D { .min =3D 0, .max =3D 0 },
> +		.limits[3] =3D { .min =3D 1, .max =3D 63 },
> +	},

[ ... ]

> +/* Configuration data for an SoC having IPA v4.1 */
> +const struct ipa_data ipa_data_v4_1 =3D {
> +	.version		=3D IPA_VERSION_4_1,
> +	.backward_compat	=3D 0x39,

[Severity: Low]
Should IPA_ENDPOINT_MODEM_COMMAND_TX and IPA_ENDPOINT_MODEM_LAN_RX be
omitted here?

Per commit d21d1f33b190 ("net: ipa: don't define endpoints
unnecessarily"), non-v4.2 targets only define modem endpoints that
support filtering or are referenced by another endpoint; defining these
two causes the AP to program pause, HOLB clear, and exception reset on
those modem-owned endpoints during modem lifecycle transitions.

Also, ipa_resource_src[] and ipa_resource_dst[] use positional entries
and numeric .limits[0..3] indices instead of the IPA_RESOURCE_TYPE_* and
IPA_RSRC_GROUP_* enums defined at the top of the file (leaving enum
ipa_resource_type unused), and .backward_compat uses raw 0x39 instead of
the BIT(BCR_*) flags from enum ipa_bcr_compat.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125-qcom-ipa-s=
c8180x-v1-0-48a889acbe6b@gmail.com?part=3D3
