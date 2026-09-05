Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5E61ADC97
	for <devicetree@vger.kernel.org>; Sat,  5 Sep 2026 21:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788643392; cv=none; b=puSY64Q7KhSEj/Q6NK7QFO96SZbYP5GlH0lWQvWuqyRc2xGGLYOnFG7xmW6vN0upI64t+2Kb+pd7hSakxnMOHmkZM5qxZ1jvW0wnzojFnmN70uPxbQFoA6zQHDHTvFIZcN/JksZ8zQ+uJyXmOQclkDNj5oGasCQ9nlqIbWy6p2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788643392; c=relaxed/simple;
	bh=UgURUyZ4hP5XeBNPrEfdc2vZ5bBQKxZC6d+qdQE/6ks=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GotthdJSUh6ZlUXrFAtU+IPfFTWMsJDyRCeLHKxaK5AWifOEn7KuWd6Prw7AlMVtG1S3lnCVIQziiSmQ7YQSBM5WsIK/DjG4lbg1UFYx2k49++059SgBmCpyuNtct4t1riTYdgcHcmdkYQHfzpxYLEZLRCtv56i3oGCiqyWPMKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nmRBMG9D; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nmRBMG9D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4D081F00A3A;
	Sat,  5 Sep 2026 21:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788643391;
	bh=GaYaCLQWkUPN1UE3GQCYoH5gflndJfXs8R2bwH6Dzak=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nmRBMG9DnEBTf9Z0geNU2/+AH/EHD8TRqZ75+Eeg6+DodSoPbBfr+dZ0eLL1u3UkZ
	 UXe8kOHyk5emKCN04jVknkvtLmvpN2gz5Ibooh4O3Tg1Dt27szbC5R+Y1Gab50WKvz
	 nkfKI7ADrzsn3IusQNqNXMJrpZlEOdCcK+EgsKaVajEh4kgXGLSbU69f2EYCzEFinB
	 HJ6EDAr7glj7cR0KbHQgwZyW0q10Ump9HrTwFUweLakdx8Jcb//05K4pth7Iab8/UY
	 wCHH/Lr+1nWHXvfrKt/MOVLHtRPd//7Y5wKnnbM6tN5lgg57DAnwRT4qN5SYzT4uHS
	 SoLrQtNP8UBXg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] phy: ti: ti-pipe3: allow configuring ACSPCIe
 TX/RX mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Oberhollenzer" <david.oberhollenzer@sigma-star.at>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, linux-phy@lists.infradead.org, neil.armstrong@linaro.org, vkoul@kernel.org, olteanv@gmail.com
In-Reply-To: <20260905211555.15944-3-david.oberhollenzer@sigma-star.at>
References: <20260905211555.15944-1-david.oberhollenzer@sigma-star.at>
 <20260905211555.15944-3-david.oberhollenzer@sigma-star.at>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 05 Sep 2026 21:23:10 +0000
Message-Id: <20260905212310.B4D081F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The driver improperly handles errors from `syscon_regmap_lookup_by=
_phandle_args()`, breaking probe deferral and masking failure states.
--

commit 222aba3021868be395b0b2808f4e70dc057987a7
Author: David Oberhollenzer <david.oberhollenzer@sigma-star.at>

phy: ti: ti-pipe3: allow configuring ACSPCIe TX/RX mode

For the PCIe PHYs, read the property from the device tree and
update the RX/TX mode selection bits in the specified syscon
register.

> diff --git a/drivers/phy/ti/phy-ti-pipe3.c b/drivers/phy/ti/phy-ti-pipe3.c
> index b5543b5c674c8..bc02010dadb74 100644
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
> +						      "ti,syscon-acspcie-tx-rx",
> +						      2, args);
> +	if (IS_ERR(regmap)) {
> +		dev_warn(phy->dev, "can't get ti,syscon-acspcie-tx-rx\n");
> +		return -EINVAL;

[Severity: High]
Does this mask the original error code (such as -EPROBE_DEFER or -ENOENT)
from syscon_regmap_lookup_by_phandle_args() by returning a hardcoded
-EINVAL? Unconditionally logging a warning and returning -EINVAL could
break probe deferral if the syscon device probes later.

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
Does this overwrite the returned error code in ret with the result of
ti_pipe3_get_pll_base()? If ti_pipe3_acspcie_tx_rx_mode() failed or
should have been deferred, ignoring the error here causes the probe
function to falsely succeed without configuring the PHY.

>  	if (ret)
>  		return ret;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260905211555.1594=
4-1-david.oberhollenzer@sigma-star.at?part=3D2
