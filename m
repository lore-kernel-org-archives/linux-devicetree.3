Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794504640;
	b=EY/69lfyDfuQQ7xteR1C+6gzi9JoowXX0Yjrrwi5eLOacn61i1EaGF/RN4SjD7WRepa6
	 MaA3KR+honuWLtmEneDCtBREYa6BiRt/ctEIMJJV1liKk3YnLK+Ga87zjXKY1Taxac1no
	 +1ENIDzEwBJ6nl8BjVhy9futvw8wF6wrowIOr7c5vG5//BlnOaZGCDXkGUTHr/SwM+Vcj
	 yOwbuT3cRFeI4YxjBgsbWGZ2yys30PtWQtjwq95NCeim/BNqkJiRR1QXMPFVth0c6WCD3
	 3+wHhCpxO13qWI3fkDO+ftRApjBZJochMze0+x2xo/hJwDgAB29+QX4dW46g4aTm7zQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794504640;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=KVy+3ZZ8QvSe60to4XtI56EW3Atv9aRqdtX74NoycfI=;
	b=UfQ6LTdqvSWndMVYlsVYqpsA89xR5h6uf7BY5DjJm1Q2p0P5cuUFaRj3S/PP5NSJiMpS
	 skJqSyYxHnaHYr+rC/TuAXKLHqHzwZUrTylGD+wUrzFWim0lQI9aE9ByacZJluTaAXX6r
	 VLIj0vgzV6u/KEiWRGrZQoAPPqUf+D0OeeqH85Su5rPdEeIXCWtPj6Ro5YOyaC1uxjseo
	 WnB2bCBp0tR3r2bAzbNZAGcnaTCzMnQqU3L9exThpgy8W30XwgPpgXXRlGVRMG8KKjeDG
	 Sy8U/QJOC16bTm49lEu/BoUDIVK1lvmQL7M5pz2L42kTMbJjXn5BQRseWYJW/Eswctw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E+HsqnAt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2BC8606A332
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 17:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E+HsqnAt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 197121F000C4;
	Thu, 12 Nov 2026 17:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794504640;
	bh=KVy+3ZZ8QvSe60to4XtI56EW3Atv9aRqdtX74NoycfI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=E+HsqnAt4HJDdE+gvpDmovWqtlrxJ5tFBF4FADPLHlPpB71eAEPWbU1A+wpNz+2pB
	 XVm4d/gn1zn1D5xJknkXTTUrQgsUKP93ldZRSCS9bX3Jak8sow22rxjDqE3BlDfCT/
	 p86eCsjOigS7JoHptnK4/kVU69Y7BjLP4LRN43RM0FFxK9YWT+uhiq1w/3TwA/8HaU
	 WCpi8W58IwJTXWulOw2dg/Lcfteu87uIbhmEItM1tQP5fH7g+3wTBxMc9l51XFIxR1
	 wlxqLxy/xEGZs6c/fq+LbZ7MvYqd1OMk0/Nl2ms/0mQcbcCPNFVLW1kWoIuKz7MWsg
	 4qoX25dvulWdA==
Message-ID: <sashiko-outbox-211597@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/5] arm64: dts: qcom: pmi632: Add battery fuel gauge
 node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Val Packett" <val@packett.cool>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261112170841.2189322-6-val@packett.cool>
References: <20261112170841.2189322-1-val@packett.cool>
 <20261112170841.2189322-6-val@packett.cool>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 17:30:39 +0000
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
- [Low] arm64: dts: qcom: pmi632: fuel-gauge@4800 violates
  qcom,spmi-pmic.yaml schema
- [Low] arm64: dts: qcom: pmi632: missing io-channels in pmi632_qgauge
  node
--

commit 15ccef39df06d430c96a1c58092319c5e86db8a5
Author: Val Packett <val@packett.cool>

arm64: dts: qcom: pmi632: Add battery fuel gauge node

This commit adds devicetree nodes for the PMI632 qgauge battery fuel gauge
at 0x4800 and the SDAM region at 0xb100.

> diff --git a/arch/arm64/boot/dts/qcom/pmi632.dtsi b/arch/arm64/boot/dts/q=
com/pmi632.dtsi
> index 85cef103e00dc..f04d65fb7aabb 100644
> --- a/arch/arm64/boot/dts/qcom/pmi632.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pmi632.dtsi
> @@ -163,11 +163,44 @@ pmi632_adc_tm: adc-tm@3500 {
>  			status =3D "disabled";
>  		};
> =20
> +		pmi632_qgauge: fuel-gauge@4800 {
> +			compatible =3D "qcom,pmi632-qg";

[Severity: Low]
Does adding fuel-gauge@4800 under pmic@2 break dtbs_check against
Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml?

That schema matches "qcom,pmi632" and sets additionalProperties: false,
but its patternProperties do not list "^fuel-gauge@[0-9a-f]+$" referencing
/schemas/power/supply/qcom,qg.yaml#.

> +
> +			reg =3D <0x4800>;
> +
> +			interrupts =3D <0x2 0x48 0x0 IRQ_TYPE_EDGE_BOTH>,
> +				     <0x2 0x48 0x1 IRQ_TYPE_EDGE_BOTH>,
> +				     <0x2 0x48 0x2 IRQ_TYPE_EDGE_RISING>,
> +				     <0x2 0x48 0x3 IRQ_TYPE_EDGE_RISING>,
> +				     <0x2 0x48 0x4 IRQ_TYPE_EDGE_RISING>,
> +				     <0x2 0x48 0x5 IRQ_TYPE_EDGE_RISING>,
> +				     <0x2 0x48 0x6 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names =3D "batt-missing",
> +					  "vbat-low",
> +					  "vbat-empty",
> +					  "fifo-done",
> +					  "good-ocv",
> +					  "fsm-state-chg",
> +					  "event";
> +
> +			nvmem =3D <&pmi632_sdam_2>;
> +
> +			status =3D "disabled";
> +		};

[Severity: Low]
Should pmi632_qgauge also wire up io-channels =3D <&pmi632_adc
ADC5_BAT_THERM_100K_PU> and io-channel-names =3D "batt-therm" here?

Earlier in this series, commit "arm64: dts: qcom: pmi632: Add missing
bat_therm ADC channel" added channel@4a to pmi632_adc for the fuel gauge.
Without io-channels on pmi632_qgauge (or in every board DTS),
qcom_qg_probe() leaves qg->batt_therm NULL, causing temperature reads to
fail with -ENODEV, qg_get_capacity() to fall back to a hardcoded 25 C, and
qg_get_health() to skip temperature fault checks.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112170841.2189=
322-1-val@packett.cool?part=3D5
