Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10DD64334A6
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 19:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785785916; cv=none; b=V+TQCOrZFMwO9iP9j/zXYYbDwwTH3ArJKrkuz3dJ2TgV7VhBc808TMhOXJd6gOh6PMpIttlx+xgBAWPoC1UqGHSnmnxXx2j8xWgbkT0IRoaEb7zEQ/QksQb58ew6xhZ/1PeJucWjUfuP6+GahUNpzg3+4t7p2l07QDqm2lp+OvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785785916; c=relaxed/simple;
	bh=kSWHo1PKP8Y0DpQx2bCg/4Z8edECkp65s3dORGjjsMI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=j46ScVtpVTMNUu8TeowaNWKEJxlxoznUUMAIxDXPwhzMsjEYow4Co8dPG61/+S+fol/HT2XIy0ElKBcoZgpOkUQujLo5s4Z8xiowEXA2nZnH8qTSW+EKFDRFuzk3jybODbEkDJTmsVduA1EV76v9ludx7puaOWfTwbsjbF+5kQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=emmLfs9+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="emmLfs9+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECF8D1F000E9;
	Mon,  3 Aug 2026 19:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785785915;
	bh=C+zVe4KgTptqZcobunsR8qlrsOpMEXYIZbDKPI+EPvk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=emmLfs9+njtgAWF6oAesa8/K/8rmTlHMDt6ITeElTpPELL7Ae76FFuIpZCiT7MgKE
	 0zpy+2aQYp/ss3da36Y+QiekaKkFMN9QO1zLkeCnFiq/2dJIg+RWpLmKY9u3qu5gME
	 bjhVdzVuLSitYQvoQc4xHDh83YQUhDWPY9WzQrc/o/PeYvW0siHnsNUHDfaeU32Cwo
	 RiHd8dpVZVjOMmZIHadhpkbIxfADH6fT/T5qVXBNBTEpd7MlYeqc/Dhx3uaTFm6MBi
	 tLUq8j95+DSpQ0i43gT9rHbN6yfAIpPpTIYbyu4T4KHPJYrWX2px66wfOR07KMZN1R
	 qVqZJ4gDOkadQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/6] phy: qcom: sgmii-eth: vote for both voltage
 rails with correct current loads
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohd Ayaan Anwar" <mohd.anwar@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-phy@lists.infradead.org, vkoul@kernel.org, robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20260804-b4-sgmiieth_serdes_regulator-v2-2-c4bc688177dd@oss.qualcomm.com>
References: <20260804-b4-sgmiieth_serdes_regulator-v2-0-c4bc688177dd@oss.qualcomm.com>
 <20260804-b4-sgmiieth_serdes_regulator-v2-2-c4bc688177dd@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 19:38:33 +0000
Message-Id: <20260803193833.ECF8D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The PHY provider is registered before its driver data is set, crea=
ting a race condition where a consumer could trigger a NULL pointer derefer=
ence.
--

--- Patch [2]: [PATCH v2 2/6] phy: qcom: sgmii-eth: vote for both voltage r=
ails with correct current loads ---
commit 1203fb5a9ba082470a0383befe64f62c484ac7d5
Author: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

phy: qcom: sgmii-eth: vote for both voltage rails with correct current loads

This commit updates the driver to explicitly vote for both voltage supply
rails with their correct peak current loads using
devm_regulator_bulk_get_const(), rather than relying on the PHY framework's
implicit single-rail voting. It also adds the necessary regulator
enable/disable calls in the power path.

> diff --git a/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c b/drivers/phy/qual=
comm/phy-qcom-sgmii-eth.c
> index f48faa2929a68..7137200c3f310 100644
> --- a/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
> +++ b/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c

[ ... ]

> @@ -381,6 +404,12 @@ static int qcom_dwmac_sgmii_phy_probe(struct platfor=
m_device *pdev)
>  	if (IS_ERR(data->refclk))
>  		return PTR_ERR(data->refclk);
> =20
> +	ret =3D devm_regulator_bulk_get_const(dev, QCOM_SGMII_NUM_SUPPLIES,
> +					    qcom_dwmac_sgmii_phy_vregs,
> +					    &data->vregs);
> +	if (ret)
> +		return ret;
> +
>  	provider =3D devm_of_phy_provider_register(dev, of_phy_simple_xlate);
>  	if (IS_ERR(provider))
>  		return PTR_ERR(provider);

[Severity: High]
This is a pre-existing issue, but does registering the PHY provider before
setting the driver data create a race condition here?

Looking at the end of qcom_dwmac_sgmii_phy_probe():

	provider =3D devm_of_phy_provider_register(dev, of_phy_simple_xlate);
	if (IS_ERR(provider))
		return PTR_ERR(provider);

	phy_set_drvdata(phy, data);

By calling devm_of_phy_provider_register() first, the PHY is made available
to consumers before phy_set_drvdata() initializes the private data.

If a consumer (such as a deferred probe workqueue) concurrently looks up the
PHY and immediately invokes an operation like phy_power_on(), could
qcom_dwmac_sgmii_phy_power_on() read a NULL driver data pointer and cause
a NULL pointer dereference when attempting to access data->vregs?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804-b4-sgmiiet=
h_serdes_regulator-v2-0-c4bc688177dd@oss.qualcomm.com?part=3D2
