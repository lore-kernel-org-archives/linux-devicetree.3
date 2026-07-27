Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4208833AD8C
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 07:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785139190; cv=none; b=gvJw1MkVcEz7KCrv+L8f6k27MiQS/k+CjlklyC9mZbMlytcHjjdj5Y8ar8U8W1Faxbcbx5lp+BSUl0q1HW0xCIwJYTVQlUYXlS3v0q50px/5ITIKm2MQmFzZlIpb/dJPmawk4NMtc8gnrrfhzqC/tUv+Z5rQZDnpi8WvniHdHeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785139190; c=relaxed/simple;
	bh=7psmryvlNiQsNTVTQ9vG4FZoyLBZAubeH+b+IV2yz9Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LRFIPoYaVLIerKHOVmnz234FAwx8Lbjws1s4IXp53V1MeAf+zFy/w6iwNCUKFfifCwx3bir9OoSsQl6TENi1o6YodplB6IbjS7TYOBAa2dUel3wOl936iiMzJJrcCwzTceINkTY07tUBLWJgNa5keq3+tEkxtleIaUuNuglEO4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R8Xka5JS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R8Xka5JS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99A861F000E9;
	Mon, 27 Jul 2026 07:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785139188;
	bh=+KdrM1FZaKK9lN11RN7mpqnSxp93PHX1IWGCyMbiFLg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=R8Xka5JSeuIRF4YKUp5spNP+/CPA3t8S81L72bOIcy5J6wjpl9iXu6O42wSTcg81h
	 m/g2/PlUE1B+aDcamYDFAhEAXdAJKdXaxbILWI/F9YrgJnYNehR6TWUzmlh0yz6DpD
	 noRw8xx8O5TGR/ihq0JNER1iydrkLr3yIlsVuK1uc2LuD09AIFkHhuyzaldPXXaVMQ
	 TK4o/PAmQ/evQ5UqnxPXw0Vmmb1RlG0rjYO1HjeFbV6sGSkLqC9EvkuidiyqWtBzbK
	 3H9Z2D6tDUj2sW0CinAesMgy6sk+KLCcgYThz0NFeNwov/P/seMeE3fE8C10XZCttk
	 eS1TSN4rIloxA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] remoteproc: qcom: pas: Add Nord ADSP and CDSP
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260727074621.561661-4-shengchao.guo@oss.qualcomm.com>
References: <20260727074621.561661-1-shengchao.guo@oss.qualcomm.com>
 <20260727074621.561661-4-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 07:59:48 +0000
Message-Id: <20260727075948.99A861F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Alphabetical ordering violation in the `qcom_pas_of_match` array.
--

--- Patch [3]: [PATCH v3 3/3] remoteproc: qcom: pas: Add Nord ADSP and CDSP=
 support ---
commit 38f8e6846aa65fbee31c1b49214c5b633ba02fbb
Author: Shawn Guo <shengchao.guo@oss.qualcomm.com>

remoteproc: qcom: pas: Add Nord ADSP and CDSP support
   =20
This commit adds support for ADSP and 4 CDSPs found on the Nord SoC. It also
configures the ADSP for early boot rather than a cold boot sequence since it
is pre-booted by XBL.

> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom=
_q6v5_pas.c
> index 25599d7282083..6f3850a3fa9e8 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c

[ ... ]

> @@ -1695,6 +1800,11 @@ static const struct of_device_id qcom_pas_of_match=
[] =3D {
>  	{ .compatible =3D "qcom,milos-cdsp-pas", .data =3D &milos_cdsp_resource=
 },
>  	{ .compatible =3D "qcom,milos-mpss-pas", .data =3D &sm8450_mpss_resourc=
e },
>  	{ .compatible =3D "qcom,milos-wpss-pas", .data =3D &sc7280_wpss_resourc=
e },
> +	{ .compatible =3D "qcom,nord-adsp-pas", .data =3D &nord_adsp_resource },
> +	{ .compatible =3D "qcom,nord-cdsp0-pas", .data =3D &nord_cdsp0_resource=
 },
> +	{ .compatible =3D "qcom,nord-cdsp1-pas", .data =3D &nord_cdsp1_resource=
 },
> +	{ .compatible =3D "qcom,nord-cdsp2-pas", .data =3D &nord_cdsp2_resource=
 },
> +	{ .compatible =3D "qcom,nord-cdsp3-pas", .data =3D &nord_cdsp3_resource=
 },
>  	{ .compatible =3D "qcom,msm8226-adsp-pil", .data =3D &msm8996_adsp_reso=
urce },
>  	{ .compatible =3D "qcom,msm8953-adsp-pil", .data =3D &msm8996_adsp_reso=
urce },
>  	{ .compatible =3D "qcom,msm8974-adsp-pil", .data =3D &msm8996_adsp_reso=
urce },

[Severity: Low]
This isn't a bug, but does inserting "nord" before "msm" violate the
alphabetical ordering of the qcom_pas_of_match array? Because "m" comes
before "n" alphabetically, should the "nord" entries be placed after the
"msm" entries to maintain the list's sorted order and prevent merge
conflicts?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727074621.5616=
61-1-shengchao.guo@oss.qualcomm.com?part=3D3
