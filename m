Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8B62165EA
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 05:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790832840; cv=none; b=BgO+OrwFuPblw1N6HUdNfI4XEtatNmzMM25JtPEHeiTJdU0XDierLiJ8vzKReclXjebYXOrSvbKCM2otpEIDnRYQcCfr9MTJQwpRs8bjlNI6aB+MqJRi5nP74evMMG8UkrYWIN7BKy7iYJbdYTVLFwR1ozgVdovSLsGYFWMVzH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790832840; c=relaxed/simple;
	bh=Rw5jZRtKApX8AfkFMrRDh64+vmuXw6IIW5NLytbLNd8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XJ1cKtFeTmhN0Zc107lZUbmqncq+4+WwFqfAHatR1mI1gxCREzXZg8LWuIrTA5x2yR1E4IejPe6lqfAMnWI8awv0HwhbJDJ0YryUZGJdiMUAz38KE5ARoXFZUERJxayNkV7PmZ4FjvGoA+YYAi1cvraGQ5hNxFrGlgrUdNqSrGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RJMOrYYA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RJMOrYYA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C93561F0089B;
	Thu,  1 Oct 2026 05:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790832839;
	bh=9VwzAc8lXXBTzelb66f1X9FcI+b2NcDvP3YpYY9ae8Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RJMOrYYANUgq9ssJN5zRLBkkeShyKzW8hzrn35UzRE+jWwCEi1aIUShwZFFBkqr92
	 duVngQI+NXeDiixxJ78amb72c2QvncIs3xvf2DLRepiBuhvvV8JbLVMLqRIVxXi7Jf
	 066/T93GMoDLwh36Wg9SscwAnz79W8wmjeXuFD6pjLGzKdHhpFF0YH3vljqIuhrX/g
	 Pcpve5aLbHHkxqf3KASD9g17g7OWq/4oew/4vFYubmMrYHJUUswIT6HRQIxGH1kLhQ
	 TWZtqr99Qck1YaLGLoUV8vG5rONMG4Mm56AGMPX8asANWnPKFeU0gF6XyjV4BWRcQb
	 CGvTXiI7PjaLA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 01/14] dt-bindings: Add RISC-V trace component
 bindings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mayuresh Chitale" <mayuresh.chitale@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20261001052243.3042627-2-mayuresh.chitale@oss.qualcomm.com>
References: <20261001052243.3042627-1-mayuresh.chitale@oss.qualcomm.com>
 <20261001052243.3042627-2-mayuresh.chitale@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 01 Oct 2026 05:33:58 +0000
Message-Id: <20261001053358.C93561F0089B@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] dt-bindings: riscv: arbitrary 8-port limitation in trace component =
schema
- [Low] dt-bindings: riscv: missing reciprocal remote-endpoint in trace exa=
mple
--

commit cd6c17f8ffc8a03ed1ca9c2518f088b9871f8ccc
Author: Anup Patel <anup.patel@oss.qualcomm.com>

dt-bindings: Add RISC-V trace component bindings

This adds device tree bindings for the memory mapped RISC-V trace components
which support both the RISC-V efficient trace (E-trace) and Nexus-based
trace (N-trace) protocols.

> diff --git a/Documentation/devicetree/bindings/riscv/riscv,trace-componen=
t.yaml b/Documentation/devicetree/bindings/riscv/riscv,trace-component.yaml
> new file mode 100644
> index 0000000000000..bb519bc4a163e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/riscv/riscv,trace-component.yaml

[ ... ]

> +  in-ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    patternProperties:
> +      '^port(@[0-7])?$':

[Severity: Low]
Does this unintentionally restrict the trace component schema to a maximum =
of 8
input ports? The commit message mentions that RISC-V trace components have =
an
implementation-specific directed acyclic graph style interdependency. Since=
 the
RISC-V specification does not enforce an 8-port limit, any future or existi=
ng
SoC implementation featuring a funnel with 9 or more ports (e.g., port@8 or
port@f) will artificially fail dt-schema validation.

Could the pattern be updated to use standard hexadecimal device tree unit
addresses, such as '^port(@[0-9a-f]+)?$'?

> +        description: Input connections from RISC-V trace component
> +        $ref: /schemas/graph.yaml#/properties/port
> +
> +  out-ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    patternProperties:
> +      '^port(@[0-7])?$':

[Severity: Low]
Similar to the in-ports property above, does this pattern artificially limit
the output connections to 8? Updating the regex to support standard hex unit
addresses would prevent validation failures for components with more than 8
output ports.

> +        description: Output connections from RISC-V trace component
> +        $ref: /schemas/graph.yaml#/properties/port

[ ... ]

> +    trace@c001000 {
> +      compatible =3D "qemu,trace-component", "riscv,trace-component";
> +      reg =3D <0xc001000 0x1000>;
> +      cpus =3D <&CPU0>;
> +
> +      in-ports {
> +        port {
> +          CPU0_RAMSINK_INPUT: endpoint {
> +          };

[Severity: Low]
Is there a missing reciprocal remote-endpoint property in this example node?
Standard device tree graph bindings specify that links between components m=
ust
be bidirectional when both nodes are present in the device tree.

In the example above, the encoder (trace@c000000) correctly points to the s=
ink
by defining remote-endpoint =3D <&CPU0_RAMSINK_INPUT>;. However, the
corresponding ramsink endpoint (CPU0_RAMSINK_INPUT) is completely empty and
omits remote-endpoint =3D <&CPU0_ENCODER_OUTPUT>;.=20

The kernel's of_graph API and dtc parsing tools rely on bidirectional
references to traverse the trace topology. Omitting the back-reference brea=
ks
backward traversal and causes dtc compiler warnings for missing bidirection=
al
links.

> +        };
> +      };
> +    };

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261001052243.3042=
627-1-mayuresh.chitale@oss.qualcomm.com?part=3D1
