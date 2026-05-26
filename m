Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5E53DD84D
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 10:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779791659; cv=none; b=Yq5pgBk8/rRKoXtuDkdPVmK7vXHNZH6YIq4SuuR9JUINqQ34Jc9WXMJ4yaMmt/dOg8F+Mazdq7ttogYgiGevn78AssTSogKS/EP9za5t4hTiH6OWPv9B65Uv6NVHLHvp4/V8i8XjE2HbqCS934gujMczL/7yw3zIVx7doo2Dfvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779791659; c=relaxed/simple;
	bh=sFsRO0yDsb89oIT21S7eA8A6dy+u3vy3rLbnkAXXODM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NVRwksp1ETr7mnMyCZM0fm4GHCAm3V9RTqjnBRyZ/u2PGzcfYbB3o+YGCU29edpSt3gCSE5kbAPfE9fu6F+fEv8fu/qq8TT8ItLoYT+OU8G+0oDAtZFcHx0FrkcAHcMvplLHtDP53afbn+gw38Hjc5MH+TLVt6gnId4tgQGRTXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h6DAze2G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YDlbefO3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h6DAze2G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YDlbefO3"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q5s32l2146351
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 10:34:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M6rrwvTxF7kpNlbgbAaNRd9qzBWBl+jhGHIIgmLXSLM=; b=h6DAze2G1t7voQ+I
	3q65s89rrWntoHB5fhr5aJ2BjUPY12d4DnktScZv7z9KFW40LAsfTK7obOjiIPfg
	tyhkXjZKWid28CNg8JkLL9l2lXEUtxIUnmP4NDJd2FTE6tU14bHjnknFWCWSInm7
	FeeaD56RHAkHo96hI+gPA0mLZWy6wME0CkZmh4duwRag4n25N03ypyquGwV0tntB
	2jqJnZMvU7sEhz8Rgq2QLpodBW3JnykLzO0y/NyfXlI516x+2BjtNxDQ7yyBrL2j
	vyeo8pBmLjf+2cU9+F1SE+w6BXv4gHUeV0DEae8Tj3jerLvaOoXwaEONXj0IsoPd
	dslUjA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecmbv486j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 10:34:16 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bd1dbcccf6so36052625ad.2
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 03:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779791656; x=1780396456; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M6rrwvTxF7kpNlbgbAaNRd9qzBWBl+jhGHIIgmLXSLM=;
        b=YDlbefO3S7I4V7GGJv1vKmEteW4zxTSe5+YkfeHLLehTc2nlDMGi5outd0HLvGoQMm
         J1w0il1vQFBgV8a4HB0MQGISf2mgqyfm853a4kc2H8uNzzKT0V2El+Xv2zL7r3ObcFya
         BsYzuQDdbPwKLyXL2SIS2D/hAwF2pTEref5ee77rSiX4csQ4tHncvmDNr6sCOJvYz6L2
         xYWxlzgbYm7N5xF9liKPEZvNgZafHfz1LkSjJt3+D+mYmW0bg4j3Q5/fS+Zc7z30twym
         u8ke42+BckiHBVhkhY/ObuiYHFICjY8xC7/aElfUMZRk6jEooNM1zpcc6sho3rZyJXOb
         pH8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779791656; x=1780396456;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M6rrwvTxF7kpNlbgbAaNRd9qzBWBl+jhGHIIgmLXSLM=;
        b=MaN9ms0wFRcq3xiFx0+M3GvjfGC3aie+Fd+VX5ocxO6/wwIEatKPFCWOs3uWrieRGQ
         VBS8B9fdRerHxx0Y5Mc7igWD97vfoZbhpEKON2EYiiUJ/7Rb3byByYjVt3k31HKZ6MJK
         27I9R7W/NngsUBGnDFWimHrgKNOE1i3avc/7nXKFWg1poaYVUy+aHnGqfdIn+h3F0G34
         0sOeHG4WgDm5I4OBOR5X2yCxPTmXO0c5vsHzcbr8vndC6PFXHHKUXaJvlhlwcogCoiM7
         g127Bl6iaV/kInPIyAjaB0dQTdqukO+pT0X9EP+Vaa1XrH0F5wgwfIJ/+2KpqilVjvGZ
         bHuA==
