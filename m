Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794945189;
	b=oVa1Z1hCgL/b5rZD9WnZQtbFpJ5Axqlc0h3dB6UfpICCD7gW24DXZkXRA0POGMf3MBb3
	 LtwXKjTzCudZ8WQGPccHYrpIIObAOF65CfCyecEN/7Z4yLxcqhJcSp8qN84gSx84wryqb
	 iagkGo182lP6gtdbeM4fLFJ71dtNQVe+kZy8rM0t7B01LtRu8GWzj1T44A+s6kHMrPIXM
	 KGZ6gYvdA8QdnF5dZ4AIbRlijuyphmUwMVW0IN0mn4WKnWgrN9JsZXbEpNM0o5R+5fizH
	 BevfjslfwEgHknFDM2g3fRKYXa5WpWNNOs+MaHPsLKhWkGEQjB9Ry6MT++4I/QC0NLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794945189;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=UXNpEjorEXEGBzkz6frYBkjwt0vJlTwPI7hpnjwUJms=;
	b=ga3hmEGQVCBTs0cWHSc3dnWh7tDVtA2BDRBKLQQAQOZEsqF2FokJPaMjX4Pp2LwZUa5L
	 /xv8Id0TBG+gRZByVxOjEk9GsZCsuuT3DZYRFiOX3FD3d0eRWEaXWdsamJkAa2rjd4VHm
	 WCO5C9J4eyW1jVeOEDeEWwUn0l+Lfnd+L4LFx9GHhBOiKzuUYprscI8yTID+i/w3Zqj//
	 rWQINnuIzzAM34C8XQCacI15XbETRKKiNG8BjeU45q0gVfsyn4iM2B3YFWKO03DBUUhWl
	 N2xY3z1vmSKyakdxidhwE8Lg6G9veK/6rQHOAEmG/nlFGk0JY7PVjL0qsMbYwvnQbjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f7HkA83m;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDCE4606A335;
	Tue, 17 Nov 2026 19:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f7HkA83m
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50F291F000C7;
	Tue, 17 Nov 2026 19:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794945189;
	bh=UXNpEjorEXEGBzkz6frYBkjwt0vJlTwPI7hpnjwUJms=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=f7HkA83mZ2hkM6q5TflbOk3rGTRu14yimlNgeL9Rt21X1OIUQ2TXijOI5T2HYAU9I
	 wTOXIWvJ3SIIcz5FUhC7h1BWqagxFJe/cKzdqMt/k/GmEsjGMX16exVaPmmjwOfqog
	 pHD6OtU+9Fx/dF9O7Lwhsb5AvXNZbAC/NGYWUfHIWKBVmrTxeBd47astNsG28swxrW
	 pWOa+ZVt4c0I3ISxrb6MpfF/a10DgcGFxBpi3SRqXM/2y+mWP0cyZr77VuxyPlOgu2
	 IAV8/WgQ0BKBfqDCIe9/xhAe0HlXl5G/uLcgNqXJd/UdA0PUoiTJ2ufskZnxqmxoWI
	 Buc8DxXJNiXUA==
Subject: Re: [PATCH net-next v11 13/14] net: phy: ncn26000: Support for
 onsemi's S2500 internal phy
From: netdev-bot+sashiko@kernel.org
To: Selvamani.Rajagopal@onsemi.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, kuba@kernel.org,
 pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 parthiban.veerasooran@microchip.com, horms@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, rdunlap@infradead.org, richardcochran@gmail.com,
 andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 edumazet@kernel.org, piergiorgio.beruto@gmail.com, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, jerry.ray@microchip.com, ciprian.regus@analog.com
Date: Tue, 17 Nov 2026 19:53:07 +0000
Message-ID: <179494518788.3136.14432777334635452577@kernel.org>
In-Reply-To: <20261113-s2500-mac-phy-support-v11-13-7a186141952c@onsemi.com>
References: <20261113-s2500-mac-phy-support-v11-13-7a186141952c@onsemi.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The new S2500 entry in ncn26000_driver[]
  (drivers/net/phy/ncn26000.c) sets `.set_plca_cfg =…

--

net: phy: ncn26000: Support for onsemi's S2500 internal phy

This patch adds a phy_driver entry for the internal PHY of the onsemi
S2500 MAC-PHY to the ncn26000 driver. The NCN26000 TO_TIMER workaround is
skipped on the S2500, and the new entry gets its own config_aneg. It also
adds SQI, OATC14 cable test, loopback and direct C45 MMD access callbacks.

> diff --git a/drivers/net/phy/ncn26000.c b/drivers/net/phy/ncn26000.c
> index 888d74b831256..0e2c978b73d49 100644
> --- a/drivers/net/phy/ncn26000.c
> +++ b/drivers/net/phy/ncn26000.c

[ ... ]

> @@ -162,6 +179,25 @@ static int ncn26000_config_intr(struct phy_device *phydev)
>  }
>  
>  static struct phy_driver ncn26000_driver[] = {
> +	{
> +		PHY_ID_MATCH_MODEL(PHY_ID_S2500),
> +		.name                  = "S2500",
> +		.features              = PHY_BASIC_T1S_P2MP_FEATURES,
> +		.config_init           = ncn26000_config_init,
> +		.config_aneg           = s2500_config_aneg,
> +		.read_status           = ncn26000_read_status,
> +		.set_loopback          = genphy_loopback_no_speed,
> +		.set_plca_cfg          = ncn26000_c45_plca_set_cfg,

[Severity: Low]
Does bit 7 of VEND2 register 0x8001 also mean Enhanced Noise Immunity on
the S2500?

The S2500 entry reuses ncn26000_c45_plca_set_cfg(). After the generic PLCA
setup, that function also writes the NCN26000-specific ENI bit:

drivers/net/phy/ncn26000.c:ncn26000_c45_plca_set_cfg() {
    ...
	eni_cfg = (plca_cfg->enabled) ? NCN26000_PHYCFG1_ENI : 0;
	return phy_modify_mmd(phydev, MDIO_MMD_VEND2,
			      NCN26000_REG_PHYCFG1,
			      NCN26000_PHYCFG1_ENI, eni_cfg);
}

The S2500 MAC driver gives the same MMS4 register a different name, and
does not define an ENI bit for it:

drivers/net/ethernet/onsemi/s2500/s2500_hw_def.h:
#define S2500_REG_VS_TWEAKS1		0x8001

The commit message covers one PLCA difference between the two parts (the
TO_TIMER default). It does not say whether TWEAKS1[7] has the same ENI
meaning on the S2500.

If the meaning differs, each ethtool PLCA enable or disable would toggle
an unrelated vendor tuning bit through this path:

phy_ethtool_set_plca_cfg()->ncn26000_c45_plca_set_cfg()->phy_modify_mmd()

Could this be confirmed in the commit message or in a comment? If the bit
is different on the S2500, the entry could call genphy_c45_plca_set_cfg()
directly instead.

> +		.get_plca_cfg          = genphy_c45_plca_get_cfg,
> +		.get_plca_status       = genphy_c45_plca_get_status,
> +		.soft_reset            = genphy_soft_reset,

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261113-s2500-mac-phy-support-v11-0-7a186141952c%40onsemi.com
