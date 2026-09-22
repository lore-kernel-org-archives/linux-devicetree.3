Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6171F54489D
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 16:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790094009; cv=none; b=PAzCZ8oMnb2bCZ//xx/aljqgVmv6B0gLtxchaXay0DDjSUmC4grPihvUA/KbJo2PrPpamBpOhlwSEm1mYn/AnQDzOdYCrV7N7AqLn8siFO37LP4TqWPCk1H/LvkX1C/mdPVQyIDseBPaARi3a2VD+xQ41/+zp593/Dtl5Xh9an4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790094009; c=relaxed/simple;
	bh=QubFJOGYoK4Gw6gwrEteDQDPfBOvxgz4YCrPwM+CG4s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cwAKnw+qWQibcux3V/CB17unAecqE5wE5IS14gk8jUjcy6E1mi7XxDZ691Hn43hg/c7rdqc3j2uKwc5oYJtm4b2JJvLhI6Tl/luBHnDYGJhL5kAfbvgtcDVN3V9m1DI/Nt8qMBTN35vJMKPezKU00SBpXxbesSlv9xZESA3jZ60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YzXW+ySp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YzXW+ySp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD87C1F000FF;
	Tue, 22 Sep 2026 16:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790094008;
	bh=Wq6QRYqCZHvQzz+EDFZQ16bJssxzviFBRIEa+7I1tGs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YzXW+ySpj1bdpgXlEVtbnm+ytirNM+KvSWLhhmVjdPpETU6kjuseC6Ssk1I4Li60V
	 zqJa62TjNwRoA0EIoYsu3yyUVhlSpJ1WXaTjDSDQ33pDV/bGRMBFr9l1KoJXB/SgPc
	 FWH6B7nGNw6tbm2yqX0vAEV4Vd5sDv5jEEfNYPR584zG+4toyw1QeG9vkZglR52Oyb
	 ag45i3deDvjG1a9kBVMJzjpyH37cYRLVzZg42ps0UIIOIgjJJcAotzkB5b4SfcsJ++
	 7Uy8LE8woBGQI/YXBk8ZMJfbSU/m1drWbNqUS/uWKcCkW/LZUYkI9w7IdO4Nj4EKVH
	 JP8IsmeG8x+KA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: regulator: Add RPMI voltage service
 bindings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joshua Yeong" <joshua.yeong@starfivetech.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260922161156.1088153-2-joshua.yeong@starfivetech.com>
References: <20260922161156.1088153-1-joshua.yeong@starfivetech.com>
 <20260922161156.1088153-2-joshua.yeong@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 16:20:07 +0000
Message-Id: <20260922162007.AD87C1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] dt-bindings: non-standard voltage-domains property bypasses regula=
tor core
--

commit f9ded6ad4ad8d417c9182647856a155cfddbfb6d
Author: Joshua Yeong <joshua.yeong@starfivetech.com>

dt-bindings: regulator: Add RPMI voltage service bindings
   =20
This commit adds device tree bindings for the RISC-V Platform Management
Interface (RPMI) voltage service group. It defines the bindings for both the
supervisor-facing regulator controller and the SBI MPXY channel used to
expose the service group.

> diff --git a/Documentation/devicetree/bindings/regulator/riscv,rpmi-volta=
ge.yaml b/Documentation/devicetree/bindings/regulator/riscv,rpmi-voltage.ya=
ml
> new file mode 100644
> index 0000000000000..66d1c26592c16
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/riscv,rpmi-voltage.yaml

[ ... ]

> +properties:
> +  compatible:
> +    description:
> +      Intended for use by the supervisor software.
> +    const: riscv,rpmi-voltage
> +
> +  mboxes:
> +    maxItems: 1
> +    description:
> +      Mailbox channel of the underlying RPMI transport or SBI message pr=
oxy channel.
> +
> +  "#voltage-domain-cells":
> +    const: 1
> +    description:
> +      Lets a consumer name a domain by its RPMI DOMAIN_ID, the single ce=
ll of
> +      a "voltage-domains" entry, without a child node for the domain.

[Severity: High]
Does this non-standard provider cell count bypass the standard regulator co=
re
linkage? By using a custom voltage-domains property instead of the standard
<name>-supply pattern, consumers using this linkage will globally fail
dt_binding_check validation since voltage-domains is unrecognized by
devicetree core schemas or standard consumer schemas.

[ ... ]

> +    codec {
> +        compatible =3D "vendor,codec";
> +        vdd-supply =3D <&volt2_reg>;
> +    };
> +
> +    // Domains 3 and 4 by DOMAIN_ID, with no child node for either.
> +    phy {
> +        compatible =3D "vendor,phy";
> +        voltage-domains =3D <&rpmi_voltage 3>, <&rpmi_voltage 4>;
> +        voltage-domain-names =3D "vdda", "vddio";
> +    };
> +...

[Severity: High]
Will this custom linkage break driver core probe ordering?

Since the driver core (fw_devlink) cannot track voltage-domains dependencie=
s,
it has no way of knowing this property names a supplier. If cell-based
dynamic regulator mapping without subnodes is required, shouldn't it be
introduced globally (e.g., #regulator-cells in regulator.yaml) and approved
by the core devicetree and regulator maintainers rather than using a
platform-specific model here?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260922161156.1088=
153-1-joshua.yeong@starfivetech.com?part=3D1
