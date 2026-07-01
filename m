Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9798348097E
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 11:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782906323; cv=none; b=Do3uxSgXoXL7uUCCFEg26CHL7sp+xy/vmgtmTC6ZSFtqrNx8np6cZsKvVlWsflERuAggtFH8tl78eg5JEl8pShteBQleF+ZyMxy4N/jGqOP1/oDDmnronmOF1zjuqhBRj4IvQ/9mzI/Atr4SmzuEl+sg2TqXwF0PExFaBEzcgik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782906323; c=relaxed/simple;
	bh=SQSUko4GI9pCE+p2f+KLI+dpEc5vU+iudSehiK/dI1w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SdC9qmukH25fENtrVUhab4M/C61f91U6bkDmnKxPjmvvK/2H2c2vh9+dBoUpnL6F0EDfflrUooEPOd8mBbr3ckGmEkOdaVBcNyeiaR+uDyV8R9CwncNuuS6ieVX5+SENtZjKYwIQhAulXS73XkIS+cttrnxAj0qIbKUbrYkXi3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OiLBWZFT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OpNTcFVb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OiLBWZFT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OpNTcFVb"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8Tfb761481
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 11:45:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ijykd+gMiu7hdyIzaCH2W3+H+cWrNMIuL/ruF75GJNs=; b=OiLBWZFTj3qfHrPf
	Fyf79lVgXB7hnvLvxok54wWh+KxNvnXrZfX5O2GOtXzC9wRMe8dO+asrjkoXs8gG
	QA6ADFbEMoA3uhCfjWAtR2AY6EsRPhN/xtF7F/gDijePoa0lQPK2XERg1+doR2lN
	dUSpo8YI4yxWcbGAD+cLNqXzHh+xhxramZNx6Aq0zBXKFSBiPeSy9ZIZGCoMvpBo
	lJVDBeXTFQ98Gt2+k7VWo8fQvEp8fOdQKSyoEtku0Z7G7s0pS8+a1PMmxwCt8b0A
	gy0kJcJrwUfCANMszqnDxlo3xmClrCe5haA2riv7Hve0rXIj8vQMszyyp1TsCJxV
	1D2oYA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4kgw3uuc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 11:45:20 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c07313be5so1096501cf.2
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 04:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782906320; x=1783511120; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ijykd+gMiu7hdyIzaCH2W3+H+cWrNMIuL/ruF75GJNs=;
        b=OpNTcFVb2Z8ZHLnVVdWrgOJFgfiC659+PZGlUDnqj1lUkv6+FH+dMCA7gBg2tf7Qil
         Hjm+85bMKiiet+dFj3Za19WUVc6iY7JC5/DBmP3ej4nop6E49ilmYjupFI5kJ4XXKA8U
         Pg2s3uvNJIFAD+g+VCWLW3jGv9qvMPY0yjoiTm6MPGF0pTM4w/3vYOVeaVaZ55N+qhV/
         rM0pUVjEZ+J4rUnReUCPnAyDOAYjYf6xgNPeyMwOD65Z03htPNiyTLxiLFpQsuNhPCus
         5B+yxpOPPdlP08h4QSYKzhLqLzHDFuGvdSGd9Uqs0bIdOSGu+bzQaM9GeAW6AJPOfRxv
         pLxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782906320; x=1783511120;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ijykd+gMiu7hdyIzaCH2W3+H+cWrNMIuL/ruF75GJNs=;
        b=WYQwmujQI/tGTdEnIvxBiDla1wEuSmCkdHBz1zm2p/xU2aegeioQAFp3YANgE9iEuc
         fjDgsbjANkSLHgIb4zAHlThPjA6c5Xc3qKL22GX80tGF7pnU5cU4wCp95JLs+2E+8Qog
         5FZirnm5pphAnpOQoTFALnsLvny+FQbnZOpzqXEzf7YDx1owXuiaeE9L8B2EyHkJ4CHG
         N4srTTClpdBNqXfF+ND1vc0IqDocy3YXNoj3GXZz1CQrnFZSpnK79NjIn7TDXFcrDH24
         tuzfGwjk+KaI9emSlFGml0qP+1E9HlI0uRoctw7YCoXf6ZQXmbCdRm5G2cjP/PwzPsL2
         V49Q==
