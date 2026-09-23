Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D964F96A7
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 12:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790165934; cv=none; b=MHUyfJGYI/Lw0+T/BSPMzmlFCnMXh+zuyk7poSJZmqYhVoFayOOUxIELOKNClTN3Zn3dM45BTFyjMJRqG3QRFEfQ9vSTdjpUwIR5ggkEZ1SnedlW7EtUzZLa01su4RZniietZR+eBZrZP7h3rfuVnx1LVc9IDMuRTp1717Qgaa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790165934; c=relaxed/simple;
	bh=darqasifXyeQ5xfW7CFg3SB13M5MRv8CxX1sJGfDNag=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lCZmQ6tjn4RSv9WkcnmsBi1jZdTpQ9IdnXJrUUu0yj/3if5zeMRsqE6kOefwUg0HTRZQLsE1IintTVja50cQ+6L+Z5tVYzxfUU2w46jHXKFnxYFtPh4xhgV5PJDDQUiyP2d1WZ2rKkqW6YQhP+4l1vOc0yTMmiCF7qnuWN2TBG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hf/y6WvR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hf/y6WvR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65A811F000FF;
	Wed, 23 Sep 2026 12:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790165932;
	bh=OwJdSwG3d3o3bZrru0D4fXZLobkwF8Tx+67W155QNUI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Hf/y6WvRMHkm1z+4Ra9dp670FkXgL2QTZDkq4vHQ4P/U8ABp6zdGui9+lTudRk7XX
	 BhoJx9ZpAFbNisDmr/3x8LyC9QOU/GWzw12xt5XVVPe0PD1xQ5uHXnwPQIG9gw0E1N
	 BYvgFAn8lGjeaNEmYK6iFXJWVJO93s7hvBTVHDnbwc3u1leaatNBeS3Tx2rpiih+O5
	 EOV1/UwSTcOVNM7Skn8g0NLww1zVkng7/Rgs9nmBurYuQcZDzsvOTII9gBUmQ2GH++
	 LVjmVUfnwo8ObQPv7fKJRDhRHRnpwOXlosFm6qTvlq2ysK4R78atz74QhKwTTaZ8my
	 vJxTHreyB6G5A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH ath-next 05/16] wifi: ath11k: Add ability to set BDF and
 M3 dump memory addresses
Reply-To: sashiko-reviews@lists.linux.dev
To: "George Moussalem" <george.moussalem@outlook.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260923-ipq5018-qcn6122-mpd-v1-5-86729521a75c@outlook.com>
References: <20260923-ipq5018-qcn6122-mpd-v1-0-86729521a75c@outlook.com>
 <20260923-ipq5018-qcn6122-mpd-v1-5-86729521a75c@outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 12:18:51 +0000
Message-Id: <20260923121852.65A811F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] wifi: ath11k: CALDB memory mapping corrupted by shared 'res' varia=
ble clobbering
- [High] wifi: ath11k: BDF and HOST_DDR memory regions overlap at the same =
physical address
--

commit 12078c78e9f034dda1106d3aea7be9725dcdf38d
Author: George Moussalem <george.moussalem@outlook.com>

wifi: ath11k: Add ability to set BDF and M3 dump memory addresses

This commit adds the ability to look up reserved memory regions from the de=
vice
tree and use those addresses for the BDF and M3 dump instead of relying on
hardcoded hardware parameter values.

> diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless=
/ath/ath11k/qmi.c
> index bd81e8d3d5f7d..771ef9b5304f2 100644
> --- a/drivers/net/wireless/ath/ath11k/qmi.c
> +++ b/drivers/net/wireless/ath/ath11k/qmi.c
[ ... ]
> @@ -2073,7 +2112,11 @@ static int ath11k_qmi_assign_target_mem_chunk(stru=
ct ath11k_base *ab)
>  			idx++;
>  			break;
>  		case BDF_MEM_REGION_TYPE:
> -			ab->qmi.target_mem[idx].paddr =3D ab->hw_params.bdf_addr;
> +			ret =3D ath11k_qmi_reserved_memory_to_resource(ab, BDF_MEM_REGION_TYP=
E, &res);

[Severity: High]
Does overwriting the shared 'res' variable here (and later in the
M3_DUMP_REGION_TYPE case) corrupt the mapping for CALDB_MEM_REGION_TYPE?

If the firmware requests M3_DUMP_REGION_TYPE or BDF_MEM_REGION_TYPE before
CALDB_MEM_REGION_TYPE, 'res' will be overwritten. When CALDB_MEM_REGION_TYPE
is subsequently processed in ath11k_qmi_assign_target_mem_chunk(), it
calculates its physical address using the shared 'res' variable:

    ab->qmi.target_mem[idx].paddr =3D res.start + host_ddr_sz;

This would incorrectly use the clobbered region's base address (such as the
m3-dump address) instead of the HOST_DDR base address, mapping CALDB to an
invalid physical address.

> +			if (!ret && !(ab->qmi.target_mem[i].size > resource_size(&res)))
> +				ab->qmi.target_mem[idx].paddr =3D res.start;

[Severity: High]
Does this cause the BDF memory region to overlap exactly with the HOST_DDR
memory region?

Both HOST_DDR_REGION_TYPE and BDF_MEM_REGION_TYPE are mapped to the "q6-reg=
ion"
memory space. By assigning res.start directly without any offset, the BDF
memory region would start at the exact same physical address as the HOST_DDR
chunk.

Previous hardware applied a hardcoded offset for the BDF address to separate
it from the HOST_DDR base, which is intended for firmware code and data.

> +			else
> +				ab->qmi.target_mem[idx].paddr =3D ab->hw_params.bdf_addr;
>  			ab->qmi.target_mem[idx].iaddr =3D NULL;
>  			ab->qmi.target_mem[idx].size =3D ab->qmi.target_mem[i].size;
>  			ab->qmi.target_mem[idx].type =3D ab->qmi.target_mem[i].type;
[ ... ]
> @@ -2107,6 +2150,16 @@ static int ath11k_qmi_assign_target_mem_chunk(stru=
ct ath11k_base *ab)
>  			ab->qmi.target_mem[idx].type =3D ab->qmi.target_mem[i].type;
>  			idx++;
>  			break;
> +		case M3_DUMP_REGION_TYPE:
> +			ret =3D ath11k_qmi_reserved_memory_to_resource(ab, M3_DUMP_REGION_TYP=
E, &res);

[Severity: High]
Could this also clobber the shared 'res' variable in the same way as the
BDF_MEM_REGION_TYPE case, causing the identical memory corruption issue for
CALDB_MEM_REGION_TYPE?

> +			if (!ret && !(ab->qmi.target_mem[i].size > resource_size(&res))) {
> +				ab->qmi.target_mem[idx].paddr =3D res.start;
> +				ab->qmi.target_mem[idx].iaddr =3D NULL;
> +				ab->qmi.target_mem[idx].size =3D ab->qmi.target_mem[i].size;
> +				ab->qmi.target_mem[idx].type =3D ab->qmi.target_mem[i].type;
> +				idx++;
> +			}
> +			break;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923-ipq5018-qc=
n6122-mpd-v1-0-86729521a75c@outlook.com?part=3D5
