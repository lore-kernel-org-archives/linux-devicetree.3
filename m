Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3122B4E5335
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 16:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790697697; cv=none; b=IT4r3ShIwOKDMU2sxwi7azXpzNsK/0YND7xxXtUE/EGeNbx1bkOXXXUektdM2Mxb+uQLZLRpB7F3HuAikDbSRoUZVAN2s86GnQ32UgVE36bK0lSIgJcDHJRUJ5EcvNmMZwbMD1HqECpR3xP2+8LE2tfp4i1stUto8H7LolDrTy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790697697; c=relaxed/simple;
	bh=5teQPFNeK69tf+D/9Nyrar3X9dWlPifNBMyusdOQ9qY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lMOzv5KqBmUSek/0/o1sK6WDTjT3hb5ElvlmLvuJOgNvFNIQ3PRdnO28XLChDPqG9/u/nj97n6GBWw47BYUz60DDsdmdDyeqyoaxDwRoTPtAu7EiHtcDqFcShu2mrqmafjqU86Uc7/eioOIm1diQDmgELSj1Py7aA/jXeHa9hGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l1/N+0iW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l1/N+0iW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72EDB1F00893;
	Tue, 29 Sep 2026 16:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790697695;
	bh=X9J5u6RDsxA9GQWz0V9/rEAWs4M8eqCXPRA2YZEOo/0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=l1/N+0iWopwI8dX+Zmf//EpOSWo+sOs5fQKv9cQ0Z1GSC52R1goa0p1Cw5Hc9XSaI
	 izTiQKhWambRjkhrIkrsrrP/GvsQIGYuB6DbOm9BD3QvkdjwPtkHuWJ9PHp5RoDmjs
	 jZSK5WCk90Uy9fCRiFZ84vcjUIZKnW1EW0uK8y8JLFhMOs3jxqo0e3t0L3aK1Y7cmz
	 8wg9VJYuhtSNpAD+WEyHeFLuqdYJaGba1riA3Q0K0sLLkzuIReknCOFk2B+SBOyKKb
	 S/xI7XOlnQoBM0j3KjKmpWqGhH1rvYGlEscWoibI+dNnlav4VpC3T8mSDuKAKo36Gc
	 3Ek34xIELTb5w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/7] arm64: dts: qcom: nord-rrd: Enable ADSP and
 CDSPs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260929155152.1898666-4-shengchao.guo@oss.qualcomm.com>
References: <20260929155152.1898666-1-shengchao.guo@oss.qualcomm.com>
 <20260929155152.1898666-4-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 16:01:34 +0000
Message-Id: <20260929160135.72EDB1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] dts: identical firmware-name for multiple distinct DSP cores
--

commit bd06b63b7bb11c940c1decfb487bb0de89250712
Author: Shawn Guo <shengchao.guo@oss.qualcomm.com>

arm64: dts: qcom: nord-rrd: Enable ADSP and CDSPs

This commit enables ADSP and CDSP remoteproc cores on the Nord RRD board.
It configures the firmware names and sets the status to okay for adsp,
cdsp0, cdsp1, cdsp2, and cdsp3.

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
> +
> +	status =3D "okay";
> +};
> +
> +&remoteproc_cdsp2 {
> +	firmware-name =3D "qcom/nord/cdsp.mbn",
> +			"qcom/nord/cdsp_dtb.mbn";
> +
> +	status =3D "okay";
> +};
> +
> +&remoteproc_cdsp3 {
> +	firmware-name =3D "qcom/nord/cdsp.mbn",
> +			"qcom/nord/cdsp_dtb.mbn";

[Severity: High]
Will cdsp1, cdsp2, and cdsp3 fail to load their firmware during boot?

In Qualcomm platforms, distinct remoteproc instances are backed by
different TrustZone Peripheral Authentication Service (PAS) IDs and are
assigned disjoint reserved physical memory regions.

Reusing cdsp.mbn and cdsp_dtb.mbn across all four cores means that cdsp1,
cdsp2, and cdsp3 will likely fail either the ELF segment physical address
checks in qcom_mdt_load() (because the ELF p_paddr will fall outside the
core's reserved memory region) or TrustZone signature verification.

Should these nodes use core-specific names (e.g., cdsp1.mbn, cdsp2.mbn)
matching standard multi-DSP firmware naming conventions instead?

> +
> +	status =3D "okay";
> +};
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260929155152.1898=
666-1-shengchao.guo@oss.qualcomm.com?part=3D3
