Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E8F29B228
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 19:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779218254; cv=none; b=Xlig2wgxJxK6eOaCjee2GQzSqSQXN1DVmKvJDpxMMhuVQYXogA+eksQqbzaC2NiOvPvtBc+0VFOMzLb5WzVdNsBigsX5Z/EzEFjuaoLNBiP+wP/HkTqiNFzUmgG4aOvkxDPfQfQGAcybmEZxoidkG1iXxZVXBgoEP0C9f4lFG7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779218254; c=relaxed/simple;
	bh=CpE3e+wT2o9VhRKJ6u188w8lcH+A3ufuq3DEhK8jOw0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=O08CkeHADuwKsjtSIdyUpWDqiWtftH8TetEIoAbtAwadT/EjeU5Xr7eBnrVvrWvIiUpJneGecMKHjjoHiyuEw2WYAAItt9Ll0u1DtwmZtgI5oAfjprReS/0TIouT72cdqbJ8/ODheFka6gdKBMtwSh8m9F4hwzHfGq4+sohlv54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q/vi5kWT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q/vi5kWT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 372C81F000E9;
	Tue, 19 May 2026 19:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779218253;
	bh=6zVRp6scrsWaOVkixA65J+KMby8d+skwCCxeLxnhowY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Q/vi5kWTAUY6ShZtHlNPN3x5Pu45Z4rvP2gHQqoVxiBzbsfbrue6dFu72UlkZrJrT
	 gPniXcymCDKP95RDSFpQhw/S/Ht3v8Pm2h6KztRUPW8zEm0wPoUed0emJROaKtNZjL
	 HfOniR30H70On0XWWsDBhbdGHC9+JVA2ue+0OLIIaRiVXWerX75U8V2z6uMEpQZZq6
	 z7bzf2nAZrBnPBlX1OzNGJMpDkOkicvCsFUN+pQb7j7tZMfQ8PQyQjMTcj/wua+TZ6
	 0ZRdbjE+p4BdzkVuMw0efO7XocznBGJYwF2z2+DZiELOR4Jrq184JquoRZXcnHFAoD
	 l4JQ5q6SON81g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: soc: qcom: Document CDSP Power
 Management
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vignesh Viswanathan" <vignesh.viswanathan@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260520-cdsp-power-v1-1-85eb9501a1cd@oss.qualcomm.com>
References: <20260520-cdsp-power-v1-1-85eb9501a1cd@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 19:17:32 +0000
Message-Id: <20260519191733.372C81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The schema explicitly defines and requires 'interrupts-extended'=
 instead of the standard 'interrupts' property.
- [Low] The example uses a 4-cell interrupt specifier for the ARM GIC, whic=
h only accepts 3 cells.
--

commit 4faf2370824eaf5bd43284e69168484a422966ae
Author: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>

dt-bindings: soc: qcom: Document CDSP Power Management

This commit adds device tree binding documentation for the CDSP Power
Management driver. It describes the properties needed for DCVS requests via
SMEM, LPM transitions via MPM handshakes, and virtual regulators used by the
remoteproc driver.

> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,cdsp-power.y=
aml b/Documentation/devicetree/bindings/soc/qcom/qcom,cdsp-power.yaml
> new file mode 100644
> index 0000000000000..f0f89fdeba4ef
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,cdsp-power.yaml
> @@ -0,0 +1,138 @@
[ ... ]
> +properties:
> +  compatible:
> +    const: qcom,cdsp-power
> +
> +  reg:
> +    items:
> +      - description: MPM (Modem Power Manager) register region
> +      - description: RSCC (RSC Configuration) register region
> +
> +  reg-names:
> +    items:
> +      - const: mpm
> +      - const: rscc
> +
> +  interrupts-extended:

[Severity: Medium]
Should this property be defined as interrupts instead?

The core dt-schema tooling automatically permits and validates
interrupts-extended usage in device trees against the standard interrupts
schema definition.

By explicitly defining interrupts-extended, this forces device tree
authors to use the extended format and prevents them from using the
standard interrupts property with an interrupt-parent.

> +    items:
> +      - description: LPM (Low Power Mode) interrupt from MPM
> +      - description: DCVS (Dynamic Clock and Voltage Scaling) interrupt =
from IPCC
[ ... ]
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts-extended

[Severity: Medium]
Should this require the standard interrupts property rather than
interrupts-extended?

> +  - interrupt-names
> +  - mboxes
> +  - qcom,smem-item
> +  - vdd-cx-supply
> +  - regulators
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/mailbox/qcom-ipcc.h>
> +
> +    soc {
> +        #address-cells =3D <2>;
> +        #size-cells =3D <2>;
> +
> +        cdsp_power: cdsp-power@4ae000 {
> +            compatible =3D "qcom,cdsp-power";
> +            reg =3D <0x0 0x004ae000 0x0 0x1000>,
> +                  <0x0 0x26018018 0x0 0x4>;
> +            reg-names =3D "mpm", "rscc";
> +
> +            interrupts-extended =3D <&intc GIC_SPI 65 IRQ_TYPE_EDGE_RISI=
NG 0>,

[Severity: Low]
Does this ARM GIC interrupt specifier have an extra cell?

The standard ARM GIC binding expects exactly 3 cells for the specifier type,
number, and flags.

The trailing 0 appears to be an extra 4th cell that might cause a cell-count
mismatch during validation.

> +                                  <&ipcc IPCC_CLIENT_CDSP
> +                                         IPCC_MPROC_SIGNAL_PING
> +                                         IRQ_TYPE_EDGE_RISING>;
> +            interrupt-names =3D "lpm", "dcvs";
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260520-cdsp-power=
-v1-0-85eb9501a1cd@oss.qualcomm.com?part=3D1
