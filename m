Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B3D381B1A
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 06:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781074498; cv=none; b=gcM/B7jOOMyTJ5Qa615W3FSjLLLXW/fOz3TJua0RX1oSiLx7LCDM7pxwLDj0C5JgbTdWLoapi3IOlfLgBcJfdESlaI7o9XzGSKRI8TsdgHeWK5EKiL8H1IY7rFJa/D7jtESR8v8NUbsKOrBXmyOoA2zWbzCvteMV1Q8Iu5S+JOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781074498; c=relaxed/simple;
	bh=NVoURKRVh33P62vqJE9I+6L/WUDRPlODtsEbO47jlvE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kXB0kxpSjuvdzvX5AZbCulTjBxNk9eZfpD6ggZ39j5Hjvuw/c+/CUxCv3dX2OhHdBmAH8KozJ2meID9fR2eweLkwPqIWYAKY5mhKmIa0p1gaWiZ+je/xG+Zkc2QH3ip8MxKAtHGmDjcyqNffgQHICRj7P6lsbtGoFBUx2ZFVchE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NbuDdud/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NbuDdud/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CDD61F00893;
	Wed, 10 Jun 2026 06:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781074496;
	bh=ikrguXbVKc/2AsjLzH1RkkAPFS8ZNYbBq/yYwxDESw4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NbuDdud/sNhTyLnWKePrTdJ7/naT8+dkSxiU+bITEZo+ilmK/FCL7UXI5+GkaaY7L
	 oGBgL2/Cf3BWehw6DeQM+Fv8oUzUz7tegaN9gtd3EeX74HzYXOLCLi0i2YryFqaXWm
	 5jAU0bNz9+qVfzyBlPjXrgHZ7zVZCrvB9SWV7BsIuto0L7ZlbqcvEiLbIruWHwgUxo
	 ogh107rIkwN0uz3VJFrVaTuLPWTsm5Vl2/MlUKdBRPHhzhNNOxEM9mU19WZnqmpevO
	 99I9OA27c14+giNA413ciKim0Sl9WK1lk5KRKblTWYgufrHGlJTEFrNNY4V2uw6Ce4
	 XpfBB/ro88YRw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 10/12] media: iris: Add platform data for glymur
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vishnu Reddy" <busanna.reddy@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260610-glymur-v8-10-1c79b9d51fc0@oss.qualcomm.com>
References: <20260610-glymur-v8-10-1c79b9d51fc0@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 06:54:56 +0000
Message-Id: <20260610065456.9CDD61F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The local stack variable `fw_fid` is passed by reference to `iris_=
vpu_bus_create_device()`, which stores its address in the persistent device=
's `platform_data` field, leading to a dangling pointer when the function r=
eturns.
- [High] The `core->fw_dev` pointer is not set to NULL after the context ba=
nk device is unregistered in `iris_glymur_deinit_cb_devs`, causing Use-Afte=
r-Free and Double Free vulnerabilities.
--

commit ca3d38405759f1b57b41c987f0bd9782975ce278
Author: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

media: iris: Add platform data for glymur

On glymur platform, the iris core shares most properties with the
iris core on the SM8550 platform. This patch adds glymur specific
platform data, reusing SM8550 definitions wherever applicable.

> diff --git a/drivers/media/platform/qcom/iris/iris_platform_glymur.c b/dr=
ivers/media/platform/qcom/iris/iris_platform_glymur.c
> new file mode 100644
> index 0000000000000..c42ac99870ede
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_platform_glymur.c
[ ... ]
> +int iris_glymur_init_cb_devs(struct iris_core *core)
> +{
> +	u64 dma_mask =3D core->iris_platform_data->dma_mask;
> +	const u32 fw_fid =3D IOMMU_FID_IRIS_FIRMWARE;
> +	struct device *dev;
> +
> +	dev =3D iris_vpu_bus_create_device(core->dev, "iris-firmware", dma_mask=
, &fw_fid);

[Severity: High]
Is it safe to pass a pointer to the local stack variable fw_fid here?

Looking at iris_vpu_bus_create_device(), the pointer is assigned directly
to dev->platform_data without copying the underlying value:

iris_vpu_bus_create_device() {
    ...
    dev->platform_data =3D (void *)iommu_fid;
    ...
}

Since fw_fid is allocated on the stack in iris_glymur_init_cb_devs(), won't
dev->platform_data become a dangling pointer once this function returns?

If the IOMMU configuration is deferred and reprobed later via=20
bus_iommu_probe(), the bus's dma_configure callback might dereference=20
dev->platform_data and read stack garbage.

> +	if (IS_ERR(dev))
> +		return PTR_ERR(dev);
> +
> +	if (device_iommu_mapped(dev))
> +		core->fw_dev =3D dev;
> +	else
> +		device_unregister(dev);
> +
> +	return 0;
> +}
> +
> +void iris_glymur_deinit_cb_devs(struct iris_core *core)
> +{
> +	if (core->fw_dev)
> +		device_unregister(core->fw_dev);

[Severity: High]
Should core->fw_dev be set to NULL after unregistering the device?

If the driver's core initialization is invoked again and=20
iris_glymur_init_cb_devs() is called, but device_iommu_mapped(dev) is false=
,=20
the newly created device is unregistered without overwriting core->fw_dev.

This could leave a stale pointer in core->fw_dev. If the core initialization
sequence proceeds to load the firmware, could it use the stale core->fw_dev
pointer, or result in a double free if iris_glymur_deinit_cb_devs() is=20
called again on the failure path?

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610-glymur-v8-=
0-1c79b9d51fc0@oss.qualcomm.com?part=3D10
