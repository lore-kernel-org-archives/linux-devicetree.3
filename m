Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E971B1EB5E3
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 07:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784879061; cv=none; b=CKkFmB2VtvXk1HeLik6cSmfXEOYBaMSejHYwUlANGdQXyx2/YEK+y3KRv66xtBGLxJGyXoG5sSgE3UTHS3+8V1tnuONz/JapOYUKNh68GKLDuC+U1tSAPNIiKBVYsychQV+3BkY0Sl3cZjkuSPK4g5bIJ74e5q0q6qaG8xwaJGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784879061; c=relaxed/simple;
	bh=sHlybZgLkTs2r2AfscP+XwN6yYIR9I1L19bdkTZIvTw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zy9BbDfvlEQMrY+er5hmPx//DNMTgJsTbaTD79fsnOhDUV6KUm1xSHYj2SnbyuZDBelPyZJt94Z5YR87e4asu7vZqGYEEu0ERKeLkz+IRMXG72O7Ar1TYP7lCcyN9Xq9xTJtx/vb3YvosiEqOk4jq1Le17MKrsmHqlnz3wsCTT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=on+6E/J8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LiiDvzUD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="on+6E/J8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LiiDvzUD"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4lbbs2125326
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 07:44:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Eoy4QlmrMHX1Usc11OodSW3HOovzq95yfLLLy/3S0hY=; b=on+6E/J8ZnMEbWlP
	N6QDv6D5XFdzk5Cxmwu5f2RReUEaffQhVOxakDLXa4Yvsi1flOmnkH8/64ZwCTic
	0zXDU30lUUOg+ARJq9PgXbZgLam/R7X76BhUb2brd0nedeUUTxsfzcTlfmKg4tDw
	h3aUAnasMbnB7UW6ngXCQDdmNIgWVJq7EorB977XMCj0CqQO1Mbb7cAKDnguXkkE
	bIJkirDJem9ldpNPsX9IQzW18VXA6SwTjEKKN4T5SnBgj/YXOawdxhNVELYutHaq
	P1l50RYT36T2H62E4zrJTDjG5XEHXjAffNrc95eG2yfxjAwHKodfkiMUXDl9f/W6
	MH9e4w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkqamtn33-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 07:44:18 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84885a4fcabso207074b3a.3
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 00:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784879057; x=1785483857; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Eoy4QlmrMHX1Usc11OodSW3HOovzq95yfLLLy/3S0hY=;
        b=LiiDvzUD3mSiOSnsqOwdxFv7I4U91HJAdGW9wyjz5dRgBSUCt2fyVnxmz/rCZp/Yci
         DcoELXefIUZs5hOB1bcrrU9zQlWZ1opUGTRSEdtKKiMiS6uZJ4pG9MVMi/KvLwEpUQl5
         kiCXkIifkhX5Js97mSmes0bGRe1OMv4zOygy/WszHdeqiCl3fkS3UBdpekiRvg7MCnkO
         d/ey8hY3wVDkNrkFVDvb88XoSs2a/+dt+Dvn8wZ0Y1+8jZ8Nnu57caZ81N5aWWoWYw/7
         FX1q8DInSAnOF2wPjGbbsR9JsDsYFJoGBYek1QFpWfAhVJYc4edCbp/4+ibwRcOK1TOx
         bJvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784879057; x=1785483857;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Eoy4QlmrMHX1Usc11OodSW3HOovzq95yfLLLy/3S0hY=;
        b=mmMAI2JZ/zKAW68oShnfBFMWBQvWVdOZs+5Si7WqhvzPbXj0AO93mbRS7Kdhyiht8v
         9sq7pBFLUwEKmOeyBVMs5yM7EJS7faqlpT5qe1GMgzsRfIOINpm+EXePHIF9BIJqnr5H
         c0ISWCAwaYSFtaEluVlJNDozYZErr/x5VwQL9/06y4byU6FD8Ig38oaUCiBrdeJgLTn9
         51xY+kqT1HXYi4/lSPW6YFH4jN5uuxhodgNHmbRDZ6JfKQn297uNmFdqqAf23rAF88Gt
         yL+/q0BxxQvF7rHv/WHqdzRmcgdsBYDQYswyE/O+cXFo5r3VdYmYLFoi85uu7Crh6xFD
         wUNA==
