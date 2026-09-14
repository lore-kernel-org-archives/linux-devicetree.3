Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C27484232
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 19:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789415069; cv=none; b=aJRcH5kawnag3jR3XdJ0CD5pMQoCaogo1jlNrACC25bwUuPRhVdfvhOtEhOwRgF0dHHf3VXJK+Z8hVwzRLvMl67xKOmXV0IXR24rm5/DXFik0ygi8yloiNnoRFcmohckPvysO1xIxzAoapGSrV8X52INnTk+S9fuT/TxqklrGWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789415069; c=relaxed/simple;
	bh=kTmZF1Ds6WBoTkDcTyc+cvNjlFjuC44767se6n2mL1Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TOmJ+XfL7fJ1Zb5glFy9wD/JwQVjAezu+Ot4lly+KGnls1dkDpZdoimqgirR/GHqGKMjI24XB1C86JFvbx9FmcWskkdkBpu9h6Cy9nd22X0u4d7QOHcSx8D8Vl0Dk4T0cT4Q6P7oRT4H6nAZJ153/yOqJz3I6jNFpCQNgtuloWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UOpq7YHf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UOpq7YHf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9490A1F00899;
	Mon, 14 Sep 2026 19:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789415065;
	bh=xYk9got1CA08XKCKyw3zf59V/UaImOcUZXuvZvs3iOA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UOpq7YHfgmMIg87+luLNEdpPRExlcIB3oef8Jw4D/s5B5cVhhN61vvqLi12q/FNDI
	 PwtRtMyYt/5jrelrE378msbNh7PMOOcKZJTHnn9Ni+oqVMrHDyFYZ5tE5XXfYSuCC5
	 lmdzDrZtOysIcMKL//WC2hjap/007DlY782P5/mvxfG9ReF0/+4DQNUGxZ510xtM/b
	 1K35NpF8QlDQoSehm9V1h+m5k9cZjvisqfuHrkQ8BGYoBz+3SUevOzoUrk12BNBy92
	 6CRrcQrnFlMe3P6v6PWotqRjM5pQFzhf+RnOPUzRE6xVpnEp/CDKJq+fsrJG3jdsWq
	 loLodmswg9yfw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v5 09/11] net: stmmac: dwmac-rk: add SGMII
 support for RK3568
Reply-To: sashiko-reviews@lists.linux.dev
To: "Coia Prant" <coiaprant@gmail.com>
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org, robh@kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, olteanv@gmail.com, wsa+renesas@sang-engineering.com, vkoul@kernel.org
In-Reply-To: <20260913185849.907479-10-coiaprant@gmail.com>
References: <20260913185849.907479-1-coiaprant@gmail.com>
 <20260913185849.907479-10-coiaprant@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 19:44:24 +0000
Message-Id: <20260914194424.9490A1F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] DWMAC_ROCKCHIP selects PCS_XPCS_ROCKCHIP without inheriting its =
dependencies, causing Kconfig warnings.
--

commit a034d04f6974ebd2055a96c9de8c8e79f795fefe
Author: Coia Prant <coiaprant@gmail.com>

net: stmmac: dwmac-rk: add SGMII support for RK3568

This commit adds SGMII support for the RK3568 SoC in the dwmac-rk driver.
It introduces callbacks to configure the GMAC GRF register for SGMII mode,
implements PCS initialization to create the XPCS, and configures phylink
for in-band negotiation.

Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%20TRM%=
20Part1%20V1.1-20210301.pdf (Page 386)

> diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/et=
hernet/stmicro/stmmac/Kconfig
> index ab3c4cf964239..c6559e749c0ce 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
> +++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> @@ -170,6 +170,7 @@ config DWMAC_ROCKCHIP
>  	default ARCH_ROCKCHIP
>  	depends on OF && (ARCH_ROCKCHIP || COMPILE_TEST)
>  	select MFD_SYSCON
> +	select PCS_XPCS_ROCKCHIP

[Severity: Medium]
Does selecting PCS_XPCS_ROCKCHIP under config DWMAC_ROCKCHIP require
inheriting its dependencies?

If a kernel is built with DWMAC_ROCKCHIP enabled, but GENERIC_PHY or
PM_GENERIC_DOMAINS is disabled, this select statement forces PCS_XPCS_ROCKC=
HIP
to be enabled without its underlying dependencies.

This can cause Kconfig unmet direct dependencies warnings at build time and
potentially lead to silent build failures.

Would it be better to add the required dependencies to DWMAC_ROCKCHIP?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260913185849.9074=
79-1-coiaprant@gmail.com?part=3D9
