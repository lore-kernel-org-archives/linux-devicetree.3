Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A373EDE63
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 10:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784111663; cv=none; b=RlQf5sFtqwsWVsZlIyiZa1WFhquTkdtK+W8LYGsqr0ukom3MbJj6f/QWztRtluZHPP8qyrUTpEYoXVKkhq8D4tpqFkcrNfLaL1JqnpZgXLp0gzPT2Fe+/AKFNI2QcxbIL7A6pN0Q9OY1TfxB+1kseNtiefwAbGNiYP/14m1pU+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784111663; c=relaxed/simple;
	bh=BY1dfJtHJHns5U1FDqyS/3wcoH2BVUMdbq1WxRrtVgY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=V/EjTC3+ItmIfuygwS78xZmufQtrIAUnFoiD2yH8rFsq9pwj/cg8oe0pF3Y93gx3oLWGlVcOMcQst/nioyezJPD27aWbq9thtG1vKP7889uO04yqqM6p2vBo8uSStwpdGQjLwbTzWVp0lg91vvJw4qBepnLaIvLWeQ8pQ8GuQAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Nhb2emEq; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Nhb2emEq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784111660;
	bh=BY1dfJtHJHns5U1FDqyS/3wcoH2BVUMdbq1WxRrtVgY=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=Nhb2emEqeE86boKnr1qHupaV4yMkzvZG3cf5v3Zkimnmksin8e9dK6k/4f4w27imt
	 GPY17kHjGy6ezx0Pr7U4GWyQnPBoxdUgJ7dvOnzSteWGJ29fHezuXkRnG30AjKeEXS
	 s9JBc8A7reVlNF8rJRET2cY6RLDDXjFI4qAoolbKWRIDbmAz5JzpsXZ7BGBKC85yuZ
	 9TSpgmlya0hN+ItZigQ3iujtS0kL+4od4sBFd5mDTcoJhX0bDQPtnaS0f0aHWs1o9r
	 SlNJrwGPDaoH77Hg3lr0OaNDSseqaZiRe4k5irw5oPs47o8dALDwI5r3yFN/iq4MQ+
	 v+gxWF/S3of+g==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4B6C817E00F6;
	Wed, 15 Jul 2026 12:34:20 +0200 (CEST)
Message-ID: <f6daedf2-2a3a-4abc-a726-5e401e325976@collabora.com>
Date: Wed, 15 Jul 2026 12:34:19 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/10] dt-bindings: display: mediatek: wdma: Add
 compatibles for more SoCs
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, sashiko-reviews@lists.linux.dev,
 CK Hu <ck.hu@mediatek.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20260713142746.40259-1-angelogioacchino.delregno@collabora.com>
 <20260713142746.40259-10-angelogioacchino.delregno@collabora.com>
 <20260713144221.2C4F91F00A3A@smtp.kernel.org>
 <20260714143433.GA1476641-robh@kernel.org>
 <e8d3efc2-bc93-438a-a45d-6ae0b303ad02@collabora.com>
Content-Language: en-US
In-Reply-To: <e8d3efc2-bc93-438a-a45d-6ae0b303ad02@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/15/26 12:29, AngeloGioacchino Del Regno wrote:
> On 7/14/26 16:34, Rob Herring wrote:
>> On Mon, Jul 13, 2026 at 02:42:20PM +0000, sashiko-bot@kernel.org wrote:
>>> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to 
>>> consider:
>>> - [Medium] The compatible string `mediatek,mt6893-disp-wdma` is incorrectly 
>>> added to the standalone enum instead of the fallback items list.
>>> -- 
>>>
>>> --- Patch [9]: [PATCH v4 09/10] dt-bindings: display: mediatek: wdma: Add 
>>> compatibles for more SoCs ---
>>> commit 8001f83833ae9c684be67bc719c7aaa056f90763
>>> Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>>
>>> dt-bindings: display: mediatek: wdma: Add compatibles for more SoCs
>>>
>>> Multiple MediaTek SoCs have the Write DMA hardware in their Display
>>> Controller. This commit adds the missing compatibles for Dimensity 1200
>>> (MT6893) and for Kompanio 500/520/820/1200.
>>>
>>>> diff --git a/Documentation/devicetree/bindings/display/mediatek/ 
>>>> mediatek,wdma.yaml b/Documentation/devicetree/bindings/display/mediatek/ 
>>>> mediatek,wdma.yaml
>>>> index 97d052b0fb614..c3ed867d058d9 100644
>>>> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
>>>> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
>>>> @@ -22,11 +22,16 @@ properties:
>>>>     compatible:
>>>>       oneOf:
>>>>         - enum:
>>>> +          - mediatek,mt6893-disp-wdma
>>>
>>> [Severity: Medium]
>>> Does this incorrectly place mediatek,mt6893-disp-wdma as a standalone
>>> compatible string rather than in the items list requiring a fallback?
>>>
>>> If a device tree uses compatible = "mediatek,mt6893-disp-wdma" to satisfy
>>> this schema, the DRM driver will not probe the device since it only matches
>>> mediatek,mt8173-disp-wdma. If the developer instead provides the fallback
>>> compatible = "mediatek,mt6893-disp-wdma", "mediatek,mt8173-disp-wdma" so the
>>> driver can probe it, won't the device tree fail schema validation here?
>>
>> Sashiko fails to look at patch 10. However, the commit message gives no
>> clue whether mt6893 is or is not compatible with something else. If not
>> compatible, explain why it isn't. What's different?
>>
> Eh, MT6893 supports 64-bits image data destination address (has two registers,
> lower 32 bits and upper 32 bits), while MT8173 and others supports 32-bits only.
> 
> Should I resend with an improved commit message, or would it be fine to change
> that while applying?
> 
> Multiple MediaTek SoCs have the Write DMA hardware in their Display
> Controller. This commit adds the missing compatibles for Dimensity 1200
> (MT6893), supporting image destination address of up to 64 bits, and for
> Kompanio 500/520/820/1200, fully compatible with MT8173, supporting only
> 32 bits.
> 
> Cheers,
> Angelo

Nevermind. I missed a compatible and I anyway have to send a v5.

Cheers,
Angelo
