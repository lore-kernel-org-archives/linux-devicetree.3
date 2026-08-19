Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDECC4229A2
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 09:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787130746; cv=none; b=AGoIHdo0nfvLIl2J9pBxLc1CbbXykpyFqEgFXzFMHHIHeGmMqjKtPpo4d3jqYfPz5v2ABuelCwowM3MS943x7+XGTeyHg+giNJJPZtwOt4ukjAUGnKs0nkFFMtThTnaoNOgYjmyPWNK+SEYAaEL3QNGxiM4vynCQ+LJj8krvTcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787130746; c=relaxed/simple;
	bh=bPvao07jXXHrIESa4XuYZ+bLZLgiBMpll7dhN04y32I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ECf8s7LsVgEw4brpGLhLB/KXZaE4bJuTRopFuEYASbYZPjSYnJC5L58g1H35fOtklsZF+Nsuz8gnmlmAKk5l2yZSSd2SL64o2bZ45AX8kFba1l8KwfupNqFrle5lqd5UVLkcVhtEuVd7q50MnojABolcYAdNBdlamj5IkeK6Q0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YidpD0ph; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YidpD0ph"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55B1A1F000E9;
	Wed, 19 Aug 2026 09:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787130744;
	bh=8M/t2zl8VqhusERK9JRe4fe87i73qvHuccBmBw2HX0k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YidpD0phALGbugJ5aZtFgZJh6YHR4gMucPrAcDh8iphWxgY9vOZu9eGWeVjHRs/ZH
	 V3Jn5uXbmqmKhciLpKNSJMDrX7boOP3yv3D13eb4Lr0RafqYP9en8lfpzuqhx6agPW
	 NFPhlaeHjbpS5puycJ1Yfh5yfbUUKzBpAAfBcTHv5PDSA1WoEu0dzEcuaq65tWUeYA
	 gdmMPcX6R7OEuh3qobpgSC8q/A31yoUDkJXZaSiMCkl5Fq30odm49mmD0N35KuttNh
	 /Z7X7o4iN3cyMb/tLriiDVvry1Q1pxwARbZSeolwP5+61rs7R2eepjZmxq8WxL4jf/
	 eto00H6vX1dGw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: riscv: firmware: Add OpenSBI configuration
 binding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yaxing Guo" <guoyaxing@bosc.ac.cn>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260819090411.18561-1-guoyaxing@bosc.ac.cn>
References: <20260819090411.18561-1-guoyaxing@bosc.ac.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2026 09:12:23 +0000
Message-Id: <20260819091224.55B1A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Low] The `maintainers` field in the YAML binding is empty, which causes =
dt_binding_check to fail.
- [Low] The `cold-boot-harts` property lacks an items definition for the ph=
andle-array, leading to schema validation failures.
- [Low] Undefined phandle reference `&cpu0` in the example block causes a d=
tc compilation error.
- [Low] The `opensbi` vendor prefix is used in the compatible string but is=
 not documented in `vendor-prefixes.yaml`.
--

--- Patch [1]: [PATCH] dt-bindings: riscv: firmware: Add OpenSBI configurat=
ion binding ---
commit 522fb80721bbecd24711af44482fc30a1ca8189e
Author: yangyinglu <yangyinglu@bosc.cn>

dt-bindings: riscv: firmware: Add OpenSBI configuration binding

This commit adds a Devicetree binding for OpenSBI configuration data in the
chosen node. It documents the opensbi,config compatible string and the
cold-boot-harts property used by the firmware during the boot phase.

> diff --git a/Documentation/devicetree/bindings/firmware/opensbi,config.ya=
ml b/Documentation/devicetree/bindings/firmware/opensbi,config.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/firmware/opensbi,config.yaml
> @@ -0,0 +1,38 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/firmware/opensbi,config.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: OpenSBI Firmware Configuration
> +
> +maintainers:
> +
> +description: |

[Severity: Low]
Is this missing a maintainer email? The YAML parser evaluates the empty
maintainers field as a null value, which violates the core.yaml meta-schema
constraint and causes make dt_binding_check to fail immediately.

> +  OpenSBI configuration data passed in the chosen node.
> +
> +properties:
> +  compatible:
> +    const: opensbi,config

[Severity: Low]
Should the opensbi vendor prefix be registered in vendor-prefixes.yaml?
Because this prefix is not registered, device tree tooling will emit an
unrecognized vendor prefix warning during validation.

> +
> +  cold-boot-harts:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description:

[Severity: Low]
Does this phandle-array need an explicit items constraint to indicate the
phandle entry takes zero arguments?=20

Because cold-boot-harts is a phandle-array with a non-standard name,
dtschema will implicitly require the target cpu node to have a
#cold-boot-harts-cells property. Since CPU nodes do not define this,
validation will fail for valid device trees.

> +      List of hart CPU nodes selected as cold boot harts by OpenSBI.

[ ... ]

> +examples:
> +  - |
> +    / {
> +        chosen {
> +            opensbi-config {
> +                compatible =3D "opensbi,config";
> +                cold-boot-harts =3D <&cpu0>;

[Severity: Low]
Does the example block need a definition for the cpu0 label?=20

When make dt_binding_check extracts and attempts to compile the example, it
will fail with a fatal reference to non-existent node or label error from
dtc since cpu0 isn't defined anywhere within the example.

> +            };
> +        };
> +    };
> +...

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260819090411.1856=
1-1-guoyaxing@bosc.ac.cn?part=3D1
