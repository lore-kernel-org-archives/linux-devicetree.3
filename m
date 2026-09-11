Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873253B19B1
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 05:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789103673; cv=none; b=oSMaqjJSxvaFKhdUMxa9stDb/nedEcbBdYmnEaZjGZux70xDtzFjtRvhTG+5idnoycdzqyrdnTk6UvfgpQfsvjZXf/cvK/90ecVX/W0J2dVkw4g8KjKpeuADCcVoI4J+7/nLdsT1trLvLuBNmW1Qr1twYNOMTKPXrr5V22KaVg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789103673; c=relaxed/simple;
	bh=7MbQOJntuQUCDF+K//vVoYDfS87ERONkQd5L4dSnnmQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=N/+fG9st0Mxab8hs+VSzx04jaBlhrTMVXQJmzP4UQK6lOK4EoWz/Z3hHep0dRXi837r+/kHyPTlzLPSQJudkziPY5WYp24wQyPYeqGEUJtZ6J0MyhfXsmCtTC3+mbP4ZU8OfY1Fj0jODFL7Rmegm02o0uvBuhR/qjxluOJq2Gnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TgIvnq8q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TgIvnq8q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C37301F000FF;
	Fri, 11 Sep 2026 05:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789103672;
	bh=aW1sjWxwP6knpDHIgMJoLHwJ0lzddsgdUqr7VhfmSRM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TgIvnq8qFBCuyvjHvFK4Gl/B2SaVgJ9RnjqOwHO6MHz2I1hf5yyZEbI5glxdFTDwR
	 GRn9wPzTj8dYclSQjDtjabZ7AKXud+TD8BFufuEcoQQuUBSKeDJV0oMP7EE7A6SFSh
	 zkIQ1A2PsNBvyWz7p3hwUhgZhKDHtHpOhcBzYgwFXgTVNcFKDRe3yQl92iEHUKSAFc
	 AnUOC7AWuHHXVSWYZtRS6Uqe5nTw1V+amn15zNK490Fq8t/eNofpbMa2uXmqOtrqXK
	 fUZjFwzoauTgQ8f5UWtT8gbO0puu4r7F7Kt1fONFPuGJVBXxEioP2WSxZSu5mKo0x9
	 n520tChmNo+0g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: shikra: Enable CDSP & Modem
 cooling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dipa Ramesh Mantre" <dipa.mantre@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260911-shikra_qmi_tmd-v1-2-96c1cca82f30@oss.qualcomm.com>
References: <20260911-shikra_qmi_tmd-v1-0-96c1cca82f30@oss.qualcomm.com>
 <20260911-shikra_qmi_tmd-v1-2-96c1cca82f30@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 05:14:31 +0000
Message-Id: <20260911051431.C37301F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] The patch introduces a fatal build failure by including a non-exist=
ent device tree bindings header file and referencing undefined macros for t=
he QMI TMD cooling framework.
- [Low] The addition of the `#cooling-cells` property to the remoteproc nod=
es violates strict Device Tree schema bindings.
--

commit 4b1a1d4f27b1c457bd265f6d0f4a5b333e378019
Author: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>

arm64: dts: qcom: shikra: Enable CDSP & Modem cooling

This commit sets up CDSP and modem cooling by throttling them using the
QMI TMD cooling device framework when they reach high temperatures.

> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/q=
com/shikra.dtsi
> index c1f06f692f664..55bac1b57cbac 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> @@ -10,6 +10,7 @@
>  #include <dt-bindings/interconnect/qcom,icc.h>
>  #include <dt-bindings/interconnect/qcom,osm-l3.h>
>  #include <dt-bindings/dma/qcom-gpi.h>
> +#include <dt-bindings/thermal/qcom,pas.h>

[Severity: Low]
The header file <dt-bindings/thermal/qcom,pas.h> appears to be completely
missing from the tree.

Does this include cause a fatal build failure?

[ ... ]

> @@ -2007,6 +2008,8 @@ remoteproc_mpss: remoteproc@6080000 {
>  			qcom,smem-states =3D <&modem_smp2p_out 0>;
>  			qcom,smem-state-names =3D "stop";
> =20
> +			#cooling-cells =3D <3>;

[Severity: Low]
The #cooling-cells property is not documented in the remoteproc schemas.
The qcom,shikra-pas.yaml and qcom,pas-common.yaml bindings specify
unevaluatedProperties: false.

Does adding this property cause make dtbs_check to fail with a schema
validation error?

[ ... ]

> @@ -2047,6 +2050,8 @@ remoteproc_cdsp: remoteproc@b300000 {
>  			qcom,smem-states =3D <&cdsp_smp2p_out 0>;
>  			qcom,smem-state-names =3D "stop";
> =20
> +			#cooling-cells =3D <3>;

[Severity: Low]
This seems to add #cooling-cells to the remoteproc_cdsp node as well.

Does this also trigger the same strict DT schema validation failure?

[ ... ]

> @@ -3877,15 +3884,31 @@ trip-point0 {
>  					type =3D "hot";
>  				};
> =20
> -				nsp-critical {
> +				nsp_alert1: nsp-alert1 {
>  					temperature =3D <115000>;
> +					hysteresis =3D <5000>;
> +					type =3D "passive";
> +				};
> +
> +				nsp-critical {
> +					temperature =3D <118000>;
>  					hysteresis =3D <0>;
>  					type =3D "critical";
>  				};
>  			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip =3D <&nsp_alert1>;
> +					cooling-device =3D <&remoteproc_cdsp QCOM_TMD_CDSP_SW
> +							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;

[Severity: Low]
The <dt-bindings/thermal/qcom,pas.h> header is missing, which leaves macros
like QCOM_TMD_CDSP_SW, QCOM_TMD_PA, and QCOM_TMD_MODEM undefined.

Will this line lead to a fatal device tree compiler error?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911-shikra_qmi=
_tmd-v1-0-96c1cca82f30@oss.qualcomm.com?part=3D2
