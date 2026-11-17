Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794921899;
	b=JOl7DPMuKjWZuS6lXx8dFpuFuXKfN45OvexF2pbOH1RjPTjXnAVtb6cPQwt5ItbYJvkV
	 /i4qhvXCwJDVFMlhYif3OVpV22PzzdOUiHinXSHBTdC/w8eLuc7jWDMxLHP2rzhuvE9S/
	 ZXGBZfRea86jvRW39EC6kgRsIAKlrskn+6jDNgWfzxnY9zdgngxel8L5ie9HsT7HLs50H
	 cNnDOBfVK0U0Awhi9cno/vpAWuki48G7FtBNlD+imdySh3AkZMBDGFi00ZZ5CcOCu/+22
	 yEVFYkcr/NuYCgR7bD6uKNWVxei98lfJd5LErLbi5Xhksl7E1M6T8cDwvAL3yzDAKRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794921899;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=wigF95eIs4ur4ofMjkLG2BkFBY1MOD3SatOTNyyFJi0=;
	b=mBa5M3kMsjsjJ4JWjOLOvxUatFzGuxxhvorcWcKHynd/2AzfSZZPKA6IzZdMV6sgq4UU
	 MSrsTjn7YqPZW11JP5LuftM5G6LisT1sfJUHF61p/EwEpJDinYu3JTJTQkNEpBaF+F0aL
	 nbtaN+jh1adZsPgyUQ4hacskIgk9Iu/AZUyOH3Y7G1YFu8hXtwE7D1XXM8LpEEQK9kIzM
	 vztNb1pI7TUzpMB38oTfOgeuO12ab3dccB82cbj2ccmkjk0t094SK1MTbPfhuC6sX3Iey
	 8U+PO3V6Mai6InTwY3Oq7ZMgnoi5xm79hToS15qILD5vDhD01TAK47bx5FH79rrzLhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IL2SO+xY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35BA1606A31C
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 13:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IL2SO+xY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C56F81F000C5;
	Tue, 17 Nov 2026 13:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794921899;
	bh=wigF95eIs4ur4ofMjkLG2BkFBY1MOD3SatOTNyyFJi0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IL2SO+xYk5ElL9NwsbSRgSEtJ/3TuTOms24KZ3A5156BW6lMck8vl/ofJh1AiGZhc
	 6F66dqj3j9l1BXNk1Y34OZxmImhsMSA/Lm/Txu7cLPRgKnVd6+O0KkemMhA1yLhHFZ
	 ON35DIuJM1V689/rsNeznhNnFVvrx0Ia92fPRDg3wfR0HZ7gL/OZ/m7oGvOf48T2Jy
	 HdeTuUWQ+zZBX1GKnqBINHSpgZYjpMbYt5ThmCgvNen+B9FeCBvza1nHYV8qtaw7ic
	 /N+GQ7VLT3Dfftf07zbg3lgQKQN2bGk+CTK6GWkEs26JR9DPx9LIeXVVqB9s/c3r+h
	 8BEho0KJGgbLw==
Message-ID: <sashiko-outbox-218871@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: apple: Remove undocumented, unapproved
 aliases
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261117130616.234953-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261117130616.234953-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 13:24:58 +0000
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
- [High] arm64: dts: apple: removing aliases breaks atcphy_probe() and
  Z2 calibration
--

commit aa4c33e989489cbc224f3300ed3e06e23d8eea9a
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

arm64: dts: apple: Remove undocumented, unapproved aliases

This commit removes the atcphy0..atcphy7 and touchbar0 aliases from the
Apple M1 and M2 devicetrees.

[ ... ]

> diff --git a/arch/arm64/boot/dts/apple/t8103-j293.dts b/arch/arm64/boot/d=
ts/apple/t8103-j293.dts
> index 1d074b9e60183..779da65a66e31 100644
> --- a/arch/arm64/boot/dts/apple/t8103-j293.dts
> +++ b/arch/arm64/boot/dts/apple/t8103-j293.dts
> @@ -18,14 +18,6 @@ / {
>  	model =3D "Apple MacBook Pro (13-inch, M1, 2020)";
>  	chassis-type =3D "laptop";
> =20
> -	/*
> -	 * All of those are used by the bootloader to pass calibration
> -	 * blobs and other device-specific properties
> -	 */
> -	aliases {
> -		touchbar0 =3D &touchbar0;
> -	};
> -
>  	led-controller {
>  		compatible =3D "pwm-leds";
>  		led-0 {
> diff --git a/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi b/arch/arm64/boot/=
dts/apple/t8103-jxxx.dtsi
> index 686fb1dd215d2..5304a5591984d 100644
> --- a/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
> +++ b/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
> @@ -15,8 +15,6 @@ aliases {
>  		serial0 =3D &serial0;
>  		serial2 =3D &serial2;
>  		wifi0 =3D &wifi0;
> -		atcphy0 =3D &atcphy0;
> -		atcphy1 =3D &atcphy1;
>  	};
> =20
>  	chosen {

[Severity: High]
Does removing the atcphy and touchbar aliases across these devicetrees caus=
e a
regression in atcphy_probe() and Touch Bar digitizer calibration when booti=
ng
with the m1n1 bootloader?

As described in Documentation/devicetree/bindings/phy/apple,atcphy.yaml and
Documentation/devicetree/bindings/input/touchscreen/apple,z2-multitouch.yam=
l,
m1n1 resolves /aliases/atcphy0..atcphy7 and /aliases/touchbar0 to copy
per-device factory calibration data from Apple's ADT into the FDT at boot
(and on Ultra SoCs in t6002-j375d.dts, t6022-j475d.dts, and t6022-j180d.dts,
atcphy4..atcphy7 map flat ADT port indices onto the second die's
atcphy0_die1..atcphy3_die1 nodes).

Without the atcphy aliases, m1n1 does not populate the required
apple,tunable-* properties on the PHY nodes, so atcphy_probe() ->
atcphy_load_tunables() -> devm_apple_tunable_parse() fails with -ENOENT:

drivers/phy/apple/atc.c:atcphy_load_tunables() {
	...
		*tunables[i].tunable =3D devm_apple_tunable_parse(
			atcphy->dev, atcphy->np, tunables[i].dt_name, tunables[i].res);
		if (IS_ERR(*tunables[i].tunable)) {
			dev_err(atcphy->dev, "Failed to read tunable %s: %ld\n",
				tunables[i].dt_name, PTR_ERR(*tunables[i].tunable));
			return PTR_ERR(*tunables[i].tunable);
		}
}

Aborting atcphy_probe() before atcphy_probe_finalize() prevents registration
of the ATCPHY reset controller, Type-C mux, and USB/DP PHYs, which keeps all
integrated dwc3 USB Type-C controllers on M1 and M2 systems from probing.
Similarly, without touchbar0 in t8103-j293.dts and t8112-j493.dts, m1n1
cannot inject apple,z2-cal-blob, so apple_z2_build_cal_blob() returns NULL =
and
apple_z2_upload_firmware() boots the Touch Bar digitizer without its
factory calibration data.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117130616.2349=
53-2-krzysztof.kozlowski@oss.qualcomm.com?part=3D1
