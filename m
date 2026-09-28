Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1064503ED
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 06:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790578083; cv=none; b=HBGu3pZYAQEe6ILlFiCNrXBsIUTLehfmcJNAJKin2qx/DLj7EU/QE42bQYUGEOCzVFfTM6bvdqzhXxn/m/nayFO3m1KPdn8dPzCBImtOXeXAToppeaI0KZ7x9STCVPFEa6pzVwTOwQLNfLnLmVGB6asOQPJYlC9j+hKDg/4Iw74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790578083; c=relaxed/simple;
	bh=jd47xT8FwKWYDFtuEq0iz7uC6X5a57pJuZEG1n3PNRU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rEbtgFedfFmlm9AKnUhyc4nj6Vcs3S0fIyD2St6yUbqbRXfsBUdjKzSmeyabVu/qOplg2o/tK3+YP7EZh/JHbw9dZdfUft8R9eNwloganUcbOZo4N1Pc5CkPSgn8MVXDE0v5JjiH+moCrb+vJMijID4adEZaC+BhDQhOOePweug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aSQ4dcx+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aSQ4dcx+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3A261F00898;
	Mon, 28 Sep 2026 06:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790578081;
	bh=CnQ9L88PZZzdU0B30GjhZRivpZtM0eWsJdF6xMrEHAo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aSQ4dcx+MIGYoKP5Qvy8mUw+do5Ay8aXwlr72BmxspB5O9ZW+d32Ou1f2WsRjVgSC
	 RwGU7gHDL3Olj/pz2jP2vb1dKgRq8sd5D9qoEp+8B+hwx7/1uBnAhbI2LM0Nh+Yn9K
	 gHHpgX4edkVFVDhd1FtKEptWxk6jGlb9BkggKOTllbBjO7KTpMkrHwMK6x0bc606gg
	 +Bl8VnUSdqvbfOeL5lBaqgc9Ef4NoteO8w1t1DgwF+ucO2ZQb5IYKv20a7RcwDonVP
	 CZNtcpqxyhUL7QoT3FSj7jlQK/0D447Kl0j/byjRCMCnxCJWLxWxb6IYIuDu11s20w
	 2IGU8FD4GsXMA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: embedded-controller:
 qcom,hamoa-crd-ec: Add thermal sensors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Anvesh Jain P" <anvesh.p@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260928-ec_thermistor_support-v1-1-d9c1bae4cd0d@oss.qualcomm.com>
References: <20260928-ec_thermistor_support-v1-0-d9c1bae4cd0d@oss.qualcomm.com>
 <20260928-ec_thermistor_support-v1-1-d9c1bae4cd0d@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 06:48:01 +0000
Message-Id: <20260928064801.A3A261F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: qcom,hamoa-crd-ec: unconditional schema ref breaks =
dtbs_check
--

commit ee4c510364f0a8d45223544f87706874323cd5cb
Author: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date:   Mon Sep 28 06:36:37 2026 +0000

    dt-bindings: embedded-controller: qcom,hamoa-crd-ec: Add thermal sensors

This commit updates the Hamoa embedded controller bindings to act as a
thermal-sensor provider. It introduces a thermal-sensor schema reference an=
d=20
defines the #thermal-sensor-cells property.

> diff --git a/Documentation/devicetree/bindings/embedded-controller/qcom,h=
amoa-crd-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/qc=
om,hamoa-crd-ec.yaml
> index ac5a08f8f76df..13de6bed81297 100644
> --- a/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-cr=
d-ec.yaml
> +++ b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-cr=
d-ec.yaml
> @@ -15,6 +15,9 @@ description:
>    EC running on different MCU chips. The EC handles things like fan cont=
rol,
>    temperature sensors, access to EC internal state changes.
> =20
> +allOf:
> +  - $ref: /schemas/thermal/thermal-sensor.yaml#
> +

[Severity: Medium]
Will this unconditional reference break schema validation for existing devi=
ce=20
trees?=20

The thermal-sensor.yaml schema enforces the #thermal-sensor-cells property,=
=20
but existing in-tree device trees (arch/arm64/boot/dts/qcom/x1-crd.dtsi and=
=20
arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts) use the qcom,hamoa-crd-ec=20
compatible without specifying #thermal-sensor-cells:

	embedded-controller@76 {
		compatible =3D "qcom,hamoa-crd-ec";
		reg =3D <0x76>;

		interrupts-extended =3D <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;

Does this patch series need to add the property to those existing users, or=
=20
should the $ref be made conditional to preserve backwards compatibility?

>  properties:
>    compatible:
>      oneOf:
[ ... ]
> @@ -32,6 +35,14 @@ properties:
>    interrupts:
>      maxItems: 1
> =20
> +  "#thermal-sensor-cells":
> +    description:
> +      The EC exposes up to 7 onboard thermistors (indices 0-6). Which
> +      indices are physically populated on a given board is discovered at
> +      runtime from EC firmware capabilities; a board may reference any i=
ndex
> +      0-6.
> +    const: 1
> +
>  required:
>    - compatible
>    - reg

[Severity: Medium]
Should #thermal-sensor-cells be added to this explicit required list?=20

The subsystem guidelines state that when a variant compatible string adds=20
provider capabilities, the corresponding properties must appear in the requ=
ired=20
list with appropriate constraints.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928-ec_thermis=
tor_support-v1-0-d9c1bae4cd0d@oss.qualcomm.com?part=3D1
