Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD903446C9
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 02:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783911467; cv=none; b=eGmBtgzmbG1GLEYhiDae+OCqKY5vTlxtgFnl7oP2nIDXwOvjGzazbLjg1e2USiRsY3G2aACjbhpFsMU/j0O/XMJygHc199pGKxa6KRak1bflj82bRNWB0fAG37RRxSCe2Rdb34C2681nzzZxenYiuySNgXM7ofB4Hr4iitbwilo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783911467; c=relaxed/simple;
	bh=1t/sTm1l2pvzCHyeOfL172JqiIlHB4cJXkjujZxHMi8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oCAyJW9dP7NP3WkaTruGCN4siTO7g5wiFpvfCfGwjVb9Xqe5aJuFOeLQWv3BVPLvUxeIiWl/XRnyNf6EHwJoBgglW6ft4OIJnSSPhNE0cUqYt/yTNTa4zIL8TobPRFjaYrQiuXcf3N6LXl687jacFB2Bkgp9XirJSU9nMvEQJmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FjMc7WTE; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FjMc7WTE"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-ca97d139d8dso1687729a12.2
        for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 19:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783911465; x=1784516265; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M6MgoXC4jIcUDKauhvWR6PqJ71dM5+J5YjsOoEDTJlo=;
        b=FjMc7WTEO4w+bOjroL1ORuzdRR3KJZqAl1irn1B2WhWrwKK3iQUDF7RoSNWyvEYa6a
         q42mlaWXs8jSCy07CTXOTb0K9exy/qfntiGkDTlPyQWTop9Me9ZrhDG+zVZ/NiVBSoZf
         ZJKrcBSkmEUcgxvnNvIPxNKHUGzAFVCHqh5q4up0R22AR2WHLtWnVps9VAdm1yIoFGMI
         P96PE7rYOcXruneK+TKWSTzQTGH6o1Xzpf2ejTKAVLOzvuYyfmBWNicLteG/UureSDRJ
         frXNppL2zM/lE7yX1Ju2jwVmTJ8pM1R8n/odV7DX6UXNvKjZ9ahpHeG33Wf+DEfKEeQU
         wMvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783911465; x=1784516265;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M6MgoXC4jIcUDKauhvWR6PqJ71dM5+J5YjsOoEDTJlo=;
        b=B2jaucGCZ1eyobTcWg2KHIaxqSG9bG7SlGay+z1S6pZqPVxzqTX3Ay5vr58pMI/H/C
         UTjfpGOAX+Ue1CW45C8KAWrRnuiqVh99CcKmilapemoX+skiz07OENMjNPfjf1In+WFg
         SD6cW/0vi/v1pvBuXQ7O6oYH9MIaO9xduZxE5cUiMjDRBFYb74A3bS2XrYaJpE2d6OYJ
         jkXt3kArOKdqtHTbEuGQJJxk5ZyTT1giI7dzSTxuVMBmgvUAOVP1IQI7huDb0/0EXkJe
         eUb8EryU3henR8f7ZjVIxkvbhHpVp0aOxeL/R5+n318hNSVoWYdG/xGKdf5hTkeIzdYV
         zvPg==
X-Forwarded-Encrypted: i=1; AHgh+Rq3GO5VHtfqvzb3OiezO28sCn1KC76ReLFeP/r1YuuAFTBOzIT+sj2hOyKlUAMGIsgjEJ8100RxJQOL@vger.kernel.org
X-Gm-Message-State: AOJu0YwQTGDSaVG6ETq9HSH7KTQAYF3f8WtBeeERCmz/3f30Hct1Pe2v
	9PJicz4/Fh85SlJiddBUyawsU5TIkoHR1wybQ+rxofhzfX8zyg2fxXzm
X-Gm-Gg: AfdE7ckIF8bK1jO2cXzPmH9OgnXTyiukX9d7d0ksqsNFqgupknk+GxvaeOheRFl67Cn
	iMbeXkuB5DOZANDKpK//PgePSGJEgma6M6O4JPoI1WY7ouEZSGv1Ikzayec5FIqSr9VkubZcSOL
	gHb5IIrL8z2fOIwOH6OJH+NVt1g2QINpSuBUlXcmnxqHuHlSg2YYiGwUbzjdzM4Ao+rYzITwY3K
	6a90Ojqa8LPFe/WRozq36PWdvIkzaCTHm6YT9XBlir7J7RJ69f5Uz3+euij+5wnxXUgfqbAumZ1
	fVJPqTEkhoaq4sxDcFyZYVsRXxjCcjaP1Wi2nf1yrtj1e3hWCVMJ2JcQ2cH1CNcI/6RUlwb13NK
	9gldQ/7+/NykpU8tKjkp5qZT+pP+sNnE8V1QfQNuErLCUBdmzRHoDWy/g+iq6sSzAngURK2CQpE
	GbxTdObcuO793nQIRMwLPhaSdbr0fQqgUpMZ2XaspqECGQpnY3xxh32sf6pufYTfw0Bzytrg==
