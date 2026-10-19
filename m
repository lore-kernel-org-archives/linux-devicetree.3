Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95E62C0F6D
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 01:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792374830; cv=none; b=jRv2EHMlplhS+Ixdv/aYFakp/gQmkWfa8udgwI7bys1NCIaI98W+zv9KGsaaOaDtjG1uoZRyNORx9K6Iu1Kjqe0bYM4Meqpcd9RBTUs/jrWWZsK0LCLY7ao+FFnAkZ+5g0tLVUwL/M6EwnLhXQztbBdRanF5sFmTWvypImQYR70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792374830; c=relaxed/simple;
	bh=sceayMJOJl2vYwm9WfEh+1h0HSQT5BFe6jvFV3tBF8Y=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=EUDRuKWnloVxAs7xh4trXOUJkh7maOXQ0xzbE9ojoVGlvlpo02eYjk0scvyvsjv1RbbZQWixtxkRBkXAEz/N6STwktBS2gD3iJZ/ZA1EokAsfeIhy8CRH1Gih7jHq7wWpky2fdgUjtVDuizC/OVGXM1IxhhGKFwGHbiw6mAtt/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a5Dup/d3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a5Dup/d3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29EAA1F000C4;
	Mon, 19 Oct 2026 01:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792374829;
	bh=tN373339tP+uSbckQ0CQv+WXxwyQKB2MrEUEno5h3Jo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=a5Dup/d3gWJlW9M5pbUgyFnFFwy+qS8YQn723hHOBD6dGtDUPnf4AStjbtQs/Q0ep
	 nA9iNLcjEx309leZjoGS91bpM4h/MVvHRARW0xsmMZHW5s9X+xppfFQdaNZHnjTbPM
	 gDz0QadB7+oc2ucCbbtEcxDKrnnDkZlhTaTRJ4iwFrTFB8hkadIiKLN3EwKaBHk+on
	 zLmlOCLllVFI1gJmLcdXtGKEZ63jkuIPVFIdYZM1hifaeSWmpYhVaMd3qXsk5CjXfK
	 jnDtdGuCZwcKipMyTQyABAnX17lSryQ/BABk15mtERZf+OrPDuEVqm5pJpWUYGnk2N
	 XFXtzDXW/EA9A==
Message-ID: <sashiko-outbox-176511@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/2] media: dt-bindings: imx908: Add Sony IMX908
 sensor
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lachlan Michael" <lachlan.michael@sony.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261019014720.2635-2-lachlan.michael@sony.com>
References: <20261019014720.2635-1-lachlan.michael@sony.com>
 <20261019014720.2635-2-lachlan.michael@sony.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 01:53:48 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: media: imx908: additionalProperties: false blocks a=
llOf schema
--

commit ff8a8181af73cacaf3f8a03e0acde33eb53bb18b
Author: Lachlan Michael <lachlan.michael@sony.com>

media: dt-bindings: imx908: Add Sony IMX908 sensor

This commit adds device tree bindings and a MAINTAINERS entry for the Sony
IMX908 8.39 megapixel MIPI CSI-2 CMOS image sensor.

> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx908.yaml=
 b/Documentation/devicetree/bindings/media/i2c/sony,imx908.yaml
> new file mode 100644
> index 0000000000000..828db1175e2f5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx908.yaml
> @@ -0,0 +1,108 @@
[ ... ]
> +allOf:
> +  - $ref: /schemas/media/video-interface-devices.yaml#
> +
> +properties:
> +  compatible:
> +    const: sony,imx908
[ ... ]
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - dvdd-supply
> +  - ovdd-supply
> +  - avdd-supply
> +  - port
> +
> +additionalProperties: false

[Severity: Medium]
Should this be unevaluatedProperties: false instead of
additionalProperties: false?

Because the schema references /schemas/media/video-interface-devices.yaml#
in allOf without listing common properties such as rotation, orientation,
lens-focus, or flash-leds under the local properties block, using
additionalProperties: false will cause dtbs_check to reject any
sony,imx908 node that uses those inherited properties.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019014720.2635=
-1-lachlan.michael@sony.com?part=3D1
