Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC2B345CAF
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 06:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782109039; cv=none; b=Ew++6dly7JwBBQ8r7pHkpemgpWlOYcL1aCqjcz6tAlgh0aFUV74vLXA7gwwVn0Dr7V8SuxFYmusWzGm/ekr6MfaVqZvyMeyokboIfMLL5Ork/Tgqxd6iUbik2e6T146yQ7ldw65IH46DT0FqRUBDNb8NHR9ldxYuk7t43VwOuUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782109039; c=relaxed/simple;
	bh=swSvTniacKgZNNHmUkdg2n8Gpi6tlucmSm8zLCHDkVM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=J+RlH9pAQBYdZc8Y2a70GdjxuGc58fQ3hBoZbOZlOdpZE2ahHzpPemW8yar2N2ilF1BBhgFuUXdqoLPQrYIMIJmiDSz9jzw+ZQJnhlMQmbWfjY4JHjUwrAMmH2JnTee7EMRbbnC4T6Rq7ig6KXT9xncC8vl1MKeuCtVcKf1usjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b518jjJP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b518jjJP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0737F1F000E9;
	Mon, 22 Jun 2026 06:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782109038;
	bh=QW3m594sBahJYv0/fsKNgG7U/h7oPvv5M4/lCA6chTc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b518jjJPozHIy6QGEu6Y0eJ0mAtCQuuHeZ3xDkPCjrhDm5vIdYUiUPQecCT/ITjMg
	 JE3sPtLxzW+FbdX1lW9r2QHuZJBi4gYg5iRPo8Md5UdxOYWCh0hbUmOSK3a7h+Iprb
	 ZKR3Ydb+mJRZ9vfI/y6oeV5YHrIgFHpJXXOojfw6dDouZagAXMHFPpEVk02eZiYVry
	 UFLdihSWaXJHjIHQ264F4gpETyHF6JRN23mLv4PBkTh4vJcIifxheAhyT1obTI5Hzo
	 Wv8/Lxkh6nqJ+2JJVjBXDscueQ/yvMAZrMZh9orPev0gemn9T0pHibmsLkEphXy38f
	 rugGGLkKcTqkw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] interconnect: qcom: add Maili interconnect provider
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Raviteja Laggyshetty" <raviteja.laggyshetty@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260622-maili_icc-v1-2-0aa8286e6748@oss.qualcomm.com>
References: <20260622-maili_icc-v1-0-0aa8286e6748@oss.qualcomm.com>
 <20260622-maili_icc-v1-2-0aa8286e6748@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 22 Jun 2026 06:17:17 +0000
Message-Id: <20260622061718.0737F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Overlapping array indices in `mmss_noc_nodes` due to unsequential =
DT binding macros.
- [Low] INTERCONNECT_QCOM_MAILI Kconfig entry deviates from standard subsys=
tem patterns by missing architecture dependencies and improperly adding `de=
fault ARCH_QCOM`.
--

commit 8dd65bdb718ff52c61f92fb6eb9e65eee995529e
Author: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>

interconnect: qcom: add Maili interconnect provider driver

Add driver for the Qualcomm interconnect buses found in Maili based platfor=
ms.
The topology consists of several NoCs that are controlled by a remote proce=
ssor
that collects the aggregated bandwidth for each master-slave pairs.

> diff --git a/drivers/interconnect/qcom/Kconfig b/drivers/interconnect/qco=
m/Kconfig
> index 5b8a094ca4ede..5b57f111c63c0 100644
> --- a/drivers/interconnect/qcom/Kconfig
> +++ b/drivers/interconnect/qcom/Kconfig
> @@ -47,6 +47,16 @@ config INTERCONNECT_QCOM_KAANAPALI
>  	  This is a driver for the Qualcomm Network-on-Chip on kaanapali-based
>  	  platforms.
> =20
> +config INTERCONNECT_QCOM_MAILI
> +	tristate "Qualcomm MAILI interconnect driver"
> +	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
> +	select INTERCONNECT_QCOM_RPMH
> +	select INTERCONNECT_QCOM_BCM_VOTER
> +	default ARCH_QCOM

[Severity: Low]
Does this Kconfig definition miss the standard "depends on ARM64 || COMPILE=
_TEST"
constraint found in other Qualcomm interconnect drivers?

Also, by specifying "default ARCH_QCOM", does this unconditionally force the
driver to build on all Qualcomm targets rather than relying on defconfigs,
potentially causing unnecessary bloat?

> +	help
> +	  This is a driver for the Qualcomm Network-on-Chip on maili-based
> +	  platforms.
> +
>  config INTERCONNECT_QCOM_MSM8909
>  	tristate "Qualcomm MSM8909 interconnect driver"
>  	depends on INTERCONNECT_QCOM

[ ... ]

> diff --git a/drivers/interconnect/qcom/maili.c b/drivers/interconnect/qco=
m/maili.c
> new file mode 100644
> index 0000000000000..e5eed7f998f92
> --- /dev/null
> +++ b/drivers/interconnect/qcom/maili.c

[ ... ]

> +static struct qcom_icc_node * const mmss_noc_nodes[] =3D {
> +	[MASTER_CAMNOC_HF] =3D &qnm_camnoc_hf,
> +	[MASTER_CAMNOC_NRT_ICP_SF] =3D &qnm_camnoc_nrt_icp_sf,
> +	[MASTER_CAMNOC_RT_CDM_SF] =3D &qnm_camnoc_rt_cdm_sf,
> +	[MASTER_CAMNOC_SF] =3D &qnm_camnoc_sf,
> +	[MASTER_MDP] =3D &qnm_mdp,
> +	[MASTER_MDSS_DCP] =3D &qnm_mdss_dcp,

[Severity: High]
Does mmss_noc_nodes[] have overlapping array indices due to how the
dt-bindings are defined?

Looking at dt-bindings/interconnect/qcom,maili-rpmh.h:

#define MASTER_CAMNOC_HF                0
#define MASTER_MDP                      1
...
#define MASTER_CAMNOC_NRT_ICP_SF        0
#define MASTER_CAMNOC_RT_CDM_SF         1
#define MASTER_CAMNOC_SF                2

Because these macros share the same values, the later designated initialize=
rs
in mmss_noc_nodes[] will silently overwrite the earlier ones.

Does this unintentionally drop qnm_camnoc_hf, qnm_mdp, and qns_mem_noc_hf f=
rom
the provider array, breaking interconnect requests that target them?

> +	[MASTER_CDSP_HCP] =3D &qnm_vapss_hcp,
> +	[MASTER_VIDEO_CV_PROC] =3D &qnm_video_cv_cpu,
> +	[MASTER_VIDEO_EVA] =3D &qnm_video_eva,
> +	[MASTER_VIDEO_MVP] =3D &qnm_video_mvp,
> +	[MASTER_VIDEO_V_PROC] =3D &qnm_video_v_cpu,
> +	[SLAVE_MNOC_HF_MEM_NOC] =3D &qns_mem_noc_hf,
> +	[SLAVE_MNOC_SF_MEM_NOC] =3D &qns_mem_noc_sf,
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260622-maili_icc-=
v1-0-0aa8286e6748@oss.qualcomm.com?part=3D2
