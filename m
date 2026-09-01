Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B6F4A385D
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 20:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788294304; cv=none; b=gaAcZ9lbWHUqG7ADwIOYO+HqsXdVh58kgisiJa172RlbvyVRKIGn1zLRGmvY7TCGrf8g/c4NfMeklNNy7x3XSiXRjlCwyKTAZUBH4LpXaJv7Vn9c1EFP6VwNZAAihUPg25K1QLi8c9EDpI3uoq+OU9xVoIhkweNQb5kaXzOmzAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788294304; c=relaxed/simple;
	bh=a5SVRRN9w0PwK0ABgBe9wNnW3p3yXx6qaXn1I3+EPqc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=n4BAh17n+s2Vwbu+CKeWgdK+8aw5Ou5JTzKpqpkBOmuuc+Sa8o7LbVFVc74rysOo3ZtYuss26Ps4hSShLRAQbFLo5rH5kFQH/ZZlH3kQ8ltEYaxOmei2AZPT18Bu/sEl9GgKws5PFPpEBSwcMK1ynFy5DEDZIrdo0TnAqymHKqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bd3JPZAd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bd3JPZAd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60AD01F00A3A;
	Tue,  1 Sep 2026 20:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788294297;
	bh=lMpnbppsBTrh/fgnz1BIZ4HEP60QWFMvATXC9tMJFLE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bd3JPZAdDq9ry0LbzABEAj44CPgUesjx1OnA20Um1XyEquAEnvA+tIgG+kf4jOj4G
	 A/JEwwwYFZk6o6BsKOiXONy3x7COhFHiTSp6WECF7SslRm5MZY0pvAg7DBbUHu6lHl
	 A2IEnwOnpPAHpx+LIYQ4SVcR9BEkzqMEgLYcqGH/CueIWsBxglowQSiA4CXRKVwpdD
	 zB4BhUsVaLDZcLFG5fxRq8f/MViE7a7YYKMdKwLVIqFci6UbR3su1S/OCyOrTTWwsy
	 MzKbIlNEcVKQ1jgPUEGPBnqI3PPoae0ke3e4D05Y9SVh/szol02Jqi4C3YWF8fZicE
	 3+oj1ep6SG4PA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v16 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QnJ5YW4gTydEb25vZ2h1ZQ==?= <bryan.odonoghue@linaro.org>
Cc: conor+dt@kernel.org, linux-phy@lists.infradead.org, neil.armstrong@linaro.org, media-ci@linuxtv.org, robh@kernel.org, vkoul@kernel.org, devicetree@vger.kernel.org, olteanv@gmail.com
In-Reply-To: <20260901-x1e-csi2-phy-v16-2-dd863b929080@linaro.org>
References: <20260901-x1e-csi2-phy-v16-0-dd863b929080@linaro.org>
 <20260901-x1e-csi2-phy-v16-2-dd863b929080@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 20:24:57 +0000
Message-Id: <20260901202457.60AD01F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The MIPI CSI-2 PHY driver validates the dynamically requested la=
ne count in `phy_configure` but then drops it, always powering up all stati=
cally connected lanes.
--

commit 195a47fa2ff62bda0e1e24d4911794d18fcb86c8
Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver

Add a new MIPI CSI2 driver in DPHY mode initially. The entire set of
existing CAMSS CSI PHY init sequences are imported in order to save time
and effort in later patches.

> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy=
/qualcomm/phy-qcom-mipi-csi2-core.c
> new file mode 100644
> index 0000000000000..24ccd3264686f
> --- /dev/null
> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
[ ... ]
> +static int phy_qcom_mipi_csi2_configure(struct phy *phy,
> +					union phy_configure_opts *opts)
> +{
> +	struct mipi_csi2phy_device *csi2phy =3D phy_get_drvdata(phy);
> +	struct phy_configure_opts_mipi_dphy *dphy_cfg =3D &opts->mipi_dphy;
> +	struct mipi_csi2phy_stream_cfg *stream_cfg =3D &csi2phy->stream_cfg;
> +	int ret;
> +
> +	ret =3D phy_mipi_dphy_config_validate(dphy_cfg);
> +	if (ret)
> +		return ret;
> +
> +	if (dphy_cfg->lanes < 1 || dphy_cfg->lanes > CSI2_MAX_DATA_LANES)
> +		return -EINVAL;
> +
> +	stream_cfg->link_freq =3D dphy_cfg->hs_clk_rate;
> +
> +	return 0;
> +}

[Severity: Medium]
Does this code inadvertently drop the requested lane count from
opts->mipi_dphy.lanes?

In phy_qcom_mipi_csi2_configure(), dphy_cfg->lanes is bounds-checked but
never assigned to stream_cfg->num_data_lanes. This causes the dynamic lane
count to be dropped.

Because it is dropped, the driver later relies on the statically probed cou=
nt
when enabling the lanes:

drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c:phy_qcom_mipi_csi2_lanes=
_enable() {
    ...
    val =3D BIT(lane_cfg->clk.pos);
    for (i =3D 0; i < cfg->num_data_lanes; i++)
        val |=3D BIT(lane_cfg->data[i].pos * 2);
    ...
}

Should stream_cfg->num_data_lanes be updated here so that the PHY only
powers up the requested subset of physically connected lanes?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901-x1e-csi2-p=
hy-v16-0-dd863b929080@linaro.org?part=3D2
