Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0A2306D3F
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 09:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780393109; cv=none; b=kPobG6cjAGz8Fw9/boxSHLz5m9hGKw12dlszBryFkdtmEjvT/CqUjClGa3mytBWz0ooaVLyQvYueyVzEgQUXq4fT45Evn5mVTngiN3LRlXACXnxdpO6aSIy+tJJ/1EY9PubWbklJn5hDyUd68SyAWalVgR5JyAOk3UjbwMYozJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780393109; c=relaxed/simple;
	bh=1yNJ0R0NrsEhs6FjbWm/dCWW5RBswVOxMBc4++XjQ4s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UXOn2wGd7S6bbDZjY/sTC2oGEFpcCa2o3DXT9ln/S6RWSku6u5qYu8pf3toH6TZ0O92n1uH+CDi3+autZG5+ubPjZUe0pCaUambZPoNAEH1Htl3obg+9o/NRDR0VzeSjglJe4w3bIL7RBe8Cr9w0CAVW2uiSYVc7eBb/UV03GeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hxUfWnAL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hxUfWnAL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C04B1F00893;
	Tue,  2 Jun 2026 09:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780393108;
	bh=ETH6bJkWyic4zr0RMNcuRPZe5V32bVoQ2Z2tGTTDd9I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hxUfWnALUujARz9FTNDJGqgd+DE2iN7oaT5xpO4lk2tVtdXxyfStZ4gcITT32kODv
	 /itbMEVy5h1zkB9NzztqdtGy+3I01+FC+kREL8sO3yt9GWqhXQYIEVmWRyB47KvUAj
	 dlrBwwoAJKXACuwyNc6UbioM9mas/o3nf/s/gLnVN48GH74eHcM0+J9bZS3Pk9EFry
	 N3S+TxS0h7VbKUjNd0pHo9wUjeuPjSKPKoOa+V8xMB6uM0Rut2zTX55qkE3ueuh4AS
	 vc3+EIb29plikYTDBSBQHRYzx2tGn9F0jPeEBb0u3LgO+wsX5BLnbWy74byFQQdt2F
	 BE5EYY5MP1wpw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] regulator: qcom-refgen: add support for the IPQ9650
 SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kathiravan Thirumoorthy" <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260602-ipq9650_refgen-v1-2-55e2afa5ff64@oss.qualcomm.com>
References: <20260602-ipq9650_refgen-v1-2-55e2afa5ff64@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 02 Jun 2026 09:38:26 +0000
Message-Id: <20260602093827.6C04B1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Silent failure when DT clock properties are missing for a device=
 requiring clocks.
--

commit 526ede5fae05c2893929b211a8654512286f1196
Author: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

regulator: qcom-refgen: add support for the IPQ9650 SoC

This commit adds support for the IPQ9650 SoC to the qcom-refgen regulator
driver. Unlike other SoCs, the IPQ9650 requires its clocks to be explicitly
enabled to properly bring up the dependent PHYs. The regulator is also corr=
ectly
marked as REGULATOR_CURRENT based on the hardware design.

> diff --git a/drivers/regulator/qcom-refgen-regulator.c b/drivers/regulato=
r/qcom-refgen-regulator.c
> --- a/drivers/regulator/qcom-refgen-regulator.c
> +++ b/drivers/regulator/qcom-refgen-regulator.c
[ ... ]
> @@ -106,10 +177,23 @@ static int qcom_refgen_probe(struct platform_device=
 *pdev)
>  	struct regmap *regmap;
>  	void __iomem *base;
> =20
> -	rdesc =3D of_device_get_match_data(dev);
> -	if (!rdesc)
> +	data =3D of_device_get_match_data(dev);
> +	if (!data)
>  		return -ENODATA;
> =20
> +	if (data->has_clocks) {
> +		drvdata =3D devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
> +		if (!drvdata)
> +			return -ENOMEM;
> +
> +		drvdata->num_clks =3D devm_clk_bulk_get_all(dev, &drvdata->clks);
> +		if (drvdata->num_clks < 0)

[Severity: Medium]
Should this check also handle the case where devm_clk_bulk_get_all() return=
s 0?

If the device tree is missing the expected clock properties,
devm_clk_bulk_get_all() will return 0. The current check allows 0 to pass
as a success, which could allow the probe to silently succeed without having
any clocks available.

Since the IPQ9650 explicitly requires these clocks to bring up the PHYs
properly, could this cause a silent failure downstream when the unpowered
REFGEN block is accessed?

> +			return dev_err_probe(dev, drvdata->num_clks,
> +					     "failed to get clocks\n");
> +	}
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260602-ipq9650_re=
fgen-v1-0-55e2afa5ff64@oss.qualcomm.com?part=3D2
