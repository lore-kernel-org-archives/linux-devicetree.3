Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9F8463B9E
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 07:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790752559; cv=none; b=szOCODDSuN3YSl+5/UtqvqYu+xqrjoPYguBZis2jdGUoq+0lhyTr5Q6jJMPvUo5wEcIzKVLiGk5S0ODTjo1bqWF8RuN1ag5CKXQBkrmdIXL7Vt54MAXi6kL6a57YCchKaw945JRuVb6i8XEHclB+oa+WR4fFs0q05En3hx60JO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790752559; c=relaxed/simple;
	bh=BNXOTOhJd8Vy5SeqbODKX71OpLt3hIYsfYYg+MIItYg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=R04vJTfRh7i9e1lpbBktL8EOqoA3XWNWMvLwG7uK0rjGSPNtejq3+Do6JFvgTZzWgA1KGPR7ueq2emI98G2ZWX1illSKd99MbLzXq2ZsCLaXy4tD6pzAWcafC6IYNbtXrSKXOa3f9m9bCG0N73y0CiGrCapNxRtAxeKPu6tI4FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IGowmX1/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IGowmX1/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47FE91F000FF;
	Wed, 30 Sep 2026 07:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790752557;
	bh=4Iu0D3Yqdsu7mM8afgIndpUi4hxmhLKzg/ExQRzjPAo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IGowmX1/cnITUIIbAUQD/3dx3DXLvpUlWsYFFKSSSM0dITFUM83u5CMYbPHghL1X+
	 a3UXB66VmWD37PDbpO5CzWYmyV1JlbTX+zByAM3dRwGrXuK6T0W8KU28zqes15Gvwk
	 WFqHtvZk4FX/gNDyLrqGhEGv1F6L1ny8OZ/xKvgoieB1i6DjEIyEMamH2pRwTX2ALZ
	 JMpTmxo8iS+HKhC1zI/H3T5dzPnel++K/9sfxTe53z7U6XZPuie/ewNtTlCjwOP7HX
	 vX4sh/nyzD696OME+2xHQMrPb9Zq6ohkNzOrOWd2aBlJz+mrazJbaSFNFUl+kVp2hX
	 ZzKwfTyqAIoeQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 3/6] dt-bindings: display: tegra: Document 8-bit CPU
 parallel interface
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: robh@kernel.org, dri-devel@lists.freedesktop.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260930070535.47130-4-clamor95@gmail.com>
References: <20260930070535.47130-1-clamor95@gmail.com>
 <20260930070535.47130-4-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Sep 2026 07:15:56 +0000
Message-Id: <20260930071557.47FE91F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] dt-bindings: tegra: internal DC engine modeled as standalone bridge
--

commit 01a8f6463a12799df86627d43eafd7a2899a713e
Author: Svyatoslav Ryhel <clamor95@gmail.com>

dt-bindings: display: tegra: Document 8-bit CPU parallel interface
   =20
Introduces a device tree binding for the 8-bit CPU parallel MIPI DBI Type B
interface provided by the Tegra20/30 SoCs display controller.

> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra=
-8bit-cpu.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,teg=
ra-8bit-cpu.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra-8bit-c=
pu.yaml
[ ... ]
> +description: The display controller in Tegra20/30 SoCs features an
> +  8-bit SPI interface that closely resembles the MIPI DBI Type B
> +  protocol and is referred to as '8-bit CPU'. Each display controller
> +  provides two such interfaces, which can be used to send MIPI DCS
> +  commands to initialize and control the panel while image data is
> +  transmitted via 16/18/24-line RGB.
> +
> +properties:
> +  compatible:
> +    const: nvidia,tegra-8bit-cpu

[Severity: High]
Does this modeling break Devicetree hardware hierarchy principles? By
defining a separate compatible string and standalone top-level node for what
is fundamentally an internal engine of the display controller, the driver is
forced to traverse the OF graph to its remote endpoint's parent and blindly
cast its drvdata to struct tegra_dc *.=20

If the Devicetree incorrectly connects this bridge to a non-Tegra DC node,
can the driver perform invalid memory writes and corrupt memory?

> +
> +  dc-gpios:
> +    description: Data/command selection pin.
> +    maxItems: 1
[ ... ]
> +  data-gpios:
> +    description: Specifies a set of 8 gpio pins used to transfer data.
> +    minItems: 8
> +    maxItems: 8
> +
> +  nvidia,init-sequence:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    description: Device specific set of values used in DC DISP_SPI_INIT_=
SEQ
> +      registers.

[Severity: High]
Does this property confirm the node programs the display controller's
internal registers? Lacking a reg property or a strict parent-child
relationship to map them seems to further indicate this should not be
modeled as a standalone bridge.

> +    minItems: 4
> +    maxItems: 4
> +
> +  panel:
[ ... ]
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Video port for DBI output (panel or connector).
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +required:
> +  - compatible
> +  - ports

[Severity: High]
Should data-gpios and the control GPIOs be marked as required? If the driver
unconditionally accesses priv->data_gpios->ndescs during MIPI DCS
transmission, omitting these bit-banged pins in the device tree allows
incomplete nodes to pass schema validation but causes a NULL pointer
dereference crash at runtime.

> +
> +unevaluatedProperties: false
> +
> +examples:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260930070535.4713=
0-1-clamor95@gmail.com?part=3D3
