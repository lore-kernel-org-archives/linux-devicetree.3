Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7D1331A66
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 03:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792121750; cv=none; b=t8D2JUEwgQnEUHq6FwkhxXTAItGhUhnc9KRIT6kec84AA2xL/gKxC5JjRz7CKcyoDSsQxBFvnv7mCQyZl1alzZ8pBfDcsC/yU5jq0eQT9DEx/IwlsPTboGrQtBWMZ1kZJ6lvA/+uUTLcsGkD+ThnqWOss3uCARSeSTMw6DGSrz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792121750; c=relaxed/simple;
	bh=p2bf+uKbnLz2859XZOFpg6upTjRL/4qhyCqpdIx63tI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=EQq+2XXDZR1wefDbwgj2hrSY0z90fR0XDzXo/2koM6/jwSylknOrxsEpbtEMcFsUrCmHWZfnc00qCJzHgGo1OdhMytQU1qVfeolXZlemD70Dad+nIPC4/ofFX5XXvIC8TArTRFGTYSS5kJA4vz+bBwIl+5yGcwNgzE8MBtRbgZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cuU0nGU6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cuU0nGU6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E84E81F000C4;
	Fri, 16 Oct 2026 03:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792121749;
	bh=2VVjx96MBJa+fOXRju1dumzIcwcEoEFjxUUJ5U6yucc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cuU0nGU6DIGvATzFa7BSEIJXD5mRfeOpFHDfsYjg0/YKhDKXWPoqrfzH4ajc769Wt
	 SfWdeDuI4lGUIEkfYBLC/VOum+GyboQryI4vRmrNhIN1UASfQ+fxM0myQ1fMq45cEL
	 gn2acNwDYSHjcpetsmOiMWY3OkgoSayi98osyfIBKS5/vKPyaEpsV8wZZD+jOFFCMl
	 LZaSm1g6gFht5UMLNTzr75rww11XPBF6zOjBUgG2tgD42WqRhsubYngzQEEbf1VcUj
	 URGFf/fvpMi0dXNeJ2392VGcv39EwGy64atLb+e9d+A88LPTHC7U1hV0EV14fbjwgt
	 kTUkeqN7+vufw==
Message-ID: <sashiko-outbox-173678@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH ath-next v2 09/17] wifi: ath12k: add support for unified
 data-region memory allocation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aaradhana Sahu" <aaradhana.sahu@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261016-mpp-bringup-v2-9-f510c33bfcf5@oss.qualcomm.com>
References: <20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com>
 <20261016-mpp-bringup-v2-9-f510c33bfcf5@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 03:35:48 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] ath12k: data-region loop incorrectly intercepts all memory chunk t=
ypes
--

commit 1f2202b158e5c8168f0cae90faae57bce35a9612
Author: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
wifi: ath12k: add support for unified data-region memory allocation

This commit adds support for devices that provide M3 and calibration
memory through a unified data-region reserved-memory node. If the
data-region lookup fails, it falls back to the existing per-memory-type
allocation scheme.

> diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless=
/ath/ath12k/qmi.c
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
The commit message states that only M3 and calibration memory should be
allocated from the unified data-region, while other segments continue to use
separate regions.

Since there is no check for the chunk type here, won't this unconditionally
map all memory segments (including HOST_DDR_REGION_TYPE, BDF_MEM_REGION_TYP=
E,
and MLO_GLOBAL_MEM_REGION_TYPE) sequentially from the data-region?

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

[Severity: High]
Because the function returns 0 here after iterating all requested memory
segments, does this entirely bypass the fallback code below that maps the
dedicated q6-region and mlo-global-mem regions?

Could this lead to device initialization failure if the data-region is
exhausted, or place hardware-specific memory segments at incorrect physical
addresses?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016-mpp-bringu=
p-v2-0-f510c33bfcf5@oss.qualcomm.com?part=3D9
