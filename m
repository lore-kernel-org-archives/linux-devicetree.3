Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792613110;
	b=trluMyMf7c9pUv95qjEUuIHmx+EOAecK3DiqV3dgW1UK4b4LqG7tDiBrxhFYxDCG9eZl
	 aiqkNgqPITte9BoeZQi615Kde40TqnW4eE+twU2MQfpJHanB+VuAQehTaFcguGdTX89ma
	 ECCvObZAND7leaLtm6pLXOy5H0wgiHHCwwAN2LvBO99atgY406K1Q01xwk+vh2/mD4wYF
	 BXPpvIZWgK9/BVF0hgQLVryLs1LxyTjH72aiY+3s/RctWcHWqUmLauAYR6xcgXpVyixh1
	 KFS4yMaF+viaXUB+rytcYstJVxIXbXS/rgEoP1kUGg6kmOnst2LKP5QRI2tbXzMb5Jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792613110;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=E2I9rFrmH+ssQHB2ZUxn0iz6s6CMUbZpsCh/jqKStp8=;
	b=FpsGgK5mTBsnHd5ZLyZ5F/is6b9gb7L+Zh/MbGi6IC696R5crP1+4NDwKaIjq2VihTQD
	 8UT8ukKFOeazj4czR3M63/cbzRCfNnhLzCd3t4ieu/Hut9tzRe732MW0IPilhCOrlafTa
	 RZdG9r87m9zzssRmV+5LZcAcN1qPvrWDdZhwDUx7tjqIIngkVL2UwYnUBLiXno5bzDHcM
	 uB2ap5fdy0MUncNgRqjfdiIPeC47dwhQtyy7CsXmC0ZIeaHDtcRi0S2e5fHEIrO6CF4JP
	 AmN6rS+BUY8MrgzkYsloQ3QFkbAgPML8bSgBqx1HJDToeK2QcYYSomFpuX7mMRDo+kA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dAThXwNg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA63606A31B
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 20:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dAThXwNg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 488DB1F000C2;
	Wed, 21 Oct 2026 20:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792613109;
	bh=E2I9rFrmH+ssQHB2ZUxn0iz6s6CMUbZpsCh/jqKStp8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dAThXwNgrlh2XHqLE50lVQ6EIa36/sSWFZbJ9BATc0amPLCE/dRrwRQKzBPioGXep
	 4qubyDma2A+BxehSFyxyDrSX1d7y5DiD9nyz/HoX2U8bA1WZlzYHa/2g8V4t6X73CR
	 c6GHrc/J4WypRD+nei69MPtOCBquH2DJWY8/uv9a7OYyNQn2a+QC0Y9S8FDvOCbe5j
	 9UAu0d/WmR/vASlIDYa5AnAG7KRbHbQssGEbKsCgkAkBRijOQmePnpnSrY9y73MXru
	 30R2nb49iXrMjpBS9QJC1QTihMTzgvZO+rI1nX2OZZgO6NEy4LF1N9TlYBcQC4pTOQ
	 Gpy/cqW3V3phg==
Message-ID: <sashiko-outbox-180625@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: bus: Add Altera AXI Timeout Bridge
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vyacheslav Yurkov" <V.Yurkov.EXT@bruker.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261021-feature-timeout-ip-v2-1-a037be089518@bruker.com>
References: <20261021-feature-timeout-ip-v2-0-a037be089518@bruker.com>
 <20261021-feature-timeout-ip-v2-1-a037be089518@bruker.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 20:05:08 +0000
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
- [Low] dt-bindings: bus: undocumented compatible in axi-timeout-bridge exa=
mple
- [Low] dt-bindings: bus: non-canonical property order in axi-timeout-bridg=
e example
--

commit b1b42eb61f1fec5cade8d2ad793870c54e4f6574
Author: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>

dt-bindings: bus: Add Altera AXI Timeout Bridge

This commit adds the devicetree binding schema for the Altera AXI Timeout
Bridge FPGA IP core, which monitors AXI transactions to downstream fabric
peripherals and terminates timed-out accesses with an error response and
interrupt.

> diff --git a/Documentation/devicetree/bindings/bus/altr,axi-timeout-bridg=
e-1.0.yaml b/Documentation/devicetree/bindings/bus/altr,axi-timeout-bridge-=
1.0.yaml
> new file mode 100644
> index 0000000000000..3512494442d46
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/bus/altr,axi-timeout-bridge-1.0.y=
aml
> @@ -0,0 +1,80 @@

[ ... ]

> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    timeout-bridge@10000 {
> +        compatible =3D "altr,axi-timeout-bridge-1.0";
> +        #address-cells =3D <1>;
> +        #size-cells =3D <1>;
> +
> +        reg =3D <0x10000 0x10>;
> +        interrupts =3D <0 12 IRQ_TYPE_LEVEL_HIGH>;
> +        ranges =3D <0x0 0x10010 0x1000>;

[Severity: Low]
In Documentation/devicetree/bindings/bus/altr,axi-timeout-bridge-1.0.yaml
under the examples section, the timeout-bridge@10000 node places
#address-cells and #size-cells before reg, and interrupts before ranges.

Per Documentation/devicetree/bindings/dts-coding-style.rst and
check_property_order() in scripts/dtc/dt-check-style, properties in a node
are expected to begin with compatible, reg, and ranges, followed by common
properties sorted by their #-stripped names (#address-cells, interrupts,
#size-cells). Running scripts/dtc/dt-check-style --mode=3Dstrict on this
binding reports property-order warnings for reg and ranges.

Should the properties in timeout-bridge@10000 be reordered so that
compatible, reg, and ranges come first?

> +
> +        timeout-device@100 {
> +            compatible =3D "timeout-device";
> +            reg =3D <0x100 0x10>;
> +        };
> +    };

[Severity: Low]
In Documentation/devicetree/bindings/bus/altr,axi-timeout-bridge-1.0.yaml
under the examples section, the child node timeout-device@100 uses
compatible =3D "timeout-device", which has no vendor prefix and is not
documented by any binding schema under Documentation/devicetree/bindings/.

When make dt_binding_check runs without DT_SCHEMA_FILES set,
scripts/Makefile.dtbs invokes dt-validate with -m:

    DT_CHECKER ?=3D dt-validate
    DT_CHECKER_FLAGS ?=3D $(if $(DT_SCHEMA_FILES),-l $(DT_SCHEMA_FILES),-m)

This checks that every node with a compatible string in the compiled example
matches a known schema, causing validation of
/example-0/timeout-bridge@10000/timeout-device@100 to fail with:

    failed to match any schema with compatible: ['timeout-device']

Could timeout-device@100 in the example use an existing documented
compatible string so that make dt_binding_check passes when dt-validate runs
with -m?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021-feature-ti=
meout-ip-v2-0-a037be089518@bruker.com?part=3D1
