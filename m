Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DBF3BF685
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 09:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779268819; cv=none; b=WAR8HEygHl7q3E78N88wX3UdxBoM8caPMUaTMH5SuDqNiWbybCqFg/bEM0wH8ycFaoQWRNUcHP20mU/MvB9cfFrsWFIuZ0MX+w/eNavrv817wNX4yR38kRFCHISLvWakyXo58m4dXFON8YQlUIJYV0YQQyC+KwEyBgcFb99/erA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779268819; c=relaxed/simple;
	bh=CMyYvMbrlLKZPW5/P3Mh4MVx058aw4LL2Rmzn4Gc+K8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aWI7vLBMax3IZ8BM/zLOxvmwY+uGYfiClMpRgjhoxuSILtir66FhFoH7qdCL/HWZ+Iq1NtMZnabZd+i7anjWzSwTc2/HDfcT0VIPT2hPxPTcv/SeSqJOQbjUoiKFTF41+u5spI3JBRQ3RgS1PAOh7Z7dDXYOcVe/jtN4fpIhfXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Blyza42V; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Blyza42V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCBEE1F00893;
	Wed, 20 May 2026 09:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779268818;
	bh=m25VWtHhrEPcG2n9Qncg0J5boIQQL3r/M+d5r3U+Hps=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Blyza42VhCEIXhz/AEjpM4KomomLERaoQwItK3uz0FDmVAWKS8BDD/bbftFm2bZ5E
	 X1z8gXlsJ3gQdI7sASnF342nKXe648fp95bK/c8oNdfrWzJtotcs/F35EmjiPALAeK
	 GyeJLMe94vrf29vq6XaF9c7TLcnEPjvNwT/IlR9+EgYuCtbs/L2NDbChKyPf0ckgRr
	 qcZH+3fzYS0ZtP+Hbcp7WZZjxdQGsc0GP2ilRmxwbuoAxTYkNo/6IK8ohc6KzWRYjC
	 GTBl8O5Xt2yKxyIDbaHDYB9J6pzhXXIwEkbXZmCxjHgeo40JvSF/reMRAwfniSz1CU
	 5dumOLdJgBrng==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: regulator: qcom,usb-vbus-regulator:
 add qcom,pm4125-vbus-reg
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rakesh Kota" <rakesh.kota@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260520-add_pm4125-vbus-reg-v1-1-f6d15d7dbbe8@oss.qualcomm.com>
References: <20260520-add_pm4125-vbus-reg-v1-1-f6d15d7dbbe8@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 May 2026 09:20:17 +0000
Message-Id: <20260520092017.DCBEE1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Removing the fallback compatible string for `qcom,pm4125-vbus-reg`=
 breaks backwards compatibility and schema validation for existing device t=
rees.
- [Low] Unit-address mismatch in the newly added pm4125 device tree example=
 causes a dtc compiler warning/error.
--

commit d88778938ce0889e7c6904b04eca901125a815cb
Author: Rakesh Kota <rakesh.kota@oss.qualcomm.com>

dt-bindings: regulator: qcom,usb-vbus-regulator: add qcom,pm4125-vbus-reg

This commit moves qcom,pm4125-vbus-reg from the fallback items list into
a standalone enum since it has a different register layout. It also updates
the required properties for this variant to use microvolt instead of
microamp, and adds a new example.

> diff --git a/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-re=
gulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-re=
gulator.yaml
> --- a/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator=
.yaml
> +++ b/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator=
.yaml

[ ... ]

>  properties:
>    compatible:
>      oneOf:
>        - enum:
>            - qcom,pm8150b-vbus-reg
> +          - qcom,pm4125-vbus-reg
>        - items:
>            - enum:
> -              - qcom,pm4125-vbus-reg
>                - qcom,pm6150-vbus-reg
>                - qcom,pm7250b-vbus-reg

[Severity: High]
Does removing this fallback compatible string break backwards compatibility
for existing device trees?

Previously, the binding allowed the compatible string list to be
qcom,pm4125-vbus-reg, qcom,pm8150b-vbus-reg, which is currently used in
arch/arm64/boot/dts/qcom/pm4125.dtsi.

Additionally, the required properties for qcom,pm4125-vbus-reg are changed
from regulator-min/max-microamp to regulator-min/max-microvolt. Since
existing device trees like qrb2210-rb1.dts rely on the microamp properties,
will this cause make dtbs_check to fail for existing in-tree device trees?

[ ... ]

> +  - |
> +     pmic {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        usb-vbus-regulator@5000 {
> +            compatible =3D "qcom,pm4125-vbus-reg";
> +            reg =3D <0x1100>;

[Severity: Low]
Will this unit-address mismatch cause a compiler warning during validation?

The node name specifies an address of 5000, but the reg property specifies
0x1100. This usually triggers a unit_address_vs_reg warning from the dtc
compiler during make dt_binding_check.

Should the node name be updated to match the reg property address?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260520-add_pm4125=
-vbus-reg-v1-0-f6d15d7dbbe8@oss.qualcomm.com?part=3D1
