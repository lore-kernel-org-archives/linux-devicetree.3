Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F100828CF5F
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 14:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788964214; cv=none; b=nkgkdr+SH6e1ogVkN7ALjHApQ3x5Ns8P0i8h6kwBWUUqoakB4CuOem6AN3modhqryl4L2wJuUYq4d/F4L0p0YN3tK0SM5YKRQTclLcM3YnEozck6+uO/b7mc1mPbk6UdgMAo6PCtJ+fCPwKrlLs9wdGXxuH0nHRhn97lhn4zLKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788964214; c=relaxed/simple;
	bh=0YFMnqGw9bccI8KxwbFpJ1xieBxNwfdIRimleiGYpy4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TZbDac8KLv7sgZuuG+eKleDQrNpFW5sLfnyDQ0Q6z6YZdLtP3mVJ2hDI7luUaaZzcUzIHVWXeLoahHFWPVeyJlthRNlbpKRE0p2D1sHOSs95e3IPZ6+WnM4wII2i/sCZpFxUMgA5C2Ojqldmq6zdchSq6GcBrapeRg+nqJKgGK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dbic1zN6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dbic1zN6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D40D1F00A3D;
	Wed,  9 Sep 2026 14:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788964212;
	bh=ogSuoMuUB5O+EyKQBHSypvvboaepaSh6PbdbluLI6os=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Dbic1zN6ygFr7bdlW1ho5zWPcttCZF2vySe+avY2osxu9C/sEmZKVi4jlxj1nQiys
	 eruIbhiBQiUHp+bSivFjolyD46BpqQhbhR4JlaKPXmhdJBQudfTcQ85uJ+WSjz6KUs
	 cKp+RBDW5Qvf1luB4IXLBkR96K+YvzoRacuxp1iLSyfo/PtKUF01vtMIhyfofCvKch
	 xbjxUROzGeTN+pNCNUepU9WaRUjm/VQaWpJyLNeksJ2BLoxdH+lmWXuSWmTmYTwdeP
	 PZ3j1YZva58uKIacduvbMyL6C208lhvrtvPyr7czw/1F0hsgVq7iANy5bxqgHVzQgn
	 iguO/g8AnLvVQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] iommu/mediatek-v1: fix IOMMU device binding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Roman Vivchar" <rva333@protonmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260909-6572-iommu-v1-2-de261da09fb2@protonmail.com>
References: <20260909-6572-iommu-v1-0-de261da09fb2@protonmail.com>
 <20260909-6572-iommu-v1-2-de261da09fb2@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 14:30:12 +0000
Message-Id: <20260909143012.8D40D1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Moving `mtk_iommu_v1_create_mapping()` into `mtk_iommu_v1_probe_fi=
nalize()` introduces a data race that can corrupt the shared IOMMU mapping =
and domain, leading to memory leaks and incorrect domain assignments.
--

commit 506d7ce15633b781671040d746cf03c5adc6f9ca
Author: Roman Vivchar <rva333@protonmail.com>

iommu/mediatek-v1: fix IOMMU device binding

The driver silently fails to bind devices, causing DRM to fall back to PA m=
ode.
This patch provides an of_xlate callback to properly bind devices and use VA
mode.

> diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
> index ac97dd2868d4b..72355f41c36af 100644
> --- a/drivers/iommu/mtk_iommu_v1.c
> +++ b/drivers/iommu/mtk_iommu_v1.c

[ ... ]

> @@ -519,9 +476,15 @@ static void mtk_iommu_v1_probe_finalize(struct devic=
e *dev)
>  	__maybe_unused struct mtk_iommu_v1_data *data =3D dev_iommu_priv_get(de=
v);
>  	int err;
> =20
> +	err =3D mtk_iommu_v1_create_mapping(dev);

[Severity: High]
Does moving the call to mtk_iommu_v1_create_mapping() into
mtk_iommu_v1_probe_finalize() introduce a data race?

Previously, this was called from mtk_iommu_v1_probe_device(), which executes
under the iommu_probe_device_lock.  By moving it here, it executes without
synchronization.

If two client devices of the same MTK IOMMU probe concurrently (e.g., via
asynchronous probing or deferred probe), they can race in
mtk_iommu_v1_create_mapping():

drivers/iommu/mtk_iommu_v1.c:mtk_iommu_v1_create_mapping() {
        ...
        data =3D dev_iommu_priv_get(dev);
        mtk_mapping =3D data->mapping;
        if (!mtk_mapping) {
                /* MTK iommu support 4GB iova address space. */
                mtk_mapping =3D arm_iommu_create_mapping(dev, 0, 1ULL << 32=
);
                if (IS_ERR(mtk_mapping))
                        return PTR_ERR(mtk_mapping);

                data->mapping =3D mtk_mapping;
        }
        ...
}

Can this lead to a memory leak of the initial mapping and DMA failures for
the racing client device, as it might get attached to a software domain
that does not match the hardware page tables?

> +	if (err) {
> +		dev_err(dev, "Can't create IOMMU mapping - DMA-OPS will not work\n");
> +		return;
> +	}
> +
>  	err =3D arm_iommu_attach_device(dev, data->mapping);
>  	if (err)
> -		dev_err(dev, "Can't create IOMMU mapping - DMA-OPS will not work\n");
> +		dev_err(dev, "Can't attach to IOMMU mapping - DMA-OPS will not work\n"=
);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909-6572-iommu=
-v1-0-de261da09fb2@protonmail.com?part=3D2
