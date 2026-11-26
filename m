Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795671006;
	b=WfQXe7f5fDRwjYwVzWX1x/2g2GwXXx0qnTdwd9S30tSJCCJhGTJpYlY4Aa5lRe864gKf
	 GX59wovT/NAAjBLIaQePqJv97qeoB/js7tnQdwcjPYLtE11DJsSxISJygMT/7pjpS+snp
	 MiRDB5cM/JBWJuMCYKX5LHX1JROIUg6UPQxcH9kZ8fO4JirgadFHmYfs4fpfGBSOsd/Hu
	 52CpdNsLMVTC3XhAAHDBvH+ZYKjKbFvTlHz2zA+4GgqtxmPUHDSNKxMdPccKVD4rjodZO
	 PVQXRQY0VkPp9CZukvXbQGkSN5hvDjd7hN3w3iwe6o2iILSpV94z3MBcLMoBukEqOJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795671006;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=g/6Ii2xojLNGesuqpi9btBz1YpLiOHFVlcS0/WjLfYc=;
	b=raHPcitzy2zuFxgIxqGXFK+TLSlJLGmRWFlUUP/fMMOU4gRnXppcbIGcLe720hIBrXhZ
	 /v6dS01fZ4a4q2rWJVR7JtK8xevVaS/8w4QALmTxC+R+x18oeftOhR77zhpP9gg6fswiD
	 KQ95EZHOOIH3mhSOLA/n3YASGbEfJeayKSFQO5BYQLr6cXOPAND8LQVW+oCVczoMWAZTr
	 NFWmO44uuXsDEBgjeHEkB049mlSUi/GYQ6ND1+mbYcCX0g/JQAMA10gfFZ1CRXttBfQGo
	 nbi7zeSjlsP7oHoGeBs2GhU6sW7SPCVVubRaz/yAJee7h7CFQ9WYRn5pqdKOrz6rHQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ci038bZE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6083A606A31C
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 05:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ci038bZE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2B8B1F000C4;
	Thu, 26 Nov 2026 05:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795671006;
	bh=g/6Ii2xojLNGesuqpi9btBz1YpLiOHFVlcS0/WjLfYc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ci038bZEhJQz9PMWxKF8SzCRcwZVbs9hFozlN/hRTUVFpLiuDLUmkiipHviE8t28y
	 m2zo6BtxpsKIpgfhmMSQvz2GzYVL7TTPpAMDtChG7P39tKkshb2Sa6KUUgSOTiWuYk
	 G8GbRI+T+DF/mYTsM3i9Gn44qSwPXK5HMUYq108yUpw9qBzKF4PqOf3cbmZ22iQoB5
	 o1yqF0QS512JFUFfYSCUnjWnWfA5pY/aLPrMQGmnWpml9+46/I29LINfDPdBOaoF6f
	 f2wpvtQyKMcwViRmC4r55Tbr9TjSlrxYlywFj5Ig+Xzcs8YSP2e86UeOEiRBdMEd4O
	 OjN6YK/3ic5OA==
Message-ID: <sashiko-outbox-234789@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 2/2] arm64: dts: qcom: sm8750-lenovo-elden: add
 Lenovo Legion Y700 Gen4, a Qualcomm SM8750-based tablet
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qianhui Xu" <xiaqinghuan@mail.ustc.edu.cn>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261126052057.1544590-3-xiaqinghuan@mail.ustc.edu.cn>
References: <20261126052057.1544590-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261126052057.1544590-3-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 05:30:05 +0000
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
- [Medium] arm64: dts: qcom: missing willsemi,wl2868c binding schema in
  target tree
- [Medium] arm64: dts: qcom: missing core boot and power nodes in
  sm8750-lenovo-elden.dts
--

commit d9b5cd8f14c60fb013fdef6aa4211883343dd78a
Author: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>

arm64: dts: qcom: sm8750-lenovo-elden: add Lenovo Legion Y700 Gen4, a Qualc=
omm SM8750-based tablet

This commit adds the devicetree for the Lenovo Legion Y700 Gen4 tablet with
board clocks, reserved GPIO ranges, and a WL2868C camera PMIC on i2c10.

> diff --git a/arch/arm64/boot/dts/qcom/sm8750-lenovo-elden.dts b/arch/arm6=
4/boot/dts/qcom/sm8750-lenovo-elden.dts
> new file mode 100644
> index 0000000000000..5fb094dd7efc5
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm8750-lenovo-elden.dts
> @@ -0,0 +1,136 @@

[ ... ]

> +/ {
> +	model =3D "Lenovo Legion Y700 Gen4";
> +	compatible =3D "lenovo,elden", "qcom,sm8750";
> +	chassis-type =3D "tablet";

[ ... ]

> +	/*
> +	 * Always-on input rail of the camera PMIC: VSYS (control logic and
> +	 * I2C) and the four LDO inputs.  The SPMI PMICs that generate it are
> +	 * not described yet, so it is modelled as one fixed regulator without
> +	 * a voltage constraint, standing in for those rails; the board's
> +	 * actual input wiring is not documented in the sources this file
> +	 * derives from.
> +	 */
> +	wl2868c_vsys: regulator-vsys {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "wl2868c_vsys";
> +		regulator-always-on;
> +	};
> +};

[Severity: Medium]
Should this board devicetree include the core boot peripherals and system
power rails (such as chosen/stdout-path, SPMI PMICs, RPMh regulators under
apps_rsc, boot storage, or USB) rather than only describing an isolated
camera PMIC whose input supplies are stubbed to wl2868c_vsys and whose LDO
outputs have no consumers?  Because sm8750.dtsi leaves UARTs, storage, USB,
and display blocks disabled by default, this devicetree lacks the core
hardware description needed to boot or operate the board.

> +
> +&gpi_dma2 {
> +	status =3D "okay";
> +};
> +
> +&qupv3_2 {
> +	status =3D "okay";
> +};
> +
> +&i2c10 {
> +	status =3D "okay";
> +
> +	pmic@2f {
> +		compatible =3D "willsemi,wl2868c";
> +		reg =3D <0x2f>;
> +		reset-gpios =3D <&tlmm 126 GPIO_ACTIVE_LOW>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&camera_pmic_default>;
> +		vin12-supply =3D <&wl2868c_vsys>;
> +		vin34-supply =3D <&wl2868c_vsys>;
> +		vin5-supply =3D <&wl2868c_vsys>;
> +		vin7-supply =3D <&wl2868c_vsys>;
> +		vsys-supply =3D <&wl2868c_vsys>;

[Severity: Medium]
Is the binding schema for "willsemi,wl2868c" present in the target tree?
Documentation/devicetree/bindings/regulator/willsemi,wl2868c.yaml has not
landed on this branch yet, so checkpatch reports an undocumented DT string
and make dtbs_check fails schema validation on pmic@2f.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126052057.1544=
590-1-xiaqinghuan@mail.ustc.edu.cn?part=3D2
