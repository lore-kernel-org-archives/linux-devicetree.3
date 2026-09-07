Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFDC451121A
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 16:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788797207; cv=none; b=uf7GqHdmZ3/Kgzqi3Q3D7ccA3uFDDUAwSVNaFfGLP5nTJg5nq6bpPsr+mRO5Ih0F+RxYNIB3k8RWXPx/aEgLGOwIM3px8GFvgJ0pJKywr1ZyxUvxt4od+tg4upA5KR0Bg2kq5/2/OIMkSHuRLMRsj9FsAAfuA9kDGOfNqnTG9ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788797207; c=relaxed/simple;
	bh=GePYJxQwiRpIcy5KxoxnPSVS6H/58cjIgEtw0aL9Nmk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NCiuPokSqcq3fYSpK25BDHUzE8i4d3e+o7HBObPLSCJAHHEOoAMFevnf9f6agafn3gTY+6Exhln/N5E43//zX7YBWfkZ2iO362yuuq+e6Ayf3Z/76OH8JHXJjo0PmjCH48PEunNhEI/l1yoZ9H+4fa+pN+DoXn8dzI3GkupRg+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eGUvjC9F; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eGUvjC9F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 655A61F00A3A;
	Mon,  7 Sep 2026 16:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788797204;
	bh=5pkln3P5sqcYExyNruecsxtL7LPYV7F1m2j20O1+tME=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eGUvjC9FQtVqyue5QBAd3+qDdgNj8tRHcT3Uqzl01QYzvIkzMu70kRwhgp2j+t6z+
	 KW4ejeW0Sp9so4t7QplS9Bao0uyyAy5GSYAGHjge9/f9iIj+15tg8ZOmjTZIIyM+Ko
	 wO4DGuHr7enISX/YGIwhevDI3bHnehCC8y7wSwDnPrIwBVQJJGjfxEPwnLMjKFEswt
	 LoiPhWYTzfzR3NCvu2Rhwjjgnwb4nPMrLlCwp80QOhU4emaVTymAnyb2zf+D0/6Vw+
	 JE6inCxdYlEavub8OgGLVEE0QXivftq8PR1dfw+M9h+KZ8g7+4GMLdNop0Jiqzqz5y
	 4KEPcPR9RPB8Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-sony: Add battery properties
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shujath Mohd" <shujath@outlook.in>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <PUZPR01MB51411878AC2B70673F77ED38C3B22@PUZPR01MB5141.apcprd01.prod.exchangelabs.com>
References: <PUZPR01MB51411878AC2B70673F77ED38C3B22@PUZPR01MB5141.apcprd01.prod.exchangelabs.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 16:06:43 +0000
Message-Id: <20260907160644.655A61F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The newly added `simple-battery` nodes are orphaned and will be =
ignored by the power supply framework because no charger or fuel gauge refe=
rences them.
--

commit b9560b36965d2ab30a517952de24fe50774a59c5
Author: Shujath Mohd <shujath@outlook.in>

arm64: dts: qcom: sdm845-sony: Add battery properties

This commit adds simple-battery nodes for the Xperia XZ2, XZ2 Compact,
and XZ3 device trees to specify design capacity and voltage limits.

> diff --git a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akari.dts b=
/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akari.dts
> index 6e65909ab582e..16e676ac96304 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akari.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akari.dts
> @@ -10,6 +10,13 @@
>  / {
>  	model =3D "Sony Xperia XZ2";
>  	compatible =3D "sony,akari-row", "qcom,sdm845";
> +
> +	battery: battery {
> +		compatible =3D "simple-battery";
> +		charge-full-design-microamp-hours =3D <3180000>;

[Severity: Medium]
Are these newly added battery nodes orphaned?

During initialization, the power_supply subsystem relies on
power_supply_get_battery_info() to parse battery information. This function
explicitly searches for a monitored-battery =3D <&battery>; phandle in the
consumer node (such as a PMIC charger or fuel gauge).

Since there is no device tree node referencing this battery label, the
parsing is skipped entirely and the power supply drivers will fall back to
hardware defaults.

> +		voltage-min-design-microvolt =3D <3400000>;
> +		voltage-max-design-microvolt =3D <4245000>;
> +	};
>  };
> =20
>  &panel {

[ ... ]

> diff --git a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akatsuki.dt=
s b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akatsuki.dts
> index 82e59e4533549..3bf9db9632991 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akatsuki.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akatsuki.dts
> @@ -26,6 +26,13 @@ ts_vddio_supply: ts-vddio-regulator {
>  		enable-active-high;
>  		regulator-boot-on;
>  	};
> +
> +	battery: battery {
> +		compatible =3D "simple-battery";
> +		charge-full-design-microamp-hours =3D <3330000>;

[Severity: Medium]
As with the akari device tree, does this node also lack the required
monitored-battery phandle linkage from a charger or fuel gauge node?

> +		voltage-min-design-microvolt =3D <3400000>;
> +		voltage-max-design-microvolt =3D <4245000>;
> +	};
>  };
> =20
>  &ibb {

[ ... ]

> diff --git a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-apollo.dts =
b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-apollo.dts
> index dc15ab1a27165..013987184b398 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-apollo.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-apollo.dts
> @@ -10,6 +10,13 @@
>  / {
>  	model =3D "Sony Xperia XZ2 Compact";
>  	compatible =3D "sony,apollo-row", "qcom,sdm845";
> +
> +	battery: battery {
> +		compatible =3D "simple-battery";
> +		charge-full-design-microamp-hours =3D <2870000>;

[Severity: Medium]
Will this battery node also be ignored by the power supply framework due
to the missing consumer phandle?

> +		voltage-min-design-microvolt =3D <3400000>;
> +		voltage-max-design-microvolt =3D <4245000>;
> +	};
>  };

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/PUZPR01MB51411878AC=
2B70673F77ED38C3B22@PUZPR01MB5141.apcprd01.prod.exchangelabs.com?part=3D1
