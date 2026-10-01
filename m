Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0033EDAC1
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 13:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790862651; cv=none; b=s0NlYz20EE4jY/mWRqQF3JlQuw5A6wEP1+v6d3rkO8mOEt0uTXiBd7ncnPXP1XhdunTNyLApOLZbWHsfG1EfiAQEU3yslqZev9Y9SRzG0+WK7plTGt4uZOTurvsLjB/kiOMYJZVWb9/RYM247dgZTbIjqyduDVf1eTSW/LYrVAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790862651; c=relaxed/simple;
	bh=Knd0rt3x+e7A9wmzopxg7HPEccwfRXMbgg+YSQOFeY0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jdhgwyaYpwtGFzEh3AsffuftECFKgDt9zHAoeo3o1KAoByRXMzDap236w7evN3uKqp+fMl4olea14t7QVl+AJx8I6hz7ymXicJ0ywupfPynGQBBuYNTC9wNdvEuROtIfG85WK3EXBmxplptJHj3UU8bsspRVw6cPjv8Rhtzx+lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KqV9v02X; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KqV9v02X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D945E1F000FF;
	Thu,  1 Oct 2026 13:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790862650;
	bh=H1OiAZ2pMVFI6JJmXS/SbIKSt2AMq8Ca7RXgTwIrDAE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KqV9v02XPjSn0KQzkFajtYGk8jlWHWLHR6o1W0K3zAejIrF9O127CT2wfctooKF1Y
	 Ap0sNFfGSQW0V1zgqbJrtVgD5y+cnY5zRk9q0k8MFmZimuXBWcVnCjtAqH1XDyqoWt
	 dJ3aGCnHGLDuwhOZVci/X/CmsOZKcuIfgXoDrpKhTr6tWfLuALlT2PNS49RkutYlNG
	 8VREHbRBFnIW5AO0crua2ba5+hQQRtnwkD1rOIau3sbz2rYM7/riImKSXuNHYCbOQz
	 shd3APx6FUo4Cp4Dj/3qlYfdG3393zMkvwf3q8miqC6sBnsYSe/VVtcapkT9IwoWjk
	 yi1FmJVc1V/wA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/2] arm64: dts: qcom: shikra: Add Iris video codec
 node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vikash Garodia" <vikash.garodia@oss.qualcomm.com>
Cc: media-ci@linuxtv.org, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20261001-shikra_vpu-v6-1-37143dc1bb9d@oss.qualcomm.com>
References: <20261001-shikra_vpu-v6-0-37143dc1bb9d@oss.qualcomm.com>
 <20261001-shikra_vpu-v6-1-37143dc1bb9d@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 01 Oct 2026 13:50:49 +0000
Message-Id: <20261001135049.D945E1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: missing qcom,shikra-venus compatible string in schema
--

commit 72de37a6e4a3d11559749c7b3aae80f415758b83
Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

arm64: dts: qcom: shikra: Add Iris video codec node

This commit adds the Iris video codec device tree node for the Shikra
platform. It describes the Iris-based video decoder/encoder block, allowing
the media driver to probe and initialize the hardware.

> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/q=
com/shikra.dtsi
> index 9823c591b02b1..d2e4db4025dcc 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
[ ... ]
> @@ -2809,6 +2809,67 @@ adreno_smmu: iommu@59a0000 {
>  			power-domains =3D <&gpucc GPU_CX_GDSC>;
>  		};
> =20
> +		iris: video-codec@5a00000 {
> +			compatible =3D "qcom,shikra-venus", "qcom,qcm2290-venus";

[Severity: Low]
Is this new "qcom,shikra-venus" compatible string documented in the
dt-bindings schema?

It appears to be missing from the corresponding dt-bindings schema (such as
qcom,qcm2290-venus.yaml). This will cause validation failures during
`make dtbs_check`.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261001-shikra_vpu=
-v6-0-37143dc1bb9d@oss.qualcomm.com?part=3D1
