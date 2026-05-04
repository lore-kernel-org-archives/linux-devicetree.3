Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14193D47C1
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 13:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777901767; cv=none; b=eLmP2YK4IBIU3yLkTVzXlv1sltR/dMouM7xJl+SMQzZ5BhBDkhnAlcA4LXh+jRJDqnlNeoZlsg4RdY+a+JyZ03c3culC3UojBIv5Re+JlHYxP7TQ6b5gtGM4PpW+XR7bSltfQbe6CHWjNEMPdqSVRROjvQErBYxPB8JplIzj9nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777901767; c=relaxed/simple;
	bh=LERfixZ4A/mCAlL4UIEjVNTDqF1ZRae/7FZpoHehMsc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ueb4AE7LZClaTQ4lsU15IYwvVo0+OGI1D48JsEHn23pBJp5b8MLZjRA+AVwC8Abxw5abilTeHf36u0GgxbyNy/z9z5X3Qkl9INl7KopEm745z/FabeU4AYJjZyQ+O1jZ8b6i2J+KojW6MiBmdFRxNvWDbc+iltzdSkwOloRwREU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=jdq1jjAf; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="jdq1jjAf"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-8ee62a19730so445815885a.3
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 06:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1777901764; x=1778506564; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z9fU46qFzoianaIQCMZvMdojbyNNsa2tYadi8NkaEg8=;
        b=jdq1jjAfQDruf/IUUDdbyNqKpRRmR14Z90v/aHuamXGsdJwHq5BOfPxg3NTODmNbwn
         QpcQYjUfmTVUNzXNggQC1TQE8++GnJXfkhkJpZ+ZNhib84+lkNLY/jU+boYCmFQupKTM
         kFoUOAZhAySGm8/RFSEKdQCcJIDoJV7jYr/DR6GEOjS0MiQVvQ5dtUiTk8MtQrLTy9c4
         Bllqmx7n8xIR1q/oUeGcRL7Ul/IDy//xs4wFGZnwgnkJsLzf2s1UDYV73Z9pLuHmSJP8
         BpjVbQiyJbUFR4da2z956FssezxIHJ0ghMZ7GogDvCO1OLRAln4amQerQXKU5YFAtfeP
         /88Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777901764; x=1778506564;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z9fU46qFzoianaIQCMZvMdojbyNNsa2tYadi8NkaEg8=;
        b=YPEX7uedy8fMl9B4vftYiIZKbJGhAf+TtMe2jNzALNSVHgF6cVEC6PlAvsrcWU3Gmr
         MAWxdwwr3AWtwMKKynlbjWI9luaPhRkXeOFwyZKy/lPgqrdYIJLKTqz0IRV4xn21sMvw
         RKbm/hatIvvdGgWLZ2SPg89DeyYcdvFyYXoaYmb/82VOcYukyLoosdBdXYVpql/hz3u7
         kswZmJB8PNa1E3wrl/A0/CB5R9VbjaGUKhrCYh2s5nrUR1pyJjIsKQws57kHb0H5moUy
         dx6MF4/bslpqu4F2UaU0QxZAYjLbp12Im7BKxyakI6+Ob0M8mO9gUnAjOmhyWRr/DGgL
         FzJQ==
X-Forwarded-Encrypted: i=1; AFNElJ/JA/Iz3yG3cO2NT9Imrco223pli+eLuIKEw/UcH8Lmz1XDs7lP+TmHT4BjnH0EkqD5KPL7s9u+IVcA@vger.kernel.org
X-Gm-Message-State: AOJu0YxTnUhnVUuHcAGQs5tl0NPvq9RI0aCUak9jeqea0C6C9DJDL9By
	D6SjVrBJYq/N05S2CmwJJ8ymtSf5m7FicARjOL4EgcFC+uPSuc7djvd10m/ngK/ECak=
