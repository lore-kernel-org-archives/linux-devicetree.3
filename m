Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0C34749E9;
	Wed, 22 Jul 2026 16:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784738766; cv=none; b=jlJ3by/Hivj3jZyR9l246oKxLZTimyDYqh1E2Z5y2lZoBxQtc3TiIG5Zu4Z+K+OBKBq/g2Mra7H+NkSS9KZBTZRO4dxxlMYEvUAZYM56crS4ZamRf7/HEHM6THG9HiN+Qp9ITw8QzY8vnhOxOz0TeFDG1zmh1zr3FchMiy93se0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784738766; c=relaxed/simple;
	bh=4GXWc7zsF+ibEj8DsgPTFu4T6tIdn48ap/74ncjUyU8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DOv+Nez0P+DfEC2KrdGvdL/W7Q7kYcewLaNF20+UaH0lyijubAwaoFe9K07FoI72Fdb8MN3otuhel+MGaJJ0YeEgWmExIYsdnY1ZkNMllrYx7pY0QfC331idedzWpegB/mXCr1594Cpd2J1duhc9zfj1aDIJZUfaPGIOVQHfmpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fhOjfDnE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fhOjfDnE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C95B1F000E9;
	Wed, 22 Jul 2026 16:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784738753;
	bh=2D+aH8WuHklyK0noK4NoQdLqwMi37J+55Pzl8huO7f8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fhOjfDnEANtN4cA7JZRnGj6Ny3KPd0RQnhcaM3BFHt/Q0OGYZdbjYJ2ooAAyfpE2Y
	 mXXl+Ur6e738u5fFX7IAbVXlEjDSa07/7OD2byumLtEEq3a+2TkLbLJvQQO6yVukgq
	 KFIJiwhJjazkUHT8PT8KXQRZTPP+4ixr+vElC5s19MFbh4wmi4J68i9Zy9nJwh3P4T
	 q0WTb0e353E2uM1ewNzU8UdKRRFY+N4DEecY3SApW1nVl/u12Nn7HPKrmmeHlEJxj3
	 R4XbVw5zKGh2VtORI4CKw/CQEtMZ4FQSCA2FPaIl4/9APzwnkZR1cEjTz79hA5uXrx
	 oafSQ8cvtYpBg==
Date: Wed, 22 Jul 2026 11:45:51 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, krzk+dt@kernel.org,
	conor+dt@kernel.org, matthias.bgg@gmail.com,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, justin.yeh@mediatek.com,
	jason-jh.lin@mediatek.com, kernel@collabora.com
Subject: Re: [PATCH v2 34/46] dt-bindings: display: mediatek: Introduce
 MT8196 Output Processor
Message-ID: <20260722164551.GA1079705-robh@kernel.org>
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com>
 <20260714114414.184512-35-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714114414.184512-35-angelogioacchino.delregno@collabora.com>

On Tue, Jul 14, 2026 at 01:44:02PM +0200, AngeloGioacchino Del Regno wrote:
> Add documentation for the Overlay Output Processor IP found in
> the newer Generation SoCs like MT8196, MT8894, MT6991, and their
> variants.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../mediatek/mediatek,mt8196-outproc.yaml     | 107 ++++++++++++++++++
>  1 file changed, 107 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-outproc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-outproc.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-outproc.yaml
> new file mode 100644
> index 000000000000..7deffba46404
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-outproc.yaml
> @@ -0,0 +1,107 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/mediatek/mediatek,mt8196-outproc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek Display Overlay Output Processor
> +
> +maintainers:
> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> +
> +description:
> +  The MediaTek Display Overlay Output Processor hardware handles the
> +  post-stage of pixel processing in the layer overlaying process and
> +  is also capable of performing gamma correction, ensuring that the
> +  per-pixel values are within the expected luma range.
> +  If an instance of this hardware is configured as last stage, it is
> +  also capable of generating VBlank (Frame Done) events which can be
> +  then dispatched either via an interrupt (to the CPU) or through a
> +  Global Command Engine (GCE) Event, internally sent to programmable
> +  Command Queue (CMDQ) Engine(s) for offloading purposes.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt8196-disp-outproc
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  interrupts:
> +    description: Optional VBlank event interrupt
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +  trigger-sources:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names

Not a defined property. You should have gotten a schema warning on the 
example.

Same problems as the other patches that I raised.

Rob
