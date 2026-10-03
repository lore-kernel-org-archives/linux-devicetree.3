Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 111243A75B8
	for <devicetree@vger.kernel.org>; Sat,  3 Oct 2026 18:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791050798; cv=none; b=cPexre8m5uOephfv4mVkRAKWVNZuOgCBKpyg8UmU7M0b81leqQ3FPu+jJF/zxKXlVmNpF6BTVpoRmCgoWFsR/C3wLp9OfwyIEwCGrZy9SMAa2o+izISp+ecf91o6j6OA/C73AIWLiycErrzr1SGu+ZvcHEi1OdMwNZLK/sg/7HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791050798; c=relaxed/simple;
	bh=5q+LDlYmngPPOmkRbePg7gbQ/UB1W0TkPNlT6xTanX4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=liioZVlyTvhjEBOyN+We6tragNb2n/FBa04OhAsoj1/HQA3y3dbhT3VeOcxEPfpxW0cpVqFvx62/Ts5dQ/7357nHN0d4z7CqYvZsnLTbaTM4fD6FDGCU3gyXgZncMy5BIStXGx/6E3ug9fNxbsXBhraP0JwEIDib5HljsxuPwjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BREPUKKN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BREPUKKN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B5F21F0089B;
	Sat,  3 Oct 2026 18:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791050796;
	bh=6uZDcwkVBKk055Ugg3q5i+Z7eqy60iY5yZbRTBIj3po=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BREPUKKNMgn0eNdUHcQOnAw90ndCAJiljo4XrmjSRQm44DtVXZfQD03I5iohzg9hE
	 t5WNCB20o5NAKNtvwaA7Ljy5j7IONlLxZCmGOTYoCO1SbFwIyP5YooI7kLRIFH/h52
	 qSMVPRwDrkxgYS298quqz3gBREkgM3tOBEPwThDIcv5XA7ConbGb4dUcjdj5GAwRa+
	 ByXbCjpmOoxc5bAJS6eHVQR/dqb7BEUOr2YJyLJnkdI7q9sNjEcSqimZzda3cCWQeQ
	 lfV3XEnw0KYZtMkg3gJ3bTpfhRlgjxW9dHe0eUMEmOHUv+zH+9GU/F7DQtusyZRwF/
	 9mGUh53XxaTYA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 09/11] arm64: dts: qcom: pm660l: add analog audio
 codec
Reply-To: sashiko-reviews@lists.linux.dev
To: "Richard Acayan" <mailingradian@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261003175659.23536-10-mailingradian@gmail.com>
References: <20261003175659.23536-1-mailingradian@gmail.com>
 <20261003175659.23536-10-mailingradian@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 03 Oct 2026 18:06:35 +0000
Message-Id: <20261003180636.5B5F21F0089B@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] dts: pm660l: board-specific hardware properties hardcoded in gen=
eric PMIC dtsi
- [Low] dts: pm660l: undeclared sound-name-prefix causes dtbs_check warning
--

commit cfcd4e3e10aad19a5a6d69fee31b064e8108d24a
Author: Richard Acayan <mailingradian@gmail.com>

arm64: dts: qcom: pm660l: add analog audio codec

The PM660L analog audio codec (PMIC revision 4) controls the headphone
jack, and optionally the earpiece and speaker, at the vendor's decision.
This commit adds the analog audio codec to the generic PMIC device tree.

> diff --git a/arch/arm64/boot/dts/qcom/pm660l.dtsi b/arch/arm64/boot/dts/q=
com/pm660l.dtsi
> index 3f8b9eafe1641..5b406b83043c2 100644
> --- a/arch/arm64/boot/dts/qcom/pm660l.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm660l.dtsi
> @@ -87,6 +87,46 @@ pm660l_wled: leds@d800 {
>  			status =3D "disabled";
>  		};
> =20
> +		pm660l_codec: audio-codec@f000 {
> +			compatible =3D "qcom,pm660l-wcd-analog-codec",
> +				     "qcom,pm8953-wcd-analog-codec";
> +			reg =3D <0xf000>;
[ ... ]
> +			interrupt-names =3D "cdc_spk_cnp_int",
> +					  "cdc_spk_clip_int",
> +					  "cdc_spk_ocp_int",
> +					  "mbhc_ins_rem_det1",
> +					  "mbhc_but_rel_det",
> +					  "mbhc_but_press_det",
> +					  "mbhc_ins_rem_det",
> +					  "mbhc_switch_int",
> +					  "cdc_ear_ocp_int",
> +					  "cdc_hphr_ocp_int",
> +					  "cdc_hphl_ocp_det",
> +					  "cdc_ear_cnp_int",
> +					  "cdc_hphr_cnp_int",
> +					  "cdc_hphl_cnp_int";
> +			qcom,hphl-jack-type-normally-open;
> +			qcom,gnd-jack-type-normally-open;
> +			qcom,micbias2-ext-cap;

[Severity: Medium]
Will this cause problems for other boards that include this generic PMIC
file but have different hardware wiring?

These physical wiring properties (qcom,hphl-jack-type-normally-open,
qcom,gnd-jack-type-normally-open, qcom,micbias2-ext-cap) seem like they
should be placed in board-specific .dts files rather than a generic common
.dtsi.

Other boards with differently wired jacks (e.g., normally-closed) or lacking
an external capacitor will inherit these settings, which could lead to
inverted headphone detection or broken microphones.

> +			sound-name-prefix =3D "Analog";

[Severity: Low]
Is this sound-name-prefix property supported by the dt-binding schema?

It appears that the dt-binding schema for this codec
(Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml)
enforces additionalProperties: false and does not define sound-name-prefix.
Adding it here will likely cause a dtbs_check validation failure.

> +			#sound-dai-cells =3D <1>;
> +			status =3D "disabled";
> +		};
> +
>  		pm660l_spmi_regulators: regulators {
>  			compatible =3D "qcom,pm660l-regulators";
>  		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261003175659.2353=
6-1-mailingradian@gmail.com?part=3D9
