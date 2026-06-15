Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76FC2D63E5;
	Mon, 15 Jun 2026 13:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781528524; cv=none; b=Y8yZhrrvx3cJF219N9BvebXtYCuqtrtKjo/Tqcyb4g4D4db4dBmkwCkT+RQQBth4g9P7o8bog8ubGRmrim5FITg/149gyXu7B5LrxTCE6rP3BDlDJktEGrpuJ1tO9j1BkOIiIM7HQ+OdbhxxtSFMXe5LT+7a0Zk8NQksd55345I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781528524; c=relaxed/simple;
	bh=4R72PtRdeQ0I1tu2r8jsBM3qPQ7dlP7ay4Jpm2M0dcQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Zw5TfPmLHLoLkIU3wuvdJ04Ic3rcO0xchl69mcbpdoWvoT1M+kLE/iVLE7jJIQHv+shzE8QAe92fgEjWZnaquEaqUE/lYiNJt4Rfe9Ka4k6M553uoJ4mZP7HUlCsgRfz2Mnfq/gVT1TDBK5A34hGU9/iaGohHjoP4nKDNggjnoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=WpbqWBWv; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="WpbqWBWv"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=tPjmqX9SMTeCykCfytbi1fpwWJ22FWgRgMVFy1mXudo=; b=WpbqWBWvTzXryDqoZIBXExPhvv
	kC4TAdAZPOGy3MWoEl9R/ridFn0Caqhgf6h44LSmRNpCoDSTrqd9CL6EsZC6lxZgUJlTXiJWw3xFl
	+95E2b7+/FYv6Ncrs9pgKL1jpnGUbQJX1FCdxKgV2sq9g+GMdGSdK1wK2KsDmd2zaN1MtTobwxuOi
	kiMyjzV7srbexEZXMXzTEvwGJbilvUhVCUWQGKRl8YCxFvNXODPowabXfP3XLL+St6/i332uPzH5A
	bnQ2u2XKMLvfGXUDYnI4O+ZconYoCd+homOJwc3DXlEcZN7dVqdjWJQoOmoWi2MVv6u/JvyvT7Yzz
	AVSBdotg==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 Damon Ding <damon.ding@rock-chips.com>
Cc: sebastian.reichel@collabora.com, nicolas.frattaroli@collabora.com,
 alchark@gmail.com, detlev.casanova@collabora.com,
 cristian.ciocaltea@collabora.com, michael.riesch@collabora.com,
 andy.yan@rock-chips.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 0/3] Add eDP support for RK3576
Date: Mon, 15 Jun 2026 15:01:38 +0200
Message-ID: <3213683.CbtlEUcBR6@diego>
In-Reply-To: <cd1f968a-2e1b-434f-a331-a60cd8740032@rock-chips.com>
References:
 <20260605022305.3058853-1-damon.ding@rock-chips.com>
 <cd1f968a-2e1b-434f-a331-a60cd8740032@rock-chips.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Damon,

Am Montag, 15. Juni 2026, 14:33:03 Mitteleurop=C3=A4ische Sommerzeit schrie=
b Damon Ding:
> Gentle ping on this patch series.

Linux 7.1 was released yesterday, so we're in the merge-window now.
(And the 5th of june was shortly before -rc7, so too late for 7.2)

So I'll pick those up after the merge window end in 2 weeks.


Heiko

>=20
> Best regards,
> Damon
>=20
> On 6/5/2026 10:23 AM, Damon Ding wrote:
> > Picked from:
> > https://lore.kernel.org/all/20260601065100.1103873-1-damon.ding@rock-ch=
ips.com/
> >=20
> > Patch 1-2 are to add missing clock "hclk" for RK3588 eDP nodes.
> > Patch 3 is to add the RK3576 eDP node.
> >=20
> > Damon Ding (3):
> >    arm64: dts: rockchip: Add missing hclk for RK3588 eDP0
> >    arm64: dts: rockchip: Add missing hclk for RK3588 eDP1
> >    arm64: dts: rockchip: Add eDP node for RK3576
> >=20
> >   arch/arm64/boot/dts/rockchip/rk3576.dtsi      | 28 +++++++++++++++++++
> >   arch/arm64/boot/dts/rockchip/rk3588-base.dtsi |  4 +--
> >   .../arm64/boot/dts/rockchip/rk3588-extra.dtsi |  4 +--
> >   3 files changed, 32 insertions(+), 4 deletions(-)
> >=20
> > ---
> >=20
> > Changes in v2:
> > - Split out separate patches to add the "hclk" clock reference.
> > - Split out separate patches to enable the "hclk" clock.
> > - Add Reviewed-by tag.
> >=20
> > Changes in v3:
> > - Add a patch to expand descriptions for clocks of the eDP node.
> > - Add Reviewed-by tag.
> >=20
> > Changes in v4:
> > - Modify commit msg.
> >=20
> > Changes in v5:
> > - Enforce the correct third clock name on a per-compatible basis.
> > - Modify the commit msg simultaneously.
> > - Add Acked-by tag.
> >=20
> > Changes in v6:
> > - Expand more detail commit msg about using hclk instead of grf clock.
> >=20
> > Changes in v7:
> > - List all valid clock names at the top level, and constrain the clock
> >    count for each platform with minItems/maxItems in allOf.
> >=20
> > Changes in v8:
> > - Fix indentation to 10 for enum in clock-names property.
> >=20
> > Changes in v9:
> > - Restore the explicit clock-names for RK3399 and RK3588 eDP dt-binding=
s.
> >=20
> > Changes in v10:
> > - Use automatic cleanup to fix OF node reference leak reported by
> >    Sashiko.
> >=20
> > Changes in v11:
> > - Pick and rebase DT related patches.
> >=20
>=20
>=20




