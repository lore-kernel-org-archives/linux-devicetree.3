Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2111121146C
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 23:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783122292; cv=none; b=DfCT4c1rL2Ud3oEywdtfH+hO/P2uVL5uG7Xtd6kozQVhjkfX+ro3ImgOSof3flTAGuvkFLxT2Bpl+8BZ2tMKfwhWqKr6rRz5BI5VshUd5vZXQQorcWrUWkJO7LLTA7SeX8WjjSZHtQSAng8GN0NqnK7DuulvhYsmpSzuw2TPIlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783122292; c=relaxed/simple;
	bh=kxspGC99XiTZmFif1STuAohV312FH06dq/Dy5wn6/Vc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oEYDOgo521j5v2euWfF3wVQK9lS3ZXnEYq9n7aDVkqffcTOY/ea13rCv/U6s/FriUaHqMV3/6uNIbATWMKAgYLmJbnpe+U0ZFii6Qb4zTYCWPPjcN0cdCLRdrqXTuzwPOJJLIo910RwUei36yTIPRoxcdsoBKRWV+BpkaWXz2BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RNnz1DZ/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RNnz1DZ/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C1801F000E9;
	Fri,  3 Jul 2026 23:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783122290;
	bh=rTA75vgJbDRlFFAx5Rl7dNhraSlgz69UMMDo4+AiSAg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RNnz1DZ/Dsei0Nj3wvrHlSf5kNezOUIYCmGBd7PYzQAzN2xP9qJfZzibGvpe9ZVP3
	 2dFvfGDU2Xk+v04z6CzkqohVI+X5jPdabqKMKl/dk2woAGsqUa0Bm6Bhrz5isIyTC+
	 P8ghDEqFcjz4YndFBBQgwEP98JRIjKUp6Bzr/7uZgxx60b6cklIs3ivFIkghm7pI1s
	 UR68daZ2AgmjsXCN1AoD1ug13K9OZ5klvEry6Bl3s/C50RTAxuZnCzdOYI9EFsU21m
	 yMYgpVbmr4WJMAydnnrEDXzWRnFkS/jEGv2SwIg2NA9QR73EqcJHETWprTB3NUhgGP
	 KqAJX0mIS8nng==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 08/36] phy: rockchip: usbdp: Amend SSC modulation
 deviation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org, devicetree@vger.kernel.org, olteanv@gmail.com, linux-phy@lists.infradead.org, vkoul@kernel.org, robh@kernel.org
In-Reply-To: <20260703-rockchip-usbdp-cleanup-v10-8-a392711ca8a9@collabora.com>
References: <20260703-rockchip-usbdp-cleanup-v10-0-a392711ca8a9@collabora.com>
 <20260703-rockchip-usbdp-cleanup-v10-8-a392711ca8a9@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 03 Jul 2026 23:44:49 +0000
Message-Id: <20260703234449.7C1801F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [Medium] Partial state update during the configuration verification phase=
 leaves inconsistent driver state on error.
--

commit 90f0c5bc1613dc3c61ed76de74f75f85b147f759
Author: Frank Wang <frank.wang@rock-chips.com>

phy: rockchip: usbdp: Amend SSC modulation deviation
   =20
Move SSC modulation deviation into private config of clock.
   =20
 - 24M: 0x00d4[5:0] =3D 0x30
 - 26M: 0x00d4[5:0] =3D 0x33

> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rock=
chip/phy-rockchip-usbdp.c
> index e3f5a26c876a5..cb6acadfbccfb 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c

[ ... ]

While reviewing this, I noticed a pre-existing issue in this file:

drivers/phy/rockchip/phy-rockchip-usbdp.c:rk_udphy_dp_phy_configure() {
...
	if (dp->set_rate) {
		ret =3D rk_udphy_dp_phy_verify_link_rate(udphy, dp);
		if (ret)
			return ret;
	}

	if (dp->set_lanes) {
		ret =3D rk_udphy_dp_phy_verify_lanes(udphy, dp);
		if (ret)
			return ret;
	}

	if (dp->set_voltages) {
		ret =3D rk_udphy_dp_phy_verify_voltages(udphy, dp);
		if (ret)
			return ret;
	}
...
}

[Severity: Medium]
This isn't a bug introduced by this patch, but does partial state update
during the configuration verification phase leave inconsistent driver state
on error?

The helpers rk_udphy_dp_phy_verify_link_rate() and
rk_udphy_dp_phy_verify_lanes() prematurely mutate the driver's internal
state before guaranteeing overall configuration success.

If a caller invokes phy_configure() with set_rate=3D1 and set_voltages=3D1,
the verify_link_rate check might pass and immediately overwrite
udphy->link_rate.

If the verify_voltages check then fails, the function aborts without
programming the hardware or restoring the old link_rate.

Could a subsequent call setting only voltages then use the corrupted
link_rate to configure the PHY clock inversion registers?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260703-rockchip-u=
sbdp-cleanup-v10-0-a392711ca8a9@collabora.com?part=3D8
