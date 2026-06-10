Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269411898FB
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 06:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781073977; cv=none; b=Z4ZFLo/HRayBCrpdiRpBsVEW+hwNb9a6aAewCiIShW2cdspvA+VHBIlUA/7zSxFb8+WSzVfGN3nVqUE84awK35/RbvTCG1a+ciTiWzhHy8EicLwHlar6/JO5mqyW0bc3lrc8NB/jOk/LQEtx6QUMhm2dJJ4z5xegbAIYUQ+Gtjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781073977; c=relaxed/simple;
	bh=ccN/t+DoounO5220zkYwyhgDo1QfucdMw8x55CqFe6Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OoMGNzCDqA1+TMsyHCXRgCyMDL8Y0fu9mclh5n4QWhiLxbefePMOzOXajvn5VJv0dkTARw+VYbZou3GOezMi/MCoC6L6nrTMHN0PCEZm7254qi8AWxlqKb8naCTcKTUMYsWG4gdj4f6otL4k401TbThTyAgGb9YDESZIK9Vztmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J0A03COZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J0A03COZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 888111F00893;
	Wed, 10 Jun 2026 06:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781073975;
	bh=Lb8zxmNoJRsaxUkukGhNG3WOIdV2RhPiJzxWxjpGHeU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=J0A03COZm6u2pyPpFkQFJWuJuaRLIU+fEJKKjn2pu3Xghd5gUFVFv3OBBBGJoGy/z
	 75/zE7VYsm8i8ZlrLhcy/dInI1umuXCsZScnPLK57kfp4+Eajf7W8TV9eBeTXgh822
	 PBxIv6JuUTxIZjv3Mz75mzYzOmxomlvHAEu6ufbhTtktJcGDBd/yvolZU/ess7imOB
	 Bb1FbVP1ckZm64UJI1A4LP073VZ0KYV/dzMVQBfKMHl0OqNcFUd1pfkXW/pDIHXsrf
	 tvWwOmL2wKy9dSPXnptOU+H4z7391bbuJ8l/oJBQgOPsJb1jmQskf/HGTJBHVz1AzW
	 pdnSHlJq0dBvg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 01/12] media: iris: Add iris vpu bus support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vishnu Reddy" <busanna.reddy@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260610-glymur-v8-1-1c79b9d51fc0@oss.qualcomm.com>
References: <20260610-glymur-v8-1-1c79b9d51fc0@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 06:46:15 +0000
Message-Id: <20260610064615.888111F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Unsafe lifetime assumption for `platform_data` exposes a use-after=
-free vulnerability during IOMMU deferred probing.
--

commit 9a991f2d1e4dce862e38d602c5406c132a0d5307
Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

media: iris: Add iris vpu bus support

On glymur platform, firmware loading needs a separate IOMMU mapping with
its own stream ID. This stream ID is defined in the device tree with the
associated firmware function ID in the iommu-map property. To create this
mapping, a separate child device is needed so the firmware memory can be
isolated in its own IOMMU context.

> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_bus.c b/drivers/me=
dia/platform/qcom/iris/iris_vpu_bus.c
> new file mode 100644
> index 0000000000000..e3327b227332a
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_bus.c
> @@ -0,0 +1,61 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <linux/device.h>
> +#include <linux/iris_vpu_bus.h>
> +#include <linux/of_device.h>
> +#include <linux/slab.h>
> +
> +static int iris_vpu_bus_dma_configure(struct device *dev)
> +{
> +	const u32 *iommu_fid =3D (const u32 *)dev_get_platdata(dev);
> +
> +	return of_dma_configure_id(dev, dev->parent->of_node, true, iommu_fid);
> +}

[ ... ]

> +struct device *iris_vpu_bus_create_device(struct device *parent_device, =
const char *name,
> +					  u64 dma_mask, const u32 *iommu_fid)
> +{
> +	struct device *dev;
> +	int ret;
> +
> +	dev =3D kzalloc_obj(*dev);
> +	if (!dev)
> +		return ERR_PTR(-ENOMEM);
> +
> +	dev->release =3D iris_vpu_bus_release_device;
> +	dev->bus =3D &iris_vpu_bus_type;
> +	dev->parent =3D parent_device;
> +	dev->coherent_dma_mask =3D dma_mask;
> +	dev->dma_mask =3D &dev->coherent_dma_mask;
> +	dev->platform_data =3D (void *)iommu_fid;

[Severity: High]
Does this create a use-after-free risk during deferred probing?

If the caller (such as iris_glymur_init_cb_devs()) passes a pointer to a
local stack variable, and the IOMMU driver defers probe,
iris_vpu_bus_dma_configure() will be called again asynchronously when the
IOMMU driver initializes.

Since we store the raw pointer here instead of taking the value or copying
the data, could of_dma_configure_id() dereference invalid stack memory if
the caller's stack frame has already been popped?

> +	dev_set_name(dev, "%s", name);
> +
> +	ret =3D device_register(dev);
> +	if (ret) {
> +		put_device(dev);
> +		return ERR_PTR(ret);
> +	}
> +
> +	return dev;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610-glymur-v8-=
0-1c79b9d51fc0@oss.qualcomm.com?part=3D1
