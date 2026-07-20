Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C373019A9
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 08:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784534797; cv=none; b=dUQglHxK7Phc9yggqgLNF7VF0oatE//HBPML4kszj/pGQgF7Xk3d+ky/Io/moWjKVkRKtclRFDSIDGBbclgWzLY/nUaIQMW4NU42RoqnCe9U3NuHJJCzV8IZIzJTMCGhWt+oZWTVj7/Gt1cThohaxwtODpprnxfnY+FWEd21nno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784534797; c=relaxed/simple;
	bh=GRGq3tXswv7UCVC9x3YPW9nFpS5MFcKdagZWUVUI+JM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TqSQG0CxkdKNS9slyOvj8eUL86K/rQ8zxiwzaBSxknE3Mow18M9tEztp/zwDPJ2bPFlGsL1QxKJyeaZC1V2PgaLRKFHGfPblVre4LfZ8FN6bTpNd3VYyRhIFMuIKa56wE+PO5OYNH+TuiqqUhfOcNtEMWva35J+baRZlRnlE6Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NRnbcjsW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NRnbcjsW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BBBE1F000E9;
	Mon, 20 Jul 2026 08:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784534795;
	bh=TZsRaTKTHg1n5NnDwAEYuMeuWu0ja39fxrMRo0tlB8Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NRnbcjsWNbzGeCG+j+9/KujnySJnIe86dNe7e49gfn3iDwr9zcn4TLKkTJa514ysZ
	 wgO4V7RE3nkniXYxoklj7ml/puEa9JcTXBk89Gy0+1UflIUvH4VfakaNaizA9F5jbY
	 coahfxplWoeq+U1DYNp2X29Sxuzji8FecXbyXkbbgUIVhig/VBQVfyo7mPfsOZDap7
	 Fb+zuvE3tZr4VKxWbhzPTrABs4s0TnkhRA/PH990Yo1YXBhZ5nyY6+152BSg6ipfGQ
	 vord3zCxPa32VE1ofSuPWCI3wrXrcjG+DWsMHLRchT6jYIB6eRUtHJcaFj5Dr5QO0M
	 ryPgut3T/Q6rA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: media: add ITE IT6625/IT6626 HDMI
 bridge binding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hermes Wu" <Hermes.wu@ite.com.tw>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260720-upstream-it6625-it6626-v1-1-475912f74459@ite.com.tw>
References: <20260720-upstream-it6625-it6626-v1-0-475912f74459@ite.com.tw>
 <20260720-upstream-it6625-it6626-v1-1-475912f74459@ite.com.tw>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 08:06:34 +0000
Message-Id: <20260720080635.6BBBE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Missing schema constraint for 'bus-type' across IT6625 and IT6626 v=
ariants.
--

--- Patch [1]: [PATCH 1/2] dt-bindings: media: add ITE IT6625/IT6626 HDMI b=
ridge binding ---
commit 0c73fe488fb2529ba9b003362cc54eefde27f9f8
Author: Hermes Wu <Hermes.wu@ite.com.tw>

dt-bindings: media: add ITE IT6625/IT6626 HDMI bridge binding

This commit documents the devicetree binding for the ITE IT6625 and IT6626
HDMI to MIPI CSI-2 bridge devices. It defines the required properties,
including up to two selectable CSI-2 output ports.

> diff --git a/Documentation/devicetree/bindings/media/i2c/ite,it6625.yaml =
b/Documentation/devicetree/bindings/media/i2c/ite,it6625.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ite,it6625.yaml
[ ... ]
> +      port@0:
[ ... ]
> +        properties:
> +          endpoint:
[ ... ]
> +            properties:
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +
> +              bus-type:
> +                enum:
> +                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
> +                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY

[Severity: Low]
The commit message mentions that IT6625 only supports D-PHY, while IT6626
supports C/D-PHY. Does this unconditional enum allow C-PHY to pass schema
validation for the IT6625? Should there be an allOf / if-then conditional
block restricting the bus-type to 4 for the ite,it6625 compatible?

Additionally, since the IT6626 can use either PHY, should bus-type be made
a required property when ite,it6626 is used to avoid ambiguous driver
configurations?

> +
> +              clock-noncontinuous: true
> +              link-frequencies: true
[ ... ]
> +      port@1:
[ ... ]
> +        properties:
> +          endpoint:
[ ... ]
> +            properties:
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +
> +              bus-type:
> +                enum:
> +                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
> +                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY

[Severity: Low]
Would the same constraints and required properties for bus-type need to be
applied here for port@1?

> +
> +              clock-noncontinuous: true
> +              link-frequencies: true
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720-upstream-i=
t6625-it6626-v1-0-475912f74459@ite.com.tw?part=3D1
