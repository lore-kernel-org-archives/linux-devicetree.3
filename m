Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794265005;
	b=xxdnFXUgW2iL7Hu6lQrgQV4LJuRdZsbH8ChhYnpwMrHoaiMfSB66Yx/J4/QVbHw3siNQ
	 MBoTeHNlHriId06VBahP9dpwhtJTsxGpTTqG5yPftlRD3/UG3tshw4Ivosi1fl0//BtqZ
	 A1fF25RiwHQjq8u69x11p7Vq5WBuQ4vCV9uyPmcy4FyD8Dybv9MOSxUvEKBpJcwNm+qyt
	 D9xxTah46LfQsAa2mDgzZkgBcUxq706FGk5fb9d9ntlp4dbyoDWE1xM3NCZ88RugD1jVK
	 pR8FmA0c6miKsre93dk0niFIDpNb9mMow2oWQ+Xk8TK+ch49m3WpED49tJxPLYpLw/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794265005;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=6uvhtLrU6em2+utZZIkUjy/Mx4o9u/PCprfxjj8Iji4=;
	b=z6r7XP1L0lxh3Aav+2qCF+QcZgDGhueKEaaXwtQre7YbH7k+BF6Jcu8nTzav2jjqexl5
	 lj69zwcwgHjQ34fAOYnllO7cpIzJFlJ55GqKDYDgXtqPzBuU72C+dUS7PDlNCAqLBujvF
	 478vlogpiHecfVOk/Wo+hCfhFFFeuXqT3gt/8NosVT6BxoPHtgtopiGOyfHKf1RUDBaNC
	 7RK5F15t2LTkbFKQgKYRAik0PLhzSghSq3oarO7mrdfuzJz6aaBQUP3148yFxke8OZuq9
	 YOhYoGdcyGQL4lMxWSHml0xs55jJLsVkTA5IbqPddTYbbZo9qLUS4fHvSlBOIdQZJMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NolyIpdd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F57606A326
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 22:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NolyIpdd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 949881F008A1;
	Mon,  9 Nov 2026 22:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794265004;
	bh=6uvhtLrU6em2+utZZIkUjy/Mx4o9u/PCprfxjj8Iji4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NolyIpddTv/aVON6JUa5/of34hCyAmUcrkpaCsIyX/GWeoZagJ8pONRzxJK89e8fc
	 Yy5KXkLtdkpMwcVyodUIBv2eJWMgScmIQMMQkzyUcEF8/Y68YVpObGEIwKXZ+l2WTG
	 BInp9h14aSsBfQZrCgGdztY25V+YGEmFvPu4YMk5m3YtODfRkJ6N51ghJGcUKP5vxJ
	 aS2G/Km30RsHYK8FiXfRlsbiB0gHGfRihPfAIIDP0/nG/7l4aP9gusL3sIjJ16O0Lf
	 raBTwGoBsVJF9VrzhQajbjqcgpM2Sir8H3NXsJilH5a7vm3uHBdZI2rKo2XMN6joIo
	 85KH+ekLg9Qhg==
Message-ID: <sashiko-outbox-205777@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/8] media: qcom: camss: Add SM8150 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gaurav Suman" <gauravsuman007@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261109-sm8150-camera-v1-2-3d2e7b407516@gmail.com>
References: <20261109-sm8150-camera-v1-0-3d2e7b407516@gmail.com>
 <20261109-sm8150-camera-v1-2-3d2e7b407516@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 22:56:44 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] media: qcom: camss: vfe_lite0 and vfe_lite1 clock rates never
  set on SM8150
- [Low] media: qcom: camss: lane_regs_sm8150 duplicates
  lane_regs_sc8280xp
--

commit c1d0bee4e04b8b076b3e10ab488e0e81fc0e07f5
Author: Gaurav Suman <gauravsuman007@gmail.com>

media: qcom: camss: Add SM8150 support

This commit adds SM8150 (Titan 175) support to the Qualcomm CAMSS driver,
including CSIPHY v1.1 lane settings and CSIPHY, CSID, VFE, and interconnect
resource definitions.

> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/d=
rivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index dac8d2ecf7995..3d8992d5dbc7b 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -144,6 +144,81 @@ csiphy_lane_regs lane_regs_sa8775p[] =3D {
>  	{0x0664, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
>  };
> =20
> +/* SM8150 (Titan 175): CSIPHY v1.1, 2-phase lane settings */
> +static const struct
> +csiphy_lane_regs lane_regs_sm8150[] =3D {
> +	{0x0004, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x002C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0034, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},

[ ... ]

> @@ -1221,6 +1297,10 @@ static int csiphy_init(struct csiphy_device *csiph=
y)
>  		regs->lane_regs =3D &lane_regs_sdm845[0];
>  		regs->lane_array_size =3D ARRAY_SIZE(lane_regs_sdm845);
>  		break;
> +	case CAMSS_8150:
> +		regs->lane_regs =3D &lane_regs_sm8150[0];
> +		regs->lane_array_size =3D ARRAY_SIZE(lane_regs_sm8150);
> +		break;
>  	case CAMSS_2290:
>  	case CAMSS_6150:
>  		regs->lane_regs =3D &lane_regs_qcm2290[0];

[Severity: Low]
This isn't a bug, but lane_regs_sm8150 is identical to the existing
lane_regs_sc8280xp table in this file.  Could CAMSS_8150 share the
CAMSS_8280XP case in csiphy_init() instead of duplicating the 70-entry
table?

> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index c54185c93a8a9..bda61bf1f5739 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c

[ ... ]

> +	/* VFE_LITE0 */
> +	{
> +		.regulators =3D {},
> +		.clock =3D { "gcc_axi_hf", "camnoc_axi", "cpas_ahb", "slow_ahb_src",
> +			   "vfe_lite0" },
> +		.clock_rate =3D { { 0 },
> +				{ 400000000 },
> +				{ 0 },
> +				{ 0 },
> +				{ 320000000, 400000000, 480000000, 600000000 } },
> +		.reg =3D { "vfe_lite0" },
> +		.interrupt =3D { "vfe_lite0" },
> +		.vfe =3D {
> +			.line_num =3D 4,
> +			.is_lite =3D true,
> +			.hw_ops =3D &vfe_ops_170,
> +			.formats_rdi =3D &vfe_formats_rdi_845,
> +			.formats_pix =3D &vfe_formats_pix_845
> +		}
> +	},
> +	/* VFE_LITE1 */
> +	{
> +		.regulators =3D {},
> +		.clock =3D { "gcc_axi_hf", "camnoc_axi", "cpas_ahb", "slow_ahb_src",
> +			   "vfe_lite1" },
> +		.clock_rate =3D { { 0 },
> +				{ 400000000 },
> +				{ 0 },
> +				{ 0 },
> +				{ 320000000, 400000000, 480000000, 600000000 } },
> +		.reg =3D { "vfe_lite1" },
> +		.interrupt =3D { "vfe_lite1" },
> +		.vfe =3D {
> +			.line_num =3D 4,
> +			.is_lite =3D true,
> +			.hw_ops =3D &vfe_ops_170,
> +			.formats_rdi =3D &vfe_formats_rdi_845,
> +			.formats_pix =3D &vfe_formats_pix_845
> +		}
> +	},

[Severity: High]
Does vfe_set_clock_rates() skip setting the clock rates for vfe_lite0 and
vfe_lite1?

VFE_LITE0 and VFE_LITE1 sit at indices 2 and 3 of vfe_res_sm8150, so
camss_init_subdevices() -> msm_vfe_subdev_init() assigns vfe->id =3D 2 and
vfe->id =3D 3.  When vfe_set_clock_rates() checks each clock,
vfe_match_clock_names() formats the lite clock name from vfe->id:

drivers/media/platform/qcom/camss/camss-vfe.c:vfe_match_clock_names() {
	snprintf(vfe_name, sizeof(vfe_name), "vfe%d", vfe->id);
	snprintf(vfe_lite_name, sizeof(vfe_lite_name), "vfe_lite%d", vfe->id);

	return (!strcmp(clock->name, vfe_name) ||
		!strcmp(clock->name, vfe_lite_name) ||
		!strcmp(clock->name, "vfe_lite") ||
		!strcmp(clock->name, "camnoc_axi") ||
		!strcmp(clock->name, "camnoc_rt_axi"));
}

For vfe->id 2 and 3, vfe_lite_name is "vfe_lite2" and "vfe_lite3", which
does not match "vfe_lite0" or "vfe_lite1".  Because csid_res_sm8150 does
not list these clocks either, clk_set_rate() is never called on vfe_lite0
or vfe_lite1, leaving both VFE Lite blocks at their 19.2 MHz boot rate when
streaming through VFE_LITE0 or VFE_LITE1.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109-sm8150-cam=
era-v1-0-3d2e7b407516@gmail.com?part=3D2