X-Forwarded-Encrypted: i=1; AFNElJ+i8YSuV4kIJJUZwQrsQA5Bf7O65PZBSV21nXHIKT6fac7xsJxWsMNB0WZyZsMD/L82Y9fFWcTRJChw@vger.kernel.org
X-Gm-Message-State: AOJu0YzVEHXeTPjSaP2PKGzeghMay+n4DE3j4jBUQISkxYutXlM5qviR
	5WMRimYHbOPYb2DfDylIdJ1sD+MwndPRVJbU9aSXXfTssh+trK2ZMbGCnpB3ZInkPHrNfRbq94E
	A7t21p0hf5gn/+VXf2ZmrqIdoTeSstCfMNng9Q9FUPTprleAEu7qMrh49SmURtleT
X-Gm-Gg: AfdE7cnp5dtTQYATyAk5yyYBRXgFv+lPApNUJKw48AFF0zij1NfTLW6nUfTyKirpQiQ
	l+guaQGW6r2pKBv0ofC1UDvpZB8aw2gZmzW8NjmcrAY126sZPegp+sGm5gSAFzKGMBMW2Y7zHKH
	oSX1stlTKrh5OnKXJrGj8k4WkSjtoL19fRZQsUgHLchYhwkFn5hpqPMRQ1LZ/fBi0k1+gROPyEV
	6whqYIkWBtHX6s1Xm0Us9AIIkvd0H4A1w+IEFTzEHSY2IN/HKS89j/2anxC5P1uimeoiBlbsIrZ
	+JrQZBYoKcFGHGz5G1FO3fetUGsbx2fC2vkjhmOGMaO7uEovid/bJZ5zr2MPVJMewzNy8Zt90R1
	TfqSxKyFNitHww9rWQCFWVPIeG13V9M4l9Wg=
X-Received: by 2002:ac8:5a86:0:b0:51c:8fb:fa46 with SMTP id d75a77b69052e-51c26b392eemr8382411cf.9.1782906319708;
        Wed, 01 Jul 2026 04:45:19 -0700 (PDT)
X-Received: by 2002:ac8:5a86:0:b0:51c:8fb:fa46 with SMTP id d75a77b69052e-51c26b392eemr8382091cf.9.1782906318977;
        Wed, 01 Jul 2026 04:45:18 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6987c967a60sm2607666a12.26.2026.07.01.04.45.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 04:45:17 -0700 (PDT)
Message-ID: <75b423b3-d721-4bff-8d42-603cb5679364@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 13:45:14 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp-huawei-gaokun3: Add dsi panel
 DT node
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260630042229.277799-1-mitltlatltl@gmail.com>
 <35f13ab2-cdba-426f-bf4b-36f53ce1d4bb@oss.qualcomm.com>
 <CAH2e8h7p-i3epbxD6Ks-ru2OP+qY6nYXA+Fm+Luexo3cZ2Eucw@mail.gmail.com>
 <cbfb770e-0e27-4254-a3c0-6011e8eb37ec@oss.qualcomm.com>
 <CAH2e8h4ABRuOTe8Qu-iPEk-i6r-Le3bzmwFSEG_c7YmBu1LjCw@mail.gmail.com>
 <250311af-0860-4a76-9799-c01608b87293@oss.qualcomm.com>
 <CAH2e8h65xgLnqusTMw1QnAMSmf__YK0PsWY-w0D=32US1d9L2A@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAH2e8h65xgLnqusTMw1QnAMSmf__YK0PsWY-w0D=32US1d9L2A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Co2PtH4D c=1 sm=1 tr=0 ts=6a44fdd0 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=mzDM7A3Z3UpNTzwAeNcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: y7q07quP8PNFsCFkodj662qqmZSmaPOt
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDEyNCBTYWx0ZWRfX8GiD8rdiB3Mt
 weKEuVRe/greaA0hfALfCUC1BhxSBNQTwk2rOVYbjcJh/mqAuWMg9JfB3K3Dy4TMaC8FA9wQpT1
 BpTFt7eHX5y+Gqe3aGawIyYiKJ8GW/0=
