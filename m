Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBF433B6F4
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 10:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790073845; cv=none; b=n6ExtWC3jnH4Nk7j6zzO9v6C+bx0VzFaWlS6VpiveZS4j0iYiiXS8K2mO/lV8Qj5eY5PlI4uYSDtyo8ikPHECcxc7vX7W/LzvmvVmm47kNiCI6tajsOzFmHPF9nBJNBQPKUbI7jALCIPMYTH29d0XdeswmR5ItJb5rtCb6DPWz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790073845; c=relaxed/simple;
	bh=QUDTAXE7gfzBY+KlF+iOAQ070EQjImYhvRFLM1PHsE4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RC+eELb7/NwTE2DMjWrZlxAAjx416qO6B4hlSs1JcDzr15GemEzvngYQp8BNSxxk+epX53pcukCdyv35J6/0pQT5j0p+kJTnnE5ZZOfdYmh3ptlB44ygE0AmcToVPRo8c2R/zLIpdGRGdoCXaYdkbG3N4IUOM0hWEITuCZjQ+y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dwZdoEgG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dwZdoEgG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 336E31F00893;
	Tue, 22 Sep 2026 10:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790073844;
	bh=iStzlGp0VC2GlCcolkSJu1aZHn0Y8hQ5EQb/s/+AN7Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dwZdoEgGA4hhKmmQUdKw92GNRYD1VXcOBlr3J+DUj9Y367veFpc4Ke6WZ6jgEB7UP
	 wsaliTl79IG4L2DcidzscBHGI8yFQZDEu5eaz6S/Kxxrru6yBE8YPmrO97ojLzf9Ob
	 VOCgwES9GTj7eVkeWQkI4yLoafiKpfYu82Iv441IvI+eA17iw4CKGn0cGOxDBQWMgw
	 Jt1n4PIsdVsKm8GV9nv5BtCF3qcXkYNT9+7IdZwmIeWLcq0TSRUoVuygG8o+N+o3Qm
	 j2gG6k2jS6cWaH/nRTYlTSp5keuYJK3Fk3rJBu5uWuX0ycXtZIBjaqb2CsGnBh/5YM
	 MM0rEV/3zXrBw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/4] arm64: dts: qcom: hamoa: Add CoreSight nodes for
 APSS debug block
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jie Gan" <jie.gan@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260922-add-etm-devices-for-multiple-qcom-platforms-v1-1-c2a8c3225a2e@oss.qualcomm.com>
References: <20260922-add-etm-devices-for-multiple-qcom-platforms-v1-0-c2a8c3225a2e@oss.qualcomm.com>
 <20260922-add-etm-devices-for-multiple-qcom-platforms-v1-1-c2a8c3225a2e@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 10:44:03 +0000
Message-Id: <20260922104404.336E31F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt: empty port@2 in funnel@12080000 violates OF graph rules
--

commit 48f77584a29ad03f77385cb8599896371e32bbd1
Author: Jie Gan <jie.gan@oss.qualcomm.com>

arm64: dts: qcom: hamoa: Add CoreSight nodes for APSS debug block

The APSS debug block is built with CoreSight devices like ETM,
replicator, funnel and TMC ETF. This patch adds device tree nodes for
these devices to enable ETM trace, tying their power states to the CPU
cluster domains.

> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qc=
om/hamoa.dtsi
> index 4e35254cdd11a..370b6bba2594f 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi

[ ... ]

> @@ -8433,6 +8645,678 @@ ddr_funnel1_out: endpoint {
>  			};
>  		};
> =20
> +		funnel@12080000 {
> +			compatible =3D "arm,coresight-dynamic-funnel", "arm,primecell";
> +			reg =3D <0x0 0x12080000 0x0 0x1000>;

[ ... ]

> +			in-ports {
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;

[ ... ]

> +				port@2 {
> +					reg =3D <2>;
> +
> +					apss_funnel_in2: endpoint {
> +						remote-endpoint =3D <&ncc2_etf_out>;
> +					};
> +				};
> +			};

[ ... ]

> diff --git a/arch/arm64/boot/dts/qcom/purwa.dtsi b/arch/arm64/boot/dts/qc=
om/purwa.dtsi
> index 4348dd3d1dc59..90069c8e1d400 100644
> --- a/arch/arm64/boot/dts/qcom/purwa.dtsi
> +++ b/arch/arm64/boot/dts/qcom/purwa.dtsi
> @@ -8,7 +8,15 @@
> =20
>  #include <dt-bindings/clock/qcom,x1p42100-videocc.h>
> =20
> +/delete-node/ &apss_funnel_in2;

[Severity: Low]
Does this deletion violate the OF graph bindings? By deleting the
apss_funnel_in2 endpoint node here, its parent node port@2 in funnel@120800=
00
(defined in hamoa.dtsi) is left as an empty shell containing only reg =3D <=
2>.

OF graph rules require port nodes to have at least one endpoint child. Leav=
ing
an empty port triggers a dtc compilation warning (graph port node has no
endpoint children) during make dtbs_check.

Could we assign a label directly to port@2 in hamoa.dtsi so that the entire
port node can be deleted here in purwa.dtsi instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260922-add-etm-de=
vices-for-multiple-qcom-platforms-v1-0-c2a8c3225a2e@oss.qualcomm.com?part=
=3D1
