Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A004266A4
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 15:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784561858; cv=none; b=gS0LUXJ8IuywnLFt+nWqdh9Mh/YhYe89SUWuVCZaRUF807g8QnbgWSyxk+wMN7/qmmu1XsnUhPGGtdFs+Y/Sk8xQ6E6cwoVrqnh+sdHOdhNZ6+SThMur8zgBpLBd6xxWqLc0xrvUxZqF1IAPVjcaC1Abu5ebcWBkl9oc2IRo+Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784561858; c=relaxed/simple;
	bh=zzaZSnie0jIAeNYr/GehI1J6XqXy0fTB6D9OUX4FqvY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rT6YCenWfpN0xTAkFBj6kixUNJPuFqAJR/9/R2WEtEFQIdJJKrHD8M5Pv8GrE50vc8/T938y4vZWJE8MlRHMM4fKleHkMRBgQUMcakkr915vSa1EEJM97vy0C1doAbnO4TskmQV3r1Cj3uev2B8QG+fUkLbr3t+dp/77qounzDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ctOxcuRu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ctOxcuRu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8566B1F00A3A;
	Mon, 20 Jul 2026 15:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784561857;
	bh=AdydMQD6XqNimOrdxgFxFFc3ogSzS1ey/fOCAe9XFwk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ctOxcuRuX0K0OlXUz230voFAZRzKZCP1GkbYvyMHCe153u/GdMDZeYNGkAFJEIofn
	 wRMG/Hg52teVgdEVz2/5S7nfe+b9amFXk1NhYkfN3xoPv4oUPBpawgVKjTCyQAAmV7
	 G5sxh0yRxGej+IfxEBXS18foLp0JPX3r6+Wsi6R62+I6f0220wiq0unqb3SOty3qGq
	 fCmhbIteMJGbTvFm6NpUsmk1s0cC8iAhlvIVPYJCizNW3a23GTpLd+Mfajsl+WQFIO
	 MRl5NtzbbgdqZ2MaPCQ7UUtQKTGp581GNqMC7hnX/f3E8H1HMNaI1KRORy1xzrtHoQ
	 0ZFzgicFc6iRg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] phy: mediatek: Add support for PCI-Express Gen4
 S-PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
Cc: conor+dt@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, linux-phy@lists.infradead.org, vkoul@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260720152654.92216-3-angelogioacchino.delregno@collabora.com>
References: <20260720152654.92216-1-angelogioacchino.delregno@collabora.com>
 <20260720152654.92216-3-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 15:37:36 +0000
Message-Id: <20260720153736.8566B1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The driver emits a false-positive kernel error log when NVMEM is di=
sabled or unsupported.
--

--- Patch [2]: [PATCH v3 2/2] phy: mediatek: Add support for PCI-Express Ge=
n4 S-PHY ---
commit 93ce035a5e3a24b4c6f63697869bbcb5d8e50db4
Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: phy: mediatek: Add support for PCI-Express Gen4 S-PHY

This commit adds support for the PCI-Express Gen4 S-PHY found in the latest
MediaTek SoCs, including MT8196, MT8894 and similar.

[ ... ]
> diff --git a/drivers/phy/mediatek/phy-mtk-pcie-sphy.c b/drivers/phy/media=
tek/phy-mtk-pcie-sphy.c
> new file mode 100644
> index 0000000000000..853aafa182597
> --- /dev/null
> +++ b/drivers/phy/mediatek/phy-mtk-pcie-sphy.c
[ ... ]
> +static int mtk_pcie_sphy_get_one_cal_para(struct device *dev, const char=
 *name, u8 max_val)
> +{
> +	u16 buf;
> +	u8 tmp;
> +	int ret;
> +
> +	/*
> +	 * All of the calibrations are always max 8 bits long, but some may
> +	 * be split between two different 8-bits cells: handle this corner
> +	 * case by retrying reading as u16.
> +	 */
> +	ret =3D nvmem_cell_read_u8(dev, name, &tmp);
> +	if (ret =3D=3D 0)
> +		buf =3D tmp;
> +	else
> +		ret =3D nvmem_cell_read_u16(dev, name, &buf);
> +
> +	if (ret =3D=3D -ENOENT) {
> +		dev_info(dev, "No calibration for %s. Using defaults\n", name);
> +		return -ENOENT;
> +	} else if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "Cannot get calibration data for %s\n", name);

[Severity: Low]
Does this emit a false-positive kernel error log when NVMEM is disabled or
unsupported?

If CONFIG_NVMEM=3Dn, the NVMEM APIs return -EOPNOTSUPP, which will cause th=
is
path to print an error with dev_err_probe(). However, the caller in
mtk_pcie_sphy_get_calibration_data() gracefully handles -EOPNOTSUPP as a
non-error condition:

	if (ret < 0) {
		/*
		 * If any of the calibration values is missing, or if there is
		 * no calibration at all in the eFuses, this is not a problem,
		 * as the PHY doesn't require one to actually work.
		 */
		if (ret =3D=3D -ENOENT || ret =3D=3D -EOPNOTSUPP) {
			cal->supported =3D false;
			return 0;
		}

Could -EOPNOTSUPP be handled silently here in mtk_pcie_sphy_get_one_cal_par=
a()
to avoid spurious error messages during boot?

> +
> +	if (buf > max_val)
> +		return dev_err_probe(dev, -ERANGE,
> +				     "Bad value %u retrieved for %s.\n", buf, name);
> +
> +	return buf;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720152654.9221=
6-1-angelogioacchino.delregno@collabora.com?part=3D2
