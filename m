Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6783A254A
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 07:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790235796; cv=none; b=QbFAsI7z2ka7C66TFN7YboXP54vP6/qRy2hVDtdBXlJD0NeZYOCdb4Gw7YV78sBJvMJc0UbjfMAbUX7E+dWefiGb4Xjmj1kHt8mhGOGR0sQKdqSVa8iPqMMJIv0QiHZu7jntlq2FYAj8W+NKfKzYj3gI2pPX/pfCqkWcKBnq/GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790235796; c=relaxed/simple;
	bh=inhk9/KfP1Wj0q5y9U2aJloFAHufl7W2GgJY3na3I9g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=exeQ+SOyT1hQnov2xf+mq0b8KvALrkfy6q44atXHRLutMVF9s8edlxa8/ORYeOLpAr57bXjFlZdqhHNTpiuKWueoVlhgZRhQgzaeTeuwsRPrblmZe3dtyqcY0Yf0FUWF1ZNTtEAW3wAVCfDZ0pgkMKzzxeKzLRvM6QUxsZvGnGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T3akYzJm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T3akYzJm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8677D1F000FF;
	Thu, 24 Sep 2026 07:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790235794;
	bh=Jl4A3v5vtwKmw+Ul7e63X7rn1a5JiO9p+8B6yfBG17U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=T3akYzJmQifI7pPvbg6yQtcsEYG98mMdPzpCYV/tw1EQOiqFQfJAg85ibeYB75GdQ
	 RxXfL14rj6IeIKaliDJO941koPmlgM+Pc5CmzkGIeqLo3sIAhh/vo+JJjJYJWBd89y
	 npw/x+UK8u/74eVpBerZsb5tjuHn/mi+05nvY8qPCtdH7F6D7qptEKMsQ5xtTAc0vZ
	 oqcZUF2yy7HfaL2/JyQ+Ll/WlK6anuGs8k5sy5zIS39xvvSE2XCPGNOThOnJ66IUx0
	 n5C3hY8iDzYFMSijEJNWxCRAtPXMF81cIuBCOZV3qsxfRogRBB6SlRWUZhGgfd9gol
	 HK2Qoy13MIvaw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: nord: Add bwmon node for Nord
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260924073222.1000666-3-shengchao.guo@oss.qualcomm.com>
References: <20260924073222.1000666-1-shengchao.guo@oss.qualcomm.com>
 <20260924073222.1000666-3-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 07:43:14 +0000
Message-Id: <20260924074314.8677D1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt: qcom: nord: BWMON nodes lack compatible and are not disabled in=
 base dtsi
--

commit 675cbf4793d6f43a6d3c3f98ae9f6537235567fc
Author: Pushpendra Singh <pussin@qti.qualcomm.com>

arm64: dts: qcom: nord: Add bwmon node for Nord

This commit adds BWMON nodes and associated OPP tables for dynamic DDR/LLCC
frequency scaling. The compatible strings and interconnect properties are
added in the nord-embedded.dtsi variant file.

> diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qco=
m/nord.dtsi
> index e0496fd40c308..4c3504b2a233b 100644
> --- a/arch/arm64/boot/dts/qcom/nord.dtsi
> +++ b/arch/arm64/boot/dts/qcom/nord.dtsi
[ ... ]
> @@ -1460,6 +1460,73 @@ uart13: serial@a98000 {
>  			};
>  		};
> =20
> +		bwmon_cluster2: pmu@1014400 {
> +			reg =3D <0x0 0x01014400 0x0 0x500>;
> +			interrupts =3D <GIC_SPI 739 IRQ_TYPE_LEVEL_HIGH>;
> +			operating-points-v2 =3D <&bwmon_cluster_opp_table>;
> +		};
> +
> +		bwmon_cluster1: pmu@1015400 {
> +			reg =3D <0x0 0x01015400 0x0 0x500>;
> +			interrupts =3D <GIC_SPI 812 IRQ_TYPE_LEVEL_HIGH>;
> +			operating-points-v2 =3D <&bwmon_cluster_opp_table>;
> +		};
> +
> +		bwmon_cluster0: pmu@1016400 {
> +			reg =3D <0x0 0x01016400 0x0 0x500>;
> +			interrupts =3D <GIC_SPI 813 IRQ_TYPE_LEVEL_HIGH>;

[Severity: Low]
Since bwmon_cluster0, bwmon_cluster1, and bwmon_cluster2 omit the
'compatible' string here to wait for variant-specific interconnects, should
they be marked with 'status =3D "disabled";' in this base dtsi?

If they remain enabled, won't they unconditionally instantiate as incomplete
dead nodes in the final DTB for any other board (such as nord-gearvm.dtsi)
that includes nord.dtsi without appending a compatible string?

Base SoC nodes awaiting variant properties typically need to be disabled by
default or located entirely within the variant include to satisfy DT schema
validation.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924073222.1000=
666-1-shengchao.guo@oss.qualcomm.com?part=3D2
