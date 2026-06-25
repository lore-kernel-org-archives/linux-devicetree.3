Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E629245019
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 18:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782410822; cv=none; b=Dk9Pw03+NMz7AmFLneemdtGx4KKgp22L/qVVaKrINY75S2cYYP795BzGEdZD0wiIKRIKD4SBwtFbMQcC8tBw86KhDqhMHyadfNfco9iZumcxbUpQFr9JnrnAxOB+Bv7u4gBIqEPYo2xGb2Jm1rQh0/YUsnWu8QvQmjFdagB7lHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782410822; c=relaxed/simple;
	bh=6H5HIli4mH391tt2UnTsr0qhBr7rIDvscFcpOa523dw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iy4ul9ElxOpIhelSLJ0AIEfdzzRMG6YWqfVgY3LVF9IbWddJKAQmevh0bcS+xJjNe+TV1fSedp5HVkbhT56aI2N48q/STtr/O/eZp6+WLB/84CNhyXXk+5YZVKiRDu/ZqTxAwhA5wxMT98dCuUSNw32G/3D4U/cWSvLW7BeXXsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bzRk+pVU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bzRk+pVU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A26CA1F000E9;
	Thu, 25 Jun 2026 18:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782410821;
	bh=EaZbnQOn0MPQvWZ6F+LS+fFsMM8oBssvZ/nEnaaaFHw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bzRk+pVUBFClFeonxzXcMhYFVdExZNrPnrnu6Ap+zv/OWxvCIVik7//dUx5jG/zCG
	 Gtv9DwUrHKGpedvdWVHEoDiWj8uA/d7c9mpPbX46dNTc4gPgjBeBtNl+bth0NH8PSa
	 vK7PVdQXFxeAvAqtfnUQNA4LHair3LGDIPSFfxox7ajOfHB12DC5QbUrt/DgKFyLXC
	 n2k8AHwtNd4LFHfhUKEnxHKk7pY1/gfUNqHl8ZhH7Ydm6zZ89S1d9eL5RJVO9T9llK
	 0srsQLNUX07MH54M1Ns/lu9n+vHjoVTpXMdysUXgcR24bxcXjzIli9nMUXcZQxL34D
	 WyEdiBjLLeRpA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 08/27] phy: rockchip: usbdp: Limit DP lane count to
 muxed lanes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: linux-phy@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, devicetree@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260625-rockchip-usbdp-cleanup-v7-8-38eb3cf654fd@collabora.com>
References: <20260625-rockchip-usbdp-cleanup-v7-0-38eb3cf654fd@collabora.com>
 <20260625-rockchip-usbdp-cleanup-v7-8-38eb3cf654fd@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 Jun 2026 18:07:00 +0000
Message-Id: <20260625180700.A26CA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The target patch introduces a validation check against `udphy->dp_=
lanes`, but this struct member does not exist at this point in the patch se=
ries, causing a fatal build error. Even if it did exist, it is not initiali=
zed, leading to permanent validation failure.
--

commit 4d319652ccfe3b1db53193c06a94733191acf3bc
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

phy: rockchip: usbdp: Limit DP lane count to muxed lanes

This commit adds a check to limit the DP lane count to the number of muxed
lanes available on the PHY, preventing the DP controller from requesting
4 lanes when restricted to 2.

Closes: https://lore.kernel.org/linux-phy/20260612165546.98E1F1F000E9@smtp.=
kernel.org/

> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rock=
chip/phy-rockchip-usbdp.c
> index 121dd78d8c161..2324f9050f638 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> @@ -1132,6 +1132,9 @@ static int rk_udphy_dp_phy_verify_link_rate(struct =
rk_udphy *udphy,
>  static int rk_udphy_dp_phy_verify_lanes(struct rk_udphy *udphy,
>  					struct phy_configure_opts_dp *dp)
>  {
> +	if (dp->lanes > udphy->dp_lanes)
> +		return -EINVAL;
> +

[Severity: High]
Does this break the build at this point in the patch series?

It appears that the dp_lanes member of struct rk_udphy is not yet declared
or initialized at this point in the tree. This would cause a compilation
failure and break git bisect. Additionally, if the field were present but
uninitialized, it would evaluate to 0 and cause this check to unconditional=
ly
return -EINVAL, breaking DisplayPort configuration.

I understand this is resolved later in the patch series by commit
02003c09070591a7 ("phy: rockchip: usbdp: Support single-lane DP"), which
adds and correctly initializes the dp_lanes struct member. Could the struct
member addition be moved to this commit to ensure the build remains fully
bisectable?

>  	switch (dp->lanes) {
>  	case 1:
>  	case 2:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260625-rockchip-u=
sbdp-cleanup-v7-0-38eb3cf654fd@collabora.com?part=3D8
