Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D8E39F184
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789370098; cv=none; b=VGtBPUmoYdZ55DxPxqH7VInjIvIlpMXCdoSngSrINrEQ2CeiRHTLaA1ZFXbWj3I5oJBxmweRn9XUzHEOqZdg0+gpsXupPKTsz2uEvOeYjo8d9ZjXEhfOUSCE7a9fk+z7n13Wm9UT9W9eZP4HzzGJoQiarosloMTwbcRoFSpfxEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789370098; c=relaxed/simple;
	bh=kI2IVLXsvsxWY5Vw4dBamlHOUxhJb/abjJLnChgSkUI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WXJqfUAu4NZGnsh4LmCNNUfYDTWpBZCD27Wj2OQp4f18eXCDM893s4B8huFhMri3JehqqGGp0D7FIxlGxugdwDFgQ0aryIb9WqK9FFG6Bhc3JXh2cwQqtmwQwIWranQ3RcPOH1YAoXUhiCoOvFbxuWni7fxcjf7bXuDin+BJOpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XbBlhjqO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XbBlhjqO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C0081F00893;
	Mon, 14 Sep 2026 07:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789370096;
	bh=HoAXSG5/4LwH2PT1KOr96MdFWgVKizdKzDu3XAaU0cM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XbBlhjqOqrzOgqKuKrtQzWp1xn4EyATHBUXv9qH+ljD72C8ArHrmtqh/SIMUMNyAK
	 bOmwPJek9I6TIyWHGm/c3UZFrAGjPF2MOH/R67imHCjQbU9LsHN/3grpn9dl1sXFjx
	 U94L0awqE9DRvMbQU8xqVbTNku939uO9T9rokxbDaQHrW1fcfLZtW/u5iRds5NHuKU
	 /VAV2dykenN3WFhoMFccJCcr+wWYYR/eWjPF9l4oj6IE9e5ZeJCfy4F4cHZkYDoCV4
	 7sKJFEr3mCyrszl1UG+qZURm8GsJdmudCMO7wIEAGoyqsvFSi1zr10cF5Q30bXyH1M
	 qZfFmsj6WdvDQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 02/31] arm64: dts: qcom: sm8750: Add domain idle state
 names
Reply-To: sashiko-reviews@lists.linux.dev
To: "Maulik Shah" <maulik.shah@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260914-b4-idle-state-name-v1-2-660c31187819@oss.qualcomm.com>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-2-660c31187819@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 07:14:56 +0000
Message-Id: <20260914071456.6C0081F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The `idle-state-name` for the system-level domain state `domain_ss3=
` is incorrectly set to "cluster-ss3", likely due to a copy-paste error.
--

commit c0d5e2b0b54be493530a7796453fb58e77c73a2c
Author: Maulik Shah <maulik.shah@oss.qualcomm.com>

arm64: dts: qcom: sm8750: Add domain idle state names

This commit adds the idle-state-name property to the domain idle states for
the SM8750 device tree. This allows low power modes to be described
consistently and exposed cleanly in pmdomain debugfs.

> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/q=
com/sm8750.dtsi
> index 28cf22da854d0..897790a3a4921 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
[ ... ]
> @@ -208,6 +209,7 @@ cluster_cl5: cluster-sleep-0 {
> =20
>  			domain_ss3: domain-sleep-0 {
>  				compatible =3D "domain-idle-state";
> +				idle-state-name =3D "cluster-ss3";

[Severity: Low]
Is this intended to be named "cluster-ss3" rather than a domain-level name?

This defines the idle state name exposed to userspace via debugfs for
domain_ss3, which is a system/domain-level state (level 2, indicated by its
psci-suspend-param 0x0200c354). Applying the "cluster-" prefix here seems
like a typo that might be misleading and confuse debugging of power
management on this platform.

>  				arm,psci-suspend-param =3D <0x0200c354>;
>  				entry-latency-us =3D <2800>;
>  				exit-latency-us =3D <4400>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914-b4-idle-st=
ate-name-v1-0-660c31187819@oss.qualcomm.com?part=3D2
