Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3F8400DF4
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 16:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781283238; cv=none; b=QrQUveEf15QhFdr36u3HwnWH+ciifmXN5VMJ1SuMorRr41NZv5hcVJmvPTLH73fO2JVY/2iiMB4rVAluKOBN6AwtbKCcD+GArwDMuAnpoqzkfUtjrTIJvmCHrQ44PwVJcZ73FRBS/fq5fnhsydh2KnSIJPiGlS+R1ouksjuakdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781283238; c=relaxed/simple;
	bh=4SGz/Xm9yLP0jd8N9KpoAQsFJ/gkUfC79dC5Ln8Jnhg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VJ/ULyyxx6dRMD+MV1YlknWcAARVruDZx22Bd+FAj2LV8zPh80/kR9bDNaE7h6cw/5RLcb4lwfmRMQfVzog6Rg2D7hclZkQrig3e2vDT6q6cRues8FxZ6zXE+eTVcuLguzAivIg8F5vkqp/wGBleVrk1LvwoppFFkIe2t7XfkH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GN5dOXmy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GN5dOXmy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCE691F000E9;
	Fri, 12 Jun 2026 16:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781283237;
	bh=T+3wuQBA/pNIwYXjXmuTD+jg8D4R1Hgh7oHBezZq35s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GN5dOXmy8hmau4n7IL8KCfuLrhYc2y1AtNPD5h9OutIoPfknsY4ai/euaTSdSeFZw
	 rX6KEfkzFTjZNic7HcjSmFphmFdFCwbFfoTZnGYnnGVthZZQEFfq0opgrJ7jCkWoyR
	 hipMkAvsXpE0vesWXtWup9ZUJYD6ey/cnuOr9F5eWg1hRY1IZeh4OBg4Uj2wmUqZWS
	 mXDXv0qkrchEleyF1szannLzuWz7cnalmYQn8PfJDhd+53U9jJFCZN2C0AyqPy22Xm
	 1hGu7eDA37cPwMcmSW5NKWM2t4VAQ0vBjqiQKcE/b1f7PLKtuzzcNa0zG9K88Qp7T4
	 BhaUgQ1dK436A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 12/18] phy: rockchip: usbdp: Drop DP HPD handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, linux-phy@lists.infradead.org, olteanv@gmail.com
In-Reply-To: <20260612-rockchip-usbdp-cleanup-v5-12-efc83069869f@collabora.com>
References: <20260612-rockchip-usbdp-cleanup-v5-12-efc83069869f@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 12 Jun 2026 16:53:56 +0000
Message-Id: <20260612165356.CCE691F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Lockless access to shared Type-C lane mappings in `rk_udphy_dp_phy=
_configure` causes data race
--

commit 5858d851fd3d6f0beb8a1b3b702ddc25ce1b25b1
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

phy: rockchip: usbdp: Drop DP HPD handling

This commit drops the HPD handling logic from the USBDP PHY. The registers
involved require the display controller power domain being enabled, so the =
HPD
signal should be handled by the displayport controller itself.

> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rock=
chip/phy-rockchip-usbdp.c
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c

[ ... ]

> static int rk_udphy_dp_phy_configure(struct phy *phy,
> 				     union phy_configure_opts *opts)
> {

[ ... ]

> 	if (dp->set_voltages) {
> 		for (i =3D 0; i < udphy->lanes; i++) {
> 			lane =3D udphy->dp_lane_sel[i];
> 			switch (udphy->link_rate) {
> 			case 1620:
> 			case 2700:

[Severity: High]
This isn't a bug introduced by this patch, but I noticed a potential data
race here. Does this loop access udphy->dp_lane_sel and
udphy->lane_mux_sel safely?

These arrays define the active Type-C DP lane mapping and are updated by
asynchronous Type-C subsystem events in rk_udphy_orien_sw_set() and
rk_udphy_typec_mux_set() under the protection of udphy->mutex.

Since rk_udphy_dp_phy_configure() does not hold udphy->mutex (only the
framework-level phy->mutex), could a concurrent Type-C cable orientation
or mode switch cause this code to read a partially updated lane mapping?

This might lead to incorrect DP PHY register programming, configuring the
wrong hardware lanes and causing link training or display failures.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260612-rockchip-u=
sbdp-cleanup-v5-0-efc83069869f@collabora.com?part=3D12