X-Gm-Gg: AeBDiet0tclkmG1mtumgDdWvBvm1v+BamVXyauuTiVXtVHLZ3WKU/IodIkKwYw+K5jc
	L6A5s2MCcNsDfehH9TCkoJvVNgqH/InUu8Czdf14G+/zQxYDF55IFvzvz2dbun8FX7If2bmUqh4
	JK+v/XD0R23GmoGnwsUDJGHw97bjy4yTlNu4KXWF53jJhWdJWibOt2bx1sExrU96Cg9Kot+/Gon
	tXNnpWyvEHtsUZtCyZheHCXz6pVpqehVKFa9f6HSN8YJziMhgZPWbwO+3/ajDLgzGhTPijTPHp3
	35lKjxcw3igX4PxRP5pEcF8qERNSqce2OxEpc9mk90rFX5ntUWUjEeJ2bnqI2BDug0VJ3v0D0mY
	+gMNXJU4G8oQwpgjM9VrtJH2s2OocFwPS1MUiw0tCUGXKCrMR6z6cYSI6Sfxn9vygmUBS59kuBz
	0vu+LgEFh/w6fh7O7i7/5crh4GKA4XvOr4QUD2n9Pn2MipSKfn3jlvhbv4GGZKQyTuBznlZL82W
	w==
X-Received: by 2002:a05:620a:2905:b0:8eb:f3c7:224a with SMTP id af79cd13be357-8fd17d49626mr1448021685a.30.1777901764463;
        Mon, 04 May 2026 06:36:04 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc29a80784sm1058189985a.12.2026.05.04.06.36.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 06:36:04 -0700 (PDT)
Message-ID: <7fbb8bb4-5626-4908-ba80-2db35661e30a@riscstar.com>
Date: Mon, 4 May 2026 08:36:00 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 04/12] net: stmmac: dma: create a separate
 dma_device pointer
To: Andrew Lunn <andrew@lunn.ch>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, maxime.chevallier@bootlin.com,
 rmk+kernel@armlinux.org.uk, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, linusw@kernel.org,
 brgl@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
 daniel@riscstar.com, mohd.anwar@oss.qualcomm.com, a0987203069@gmail.com,
 alexandre.torgue@foss.st.com, ast@kernel.org, boon.khai.ng@altera.com,
 chenchuangyu@xiaomi.com, chenhuacai@kernel.org, daniel@iogearbox.net,
 hawk@kernel.org, hkallweit1@gmail.com, inochiama@gmail.com,
 john.fastabend@gmail.com, julianbraha@gmail.com, livelycarpet87@gmail.com,
 matthew.gerlach@altera.com, mcoquelin.stm32@gmail.com, me@ziyao.cc,
 prabhakar.mahadev-lad.rj@bp.renesas.com, richardcochran@gmail.com,
 rohan.g.thomas@altera.com, sdf@fomichev.me, siyanteng@cqsoftware.com.cn,
 weishangjuan@eswincomputing.com, wens@kernel.org, netdev@vger.kernel.org,
 bpf@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-5-elder@riscstar.com>
 <9203d8dd-8ec0-415e-9c2e-5b06b1b8dc11@lunn.ch>
 <539b9de3-4a78-44cf-9085-06cd0cab2d17@riscstar.com>
 <4cbe1a04-4a49-4e4d-95f4-ed4df1afa24f@lunn.ch>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <4cbe1a04-4a49-4e4d-95f4-ed4df1afa24f@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/1/26 3:55 PM, Andrew Lunn wrote:
> On Fri, May 01, 2026 at 01:06:23PM -0500, Alex Elder wrote:
>> On 5/1/26 12:13 PM, Andrew Lunn wrote:
>>>>    	if (priv->dma_cap.host_dma_width) {
>>>> -		ret = dma_set_mask_and_coherent(device,
>>>> -				DMA_BIT_MASK(priv->dma_cap.host_dma_width));
>>>> +		u64 mask = DMA_BIT_MASK(priv->dma_cap.host_dma_width);
>>>> +
>>>> +		ret = dma_set_mask_and_coherent(priv->dma_device, mask);
>>>
>>> I'm nitpicking, but i don't think you need to introduce mask.
>>> DMA_BIT_MASK... is already on a line of its own, and is within the 80
>>> limit. Nothing changes here with s/device/priv->dma_device/
>>>
>>> 	Andrew
>>
>> I did this.  It was simply to silence a checkpatch.pl warning
>> about a long line.
>>
>> I don't care either way, I'll gladly put it back the way it was.
> 
> Please pull checkpatch fixes out into a patch of their own.

That's what we'll do in the next version.  I'll undo this particular
change, and will add it to the end of the series.

Thanks.

					-Alex


> 
>         Andrew

