Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D00B48DB3D
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 18:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792174536; cv=none; b=Tb7ZYJewymwNm2YC6jka3Pq/MYnOqk8qW5Atnc6V/8wk3v2FcSYnb0iF3UaKZgl4BaZt82TXhZuPLXqXSdcrmen1ef/udTr+cwo2A0VytnwOeCTdZ3iostN2a7W5+tI26R7o7Diznfp0iWW6a5WL9woUnLY96zqng3dQKVf+dfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792174536; c=relaxed/simple;
	bh=5Q54jteAwCvHiucElrzY9KufR7ch/oFHlTrYRr86Gs8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=DEnZ6Plmozm68Oyv+63eanb9rCIqitxd1wEpfRkSxbyZcYkKR+jgsUwe94ynIFHYoqh7pBHcRgoak52n3Zf+UPnsYs5PycCTeJR3rCxHf89shCsMw+50pUgioxAjo785mHQTkArQu/yQhPHH2JsdQ9+H9NZ6qqFb1BfvkHZkCd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bK6NpToi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bK6NpToi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A5911F000C4;
	Fri, 16 Oct 2026 18:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792174534;
	bh=gyMXMDKw4Mopj2XMcIZdSqjNF06tbYKm7cls/nNEAlM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bK6NpToi1+x/FL5U/M0/Lma/xE8YH+EEHrqyt+w67dUN71SEryY8Zi+naEDJsxcN6
	 gf72lkqlCf66gJoKRQykRepMuSx/6b/g2eY9w7eaAoTcpKwsX1T2sy3CFilsWJIUtY
	 5IhW6JOGDYZ6/QFW26o/qVb85Dr//4IUOcMs2g0T97zGVxpU0Vpd//dpvHc0zdZYnS
	 JD9CZvjg94HByzTqIM1Hz2j2kN0u2l/zAPDXwZjHHAPiP8ABhqjj7lDuz9XXlcQod6
	 dtzne1ljdbpTHWY4AptsjG/RnTl9Xly6fjPqT2LvNut0xmwAHeASQqFjb6VEFsL+hz
	 9eNbaisdraecA==
Message-ID: <sashiko-outbox-174759@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 4/6] phy: realtek: usb2: introduce reset controller
 struct
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rustam Adilov" <adilov@disroot.org>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261016180314.31760-5-adilov@disroot.org>
References: <20261016180314.31760-1-adilov@disroot.org>
 <20261016180314.31760-5-adilov@disroot.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 18:15:33 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] phy: realtek: register access before reset deassertion causes hang=
/timeout
- [Medium] phy: missing reset_control_assert in rtk_phy_exit and error paths
--

commit ae1074cfd8fee3a5506c0c9db06f187c80793713
Author: Rustam Adilov <adilov@disroot.org>

phy: realtek: usb2: introduce reset controller struct

In RTL9607C, there is so called "IP Enable Controller" which resemble
reset controller with reset lines and is used for various things like
USB, PCIE, GMAC and such.

> phy: realtek: usb2: introduce reset controller struct
>=20
> In RTL9607C, there is so called "IP Enable Controller" which resemble
> reset controller with reset lines and is used for various things like
> USB, PCIE, GMAC and such.
>=20
> Introduce the reset_control struct to this driver to handle deasserting
> usb2 phy reset line.
>=20
> Make use of the function devm_reset_control_get_optional_exclusive()
> function to get the reset controller and since existing RTD SoCs don't
> specify the resets we can have a cleaner code.
>=20
> Since the vendor usb driver developed by Realtek doesn't assert the reset
> line (or in their case clear the register bit), we can reasonably assume
> reset_control_assert is not needed here.

[Severity: Medium]
Since this is an exclusive reset control, does it need to be asserted on
teardown even if the vendor driver doesn't do it?

If the reset line is never asserted during module removal or driver unbind
(such as in an rtk_phy_exit() function), could this lead to power leakage
or unexpected initial states during subsequent driver reloads?

> diff --git a/drivers/phy/realtek/phy-rtk-usb2.c b/drivers/phy/realtek/phy=
-rtk-usb2.c
> index 5e483c853f02f..2ddad7be73534 100644
> --- a/drivers/phy/realtek/phy-rtk-usb2.c
> +++ b/drivers/phy/realtek/phy-rtk-usb2.c
[ ... ]
> @@ -676,6 +678,15 @@ static int rtk_phy_init(struct phy *phy)
>  	if (!rtk_phy)
>  		return -EINVAL;
> =20
> +	if (rtk_phy->phy_rst) {
> +		ret =3D reset_control_deassert(rtk_phy->phy_rst);
> +
> +		if (ret)
> +			return ret;
> +
> +		usleep_range(5000, 6000);
> +	}
> +
>  	for (i =3D 0; i < rtk_phy->num_phy; i++)
>  		ret =3D do_rtk_phy_init(rtk_phy, i);

[Severity: Medium]
If do_rtk_phy_init() fails, the reset line remains deasserted on the error
path. Should the reset line be asserted before returning the error?

[ ... ]
> @@ -1055,6 +1066,11 @@ static int rtk_usb2phy_probe(struct platform_devic=
e *pdev)
> =20
>  	rtk_phy->num_phy =3D phy_cfg->num_phy;
> =20
> +	rtk_phy->phy_rst =3D devm_reset_control_get_optional_exclusive(dev, NUL=
L);
> +	if (IS_ERR(rtk_phy->phy_rst))
> +		return dev_err_probe(dev, PTR_ERR(rtk_phy->phy_rst),
> +				     "usb2 phy reset is not working\n");
> +
>  	ret =3D parse_phy_data(rtk_phy);

[Severity: High]
Can calling parse_phy_data() here before deasserting the reset control cause
a hardware hang or timeout?

Inside parse_phy_data(), if the SoC configuration lacks a pre-populated
default value for certain registers, functions like update_hs_clk_select()
and update_dc_driving_level() will attempt to read from the PHY registers:

drivers/phy/realtek/phy-rtk-usb2.c:update_hs_clk_select() {
	if (phy_parameter->inverse_hstx_sync_clock) {
		if (!phy_cfg->page0[6].addr) {
			rtk_phy_set_page(phy_reg, 0);
			phy_cfg->page0[6].addr =3D PAGE0_0XE6;
			phy_cfg->page0[6].data =3D rtk_phy_read(phy_reg, PAGE0_0XE6);
		}
	}
}

If the realtek,inverse-hstx-sync-clock DT property is set, it will read
from the unclocked or reset IP block, which could lock up the system bus
on many SoCs.

Would it be safer to defer these register reads until after the reset is
deasserted in rtk_phy_init()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016180314.3176=
0-1-adilov@disroot.org?part=3D4
