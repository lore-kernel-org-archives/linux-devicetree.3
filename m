Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11307370AD5
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784887893; cv=none; b=Zdz3T+/y8t0FrOyo6YorVFsNakuyLEoMxZvz4AIyhKxaipy8lvLE+dAhiVARZ1ppw17f5dq6+ETpPbmB+F6rKhxxT/w8TMMJWUBlqeejvFvBRF7ArZeQj1MDYA9eRSntDJUsA+isC9nEHkLy/JNQXeL3Cb1Y4/Her0nr5x1+Xxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784887893; c=relaxed/simple;
	bh=7shkwiNkPV+/4wb0T6DGy9mwUepKOiBITXuNArTa6hI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=E9syg1NrlJ1nq3EHh13FwN1gsDuWCc2/Bm3ho9FBCrGWj9NFCbwzlLqe1VA2axU90+5y8tHv0Dnokmj0apQSG0O2cKMRci1OrwPXtLrTAA5s3TLtCUDpsN32x77SAV99dOk7mZ67okLwU9j/+3UwEEs0TO328ZyCnfvqFrRqFKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ojdBA6c1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ojdBA6c1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62DA51F00A3A;
	Fri, 24 Jul 2026 10:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784887891;
	bh=YRS8JSseWHPnt6e57YxMU1LN0mCqoGEeQrnV3ObcQLo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ojdBA6c1Y7GGv1JwZH+sMTVO04lJpuMuXWOrZD5e8PwVAnbpdf8Wyc8wALoM7MCc8
	 LgXig0BfhOWunyQceHmjFDIZhbP3b1q1xzfRo99d3/STQzeMWelfeZkOWSFsLQTYtx
	 tECXfHhrGLytOSPalMptSM55ghj8LYnwTd24YNFSrMs/YGdjWd8gR4gahaDiAA5u21
	 CBXEFOUxELAuyOmqoH4Fls6RYjtcslObxNkLUmtoL5eNZY4ANRurd+a2dCvtp4cSzl
	 7fAM/nnkYWuIXwyV99/VuK8+RS3EjKvwOJPyAaHU5lZrV8Ib+Md2E3jMYZl8fzdsPz
	 qPum6p1KTsElQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/3] arm64: dts: qcom: ipq5210: Add nodes for
 multiple peripherals
Reply-To: sashiko-reviews@lists.linux.dev
To: "Varadarajan Narayanan" <varadarajan.narayanan@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260724-08-dts-v4-1-65e61a1061f0@oss.qualcomm.com>
References: <20260724-08-dts-v4-0-65e61a1061f0@oss.qualcomm.com>
 <20260724-08-dts-v4-1-65e61a1061f0@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 10:11:30 +0000
Message-Id: <20260724101131.62DA51F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The `cpu1-thermal` zone defines a `cpu-passive` trip point but lac=
ks a `cooling-maps` block to enforce CPU throttling.
- [Low] The `cpu0-thermal` cooling maps use `THERMAL_NO_LIMIT` bounds, whic=
h contradicts the stated intention to cap the frequency at 816 MHz.
--

--- Patch [1]: [PATCH v4 1/3] arm64: dts: qcom: ipq5210: Add nodes for mult=
iple peripherals ---
commit 1a65f86590b0031ce931c8fec8d83a0167f7d018
Author: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

arm64: dts: qcom: ipq5210: Add nodes for multiple peripherals
   =20
Describe common IPQ5210 SoC peripherals in the base DTSI so board DTS files
can enable the hardware they use. Add nodes for USB, PCIe, QPIC NAND/BAM,
QFPROM, TSENS and thermal zones. This also describes the CPU OPP table and
CPU cooling cells needed for frequency scaling and thermal throttling.

> diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/=
qcom/ipq5210.dtsi
> index 2cdc10529c489..2e6f99d894aba 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi

[ ... ]

> @@ -306,6 +618,287 @@ frame@b128000 {

[ ... ]

> +		cpu0-thermal {
> +			thermal-sensors =3D <&tsens 14>;
> +
> +			trips {
> +				cpu-critical {
> +					temperature =3D <120000>;
> +					hysteresis =3D <9000>;
> +					type =3D "critical";
> +				};
> +
> +				cpu0_thermal_alert: cpu-passive {
> +					temperature =3D <110000>;
> +					hysteresis =3D <9000>;
> +					type =3D "passive";
> +				};
> +			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip =3D <&cpu0_thermal_alert>;
> +					/* Set maximum frequency as 816 MHz */
> +					cooling-device =3D <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,

[Severity: Low]
This isn't a bug, but does THERMAL_NO_LIMIT match the comment about setting
the maximum frequency to 816 MHz?

Passing THERMAL_NO_LIMIT simply delegates the entire range of cooling states
to the thermal governor rather than applying a hard upper frequency limit.

If the intention is to clamp the frequency to 816 MHz, should explicit cool=
ing
states be used?

> +							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +			};
> +		};
> +
> +		cpu1-thermal {
> +			thermal-sensors =3D <&tsens 15>;
> +
> +			trips {
> +				cpu-critical {
> +					temperature =3D <120000>;
> +					hysteresis =3D <9000>;
> +					type =3D "critical";
> +				};
> +
> +				cpu-passive {
> +					temperature =3D <110000>;
> +					hysteresis =3D <9000>;
> +					type =3D "passive";
> +				};
> +			};
> +		};

[Severity: High]
Is a cooling-maps block missing for this thermal zone?

The cpu1-thermal zone defines a passive trip point but lacks a cooling-maps
section to enforce CPU throttling.

If CPU1's thermal sensor detects a temperature exceeding 110C independent of
CPU0, won't it exceed the passive threshold unmitigated until it reaches the
120C critical trip, causing an abrupt hardware thermal shutdown?

>  	};
> =20
>  	timer {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724-08-dts-v4-=
0-65e61a1061f0@oss.qualcomm.com?part=3D1
