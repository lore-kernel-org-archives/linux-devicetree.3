Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4664C48C8C9
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 16:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777999579; cv=none; b=uh2WVeGVvhl0Jtx1ckToDDCHUP4fAH/7Bk2w/GALGVUngP7IuICq9otcIqc1Q9J1W9fWSinsL34I0ikLJDJTq5JsiaePvCHOSoWM3MS6Gx1bPHcHHQTgKIJM7SnWVjm6WCf+NcuGryAt0GuQl7vk88qqu1A2kEzeUooKGUGpY5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777999579; c=relaxed/simple;
	bh=F6r4/NkT84O6LMINfn4uqKzOCDnyvsWTs845KZsew+E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RcwrhwO9em47C9crq4h3X4C0UeS5tkJLzu5GepvxeGZlNYyCHI24YrZ9bJJxurZy9EXXgSY3BZu2zcoQfriVLyqjMlvyqK63MhuCEAZCqQi3k7D/R55UtoJYhSv36ExYcMj0nitaHmKUukCvaVIhcns/NeSDQsTW5GiWPAk6UHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=X5mmn7Lm; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="X5mmn7Lm"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-7991db3dc98so58196367b3.0
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 09:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1777999577; x=1778604377; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B6Uy1BACyCfz4bGQoQ3uC1bOjVbvH4IGR3oICdNZrGU=;
        b=X5mmn7LmuxQszfavQ+POveGevluU7P0Vd3HRmMQcQSipewpw/vF+RA/dqjferAD4oB
         pteatj+2RLDvR3nOAruGfWssKVbw8LhlK8Z00SnTStpuDSSoQxU4i13/fNRFdn2f23dI
         PeAd6KPtFnRtF3Q3Nd714cFZJ1rua5bOxeV+9nx8ZIDAyrL1q9sw6Rfh1HVgqAI50azo
         KvEHZ48/BWDlB87goXTwqgZ3xaHoN/iaItBoQpMPWdkdRFTxunnYIaRqCpUVFtolYPCb
         S3Xojh3w9bdKZXuAyL+66Nl4S7NepkaG60gqc9sPAXCquh3og2tqg5wH95UpXLCuQ5DT
         CiAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777999577; x=1778604377;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B6Uy1BACyCfz4bGQoQ3uC1bOjVbvH4IGR3oICdNZrGU=;
        b=fsCO8sct5iwnRIjIpUc3kYsIalnqcQtTg8dRFpwu397g974W27jgdzn35fdzNzqBxD
         wsRC2kxkPkg9qxcVGpV77ADd6NvzKghZ41aYc3Dg20hGF5mycN1t+M0GTrZAlXFIiVbj
         S+BWnUphKHtTIiVbVTWvN1ZaXVBYX4U6h1G7wNnVlzeJK2ei1D7mc8CIzMRA4E70XB3a
         RuM4W4cA9jyOsonX4KB3RfdnrBGCKCdXoPcYGbcL9EwXJ0oC/Tta9NEKPjEEoq4qoiNb
         Jay1K8FBTcjrxUBaQOesWzM/ZS9ONiik3SX6xH23bqpBYVqYzC0+nqfuyKO0k8/7t5QT
         eyZQ==
X-Forwarded-Encrypted: i=1; AFNElJ+hk7JMVZcFXGNajmPyuJwyIry7O7J7fvnH65nqEPmy2d1SuQIJBJ97KQXJSw4vtA48f6GVhBEBDBtP@vger.kernel.org
X-Gm-Message-State: AOJu0YyjsyNYdE8Lq+OAPlYx+sk5KxCbnBeyhJNg+XL3KY8zV50UCW3K
	mj32oUBAszgjhsipuL1ao5bqrTWUTXFEliSyA6S9mxFCn9pkr/Z7k2cXc4H2fBNmjco=
X-Gm-Gg: AeBDieuyeh2aamlX3fBBPt9puD3z1mieMDUs14e04FcSmt0d5MAl5zoyTo/S1uk08Pp
	0PFRE/xKQizkZb+wO0DFwQ0hP+BZFh7KfNexC285FyrOZHhhUdhPiE7Xx6rPI0zHEJ+gY9j5d/B
	RbhBZ65Y3pif/KXL/c/PXU2fLx+aKglPaMBbjEaZuBu+r/kdze1Fbthu7XAFl2D2tjt2mZ9Bryf
	Ge4ataRUu22BUiXvDbUGKZcjFTJvT3ljCvpVA64ddks5Qug2CchY0NEPuYPOCq3cWhEF4ewngvG
	Aw53g4Ikg7XbDVkh4oKFOvYkBL/V044UdmSwqSG/5xZO5q+SRjimm4PT83YJ5Al3L72ZMHNRlgJ
	KLG+I6SD0hqYQylsQNCzdo9umArZCC3UxsN5kDgXNfbMidYaODzdHY0+0vIeLDg1BPbstHBEvvs
	ZOoggBc8EKfnq3HyyzLIyFQa6cKJeYCwRnjtZdl3nYGcYDn4adrIifxG2CWsv82dlgda7ousuLC
	Q==
X-Received: by 2002:a05:690c:e094:b0:79b:e346:fcfb with SMTP id 00721157ae682-7bd770df5b9mr144294337b3.32.1777999577197;
        Tue, 05 May 2026 09:46:17 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6656542bsm66872617b3.20.2026.05.05.09.46.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 09:46:16 -0700 (PDT)
Message-ID: <e582f6ef-aa4d-4d7b-9d4d-7ea0445d42fd@riscstar.com>
Date: Tue, 5 May 2026 11:46:13 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 10/12] net: stmmac: tc956x: add TC956x/QPS615
 support
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, maxime.chevallier@bootlin.com,
 rmk+kernel@armlinux.org.uk, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, linusw@kernel.org,
 brgl@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
 Daniel Thompson <daniel@riscstar.com>, a0987203069@gmail.com,
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
 <20260501155421.3329862-11-elder@riscstar.com>
 <afodG9uuopgfvSmu@oss.qualcomm.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <afodG9uuopgfvSmu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/5/26 11:38 AM, Mohd Ayaan Anwar wrote:
> Hi Alex,
> On Fri, May 01, 2026 at 10:54:18AM -0500, Alex Elder wrote:
> 
>> +	/*
>> +	 * TX956x has 8 TX queues but only #0 to #3 work for general IP traffic.
> 
> Minor typo in the comment: I think you meant TC956X instead of TX956X?

Yes, I'll fix that.

>> +	for (i = 0; i < td->plat->rx_queues_to_use; i++) {
>> +		res->rx_irq[i] = irq_create_mapping(irq_domain, HWIRQ_RX0 + i);
>> +		if (!res->tx_irq[i])
> 
> Typo: res->rx_irq instead of res->tx_irq.

Wow, that's important...  Fortunately we haven't been getting errors.

This will be fixed.

> PS: I was able to successfully test this series out on a Rb3Gen2 board.

Great!  Thank you.

					-Alex

> 	Ayaan

