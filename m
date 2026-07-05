Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B657331A4C
	for <devicetree@vger.kernel.org>; Sun,  5 Jul 2026 10:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783247242; cv=none; b=AIl2u5kuly7045PULH9eBhLvJBN9G1Zb76QwkgdNbU+N801PF6/hOKpjSR+E8Y+MRMaAaLlUXO0gmRHu++6RZaFbCuJo9gmbHM2kDvXSWTuXBsTnpdZD291hmw7qAf1UZl+2inNnW0wkWxxMh8mTn2BOCIQQCQJw0TFrtP36aGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783247242; c=relaxed/simple;
	bh=S9cjzhWmMsB0n10a6CVoejzTupuWS2QqhZwr8q1z4Tw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=anpvHTl/PsSnnadkzm3CXRTRZBEdmMeSRC7rdKIGOXqjpFKYqzrPTfdiJParUOCKbtrsGSozdabQjkBtRq9OJYlhp0AWBWdjh6ngQWPIMsinQEi7SvTtCL/G/S8enL1V4gUNSRyDHtFtQEq1BCMP2XnuV2I5iPX4Y+78JZQN2I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mO/2ufS8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mO/2ufS8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A45D51F000E9;
	Sun,  5 Jul 2026 10:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783247240;
	bh=YI1J4xdw10IWscohlMG0GJcxCDZD1IaWVnihxYSGsq4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mO/2ufS81pyaaFCtYV4DmozrMjpZe56c9waMWBD0BMjxcRrtv3MWRG2Ygb+4Jts41
	 po2k4ZpQisiiH5pCFpBWNawSrss3nvLiEp1Ma5vQ3HwrpUceyy8t8/1538+eMBO3Q3
	 mFxoRKy4iKO6sJxIFCY7kYsmLUlcE/JheUYTb2qr/Z8e9crJWovAVP8qWnlIr/G9cI
	 UW+H11z0Rce94f4YLXChgd9YMWTrGaXuw8yZCmn8yRciJcHeCY0siLFbBgMqc6eEBb
	 L87xSrbFg1nWE7rUhBygCEbIPWrYKd7YkZFMExXyes6669MaIFcuDS165tU8zW35lu
	 tPZnbsNnOLP3Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] media: iris: Add support for Milos (VPU v2.0)
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexander Koskovich" <akoskovich@pm.me>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260705-milos-iris-v3-2-8c1353530f24@pm.me>
References: <20260705-milos-iris-v3-0-8c1353530f24@pm.me>
 <20260705-milos-iris-v3-2-8c1353530f24@pm.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 05 Jul 2026 10:27:20 +0000
Message-Id: <20260705102720.A45D51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Incorrect VPU capacity initialization in `platform_inst_cap_milos` =
missing `mb_cycles_vsp`.
--

commit 9ae4cf8b25a90957e77a00cd4a1116d4be3f9fae
Author: Alexander Koskovich <akoskovich@pm.me>

    media: iris: Add support for Milos (VPU v2.0)
   =20
Add support for the Milos Iris codec variant found on the SM7635-AB.

> diff --git a/drivers/media/platform/qcom/iris/iris_platform_milos.h b/dri=
vers/media/platform/qcom/iris/iris_platform_milos.h
> new file mode 100644
> index 0000000000000..3b6feeda76cbd
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_platform_milos.h
> @@ -0,0 +1,28 @@

[ ... ]

> +static struct platform_inst_caps platform_inst_cap_milos =3D {
> +	.min_frame_width =3D 96,
> +	.max_frame_width =3D 4096,
> +	.min_frame_height =3D 96,
> +	.max_frame_height =3D 4096,
> +	.max_mbpf =3D (4096 * 2176) / 256,
> +	.mb_cycles_vpp =3D 200,
> +	.mb_cycles_fw =3D 326389,
> +	.mb_cycles_fw_vpp =3D 44156,

[Severity: Low]
Does this code mistakenly initialize VPU3 fields instead of the required
VPU2 field (mb_cycles_vsp) for the Milos platform?

Because mb_cycles_vsp is missing, it defaults to 0, which causes the
macroblock-dependent component to evaluate to 0 in:

drivers/media/platform/qcom/iris/iris_vpu2.c:iris_vpu2_calc_freq() {
    ...
    vsp_freq =3D mbs_per_second * caps->mb_cycles_vsp;
    ...
}

While vpp_freq (calculated from mb_cycles_vpp =3D 200) typically dwarfs
the missing VSP component in almost all practical scenarios, making this
unlikely to cause a severe bottleneck, shouldn't we still provide the
correct mb_cycles_vsp value here and remove the unused VPU3 fields?

> +	.max_frame_rate =3D MILOS_MAXIMUM_FPS,
> +	.max_operating_rate =3D MILOS_MAXIMUM_FPS,
> +};
> +
> +#endif

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260705-milos-iris=
-v3-0-8c1353530f24@pm.me?part=3D2
