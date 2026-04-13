Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703393A4539
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 08:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776067863; cv=none; b=XGxRQ4F/RMwvqLAQOhcYEbFgHvLQ9jXv+hrdUgQlF1WH92lXaUPmnhOpQYBv7QVG5Tk3OqgAVCrL0ThddRNPIAQFsOHKFNKv9s+N887bG0AbFxWX4Jk6sf3UwgmqiA0/Wmq9JIxEqkNbkCj4ow0o/NWB4XiNufNb6e9RWaDaLzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776067863; c=relaxed/simple;
	bh=/+6tUc5Icac52+bULFFdig49bOIepahG9SlYDk26akg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=siwJ6jHOEPCtdLwAacT6gUBTqObQm8sDCNEMEJcfS0A/059Iw41/7Fvev/X8ooahxxmSYMkWikDheL67oVugx0hTdIFYBx9AZ+dli0jkWoplkNih3qByMIyAUQ+JZSgGftZTIgvfBqFBEw+UbswobVvUSmcvB8gfqr2+M6QdhN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wCCNM-00032k-QK; Mon, 13 Apr 2026 10:10:32 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wCCNL-0058dy-2z;
	Mon, 13 Apr 2026 10:10:31 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wCCNL-000000004UV-3YPU;
	Mon, 13 Apr 2026 10:10:31 +0200
Message-ID: <2675a315153c83c14d1581e019fdddb611139da7.camel@pengutronix.de>
Subject: Re: [PATCH v3 3/5] phy: qcom: qmp-pcie: Support multiple nocsr
 resets
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson	 <andersson@kernel.org>, Konrad
 Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 13 Apr 2026 10:10:31 +0200
In-Reply-To: <20260412-glymur_gen5x8_phy_0413-v3-3-affcebc16b8b@oss.qualcomm.com>
References: 
	<20260412-glymur_gen5x8_phy_0413-v3-0-affcebc16b8b@oss.qualcomm.com>
	 <20260412-glymur_gen5x8_phy_0413-v3-3-affcebc16b8b@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: devicetree@vger.kernel.org

On So, 2026-04-12 at 23:25 -0700, Qiang Yu wrote:
> Refactor nocsr reset handling to support multiple nocsr resets required
> for PHY configurations with bifurcated operation modes.
>=20
> The Glymur SoC's 3rd PCIe instance supports 8-lane mode using two PHYs
> in bifurcation, where each PHY requires its own nocsr reset to be
> controlled simultaneously. The current implementation only supports a
> single nocsr reset per PHY configuration.
>=20
> Add num_nocsr and nocsr_list fields to struct qmp_phy_cfg to represent th=
e
> number and names of a group of nocsr reset names. Initialize these fields
> for all PHYs that have nocsr resets, allowing the driver to correctly
> acquire multiple nocsr resets during probe and control them as an array
> by using reset_control_bulk APIs.
>=20
> The refactoring maintains backward compatibility for existing single
> nocsr reset configurations while enabling support for multi-PHY
> scenarios like Glymur's 8-lane bifurcation mode.
>=20
> Additionally, introduces x1e80100_qmp_gen3x2_pciephy_cfg as a separate
> configuration from sm8550_qmp_gen3x2_pciephy_cfg since the x1e80100 Gen3x=
2
> PHY requires nocsr reset support while the sm8550 Gen3x2 PHY does not.
>=20
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 87 ++++++++++++++++++++++++++=
++----
>  1 file changed, 77 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualc=
omm/phy-qcom-qmp-pcie.c
> index 424c935e27a8766e1e26762bd3d7df527c1520e3..51db9eea41255bad0034bbcfb=
fdc36894c2bc95f 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
[...]
> @@ -4998,14 +5054,25 @@ static int qmp_pcie_reset_init(struct qmp_pcie *q=
mp)
>  	for (i =3D 0; i < cfg->num_resets; i++)
>  		qmp->resets[i].id =3D cfg->reset_list[i];
> =20
> -	ret =3D devm_reset_control_bulk_get_exclusive(dev, cfg->num_resets, qmp=
->resets);
> +	ret =3D devm_reset_control_bulk_get_exclusive(dev, cfg->num_resets,
> +						    qmp->resets);

Unrelated and unnecessary change.

>  	if (ret)
>  		return dev_err_probe(dev, ret, "failed to get resets\n");
> =20
> -	qmp->nocsr_reset =3D devm_reset_control_get_optional_exclusive(dev, "ph=
y_nocsr");
> -	if (IS_ERR(qmp->nocsr_reset))
> -		return dev_err_probe(dev, PTR_ERR(qmp->nocsr_reset),
> -							"failed to get no-csr reset\n");
> +	if (!cfg->num_nocsr_resets)
> +		return 0;
> +	qmp->nocsr_reset =3D devm_kcalloc(dev, cfg->num_nocsr_resets,
> +				   sizeof(*qmp->nocsr_reset), GFP_KERNEL);
> +	if (!qmp->nocsr_reset)
> +		return -ENOMEM;
> +
> +	for (i =3D 0; i < cfg->num_nocsr_resets; i++)
> +		qmp->nocsr_reset[i].id =3D cfg->nocsr_reset_list[i];
> +
> +	ret =3D devm_reset_control_bulk_get_exclusive(dev, cfg->num_nocsr_reset=
s,
> +						    qmp->nocsr_reset);

Should this be devm_reset_control_bulk_get_optional_exclusive()?

regards
Philipp
