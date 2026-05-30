Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF651C69D
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 00:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780102130; cv=none; b=I6uKGlSZGGcIAXnmKs0NmOXcASK64br6X9OT2IJEcx6rsPW2+QYRBqih498zIlZeZtpJOJ2ud3f7ATZ0E3P+bFKwj51BlkChR/WUNfWm/mqpU9+iuGPJt1C7NwkNm8//Z71J5dasLbfKTd1tm7w+Qsi57igBo9EVUrYjm4e9nu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780102130; c=relaxed/simple;
	bh=YKcn8fqQRDDiRp/0YOr73aeaD1+Zo+f8g7zJlOovHhA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=A97SmN5Uhdx3IuXm2qoGanD5DGFww7cP0XXl165eb2uA8A3f3ARstctr98GWDoWbMul/KCwsI+yNT+fl7PgK7BciekbS86lcOfH/CqkJoG2LTJIcXRVsCkPLoJJiYVZCpUifEOpbCtdF1EUNxXHe13AEoZfTFG4vPDFVVjRN0i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G02Hx+w6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G02Hx+w6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEA3C1F00893;
	Sat, 30 May 2026 00:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780102128;
	bh=OqOocc/fszGnTYQMJhj7QziQ8qenaQ0UwtAnLOvYvQE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=G02Hx+w6/HgKEGLaIpy2ObtxkCmZiXtEG26r4D3UsOq3lCunwDkPKcixIL3LDpLvI
	 Wa+S/ltmXA2a8wHzUOL1uRfBESFTcUrhM4Sp37w5pYVD+ZdiJ1CgyaBctEXSgMi42u
	 wPxkl1/Z4gvZGl5IL4ya2RRtZeR/sF18KOaKIc9qxQPGGJFSdNuxqAiBQ1/SJOylu2
	 uaAljenl8Dj99Vqz4hApP4DErPor2ApIR33UdB3b1/hqp/Y+knYs5yK9VhP9CJSjZG
	 XSbkfhdbjPug5X1jiSrcBzvVod9IsJxqAeiKZyLjR3j6o5sPeoXLYdeoPUx6bWBYwl
	 l0GVpcbECFpwQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v5 1/6] dt-bindings: net: Add support for
 Airoha AN8801R GbE PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Louis-Alexis Eyraud" <louisalexis.eyraud@collabora.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260526-add-airoha-an8801-support-v5-1-01aea8dee69b@collabora.com>
References: <20260526-add-airoha-an8801-support-v5-1-01aea8dee69b@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 00:48:48 +0000
Message-Id: <20260530004848.AEA3C1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `function-enumerator` property is improperly redefined to se=
lect hardware-specific LED offloading modes, violating standard Device Tree=
 semantics.
--

commit 431ddd4a15a9545434987e262ef6e5a4a8d95bfe
Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

dt-bindings: net: Add support for Airoha AN8801R GbE PHY

This commit adds a new device tree binding for the Airoha AN8801R Series
Gigabit Ethernet PHY.

> diff --git a/Documentation/devicetree/bindings/net/airoha,an8801.yaml b/D=
ocumentation/devicetree/bindings/net/airoha,an8801.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/airoha,an8801.yaml
[ ... ]
> +    patternProperties:
> +      "^led@[0-2]$":
> +        type: object
> +        description: PHY LEDs
> +        $ref: /schemas/leds/common.yaml#
> +
> +        properties:
> +          reg:
> +            enum: [0, 1, 2]
> +
> +          function-enumerator:
> +            enum: [0, 1, 2]
> +            description: |
> +              Specifies a function for offloading LED functionality to t=
he PHY:
> +              0 - No offloading
> +              1 - Link Availability
> +              2 - Network Activity

[Severity: Medium]
Does this redefine standard device tree semantics for function-enumerator?

In standard LED bindings (leds/common.yaml), function-enumerator is an
ordinal used strictly for disambiguating LED names, such as eth0:green:lan-=
1.

Since the Linux LED core unconditionally uses function-enumerator to constr=
uct
the sysfs device name, setting it to 2 to enable Network Activity offloading
might inadvertently name the LED lan-2 and create an incorrect sysfs ABI.

Could this hardware offloading be configured via standard mechanisms like
linux,default-trigger or a dedicated vendor-specific property instead?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260526-add-airoha=
-an8801-support-v5-0-01aea8dee69b@collabora.com?part=3D1
