Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02323B1ED1
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 11:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789383809; cv=none; b=eGqbFEvVaFxd4NqmppLObX0UF5fsV+nOUdtUD/gfpNxqYqehIAfQF2R3JY04j8AbGNOHp+S4lbrE0MdLjfR2JcGC1ICOhpAH4Ujo8hLFdbXTJ65IzBOhe2N95uP58g8OHKuOYE4oyMZbbZatzTzG+cNMJKED3/nlIk1GzbTRQtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789383809; c=relaxed/simple;
	bh=u1qAW3Ps1/ms8o++TePT35PSy+z+WCTmNWWT04eGCYg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ig4oDPzZ1q9ITu7e52HPgRbywiYqvY//iIszQaxwRXaTkd/A+wsip+4boycSgLTNKMrtnXRV20KpsilUBhOA6GNUEDjahRv4cK+E8kgdWng28aIJJisg05VkeseSOJ234PfRj4wgRmtnw7oVAX0p2NOIY4LFEdCM0NQMgjlIFPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vS0ld2F7; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vS0ld2F7"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c169ae1cb26so501718566b.1
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 04:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789383803; x=1789988603; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xbly740beuemqSo1bscqb84tM6a/tiFHYniiF7SfuVo=;
        b=vS0ld2F7cJuuK+ywGYMMAdd5Yi+fY+WhBzUAHWxaFr4PEJ/UpeToQjsjRt3xkBYX5b
         p+Tgj6TVvRe/yNdPLIl1fb5LUIQSaXT3CZKQ8tawm2cS+/LDYspSAb2tl3Kp2Y7+tEvB
         /O6ZYmMH1HNjJD0Os1SSe5z6BX6yrm9pi8spaC4c3K+adW9kgxTyv5kqLPE0zwP/ky2V
         kxGaYHywiEolYwJyXT7FCmOA6wPW2FjaZcbnmG+AODyqxnIqDRS92s7jtp5+AsAxpho0
         iEyURcYAAx6lskuaDffNKcpHBi2Tpqa2TXflnBqkOqlHJH2y8qsnhf6qALW4HizoQOYh
         kzDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789383803; x=1789988603;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xbly740beuemqSo1bscqb84tM6a/tiFHYniiF7SfuVo=;
        b=dFFptOsNWHgr8vWTOE1lNmhzt2HPSR0GamAfuqYgVwjyTRfTas4hq7fhOWx3oNvxrO
         4sl6/qCD2bAEzc0hFNFT0Ix+sU5Q4Z70heU66qNEVWjnjL9RIi6wm+fsy45t+EzCQT+c
         Wd21Igupa6bYNsMhdd6YbZsQ70tUxhDQduoC8iHlrzG1enwd2ZPwvSt29GfWlFbYMV61
         ouTpE6uaLdiqqNBngU5NF8RXVVn3EQ3WIWIyoM+1oP7c2YjTHboJdPJ5ThbJbp6fRkVM
         UFSB6ggKmndUZN5RWoHI6tw6e1BQ5FA+kpfjy79MueeMrDtiAucenAVFaC0tZzyrX6ly
         1REw==
X-Forwarded-Encrypted: i=1; AKwUvByhyHFJe1zHYwZOBzOCAre8OsCB67FORoTNnkEDBKaEz5vB7oHFw8b6+uEg9wXDAU/4ucvh2ve4G8hG@vger.kernel.org
X-Gm-Message-State: AFuF++lkAbCGdsEvCb+gknoumOtv7fue1QRGI5I4LM1o79/Lpcaaz2Ej
	RXRzViPWlteG/OzBF2j15zzFY+L6Mke6OnK62jBy5sr759DaGQXg7UGaPkg+FjeJXfY=
X-Gm-Gg: AYBFou0lBF2bLO5gVMhc/o4R0NMocMhYdXZzt7ekyDySEkk3hwzKSY23FdkanKuf/6Z
	IgDjbQ23RIwjgw3lTcwEDo5SVKoGWafDPax3bK1Mw0xRMrZh/mLRDXYOgT+O224Qo1cJRl1VlwN
	nzub5uXq+CeJQyzEo2iETjdHLhER+h40NaZmXO6gSAG7tTHGtTzVpbh8j5bVFTvhw3gz1FL+HqA
	pdAMV1Mqf84SiERhx+RIP1XlYZMzCRCzqwaOVQeZLDxhVviYov3WdpekX8WE23UjTL8X6q4ugrd
	jQ1uimHVWim/wrqXlFkcO/IX//N3WhCxA/9oCxkTnNgv0HbRSXoO3qO05BMdx17wcjI56t0Pg85
	nyprq48UCGc5e6KhU/ZdOOyjEaPp66nCcskkZmmK1a1cANIIyP0pTvPMvIiFJId29ABiufcUZ6R
	0ZtvE7v24NdP4Ml6G9MIm3DyqQW+lR0hYFRKTUDJjZH0pHIvSM5IcAerHgDDfUrXQbxRgDJOt9J
	q9KOfy4+JhZyRp4H6wH
X-Received: by 2002:a17:906:c156:b0:c25:833d:3839 with SMTP id a640c23a62f3a-c29a437c67amr329463066b.15.1789383803122;
        Mon, 14 Sep 2026 04:03:23 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.248.34])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29852497b0sm286364666b.38.2026.09.14.04.03.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 04:03:22 -0700 (PDT)
Message-ID: <ceca8547-ff15-4f5a-8844-8ec9061a5e6c@linaro.org>
Date: Mon, 14 Sep 2026 12:03:11 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 3/5] phy: core: Add devm_phy_get_by_of_node()
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Felipe Balbi <balbi@ti.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org,
 Krzysztof Kozlowski <krzk@kernel.org>
References: <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v16-0-f7bd68b5369f@linaro.org>
 <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v16-3-f7bd68b5369f@linaro.org>
 <aqRuCfmgPqa5h0y4@lizhi-Precision-Tower-5810>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <aqRuCfmgPqa5h0y4@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/09/2026 22:09, Frank Li wrote:
>> +	if (!link)
>> +		dev_dbg(dev, "failed to create device link to %s\n",
>> +			dev_name(phy->dev.parent));
> Is it okay to print dbg message()? suppose return NULL or some error?

This should be dev_err() for sure thx

---
bod
