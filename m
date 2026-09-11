Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE4A4779A3
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 16:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789145507; cv=none; b=MI5lg25CCmgi7TKpajcO7gMkJElrolvcWCzHpC38cVooJDmT8E1FvPzcOxMEQnUNoRAFOmvMyH9lHstg5UvZODL8zS/cxGB+TmMguI3fIEyGoHOgwPogfE1bySTFLVYGpgyHTfCj8QbeJQpm8elPRdltMNaEVnjG+TaH5e5ux7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789145507; c=relaxed/simple;
	bh=WlxkhsFauIVxIg4z8Cfg0BApeiBAaCKbrjxYHHUd6dI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rOfLvEQSBGwM3beVnSAq1vAYNXFeqDEcib6ktHiaOS7dm8SDhB6w4i68LYX/Uf+X6+ATe2VAvhQOJMuViJDm29uEsvDRMVqhf+7ZnamqsK/hypXGWV82hd/qb8VnmOISkPOMoENhzh0Tw92HtBgQ3SA26cFXrlebYZRCAaHvFAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eKXUI1cB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eKXUI1cB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75E951F000FF;
	Fri, 11 Sep 2026 16:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789145505;
	bh=kmdyFPPCL4BuPiXjVzRtzW2nRc528bDTzfW/icF3Co4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eKXUI1cBZWGo5NW8G9RvPB63AzxvzIe3Jh5RR3SeS/8HqP3v70CVtj/TiibTp0O07
	 bIsAUyhOIBq36UEPCwQgZ0mn0SNMJTRzwYhwRWH+WA7fNz5CtzSxVGtUE/KA91ZK61
	 HqGsOQBta4WlImX4uvh4S1REz44C4VNCBshhT/GYNVzUTqozaQ37bfdctbSxFbJYoP
	 W/qVLBrA4axIMX/4qtDzWlMv28i9p/EdUyEXnByonUfTESrHyV2Py4xz0Y9b0ZesJl
	 5tfwzM/s86gCKRCIK6LbifR1bDmnsoevdRBYjaTlOSSRWLQcmN3YzeLfAMl25nM0Wy
	 K/ysSNI1RXqxQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 3/4] arm64: dts: qcom: Add PMIC thermal support for
 Shikra CQ2390M SoM platform
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jishnu Prakash" <jishnu.prakash@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260911-shikra_adc_support-v6-3-e4b2da5cd55c@oss.qualcomm.com>
References: <20260911-shikra_adc_support-v6-0-e4b2da5cd55c@oss.qualcomm.com>
 <20260911-shikra_adc_support-v6-3-e4b2da5cd55c@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 16:51:45 +0000
Message-Id: <20260911165145.75E951F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Hardware Configuration / Pin Muxing Error for ADC channels
- [High] Missing `polling-delay` in thermal zones disables thermal mitigati=
on
- [Low] Undocumented and incomplete ADC channels (chgr_skin and gnss_therm)
--

commit 98fcf70dd02eac02e053cdcbc6ca2e2a21056370
Author: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

arm64: dts: qcom: Add PMIC thermal support for Shikra CQ2390M SoM platform

Add ADC channels for pa, quiet and msm thermistors along with
their ADC thermal bridge nodes and thermal zones for PMIC
thermal mitigation.

> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/bo=
ot/dts/qcom/shikra-cqm-som.dtsi
> index fde7fc035bf5d..c7fb71675b793 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
[ ... ]
> @@ -32,6 +33,68 @@ key-volume-up {
[ ... ]
> +	thermal-zones {
> +		sys-1-thermal {
> +			polling-delay-passive =3D <2000>;
> +			thermal-sensors =3D <&pa_therm_bridge>;

[Severity: High]
Does this thermal zone require a polling-delay property?

When polling-delay is omitted, the Linux thermal framework disables baseline
polling timers. The generic-adc-thermal bridges over SPMI ADCs do not seem =
to
generate temperature threshold interrupts.

Without a polling-delay, it appears the temperature is never read and these
trips will not trigger.

This question also applies to sys-2-thermal and sys-3-thermal.

> +
> +			trips {
[ ... ]
> @@ -69,7 +132,64 @@ vreg_pmu_ch1: ldo4 {
>  	};
>  };
> =20
> +&pm4125_adc {
> +	pinctrl-0 =3D <&pm4125_adc_gpio5_default>, <&pm4125_adc_gpio6_default>;
> +	pinctrl-names =3D "default";

[Severity: High]
Is this pin muxing correct for the channels defined below?

This assigns pinctrl-0 to gpio5 and gpio6, but the chgr_skin and
gnss_therm channels added below use ADC5_GPIO3_100K_PU and
ADC5_GPIO4_100K_PU, which map to physical GPIO3 and GPIO4.

If the wrong GPIO pins are set to high-impedance while the actual pins used
for ADC are left unconfigured, could this corrupt ADC readings or cause
unwanted power draw?

[ ... ]
> +
> +	channel@54 {
> +		reg =3D <ADC5_GPIO3_100K_PU>;
> +		label =3D "chgr_skin";
> +		qcom,ratiometric;
> +		qcom,hw-settle-time =3D <200>;
> +		qcom,pre-scaling =3D <1 1>;
> +	};
> +
> +	channel@55 {
> +		reg =3D <ADC5_GPIO4_100K_PU>;
> +		label =3D "gnss_therm";
> +		qcom,ratiometric;
> +		qcom,hw-settle-time =3D <200>;
> +		qcom,pre-scaling =3D <1 1>;
> +	};

[Severity: Low]
Are these two ADC channels intended to be included in this commit?

They are not mentioned in the commit message and are not connected to any
thermal zones, which might suggest they were accidentally copied over along
with the GPIO5/GPIO6 pin muxing defined above.

> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911-shikra_adc=
_support-v6-0-e4b2da5cd55c@oss.qualcomm.com?part=3D3
