Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F762F3C07
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 06:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791960868; cv=none; b=hkaXTASHmVW1UdCZ4N54zN1I6BZgIz/Yht2DX7N1frPUaoy06BpWipP2z+xOZCRaSCK6yIoQCLGfmn9WdfqKHHxwSc0t49SubPp8ZktA+AoG5Jms0KIi1HjoWUamEa5ZMfenCSRk/ORb6/RxsM5gVMijZM6rMxLBVPTPv8RDr5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791960868; c=relaxed/simple;
	bh=1lY3CYybFEm2Ao4CWDffJZ194nqrvI6uIdH6GtWt1NU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=UlcSnSV0aGF4ob80d4nUcs6T5ZJAsQ4FanOOUP7ZA+fxnvc2W2seMYXOo5z2g6Kflx485Ee9jC7lBc94DbeRiIruVPFbACp3+6tLF62h18dTB+ZHG38E08JQkTtLUaHjuUmau1E++l6UbXBX9k30pFvMCFVIev96cYKuXu8mUgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nGu9ieny; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nGu9ieny"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12F841F000FF;
	Wed, 14 Oct 2026 06:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791960864;
	bh=5ij3wVeFWOo+52d38tKKn8wx2nLPZFw6AE5S4TLaXnk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nGu9ienyDvc8fH3tIA10+zSX2ykuSVNq1osJJ75dUNhehEqsEbqZtzQmdXm8CM/Ov
	 XZSgIkNBC8jOYFY17mAfMuWFqhQ7sUHkOAe3uuvZYiU9bGxgxLFdOJwvaEP3Qhi4Yl
	 TMqql+CwxlY12hZUHa2qtk51kBTWtaBwlj4xDcVaAZpLQLH6d2FHM8tGcmhW8XFHCz
	 o57cP/XrPD5XN2ab8rLYqLODkV+qRVxx8DOe0668OCOReXAPy7KJd4HWTOHRbk+3k6
	 Avjdk9BYKMUuJqkj3b17AAD2POH0Jj7swl0/ymDe4pe1vUo9wOfm1owZWpvGBEjb47
	 iNLdjtf4mcoXw==
Message-ID: <sashiko-outbox-170903@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/7] arm64: dts: qcom: nord-rrd: Enable ADSP and
 CDSPs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261014063953.549379-4-shengchao.guo@oss.qualcomm.com>
References: <20261014063953.549379-1-shengchao.guo@oss.qualcomm.com>
 <20261014063953.549379-4-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 06:54:23 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dts: qcom: identical firmware and DTB paths for all CDSP instanc=
es
--

commit df6b28010f1754564cc47d083b73f91275527a95
Author: Shawn Guo <shengchao.guo@oss.qualcomm.com>

arm64: dts: qcom: nord-rrd: Enable ADSP and CDSPs

This commit enables the ADSP (HPASS DSP) and CDSPs remoteproc instances on
the Nord RRD board by specifying their firmware and DTB paths.

> diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/=
qcom/nord-rrd.dts
> index 3673003c8b213..0b0acd33a2e19 100644
> --- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
> +++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts

[ ... ]

> +&remoteproc_cdsp0 {
> +	firmware-name =3D "qcom/nord/cdsp.mbn",
> +			"qcom/nord/cdsp_dtb.mbn";
> +
> +	status =3D "okay";
> +};
> +
> +&remoteproc_cdsp1 {
> +	firmware-name =3D "qcom/nord/cdsp.mbn",
> +			"qcom/nord/cdsp_dtb.mbn";

[Severity: Medium]
Will this cause resource conflicts by sharing the exact same Device Tree Bl=
ob
(cdsp_dtb.mbn) across multiple CDSP instances?

The DTB typically contains DSP-specific hardware configurations like PAS ID=
s,
minidump allocations, and IPC settings. While sharing the base firmware
binary might be possible, assigning the same DTB to CDSP1 overrides the
unique default configurations.

For example, looking at nord_cdsp1_resource in qcom_q6v5_pas.c, the driver
explicitly expects unique names:

drivers/remoteproc/qcom_q6v5_pas.c:
	.firmware_name =3D "cdsp1.mbn",
	.dtb_firmware_name =3D "cdsp1_dtb.mbn",

Should CDSP1, CDSP2, and CDSP3 use their respective unique DTB names instead
of CDSP0's dtb?

> +
> +	status =3D "okay";
> +};
> +
> +&remoteproc_cdsp2 {
> +	firmware-name =3D "qcom/nord/cdsp.mbn",
> +			"qcom/nord/cdsp_dtb.mbn";

[Severity: Medium]
Does this have the same issue of overriding the default cdsp2_dtb.mbn with
CDSP0's DTB?

> +
> +	status =3D "okay";
> +};
> +
> +&remoteproc_cdsp3 {
> +	firmware-name =3D "qcom/nord/cdsp.mbn",
> +			"qcom/nord/cdsp_dtb.mbn";

[Severity: Medium]
Does this similarly misconfigure CDSP3 by assigning it CDSP0's DTB?

> +
> +	status =3D "okay";
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014063953.5493=
79-1-shengchao.guo@oss.qualcomm.com?part=3D3
