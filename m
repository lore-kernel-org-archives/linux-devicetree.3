Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853CC13A3ED
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 13:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783602609; cv=none; b=eJRkzpdzdy/wb5iqEv6tWcms+i/b68mc+qIdSflCUF1PCLtAYleABfDuMUTb2kxz9vIdAgYi3s2WQvUQzMczPUFh6gq2G3r+zvLPFUk1h8DrtFnp4OwrPYmULScCEnBBVXzCQmpnOgRlwsm2arK5+OO7RwRw/4QUEG/OOCD2ok4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783602609; c=relaxed/simple;
	bh=ZLRdBZlSrXwlBYOuk7qLD8bitklEOCr/u9mTBE5Kxfc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oq4kdpybKUjVxV/+xENkZjwePFt8/NpYZRmrKfPsDDYgRZB7IG1QFqLUhgzlA/x9VmY1ncJRZK8WVk638TJNXOAomKb6psRPzHjj5xokXeAvBQF/9anvvDo7XzphA/T7FctMYU5xpO9RLwkdAvHit8mVz9PQQOohe6CdUBBouWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rpr85Fqo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rpr85Fqo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A21C51F000E9;
	Thu,  9 Jul 2026 13:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783602606;
	bh=OIcSiBeDFuM+NfYJ4Vuhs6wgAQTULPAiJK24Njgod/w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Rpr85FqopcOo+gktswKmVp9Us4snRmKrz1GlynchA8x3NOg9feJw+yM56jAfevatR
	 r6GG+cHCYMobZMOzh+aw4kdto3ZF9MMS2d28Sny/W6OzZ6QzvdpfHV4Tged13MuaJh
	 kq04luD6U2VkygqjCXHLPP4AZ0a76+3L+dZPeGuocBRtH23otLbWdIG89Zu47GUQpt
	 AXt1aTAXrC885UEs+yhpNOCGqihuqmVFhQjL5N9gnmSQraefqLuE05Ct4zC3kdht/h
	 6EBYQjrlTZuGoEyiAN28APYzLF0mXbb2v/ou51DBFp8i2M5/3WwIcO+3Gm7cNAKkk+
	 6onrU7zFfzFWQ==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 03/11] media: iris: Add helper to create a context
 bank device
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vikash Garodia" <vikash.garodia@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260709-vpu_iommu_iova_handling-v1-3-72bb62cb2dfd@oss.qualcomm.com>
References: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
 <20260709-vpu_iommu_iova_handling-v1-3-72bb62cb2dfd@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 13:10:06 +0000
Message-Id: <20260709131006.A21C51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The context bank platform device is registered with a hardcoded =
instance ID of 0 instead of `PLATFORM_DEVID_AUTO`, causing sysfs naming col=
lisions and probe failures when multiple instances of the Iris core are pre=
sent.
--

--- Patch [3]: [RFC PATCH 03/11] media: iris: Add helper to create a contex=
t bank device ---
commit d34d83e19b25d09de0876c75096c26d30aa90223
Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

media: iris: Add helper to create a context bank device

This commit adds a helper function to register a subnode from the device
tree as a separate platform device, allowing it to have its own IOMMU
context bank.

> diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/=
media/platform/qcom/iris/iris_resources.c
> --- a/drivers/media/platform/qcom/iris/iris_resources.c
> +++ b/drivers/media/platform/qcom/iris/iris_resources.c

[ ... ]

> +struct device *iris_create_cb_dev(struct iris_core *core, const char *na=
me)
> +{
> +	struct platform_device_info plat_dev_info =3D {};
> +	struct device_node *child_of_node;
> +	struct platform_device *pdev;
> +
> +	child_of_node =3D of_get_child_by_name(core->dev->of_node, name);
> +	if (!child_of_node)
> +		return NULL;
> +
> +	plat_dev_info.dma_mask =3D core->iris_platform_data->dma_mask;
> +	plat_dev_info.fwnode =3D &child_of_node->fwnode;
> +	plat_dev_info.name =3D child_of_node->name;
> +	plat_dev_info.parent =3D core->dev;
> +
> +	pdev =3D platform_device_register_full(&plat_dev_info);

[Severity: Medium]
Does this code risk a sysfs naming collision if multiple Iris instances are
present?

Since plat_dev_info is zero-initialized, the device id defaults to 0 instead
of PLATFORM_DEVID_AUTO. If the SoC device tree specifies multiple Iris core=
s,
won't the second instance fail to register its context bank device due to a
sysfs naming collision in /sys/bus/platform/devices/ (for example, trying
to register a device named 'pixel.0' twice)?

> +	of_node_put(child_of_node);
> +	if (IS_ERR(pdev))
> +		return ERR_CAST(pdev);
> +
> +	return &pdev->dev;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709-vpu_iommu_=
iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com?part=3D3
