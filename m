Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB8D282F0C;
	Sat,  9 May 2026 02:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778293511; cv=none; b=LdsZM8wU9HtNpppprc4/4CCgwwvTjSqqXpWnzgUOp9C6GllVSI3keJqKIIZYBH7P61l0Hm/Z6O76e+fBEMWXI4xuFo4+5ZczFJGNDKTG9VM3fzMuWITyz+FPbJcc3q5t7x+XSvXJD94mDHcL1skvX/V9TWm+jHv8YTvjHum3YPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778293511; c=relaxed/simple;
	bh=1gLrHmaH7ze3TUA14OWHdsqLiAi6ZCfvrAyNi0rJuRM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B4wkHzGvQGZDnpquujiPrZqkTsvfAqcJOgRl9koo+yPGjpwuiGyWguv6Th8jUHcgxyxJ2Ms//e1QZxGFrNOlGQc/A3Xp4mwSevT3q5kHUYkHTBIvMIofYveQPfVoDJGObAIS6oOPcfwWDr5HbgwSk2f7JQIK4CKAOTRA/nSqwqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=XA0zSWNG; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="XA0zSWNG"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 943A3113FEF;
	Sat,  9 May 2026 04:24:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1778293502;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=Es6Vws/eOKlp6GKSxTpWgYQiUx72bXIcoH8A5zQmI8s=;
	b=XA0zSWNGfIxfsU8SO9vPVaT8aQl+J5o0UthVWlclapZjE/zgJ7/eZJCXPN2uwMa9juvK8B
	m9Mi86M8qs7rcfw1wDbLqqGfDiHOuCPjFch5xeWBroP0yeZzFOnt7y0AjBTF2uuAZeNtSM
	VNhQs1KBv7APWyl4yYTRwFZjiLkjG7BRM+5WHqKJQef/KPWLOxReqyjcQ/3ELrvR9hFSSF
	7Y6URWipGU+NTPHQ7xA7VyH4/Bta28WropyrSB0am8ENasGLcJk8KN9G1fSlyA0QB1mJHz
	3r70vA694+HII200i+TmUiEApOfhWDXcQ5fxPtrlUhRJv/kjWxoLxTAlR1xXkw==
Message-ID: <decbcc28-831b-4220-90ee-fa32d9ce2e2f@nabladev.com>
Date: Fri, 8 May 2026 23:47:48 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] arm64: dts: imx8mm: imx8mp: Add LVDS DTOs for Data
 Modul i.MX8M Mini and Plus eDM SBC
To: Frank Li <Frank.li@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 devicetree@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260407211850.79881-1-marex@nabladev.com>
 <65342735-44b3-4a2b-90ab-6093e0fd91c9@nabladev.com>
 <af4FO5vOx3ruwWBE@lizhi-Precision-Tower-5810>
 <dec2a7f6-80fd-4692-8936-969f8837a555@nabladev.com>
 <af5EWnJyP6leh5ao@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <af5EWnJyP6leh5ao@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 5/8/26 10:15 PM, Frank Li wrote:
> On Fri, May 08, 2026 at 06:20:10PM +0200, Marek Vasut wrote:
>> On 5/8/26 5:46 PM, Frank Li wrote:
>>
>> Hello Frank,
>>
>>>> this patchset is now split. How can we proceed ?
>>>
>>> I am thinking about it. I found an old thread
>>> https://lore.kernel.org/linux-devicetree/20250902105710.00512c6d@booty/
>>>
>>> The current code base already supportted partitial of it, such as gpio and
>>> irq map for connector.
>>>
>>> Internal chancel liu have prepared version by use nexus mapping for audio
>>> boards, which almost done to send out to review.
>>>
>>> I want to wait for a little bit well to resolve or partitial resolve N x M
>>> problem.
>> DT connectors have been discussed for the last 10 or so years and three is
>> still no real progress.
>>
>> I would be happy to send a follow up patchset which would convert the DTOs
>> to whatever connector implementation format lands in the future, but I am
>> concerned that waiting for DT connectors will block this patchset from
>> landing for a long time.
>>
>> So how about finalizing this patchset, landing it, and once connectors
>> become available, I will send a follow up conversion patchset ? Would that
>> be workable for you ?
> 
> We still have times, can you wait for chancel liu's patch for a while to
> check if his method can help this situation.
Do you know when chancel liu's patch is going to be submitted ?

Is there maybe some preliminary version I can try ?

Thank you for your help !
