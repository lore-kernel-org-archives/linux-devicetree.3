Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C8023643F
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 05:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782105860; cv=none; b=c2sJLm5UQ98RfDoZDS5fSSKnbicEgLDC/j9/II8e/OufbBbQUZPLn9OYdft6N40GH+hoUgOWfbMcEN5zUpRJAe5YEOUzrRAoDm5U8nXSYGYwB2dyb3n+G+B7nZTaGmLKVQzZbQSInrYu3Szq+JLeSvs5UQkG6UNOvS2wsohJY5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782105860; c=relaxed/simple;
	bh=KfL7LI/j/ayPKHMnxIrb87Md4CJUDGvtrsVdDUUDvBg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WgKSZkLy9fvFKGhh7q9MtLtjwCztwHDdTUUIhUbFv+OV8DIs4g37VNMcfZHm/OCHGEGy0uB/UCQTscqkpDXmpdP7cWudFcwwyP2dOgo6OeYvZi0JWih/3NoMwP4KSx/pQfu/zP55QRjNjJ4+a+Q6vsfNdZEEzqay0WOwx2qrGwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TrKRlr9z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TrKRlr9z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF5F01F000E9;
	Mon, 22 Jun 2026 05:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782105858;
	bh=zRtdqiWjlFr0e2npMkeXNNbXoKnhCzsrkqTi2fmBWUQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TrKRlr9zpjQkivNoiWQ53Hlz7pzgD/dkKEmcGS9vahSPA2A421DPMLqydUcNt+JZr
	 8EC7ZSP+biqxaBoIRk9+jQZ6bX4Yk+PKn7qkjVEDurhp5fO0pl37LELCq7hS/sc8pm
	 VGtLUpiWt901LPVeZYT2mGjvkkKxkwjvYsdojmhLC9mg1Gv/ZMy/LMxEXTj0VUe8V2
	 A9LIjBTsff3HAqKpEL2o69So/E2MLZEl8L7rNmC1ccIEHf7sAhoTc/w2Mb9UEOiFd2
	 OzYFqVjPI4VZC/Wcjfc1F157QUJzjKrkb0+k2Kqb0vqqqKirY4dtVm233lCZX6tZfF
	 sUnOXb3T1bsdg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 3/8] clk: qcom: Add generic clkref_en support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qiang Yu" <qiang.yu@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260621-tcsr_qref_0622-v6-3-c939c22ded0c@oss.qualcomm.com>
References: <20260621-tcsr_qref_0622-v6-0-c939c22ded0c@oss.qualcomm.com>
 <20260621-tcsr_qref_0622-v6-3-c939c22ded0c@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 22 Jun 2026 05:24:18 +0000
Message-Id: <20260622052418.AF5F01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The `qcom_clk_ref_probe` API maps memory resource 0 exclusively,=
 preventing its reuse by parent drivers like TLMM that already map their re=
gister space.
- [Medium] Missing `args_count` validation in the clock provider getter lea=
ds to an uninitialized stack memory read.
--

commit 425b78640ada4c9c7a746a68fc9313af14a52bae
Author: Qiang Yu <qiang.yu@oss.qualcomm.com>

clk: qcom: Add generic clkref_en support

This patch introduces generic support for Qualcomm clkref_en clocks. It
provides a dedicated clk_ref clock type and a common registration API to be
reused across different blocks like TCSR and TLMM.

> diff --git a/drivers/clk/qcom/clk-ref.c b/drivers/clk/qcom/clk-ref.c
> new file mode 100644
> index 0000000000000..8132e510f43c0
> --- /dev/null
> +++ b/drivers/clk/qcom/clk-ref.c

[ ... ]

> +static struct clk_hw *qcom_clk_ref_provider_get(struct of_phandle_args *=
clkspec, void *data)
> +{
> +	struct qcom_clk_ref_provider *provider =3D data;
> +	unsigned int idx =3D clkspec->args[0];

[Severity: Medium]
What happens if the provider node is misconfigured with #clock-cells =3D <0=
>?

If clkspec->args_count is 0, won't this read uninitialized stack memory from
clkspec->args[0] and potentially grant access to a random valid clock?=20

Should this validate that clkspec->args_count is at least 1 before accessing
the arguments array?

> +
> +	if (idx >=3D provider->num_refs)
> +		return ERR_PTR(-EINVAL);

[ ... ]

> +int qcom_clk_ref_probe(struct platform_device *pdev,
> +		       const struct regmap_config *config,
> +		       const struct qcom_clk_ref_desc *descs,
> +		       size_t num_clk_refs)
> +{
> +	struct qcom_clk_ref_provider *provider;
> +	struct device *dev =3D &pdev->dev;
> +	struct regmap *regmap;
> +	void __iomem *base;
> +	int ret;
> +
> +	base =3D devm_platform_ioremap_resource(pdev, 0);

[Severity: Medium]
Will this fail with -EBUSY when used by TLMM?

The commit message mentions this API will be used for TLMM on SM8750. Howev=
er,
devm_platform_ioremap_resource() requests exclusive ownership of the memory
region. The TLMM driver already maps its entire register space during probe.

If TLMM has already mapped the region, won't this subsequent attempt to map
the same region fail?

Would it be better to have the caller pass an already instantiated struct
regmap pointer instead of mapping the region inside the generic probe?

> +	if (IS_ERR(base))
> +		return PTR_ERR(base);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260621-tcsr_qref_=
0622-v6-0-c939c22ded0c@oss.qualcomm.com?part=3D3
