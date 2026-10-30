Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793356865;
	b=gN5zKDgVnYeWdq3k+L4sT5ijCTYy5hz7COZI96eh3pctqsUehlq+bD3/zwjFn04Egcex
	 MGeagqlPK5/Tbwu/fiN8nwcWvxlS9YH3LrMnZD2LKvP2vRE+TbBCj/g/qK99ICkZSDTIC
	 B9CnjWsV8XB5lJfF9mqS/x7N1Iv2x9gor1wd2SzR/nDv8yXxpLB9oEymj57xyZlf2VlmF
	 fkslybwfV4YLJ5zLspqexRHNu3RvdnFn8nE9/nbTm4evkfufwS3YsIQOJVVov8XVzzoNk
	 wj8XwooxZuqAXyqMsF2mpphvKNestVs1heUCt/lK3IIu9qF0m6NcpiovyEhz7LQhW4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793356865;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=k64lXhAs5/NdJYPoyGNyp6IFC36eZ++UDWd87CvvHv4=;
	b=G9L06VtCsif2vPZZWOde6DPkJbs/8Hmp+AO7iAbJihOr9FQ3HOIDK+T0c7Xe6S772I7c
	 Ef02sRFah3RiG6K4xesl9GWbJBMiEclyp3D/GRt7JiJuebZWV5V57mCwbtdPqzL8JN3ZP
	 OKeLRKTwnMiAFvWV98/HHMDadh5IS+Nlcki3ymkKOldR/jpP0sMy714UNBUx4DpJO/M56
	 o5QesWbcbkNmgKBfRexjUVw2+45cC13gkrLUxWvTs9+ecPyztH5amH9BopyKIWorq46Bt
	 T9bQJXyKQZFKVXokbmBmwI/APEizi0d9rb55c2IG60mIEqpf7sktOA3V9f5PdtZIsVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AFn97pYn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0F8606A330
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 10:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AFn97pYn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFBD61F00A17;
	Fri, 30 Oct 2026 10:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793356865;
	bh=k64lXhAs5/NdJYPoyGNyp6IFC36eZ++UDWd87CvvHv4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AFn97pYnWCmdTWjEQN8Yi7V4MpMyHpAVHqFQMYRf6kjrkgq+VF60LBdpHr0IRR9fs
	 VE+OfUMwikx8xgoCfNkrJ5qYSjDn9rNQiIaQdnZoLAOa/zxmIK6rl9Hn4FCq57nnfX
	 pFEPB9VldMfOFCQY7cZRGWkrlrAcWl5AnDrZIqTxZQLAE//u89m61a8wIs2ZDjozpH
	 BXpzQUDG1+hEt49YqpbcHWoumCzjX3hOsiXbGtGZA+FsnxYVu++IDthFgc9g0Vf73e
	 pedAj9XWYYynmadjnZZPp5M9nLu+9R4O5WbKDVyqTi1LVwJg18CkrCoerAixZGCR64
	 NXli46OrKpY8A==
Message-ID: <sashiko-outbox-190860@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] arm64: dts: mediatek: mt8192-asurada: Add
 ramp-delay for MT6315 regulators
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chen-Yu Tsai" <wenst@chromium.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261030103418.2355854-1-wenst@chromium.org>
References: <20261030103418.2355854-1-wenst@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 10:41:04 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] arm64: dts: mediatek: swapped regulator-ramp-delay for Vbcpu and V=
lcpu
--

commit 810dcac6146b830cb56f853c88e0887dc012ef9d
Author: Chen-Yu Tsai <wenst@chromium.org>

arm64: dts: mediatek: mt8192-asurada: Add ramp-delay for MT6315 regulators

This commit adds regulator-ramp-delay properties for the MT6315 buck
regulators (Vbcpu, Vlcpu, and Vgpu) on Asurada to ensure voltage increases
settle before switching CPU or GPU to higher operating points.

> diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm6=
4/boot/dts/mediatek/mt8192-asurada.dtsi
> index 40d34b16dc807..68d84fc55767b 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
> @@ -1500,6 +1500,7 @@ mt6315_6_vbuck1: vbuck1 {
>  				regulator-min-microvolt =3D <400000>;
>  				regulator-max-microvolt =3D <1193750>;
>  				regulator-enable-ramp-delay =3D <256>;
> +				regulator-ramp-delay =3D <4500>;
>  				regulator-allowed-modes =3D <0 1 2>;
>  				regulator-always-on;
>  			};
> @@ -1509,6 +1510,7 @@ mt6315_6_vbuck3: vbuck3 {
>  				regulator-min-microvolt =3D <400000>;
>  				regulator-max-microvolt =3D <1193750>;
>  				regulator-enable-ramp-delay =3D <256>;
> +				regulator-ramp-delay =3D <8000>;

[Severity: High]
Are the regulator-ramp-delay values for mt6315_6_vbuck1 and mt6315_6_vbuck3
swapped here?

The commit message states that the slew rates are 8000 uV/us for Vbcpu, and
4500 uV/us for Vlcpu and Vgpu. However, in mt8192-asurada.dtsi,
mt6315_6_vbuck1 is Vbcpu and mt6315_6_vbuck3 is Vlcpu:

	mt6315_6_vbuck1: vbuck1 {
		regulator-name =3D "Vbcpu";
		...
		regulator-ramp-delay =3D <4500>;
		...
	};

	mt6315_6_vbuck3: vbuck3 {
		regulator-name =3D "Vlcpu";
		...
		regulator-ramp-delay =3D <8000>;
		...
	};

Because mt6315_volt_range_ops does not implement .set_ramp_delay,
_regulator_set_voltage_time() uses constraints->ramp_delay directly to
compute the settling wait time during cpufreq DVFS transitions. Assigning
8000 to Vlcpu when its hardware slew rate is 4500 uV/us causes the regulator
core to wait for less than the required voltage ramp time before scaling the
little CPU cluster frequency up, while waiting longer than needed on Vbcpu.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030103418.2355=
854-1-wenst@chromium.org?part=3D1
