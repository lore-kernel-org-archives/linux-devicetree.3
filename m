Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00ECD3DEFF1
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 11:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781090769; cv=none; b=g/5KBdmyvgGQbib8UZqFDFnFVVlFNOOsbBnFQRgsf11z43yPwMM/Gs651BnRAqDLC+u7LsrMTR1E2J3ONQfV93CCdbqHPaRtAO9u0+0HameYWsIvfq+PV+priI4EGL2cB/v4sw7700XAlNE4gzmuiB3h8ZzBoIHFlNn635rWLqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781090769; c=relaxed/simple;
	bh=LkRX8UFvgtZbMA3fFHZqw0dlZwzGnch+TmMIftEv4P0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pfHjGhypfH0hDZMKCC2WII2Kac08ttfX1BKWwSmIwzZKbtEfFz/gCayD1mFsf2eoUNiUgDzpcXwtl9bT9j+yo+qxiBzSWLcu2JhA4mJ9AjNIVAnAZKnGMAu7NFIU0fHo1u113zt1J1uFlEb6s/BTIlyRhK+t/tZ5KIdfY+dKPrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UryZY2IN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UryZY2IN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62D8F1F00898;
	Wed, 10 Jun 2026 11:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781090767;
	bh=/WwvvOHSwVxV8ivENQpditDF3vMCQpiGrYrWshfvu2M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UryZY2INzvJXOzNQyftuMNvDxhcU01zvWFXuxCZSwhOuKOUfy80ojiVvJjLeSfnV/
	 NiHOnCJJWKub425foZ+sHt/slgoeSm1DOrh+30tUhps49WokssSH7Jj7au/VXbDcOQ
	 lOsoVvMGtEWP2aytTD7FIkaHlHQTLGJ3L9PK37YyDYE33SshghBAfv9FpJfD85fdor
	 nuBzNZUPB+SbQFUO3eZprIWzUGtaj2+wAONCEiaJ1wVdwVLJhS0JHD513EiXEt7VVl
	 7Le/w5RlH9v815cDdqUgZqUBd9xbtWxwKyounZ+vjYy+CycmGe3k++oc6yrha8upt8
	 beHtQX5co+5CQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Add SD Card support for Glymur
 SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Monish Chunara" <monish.chunara@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260610111508.3941207-4-mchunara@oss.qualcomm.com>
References: <20260610111508.3941207-4-mchunara@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 11:26:06 +0000
Message-Id: <20260610112607.62D8F1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing `resets` hardware reset property for the `sdhc_2` node
--

commit 3328d962d23c195e0ded6a5fa736fc357bc968ef
Author: Monish Chunara <monish.chunara@oss.qualcomm.com>

arm64: dts: qcom: Add SD Card support for Glymur SoC

This commit adds support for the SD card on the Glymur SoC and enables
the required pinctrl configurations.

> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/q=
com/glymur.dtsi
> index 20b49af7298e9..0989fe39e7ef7 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
[ ... ]
> @@ -3927,6 +3927,57 @@ lpass_ag_noc: interconnect@7e40000 {
>  			#interconnect-cells =3D <2>;
>  		};
> =20
> +		sdhc_2: mmc@8804000 {
> +			compatible =3D "qcom,glymur-sdhci", "qcom,sdhci-msm-v5";
> +

[Severity: Medium]
Should this node include the resets =3D <&gcc GCC_SDCC2_BCR>; property?

The SDHCI-MSM driver typically uses the core_reset (fetched via the resets
device tree property) to explicitly reset the SDHC hardware block during pr=
obe,
ensuring it is in a clean and known state.

Although the driver requests the reset as optional, omitting it means the
kernel cannot reset the controller. Could this lead to unpredictable contro=
ller
behavior or probe failures if the bootloader leaves the block in an
inconsistent state?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610111508.3941=
207-1-mchunara@oss.qualcomm.com?part=3D3
