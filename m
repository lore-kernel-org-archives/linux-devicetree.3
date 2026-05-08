Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B859E12CD8B
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 23:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778282420; cv=none; b=tTEwOTHaH3+Y49JF+QFYxwbDjKqOwi9JNLSvXyVFg2TFp3DIoZPAaC6SoKXsRwRfgzM2RP3DDQ24jjKJ5wuvfWAJoL3RA+KTUYULnMHWOFO26boNC/YDew7Qm+45bZMiMJF3unDkaYMZFThBrwne9XY69Eb3SRIc0PkBko1EXWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778282420; c=relaxed/simple;
	bh=ZpX9gSsFT61HAN9jWXKd1sF/9Pt7qOSWD4DBCjrr9vU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oIgOVVKCjU7UzyATtpzJiWsWYp9jp9lXjnnOdKEDfGGpwspoiUPrJC76uUpYUHusjEucN+Jzs3nzVbZCMC+Y6qQ0PPdllXwWbiBABJILQIfV2fB1RIWz1Vih/WvKVW8WngRtwnksQGjNSW08zrluepaNvQ4AJGMjbVbnBA6QoJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e7pKg+Co; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e7pKg+Co"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B18B1C2BCB0;
	Fri,  8 May 2026 23:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778282420;
	bh=ZpX9gSsFT61HAN9jWXKd1sF/9Pt7qOSWD4DBCjrr9vU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=e7pKg+Co+2NEW6VTP3Qrx/YPqyU3BRFxQ1CwOSnCrYMlcDfmyWOYJ5HraYd650Ewy
	 S8Eamy0c68B0ABeMuGYBQQodq5K+yPkEcn22/UBvmmMVwsjBx1JW19XM9FXmSqXI3T
	 TEUY2rLhIljmc+5g+a4eQK2lffqO043mTtrk3FpwPJqNdVCq6uIqy/cpcAQrbuda7m
	 j56CecECzTnr8hpxzsUw1IPtN+qBiQ4MhIlgMblxg9skc+BYifPJiLpAo6dwXugydP
	 mwlUB7UpoTPWopZ5NCPtRRTsDXnE8t5gdeqHF0rz7ujZ4Z+Lr9f5jhZwMlrmZzrbxl
	 mlhJ/JcNc5hXA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 01/14] media: iris: Add iris vpu bus support
Reply-To: sashiko@lists.linux.dev
To: "Vishnu Reddy" <busanna.reddy@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260509-glymur-v5-1-7fbb340c5dbd@oss.qualcomm.com>
References: <20260509-glymur-v5-1-7fbb340c5dbd@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 08 May 2026 23:20:18 +0000
Message-Id: <20260508232019.B18B1C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] Missing explicit inclusion of `<linux/slab.h>`.
- [Low] Unchecked return value of `dev_set_name()` obscures memory allocati=
on failures.
--

commit 98f1237fb4e4382526cb267a03ee922744bc30d4
Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

media: iris: Add iris vpu bus support

This commit introduces the iris-vpu-bus to create a dynamic child device
for firmware loading, setting up a dedicated IOMMU context with a separate
stream ID.

> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_bus.c b/drivers/me=
dia/platform/qcom/iris/iris_vpu_bus.c
> new file mode 100644
> index 0000000000000..15ba4d9c563e9
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_bus.c
> @@ -0,0 +1,69 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <linux/device.h>
> +#include <linux/iris_vpu_bus.h>
> +#include <linux/of_device.h>

This isn't a bug, but should linux/slab.h be explicitly included here?

The implementation uses slab allocator functions like kzalloc_obj() and
kfree(), and relying on implicit inclusion could lead to build breakages on
different architectures or in future kernel versions.

[ ... ]

> +struct device *create_iris_vpu_bus_device(struct device *parent_device, =
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
> +	dev->release =3D release_iris_vpu_bus_device;
> +	dev->bus =3D &iris_vpu_bus_type;
> +	dev->parent =3D parent_device;
> +	dev->coherent_dma_mask =3D dma_mask;
> +	dev->dma_mask =3D &dev->coherent_dma_mask;
> +
> +	dev_set_name(dev, "%s", name);

Is it safe to ignore the return value of dev_set_name() here?

If memory allocation fails, dev_set_name() returns -ENOMEM and leaves the
device name as NULL. The subsequent call to device_register() handles this
gracefully by returning -EINVAL rather than propagating the original -ENOME=
M.

While this does not cause a crash, could dropping the accurate error code
obscure the root out-of-memory cause during debugging?

> +	dev_set_drvdata(dev, (void *)iommu_fid);
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260509-glymur-v5-=
0-7fbb340c5dbd@oss.qualcomm.com?part=3D1
