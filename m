Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BD83DB99C
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 14:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783435501; cv=none; b=DuYQS1feKnVkl9t2Y4uSOX+xy/EyuKMC43kZ9ctfe8SI/Rmri+yvZzVfW+6RidhwiKSkolUFLsCR43mdwQMh+biqpmrIL00NURHkYmqJ7Aw/8KfCQQFlsd55T6cNzKplJFefAUQ9TVfi9K5dwUwhXIy0bHw6Bq90mOXJUvRTof0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783435501; c=relaxed/simple;
	bh=CERMEPMjusZbL65X3uabHirisDM5i+x85QV8Oyn2eG8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dxmuzDhl5ndgrsksrK5nIRfoRnK/sp8Ce4Onl4uBQt51sGXUmpji+q3kHDqCkPk0laRsxqdA0pGjbWVaUBZfmevgRDQ4uaHTExd1lhdX3jFURcaVKdS3kZOHh70KDL4/wI5N7R/PPWCcqWp377+FoXoXeQmUWuZHo4va8Oj8YYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d2uNErgO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d2uNErgO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9B411F000E9;
	Tue,  7 Jul 2026 14:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783435500;
	bh=H3qoG6JNq2e2TvpQo/JY34m9UzyY69delUAjqPRgAUo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=d2uNErgOjLzPyF9rTQ3ktsZlSmaRQVruFaUdl02Stq5NUOeVDzdHTe9G+ND8uLSoM
	 qSdiU+zA8VFWZq7TaDKsB2f7WUA9mLLdQboIHaG9MJkA84knloxKowx2LJ3vHAloiU
	 ANHtB0cVj6heE0cksbMlYsxxNBISvyVU4mvkKyrW/y5OGByntMRHPERLcDe9JrCPnp
	 QsobRYvu/W2f7s0Cw9Gutfutr3TcYGtapOWmo38nuxZ81ur0w9ACLwLWfA4yZFSTnW
	 eOR3jpydvzvru49YhMjwUQTOoazp92olELwuDgyECZY4NZzTou6f8cEagzHSgq51tO
	 r1zF5spXWvCqA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/9] dt-bindings: reset: renesas,rzg2l-usbphy-ctrl:
 Document RZ/G3L support
Reply-To: sashiko-reviews@lists.linux.dev
To: Biju <biju.das.au@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org
In-Reply-To: <20260707143646.245177-2-biju.das.jz@bp.renesas.com>
References: <20260707143646.245177-1-biju.das.jz@bp.renesas.com>
 <20260707143646.245177-2-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 14:44:59 +0000
Message-Id: <20260707144459.C9B411F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The newly added `regulators` object node is missing the `additional=
Properties: false` constraint.
--

--- Patch [1]: [PATCH v3 1/9] dt-bindings: reset: renesas,rzg2l-usbphy-ctrl=
: Document RZ/G3L support ---
commit 13d2a223ee35259aa34d58ec5e02e2fa9d54297b
Author: Biju Das <biju.das.jz@bp.renesas.com>

dt-bindings: reset: renesas,rzg2l-usbphy-ctrl: Document RZ/G3L support

Document Renesas RZ/G3L (r9a08g046) USB PHY controller bindings.
The RZ/G3L USB PHY block uses a regulators sub-node with per-port vbus0
and vbus1 entries instead of the single regulator-vbus property used
by other compatible SoCs.

> diff --git a/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy=
-ctrl.yaml b/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-c=
trl.yaml
> index c83469a1b379a..06e003218d2a8 100644
> --- a/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.y=
aml
> +++ b/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.y=
aml

[ ... ]

> @@ -50,6 +53,28 @@ properties:
>      $ref: /schemas/regulator/regulator.yaml#
>      unevaluatedProperties: false
> =20
> +  regulators:
> +    type: object
> +    description:
> +      list of vbus regulators provided by this controller.
> +

[Severity: Low]
Is the additionalProperties: false constraint missing here?

Without this constraint, device tree schema validation will silently accept
undocumented or malformed properties (like typos in vbus names) inside the
regulators node, as the parent object doesn't strictly forbid them.

> +    properties:
> +      vbus0:
> +        type: object
> +        description: Port 1 USB VBUS regulator
> +        $ref: /schemas/regulator/regulator.yaml#
> +        unevaluatedProperties: false

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260707143646.2451=
77-1-biju.das.jz@bp.renesas.com?part=3D1
