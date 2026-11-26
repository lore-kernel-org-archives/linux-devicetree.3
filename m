Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795690270;
	b=Y3ZxQPYt5poIoMGT+mr4yUtQrPSFmN5oFZ0UYE4xwVDdkDShebGhdLa5mJaBDEsbgw/a
	 tFdXtzSVjGZTbMB6onm1ttfN1stAa7tfRaocKdTWUMjmRhLB8xSCVnnGVbGjTivBHs/uF
	 Tf5DYf8SqUHgoqAQoS/RqMeL1CvXNKxHTAgiwv7odfmtWJYQh2NpxEuYvr7OFXYZuzana
	 yEPa9a9DisqaQqGp+t/h0R5xIt8nytC6SsFoYRfrgwnqmGUyNGYedBXDbVRSvPyOVBgbH
	 rRTOYvqV1Gzv07FsPgHPiUvIGLH0niG1Q4U5l3/iS7AQPsYmKlReomINmR2LWpFHX+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795690270;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=bSq2Zoq+wpG5cdKasN71vtMc8zrpS8qYlnGg3EC2Q5U=;
	b=QrFkhV9PFjXKMWl8pMZpQ3qkvXYOEEnIC3sKuNvX0LvxIsn4SfQ8JcWBxbgT4D6l4ZNf
	 bYWMVitQBAjxwrASge/H7IVzRbqbQEeJaArFsOCeKwVbBRFyXfsdMFpATiHrs8QDJUQFA
	 nUWb67IROAGkA6KXeRYcmlA5M1SfUFp9fEWG9GGPQ9yOIL8ZrjblYBCFtso+DTKSEw5aW
	 yWYUxGlJtbAJyJiveNuLCoJQ8V/cS/scivxMCxr88zyliDPAqHWcthw+F6m+ogFupIIvd
	 IK+UvQafCtnyXsq5XiexHXz+p+o4m45uI6zFBrVWQd4pTEAi2ssEtTYSrhmFRlkyRFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nzhT+jnU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7F5606A337
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 10:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nzhT+jnU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3DB21F000D1;
	Thu, 26 Nov 2026 10:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795690270;
	bh=bSq2Zoq+wpG5cdKasN71vtMc8zrpS8qYlnGg3EC2Q5U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nzhT+jnUkYwEITU7BvCoK3fDtMoUvvM7sLZ8MKtu2c/zd8ZhQO+Go3L5M5S4PUGmv
	 7iRb2ZzN6bOvSd3zmgPWGPyKCvP0CHQZ0ekT+olwfsdJoDdNQufaCcJzbfVNdptDLj
	 kIYfoR0UnA0piXRa64+avjay6k/RSnH6lKB37TfxD6O97CN8tPsWRZCcq8NCU0O8TT
	 wkgDC4bbCySh2tMZTouUDFNNO1jkD7XuO8Big2i0vM9FU3srUnDOJVZkKPUgq13+cE
	 bXC1a9u1mVXchPziwfB5PrnVd1LQzHKilxpo4tp5+V0Y5IrBseEdEiSbP9UgyTUwlk
	 spLe9vdQZxdQw==
Message-ID: <sashiko-outbox-235314@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/2] arm64: dts: qcom: shikra: Add CYPD6129/CYPD6229
 Type-C controller support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akash Kumar" <akash.kumar@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261126104201.1613183-2-akash.kumar@oss.qualcomm.com>
References: <20261126104201.1613183-1-akash.kumar@oss.qualcomm.com>
 <20261126104201.1613183-2-akash.kumar@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 10:51:09 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] arm64: dts: qcom: shikra: unmatched cypress,cypd6129/cypd6229
  compatibles
--

commit f8d3542b1abf0d37f0676642c4bc05a132b572ce
Author: Akash Kumar <akash.kumar@oss.qualcomm.com>

arm64: dts: qcom: shikra: Add CYPD6129/CYPD6229 Type-C controller support

This commit adds Cypress CYPD6129/CYPD6229 Type-C PD controller nodes and
connects their USB-C connectors to the USB controllers on the Shikra CQM,
CQS, and IQS EVK boards.

> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boo=
t/dts/qcom/shikra-cqm-evk.dts
> index bde3b7d81acec..46835a44cfbbf 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
[ ... ]
> @@ -29,6 +30,43 @@ &audiocorecc {
>  	status =3D "okay";
>  };
> =20
> +&i2c3 {
> +	status =3D "okay";
> +
> +	typec@40 {
> +		compatible =3D "cypress,cypd6129";
> +		reg =3D <0x40>;
> +		interrupts-extended =3D <&tlmm 136 IRQ_TYPE_LEVEL_LOW>;
> +		pinctrl-0 =3D <&usb0_intr_state>;
> +		pinctrl-names =3D "default";
> +		wakeup-source;

[Severity: High]
Are the DT binding and driver updates for "cypress,cypd6129" and
"cypress,cypd6229" missing?

ucsi_ccg_of_match_table[] in drivers/usb/typec/ucsi/ucsi_ccg.c only
matches "cypress,cypd4226", and
Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml only permits
compatible "cypress,cypd4226" with reg <0x08> and does not allow
wakeup-source.

Without a matching driver entry, typec@40 will not bind in shikra-cqm-evk,
shikra-cqs-evk, or shikra-iqs-evk, leaving Type-C PD and OTG role
switching non-functional on the affected USB controllers and failing
dtbs_check.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126104201.1613=
183-1-akash.kumar@oss.qualcomm.com?part=3D1
