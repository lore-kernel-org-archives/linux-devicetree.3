Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F03429CFF
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 18:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785780439; cv=none; b=n12TSCnlXgxdwm3Bpg5UgyXxDjhyp3I4HoVMAs/9ecwQDD84tVHUA8usfxwg4pkW9AFxpaKd2k6GZtXhBGqNZj53PM8Irgzkryz1TauLgLBe+bTIWA2tzrrnpZ1TMmVxKsbth5Z1v2gQ6MMcZFoXRphQCDAEj36BAaYp1v6w+oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785780439; c=relaxed/simple;
	bh=Tz7S5tWbr+GN7N1xiXEgJlmxhCWxjAgkKA0r6eoPvSU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qziIx+bXAKWktjUH13i2eTTfgAZOxIKQ3ig7ecrCBCyKiBxwTLz18C2hRu1rm/3gubelTyynoCaF5ucchOLcLhpjFjfmWQw7oRr3Qnx780gVwpNZpeShcPcc7hhILKkMKlriV7/QOdtTnQOyqNZhyYq7dWyaRBnMGGMtpOfm/rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VwjFAj0x; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VwjFAj0x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BE651F000E9;
	Mon,  3 Aug 2026 18:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785780438;
	bh=YebdfjdfLGEmx5ZVHrgoJ3CHkcItYW0Uc3ygbwYcSXE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VwjFAj0xq6s6IhUMBWvSNFE14Fw0Tu6lMogOqWSPTw7bG7G0dn4RMAU/EcV05Lswi
	 fEXPDPE3s57gny0QpWIuJIEGNsWlknN1pFW+No72vCUJWu4tdKChwu8fV8C/ZGaLRE
	 9+rAN9eo3j/CE2JKMK71FYTx3rxiBc8XGdrepAzCI3S/+o70ZRS+lLA8i69ehB/HEt
	 NgP/bpcOtDPSy9uSLX9DmpvjpeFGaDZZBjlkhZf9tN2nPOFmqQrsuOJIc8JxWoBFKf
	 SRX14EKuZl41XDVb/XKyyL9bGcfA8jvS7DpdR5kllbPUf/DNv7kz+1K9pCcGmjzZHJ
	 4geB2nQJxi9hA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: iio: dac: add support for mcp47a1
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joshua Crofts" <joshua.crofts1@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260803-mcp47a1-add-support-v3-1-540e71b4fd2e@gmail.com>
References: <20260803-mcp47a1-add-support-v3-0-540e71b4fd2e@gmail.com>
 <20260803-mcp47a1-add-support-v3-1-540e71b4fd2e@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 18:07:16 +0000
Message-Id: <20260803180717.4BE651F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The I2C addresses specified in the schema and example appear to =
be 8-bit write addresses instead of the 7-bit addresses required by the DT =
specification.
- [Low] The `reg` property schema applies an integer `enum` directly to a m=
atrix array element, which will cause `dt_binding_check` validation to alwa=
ys fail.
--

--- Patch [1]: [PATCH v3 1/2] dt-bindings: iio: dac: add support for mcp47a=
1 ---
commit 441e840b5a2a3f037c3520c49013a55b7dc4c1bd
Author: Joshua Crofts <joshua.crofts1@gmail.com>

dt-bindings: iio: dac: add support for mcp47a1

The Microchip MCP47A1 is a 6-bit volatile Digital-to-Analog converter
which communicates via I2C.

> diff --git a/Documentation/devicetree/bindings/iio/dac/microchip,mcp47a1.=
yaml b/Documentation/devicetree/bindings/iio/dac/microchip,mcp47a1.yaml
> new file mode 100644
> index 0000000000000..b181fe73dce84
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/dac/microchip,mcp47a1.yaml
[ ... ]
> +properties:
> +  compatible:
> +    const: microchip,mcp47a1
> +
> +  reg:
> +    items:
> +      - enum: [0x2e, 0x3e]

[Severity: Low]
Will this cause dt_binding_check validation to fail?

Since dt-schema parses reg values into a uint32-matrix (an array of arrays),
the items array applied to it defines a tuple schema for the outer array's
elements. This means the inner array [0x2e] will be matched against the
integer enum [0x2e, 0x3e], which will mathematically fail since an array
is not an integer.

[Severity: Medium]
Are these 8-bit write addresses instead of the 7-bit addresses required by
the Device Tree specification?

If these are indeed 8-bit addresses (as indicated by the 0 LSB and typical
Microchip datasheet conventions), they must be shifted right by 1. That wou=
ld
make the correct 7-bit DT addresses 0x17 and 0x1f.

> +
> +  vref-supply: true
[ ... ]
> +examples:
> +  - |
> +    i2c {
> +          #address-cells =3D <1>;
> +          #size-cells =3D <0>;
> +
> +          dac@2e {
> +              compatible =3D "microchip,mcp47a1";
> +              reg =3D <0x2e>;

[Severity: Medium]
Does this example propagate the DT specification violation?

Using an 8-bit write address directly in the reg property and unit name
(dac@2e) will cause the device to fail to probe or communicate, as the I2C
subsystem expects a 7-bit address.

> +              vref-supply =3D <&vref_regulator>;
> +              vdd-supply =3D <&vdd_regulator>;
> +          };
> +    };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803-mcp47a1-ad=
d-support-v3-0-540e71b4fd2e@gmail.com?part=3D1