X-Forwarded-Encrypted: i=1; AHgh+RpNl6W5/AMJs3gqVwPWVorwRyed3tFCe/a7LqglOeIglhnD6Z6LaZmF7tTsjKgsasJsyoZWCEuyUTpZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwvbZwNfScY6DsfA30CClGXi84grQImP/bScWSTRE1V4i+nm6lZ
	3T9ABJZ+HOfjOPkf2/70NSCtE9C8W5VU/QG1qMKN+HY2bkndlG5AnqBjk2I6HHmNzmNGQrYucJX
	NhOt2h2AmWlh8iAmiBP5d3E5h6K1O5IixWT53PuQ/Jcs+1yngwMfZOyXqXkLUmUALt+BwwjMU
X-Gm-Gg: AR+sD12akDVunLl1dlXPEj9ZfTv86hq5GC2sBj9Hw/JISkJcQlt7BXdB8L9IxPg+BZJ
	SAiSVFHIp5k/fr59xpRC1I1XXyCjFpFrx9+0SYHhpeZ8aRL135J5qtTmHdHBXSEvtdeWP/DT93A
	TdCNdBWo7RqTz5WxZwRz0r6XGVZjW496zOGd9LjqwG3W4TJ4DhuMWJQoRLuO/gdOelbb2/ltQJW
	FvnEOqkzIXhRi9bmhYn2a1IbGLfbRnTO+iIWSvzFuZZrbo5qtSf371KdlbI9Dqt07ZuLoDPaWxH
	cxyQTiG0K1KXvI4t+hUyDNOoum3AQbAyF7AH+rN8Po6XXsMRCtCBHOerNnr52u+S0aYlZbpIGKj
	h+aGkeijGHC80Zvy6ryiL0rrDnnU=
X-Received: by 2002:a05:6a00:278d:b0:848:2e3c:9955 with SMTP id d2e1a72fcca58-84e2b82f7c2mr6728963b3a.4.1784879057527;
        Fri, 24 Jul 2026 00:44:17 -0700 (PDT)
X-Received: by 2002:a05:6a00:278d:b0:848:2e3c:9955 with SMTP id d2e1a72fcca58-84e2b82f7c2mr6728943b3a.4.1784879057049;
        Fri, 24 Jul 2026 00:44:17 -0700 (PDT)
Received: from [10.218.5.114] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e17578345sm4194987b3a.39.2026.07.24.00.44.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 00:44:16 -0700 (PDT)
Message-ID: <39718bb3-8f13-4cfa-946a-908eeff0653e@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 13:12:33 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] clk: qcom: common: Register reset controller only
 when resets are present
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
References: <20260723-shikra-audiocorecc-v3-0-90b878ae0d4e@oss.qualcomm.com>
 <20260723-shikra-audiocorecc-v3-1-90b878ae0d4e@oss.qualcomm.com>
 <20260723155515.68A0E1F00A3A@smtp.kernel.org>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20260723155515.68A0E1F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA2OSBTYWx0ZWRfX+1tnRvgj9vPb
 FCBh5UzLuCXBxkEWRN881G7sbm32IMQPcL2K+hwqABHt2aF7PKrUjSH3KmU/eKPe9oqSUINFvIL
 zCeX2Cdfk5T+qYji3yvhgYRh5cwILbavrK7myAWa53HPFxyDlltkKfA9JvlrIekHs7OHQq4LMHn
 9MoVAJYrK+YB6fzwD1BDf0c7HrHuYUFkse1Q5t1Zr+po5tspmhzFCvSc2a4mbkYvSrW8w05CX2X
 yaZQwE6GENkfIHFFZWfISsNVXbTEJ2BDqCG8Qu5YAkD2/2qCh2vvB96Iu6exTy44xDcoG73RYki
 UzOPWGDhyW0Shn6FiyVHImFPZgrTYZcrzzGMHZ8E2mapMKUK0TJAng+/GAzd5AQIUxSyIDZOW+8
 9ydAMsN9oBD/tmadXXHjwNyg4Myhxa3fD5JX87X3L/hHcHbGGKvN+P2HJm+5gL0foOuGbBwDaCJ
 BX9sktH8r7JoKDq87BA==
