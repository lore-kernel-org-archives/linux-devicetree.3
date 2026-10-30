Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793336029;
	b=PgsDCzP9/IIkMUr/78U+WPVGFVCIl+4hikvEL8UFsbAxgkMNxdBi4Y3Q8gdiH1V1XAqL
	 hm12fqJ+g4P5yhW3oZsbq+3GzphBJbQp81M0vfdDOFj2WMBdQIf56XQQpVIexiRdzyFiu
	 IE+/O6tO02mDRq+gnOy874O2gxzK9j7aS2WU3qDGqv6taOxMLX2Om92Emj8HUHXXyPx/q
	 wkt2//ZMok7KEYh/khZC9QT/+wFaY7NF6wzuLyFbsyyR0/lzDYHLGb52zbuCthdu3ftZy
	 +4of43IP8nzVy+Sae5KCd/WZfZ72B05idZYyGjXZbJmylbg2NtN8jZKkjQZrU8k1a4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793336029;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ookrln6fc3m4sMzxgfzHoMrnkI/a/is0sqTGDRh1rHg=;
	b=PBTsJ3i8F6Hq+EVfOai9uVnhBYiHtXGDTMAMUYbzSbzYjRFkE+W7crSVgsMm3M8gTiZq
	 rmJ2utLkrC8rYuJlk6r1iVrIihUowRCcYcsfaQsbeyQoKxqG0iiQAlcE6UhXr05UwIBTC
	 QQvLUCgkEoa21TGgQ4vl9Z0EIsORxBrDbgtz2dXa4ixZfbdCdisSNez5s+tb6FsJvzmNS
	 6S3mPZSJxSmU3BQJpU0I291ywbVNsi7eBKU52vEDiBsiMKdzB4wYH1RdBIzMgOp+9FZOG
	 m32M5gISoG61w46930zZt07GIPJQ0WVSutRvzrPZk7RcEuwbhbK9Mz2lyHKVj0OI97g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="SYYUL/zK";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F78606A326
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 04:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SYYUL/zK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 352891F000C1;
	Fri, 30 Oct 2026 04:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793336029;
	bh=ookrln6fc3m4sMzxgfzHoMrnkI/a/is0sqTGDRh1rHg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SYYUL/zK7QUJjmuMrkjWpssFQL5sKVLW8pz14iQ5tg9S/slggunqTfCIBSzpUE3k7
	 /Xu1wdrlTPMrI0iNTZ4CacsGagGPLUofAfctt6sO5ZObrpiZ1usdVm9bFoGyPefG1+
	 v4k847taEdpiDf5YtiDBrJ1xj1Euv3l+12IzMwzTPEz18X/RGZXL5mgnaTHBgNIZr8
	 jlCZ4gYBJ5rsdzYzkVKgo6fGZ+Oel5dRWWpANaA9W2HGX2INhr4GtSShbadxQiKP2U
	 WuWbUVA6UMfkfRUajFfVD6PfXXqX16PJdYM2xX4l0OSYbB3/K9P9rH5XoqevUL3HGB
	 o70cJxU7el76Q==
Message-ID: <sashiko-outbox-190361@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 01/10] dt-bindings: net: airoha: Add EN7581
 ethernet-ports properties
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lorenzo Bianconi" <lorenzo@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260507-airoha-eth-multi-serdes-v4-1-af613b61ae02@kernel.org>
References: <20260507-airoha-eth-multi-serdes-v4-1-af613b61ae02@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 04:53:48 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The `ethernet-port` subnode schema strictly rejects standard Ether=
net configuration properties, preventing functional device tree definitions.
- [High] The `if` condition matching the `reg` property uses an invalid sch=
ema structure, causing the condition to silently fail and incorrectly rejec=
t `ethernet-port` nodes.
--

commit 72efd994288c48f80a1fe4d15ff7c3fd115c30a4
Author: Lorenzo Bianconi <lorenzo@kernel.org>

dt-bindings: net: airoha: Add EN7581 ethernet-ports properties

This commit introduces the ethernet-port property to model multiple
net_devices connected to the same GDM3 or GDM4 port on EN7581 and AN7583
SoCs. It updates the airoha,en7581-eth binding to allow external
ethernet port IDs on specific MAC ports.

> diff --git a/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml=
 b/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
> --- a/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
> +++ b/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
[ ... ]
>      allOf:
>        - if:
>            properties:
>              reg:
>                items:
>                  - enum:
>                      - 3
>                      - 4

Does this condition correctly match the reg property? In dt-schema, the reg
property is evaluated as a matrix (an array of arrays). Using items: - enum:
with integers attempts to match the first element (which is an array) again=
st
an integer, which will always evaluate to false.

Because this condition silently fails, the then clause below is never appli=
ed,
and device trees using ethernet-port nodes on MAC 3 or 4 will fail validati=
on.
Standard bindings typically match specific reg values using an enum directly
under reg, or by differentiating compatible strings.

>          then:
>            patternProperties:
>              "^ethernet-port@[0-5]$":
>                type: object
>                unevaluatedProperties: false
>                description: External ethernet port ID available on the GD=
M port
> =20
>                properties:
>                  compatible:
>                    const: airoha,eth-port
> =20
>                  reg:
>                    maxItems: 1
>                    description: External ethernet port identifier

Will this strict schema reject standard Ethernet configuration properties?

Since unevaluatedProperties is set to false and only compatible and reg
are defined, any device tree attempting to configure essential networking
properties (like mac-address, phy-handle, or phy-mode) for these ports
will fail validation.

Should this subnode include a reference to
/schemas/net/ethernet-controller.yaml# to permit functional networking
definitions?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260507-airoha-eth=
-multi-serdes-v4-0-af613b61ae02@kernel.org?part=3D1
