Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794212310;
	b=a7s24OSKGTJz+SBRKzMJTR02qL8/iem4UiXyvy+Ur60o+zSwf3OvLjuSMGHJUIsB7L2x
	 PuX5aW+nHJo6x3hjiaO8r7QOt3MhbbAfVBybeHNSaQzHUqOdmr+q8QBcQyLaSbPgiUwtF
	 o5ZuiV8/ogDqc/UdhnRHqM7T6cEtDv140jXRzwGd4jGOaZgDPbhLjNDiLNif3NXmY5gop
	 rm5R2vV1Mcwpl7KJACf1a/sHk5bKeNHDqvHSTFcAu1oiTNw7GdfpSq5/609OHDQTlCDS5
	 jXRgCnD6Ztd9luOYOvkY+xZGVpuCWjXh/qEsz3KeEWHoG2ZMOkqfUGAHNSyrevWVfNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794212310;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=gYuwSh0mXK8QBupDy0dKn0J9X1QUMtXMtsm+FJwjf9w=;
	b=0Hqnl6Smjc5SY9kYuoN5swM4oQgaSRILQIiNL+b3yflVKl/vd9+EzlrbSKq5+6L7EYPL
	 6b/Jlu+FtKFQD96oqTOBnrsVSOIq0+U2o/fRjRl12U916Fc0lvj5FZJBv51TQ+Q0Y76v6
	 imRjH1DN5MbPvHAq1UxsSs2Mtp8g8qvCS/HgGuNePSIiMAe3T4ggIKbc2PfTHilgM0lBt
	 sfLvQh0JdMOAknDHDEvc+nqeLfEiqreJtQGX3BPDUyAKy6X7M4APy4f+pVLSGE9VPKej+
	 nu51CaN0VY3udlB6Oo1QDCHRfmNUyoLRC0d8PompJ5u6PmMQGOqKx6cBBmOp/Fvblyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nUFD1nm8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D9C606A322
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 08:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nUFD1nm8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 631CD1F008A4;
	Mon,  9 Nov 2026 08:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794212309;
	bh=gYuwSh0mXK8QBupDy0dKn0J9X1QUMtXMtsm+FJwjf9w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nUFD1nm8/hv/FK3VOK77sIi6UhBUvmRFh+BwqPY8lgbVj1Acq7EXYKGeawSn9e6qe
	 Ct1F/Itilfo7Kua3HWyQTtkSoBP2UJn9cszM5/66nOYeBSXJX+IbS7HVTyG+dNB62V
	 6JQliUG7KV+GW9fnKm3trVUaYW0xBMhVibOG5ClsN/cU+yCCUTbQnwSyxo4+arpmOU
	 VMe/ts3/3duXq0bdbkPuqOYDr5lbdmjlS9HH7h9mI2RO9xNoHhN4KD2z/fWQ+paaKO
	 UOayScuPuVaNfNK4U30kcQgqOJNAfxgVI1gVzl8bs7WRcYsaIBjNXzuodfDU+Apg8k
	 9KiTYDvJMIMAg==
Message-ID: <sashiko-outbox-204581@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 6/7] dt-bindings: thermal: loongson,ls2k-thermal: Add
 compatible for Loongson-2K0300
Reply-To: sashiko-reviews@lists.linux.dev
To: "Binbin Zhou" <zhoubinbin@loongson.cn>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <2a1852ad8091cde3c07b5b19f51ab35b1378a280.1794211535.git.zhoubinbin@loongson.cn>
References: <cover.1794211535.git.zhoubinbin@loongson.cn>
 <2a1852ad8091cde3c07b5b19f51ab35b1378a280.1794211535.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 08:18:28 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] dt-bindings: thermal: loongson,ls2k-thermal: unwieldy allOf
  conditionals
--

commit f12fbd90282902d144235a2ecc3e0dfbcabab2a2
Author: Binbin Zhou <zhoubinbin@loongson.cn>

dt-bindings: thermal: loongson,ls2k-thermal: Add compatible for Loongson-2K=
0300

This commit adds the loongson,ls2k0300-thermal compatible string along
with the loongson,chipid phandle property and per-variant allOf
conditionals for reg and loongson,chipid.

> diff --git a/Documentation/devicetree/bindings/thermal/loongson,ls2k-ther=
mal.yaml b/Documentation/devicetree/bindings/thermal/loongson,ls2k-thermal.=
yaml
> index 79e691b08341c..d312e27737a20 100644
> --- a/Documentation/devicetree/bindings/thermal/loongson,ls2k-thermal.yaml
> +++ b/Documentation/devicetree/bindings/thermal/loongson,ls2k-thermal.yaml
[ ... ]
> @@ -34,28 +32,56 @@ properties:
>    '#thermal-sensor-cells':
>      const: 1
> =20
> +  loongson,chipid:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to the syscon with the Loongson-2K0300 CHIP ID.
> +
>  required:
>    - compatible
>    - reg
>    - interrupts
> =20
> -if:
> -  properties:
> -    compatible:
> -      contains:
> -        enum:
> -          - loongson,ls2k2000-thermal
> +allOf:
> +  - $ref: /schemas/thermal/thermal-sensor.yaml#
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: loongson,ls2k0300-thermal
> +    then:
> +      properties:
> +        reg:
> +          items:
> +            - description: Thermal base register region
> +      required:
> +        - loongson,chipid
> =20
> -then:
> -  properties:
> -    reg:
> -      minItems: 2
> -      maxItems: 2
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: loongson,ls2k1000-thermal
> +    then:
> +      properties:
> +        loongson,chipid: false
> +        reg:
> +          items:
> +            - description: Thermal base register region
> =20
> -else:
> -  properties:
> -    reg:
> -      maxItems: 1
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: loongson,ls2k2000-thermal
> +    then:
> +      properties:
> +        loongson,chipid: false
> +        reg:
> +          items:
> +            - description: Thermal base register region
> +            - description: Thermal data output register region

[Severity: Low]
This isn't a bug, but with loongson,ls2k0300-thermal added, every
standalone variant in this binding now has its own if-then block in
allOf duplicating the reg item descriptions and differing on register
regions or loongson,chipid requirements.  Would it be cleaner to split
the diverging variants into separate schema documents, or at least
define the reg items descriptions once under top-level properties and
only narrow the constraints in the conditionals?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1794211535.gi=
t.zhoubinbin@loongson.cn?part=3D6
