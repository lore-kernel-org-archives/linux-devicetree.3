Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48CC83C1D7B
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 07:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786088595; cv=none; b=QDkb5RXbvVj27SGMgZzQwk3+kpSMvjSZt7ZY208k1ZKaMqaRTCXH/Ay352vMV215od3D3NunGGVMJrY4RFf8jZuZ+UlVy9DCulfR0FTxj0WZUen3FTGNKof+7gOs70sTwoyLLS3MJkZhUfmZk0utHs+g0vYAcAB3mL8I8+PRIJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786088595; c=relaxed/simple;
	bh=Fmz7AZKsG717uv6lMqTfuAi2/NLNUBtufTTMjxplSxo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=LWZI53+aZgtFx0keYXc9sv5nETA6wM9w9ZCqaxwcIv7fckTYjCt3A2YiXnHL7PnKxgQLLluS9VuE2io1H9rqnHYxDmxalktsuWGPRwQ2hqTklqacmaIl3DxYY57S96bV++kvX6MVl6lbw/HtKilc3TI2K4odlu7qeF52UMUc9TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osyx.tech; spf=none smtp.mailfrom=osyx.tech; dkim=pass (2048-bit key) header.d=osyx-tech.20251104.gappssmtp.com header.i=@osyx-tech.20251104.gappssmtp.com header.b=Zpxz7bwX; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osyx.tech
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osyx.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osyx-tech.20251104.gappssmtp.com header.i=@osyx-tech.20251104.gappssmtp.com header.b="Zpxz7bwX"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4954f5e8020so15873065e9.2
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 00:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20251104.gappssmtp.com; s=20251104; t=1786088591; x=1786693391; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qp8n1eykcjli1ON25O/cMqkIDEqgBT+HFe8eeuMsJIk=;
        b=Zpxz7bwXGqAQFGv5PhjdSyJPFIWEp3OMNBntnE2+0fOpWXlu9qJpNcMHfD2QONoeHA
         QZKoa02mslXIfh4xhzcGoAVsqYZsTgYUM8zxss1WgEa9Kd4Bwj4pk46mcjUj6GAL0hp2
         1W9pAeMtZGyt2o5HL7swWGMsw9ExEX+OORzU9/iqx6pHEv/+ZNYUlbOqAXKf1c8mQwq5
         WvtAhBAT+j1Ihf3VBm68UaYO0vummBeNuTchK3nVevoAePAu68OZL1iX4aYSbm+i7VLe
         g29L67VQHcCp7WKxTXLQk95OxqUDsGNZBwRf5EvgJAq03fJunVRWaQsODzcHM86xVdOm
         zopw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786088591; x=1786693391;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qp8n1eykcjli1ON25O/cMqkIDEqgBT+HFe8eeuMsJIk=;
        b=hr9kF950pJKLPHwS6WALZaDy4fJvDP02Ou1mPsMDPAvq+/Ek9TyT3z2zY0PvDMXDm1
         49i3ZmK57PEt83S8seDKmhGcP08BoP6kCDlHTGyOpQEbXsV7bYn9iVULX0UMAqXHI3cr
         U+JcACZHF7uw9Ze8jPPqdeuUa1YE0ym9O/q9M1kKe6UnxKpMH7VRk5uLCR99pqdk/PGo
         Va7Ox1fV2NwQjWuBJEwELg1YqNtIM6v0OTWYciCNq8Ii5zRLJwqstwx6aRzvncRjxQd3
         UfDu6gTM1bVNGfAO/R/s5kesUz7cBm+chtrHt1kfSykN/avVfjLtmjKI0uuhsKSnAMBo
         2yyg==
X-Forwarded-Encrypted: i=1; AHgh+RqXGm91fAbgcmJwvo3WCqhDrIXO1PpOmNgsSZNDxH/xzetftRcxWo3HNa3SA2iEjD55QmV79SFRnX7p@vger.kernel.org
X-Gm-Message-State: AOJu0YyB0iQjShteZXNg473/XfyxxGw9sIAat9ADt/7jc23Efta2Uc5n
	jVP1zPQ7S/YSv3WMj0CQTqyOWheYuFl2hBqh8RVgWL8Z/ciALpcfIzY2wS79UCTi4MYC
X-Gm-Gg: AR+sD11sGmAlrYkaC1LzWk3RpsYKJeKSuCx2OgwGT5/RB1Q/9UUmndk1wEGO4BE/6fy
	5PaywAbepeI4IrxGZzqRVHwBfjck4LO5iV6q72cIhQjrJq3kzPBmcNfVXur2d+71tIg8w0hznVd
	7BFCz8UObNLg3M5vtDbzFP6b+iw62SuNr3V7zplA5WJWhJTnlOIASGyriimKrvPErrtDaRR1UdB
	bR6T6NG/ohDg7BWs5YoM3O5SmGepsSWE3THIqCN6EBXOrewAx5dJtQ2/nszdzSYS2SKJQU4axYO
	BAKQePSg2QE7zBAhfW8QcfYkbaZptsTueJQuoux0jy1RPsA1wnu3pLhmDC5owOLhnhG6ZXUMCz0
	8AiH3iL+TuI4Zjkztwywdh9+rjNQ8mrDzIjeNGyac8GAngJP+RknmcpJYlJkLC7TNamGGRYVwjJ
	xjV60LADQNnpomAa3yuj/dssRYmFXgApJGksAJHnlkUI33SZAhM2LG7gbhMgz90jqMY1nPV0ryv
	tnzL28LGLACX+2NNkkmOP9jlFHWb5SpvA==
