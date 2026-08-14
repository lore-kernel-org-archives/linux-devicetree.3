Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F022F8E95
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 01:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786671206; cv=none; b=oPzOn9CZfBH5me7xKvRbQtOO3ys3WW73WJrGcjD4sJOYwwmRsu6VW5Z7qLbd3UNgQ+4T4PQ0bkCYGDcr3NMbaac6i85Dfmc1ClOqfvrTom64gWd0lkPKoEl2l975Owz3i7cNYjdHK6GF6E6909/pXywvQ4EX3tcwqFs9FtJjt5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786671206; c=relaxed/simple;
	bh=exnqSjgFxFXGmH3pGDH+8HXZBHlaH+3Z7YTuVyJCHbA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NMdajSGl4SvCztVElPWIoSgGHVO1emYP3kM244zmZw/ibtJ3PDjdX8JBosQ81iaflvC8GEO5+H8OTArNVYoMMVbsshU0PjrBdU4kNPfKHO0jJKIUVc9/yMJ4I+mlWklD9x9umJ6s3jbR5VRO6Dw9xPllC20e3lZfFokzJGkc3F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jm+y3HVm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jm+y3HVm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 085C81F000E9;
	Fri, 14 Aug 2026 01:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786671193;
	bh=SWbVjrVGbggzvrNgH67lWzgSbB7jYj9A+xpsN/KiGp8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Jm+y3HVmp5aoal7r1BW7yXp+BwAevzxtzzPIF19x04JcUdzzMMw3M3n6PElVbGrQ/
	 UqraezRQNPmloZdTWNz6eow5afRnyHDy8nS2eZ7vPS1sZOAwqT2UDqLNF12m/wtf4F
	 8u3mSEmUJ9u+UsXsfNKeerUUtxPFHp+fBOkF2WQpDj47G7nFnPXhJAgtNrkYXabIS5
	 jznJJm87vlzSGwiUBece/9o/yHfFSBqS9YpTC/tIg8Cc28q7EcVwxgIYkKtXr4HzYy
	 YsQmxMli5f6VzW9ABQDPsEuIq4BhVhmJA0U4EIfdXxjhs1qiRCT8BWSqoHOf0OERVT
	 7vFjDga6b88oQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 03/38] phy: rockchip: usbdp: Do not lose USB3 PHY
 status
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: robh@kernel.org, vkoul@kernel.org, linux-phy@lists.infradead.org, conor+dt@kernel.org, olteanv@gmail.com, devicetree@vger.kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20260813-rockchip-usbdp-cleanup-v14-3-b5ad9c68fa11@collabora.com>
References: <20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com>
 <20260813-rockchip-usbdp-cleanup-v14-3-b5ad9c68fa11@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 01:33:12 +0000
Message-Id: <20260814013313.085C81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Removing the clearing of `udphy->status` causes unbalanced clock d=
isables (double disable) and state desynchronization if `rk_udphy_setup()` =
fails during a mode change.

Pre-existing issues:
- [High] During a mode change to DP+USB, the driver physically disables the=
 PHY clocks without first isolating the active USB controller, causing syst=
em crashes.
--

--- Patch [3]: [PATCH v14 03/38] phy: rockchip: usbdp: Do not lose USB3 PHY=
 status ---
commit a08162faff57c7960dad8d0bf118c557b9fa9db9
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

phy: rockchip: usbdp: Do not lose USB3 PHY status

By default (i.e. without manually enabling runtime PM) DWC3 requests the
USB3 PHY once and keeps it enabled all the time. When DisplayPort is
being requested later on, a mode change is needed. This re-initializes
the PHY. During re-initialization the status variable has incorrectly
been cleared, which means the tracking information for USB3 is lost.

> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rock=
chip/phy-rockchip-usbdp.c
> index a5ffdf7a6e76b..12dfdd470a782 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> @@ -1008,7 +1008,6 @@ static int rk_udphy_power_on(struct rk_udphy *udphy=
, u8 mode)
>  			rk_udphy_u3_port_disable(udphy, false);
>  		udphy->mode_change =3D false;
>  	} else if (udphy->mode_change) {
> -		udphy->status =3D UDPHY_MODE_NONE;

[Severity: High]
Does removing this clearing of the status cause issues if rk_udphy_setup()
fails during a mode change?

If initialization fails, rk_udphy_power_on() returns an error while the
hardware is left disabled by the preceding rk_udphy_disable(). Because the
software status is no longer cleared, it retains its prior active mode.

Later, when the USB consumer eventually powers off the PHY,
rk_udphy_power_off() observes the stale active status, drops to
UDPHY_MODE_NONE, and issues a redundant rk_udphy_disable(). This
double-disables the clocks.

Could we instead clear udphy->status only in the error path of
rk_udphy_setup()?

>  		if (udphy->mode =3D=3D UDPHY_MODE_DP)
>  			rk_udphy_u3_port_disable(udphy, true);

[Severity: High]
This is a pre-existing issue, but does this conditional isolation lead to
system crashes when the mode is UDPHY_MODE_DP_USB?

During a mode change to DP+USB, the PHY clocks are physically disabled via
rk_udphy_disable() shortly after this check. By only isolating the USB port
when the mode is exactly UDPHY_MODE_DP, a transition to UDPHY_MODE_DP_USB
skips the isolation.

Disabling the PHY clocks while the DWC3 controller is still actively running
and accessing its registers can cause a synchronous external abort. Should
this isolation also happen for UDPHY_MODE_DP_USB?

>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813-rockchip-u=
sbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com?part=3D3
