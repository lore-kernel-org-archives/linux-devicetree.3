Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335FC3EF0CD
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 22:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778883841; cv=none; b=h1yL/3Fh+PD42dUMrLSb+b8BIvDNxK8+ESdFJz1C5cXdJl+/EaI/mEjk6bOY/QMD4LPYLl9MhaVpR+jj0QJO3eNh7iZdZ/+Wvt9HIRydySjlKDnvMyN3Dn81RKuJkVT+se6bvuR57dkB1nB91u09K8Fy7LmxFEjUhX1psiHL9Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778883841; c=relaxed/simple;
	bh=WiM+3nnE0C8jBviZJpFe56RwNJ9zTsjxxfK65MAuTVA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sO89oEid5q0n4JpEy7q7gPUyv0mw5z5gpmrVr1tUzgz1Prl8BI0m8L7Dvee+yjM3aoczAGdvISRk3S1CI0xVaJk/oYeIbnL72V2w1EW+o7dPyvV5kmNwVVRy9YmwQiHeOlbStFK3nVT5XIw5KMeupJBi+SVLaykxi8GqzYaq/cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a6xA+t7k; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a6xA+t7k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDDB7C2BCB0;
	Fri, 15 May 2026 22:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778883841;
	bh=WiM+3nnE0C8jBviZJpFe56RwNJ9zTsjxxfK65MAuTVA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=a6xA+t7k5NS3wg5fr1XWt82y6PNEoy+DSHLRTBebsovSAFWucFIbuiTfQsRbc4KOj
	 /drV1mLQDtX2IOr+YBe6tf2dZ8LBoMc62zBnB8ybIO+hwliM6cfS9QlTXclTSKNOBY
	 1hV50YCojlFPCLolb5Y+dlpGNn+5JEnWQHQ5njfr98Qw5QjABavxL0ycrBXsmrBI2R
	 FVpn2NeeD/9ThN1HTy6TKlxojDi4TYfvB16Exn9QJPvZt7GW+kmrDTj8jhLenjW/QR
	 rMHjA1TGr5JvfFQqJERuFP+POB7jGe9MJd1ALW8X+GR/mAY9cQMFShmPsI2Tk/EsJe
	 N3X0344U63wSQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 05/10] mfd: sec: set DMA coherent mask
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kaustabh Chakraborty" <kauschluss@disroot.org>
Cc: krzk+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260516-s2mu005-pmic-v7-5-73f9702fb461@disroot.org>
References: <20260516-s2mu005-pmic-v7-5-73f9702fb461@disroot.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 22:24:00 +0000
Message-Id: <20260515222400.CDDB7C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Shared dma_mask pointer across MFD child devices causes a data r=
ace and violates DMA API contracts.
--

commit cc615ed9ba9013f030c19361a7a4d79aad2e467d
Author: Kaustabh Chakraborty <kauschluss@disroot.org>

mfd: sec: set DMA coherent mask

This commit manually sets the coherent DMA mask to 0 and points the device's
dma_mask to it. This is intended to suppress "DMA mask not set" warnings
for sub-devices, as the device does not use DMA for communication.

> diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
> index 22f6c74eb6c0e..fe92bc4a3dd26 100644
> --- a/drivers/mfd/sec-common.c
> +++ b/drivers/mfd/sec-common.c
> @@ -221,6 +221,9 @@ int sec_pmic_probe(struct device *dev, int device_typ=
e, unsigned int irq,
>  	if (IS_ERR(irq_data))
>  		return PTR_ERR(irq_data);
> =20
> +	dev->coherent_dma_mask =3D 0;
> +	dev->dma_mask =3D &dev->coherent_dma_mask;

When the MFD core adds child devices via mfd_add_device(), it copies the
parent's dma_mask pointer to the child devices:

    pdev->dev.dma_mask =3D parent->dma_mask;

Because sub-devices for this PMIC probe asynchronously, they can concurrent=
ly
execute platform_dma_configure(), which eventually calls of_dma_configure_i=
d()
and performs a lockless read-modify-write:

    *dev->dma_mask &=3D mask;

Since all child devices share the same dma_mask pointer referencing the
parent's coherent_dma_mask, does this cause an unsynchronized data race on
the parent's memory?

Additionally, sharing a single dma_mask pointer across multiple devices bre=
aks
the driver model. If any child device were to legitimately call dma_set_mas=
k(),
wouldn't it silently overwrite the DMA mask for all sibling devices?

Finally, manually modifying device structures to fake an invalid mask of 0
bypasses DMA subsystem validation. Helpers like dma_coerce_mask_and_coheren=
t()
explicitly reject a mask of 0. Is manually assigning 0 here the recommended=
 way
to suppress the warning?

> +
>  	pm_runtime_set_active(sec_pmic->dev);
> =20
>  	switch (sec_pmic->device_type) {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260516-s2mu005-pm=
ic-v7-0-73f9702fb461@disroot.org?part=3D5
