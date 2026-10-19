Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792427568;
	b=RQSuWkB+oi1YKIdrIy6MgBZAWOUJi1ps4H2zOmTvm8ih0CtGA7sfMrcTgI8zLuX6Jqxy
	 CmBguIr40s1kYhrnXeQoGCAhExPB1OrB2soi6xPYz1PSl997vy4CTjBS+rPv+xeOrWqXp
	 JRyk9z3WQeUIjuUMp7KFtnxO6+qU93fNirOGupromgU4sDtaJUk1mtwSo/Fk4P3d8mDsc
	 BDfYKYgaeVJ27GvGTIznBUPTzKHMpLj0mYDM2HGdF9s3w+xDXe710E37dn43+t83N1Gq8
	 codxydFjwZkyO3W+PQBsFC4xZJQUfJQlfCw0qqDSablcwxTWv2eVt4ejrGZ+t6CuRcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792427568;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=BWj6P+5N+9+xj86kghtIJTrYQUXSGty1irTiTrrFBnA=;
	b=pVMoEx+wf96/Jdb1azl9+Sj0Edi6et+I+4JGCXBepCew1oYxy64nHW367KEKbl53PHTc
	 xHUKZdeCRJHIO6R724A7bQENCV0Y75rlVLaZYR7fetsXCHdCCcYIOe/mggWo/Iepq/T9Z
	 rfEtRrNTKuHfaQcLaPt3JUKnAIe6Tx+ZWhH0SmN2f0HePO6nagktMgYbcypaw3sXIlk7R
	 KBAJVZDh1sO6LcYvDOi8XI5PBrdN9SwA+LprxOIvJKUgK1oJgNIpXRxmQqYBWVebw74Iq
	 gwCAGHUpWc5A+0r+FnU9YfEidz17EIK3Xsjr/dQ6slzSw5uq3p91IjCdRdJhqW2iFEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uihAlf9K;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C4F606A31C
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 16:32:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05C4F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uihAlf9K
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a1cef0439aso25408605e9.0
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 09:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792427565; x=1793032365; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BWj6P+5N+9+xj86kghtIJTrYQUXSGty1irTiTrrFBnA=;
        b=uihAlf9KMF1E7leWuq2ziF+jrvFzjVQh7yDYYwzmE3kGwVMD/K26Cbe/WTxyj+aj7T
         mAesrIGwyR4p4Ql43E484qxEkEgCc0OkE9YMJdVzd0q1ccVEqcLEq3T7yJPl0GDq5V2M
         VjoLaMO1/sSM9Xw0782GHEKPJDIi+C135kZe6YY73odVwoBYIbX6GUimHcMSomwtinBM
         qKmut9yiRk+wIbHsrkMrx1UWH7snwPL6op9IUbn8BCco5lV+VMY0sdLxsYG91VuGKJcF
         hK4ft3UJvUPrYuW9Afwdl5axq6UN2qcIMClH3N+BNIuY2d/Yl/VQCVizt+5p/aBByBlZ
         V6Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792427565; x=1793032365;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BWj6P+5N+9+xj86kghtIJTrYQUXSGty1irTiTrrFBnA=;
        b=Ur/Ms9yny4zOX6Um7ka6fxBH030DsamiFUigL7QgAMKEVN4xxwPLYA0o/iYqEJ69bq
         oeJnMWtyzmGyX5za6e2YMHHrkAhgqZZQv+XdaZ8MUtsLUw8SQbZXlt9kBJKmTxjrnJrB
         K/bniJarUP3fXf9WEbjRp9xxzb5SpYMilHN5VYw+v542H4zU3pYFwDsh3NtEIc99RQ3e
         xg3AFBGXAqhblvP/lVAqioxmzwF9zHdyhCCLbpgMj0La/8fkV92hjXSj9AxeU31APxv4
         wD4coufvxmdQ/mDjtABYdHm3tgOJbh7yIThziYUJU/Cj+eVPdZT7C83EJXqsYbqfa7a2
         t6MA==
X-Forwarded-Encrypted: i=1; AKwUvBz3vARLLEXVw9kJAkjUclxwTcQU+z7HRtTyeAU/LGIC2rRXkn8ZNaQ64hSsRpeSSnE3NbMzITPS582I@vger.kernel.org
X-Gm-Message-State: AFq9FYIkvYNMo1C/NSZxbbIz0aMd9mkn/dEpgR8wFX3I7Bsk+qyp72k6
	QVK8PzO3fB0F1NR4nws3gMoEyMVxZO1zsAEfGM9Rr1svR69tYfj9eh6N6EDfp5HFao4=
