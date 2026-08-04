Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA8D3E8C46
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 18:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785867593; cv=none; b=R3/RFnph1hflWNbOFFd0v/JYZQaHC2wG9s9EMQcch1gYo/QIe+qpPgQGxeUdrTAuQMp0Gx3V7+d7zxxFokutw4KIKrcIFoIYSysJz/iUWTaanZBdSbeaREZDKr7hRGY5rfEKVg9I5/Iw8zoJe4iQMFvtA3Bz35RgF2+ViIgHwPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785867593; c=relaxed/simple;
	bh=lwVpzPCfbjzp9mXZYfyeywWcC/pc+LKghT01hxblgh0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ArtLkDmYhjJKFEfeknMJ6tv1vMo2XnJ1DxExlm51BScTmYcEky6FOUqUqOQSzQcKt5QktM1bp9BG6rLCN0GV9/GndIgLzJccjy5qokhcCKIcOegzuNnjogOCw9WxCcNqaLRe19TKay7U3DAicsxFvRjai7zgmC7o3d23CSkQQcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kr8iHNeJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kr8iHNeJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF58C1F00ADB
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 18:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785867590;
	bh=g08EIf41pC8GEK9juMB6Ku4OixyItou7ZrSB0SvDB9s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=kr8iHNeJzCoBt8T5H1O+CsSYeURejmgFk0XvAfR/2ONMKEAFnb6CjQqNUvOMVSPRA
	 ZL/Xrc7myD6X+jqx+rcLPhlIFPdB65yiJEAifRCHWYZHfj6BePng4G6AtrxfdIEwqX
	 F2tDKhsXa6GF1mk8MMrYhi++cKPMaoLvphgiRbuvt+8cTRDZqYcPD4ngwu0lWxC6uw
	 bHqAtt3rA9z78B5LygutAIV1fzRfUPNEC471W1eq3uH1Ofm6cp5xEE1j94KafFS0s7
	 7CpT1a8z4HmUP9mNa0wZ6x0PfM1hDGMC3c6T0EslehRErWUkL6QZcHXunGBmH9Pytj
	 uLp9fVs88Gygg==
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c15d111ca99so23614266b.0
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 11:19:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrzzPKW/NY7tfovvb5oSs9IQOnvWzTa5r4TLXpKg2Ok4bOjl8KAQkGnha957gKXPpDUfOvcneXbQN9c@vger.kernel.org
X-Gm-Message-State: AOJu0YyDVSj9J+oe0GooPqDqmecRl8oJUYZTdFUBOEi/LdkWUNEGp5F9
	Cve/YXJmBK+qpz21Ze9Zf1X6l8UuXpyCtKROkPFWqyfp46jjRHc0fbF/oqHtgFPnCWUQddacsfx
	I0TUqMlHyyhjoX9ba6dINkEihMWzKSg==
X-Received: by 2002:a17:907:1c86:b0:c16:b05c:b9cf with SMTP id
 a640c23a62f3a-c2039cdc721mr25942266b.26.1785867589418; Tue, 04 Aug 2026
 11:19:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com>
 <20260714114414.184512-43-angelogioacchino.delregno@collabora.com>
 <CAL_JsqJXpY8jHEgSHcHz4QZTFEZe8PLbO6vbpxWH4qobs0MPyA@mail.gmail.com> <f3837531-2949-4741-a23e-387317485c02@collabora.com>
In-Reply-To: <f3837531-2949-4741-a23e-387317485c02@collabora.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 4 Aug 2026 13:19:38 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLVAQ6uhU0fGK_qnOn1x559ErWSJTKkSjr0z791thwD3w@mail.gmail.com>
X-Gm-Features: AUfX_myLekSI9jogdlVNQCKmwUBvLh2cfWQ2ZHLsEAU03-4FpLXeKk3q8NZzUt8
Message-ID: <CAL_JsqLVAQ6uhU0fGK_qnOn1x559ErWSJTKkSjr0z791thwD3w@mail.gmail.com>
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

On Tue, Jul 28, 2026 at 8:49=E2=80=AFAM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> On 7/28/26 15:40, Rob Herring wrote:
> > On Tue, Jul 14, 2026 at 6:45=E2=80=AFAM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> >>
> >> Add documentation for the Two-Dimension Sharpness Processor, or
> >> "TDSHP", found in many MediaTek SoCs including MT8196 and its
> >> variants.
> >>
> >> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@c=
ollabora.com>
> >> ---
> >>   .../mediatek/mediatek,mt8196-tdshp.yaml       | 98 +++++++++++++++++=
++
> >>   1 file changed, 98 insertions(+)
> >>   create mode 100644 Documentation/devicetree/bindings/display/mediate=
k/mediatek,mt8196-tdshp.yaml
> >>
> >> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediat=
ek,mt8196-tdshp.yaml b/Documentation/devicetree/bindings/display/mediatek/m=
ediatek,mt8196-tdshp.yaml
> >> new file mode 100644
> >> index 000000000000..ccd6a8443443
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt81=
96-tdshp.yaml
> >> @@ -0,0 +1,98 @@
> >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/display/mediatek/mediatek,mt8196-t=
dshp.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: MediaTek Display Two-Dimension Sharpness Processor (TDSHP)
> >> +
> >> +maintainers:
> >> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.c=
om>
> >> +
> >> +description:
> >> +  The MediaTek 2D Sharpness Processor (TDSHP) is responsible for perf=
orming
> >> +  image sharpness adjustments/enhancements in a display pipeline.
> >> +  This hardware block supports adjusting the luma and contour 2d hist=
ograms,
> >> +  frequency weighting, luma-chroma gain and others, with adaptive wei=
ghts.
> >> +
> >> +properties:
> >> +  compatible:
> >> +    const: mediatek,mt8196-disp-tdshp
> >> +
> >> +  reg:
> >> +    maxItems: 1
> >> +
> >> +  clocks:
> >> +    maxItems: 1
> >> +
> >> +  power-domains:
> >> +    maxItems: 1
> >> +
> >> +  ports:
> >> +    $ref: /schemas/graph.yaml#/properties/ports
> >> +
> >> +    properties:
> >> +      port@0:
> >> +        $ref: /schemas/graph.yaml#/properties/port
> >> +
> >> +      port@1:
> >> +        $ref: /schemas/graph.yaml#/properties/port
> >> +
> >> +    required:
> >> +      - port@0
> >> +      - port@1
> >> +
> >> +  trigger-sources:
> >> +    maxItems: 1
> >> +
> >> +required:
> >> +  - compatible
> >> +  - reg
> >> +  - clocks
> >> +  - clock-names
> >
> > This causes a warning.
> >
> > Seems this is in linux-next already, but no reviews?
> >
> > Rob
>
> Wow. No idea how clock-names got into the list of required properties: th=
ere is
> only one possible clock, and this doesn't need any clock-names at all.
>
> Same for the resizer binding.
> Sorry for the mistake.

Why is this still in linux-next?

Rob
