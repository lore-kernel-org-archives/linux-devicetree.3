Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC34E381EBB
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 13:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791812823; cv=none; b=WytW/uyDP96B6+Nb8fUaxI0nmKGXyuC+0ytALNwb4G59edv3ywIZzjZ49PWcvyn+coOrVDeEEUBSzpS0B+PbKgpm/Dg9VSXUppGlHX8ogA1r0WwewFe9i3ERnlVqd9aeXDTSNfna2i9sqZwSUicRWLPikYcVmJ4mqDwMNsg2IYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791812823; c=relaxed/simple;
	bh=7xVHVPffAWU9SlUXbakUiOob8MWXwnU5qflF2fzaCdU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=hP665OuyG30FRjzfGiiufhtxnAVFI8f3Y2YEp9cMkjW3tu4vnWFGEeJ/H1TqEHbbinqbzlo5FfELjLbTF9kYI3i0CGUFOlvw1XgTf5xY21dd+HZrZ+kLIQtvZCtz2gUKgtdC/8/jwoPjryDOs+Apwmb+yOVT6Nkv8/ks/95sRS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=osrqqM1L; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="osrqqM1L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4FBD1F0089B;
	Mon, 12 Oct 2026 13:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791812822;
	bh=kw478kFzJgOqgycYhCOUMUqz0gU4ru7dcFJzR0Lhwok=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=osrqqM1Lv8k7z36uoAXtgjsd8/qZtcwGILUnx9T7ImxNY1Qu1WNLZ3U5WvBXuLfkV
	 LAby7j2JLgprdoL7e+VtMCaxBVoVZBE//5jGE/Q0nWVoiVQ0CI0Wif5g0jdDJi2uk2
	 PE9KYJO/9NR5RXzehNoF5GnlMr2wLl9CmVb/19iU3kevs/fTuscaAOTjQinpO4UBFd
	 uxiAbg2dDMHPvUISiHO/SpOJXVJOTKsUJVRkZlKTqQT9CYXOG7xdRVfDg0ZvMR45Gq
	 IK2j1czCFg7FnYCWh9+r76IIOiP95DlG47c3RGqlXhesgrb0GGsx/6OFslFfoHzNTz
	 IwPN8Jyq6/ilQ==
Message-ID: <sashiko-outbox-168214@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 06/13] drm/msm/dp: Add support for DP controllers on
 Nord
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nabige Aala" <nabige.aala@oss.qualcomm.com>
Cc: olteanv@gmail.com, devicetree@vger.kernel.org, vkoul@kernel.org, linux-phy@lists.infradead.org, neil.armstrong@linaro.org, robh@kernel.org, dri-devel@lists.freedesktop.org, conor+dt@kernel.org
In-Reply-To: <20261012-nord-drv-dt-v2-6-a2ab9af954d2@oss.qualcomm.com>
References: <20261012-nord-drv-dt-v2-0-a2ab9af954d2@oss.qualcomm.com>
 <20261012-nord-drv-dt-v2-6-a2ab9af954d2@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 13:47:01 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] drm/msm/dp: logic typo in loop condition i < io_start
--

commit 9873fd55a5048fd6867334e37aee81635bc94b5a
Author: Mahadevan P <mahadevan.p@oss.qualcomm.com>

drm/msm/dp: Add support for DP controllers on Nord

This commit adds the Nord DP controller descriptors and compatible strings.
Nord supports four DP controllers, two per MDSS instance.

> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp=
/dp_display.c
> index bce641d7d8938..d258963cddc64 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -109,6 +109,14 @@ static const struct msm_dp_desc msm_dp_desc_glymur[]=
 =3D {
>  	{}
>  };
> =20
> +static const struct msm_dp_desc msm_dp_desc_nord[] =3D {
> +	{ .io_start =3D 0x0af54000, .id =3D MSM_DP_CONTROLLER_0, .wide_bus_supp=
orted =3D true },
> +	{ .io_start =3D 0x0af5c000, .id =3D MSM_DP_CONTROLLER_1, .wide_bus_supp=
orted =3D true },
> +	{ .io_start =3D 0x08d54000, .id =3D MSM_DP_CONTROLLER_0, .wide_bus_supp=
orted =3D true },
> +	{ .io_start =3D 0x08d5c000, .id =3D MSM_DP_CONTROLLER_1, .wide_bus_supp=
orted =3D true },
> +	{}
> +};

[Severity: Low]
Does this new DP controller configuration rely on a logic typo in the loop
condition of msm_dp_display_get_desc() to terminate safely?

Looking at msm_dp_display_get_desc(), the loop condition compares the
array index i against the physical memory address io_start:

	for (i =3D 0; i < descs[i].io_start; i++) {
		if (descs[i].io_start =3D=3D res->start)
			return &descs[i];
	}

This regression in the loop logic appears to be a typo that should likely be
descs[i].io_start !=3D 0.

The loop avoids crashing because physical memory addresses (like 0x0af54000)
are much larger than the index i, and the zero-initialized sentinel element=
 {}
sets io_start to 0.

Since phys_addr_t is unsigned, checking i < 0 safely evaluates to false and
terminates the loop, but this logic is brittle and semantically incorrect.

Could the loop condition in msm_dp_display_get_desc() be corrected so that
newly added controller arrays do not rely on this unsigned comparison behav=
ior
for termination?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012-nord-drv-d=
t-v2-0-a2ab9af954d2@oss.qualcomm.com?part=3D6
