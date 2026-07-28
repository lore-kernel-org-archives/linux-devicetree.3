Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2A33AA507
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 13:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785246060; cv=none; b=rawiVYdPmE/HrgEixrKmjX85Hk4tV/SyvsQv61uPVPM+ss0WGh6luCI6NHKJ0XsaNeOYnp6dpqef/Jq9Q1k2lAqlr/S5sdabUEWitjlnJN1+kQGa5RjBK9Ac+0qgdyaP491sg9Jy370qEkbHiBdB4OJQmCMhCmokT62TpKe/BAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785246060; c=relaxed/simple;
	bh=DhEDDIHsMKbny4hUeLUu84KjOl77WbOtKnFgo4mtyJk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qYzz+8CwV8VoS6FHrQYZaioAx22iqK9Q6ZBG5cojMC8GssGD5G/H2EQrP+mH4DwZg4W8VlPu1lCBzxCLynHTNqMTaca0PewKY+6uCj/7Ruh9flQuql+HZXVC0xuej6RMrUoHvUTF0RzchGX+1tw+Lg+2z48Xqd6EhLm4ZuIr2Zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VOtQRQ1F; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VOtQRQ1F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 365A01F00A3D
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 13:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785246059;
	bh=uLE38ZE2Nl64r7ZYfy8C3Gaet0hedSBZyrnSuaM9AOo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=VOtQRQ1FNHpJCY6oZv+tRM7rG9KnugRqsOTe8hlqzlQ8jYSSZU6bbWmAZBX4ACMb2
	 ZIHFthXA17nF/SHqFUfiJdgQo7fR3M58h3L3q1iMyesmMYEfxTKk6TWyEUoYD17UJd
	 PvXMB51Shd7xCpfH3wHC1Dr07oxsmEk1+JqJmk9v8cQMBexHzDoJioBoiDI1L+XueJ
	 vkB+e8EyB8QwO/W5b0e6uD9QuwWiQ3FKTW1oKpzszaiMrdlaMkKVi9rEZl7ZWHGPqc
	 /CcrGqfisQMhMqU901n1J5ldGQChP1nfpVTFXZhF/BYETGAEYR69Ji1w5q2Wr3agTO
	 GEm5wH+FwHOLA==
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c15d3cd51b2so491361566b.3
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 06:40:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RojkF02MSXWV1uTvZlY0XiJ7yr50vxrqZO1ItuoUMb2rtc0RRsPudEIPbAuFNe1dnFpb6JapXMEpAV1@vger.kernel.org
X-Gm-Message-State: AOJu0YwF+bmnxe2jHcSqECUroW6KaHn8mReDnpKuRSsfZ9FXBCcpOU8m
	VcPsr5Nhbok8lU/8Q9osyXPh2cgz9DFw0RVf1hjs4WNKoUjJ4JOrOHZAJJSgF5YekvXMM0DsWl3
	4yLo/gY/xMxZ1yFlXH0OaOkWqQoluoA==
X-Received: by 2002:a17:906:ee81:b0:c19:6104:e5e4 with SMTP id
 a640c23a62f3a-c1f7209ca5cmr127185766b.20.1785246057830; Tue, 28 Jul 2026
 06:40:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com> <20260714114414.184512-43-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260714114414.184512-43-angelogioacchino.delregno@collabora.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 28 Jul 2026 08:40:45 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJXpY8jHEgSHcHz4QZTFEZe8PLbO6vbpxWH4qobs0MPyA@mail.gmail.com>
X-Gm-Features: AUfX_mxvmD92NXelgjlyAlofvaufu78xVu0ncLV-YvDBbjclxGqXQU3uLBZ5iYE
Message-ID: <CAL_JsqJXpY8jHEgSHcHz4QZTFEZe8PLbO6vbpxWH4qobs0MPyA@mail.gmail.com>
Subject: Re: [PATCH v2 42/46] dt-bindings: display: mediatek: Introduce MT8196
 2D Sharpness Processor
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	justin.yeh@mediatek.com, jason-jh.lin@mediatek.com, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 14, 2026 at 6:45=E2=80=AFAM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Add documentation for the Two-Dimension Sharpness Processor, or
> "TDSHP", found in many MediaTek SoCs including MT8196 and its
> variants.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  .../mediatek/mediatek,mt8196-tdshp.yaml       | 98 +++++++++++++++++++
>  1 file changed, 98 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/me=
diatek,mt8196-tdshp.yaml
>
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
mt8196-tdshp.yaml b/Documentation/devicetree/bindings/display/mediatek/medi=
atek,mt8196-tdshp.yaml
> new file mode 100644
> index 000000000000..ccd6a8443443
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-=
tdshp.yaml
> @@ -0,0 +1,98 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/mediatek/mediatek,mt8196-tdsh=
p.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek Display Two-Dimension Sharpness Processor (TDSHP)
> +
> +maintainers:
> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> +
> +description:
> +  The MediaTek 2D Sharpness Processor (TDSHP) is responsible for perform=
ing
> +  image sharpness adjustments/enhancements in a display pipeline.
> +  This hardware block supports adjusting the luma and contour 2d histogr=
ams,
> +  frequency weighting, luma-chroma gain and others, with adaptive weight=
s.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt8196-disp-tdshp
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
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

This causes a warning.

Seems this is in linux-next already, but no reviews?

Rob
