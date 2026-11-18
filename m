Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794991636;
	b=FwslFgCq58kEPL4ZBItrOI6CD4afvxSYSCpbpnswwi7Sm4jOAlcE524PI15KukIXztXX
	 iNX7YkbQuSYVdyZFLR95Y3IB2cVxDA/oG8OW5COOAbclZWSCnX9WJGbx7SJi4uuH3D53i
	 lmvPlu9KjAvwQfFgOgF6HWa6CnNsHTnr04gjFWJ1l3GV0xAYg5uc7bDyqqp6hCrRYAXnl
	 dhKz4Va7biiUhC6fzWS0cDsZz3eQuSk0dMBDxx4t18GtUpBdz+Zv6RvWrcQTNTUl4EbFS
	 2zuHx/eyQO5Vh4JsTX3iD3xYfBFKdLtL3aLoKp4u9PRBhOgylJV03XWyZlAp2bmz9QA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794991636;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=YSFz3xr0Ka3dIWuBgo2VhzXnoDe5BqscI5is3FqVKAI=;
	b=a1mid9cpqwkAKWSi5+6hv2CosENkeN56AzCtIr7zimV31LoazFnu6iVO55wvTjzxsL3o
	 b8+JG8ZW7FEGxKlKUS/L8SVJncLQI9cfRgPmF2imOidfeqyqGmwoFpHyfeSi5Jf2LMieq
	 K3OeHHtvf7q+6seOangsEOCg6XN+0IOlnMhWsF0rvFiWwTMqxJVHn3+0R0iwEDkjouugS
	 SFvOA9ZzcArmiyA/O2v7lZVDjs1hPFQCa9bpCQNcCruRwZLwzYtIROzymSSVFoa4jAey+
	 ocgvwsEE/7BO4mi3PCmhgim3M4MaudaXDNxB/2zkuV95W4UAyzJ0liFKlIBnOMC8/xQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ekqywKje;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A826606A31C
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 08:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ekqywKje
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A7D71F000C9;
	Wed, 18 Nov 2026 08:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794991635;
	bh=YSFz3xr0Ka3dIWuBgo2VhzXnoDe5BqscI5is3FqVKAI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ekqywKjeJvoyawRGvDtOTomKo1Exw26Ao9kBYU8yDNCXI4JcbDULrtajC1yy5jK2N
	 n+oyVenqn+XZS0BQFJa2227X29RHkwWNGLrpQPyFg/d5S398Q2cpeh5itusuWyiQw5
	 +qmszHIzvVkVb3JcYJQmI55iTaPtpl3UUVyc+k7LpIZwlGkc3LhmOByu4KrlB0QGgr
	 DBGE69ZGaNn4Waw5zxeooBSGCTZKqoGXouJy6osTGxnqX7By091FNMwt8fOG3vKwPj
	 VRYCFxtMeEyCCaCle8WhERGrb+qdZZv8cxuoEx4A2MrsaIFTcF5CLEz49uH6VjvLs1
	 eI/6GSyrJaI5g==
Message-ID: <sashiko-outbox-220498@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 05/10] net: stmmac: qcom-ethqos: add
 DLL-bypass for PHY-managed RGMII delays
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohd Ayaan Anwar" <mohd.anwar@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261117-shikra_ethernet-v4-5-c41902e5f2fa@oss.qualcomm.com>
References: <20261117-shikra_ethernet-v4-0-c41902e5f2fa@oss.qualcomm.com>
 <20261117-shikra_ethernet-v4-5-c41902e5f2fa@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 08:47:15 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] net: stmmac: missing phy_managed_delays check in
  ethqos_set_clk_tx_rate()
--

commit 5b51c98eb57ae32a708640c644714299b1e6a312
Author: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

net: stmmac: qcom-ethqos: add DLL-bypass for PHY-managed RGMII delays

This commit adds DLL-bypass and IO_MACRO configuration for PHY_INTERFACE_MO=
DE_RGMII_ID
guarded by a platform descriptor flag, and updates ethqos_set_clk_tx_rate()=
 to
avoid doubling the link clock rate at 100M/10M in bypass mode.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/dr=
ivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index f2428f0467bbb..99ea7e0cfb00d 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
[ ... ]
> @@ -189,7 +193,15 @@ static int ethqos_set_clk_tx_rate(void *bsp_priv, st=
ruct clk *clk_tx_i,
>  	if (rate < 0)
>  		return rate;
> =20
> -	return clk_set_rate(ethqos->link_clk, rate * 2);
> +	/* Clock Rate Requirements:
> +	 * MAC added delay: 250/50/5 MHz for 1G/100M/10M
> +	 * No MAC delay (DLL bypass): 250/25/2.5 MHz for 1G/100M/10M
> +	 */
> +	if (ethqos->phy_mode !=3D PHY_INTERFACE_MODE_RGMII_ID ||
> +	    speed =3D=3D SPEED_1000)
> +		rate *=3D 2;
> +
> +	return clk_set_rate(ethqos->link_clk, rate);
>  }

[Severity: Medium]
Should this condition also check !ethqos->data->phy_managed_delays?

In ethqos_fix_mac_speed_rgmii(), the new DLL-bypass path
ethqos_configure_rgmii_id() is only taken when both
ethqos->data->phy_managed_delays and PHY_INTERFACE_MODE_RGMII_ID are set.
On existing platforms where phy_managed_delays is false, a board using
rgmii-id still takes the non-bypass path in ethqos_rgmii_macro_init(),
which programs DDR mode and expects the 2x clock rate (50 MHz / 5 MHz),
while ethqos_set_clk_tx_rate() will now set link_clk to 25 MHz / 2.5 MHz
at 100M and 10M.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-shikra_eth=
ernet-v4-0-c41902e5f2fa@oss.qualcomm.com?part=3D5
