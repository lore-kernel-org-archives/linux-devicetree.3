Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2A64183D6
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 10:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780656269; cv=none; b=bHbW+MzDSonBfRnuh7V8afOP7BVrhEc56RSAgMUPxd4l4t1wKmI03ncqD3SJAv5muaPa4fbxx0bnJwA3+lqZFlI7wJFsBmZZaHF2ZjjSIvuZlcrN28kMfKKBC/pZXvYJFlD/2OFS03+b+uWFGn17b0T/FytMDUEr6x2L/tX2deY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780656269; c=relaxed/simple;
	bh=25yQeO6z/Sv42/XFzm0mTMdMDNT6A9j02g1aaly+XVM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hmGzFYCEq2MQut+BTKjHkFRnW/Y/whiR/4UKhjqvgmWcdNSuAF4GIc16fRrV603jHK1Fjms9ceY8zk/ZdCtlKA0XeIAUvL1V7jmFYNrBVYPotolhkU+WJF01lgk2QqRhJLh4gP/3bC6BKOeKvslWMhHAGbLYm+EOhf133xAu4bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aQ6+IxP/; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aQ6+IxP/"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-45ef189aa1cso1265992f8f.0
        for <devicetree@vger.kernel.org>; Fri, 05 Jun 2026 03:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780656266; x=1781261066; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gn6KVcQqqwpDjyvuwkRjE231Xsgcb7/5TEFaLWl5LFs=;
        b=aQ6+IxP/YZPiGc4rjULO+I8pnzxM++uhOZ5H6cT49SFKs8CeSvbCIEgG2pIzUS7OhP
         vfUpUksmm46nd/JW/LcW3yas5YQ9XOo8AzHab4z2MGlLqtYSnwhRnd06ukTGSWT9SQgK
         lxGFpWaNhPW9RVJ8ydTWQyw/7vNjnNND3IM6JkB89BdK6ZaeUCN2Ogtufl8X4qGyRQ4I
         jFjbAYmP8ImCc8V+T+GO5IDspKPpMHxp0MJaAC4/iW+XvEEsuY/IQUnoRQJlrochUQ0r
         Y+22mC2IGfszshR3hi6/ZN7vsfCGaHp/G1uGrGW8DuRGfQlePbL78sg2UE+HSrZiHzU7
         Q1sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780656266; x=1781261066;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gn6KVcQqqwpDjyvuwkRjE231Xsgcb7/5TEFaLWl5LFs=;
        b=BY14A17Xwb7O6wvPsSCjuEBsKC5xZttjFM5hA1rqj8RLlE9elgE8b0tBlAK7Phi3TE
         IIb9HFElyPLHgrs/kKwlvV57O/6bzGyQtqH+Q5wpUMMPnTuOz0IOkhfhWUFmxLgUaAwP
         FaMjtTF152kG6AECfpuFWeq8kh6bGOgpidC0RY4sCgQzoyMqFF9JE+42DQifN/AdsBW/
         +BTb7s1dn39Gw0+KiysCG5T1Xo231JZP75yq0ztbmieQ+k40+xsjgkw/3OE0cqvLgdBX
         kXnczpOKqVd4F/beK9V4D8SjqN1a9qBbhmSs1/uk1PoCFxmedfTB4seTsTUL11D/aX9r
         xZ/g==
X-Gm-Message-State: AOJu0YwAvDzPcr8dr5nyRNL2HPVwS2vEtXrrlizPWpCsx0LOkzdqeR6o
	qzG7nfhbQbDh/9tN5Flbo5IZxk3jUClIKm8skdlolY8598Z1NUXy+C19
X-Gm-Gg: Acq92OFQyqoCFDFZdl+OLeq5kH5Tx7sn6cG7hiwbq43WqRjuBKByFUfKoJOHFrtO5Af
	kZs1l3lbVRsVQWM1daTOUDbAwjwWx/zQbJHuHjxcdMxyVKSMpetoG131Uo18dkeoj28ZmgU074g
	0YQE9YzVc6w9m3zSat8qNxAMsXYx8s//XBTZ3Bd/DHHErkTlZ/RTtEETpJ3SiVecqD589q637Qu
	IHPDq8lwe4ZXTkIpv3NdclEbztF3ETaUVc/QogcxGRfm11T2AmnwgFDl2f5qzxA5C2HKpWs3iYZ
	kAQ6STOaooLOqVU16JLLa43b4g7HuINRHj0qUhgOfTV4GqxY24SiZbHjnsq9aMYGBZ4v7cvvWPC
	faVH2FEUq4XAWsJy7oXivd4CQCuRXA6GtbHI4ce8KWWfxn2ejphhwjszRjUV36ql/gMshfNMZc6
	VFP4iLmkG5L4QEhddO1HONrv+Nvuj2otBAcdgwrG98zvyCvEiJzGuWT6Uv0Sx63DhLTQ==
X-Received: by 2002:adf:e00f:0:20b0:45f:f142:d55c with SMTP id ffacd0b85a97d-4603063a8ffmr3523153f8f.22.1780656266046;
        Fri, 05 Jun 2026 03:44:26 -0700 (PDT)
Received: from [10.25.213.68] ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2e4004sm25066376f8f.9.2026.06.05.03.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 03:44:25 -0700 (PDT)
Message-ID: <cf7b4c03-e1f4-4439-8077-2f8677bb2cea@gmail.com>
Date: Fri, 5 Jun 2026 03:44:23 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] dt-bindings: dma: fsl-edma: add dma-channel-mask
 property description
To: Joy Zou <joy.zou@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
 Peng Fan <peng.fan@nxp.com>, Ye Li <ye.li@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260211-b4-imx95-v2x-v4-0-10852754b267@nxp.com>
 <20260211-b4-imx95-v2x-v4-1-10852754b267@nxp.com>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <20260211-b4-imx95-v2x-v4-1-10852754b267@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2/11/2026 1:28 AM, Joy Zou wrote:
> Add documentation for the dma-channel-mask property in the fsl-edma
> binding. This property uses an inverted bit definition: bit value 0
> indicates the channel is available, while bit value 1 indicates
> unavailable.
> 
> That was already used widely for i.MX8, i.MX9. Correcting the definition
> will break backward compatibility. This reversal only impacts the eDMA
> dts node and driver, and doesn't impact DMA consumer. Therefore,
> keep the inverted definition.
> 
> Also add a note at the top of the binding to highlight this inverted
> definition to prevent confusion.
> 
> Signed-off-by: Joy Zou <joy.zou@nxp.com>
Hi,

I believe this patch hasn't been picked up yet even though it's been ACK'd by one of the
DT binding maintainers.

Frank Li, can you please take it into your tree?


Thanks,
Laurentiu
