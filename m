Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795536348;
	b=jf652I6z+AEYrSDUObOGwUqyKnL+plkBeT0KYXcUH2j3selkHMNU2RgPJBQUXUykyepE
	 dKq8yjL6mGcp1jtmZiDX7w48DxtbyoLuVRzUsAkfVzR0qRNyUPweNgsby7BPimFU4IHsB
	 rQsPk8zB0yK1apf7Yss8RgiM/7atJI1Hfx235Fy/tJdBs4CSLtugPS8dL6dmIXyxJXCQq
	 6MRpPzdD6aaedW3C2nPGhG1dOdAZaX6bFF+/pyLb1VLUqoV3OjWq9vPRN8g0nTcLqxuXe
	 rUwP/AnYCMlVNREwGnCoUfzficeF45afqsGR4UUqiG8aWyJRpOLpImNy6ruVqTlUkbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795536348;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Cv2LykdzoWATAdS0+UUtysQMsmJwn0R6Nob/ZJuFkeQ=;
	b=S2nP/JdnEF598zlmRB3m2UvBOIyGBzmc/LNL1xORscUBBY+0fY/fzmR7BI56/Y9oT5Nb
	 56SPQ0h/wufOU6Da42MBVfCl5IwIwZZWjRSYe71J2ULNTvjhQDJaI0ob7NCdso+czoT3N
	 5paPl3xd5ATZwGPEprAcmYJq8qTYzzqmH8CGi496mtpmwVdYP+XteDV7C25e+B5PpF0Q9
	 w4EuQAkIStOuLSMJqh0+0ImkUvh/aRCCyGiUz2leIbpiEHDhSv6Nd4ILVnxa1xSvMysG5
	 sfkXI+m8sQa1ia2YOCXyn/nE//3F86nHIm2rhFH9N2Oda0NPuJKZXX+DK31pmfP1Onw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="ZKxP/U8p";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF98F606A338
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 16:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZKxP/U8p
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A75D1F000D3;
	Tue, 24 Nov 2026 16:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795536347;
	bh=Cv2LykdzoWATAdS0+UUtysQMsmJwn0R6Nob/ZJuFkeQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZKxP/U8p+DqKMZVQyV6JfLR+6D0PT6hY6l3dtxh6Yws8wy0h81FrtXi49eK8oKaRz
	 ml0B+IbUTtVpIM3fE+zP1qaNsnRhhhW3I8k8T7h+IuWJtc32ZMYgt680qqaxgCswe8
	 D568NoPaJhRmfuPzwCh7Ky0jAZi6+9JFr0JKSOVul6YaF91H0ScziA8nHZqgxUwvFH
	 4lCGhOd9zvy12Gqn1bHwCSMmuYHht0Ll7N6DkJyxOVz28tfQfe7uFmm+B9SA7DGXjy
	 PHh5w8KoWXVzxjGL0/YmrmfO1xesJmAONIqyAwLQCMcP7NIqob77wG8Z/f+kFxiVRF
	 vnNYw7PQz+fXA==
Message-ID: <sashiko-outbox-231527@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 11/18] drm/bridge: inno-hdmi: Make the PHY
 configuration table optional
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michal Wilczynski" <m.wilczynski@samsung.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261124-jh7110-clean-send-v8-11-de92635dd857@samsung.com>
References: <20261124-jh7110-clean-send-v8-0-de92635dd857@samsung.com>
 <CGME20261124155419eucas1p1be4546e9ca9aa75f3f98c9a63d7e8ae6@eucas1p1.samsung.com>
 <20261124-jh7110-clean-send-v8-11-de92635dd857@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 16:05:47 +0000
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
- [Medium] drm/bridge: inno-hdmi: unguarded integrated-PHY writes when
  phy_configs is NULL
--

commit 564121a85c49ce8805925601abb5a8678ff40505
Author: Michal Wilczynski <m.wilczynski@samsung.com>

drm/bridge: inno-hdmi: Make the PHY configuration table optional

