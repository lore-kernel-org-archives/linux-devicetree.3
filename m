Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44203D3CF5;
	Tue, 28 Jul 2026 13:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785246594; cv=none; b=PD8wIYjGyAjNGWwHzJCG6qJsR5ggvLSRgElE/Kvky4BDLL9bBTgvs5KZQ88Ba+fSs+BMtxbES6G7DdRi3jowqhzT8ZMjsvUCecdK/DbvhkIvDASwX6ywmIfQVpv+YnHvRgRcgFqQMYFx8XX1c/ZAC5ky2NBCjyYdbHq7Sv7tsew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785246594; c=relaxed/simple;
	bh=C5yYxuoznYkx6jjuInKWBoafFhEWvSyRl81rU7O0L28=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K0kfIwyd6WpchFfTd7LF/mpo1eo/iDQ5QwZfdWeVdL55aw6qHr74XawWjZ/8I3gLngdhygO6gZLhxGNxd4wZOPrPyx1f2Dh5VY6C30AzCQpZKVGV9Stp0d98c0xswyzds3tBh0Ed9flZWxLllvZP/0bZsdPn4IOaS6VDNWbakxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=hAh/kji5; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="hAh/kji5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785246585;
	bh=C5yYxuoznYkx6jjuInKWBoafFhEWvSyRl81rU7O0L28=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hAh/kji5iB0/IrWz1bQpl2yth3JJZrnTM9K7hhQcwfzWZLk1QmmXef26bTzAGUcNR
	 LleJaTac6MAyAWCfYEa1OuIoIaygmYoE+F5+Okc/h6XhIJe2lL+ITfIwnnFAKFj0He
	 Bshv2dLXnYADYdyan2vlAT1ALumzzBOFfvTBRQAoCkblN3dJYEmbuxBqCOXOT76yGP
	 HBtCGvFEZHfRm1cHN3JnGo3/iQoyqYXnawXoPgTdzYmQiFzFGZA8ITGlKPRviMGbfi
	 V+n6FHcr6Ex3+/YD50PzKyQ26dQyh9e8VgoqNvZJlRtZ2WO4kOSVZsVVS7PjzJKuFH
	 AiKKsWAVU4zJQ==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B602C17E0678;
	Tue, 28 Jul 2026 15:49:44 +0200 (CEST)
Message-ID: <f3837531-2949-4741-a23e-387317485c02@collabora.com>
Date: Tue, 28 Jul 2026 15:49:44 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 42/46] dt-bindings: display: mediatek: Introduce MT8196
 2D Sharpness Processor
To: Rob Herring <robh@kernel.org>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 justin.yeh@mediatek.com, jason-jh.lin@mediatek.com, kernel@collabora.com
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com>
 <20260714114414.184512-43-angelogioacchino.delregno@collabora.com>
 <CAL_JsqJXpY8jHEgSHcHz4QZTFEZe8PLbO6vbpxWH4qobs0MPyA@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAL_JsqJXpY8jHEgSHcHz4QZTFEZe8PLbO6vbpxWH4qobs0MPyA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/28/26 15:40, Rob Herring wrote:
> On Tue, Jul 14, 2026 at 6:45 AM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Add documentation for the Two-Dimension Sharpness Processor, or
>> "TDSHP", found in many MediaTek SoCs including MT8196 and its
>> variants.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   .../mediatek/mediatek,mt8196-tdshp.yaml       | 98 +++++++++++++++++++
>>   1 file changed, 98 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-tdshp.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-tdshp.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-tdshp.yaml
>> new file mode 100644
>> index 000000000000..ccd6a8443443
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-tdshp.yaml
>> @@ -0,0 +1,98 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/mediatek/mediatek,mt8196-tdshp.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: MediaTek Display Two-Dimension Sharpness Processor (TDSHP)
>> +
>> +maintainers:
>> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> +
>> +description:
>> +  The MediaTek 2D Sharpness Processor (TDSHP) is responsible for performing
>> +  image sharpness adjustments/enhancements in a display pipeline.
>> +  This hardware block supports adjusting the luma and contour 2d histograms,
>> +  frequency weighting, luma-chroma gain and others, with adaptive weights.
>> +
>> +properties:
>> +  compatible:
>> +    const: mediatek,mt8196-disp-tdshp
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +
>> +    properties:
>> +      port@0:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +
>> +      port@1:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +
>> +    required:
>> +      - port@0
>> +      - port@1
>> +
>> +  trigger-sources:
>> +    maxItems: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
> 
> This causes a warning.
> 
> Seems this is in linux-next already, but no reviews?
> 
> Rob

Wow. No idea how clock-names got into the list of required properties: there is
only one possible clock, and this doesn't need any clock-names at all.

Same for the resizer binding.
Sorry for the mistake.

Cheers,
Angelo
