Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CFD938A710
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 08:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780390110; cv=none; b=ZdmpiHMKgwh6uLdAR9sSGFvGlMdPa+NQO/cmSII/EFsmXppZbuMTGoC1lg37/A9ukaRYDs2BgXua1xNdqs/WfGnimge439OqnjzSWpGelzvYqQVCVGy7v+238AS8rIo9vxxi1RZVuKvCFp1e1tH/+53icoeGD1dxvtJik4NtA+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780390110; c=relaxed/simple;
	bh=GBr6NB8JO7HIcdz2JqZgrfCVRm9TsYNIa0iY3YBFnDE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mxXcIOzKcWrnYIwN6FvwhH/u1we/rwmB3iqfNP4KY+2MBXeZAZvU75mphQGLblbil76HIVpFE04YC7vdKxmuW9PQRs4ABX6ixzGS6SoG9P+QTBlMonkFu62VO1SO0MVv/SMnRmbx3OWshUQt6zLqSkOUTb8DkP+fdwQGaezvjX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ao9aSzUg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ao9aSzUg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C5271F00893;
	Tue,  2 Jun 2026 08:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780390108;
	bh=i+J64wjVXE8Sd2CL8uQ17J5iJm/QSfpT7Z5CeXtJ17I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ao9aSzUgcZbBbQvr31eA2eiSKDB7zuRsGm/5VWbXKCJdvbqutQbrghEnZI+xhrQNr
	 T2d+rJxy3tww/s2mY+7Dw/lqS8RthhWvNIs7dwKvxxMvas5aFOYNd4hFS+eYD+3hcx
	 loMuZGuUmMaFUyg3gUkT2ETwrOaeO3e0g3gjY5f3Phmzrdd+cE1k+CLvoArIS0aPvG
	 c4um6OMEoXiJxot8DREoNCNwlf5ysLSCV9Iy02AJgZTRwEDZjdn6uDh0Noek0U3cL2
	 GxxT7l5KlOzs34MKFsjS/YpqtY9Hb42BHBZ8lejP07bkBD0kTVcDER5j8w4dludnsG
	 dGzUh905h9aOw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 5/7] arm64: dts: qcom: glymur: Add QREF regulator
 supplies to TCSR
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qiang Yu" <qiang.yu@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260602-tcsr_qref_0527-v5-5-8ea174a59d7e@oss.qualcomm.com>
References: <20260602-tcsr_qref_0527-v5-5-8ea174a59d7e@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 02 Jun 2026 08:48:27 +0000
Message-Id: <20260602084828.4C5271F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Device Tree ABI breakage and regression in driver probing for olde=
r DTBs.
--

commit c88577468046d0a4edaa8b972228d1fb0443b125
Author: Qiang Yu <qiang.yu@oss.qualcomm.com>

arm64: dts: qcom: glymur: Add QREF regulator supplies to TCSR

The TCSR clkref_en clocks gate the QREF block which provides reference
clocks to the PCIe PHYs. Wire up the LDO supplies required by the QREF
and refgen blocks on the CRD board.

> diff --git a/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yam=
l b/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml

[ ... ]

> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,glymur-tcsr
> +    then:
> +      required:
> +        - vdda-qrefrpt0-0p9-supply

[Severity: High]
Does making these new regulator supplies unconditionally required cause a
regression for Device Tree ABI compatibility?

Older device trees lacking these properties will fail schema validation.

[ ... ]

> diff --git a/drivers/clk/qcom/clk-ref.c b/drivers/clk/qcom/clk-ref.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/clk/qcom/clk-ref.c

[ ... ]

> +static int qcom_clk_ref_register(struct device *dev, struct regmap *regm=
ap,
> +				 struct qcom_clk_ref *clk_refs,
> +				 const struct qcom_clk_ref_desc *descs,
> +				 size_t num_clk_refs)
> +{

[ ... ]

> +		if (clk_ref->desc.num_regulators) {
> +			clk_ref->regulators =3D devm_kcalloc(dev, clk_ref->desc.num_regulator=
s,
> +							   sizeof(*clk_ref->regulators),
> +							   GFP_KERNEL);
> +			if (!clk_ref->regulators)
> +				return -ENOMEM;
> +
> +			for (i =3D 0; i < clk_ref->desc.num_regulators; i++)
> +				clk_ref->regulators[i].supply =3D
> +					clk_ref->desc.regulator_names[i];
> +
> +			ret =3D devm_regulator_bulk_get(dev, clk_ref->desc.num_regulators,
> +						      clk_ref->regulators);
> +			if (ret)
> +				return dev_err_probe(dev, ret,
> +						     "Failed to get regulators for %s\n",
> +						     clk_ref->desc.name);

[Severity: High]
Since older device trees won't have these regulator properties defined, will
this unconditional devm_regulator_bulk_get() cause probe to fail entirely?

If full constraints are enforced without globally enabled dummy regulators,
devm_regulator_bulk_get() will return -ENODEV and cause a regression where =
the
TCSR clock controller fails to probe for systems booting with an older DTB.

> +		}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260602-tcsr_qref_=
0527-v5-0-8ea174a59d7e@oss.qualcomm.com?part=3D5