This commit allows platforms with an external PHY to omit the integrated
PHY configuration table and skips the table lookup and PHY register writes
in inno_hdmi_power_up() and inno_hdmi_bridge_mode_valid() when the table
is absent.

> diff --git a/drivers/gpu/drm/bridge/inno-hdmi.c b/drivers/gpu/drm/bridge/=
inno-hdmi.c
> index 0932ec47f151b..19cea14d14266 100644
> --- a/drivers/gpu/drm/bridge/inno-hdmi.c
> +++ b/drivers/gpu/drm/bridge/inno-hdmi.c
> @@ -533,8 +533,14 @@ static void inno_hdmi_power_up(struct inno_hdmi *hdm=
i,
>  			       unsigned long mpixelclock)
>  {
>  	struct inno_hdmi_phy_config *phy_config;
> -	int ret =3D inno_hdmi_find_phy_config(hdmi, mpixelclock);
> +	int ret;
> +
> +	inno_hdmi_sys_power(hdmi, false);
> +
> +	if (!hdmi->plat_data->phy_configs)
> +		goto out;
> =20
> +	ret =3D inno_hdmi_find_phy_config(hdmi, mpixelclock);
>  	if (ret < 0) {
>  		phy_config =3D hdmi->plat_data->default_phy_config;
>  		DRM_DEV_ERROR(hdmi->dev,
> @@ -544,8 +550,6 @@ static void inno_hdmi_power_up(struct inno_hdmi *hdmi,
>  		phy_config =3D &hdmi->plat_data->phy_configs[ret];
>  	}
> =20
> -	inno_hdmi_sys_power(hdmi, false);
> -
>  	hdmi_writeb(hdmi, HDMI_PHY_PRE_EMPHASIS, phy_config->pre_emphasis);
>  	hdmi_writeb(hdmi, HDMI_PHY_DRIVER, phy_config->voltage_level_control);
>  	hdmi_writeb(hdmi, HDMI_PHY_SYS_CTL, 0x15);
> @@ -555,6 +559,7 @@ static void inno_hdmi_power_up(struct inno_hdmi *hdmi,
>  	hdmi_writeb(hdmi, HDMI_PHY_SYNC, 0x00);
>  	hdmi_writeb(hdmi, HDMI_PHY_SYNC, 0x01);
> =20
> +out:
>  	inno_hdmi_sys_power(hdmi, true);
>  };

[Severity: Medium]
Should inno_hdmi_standby() and inno_hdmi_config_video_timing() also skip
writing to the integrated PHY registers when hdmi->plat_data->phy_configs
is NULL?

While inno_hdmi_power_up() skips HDMI_PHY_DRIVER, HDMI_PHY_PRE_EMPHASIS,
HDMI_PHY_CHG_PWR, and HDMI_PHY_SYS_CTL, inno_hdmi_standby() still writes
to those same four registers during probe and bridge disable:

drivers/gpu/drm/bridge/inno-hdmi.c:inno_hdmi_standby() {
	inno_hdmi_sys_power(hdmi, false);

	hdmi_writeb(hdmi, HDMI_PHY_DRIVER, 0x00);
	hdmi_writeb(hdmi, HDMI_PHY_PRE_EMPHASIS, 0x00);
	hdmi_writeb(hdmi, HDMI_PHY_CHG_PWR, 0x00);
	hdmi_writeb(hdmi, HDMI_PHY_SYS_CTL, 0x15);
}

Similarly, inno_hdmi_config_video_timing() still writes to
HDMI_PHY_PRE_DIV_RATIO, HDMI_PHY_FEEDBACK_DIV_RATIO_LOW, and
HDMI_PHY_FEEDBACK_DIV_RATIO_HIGH on every modeset. If those integrated PHY
registers do not exist on platforms with a separate PHY, or if any of
offsets 0xe0..0xe3 decode to hardware state, inno_hdmi_standby() clears
them and inno_hdmi_power_up() no longer restores them.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-jh7110-cle=
an-send-v8-0-de92635dd857@samsung.com?part=3D11
