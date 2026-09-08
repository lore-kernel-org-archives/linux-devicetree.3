Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2332147E5
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 20:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788899113; cv=none; b=MTMINhhJZMqvyeG7bTIw6dKp6Gz5sLdIsH3J7bPK4LUeLLRDxshubndUR7gbOs5Fvp/CFn08Vxx4oUqJmIxe7y2V88/o6mhdiB1EfyUT6RAnNxV5LSnj9TPTCzUOZFw0dJ0vuEjv6Hu83xKY6Yvl9QRONg3ifNsi6Z3o9Gfaymk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788899113; c=relaxed/simple;
	bh=+ufXwoeqL6cYe0Wl9ESo1E1y7zrIkDEat4o5vWlOnwk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=le0to/4iBJU3/cJkd90zZtE10rgi1jnQq3oN+b4CqNPQ7fTMpK7ySpnJcnUuVgE7j/1RkVOV/dh/cB4+iIvty3BJhmKuIGtiQG+Emq47+ECd/c9XdsXkFU7McZbOhUbPICo8zRJ4nIgslUz0LpDRaQ7EQsFwwQesUAbBOPO0AXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MiQrbJSi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MiQrbJSi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AB8C1F00A3A;
	Tue,  8 Sep 2026 20:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788899111;
	bh=DByEoP7UawBMhzE8v6nVl02Qwwxwj6hXfFrMIkuWd8o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MiQrbJSi11mIYwZOIwMbq4nOnP3O2q6OgCj3VhY+GCdzD3eV0uvYTgovlayTjiQJS
	 bkbXBEnnaCMbhjeBYRhMFszXnS033PICS4jJH0vIFfKlLetFIVIs4IAl6fJICjGbNW
	 QmucKOPAPwOf0cvO7ZrIdjWdDpGFtDvvayl8lTen9i28pmKxS8oO2D1F27BZbH1XWS
	 DAslyDEpyiswbhmIcNzGoU417kdxQ3+D05gXd9ZHETJ9RUciek1r2atli3lf2oimUc
	 CUh6UCZspUvIGnrf5kNHdZMi0zfA+Iv/ZBGjv7MBNt+9yP6DgLUZMX1eND9B/Rs/vS
	 BGF9tGZkgriXw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v2 5/9] net: stmmac: qcom-ethqos: fix RGMII_ID
 mode to use DLL bypass
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohd Ayaan Anwar" <mohd.anwar@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260908-shikra_ethernet-v2-5-bbe3389d0652@oss.qualcomm.com>
References: <20260908-shikra_ethernet-v2-0-bbe3389d0652@oss.qualcomm.com>
 <20260908-shikra_ethernet-v2-5-bbe3389d0652@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 20:25:10 +0000
Message-Id: <20260908202511.6AB8C1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver mishandles PHY_INTERFACE_MODE_RGMII_RXID, incorrectly a=
dding a MAC-side RX delay via the DLL, causing double RX delay when combine=
d with the PHY's RX delay.
--

commit 62a16405ee0e741087a5282875b7de0ba607d81f
Author: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

net: stmmac: qcom-ethqos: fix RGMII_ID mode to use DLL bypass

This commit fixes RGMII_ID mode by powering down the MAC's DLL and setting
DDR bypass mode, ensuring the MAC does not add delay when the PHY already
provides it. It introduces a new ethqos_rgmii_id_macro_init() helper and
adjusts clock rate logic accordingly.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/dr=
ivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c

[ ... ]

> @@ -405,8 +416,7 @@ static void ethqos_rgmii_macro_init(struct qcom_ethqo=
s *ethqos, int speed)
>  		      RGMII_IO_MACRO_CONFIG2);
> =20
>  	/* Determine if the PHY adds a 2 ns TX delay or the MAC handles it */
> -	if (ethqos->phy_mode =3D=3D PHY_INTERFACE_MODE_RGMII_ID ||
> -	    ethqos->phy_mode =3D=3D PHY_INTERFACE_MODE_RGMII_TXID)
> +	if (ethqos->phy_mode =3D=3D PHY_INTERFACE_MODE_RGMII_TXID)
>  		phase_shift =3D 0;
>  	else
>  		phase_shift =3D RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN;

[Severity: High]
This is a pre-existing issue, but does this function mishandle
PHY_INTERFACE_MODE_RGMII_RXID?

By keeping RGMII_RXID in this generic initialization path, it appears
the MAC-side RX delay via the DLL will still be enabled later in the
function when negotiating 1Gbps speeds:

	rgmii_setmask(ethqos, SDCC_DDR_CONFIG_PRG_DLY_EN,
		      SDCC_HC_REG_DDR_CONFIG);

Since the PHY already provides an RX delay in RGMII_RXID mode, does this
result in a double RX delay?

A double RX delay could shift the receive clock too far relative to the
data eye at Gigabit speeds, potentially causing data corruption or packet
loss.

While this patch successfully fixes RGMII_ID by moving it to bypass mode,
could RGMII_RXID be broken on platforms that specify it in their device tre=
e,
and would it need similar bypass handling?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908-shikra_eth=
ernet-v2-0-bbe3389d0652@oss.qualcomm.com?part=3D5
