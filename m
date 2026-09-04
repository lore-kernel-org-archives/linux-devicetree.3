Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C954249F11A
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 18:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788548120; cv=none; b=GbwOIMiPhhhb5Kpt/N+4+l/eV+KfE6zK0Mm829dAB6q5g5u4X8p5jy24Am7/38MM/jj73uZ9Ick63Y6LKSF8qCtK0PeoomElh1tYnFybzKuU4qOJzH6O+LHxPKKWarKof/Jl2CxpJqIyXo5sWzlRfO6uPn9WAzy0ljJHnKfNZn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788548120; c=relaxed/simple;
	bh=Dtkkqz02BnoXClFHRCYNCY6KAgjA5wWKLR3/0t2Dm0s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jStA52JnAfq1AcUWAiGvhLUbfk2LyD/a4b/ll0VpEQvAkHFTG0c8PKwOFHVJl3XL26zfwODU2WMuZibr/i+P5aBUFw0cBigQWXVLKhygXjNT3i1kkU4mVQb/lx51dDG06P/TWnV4OEkv2bahdcIzSdsBoV1tfvUHsC8CuESLyhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=khPOENL3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="khPOENL3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B71D1F00A3D;
	Fri,  4 Sep 2026 18:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788548118;
	bh=Dx5q9Q0cXb5WpPhb5LCQUnSMXEJXfEh/7S6NWB+ez50=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=khPOENL3OLrUzUTvQznZKhZa4iVNp3DdX62SZK0OY+lfbJQA7/LHij/f6h/Z1LHbA
	 CdY7tQ/Mww5gmmO8OjMGrm7/uxFmOtpUbb+/Kn4ZBr051v+2OeYQI8DDbX+GyBZ5Rv
	 o72UWmQJf0j8yqwzvSNvaVim+ZAECi75ZxAb7EXKARftu/BIFEcYPwoaf/TsHE1/Bh
	 GkFKbzUMNCkvEdMNm5v0dqg/LS0PXf1h8/Ucx1GUHv0TPPtxSBSbTPAqNkyrxDdAjN
	 Vyg3J875je3TqVL0/mkjKhevAs1IYiucymHERkl3Z5UT26JgJtyTEiD+E0MpjXEBPM
	 GQS2idp0aZ1NQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 6/9] net: stmmac: qcom-ethqos: warn about
 legacy RGMII PHY modes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohd Ayaan Anwar" <mohd.anwar@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260904-shikra_ethernet-v1-6-a50765996035@oss.qualcomm.com>
References: <20260904-shikra_ethernet-v1-0-a50765996035@oss.qualcomm.com>
 <20260904-shikra_ethernet-v1-6-a50765996035@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 18:55:17 +0000
Message-Id: <20260904185518.5B71D1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Deprecation warning causes kernel log spam on every link-up event
--

commit e45fa290281055cacebbbfec0d13fc25cf76f918
Author: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

net: stmmac: qcom-ethqos: warn about legacy RGMII PHY modes

The qcom-ethqos driver is moving towards using "rgmii-id" together
with PHY-provided delays. This commit warns when legacy PHY modes
are used to encourage users to migrate to updated DTBs.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/dr=
ivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index 67738c1598c50..2ca2f03de3017 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -554,6 +554,8 @@ static void ethqos_fix_mac_speed_rgmii(void *bsp_priv,
>  		return;
>  	}
> =20
> +	dev_warn(dev, "legacy RGMII phy-mode detected; consider upgrading to a =
newer DTB\n");

[Severity: Medium]
Is it possible for this warning to cause kernel log spam on every link-up
event?

This statement evaluates every time the link transitions to up, since
stmmac_mac_link_up() calls the priv->plat->fix_mac_speed() callback. If the
Ethernet link flaps, auto-negotiates repeatedly, or is reconnected
frequently, this could flood the kernel log.

Since the phy_mode is evaluated from a static device tree property, would
it be better to use dev_warn_once() here, or move the warning to the
probe path entirely?

> +
>  	/* Initialize the DLL first */
> =20
>  	/* Set DLL_RST */

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904-shikra_eth=
ernet-v1-0-a50765996035@oss.qualcomm.com?part=3D6
