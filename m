Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794560415;
	b=mituWnxQDrM1LXxQvdM24a6SusQMJJNkfhGiEeFyd0pWtNxFR/nfJ1W0ho0GI+yPMojD
	 zjLZEyyDU7qFvNJFrnfzBdvsXD1qb5d7EY3BaVbKEhS4yFdBUHXneuLGTI6HghWsxWqf3
	 GI9T//rEvCZHljJ0eWzynCQ2pL8DfFpLopuEUyiGmkDvdHj0kPGEvWI1ppVnx+7zq4jBv
	 k93dYHYVQxJznu0ZhMnGkwTC8FlUay9SYK6Tw5t9Q4JtBQS1n7Z/i7Peon9IBOOJKk576
	 n9wkRPYCmH3NOPBUBm67A+3kP3XxwihHGbXmkXF8cP0KYRUrZlCa87DTUMEyBwQ3CuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794560415;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=5aQQ03HKPhm6y5xaeyP+b4vSp15F1ZOZKl+g+Yc6q2o=;
	b=LnLR+A2TagZA4SahIH7gxKYdiXOfjjIssJgtUB2vNoTZw4v89tgSZOdK9JsoESo//TWW
	 KbOm4aOs5zPofe0ixB7gTjm3fdJQOcg+Cgg+LEU9BWtHef1jqSssF1G5csf7D/nqIyQ3E
	 4NdNjsNYtI0Lvyy9ryFiAbmBuUZgzkJJEiVTKWajlge16csHG71AH6o3crh9Vvx8W3Bzx
	 LO/d6jFoXDUz94NY8HnmNZtyrrnF1Ysw5VfqUG3HRv+HvEcFWVWIfiIuSudnPppAUrZCg
	 lHxf70NlMlTWaOrsdwn5ZmruFBOGQcN1ulrheHV9RnnixziR8Sqse6eK8MGo2h/PKDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MC1Yu6Oh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A2D606A339
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 09:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MC1Yu6Oh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72BE61F000C8;
	Fri, 13 Nov 2026 09:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794560414;
	bh=5aQQ03HKPhm6y5xaeyP+b4vSp15F1ZOZKl+g+Yc6q2o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MC1Yu6Oha1mmYat2cYSmFf9VoQdiZsGatz1MLWP/4fgVWWLm700iChlNwXSV4nUz8
	 OKZTshsLKYSQOulVrNHP31w9cdzQbtOSdx+fNTEzyetfVzBASO5VPvfRqsVGPhApVM
	 TWtQE7TQDMkm8DKxwdv/+jhq7v3aBd55fFlqrWH4NkD2wmyY+WMpQKsuiXG6+ZXo2R
	 Gsavp6hyvs8pQ2xj/seixzdhRr9v0GtSepnlWvUJutPdNnI9AzNtDhiKS34OPTgpmF
	 YrudpNvoiYHX3SG7fwNpddZTHpF/i0qiF5DwVVsU2sHgEQhUvovT0CIqWZZpS6VB0B
	 59x23qPy13/2Q==
Message-ID: <sashiko-outbox-212491@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 6/6] arm64: dts: qcom: hamoa: add thermal hw-bin
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gaurav Kohli" <gaurav.kohli@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261113-thermal_bin-v3-6-878df6eef8bc@oss.qualcomm.com>
References: <20261113-thermal_bin-v3-0-878df6eef8bc@oss.qualcomm.com>
 <20261113-thermal_bin-v3-6-878df6eef8bc@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 09:00:14 +0000
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
- [Medium] arm64: dts: qcom: hamoa: leftover temperature overrides
  shadow temperature-bin
--

commit 35a11d22a7dfa97cb85bfddd513a803ab8607fca
Author: Amit Kucheria <amit.kucheria@oss.qualcomm.com>

arm64: dts: qcom: hamoa: add thermal hw-bin support

This commit adds the i-temp nvmem cell to hamoa.dtsi, wires the tsens
controllers to it, and switches the GPU passive trip points to use
temperature-bin and thermal-hw-bin instead of board-specific overrides.

> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qc=
om/hamoa.dtsi
> index 443c1a5c212d9..e25729ff23c87 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi

[ ... ]

> @@ -9751,7 +9769,8 @@ map0 {
> =20
>  			trips {
>  				gpuss0_alert0: trip-point0 {
> -					temperature =3D <95000>;
> +					temperature-bin =3D <95000>, <105000>;
> +					thermal-hw-bin =3D <0x1>, <0x2>;
>  					hysteresis =3D <1000>;
>  					type =3D "passive";
>  				};

[Severity: Medium]
Should the GPU trip-point0 temperature overrides also be removed from
hamoa-advantech-som-db5830.dts, hamoa-som-db5830.dts, and
purwa-iot-evk.dts?

Those boards include hamoa.dtsi and still set temperature =3D <105000> on
their GPU trip-point0 nodes.  Because temperature and temperature-bin are
distinct properties, the compiled DTBs retain both on the same trip node,
which violates the oneOf schema constraint in thermal-zones.yaml and causes
thermal_of_trip_read_temperature() to read the scalar temperature property
first, bypassing temperature-bin selection on standard-bin parts.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113-thermal_bi=
n-v3-0-878df6eef8bc@oss.qualcomm.com?part=3D6
