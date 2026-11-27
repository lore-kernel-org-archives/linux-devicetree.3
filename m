Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795766749;
	b=1lWD2jE3739Dk3FQIz4RLB/dWdGqcWyTSr2tDja11svMiX2JFBfU1uAhGZ+c6AzqdfUr
	 zArFn8N0lLfVy46QzvBxPS6b9gIYVst/kboqbCVO2LbEGkwprCn86fnLY5mUvZ4O/KuUS
	 eqtQ7f0IBBZSk7dwk/Jpsc+2kF5fRyXt9wxC/oxvmNgjK870zEWoxHZw2oWN8mDCVVL1q
	 17MsmYnNPYR11RAk36GLFKZeQGc6lvqwszmCC/kv5n/6AXaJStiwMu4Yq1IwPtBUOHTBm
	 shWvb4ZJvnmqhzzqWvhwGIw+b1u3taqSv09R/Mj4rsabeSNsZ5Q+vGcvo2QAsUs2tEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795766749;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=8O1+v6jOktcYuDLAATkSotftLGiT9Jh68Vaa5FZDE54=;
	b=tH6Bk4Tl4PLtnIyOotCg9ygawMr7ov0B2Lyo688hJ3jPensiwexaq6bT5GdUVPMwcY9d
	 /1mjeLM0rF2BzQAS2VHsJMngJT383FWFPe8N97iN7BzP31ylxjxEjJWGXHAL0jeJLNTjd
	 QDNfyIudiWLKS3QY36zfNWxSsUh+/cDHSjJbZW2hu0h0RM+xFmHH1afdHwYDeHKro5lYV
	 2h1j0fhI7+93otARqxcEra9/aTWHw+YBK5OEwKdOjQS2TDaHqph/saFiAZkn4VvM0ImEu
	 Kdq+M1Kl2nn0E9FFC+CuTTSL0E9zIQ9bi1lOocMMdys0yd0Oak2QmgVuq9nhUDKr6wA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T52yUAsi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0A3606A326
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 08:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T52yUAsi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D168A1F000C1;
	Fri, 27 Nov 2026 08:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795766749;
	bh=8O1+v6jOktcYuDLAATkSotftLGiT9Jh68Vaa5FZDE54=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=T52yUAsie40UKOOuK3P8slM4wpShievDHWHCxv+jYL4/ddbQ21p4bMsaJTr3qFmWk
	 9W/LDhb2p1U2JUFDbqHXHXjdMbCfI0KIGoXvcFLvshHSrZSQKRHgvU9iJHmq9hRaBo
	 xXw5zAK499dKwNQk1ZF48bIGGq8GeoTKpnHmwebiy750GmqlcIZrGvVuqqEdOILVNe
	 cO0RLJs2yZWMdN6ybjztfX6i/eA4ysLDUpCwrC3XPY6o7Dme9qAnaKvVHd1nfUlwFU
	 w8J/J25GGDRdoIwXDJBaGaXy+T9RE3u9dbB+k+lXp312ZEy2DPBOhhFOEswbdcwUog
	 JeEv/6oaWp2lA==
Message-ID: <sashiko-outbox-236857@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/5] drm/bridge: trilinear: add the DPTX hardware
 layer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luo Liu" <Luo.Liu@cixtech.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261127074639.277959-3-Luo.Liu@cixtech.com>
References: <20261127074639.277959-1-Luo.Liu@cixtech.com>
 <20261127074639.277959-3-Luo.Liu@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 08:05:48 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] drm/bridge: trilinear: dptx_hw_dpcd_power_up/down() duplicate DP
  helpers
--

commit 4572b1c38c3025ae29ace85b65751b014caf62e2
Author: Luo Liu <Luo.Liu@cixtech.com>

drm/bridge: trilinear: add the DPTX hardware layer

This commit adds the register and PHY programming layer for the Trilinear
DisplayPort transmitter, including AUX transfers, DPCD capability parsing,
link training, and stream configuration.

> diff --git a/drivers/gpu/drm/bridge/trilinear/dptx_hw.c b/drivers/gpu/drm=
/bridge/trilinear/dptx_hw.c
> new file mode 100644
> index 0000000000000..8d8f9312d198d
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/trilinear/dptx_hw.c

[ ... ]

> +static int dptx_hw_dpcd_power_up(struct dp_hw *hw,
> +				 unsigned int delay_ms)
> +{
> +	u8 value;
> +	int ret;
> +
> +	ret =3D drm_dp_dpcd_readb(&hw->aux, DP_SET_POWER, &value);
> +	if (ret < 0)
> +		return ret;
> +
> +	value =3D (value & ~DP_SET_POWER_MASK) | DP_SET_POWER_D0;
> +
> +	ret =3D drm_dp_dpcd_writeb(&hw->aux, DP_SET_POWER, value);
> +	if (ret < 0)
> +		return ret;
> +
> +	msleep(delay_ms);
> +
> +	return 0;
> +}
> +
> +static int dptx_hw_dpcd_power_down(struct dp_hw *hw, bool hpd)
> +{
> +	u8 value;
> +	int ret;
> +
> +	if (!hpd)
> +		return 0;
> +
> +	ret =3D drm_dp_dpcd_readb(&hw->aux, DP_SET_POWER, &value);
> +	if (ret < 0)
> +		return ret;
> +
> +	value =3D (value & ~DP_SET_POWER_MASK) | DP_SET_POWER_D3;
> +
> +	ret =3D drm_dp_dpcd_writeb(&hw->aux, DP_SET_POWER, value);
> +	if (ret < 0)
> +		return ret;
> +
> +	usleep_range(200, 205);
> +
> +	return 0;
> +}

[Severity: Low]
Could dptx_hw_dpcd_power_up() and dptx_hw_dpcd_power_down() use
drm_dp_link_power_up() and drm_dp_link_power_down(&hw->aux,
hw->dpcd[DP_DPCD_REV]) instead of open-coding the DP_SET_POWER
read-modify-write sequence?  Using the helpers also avoids accessing
DP_SET_POWER on DPCD v1.0 sinks where that register does not exist.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127074639.2779=
59-1-Luo.Liu@cixtech.com?part=3D2
