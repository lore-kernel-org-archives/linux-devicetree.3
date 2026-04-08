Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A64368942
	for <devicetree@vger.kernel.org>; Wed,  8 Apr 2026 11:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775649069; cv=none; b=QyulZyTa0wx2pvhuCcmfSohSZhVTdmKralWPUlm6GUkvj6ghNGN/ghtxWln3IUx8uF++Y0So7T6AIQzZw7VosEFKhBNjHs2P3V33ZwdG89LXNizHRzbQzW1lXPPavHgaQe9G3zhMxr7plwViG1782jPLpZnggqYmDVYk2mGeKpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775649069; c=relaxed/simple;
	bh=X58ciQKprArFwD51+U6hqe12tyByg+hkvzjFAJm9gMU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KabpA/IkNce3VCEG0tkyzYGT7uvPHoxeO8+CZX7gsoa1GtF7P2xRpuVkU/3omcZ7eqVVhAjgWMdtm4TlRVYAOb5MXMwhPEqG8C/oZGIaF8957aUVY6Af3i/bXk/f1w/sEcy5hGMWaTzNKCKZgQUDzC8e1zf/Oku4S28oF+ZeyAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J95HISEd; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J95HISEd"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488a041eae5so32607945e9.1
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 04:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775649067; x=1776253867; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BW6UoyfUV2pgEC2VeAz88BmtH42V9gawKLQgrG0Az5I=;
        b=J95HISEdWw6t+iJ+mITeniNClchl/Jyfb0sagdeL6341DO3/HKthy1wJYZGyP2DL1I
         jqIdE49s0hTSXXFefU5wVgC5Z+ojL8aQ3T85Pze3nyhYGWbHq6PV1d/yjiVqj7J2Hn1Z
         SI2qyOi0G1RsD2K8lrEC5uoOoqYbJOoTrBeBhIXeL8yGDnDDSJXpM04I8kdr4DjNmx1S
         9ZWF5RGMik1Sx28zvKSrdn0YDE57fZAf3LUkauB0/IALjWiM0F99IRIOJI6fhWEgyUZK
         uL4jT6/6jazUT6h5k/iixHGDP2t6UfkDs55qH30FJJet8b/pEm5FJoZefi8E41hIU+I2
         oRew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775649067; x=1776253867;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BW6UoyfUV2pgEC2VeAz88BmtH42V9gawKLQgrG0Az5I=;
        b=HeoeBXrGjNykAQyITv1UBkQ55Je4Ekfr9CobYNGGBOuPtk9cGpTOGgo5dJPpTr1eBz
         +DvtnpSFamIlkZuMw/2J74GmXdz+gkVdxlmwfeDFI3kmfZeWTkfYtCSvobDVRQAZaF79
         Z0XrkZDMvw9R09sLusHdODzE/gOawyDMfYl3ndhg6wy1hLqs6rvuqj1+wN0L300nPYY3
         r68SkRbcb3EEFafCYdFz9l0xXG4Uoz3+ZrxyIta5HvAbCxEgSNlx+d3SNgRYSWucQ1n6
         tbbwdFZEvQKQXYmC7Q/tDXuP4BVfEiKttGWWvi2MRCwhHgm77w9jwmR5AYHTnAzjCMm2
         KLrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYcWwYGyPJzl/7ptoxra6FwLnoqptUnf5IN2UmxFzo5G7KIaODi+jos9Nczeuafe7RTauOipjXNfvv@vger.kernel.org
X-Gm-Message-State: AOJu0YwIt9YpI8hWzm9JEJfO0eeauxwhZ5Xh7jL47fCEbA6xr69wcBGK
	IRvqFnY+YBo5UgvjpUv5BL3fYDZ07cOapUZObY/0rsAIi9HNZnN6i3Zj
X-Gm-Gg: AeBDiet9aGQImr14r2ZP3cvfyDldNXFfrTNrheR5/NtEhYiBLHLhpuyXdFVTtP6GZpe
	iDMHc8SZWcz6hCUFaMFjCIHl9VZmUTNp0V008hrkdf79yA25N0DIkWbW2FklzcWzX9la8xSCzFH
	QozOOklOH8JBNRdXvQgbAkCknyjD6jvcFtuCB7R3rglsKP2jFc5O14SkLbqeLjd155zfn7cXpXd
	affU5YBK55G1RVVHTTMGAiQuEEa/I9b3uLL+M74zQaVHZ2h++krncygYbS+sZwlDa7wJ9YKTjI7
	WPdyNCzExWJzmQqOsq3v6iMLskO8kQxalBg7B0XnZmfIIx0g7HC4UwBh7/ediCIRCh9RQMynsU3
	bdGW5DOzEYVqN/A3kbb2ByQn/zdNnaS5Jg09Qx1ylPk4tac02z5TCJHCI4RUxNhJQOUb0F3nQAJ
	dEbp8xk6UhVrGCVNdyfDp2WDItt5lrqKsfd8r1pTxPkuPTvuABHE71zU/G2LqeP5A3IlRrMl8uH
	xnR409TaQ==