X-Forwarded-Encrypted: i=1; AFNElJ/e1nm8+OaRbzLjnl6fiOBsHngNq/U7w1mntxzkb3hpGylcfEfDSuKRsaz9boApMMjRU02ejVa78rfq@vger.kernel.org
X-Gm-Message-State: AOJu0YzKOgvf0kXTOsaJ7WKV68wXyGkf0QUiURTsfAzZ7yW1Phh/MVto
	3qcVo/L14q6oRmcaj4D/bqEyg17yli1083RFUvQEzcIGRMs9J5DAADS05sDqbFxJm1qWQyfteGB
	9G+bVL7pVppKRxcDXSfusLd/qc6G7ls+Fw1yvf01Hwg6BiO1V+5C7R1mxxDhpRiSZ
X-Gm-Gg: Acq92OHpkAfkVITi5iPvB3B1OBMC3v7ReP1kxmMuAhxIzXVI1+9tCK72u7b7jahtwW7
	pIeFZ4gANnSp0+Mf/urX2CbmpWhRBdyHuvB0uPJP75NEYthOxKMprp1F/btoYYRYMvsy4d94Oc+
	0fKMQ+eE25CGt8iFEBZUEwhJvCQ6fw6FriLWfFTkPU3yRCko5Zy/J5iKiZU6iPy9WIZDFknhQJv
	CRCoqdK+BFR+e9tr1CfKVETopH9DWKymYdcGpFcR41M15e4lNp6wqaZRH7OxIUMs4KRa3BjzkgH
	sTGe8sqwMayoF4g9YmFZGw/RUMWEpDMCTrPicP3eItstonJmUcpmJISDS4b5dr3DmO0FyIKqive
	SBDqybZbQ/qLFPiQXQSKbNa25UC9DsTASWxzYmbi/FUf8sKARwoQ=
X-Received: by 2002:a17:902:d489:b0:2ba:6ca2:bca with SMTP id d9443c01a7336-2beb0680e99mr203240965ad.26.1779791656216;
        Tue, 26 May 2026 03:34:16 -0700 (PDT)
X-Received: by 2002:a17:902:d489:b0:2ba:6ca2:bca with SMTP id d9443c01a7336-2beb0680e99mr203240575ad.26.1779791655684;
        Tue, 26 May 2026 03:34:15 -0700 (PDT)
Received: from [10.206.100.243] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56e090fsm131331095ad.34.2026.05.26.03.34.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 03:34:15 -0700 (PDT)
Message-ID: <a5313752-17ef-4d00-9f61-7717e4f06982@oss.qualcomm.com>
Date: Tue, 26 May 2026 16:02:45 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: add Ilitek ILI7807S
 panel controller
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Ayushi Makhija <ayushi.makhija@oss.qualcomm.com>,
        rajeevny@qti.qualcomm.com
References: <20260518-ili7807s-panel-v1-0-d7b048163b1c@oss.qualcomm.com>
 <20260518-ili7807s-panel-v1-1-d7b048163b1c@oss.qualcomm.com>
 <20260519-curly-courageous-sturgeon-2facfe@quoll>
 <dd065ccd-d7cb-45b5-8733-64b4f6571b3d@oss.qualcomm.com>
 <yn7rwuguaqliovlyukcj2olxby7zerv57na3jf2pgbke5zgahk@aasd4ojwdy2u>
Content-Language: en-US
From: Arpit Saini <arpit.saini@oss.qualcomm.com>
In-Reply-To: <yn7rwuguaqliovlyukcj2olxby7zerv57na3jf2pgbke5zgahk@aasd4ojwdy2u>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA5MiBTYWx0ZWRfX9sy4tSdbC8Ng
 xHZ0BqXtIfM0LxjP5ADGOhPmwY7fviIWItTtgicuniCsQ2mqCbIFaQcZYycMcHlFVAFNIYPZ1ZF
 f3zDcvfV9RvXUwG2RA/+8nkpUGgmoGxVZpX82TqmVIbZe2nuBKDe1mVcumEHUDI/rBekueHCw15
 10B1hXbjh8ztevz6ANp53DqQBk+5xPPR0Ip64V7E6amjJ3LvuD46r+e1bXT9D/8bNaVJ4Y8JIr9
 SY8ty7Gx38jXTjzPWL++h26kYua8wUn+lYZ6GO80YTanlUSpSIOF2dFULK9fgGDVFO4cT4CxjY5
 jW0ePf6plXEU1b0f3CYBCiDE1WyNrtGuqnkN8VrrAuUqeIYrxdNxJzZ7kRma2KaR2XQhQWOsvgJ
 /FaGB0Xh5oLKOkZqEkFuMJZFQSQk88NxF0vm4kIe8kvcDaVLSKMqFAmLTIWHv/5xu+wrIV2aCdk
 Dr/X9gsBIve0AWPYYCQ==
