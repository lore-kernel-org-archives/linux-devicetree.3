Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCBB222126C
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 12:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778761854; cv=none; b=cdzseP2HvdF/JatQDUgm0BkaG+axFZysyPf1Z1z+Om76BTFQiVH5Eo60NOUsw7CFxuQV1gdskq821b3jVhRDU4GOCuFHe8/Nuxfx2NZTGrJN3+VkkjhJO9ckHR/E07E6xW4a5xSwf7kr45mAiP6gT3kO7A9SAYBzLV4RwpQoHeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778761854; c=relaxed/simple;
	bh=Tmnos9vhCuiRy4j7HGxOssgCygwTpEGJTlKSUHKgJRA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ohg5m/fFxjIAHzmIiSYmc+8xMhkUxB4OdhcO26F+ogQZ1iTQtnVFGkU/ZUVfEPE1R6X3cFH7bnQH0zMkw7lshKhy8s4ExGaKrP+Gz7J8H7Xwe2FEmK2rNLLs2GxUcnXELHuUE9WQv2DLmyWQBP2Xje38t7gqWdX0vCZNXL5IW2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WoD2tfQe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WoD2tfQe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 809BDC2BCB3;
	Thu, 14 May 2026 12:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778761854;
	bh=Tmnos9vhCuiRy4j7HGxOssgCygwTpEGJTlKSUHKgJRA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=WoD2tfQe1i6aNZ+AytsHDJ4Oh5kf7JXe0kNenWqP3k1fbcYX7KWpfvn1a3amGNpWK
	 5EITDoW1Ze2+awp0zhl8OgqScz4MjO8puGtz2tI1WAwJR2hpkKvljXsOh9D1cdcpwJ
	 jhdr4k7tnecK0YhWeq0aKGJoMxOdQfYLskxu7GOB4GJwrOpff9p0Xqcp1D4CXSDMRD
	 qgmqaYPDVvWuOb7Vw3E8veupLCWSQDSBE9BDh4cYJuww97Uf7Z7weu8E2L+mYZsjSW
	 9XrWFkPa/PMf477t1Zu7DAPu6Aq/6O1BFJDBOIwVzNIBOyRdV6j2gMFTC1Ij09RKC5
	 7CdlrtrwiFfHQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 1/2] dt-bindings: usb: cdns3: Add cdns,no-drd
 property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pawel Laszczak via B4 Relay" <devnull+pawell.cadence.com@kernel.org>
Cc: devicetree@vger.kernel.org, krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260514-b4-no_drd_config-v7-1-18cc40e363fd@cadence.com>
References: <20260514-b4-no_drd_config-v7-1-18cc40e363fd@cadence.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 12:30:54 +0000
Message-Id: <20260514123054.809BDC2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] The schema fails to enforce that `dr_mode` is required when `cdn=
s,no-drd` is present.
- [Medium] The conditional blocks enforce strict array ordering for `reg-na=
mes`, directly contradicting the commit message's claim of supporting flexi=
ble ordering.
- [Medium] The `if/then/else` logic fails to fully enforce array length con=
straints for `reg` and `reg-names`, breaking backward compatibility and all=
owing invalid configurations.
--

commit 27ad576607394b6bdaff814912f5101ce8966dd5
Author: Pawel Laszczak <pawell@cadence.com>

dt-bindings: usb: cdns3: Add cdns,no-drd property

This commit introduces the cdns,no-drd property for Cadence USB controllers
where the dual-role device register block is missing or inaccessible. It
updates the schema to conditionally modify the requirements for reg,
reg-names, interrupts, and dr_mode based on whether this property is presen=
t.

> diff --git a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml b/Docum=
entation/devicetree/bindings/usb/cdns,usb3.yaml
> --- a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
> +++ b/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
[ ... ]
> @@ -93,6 +98,45 @@ allOf:
>    - $ref: usb-drd.yaml#
>    - $ref: usb-xhci.yaml#
> =20
> +  - if:
> +      required:
> +        - cdns,no-drd
> +    then:
> +      properties:
> +        reg:
> +          items:
> +            - description: XHCI Host controller registers
> +            - description: DEVICE controller registers

Since the top-level schema relaxes maxItems to 3, does this then block
need an explicit maxItems of 2 for reg?=20

In JSON schema, defining an items list inside a conditional block does not
implicitly restrict the maximum length, which could allow an invalid third
register item to silently pass validation.

> +        reg-names:
> +          items:
> +            - const: xhci
> +            - const: dev

The commit message states reg-names uses enums to allow flexible ordering
during validation. However, does defining items as an array of constants in
this block enforce a strict positional sequence?=20

Tuple validation requires xhci to be the first element and dev to be the
second, which seems to contradict the intended flexibility.

Similarly, does this block also need an explicit maxItems of 2 to match
the expected length?

> +        interrupts:
> +          maxItems: 2
> +        interrupt-names:
> +          items:
> +            - const: host
> +            - const: peripheral
> +        dr_mode:
> +          enum: [host, peripheral]

The commit message notes dr_mode must be explicitly set to either host or
peripheral. Does the then block need a required list containing dr_mode to
enforce this?=20

Currently, the schema restricts the allowed values but will still pass
validation if a device tree node omits dr_mode entirely.

> +    else:
> +      properties:
> +        reg:
> +          items:
> +            - description: OTG controller registers
> +            - description: XHCI Host controller registers
> +            - description: DEVICE controller registers
> +        reg-names:
> +          items:
> +            - const: otg
> +            - const: xhci
> +            - const: dev

Just like in the then block, does defining items as an array of constants
here prevent flexible ordering by enforcing otg, xhci, and dev in that
exact sequence?

Also, since the top-level schema was relaxed to allow a minimum of 2 items,
do reg and reg-names need an explicit minItems of 3 here?=20

Without it, an array of just 2 items could pass validation when cdns,no-drd
is absent, which breaks the intended backward compatibility of requiring all
3 resource sets.

> +        interrupts:
> +          minItems: 3
> +          maxItems: 4

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260514-b4-no_drd_=
config-v7-0-18cc40e363fd@cadence.com?part=3D1
