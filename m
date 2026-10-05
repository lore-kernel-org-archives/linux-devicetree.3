Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6361B22126C
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 07:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791185730; cv=none; b=DBSXaMFCLE+DVFaD9bDn/YZfqU4fe48338xwGeSiZdF5x2zr6lGUsZ3dCeyJ/dRXUgHOGtefkZK+7Pwj0R5x0uVFyvdmrvyUMrYDa1+RhZMiw1GYLqnskSrYzie9kTGq/yBmtj7cg+4G8kokDv6NY8QTSbPXpJiN2/Quqhcqg/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791185730; c=relaxed/simple;
	bh=ksIlhxKRHCMYucSTrlQA3/3NQZ9GZaree9gd/6H1IZQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aw5ea0sBCPpFmZ8AAtife6tQFbG3pQVeE5pg1iMh9o3sQl7YqXxOkHv1OTEF/95FXTlR5iTPW7sDT374nzUKOyz/cy6+5vc0LgnNfYgLLQvRqxmzgiQ7QR41Dyv5Z8tY3O2uoGJWYQx8k7wtydqMibIkTT3SqGr+ZKtZwWbhA98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZCQ3JEmI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZCQ3JEmI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C10011F000FF;
	Mon,  5 Oct 2026 07:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791185729;
	bh=3F3QHfpvLBv4kZLQcz5gHkGDwleXMbGboGQTya8oXK8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZCQ3JEmIOCvqazhigP4NF6jCN4XgJOeMYiF8b/WsPdMzmqjquq+HfdqpFfhtVEicZ
	 LHB4J3I/30P2DYK0fMt1+GMi1MN7krnrhtdKO+D7CoDnVIapm1mk8/973+vhnsDjcG
	 FTS6ZIafYh2ZIScPToIaII0r/N+I2T15Elwjsh7K/YPUaZ7dNCd3uc+L6gnruJSwpB
	 rTPyP/U4vi+iO8SagrzTPqfjbm5rCuDaFgsfMOLMz8Fn6TOKV4HhTmG+iQpaHyrAw5
	 WycP/AkSqRKXQQ5YqCueImQ57HqUWkwYe17eGNJjDeIKz6xCRCRuYIxRSkozC+Wo7w
	 Xdqry551kBf6g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/5] arm64: dts: qcom: kaanapali: Add DisplayPort
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Balaji Kalkonda" <balaji.kalkonda@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20261005-kaanapali_dp-v1-3-6faeac3a6d59@oss.qualcomm.com>
References: <20261005-kaanapali_dp-v1-0-6faeac3a6d59@oss.qualcomm.com>
 <20261005-kaanapali_dp-v1-3-6faeac3a6d59@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 05 Oct 2026 07:35:28 +0000
Message-Id: <20261005073528.C10011F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] dts: qcom: mdss_dp0 incorrectly uses MX power domain instead of MM=
CX
--

commit 553dc7a911ae71f6e7c738ff40500145e878f936
Author: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>

arm64: dts: qcom: kaanapali: Add DisplayPort controller

This commit adds the device node for the DisplayPort controller on the
kaanapali platform. It configures the OPP table, clocks, power domain,
and connects it to the DPU and USB/DP QMP PHY.

> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dt=
s/qcom/kaanapali.dtsi
> index e48a179d07220..155c590c8eb60 100644
> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
[ ... ]
> @@ -3851,6 +3854,86 @@ mdss_dsi0_phy: phy@9ac1000 {
> =20
>  				status =3D "disabled";
>  			};
> +
> +			mdss_dp0: displayport-controller@9ad2000 {
> +				compatible =3D "qcom,kaanapali-dp";
[ ... ]
> +				operating-points-v2 =3D <&dp_opp_table>;
> +
> +				power-domains =3D <&rpmhpd RPMHPD_MX>;

[Severity: High]
Should this power domain be RPMHPD_MMCX instead of RPMHPD_MX?

When the mdss_dp0 DisplayPort controller is active and changes link rates,
its performance state votes will scale the MX (memory) voltage rail instead
of the MMCX (multimedia) rail.

Since the display hardware physically resides on the MMCX rail, could this
misrouting cause the MMCX rail to be starved of the required voltage? This
appears like it could lead to under-voltage, silent hardware hangs, and
display corruption, while unnecessarily elevating the memory domain voltage.
Sibling display subsystem components like mdss_mdp and mdss_dsi0 typically
use RPMHPD_MMCX.

> +
> +				phys =3D <&usb_dp_qmpphy QMP_USB43DP_DP_PHY>;
> +				phy-names =3D "dp";
> +
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261005-kaanapali_=
dp-v1-0-6faeac3a6d59@oss.qualcomm.com?part=3D3
