Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242EC22A4EE
	for <devicetree@vger.kernel.org>; Sat, 26 Sep 2026 21:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790459955; cv=none; b=Ad5y3LVJlZAxCi+wcbYf/cyNVsLkfGnuwrAfj2l5kqT+xydcCeYWue34qSGODppL9vknr6tP27jRrSg22JtJiRwyfSetlpsWvm0W+hrRna/D5XAVkasm5Dx66xHlssw+kB/+4NHyoD+L+DIJCTEZk/1n/9kDJwfWbDdK1xFWiEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790459955; c=relaxed/simple;
	bh=zNC9y+CbJK+cousSA48K9W0OJ9hTEeB80RouYIuJ0RE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Cj5l/1Ni8R+ETVOcdgdplPlf/+i7DnycMCt+a6/X2uxrq+SW47BsG0Ngkka7VDhBoT4AEEf4ubqQX1HBM/KkMBt2SaYuroDfjdd+pDSjv9mg/3GpXga3cIMit9J2kvLFzRrCXY/GPSMP9cCzmRedaQR+m58XoVVjQ8PjiCvSp28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HeWhCQxt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HeWhCQxt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A8531F000FF;
	Sat, 26 Sep 2026 21:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790459953;
	bh=oO+wnKvoioyctiry8uICEsnMnlDl5ekL9SFnUc2PcVI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HeWhCQxtSFGn2u0FLeglU09+X+73J681sFn966tmdYwq6bRDD2aKuGydDp+qHZz3b
	 aTci69VOH9zezZrf58ufbxJ2CmEVJSJz7ScZNcdQgn9uIhAVK/9493A7jtOnJafFWx
	 p/x6IB9xwR2d2+e5XWXWVByFbQkkc8gelosNDPvLYaiKkeGX063UDPPrGNXq7xQ4jI
	 maQoqGGw7r6LvqDT5+kPR2lLQ/YgN2bn4Bl+d1KymVQhOUikUcdml0kEUKLbAQhiXs
	 uIzwyIIFDmVvpblDcO13YSlzDrdqOOxAk0G8Vwu6PYSJfUWbcXBOzqJIrQsWziJGoW
	 +qM62xU9U3GwA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next] dt-bindings: net: Convert HiSilicon hns-dsaf
 to DT schema
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?Um9iIEhlcnJpbmcgKEFybSk=?= <robh@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260925215848.2949157-2-robh@kernel.org>
References: <20260925215848.2949157-2-robh@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 26 Sep 2026 21:59:12 +0000
Message-Id: <20260926215913.6A8531F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Medium] dt-bindings: net: hns-dsaf: mismatched reg and reg-names constra=
ints
- [Medium] dt-bindings: net: hns-dsaf: additionalProperties breaks port $ref
- [Medium] dt-bindings: net: hns-dsaf: missing desc-num and mc-mac-mask con=
straints
- [Medium] dt-bindings: net: hns-dsaf: buf-size and desc-num missing from r=
equired
--

commit d12acf31486c73a836f5b1585aaa908d8317c9a2
Author: Rob Herring (Arm) <robh@kernel.org>

dt-bindings: net: Convert HiSilicon hns-dsaf to DT schema

This commit converts the HiSilicon hns-dsaf binding to DT schema format. It
drops the unused phy-handle at the top level and adds the undocumented
media-type property.

> diff --git a/Documentation/devicetree/bindings/net/hisilicon,hns-dsaf-v1.=
yaml b/Documentation/devicetree/bindings/net/hisilicon,hns-dsaf-v1.yaml
> new file mode 100644
> index 0000000000000..4edc6cafcbed3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/hisilicon,hns-dsaf-v1.yaml
> @@ -0,0 +1,168 @@

[ ... ]

> +  reg:
> +    minItems: 1
> +    items:
> +      - description:
> +          external interface control register base and size (optional, o=
nly
> +          used when subctrl-syscon does not exist)
> +      - description:
> +          SerDes base register and size (optional, only used when serdes=
-syscon
> +          in port node does not exist)
> +      - description:
> +          PPE register base and size
> +      - description:
> +          DSA Fabric base register and size (not required for single-por=
t mode)
> +
> +  reg-names:
> +    minItems: 1
> +    items:
> +      - const: ppe-base
> +      - const: dsaf-base

[Severity: Medium]
Does this create a mismatch between reg and reg-names constraints?

The reg property is defined as a 4-item list with the first two items being
optional, while reg-names only permits 2 items (ppe-base and dsaf-base).

Due to positional schema matching, if a 2-region configuration is provided,=
 it
might erroneously match against the first two reg descriptions instead of
PPE and DSA Fabric. Additionally, valid 4-region configurations will be
rejected because reg-names restricts the list to 2 items.

[ ... ]

> +  buf-size:
> +    description: RX buffer size (bytes)
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  desc-num:
> +    description: number of descriptors in TX and RX queue
> +    $ref: /schemas/types.yaml#/definitions/uint32

[Severity: Medium]
Did this conversion drop the enum constraint for desc-num?

The original text binding enforced explicit enum values (512, 1024, 2048,
4096) which appear to be missing here.

[ ... ]

> +patternProperties:
> +  "^port@[0-5]$":
> +    description: DSA Fabric port node
> +    $ref: ethernet-switch-port.yaml#
> +    additionalProperties: false

[Severity: Medium]
Will this additionalProperties validation break inheritance from the
referenced ethernet-switch-port.yaml# schema?

In dt-schema, combining a $ref with additionalProperties: false causes all
properties defined in the referenced schema to be rejected unless explicitly
redefined. Should this be unevaluatedProperties: false instead?

> +
> +    properties:
> +      reg:
> +        maximum: 5
> +
> +      phy-handle: true

[Severity: Medium]
Is phy-handle: true added here as a workaround for the inheritance issue
mentioned above?

Since phy-handle is defined in the referenced schema, it should be inherited
automatically if unevaluatedProperties is used instead.

[ ... ]

> +      mc-mac-mask:
> +        description: multicast MAC address mask
> +        $ref: /schemas/types.yaml#/definitions/uint8-array
> +        maxItems: 6

[Severity: Medium]
Can this allow arrays of invalid lengths?

The original text binding expected a 6-byte size for the MAC mask.
Without minItems: 6, shorter arrays (e.g., 1 byte) might pass schema
validation.

[ ... ]

> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts
> +  - mode

[Severity: Medium]
Should buf-size and desc-num be included in this required block?

The hns_dsaf_main.c driver strictly requires both properties, failing probe
with -EINVAL if either is missing from the device tree node. Omitting them
here means incomplete device tree nodes will pass schema validation but
silently fail at runtime.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260925215848.2949=
157-2-robh@kernel.org?part=3D1
