Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9068D361943
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 08:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790236922; cv=none; b=GO11mqNbIV0tl7bwN//swFH7WiyC+hTKG1u8LPPvMYo75z8GxdagEYLghNTq3IRFXWqnVXFPAeg7kQ4z/bg+gvSJAWy/FDxzT3rM6KVpOh/en8i6qr9sNPyPQrcSm0W3qhcXWPUqsjlGxIL5n4/oNJeSyy2fwLR8YbbLQHj9ySg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790236922; c=relaxed/simple;
	bh=o2N9AkVUCZyMoNAeP65SCokgX8tRnpuzYE0+igUvLTA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EpeKWTv8I4AlH5uQnsevWG24S3isHNF6j/uoIPyWP5dt3flute0Jp46oVJDlQMzPDB+wk4O8b5raGettqJZyYG3eD0tmLUwiRl2lFzaO+Tj3waJxSKSz0smPMmLp0z31iyqpQSSFZC4kHGblPcFmNdWej96BAn7Y7wbleM8yqGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nElzTAav; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nElzTAav"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E0161F000FF;
	Thu, 24 Sep 2026 08:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790236917;
	bh=WdfbuDrb4DSjS23VrblxYXb3wzWN2lwW48EEaZ0HEKU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nElzTAav1HUzjZL2KTfi5eJlLxSgAP/nf3LeB6HCCGH27oJ62K1xXuO/EGkPAnYzI
	 EWvNAUPe6T3p5Me3/BXf9M19eCm4kiZvNHqqZk7QoF/s/16+CqzlXPVSn+izc1C4wS
	 cHApQxJB8CBeFIFVJW/UsfO2zV628lfhzs9zA4l6yWguUjCpaukdNmObHGebNqC4R1
	 4TCZXuW4G2nkJ5SA9m4VB5FIclz0AJhU1GtqjfCDdFACKkub6YBgFuRR5mwPJRQc9h
	 DsGdfla3NaBZ90bsdOEQKbgbx5WJXQnT8wnf9EEeYNDyrzftPyoliddxLgtuJKa4Sf
	 WJ72DXHFIfOXA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 3/6] media: dt-bindings: Add Amlogic V4L2 video
 decoder
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhentao Guo" <zhentao.guo@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, neil.armstrong@linaro.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260924-b4-s4-vdec-upstream-v10-3-1289303a58a4@amlogic.com>
References: <20260924-b4-s4-vdec-upstream-v10-0-1289303a58a4@amlogic.com>
 <20260924-b4-s4-vdec-upstream-v10-3-1289303a58a4@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 08:01:56 +0000
Message-Id: <20260924080156.9E0161F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] dt-bindings: amlogic,s4-vdec: missing interrupt-names in required l=
ist and example
- [Low] dt-bindings: amlogic,s4-vdec: unbounded array properties missing ma=
xItems
--

commit ea1e1b5dce46c139b8fcb208da9bf35c4469463a
Author: Zhentao Guo <zhentao.guo@amlogic.com>

media: dt-bindings: Add Amlogic V4L2 video decoder
   =20
Add bindings for Amlogic hardware decoder accelerator.

> diff --git a/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml=
 b/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml
> new file mode 100644
> index 0000000000000..751043c3d9ccf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml
> @@ -0,0 +1,114 @@
[ ... ]
> +properties:
> +  compatible:
> +    const: amlogic,s4-vdec
> +
> +  reg:
> +    minItems: 2

[Severity: Low]
Should the reg property include a maxItems: 2 limit?

Since the reg-names property strictly enforces exactly 2 entries via its
items list, omitting maxItems: 2 allows the schema to incorrectly pass
validation for device trees with 3 or more entries.

> +
> +  reg-names:
> +    items:
> +      - const: dos
> +      - const: dmc
> +
> +  interrupts:
> +    minItems: 2

[Severity: Low]
Is a maxItems: 2 limit missing for the interrupts property?

Since the interrupt-names property strictly enforces exactly 2 entries,
omitting maxItems: 2 allows device trees with 3 or more entries to pass sch=
ema
validation.

> +
> +  interrupt-names:
> +    items:
> +      - const: hvdec
> +      - const: vdec
> +
[ ... ]
> +  power-domains:
> +    minItems: 2

[Severity: Low]
Should the power-domains property specify a maxItems: 2 limit?

Since the power-domain-names property strictly enforces exactly 2 entries,
omitting maxItems: 2 allows device trees with 3 or more entries to pass
validation.

> +
> +  power-domain-names:
> +    items:
> +      - const: vdec
> +      - const: hvdec
[ ... ]
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - power-domains
> +  - power-domain-names
> +  - resets
> +  - amlogic,canvas
> +  - amlogic,secure-monitor

[Severity: Low]
Should interrupt-names be included in this required list?

The interrupt-names property is defined with exactly two items but is
omitted here. Since all other -names properties (reg-names, clock-names,
power-domain-names) are explicitly required, this omission allows incomplete
device tree nodes to pass schema validation.

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/amlogic,s4-pll-clkc.h>
> +    #include <dt-bindings/clock/amlogic,s4-peripherals-clkc.h>
> +    #include <dt-bindings/power/meson-s4-power.h>
> +    #include <dt-bindings/reset/amlogic,meson-s4-reset.h>
> +    video-codec@fe320000 {
> +      compatible =3D "amlogic,s4-vdec";
> +      reg =3D <0xfe320000 0x10000>,
> +            <0xfe036000 0x20>;
> +      reg-names =3D "dos",
> +                  "dmc";
> +      interrupts =3D <GIC_SPI 91 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 92 IRQ_TYPE_EDGE_RISING>;

[Severity: Low]
Should the device tree example include interrupt-names?

The example fails to provide interrupt-names, which reflects the omission in
the required list and results in an incomplete DT node.

> +      clocks =3D <&clkc_periphs CLKID_DOS>,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924-b4-s4-vdec=
-upstream-v10-0-1289303a58a4@amlogic.com?part=3D3
