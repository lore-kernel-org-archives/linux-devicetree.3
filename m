Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B845D3264F9
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 04:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790052244; cv=none; b=ZdGfmZYPqQLdpgAawmb0dMKp9SIke5e9OkCUrCIOZHVqjl1rJAJrnHS5XDzIwMsWLnXnbHAdogq9Fsj5xp1YYmnWjeJ3ZQzf5da8tBDrKFDBs4PM7FMC0hAEja5LnZ8iiMIlxRULMdd2ZiyJ0KuIdKjjHiPPqim4++K6ymB2Aqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790052244; c=relaxed/simple;
	bh=QmwLql8e0hJFoJ0ag3qNvg1c0U8YXCqWSB9GipfgVeQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mRPbBY5aLMd/z0nQ0ysar3PAf1Fd0VSo7T6/JFVga86HzqTMeAj9rqKVxFO03Ac8Hh8qKvKdPWc468szFEWmTOYCrthIqyquwGsoJx4lIY9h/PdpC1bEMh+vghF4n9LiJEqwXgVXz4bBqIkLMb44XwNg7It/5iDGS/0ACQ1uuD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cx+eyO/c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cx+eyO/c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02C321F000FF;
	Tue, 22 Sep 2026 04:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790052242;
	bh=xerYqUs9J2cDRKDRg062XkIiC4lXjkuA5t1sM1MW8lk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Cx+eyO/cvixsCD1i9BELHnmEYvhqZ2vqjABIs2JnE4I/PBxkJRY2ud/oJvwNC6xBA
	 ElaWsFIdmRSlB77LZk4biMQaTjBwjWdEPXmesr15GRLFrMgzjmLwI9eqUqLA0A0Har
	 QGrJ1AYX1ng1oEag8R97DENijw2QvYau/GzXDFE3PbkNjSLbQDRMB++AS2mDlyvpd6
	 XsRQz2X+YxjZsMjMevyHWssHDExBZ1n/fuwGBxiKPNlAR9l74MCFOQvs5TkpFUwim9
	 NPKAvnvGVDajQoCVkdvXWVNjNCsNYKrOLskV+8clxy4dfQEbOzwvLY5qY0JrASqd2j
	 ldh2fU/bG6bew==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 8/8] arm64: dts: renesas: r9a08g046: Enable TSU
Reply-To: sashiko-reviews@lists.linux.dev
To: "Biju Das" <biju.das.jz@bp.renesas.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, wsa+renesas@sang-engineering.com, conor+dt@kernel.org
In-Reply-To: <20260922042707.116378-9-biju.das.jz@bp.renesas.com>
References: <20260922042707.116378-1-biju.das.jz@bp.renesas.com>
 <20260922042707.116378-9-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 04:44:01 +0000
Message-Id: <20260922044402.02C321F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] arm64: dts: io-channels specifier uses software array index inst=
ead of hardware channel
--

commit e43366f80cfffd32ae026b33a6ad6c170b125e78
Author: Biju Das <biju.das.jz@bp.renesas.com>

arm64: dts: renesas: r9a08g046: Enable TSU

This commit adds cooling cells to CPU nodes and describes the ADC1 and
TSU nodes to establish a CPU thermal zone. It configures passive and
critical trip points along with cooling maps for thermal mitigation.

> diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot=
/dts/renesas/r9a08g046.dtsi
> index c63a857f0e5b0..a2f6718c0043a 100644
> --- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
[ ... ]
> @@ -270,6 +274,37 @@ scif5: serial@1004e000 {
>  			status =3D "disabled";
>  		};
> =20
> +		adc1: adc@108c0000 {
> +			compatible =3D "renesas,r9a08g046-adc1";
[ ... ]
> +			#io-channel-cells =3D <1>;
> +
> +			channel@8 {
> +				reg =3D <8>;
> +			};
> +		};
> +
> +		tsu: thermal@108d0000 {
> +			compatible =3D "renesas,r9a08g046-tsu";
> +			reg =3D <0 0x108d0000 0 0x10000>;
> +			clocks =3D <&cpg CPG_MOD R9A08G046_TSU_PCLK>;
> +			resets =3D <&cpg R9A08G046_TSU_PRESETN>;
> +			power-domains =3D <&cpg>;
> +			#thermal-sensor-cells =3D <0>;
> +			io-channels =3D <&adc1 0>;

[Severity: Medium]
Does this io-channels property correctly map to the hardware channel, or do=
es
it bake a Linux-specific software index into the device tree?

In the tsu node of arch/arm64/boot/dts/renesas/r9a08g046.dtsi, the ADC node
explicitly defines channel 8 (channel@8), but this property uses index 0.
This violates DT principles by encoding the driver's internal software array
index rather than the physical hardware channel ID.

Because the rzg2l_adc driver currently lacks a fwnode_xlate callback, it
falls back to __fwnode_iio_simple_xlate(). The driver populates
indio_dev->channels with the single active DT channel, so
indio_dev->num_channels is 1. If the DT correctly specified <&adc1 8>, the
fallback translator would fail since 8 >=3D 1.

Does bypassing this failure by using <&adc1 0> introduce a brittle dependen=
cy
on the subnode order that will silently break the TSU if other channels are
ever added?

> +			io-channel-names =3D "tsu";
> +		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260922042707.1163=
78-1-biju.das.jz@bp.renesas.com?part=3D8
