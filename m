Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605E336A03B
	for <devicetree@vger.kernel.org>; Sat, 19 Sep 2026 07:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789803914; cv=none; b=HlSC4u/fAi956ib5XcyZwQQgdC3l8gLA58mqF8uyoEMmsRCYhYY35r2KT0z7XBfDmXBUT4/oG1/DrU0Xq4fDWXuUXGXaLh5/D9V4BhAnczFRPvtkMTJbIQAeYyX7ytbcxhu2sxjBnI6E5G0vPtGk3RbyM34dyxrTHDmSmX4bHMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789803914; c=relaxed/simple;
	bh=Q+zCiKser7bCWIbP78SoG0/m+GiWQMGnDLfmB3/UOP8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dNIMMpL6mCPCroGeA7q4JUKdSUDvhNWuGKjyL8jwlzrfQYePOJTdLGuoehluTlKM6vWTJcLKznxEBFUhaUzpjQTW7Zj2qq9tUwSKkHpi3Vs1h53u46fiuJiYMMlizIoBWDSuYIdEdmfxNwW4g+7K1SFsnZEg0zmhGyPCsz4R9Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g+Hgmmm0; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g+Hgmmm0"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccd5cef0so1080071a91.0
        for <devicetree@vger.kernel.org>; Sat, 19 Sep 2026 00:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789803913; x=1790408713; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nzhIw8jPRNxoB8iVaoAn3LrVYY24GoK7KU38cNUcsNA=;
        b=g+Hgmmm00OCJCpR1hbzuOF0V/LzxwntqZ8J1xelH5x+pVUelEzy3bRGE0Z53mrfaWV
         TRef0vk5kGl1KMYh4vZbNEh+gTYq06/SW6S8qR3eVh8R48h7L2OUWujjXkKFo7Anljj1
         KJkCxVH8EE1fjByZpCRrn+tPjcZ277FL1wpTV+PDUN4SvTu6I91oi8SVUihcV7vnu+TM
         hOo2yjnT7+gMRPhcvNYtAISy48zpx7VjxhRKS4UvPWyHYPKLW1nAFasbRyT/Ilre+XYG
         bhd2KOtlJIxvevjSuXnaDscVbHKFZp78GqNSGmPPirbVkZqJeyh5cqz23j2VgStwygVP
         IDkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789803913; x=1790408713;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nzhIw8jPRNxoB8iVaoAn3LrVYY24GoK7KU38cNUcsNA=;
        b=gt7281MGaaNGNjjsEd9qUTij5j1exw/oGUG/dL1/PFIRGxvSTm4oW51uyei24r1S7t
         LIcieSWibhosotNXQGJoDO1EwktkiFvo3gg38ALvbSzULdz5aZ3RC7EqR1teqXkAMszv
         5uWkgmJxz10Ltf1d4oiXTvJP2A4ssN1tlmtsm4N0ZUTjmqKn27pMMnyU7rETSbMqS21I
         cFgQSL+HwGllbyvZuSyJsiyIITeBeB+JvsXZUyDM2iWb/IfsiBd87YjvGfvrpLbAq3ts
         se42nwwwbRVHXGTq6/O0sGBgTcd3ury8rRzfeXPsjfyfZU58N6goicqZltK5j9dMvco9
         crmw==
X-Forwarded-Encrypted: i=1; AKwUvBxvqr1Pd25UQl/xgTHCzOmKT2tBotecArsVYPe0XpuWmzRCOnDE7aLLGwxL+mkrMeyVOodpzFsKip/f@vger.kernel.org
X-Gm-Message-State: AFuF++l6tbdq0oXbCQZI1jgLf2ESy149epHJPrJ/rW6Z65uoyzWU2+N6
	3Nbhh8DgMLZI5IW2lfVfCBosGmEk4KcEjStoqnb9pA3FvYnfZPUZNSt3
X-Gm-Gg: AYBFou0HJ222QHEQzEPjA+hL+Q0inRQJjC2/c6hX4FScGHdDW5IXNHttr7r+GrNnRvn
	ITe6M6BhNtn/V9KmMBbDEMVNmRvEL2OFMe+tWoaMuZH7MdkKYOWYgKQeUvg0e6MuINQSqd4vPZO
	Lkwz3TI5EyEWSYwUxMEFhao1HZT2hFYhM6rx9kSRn795DveGSsEMMHOEPOLvu8oDu3Vkvlrv7KN
	+ReGsAiGkmzyTqNFINxmzXHb6YlIFShRYpP3uSzDqh08P6oxssRZmMl2gmv/HwSpK5tjxZ3uVb3
	khnNggUZZ9qTb6/Zj6L6VNEEMmI2CSAWNH2vxfwg6SgQiHXiT0SJfWixZ/AiVDPAClPc2nDTWjY
	nmPn7v82sb3Eg9cr0lE8Aem4SOp3qGLpQr9tnMB5PvS18iXuzHz1a0V2tIlRl/1mPJjw+7JEISC
	3aHGfOX9+Iu+S8VzZ0Wv6JqM+BaHB7ZBETMuqkzK3T0/z4f6dhOZUa0Pe1DTsoIzDwiVp3t6S0y
	Q==
X-Received: by 2002:a17:90a:c88d:b0:39e:4c80:f67f with SMTP id 98e67ed59e1d1-39e54f3aa58mr9006171a91.30.1789803912686;
        Sat, 19 Sep 2026 00:45:12 -0700 (PDT)
Received: from [192.168.101.188] ([207.90.239.231])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d55f299fsm6860122c88.15.2026.09.19.00.45.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2026 00:45:12 -0700 (PDT)
Message-ID: <aeb5b8a8-e01e-404f-9788-b4770ecdd9ef@gmail.com>
Date: Sat, 19 Sep 2026 15:44:54 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] arm64: dts: allwinner: a523: add DWC3 USB3.0 node
To: Per Larsson <per@palvencia.se>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Andre Przywara
 <andre.przywara@arm.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-sunxi@lists.linux.dev
References: <20250816084700.569524-1-iuncuim@gmail.com>
 <20250816084700.569524-7-iuncuim@gmail.com> <20260915013336.68ee3611@rpi>
Content-Language: en-US
From: Mikhail Kalashnikov <iuncuim@gmail.com>
In-Reply-To: <20260915013336.68ee3611@rpi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/15/26 07:33, Per Larsson wrote:
> On Sat, 16 Aug 2025 16:46:59 +0800
> iuncuim <iuncuim@gmail.com> wrote:
> 
>> +			interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
> 
> (Sorry for the more-or-less necroposting)
> 
> This is the only mention of irq or interrupt in the entire series,
> which at first led me to believe there was something missing given that
> there's a "Nobody cared" message appearing when the port first detects
> something connected to it followed by something about the irq
> being disabled.
> 
> Now I read in the text of another patch (adding a TrimUi dts) that this
> message comes when an interrupt storm is detected, and given that the
> value in /proc/interrupts goes from zero to 100K in no time, that seems
> likely to be the case here as well.
> 
Yes.> What is this interrupt supposed to be about, and can it be handled
> better?
This inerrupt should be disabled in host mode, I'll do it in v2.
But except this message it doesn't affect functionality.
