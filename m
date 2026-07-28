Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6A01EE7B7
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 00:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785198447; cv=none; b=DV/WsV0LlYQ3kzxhBT4mOCJ1D3esloHL2CoqbfYeZpA91+568ZaORulFT2rfGXDjVNQqQ5mr1oHYjmi627/D9GaAUO8IzywYRj2wHPqcZxyxplc6x5cwGNY0m2s0CN7d34r/C2Luic0SUotEAIsiHgaXFpdwrugKZJH2nO4Z8zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785198447; c=relaxed/simple;
	bh=m/arKcB0jGgQ4ivYjIp66ZsnHv1A8QfK13D+S7wl8Mg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eoaQbT26BgA/CKUMaEaUiGv3xGk4PJwpmpTlvE5zi8IY3QfIdqdGBqd6e51im4xskrxu0sy82z9ys+eH3bnm8WvJDedw6h6HFLYvDBFeOIpn/fH+lvbJedLviLpHru8sudF6NbmxHUhUFSRvhlgt8mWuFwxgcwzrXTQtbO5oxAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ys/8tbsE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ys/8tbsE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1CD91F000E9;
	Tue, 28 Jul 2026 00:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785198445;
	bh=iHU4dEMbydGVQarArbXaIBYSUhwOYR/ac9gsO8BNAKg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ys/8tbsEYJxx5OevzArOpLbhqehMsgl2POujlj8F6KW6J2xGKILizLIBj0io7Tp76
	 I+7slcZ8Q5fdABNdHSkOWgwiCQ/+6hO1ri2jc6vlBh7C9macrFPJ0WMlCusfDkOOEq
	 1+x+PWXWLqrwqYNw4MWvFU/d0T02ySoD02BC9eiuvO7b6zB4KrTCuhXAgCwiN/sa6D
	 t5kAj98v2fZ0OOp2TKtZumn6E2xSIdEl+PTbV6uQg+dluC27/l8OHMwM685AXDwBVb
	 uIY41WRvpo76CUy5CZZ7GDx0aODe0TjYnfReZiK40XL29klUSwOMn3koLr+UR/w1dc
	 jHIncMXPDvUdw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 4/6] arm64: dts: qcom: Add AYN Odin 2 Mini
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aaron Kling" <webgeek1234@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260727-ayn-qcs8550-v9-4-e3db456e10e5@gmail.com>
References: <20260727-ayn-qcs8550-v9-0-e3db456e10e5@gmail.com>
 <20260727-ayn-qcs8550-v9-4-e3db456e10e5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 00:27:25 +0000
Message-Id: <20260728002725.A1CD91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Unused fixed regulator `vdd_disp_2v8` will be forcefully disabled =
by the regulator core, disrupting bootloader continuous splash.
- [High] The `display_panel` (`panel@0`) node is missing the required `comp=
atible` property.
--

--- Patch [4]: [PATCH v9 4/6] arm64: dts: qcom: Add AYN Odin 2 Mini ---
commit 8dcee61439dddab941924480de9e3796fbbd1fce
Author: Teguh Sobirin <teguh@sobir.in>

arm64: dts: qcom: Add AYN Odin 2 Mini
   =20
The AYN Odin 2 Mini is a high-performance Android-based handheld gaming
console powered by the Qualcomm Snapdragon 8 Gen 2 processor featuring a
5-inch mini-led touchscreen.

> diff --git a/arch/arm64/boot/dts/qcom/qcs8550-ayntec-odin2mini.dts b/arch=
/arm64/boot/dts/qcom/qcs8550-ayntec-odin2mini.dts
> new file mode 100644
> index 0000000000000..cc894bdd0c902
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/qcs8550-ayntec-odin2mini.dts
> @@ -0,0 +1,44 @@
[ ... ]
> +&{/} {
> +	model =3D "AYN Odin 2 Mini";
> +	compatible =3D "ayntec,odin2mini", "qcom,qcs8550", "qcom,sm8550";
> +
> +	vdd_disp_2v8: vdd-disp-2v8-regulator {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vdd_disp_2v8";
> +
> +		regulator-min-microvolt =3D <2800000>;
> +		regulator-max-microvolt =3D <2800000>;
> +
> +		gpio =3D <&tlmm 142 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};

[Severity: High]
Since this regulator powers the display but isn't consumed by any device no=
de
like a panel or simple-framebuffer, will the kernel regulator core forceful=
ly
disable it as unused at the end of the initialization sequence?

Without regulator-always-on or regulator-boot-on, this might kill any
continuous splash screen left by the bootloader and leave the screen black.

> +};
[ ... ]
> +&spk_amp_l {
> +	firmware-name =3D "qcom/sm8550/ayntec/odin2mini/aw883xx_acf.bin";
> +};
> +
> +&spk_amp_r {
> +	firmware-name =3D "qcom/sm8550/ayntec/odin2mini/aw883xx_acf.bin";
> +};
> +

[Severity: High]
Should this board file override the display_panel node from
qcs8550-ayntec-common.dtsi to provide a compatible string?

The base dtsi defines the panel without one:

display_panel: panel@0 {
	reg =3D <0>;

	port {
		panel1_in: endpoint {
			remote-endpoint =3D <&mdss_dsi1_out>;
		};
	};
};

Without an override providing a compatible string, won't this result in a
dtbs_check validation error and prevent the kernel from matching a panel
driver?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727-ayn-qcs855=
0-v9-0-e3db456e10e5@gmail.com?part=3D4
