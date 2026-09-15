Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80BD47DF87
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 10:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789467992; cv=none; b=d46EFjxCeufHcUuD/TsT5XLY6w5PMkoEC7zBUIB5oHTISjGv7FvQkD20WoAVrwfKsnUEAzXJqCPEtqSSww2Zz7TBXYbrKbBhDZ4H//VIr/AWwcAQaBFRmoMW8jKW+BRlfP2jZJibJfVudoS9YVYDmUW660mgZcvfY/LqI4ldPSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789467992; c=relaxed/simple;
	bh=8IvcOMIjLjw2IZGAZGFbT1CGYg0ad1z7M/4tGu/j80E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YNgfVijgV0cSdD51RQud90yMvMUEb35Vc0FW+dnvky6js+C8CEZe7xfPYMXFKJwRtZS9tXgCdTCS64T7G5cRuy6kQpdgeIVCv6dhp9P3ZkmY9/o1cCbhMXC4HbudvHROXw8nqFU/LL4FWWIF7D1WEIslIg+5TyyWrq+Qi27ojZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HZsCktSR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HZsCktSR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFF231F00893;
	Tue, 15 Sep 2026 10:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789467990;
	bh=wwVQ8xxvUDO4a0wOYl6u4/nV7IdmSwXT0cfa77nNaE4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HZsCktSR8LjMEl0e4QAvymEDTjdZsu6cVgyyaKr2QaE0PsVTXwPdnDEXKohFmFa91
	 KFqW21xsz+AS46v/FznYqcWPdDmFgbS1IYUJI+3kBaPZib1zEaWT1tmYBMXgmvmJiH
	 MT3AKtiW2cKvb1xXR8Aad1lBnUFcM4GlSyiC3PfY09+8JftKuNhW6I5dt77zdlkU0r
	 HCSwEX4YwMYP716DDHJCQvv7/e+iU4sF0+JHpo0zcY2pfl/Wv99trjQ9tfWzfP6Da0
	 E2YGGjNumfkrh5uDs8CROpJXT1uVV26c+M9WDm95jSQPr8d/BwsVtBj/mciC8hy95e
	 ugO99uOlPSBVA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] phy: mediatek: Add support for PCI-Express Gen4
 S-PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
Cc: vkoul@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, neil.armstrong@linaro.org, linux-phy@lists.infradead.org, conor+dt@kernel.org, olteanv@gmail.com
In-Reply-To: <20260915101022.23852-3-angelogioacchino.delregno@collabora.com>
References: <20260915101022.23852-1-angelogioacchino.delregno@collabora.com>
 <20260915101022.23852-3-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 10:26:29 +0000
Message-Id: <20260915102629.EFF231F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] phy: mediatek: endianness bug when reading split NVMEM cells in =
mtk_pcie_sphy_get_one_cal_para()
--

commit ab276d5dc9414b3b5618ea96c84dcc086bdf9036
Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

phy: mediatek: Add support for PCI-Express Gen4 S-PHY

This commit introduces the driver for the PCI-Express Gen4 S-PHY found in
recent MediaTek SoCs such as MT6991 and MT8196. It implements the PHY
initialization routines and handles reading eFuse calibration data from
the NVMEM framework.

> diff --git a/drivers/phy/mediatek/phy-mtk-pcie-sphy.c b/drivers/phy/media=
tek/phy-mtk-pcie-sphy.c
> new file mode 100644
> index 0000000000000..2bf10346ea97a
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

[Severity: Medium]
When an 8-bit (or smaller) NVMEM cell crosses a byte boundary in hardware,
the NVMEM core evaluates its length as 2 bytes, causing nvmem_cell_read_u8()
to fail with -EINVAL.

Does falling back to nvmem_cell_read_u16() cause an endianness issue here?

Because the NVMEM core populates the buffer with a direct memory copy, the
shifted valid data is placed in the first byte and zeroes in the second byt=
e.
On big-endian architectures, interpreting this buffer directly as a native
u16 variable evaluates to buf[0] << 8, which effectively multiplies the
calibration value by 256. This could lead to spurious -ERANGE failures or
incorrect calibration values being written to the PHY.

Would it be safer to use nvmem_cell_read_variable_le_u32() to handle these
split cells robustly across different architectures?

> +
> +	if (ret =3D=3D -ENOENT) {
> +		dev_info(dev, "No calibration for %s. Using defaults\n", name);
> +		return -ENOENT;
> +	} else if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "Cannot get calibration data for %s\n", name);
> +
> +	if (buf > max_val)
> +		return dev_err_probe(dev, -ERANGE,
> +				     "Bad value %u retrieved for %s.\n", buf, name);
> +
> +	return buf;
> +}
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915101022.2385=
2-1-angelogioacchino.delregno@collabora.com?part=3D2
