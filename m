Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A60E344DB5
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 07:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791789212; cv=none; b=YlwuQXmN0qEkurehEZfReeSkBQCdSSBaAezR8Law9uWYVPH9as8YAMqSA90nx79sICpkZJz6XIAYk0rIeX5Gq8HIaJqfxpidF0Wl9/TNmfFY9ZGBn8LlIzgGJLXPqktcEo/1T1d/YCXzFmdxvRNbYL+sTIxgvioGAlTcnordgjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791789212; c=relaxed/simple;
	bh=DGvkmq4+EjnMEWjQSxuCoRxOcpwv8WQRcJXTyLtuE+0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=ilbgghexHd91TCMxoD/I539MQghlS54HJev10wNHenz9/iLUVw3JqJFgV2Rfh9oZbl2hayFSCTGXMrsCABcW2owS0tKPOh26f+SLI4WW4ftOAt44K23yad7EmQdn4R832lgZUib6UTu930XxojyzFEZOowHaAGoB33wLDMYrmh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZM13eROd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZM13eROd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42DAE1F0089B;
	Mon, 12 Oct 2026 07:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791789210;
	bh=Wk1YgX+JwCRBoXgwopV5P61jFYBRUySBF7WBFxlgVew=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZM13eROdScVRAzK9s0LSvEzS8nRPGqWXeWc8V9GqGDPhz7ABL02viU1joahrwLBkq
	 Jrdg3Hoi13q3GiYGmorTpiGgXB7fj07MGqTArICuYc6DxvmLFua0j/jhrFVTeqg/jO
	 V8ZBF769k3rq160QKg3ZVqtgfxmvCWfRMVmIi0M8dzv9OkmwKS23b3yjsq9SRA8CY9
	 IzkdFafUDCmNOUSFWnhRd61eYhafkkiI4rlhf2uwGwebEMH4j6iLQS1gexkjyP8yI9
	 HcDwt3lqB4sXmZ/rBlinm755/Y3KdBnmVhvSZqn3ugj654CQDFb2gLHko+okoUzGqe
	 5+2EOjlg0FAwQ==
Message-ID: <sashiko-outbox-167782@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 3/6] media: dt-bindings: Add Amlogic V4L2 video
 decoder
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhentao Guo" <zhentao.guo@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org, conor+dt@kernel.org, media-ci@linuxtv.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20261012-b4-s4-vdec-upstream-v11-3-25939f85ada5@amlogic.com>
References: <20261012-b4-s4-vdec-upstream-v11-0-25939f85ada5@amlogic.com>
 <20261012-b4-s4-vdec-upstream-v11-3-25939f85ada5@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 07:13:29 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: media: amlogic,s4-vdec: incomplete validation for inte=
rrupts array and names
--

commit 0c8109e65ab164df82b0c800ca621bbe98ed15f7
Author: Zhentao Guo <zhentao.guo@amlogic.com>

media: dt-bindings: Add Amlogic V4L2 video decoder

This patch adds the device tree binding schema for the Amlogic hardware
decoder accelerator. The device supports stateless H.264 decoding on
Amlogic SoCs.

> diff --git a/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml=
 b/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml
> new file mode 100644
> index 0000000000000..75b9ba3cb08d2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml
> @@ -0,0 +1,114 @@
[ ... ]
> +  interrupts:
> +    maxItems: 2
> +
> +  interrupt-names:
> +    items:
> +      - const: hvdec
> +      - const: vdec

[Severity: Low]
Does the schema need minItems: 2 here for the interrupts array? Without it,
an incomplete node with only 1 interrupt will pass schema checks while still
failing at the driver level when index 1 is requested.

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
Is interrupt-names missing from this required list?

Leaving it out permits incomplete configurations to silently pass schema
validation (dt_binding_check). If the driver fetches the interrupt purely
by index (e.g. platform_get_irq(pdev, IRQ_VDEC) where IRQ_VDEC is enum 1),
omitting interrupt-names from the requirements allows device tree authors
to easily miss the correct ordering or provide only one interrupt, leading
directly to driver probe failures or incorrect interrupt routing at runtime.

[ ... ]
> +      reg-names =3D "dos",
> +                  "dmc";
> +      interrupts =3D <GIC_SPI 91 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 92 IRQ_TYPE_EDGE_RISING>;
> +      clocks =3D <&clkc_periphs CLKID_DOS>,

[Severity: Low]
Should interrupt-names be included in this example?

The example currently omits interrupt-names completely, demonstrating how a
functionally incomplete node is permitted by the schema.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012-b4-s4-vdec=
-upstream-v11-0-25939f85ada5@amlogic.com?part=3D3
