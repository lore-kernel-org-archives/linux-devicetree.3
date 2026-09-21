Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3884C3E451B
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 10:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789985055; cv=none; b=SB8lS7MJ589z4UKIPl5t2dks/Nlk4vwBC37uJqnGUGf7i1fkaenYV5uhTJeuGGZoYuMv+V0qMWunWsyZy7bGCkrv/v6nlMHhxtTEXKTe2M6zwgbNQKVM7yofJmZJRZ5JB04kgpzhrEahVi2qEGXmGOWWE1xqzG8Q2xmYGlQNOxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789985055; c=relaxed/simple;
	bh=7B1KwnAzKkk51aZnvmIoqH5tuRSKwRvPTkgpW6Cx13M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=u0e/JS0wlX2u2YMPsw4BWno1T4CjxOyYtVR6qrFHNOPxd9vktbYHkjNUF5OwbFOUKOk6So/HBC/4mHtj8i3c6AY9/kLbpcD9y5eSzTKRqCm8yJUySHdGfHO61kHdF9IsRSjo0RVaiZg7vsb51l5mUfySn/av0sLmbxK7hqMVlLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=icmQPuGS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="icmQPuGS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C0421F000FF;
	Mon, 21 Sep 2026 10:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789985053;
	bh=QQUnHGRVF6nprFoCbL7EXydZ0GNp98ACCsSGZOB+LZs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=icmQPuGSKJCgTez/qQ6ajxt9Cm/FHxYrfngrt7ZiYI4bSa5W78IGkjsUgNTiLh/04
	 5YVY0TJ3XdHaP/HGp4uOU2m1fhLyubrdK4B68OW3W2kumvelyfABrFvPUiRvb3hIsx
	 kQHmBRw6HCjKcBamM2CR96WI1Id//Oo7izb5oGK0xPtoVwdWbOJKVWXyTaaWHCCBeR
	 T12xh3KtE/YdD1N0139wqXFBedbWIaJPeYLqQr3VISPpwejQuDNwBDavxsqbIL1pWG
	 KVhAcQJBd55BDKgFivjrzend2VL1febMyCcncwhSeWQsddwTkiH9NpRQmzZIt7Xwrx
	 9yBsw8jeg84Zw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/5] arm64: dts: qcom: eliza: Add iris video codec
 node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wangao Wang" <wangao.wang@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org, conor+dt@kernel.org
In-Reply-To: <20260921-add_iris_for_eliza-v2-3-5fe7be8c0230@oss.qualcomm.com>
References: <20260921-add_iris_for_eliza-v2-0-5fe7be8c0230@oss.qualcomm.com>
 <20260921-add_iris_for_eliza-v2-3-5fe7be8c0230@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 10:04:13 +0000
Message-Id: <20260921100413.7C0421F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] dts: qcom: eliza: iommus hidden in subnodes causing SMMU bypass
--

commit b77780d6cb2ef27e94100c8e74b32f91454ac5cd
Author: Wangao Wang <wangao.wang@oss.qualcomm.com>

arm64: dts: qcom: eliza: Add iris video codec node

This commit adds the Iris video codec hardware node for the Eliza SoC.
It defines the hardware at 0xaa00000, including interconnects, clocks,
power domains, and operating points.

> diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qc=
om/eliza.dtsi
> --- a/arch/arm64/boot/dts/qcom/eliza.dtsi
> +++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
[ ... ]
> +		iris: video-codec@aa00000 {
> +			compatible =3D "qcom,eliza-iris";
> +			reg =3D <0 0xaa00000 0 0xf0000>;
[ ... ]
> +			status =3D "disabled";
> +
> +			non-pixel {
> +				iommus =3D <&apps_smmu 0x1940 0x0>;
> +				iommu-ranges =3D <0x25800000 0xba800000>;
> +			};
> +
> +			pixel {
> +				iommus =3D <&apps_smmu 0x1947 0x0>;
> +			};

[Severity: High]
Does this break the IOMMU configuration for the upstream iris driver?

The mainline devicetree binding and Linux driver core expect the iommus
property directly on the main iris device node (video-codec@aa00000) to
correctly attach it to an IOMMU domain.

Placing the iommus configuration inside non-pixel and pixel subnodes appears
to rely on downstream parsing behavior. Because the upstream iris driver do=
es
not parse these subnodes, the main device will lack an IOMMU attachment.
Will this cause subsequent DMA allocations to bypass the SMMU or fail entir=
ely,
leading to SMMU context faults when dealing with IOVAs?

Additionally, does this node structure fail dtbs_check validation since
the subnodes and the iommu-ranges property are forbidden by the upstream
bindings?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921-add_iris_f=
or_eliza-v2-0-5fe7be8c0230@oss.qualcomm.com?part=3D3
