Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D090634250E
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 05:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780981778; cv=none; b=JG0bhXWBh6KPkG4DgFIamVQC1zlKO3Z3xqHNFjzJvlSJJBzp1Xh4d6Gq0P6UDAwP1pTj8bg0zuDoQ9jrsxAq4YdZky8Ab3RW8ok1vAa0ggjOD3XKB4o2Dj2390QDym9N1UJQjrkK3jy4fZISDzwfxsq+7CJkI6YYn2pl0spHLkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780981778; c=relaxed/simple;
	bh=oh5TrlLe3aGdgAAlWZqoUVCMh0IfK8z96KitHTkkTyU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GZfqz/Sjk3CxeyjtJu9dX4qHSsHcE92mARYi1kOn2QrllbjFqm3LVlT0k7jQileghBILgpKoWC2Ia9BG6enhgr66to+SAz+hJyxV+my7HKOaH1rDIvxRJhwHFFFY0ht6GIB8DCALPWJngbCaqWtGI0FNcqTxrC6m0kct5E3SMgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fKopF/3w; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fKopF/3w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 525CB1F00898;
	Tue,  9 Jun 2026 05:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780981777;
	bh=4BsX8Ab+erojyCCvdQ17Lm0XVKtVVeFMqjvpeoK/XHE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fKopF/3w6+gQm47i1JMGyPMC+VntOyYUz/0ASdevXgE7OSiXb5VgTEg/fpqHbOvMj
	 EF18/mHKI4Ri9LeQJubsvboJNR18EguNgsopCCa2jZ74Zr89kINwo0tSSiOblUoqjc
	 l/CLQrqqQlepyVPk5ef6vD9P7PWD5WrU6cuyiZ8yy6X0i2HKJZvnTTguCnwAXd0rdC
	 zLN1/fQ1/8YuPneZIA22KfC6RcWLuuDSXLCfUU66IevpzrzHjTKpS6HsoAmAswqBsF
	 SmSsLdhuOoMW9q2gKl5qeyNCOOAKBl9l4Vh+3nKfC1dG+bQfkvQX3UK4aIaWNmNtdE
	 bqB80IA26e/YA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/4] net: phy: at803x: add RX and TX clock management
 for IPQ5018 PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "George Moussalem via B4 Relay" <devnull+george.moussalem.outlook.com@kernel.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260608-ipq5018-gephy-clocks-v4-4-fb2ccd56894b@outlook.com>
References: <20260608-ipq5018-gephy-clocks-v4-4-fb2ccd56894b@outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 05:09:36 +0000
Message-Id: <20260609050937.525CB1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The use of `devm_clk_get_enabled()` makes 'rx' and 'tx' clocks man=
datory, breaking backward compatibility with older Device Trees where these=
 properties are absent.
--

commit f4405a562aab15670004ca1eb487237c7985a67a
Author: George Moussalem <george.moussalem@outlook.com>

net: phy: at803x: add RX and TX clock management for IPQ5018 PHY

Acquire and enable the RX and TX clocks for the IPQ5018 PHY.
These clocks are required for the PHY's datapath to function correctly.

> diff --git a/drivers/net/phy/qcom/at803x.c b/drivers/net/phy/qcom/at803x.c
> index 63726cf98cd42..ba4dc07752b60 100644
> --- a/drivers/net/phy/qcom/at803x.c
> +++ b/drivers/net/phy/qcom/at803x.c
[ ... ]
> @@ -1084,6 +1086,16 @@ static int ipq5018_probe(struct phy_device *phydev)
>  	priv->set_short_cable_dac =3D of_property_read_bool(dev->of_node,
>  							  "qcom,dac-preset-short-cable");
> =20
> +	rx_clk =3D devm_clk_get_enabled(dev, "rx");
> +	if (IS_ERR(rx_clk))
> +		return dev_err_probe(dev, PTR_ERR(rx_clk),
> +				     "failed to get and enable RX clock\n");
> +
> +	tx_clk =3D devm_clk_get_enabled(dev, "tx");
> +	if (IS_ERR(tx_clk))
> +		return dev_err_probe(dev, PTR_ERR(tx_clk),
> +				     "failed to get and enable TX clock\n");

[Severity: High]
Does this break backward compatibility with older Device Trees that do not
specify these clock properties?

Using devm_clk_get_enabled() makes these clocks mandatory, which will cause
ipq5018_probe() to fail unconditionally with -ENOENT if they are missing.

Could this be changed to use devm_clk_get_optional_enabled() so the interfa=
ce
continues to work with older Device Trees while still enabling the clocks
when they are present?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260608-ipq5018-ge=
phy-clocks-v4-0-fb2ccd56894b@outlook.com?part=3D4
