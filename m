Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241C53B42C7
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 11:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791891687; cv=none; b=ew6yBnTmNs0Xil8xasbQQdmYkgo09Y1P978Oa+dcuB4g5UXSKphf8Aoy6JzBDKUvMljvmOKRjAPGd2GvuE287RMk8MKlaIlp6wlhrspYEmWuKiGw2X+0m16t5EBjgciPCj4pP/3TA0YSLjNUDpLZL2+HLsmFy3r+Of2lkD4pTDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791891687; c=relaxed/simple;
	bh=L7J8d9uq/fkQ4MQ1trGMq4R5FPsVdm9PYjHBf2Kz5A8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=n2JQdijfdnl64I2mLNjcwcCGNT26ZQrOXo2tuksrSSBjBSIvBFaQ4ywQyT1CoisVf68jMaQ9bqN/FrbANsYfrTsZOfu20ykvM9Lva1JaAEAN3Wvj5lWJR5wvwr7L/CBx4F+z+j3tFDXRUXVT3yfR5vP6Nv6ONa4v5Wt+tCT7+Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Htf5h44+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Htf5h44+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 843B71F000FF;
	Tue, 13 Oct 2026 11:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791891685;
	bh=Zx0GLTMWNZien83+ub1QpbD3fJiNlXxLImYEq2CavYc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Htf5h44+zCtrm80oshj+o+jqwNSYdEJWmstEvoEZXX9QWpEuByemekBbCxTjy5fhM
	 BrWykGlhoFJjX2gWW9DXpQ0sICIWg6fEo656BQKzGcAkhSmoQtkmIbo7Q4oGdQROnT
	 5FXRFFGyRefsaYQJWHh0luQlw5D9B/KNJGea6lFfYYtNK59Dij8UMfc+j0//LrZ/9u
	 XvZZVujwGiD4vf1oupd8x4qvg9W2AHe3IEgJSAXn3LdJZqtLGb2olPwMS/GVZqf+UY
	 nZrQQfhUU+GPxoqarpaFvJ3Qt6QFiRPcIJBOpvdDEaR/vRxXC9ODQy4yjOsW9cuT+S
	 RCg6CfyJfAP2w==
Message-ID: <sashiko-outbox-169638@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 09/10] ASoC: qcom: Add Shikra QAIF support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Harendra Gautam" <harendra.gautam@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261013-b4-qaif-shikra-audio-v9-9-f3022e28f2fd@oss.qualcomm.com>
References: <20261013-b4-qaif-shikra-audio-v9-0-f3022e28f2fd@oss.qualcomm.com>
 <20261013-b4-qaif-shikra-audio-v9-9-f3022e28f2fd@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 11:41:25 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] asoc: qcom: qaif: uninitialized stack read on zero iommu-cells
--

commit 205b884308f0fc7a573192d7a53b7c016d2a1163
Author: Harendra Gautam <harendra.gautam@oss.qualcomm.com>

ASoC: qcom: Add Shikra QAIF support

Add the Shikra variant data for the Qualcomm Audio Interface driver so
the common QAIF code can bind to the Shikra QAIF device and expose the
SoC-specific DAIs.

> diff --git a/sound/soc/qcom/qaif-shikra.c b/sound/soc/qcom/qaif-shikra.c
> new file mode 100644
> index 0000000000000..2db3995a2de04
> --- /dev/null
> +++ b/sound/soc/qcom/qaif-shikra.c
[ ... ]
> +static const struct of_device_id shikra_qaif_cpu_device_id[] =3D {
> +	{ .compatible =3D "qcom,shikra-qaif-cpu", .data =3D &shikra_qaif_data },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, shikra_qaif_cpu_device_id);
> +
> +static struct platform_driver shikra_qaif_cpu_platform_driver =3D {
> +	.driver =3D {
> +		.name =3D "shikra-qaif-cpu",
> +		.of_match_table =3D shikra_qaif_cpu_device_id,
> +		.pm =3D pm_ptr(&asoc_qcom_qaif_pm_ops),
> +	},
> +	.probe =3D asoc_qcom_qaif_cpu_platform_probe,

[Severity: Medium]
When probing this new device, could this lead to an uninitialized kernel st=
ack
memory read?

If a device tree is provided where the target iommus node has
"#iommu-cells =3D <0>", of_parse_phandle_with_args() returns successfully
with args_count =3D 0 without zeroing out the args array.

In sound/soc/qcom/qaif-platform.c:asoc_qcom_qaif_platform_register(),
which is reachable from this probe path:

	ret =3D of_parse_phandle_with_args(pdev->dev.of_node,
					 "iommus", "#iommu-cells", 0,
					 &iommu_spec);
	if (ret)
		return dev_err_probe(&pdev->dev, ret,
				     "failed to parse iommus property\n");
	sid =3D iommu_spec.args[0];

Because the iommu_spec structure is allocated on the stack, reading
iommu_spec.args[0] here fetches uninitialized kernel stack data without
checking if args_count > 0. This stack data is then masked with
QAIF_CSID_MASK and programmed into a hardware register, causing a minor
information leak and potential IOMMU configuration failure.

> +};
> +module_platform_driver(shikra_qaif_cpu_platform_driver);
> +
> +MODULE_DESCRIPTION("Qualcomm Audio Interface (QAIF) Shikra variant drive=
r");
> +MODULE_AUTHOR("Harendra Gautam <harendra.gautam@oss.qualcomm.com>");
> +MODULE_LICENSE("GPL");

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013-b4-qaif-sh=
ikra-audio-v9-0-f3022e28f2fd@oss.qualcomm.com?part=3D9
