Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D193E7BB6
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 12:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783947442; cv=none; b=NOyg0M43Xnem5HtLUUfzzkASmUQquX3nV7pOLP98YEiO/8Yhn9oFYLq7YloDEkQd+LpPENI1SgQP+FEpW9w2tijdfoInM5rEarCxrwYAMqkxTEhURlQDQlfBgobMMtINkrxLtezFzG6r+I6jXrJdylEl1SaNxY3ZxzC6n90pRj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783947442; c=relaxed/simple;
	bh=YOiXvMCucobhwj3Rj2D5DNezoxKilfQPKbTsYG+faj0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GJ4tvHRokIRWy1giK3+FNXduFiTkeFW70foZrY9597YjfeFJLtFmYr1qrqprCt/W7uX5tMPrcHsiLorp0ui32GLhz8K894wuRTdxxaGxw/BVo/aANuvHsasmC9yDqWWTV5MZhacS24bvxnhW6AqH3HtZmulbY8r15TWkuv59jdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WbOvPafB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WbOvPafB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E22D1F00A3A;
	Mon, 13 Jul 2026 12:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783947441;
	bh=Auuw8MfqBH9cYQU4s+GcamNQRKXsZhL+vsU2xpoK9ks=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WbOvPafB6pNUW9A2v2nGTfln+6saAGSFTZwknRFo56c/d81T9QZscOl9EiO3/nNYe
	 GIMVptHEFl+tibY+1DegIzoRaHn4VDwN7T48f3LCff7PkAqtfeuYgogL5zzMtcSVto
	 nmqJlaQTZ54CHcL5eY48kdKTA7oBOdYnVBUJVSgKQjQ6AZNjAVPZeZAS6m1on1zkKG
	 pCNng+43Ew8msPOVis5IcMokwWcB2jTintelwrwVE1j8Xw9dBbRTYgmbeuNAtMNA9W
	 oGqjT0PgNihwu/zomEhrJ8UX3JlzhblKmmpsCa7y70hVajWrF8T7JPmIvePaSGeXU4
	 eF2L9YDQuLuGw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: pinctrl: ti,dra7-iodelay: Convert to DT
 schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bhargav Joshi" <j.bhargav.u@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260713-ti-iodelay-v1-1-5f06d36c4aac@gmail.com>
References: <20260713-ti-iodelay-v1-1-5f06d36c4aac@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 13 Jul 2026 12:57:20 +0000
Message-Id: <20260713125721.2E22D1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The child node regex `^mmc.*_conf$` arbitrarily restricts I/O de=
lay configuration nodes to those starting with 'mmc', even though the contr=
oller is generic.
- [Medium] The `pinctrl-pin-array` property is not marked as required withi=
n the child node schema.
--

--- Patch [1]: [PATCH] dt-bindings: pinctrl: ti,dra7-iodelay: Convert to DT=
 schema ---
commit 59d5959fa2ce86d89ce637daf5f846ce2bedcb0d
Author: Bhargav Joshi <j.bhargav.u@gmail.com>

dt-bindings: pinctrl: ti,dra7-iodelay: Convert to DT schema

This commit converts the TI IODELAY controller bindings from plain text
to DT schema. It also adds documentation for child properties missing
from the original text bindings.

> diff --git a/Documentation/devicetree/bindings/pinctrl/ti,dra7-iodelay.ya=
ml b/Documentation/devicetree/bindings/pinctrl/ti,dra7-iodelay.yaml
> new file mode 100644
> index 0000000000000..a399946ae8172
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/ti,dra7-iodelay.yaml

[ ... ]

> +patternProperties:
> +  ^mmc.*_conf$:

[Severity: Medium]
Looking at the patternProperties definition, does this regression arbitrari=
ly
restrict delay configuration nodes to only those starting with mmc?

The commit message mentions that mmc pins are just an example of pins
needing dynamic configuration. If a device tree dynamically configures delay
for other pins, will this reject them as invalid?

Would it be better to use a more generic pattern?

> +    type: object
> +    additionalProperties: false
> +    properties:
> +      pinctrl-pin-array:
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        description: |
> +          An array of 32-bit integers defining the pin delay configurati=
on.

[Severity: Medium]
Could this regression allow incomplete configuration nodes to pass schema
validation?

Since pinctrl-pin-array is not marked as required, an empty child node would
pass dt_binding_check, but the driver expects this property to be present
to initialize the mapping. Should it be added to a required list within the
patternProperties block?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260713-ti-iodelay=
-v1-1-5f06d36c4aac@gmail.com?part=3D1
