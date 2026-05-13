Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56BF63911C0
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 20:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778704933; cv=none; b=RNwupwgNz2FC/5O6nEVoxYaZC4lR4BtAjURkvZvM2i8VzRs+sJe4As6JLrZ537tltDEAmEAu5vQtwAsoyIZCHNBixaCcgpMJQv1bfxrz18HWMrahCKtvEyHA1UUsXoBQPRde87nOoPvkCMe7OxCDqVZBoWfUSER9c5AiZZkJxxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778704933; c=relaxed/simple;
	bh=0L0qgbOLfm+UwCtV/Z2/uNpX0NykUi1+kNOC+On7u7Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YtnLjzqY3JLIHsZOOYbHjob9fiZwzGq98UX3gr/x4nqvxeVbBl4YoHRcczP8oTbY+b6zs7jXzVv8TAhWR4OJhwJg3EUTqOWQi7vXCnk7QWkp5voxo62ygTCwOFeD6U7kcnvh66heor1/IIPbUEgbd10Qb03qK4BYGbmwPhxtG2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ovlKurl6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ovlKurl6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7306C19425;
	Wed, 13 May 2026 20:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778704932;
	bh=0L0qgbOLfm+UwCtV/Z2/uNpX0NykUi1+kNOC+On7u7Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=ovlKurl6uzDWRSiUB3EhjARuy14iWgHEveLw00uufl9sYaOSgLEl2FsvYSNkiBfW6
	 sVLaiClDAByoufPRtlvWpQHrk7Se+au8dNMs1gJzj0n1FfGOmXOz8eSJ3C+t2bEwzY
	 xCn5iZiitSQC2pwvpyKF2AjKzJEqRsz+/+qjYxxJpzUUmvlsUnM2Au0VoP45hdla0+
	 6u980pe4YmREPmN2Au8RqlPacpmyfrdf8hc5jTFuQBJGNryNbOZJ/5GVNbr2My1KV7
	 vae7ogizn8gaKvn2dZ4UTQHJHVXt851OZPp2N8XlSv2tzPtZluZWDYK94PG+grKQ3E
	 uiikgrzYQcZjA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: usb: cdns3: Add no_drd property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pawel Laszczak via B4 Relay" <devnull+pawell.cadence.com@kernel.org>
Cc: krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260512-b4-no_drd_config-v4-1-7b4e5dc96f81@cadence.com>
References: <20260512-b4-no_drd_config-v4-1-7b4e5dc96f81@cadence.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2026 20:42:12 +0000
Message-Id: <20260513204212.A7306C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Schema logic error: lowering `minItems` does not make leading or i=
ntermediate array items optional, breaking schema validation when `otg` res=
ources are omitted.
- [Low] The new property `no_drd` violates standard Device Tree property na=
ming conventions.
- [Low] The schema fails to enforce the operational mode restrictions intro=
duced by the `no_drd` property.
--

commit 56705b83ac8b4d7657f3b9eca696b4b8d5225cc7
Author: Pawel Laszczak <pawell@cadence.com>

dt-bindings: usb: cdns3: Add no_drd property

This commit introduces a new boolean property 'no_drd' for Cadence USBSS/US=
BSSP
controllers to support hardware configurations without a Dual-Role Device (=
DRD)
register block. It also relaxes the 'reg' and 'interrupts' properties
requirements to make the 'otg' resources optional.

> diff --git a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml b/Docum=
entation/devicetree/bindings/usb/cdns,usb3.yaml
> index 2d95fb7321aff..8c7dc81708fb5 100644
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
> =20
>    reg-names:
> +    minItems: 2
>      items:
>        - const: otg
>        - const: xhci
>        - const: dev

Does lowering minItems actually make the leading 'otg' resource optional?

In JSON Schema, array tuple validation matches elements strictly by their
index order. For reg-names, the schema expects 'otg' at index 0 and 'xhci'
at index 1. Lowering minItems to 2 only makes the trailing element ('dev')
optional.

If a device tree omits the 'otg' resource to indicate no DRD block, and
provides reg-names =3D "xhci", "dev", validation will fail because the first
provided element ("xhci") will be evaluated against const: otg.

To correctly allow omitting specific positional resources, does the schema
need a oneOf construct with explicitly defined arrays of allowed combinatio=
ns?

[ ... ]
>    interrupt-names:
> -    minItems: 3
> +    minItems: 2
>      items:
>        - const: host
>        - const: peripheral

Similarly, if 'otg' is omitted but the optional 'wakeup' interrupt is
provided, validation will fail because 'wakeup' will be evaluated against
the third element ('otg').

[ ... ]
> @@ -79,6 +81,13 @@ properties:
>      description: Enable resetting of PHY if Rx fail is detected
>      type: boolean
> =20
> +  no_drd:

This isn't a bug, but device tree property names typically use hyphens
instead of underscores.

Since this property describes a hardware-specific design omission for the
Cadence USB controller rather than a standard core USB subsystem property,
should it use a vendor prefix and hyphens, such as cdns,no-drd, to comply
with DT schema standards?

> +    description:
> +      Indicates that the Dual-Role Device (DRD) register block is not
> +      implemented or is inaccessible. In this case, the controller
> +      must operate in a fixed peripheral or host mode.
> +    type: boolean

Does the schema enforce the operational mode restrictions introduced by
this property?

The description explicitly states that the controller must operate in a
fixed peripheral or host mode. However, the schema does not enforce this
functional requirement.

Could an allOf block be added to the schema to restrict the dr_mode
property to enum: [host, peripheral] and explicitly forbid usb-role-switch
when this property is present?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512-b4-no_drd_=
config-v4-0-7b4e5dc96f81@cadence.com?part=3D1
