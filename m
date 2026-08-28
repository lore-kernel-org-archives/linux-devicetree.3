Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F15F3B3894
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 04:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787889736; cv=none; b=ui0Etjdz/NfpxCIFXpFFLMzDTo2+jECWyR/88uQLtifjjFFPhtsKmHNa101Ea1C0A+7U1jBWk4uHtJuRCoR2iBVVIAhogKfiuMvQZ2YHC1582BZCSUvyEBLtsF8x4FhOcg47TXBZmT8xpR/WfKsIr/r2HPsukaDHDOyC5qRl+jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787889736; c=relaxed/simple;
	bh=XbLJI/tZL7MXrCqhiUOnwXAyKB8am6Og4yS2GmN34wM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kwbJX5ZlWavR9QX6V0W+T+SJ45t6VFmHfLZBEtFJovQq4+Wjff1KviiVLSwkUhFYrEwvV7P1DwcyuxTbpEdzVWmjRV2XzkXaTfenpC0kZZSGPI/KwDYx5lX6Wt6xoY1QQ/BMhTxmWobQvJncqdDsIt3WUYrbT/K6B9N6aPh1hmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kzdyq+5k; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kzdyq+5k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B19F1F000E9;
	Fri, 28 Aug 2026 04:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787889733;
	bh=SSIUibtyShiEOQD168zPlfwnC6WokocNn9WTqDHcKdE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kzdyq+5kcTLcq00Q1zgftNs7ieMhDpkhUeTl11OyTTUKxVlghZWc3VK4ZeyxKC3ah
	 8M0vxKqkAt9nr962URjJrh+CEq/KIUf0FN1Orax6v3zZcAJDuP4LRCgugkNAK/+MRd
	 xJW/QqBPXQLqkbZ581Z4xzCPXoVfjYLd9DVGpvVpww0xN5t0dIa/cxbJ6+dU+OjPg+
	 RlCMh0ZjDzdOkk46e0GTWz+wjSAN6fs88rZueV4cnrhXY7hkRzscOwmJM/g/N0nRAH
	 dVmrs3CKHlSh79qR25gPwwShadAlsLKnH3vsJl1SgaCtbXCUU0ENP7AWY/5iJfiLZO
	 rmhUlvNGJlEUA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 1/6] arm64: dts: qcom: Add device tree for Nord SoC
 series
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260828034958.3165-2-shengchao.guo@oss.qualcomm.com>
References: <20260828034958.3165-1-shengchao.guo@oss.qualcomm.com>
 <20260828034958.3165-2-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 28 Aug 2026 04:02:12 +0000
Message-Id: <20260828040213.4B19F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing critical thermal trip points and cooling maps in all therm=
al zones, preventing OS-level emergency shutdown and thermal mitigation.
--

commit deb196841a808ec3881552d5d1a8344597819e47
Author: Shawn Guo <shengchao.guo@oss.qualcomm.com>

arm64: dts: qcom: Add device tree for Nord SoC series

Add base device tree include (nord.dtsi) for the Nord SoC series
describing the core hardware components.

> diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qco=
m/nord.dtsi
> new file mode 100644
> index 0000000000000..e0496fd40c308
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/nord.dtsi
[ ... ]
> +		cpu-0-0-0-thermal {
> +			polling-delay-passive =3D <0>;
> +			polling-delay =3D <0>;
> +			thermal-sensors =3D <&tsens0 1>;
> +
> +			trips {
> +				trip-point0 {
> +					temperature =3D <105000>;
> +					hysteresis =3D <10000>;
> +					type =3D "passive";
> +				};
> +
> +				trip-point1 {
> +					temperature =3D <125000>;
> +					hysteresis =3D <10000>;
> +					type =3D "passive";
> +				};
> +			};
> +		};

[Severity: High]
Is it intended that this thermal zone, as well as the others defined in this
file, lacks a critical trip point?

Without a critical trip point, the OS will not be able to trigger an emerge=
ncy
shutdown if temperatures exceed safe limits. Additionally, the defined pass=
ive
trip points lack corresponding cooling-maps, meaning no thermal mitigation
(such as CPU throttling) will occur when these thresholds are reached.

Should critical trip points and appropriate cooling maps be added to ensure=
 the
OS can properly manage hardware temperatures?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260828034958.3165=
-1-shengchao.guo@oss.qualcomm.com?part=3D1