X-Received: by 2002:a05:600c:35d1:b0:499:5e9e:1f50 with SMTP id 5b1f17b1804b1-4995e9e207dmr18816635e9.4.1786088590793;
        Fri, 07 Aug 2026 00:43:10 -0700 (PDT)
Received: from ?IPV6:2001:8a0:f59c:a900:2600:fba1:8d1e:1692? ([2001:8a0:f59c:a900:2600:fba1:8d1e:1692])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021e8cd0sm3174147f8f.17.2026.08.07.00.43.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 00:43:10 -0700 (PDT)
Message-ID: <20f4dad8-0ac5-4fc0-866a-38721371ba63@osyx.tech>
Date: Fri, 7 Aug 2026 08:43:08 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?Q?Jo=C3=A3o_Peixoto?= <jpeixoto@osyx.tech>
Subject: Re: [PATCH 3/6] dt-bindings: Add Bao I/O dispatcher driver binding
To: Krzysztof Kozlowski <krzk@kernel.org>, joaopeixoto@osyx.tech,
 linux-kernel@vger.kernel.org
Cc: ajd@linux.ibm.com, alex@ghiti.fr, aou@eecs.berkeley.edu,
 bagasdotme@gmail.com, catalin.marinas@arm.com, conor+dt@kernel.org,
 corbet@lwn.net, dan.j.williams@intel.com, davidmcerdeira@osyx.tech,
 devicetree@vger.kernel.org, dev@kael-k.io, gregkh@linuxfoundation.org,
 haren@linux.ibm.com, heiko@sntech.de, jose@osyx.tech,
 kever.yang@rock-chips.com, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, maddy@linux.ibm.com, mani@kernel.org,
 nathan@kernel.org, neil.armstrong@linaro.org, palmer@dabbelt.com,
 pjw@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, robh@kernel.org,
 will@kernel.org
References: <20251224135217.25350-1-joaopeixoto@osyx.tech>
 <20260107162829.416885-1-joaopeixoto@osyx.tech>
 <20260107162829.416885-4-joaopeixoto@osyx.tech>
 <35100734-e2ea-459e-9b47-5cc62aa99b38@kernel.org>
Content-Language: en-US
In-Reply-To: <35100734-e2ea-459e-9b47-5cc62aa99b38@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 1/7/26 16:47, Krzysztof Kozlowski wrote:
> On 07/01/2026 17:28,joaopeixoto@osyx.tech wrote:
>> From: João Peixoto<joaopeixoto@osyx.tech>
>>
>> This patch introduces a device tree binding for the Bao I/O Dispatcher,
>> a device used in backend VMs running virtualized devices (e.g., VirtIO).
>>
>> Signed-off-by: João Peixoto<joaopeixoto@osyx.tech>
>> ---
>>   .../bindings/bao/bao,io-dispatcher.yaml       | 75 +++++++++++++++++++
>>   1 file changed, 75 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/bao/bao,io-dispatcher.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/bao/bao,io-dispatcher.yaml b/Documentation/devicetree/bindings/bao/bao,io-dispatcher.yaml
>> new file mode 100644
>> index 000000000000..8ca450e4b9d5
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/bao/bao,io-dispatcher.yaml
>> @@ -0,0 +1,75 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id:http://devicetree.org/schemas/bao/bao,io-dispatcher.yaml#
>> +$schema:http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Bao I/O Dispatcher Device
> No, you don't get multiple devices per every driver.
>
> Look at gunyah or Mediatek Genio. Come back when you solve ENTIRE
> FEEDBACK given to them first. And then say how you solved that feedback
> because so far I see you only ignoring review of your LLM slop or other
> Microslop product.
>
> Best regards,
> Krzysztof
Thanks for the pointers, and sorry for the earlier churn. I looked at how
gunyah and the Mediatek Genio bindings model this and reworked the 
dispatcher
the same way: there is no longer a single node describing N devices. Each
backend device is its own node with one reg region and one interrupt:

   shmem@50000000 {
       compatible = "bao,io-dispatcher";
       reg = <0x50000000 0x01000000>;
       interrupts = <0x0 0x08 0x1>;
       bao,id = <0>;
   };

A backend guest that services several frontends instantiates several such
nodes. reg and interrupts therefore have maxItems: 1. The driver was
rewritten to match (one platform device -> one device model -> one
/dev/bao-dmX) dropping the internal N-device array, the global DM list and
the indirection ioctl.

I have also gone through the rest of the feedback on the series (the 
ipcshmem
binding, the misc-device conversion, commit messages, changelog, threading)
and addressed each item; the cover letter enumerates them. The binding 
passes
`make dt_binding_check`.
