Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676874746C0
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 09:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932446; cv=none; b=teboo2HsaT+rLgjaPZI23dhgESTXLAInKEIEgcBMSyTEHDpk6oVJ65qPuCis6XXB047c5V+1e6cVkpbikzUMXiqZSovbSUgcHD3k71OJ3siyHEAwZ5KXKfixWUgCuFm4HahSBI43lGieU/BPbN29aZ0cBPfbqv01am9dUUlBooU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932446; c=relaxed/simple;
	bh=k/oq9bwrJyr+UaJzEVKocOuIHXbn1Q6EM4arnudYBdw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uC6oOmnbmmDpkSUHFxJjJc2bIia6v/pPjIi3TL65C6YNwXf+61BnElqmbxEjTNZql/eB58XYEL/1cZFk1fJvnl6uXlw+Tbs8g61GYmOQ3M5sy3ORlDJci2MyR+/hO4xodyxNLDWhtlr/rerp8HjLpyECMFOrmMp8ifaSRu/Kgto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kks97HtJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kks97HtJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E7F71F000FF;
	Fri,  2 Oct 2026 09:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790932445;
	bh=IDwvADygzO/piEfVq+mb2SqgH2VH5ZqDy7MquVbCfJQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kks97HtJgzuiWZrXve/jIcgSTsLgrRMJ2SUsNmPOAsafmaQAf61FpHdCIcNG1uS0P
	 zligexkElkvmKDRQCKFy8yVWVhrgYzGCv5IgOyHyAJicuKjmhkP6LcWAS0OssxvIIh
	 z4JqablViFCaG7WCoYQcnLaICacEkrGXww0WJDnIFYOtf5eqhtYxFQXnn7qvMrIt5/
	 btDqwWUAMhz0JAcyjBokYzmLqH0/AFAcnHU4Z8uPAChWhYFHTpLN2vGC4UktSJ2eTj
	 hSXVcEHMHW5+Tuk5TXNJnTNpUvl2OmcCtatiRhaAUXSc4yhunFeC5KqpnVKsxo/rlV
	 kiwnncBolYYvw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/7] remoteproc: qcom_q6v5_mss: Use mss as regulator
 for MSM8953
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261002-sdm632-rpmpd-v3-4-95c47d0f26cf@mainlining.org>
References: <20261002-sdm632-rpmpd-v3-0-95c47d0f26cf@mainlining.org>
 <20261002-sdm632-rpmpd-v3-4-95c47d0f26cf@mainlining.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 02 Oct 2026 09:14:04 +0000
Message-Id: <20261002091405.0E7F71F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] remoteproc: qcom_q6v5_mss: universal probe failure on MSM8953 due =
to missing mss-supply
--

commit 726993c6f2fb948fb92664f68a46c91f069ed760
Author: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <barnabas.czeman@mainlining.org>

remoteproc: qcom_q6v5_mss: Use mss as regulator for MSM8953

The commit modifies the MSM8953 MSS configuration to use an "mss" regulator
rather than a power domain. The device tree definition is updated to remove
the power domain, and the driver is updated to expect the new active supply.

> diff --git a/arch/arm64/boot/dts/qcom/msm8953.dtsi b/arch/arm64/boot/dts/=
qcom/msm8953.dtsi
> index 753167c3f8619..c7dc08858d542 100644
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
The old power domain is removed but the required mss-supply replacement to =
power
the MSS hardware is missing.

Is it expected that mss-supply is missing here?

Without mss-supply in the device tree, devm_regulator_get(dev, "mss") will
return either -ENODEV or a dummy regulator.

> =20
>  			clocks =3D <&gcc GCC_MSS_CFG_AHB_CLK>,
>  				 <&gcc GCC_MSS_Q6_BIMC_AXI_CLK>,

[ ... ]

> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom=
_q6v5_mss.c
> index 2f71ed2feff69..8f6312213e1ab 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
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

[Severity: High]
This makes the "mss" regulator mandatory and strictly requires a specific
voltage to be set.

Since a dummy regulator lacks voltage-setting operations, an unconditional =
call
to regulator_set_voltage() in q6v5_regulator_enable() will return -EINVAL,
causing the driver to unconditionally fail to probe:

drivers/remoteproc/qcom_q6v5_mss.c:q6v5_regulator_enable() {
    ...
			ret =3D regulator_set_voltage(regs[i].reg,
					regs[i].uV, INT_MAX);
			if (ret) {
    ...
}

Could this cause the modem driver to fail probing, making the modem unusable
on all MSM8953 devices (and SDM632 devices due to later patches in the seri=
es)?

> +		{}
> +	},

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261002-sdm632-rpm=
pd-v3-0-95c47d0f26cf@mainlining.org?part=3D4
