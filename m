Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B57138887B
	for <devicetree@vger.kernel.org>; Sat,  1 Aug 2026 06:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785567088; cv=none; b=JpX6C3MXrq52JyRMMK8eSmeeVIe/TC7E9pfzBOTAI6H6g/TLb6Jm4M6qdVs8VTLQHgTkRtz87UbKiHYHLMkXKFnadbFQd3YwGu9Vfrsi8uo+h6/2oioEmJZMs6rmEgEpWY/ymim/DUbDqF7q8Grgl0qXtD0xjdr6atH4S9fxGzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785567088; c=relaxed/simple;
	bh=kqQJ8xc3vkuS40H+cWObDa0dDEUwROCwDDmchGwzADo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gXekFxkC1geK3n7Q9uluhzmd/Q92bIaYL4jTdM2fNoKWsH3j+YjGlQTS24bZW5ShY2bicTv4J+68UGk2ZjUN/DVrbYEL2kZ1L1QRSnVwigyrKz8vy7JlmL3ZVX+T/Qey3XEvgaTOuXcd28gZOAnxqwOCO8AhpmqqvmdNk1uQypA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BHGwJOjm; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BHGwJOjm"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-496bb7cdf51so4363225e9.2
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 23:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785567083; x=1786171883; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ibyAvlXW4OBxswkrpuHvoKSISh5II++nXruZ8WtjRy0=;
        b=BHGwJOjmbNUchRQnHoIM4mVOfrT15+RGJRXRuCPQKlZCx/Yi3iS2sPb1Eenm1bLyxM
         D3zgsHKskE2xLg+W94ezxD6w99YkwWMjzCP7K5rFphGK5epMvH3koDUgBZZxCVVGg/jP
         NXfWqocqobyzBOGsRJyiHa40MmJaHMR/GmJ78IXNjf4oNf1of7VCQ9vD/4SfuEhLvFGY
         9VS6gwCg7eiQSvGmqrm7sytAv5AvTxSttZpDb3+O4qTrrUBP95b3S/+G1SxDGAnZRvxd
         URDjnEbOjUukNbIt7YuF8g/XrS9u9WbeF9SHtSdkdJkn9KQreGz3P/rYJRi2ChoVq1AV
         IqDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785567083; x=1786171883;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ibyAvlXW4OBxswkrpuHvoKSISh5II++nXruZ8WtjRy0=;
        b=kbJT3tLV3TL9+0h0vfZqQTsn8wH3kcolJ690mkwqSwabVXZslFKUUg6j1eKgHjQMkN
         SDxY+bf/n1ZuLCeiDeNaxNY9QHDPfPZCMvDYwFcZacewiGHZQt03A8veMn6u97iBLzla
         icoA//PfhLclhMSPkJW7nbmxKKKBAQRaH6QMDcAO6I5w+kUMur/0QRE9oR/KILCcFGjI
         V5ieyPxOqmMydNgZfgWb7wTSI8jIZ++7Yq3QVfHgOJUt2jZTLBe/VCAqn1FJi6bnSGIg
         tmv8PLX9tws960fz985DNZOfbe6HPIxC/hJYi1N8bixQY2q2zLpyZMFiHYINH6i6AKqm
         QiNw==
X-Forwarded-Encrypted: i=1; AHgh+RrK32Ueq+/2PABN9Ry8Bpxr/YHhxi9NFEwS6e3LTjmMTRcnEkehBXUMa1PFJBy/BxHrLpoq9woRtlzj@vger.kernel.org
X-Gm-Message-State: AOJu0YzprO/a/H9SIM8KWe8gGAwSZSDieExKcRj6DZ0CiowOnlzgbmxU
	ite6kaW0QxGPWOgI6jGWbck36+rgxMSCu868JzjrIuTGSZhveJRJnBxA
X-Gm-Gg: AR+sD138BEGST3AE0UyHO+YOLyEsFHiwVoQxu0c4bTZRrVO5/CGbOus37tbk6Ur7FGB
	N3+LNXsIRXeLcFfWjc9L61q7HqtDzQOGDFGJ6QpieNOTWlUP1ESzThD6/z4Ghvzq77E/Esa38um
	D53YutxzMu/1SsGPDTRo9N6/HniD5Kd00+1pQZQ0aO7Z/55OeuD71RrHJIyBqYk3RKhP63BVC1H
	CMfAOzeR18v2Mx5Evu1wjSwDohLoMsbP36Z0J5AHwyhY6ROF7IaKbDnS97psh0dpp0xB+dRHWC8
	d5FKVM1ILYmsCReuPnUzfTSrRjXhvqRgV4h8KP8WggQYkyBpP23vVtSILiqHeHuzDI3S5l1UtbF
	5NeUV1qYKXmBiRZ1oOWOiS9IfWAbA2MnNBhtdaB/Eqpwv2mRJLWbaqv0vfVUFDqTcG5Uan5H1se
	m6Wi3zvSv91fOn4MkR6lyLtnuEYIbuxlobG0Bl/Tp29rmFhdJvFXA34dExs0RAvGJ9kJ9TOp5BX
	4MvH/R3Z/pvXPUIqezmMtygHWCDjd4WxtdXsiVL3pUrz+tJq/09fFNj65IpDJw=
X-Received: by 2002:a05:600c:608e:b0:493:f140:c3fb with SMTP id 5b1f17b1804b1-4980c64a978mr24899205e9.7.1785567082676;
        Fri, 31 Jul 2026 23:51:22 -0700 (PDT)
Received: from ?IPV6:2001:9e8:f112:3801:7859:cd6f:5f73:7262? ([2001:9e8:f112:3801:7859:cd6f:5f73:7262])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b6745csm30760375e9.7.2026.07.31.23.51.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 23:51:22 -0700 (PDT)
Message-ID: <c55d6167-b8e4-42fb-a5b7-6b7eb5ae3a3c@gmail.com>
Date: Sat, 1 Aug 2026 08:51:21 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v10 1/4] dt-bindings: net: pse-pd: add bindings
 for Realtek PSE MCU
Content-Language: en-US
To: Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
 Kory Maincent <kory.maincent@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Daniel Golle <daniel@makrotopia.org>, =?UTF-8?Q?Bj=C3=B8rn_Mork?=
 <bjorn@mork.no>
References: <20260728084307.2129515-1-jelonek.jonas@gmail.com>
 <20260728084307.2129515-2-jelonek.jonas@gmail.com>
 <20260731171639.1baec9e5@kernel.org>
From: Jonas Jelonek <jelonek.jonas@gmail.com>
In-Reply-To: <20260731171639.1baec9e5@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 01.08.26 02:16, Jakub Kicinski wrote:
> The second patch conflicts on MAINTAINERS so unfortunately a rebase
> will be needed.

I'll do a rebase.

> On Tue, 28 Jul 2026 08:43:03 +0000 Jonas Jelonek wrote:
>> diff --git a/Documentation/devicetree/bindings/net/pse-pd/realtek,pse-mcu-gen1.yaml 
> While you rebase -- the AI points out that the binding is called
> ...-gen1 but it documents gen2 as well. Should the -gen1 be dropped?

Not sure, Conor before requested that the filename should carry
of the compatibles [1].

[1] https://lore.kernel.org/all/20260710-divinely-sharpie-1d415917c850@spud/

Best regards,
Jonas
