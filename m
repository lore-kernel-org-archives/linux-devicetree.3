Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E9D43E064
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 10:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789124321; cv=none; b=QfN+uzdEmciJX7zqbHcBWxE2O0rtLEyngB0IO8W+dPXj3nIj9LWmiRevhy9+/osAE3n2bw9WzrQmaCK1lYSMxjeU3JmXz6TqAyaQGqmr2HM02I0sb/BGQAu9YustJrowN8jmQxFdrUwkKvToMTymbnXeiwXtaWZ8Teru8jYjcxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789124321; c=relaxed/simple;
	bh=B6uYiYqM5mx/mCNjLBqgYlwPDrOmtaVyIpOjRNM3Ea8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KX6rlgjqsjwOZHNLZEWAAuzGTw/oYG725daG+ywaDgmBwi/OZy3pBnR91cjG0ufzeU4OGijx9WdOOlnlV3pI4B6FNrg34Bz8PhLkLZaiayhORBRcSS1SecLJlCmH2GAmAlK4yXVLP+ezz2Qf4iOpcg3wbOlUFOOcDxHk3m+LNxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ABgvaCXX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ABgvaCXX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D42961F00893;
	Fri, 11 Sep 2026 10:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789124317;
	bh=t7a5F9jmoH7lRNPV9oVdpNIDanvdc8I9turzIh9nFlI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ABgvaCXXP0WbmAfD/cWqZgEoD1gENFkFHXLK1rUP7Dq6xct0m0eCmBsgF9J/NBLKB
	 IvqaQuYvvHjQgj9psRe89c9YIOFHRn1LUwUzYUE4bokKcyqYiwpwS7ClXBCD7MP2Un
	 TYqka8uBEvXQW0buUbfLnXsPpvTgF+h7GTJ4Xheqkm+7AFH4JEHfD8b4ghaKJOnDTX
	 NSe05xEKacis6S9MRINF95G2yefMxuAxhbaQLFKgkJpPA8WQtQmEz+58Vytkoba8cW
	 4BXQGAUu4/yiorDJNZI2lnxqlQt3vUhvSn3FFXbx9hbik1ntFiFXTqlep3jBo5puMT
	 TEGtRp6npwmIg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/7] drm/msm/hdmi: Handle msm_hdmi_power_on() errors
 during .atomic_pre_enable()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-2-87bdb9f1987f@oss.qualcomm.com>
References: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-0-87bdb9f1987f@oss.qualcomm.com>
 <20260911-drm-msm-hdmi-fixes-before-eliza-v4-2-87bdb9f1987f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 10:58:36 +0000
Message-Id: <20260911105836.D42961F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] The patch handles power-up failures by returning early from `atomi=
c_pre_enable`, but leaves unconditional MMIO accesses unguarded in `atomic_=
post_disable`, leading to a fatal imprecise abort.

Pre-existing issues:
- [High] `msm_hdmi_set_timings` accesses MMIO registers before the HDMI pow=
er domain is enabled.
--

commit 8b49f93cb61baf0b2ba06628a0200e4134a1eb45
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

drm/msm/hdmi: Handle msm_hdmi_power_on() errors during .atomic_pre_enable()

This patch properly handles power up failures during .atomic_pre_enable()
by aborting early to avoid accessing registers when blocks did not bring up,
preventing imprecise aborts when the entire power domain is off.

> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm=
/hdmi/hdmi_bridge.c
> index 157f19bd90b4e..db85400e574e4 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
[ ... ]
> @@ -287,13 +294,18 @@ static void msm_hdmi_bridge_atomic_pre_enable(struc=
t drm_bridge *bridge,
> =20
>  	msm_hdmi_set_timings(hdmi, &crtc_state->adjusted_mode);

[Severity: High]
This is a pre-existing issue, but does this function access MMIO registers
before the HDMI power domain is enabled?

msm_hdmi_set_timings() writes to registers like REG_HDMI_TOTAL:

    hdmi_write(hdmi, REG_HDMI_TOTAL,
        HDMI_TOTAL_H_TOTAL(mode->htotal - 1) | ...

Since this happens before msm_hdmi_power_on() enables the power domain and
clocks, could this trigger an imprecise abort if HPD is not currently keepi=
ng
the power domain active (for example, when userspace forces a display
connection)?

> =20
> -	mutex_lock(&hdmi->state_mutex);
> -	if (!hdmi->power_on) {
> -		msm_hdmi_phy_resource_enable(phy);
> -		msm_hdmi_power_on(bridge);
> -		hdmi->power_on =3D true;
> +	scoped_guard(mutex, &hdmi->state_mutex) {
> +		if (!hdmi->power_on) {
> +			if (msm_hdmi_phy_resource_enable(phy))
> +				return;
> +
> +			if (msm_hdmi_power_on(bridge)) {
> +				msm_hdmi_phy_resource_disable(phy);
> +				return;
> +			}

[Severity: High]
Does this new early return path cause a crash later in the modeset sequence?

If msm_hdmi_power_on() fails, we return early leaving hdmi->power_on =3D fa=
lse.
When the DRM core later calls msm_hdmi_bridge_atomic_post_disable(), it will
execute:

    msm_hdmi_set_mode(hdmi, hdmi->hpd_enabled);
    msm_hdmi_phy_powerdown(phy);

Both of these functions access MMIO registers unconditionally. Since the
power domain was never brought up, could these unconditional MMIO accesses
trigger an imprecise abort?

> +			hdmi->power_on =3D true;
> +		}
>  	}
> -	mutex_unlock(&hdmi->state_mutex);
> =20
>  	if (connector->display_info.is_hdmi)
>  		msm_hdmi_audio_update(hdmi);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911-drm-msm-hd=
mi-fixes-before-eliza-v4-0-87bdb9f1987f@oss.qualcomm.com?part=3D2
