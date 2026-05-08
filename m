Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D393C1F
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 22:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778280594; cv=none; b=ar9rlFUZgVgGBCwqQAA25x5WIqfKgwQVUmxlppqkCX9mheaIriv3lDnn5IAsmzYGR1odO+DC0YkjPUnsaKccVSMMu0pzA+hn+UqNExa9vt6ITa5pJUmD0Me5jI8PRmvShzut3RKnpToB1cdIvRkXO2lE9f42/QRnpTqc9sOR2Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778280594; c=relaxed/simple;
	bh=w/QKq7YXRRGy9tJ596FRx/hkdGowIO9SpHCuGJOICXo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XaAHYTeeFRiLCjhoF2rfUzLsDtTlAAkAspp8p3TecLw6CjoqzyJaBbkBnkhcDwxWl1rEcFiwUN6F+/+A6P0MCPMiPR9OFehFjeiqQOMSy3IHke/SOWSG8yI+nYuyEjgySyBW9AydPAvIMjKhbGm9Vv4QXDiYoJSjDY/uBdPHi7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T3SEmqbp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T3SEmqbp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BD7BC2BCB0;
	Fri,  8 May 2026 22:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778280594;
	bh=w/QKq7YXRRGy9tJ596FRx/hkdGowIO9SpHCuGJOICXo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=T3SEmqbpDWuOs3cF2+dWgBMAGtOivmjrZKeBpOB6yQ7GoB1ivsQyqVlHe+h+UhYc2
	 Ku7B4RMu8Z1kAtnr76ylJtr+5swqzD6NZIkQamQwueKm0UXtLogg15Gaa6DO02REBn
	 nUhBTg6LUjNv/deAtfyMWcyRKLiO8CSqn4zRy8B/8rpcZ0OfubMY6u53qawBTFVGtp
	 udTd6otfd4n4U6JiPkXYZ09v378GUQwijNKIrADIfpXWMBbBrtd5IyU2qFgxMWroFC
	 d8F3jtkt776Z+CRCsow4qH8S93s0ILlF+bL0Avl6n2l3EmTY0+39YS7mf/GYrsWBoW
	 s8FN/HnQ6Xy7g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] dt-bindings: pwm: stmpe: drop legacy binding
Reply-To: sashiko@lists.linux.dev
To: "Manish Baing" <manishbaing2789@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260508184626.15938-1-manishbaing2789@gmail.com>
References: <20260508184626.15938-1-manishbaing2789@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 08 May 2026 22:49:53 +0000
Message-Id: <20260508224954.7BD7BC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Incomplete Schema Migration / Missing Required Property Constrai=
nt
--

commit 652bd7fb646323b7de60d7d1fdac5400a5920f24
Author: Manish Baing <manishbaing2789@gmail.com>

dt-bindings: pwm: stmpe: drop legacy binding

The commit drops the legacy text binding for st,stmpe-pwm as it is allegedly
covered by the mfd schema st,stmpe.yaml.

> diff --git a/Documentation/devicetree/bindings/pwm/st,stmpe-pwm.txt b/Doc=
umentation/devicetree/bindings/pwm/st,stmpe-pwm.txt
> deleted file mode 100644
> index f401316e0248b..0000000000000
> --- a/Documentation/devicetree/bindings/pwm/st,stmpe-pwm.txt
> +++ /dev/null
> @@ -1,18 +0,0 @@
[ ... ]
> -Required properties:
> -- compatible: should be:
> -  - "st,stmpe-pwm"

Does dropping this file remove the only place enforcing the compatible stri=
ng
as a required property?

Looking at Documentation/devicetree/bindings/mfd/st,stmpe.yaml, the pwm
subnode defines the compatible property but omits it from a required
list, unlike the touchscreen or keyboard-controller subnodes:

  pwm:
    type: object
    $ref: /schemas/pwm/pwm.yaml#

    unevaluatedProperties: false

    properties:
      compatible:
        const: st,stmpe-pwm

      "#pwm-cells":
        const: 2

Without this text binding, a device tree node lacking the compatible string
will silently pass dt_binding_check schema validation.

It would then fail to probe at runtime because mfd_add_devices() relies on
matching the compatible string to map the device tree node to the instantia=
ted
child device.

Could the yaml schema be fixed by adding compatible to a required list in t=
he
pwm node before or in the same patch series as dropping the text binding?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260508184626.1593=
8-1-manishbaing2789@gmail.com?part=3D1