X-Proofpoint-GUID: y7q07quP8PNFsCFkodj662qqmZSmaPOt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDEyNCBTYWx0ZWRfXwzLGFAm0uUg4
 96fW7Aqkw5QJVaWkZ8mnepWJDzU5FwGmClgpaUrTZcxPJPzgwZMHUmU/3NBYaARey2hgxPKw0ar
 l8Rk+mFKjtETMZsddSvOr1w3+HVee+17qjyul/sugnEoFnGKaeWqHIqe1LYdpAlDwllATzbiUik
 efvU7qeB4yTjmAR8Txa1rE/WFsN/DbvA4k6eaOz/ck0aM65cj9JYQWr1GFnMRVePF8jP/Xlca8C
 YfiqA5F97YJcYtqxAY3QuC0vfTZtLLzrndH7J7MSwgrdUzdJuWfqthDZBVhAOOE0a6l7jqOSZq1
 mfBlGdh1p7ytpyLoeoigIGWCx8N6ZbcyUd3pPWWLJVJ+LwUpGgYBPtbb+tg9fqAuZ7n0EYO/wEg
 IFz8fz1BMbEC8D5w2PZOsfdVZD7xoGzdzTBdXKSR7vDyKhmEI8YWc00eKudurmH2RagkXLm5Cbo
 16aqLxkxLcq9iiGU0EQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 bulkscore=0 suspectscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010124

On 6/30/26 12:41 PM, Pengyu Luo wrote:
> On Tue, Jun 30, 2026 at 6:34 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 6/30/26 12:30 PM, Pengyu Luo wrote:
>>> On Tue, Jun 30, 2026 at 6:29 PM Konrad Dybcio
>>> <konrad.dybcio@oss.qualcomm.com> wrote:
>>>>
>>>> On 6/30/26 11:28 AM, Pengyu Luo wrote:
>>>>> On Tue, Jun 30, 2026 at 5:18 PM Konrad Dybcio
>>>>> <konrad.dybcio@oss.qualcomm.com> wrote:
>>>>>>
>>>>>> On 6/30/26 6:22 AM, Pengyu Luo wrote:
>>>>>>> DSI panel driver have been added for a while, so add the DT node to
>>>>>>> enable it. vdd{a,s}-supply for dsi, dsi_phy are blank since the DSDT
>>>>>>> describes the wrong, no impact after manual disabling these wrong
>>>>>>> supplies.
>>>>>>>
>>>>>>> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
>>>>>>> ---
>>>>>>
>>>>>> [...]
>>>>>>
>>>>>>> +&mdss0_dsi0 {
>>>>>>> +     /* real vdda is unknown */
>>>>>>> +
>>>>>>
>>>>>> L3B: DSI core 1.2 V (both?)
>>>>>> L6B: DSI0/1 PLL and core 0.9 V
>>>>>>
>>>>>
>>>>> Yes, that is what I saw in the DSDT, however, I can disable them
>>>>> safely (hack the regulator driver to add a sysfs to handle these
>>>>> regulators), the panel works well.
>>>>
>>>> L3B additionally powers CSIPHY2/3, EDP0/1, REFGEN (probably why it
>>>> ends up being on), UFSPHY and USB1_PHY
>>>>
>>>> L6B additionally powers the same components, minus refgen and USB
>>>>
>>>
>>> No, I confirmed they are totally disabled, since there is a way to check it now.
>>> https://lore.kernel.org/linux-arm-msm/20260420-read-rpmh-v3-v4-0-70c152e6c958@oss.qualcomm.com/
>>
>> This presents you with the status of the votes casted by HLOS, not
>> the actual hardware state
>>
> 
> If so, non-HLOS will vote on some critical regulators to keep them on,
> IIRC, once I disabled L9D, system reseted immediately.

NHLOS will generally ensure that the hardware that it needs is
powered. This does not extend to hardware that *you* may want to
access in Linux (or which was left online by UEFI), which I suspect
was the case here

>> To get the latter, you'd have to dump the SPMI registers
>>
> I will appreciate it if you provide more information.

Take a look at drivers/regulator/qcom_spmi-regulator.c, you can get
the actual live value of the enable register and the voltage selector
for each regulator

Konrad
