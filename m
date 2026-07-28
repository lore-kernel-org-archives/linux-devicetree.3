Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122863E3156
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 07:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785225221; cv=none; b=b7NvmSAs6ndDC8j6KKckDm3hs1RHGgbO+Y7Do1doFqR3Oyuj5V43/GePoEIJ0W7glr335i1cQc4P0NTFchQdC2uIyXF0cxwbmPaAktl4GaEM6IgBQ5ng+Ykaz/kFHHnmFc49H6GtrYlWMH5G6kvxfDpqJJv/O+1E6dR3zjetqGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785225221; c=relaxed/simple;
	bh=gAP49qi6v7IYGmpo2qUhDsU38IRgmAkNYiDg8hObIig=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hTecxahM5zair9Q+XXfdFCA6YVswpZtmdFBFcKQZi8BjXwferyKgOoumLa7nTJjkbSjUpNN1XAQ6iscjYE18kkJJ5npIlbcFeN0HJWNH9wl3/Pcb/3Xow76Dq+axauk7T8mZ2muD1gsG1n7addzEJXHp3/yZ85yigIlVxOa8610=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XXO3rYse; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XXO3rYse"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63B5C1F00A3A;
	Tue, 28 Jul 2026 07:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785225219;
	bh=GA3WG50xk1jke3L/SpSuv9yuPrkZ1tWD1uJplRMV5lg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XXO3rYseiHADTkeEIsEC/aejy8OOwk3XlTvtqFhOQmOl3Msc8n6hFN5FeOdZEcjvc
	 +Lu9ILSEK1lG8WUZYLo38fc0w2WWGGvXEjV0FmE1xdvsEcxgnGktcH9pPnZDVMEJHF
	 RJdN2P6GPoHXQzAEvBW5dZ6O6Fv8jcbAhADezTweZbk0t8PrJqlq5XmqZjEjg1Atfb
	 Rq7noczvJ/WJhtWAAbJOymDtsx18YZtntpNrkugPJ/tDXxk489IR64GphhIPdRoSCR
	 3OlOPRriZdUsx0nTgToZOz7pZI0leqKvoOVeJU8Y+2Wk/TEqnTQMxJqdUebA4zWPN2
	 /unrsRvI4dmyg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 2/2] net: phy: add DAPU Telecom DAP8211R(I)
 Gigabit Ethernet PHY driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Artem Shimko" <a.shimko.dev@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260727075324.3555446-3-a.shimko.dev@gmail.com>
References: <20260727075324.3555446-1-a.shimko.dev@gmail.com>
 <20260727075324.3555446-3-a.shimko.dev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 07:53:39 +0000
Message-Id: <20260728075339.63B5C1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The Kconfig help text claims support for device tree flags enabl=
ing a 180-degree TX clock phase shift and an internal packet generator, but=
 the driver implements neither.
- [Medium] Inconsistent handling of RGMII delay device tree properties rela=
tive to the selected phy-mode.
--

--- Patch [2]: [PATCH net-next v4 2/2] net: phy: add DAPU Telecom DAP8211R(=
I) Gigabit Ethernet PHY driver ---
commit 8189e886a8887b076e59fb9f9e71196f6089538d
Author: Artem Shimko <a.shimko.dev@gmail.com>

net: phy: add DAPU Telecom DAP8211R(I) Gigabit Ethernet PHY driver

This commit introduces a new PHY driver for the DAPU Telecom DAP8211R(I)
Gigabit Ethernet PHY. It implements extended register access via indirect
addressing and configures RGMII TX/RX clock delays through device tree
properties.

> diff --git a/drivers/net/phy/Kconfig b/drivers/net/phy/Kconfig
> index a29d3fed8a053..aab97e01899c5 100644
> --- a/drivers/net/phy/Kconfig
> +++ b/drivers/net/phy/Kconfig
[ ... ]
> @@ -243,6 +243,16 @@ config DAVICOM_PHY
>  	help
>  	  Currently supports dm9161e and dm9131
> =20
> +config DAP8211R_PHY
> +	tristate "DAPU Telecom DAP8211R(I) Gigabit Ethernet PHY"
> +	depends on OF
> +	help
> +	  Support for the DAPU Telecom DAP8211R(I) Gigabit Ethernet PHY.
> +	  This PHY is designed for enterprise and industrial networking
> +	  applications, supporting 10/100/1000 Mbps operation.
> +	  RGMII with: configurable TX/RX clock delays, optional flag to enable
> +	  180-degree TX clock phase shift and internal packet generator.

[Severity: Medium]
Are the 180-degree TX clock phase shift and internal packet generator featu=
res
actually implemented in this driver?

The help text advertises these features for users configuring the kernel, b=
ut
looking at the driver code, there doesn't seem to be any implementation for
them. Could this mislead users who expect these features to be available ba=
sed
on the documentation?

> +
>  config ICPLUS_PHY
>  	tristate "ICPlus PHYs"
>  	help
> diff --git a/drivers/net/phy/dap8211r.c b/drivers/net/phy/dap8211r.c
> new file mode 100644
> index 0000000000000..65d6fef86f26b
> --- /dev/null
> +++ b/drivers/net/phy/dap8211r.c
[ ... ]
> +static int dap8211r_config_init(struct phy_device *phydev)
> +{
[ ... ]
> +	switch (phydev->interface) {
> +	case PHY_INTERFACE_MODE_RGMII:
> +		if (rx_internal_delay < 0)
> +			rx_internal_delay =3D 0;
> +
> +		if (tx_internal_delay < 0)
> +			tx_internal_delay =3D 0;
> +		break;
> +	case PHY_INTERFACE_MODE_RGMII_RXID:
> +		if (rx_internal_delay < 0)
> +			rx_internal_delay =3D DAP8211R_DEFAULT_DEL_SEL;
> +
> +		tx_internal_delay =3D 0;

[Severity: Medium]
Is it intentional to silently drop an explicitly provided tx-internal-delay=
-ps
property when using PHY_INTERFACE_MODE_RGMII_RXID?

For PHY_INTERFACE_MODE_RGMII, explicit delay properties are kept and applie=
d.
However, in dap8211r_config_init(), tx_internal_delay is hardcoded to 0 for
the rgmii-rxid mode.=20

This might lead to unexpected configuration drops if a device tree specifies
phy-mode =3D "rgmii-rxid" along with a tx-internal-delay-ps property, as the
requested delay will be ignored without warning.

> +		break;
> +	case PHY_INTERFACE_MODE_RGMII_ID:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727075324.3555=
446-1-a.shimko.dev@gmail.com?part=3D2
