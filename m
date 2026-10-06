Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942173859E2
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 22:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791325883; cv=none; b=NigZOwTeQv6h7v1RP5+N8hCuiRpVO1NFl+D3z9itODUwJx3WJsBEykiXEH434i5qaIGpnT+ppnuOgCf+hh2COiMTcvIOQs+hk4D+mrgT5tKYQTcYE7czs1D9lMwEXxcrY3sLEuSDmyT4wfgWwlywxC6EXUgeFE/CkJpIcob9yks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791325883; c=relaxed/simple;
	bh=2cKBiC0m20GSgyXBsgOFgJ2EwA3cgFPZQO0YcNFOfDk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=PFKM5zU6C03HU5yEh37mqvYZvCK0Q5TXzHKyNm+jjL7EqXH3pPQdAoqvM/N0Ef4Md5Pbf4t0npniuyF5kRfvM5TE9s8iaTNIBoIWic6usFHkBhC06ap90WUfBuV3AZ8fKAnJx6b3qaw8rFXFmxfWbjOQBGwOLYq95dokI1u5bVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PowJQJIa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PowJQJIa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0691B1F0089B;
	Tue,  6 Oct 2026 22:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791325882;
	bh=GKCe0jxjkrHLdakfifoA8vB/NCZy7VmNh2fsUEzdahg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PowJQJIan+QEWp1l0gKO2Ap+mlgZNE5At+96iiXzRubcH/BQFQeqSyg2hs+3IlnX7
	 6WNZTtX0a+vAbemAK8sR/I3JYQKdvxwR3kVfujov/QqyI2cHRrQTfqeBuo4c09lMHX
	 H0Y65HZm/eUVNNJHcwRmRbdgIYuH2QhBnWU93w8nl6Z15M2QQhtZafbAW3AK0syjyU
	 0hRIE/rL3Bkmun8lx6SOXBiyPFzwoeztevg+fVqGu1cAAFJNnv/bF47SiA+OiOPvkp
	 anPQF1HmUiKSbN9A/G1vkZ++Tuv70DEanpf58fV88CMxZnu/mwLNYuVP1n7oyvgiYY
	 Q7NRLt+QA57Mw==
Message-ID: <sashiko-outbox-162491@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v10 5/6] net: stmmac: dwmac-rk: add SGMII
 support for RK3568
Reply-To: sashiko-reviews@lists.linux.dev
To: "Coia Prant" <coiaprant@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20261005223011.1124347-6-coiaprant@gmail.com>
References: <20261005223011.1124347-1-coiaprant@gmail.com>
 <20261005223011.1124347-6-coiaprant@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 06 Oct 2026 22:31:21 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] net: stmmac: memory leak and SGMII breakage due to xpcs overwrite
--

commit 9f6d3f852317e81db5e938c043afc40343ece6e9
Author: Coia Prant <coiaprant@gmail.com>

net: stmmac: dwmac-rk: add SGMII support for RK3568

This commit adds SGMII support for the RK3568 SoC to the dwmac-rk driver.
It configures the necessary glue logic, sets up the MAC for in-band
negotiation, and provides callbacks to initialize and manage an XPCS via
the Rockchip platform driver.

Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%20TRM%=
20Part1%20V1.1-20210301.pdf

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net=
/ethernet/stmicro/stmmac/dwmac-rk.c
> index 72bdbcb5e863a..3b50ad3c600b9 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c

[ ... ]

> @@ -1211,6 +1239,43 @@ static void rk_phy_powerdown(struct rk_priv_data *=
bsp_priv)
> +static int rk_pcs_init(struct stmmac_priv *priv)
> +{
> +	struct device_node *np =3D priv->device->of_node;
> +	struct device_node *pcs_node;
> +	struct dw_xpcs *xpcs;
> +
> +	pcs_node =3D of_parse_phandle(np, "pcs-handle", 0);
> +	if (!pcs_node)
> +		return -ENODEV;
> +
> +	xpcs =3D xpcs_rk_create(priv->device, pcs_node);
> +	of_node_put(pcs_node);
> +	if (IS_ERR(xpcs))
> +		return PTR_ERR(xpcs);
> +
> +	priv->hw->xpcs =3D xpcs;

[Severity: High]
Does assigning priv->hw->xpcs here leak the allocated memory and break
SGMII initialization?

Looking at stmmac_pcs_setup() in
drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c, the local xpcs variable
initializes to NULL and remains NULL when priv->plat->pcs_init() is called:

stmmac_mdio.c:stmmac_pcs_setup() {
    struct dw_xpcs *xpcs =3D NULL;
    ...
    if (priv->plat->pcs_init) {
        ret =3D priv->plat->pcs_init(priv);
    } else if (fwnode_property_present(devnode, "pcs-handle")) {
        ...
    }
    ...
    priv->hw->xpcs =3D xpcs;
}

Because rk_pcs_init() successfully allocates an XPCS and assigns it to
priv->hw->xpcs, the caller will immediately overwrite priv->hw->xpcs with
its local NULL variable. This drops the reference to the newly allocated
dw_xpcs structure and leaves the device without a valid XPCS, which breaks
rk_select_pcs() and the SGMII configuration.

Should rk_pcs_init() be updated to return the xpcs pointer, or does the
core stmmac_pcs_setup() logic need to be modified to avoid overwriting the
platform-allocated xpcs pointer?

> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261005223011.1124=
347-1-coiaprant@gmail.com?part=3D5
