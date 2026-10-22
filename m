Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792681832;
	b=pr8UwykJ7foLFPweyi0wosPRv1q9mdw6hkIDV7vRvjxz5eSXhqM7vFWwKGKCd6sl8LvD
	 cjXQ6Izt8eGQuoRWFoPQrfRtnEAuxVfoNWrLbivluGM+pj0gWaN7tHjhazXhXz0IFW+nX
	 zTvlo8Y3Jq6vfh5+AVRTmK1Fvw94WL4S4yARiQGmyBmftv6KGAyaJ3bayikFhZjLkDeSa
	 pUq7p7qMuu2TFx6ceNRrwMi6+FKqpAm+xeY4Z7LrSv/tljmucs9lEwMpCSd0ObvqfyE8L
	 hddujaT6RBHlEwdI+BDzU6kaaOUMMqvwgq06OQyjwM/PsYxRyh3TCc9j95X2gW3ZqGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792681832;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=BbKKaBnUzyR70KT5j/1djhQAurTTYAWMqcXUiUN3WA4=;
	b=FMWXzuAHyp5NNOx2XdtBUMadtMBFezFhzb+tytQrQJ3hVOzZ7ScEacY54NASqt6znREG
	 YdAqlqXx3xkd/MfI5YeFv4GOEqEEAUSQLeLOOFsZm5qOV5GwvPKtJVadeuf87p8HHQJhA
	 7L2rvkb01CJRupvPSn3MB+Mu1avpV7gDpX7lgcAKup/1YdNzfe2jPOsoN4YKtJq9dg+15
	 CeOL24/PwmdeWfFPygMpH5xgvgRJOHddYXD93CQdvQdDCydpJ62FZ6gCGeOhomS1aprtN
	 YyMNLcIdcDApHHX9HcQpwOGQnwdW9ZDN23/dLT9ODXhxLc6v6I/MYHkjsIuelN4ly4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B7QQ54WG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B170260A3819
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 15:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B7QQ54WG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2576F1F01825;
	Thu, 22 Oct 2026 15:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792681831;
	bh=BbKKaBnUzyR70KT5j/1djhQAurTTYAWMqcXUiUN3WA4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=B7QQ54WGj0Sb9C4MazP+IgzXSvlCHlgqiPUH6ZhHinjE2S1aAywmLuapyOmiHbjzU
	 u3ZpdsWazEqKZf/nAEK21pF/oMdwvc31ErZAcSMNvsl6NCPXG4ZmPEe5aRkiWRDkGt
	 Rt6MQgRAawb7zT/XkJ9uJZ/FjMTRpog0d2lTcPIiSe2kT0HFGUVGl0eoSSbl5U7Ea1
	 K3d8fbV91vpDLPexjn/xRdM2hFLdVCpW7TzJ6CVN7DBukfT3JbcdodN/FftOTZ/UAE
	 PTbfHlE12spjurzZt+i94ZK6ZheU7nNUtK3KywE5BhwiDTzsZMlxQurQtLenhsE2H7
	 i/FuZIWujvZeg==
Message-ID: <sashiko-outbox-181672@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] arm64: dts: qcom: qcs6490-rb3gen2: Add WCD headset
 playback and record for qcs6490-rb3gen2 industrial mezzanine
Reply-To: sashiko-reviews@lists.linux.dev
To: "Karthik S" <karthik.s@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261022125503.1231758-1-karthik.s@oss.qualcomm.com>
References: <20261022125503.1231758-1-karthik.s@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 15:10:30 +0000
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
- [Low] arm64: dts: qcom: boolean jack-type properties assigned cell value =
in wcd9370
--

commit 4c6acbd6e2fd308db81fe487b2cf0a197f514d70
Author: Karthik S <karthik.s@oss.qualcomm.com>

arm64: dts: qcom: qcs6490-rb3gen2: Add WCD headset playback and record for =
qcs6490-rb3gen2 industrial mezzanine

This commit adds the WCD9370 audio codec node, SoundWire RX/TX nodes, and
sound card DAI links to enable headset playback and capture on the QCS6490
RB3Gen2 industrial mezzanine board.

Link: https://lore.kernel.org/all/eab2d0b8-a949-47d8-b953-fe34bd2fd869@kern=
el.org/ [v2]

> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanin=
e.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
> index e8780646ab19c..41f6c58bb17b0 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
> @@ -6,11 +6,35 @@
>  /dts-v1/;
>  /plugin/;
>  #include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/sound/qcom,q6afe.h>
>  #include <dt-bindings/clock/qcom,gcc-sc7280.h>
>  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
> =20
>  &{/} {
> =20
> +	wcd9370: audio-codec {
> +		compatible =3D "qcom,wcd9370-codec";
> +
> +		pinctrl-0 =3D <&wcd_default>;
> +		pinctrl-names =3D "default";
> +
> +		reset-gpios =3D <&tlmm 83 GPIO_ACTIVE_LOW>;
> +		vdd-buck-supply =3D <&vph_pwr>;
> +		vdd-rxtx-supply =3D <&vph_pwr>;
> +		vdd-px-supply =3D <&vph_pwr>;
> +		vdd-mic-bias-supply =3D <&vph_pwr>;
> +		qcom,micbias1-microvolt =3D <1800000>;
> +		qcom,micbias2-microvolt =3D <1800000>;
> +		qcom,micbias3-microvolt =3D <1800000>;
> +		qcom,micbias4-microvolt =3D <1800000>;
> +		qcom,hphl-jack-type-normally-closed =3D <1>;
> +		qcom,ground-jack-type-normally-closed =3D <1>;

[Severity: Low]
In the wcd9370 (audio-codec) node in
arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso,
qcom,hphl-jack-type-normally-closed and qcom,ground-jack-type-normally-clos=
ed
are assigned a <1> cell value.

In Documentation/devicetree/bindings/sound/qcom,wcd93xx-common.yaml
(referenced by Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml for
qcom,wcd9370-codec), both properties are defined as boolean:

  qcom,hphl-jack-type-normally-closed:
    description: Indicates that HPHL jack switch type is normally closed
    type: boolean

  qcom,ground-jack-type-normally-closed:
    description: Indicates that Headset Ground switch type is normally clos=
ed
    type: boolean

Similarly, wcd_dt_parse_mbhc_data() in sound/soc/codecs/wcd-mbhc-v2.c parses
them using of_property_read_bool().

Should these be declared as empty boolean properties without the <1> value =
so
that dtbs_check schema validation passes?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022125503.1231=
758-1-karthik.s@oss.qualcomm.com?part=3D1
