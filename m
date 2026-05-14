Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3A83F410B
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 02:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778727453; cv=none; b=sid11daKZdPlhxrXTNVuCVBwozbvYXuwu+7B3jRSXI/fDpvW4b1qJPzCEq+stUwGSOnRNYcQB/T/zPBnnP9OSndvE+lx/VTUS0Kc7Xb+0f3fQtLyluSpCHJWXdgr/YSPCiz7Kmxbwce9GyjDlLjqvIbhCLbfB0kLqc6htuCnxK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778727453; c=relaxed/simple;
	bh=rLEegzEf1TNoFqO8nYSgIRPNCr+5i15Cox5Als86PB4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=V68gYvG8F5jXBWMl4bbYshjQhWN3l19eHAN+Vwz2lZJlEsEX8FhWi1Jgw0J3Aw0LQZA/IceVei0Ar77PM6W9j8ZOw0Qnx7Xwcd07E9JvAvQP3V3xvISh96ivdjhe3+58CqZeFsPwLyZ6857ZVtCNIR6gUuylag69sShMJ5wNrbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Oo+bqhww; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Oo+bqhww"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A3D2C19425;
	Thu, 14 May 2026 02:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778727452;
	bh=rLEegzEf1TNoFqO8nYSgIRPNCr+5i15Cox5Als86PB4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Oo+bqhwwJQKKY6llkKWWJMDQ6hnnQvXWovHyD1CCpnhz1lsFgi6nmKisODmMO1PHI
	 KWi81kyUXLzs01fhc9nE2vDlfICxywImGMirdR9bF5EgDOklG8gcEJie5a7+L4Qbue
	 4aWca0iMnoCWgITrYMXuDDTH0dPXgcoKRF33pGSSpmKOgdgm/wCr871PX4X1ulVnIQ
	 otFN3yuJX0dJRR6hD82EhZfVORoK3rIUOKoHOAbL17g32/mbS98y5d27rR0i54seAW
	 aw9TvlYaldiDD0M2h/nNKs2sXVULLSczNRstqKfEJl2Q9M/8GvSVptYauxKEEzYW9Z
	 Zv/91EPprxrWA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: usb: cdns3: Add no_drd property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pawel Laszczak via B4 Relay" <devnull+pawell.cadence.com@kernel.org>
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260513-b4-no_drd_config-v5-1-1c633a4b9a29@cadence.com>
References: <20260513-b4-no_drd_config-v5-1-1c633a4b9a29@cadence.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 02:57:31 +0000
Message-Id: <20260514025732.7A3D2C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Lost functionality: The optional 'wakeup' interrupt is incorrectly=
 forbidden when 'no_drd' is true.
- [Medium] Devicetree naming convention violation and architectural anti-pa=
ttern for 'no_drd'.
- [Medium] Logic contradiction: Schema modifications enforce strict orderin=
g, completely preventing the claimed 'flexible ordering'.
- [Medium] Schema documentation and indexing mismatch for 'reg' and 'interr=
upts' descriptions.
- [Medium] Validation weakening: The fallback 'else' block inadvertently dr=
ops the strict constraint for the 4th optional 'wakeup' interrupt.
--

commit d5f1668911e2cd9ebdc79647d53b3d88019eb9ca
Author: Pawel Laszczak <pawell@cadence.com>

dt-bindings: usb: cdns3: Add no_drd property

Introduce a new boolean property 'no_drd' for Cadence USBSS/USBSSP
controllers to support hardware configurations where the Dual-Role Device (=
DRD)
register block is missing or inaccessible. The schema is updated with an
if-then-else logic and enums for register and interrupt names.

>    When 'no_drd' is absent, the binding maintains backward compatibility
>    by requiring all 3 resource sets (otg, host, dev).
>   =20
>    To achieve this, the schema is updated with an if-then-else logic
>    and 'reg-names'/'interrupt-names' use enums to allow flexible
>    ordering during validation.

Does the new if-then-else block actually allow flexible ordering? The
added logic redefines the 'items' arrays as exact sequences (e.g., using
const for each index), which enforces strict tuple validation per index.
This seems to require elements to exactly match the defined order, preventi=
ng
the flexibility described here.

> diff --git a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml b/Docum=
entation/devicetree/bindings/usb/cdns,usb3.yaml
> index 2d95fb7321aff..5d9bea62729c1 100644
> --- a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
> +++ b/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
> @@ -20,19 +20,21 @@ properties:
>      const: cdns,usb3
> =20
>    reg:
> +    minItems: 2
>      items:
>        - description: OTG controller registers
>        - description: XHCI Host controller registers
>        - description: DEVICE controller registers

Since this base schema strictly defines index 0 of 'reg' as OTG controller
registers, will this cause issues when 'no_drd' is true? In that case, the
OTG block is omitted, forcing 'reg-names' index 0 to be 'xhci' and index 1
to be 'dev'.

Could this cause validation tooling and generated documentation to incorrec=
tly
document and label the 'xhci' register as 'OTG controller registers'?

[ ... ]

> @@ -79,6 +81,13 @@ properties:
>      description: Enable resetting of PHY if Rx fail is detected
>      type: boolean
> =20
> +  no_drd:
> +    description:
> +      Indicates that the Dual-Role Device (DRD) register block is not
> +      implemented or is inaccessible. In this case, the controller
> +      must operate in a fixed peripheral or host mode.
> +    type: boolean

Standard devicetree property names normally use hyphens instead of undersco=
res.
Should this be named 'cdns,no-drd' to include the vendor prefix and prevent
namespace collisions?

Additionally, is using a negative boolean property to denote missing hardwa=
re
the best approach here? Devicetree typically describes present hardware, so
missing blocks are often inferred from property lengths or described via a
distinct compatible string.

[ ... ]

> @@ -93,6 +102,46 @@ allOf:
>    - $ref: usb-drd.yaml#
>    - $ref: usb-xhci.yaml#
> =20
> +  - if:
> +      properties:
> +        no_drd: true
> +      required:
> +        - no_drd
> +    then:
> +      required:
> +        - dr_mode
> +      properties:
> +        reg:
> +          maxItems: 2
> +        reg-names:
> +          items:
> +            - const: xhci
> +            - const: dev
> +        interrupts:
> +          maxItems: 2
> +        interrupt-names:
> +          items:
> +            - const: host
> +            - const: peripheral

The original binding allows an optional 4th interrupt named 'wakeup', which
is cleared by the xhci core.

Since this conditional block explicitly restricts 'interrupts' to maxItems:=
 2,
will hardware configurations that utilize the 'wakeup' line fail schema
validation when operating without the DRD block?

> +        dr_mode:
> +          enum: [host, peripheral]
> +    else:
> +      properties:
> +        reg:
> +          minItems: 3
> +        reg-names:
> +          items:
> +            - const: otg
> +            - const: xhci
> +            - const: dev
> +        interrupts:
> +          minItems: 3
> +        interrupt-names:
> +          items:
> +            - const: host
> +            - const: peripheral
> +            - const: otg

The base schema now allows the interrupt-names elements to be any of the fo=
ur
enums. Because this 'else' block only overrides the first three items with
'const' constraints and omits the 4th item entirely, does the 4th interrupt
fall back to the generic enum?

Could this inadvertently allow duplicate invalid configurations (like
[host, peripheral, otg, host]) instead of strictly requiring 'wakeup' as the
original schema did?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513-b4-no_drd_=
config-v5-0-1c633a4b9a29@cadence.com?part=3D1
