Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1EE53612E3
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 16:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784307082; cv=none; b=f0VSxZ1x40kb8TKEIBPRQ/ZN/o//ZrfbuYounMudbEePOuCuNgigoHlpiOQ+M2C09Ak+hfWH9DQ+4zjjcNmwQFkt2AIIzRkCRagOzvJTphnsxjXait3XsPWaAvhjd+3RYjQn62VktxzgAlHr4xzrsflF8SGHupBLsgEOEAiGlvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784307082; c=relaxed/simple;
	bh=a8cvGY8ilG9e+FHLJ2VWC2ZHIEL8G2rzHhRA+HhDuw8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uOF/nJN2qDZt4G6oOftS69Ii4m6V/qHXLwc4F9yRkXjhLIuH5WKh0GuEhW8B8pXrDW3OXodhNWgERKJ/H/Hkxl99liVPxVgmWC2HYs85tT78HPf4kUx7ebwtzYLE1UbXSTly5GEecs3OqKie7NpIVo4ay1PqgyYsKK4Svc7f5uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JNxITaAv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JNxITaAv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7505E1F000E9;
	Fri, 17 Jul 2026 16:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784307081;
	bh=VZHcioq/1OMSvtUlcc90o9tBd4zFvKym7BAzLfvSICg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JNxITaAvU7ZkyGdquufnaUKxaC8bkIR5ZJb2PR/GG/H5Az92HlhmJQETYBm3O0rX3
	 ClZeLJbZrWlP4NwWItCdIoZla12MN5Hbxq0qE2Q4gdw8z28Ttg6ZE13ipNx2/e9/ZQ
	 xCcxRm8+mgTmjIUJ/AKzKZlHt0NESdCxwNPlzmJfStx7JjYY3rLM/lKrAxo5jc7pWE
	 pYmuoQT7DuoEBLFVoQIDBMy782cMgwcqpv3IA23r7Jgxht3oNJWSKUkhdud0aAI0j+
	 b3NylLyIxkhIleeicaqemTTExngBEJuYC0ECTrejcTZ/lHuxy2IooDQqoRBFAuXRSF
	 Lkp94QvwIDzLA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/7] dt-bindings: clock: Introduce nexus nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TWlxdWVsIFJheW5hbCAoU2NobmVpZGVyIEVsZWN0cmljKQ==?= <miquel.raynal@bootlin.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260717-schneider-v7-2-rc1-eip201-upstream-v4-1-751547e160e5@bootlin.com>
References: <20260717-schneider-v7-2-rc1-eip201-upstream-v4-0-751547e160e5@bootlin.com>
 <20260717-schneider-v7-2-rc1-eip201-upstream-v4-1-751547e160e5@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 16:51:20 +0000
Message-Id: <20260717165121.7505E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The clock nexus node schema omits standard nexus properties (`cl=
ock-map-mask`, `clock-map-pass-thru`) and `#clock-cells`, breaking schema v=
alidation.
- [Medium] The binding schema entirely omits the mandatory `examples` secti=
on.
--

--- Patch [1]: [PATCH v4 1/7] dt-bindings: clock: Introduce nexus nodes ---
commit f0afb8c47352e777825bd7597a7b17705e20153d
Author: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>

dt-bindings: clock: Introduce nexus nodes

This commit introduces a new device tree binding for clock nexus nodes
to allow remapping of clock specifiers. It defines the clock-map property
but explicitly defers examples to the existing PWM nexus node binding.

> diff --git a/Documentation/devicetree/bindings/clock/clock-nexus-node.yam=
l b/Documentation/devicetree/bindings/clock/clock-nexus-node.yaml
> new file mode 100644
> index 0000000000000..ff3283bd5fb11
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/clock-nexus-node.yaml
[ ... ]
> +properties:
> +  clock-map:
> +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> +
> +dependentRequired:
> +  clock-map: ['#clock-cells']
> +
> +additionalProperties: true

[Severity: Medium]
The commit message states this is a literal copy-paste from the PWM nexus
node binding, but should this properties block also include the standard
nexus properties like clock-map-mask, clock-map-pass-thru, and #clock-cells?

Without these definitions and their corresponding dependentRequired constra=
ints,
schema validation won't enforce type checks on the mask and pass-thru
properties, and won't ensure that clock-map is present when a mask is used.

> +
> +# See the original pwm-nexus-node.yaml description for examples

[Severity: Medium]
Does omitting the examples section bypass the automated dt_binding_check
tests for this specific binding?

The validation tooling uses the examples section to generate test device
trees to verify logical and syntactical constraints. Providing an example
here would ensure the schema is properly tested by the build tools.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717-schneider-=
v7-2-rc1-eip201-upstream-v4-0-751547e160e5@bootlin.com?part=3D1
