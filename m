Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52199313E24
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 23:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783122585; cv=none; b=GoZM5ky8yYnHbN40niNJp8EbuGtFdAuSql4p6Ok3fIBtgvSHx83l3Rxye//cnVUYqYg3YDswAh8TND3deDbvpbxwTXyv8qz8SxksE5+oL2nqVc24ZCytJrSGFRZVAcpCv8xxGxAiybIOHjv38THi5nH2CSyoHHksUnLD+bd7Sn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783122585; c=relaxed/simple;
	bh=C603AokNqB7ed/6FkL9oSaakLVFSA5waCRoM1ace6Xo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DHZWnmBCMsZdL6cCcE3S45aYGM5IPce5etRy8PjuUkt5V5SzqeNuE3qqmSyHY/YF/6n25Yokjln1HwKv0Y9pQjqmeqx75B2N9Xz929JgbCw+rwpvjAh5A78sMf7pwQeAqonWe5s1wY4Na/+W9DaoFRetV8rFePJsa4twHnkRD1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ahnGbnQi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ahnGbnQi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96D701F000E9;
	Fri,  3 Jul 2026 23:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783122584;
	bh=/x3PSLlONBl/BZ7lR2rqsLDqhhtW/0J64dFPP+tzcPc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ahnGbnQixx0Eck3NjfsJPbWf10bFXFGR2xaFJ2dtVv3qvIFhdaaipMaH8UQ00ViMB
	 ljfcCzUYBNX2k3f8u9Jbj+63oCqA45Aj/XxUxLmoPHi0GYv/fANvQVbY7X5c9MgbjG
	 9m67RY7Bkt11oho79SbHMDPb4yWN+gKCtLl37i7MuM88LvgB1S//WdIs1IYZAyJPVf
	 VnqFgDcPT6ex5YCOgBLT3MmcHST/XsNqt4Du04J0sMEZnNnRHJWiqCNR0rqsSDWWVi
	 O5Ev+isXUa7H5Jb1/A2LaGhwVFleZx0FqtccIrE8vSeI9eB1uOlJgfCSsmJAe8Wdv/
	 tYL2+4DlYmP8A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 23/36] phy: rockchip: usbdp: Clear USB status on PHY
 exit
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: devicetree@vger.kernel.org, vkoul@kernel.org, robh@kernel.org, neil.armstrong@linaro.org, linux-phy@lists.infradead.org, olteanv@gmail.com, conor+dt@kernel.org
In-Reply-To: <20260703-rockchip-usbdp-cleanup-v10-23-a392711ca8a9@collabora.com>
References: <20260703-rockchip-usbdp-cleanup-v10-0-a392711ca8a9@collabora.com>
 <20260703-rockchip-usbdp-cleanup-v10-23-a392711ca8a9@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 03 Jul 2026 23:49:43 +0000
Message-Id: <20260703234943.96D701F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Clearing `udphy->status` directly without checking if the PHY hard=
ware should be disabled causes an unbounded clock reference count leak.
--

commit e836c3d9b92996113cb8593f93bf48152ed5de6c
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

phy: rockchip: usbdp: Clear USB status on PHY exit

This commit ensures the USB status flag is cleared when the USB3 PHY is
exited while the system is in DP-only mode. This happens if the USB3
controller device is unbound while a DP-only adapter is plugged in.

Closes: https://sashiko.dev/#/message/20260625-rockchip-usbdp-cleanup-v7-24=
-38eb3cf654fd%40collabora.com

> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rock=
chip/phy-rockchip-usbdp.c
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> @@ -1273,8 +1273,10 @@ static int rk_udphy_usb3_phy_exit(struct phy *phy)
>  	guard(mutex)(&udphy->mutex);
> =20
>  	/* DP only or high-speed */
> -	if (!(udphy->mode & UDPHY_MODE_USB) || udphy->hs)
> +	if (!(udphy->mode & UDPHY_MODE_USB) || udphy->hs) {
> +		udphy->status &=3D ~UDPHY_MODE_USB;
>  		return 0;
> +	}
> =20
>  	rk_udphy_power_off(udphy, UDPHY_MODE_USB);

[Severity: High]
Does clearing udphy->status without actually disabling the hardware cause an
unbounded clock reference count leak?

When the system switches to DP-only mode, udphy->mode loses the
UDPHY_MODE_USB bit. If the USB controller is then unbound, we hit this path
and clear UDPHY_MODE_USB from udphy->status, but return early. The hardware
clocks remain enabled since we bypass the hardware disable call.

If the system then switches back to USB mode, rk_udphy_usb3_phy_init() will
see udphy->status as UDPHY_MODE_NONE and call rk_udphy_setup(). This calls
clk_bulk_prepare_enable() again, incrementing the clock refcount indefinite=
ly
on every cycle.

I see this issue is addressed later in the series by commit
e0219fd5f4d784e78ff969af266e10196367be69 ("phy: rockchip: usbdp: Simplify
power state handling"), but doesn't this patch introduce a regression here
that breaks bisectability?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260703-rockchip-u=
sbdp-cleanup-v10-0-a392711ca8a9@collabora.com?part=3D23
