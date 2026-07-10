Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AAC53B47E3
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 21:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783718269; cv=none; b=MfJSQp3bwZ29Z30nv0d736mT02JNyVCBY1AYPS4hm/3ZF0+iTOxxFaQCiwZMaXTPnlqrQX+WDhaopUEouAmeWx4Ga5+WfBVMwPFJjDxMpGPOz5H1HJqWOETWu2F29SpPtCSee8N0NuVnF2oAJbultdxq2lK8z0oY4JA2KXdRIXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783718269; c=relaxed/simple;
	bh=V26YNRFNMVsnk4Erx4Qnjy/vxu2d35NNeRaaj6VzmB8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=drSkIEkH+PIlt4oZpk9uG4n6ZWRs4ww57NT5glV7uMscmvu3X3atiNE5ehnx2QOQIqrOpQCFUr502647B8o0MCrkmyv8RZuHvVidthOCb3e3Y7EeBvBZSzrDzk1AqyvBaR6ufsm9LObXxbURJpY5V/jbMm64ZhfoEgrv8FSzS54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YbAJDl69; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YbAJDl69"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53B981F000E9;
	Fri, 10 Jul 2026 21:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783718267;
	bh=J21CImOksovrOYuVYaZdWQYvBKjp1a6itO/Eo0bE9gY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YbAJDl69jzrNIXnDNc32KCPRIfhT+qafoWYUqWrIZbTm3+DLq9n+f+hGRJnj471td
	 vKO7A5ztPlisIr/QUlzipqS4H0Z1ShwIU3LvM0aG4bSjW53U80VivdQv0ainBTvl5D
	 Pj16L1u4rljBZeRrpclRWLMX9ydCJ0YyDqB9X7Y+AegMwUzqt2VLaiLNdoyue7ZDQb
	 ZDIJSvjPEW8z5m+5KCxjVDMmbJI6faiKmPUE7ynSSwhIsRutV8xjaIFp2jl1MBwPGL
	 vmWpy+R3HUAdegmvk0765P5h8jfQtr+JOu5JlwaScsrq/JKzLqfYmIoNOvjF8vXc7F
	 I5G/Ct4XbG0RA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 23/36] phy: rockchip: usbdp: Clear USB status on PHY
 exit
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: robh@kernel.org, conor+dt@kernel.org, olteanv@gmail.com, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20260710-rockchip-usbdp-cleanup-v12-23-8b41a9a9bef0@collabora.com>
References: <20260710-rockchip-usbdp-cleanup-v12-0-8b41a9a9bef0@collabora.com>
 <20260710-rockchip-usbdp-cleanup-v12-23-8b41a9a9bef0@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 21:17:46 +0000
Message-Id: <20260710211747.53B981F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Clearing the USB status flag without checking if the PHY should be=
 completely disabled leads to a clock reference and PHY power leak.

Pre-existing issues:
- [High] The `rk_udphy_dp_phy_configure` function accesses and modifies sha=
red PHY driver state without holding the proper subsystem lock (`udphy->mut=
ex`).
--

--- Patch [23]: [PATCH v12 23/36] phy: rockchip: usbdp: Clear USB status on=
 PHY exit ---
commit 87780d47b4da4078adb1684ca9ebb6fc0529d86c
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

phy: rockchip: usbdp: Clear USB status on PHY exit
   =20
Ensure the USB status flag is cleared when the USB3 PHY is
exited while the system is in DP-only mode.

Closes: https://sashiko.dev/#/message/20260625-rockchip-usbdp-cleanup-v7-24=
-38eb3cf654fd%40collabora.com

> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rock=
chip/phy-rockchip-usbdp.c
> index 8c165bcab7968..a742bde7155be 100644
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

[Severity: High]
Does this early return bypass rk_udphy_disable() if the PHY should be compl=
etely
disabled?

If the DP side is not active, udphy->status drops to UDPHY_MODE_NONE (0) he=
re.
Because the function returns early, it bypasses rk_udphy_power_off() and fa=
ils
to call rk_udphy_disable(udphy).

Will this leave the PHY hardware permanently powered on and the clock counts
unbalanced?

The next time the PHY is powered on, status =3D=3D 0 would cause another ca=
ll to
rk_udphy_setup(), which calls clk_bulk_prepare_enable() again, causing a
cumulative clock reference leak.

> =20
>  	rk_udphy_power_off(udphy, UDPHY_MODE_USB);

[ ... ]

drivers/phy/rockchip/phy-rockchip-usbdp.c:rk_udphy_dp_phy_configure() {
    ...
    struct rk_udphy *udphy =3D phy_get_drvdata(phy);
    struct phy_configure_opts_dp *dp =3D &opts->dp;
    u32 i, val, lane;
    int ret;

    if (dp->set_rate) {
    ...
}

[Severity: High]
This is a pre-existing issue, but does rk_udphy_dp_phy_configure() access a=
nd
modify shared PHY driver state without holding the proper subsystem lock?

The PHY core framework calls .configure which reads udphy->dp_lanes and
udphy->dp_lane_sel, and writes udphy->lanes without acquiring udphy->mutex.

Concurrently, a Type-C event handled by rk_udphy_typec_mux_set() or
rk_udphy_orien_sw_set() might alter those shared fields while holding the m=
utex.

Could this race condition lead to the hardware being programmed with
inconsistent lane mappings during normal Type-C hotplug and DP modesetting?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260710-rockchip-u=
sbdp-cleanup-v12-0-8b41a9a9bef0@collabora.com?part=3D23
