Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B852440A3B;
	Wed, 22 Jul 2026 16:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784738404; cv=none; b=sJlMOtaSy0UfL+7l96+WakPbkCOC0u6WBMO+tSDovHL3AAvbHqpesziFDDzRlFShLpo3aNWPPxphFwoJCCPnHpccmjEeoCHVGZtl6GjdRSo/ebytdYQCq/DLPMb0WjCWOJ9SEclptR+aa8SKQ6JLmlWZ0WbSgNr5r9YlxPMsehg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784738404; c=relaxed/simple;
	bh=IxuY5Yy2+bxQ50G6EPCluh37NLO448od94aJA4UYTJY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dr2LQxAbyt6x1VvyfgnGl34m8vbZFozniGCKBlDpEUNPOLTCpqkxSZ92eVxsGAj7yR77rKfkgBpowDdLp7aVynilAplP1yoc06B+yrJ9GBT+FSSsi1LCF5KDs5hggS+0VI3AKac8cT6whZhIupPDzOG2PDTjMD1fKo2CkNtMf5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=eHXd4ulJ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="eHXd4ulJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784738396;
	bh=IxuY5Yy2+bxQ50G6EPCluh37NLO448od94aJA4UYTJY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eHXd4ulJMx0crFk7Dr3i+pMm/cnivYbupFgA0CnfYAqtWh85kRODN1K3eKwN5vJJE
	 6JY5bMmRGFE/9Llcc3mZ4qHUjFU7Q3mCb57+NC+imT7ZK/n2NJxfri3DhdVK3GchE7
	 oL5n3NsOY8go2mCSmv+99myb2WIt5x754QJe9ZrRH8/NBs655zRUy91m5v5niCkYLQ
	 5f6CGeScCfNN+dLZl+yhJVoOXvpKN/l21HJ6UQSqmFCRBDaz4fORGrDunqKKp+W8fb
	 ZiCqpfCUTTvXxvotIqLGD4xmnhrfaCzHtru7NBoEeXmxMeRrtacLJCckRBAp8Rzsm/
	 59oNtmWDFzvLA==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 09F9717E04AE;
	Wed, 22 Jul 2026 18:39:56 +0200 (CEST)
Message-ID: <2949748a-2a37-46f9-996b-8e2438c8f8f8@collabora.com>
Date: Wed, 22 Jul 2026 18:39:55 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/46] dt-bindings: soc: mediatek: mutex: Allow
 #trigger-source-cells
To: Rob Herring <robh@kernel.org>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 justin.yeh@mediatek.com, jason-jh.lin@mediatek.com, kernel@collabora.com
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com>
 <20260714114414.184512-13-angelogioacchino.delregno@collabora.com>
 <20260722154500.GA988735-robh@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260722154500.GA988735-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/22/26 17:45, Rob Herring wrote:
> On Tue, Jul 14, 2026 at 01:43:40PM +0200, AngeloGioacchino Del Regno wrote:
>> This hardware controls trigger sources, and there's even a generic
>> binding just for that: allow #trigger-source-cells in MuteX, so
>> that this is allowed to provide triggers to external HW.
>>
>> Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> You ack-ed your own patch?
> 

Mysterious things happen in my workflow... :facepalm:

>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   .../devicetree/bindings/soc/mediatek/mediatek,mutex.yaml      | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
>> index 5267cfe92572..886e6f904b78 100644
>> --- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
>> +++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
>> @@ -54,6 +54,9 @@ properties:
>>       items:
>>         - description: MUTEX Clock
>>   
>> +  '#trigger-source-cells':
>> +    const: 1
>> +
>>     mediatek,gce-events:
>>       description:
>>         The event id which is mapping to the specific hardware event signal
>> @@ -116,6 +119,7 @@ examples:
>>               interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_LOW>;
>>               power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
>>               clocks = <&mmsys CLK_MM_MUTEX_32K>;
>> +            #trigger-source-cells = <1>;
>>               mediatek,gce-events = <CMDQ_EVENT_MUTEX0_STREAM_EOF>,
>>                                     <CMDQ_EVENT_MUTEX1_STREAM_EOF>;
>>           };
>> -- 
>> 2.54.0
>>
