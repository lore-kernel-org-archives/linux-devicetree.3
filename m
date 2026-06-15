Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4335A407578;
	Mon, 15 Jun 2026 15:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781539094; cv=none; b=k/Rd105FyhbUy+CeI/BXDuGPvdlMIOFyxwAAWPwP9UwdYlfIErLWk8ZOUPuQcVNwho0Sq7Sc0xtUkph6AjB6NyE2ihqz+dcGkaTOoAoMnddYHcbgBl6EcMv1/whkr3XeaQFzK90YwjNGu4n4zE3LQU4/FNovo/LzF9gxPkPvhhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781539094; c=relaxed/simple;
	bh=PSB2h5rSHd6qTZt1fRrXdcgW92HcafOHzmHkfESr/Qs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=atLfMzUh9USolkbWul97IY6JRt0hbJ4Wpfv3g5+5jzTYK3FSEu5w1g0xkLWOBS4HFCc7TWn8ERErmA3tjXAYkodTsIrJVgKwiGMijj6sKK4FeVsObLAmMLYi9jVrlMJ1FS6HYeX2l31m/GwmB0Lz5VJgxzya17Q0a+AkAwOXJD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U6Ia/kFW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U6Ia/kFW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E75A01F000E9;
	Mon, 15 Jun 2026 15:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781539093;
	bh=7HLnF3JTiitZDwWB8R6gEBqf8Kfy9I65uOy1tr3paBM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=U6Ia/kFWJIX2jrdh0slD0cY6ZDt2x2r8rgGHk7LL1DR3MGdh/JCLLpDX3adj1LIzP
	 YBFIVQwXhTavlIkmV1YYP4t+O4INS/Nn3IqnMZIxzdhxP06iT8IZQngCSJOONfBrWo
	 iyUUWq0LfLuYGwytBH3IaVBJuVf/GkntrhM9iJPDPlsd39scfNDd371tZN6CxirRvp
	 DgvWAc1LDsSlIAgH9CRmq2u3sgC2CkJqFrfUAREcAG/QC8UBl9tqyIU20iomecGbUJ
	 HUIFpJijbSjqLySxQMXHvNdACEPwIspcDQ/Lw/jgBG835AEBXic4ONoIYnJaJzcLew
	 bAB7Xga+TIqng==
Date: Mon, 15 Jun 2026 16:58:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/3] regulator: qcom-refgen: add support for the
 IPQ9650 SoC
Message-ID: <737655dd-2059-421d-a9ca-91ebd1b1209b@sirena.org.uk>
References: <20260615-ipq9650_refgen-v3-0-5f611623629c@oss.qualcomm.com>
 <20260615-ipq9650_refgen-v3-3-5f611623629c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cHslWt8keW0JgXiY"
Content-Disposition: inline
In-Reply-To: <20260615-ipq9650_refgen-v3-3-5f611623629c@oss.qualcomm.com>
X-Cookie: To stay youthful, stay useful.


--cHslWt8keW0JgXiY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 15, 2026 at 02:05:49PM +0530, Kathiravan Thirumoorthy wrote:
> IPQ9650 SoC has 2 REFGEN blocks providing the reference current to the
> PCIe and USB, UNIPHY PHYs. For the other SoCs, clock for this block is
> enabled on power up but that's not the case for IPQ9650 and we have to
> enable those clocks explicitly to bring up the PHYs properly.

> +static int qcom_ipq9650_refgen_enable(struct regulator_dev *rdev)
> +{
> +	struct qcom_refgen_drvdata *drvdata = rdev_get_drvdata(rdev);
> +	int ret;
> +
> +	ret = clk_bulk_prepare_enable(drvdata->num_clks, drvdata->clks);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}

> +static int qcom_ipq9650_refgen_disable(struct regulator_dev *rdev)
> +{
> +	struct qcom_refgen_drvdata *drvdata = rdev_get_drvdata(rdev);
> +
> +	clk_bulk_disable_unprepare(drvdata->num_clks, drvdata->clks);
> +
> +	return 0;
> +}

> +static const struct regulator_desc ipq9650_refgen_desc = {
> +	.enable_reg = REFGEN_REG_REFGEN_STATUS,
> +	.enable_mask = REFGEN_STATUS_OUT_MASK,
> +	.enable_val = REFGEN_STATUS_OUT_ENABLE,

> +	.ops = &(const struct regulator_ops) {
> +		.enable		= qcom_ipq9650_refgen_enable,
> +		.disable	= qcom_ipq9650_refgen_disable,
> +		.is_enabled	= regulator_is_enabled_regmap,
> +	},

This looks like a get_status() operation, not an enable operation?  The
enables and disables are pure clock operations.

--cHslWt8keW0JgXiY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmowIQ8ACgkQJNaLcl1U
h9ALNQf+OyO0/dnBSWA32nOVv1PcKXQmOlHa0po0cjW4978uq0iczbQRGDCbFlZ2
patPi1IUWeltBggyPIDxCd7y8alqRNEmcqLii9vjvagxRGcruqAhpnlCun+p6HuC
/HkB0GmJM+PXyvizRHnBNk9W5qau0P6y38ygcRw4yo7fshRBR4tet7lbSbiTrR8s
a25KPNs0Fv5wwe7T5qeduwrMcAaySZQRtfanInubyJMXoL4TiuyNX3ICI0rm0UP0
E7oNr6nKPK2eC5leaQIg4BNstpUCf4nFMB6qZRgXhnXZI3N7F03EaCPmaP2ob4TH
XXl14Vv7hJz7diUX6pWu6oeESGM/Kg==
=jmIe
-----END PGP SIGNATURE-----

--cHslWt8keW0JgXiY--
