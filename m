Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC824B7A46
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 13:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790861915; cv=none; b=SpxU3GEgKio2yElD68qiVZ4rBFY0YSCCjq8e9nDtWnjxjT3aY0NzMe/beqC4UdrARcK6vjFrURZil3q8stdcLgzOvgw97UtDsbcgx1vXm2/3Cts1ZLp2H725VfOpo51hYfbV5AGqtl3bg9BKTlkSMQ6JRePU8o10fbWWiKRIp5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790861915; c=relaxed/simple;
	bh=My2udZLosf9NWE0Yjc7mRws+VGoNPLFVXbfz7wdZw84=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=X4xOSsam6pH24KksfXEwqYfwPwuh2mddQZDcAjj0xY6NoC+sa8KpzJQaQA8RDgp2tEaDzmVufXbKG/9nOGtsmrYRlGsYJ91Y0mOuK/HrpKOdM1Up3Tj6flPflnywMIfCibS9oscySr6HuTEfIXil+Qa9QzH10T0R1L2fVEOMcA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GOiKmToy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GOiKmToy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E0DE1F000FF;
	Thu,  1 Oct 2026 13:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790861914;
	bh=mX3Kgq0uypRN33yih1E4IhTEp6dwxpwgfCl2vPnHp1k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GOiKmToyn/cmVoVr0pt5AnGbvLQKVLahZ/mS9QnQlfcgyXW5NuYoRNxfdr5I/Msnm
	 edzfoC5TWQ0TdniHUPY/+o29UtfsXTJHFr6AwEP4YPHO9WtDr216u2AqBwL4PQn4sA
	 K7rl3t0g1Gb8gWsBuXT+8s/brLvFDxo6n57NEomzx5mxATB10vwHqYqYva5Vkhg3rM
	 mcAVB2xIkNWVkB/QPQIEJJzOPWuNE6FOx/xOzgJJaOuyABt03+M9kEVN+XSB+3yFLA
	 AaJ77LTIFDJrOiG6cBQWFj4Wu61dqbX67CHwrgePBSdGaYKPoEuaosGgVc0d/E2dTr
	 AmRa23JCM9aqQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] phy: tegra: Add support for Tegra238 XUSB pad
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jon Hunter" <jonathanh@nvidia.com>
Cc: olteanv@gmail.com, conor+dt@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, linux-phy@lists.infradead.org, vkoul@kernel.org, robh@kernel.org
In-Reply-To: <20261001-tegra-phy-v2-3-3e453b1fb271@nvidia.com>
References: <20261001-tegra-phy-v2-0-3e453b1fb271@nvidia.com>
 <20261001-tegra-phy-v2-3-3e453b1fb271@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 01 Oct 2026 13:38:33 +0000
Message-Id: <20261001133833.9E0DE1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] phy: tegra: missing Makefile entry causes link failure for TEGRA_238
- [Low] phy: tegra: missing declarations cause compiler warnings
--

commit 7c86bdb1c8a3759375a713aae859eac18c35bda9
Author: Jon Hunter <jonathanh@nvidia.com>

phy: tegra: Add support for Tegra238 XUSB pad controller

This commit adds support for the Tegra238 XUSB pad controller by populating
the specific SoC data. It drops compile-time guards around Tegra186 port ops
and Tegra194 supplies to reuse them for Tegra238.

> diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
> index 0635f0d82c963..89ce9ac873006 100644
> --- a/drivers/phy/tegra/xusb.c
> +++ b/drivers/phy/tegra/xusb.c
[ ... ]
> @@ -78,6 +78,12 @@ static const struct of_device_id tegra_xusb_padctl_of_=
match[] =3D {
>  		.data =3D &tegra234_xusb_padctl_soc,
>  	},
>  #endif
> +#if defined(CONFIG_ARCH_TEGRA_238_SOC)
> +	{
> +		.compatible =3D "nvidia,tegra238-xusb-padctl",
> +		.data =3D &tegra238_xusb_padctl_soc,
> +	},
> +#endif

[Severity: Low]
Will this result in a link failure if a kernel is configured with only
CONFIG_ARCH_TEGRA_238_SOC enabled?

The tegra238_xusb_padctl_soc structure is defined in xusb-tegra186.c, but it
does not appear that drivers/phy/tegra/Makefile was updated to compile
xusb-tegra186.o when CONFIG_ARCH_TEGRA_238_SOC is set. If the other Tegra S=
oCs
are disabled, the object file might be omitted, leaving this symbol undefin=
ed
during linking.

> diff --git a/drivers/phy/tegra/xusb.h b/drivers/phy/tegra/xusb.h
> index d8d799d9e7522..b9de4f3b57815 100644
> --- a/drivers/phy/tegra/xusb.h
> +++ b/drivers/phy/tegra/xusb.h
[ ... ]
> @@ -514,6 +514,9 @@ extern const struct tegra_xusb_padctl_soc tegra194_xu=
sb_padctl_soc;
>  #if defined(CONFIG_ARCH_TEGRA_234_SOC)
>  extern const struct tegra_xusb_padctl_soc tegra234_xusb_padctl_soc;
>  #endif
> +#if defined(CONFIG_ARCH_TEGRA_238_SOC)
> +extern const struct tegra_xusb_padctl_soc tegra238_xusb_padctl_soc;
> +#endif

[Severity: Low]
Could this cause a -Wmissing-declarations warning when building
xusb-tegra186.c with CONFIG_ARCH_TEGRA_238_SOC disabled?

Since tegra238_xusb_padctl_soc is now defined and exported unconditionally =
in
xusb-tegra186.c, hiding its extern declaration behind this config guard will
leave the exported symbol without a visible prototype whenever the C file is
compiled for other SoCs.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261001-tegra-phy-=
v2-0-3e453b1fb271@nvidia.com?part=3D3