X-Gm-Gg: AYBFou0OzGDWLJyahFTW5NrL8PWqY6unsqTOOvIBH34Z59oLfDUIE+hzJoYluwZn/UO
	nN4tojgsm8LxVh9KdnschQAhe7TiJfmhKBLtN5lp8l4kNb94l6eC4iHq+H+zocvydy0ROoqbcuH
	L1miXXkphIqTxQ9kgr4wbEJEoy9tZvnX2tBcJIvsLIX/gDu93JlK2k0ZX7NskDPoxaNEy/fVfsP
	KapZBonOsyVQjCyoaYVvnQaWhiPQD1Vh3kVoJaeyXViS53ECdGfnYVTBQm+iWXP8esX1/mpq6Nc
	0MKM8V3XHryQlwFsau1lOGD4TQRqEwzLHlmEJSlhqV5/WFEtQCvuJkAZP0lurcYAcfROmOKfEXl
	FkIi6tXDXwTGhAmkmtsM4DwJ5N0uZimZgf7knTpAhoBtNBwC1rIIfzVlo1lT5ALoKjDFFnzofIv
	+7E9/42ZYzKjyymiYVFVdlwtHd1ywBuKS/jF+cVafNlmP6JkKtiqMYAlPC5ft2bQWZcLX1z4ZFj
	W/S6KA8UcgE2CRUm2LJnUeH7gP3O4actoAEKg9/CEXaDm73ovv9SVGYkFK+iA==
X-Received: by 2002:a05:600c:3b13:b0:4a0:2150:55fb with SMTP id 5b1f17b1804b1-4a1d75ad08amr209137105e9.4.1792427565319;
        Mon, 19 Oct 2026 09:32:45 -0700 (PDT)
Received: from ?IPV6:2a0a:ef40:eb0:c501:2c4e:44f:2449:8978? ([2a0a:ef40:eb0:c501:2c4e:44f:2449:8978])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2cc809csm3538555e9.8.2026.10.19.09.32.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 09:32:44 -0700 (PDT)
Message-ID: <ee975969-e310-4950-af09-f57fb423a9f5@linaro.org>
Date: Mon, 19 Oct 2026 17:32:43 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/10] ARM: dts: omap: dm816x: Update USB node
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Ettore Chimenti <ettore.chimenti@linaro.org>,
 Paul Walmsley <paul@pwsan.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>,
 Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Christopher Obbard <chris.obbard@oss.qualcomm.com>,
 Linus Walleij <linusw@kernel.org>,
 Rouven Czerwinski <rouven.czerwinski@linaro.org>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org
References: <20261016-patch-ektor5-dm8168-dts-v1-0-b4ce30217028@linaro.org>
 <20261016-patch-ektor5-dm8168-dts-v1-6-b4ce30217028@linaro.org>
 <20261017083957.7c2696f5@kemnade.info>
 <8a8313f1-d525-45d3-9044-b5f7a00b256d@linaro.org>
 <20261019154503.2111a89c@kemnade.info>
Content-Language: en-GB
From: Andrew Goodbody <andrew.goodbody@linaro.org>
In-Reply-To: <20261019154503.2111a89c@kemnade.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/10/2026 14:45, Andreas Kemnade wrote:
> On Mon, 19 Oct 2026 10:36:37 +0100
> Andrew Goodbody <andrew.goodbody@linaro.org> wrote:
> 
>> On 17/10/2026 07:39, Andreas Kemnade wrote:
>>> On Fri, 16 Oct 2026 16:41:21 +0200
>>> Ettore Chimenti <ettore.chimenti@linaro.org> wrote:
>>>    
>>>> From: Andrew Goodbody <andrew.goodbody@linaro.org>
>>>>
>>>> USB node was not working correctly with DMA enabled as the supporting
>>>> code had been updated without updating this SoC's device tree. Bring the
>>>> device tree more up to date so that it works with DMA enabled.
>>>>
>>>> Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
>>>> Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
>>>> ---
>>>>    arch/arm/boot/dts/ti/omap/dm816x.dtsi | 41 +++++++++++++++++++++--------------
>>>>    1 file changed, 25 insertions(+), 16 deletions(-)
>>>>
>>>> diff --git a/arch/arm/boot/dts/ti/omap/dm816x.dtsi b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
>>>> index 7f3ef3a00ab8..5be9efc60785 100644
>>>> --- a/arch/arm/boot/dts/ti/omap/dm816x.dtsi
>>>> +++ b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
>>>> @@ -574,18 +574,27 @@ uart3: serial@48024000 {
>>>>    		};
>>>>    
>>>>    		/* NOTE: USB needs a transceiver driver for phys to work */
>>>> -		usb: usb_otg_hs@47401000 {
>>>> -			compatible = "ti,am33xx-usb";
>>>> -			reg = <0x47401000 0x400000>;
>>>> -			ranges;
>>>> +		usb: target-module@47400000 {
>>>> +			compatible = "ti,sysc-omap4", "ti,sysc";
>>>> +			ti,hwmods = "usb_otg_hs";
>>>
>>> Why do we still need this? It is depcrecated.
>>>
>>> Regards,
>>> Andreas
>>
>> Without that line we get the following on boot and USB does not work
>>
>> [    0.110148] omap_hwmod: usb_otg_hs: no dt node
> 
> It is somewhat odd to use both ti-sysc and hwmod. It looks like a
> half conversion.
> 
> For an example how usb_otg_hs was converted to ti-sysc for omap3, look at
> 42a79edd4a3dc1bb8e89fd2849f9e8e1e1c13977...v6.1-rc1
> 
> It has no hwmod stuff left.
> 
> Regards,
> Andreas

Thank you. That was the pointer I needed to sort this out.

Andrew
