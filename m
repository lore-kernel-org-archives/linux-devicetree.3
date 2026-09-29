Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6725364EAB
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 18:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790707240; cv=none; b=CKJLZWYDuRPNNvWAU24CY7kFNrecHbjiTXhHsKmJpHfHT6/NdtuDRPf82whgprsNIke6zw/d/nUtC2JRFzH669LebrRzVJl6bvTn1qcrj6IkM3ULn7txo0CTcx2u/MyBu9fBGAeWNP9lam7qXNkkO3/3T1f1DWSaR4iN12vXBQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790707240; c=relaxed/simple;
	bh=Od+ySdfwc6Co0cqZ37AR05hzn5m1C+LcAp1NzFyAF1k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=smZP1cjObzCNg2uPI96DtL01UZ8IFY/4VKAO1/O5olu4mby7/Wk1tXC9L2cfcceihhyNpm+dJugwajRbNHyK3/SGdb7Q1rKFAT3z/yAuNHIxlZ6oKJkiYNkynNF4vhOyK2sRoxGDUSQrNpitXyL3wd4YpuW+ZJQ2Gb0jbzSAF18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=owRyhpX7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="owRyhpX7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA11B1F00893;
	Tue, 29 Sep 2026 18:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790707235;
	bh=x7IR3aoIcvpOI11Ls9IPp9q8Gpl19fwJqZ0D1n91oH4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=owRyhpX7md0KgSDUyBXrGNxKruOkryqdba7gYxglz5FXzstKc7IgMFA4QKPvHWibs
	 PUSJ+x/e8HrGTrAxOUzM6yYIsStrjbm7X/cObCCfLxiHx2TR2BDo9eE5EomLpncxA4
	 XFEWFAip4N5hBb/v2aGeGhfSlzE4suKCEq4+B7/DMa89dm6pJuRGX43dBhBjepTuBb
	 88gBVIaCzq0aLIzUho6Gi7pt1+pFtIzjQio4OAdCa9bGxiIMDyckggu1mdoHmKZNBU
	 PP6yzmWxXOj0Q5ts3Zl29dyMfLS6sf9/kF1S8yCJ/mrSyoM/+veMtfmKwoOacxDnA7
	 ffNpIfXGUpGaQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/6] remoteproc: qcom_q6v5_mss: Use mss as regulator
 for MSM8953
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260929-sdm632-rpmpd-v2-3-97ef8858161b@mainlining.org>
References: <20260929-sdm632-rpmpd-v2-0-97ef8858161b@mainlining.org>
 <20260929-sdm632-rpmpd-v2-3-97ef8858161b@mainlining.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 18:40:34 +0000
Message-Id: <20260929184034.AA11B1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] remoteproc: qcom: missing mss-supply breaks MSM8953 modem and DT A=
BI
--

commit 60b163d9c0ae16c46f303d4d666d5f83a62a90cf
Author: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <barnabas.czeman@mainlining.org>

remoteproc: qcom_q6v5_mss: Use mss as regulator for MSM8953

This commit modifies the MSM8953 modem subsystem to use the MSS regulator
via voltages rather than performance levels. It updates the device tree to
remove the mss power domain and modifies the qcom_q6v5_mss driver to
request the mss regulator instead.

> diff --git a/arch/arm64/boot/dts/qcom/msm8953.dtsi b/arch/arm64/boot/dts/=
qcom/msm8953.dtsi
> --- a/arch/arm64/boot/dts/qcom/msm8953.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8953.dtsi
> @@ -1451,9 +1451,8 @@ mpss: remoteproc@4080000 {
>  					  "handover", "stop-ack";
> =20
>  			power-domains =3D <&rpmpd MSM8953_VDDCX>,
> -					<&rpmpd MSM8953_VDDMX>,
> -					<&rpmpd MSM8953_VDDMD>;
> -			power-domain-names =3D "cx", "mx","mss";
> +					<&rpmpd MSM8953_VDDMX>;
> +			power-domain-names =3D "cx", "mx";

[Severity: High]
The old power domain is removed here, but the required replacement mss-supp=
ly
is not added to the mpss node. Since the driver is updated to expect this
regulator, won't devm_regulator_get() fall back to a dummy regulator?

This fallback would leave the physical S1 regulator unmanaged, which causes
the modem subsystem to fail to start because it receives no power, breaking
modem and audio functionality.

> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom=
_q6v5_mss.c
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
[ ... ]
> @@ -2728,6 +2728,14 @@ static const struct rproc_hexagon_res msm8953_mss =
=3D {
>  		},
>  		{}
>  	},
> +	.active_supply =3D (struct qcom_mss_reg_res[]) {
> +		{
> +			.supply =3D "mss",
> +			.uV =3D 1050000,
> +			.uA =3D 100000,
> +		},
> +		{}
> +	},

[Severity: High]
Does requiring the mss regulator here in msm8953_mss break devices if
mss-supply isn't provided in the device tree? As noted above, missing the
regulator in the DTSI causes a fallback to a dummy regulator, leaving the
modem unpowered.

[ ... ]
> @@ -2741,7 +2749,6 @@ static const struct rproc_hexagon_res msm8953_mss =
=3D {
>  	.proxy_pd_names =3D (char*[]) {
>  		"cx",
>  		"mx",
> -		"mss",
>  		NULL
>  	},

[Severity: High]
Does removing mss from proxy_pd_names in msm8953_mss break DT ABI? Booting a
new kernel with an old device tree will fail because the old DT relies on t=
he
mss power domain, which this driver now completely ignores.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260929-sdm632-rpm=
pd-v2-0-97ef8858161b@mainlining.org?part=3D3
