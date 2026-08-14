Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0350B3D301A
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 03:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786676882; cv=none; b=SD0aqUXfUrow1pc7xzHIRok16epE72QF9pu1dBf7+zKtSvGSlR9jrd71YVR4gSx82ym4/GoL7xN1qm24exBO5o0FFXjCcUeezQnAOZ7MuShM7OkeS1ZtwH8T6jXiqTtP/nMG3nYtkR7HvYchYPJfR+0asiWhqUEJwgRl+Mb5Ztg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786676882; c=relaxed/simple;
	bh=40nKHc2Pycv5JTNuAemhXI6C1dLlE1j52LX0KXirv1o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tspMy84fEnVDYwWs34nHhQqatDIi++dwAA9yfGVspmgIUG0dfCSAqeIPWvv5JuWURJW1741EG7JTT9alRRuyymA5hMi3ifC7SKARPW6fkhZZkyW4phrG8aHDAmeCnbAcW4lMV+tdvkobvgzINudt6y5dYdbzm0SF4II/lZGxkqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m/qnC8TU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m/qnC8TU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0A241F000E9;
	Fri, 14 Aug 2026 03:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786676880;
	bh=H+57uzBO/+u4CbYOIrLJkex0sLfHfhA3xOTphcq+F1I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=m/qnC8TUy8ftjtmFI897CP/8XUoOTJVhyV9qVqzyFE2ZNKKUOyh0eazel8DPUk3i2
	 Kyq5Cv0DBzrj1fZTFUtUTBbxVrnPEcoSvFpHiZCTVchmGhAY8+8pvNSG59MZb0E488
	 NNKfSXYH5ZgHdbhEgMbKDiKPNn8ccgdgF+6Z/9TcC8E7MhACMPGgXAv1O/uEqGDgAt
	 kAGorkXjdBwpdGUzn+a6Oy1E2CQzsEtRZt0nmZey28GccEM5Tj920k9BIr9OL6dQuh
	 /HtI3LGAFWmleCVrq9L4+r/XoovuIaFWM8E0q38f9hdLLHV5CpXoc2hSZvC29bMNlU
	 T/pQiDA9aNadA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 12/38] phy: rockchip: usbdp: Limit DP lane count to
 muxed lanes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: neil.armstrong@linaro.org, olteanv@gmail.com, linux-phy@lists.infradead.org, robh@kernel.org, vkoul@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260813-rockchip-usbdp-cleanup-v14-12-b5ad9c68fa11@collabora.com>
References: <20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com>
 <20260813-rockchip-usbdp-cleanup-v14-12-b5ad9c68fa11@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 03:07:59 +0000
Message-Id: <20260814030759.D0A241F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Incomplete fix allows USB3 corruption when phy_configure is called=
 without set_lanes.
- [High] Missing mutex in rk_udphy_dp_phy_configure causes a TOCTOU data ra=
ce with Type-C events.
--

--- Patch [12]: [PATCH v14 12/38] phy: rockchip: usbdp: Limit DP lane count=
 to muxed lanes ---
commit 8cc28e81cd368682a27bd180cccc3fae6faaec95
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

phy: rockchip: usbdp: Limit DP lane count to muxed lanes

This commit adds a bounds check to prevent the DisplayPort controller from
requesting more lanes than the PHY currently has multiplexed for DP. By
rejecting invalid requests, it aims to protect USB3 functionality from being
corrupted by incorrect voltage configurations.

Link: https://lore.kernel.org/linux-phy/20260612165546.98E1F1F000E9@smtp.ke=
rnel.org/

> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rock=
chip/phy-rockchip-usbdp.c
> index c4d62b234ea80..b172ce6a722ee 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> @@ -1099,6 +1099,9 @@ static int rk_udphy_dp_phy_verify_link_rate(struct =
rk_udphy *udphy,
>  static int rk_udphy_dp_phy_verify_lanes(struct rk_udphy *udphy,
>  					struct phy_configure_opts_dp *dp)
>  {
> +	if (dp->lanes > udphy->dp_lanes)

[Severity: High]
This is a pre-existing issue, but does this unlocked read of
udphy->dp_lanes race with concurrent Type-C events?

Looking at rk_udphy_dp_phy_configure(), it performs validation and state
updates without acquiring the driver's udphy->mutex:

drivers/phy/rockchip/phy-rockchip-usbdp.c:rk_udphy_dp_phy_configure() {
        struct rk_udphy *udphy =3D phy_get_drvdata(phy);
        ...
}

Meanwhile, asynchronous Type-C callbacks like rk_udphy_typec_mux_set()
mutate these same fields concurrently while correctly holding udphy->mutex.

If a Type-C event changes udphy->dp_lanes immediately after this unlocked
check passes, could rk_udphy_dp_phy_configure() proceed using outdated
values and write DP settings to USB3 lanes?

[Severity: High]
This is also a pre-existing issue, but does this check fully protect
the voltage configuration loops if phy_configure() is called with
set_voltages=3D1 but set_lanes=3D0?

If a Type-C event reduces the available DP lanes, rk_udphy_typec_mux_set()
updates udphy->dp_lanes but not the cached udphy->lanes. If the DP
controller later adjusts voltages during link training (without setting
lanes), this check in rk_udphy_dp_phy_verify_lanes() is skipped.

The code then loops over the stale udphy->lanes value in both
rk_udphy_dp_phy_verify_voltages() and rk_udphy_dp_phy_configure():

drivers/phy/rockchip/phy-rockchip-usbdp.c:rk_udphy_dp_phy_configure() {
        ...
        for (i =3D 0; i < udphy->lanes; i++) {
                lane =3D udphy->dp_lane_sel[i];
        ...
}

Will this result in applying DP voltage configurations to lanes that have
already been reassigned to USB3, bypassing the newly added protection?

> +		return -EINVAL;
> +
>  	switch (dp->lanes) {
>  	case 1:
>  	case 2:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813-rockchip-u=
sbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com?part=3D12
