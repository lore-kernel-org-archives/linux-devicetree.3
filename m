Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5420433D51A
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 09:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784279928; cv=none; b=RMbH5yWOp5g89sa67fchGWQX6sn7S204gkKN5V9RnSyhXjk72vFePkbQDeFaUSudJ5QHAgcGaI99gqUOrCPAl5KnO5RI86qZY29Yq+EKan1O+5i7E8AYGBMxvOJDqJpAjiMIO25XrTZB9i7CAXXcGxvmmyCbbQcAjiglY3gALOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784279928; c=relaxed/simple;
	bh=YXVuy0BWseWcfrInblHRODlSdwkVaQGiRMW77gD/U+E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=a0fW1ykPH946ySBivqZpKMwMLvokfiCQQvivBsu29H6YTs2Df8TF19GSKdAyQz8Rzxpra5bgmHreaDfrSthqvq4aZcjx4XTH+NurzpirOsydEnBYQwwUaxMBuSdp1m19wVZhkI5Bp833SKG7X2oWlqNhOTPeABNdGvjCSmFq7zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UyV7BZas; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UyV7BZas"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB9021F00A3A;
	Fri, 17 Jul 2026 09:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784279927;
	bh=u7yr8puykvqgk8Pk4hUO3lvSbTV2KqC+y+qlSBE2xjA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UyV7BZasgaZ0+b/AC1XdclIKg3gn1ARcshVePsrky4fw3UyzMF3v/jzIuCd4SEWK4
	 JNq5TrWmo9mnD6IaIwmEY/V5OfDgI4j932i2dviawYEdXXM+TBoWXgNuD/dzcgQbLq
	 9o+pEkueeiYAdU7dW/TMoQhNdvCPLDNNUjMHJFNiIrSQ6oqrpmRcKan6c6qRqWTP25
	 CrbZPAlMaBS5e6qz77Gz8OB4Y+XVwDKcvfCAC7Zf+q4OMVxGesOWni1u4hssSQW1zQ
	 B98oBTkC1VfuFTDs2z995+g3ngIn0KW3Uc1L3gBtDCZYnG1GdGXzyca8xZLiS1G+vg
	 asa2YQChzTy6Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/4] regulator: axp20x: add support for the AXP318W
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jerome Brunet" <jbrunet@baylibre.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260717-axp318-regulator-v3-4-779dc1b97dd4@baylibre.com>
References: <20260717-axp318-regulator-v3-0-779dc1b97dd4@baylibre.com>
 <20260717-axp318-regulator-v3-4-779dc1b97dd4@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 09:18:46 +0000
Message-Id: <20260717091846.BB9021F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Unhandled AXP318_ID variant in `axp20x_set_dcdc_workmode` trigge=
rs a kernel splat if `x-powers,dcdc-workmode` is in the Device Tree.
--

--- Patch [4]: [PATCH v3 4/4] regulator: axp20x: add support for the AXP318=
W ---
commit 8de3219334d650160512cfdeb429dbaddb9ab5cb
Author: Andre Przywara <andre.przywara@arm.com>

regulator: axp20x: add support for the AXP318W

The X-Powers AXP318W is a typical PMIC from X-Powers, featuring nine
DC/DC converters and 28 LDOs, on the regulator side. Describe the chip's
voltage settings and switch registers, how the voltages are encoded, and
connect this to the MFD device via its regulator ID.

> diff --git a/drivers/regulator/axp20x-regulator.c b/drivers/regulator/axp=
20x-regulator.c
> index da891415efc0b..6f887250d6402 100644
> --- a/drivers/regulator/axp20x-regulator.c
> +++ b/drivers/regulator/axp20x-regulator.c

[ ... ]

> @@ -1585,6 +1858,10 @@ static int axp20x_regulator_probe(struct platform_=
device *pdev)
>  		regulators =3D axp313a_regulators;
>  		nregulators =3D AXP313A_REG_ID_MAX;
>  		break;
> +	case AXP318_ID:
> +		regulators =3D axp318_regulators;
> +		nregulators =3D AXP318_REG_ID_MAX;
> +		break;
>  	case AXP717_ID:
>  		regulators =3D axp717_regulators;
>  		nregulators =3D AXP717_REG_ID_MAX;

[Severity: Medium]
Could this trigger a kernel splat if the device tree contains the
"x-powers,dcdc-workmode" property for an AXP318 regulator?

During initialization in axp20x_regulator_probe(), the property is read
and passed to axp20x_set_dcdc_workmode():

	ret =3D of_property_read_u32(rdev->dev.of_node,
				   "x-powers,dcdc-workmode",
				   &workmode);
	if (!ret) {
		if (axp20x_set_dcdc_workmode(rdev, i, workmode))
...

However, axp20x_set_dcdc_workmode() does not seem to handle AXP318_ID
in its switch statement, which will cause it to fall through to the
default case:

	default:
		/* should not happen */
		WARN_ON(1);
		return -EINVAL;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717-axp318-reg=
ulator-v3-0-779dc1b97dd4@baylibre.com?part=3D4