X-Received: by 2002:a05:600c:3549:b0:485:41c4:e2e4 with SMTP id 5b1f17b1804b1-488997d2ccemr267423825e9.23.1775649066543;
        Wed, 08 Apr 2026 04:51:06 -0700 (PDT)
Received: from [10.1.4.108] (cust-east-par-46-193-119-166.cust.wifirst.net. [46.193.119.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488c5dd1c81sm17369545e9.33.2026.04.08.04.51.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 04:51:05 -0700 (PDT)
Message-ID: <1296ca80-f783-4584-b953-f92f6594c39f@gmail.com>
Date: Wed, 8 Apr 2026 13:50:54 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] net: dsa: microchip: implement KSZ87xx Module 3
 low-loss cable errata
To: Andrew Lunn <andrew@lunn.ch>
Cc: Woojung Huh <woojung.huh@microchip.com>, UNGLinuxDriver@microchip.com,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Fidelio Lawson <fidelio.lawson@exotec.com>
References: <20260326-ksz87xx_errata_low_loss_connections-v1-0-79a698f43626@exotec.com>
 <20260326-ksz87xx_errata_low_loss_connections-v1-3-79a698f43626@exotec.com>
 <ab6a06c1-2d7d-4032-8d38-063470cd45c0@lunn.ch>
 <fe14415a-52fa-42cc-9e4c-e3876588d513@gmail.com>
 <c235ee5c-6057-4c10-9960-9c5a3527bf22@lunn.ch>
Content-Language: en-US
From: Fidelio LAWSON <lawson.fidelio@gmail.com>
In-Reply-To: <c235ee5c-6057-4c10-9960-9c5a3527bf22@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/4/26 16:45, Andrew Lunn wrote:
> On Fri, Apr 03, 2026 at 11:43:24AM +0200, Fidelio LAWSON wrote:
>> On 3/26/26 13:18, Andrew Lunn wrote:
>>>> +	mutex_lock(&dev->alu_mutex);
>>>> +
>>>> +	ret = ksz_write8(dev, regs[REG_IND_CTRL_0], 0xA0);
>>>> +
>>>> +	if (!ret)
>>>> +		ret = ksz_write8(dev, 0x6F, indir_reg);
>>>> +
>>>> +	if (!ret)
>>>> +		ret = ksz_write8(dev, regs[REG_IND_BYTE], indir_val);
>>>> +
>>>> +	mutex_unlock(&dev->alu_mutex);
>>>
>>> What address space are these registers in? Normally workarounds for a
>>> PHY would be in the PHY driver. But that assumes the registers are
>>> accessible from the PHY driver.
>>>
>>> 	   Andrew
>>
>> Hi Andrew,
>> These registers belong to the KSZ87xx switch address space, accessed through
>> the switch’s indirect access mechanism. In particular, the offsets used here
>> correspond to entries within the TABLE_LINK_MD_V indirect table of the
>> KSZ8-family switches.
> 
> So this errata is for ksz87xx only?
> 
> For this PHY, do all PHY register reads and writes go through
> 
> https://elixir.bootlin.com/linux/v6.19.11/source/drivers/net/dsa/microchip/ksz8.c#L957
> ksz8_r_phy()
> 
> and
> 
> https://elixir.bootlin.com/linux/v6.19.11/source/drivers/net/dsa/microchip/ksz8.c#L1221
> ksz8_w_phy()?
> 
> We already have some "interesting" things going on in these
> functions. PHY_REG_LINK_MD and PHY_REG_PHY_CTRL are not standard C22
> PHY registers. They take the values 0x1d and 0x1f. The 802.3 standard
> defines 0x10-0x1f as vendor specific, so this is O.K.
> 
> So you could define 2 bits in say register 0x1c to indicate the errata
> mode. You can have a PHY tunable which does reads/writes to these two
> bits, and ksz8_w_phy/ksz8_r_phy which translates them to indirect
> register accesses?
> 
> It is not even really violating the layering.
> 
> 	 Andrew

Hi Andrew,

Thanks a lot for the feedback, it was very helpful.

Yes, the erratum affects KSZ87xx devices only, and all accesses to the 
embedded PHYs indeed go through ksz8_r_phy() / ksz8_w_phy(), as you 
pointed out.
I followed your suggestion and reworked the implementation accordingly: 
the errata selection is now modeled as a vendor‑specific Clause 22 PHY 
register (0x1c), handled entirely in ksz8_r_phy() / ksz8_w_phy(), which 
translate reads and writes into the appropriate indirect TABLE_LINK_MD_V 
accesses. This keeps the PHY‑facing API clean without breaking the layering.
I’ve dropped the DT approach and adjusted the implementation based on 
the review comments. I’m sending a v2 with these changes shortly.

Thanks again for the guidance.
Best regards,
Fidelio

