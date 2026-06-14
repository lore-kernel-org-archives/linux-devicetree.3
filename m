Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D135C39EF20
	for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 18:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781461252; cv=none; b=pOb2BMrqJBwXgtX52CHfDSTjmzncVoFKaVjin/juESzX1g1C+LysoGFg4zSsbsNYlWeiY0XM4cVfLdpFGE9fEDa1kyzb5z3slwNDryhI+htqNqL7Msbt8AROrzpKttDSW8ROnAWOs7Kuj7axF8oIEU8KdVfM8RuWNlvjL5YkM40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781461252; c=relaxed/simple;
	bh=9dQUtLTiaoFprClcmbTOIvZ1oMI8ydKarMtkFGRG+dw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gCRTv/H9az/Yy3Lgua5g7O3uQqKnDwoo/AZws6F/BTLUXArNq4eH50HGXY5b+QgWsusjTt/yEqNqRCawseCxZAFZle/PIiMQBHcfR5yfRfA03+a5cx/7d91iMN/fyu8t1Nj30vhNO557tY9mpw6pSDt5ot+cAFZ54rETXFDz8Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WlEv+ZGm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WlEv+ZGm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68C771F000E9;
	Sun, 14 Jun 2026 18:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781461248;
	bh=fP5POGdbRzDrMNz5+SylWNEZzOdcB2FWXN7ZIB9Zu/0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WlEv+ZGmdh7GcdR6D/N5msU3BmxpA/fKghWi5Rt5KV9j3M3tlJRE1HpP2L8mBqVjI
	 MZeDMVOuqgJ++jsRoEmIDn91h/LIB3EMAWeDoiptNfHpAtxYnO/VQIkiGVNLPc9k29
	 kCd0rhuhp0Sn7sMcPsJNzyEgOaa2vjCVWxZkoJkFDI+4gvA8wqPDxtegL7DwQiR9vJ
	 Up6MkYjYA7Hb0KQM8n2vCl0Va3XdhyoMv1xbltYErlVp2XCnRYQ10fuohj5Cw4dAT/
	 +u6FD5af9x8lw5yiFLFQBbDKB5ujK8Zp84NrbgxKvM1AArUx573kxWW1KSKapr7PiC
	 ZzguDpyPA2bow==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v5 2/4] net: phy: mediatek: add phy driver for
 MT7628 built-in Fast Ethernet PHYs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joris Vaisvila" <joey@tinyisr.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260613181845.111877-3-joey@tinyisr.com>
References: <20260613181845.111877-3-joey@tinyisr.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 14 Jun 2026 18:20:47 +0000
Message-Id: <20260614182048.68C771F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The `mtk_soc_fe_phy_driver` lacks `.suspend` and `.resume` callbac=
ks (typically assigned to `genphy_suspend` and `genphy_resume`). This cause=
s a severe power management regression and breaks hardware initialization a=
fter system resume. Without a `.suspend` callback, `phy_suspend()` returns =
0 without powering down the PHY (`BMCR_PDOWN`). Furthermore, `mdio_bus_phy_=
may_suspend()` returns false, which prevents `phydev->suspended_by_mdio_bus=
` from being set to 1 during system suspend. During system resume, `mdio_bu=
s_phy_resume()` checks this flag and, seeing it is false, completely skips =
calling `phy_init_hw()`. Because `phy_init_hw()` is bypassed, the driver's =
`.config_init` callback (`mt7628_phy_config_init`) is never executed. Since=
 this callback sets a critical undocumented bit required for 100 Mbps links=
, the PHY will silently fail to establish correct links if it loses power o=
r state during suspend.
--

commit 6c0828ab418aa7d550c1020af637c9ed3e4c1236
Author: Joris Vaisvila <joey@tinyisr.com>

net: phy: mediatek: add phy driver for MT7628 built-in Fast Ethernet PHYs

This commit adds support for the Fast Ethernet PHYs in the MT7628 SoCs.
It adds the MEDIATEK_FE_SOC_PHY Kconfig option and the corresponding
mtk-fe-soc.c driver to set an undocumented bit required for 100mbps links.

> diff --git a/drivers/net/phy/mediatek/mtk-fe-soc.c b/drivers/net/phy/medi=
atek/mtk-fe-soc.c
> new file mode 100644
> index 0000000000000..9eb4960bcaade
> --- /dev/null
> +++ b/drivers/net/phy/mediatek/mtk-fe-soc.c

[ ... ]

> +static struct phy_driver mtk_soc_fe_phy_driver[] =3D {
> +	{
> +		PHY_ID_MATCH_EXACT(MTK_FPHY_ID_MT7628),
> +		.name =3D "MediaTek MT7628 PHY",
> +		.config_init =3D mt7628_phy_config_init,
> +		.read_page =3D mt7628_phy_read_page,
> +		.write_page =3D mt7628_phy_write_page,
> +	},
> +};

[Severity: High]
Does this driver need .suspend and .resume callbacks (like genphy_suspend
and genphy_resume) to properly handle system power management?

Without a .suspend callback, mdio_bus_phy_may_suspend() returns false,
which prevents phydev->suspended_by_mdio_bus from being set during system
suspend.

During resume, mdio_bus_phy_resume() checks this flag and skips calling
phy_init_hw() entirely. Because phy_init_hw() is bypassed, the
mt7628_phy_config_init() callback is never executed after a resume.

Will this cause the PHY to silently fail to establish 100 Mbps links after
waking up from suspend because the undocumented bit is lost?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260613181845.1118=
77-1-joey@tinyisr.com?part=3D2
