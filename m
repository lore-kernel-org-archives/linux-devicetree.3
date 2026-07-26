Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248532931F2
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 06:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785045790; cv=none; b=rwcb573CuI3spSDBm2UWZlQOi/ba6i6kkaQet3KrDncniNyQu2Tau7DS2K6Bw4A8XZe1lS1A8hFLCp8hn5Lm3LKPz5ZijbLjHAhviiUKq3LJQ/htufqxXrXJzggumUtesXY8i1vt8YgXBrvvDjJwfyL76xQLbYVjGL8MQil6IJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785045790; c=relaxed/simple;
	bh=q0lURA0Uza52Koxc/laCN/pCj5X9C0kbB/NLKHYfgmE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Wm+wUc1E8PvzVAxX9UKCsHQS3+Mlox70oEbpY2ppDEbpcBAn6KOIZfjuGr5lfms6WvnD6b0YAOt7EDY2b3H+qwB2MKS3nM+6coYRHMu+nEDuOwke9VE5bmPZtcp6Ai7W5o0diqjtsKeNgh91pWfldP+SYPcQ39nmqfcznW4ON9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kjSrSVQL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kjSrSVQL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 649101F000E9;
	Sun, 26 Jul 2026 06:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785045788;
	bh=zRee0+RzXpfmNML8ml+BKiLML7YGaWROXCtaDH3ZjNI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kjSrSVQL5FeGZptkTfdAH9UQARdBRpwfrh9x24cekOQ5uVYD5a2r9v0J07Nu5RCoF
	 KTmGEIiOG2wX4rmV0MoV8dx2jNOO6obUhXOH7rCewRdrcGM7sFc6vMwqsSyfNc1WeT
	 QGnXDNyt7a4QzJvh9G4CkRUZJbpNkPjZ4o5GBWE96gUR/6sI1FJxbHYh8iy8AvWIFv
	 j4Pto0Pv/2HDW3KX4n9ces5l9680bH4ToFfPz5mmXSri3N2/N8PlGcDOMFFQqcwLh9
	 eijhs9p54eD8hYMeSdZZvGWi9vSFUg2QyyxuX2xVMOfuKJXmvxwEIkqHyv400D/aIk
	 Nl1yzRpr/QQgQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 03/14] media: iris: Add helper to create a context
 bank device
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vishnu Reddy" <busanna.reddy@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, media-ci@linuxtv.org, conor+dt@kernel.org
In-Reply-To: <20260726-glymur-v10-3-de451559e88b@oss.qualcomm.com>
References: <20260726-glymur-v10-0-de451559e88b@oss.qualcomm.com>
 <20260726-glymur-v10-3-de451559e88b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 26 Jul 2026 06:03:07 +0000
Message-Id: <20260726060308.649101F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The newly created context bank device is never attached to an IOMM=
U domain because `of_dma_configure()` is not called.
--

--- Patch [3]: [PATCH v10 03/14] media: iris: Add helper to create a contex=
t bank device ---
commit 461ae3ede65da976a81591c71089c7621d163869
Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

media: iris: Add helper to create a context bank device
   =20
This commit adds a helper function to create a context bank device for the
iris driver. The subnode in the device tree is registered as a separate
device so that it gets its own IOMMU context for mapping pixel/non-pixel
buffers.

> diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/=
media/platform/qcom/iris/iris_resources.c
> index 773f6548370a2..a685915a19e9b 100644
> --- a/drivers/media/platform/qcom/iris/iris_resources.c
> +++ b/drivers/media/platform/qcom/iris/iris_resources.c

[ ... ]

> @@ -141,3 +142,30 @@ int iris_disable_unprepare_clock(struct iris_core *c=
ore, enum platform_clk_type
> =20
>  	return 0;
>  }

[ ... ]

> +	pdev =3D platform_device_register_full(&plat_dev_info);
> +	of_node_put(child_of_node);
> +	if (IS_ERR(pdev))
> +		return ERR_CAST(pdev);
> +
> +	dma_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
> +	dma_set_seg_boundary(&pdev->dev, DMA_BIT_MASK(32));
> +
> +	return &pdev->dev;
> +}

[Severity: High]
Since this subnode device won't be probed by a driver (due to lacking a
compatible string), it won't go through the device driver core's
really_probe() which would automatically call platform_dma_configure().

Will this newly created context bank device fail to attach to an IOMMU doma=
in
without an explicit call to of_dma_configure() here? If it isn't attached,
could subsequent dma_map_* calls using this device bypass the IOMMU or fail?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260726-glymur-v10=
-0-de451559e88b@oss.qualcomm.com?part=3D3
