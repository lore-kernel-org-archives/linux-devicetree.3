Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795687678;
	b=F2YuO2P8FTxVxP9pKl2T8xWEDPcB1cYyvbJcHk0Ks+hpFjm+n10CNfw2uOa1N6la1/jV
	 DfIaQ3avIC+uXoE+r+dqU4NVekjxAs1D49g+HCx/qOic1+lMGDVBHU8lC9+j02QJND1Ay
	 OzKpTB7JwxX3CT4Jcn4P+vMnglXUuTrjfnnCotAHXk0IIhEJSlgvO3KnnUufePZTpBltH
	 l/+78lAfdPeFk7csGwRgOyuqcBItx3dnRZACVHL/Pibl/5O+UoxYv1FDDSRQeG6ibfZdZ
	 psmyTnOUyfOb1+GXQVWvgSyoU7tmedh/r96X5YL2CTrz99nVBldk5yEAywtyr+JEJlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795687678;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=M54idcHvBZ8iZsAzMa18xe+cR3Ih56QtpWb/mKW1WUI=;
	b=CN3LNRmTpeQpkxb+texEu9y828BgDu8csRcm1CZGR5bXoWNYolRPVebnIbjLKL9265WV
	 kbr6lhcGBMCsSP4r929mnhzHlPEi/DpWSYt234em5df3Os/6nVTz1v5vbMQclp68Cvom2
	 oLMrs3lOLRUrnc6OcXC8URM7fbMk0yJrcQCEIC6x5d7/VXjMqzB8meYtUYSnCRRdDmXRF
	 GxeYfnvMq2QM013YaGugTGsBFLd87isQ09WQJ11IaqUHqcOfXZ4bZ/nnyUTN1aib0MIr6
	 maph1feqIVuzafsjBb/ZDueejkc9nTd6WddY/zBTx39rzgmO8ee6M/1VAaEu5N1nCjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ebfXw2Tq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3AC4606A33A
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 10:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ebfXw2Tq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC34D1F000EC;
	Thu, 26 Nov 2026 10:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795687678;
	bh=M54idcHvBZ8iZsAzMa18xe+cR3Ih56QtpWb/mKW1WUI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ebfXw2TqVRbJlOV15vdVghQnNPs7iLC4tJ3MCCKge4ealAY6kPIph81399sE3lXI1
	 IFk35xvsx8QY3UDJN/JndmoXFFG3K8RmD08NcLhllit34dmpHyFg7TwBVR0wie01n4
	 bc6aajqEgGsBhw6mwEvgF2HISet/5rc5ISB82/VXOSWwBOoDLoOxvAS0AAxwEsqrUR
	 S0Xu1Nl6PANzI7AQLnr/JGb39maHXMXixkqEPOvVz5jejfLzikv5G5SlOdLwqKm2bj
	 Q6/Tz6fFGsMMn+eEgwl/MmJ7pJfI/4nvx+vTe560vhopYdnoGHLefDVmlv9oYIMyv5
	 JluflOnzYY9/w==
Message-ID: <sashiko-outbox-235244@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 01/14] dt-bindings: Add RISC-V trace component
 bindings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mayuresh Chitale" <mayuresh.chitale@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <5454076167a828931e198bd167dea1e2a64cdd0b.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
References: <cover.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
 <5454076167a828931e198bd167dea1e2a64cdd0b.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 10:07:57 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [Low] dt-bindings: riscv: redundant bindings word in commit subject
- [Low] dt-bindings: riscv: arbitrary 8-port limit in in-ports and
  out-ports
- [Low] dt-bindings: riscv: missing reciprocal remote-endpoint in
  example
--

commit 1257d7f086d130afccb10391f20f195c41e67ce3
Author: Anup Patel <anup.patel@oss.qualcomm.com>

dt-bindings: Add RISC-V trace component bindings

