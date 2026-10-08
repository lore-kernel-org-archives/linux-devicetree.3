Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ADA03C4B83
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 10:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791455745; cv=none; b=AFkS8BP3IXwu3POa89mklATplYilp51I2bD+ySMJgeAyZ3haJZFqf/0lnlHMpc7x53VojldRByDFhmhG+n61dkT1xcwGPog83kW1JwPdTmSPz2PmCWT5soEiPPWMLhlVqbiWk9gb/BQUGt+I0m3I5FkxhBkT8aHf+RjZHNSfogo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791455745; c=relaxed/simple;
	bh=/99YnXz0hMHhEeF49OGLTGJFkAeScXQhHIyoBDVEfVg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=e8Fwo/LghSgR3HFBQDvNYxbUKwNUMmJg+Ev4xLdtEuVaMCliYJ+fBN2WHmDIWBELRmIOdjzHxpxwctx090+w7LkNYkBjjYelB4SBqws4LYXJtuIR3+ZJsXC531rkIAFcpNGamt4lUkdKrpLsiWAsmN5ltPHK0Bh1bJBnZwQXyqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LZVXpB4G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LZVXpB4G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 658EE1F000FF;
	Thu,  8 Oct 2026 10:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791455743;
	bh=WaiRw9Fttx6BET5XeS/zlUAdVNYQsGxSfBEZ/QtKQjo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LZVXpB4GNSoWHHXo5V5H/W1loyJ6o+pNrcusx29qQYFq9sxP8hIo1qBdaMb/DFfUd
	 wILqDc4vdN0Ee/RaHei9qPGwjCVLI68Ah9gWDltg1RllfSGzU4HFbXhNlXiJw2dQX4
	 E/KV1MRQdVAyDYg3ao6cgAueWYxjizcgnm7LrCRZeucwKCCZL/+Dqgm19ebTbzzn5T
	 oZj58a7DYE5DLhAawwJ6Cod78XtughgtlKbR13fOfQiGvYUCljjejtWp7eij+ugR0j
	 oEaV6zRnREyQMD1gfBdos/MssBbi3Yiz0nazvcvdobB46AoXcOTpYVuXGDZeWafh6q
	 mbLyqdLVKHsUw==
Message-ID: <sashiko-outbox-164021@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH ath-next 09/17] wifi: ath12k: add support for unified
 data-region memory allocation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aaradhana Sahu" <aaradhana.sahu@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20261008-mpp_bringup-v1-9-2c5797b5e4ac@oss.qualcomm.com>
References: <20261008-mpp_bringup-v1-0-2c5797b5e4ac@oss.qualcomm.com>
 <20261008-mpp_bringup-v1-9-2c5797b5e4ac@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 10:35:42 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] wifi: ath12k: qmi target mem data-region misallocation
--

commit 889e203c71e56c91154908ff956ce486dc098cf4
Author: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>

wifi: ath12k: add support for unified data-region memory allocation

Add support for devices such as QCN6432 that provide the M3 and
calibration memory through a unified data-region reserved-memory node.
If the data-region is found, allocate each memory chunk from it sequentiall=
y.

> diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless=
/ath/ath12k/qmi.c
> index 817bd820623d2..cc488cfe2b2fb 100644
> --- a/drivers/net/wireless/ath/ath12k/qmi.c
> +++ b/drivers/net/wireless/ath/ath12k/qmi.c

[ ... ]

> @@ -2851,6 +2871,48 @@ static int ath12k_qmi_assign_target_mem_chunk(stru=
ct ath12k_base *ab)
>  	const char *rname;
>  	int i, idx, ret;
> =20
> +	ret =3D of_reserved_mem_region_to_resource_byname(np, "data-region", &r=
es);
> +	if (ret && ret !=3D -ENODATA)
> +		return ret;
> +
> +	if (!ret) {
> +		avail_rmem_size =3D resource_size(&res);
> +		for (i =3D 0, idx =3D 0; i < ab->qmi.mem_seg_count; i++) {
> +			chunk =3D &ab->qmi.target_mem[i];
> +
> +			if (chunk->type =3D=3D CALDB_MEM_REGION_TYPE) {
> +				ret =3D ath12k_qmi_map_target_mem(ab, idx, 0, chunk->size,
> +								chunk->type);

[Severity: High]
The commit message indicates that calibration memory is allocated sequentia=
lly
from data-region. However, paddr 0 is passed here and the region's offset is
not consumed. Is CALDB intended to be allocated from the data-region or
mapped to 0?

> +				if (ret)
> +					goto out;
> +
> +				idx++;
> +				continue;
> +			}
> +
> +			if (offset > avail_rmem_size ||
> +			    avail_rmem_size - offset < chunk->size) {
> +				ath12k_err(ab, "failed to assign mem type %u req size %u avail size =
%zu\n",
> +					   chunk->type, chunk->size,
> +					   offset > avail_rmem_size ? 0 :
> +					   avail_rmem_size - offset);
> +				ret =3D -EINVAL;
> +				goto out;
> +			}
> +
> +			ret =3D ath12k_qmi_map_target_mem(ab, idx, res.start + offset,
> +							chunk->size, chunk->type);

[Severity: High]
This loop maps every chunk type (other than CALDB) sequentially into the
data-region without filtering by chunk type.

Since the commit message states the device tree continues to provide
separate q6-region and mlo-global-mem regions, won't this incorrectly map
types like HOST_DDR_REGION_TYPE and MLO_GLOBAL_MEM_REGION_TYPE into the
data-region instead of their dedicated DT regions?

> +			if (ret)
> +				goto out;
> +
> +			offset +=3D chunk->size;
> +			idx++;
> +		}
> +
> +		ab->qmi.mem_seg_count =3D idx;
> +		return 0;
> +	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008-mpp_bringu=
p-v1-0-2c5797b5e4ac@oss.qualcomm.com?part=3D9
