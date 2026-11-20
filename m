Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795173734;
	b=06wTWuNOpR3KcX3pEey5BSh2KGf7dK29nOnVD9lMFTNJXhoZoz7SfmlTgZ8eEBGNSopN
	 +TL0zWX3uYhE7iH4ZbHAwRz240it+3kmifn7BEJp+YWjDIPi5Bp74Y5Juwx4Tjo9B2gdj
	 Ry3588cyqYWLP8GzQA6WTM9SEkb+88ePsz0LPYi+oSuqv6gAhch20BzrLFaRWtcSbFItf
	 yZ/NeF5dR/oY8fB7mQ1GQ/14Y5S1BM0vRVDzVGql4uQZlopAvaTgmFqgqByeDI4s3sRX1
	 P3gkdgUSqRoTlkW+RPQONbkiI/s0+g/HGezDwo6Z5sT+yEmBnybFmU1QrvvRvbGp6lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795173734;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=qkaYmOc5zprxta5C+we+/uI0hc8dTb/jTKTBDNzGGIk=;
	b=iAvylmfrKhCASsbZEF6cxrMX7Lhz85BAQFHZD6FkAe/y0ga9xwiJU6FaG4SCorid22xS
	 NsA3aoHR8a9M2IiViGJmH/Nbb1SZMQHuk8muZ6A/med4B7shkKbgj2KUVFaH7+TMHn5L8
	 3FWBxdVKDeSyBdDjGjqL52fHYByvOpcFWWv+E8KKj1qG9sU0YgfB6p+CnymUfQAfxSjzD
	 xDPjW+KwtilOgUsOa0KTwbWb486IFfExfrOg6SArYg7lV4zreDIgAE7WbzXu1QF2bZbm8
	 vqFLpGTap70mGrd5CxD91lA9BsombLbpImOgdyUNhhjXKbIFk2eMNYlLRrTryLGcoCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JLg1te7k;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2FB9606A320
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JLg1te7k
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E970F1F000CF;
	Fri, 20 Nov 2026 11:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795173734;
	bh=qkaYmOc5zprxta5C+we+/uI0hc8dTb/jTKTBDNzGGIk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JLg1te7klw+0j0Ih1YjE9H1WrZC0U6JN1is8GOqjsxXYlpTFNQqiJJo6SYn710xCg
	 W1ogc0mxbmNdXeNWRZ7ft+hSISwXQjjzTizLmSLKzg34zv5WUBkm5oEuMBbhL8bocn
	 f9keJ/RcOYVIrkOikV9wClS7dL6dhmF+JMA4nutB6AOHkj786Z5kaaEIXttBY11G4S
	 6b9DiYBG4mkHmPJRSmlczhRZgeYSIfZOoBmYPghYiOLbJPqxIbKn3zio27DXf/9qDh
	 XEjDQ17JAqEjkN3ULuFp1w66cIsCWlOI1ZlkXibqu+wV1AIhchKka68m7u2QfUq6Qc
	 xlFsE0FXSC6vA==
Message-ID: <sashiko-outbox-225028@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 02/20] iommu/arm-smmu: Add interconnect bandwidth
 voting support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bibek Kumar Patro" <bibek.patro@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261120-smmu_interconnect_addition-v4-2-cab8ee8be0b3@oss.qualcomm.com>
References: <20261120-smmu_interconnect_addition-v4-0-cab8ee8be0b3@oss.qualcomm.com>
 <20261120-smmu_interconnect_addition-v4-2-cab8ee8be0b3@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 11:22:13 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] iommu/arm-smmu: clocks left disabled on
  arm_smmu_runtime_suspend() error
--

commit b1caf32a9685066e9285d960eef3db9abe048970
Author: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

iommu/arm-smmu: Add interconnect bandwidth voting support

This commit adds optional interconnect bandwidth voting for the Qualcomm
Adreno SMMU-500 implementation across probe, runtime PM, and shutdown.

> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/ar=
m-smmu/arm-smmu.c
> index 8d50a4ad221dd..f015985cbb8ef 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
[ ... ]
> @@ -2301,6 +2321,9 @@ static int __maybe_unused arm_smmu_runtime_suspend(=
struct device *dev)
> =20
>  	clk_bulk_disable(smmu->num_clks, smmu->clks);
> =20
> +	if (smmu->impl && smmu->impl->runtime_suspend)
> +		return smmu->impl->runtime_suspend(smmu);
> +
>  	return 0;
>  }

[Severity: High]
Does this leave smmu->clks disabled if smmu->impl->runtime_suspend() fails?

When runtime_suspend() returns a non-zero error from icc_set_bw(), the
runtime PM core (or arm_smmu_pm_suspend()) aborts the suspend and keeps
the device active while its clocks remain disabled, causing subsequent
register accesses to fault or hang and later suspend calls to underflow
the clock enable counts.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120-smmu_inter=
connect_addition-v4-0-cab8ee8be0b3@oss.qualcomm.com?part=3D2
