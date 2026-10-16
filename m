Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847501D86FF
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 03:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792122083; cv=none; b=ZmPWGdsVCFcrBlkAc1RAOMXIT33FQl/N0SR+PcSD/ygzebPebZXDixcxmO0LI/WqZQlTifCb914O6n0QFzsWz/guSq82ODahoAixk33PF3pi+TI8upbtHz4GvN0uNg8qSHWSqyDMSU9xH0MizCrrdNFA9oeVzrKN9Ugxrzg0OeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792122083; c=relaxed/simple;
	bh=9xQ8eSIz9mCKZyCQLOrEwWwOUA0QlSYGmLVdwSHtSdk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=W0wlfwbx5bD80MO2b580wZaAVkx7oLDKcd67Z9Jap4nl1au6RE/ChXb+tjQdp0VH5xqv33hOMVe885mLbN44FiixxtpbYJytTmRmi6M/eya58ETEMfh9QrEF9tNg6A+uOinpJSwMU9IHxmloQscYGFzZxfzdrjlbvkhTCvbGlCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NOtrPprM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NOtrPprM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6CAF1F000C4;
	Fri, 16 Oct 2026 03:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792122082;
	bh=97kjOQMfJ12ScvERXaoPPGi/ZSHq3jzwRNuZfrlO9IY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NOtrPprMvVzxWNKCpYl9o2jXS8ftV/CtJHhA/CC4MISV64UaNWKRgb/mSP3pB3Nnm
	 GRBg55zdAqxNLaU9C6GmcHLtTZCyVv312Yg7ZLz1TXuhYJm/SFc/jPP0Ce7akuITh0
	 bDq68iRQF6pqiM9xMlF54zA3IS2pmdlDh6xo13Re3GQJZHtlInHPxRoXR9N56yXhwo
	 4sStqgHO2omNUTRpj8pqMZ41RLiVevpvQnwWzDgDVCtQlvA2XnX350KwCofpDpCeKr
	 dkxmil4gadZnf/IhCMgSKASLWNxs2DdxCDmLW+ebeSIQCbd6tyTybLvy/B6EINUZg7
	 o1uoJXi65ealA==
Message-ID: <sashiko-outbox-173688@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH ath-next v2 13/17] wifi: ath12k: use CMEM write for PPT
 on hybrid bus devices
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aaradhana Sahu" <aaradhana.sahu@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261016-mpp-bringup-v2-13-f510c33bfcf5@oss.qualcomm.com>
References: <20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com>
 <20261016-mpp-bringup-v2-13-f510c33bfcf5@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 03:41:21 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] wifi: ath12k: OOB array read in ath12k_dp_cmem_init() due to mixed=
 MLO mem modes
--

commit b4813e2e272b2801865377c6c50ae123db10e5d7
Author: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>

wifi: ath12k: use CMEM write for PPT on hybrid bus devices

This commit updates the Primary Page Table (PPT) initialization to use
CMEM-specific write operations on hybrid bus devices. It also propagates
errors from these CMEM writes during PPT and partner copy cache
initialization, aborting MLO setup if a failure occurs.

> diff --git a/drivers/net/wireless/ath/ath12k/dp.c b/drivers/net/wireless/=
ath/ath12k/dp.c
> index 83f9edfabf696..6cf254b2d2a78 100644
> --- a/drivers/net/wireless/ath/ath12k/dp.c
> +++ b/drivers/net/wireless/ath/ath12k/dp.c
[ ... ]
> @@ -1328,24 +1328,38 @@ static int ath12k_dp_cmem_init(struct ath12k_base=
 *ab,
>  	}
> =20
>  	/* Write to PPT in CMEM */
> -	for (i =3D start; i < end; i++)
> -		ath12k_hif_write32(ab, cmem_base + ATH12K_PPT_ADDR_OFFSET(i),
> -				   dp->spt_info[i].paddr >> ATH12K_SPT_4K_ALIGN_OFFSET);
> +	for (i =3D start; i < end; i++) {
> +		addr =3D cmem_base + ATH12K_PPT_ADDR_OFFSET(i);
> +		val =3D dp->spt_info[i].paddr >> ATH12K_SPT_4K_ALIGN_OFFSET;

[Severity: High]
Can this result in an out-of-bounds array read on hybrid bus MLO devices?

The loop limits start and end are derived from the current device's
profile (ab->profile_param->dp_params). However, the array being indexed,
dp->spt_info[i], belongs to the partner device.

On systems with mixed-bus MLO configurations (like an AHB radio and a PCI
radio in the same MLO group) and constrained memory, the devices might have
different memory profiles. For example, if the AHB device has the DEFAULT
profile but the PCI partner is using the LOW_512_M profile, the AHB device
will calculate a larger end value than the size of the partner's allocated
spt_info array.

Does this mean the loop will read past the end of the spt_info array and
write garbage memory values to the device's CMEM Primary Page Table?

> +
> +		if (ab->hw_params->hybrid_bus_type) {
> +			ret =3D ath12k_hif_cmem_write32(ab, addr, val);
> +			if (ret)
> +				return ret;
> +		} else {
> +			ath12k_hif_write32(ab, addr, val);
> +		}
> +	}
> =20
>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016-mpp-bringu=
p-v2-0-f510c33bfcf5@oss.qualcomm.com?part=3D13
