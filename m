Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794256449;
	b=YQ0zO6BdY96E/WkDjr26KD6ff/Ob9+dwwtKy7HXZjaDvHupxcEBnomg3i7waQ0anilts
	 vcZ/7/wpG2n/rcOGeMcAzsqTtgnEf1odveQWjZyJWGhuX/7Hunj50cQq+lLfX+QZhMbcF
	 rmau8SoF/kVv0Dc2P5nRfmTMOTStGpdx1K8nLFPAuIgFkC3dVnrHsOz58x1q77800t+0o
	 oHdDXzO6rUSxtkjLYVIG2VflR3QK3uep1NnZuviIzOQdyYsz/TPwMZuIW4x249DpqquJB
	 wwicx8O6aeeBfM5A1Gr9U/vy6dcfYAT0INUIKnULIjxgBr9qVcylnkQrM9xOq77T86Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794256449;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=fG3yYT7rnzHPEJaqiNRTqU06IgBMfEMH7dLzTlwiT1E=;
	b=VenYEjUHX/krRfvpsWdWKy7FPgfS1n/NSyoJbgNb6umGAtf+/lLbPQrb26nzkdMXtg6Z
	 F7zBfFf5on4LshiOVYUmzo9XGYHUdydzPGZUoIicxPOBk+nc0eLLoFRPtlgz+YknYKMil
	 /7mbphQL7gWI8FS1ehilJUGCFeC5i3HZ31uGtFFbGjwIVy6mVzq+pPZqDJA2hiqxUEGbl
	 HX7ScGd01bIq22d/1GFxzgVkHEwmrWsGT6UEyqPpzo7pYoaULCkMMQ1DhJ1Wd3VLQlZ8L
	 QUxhxhTlx3hoGUCnEvqMqGXqp0ylIkYL3N2GRLnK6i71SVpVvhr5ipPeTNWABvwv2Sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MdLuuQrz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F486606A332
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 20:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MdLuuQrz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 999961F0089F;
	Mon,  9 Nov 2026 20:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794256448;
	bh=fG3yYT7rnzHPEJaqiNRTqU06IgBMfEMH7dLzTlwiT1E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MdLuuQrzZG0UFN6j8zAnDVnriR4qeU+G/ZKG3JLOweKY78PIyCJdY1EQuLW3010tL
	 SwRQvx1lstOGIhW8Nhp1uU57cqeL6lRLF6V/CA6PY/lOspcKPl+S/fLNDeb5iy/8Mo
	 CxebXb+fryCFZHXIQqmgBWIemm7PqM8TyN4Q0IazpsY2yRL9sw43WPnzbNnXR/Crp8
	 SGdCFZYXY40E1Kfah3e6HLnq4uiYQTwckke1wbpTl6NMY6L1bgHLTqXd+dFTde3Njf
	 5dRjsf+IjsZTz/5ge1+I7EpfJvDn9245EXvcpb8vKEo9Q4PGX8WARteno8zSJ6ClPm
	 vY2Nag07RZD2g==
Message-ID: <sashiko-outbox-205586@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 7/9] arm64: dts: qcom: pm660l: add analog audio codec
Reply-To: sashiko-reviews@lists.linux.dev
To: "Richard Acayan" <mailingradian@gmail.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261107022453.159341-8-mailingradian@gmail.com>
References: <20261107022453.159341-1-mailingradian@gmail.com>
 <20261107022453.159341-8-mailingradian@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 20:34:08 +0000
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
- [Low] arm64: dts: qcom: pm660l: sound-name-prefix violates analog
  codec DT schema
--

commit 2cdb7e07dbee3037de67d0c38e09df937ce70258
Author: Richard Acayan <mailingradian@gmail.com>

arm64: dts: qcom: pm660l: add analog audio codec

This commit adds the analog audio codec node to the PM660L PMIC device tree.

> diff --git a/arch/arm64/boot/dts/qcom/pm660l.dtsi b/arch/arm64/boot/dts/q=
com/pm660l.dtsi
> index 3f8b9eafe1641..608c1c2120c96 100644
> --- a/arch/arm64/boot/dts/qcom/pm660l.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm660l.dtsi
> @@ -87,6 +87,43 @@ pm660l_wled: leds@d800 {
>  			status =3D "disabled";
>  		};
> =20
> +		pm660l_codec: audio-codec@f000 {
> +			compatible =3D "qcom,pm660l-wcd-analog-codec",
> +				     "qcom,pm8953-wcd-analog-codec";
> +			reg =3D <0xf000>;
> +			interrupts =3D <0x3 0xf0 0x0 IRQ_TYPE_EDGE_BOTH>,
> +				     <0x3 0xf0 0x1 IRQ_TYPE_EDGE_BOTH>,
> +				     <0x3 0xf0 0x2 IRQ_TYPE_EDGE_BOTH>,
> +				     <0x3 0xf0 0x3 IRQ_TYPE_EDGE_BOTH>,
> +				     <0x3 0xf0 0x4 IRQ_TYPE_EDGE_BOTH>,
> +				     <0x3 0xf0 0x5 IRQ_TYPE_EDGE_BOTH>,
> +				     <0x3 0xf0 0x6 IRQ_TYPE_EDGE_BOTH>,
> +				     <0x3 0xf0 0x7 IRQ_TYPE_EDGE_BOTH>,
> +				     <0x3 0xf1 0x0 IRQ_TYPE_EDGE_BOTH>,
> +				     <0x3 0xf1 0x1 IRQ_TYPE_EDGE_BOTH>,
> +				     <0x3 0xf1 0x2 IRQ_TYPE_EDGE_BOTH>,
> +				     <0x3 0xf1 0x3 IRQ_TYPE_EDGE_BOTH>,
> +				     <0x3 0xf1 0x4 IRQ_TYPE_EDGE_BOTH>,
> +				     <0x3 0xf1 0x5 IRQ_TYPE_EDGE_BOTH>;
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
> +			sound-name-prefix =3D "Analog";

[Severity: Low]
Does sound-name-prefix here cause a make dtbs_check failure for boards
including pm660l.dtsi?

Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml
sets additionalProperties: false without listing sound-name-prefix or
referencing dai-common.yaml#.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107022453.1593=
41-1-mailingradian@gmail.com?part=3D7
