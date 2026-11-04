Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.67.36.66
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793815842;
	b=D2EIfMH81zxTMo3ZU2MUu4H8XnqtPwteIIEZNq3AsP1jmVhWiKrBfM76jUCgiH9T7YG8
	 0AWDi699XtEUz80wBfE2C9rp6Wk/hFbTXZoft2Z9GXmOafZdAiDAJ3DktvKtINLRU+HhS
	 OsgIPv6ooM62P7C/KNWxeUGAJFmA3CHmq3dMRvwSv363UjINQXHAUw1fK8uQBdkhSbu3X
	 Oqso6mf4Q70Iigwja5b7JzHm+QVdPrEpMzLAzAz0Tl+MYBcV6nkpi2IztKk8BLUSIqhCF
	 H623z76wf5HKyE11j+tknOeX1A60lKtNvI/5B4wGzISZi+7B4Ei35qTanquGPRi43Jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793815842;
	h=DMARC-Filter:Received:DKIM-Signature:Received:MIME-Version:Date:From:
	 To:Cc:Subject:In-Reply-To:References:Message-ID:Content-Type:
	 Content-Transfer-Encoding;
	bh=9WkmYf7R4SGzBZAROx5aLx/oJoqChBMmnepUumVTYnk=;
	b=wqJG9Fi0oeolc+RsJBjmf6lcZo0p2EUsEqZGzwp1hQrPLq9lLi7mlWLnpjmTJrYgDCin
	 nYoWoIlcP7why7igDwlFM9+y1F+CgQHKpiI7hwhGJwz4j4R/W0NnqanXGsuINCyuSkbEO
	 YNg3FV7qvU9CgEuzHh5jATbAowMI3FlY2Ht7y5FSZ77dL7381Qmlk1n3G8uI+5sLRPalU
	 J0v9OuNTyfrKZAU3hjtuRgYY/jdLAOJ8BuOveAOq0Lfj4KcmfCdfHuBsj8WRxIKeUrHw5
	 PGzwn/JsaI9g9ajbGmp9Go8rHenDsI5NUpf/gSeEEmvkgwq2czHkdoexCGqgMrROsEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=posteo.net;
	spf=pass smtp.mailfrom=posteo.net;
	dkim=pass header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=1984.8680eb header.b=OF6qrx+w;
	arc=none smtp.remote-ip=185.67.36.66
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D95606A6A2
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 18:10:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34D95606A6A2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=1984.8680eb header.b=OF6qrx+w
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 83DB3240104
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 19:10:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1793815838;
	bh=9WkmYf7R4SGzBZAROx5aLx/oJoqChBMmnepUumVTYnk=;
	h=MIME-Version:Date:From:To:Cc:Subject:Message-ID:Content-Type:
	 Content-Transfer-Encoding:From;
	b=OF6qrx+wODiEsY1kg24OzHlmcY2J44GmixT/URw+Uy5VIKGWpJNE4lPIzbf2cFLm/
	 Z+1wptDWDG9bE6XRM249mIGrFXML9cOMdFAAx0AXXY3XxqgOP1RIdYu+Bc5tlrkLA+
	 cRcIOgaXaKt6PIet5xGHw6S85D+Krwh7O8KvduIrzB6LTDDrt2XtN/QuAul5MHtMNy
	 aJKd/8671w5XeTM4zQ2/wbHVuivELjBqUK3IrFHClTuHTPGiN9sicwsomGJsD3tJz3
	 CwVYHTFXWzPaQ8KTarQkS8fEPViApMpgRdRNyCpZsGqJthE9UZzGc5oANGK5WpeHGb
	 au9fPBHkeuUMA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4jKYQN2xfgz9rxN;
	Wed,  4 Nov 2026 19:10:36 +0100 (CET)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Wed, 04 Nov 2026 18:10:37 +0000
From: mateusz.nowicki@posteo.net
To: Guenter Roeck <linux@roeck-us.net>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-watchdog@vger.kernel.org, Julius Werner <jwerner@chromium.org>, Evan
 Benn <evanbenn@chromium.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Antonio Borneo <antonio.borneo@foss.st.com>,
 Marek Vasut <marex@nabladev.com>, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/3] watchdog: =?UTF-8?Q?arm=5Fsmc=5Fwdt=3A=20allo?=
 =?UTF-8?Q?w=20a=20list=20of=20SMC=20function=20ids?=
In-Reply-To: <c742c878-d4b2-48d8-972e-a09aa4d215c7@roeck-us.net>
References: <20261104161553.30115-1-mateusz.nowicki@posteo.net>
 <c742c878-d4b2-48d8-972e-a09aa4d215c7@roeck-us.net>
Message-ID: <37f9e5e73070972f224583bc1581e400@posteo.net>
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 11/4/26 Guenter Roeck wrote:
> On 11/4/26 08:16, Mateusz Nowicki wrote:
>> My earlier patch, commit ae4d08bbe3f4 ("arm64: dts: st: fix arm,smc-id
>> of the SMC watchdog on stm32mp2"), switched the dtsi to 0xbc000000. 
>> That
>> made the watchdog work with current OP-TEE, but it broke boards that 
>> run
>> the older firmware. So today 6.18.y uses one id and 7.4 the other. 
>> When
>> the kernel and the firmware disagree, nobody pets the watchdog that 
>> the
>> bootloader started, and the board resets after 32 seconds. Marek hit
>> this even with a recovery kernel, which is about the worst place for 
>> it.
>> 
> 
> So the DT on the board is updated to use the new ID but the firmware 
> itself
> isn't ? That seems a bit odd; I would have assumed that the DT on a 
> board
> is kept in sync with its firmware. Is that not the case here ?

Not necessarily. On these boards the DTB is built from the kernel tree
and installed with the kernel, U-Boot just loads it from the boot
partition. TF-A and OP-TEE sit in the FIP and are updated separately, so
updating the kernel alone changes the ID. That's how Marek got hit: he
updated OP-TEE, but his recovery kernel still had the old DTB.

>> The idea from that thread: let arm,smc-id be a list. The driver tries
>> the ids one by one and keeps the first one the firmware accepts. Older
>> kernels only read the first cell, so they behave exactly as they do
>> now. For stm32mp2 the list is <0xbc000000 0xb200005a>. Calling an id
>> that belongs to some other firmware service would be bad, so the
>> binding says the list may only hold ids known to be this watchdog.
>> 
> 
> Would it possibly make sense to check keep a list of known IDs in the
> driver ? It already checks 0x82003D06, so it might as well check a 
> sequence.

Fine with me, and it avoids the binding issue. I'd just rather not try
the ST IDs on every platform, so how about making the list per
compatible:

   compatible = "st,stm32mp25-smc-wdt", "arm,smc-wdt";

with { 0xbc000000, 0xb200005a } as match data for it. arm,smc-id stays a
single u32 and, if present, is tried first. Older kernels just match
"arm,smc-wdt" and behave as today.

If that works for you and the DT folks, I'll send v2.

Thanks,
Mateusz

