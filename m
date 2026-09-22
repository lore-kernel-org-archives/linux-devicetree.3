Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A13542EE8
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 22:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790115690; cv=none; b=rffEQah1S3Hlx5JBXru9vawIhJgmOmtBdjK+kVpxNNvIWHYMMUBALfoPNPlzKJa3tKn2rcaOSLKE33IK5zECf/Iu0414yQB/zRrzkpWdDklxGFHV/17YeZDQD3HDorAPjnZFnV6348PlK9l1Rld5lGntG+OwWVjkamwKKHg3j7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790115690; c=relaxed/simple;
	bh=YTLCkgMPyCzQLDvXQWVllV/UaDR7Q3mFJYit+X/wJe0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VButIzR/kOI6hN4JR3HOE4Z74OaSdQV3x9hNw9Y5O8z7N2N5yuCuGvnN2F1PUGUDAvlit9k/SmjN7TpIdKYjAzNeLkIuCraJpk9oGwdST0aDC9GdXXETZWLoXugeh2qELPiGFzQGeLTa602fDjQTAfQQmSMJW0EF9ngjMfPmITE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oHkJptsi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oHkJptsi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7583E1F000FF;
	Tue, 22 Sep 2026 22:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790115674;
	bh=NcU+J0oduqjOJE9d3Ba9jD+zajy8TisMIdAAqM3Ktc8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oHkJptsiXjouw3wASK32Rt0XNMxkzE3QMcCzBIdv+o19O3Y2xDvypLGRyixDksDRB
	 3Zk5gA+UXiIIzSlyA+W8XT4WdZNEhQcxkndJlUWEKfqJO+kUcgkvJLXaGpE4HHovAP
	 nb4W/ln4cqqIPJl4/qfN5weh2jvIvyz9eHYraYY4bUORxprf/n7Yje3SQPMEszqnRd
	 NCoUs6OC5UIwFbRA3rhLBfSSkV/wG0IaqgjJt6/Jc6WT27ZB88wxZRtqbBpmVkaayp
	 MeOUJCZ8Vemw0QOdkkxB7+Dd0MVMeHMJAveKq7cKJK61ECR/x9/Gp1XU/O5eOVsyVM
	 FCICg5VbHOpsQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/5] arm64: dts: qcom: agatti: add LPASS devices
Reply-To: sashiko-reviews@lists.linux.dev
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <30285f0267cacf2dc2f7c19cfbb10bd42d50310c.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
References: <cover.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
 <30285f0267cacf2dc2f7c19cfbb10bd42d50310c.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 22:21:14 +0000
Message-Id: <20260922222114.7583E1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] dt-bindings: qcom,agatti: unit address mismatch for lpasscc node
- [Low] dt-bindings: qcom,agatti: swr nodes lack status disabled or pinctrl
--

commit 0dce088f4d3617832ec5dd0787d22b15acf31f29
Author: Alexey Klimov <alexey.klimov@linaro.org>

arm64: dts: qcom: agatti: add LPASS devices
   =20
This commit adds the rxmacro, txmacro, vamacro, soundwire nodes, and lpass
clock controllers required to support audio playback and capture on sm6115
and its derivatives.

> diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/q=
com/agatti.dtsi
> index e7fed60a59d93..6d99e24e3dc2a 100644
> --- a/arch/arm64/boot/dts/qcom/agatti.dtsi
> +++ b/arch/arm64/boot/dts/qcom/agatti.dtsi

[ ... ]

> @@ -2238,6 +2274,127 @@ glink-edge {
>  			};
>  		};
> =20
> +		rxmacro: codec@a600000 {

[ ... ]

> +		swr1: soundwire@a610000 {
> +			compatible =3D "qcom,soundwire-v1.6.0";
> +			reg =3D <0x0 0x0a610000 0x0 0x10000>;
> +			interrupts =3D <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>;

[Severity: Low]
Does this node need to be disabled by default?

The swr1 RX soundwire node is added to the common .dtsi without a
status =3D "disabled" property or default pinctrl properties. If a downstre=
am
board file includes this .dtsi but does not explicitly configure the pinctrl
or disable the node, the driver will unconditionally probe and fail to
operate correctly due to unlinked pins.=20

Would it be better to disable external bus interfaces in common includes?

> +
> +			clocks =3D <&rxmacro>;
> +			clock-names =3D "iface";

[ ... ]

> +		swr0: soundwire@a740000 {
> +			compatible =3D "qcom,soundwire-v1.6.0";
> +			reg =3D <0x0 0x0a740000 0x0 0x10000>;
> +			interrupts =3D <GIC_SPI 296 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;

[Severity: Low]
Similarly for the swr0 TX soundwire node, should this node also be disabled
or provided with default pinctrl properties to prevent unconditional probing
on boards that do not configure it?

> +			clocks =3D <&txmacro>;
> +			clock-names =3D "iface";

[ ... ]

> +		lpasscc: clock-controller@a7ec000 {
> +			compatible =3D "qcom,sm6115-lpasscc";
> +			reg =3D <0x0 0x0a7e0000 0x0 0x12000>;

[Severity: Low]
Is there a typo in the unit address or the reg property here?

The node name clock-controller@a7ec000 does not match the base address in
its reg property (0x0a7e0000). This causes a simple_bus_reg validation
warning during dtc compilation.

> +			#reset-cells =3D <1>;
> +		};
> +
>  		remoteproc_adsp: remoteproc@ab00000 {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1790114902.gi=
t.srinivas.kandagatla@oss.qualcomm.com?part=3D3
