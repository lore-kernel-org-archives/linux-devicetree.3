Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF6A4DA9AB
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 12:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789646801; cv=none; b=HLpGVXlPwNZpa+9bGw8RvPxLoH2acmK3ro3S8mukEh9eQSLGZqHoCf0agjIuggd4WeZvT/FmmQePYn+hq8BlKgbZ4BumGP659on44y11wpz52HS9h2GQOH56aE0JVFQmx5E0aXTqhuMck4RExqDlJMKj+oA6rnrH9K28Nowk+Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789646801; c=relaxed/simple;
	bh=PNmgRKxHN0vI51fxRq3mWkvuejosp+5v1D9KhX/74y8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sF3p0/MBmIvENoJ0sjc/QIT9DSbidTJlyys4W0u0nrnrnyvGhGyKN4kCs98foAT7c2Yxbm1P8ReepL9H+3A2G5DICwgWIoyvY7yIqQlm//LOQ0R49cvy9v/jyyBc0hXXW9Yl446XWQ6HhqWDRcCYDn9tHMgk8W5b49TgZK7SWbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jbxJbGnZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jbxJbGnZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A67FD1F00899;
	Thu, 17 Sep 2026 12:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789646789;
	bh=taGSk/awfNnfy47em1nCem60hxqEp6X/YsVds/pUQs0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jbxJbGnZhyNI2DF5s4qj6fuL9YYUdk5XO5mqqGVpxPfV8Hxh4pcb5gAIE/xtygRT5
	 x1wa5BYwoBR3Oz4BeyWi1PI+TZMAhGi3lBx5sExDhGQHtjLd4Zcc+aYYUx5RaxZtLr
	 HPcU1VYn4boJ1IXzF7SBpbmsZoPloE1IJZqnEYUimoc2HG41tXtzE4qVXtCGGSS9hK
	 xu8xlHMgkqjcRM0Ti/XMf4GEeUXDXjH4kRZtMUltBhfZW5g+9MfAHgclzz6pKgCL2v
	 AVjBwKyYEEKtxR+AUArEoDUiNFHcxZL+SesbBYr3TT/O72RuFuFlHb9ixm93COBOFI
	 iAccjNkDkq2JA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 18/18] arm64: dts: qcom: kodiak: Fix PCIe WAKE# GPIO
 polarity
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krishna Chaitanya Chundru" <krishna.chundru@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260917-root_port-v2-18-0d627d0856d5@oss.qualcomm.com>
References: <20260917-root_port-v2-0-0d627d0856d5@oss.qualcomm.com>
 <20260917-root_port-v2-18-0d627d0856d5@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 12:06:29 +0000
Message-Id: <20260917120629.A67FD1F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dts: undocumented addition of wake-gpios property to pcie1_port0
--

commit 6e97f1471613f8cea666aa46eb12ba3627dc0138
Author: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

arm64: dts: qcom: kodiak: Fix PCIe WAKE# GPIO polarity

This commit updates the polarity of the PCIe WAKE# GPIO across several
Qualcomm device trees to match the active-low requirement defined in the
PCIe Base Specification.

> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts b/arch=
/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts
> index 5bb33a8a98304..509fc4941a029 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts
[ ... ]
> @@ -579,6 +579,7 @@ &pcie1_phy {
> =20
>  &pcie1_port0 {
>  	reset-gpios =3D <&tlmm 2 GPIO_ACTIVE_LOW>;
> +	wake-gpios =3D <&tlmm 3 GPIO_ACTIVE_LOW>;
>  };

[Severity: Medium]
The commit message states the intent is to fix the polarity of existing
wake-gpios properties by changing GPIO_ACTIVE_HIGH to GPIO_ACTIVE_LOW.
However, for &pcie1_port0 in this file, the wake-gpios property did not
exist previously and is being newly added.

Is this an accidental inclusion, or should the commit message be updated
to clarify that wake functionality is also being added for pcie1_port0
on this board?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917-root_port-=
v2-0-0d627d0856d5@oss.qualcomm.com?part=3D18
