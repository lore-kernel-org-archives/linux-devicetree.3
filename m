Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C38634D916
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 11:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785842824; cv=none; b=S3ggN0ajYfqAnKiyVkja5cCtgfWeAxQDlhYNkBFAwGq1wF4PiquMZJ43/elVpwuKMtVcZvTV1z5ADUhZPmApFYd4f6Ad9j8Qa0+f/GWWeW9jvqf3ObzHIRq2FfRGHlqtBwHZLVtTei56Gly5LqroxAwWuH9NQcquPFNmi+7VeUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785842824; c=relaxed/simple;
	bh=fDIIiNxmN7kTgcpncQCYB5wuq0jTUwmfQaXm8SIspv0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=K91d9NJFn1rTHfY9jdIa7YuG4KKjJ2o9wjNwdqOwCd4beVOrOllEzQoswnel8BaAqXkXmzgN+eBhiq6/VPXQQ89DFPGM2lTpVjaj8U+vPiJUWnfLXdAiYNUJgdsvLOmxiXQrGM7KWuJDQW2cxwkFYZw3ptBaVj5CrjNL9Dl7/1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EPuF0FM1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EPuF0FM1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 497CF1F000E9;
	Tue,  4 Aug 2026 11:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785842822;
	bh=7qxKpRl7AlMwATHBh/XmTQYkGn7y72biA6cY9gH2iYI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EPuF0FM1oCSGsefGmL3r6F4shX6MejycBkBCIdthw2mCAwRLkU5jI5L4DP8B4FY1x
	 FMsOQmiC8uuNepgahGFWEdA7uGsivBSUcFT9MwQmL5f1FkQAWENrBZMxuPOtQ7qs3+
	 dgjAvIz+SudcCX4TjYy79KDMqfwb+otm91oX0IDcPfcrJzTQsNMIdjci0niTy21gwC
	 x+RpQ1bZRvVN9rUKGqvRmiv2SLEVroHG7VoSnRrEIVESqzJf6/TWd66Q7/TV1Tbzgg
	 OzzxZWkDM9HnvqWMxJf9J0QP3DhXyoDx8LbFGbOXAl1bbOWNPcQjEcMZN/irl/YLWz
	 hu6z9/lI/wa0g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] phy: ti: ti-pipe3: allow configuring ACSPCIe TX/RX
 mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Oberhollenzer" <david.oberhollenzer@sigma-star.at>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, robh@kernel.org, conor+dt@kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org
In-Reply-To: <20260804111849.92046-2-david.oberhollenzer@sigma-star.at>
References: <20260804111849.92046-1-david.oberhollenzer@sigma-star.at>
 <20260804111849.92046-2-david.oberhollenzer@sigma-star.at>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 11:27:01 +0000
Message-Id: <20260804112702.497CF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Probe deferral is broken and errors are masked and ignored when fe=
tching the syscon-acspcie-tx-rx property.
--

--- Patch [1]: [PATCH 1/2] phy: ti: ti-pipe3: allow configuring ACSPCIe TX/=
RX mode ---
commit 033ddba9bd8c07b8f722ae7d9285da5fbd94d88e
Author: David Oberhollenzer <david.oberhollenzer@sigma-star.at>

phy: ti: ti-pipe3: allow configuring ACSPCIe TX/RX mode

This commit adds a device tree setting to configure the ACSPCIe TX/RX mode
for the OMAP PCIe PHY subsystem. It uses a syscon regmap to apply the
configuration during probe.

> diff --git a/drivers/phy/ti/phy-ti-pipe3.c b/drivers/phy/ti/phy-ti-pipe3.c
> index b5543b5c674c8..801a6239328e1 100644
> --- a/drivers/phy/ti/phy-ti-pipe3.c
> +++ b/drivers/phy/ti/phy-ti-pipe3.c

[ ... ]

> @@ -785,6 +788,24 @@ static int ti_pipe3_get_pll_base(struct ti_pipe3 *ph=
y)
>  	return PTR_ERR_OR_ZERO(phy->pll_ctrl_base);
>  }
> =20
> +static int ti_pipe3_acspcie_tx_rx_mode(struct ti_pipe3 *phy)
> +{
> +	struct device_node *np =3D phy->dev->of_node;
> +	struct regmap *regmap;
> +	unsigned int args[2];
> +
> +	regmap =3D syscon_regmap_lookup_by_phandle_args(np,
> +						      "syscon-acspcie-tx-rx",
> +						      2, args);
> +	if (IS_ERR(regmap)) {
> +		dev_warn(phy->dev, "can't get syscon-acspcie-tx-rx\n");
> +		return -EINVAL;

[Severity: High]
Does this code inadvertently break probe deferral?

If the syscon provider is not yet ready, syscon_regmap_lookup_by_phandle_ar=
gs()
will return -EPROBE_DEFER. Masking this actual error code into -EINVAL could
prevent the driver from probing later.

> +	}
> +
> +	return regmap_update_bits(regmap, args[0], PCIE_TX_RX_CTRL_MASK,
> +				  args[1] << PCIE_TX_RX_CTRL_SHIFT);
> +}
> +
>  static int ti_pipe3_probe(struct platform_device *pdev)
>  {
>  	struct ti_pipe3 *phy;
> @@ -807,6 +828,12 @@ static int ti_pipe3_probe(struct platform_device *pd=
ev)
>  	phy->dpll_map =3D data->dpll_map;
>  	phy->settings =3D data->settings;
> =20
> +	if (phy->mode =3D=3D PIPE3_MODE_PCIE) {
> +		ret =3D ti_pipe3_acspcie_tx_rx_mode(phy);
> +		if (ret)
> +			dev_warn(dev, "failed to set ACSPCIe TX/RX mode\n");
> +	}
> +
>  	ret =3D ti_pipe3_get_pll_base(phy);

[Severity: High]
Is it intentional that the error returned from ti_pipe3_acspcie_tx_rx_mode()
is ignored?

The value of ret is captured but immediately overwritten by
ti_pipe3_get_pll_base(). This causes the probe to proceed even if the syscon
lookup fails or requires deferral.

>  	if (ret)
>  		return ret;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804111849.9204=
6-1-david.oberhollenzer@sigma-star.at?part=3D1
