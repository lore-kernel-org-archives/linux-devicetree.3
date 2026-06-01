Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883601A6815
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 07:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780297967; cv=none; b=lx6d8a2nOV4q0fZON6WQhPvpgidai95tUQ58kEYKG3XeOififIuASUP1kHY3bWs+GOu6ROJbRk1hNWjrAqx+e8KjFlF5sSGWGpIEUcw+flwUN9nVv2VAttrkRCtDfN3mHjVSv0LTCuuLDK0xzTilYQtX/D6S1DWAuOKBwcEAWz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780297967; c=relaxed/simple;
	bh=+Xqd116JtI7QEbxzfR5hvik0XgzPH3zg7JgOw5QTi0E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YoFqdo8zuL0QuHE+AIBMkDYL3KpomfvE5WtcN4dJMbK3LTibyAGTfCVytOoWPX/y+EDYQY4tZgRlVa8QM/kDwEsPHzfHpd0bQqDt4peTwJsjI5yyvqhzvTrKRGNzbPdCEzNsbWYQY+uK8UJLApxYRijMpxJOHctAlFhY719w1VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QC47K7Kl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QC47K7Kl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04B5F1F00893;
	Mon,  1 Jun 2026 07:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780297966;
	bh=xrdTPZNqpy+K7sHvkodqL0Ra/L0LIOw8KDpoum6XLd8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QC47K7Klb9NYVPKFzDMWXR9VhDuO6OvRa3iBANQW8ziPd3XLR9M0vZgKiI0WZmMDN
	 jbuZ6V3Xusl+zPjEeGeGoyJ+o/qt8nWKGnffw4lbRNX3cM4EugDlRxUD4Qwz5YoGFB
	 RifDZaq6L98HdwOdRoRO1jzQ+zfwu+5HVyMPY8NiJUKkrqHGw/GWZx/uVjatCsnh12
	 qFnHaLQZk4RXzEkk12Dy/wEIHO+/8UZ8xe8bVNGhrNTwbMO8vzuHnxvjt89eIsswlr
	 8VtT6bs9a+hOv0yGq8q2uBh98/P/aGr4Y+RBcekRi8XM+2JSuIXKhf/BjiJ0gK3Qzk
	 b+MBjURceoV2g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 05/11] drm/rockchip: analogix_dp: Enable hclk for
 RK3588
Reply-To: sashiko-reviews@lists.linux.dev
To: "Damon Ding" <damon.ding@rock-chips.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260601065100.1103873-6-damon.ding@rock-chips.com>
References: <20260601065100.1103873-6-damon.ding@rock-chips.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 01 Jun 2026 07:12:45 +0000
Message-Id: <20260601071246.04B5F1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing analogix_dp_unbind() on error path in rockchip_dp_bind() c=
auses resource leak and Use-After-Free risk.
- [High] Use-after-free risk via unreferenced device node pointer `endpoint=
.local_node`.
--

commit 9a213026e9dc13c601798dee6df75e3fbf1fabb3
Author: Damon Ding <damon.ding@rock-chips.com>

drm/rockchip: analogix_dp: Enable hclk for RK3588

Acquire and enable the HCLK_VO1 bus clock explicitly for RK3588
eDP controller to guarantee register and datapath access.

> diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gp=
u/drm/rockchip/analogix_dp-rockchip.c
> index 06072efd7fca3..d2af5eb29dbb5 100644
> --- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c

[ ... ]

[Severity: High]
This is a pre-existing issue, but does rockchip_dp_bind() leak the AUX devi=
ce
registration on this error path?

drivers/gpu/drm/rockchip/analogix_dp-rockchip.c:rockchip_dp_bind() {
...
err_cleanup_encoder:
	dp->encoder.encoder.funcs->destroy(&dp->encoder.encoder);
	return ret;
}

If analogix_dp_bind() succeeds but the subsequent drm_bridge_connector_init=
()
fails, the code jumps to err_cleanup_encoder. This path destroys the encoder
but fails to call analogix_dp_unbind(dp->adp).

Because analogix_dp_bind() successfully registered the DRM DP AUX device,
failing to unregister it leaves the adapter active in the I2C subsystem. If
the driver is unbound, devm will free the memory containing the drm_dp_aux
structure, potentially leading to a use-after-free crash in the I2C subsyst=
em
during any subsequent access.

[Severity: High]
This isn't a bug introduced by this patch, but is there a use-after-free ri=
sk
when accessing endpoint.local_node?

drivers/gpu/drm/rockchip/analogix_dp-rockchip.c:rockchip_dp_drm_encoder_ena=
ble() {
...
	ret =3D drm_of_encoder_active_endpoint(dp->dev->of_node, encoder, &endpoin=
t);
	if (ret < 0)
		return;

	remote_port_parent =3D of_graph_get_remote_port_parent(endpoint.local_node=
);
...
}

Inside drm_of_encoder_active_endpoint(), of_node_put() drops the reference
on the local endpoint node before returning.

Since the reference is already dropped, could passing endpoint.local_node to
of_graph_get_remote_port_parent() result in a use-after-free if a device tr=
ee
overlay containing the node is removed concurrently?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260601065100.1103=
873-1-damon.ding@rock-chips.com?part=3D5
