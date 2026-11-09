Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794220740;
	b=rPNTwE1PyZBirbHAD8Me3gz5OoBKA8M3KkJ2yoIVgTSNFxB7jSkDrxPN1+YDVHM2XPkX
	 uyxFwmCoaHmSQDE6gO+RjmUbqsVhXVEYyEDyT09Opw61j8eedWdCe4bv9LSqcoQi9z9sa
	 tx6qlOFWXVNXDnO1Rpb/uUWClBenqy1JNRbRNYmLgsY44tTEP8Mr5a3+qsfASk1VeC6MA
	 BWWMNzKYzpzO0FdOjrJ9mCx4sZAxSPdhuVNZtx4Qs4eKjaWb7ymEx1VaqOjQL3n9G0yWp
	 c6vDV3n4rV6qEubElF6ovW2x8GzPW0eWAf57YYvkz+X8nxvc0jxIXhMQZe8+Byx+Byw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794220740;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=r6HyEaKbh/RK85nvkSElGazqX4zzLX6KG+xeFiqoXwE=;
	b=T1zBkkxmGBIez3q+XBJZAvS0AhV/Koq098S1Y7N5DLAqqclHOCeOfspLCqxUqlDlx8wp
	 JKS4ZS5EAZtE8JuMx8gIBd8WyWGhUUxCk1ruRs1vqZtrjbvVCnrRzddymsFtdKE/EnxYk
	 RYTc2fGIswvVZ8O5Tqm8vRPtaakq8jrJN53F0CWvfavHCPmnaCwpr4WyzGwKvE5ftUZYv
	 XE/tSSJyjqOt4sIGH+b1Ux0lerqv1uwHEcpm/4srch6fTsjAFsZcZK7lm+qY8bJiT0Xdx
	 7GaUYMsoaT1QTlh+XCpmVpsQlFf12cY+IPK2oi8srf6EhVjix01AmHsKBq2OzlEPVGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gGqm0wwO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B8D606A321
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 10:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gGqm0wwO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87DC81F0089F;
	Mon,  9 Nov 2026 10:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794220739;
	bh=r6HyEaKbh/RK85nvkSElGazqX4zzLX6KG+xeFiqoXwE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gGqm0wwONOQuPBP/SnGqLDn8JfESmsIz0h/32G8vaRZtcZyLgZVbGSbhmmbijwv5e
	 JUetkHCTmdhAUJ03zaY2mtYk568J8JnAFCJn4K0he12TW7bZc9Yrzg9rHvKkZU2bzn
	 iQ1g2BNqtCtC+4zhJJ5RIon1iTzVZwa6ELM1/RpQbg4ifOxuhqR/BOgaDBxBF23YrO
	 xO3pkozkGkii0BKMVOK4vocO0iShw2btizvvp0j3Orhre6aemM8E8nfSPrr5vtqUwE
	 BZAkk6oSxD5zXNzt2tKtk+Jn75I0tMglrH7y2JNDLd2tnp/qBFDEskrJYTSXVJWJyv
	 kvBS1tjTzGedw==
Message-ID: <sashiko-outbox-204830@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/7] dt-bindings: arm: Add MPAM MSC binding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yin Li" <yin.li@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261109-mpam-resctrl-dt-knp-support-v5-3-150335a79381@oss.qualcomm.com>
References: <20261109-mpam-resctrl-dt-knp-support-v5-0-150335a79381@oss.qualcomm.com>
 <20261109-mpam-resctrl-dt-knp-support-v5-3-150335a79381@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 10:38:59 +0000
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
- [Low] dt-bindings: arm: arm,mpam-msc: 4-cell reg on 1-cell bus in
  example
- [Low] dt-bindings: arm: arm,mpam-msc: missing top-level required
  property list
- [Low] dt-bindings: arm: arm,mpam-msc: property order and unused labels
  in example
--

commit fcdcd9b567c42204dbc32cc6d1155a3dddba1926
Author: Rob Herring <robh@kernel.org>

dt-bindings: arm: Add MPAM MSC binding

This commit adds the Devicetree binding schema for Arm Memory System
Resource Partitioning and Monitoring (MPAM) Memory System Component (MSC)
nodes.

> diff --git a/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml b/Do=
cumentation/devicetree/bindings/arm/arm,mpam-msc.yaml
> new file mode 100644
> index 0000000000000..b52599b47a1cd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml
> @@ -0,0 +1,62 @@
[ ... ]
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: arm,mpam-msc                   # Further details are disc=
overable
> +      - items:
> +          - const: arm,mpam-memory-controller-msc
> +          - const: arm,mpam-msc
> +
> +  reg:
> +    maxItems: 1
> +    description: A memory region containing registers as defined in the =
MPAM
> +      specification.
> +
> +  arm,not-ready-us:
> +    description: The maximum time in microseconds for monitoring data to=
 be
> +      accurate after a settings change. For more information, see the
> +      Not-Ready (NRDY) bit description in the MPAM specification.
> +
> +additionalProperties: false

[Severity: Low]
Should this schema include a required section listing compatible and reg?
do_mpam_msc_drv_probe() unconditionally maps MMIO resource 0 when probing
DT MSC nodes, so nodes omitting reg will pass dtbs_check and then fail to
probe at runtime.

> +
> +examples:
> +  - |
> +    L3: cache-controller@30000000 {
> +        compatible =3D "foo,a-l3-cache", "cache";
> +        cache-level =3D <3>;
> +        cache-unified;
> +        reg =3D <0x0 0x30000000 0x0 0x2000>;
> +        ranges =3D <0x0 0x30000000 0x2000>;
> +        #address-cells =3D <1>;
> +        #size-cells =3D <1>;

[Severity: Low]
Should reg in cache-controller@30000000 be <0x30000000 0x2000>?  The
default example bus uses #address-cells =3D <1> and #size-cells =3D <1> (as
used by ranges here and by msc@40000000 below), so a 4-cell reg is parsed
as two regions starting at 0x0 and triggers a dtc simple_bus_reg unit
address mismatch warning during dt_binding_check.

> +
> +        msc@0 {
> +            compatible =3D "arm,mpam-msc";
> +            reg =3D <0x0 0x2000>;
> +            arm,not-ready-us =3D <1>;
> +            /* CPU affinity implied by parent cache node  */
> +        };
> +    };
> +
> +    ddr_msc: msc@40000000 {
> +        compatible =3D "arm,mpam-memory-controller-msc", "arm,mpam-msc";
> +        reg =3D <0x40000000 0x1000>;
> +        arm,not-ready-us =3D <10>;
> +    };

[Severity: Low]
This isn't a bug, but scripts/dtc/dt-check-style reports two style issues
in this example: in cache-controller@30000000, reg and ranges should come
immediately after compatible before cache-level and cache-unified, and the
unused labels L3 and ddr_msc should be dropped.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109-mpam-resct=
rl-dt-knp-support-v5-0-150335a79381@oss.qualcomm.com?part=3D3
