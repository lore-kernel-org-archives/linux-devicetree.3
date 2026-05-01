Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07DE73382E8
	for <devicetree@vger.kernel.org>; Fri,  1 May 2026 18:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777658789; cv=none; b=UONm0M4lJt3ytinQ1ms4lFJnCUB506337DRj31K7B0XopP+YChR1VEsFW3mWVsk290vRVtR50fjtXAb2Tdcp6DlMBBdD6tfzxk2+tBRbMrb5tojrodY4oCc2TE/2T+JDJ0pR5suM7hYHx8SZHCwmgof7s/iLFNolkUT7w4p+3x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777658789; c=relaxed/simple;
	bh=oKkQnY5vlFNovbcjfh6JBo8TVogGXpyGhtvkDtTNy3E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O3nT0ea8eUkeJG+ZuPjpKfWLnk0Sj5SG5cdflEfEfGZd+BeRX23ECdEEqfW8EExICbjXrd2c0YPnpOzfFFlV3GCgMU1hyTrF8wuqpgyjxggC8/RQ/X/9vRZ9Oa7ulQaiGgqfULRf8zmV0+yjVJ3PrZKcKfXcjiNq7na14azN48A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=psJ3Fjh4; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="psJ3Fjh4"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-7baee75f874so31257337b3.2
        for <devicetree@vger.kernel.org>; Fri, 01 May 2026 11:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1777658787; x=1778263587; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h1DjW845zhModhDu44NYwmrHvDI4OE4s13MqVWiObLc=;
        b=psJ3Fjh4F/IvT+GnFPrExEwYlGYre21c/sJ635RZrszNYBXaXf5wN64XMn6ym7/psU
         Q2p+xXX2OyIDv3LMm6MTze4TlZkVqEoa5LBRKzq8SHUMpzTAWhKGajoUlT/6qaLDwchY
         5BnJcxhDXuQgHakxWjVfWWVVLyFWoIHmsKPMrAtEoUGU4SP3U/bJWLSo/wF43VT4VLU3
         JVzTAhYmNHQMjGVKGbxeLIpjZKHAtTc12qpZWpK/Atj7nRqy6PwkvuqCStFJ1iK3aWrp
         kNUE6XQc2lSrMSKr6TAQQe2G4Uo/xq82lf8T/LX65G1UDU74tl4CipLKYY0ErDW5fkzF
         Md4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777658787; x=1778263587;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h1DjW845zhModhDu44NYwmrHvDI4OE4s13MqVWiObLc=;
        b=BBlpewmJ8oqih8JLbkP/5y2p1wB6WN6LakB7r7d/G6WrO6eMv3PM4IvjMU+FxhxZne
         AH+pmZP0JcnAqbLc3MhIw7JO9fNebeTcmnN8BdoyPCxDvsjQ/niORJUjMVG0vGo79bRW
         caB1iqWhxf6feCRuqNcpGV/I86kGTXcnU+y0L43SWt3lSUfBtOF2Zviaj5100rE24yhT
         rP/s0W/20r5HSb0rYu3e1vcqWYwtYj7iB4hAoc6Xdl8Jx3g8zHXU9ZvmZKtEBn3FTMW1
         lWSsX98IYOw3GR/Q/IxYI+ravQyk6MIfLj/HrUocPTLB9rGclKSKvI5AGj22C2QnOvwI
         ovBg==
X-Forwarded-Encrypted: i=1; AFNElJ8YSzl8GilK6FxaESNywRQIfO3oa68u1DxurX1NhLd5jc1OVeD2Jw+fZxuZTdiXe/MCCS224ssSAc2d@vger.kernel.org
X-Gm-Message-State: AOJu0YxAVjuhF7SuDbsjXgAYo75pP9Znek6igK5NMLKcY+IIvT/IPo5i
	bHLLp9YFvg73zCPw4ks+CIVRnszOmYI825anqtwzMz7tblxaxoaHEso1vwzoJkarm7Y=
X-Gm-Gg: AeBDiet25nQVzWeuecJNjL/vlNyVCYH/yDrhS75eF8l6MfjcCUErYPyNovAN7CMBXgw
	VYQSniRoeSkMDEuDUUS1rn/Lf4Dgo7aa7FTYbMUy7ChQ1tN71st5FdHf45PXaD8HHWbTpPEQrAQ
	WBCNhhvLhatT6r0sa/iFeRqG4jVyixK77TC72DHsLmbkSgnxJyXkDHMhFeh4oVHud9jiAWnZiUD
	gOnFL1DQsWdW6KkvdEAxE/UdBMyKj76wQk2b1Sps8zkWGvbCKwRN7l4/3X4/4WEHVKrhkoC+ljh
	CA7NZV/H24ILH82ctRXp1ztzKXjFZUAF/sjADMSdmuJV6j0pjgmq7PhXI01xrVH+JXxxCcYO7FG
	a3eSOzvkQoozz5ER7ikhaTMgFG5aEESMitID4M7s8RDDjcyBwkCMSECFZ3zL0aW3vH8+MPqOYxK
	7adC+YS5zGGOnmaQwQj/o1NI1UKXHjN+0dho9zsRsNYrH9rk6zBFdvSKQnhjtdYCyCr7Xba7t0i
	w==
X-Received: by 2002:a05:690c:dd3:b0:7af:6904:3f3f with SMTP id 00721157ae682-7bd77170409mr4261187b3.45.1777658787005;
        Fri, 01 May 2026 11:06:27 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd66019105sm14575347b3.0.2026.05.01.11.06.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 May 2026 11:06:26 -0700 (PDT)
Message-ID: <539b9de3-4a78-44cf-9085-06cd0cab2d17@riscstar.com>
Date: Fri, 1 May 2026 13:06:23 -0500
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
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <9203d8dd-8ec0-415e-9c2e-5b06b1b8dc11@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/1/26 12:13 PM, Andrew Lunn wrote:
>>   	if (priv->dma_cap.host_dma_width) {
>> -		ret = dma_set_mask_and_coherent(device,
>> -				DMA_BIT_MASK(priv->dma_cap.host_dma_width));
>> +		u64 mask = DMA_BIT_MASK(priv->dma_cap.host_dma_width);
>> +
>> +		ret = dma_set_mask_and_coherent(priv->dma_device, mask);
> 
> I'm nitpicking, but i don't think you need to introduce mask.
> DMA_BIT_MASK... is already on a line of its own, and is within the 80
> limit. Nothing changes here with s/device/priv->dma_device/
> 
> 	Andrew

I did this.  It was simply to silence a checkpatch.pl warning
about a long line.

I don't care either way, I'll gladly put it back the way it was.

					-Alex