X-Received: by 2002:a05:6a00:909f:b0:848:2f74:d8cf with SMTP id d2e1a72fcca58-84889833b4amr7034427b3a.64.1783911464761;
        Sun, 12 Jul 2026 19:57:44 -0700 (PDT)
Received: from [172.19.1.47] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6ddc974sm13503512b3a.60.2026.07.12.19.57.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Jul 2026 19:57:44 -0700 (PDT)
Message-ID: <825a3a1b-8891-4172-afd6-8de6077fa129@gmail.com>
Date: Mon, 13 Jul 2026 10:57:39 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 RESEND] arm64: dts: nuvoton: ma35d1: add CAN nodes
To: Arnd Bergmann <arnd@arndb.de>, Zi-Yu Chen <zychennvt@gmail.com>
Cc: soc@lists.linux.dev, Jacky Huang <ychuang3@nuvoton.com>,
 schung@nuvoton.com, Rob Herring <robh@kernel.org>, krzk+dt@kernel.org,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andrew Jeffery <andrew@codeconstruct.com.au>
References: <20260708082457.460710-1-zychennvt@gmail.com>
 <5f2954e4-2e0c-40d0-b67f-933446c83cc1@app.fastmail.com>
Content-Language: en-US
From: Jacky Huang <ychuang570808@gmail.com>
In-Reply-To: <5f2954e4-2e0c-40d0-b67f-933446c83cc1@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Arnd,

Thanks for the clarification.

Shan-Chun and I are still maintaining the MA35 platform.

I have reviewed this patch and it looks good to me.

Reviewed-by: Jacky Huang <ychuang3@nuvoton.com>

We agree that the current maintenance path for MA35 could be clearer.
We will work on making the MA35 maintenance flow more transparent.

Thanks for pointing this out.

Thanks,
Jacky


> On Wed, Jul 8, 2026, at 10:24, Zi-Yu Chen wrote:
>> Add controller nodes for the four Bosch M_CAN blocks found on the
>> Nuvoton MA35D1 SoC.
>>
>> Additionally, configure pinctrl and enable CAN1 and CAN3 on the
>> MA35D1 SOM board. Also, update the APLL frequency to 200MHz to ensure
>> the CAN controllers receive the required input clock for 50MHz operation.
>>
>> Signed-off-by: Zi-Yu Chen <zychennvt@gmail.com>
>> ---
>> Resend note:
>>   - resend with the complete Cc list; no patch changes
> Hi,
>
> I don't see anything wrong with the patch contents, but I think you still
> have the wrong Cc list. You have sent the patch Cc: soc@lists.linux.dev,
> which is where maintainers should send the patch when it is ready for
> inclusion in the SoC tree, and you have sent it To Olof and me.
> Olof retired as SoC tree maintainer a while ago, and I'm not going to
> apply this because it should go through the Nuvoton tree maintained
> by Jacky Huang and Shan-Chun Hung.
>
> Please send future patches to the maintainers that are in charge of
> applying the patches, without adding soc@lists.linux.dev yourself.
> The maintainers will then forward it when they are happy with the
> changes.
>
> I just noticed that we have two conflicting maintainers entries
> for ma35:
>
>   - Jacky and Shan-Chun are listed for the ma35 SoC, but have
>     not sent any updates after the initial merge in 2024 and
>     don't currently have a git tree in linux-next
>
>   - Andrew Jeffery and his team are listed for npcm with
>     arch/arm64/boot/dts/nuvoton/ listed as one of the file
>     locations, though that contains both ma35 and npcm.
>     Andrew has the bmc tree in linux-next and has recently
>     picked up patches for both npcm and ma35.
>
> I see there is a lot of activity at the moment working on
> ma35 drivers, so it would be good if the maintainers could
> figure this out together and provide better guidance to
> individual developers. I don't mind pulling from one
> team or the other, but I would definitely prefer the MAINTAINERS
> file to reflect the actual state here.
>
> If Jacky and Shan-Chun are planning to do the merges going
> forward, they should add their git tree to linux-next and
> update the MAINTAINERS file to list the git URL.
>
>        Arnd



