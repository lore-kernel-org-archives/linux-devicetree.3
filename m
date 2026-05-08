Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9CD33F5AB
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 20:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778272405; cv=none; b=KO+acOtS1oFtSNs5xQffERXyfp4yY6lNkEBm8X6HMJeIhf2lMPecWwm98ghcDfht1Sqm+2Kd7NuhF1ss/fT47q/grBgE5TK2T6UsBIIaQ2/TLZU4uaufvDnXtW1o0ZkMgIXpSoVkSr+nz7OniaoovihxN37G2ArpiwQ5/C3qu48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778272405; c=relaxed/simple;
	bh=wMYSpyc89cN2GnsraHRxlVoDgK85qYAzRrlYDuKRp58=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=T8NCC+KJ4xMHQURWQefNhenkLJSQf+FsxReVAGAhBTaCX1vs8MqHfbS7DrFq2F7W7d09dae851YBlOsogY9+Q5oyLiMhKib6KjX4b/oUg8tpZWkk6AaBuCWCrdfX0Hk7RujHRW6dE/Gq2MiDhfWIkd9Z1gEcYW1m0bSo6E5JhIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sMSLu+xE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sMSLu+xE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F26E9C2BCB0;
	Fri,  8 May 2026 20:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778272405;
	bh=wMYSpyc89cN2GnsraHRxlVoDgK85qYAzRrlYDuKRp58=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=sMSLu+xEFxl21Ej8acQN/ukYbKWr9uZfjwvvXoXRyJYAkY5xMZdtxVxEJp899cVCR
	 OcaqAq8aW+/cJv82zPUli0XHvhG7XqKSwzEe4Ko1W+U+4RRBwaoYX2mjMGln35ZEpW
	 H+w/hClP3tqwf1wBNCWaT5qaGVNu73NAMnfxTVDGE+fM6LjpwuqNEv8upx43+lSOrQ
	 arpMWRY6X7TEF0LVbase1yOrhF5T3IMa9b91sYTMwLSOaDs6gecBBx+i84Qa465TUk
	 IA2zk7C+aNiKOD3Rc9+MRzUjsO3gbz6Rys7tEAk6/Io+oNJY4MsZA8lvESvJp4Xvb1
	 eCW28/M160jbA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 2/5] media: qcom: camss: Add Kaanapali compatible
 camss driver
Reply-To: sashiko@lists.linux.dev
To: "Hangxiang Ma" <hangxiang.ma@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260508-kaanapali-camss-v13-2-2541d8e55651@oss.qualcomm.com>
References: <20260508-kaanapali-camss-v13-2-2541d8e55651@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 08 May 2026 20:33:24 +0000
Message-Id: <20260508203324.F26E9C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Out-of-bounds memory write and kernel panic due to missing bounds =
check on devicetree endpoint port ID.
- [Low] DT compatible string uses an internal codename ('kaanapali') instea=
d of a formal SoC part number.
--

commit 4432b1ccccdf08cae8c8cb1876abd2d97b1956f7
Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

media: qcom: camss: Add Kaanapali compatible camss driver

This commit adds support for the Kaanapali platform to the camss driver. It
introduces high-level resource information, bus bandwidth votes, and a
matching devicetree compatible string.

> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index 9335636d7c4df..ffaeeb9d17976 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
[ ... ]
> @@ -5102,6 +5116,13 @@ static void camss_remove(struct platform_device *p=
dev)
>  	camss_genpd_cleanup(camss);
>  }
> =20
> +static const struct camss_resources kaanapali_resources =3D {
> +	.version =3D CAMSS_KAANAPALI,
> +	.pd_name =3D "top",
> +	.icc_res =3D icc_res_kaanapali,
> +	.icc_path_num =3D ARRAY_SIZE(icc_res_kaanapali),
> +};

Does this incomplete resource structure introduce a panic during setup?

Because csiphy_num is implicitly 0 here, devm_kcalloc allocates a 0-sized
array and returns ZERO_SIZE_PTR for the csiphy array.

If a devicetree contains endpoints, camss_parse_endpoint_node() directly
assigns the port number from the devicetree endpoint to
csd->interface.csiphy_id without verifying it is within the bounds of
camss->res->csiphy_num.

When an external sensor binds, camss_subdev_notifier_bound() then blindly
uses this ID to index &camss->csiphy[id]. Because it offsets from
ZERO_SIZE_PTR and writes to csiphy->cfg.csi2, this causes an immediate
kernel panic.

While a later commit in the series (media: qcom: camss: csiphy: Add support
for v2.4.0 two-phase CSIPHY, sha: de1603c8ca2ad) populates csiphy_res and
resolves the 0-sized array issue, the underlying missing bounds check
remains. A devicetree specifying a port ID greater than or equal to
csiphy_num will still trigger an out-of-bounds write.

Could we add a bounds check against camss->res->csiphy_num when parsing the
endpoint node?

> +
>  static const struct camss_resources msm8916_resources =3D {
>  	.version =3D CAMSS_8x16,
>  	.csiphy_res =3D csiphy_res_8x16,
[ ... ]
> @@ -5316,6 +5337,7 @@ static const struct camss_resources x1e80100_resour=
ces =3D {
>  };
> =20
>  static const struct of_device_id camss_dt_match[] =3D {
> +	{ .compatible =3D "qcom,kaanapali-camss", .data =3D &kaanapali_resource=
s },

This isn't a bug, but upstream devicetree naming conventions require the use
of official, public SoC part numbers (like sm8550 or x1e80100) rather than
internal manufacturer codenames.

Is it possible to update qcom,kaanapali-camss to use the actual Snapdragon
SoC model number it represents, to stay consistent with the rest of the
matching table?

>  	{ .compatible =3D "qcom,msm8916-camss", .data =3D &msm8916_resources },
>  	{ .compatible =3D "qcom,msm8939-camss", .data =3D &msm8939_resources },
>  	{ .compatible =3D "qcom,msm8953-camss", .data =3D &msm8953_resources },

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260508-kaanapali-=
camss-v13-0-2541d8e55651@oss.qualcomm.com?part=3D2
