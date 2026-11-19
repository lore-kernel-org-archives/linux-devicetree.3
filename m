Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795083256;
	b=iXkNHB2oOGEcWIIDFaCtiQ238c/DE3G0e0bXgCFEzwEs3l51FSADjq0R4PWNtJQkamSz
	 OKxU/9pu3WLBe1/SmBEkM6cdIJwdJceoYLbViLA7BTiEV4ZKu7gSnGrf7wYV3ItkA9uQC
	 MHMnqgCzg02zN2BraLkbLkcNC+DGfAZl4RvVN7MIq6dJRuC3XybHzlFuQ6dYZ3YCioX+u
	 0Km277hmmFjPq4Rf8PlSIBshyg2x2/TrJog7oh/bP6C3g7asKuxswkay6QX8H1eGksLct
	 DMniWAWkLikymR7FOywBa0mDvpeR91lLxlyjs6sR6lHrZGvtk4+T9l9HRQfJ9gl/qPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795083256;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=irvhP2xeExQG1viebBgAbC+QcM1/LN1guYF0MzXKiBA=;
	b=rS4rn30Oxu48I/6X/mgruizhxW3gqnk3r7M5E338VQuSZB73l6AvNBXZ56XkH9/u62Ox
	 555hlPH2cNqKJZLheoZDkApq1VHl1BjCGANi8dDTOaTTC3c7u/t4yCqpvCIjLCkOlcxJR
	 GyUsSoXmrt3th3jY+CE5J1RHoSEQiIgdekAf9+Tsi71UvDqzeemZbbygS5oszD8BPzp8k
	 eAPzgGaA/NGezkECIEWueXQO5TPdhMHCbbZTgyV0bGUFYxEGJRr7+O9EILS1hFSh9S4wP
	 VSwJyt48KXGxdBIZbIqVEDlx7RoCWZTd5NbVzw6m8XklsFKim6o0TNrYZ12yILA44vQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eYKwB16x;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C58606A320
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 10:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eYKwB16x
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87FB11F000C5;
	Thu, 19 Nov 2026 10:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795083255;
	bh=irvhP2xeExQG1viebBgAbC+QcM1/LN1guYF0MzXKiBA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eYKwB16xYzCjbo7BeR6eAzf9cT8X/eqcqI8LFfYF/fHDb2Rh9WJgFGYworZSzm4pH
	 l7FdTT4qG5SlbShwU4JraN61pnwy+asDYn1deN6cGuM/1gMXDxKmPScNHiMMzadfAm
	 izOJjVHBumWz46xQUr0yTfSOCq3p9w6v9PywygP/d/wr0Ib8+PbqE6iDHV4UqA6hEa
	 9IlLjLTfIYRQL29Em2NItlWEQEBhm9YhwAQq95MFbfwVv9cI1XHpn8IdYAlYFJCmx8
	 xZYHW+3N3od5AswJtgZCpvD4YORCmUMkBHuE/AmyIsMCpG5BdV+w/NE5UT+x/P0Sv6
	 D7lTvGTRwhy/Q==
Message-ID: <sashiko-outbox-222929@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/6] dt-bindings: spi: Document DWC SSI XIP properties
Reply-To: sashiko-reviews@lists.linux.dev
To: "Prakriti Sharma" <Prakriti.Sharma@synopsys.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261119100513.433044-6-prakriti@synopsys.com>
References: <20261119100513.433044-1-prakriti@synopsys.com>
 <20261119100513.433044-6-prakriti@synopsys.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 10:14:15 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] dt-bindings: spi: snps,dwc-ssi-2.02a: XIP properties encode
  OS policy
- [Low] dt-bindings: spi: snps,dwc-ssi-2.02a: missing reg items and XIP
  dependencies
--

commit ea2effa98a511e888bf97a068c9c5ac14822f4eb
Author: Prakriti Sharma <Prakriti.Sharma@synopsys.com>

dt-bindings: spi: Document DWC SSI XIP properties

This commit documents an optional XIP memory region and boolean properties
for execute-in-place, continuous mode, and prefetch in the Synopsys DWC SSI
v2.02a binding.

