Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795517395;
	b=WO3G+qqTi//tVZT0CNZsWu4LLjZ8taM7w0F4wDYyr78OwrARc4SPtfr+1j1Qu8CvfA0y
	 lYnishz7PjO3knf5QzCGxOPKgoxWZjhlaiNEXXK1ML5DWcHvoaA77r/+XrFqXN4iZhxxJ
	 JcMzyBtbWV9nXaojcWJYZfLTHloveDVlKc00T7TXmgQt0UMf982zFkdRDNPj1VTqF0rmG
	 GcAwFHnL2TqdzG3mHQz7Hh1wF1mZgoqaaSfq9fOtIKXmvQ7/DdoVa2zy22l2vDDz7ZZKD
	 TN7iAUjCyF3IL/46KkjV/xWxluWWFBofhct7WC2fScBoVLHavKj1xbLubA0/yaGcbDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795517395;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=wBI0UFAbGFF9A4Tdj8Y54rgoNx+OQY26gVV9+3N7NZo=;
	b=TKY2ijS/lGcv4GpEMOqC6GMRNp0S5zrKQd02yIYXKBdWztwBmkbqhG634hugPOsI2Vgm
	 pV8PDX0SqHLqZUpCkDjgGxzcaQTSTZuV9yxBI6E0nIAPuGhe6DhU68Zzs9QIQJYiKfv1f
	 Jf/1+BWfzZRQN6W+4HzWdm7+uFjgwR7r9+gGL0VRrJtVcpPw25LXabF/tNjs2Ur3RPg3O
	 klwGwuwlVExk52LrSZPSbpkhf4x+2VSNS6DLRZmMNdzT1E6s5YGXuFrQkaZ6NLBYHH/aL
	 1pxul2fSpJTbn6z11HtIVX4kAZKaTihlHQZ+9kkSca2nzEL8RScaMHQ342K+J/rVx3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bJtHKBrQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6893606A32E
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bJtHKBrQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA1D71F000C6;
	Tue, 24 Nov 2026 10:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795517394;
	bh=wBI0UFAbGFF9A4Tdj8Y54rgoNx+OQY26gVV9+3N7NZo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bJtHKBrQIHqVI2ia94IRrHBE6+4Z6Hu6mNfsnMp7b8z2jXyHCTEsbEMXolAMMhdqA
	 B6ZST4qHN/rATmVPTHWE/onsOPu+RgzQKJMeH2whe01K7j5jiTumfXXDbIgEq/WuJg
	 yG8QIb8cUUEMCP00PjcMITveZ9sR4e6SOqh2M+dWHm7H0JfXUM550mYsm3hEqIahtX
	 0CuLwblRvCZLuoqGuL3153xCOOrqMP/YxEMYo8hZxBWWkBaNeIv9g5XPCw/V1Zp8GK
	 oXaNqx6GpHxzNz+4xxIoJ+JuUlQxf88fm6h0asINjLCFOGtrsyjomHnzpqn4bXqcpe
	 SS3Qo3aPusF5g==
Message-ID: <sashiko-outbox-230984@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: interconnect: Add Qualcomm Netrani
Reply-To: sashiko-reviews@lists.linux.dev
To: SignKirigami <prcups@krgm.moe>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261124-netrani-interconnect-v1-v1-1-bb5efdb229cd@krgm.moe>
References: <20261124-netrani-interconnect-v1-v1-0-bb5efdb229cd@krgm.moe>
 <20261124-netrani-interconnect-v1-v1-1-bb5efdb229cd@krgm.moe>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 10:49:53 +0000
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
- [Medium] dt-bindings: interconnect: non-existent clock header breaks
  dt_binding_check
--

commit 845dadf45a2a7e36bd865b03b0b5e8bc666b5771
Author: SignKirigami <prcups@krgm.moe>

dt-bindings: interconnect: Add Qualcomm Netrani

This commit adds the Devicetree binding schema and header definitions for
the Qualcomm Netrani RPMh interconnect providers.

> diff --git a/Documentation/devicetree/bindings/interconnect/qcom,netrani-=
rpmh.yaml b/Documentation/devicetree/bindings/interconnect/qcom,netrani-rpm=
h.yaml
> new file mode 100644
> index 0000000000000..b2d36cd632d82
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interconnect/qcom,netrani-rpmh.ya=
ml
> @@ -0,0 +1,131 @@

[ ... ]

> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,netrani-gcc.h>
> +
> +    interconnect-0 {
> +        compatible =3D "qcom,netrani-clk-virt";
> +        #interconnect-cells =3D <1>;
> +        qcom,bcm-voters =3D <&apps_bcm_voter>;
> +    };
> +
> +    interconnect@16e0000 {
> +        compatible =3D "qcom,netrani-aggre1-noc";
> +        reg =3D <0x016e0000 0x1c080>;
> +        #interconnect-cells =3D <1>;
> +        clocks =3D <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>;

[Severity: Medium]
Does this example break make dt_binding_check because
include/dt-bindings/clock/qcom,netrani-gcc.h is not present in the tree?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-netrani-in=
terconnect-v1-v1-0-bb5efdb229cd@krgm.moe?part=3D1
