Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21EE6484249
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 15:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784822117; cv=none; b=vDNBNc3SUJ3SghacHfdc2ofT06e/lTNtx/bVTN3vcAICGNcWFBzUwGkyNrwX/3289hIr/8SMUZgDOZmDyIbDj6E0LPNXSsQ4zhWzun+TDCOTxoKFN6M5ssQZK14iQ5lY8pc88GozHojMfrWs570AU1De+gLDCbozg2AQcF+hlIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784822117; c=relaxed/simple;
	bh=cIAcs/jCpktspPYc/6CESadCQZX3fpTqK9fUINagxrw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Eam0o3kRv5CFEEE5EJ/5Rn334jneodWNB/wTw5i2io8V4lP+gX6R0p2ncEqk9Y4RN6h5SVointz12VmyGMArfdX3kNMWq2xV3Nhgt7vZswVktQ2G+AjJRzSJ9TH/D2C8J35/QPhXjXBTBNcg+IXcsdYNjO9cBIjpgWvHyjwGFYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S1zmHsBx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S1zmHsBx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68A0E1F00A3A;
	Thu, 23 Jul 2026 15:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784822115;
	bh=W7LDo46dbXWFo2ZGS3Uf/lfyZxG87+Wp7RTatkvByu0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=S1zmHsBxRGqX32m/Npta+0mwIDIPAjy/H+5WPIhXrT21i94E9rWF4Doqz5/Js6jmI
	 T082eBC4rPb6QwDChHolaWBBTjqWI5eqDg1WmKKgz6rwKut6Y4isSTRL5TkyjzXFPP
	 trHT1rZJO68clon8xhhO+zHfxZf2Y5t6aP2PDtj+aaG5m85S6LqOE63/ffq99qWqvh
	 rwD5DRKSIHYFN4RvKXENC8SnXg49cfO8LzgfxOCRpDQEt4B9hJj3YFPB9c53jfXs5C
	 mvbdTC5WDPekhTOg/nj9arzUbtxlS8xjWYZhb3fduYznynUuOPeRJ+pViuXy2FqcDK
	 6vP5bwKlSlfVw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/4] clk: qcom: common: Register reset controller
 only when resets are present
Reply-To: sashiko-reviews@lists.linux.dev
To: "Imran Shaik" <imran.shaik@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260723-shikra-audiocorecc-v3-1-90b878ae0d4e@oss.qualcomm.com>
References: <20260723-shikra-audiocorecc-v3-0-90b878ae0d4e@oss.qualcomm.com>
 <20260723-shikra-audiocorecc-v3-1-90b878ae0d4e@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 15:55:14 +0000
Message-Id: <20260723155515.68A0E1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The local pointer `reset` is used uninitialized when registering G=
DSCs if the clock controller defines GDSCs but no resets.
--

--- Patch [1]: [PATCH v3 1/4] clk: qcom: common: Register reset controller =
only when resets are present ---
commit 4dacf2df1c1e317705833daaa92c7514eab60f24
Author: Imran Shaik <imran.shaik@oss.qualcomm.com>

clk: qcom: common: Register reset controller only when resets are present

This commit avoids registering a reset controller if the clock controller
descriptor does not define any resets. It does this by checking if
desc->num_resets is non-zero before initializing and registering the
controller.

> diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
> --- a/drivers/clk/qcom/common.c
> +++ b/drivers/clk/qcom/common.c
[ ... ]
> @@ -359,17 +359,19 @@ int qcom_cc_really_probe(struct device *dev,
>  		qcom_cc_clk_regs_configure(dev, desc->driver_data, regmap);
>  	}
> =20
> -	reset =3D &cc->reset;
> -	reset->rcdev.of_node =3D dev->of_node;
> -	reset->rcdev.ops =3D &qcom_reset_ops;
> -	reset->rcdev.owner =3D dev->driver->owner;
> -	reset->rcdev.nr_resets =3D desc->num_resets;
> -	reset->regmap =3D regmap;
> -	reset->reset_map =3D desc->resets;
> -
> -	ret =3D devm_reset_controller_register(dev, &reset->rcdev);
> -	if (ret)
> -		goto put_rpm;
> +	if (desc->num_resets) {
> +		reset =3D &cc->reset;
> +		reset->rcdev.of_node =3D dev->of_node;
> +		reset->rcdev.ops =3D &qcom_reset_ops;
> +		reset->rcdev.owner =3D dev->driver->owner;
> +		reset->rcdev.nr_resets =3D desc->num_resets;
> +		reset->regmap =3D regmap;
> +		reset->reset_map =3D desc->resets;
> +
> +		ret =3D devm_reset_controller_register(dev, &reset->rcdev);
> +		if (ret)
> +			goto put_rpm;
> +	}
> =20
>  	if (desc->gdscs && desc->num_gdscs) {
>  		scd =3D devm_kzalloc(dev, sizeof(*scd), GFP_KERNEL);
>  		if (!scd) {
>  			ret =3D -ENOMEM;
>  			goto put_rpm;
>  		}
>  		scd->dev =3D dev;
>  		scd->scs =3D desc->gdscs;
>  		scd->num =3D desc->num_gdscs;
>  		scd->pd_list =3D cc->pd_list;
>  		ret =3D gdsc_register(scd, &reset->rcdev, regmap);

[Severity: High]
If a clock controller defines GDSCs but no resets, does this leave the reset
pointer uninitialized when evaluated here?

During qcom_cc_really_probe(), the new if (desc->num_resets) block skips the
initialization of the reset pointer when the clock controller has no resets
defined.=20

However, the pointer arithmetic &reset->rcdev is still evaluated when
calling gdsc_register(). Passing this uninitialized garbage address could i=
nvoke
undefined behavior and cause a panic during boot when compiler hardening to=
ols
are enabled.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723-shikra-aud=
iocorecc-v3-0-90b878ae0d4e@oss.qualcomm.com?part=3D1
