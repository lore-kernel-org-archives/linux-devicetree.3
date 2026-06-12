Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18DA73911C5
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 17:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781284007; cv=none; b=s+10egoTi1Lz9Ywtld6dOoE7gFSYQwueQlvDN0MqO5woP5nRoD5xBSiL0w1gO5FkMhvaPjVUShW64gU36aVTG5RSb8Q2JpBPFEiOFz7nS3gkAFgWcQgN3/eVABbS+GkgZtkjQX70YJXvoyL98dwEFVc1t8uN8tjRLWJxmhVisKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781284007; c=relaxed/simple;
	bh=jlw3Jt0YZjpFWpxaIxPbaBDohf0dkFX4wrPdjfGLq8Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=u3Zwv3gn5xJLzeic9TIn9SUWEvnXg50xlca/KwsFiSm2sk8xyhftNPFnWHfFrXBEntc40lfmLu28wkLfMsjTpJ7vZMjIHLq5nM7iSQ5vG4UGI13YCFFEhyEmf37LrcubBAE1PhD3+wA5GFlBAmi62myZFquVOxo/Mk8MjisgGjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CP6/veqR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CP6/veqR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 060BC1F000E9;
	Fri, 12 Jun 2026 17:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781284005;
	bh=B4V1aZFrTPWCVtWm1aK9wzIjct1SKl/aweN1HBLXMwU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CP6/veqRrY9X5Q6XKYSsQbd0CNU2Q+KE4cbjqtixSxeHcSk6BY8sfDOfSj7NNheIg
	 LiSqzBVa6KJLnHY6MC0NApxeLwFV5w7G+5hWX02FqUcUpwDQZuSHjOFaydlRz7vbPJ
	 dERvE15mw2gSmOv9nc01Xl4MGFzSK6vvxVjLeojuiXdnCC/mcpd5cKxdQXsbOJDRXU
	 bZwjjNL0vrcY5km9C5FZnqLNqHLPWaPRSK0N6IuUl1oKLg78ZU7aSF6U8zTml57Sw9
	 OSUCwU3faFCUcrQA9TWXZ+1pOoDI/F89EMk3TRme86mDZfqIQrAn8vE3WFvT98NKAl
	 s2IGxRdfKfp0Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 18/18] phy: rockchip: usbdp: Add some extra debug
 messages
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, vkoul@kernel.org, linux-phy@lists.infradead.org, robh@kernel.org
In-Reply-To: <20260612-rockchip-usbdp-cleanup-v5-18-efc83069869f@collabora.com>
References: <20260612-rockchip-usbdp-cleanup-v5-18-efc83069869f@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 12 Jun 2026 17:06:44 +0000
Message-Id: <20260612170645.060BC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Missing explicit inclusion of `<linux/string_choices.h>` for string=
 choice helpers.
--

commit 1df9f844b4fa19da9efe1fba10ad8a1d451bea55
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

phy: rockchip: usbdp: Add some extra debug messages

This commit adds additional debug logging to the Rockchip USBDP PHY
driver. The new messages report port status and track PHY initialization
to help debug USB-C hotplugging behavior.

> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rock=
chip/phy-rockchip-usbdp.c
> index 236331cc0d132..4042e2dd81219 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> @@ -491,6 +491,8 @@ static void rk_udphy_u3_port_disable(struct rk_udphy =
*udphy, u8 disable)
>  	const struct rk_udphy_cfg *cfg =3D udphy->cfgs;
>  	const struct rk_udphy_grf_reg *preg;
> =20
> +	dev_dbg(udphy->dev, "USB3 port %s\n", str_on_off(!disable));

[Severity: Low]
Does this file explicitly include <linux/string_choices.h>? Relying on
implicit inclusion for str_on_off() might cause build failures in the future
if header dependencies are reorganized across architectures.

[ ... ]

> @@ -784,6 +786,10 @@ static int rk_udphy_init(struct rk_udphy *udphy)
>  	const struct rk_udphy_cfg *cfg =3D udphy->cfgs;
>  	int ret;
> =20
> +	dev_dbg(udphy->dev, "(re-)init PHY with USB=3D%s and DP=3D%s\n",
> +		str_enabled_disabled(udphy->mode & UDPHY_MODE_USB),
> +		str_enabled_disabled(udphy->mode & UDPHY_MODE_DP));

[Severity: Low]
Similarly, should we add <linux/string_choices.h> here to ensure
str_enabled_disabled() is safely resolved without relying on transitive
includes?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260612-rockchip-u=
sbdp-cleanup-v5-0-efc83069869f@collabora.com?part=3D18
