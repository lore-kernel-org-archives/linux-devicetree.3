Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B431511235
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 18:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788548118; cv=none; b=Wyu1T3OL6QXklf8qL8n1+mvCna4mQ1tkUaII8dxLJRj+jQm6js4ZiBg43JJrcTAZRGuuaQqCSLF+Cte+9BUAYAa9blNJ3vhczgak86MWzM/3wqht2IgIq+DCmNYmHMrkRt/4KU7VxDzQBAd9qtSVwBlbz8kS+laFjihkxTEJN5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788548118; c=relaxed/simple;
	bh=N5uLxLQSj2CgbzY2/yz3gE7KDOLY+52/NB9mRLkIUY8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nFQiprVdxkyqhKD4nRnbKOkOVma4J5KRMlqAEKfWcxW/64MyX7hMPNBf5dVWFVP3s66h5r3y3+wGmezru5gzKcHywW4ZGp2b43sx4sJKAm+meKjc7Ouc+yYIDAvJ855pVZrlrMRZE81MR5q/p6ngx/IHCtUriTuNot/H/hdsnxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZKGfDZJh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZKGfDZJh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C64161F00A3D;
	Fri,  4 Sep 2026 18:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788548116;
	bh=Q5PpMcX0zSd5n5dkJzhyBNMqB1L1FL8ov2CQh8zb11k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZKGfDZJh+ZPG8Rp+yhaxl1k4+eejHPwKLqfGihouWU4LlTYRUXPQZbLMUqD7ZsTER
	 9WdwOsG2Qt8lfdAb7/jvUZ9qK33ot1Q8jZPPA7PYdW6sU6Ea8KhWPDaft8M0tQ07fR
	 mY9nFUlvQq6cwrKjjragLuklkuKJohCk+FZBpDx5xoBNA/TIIGJQIXN3YvYOWPEzql
	 aSFLGvD4hx+GViaoe57w+ZhrtelM9X0Pi3HElR9Maa0f2vYuIGG86hRsIkRNIRplxR
	 +7N3dDof7LWp/owndSzdc/lO9FeQaHuM9KJPJGhqQhvOuea+wKnGTePYhzdz30bgsF
	 rQ/JHf3jqPyAQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 5/9] net: stmmac: qcom-ethqos: fix RGMII_ID
 mode to use DLL bypass
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohd Ayaan Anwar" <mohd.anwar@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260904-shikra_ethernet-v1-5-a50765996035@oss.qualcomm.com>
References: <20260904-shikra_ethernet-v1-0-a50765996035@oss.qualcomm.com>
 <20260904-shikra_ethernet-v1-5-a50765996035@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 18:55:15 +0000
Message-Id: <20260904185515.C64161F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] ethqos_set_clk_tx_rate() fails to double the TX clock rate for RGM=
II_RXID and RGMII_TXID at 10M/100M speeds, breaking MAC-side delay hardware.
--

commit 0e659e67f69f5c33161dd3e01478dcbdaa1c7d6f
Author: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

net: stmmac: qcom-ethqos: fix RGMII_ID mode to use DLL bypass

This commit powers down the DLL and sets DDR bypass mode for RGMII_ID,
and introduces ethqos_rgmii_id_macro_init() to program the IO_MACRO. It
also updates ethqos_set_clk_tx_rate() to skip doubling the clock rate for
100M/10M in bypass mode.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/dr=
ivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
[ ... ]
> @@ -183,7 +186,15 @@ static int ethqos_set_clk_tx_rate(void *bsp_priv, st=
ruct clk *clk_tx_i,
>  	if (rate < 0)
>  		return rate;
> =20
> -	return clk_set_rate(ethqos->link_clk, rate * 2);
> +	/* Clock Rate Requirements:
> +	 * MAC added delay: 250/50/5 Mhz for 1G/100M/10M
> +	 * No MAC delay (DLL bypass): 250/25/2.5 Mhz for 1G/100M/10M
> +	 */
> +	if (ethqos->phy_mode =3D=3D PHY_INTERFACE_MODE_RGMII ||
> +	    speed =3D=3D SPEED_1000)
> +		rate *=3D 2;

[Severity: High]
Does this conditional exclude PHY_INTERFACE_MODE_RGMII_TXID and
PHY_INTERFACE_MODE_RGMII_RXID from having their TX clock rate doubled at 10M
and 100M speeds?

If the device tree configures the PHY mode as rgmii-txid or rgmii-rxid,
those modes fall through to the non-bypass DLL initialization path in
ethqos_fix_mac_speed_rgmii().

Since this logic only explicitly checks for PHY_INTERFACE_MODE_RGMII, will
it result in the MAC DLL receiving half the expected clock frequency? Could
this break ethernet connectivity or cause data corruption for these
configurations at 10M and 100M?

> +
> +	return clk_set_rate(ethqos->link_clk, rate);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904-shikra_eth=
ernet-v1-0-a50765996035@oss.qualcomm.com?part=3D5