> diff --git a/Documentation/devicetree/bindings/spi/snps,dwc-ssi-2.02a.yam=
l b/Documentation/devicetree/bindings/spi/snps,dwc-ssi-2.02a.yaml
> index 7cccd627f8095..efbeb59313fa3 100644
> --- a/Documentation/devicetree/bindings/spi/snps,dwc-ssi-2.02a.yaml
> +++ b/Documentation/devicetree/bindings/spi/snps,dwc-ssi-2.02a.yaml
> @@ -23,7 +23,18 @@ properties:
>      const: snps,dwc-ssi-2.02a
> =20
>    reg:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2
> +    description: |
> +      Controller register base and optional XIP memory region.
> +      - First entry: SSI controller register space
> +      - Second entry (optional): XIP memory-mapped region for direct fla=
sh access
> +
> +  reg-names:
> +    minItems: 1
> +    items:
> +      - const: ssi_base
> +      - const: xip_mem

[Severity: Low]
Should reg use an items list with individual descriptions for each entry
(like clocks and dmas in this schema) instead of maxItems: 2 with a bulleted
description?

Also, although the snps,xip-enabled description states that it requires the
xip_mem entry in reg, the schema has no dependencies or allOf/if/then
constraint enforcing minItems: 2 on reg and reg-names when the XIP
properties are present, so dt_binding_check and dtbs_check will not catch a
missing xip_mem region.

> @@ -93,6 +104,48 @@ properties:
>        of the designware controller, and the upper limit is also subject =
to
>        controller configuration.
> =20
> +  snps,xip-enabled:
> +    type: boolean
> +    description: |
> +      Enable XIP (eXecute-In-Place) mode for direct memory-mapped access=
 to
> +      SPI flash. When enabled, the controller's XIP region is mapped into
> +      CPU address space for zero-copy reads and writes. It requires the
> +      xip_mem entry in reg.
> +
> +      XIP is used only when this property is present and the module
> +      parameter spi_dw_g2_mmio.xip_mode=3D1 is set. The default xip_mode=
=3D0
> +      disables XIP. Runtime control is available through sysfs.
> +
> +  snps,xip-continuous-mode:
> +    type: boolean
> +    description: |
> +      Enable XIP continuous transfer mode. When enabled, the controller =
omits
> +      the command byte on subsequent sequential reads from the same chip=
 select,
> +      saving 8 SPI clock cycles per access. This improves throughput for=
 code
> +      execution from XIP flash.
> +
> +      Requirements:
> +        - Flash device must support continuous read mode (e.g., Fast Rea=
d Quad
> +          I/O with mode bits)
> +        - Must use consistent command across all accesses
> +        - Not compatible with mixed command types
> +
> +      The controller automatically re-sends the command when CS is de-as=
serted
> +      or transfer type changes.
> +
> +  snps,xip-prefetch-mode:
> +    type: boolean
> +    description: |
> +      Enable XIP hardware prefetch mode. The controller speculatively fe=
tches
> +      the next cache line when the current access completes, anticipating
> +      sequential reads. This reduces latency for instruction fetches dur=
ing
> +      XIP code execution.
> +
> +      Best for: Sequential code execution, linear data reads
> +      Not ideal for: Random access patterns, small sporadic reads
> +
> +      Prefetch is only active when XIP direct mapping is enabled.

[Severity: Medium]
Do snps,xip-enabled, snps,xip-continuous-mode, and snps,xip-prefetch-mode
encode OS and workload policy rather than hardware description?

Whether an XIP memory-mapped window exists is already described by the
xip_mem reg entry and the controller's capability registers;
snps,xip-enabled acts as a software policy switch and documents Linux-speci=
fic
module parameters (spi_dw_g2_mmio.xip_mode=3D1) and sysfs interfaces in the
binding.  Similarly, snps,xip-continuous-mode depends on the attached flash
device and protocol layer rather than a static controller property, and
snps,xip-prefetch-mode describes workload tuning (sequential versus random
access patterns).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119100513.4330=
44-1-prakriti@synopsys.com?part=3D5
