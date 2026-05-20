Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165C51EB5F8
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 03:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779246123; cv=none; b=mmPZGoWehM3WRZVGDHjvGT7LXyp8kqf4Jxf8aUHGzbKfcmsoIDjL7OVnhMzJFcvykn1QgLr3FfqDVZCcifJYDWLOzQBVQcnq7GE90XveKNnrJpAlRQgnP/ufQa/2aUsdXsZgZuTJbo/eEsseKfO3fSuIheTKsa8kxzB2h2BdcAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779246123; c=relaxed/simple;
	bh=dz0Nz6MFG70CmEW0u+oWpMvGHHdCCX9hSmHdJnjFATE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nWmW7omczMjHAM5gsSx2lfBYfeaxAYg5aNITgB+M+Ia4d67e3+SgdOwMlS1uCh0qL+psQ3tFTJPjnJCuqqPE8cFhUHziaN6/Cy1Kbdlrt9eyQ7ojHKWpCUL8WUYjf4xjGmyQ0ol87swNFPRTJ003l470Ev/mpZm7/Wh0zsUaSUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hDWm7Jmk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hDWm7Jmk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6E721F000E9;
	Wed, 20 May 2026 03:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779246121;
	bh=DvU2Sq8t8FUaHp2RB75aAXWVwqlwk9hMzYG4Ibr6fbk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hDWm7JmkA92zDcF71n0/LPXjEX8nCGR3Flq7AJFN5Y7numJ0f1stlAfoncbxsNtJg
	 dLK+pEys56baL8RdFNEQD82TIznuot19kY1/41BCdPGuVY3bsrIOyZfa8RUeZ9OcCn
	 m0Hd2cPreXSpYNL9IaLO5N5hH+l38SaKimz8j9kkxEtz9A5/HVOrWcEzI6Xbx/PI0g
	 JbxNlwL28x8TAubxRUTazfEod5tfBzZXSqNDXB3X/YHRZPTWYe0gSc1q7DJfACqvrg
	 51NSFR9yuRlwWvlJuq+z02QPmHBXN39EyJDzTvfBSsZmm1YgzSXspe4F0Z1myUXOgv
	 KDALOOvBfzfpQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: clock: via,vt8500: Convert to DT Schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Udaya Kiran Challa" <challauday369@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260520025131.17772-1-challauday369@gmail.com>
References: <20260520025131.17772-1-challauday369@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 May 2026 03:02:01 +0000
Message-Id: <20260520030201.A6E721F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] Missing default value for `divisor-mask` property in the DT schema.
- [Low] Example node uses a deprecated name for `fixed-clock`, which will c=
ause schema validation warnings.
--

commit 5bd68ac4f98e8a51a2fee1d1c82c98071336d42f
Author: Udaya Kiran Challa <challauday369@gmail.com>

dt-bindings: clock: via,vt8500: Convert to DT Schema

Convert the VIA/Wondermedia VT8500 and Wondermedia WM8xxx series SoCs clock
controller binding from the legacy text format to DT schema.

> diff --git a/Documentation/devicetree/bindings/clock/via,vt8500-clock.yam=
l b/Documentation/devicetree/bindings/clock/via,vt8500-clock.yaml
> new file mode 100644
> index 0000000000000..9c312d11a6a7b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/via,vt8500-clock.yaml
[ ... ]
> +  divisor-mask:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Bitmask describing the divisor field inside divisor-reg.

[Severity: Low]
The legacy text binding explicitly specified that divisor-mask defaults to
0x1f if not specified. Can we include a default value here to ensure the
dt-schema validation tools can infer it?

[ ... ]
> +examples:
> +  - |
> +    / {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        ref25: ref25M {

[Severity: Low]
Does this node name cause schema validation warnings? The core
fixed-clock.yaml schema requires node names to match the pattern
^clock-([0-9]+|[a-z0-9-]+)$.

Naming it clock-25000000 might be better to avoid warnings during
make dt_binding_check.

> +            compatible =3D "fixed-clock";
> +            #clock-cells =3D <0>;
> +            clock-frequency =3D <25000000>;
> +        };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260520025131.1777=
2-1-challauday369@gmail.com?part=3D1
