Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E563E3D9D
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779875625; cv=none; b=eR712CVEYHRm2hTUOpKHrRE8/DNHZ6mXwklFr0AFbwSgONJI7Flw0Yk3An9pE2SBz0D+ccqyQek7PMWrzb3QAeVlLDmuke135dd25xmcO84Cd7qZyNLmxAI9wTnV02v2NEqPE6hZBWY+WL/1xSO8WWIgGvG5BEZmdBUivvvHdx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779875625; c=relaxed/simple;
	bh=gQ+VBvqZ5bcv9qi7rmIOIc4PgSmG8I4xBHEnILyVyPc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tkIUVKYNCMM+ZyLwyIj3YOP8zb/9ie14cBxZ3Vr/kfgMRCQrmEn6O0lh1LdaJAvSoPFHiMhUdV1zuV0wkD+KOv2V4yZyI5Jua0trvXSBmLvNemJkZc6om7217vE5n+tuRkq3bdsrzYWfU9TFIQyZLtDv/p2jXkvYjHyRkULugVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AWjkM0Kf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AWjkM0Kf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9192E1F000E9;
	Wed, 27 May 2026 09:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779875623;
	bh=WdIZnqf5Mx/MI/6EuhoAkcWepeSfPmwMcfoIDalXMeY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AWjkM0KfxPVu+/WJE39eXpQ/o7htBdaxJ43MC2rrq93iYd+LJM9eykXpct5oI6nu0
	 NqLE5eRT3Lyy7BC+Uwp6OOxED0Gc7xXKwcM26+XzJGTB9LLeSWLSU8ZDkew2jAyccs
	 S/2Rd9Ozi9MWYfm2GpAiBNiC3Ooc8iL9tPRgfCo2d/vXiu4pgeUHV3l6Ggu4GZDD1T
	 7vw3l8w2H6RQS+uyi3KwyMPq06jI9+Cc4xzeGOUGL336rLVMTu1cyrXnB/O+m9q7td
	 4Xe7AZYMEWTG7H89BGwgjP5Q8i6tdLPlRA7dR7WkdVu76tB/5bV5L7V6FCylYnsrbF
	 L9VJupwj9g1oQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 14/24] arm64: dts: qcom: sm4450: Reduce OS PDC DRV
 span to 0x10000
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mukesh Ojha" <mukesh.ojha@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260527094333.2311731-15-mukesh.ojha@oss.qualcomm.com>
References: <20260527094333.2311731-15-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 27 May 2026 09:53:42 +0000
Message-Id: <20260527095343.9192E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Reducing the `reg` span to 0x10000 in the device tree is futile =
without an accompanying driver change and will intentionally trigger a boot=
 warning.
--

commit befb5e3c3aa5e0f54a7fff3d0f4a5e96013f4a7e
Author: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

arm64: dts: qcom: sm4450: Reduce OS PDC DRV span to 0x10000

The OS PDC DRV register window on sm4450 spans 0x10000 bytes, so this
commit reduces the size of the first reg entry from 0x30000 to 0x10000.

> diff --git a/arch/arm64/boot/dts/qcom/sm4450.dtsi b/arch/arm64/boot/dts/q=
com/sm4450.dtsi
> --- a/arch/arm64/boot/dts/qcom/sm4450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm4450.dtsi
> @@ -464,7 +464,7 @@ dispcc: clock-controller@af00000 {
> =20
>  		pdc: interrupt-controller@b220000 {
>  			compatible =3D "qcom,sm4450-pdc", "qcom,pdc";
> -			reg =3D <0 0x0b220000 0 0x30000>, <0 0x174000f0 0 0x64>;
> +			reg =3D <0 0x0b220000 0 0x10000>, <0 0x174000f0 0 0x64>;

[Severity: Medium]
Will this change cause a boot warning and fail to actually reduce the mappi=
ng
size?

Looking at the qcom-pdc driver in drivers/irqchip/qcom-pdc.c, it enforces a
minimum mapping size of QCOM_PDC_SIZE (0x30000) for all devices to maintain
backward compatibility. In qcom_pdc_probe(), it calculates the size as:

	res_size =3D max_t(resource_size_t, resource_size(&res), QCOM_PDC_SIZE);

If the device tree provides a size smaller than 0x30000 (like 0x10000), the
driver automatically expands the mapping back to 0x30000 and logs a warning:
"%pOF: invalid reg size, please fix DT".

Since there are no accompanying driver changes to gracefully accept the sma=
ller
size for newer compatibles like "qcom,sm4450-pdc", does this patch introduc=
e a
spurious warning on every boot without achieving the intended mapping
reduction?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260527094333.2311=
731-1-mukesh.ojha@oss.qualcomm.com?part=3D14
