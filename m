Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141ED21A95D
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 11:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783595605; cv=none; b=UDC3uM7jaQrgGiVJlHdDYtqgfOCOxVhylbeWncIJ7Omy2T03aDZHBq6nqgQ4XdVXQGiXIU5freiUIqcfWn4f24IL8+oZlknucMbez4lL7GyiP2XheitCDJ/n4zGgOvGm2hR0Isetj+9f/oiO7c29lAW4UDn3KALO1ItLXVMt8fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783595605; c=relaxed/simple;
	bh=86xzaO6sEO8/wVv7Cf2/dXTAysUleRJ4TN8sNIHe9kM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EyJ5iA6CxU49jx9tsLwSl6EHex5+um+dWJZ1ntUn+ccDO8JMTpTz1btjYP4nR4h1kccWLy8rqOVkQJyRpaAekLnvZFoOEFnsUtIkZPSKiKGBpJr/frk2l/k57TMfnTLL8BCxcLJY565iTIp0thDUuSa8vEuHx+E3If798vjVS8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gOaqk5SZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gOaqk5SZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F4201F000E9;
	Thu,  9 Jul 2026 11:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783595603;
	bh=GvxeaAuBQwBrlWJObFxLSKPsg0nbQA9KkijlBGLM4u8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gOaqk5SZ3Rl/01qCCOHzwzamp8YVYK4+lsb9VFtghcjvzx3kAGUdhGGGbrYAkNYrc
	 u+3TG/d7KMdpKC0sc3yH/RyFvt3uKt9ndmqf5BkdG2ajO+d+hG5359BqqNX6+N2hAd
	 eQlnSPSssGHqL5B2EVYqUuYYDe4TeSJ9V3DCV20z24PlHHQ5N9zhv6OtHyDZFrW61O
	 h6aDLlIp6/hskeDZXCrW2IqmPdtXFW4lWg3OBiFT2XrD/rJNo+DzA+3MCCNrM34KGT
	 pMQLN6VNuKy0jBUhBQT8AipNTrAT1+TBHQMkvSTORt1GR0ROAEP2I6sGnhY5FUlPH6
	 bt0lUEJZdvsvw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 07/11] drm/mediatek: mtk_dp: Add support for PHY from
 devicetree
Reply-To: sashiko-reviews@lists.linux.dev
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, conor+dt@kernel.org
In-Reply-To: <20260709100617.42583-8-angelogioacchino.delregno@collabora.com>
References: <20260709100617.42583-1-angelogioacchino.delregno@collabora.com>
 <20260709100617.42583-8-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 11:13:22 +0000
Message-Id: <20260709111323.6F4201F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Double-unregister of the `mediatek-dp-phy` platform device on `dev=
m_phy_get` failure.
--

--- Patch [7]: [PATCH v2 07/11] drm/mediatek: mtk_dp: Add support for PHY f=
rom devicetree ---
commit 21392ccaeb903069c1e4a92500d58612e1669daf
Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: drm/mediatek: mtk_dp: Add support for PHY from devicetree

This commit adds support for parsing the DisplayPort PHY from the devicetree
via the phys property. For older devicetrees, it falls back to a legacy
configuration by registering a mediatek-dp-phy platform device and reading
legacy PHY calibration data.

> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek=
/mtk_dp.c
> index b4cb1996a3314..cabfc833c0a80 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c

[ ... ]

> @@ -2754,6 +2775,7 @@ static int mtk_dp_register_phy(struct mtk_dp *mtk_d=
p)
>  		return dev_err_probe(dev, ret,
>  				     "Failed to add phy unregister devm action");
> =20
> +	/* PHY calibration data is in mtk_dp only for legacy devicetree */
>  	mtk_dp_get_calibration_data(mtk_dp);
> =20
>  	mtk_dp->phy =3D devm_phy_get(&mtk_dp->phy_dev->dev, "dp");

[Severity: High]
Does this code double-unregister the mediatek-dp-phy platform device?

Earlier in mtk_dp_register_phy(), mtk_dp->phy_dev is registered with devres:

	ret =3D devm_add_action_or_reset(dev, mtk_dp_unregister_pdevs,
				       mtk_dp->phy_dev);

If devm_phy_get() fails immediately after the lines modified above:

	mtk_dp->phy =3D devm_phy_get(&mtk_dp->phy_dev->dev, "dp");
	if (IS_ERR(mtk_dp->phy)) {
		platform_device_unregister(mtk_dp->phy_dev);
		return dev_err_probe(dev, PTR_ERR(mtk_dp->phy),
				     "Failed to get phy\n");
	}

It explicitly calls platform_device_unregister() on the failure path. Since
devres will also execute mtk_dp_unregister_pdevs() (which unregisters the
same device) when probe fails, can this lead to a double-free and list
corruption in the driver core?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709100617.4258=
3-1-angelogioacchino.delregno@collabora.com?part=3D7
