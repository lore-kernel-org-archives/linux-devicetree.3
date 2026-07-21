Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545CD39E178
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 11:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784632827; cv=none; b=WDFJFVj4s2Nh9DDgP7BmiKpDm0ImNNjskaZEZxf909mqDvi0cyjoTg4yE2/kYi/E+/YYB7N9T6sXXnXSzA8X1K4aypTg5uwwQ6kuIG/sQyPGlfAkihlbvCbY843r0di+qlK/4Rtd2zx1wqFcjzcAU/VMil88x39LOEyDE4LLqyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784632827; c=relaxed/simple;
	bh=Kj6Sq/dewmHjeSaoGuBiJwWTo9WUVoBNljxhaERKTq4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=McSEeIWUHat1/6wCePiCS8Yy0HJU9qUos+Cn51HY0bn2pYOIDqQEdXXKM1mio0Xdwxvqr27MI3Js8bAB5m1tkylwhQFdWzeN/Luh/9HQAYPEsgPTiHMuOWHENfcV+J645Tt42PpPTKQWEbdmO9Bu4YD6Rjtx2bDtSoGJpqdabx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=CGCptJZI; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="CGCptJZI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784632824;
	bh=Kj6Sq/dewmHjeSaoGuBiJwWTo9WUVoBNljxhaERKTq4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CGCptJZIikrxmB+WcrsSwRJHP2tGNQQgrGR1lwhQQ1Y9D/90Vns7R8T32kePm4ZHX
	 LbdBDnPLKoNr59r+g9NyZXN0okpcTeJsTgOAbSyX09uSynj566BCENmbs7WWXeCp4k
	 l4JfuuxmxT7s2PaoxtJNaD4Je8s3R3PfPbpejOR4AmcjuML26to++roZ6PkRRDSWZz
	 DeB7+rvuvF9e60+pdX9LnZEjjXrIlWOrhvf12Gn6CzBsOnF6uSrGpnDt7G+9kKarVS
	 9TBC2b7F3wfWDYUum04synTqvmbLJycXC6bz6B3707OQjNAcb0eRDjQ+l5YkjG7sFR
	 x6CI26VEKqJKA==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5D6F817E0857;
	Tue, 21 Jul 2026 13:20:24 +0200 (CEST)
Message-ID: <92727d47-cb26-4ce1-85c4-daebb9c2149d@collabora.com>
Date: Tue, 21 Jul 2026 13:20:24 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: thermal: mediatek: Make resets
 optional for MT8196
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20260721105230.101906-1-angelogioacchino.delregno@collabora.com>
 <20260721105230.101906-2-angelogioacchino.delregno@collabora.com>
 <20260721110155.4A4931F000E9@smtp.kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260721110155.4A4931F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/21/26 13:01, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Driver-Binding Mismatch: The `lvts_thermal` driver unconditionally requires the `resets` property, which causes probe failure if omitted on MT8196.

No, that's not true.

> --
> 
> --- Patch [1]: [PATCH v2 1/2] dt-bindings: thermal: mediatek: Make resets optional for MT8196 ---
> commit 8c88985c870e0f500a0c1636d7b632cee772d3c6
> Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> dt-bindings: thermal: mediatek: Make resets optional for MT8196
> 
> This commit updates the device tree binding for mediatek,lvts-thermal to
> make the resets property optional for the MT8196 AP and MCU platforms.
> This prevents hardware resets that could result in thermal protect
> shutdowns or permanent system slowdowns.
> 
>> diff --git a/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml b/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
>> index 9752351306703..29f431fcdcd5f 100644
>> --- a/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
>> +++ b/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
>> @@ -94,12 +94,23 @@ allOf:
>>           nvmem-cell-names:
>>             minItems: 2
>>   
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          not:
>> +            contains:
>> +              enum:
>> +                - mediatek,mt8196-lvts-ap
>> +                - mediatek,mt8196-lvts-mcu
>> +    then:
>> +      required:
>> +        - resets
>> +
>>   required:
>>     - compatible
>>     - reg
>>     - interrupts
>>     - clocks
>> -  - resets
> 
> [Severity: High]
> Will omitting the resets property cause a probe regression?
> 
> Looking at lvts_probe() in drivers/thermal/mediatek/lvts_thermal.c, the driver
> unconditionally requires the reset control:
> 
> 	lvts_td->reset = devm_reset_control_get_by_index(dev, 0);


The driver uses devm_reset_control_get_optional_exclusive() in commit 2.

This is a false positive.

> 	if (IS_ERR(lvts_td->reset))
> 		return dev_err_probe(dev, PTR_ERR(lvts_td->reset), "Failed to get reset control\n");
> 
> If the property is omitted to conform to this new schema on MT8196 boards,
> devm_reset_control_get_by_index() returns ERR_PTR(-ENOENT) and the driver
> aborts probing.
> 
> Should the driver be updated to use devm_reset_control_get_optional_exclusive()
> or similar to match this binding change?
> 
