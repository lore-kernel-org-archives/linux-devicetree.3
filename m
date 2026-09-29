Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC973DDAFC
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 22:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790722294; cv=none; b=j2niPmj9R75QyC3eWwH+4GwBxfFz+U9lKMOXdIJ6CFE8rXhdraCl6j3XImTwLDaBCihaORvuyts+n2a0s8iNkT8lWcSvuUgOTCzXUUUmnUZLu7HF6vzLgwohNVt9/lgNpT6o67THdkwIimgHmOgdbC4KCejKcYuFNlLnEUMY5SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790722294; c=relaxed/simple;
	bh=7o5Mwg8q+AchHgDxWFy+dV4wt6jAaJ/+tmu2JzL9Bso=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UUmKTuLRsjCquIZ2JeWNgITWVSAdFqzW0WRfw1YWP7fIXHrZrJnewZRf31/dfaaN8ri9uoSmqiAfCJ6DNgwWSJhF4+TiAIs9kUq+GQzahR7wAaJeV5zFfGDToRvmGD4Al+2SpfwB546Pw5ss009aOS7UowL7jJSBJX58yEPpBJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=krhjbm+G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="krhjbm+G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C75511F000FF;
	Tue, 29 Sep 2026 22:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790722293;
	bh=Bsb4H8W8tIK72HeOYuZY4U57Yzq4m6LbdjuxKgUfI88=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=krhjbm+G0Pu3+UJuVXAchTTtgoHRkkNn8IY/JXueUqI3fu16D+ob7REnL5jnF2tVm
	 kn+QJ7guZ1r0Si5BzyXFCZd7sOXtyC03IBtJu5eKzDb3KBd5G7Kxk7WIB9iKJEQ5k/
	 +1KWcGD4UofCdFgGq0iHlGW+mWg2F28yDQhQ2mlMSu6ETSdVg7sl16QcsypvH6bIpo
	 0/jvTJWBmv4fNy+X7fLogzcfYWo0WgFe5n0DMr7YddnWJD/THSDOD7qtBJqLucr44/
	 NDqiq5VSdxkB/GV2SM5Nke2cfe5XV9QV8//8kbW/SgY9UX/61RmilKDA5MTRMaVEqc
	 7WgmqVCHGRL3Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v18 12/23] dt-bindings: media: i2c: add MAX9296A,
 MAX96716A, MAX96792A
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dumitru Ceclan" <dumitru.ceclan@analog.com>
Cc: robh@kernel.org, media-ci@linuxtv.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260930-gmsl2-3_serdes-v18-12-43117818f499@analog.com>
References: <20260930-gmsl2-3_serdes-v18-0-43117818f499@analog.com>
 <20260930-gmsl2-3_serdes-v18-12-43117818f499@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 22:51:32 +0000
Message-Id: <20260929225132.C75511F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: validation bypass via endpoint@X naming
--

commit a82d316b34b24310779166fe2f87bfb5386cac5d
Author: Cosmin Tanislav <demonsingur@gmail.com>

dt-bindings: media: i2c: add MAX9296A, MAX96716A, MAX96792A

The patch introduces a new device tree binding for the MAX9296A, MAX96716A,
and MAX96792A GMSL2/3 to CSI-2 deserializers. It defines the required device
properties, I2C alias pools, and endpoint graph layouts for inputs and
outputs.

> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max9296a.y=
aml b/Documentation/devicetree/bindings/media/i2c/maxim,max9296a.yaml
> new file mode 100644
> index 0000000000000..de6bfcec5dc63
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9296a.yaml

[ ... ]

> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    patternProperties:
> +      '^port@[0-1]$':
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: GMSL Input ports 0-1
> +
> +      '^port@[2-3]$':
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: CSI-2 Output ports 0-1
> +        properties:
> +          endpoint:

[Severity: Medium]
Does defining constraints under the literal endpoint key allow a validation
bypass for unit-addressed nodes?

Because the port@[2-3] block references /schemas/graph.yaml#/$defs/port-bas=
e,
the generic port-base schema evaluates both the literal endpoint node and a=
ny
^endpoint@[0-9a-f]+$ nodes. If a device tree defines endpoint@0, it will
satisfy unevaluatedProperties: false, but the local schema block skips it
entirely. This silently allows invalid or incomplete node configurations
(e.g., missing the mandatory data-lanes property) to pass dt_binding_check.

Would it be better to apply constraints using
patternProperties: "^endpoint(@[0-9a-f]+)?$", or explicitly map
^endpoint@[0-9a-f]+$ to false if only a single unaddressed endpoint is
intended here?

> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +
> +              lane-polarities:
> +                minItems: 2
> +                maxItems: 5
> +
> +              link-frequencies:
> +                maxItems: 1
> +
> +            required:
> +              - data-lanes

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260930-gmsl2-3_se=
rdes-v18-0-43117818f499@analog.com?part=3D12
