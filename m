Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D633383987
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 09:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791537125; cv=none; b=V3KL9g7JEgNIX9AQfUmuByLK1riOO08jv3PQFe5gDJ0xq2lWfe3koiVYb7ld94tE6AEBR7k5t3omPnA+z8b64XP4SF+eo/TwyFagbFMYUQHyWnn3etzgD3djK4sqkoyq67+sIKFBYt4PBD+hwo2jJHgFP/XCS9fMDHwTsCvbLmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791537125; c=relaxed/simple;
	bh=2jOTo03S9NcG12F0jHWqJe3c9v4xqRzeI+Gj2zsa1gE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=bHQUAdKVIW2HicgPjoPUT6HZ9gb7Bs9g8klpOC43s5aTcZUQBb/kDxVNLwNGK8JXfL12zQkdmQp+bneyLt234udzWDwSRrfivTOnvEaUUlbyRWkjW4FBJw3ZY4ZGTzFK3XCySon8gCVPeSsElTdrLjcBdC0nC0Tj6hpBgPReQBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kYy+n5Vr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kYy+n5Vr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E25BC1F000FF;
	Fri,  9 Oct 2026 09:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791537123;
	bh=/tYIftieEEGQIBRwgZ9wQZw0EdBBvp8uhS/hWQXLuyc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kYy+n5Vro/UVipNy9xxm8mUEInIXeFzAYVq4WgRZ0g0o8b/tuG857pUZNPEp5ESUz
	 UWZszpoJrUt/x9fXa81gaEafrIHvEsKN7Gb8c1vfDxqjx5KB2EvrnJ2sAR/fIHdMzN
	 gWpnuMAgv/17wCkUQNyWaria4aKYMs7PEuqSCWd29vuKVlYhsjAaizyT5k7dnVwJ9c
	 XEUVE/+cXuRkahWRQTDwQ47pKgMnpEBC2ctolHzEx/ox9y8EqyLhPgW0U3RvInLPBV
	 csbUYdiYh9+VR9VYZefjTe4hxf8WGs84mcWkqD+/Yk1VYp80QWTAsxd68NfrtWI0Pl
	 sIavnAdrUwgow==
Message-ID: <sashiko-outbox-165134@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] phy: add a driver for T-Head TH1520 USB PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Icenowy Zheng" <zhengxingda@iscas.ac.cn>
Cc: linux-phy@lists.infradead.org, conor+dt@kernel.org, vkoul@kernel.org, olteanv@gmail.com, neil.armstrong@linaro.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20261009090444.3319517-3-zhengxingda@iscas.ac.cn>
References: <20261009090444.3319517-1-zhengxingda@iscas.ac.cn>
 <20261009090444.3319517-3-zhengxingda@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 09:12:02 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] phy: state machine desync on reset_control_assert error in exit
--

commit ec20f3d159c3233e7ce6e058ab085a7384393e38
Author: Icenowy Zheng <zhengxingda@iscas.ac.cn>

phy: add a driver for T-Head TH1520 USB PHY

This commit introduces a new USB PHY driver for the T-Head TH1520 SoC.
It manages basic PHY configuration through a regmap, along with handling
the required reference clock and reset controllers.

> diff --git a/drivers/phy/thead/phy-th1520-usb.c b/drivers/phy/thead/phy-t=
h1520-usb.c
> index 0000000000000..6cb0e51401374 100644
> --- /dev/null
> +++ b/drivers/phy/thead/phy-th1520-usb.c

[ ... ]

> +static int th1520_usb_phy_exit(struct phy *phy)
> +{
> +	struct th1520_usb_phy *th1520_phy =3D phy_get_drvdata(phy);
> +	int ret;
> +
> +	ret =3D reset_control_assert(th1520_phy->phy_reset);
> +	clk_disable_unprepare(th1520_phy->ref_clk);
> +
> +	return ret;
> +}

[Severity: Medium]
If reset_control_assert() fails and returns a negative error code, this
code still disables the reference clock but propagates the error to the
caller.

Looking at the PHY core in phy_exit(), if the driver's exit callback
returns an error, it skips decrementing the initialization counter:

drivers/phy/phy-core.c:phy_exit() {
    ...
	ret =3D phy->ops->exit(phy);
	if (ret < 0 && ret !=3D -ENOTSUPP)
		goto out;

	--phy->init_count;
    ...
out:
	mutex_unlock(&phy->mutex);
	return ret;
}

This leaves the core's software state tracking the PHY as initialized
(init_count > 0), while the actual physical hardware has its reference
clock disabled.=20

A subsequent call to phy_init() by a consumer would then see
init_count > 0, returning success immediately without re-enabling the clock
via the init callback, leaving the PHY permanently broken.

Could this create a state machine desync if the reset controller fails?
Would it be safer to return 0 and ignore the reset failure here to ensure
proper teardown accounting in the core?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009090444.3319=
517-1-zhengxingda@iscas.ac.cn?part=3D2