X-Proofpoint-GUID: -jEEhj0j8m5NLpSfmP4el3jD9tRx3R5F
X-Proofpoint-ORIG-GUID: -jEEhj0j8m5NLpSfmP4el3jD9tRx3R5F
X-Authority-Analysis: v=2.4 cv=XqTK/1F9 c=1 sm=1 tr=0 ts=6a157728 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=IV4c8OSHAAAA:8 a=QqSZzXjYCKH221ueLxIA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=Q6n48rkgcAvIKCAITAMI:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_02,2026-05-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260092

Hi Krzysztof , Dmitry

On 5/20/2026 6:56 PM, Dmitry Baryshkov wrote:
> On Wed, May 20, 2026 at 06:10:57PM +0530, Arpit Saini wrote:
>> Hi Krzysztof , Dmitry
>>
>> On 5/19/2026 4:02 PM, Krzysztof Kozlowski wrote:
>>> On Mon, May 18, 2026 at 04:34:12PM +0530, Arpit Saini wrote:
>>>> ILI7807S is a DSI display controller used to drive MIPI-DSI panels.
>>>> The DLC DLC0697 1080x1920 LCD panel is based on this controller.
> 
> I can't find this panel on the DLC website. Do you have a pointer to the
> product page?
> 
https://v4.cecdn.yun300.cn/100001_2012175013/DLC0697AAL21MF-1.pdf
>>>>
>>>> The panel requires a reset GPIO, backlight enable GPIO, I/O voltage
>>>
>>> If panel requires it, so should the binding.
>>>
>> Ack, I will update.
>>> ...
>>>
>>>> +  reg:
>>>> +    maxItems: 1
>>>> +    description: DSI virtual channel
>>>> +
>>>> +  reset-gpios: true
>>>> +
>>>> +  backlight-en-gpios:
>>>> +    description: Backlight enable GPIO (active high)
>>>
>>> What is the name of the pin in ili7807s device?
>>>
>> Display daughter card has WLED driver as well as LCD bias driver.
> 
> What is the display daughter card here? Is it a Qualcomm board or is it
> a part of the panel?
> 
> Also you wrote a lot of text, but you didn't really answer either of the
> quesitons. Is there a GPIO on the panel connector that enables the
> backlight? If not, this is some external supply on your (assumingly)
> daughter card. And it should be modelled accordingly.
> 
>>
>> The WLED driver's Enable is coming from WLED_P1_EN and PWM is coming from
>> LCD_CABC output of the panel.
>>
>> DISPLAY0_BACKLIGHT_ENABLE (GPIO 91) of ITP baseband card ==> WLED_P1_EN of
>> Display Daughter Card (DC)
>>
>> In the display daughter card of Shikra ITP platform, we are not using the
>> external PWM for WLED driver. But connected the CABC output of the panel to
>> the WLED driver. Backlight update is happening using MIPI DCS command which
>> is driving the CABC output (i.e., PWM for WLED).
>>
>> Because of above HW configuration, we need to enable the MIPI DCS brightness
>> update on this panel. The below command of dlc0697_init_sequence() is
>> enabling this.
>> mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x53, 0x24);
> 
> So, this should be then dependent on the presence of the backlight in
> the DT. Either it is a panel-internal one, or an external one.
> 
>>
>>
>> After checking this, I realized that this panel can be used without the DCS
>> backlight as well when it's using PWM based backlight control.
>>
>> I can add `has_dcs_backlight`  in panel_desc and set it true for dlc0697. I
>> will update bindings and add backlight as optional property.
> 
> Why? Use backlight property instead. It's already there. Anyway, you
> really, really need to describe the panel in the bidings. Not your
> daughter card.
> 
This `has_dcs_backlight` in panel_desc will serves both the purpose, as 
for our current platform constraint , we need to create our own backlight.
But this panel can be used without the DCS
backlight as well when it's using PWM based backlight control.

So in this case I need to implement the backlight as implemented in 
panel-novatek-nt36523.c, panel-himax-hx83121a.c.

with this implementation ,I will remove the backlight from the dt-bindings.

Please let me know,if I am missing something.

Thanks,
Arpit


