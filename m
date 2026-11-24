Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795542610;
	b=aGZK0WumiLtJi+4L2sAS5BWPUJbeZp+0aO5blCfrP255FAxqJLrNl/nsg46YQShsaoJe
	 IwbU4RzFHAKA1U0zcI+pSbCMoaGccRTemKmbABOL7pXbxUwAMg8ZPDsP8R6qHAE2La4ZQ
	 c4eXwV8CZlJBSLWpio0lUPk1VJO9/4poQvJlAzRR0jERdnS9vg7LvjxpumIfGCNJ9DgzN
	 hkfg3VTQfskeCva94vdc23WHfcTfJrq8JWGIAAnzy4R592JSZK6ms19wJeyw77hpKkMmD
	 P1t8p4SOuKef7Ac4fb+qtozD9P8w8RLzGmf4T32musQCDEXfvrBxTwMH1K5n7pVbHIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795542610;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ZpvIepzLOgdv4/sQXbgkH7i+qfmMqu4dIfKSxZfLtEU=;
	b=zAOSKSronzE0kxkiq+dvueblgEAZSrhYEi4P7S1Y/EnkRUViz9lCCmkTVIFupR9qT8/3
	 H1/GJk/lFi02cD8Gqg+2TIl0u4FQfq7ojyOy+qi6PAUxWhgyEuoUKgJKbyFE82w6yBb2k
	 CeYXwDMbc3cBbCU6yAO2+csIMTFZM5YET7RcnyKOXos0cFmmumwwwDGQf6CNE50hgTZT0
	 afciwS/APJiy8M3ymQQVtlSBOIyDUwXVBOKR1ZPtccAk2UhsQI0KUitk2877LfnQEmqXh
	 WQr6jkTvpIOZUMyZoY3Wo2ljQM2X4SX7fWI9WlkydkQIaN/8pcQ2zJBT6+rCPD36yLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J3hZ1xHE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AAEC606A31E
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 17:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J3hZ1xHE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BEA61F000C6;
	Tue, 24 Nov 2026 17:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795542609;
	bh=ZpvIepzLOgdv4/sQXbgkH7i+qfmMqu4dIfKSxZfLtEU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=J3hZ1xHEKHa/Wjmk7ZOSvXexMQE724263Sxw3d+xcXCCfkc/bhZ+UyJ4DsHJkoC49
	 F6WMROOrNRQl37qxgVbExkXptQKZ0idgzR6wuOdbkeCqIzAnldmwzBku55MDHVkXzp
	 7aXGXVfw6vM8mOSLQ1W6xG6GXDDj2TvEwryAK/oVcloMUzR7MIS3q12FnZMljo/U1E
	 IcrcClHTNjf6cJZj+daGXqs5OraelRo1Dv0srDSaBUfN+Hghu4k+zVpQIv7KBlyw2N
	 43m55tUDr7roMUZk5VSk1EhyixE166643TkgypMc5vwDQLuRprnwrBxrwe/0FE1kml
	 VKDnFenewn81g==
Message-ID: <sashiko-outbox-231749@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: power: supply: Add Maxim DS28E16
Reply-To: sashiko-reviews@lists.linux.dev
To: "Armandas Kvietkus" <armandas.kvietkus@proton.me>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261124-ds28e16-v1-1-bed431df0578@proton.me>
References: <20261124-ds28e16-v1-0-bed431df0578@proton.me>
 <20261124-ds28e16-v1-1-bed431df0578@proton.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 17:50:08 +0000
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
- [Medium] dt-bindings: power: supply: maxim,ds28e16 models 1-Wire slave
  as GPIO node
--

commit e42cb4a20cd773ad55f015ac68fc65ab57afeaf9
Author: Armandas Kvietkus <armandas.kvietkus@proton.me>

dt-bindings: power: supply: Add Maxim DS28E16

This commit adds a Device Tree binding schema for the Maxim DS28E16
1-Wire battery pack authenticator.

> diff --git a/Documentation/devicetree/bindings/power/supply/maxim,ds28e16=
.yaml b/Documentation/devicetree/bindings/power/supply/maxim,ds28e16.yaml
> new file mode 100644
> index 0000000000000..b381bdf68239a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/supply/maxim,ds28e16.yaml
> @@ -0,0 +1,39 @@
[ ... ]
> +properties:
> +  compatible:
> +    const: maxim,ds28e16
> +
> +  onewire-gpios:
> +    maxItems: 1
> +    description: GPIO used as the 1-Wire data line.
> +
> +required:
> +  - compatible
> +  - onewire-gpios
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    battery-id {
> +        compatible =3D "maxim,ds28e16";
> +        onewire-gpios =3D <&tlmm 25 GPIO_ACTIVE_HIGH>;
> +    };

[Severity: Medium]
Should maxim,ds28e16 be modeled as a child node under a 1-Wire bus master
controller rather than taking a custom onewire-gpios property directly?

The DS28E16 is a 1-Wire slave device, while the GPIO belongs to the host
acting as a bitbanged 1-Wire bus master (covered by
Documentation/devicetree/bindings/w1/w1-gpio.yaml).  Per
Documentation/devicetree/bindings/w1/w1.txt and existing 1-Wire battery
bindings such as Documentation/devicetree/bindings/power/supply/maxim,ds276=
0.yaml,
1-Wire slave devices are placed as sub-nodes of their 1-Wire bus master
node so the binding reflects the hardware bus topology.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-ds28e16-v1=
-0-bed431df0578@proton.me?part=3D1
