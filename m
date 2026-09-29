Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33FE83264FD
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 06:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790662065; cv=none; b=BxP3yZW1hLQV6AFIRmjyGHkyRh3wnT2xjFgC6X5UN//iqYwyWN0PH1KTP4Uiy3W7ZoV5xSQLIXP5ousUGllJuTtD8lBs/Zh0eLDLPfA6P2FleqXop6uDLMpZMrLEXmpzRs1I/C+e8n4vY5Rq4thRmmnOsiFme2z2JN0lUHlEU0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790662065; c=relaxed/simple;
	bh=+KaF4zBuA9nXBcFWyaFSBxjWg07CyHyyiF8AYn3iC8I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VR/b+twreAOa64/LHxx4opxQlovgylQxp520YLS4gGxkiV3roPuRIqsu8TmP6NIiBiBqLvXn+kax8LNb29agzasRywLQTgBmr9mOtQr9gbVPCc1gLlTD5YAD/ZHPVTxymoiNWnRPbBxELh9B+AI+GHffWbjUrTs08uZFXKbxa8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O2OyrNjf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O2OyrNjf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 537E11F000FF;
	Tue, 29 Sep 2026 06:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790662063;
	bh=tJc6rGaF8C+h+XcHtTUlb3HiNkxP28eR9dM9i8BSSVM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O2OyrNjfcGeE2Lo1J5CCK0u4/BL05QpkwGWpyQKbkfAafPlFVRKtUVwiMscXgLg12
	 13eveUIQg/n+LFeObXMMZ0YDhh/NzUul4rN1A5sJzdEI4WkJ64NyQ1hl6N1bJIonEQ
	 Bkyvyw+E+PWG6RFEygkNPfsauM+VwUtEX72SmWTdCcilcO2pGZnmsSymuqevGCnTpM
	 x58EzqOjfrwxJfsPGC+jTf/1hnTUNicWojUhdMn5+dVj5t/c2l1R2KXY0wv6FNVZoS
	 VTs42bHCx36On5v1CVGhooqulQetUdmdjy4PRupWYbMmeeTiGrSVq5ix+FpWpOro+o
	 1fw/NGct11C9Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v17 11/11] arm64: dts: qcom: kaanapali: Add camera MCLK
 pinctrl
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hangxiang Ma" <hangxiang.ma@oss.qualcomm.com>
Cc: media-ci@linuxtv.org, robh@kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org, linux-phy@lists.infradead.org, olteanv@gmail.com, neil.armstrong@linaro.org, conor+dt@kernel.org
In-Reply-To: <20260928-kaanapali-camss-v17-11-dcf3fd37f76c@oss.qualcomm.com>
References: <20260928-kaanapali-camss-v17-0-dcf3fd37f76c@oss.qualcomm.com>
 <20260928-kaanapali-camss-v17-11-dcf3fd37f76c@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 06:07:42 +0000
Message-Id: <20260929060743.537E11F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dts: devicetree node names incorrectly use underscores
--

commit 185a6cf958fbea99362a9e2c9f3989dad4362d3c
Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

arm64: dts: qcom: kaanapali: Add camera MCLK pinctrl

This commit adds TLMM pinctrl states for the camera master clock GPIOs on
Kaanapali so camera sensor nodes can select the proper MCLK pin functions
when enabled.

> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dt=
s/qcom/kaanapali.dtsi
> index c19945bc438eb..bbcd5a622f0b2 100644
> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
[ ... ]
> +			cam_mclk2_default: cam-mclk2-default-state {
> +				pins =3D "gpio91";
> +				function =3D "cam_asc_mclk2";
> +				drive-strength =3D <2>;
> +				bias-disable;
> +			};
> +
> +			cam_mclk3_default: cam_mclk3-default-state {

[Severity: Low]
Does this node name incorrectly use an underscore instead of a hyphen?

Devicetree node names conventionally use hyphens rather than underscores.
The previous nodes like cam-mclk0-default-state use the correct hyphenated
pattern.

Using an underscore here and in the subsequent cam_mclk4 through cam_mclk7
nodes will trigger dtc style warnings (node_name_chars_strict) and fail
standard devicetree style checks.

> +				pins =3D "gpio92";
> +				function =3D "cam_mclk";
> +				drive-strength =3D <2>;
> +				bias-disable;
> +			};
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928-kaanapali-=
camss-v17-0-dcf3fd37f76c@oss.qualcomm.com?part=3D11
