Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48491A680B
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 04:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778646516; cv=none; b=RYJwglODdSmz4iTkx0zwOe8SfCaLX3W1ebZcQU4CTyYXL4lSNOGtX99NSOLxZRsqOS3zmdA49lx6mAmIMKg3kIfIxhfSQH2Y5bqIT6bXthV+Pj1+K08cHA07ZhrjA/IMSr3/XT7thlo0z26bCoU+Vpvzy50ocSWQ2A2KXPsjrjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778646516; c=relaxed/simple;
	bh=53KRb+QdttugPWcaOLSqdmFPTnZQu0vobGCck0ENdsA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qdhVtjuOPZv+wEy1gSnn+OCEUFxDsWowgH7f73ePXqh1aePOto4Gg3JMlVov4ceRIq+GxkJNTOuK6cPPBTHtNs4io1U1632+Vhgp5jzoBmPyqee3RdP1+bcqV2CkePqrZtv3+U/GAIJa29Tltp3sr1B4Dld0Kg9FpLlb5/AwALY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jm2tuO+y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jm2tuO+y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 073F9C2BCB7;
	Wed, 13 May 2026 04:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778646516;
	bh=53KRb+QdttugPWcaOLSqdmFPTnZQu0vobGCck0ENdsA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=jm2tuO+yYFYRTS6rFjTCoLhbUywV/kf7kFruRGcYcndqNzeiEJ9b2IBmknma+UzSg
	 69eyN66TAQpqUViefcMYbvtTQn6g5CrlJttGMFEMCak/zWUhCGlhyl0y9o8IV89VUo
	 c+65y2bRVwl9KOXh5E8yeG/XPYs6rexg+D1iR0OlsQjJLR6I+YdFOcPMjFvMU31s5F
	 tAwO4G8CRFEBNo2mfFVH8qEnlZ2zXFRQ3XIBFq3InUY7gj9G/gVPQXb1yiZQqerUbD
	 98+3RgQ+78OZbxn0Tj9srn7DhekpC0sApKtVLoPdbDFboPDn2uKvqWcyn0hnRK5saa
	 u/k1xeqWx6t8w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Add Shikra CQM SoM platform
Reply-To: sashiko-reviews@lists.linux.dev
To: "Komal Bajaj" <komal.bajaj@oss.qualcomm.com>
Cc: robh@kernel.org, linux-phy@lists.infradead.org, neil.armstrong@linaro.org, vkoul@kernel.org, olteanv@gmail.com, krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260512-shikra-dt-v1-3-716438330dd0@oss.qualcomm.com>
References: <20260512-shikra-dt-v1-3-716438330dd0@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2026 04:28:35 +0000
Message-Id: <20260513042836.073F9C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The PMIC regulator definitions omit their required input supply de=
pendencies (e.g., `vdd_s2-supply`, `vdd_l3-supply`), breaking the power hie=
rarchy.
- [Medium] The device tree inaccurately hardcodes the `compatible` string t=
o a different PMIC model (`qcom,rpm-pm2250-regulators`) instead of explicit=
ly identifying the actual hardware (PM4125).
--

commit 457abf6e7ac410430c866842e08e602ec3daaa51
Author: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

arm64: dts: qcom: Add Shikra CQM SoM platform

Add device tree include for the CQM variant of the Shikra System-on-Module.
This variant integrates the Shikra SoC and PM4125 PMIC. The DTSI includes
the common shikra.dtsi and adds PM4125 PMIC regulator definitions.

> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/bo=
ot/dts/qcom/shikra-cqm-som.dtsi
> new file mode 100644
> index 0000000000000..401e71720519d
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
[ ... ]
> +&rpm_requests {
> +	regulators {
> +		compatible =3D "qcom,rpm-pm2250-regulators";

Since the commit message indicates this is a PM4125 PMIC, should the
compatible string include a specific identifier for the actual hardware?

Using a specific identifier like "qcom,rpm-pm4125-regulators" alongside
the fallback allows the kernel to apply specific quirks if PM4125 errata
are discovered later.

> +
> +		pm4125_s2: s2 {
> +			regulator-min-microvolt =3D <1000000>;
> +			regulator-max-microvolt =3D <1200000>;
> +		};

Do these regulators need to explicitly define their input supply dependenci=
es
such as vdd_s2-supply?

Without these properties, the regulator framework might be unaware that the
PMIC regulators draw power from upstream supplies.

If the kernel dynamically manages the upstream supply and its reference cou=
nt
drops to zero, could it be disabled, causing an unexpected power loss for
downstream components?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512-shikra-dt-=
v1-0-716438330dd0@oss.qualcomm.com?part=3D3
