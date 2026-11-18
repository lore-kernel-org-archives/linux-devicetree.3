Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795026882;
	b=0XTUe3OS6UN8Cr3Ix9QZ0G+OfohM/dPccdaGCO4tyRuN/2dD8yKhIlxLRLRPxoRLhUpB
	 94efUsQjEd313EMyWkke2rwyBJFmUbtlasxt5oKpzy3ii0Hcg7VLlpBPdaksBvGmOsRIM
	 SdMsapKOGyj8B8ljK+j+LVK5UoIm36ierpM3CyBSakwNyonVJy/vqXk3mBF1PiZ8N1WDG
	 TIIBkE4w23vx3yAUijtrcqn3slsjg1HFDT+Bn1hqMZzTJ0cUoRCEq9pel62etGP8ToT8i
	 HWsEm24QW+OjxcpoWJ9TaFTj69/oevjjf74/0bIob822pUdlOzD4+SIkxOg8/hO19uA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795026882;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Jz3sAsIlh3Oa3HY30/U5TQCVjrJ4KmuhR1ocaieH2HA=;
	b=DmX8exQ7TtY64Cce8C+8dyoFGxsBxDiqLRoO7986025M8mwiFscQbj+o7zPJyxSp5EWr
	 VmEgW7S/pjxsucLxni4lbWJ42hoWWL65jEtdykEfqnSo/0cSbs3QqCowbayHJyBnTZJAF
	 iJXgiYxBQeguPHZwfrJktiQiDh9CIwi52RtGWqzMcB6mqsEcDU6HlIkeoRf9oW5+F0Gqy
	 E2b1V7ngfahSKpySvPuLpoADIOMV+R68dlXro+8mBLkN8AvTLx/MXm8yNXsI+mJbqKVZI
	 MLttfr2DgEqmbAt5XUMwKcdJ/HIeZNTZf4h/h0l+cGzYu8vjg86tzKnu56VOL7It8bQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fGjj49Mt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E312606A31C
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 18:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fGjj49Mt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB4BA1F000C4;
	Wed, 18 Nov 2026 18:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795026882;
	bh=Jz3sAsIlh3Oa3HY30/U5TQCVjrJ4KmuhR1ocaieH2HA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fGjj49MtEUd0M5SryPJEdP11MZ/2w+hh0fo5TMi8nPKKq0oLCkKuApC0yFZqj2+v7
	 OWvoR9R1CZvKvSp1/Qzv/rbNNh94qHap904lbTJQbJ75/y8Bjd8CYtoLIjfau8kTKW
	 9VPkIifDIbz5qYt5jTu4mM8gmPBQVrgw/tIi1fbV2job63Rs8UO4expuItOpib4pyG
	 CaHsty62pKy6FO1+TdNgQkhDdodSMIErhaZGNpGzJpZ3gr7kZhtfX5BE/7VR+c8yRc
	 W0e5vkEWrWJ+jJA3KEG3veptFZ+RAk6VxsVKtjM194lNNbfPYSRsyRoR8VNpHI6xzE
	 nLfVqIlpsQKOA==
Message-ID: <sashiko-outbox-221771@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: glymur-crd: Enable pull-up bias for
 lid sensor
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pankaj Patil" <pankaj.patil@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261118-lid_pull_up_fix-v1-1-4bb84dc70067@oss.qualcomm.com>
References: <20261118-lid_pull_up_fix-v1-1-4bb84dc70067@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 18:34:41 +0000
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
- [Medium] arm64: dts: qcom: glymur-crd: TLMM bias-pull-up contradicts
  external pull-up
--

commit 33a3a23eacc897dad84afcf17e419a24de929c16
Author: Pankaj Patil <pankaj.patil@oss.qualcomm.com>

arm64: dts: qcom: glymur-crd: Enable pull-up bias for lid sensor

This commit replaces bias-disable with bias-pull-up on gpio92 in the
hall-int-n-state pinctrl node for the lid Hall-effect sensor on Glymur
CRD.

> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/d=
ts/qcom/glymur-crd.dtsi
> index 3a9cd5f3ec2b8..74588f4f7a86e 100644
> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> @@ -819,7 +819,7 @@ edp_reg_en: edp-reg-en-state {
>  	hall_int_n_default: hall-int-n-state {
>  		pins =3D "gpio92";
>  		function =3D "gpio";
> -		bias-disable;
> +		bias-pull-up;
>  	};

[Severity: Medium]
Should hall_int_n_default enable bias-pull-up if the board already has
an external 10k ohm pull-up resistor?

In msm_config_group_set(), bias-pull-up enables the SoC's internal TLMM
pull-up resistor rather than describing an external board resistor.  If
an external 10k ohm pull-up is populated on gpio92, enabling the
internal pull-up in parallel draws extra leakage current whenever the
lid is closed and switch-lid (GPIO_ACTIVE_LOW) is held low; if the
external resistor is unpopulated and the internal pull-up is needed, the
commit message says the opposite.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118-lid_pull_u=
p_fix-v1-1-4bb84dc70067@oss.qualcomm.com?part=3D1
