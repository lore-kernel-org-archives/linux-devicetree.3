Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC90263F34
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 04:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778732822; cv=none; b=ObKhPwDNs5d1WhZrQj/gWOIoADDaHqs5U9lK3XzamdBqVGERwQIboWVy5LMBLxGHEbJuKdFOmZJmVhxSjX0omt4awrf0Qo6KzIj1kxe2iQaIATiM7kmBs1UaelaxgNAMIfodVQLpYoLOWEf6KuSq8o/krlqmS5gFL/Afk+DmAF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778732822; c=relaxed/simple;
	bh=MAAlt1clcA5FAY4ZShHsW8mZoQOyEGWckvlzn6/96EM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ESLMmJCEr3bUDPd4rAxhCd3EvBmkQRt8cRspRU62fLiYnbR2/GLgRAur0MS+QHdGPVblD7vLEvQOT7MEz5Ftq0gNSxxvyijruSqOUKy2yDLUKdw63xheuFYmOc0zJENX6lOb4IpgiTiQakFU9lmq6B7Q9u+EAcnxupVfKOQkSN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GTuhJD1Y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GTuhJD1Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 068E2C2BCB7;
	Thu, 14 May 2026 04:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778732822;
	bh=MAAlt1clcA5FAY4ZShHsW8mZoQOyEGWckvlzn6/96EM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=GTuhJD1Y6MEHmskTWy/TOf4YYiHD9/c/C9VJVamZ9NXJ3CVtvNsRmgoFRyruhnwBT
	 KOktI/VyPKy4lMH/pUypX7UDX7zlXMIKC9vGDP80oGhiH+KdR8rQt3HJ7sNf9veqcN
	 1LkqpI2nf9MVNnlguz4Jzbu46nJ5qT3Z1RSoQdiUtxo4J0Ez9Zu5NdoQ8Kb9E4u583
	 /7jjT+YolSBEIFsPqnAsVhquPjUMV3pwyCkPs/5g9D1HPFDkH2GdzSEYsIaPU5UjZh
	 C16TTfe9fnRnnDRalnYt2HkM10UYPDQuQNv57UonDyv01gBryScs9VUHgzYeIC3MF9
	 4AQSggHr4RAsg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/2] dt-bindings: usb: cdns3: Add no_drd property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pawel Laszczak via B4 Relay" <devnull+pawell.cadence.com@kernel.org>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260513-b4-no_drd_config-v6-1-e7789cd0e581@cadence.com>
References: <20260513-b4-no_drd_config-v6-1-e7789cd0e581@cadence.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 04:27:01 +0000
Message-Id: <20260514042702.068E2C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [Medium] The schema enforces strict positional ordering for 'reg-names' a=
nd 'interrupt-names', directly contradicting the commit message's claim of =
'flexible ordering'.
- [Medium] The `reg` array positional descriptions in the base schema incor=
rectly document the XHCI registers as OTG registers when `no_drd` is true.
- [Medium] The `else` block is missing a `minItems: 3` constraint for `reg-=
names`, allowing mismatched array lengths between `reg` and `reg-names`.
- [Medium] The proposed property `no_drd` violates standard Device Tree nam=
ing conventions by using an underscore and missing a vendor prefix.
- [Low] Introducing a redundant boolean property (`no_drd`) to indicate a m=
issing hardware block is a hardware description anti-pattern.
--

commit ef0683895d184cd4e0adacbed88f838da9544b55
Author: Pawel Laszczak <pawell@cadence.com>

dt-bindings: usb: cdns3: Add no_drd property

This commit introduces a new boolean property no_drd for Cadence
USBSS/USBSSP controllers. It updates the schema to adjust reg, interrupts,
and dr_mode requirements based on the presence of this property.

> To achieve this, the schema is updated with an if-then-else logic
> and 'reg-names'/'interrupt-names' use enums to allow flexible
> ordering during validation.

Does the if-then-else logic actually allow flexible ordering?

Looking at the conditional blocks below, the items are defined as a list
of const constraints. In JSON Schema, providing an array of schemas to
items enforces strict positional validation, meaning the elements must
appear in the exact order specified.

> diff --git a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml b/Docum=
entation/devicetree/bindings/usb/cdns,usb3.yaml
> index 2d95fb7321aff..717892a05dcdf 100644
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

Does this cause an issue when the new property is set to true?

When restricted to 2 items in the then block below, the first item must
be xhci. However, the base schema defines the first item description as
OTG controller registers. It seems the XHCI register at index 0 will be
validated against and incorrectly described by the inherited OTG
description. Fixed positional descriptions generally cannot be used if
elements can be omitted from the beginning of a sequence.

[ ... ]

> @@ -79,6 +81,13 @@ properties:
>      description: Enable resetting of PHY if Rx fail is detected
>      type: boolean
> =20
> +  no_drd:

This isn't a bug, but device tree property names should generally use
lowercase alphanumeric characters and hyphens instead of underscores.
Would it also be better to include a vendor prefix to avoid namespace
collisions, such as cdns,no-drd?

> +    description:
> +      Indicates that the Dual-Role Device (DRD) register block is not
> +      implemented or is inaccessible. In this case, the controller
> +      must operate in a fixed peripheral or host mode.
> +    type: boolean

Is a dedicated boolean flag needed here?

It seems the hardware configuration could be natively deduced by simply
checking if otg is absent from reg-names. Relying on a negative feature
flag instead of resource presence is usually discouraged in hardware
descriptions.

[ ... ]

> +    else:
> +      properties:
> +        reg:
> +          minItems: 3
> +        reg-names:
> +          items:
> +            - const: otg
> +            - const: xhci
> +            - const: dev

Could this allow mismatched array lengths between reg and reg-names?

The reg property explicitly requires minItems: 3 here, but reg-names is
not given a corresponding minItems constraint in this block. It will
inherit minItems: 2 from the base schema, which might allow validation to
succeed if a device tree defines 3 reg entries but only 2 reg-names.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513-b4-no_drd_=
config-v6-0-e7789cd0e581@cadence.com?part=3D1