X-Proofpoint-GUID: 2lPApJd1WA7DSLpFZK10uEngXyB3R1xa
X-Authority-Analysis: v=2.4 cv=DfAnbPtW c=1 sm=1 tr=0 ts=6a6317d2 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Z0OJ9TEZ1dYWzG6c7Z0A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA2OSBTYWx0ZWRfX48Y/hpEvUc2V
 IQ308ODf3jrNA23hBFRaOajMLSjnHWpopGrm9V5gMhX/TOEsykm44K5GXJg/RyTOkssC7Z1PyPN
 TT/oprr+LeZXza+pR8DIFFzoBsxT5hI=
X-Proofpoint-ORIG-GUID: 2lPApJd1WA7DSLpFZK10uEngXyB3R1xa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240069



On 23-07-2026 09:25 pm, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] The local pointer `reset` is used uninitialized when registering GDSCs if the clock controller defines GDSCs but no resets.
> --
> 
> --- Patch [1]: [PATCH v3 1/4] clk: qcom: common: Register reset controller only when resets are present ---
> commit 4dacf2df1c1e317705833daaa92c7514eab60f24
> Author: Imran Shaik <imran.shaik@oss.qualcomm.com>
> 
> clk: qcom: common: Register reset controller only when resets are present
> 
> This commit avoids registering a reset controller if the clock controller
> descriptor does not define any resets. It does this by checking if
> desc->num_resets is non-zero before initializing and registering the
> controller.
> 
>> diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
>> --- a/drivers/clk/qcom/common.c
>> +++ b/drivers/clk/qcom/common.c
> [ ... ]
>> @@ -359,17 +359,19 @@ int qcom_cc_really_probe(struct device *dev,
>>   		qcom_cc_clk_regs_configure(dev, desc->driver_data, regmap);
>>   	}
>>   
>> -	reset = &cc->reset;
>> -	reset->rcdev.of_node = dev->of_node;
>> -	reset->rcdev.ops = &qcom_reset_ops;
>> -	reset->rcdev.owner = dev->driver->owner;
>> -	reset->rcdev.nr_resets = desc->num_resets;
>> -	reset->regmap = regmap;
>> -	reset->reset_map = desc->resets;
>> -
>> -	ret = devm_reset_controller_register(dev, &reset->rcdev);
>> -	if (ret)
>> -		goto put_rpm;
>> +	if (desc->num_resets) {
>> +		reset = &cc->reset;
>> +		reset->rcdev.of_node = dev->of_node;
>> +		reset->rcdev.ops = &qcom_reset_ops;
>> +		reset->rcdev.owner = dev->driver->owner;
>> +		reset->rcdev.nr_resets = desc->num_resets;
>> +		reset->regmap = regmap;
>> +		reset->reset_map = desc->resets;
>> +
>> +		ret = devm_reset_controller_register(dev, &reset->rcdev);
>> +		if (ret)
>> +			goto put_rpm;
>> +	}
>>   
>>   	if (desc->gdscs && desc->num_gdscs) {
>>   		scd = devm_kzalloc(dev, sizeof(*scd), GFP_KERNEL);
>>   		if (!scd) {
>>   			ret = -ENOMEM;
>>   			goto put_rpm;
>>   		}
>>   		scd->dev = dev;
>>   		scd->scs = desc->gdscs;
>>   		scd->num = desc->num_gdscs;
>>   		scd->pd_list = cc->pd_list;
>>   		ret = gdsc_register(scd, &reset->rcdev, regmap);
> 
> [Severity: High]
> If a clock controller defines GDSCs but no resets, does this leave the reset
> pointer uninitialized when evaluated here?
> 
> During qcom_cc_really_probe(), the new if (desc->num_resets) block skips the
> initialization of the reset pointer when the clock controller has no resets
> defined.
> 
> However, the pointer arithmetic &reset->rcdev is still evaluated when
> calling gdsc_register(). Passing this uninitialized garbage address could invoke
> undefined behavior and cause a panic during boot when compiler hardening tools
> are enabled.
> 

This appears to be a valid issue. I will check further and submit the
updated changes in a separate patch. For now, I'll drop this change from
this series, as it is no longer required after separating AudioCoreCC
clocks and resets into different devices.

Thanks,
Imran

