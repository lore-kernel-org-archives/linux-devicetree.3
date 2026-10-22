Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792669974;
	b=BH2z8t+RhYzOiTyt5u11lVts2Pag+13nToo7BoqH4SDQy9k5Dh7MfF5zggIIg/kJ02Fg
	 645Qtmg6G7zKDfUB1jfRPE16QkYguVsG68zuv8rU+DEaX6SH5O4Z0x/elX957/x4Twtrz
	 MJcHED5Iu2r4EGHGrcwD1hk4OTh6xKy/zOgYi7Cshx5rFhNakmnm0H+wAeoblPjH2iL5A
	 ECUlCcXyav5T4KrzsehCEMj08oHlELejRLPRgld2qDcY22lqzGCLYWEyiPYUqmBPgiZsw
	 Ovg4v38quMIjfNDhplSbfgXab4NLEWH5LJOC3szq0FrA+GALsCV8fZnP3ZlFefVs7iQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792669974;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=IFvnuyMkF7FAUPmUQ7itrBFT/y602o/DWZ7AYGSYV60=;
	b=Mdfm6YIdbhTv6Kp9urxzjQCa9ithK0yBQqffIJCW2Le+E9pzVCfYy5vFPEcg13q9wh34
	 93oWDMug2/M7y1SwCY907TbGM4R8FQrCYfDjffmHO0LBIzFe9E8i7j5qv5kfe/6ZhL3aP
	 aVSZseABljEMLO/dM9Y53hap52kXEULgre3xZOAlrjL0grGonB+a18RueQABxroCjHnt2
	 yigLqWLsWg5CQmtOv021x2Av3zWjo717U4fL8ivpPn+el3wlAjsn7IzJLL1WZhO0DMga/
	 BL+2JCi9iIxQS/FVjn0v6rwKaSLuiO2N+NcMyQ0iVIQm8L8e/Is2ZteKJO7ximM9gzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PiIMszJg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0036A606A319
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 11:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PiIMszJg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 469981F000C1;
	Thu, 22 Oct 2026 11:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792669973;
	bh=IFvnuyMkF7FAUPmUQ7itrBFT/y602o/DWZ7AYGSYV60=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PiIMszJgz6Lh5Jy3XjQ4xCeKrgb0P4j/3f9mfMpcx7tifUGY8N4eVfGxeEUENo/d0
	 DgH22o5h3CXNnVZOsuSSshH4hWI1XdUdxPoC2N6Zlw6Z+7AvoARj4pZIAZPAMnVYr9
	 ZvCC8IfqZc1BigmEs8ZS6uKjhXpE7EHdjgIl5MUTzC75t77inNKeJZyo3ums0Z+QRN
	 YRKr4A0ZPbaYc61K/8xe/khSR0Moy2+gR9HhDTuMM8JeaCoMnS1T13mVaH8LIibRcP
	 hEcX6i7pfIMzT3YLu9eXaY8Z1YqBMEK1mGjxR9gfGTiHKiIa1ndqHXdkRjviZvv6jK
	 RJPnaSEqhw4UA==
Message-ID: <sashiko-outbox-181398@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/6] arm64: dts: qcom: sm8250-hdk: Add the QCA6390 NIC
Reply-To: sashiko-reviews@lists.linux.dev
To: "ShiTou Hong" <redstone.dcity@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261022113601.2320940-5-dc_redstone@outlook.com>
References: <20261022113601.2320940-1-dc_redstone@outlook.com>
 <20261022113601.2320940-5-dc_redstone@outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 11:52:52 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] arm64: dts: qcom: sm8250-hdk: vreg_3p3 added after pcie2 referen=
ces it
- [Low] arm64: dts: qcom: sm8250-hdk: tlmm pin state node names violate sch=
ema
--

commit b98ad1ad783f0dda0bddcfceb9a3d14617f06e2d
Author: redstonee <1516235445@qq.com>

arm64: dts: qcom: sm8250-hdk: Add the QCA6390 NIC

This patch adds device tree nodes for the qca6390 wireless and bluetooth
module on the sm8250-hdk board, including its pmu node, regulators, pinctrl
configuration, uart6 bluetooth node, and pcieport0 wifi node.

> diff --git a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts b/arch/arm64/boot/dt=
s/qcom/sm8250-hdk.dts
> index 77273b6c2216a..eb899c92fcfb7 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
> @@ -32,6 +32,13 @@ vph_pwr: vph-pwr-regulator {
>  		regulator-max-microvolt =3D <3700000>;
>  	};
> =20
> +	vreg_3p3: vreg-3p3-regulator {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vreg_3p3";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +	};

[Severity: Medium]
Should vreg_3p3 be defined in the preceding commit be0d22fcb00f ("arm64: dt=
s:
qcom: sm8250-hdk: Enable the PCIe ports") instead of this patch?

In commit be0d22fcb00f, &pcie2 in arch/arm64/boot/dts/qcom/sm8250-hdk.dts
references <&vreg_3p3>:

	&pcie2 {
		status =3D "okay";
		vddpe-3v3-supply =3D <&vreg_3p3>;
	};

Because vreg_3p3 is not defined until this commit (and is not consumed by a=
ny
of the qca6390 nodes on pcie0 or uart6), building sm8250-hdk.dtb at commit
be0d22fcb00f fails with a reference to a non-existent node or label
"vreg_3p3", breaking git bisect across the series.

[ ... ]

> @@ -450,6 +525,39 @@ rst-pins {
>  			output-high;
>  		};
>  	};
> +
> +	qca6390_pins: qca6390-pins {
> +		wlan-enable-pins {
> +			pins =3D "gpio20";
> +			function =3D "gpio";
> +			drive-strength =3D <16>;
> +			output-low;
> +			bias-pull-up;
> +		};
> +
> +		bt-enable-pins {
> +			pins =3D "gpio21";
> +			function =3D "gpio";
> +			drive-strength =3D <16>;
> +			output-low;
> +			bias-pull-up;
> +		};
> +	};
> +};

[Severity: Low]
Does the qca6390-pins node name under &tlmm conform to the binding schema in
Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml?

The binding specifies unevaluatedProperties: false and requires direct child
pin configuration nodes under &tlmm (which matches "qcom,sm8250-pinctrl") to
end with "-state", while "-pins" is only permitted for nested subnodes insi=
de
a "-state" node:

  patternProperties:
    "-state$":
      oneOf:
        - $ref: "#/$defs/qcom-sm8250-tlmm-state"
        - patternProperties:
            "-pins$":
              $ref: "#/$defs/qcom-sm8250-tlmm-state"
          additionalProperties: false

Because qca6390-pins (as well as sd-ufs-cd-pins and lt9611-pins added under
&tlmm earlier in the series) uses the "-pins" suffix directly under &tlmm,
running dtbs_check on sm8250-hdk.dtb fails schema validation. Should these
top-level pin state nodes under &tlmm use a "-state" suffix instead (for
example, qca6390-default-state)?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022113601.2320=
940-1-dc_redstone@outlook.com?part=3D5
