Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795790869;
	b=iqcM5awJp+3XRbChwQy7v9H2MiDsIg5Qr3bEPlvcAbxHWw5Q1aLCA2kZWHDxlyTg1Mbz
	 kkIEER8fwftcvdY51xVxXPBgSdT+A/+6ZaRN5tmOIE9VMiuQ6Ib91Y1+teGwTe2dUltAx
	 yg5scB9ZJcTjtPNPowP+ps/bDZ4WGkFHPeJCfQWXEYleLokJnIMjysuoufIgbYP12pff4
	 VBCmPtbwjaxJwKOYed9Rq4gXpb1mkLX23oM0zll/Hy+s84RBVaa5u7rIEt+ubGfhTJiYI
	 QdyCxw8mb8Bt4MZracOVfmP/YEsuGPGfByQwT7cCZgM84M4m/gP8dhCI7ghzNNHD6Hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795790869;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=kVWN6DLIdyA2zWR6C0Ag5ad0S/pVTSuKICW0i+BhA1E=;
	b=oLh4NpHYHnQnCCxlLTdBB8PO2cfRJuwgiYYxCHo4lsN7o+jR76v3yJg0UL9BZt94kpho
	 YwSeJUf7kwXMG9k9dNEOseuEk5k+U7NJBsRrGJZAXHYO1vhLoFFFn6nBi2MYm72bnXgBR
	 DNVmHI5aoI1nvFLHTGXkC47mBoBlZ2UIXM6XKeM3t2OqASDpPHYBD+mocUM6ZKxqu5AzZ
	 fKlv9bhlozAhiPmc+9VEXj9izEanzqoiZjD8B+N5fqh82u78NJKeqj6hILo8Y4TUg53pb
	 8FRKGPsB+6daKvMIiOgdaBHctg/lBk6OT5tffQZEiqTNT3+PJ+bdp7gEFGewGC6q/YA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tg2AGJ+3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74BEF606A31C
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 14:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tg2AGJ+3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A61E1F000C1;
	Fri, 27 Nov 2026 14:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795790868;
	bh=kVWN6DLIdyA2zWR6C0Ag5ad0S/pVTSuKICW0i+BhA1E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Tg2AGJ+3Cc6e6zZ2VwbgSsWvliRx4kiESCPsXWIEt3TcCE9ohEevA9Ik1jI2BTpID
	 I8csRc8av4hFdDhejWU/Rk7dYY5KllIUhWlTwe9zScS4ALCEeuj1tlxJecMJtFyjwj
	 nFK2GwHuWm7U4vZxttWsZpOr9A/SbEQwlf8fQRzX8CSJ693LRi9c+b9qyLM4O9Gh50
	 zJGf1z1zFFE90lm87QFH74u1q/3BSLq7Fh2VqOgPdHdtCCvCsPzM3BySAyGBGp+aKj
	 K2fHkKUK30SfSnTA491a2CMqwknmqtSDdSnwtYdNZkQj/dwSMz3cO+QHEQDbV9ki+C
	 UYX+1B5hZtYDQ==
Message-ID: <sashiko-outbox-237603@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 02/10] arm64: dts: qcom: x1e80100: Add CAMSS block
 definition
Reply-To: sashiko-reviews@lists.linux.dev
To: bod@kernel.org
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261127-x1e-camss-csi2-phy-dtsi-v8-2-2793b8e5138c@kernel.org>
References: <20261127-x1e-camss-csi2-phy-dtsi-v8-0-2793b8e5138c@kernel.org>
 <20261127-x1e-camss-csi2-phy-dtsi-v8-2-2793b8e5138c@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 14:47:47 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] arm64: dts: qcom: hamoa: csiphy4 uses RPMHPD_MXC instead of
  RPMHPD_MX
- [Low] arm64: dts: qcom: hamoa: inaccurate CSID count and omitted PHYs
  in changelog
--

commit 0488d17a00da346f23c2629cba6cdfe682bc1eba
Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

> arm64: dts: qcom: x1e80100: Add CAMSS block definition
>
> Add dtsi to describe the x1e80100 CAMSS block
>
> 4 x CSIPHY
> 3 x TPG
> 2 x CSID
> 2 x CSID Lite
> 2 x IFE
> 2 x IFE Lite
>
> Tested-by: Lloyd Hazlett <lloyd.hazlett@gmail.com>
> Tested-by: Liviu Nicoara <lnicoara@thinkoid.org> # Dell XPS 13 9345
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

[Severity: Low]
The commit message lists 2 x CSID, whereas the camss node defines 3 full
CSID blocks (csid0, csid1, csid2) alongside the 2 CSID Lite blocks.  It
also omits the four standalone qcom,x1e80100-csi2-phy nodes and their OPP
tables added by this patch.

> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qc=
om/hamoa.dtsi
> index 08ec53d01b802..32a273320cf58 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi

[ ... ]

> @@ -5626,6 +5670,332 @@ cci1_i2c1: i2c-bus@1 {

[ ... ]

> +		csiphy4: phy@acec000 {
> +			compatible =3D "qcom,x1e80100-csi2-phy";
> +			reg =3D <0 0x0acec000 0 0x2000>;
> +
> +			clocks =3D <&camcc CAM_CC_CSIPHY4_CLK>,
> +				 <&camcc CAM_CC_CSI4PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CORE_AHB_CLK>;
> +			clock-names =3D "core",
> +				      "timer",
> +				      "ahb";
> +
> +			operating-points-v2 =3D <&csiphy_mxa_opp_table>;
> +
> +			interrupts =3D <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>;
> +
> +			power-domains =3D <&camcc CAM_CC_TITAN_TOP_GDSC>,
> +					<&rpmhpd RPMHPD_MMCX>,
> +					<&rpmhpd RPMHPD_MXC>;
> +			power-domain-names =3D "top",
> +					     "mmcx",
> +					     "mx";

[Severity: Medium]
Should the third power-domains entry on csiphy4 be <&rpmhpd RPMHPD_MX>
instead of <&rpmhpd RPMHPD_MXC>?

csiphy4 uses csiphy_mxa_opp_table for the MXA domain, so with RPMHPD_MXC
here phy_qcom_mipi_csi2_set_clock_rates() applies the MXA performance state
votes to RPMHPD_MXC while leaving the MXA rail (RPMHPD_MX) unattached and
unvoted.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127-x1e-camss-=
csi2-phy-dtsi-v8-0-2793b8e5138c@kernel.org?part=3D2