This commit adds a Devicetree binding schema for memory-mapped RISC-V
trace components supporting E-trace and N-trace protocols.

> dt-bindings: Add RISC-V trace component bindings

[Severity: Low]
The dt-bindings: prefix already indicates that this patch adds a binding.
Could the subject drop the redundant trailing word "bindings" and include
the riscv: subsystem prefix, such as "dt-bindings: riscv: Add RISC-V trace
component"?

> diff --git a/Documentation/devicetree/bindings/riscv/riscv,trace-componen=
t.yaml b/Documentation/devicetree/bindings/riscv/riscv,trace-component.yaml
> new file mode 100644
> index 0000000000000..bb519bc4a163e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/riscv/riscv,trace-component.yaml
> @@ -0,0 +1,120 @@

[ ... ]

> +  in-ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    patternProperties:
> +      '^port(@[0-7])?$':
> +        description: Input connections from RISC-V trace component
> +        $ref: /schemas/graph.yaml#/properties/port
> +
> +  out-ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    patternProperties:
> +      '^port(@[0-7])?$':
> +        description: Output connections from RISC-V trace component
> +        $ref: /schemas/graph.yaml#/properties/port

[Severity: Low]
Why are in-ports and out-ports restricted to unit addresses 0 through 7?
The RISC-V Trace Control Interface specification supports up to 16 funnel
inputs (trTfDisInput bits 0..15) and arbitrary implementation-specific
graph topologies, so components with 9 or more ports would fail schema
validation unless standard hexadecimal port addresses such as
^port(@[0-9a-f]+)?$ are allowed.

[ ... ]

> +examples:
> +  - |
> +    // Example 1 (Per-hart encoder and ramsink components):
> +
> +    trace@c000000 {
> +      compatible =3D "qemu,trace-component", "riscv,trace-component";
> +      reg =3D <0xc000000 0x1000>;
> +      cpus =3D <&CPU0>;
> +
> +      out-ports {
> +        port {
> +          CPU0_ENCODER_OUTPUT: endpoint {
> +            remote-endpoint =3D <&CPU0_RAMSINK_INPUT>;
> +          };
> +        };
> +      };
> +    };
> +
> +    trace@c001000 {
> +      compatible =3D "qemu,trace-component", "riscv,trace-component";
> +      reg =3D <0xc001000 0x1000>;
> +      cpus =3D <&CPU0>;
> +
> +      in-ports {
> +        port {
> +          CPU0_RAMSINK_INPUT: endpoint {
> +          };
> +        };
> +      };
> +    };
> +
> +    trace@c002000 {
> +      compatible =3D "qemu,trace-component", "riscv,trace-component";
> +      reg =3D <0xc002000 0x1000>;
> +      cpus =3D <&CPU1>;
> +
> +      out-ports {
> +        port {
> +          CPU1_ENCODER_OUTPUT: endpoint {
> +            remote-endpoint =3D <&CPU1_RAMSINK_INPUT>;
> +          };
> +        };
> +      };
> +    };
> +
> +    trace@c003000 {
> +      compatible =3D "qemu,trace-component", "riscv,trace-component";
> +      reg =3D <0xc003000 0x1000>;
> +      cpus =3D <&CPU1>;
> +
> +      in-ports {
> +        port {
> +          CPU1_RAMSINK_INPUT: endpoint {
> +          };
> +        };
> +      };
> +    };

[Severity: Low]
Should CPU0_RAMSINK_INPUT and CPU1_RAMSINK_INPUT include reciprocal
remote-endpoint properties pointing back to <&CPU0_ENCODER_OUTPUT> and
<&CPU1_ENCODER_OUTPUT>?  Omitting them leaves the OF graph connections
unidirectional and the encoder endpoint labels unreferenced, which triggers
dtc graph_endpoint and dt-check-style unused-label warnings.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1795512532.gi=
t.mayuresh.chitale@oss.qualcomm.com?part=3D1
