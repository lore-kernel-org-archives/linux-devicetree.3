Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792651760;
	b=WgaYNMyc4T8tAowvl8aleKBtXpfT5S/Q6YrEAO4qLo1aL0fFvBUfqnI+aMSV/xrxyx2T
	 v4m5Ezxw/U++5j82IlohrT8AT20BCpC1aN1KUcR4tsCy/EC3N7ZvYFePUjA9FG5CVzVPi
	 1zRa4B3Edg0jA12hM19dBFHr02TqBj9Tal0skUwcbUl2PwOG5Z/KS+SaoSa4Vf1AxH8tr
	 2GY63JaHh74Bwj9sdE+XdiF52mrlB62l4wjZyHwj+5GNS8qGSZdufoXZ4hctt0yiCNflF
	 SWnWJRbkqY2/57QXPtar92buhaPpbWaulLKy2d8ZWQcdAS6ykt2qw9eZu+u1C7SgoOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792651760;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=7BdQnJdK6SLZhFnA/mwA5xjlMt0ujwToEYHfrb2Nk+0=;
	b=n5FdKe65RjzBiK4BOf7q2znPvnUDvm0n+4u6R5KhailNZ0YoCAR5rzGSd/9jSbeYKH2d
	 EZAKxT8eZ2V0Jp6B/xik6/ll/aPynTTx1wBKBrdU6wbS3xYxblmeeloJURIgsbDeC9be9
	 vj09YryLDhrSHOrCS92EoN5uwWQH2nvpV3FzVAWM4PYUPFfuwI2rsdxCCG1eeoOZl0FvN
	 1tdN+0mQx6UT+I4sSgTXA2r1vWTzJQ6ZeBywHgX6m88iKcM2wEgRM1cMYol5ODhVYIZaz
	 vP1qpJilLcSRBMWAnlcCba/JC7+MtR4do7MfWHbeDreS4wG8QNXpLcUtGFUSfXtDBNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=koMwoVLZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26027606A31B
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 06:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=koMwoVLZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A86581F000C1;
	Thu, 22 Oct 2026 06:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792651760;
	bh=7BdQnJdK6SLZhFnA/mwA5xjlMt0ujwToEYHfrb2Nk+0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=koMwoVLZuuak293qdAE5sSt45MMKnr7mkI6NBgT+vuoKPpH16nPclRj/jU6VhGxld
	 r5mlUmEZldZGxH7dt1t6WaVrf16md7vKjf6XQoZASCNGSr1W/zeYQDmEOdKSrx1Rvx
	 YtRhzHsYXynRFSuUexuWw/0vqEuvnfuuScXD/vbR+uXDPsWEBaUsU4vYAvYiyIPHi1
	 ja8Bq6KKxEGHLQVmQrCduqLbyRotY2/Hi0vGRQwb9v0RaINnrBnXY1aCGFh1q8Efpu
	 EhW1nH9vNaJnlxzUadc4ffvRWkr1USzloiW5Buo7Oilur+QJrv145CHGaynIkfrK+7
	 O5EyhJlkZ8Y/Q==
Message-ID: <sashiko-outbox-181105@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: soc: document Casio fx-9750GIII
Reply-To: sashiko-reviews@lists.linux.dev
To: "Artem Novak" <artem122novak@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261022063902.471383-1-artem122novak@gmail.com>
References: <20261022063902.471383-1-artem122novak@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 06:49:19 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: soc: renesas: misplaced board schema and missing root =
node check
--

commit 954525625db8c56e7940385b08c24b1985903147
Author: Artem Novak <artem122novak@gmail.com>

dt-bindings: soc: document Casio fx-9750GIII

This commit adds the casio vendor prefix to vendor-prefixes.yaml and adds a
new Devicetree binding schema for the Casio fx-9750GIII graphing calculator
based on the Renesas SH7305 processor.

> diff --git a/Documentation/devicetree/bindings/soc/renesas/casio,fx-9750g=
iii.yaml b/Documentation/devicetree/bindings/soc/renesas/casio,fx-9750giii.=
yaml
> new file mode 100644
> index 0000000000000..f3c1c02f1bd5f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/renesas/casio,fx-9750giii.yaml
> @@ -0,0 +1,33 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/renesas/casio,fx-9750giii.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Casio fx-9750GIII Graphing Calculator
> +
> +maintainers:
> +  - Artem Novak <artem122novak@gmail.com>
> +
> +description:
> +  The Casio fx-9750GIII graphing calculator is based on
> +  the Renesas SH7305 processor.
> +
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        const: casio,fx-9750giii
> +  required:
> +    - compatible
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: casio,fx-9750giii
> +      - const: renesas,sh7305
> +
> +required:
> +  - compatible
> +
> +additionalProperties: true

[Severity: Low]
Should the casio,fx-9750giii and renesas,sh7305 compatible strings be added
under properties in Documentation/devicetree/bindings/soc/renesas/renesas.y=
aml
instead of creating a standalone per-board schema file?

In Documentation/devicetree/bindings/soc/renesas/, existing SoC and board
root-node compatible combinations (including SH-Mobile SoCs and third-party
vendor boards) are consolidated in renesas.yaml:

Documentation/devicetree/bindings/soc/renesas/renesas.yaml:
  properties:
    $nodename:
      const: '/'
    compatible:
      oneOf:

With a separate casio,fx-9750giii.yaml file, when running dt_binding_check =
or
dtbs_check on device trees using casio,fx-9750giii or renesas,sh7305:

1. Because properties in casio,fx-9750giii.yaml sets additionalProperties:
   true without constraining $nodename to '/', the schema can match non-root
   nodes.

2. Because the custom select block in casio,fx-9750giii.yaml only matches
   casio,fx-9750giii, a device tree specifying renesas,sh7305 with a
   different or invalid board compatible will bypass this schema during
   validation, and other SH7305-based boards cannot cleanly share the
   renesas,sh7305 SoC entry.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022063902.4713=
83-1-artem122novak@gmail.com?part=3D1
