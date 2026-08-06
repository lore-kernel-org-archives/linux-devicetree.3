Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C76D40BCC8
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 08:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786005153; cv=none; b=lDJIc6CgcGsO05EKtjeV8a0K8+hnH+2BhwiqqpqNW/3lEbSjLIPGuYW0IQQ8Dw0kdVjh3Yb1n0u73V6UeqM/jTRATQMyG+Bw+Qxer22R7jMe5ezUmM0Dt3Y4Io311CgPop5zjpiw5cPPmBjl4WPyRcTnc7DSVNqJ6iswskAmHaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786005153; c=relaxed/simple;
	bh=5cOCSuOS/jWBCwX1jMOO4lbu/phxcAxrhGwCFm5WMvw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Dkb+aKeyrSIES40v6rF7SZCFBp9VEMXorY+hblXK7wZgvfLBTRAy2CE+w2k5NJg3Y5YHh9W8ItaB7bQ4oGa1NaHlUo7VoKZNKcH0n8+8Earzp+7PhVzhNInks98es1UW1yeJiCBAfoxYMH6eEvBj1/vHNOtr4p0foUYBPA326U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m6qVicOg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m6qVicOg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D6241F000E9;
	Thu,  6 Aug 2026 08:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786005150;
	bh=EoxeE7LVijZfN0ylklKb5khQheM84e8XNoE6O7qN93c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=m6qVicOg4N4kcNAchrXT1Utmoi5BEnB7Oa6bgPGTreeKQcnMAWesIJDEDws7mu59k
	 Pv6iF9rB7ztdBKo93Jsk6Tfx28KnAD+R86P63fTekp+0YF7lPjkssgD9+blwtrU3S4
	 Zd8vflurJlUDiL+drLPh1gkIg+SNiYwpXMtGPJY8IW40uDLoY570MB3k7rBbX/5uWI
	 H5/tN7YXo5LwXOnLD2cIYFFRH8kNoAeMoa3l5KnehfT3v5XtESHY/Crdv66oaY8ABh
	 pUFlHAwidKqualUToDbYmFD/++cuGDxo4d2paiq0ylElLHJRywuixEgvkCIwiUuEHe
	 5+Pwyld6gssWg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 6/6] arm64: dts: qcom: Add device tree for Nord RRD
 board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260806081554.448531-7-shengchao.guo@oss.qualcomm.com>
References: <20260806081554.448531-1-shengchao.guo@oss.qualcomm.com>
 <20260806081554.448531-7-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 08:32:29 +0000
Message-Id: <20260806083230.7D6241F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The UFS reset GPIO index 181 requested in `nord-rrd.dts` is out of=
 bounds with respect to the `gpio-ranges` defined in the SoC base DT.
--

--- Patch [6]: [PATCH v9 6/6] arm64: dts: qcom: Add device tree for Nord RR=
D board ---
commit 7d4cf30013817c741d9f964a48bd5626ffbd7ee5
Author: Shawn Guo <shengchao.guo@oss.qualcomm.com>

arm64: dts: qcom: Add device tree for Nord RRD board

This commit adds the initial device tree for the Qualcomm Dragonwing IQ10
RRD board. It enables various hardware components including the debug UART,
UFS storage, PMICs, I2C, and SPI.

> diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/=
qcom/nord-rrd.dts
> new file mode 100644
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts

[ ... ]

> +&ufs_mem_hc {
> +	reset-gpios =3D <&tlmm 181 GPIO_ACTIVE_LOW>;

[Severity: High]
Is this GPIO index correct for the UFS reset? The requested index is 181,
but it appears the base SoC device tree (nord.dtsi) only maps 181 GPIOs
(indices 0 through 180) via its gpio-ranges property:=20
gpio-ranges =3D <&tlmm 0 0 181>;

Will this cause the UFS driver to fail claiming its reset GPIO during probe,
preventing the primary storage from initializing during boot?

> +
> +	vcc-supply =3D <&vreg_l3i_2p5>;
> +	vcc-max-microamp =3D <1300000>;
> +	vccq-supply =3D <&vreg_l2i_1p2>;
> +	vccq-max-microamp =3D <1200000>;
> +
> +	status =3D "okay";
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806081554.4485=
31-1-shengchao.guo@oss.qualcomm.com?part=3D6
