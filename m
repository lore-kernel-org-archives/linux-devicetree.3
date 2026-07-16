Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D13F41F376
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 12:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784205732; cv=none; b=lG6uDT3rPpUF5/rNwjE/gTkOnKDjGwP7KGzPQUi5UGKX6jXhjmACMu3TTBu7PZdbvUZ9Dw6PYnVAnyht3nKGzqn/dgjnDtDwb8Kr+zU/M+AHp0DuLJmkDNlrFVXkkUfUa3uLHpWHateH37MLLQNgJXufilVYZCIoMO2EdtLqyfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784205732; c=relaxed/simple;
	bh=aZjkUe1c55qeNoGRtdIQ8tMN4RZ/ApDiNCpm9RMNjTA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ubg9ZsMifnFfvRdIcbJSWlhXbfPCKEVGckA5X9bp/1+279JAOb9gc21+9psUY+BlicE/l2azkSP/ZW47W/pBmnGQWITA5O6O60fp+5U/GIeT8AV4izSxsWfuhhVdrqU+fqKE50Zxit1a1JOGrNzwdW4gtADbe10ytH4DeLEy+GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sc6oB/ym; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IKMxmzU6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sc6oB/ym";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IKMxmzU6"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GBihoI3747445
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 12:42:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UYlz6Mik5/sZA3dGlhiKFDmqJjZEM76yBtlXFsw/ze4=; b=Sc6oB/ymyLzsoFOZ
	7w7deN6jYSkeazoBRke2QxbYKBTYlt2IXVzdXdlbEFqrsxhckRCwm3POZLJwoaCx
	v3FzEFUHXZ8nE68GhMaMIneieMhX9Wr3mjATIjGH2uKb0rgcdbABpcTbs0pkUD5o
	4pmpEFMiphd8OBkQCPOAJgwEz9kxp8wAQv4XtLEUOMZduvXTvks2mIwWyoEdQTF8
	t5C9NU62GWelUujS9WW7skAm0FvWyKZ4rcLfSi597Wjsl8LAP5RhP23+EQ3G49EG
	BBPAfNeSCoDlgchXMpGHznbErgCMfW3DUYI/jyQu7fpRx3JvGBxvK2f6xz1506Uj
	gCppGA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feq3pj5ts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 12:42:08 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c88ad1558f4so2060329a12.2
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 05:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784205728; x=1784810528; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UYlz6Mik5/sZA3dGlhiKFDmqJjZEM76yBtlXFsw/ze4=;
        b=IKMxmzU6/2PDBakxWwjUQ425JhHhOvcBIqVWDZvDLvk15mKUU3mTI/36V6gDBkKU2O
         B8ltHAJ12f8YuX9qJuPspRcxCc+yCKNCsJ71gNQkv6RrOelL/LfGxyQm+OkzAajS9Hxl
         +eUu7DRuMyx9jTAA+CjJb7jtPElXTRUofMLRxQnibPOCbwlo7iXSO8kYn+zhuj5N6GnX
         5KVpGzVv0WBD0YWM3e4O+4CoEbSlZV5JRdnapMVrpymeW845pAiSHxwxefUXNwL+N1XN
         47jYmar+xUVrLoGA4RkSYfNwhk63sitrQpPB4nsK8kQwKJp39Adkbyo3URSmkxLQ92qG
         33Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784205728; x=1784810528;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UYlz6Mik5/sZA3dGlhiKFDmqJjZEM76yBtlXFsw/ze4=;
        b=gq8sSTE9LRv4PTqJFgAL/JqNr78Cn5Nesh+o7x4C5/K0v1t2sd6tU12t2LKi3l0VLP
         9Cb2bkrhDb8EUTI8tGakBt5fFPIWL4aJSziXO0dzthC45Wt9ZYLfg5d3PnbZ1+5TzMj8
         PP3+i2DuyVTk1h5eGxF7R63XpD5/O4AAahKjh+APRyjmNr7GFV2G7FAVfezvCWYYnt6q
         EShzoKEkNnKAf+YaZYZ5/aW1AIboCu3v0PolkC87t4SMbnJ6FdNmIu6JuXep4zi5snur
         oFdQqFavKc22Taq4yw+EGbaGEBywSMsXq2NEqTyYq1smQZEV6IKfND4nspXxYbbIq5Hr
         9zjg==
X-Forwarded-Encrypted: i=1; AHgh+RqLaxN+BufNBRP+JX6TRty0XnO3hqoSgGIBMFKnQe/vJxmTaZtJqbxSbTl6WywqX21YsZu9+IEDQUoD@vger.kernel.org
X-Gm-Message-State: AOJu0YysEN/Rc6Xvh+8DqgFNcBGcqMhVa7gIQfgXnB7I30NI9u+kRRdD
	WZShxHe6nExvD/EFGTP+t5E6o2K2PMCOUsl/Q1nFwVwSbgU4/9ZcWHNrTl8IZN/3jWkUBRB70is
	gnvFW4/KP/xH46XtcNr9svLkl2KjzcAoGPiJvfnfdd6rmrj4LfPwjy2h2OSs5Zdmu
X-Gm-Gg: AfdE7clyxcesfeeO0omqGF4AfGweGusRLhrnbchDfWhwgrnqBPuktHMkAVO3lTJSOV4
	P107l1JZGhTww3NAXzLc/BC7UlTkOTwf0buJhvIrqfQh14NxJU3L118xV3qAku56S0PPCANtgMk
	Uq6tV6bbAe4uLmeOQIzzvrhp83FV///0/u431wAvn/+XF0vj0WhypqZ750lIAgUaQEaBADmU5ph
	wqGfUp5sW9LeHROIsVG30lyL6SinhVTBD5n8f493EtSPYs6PP0R4OFh99eJythl3QaA49P/3EEP
	fq8nhPAHDviWa54WVg7hZWnsho27t59AWELV5r3n780uoeNVWak12VqDlPbzw0zjm9tu54b3aQu
	/ZgGMfy56gNAjm+CW4nsHFYqywSs7ZBvikw==
X-Received: by 2002:a05:6300:6698:b0:3c3:9df8:2eed with SMTP id adf61e73a8af0-3c39df84eb6mr364398637.31.1784205727733;
        Thu, 16 Jul 2026 05:42:07 -0700 (PDT)
X-Received: by 2002:a05:6300:6698:b0:3c3:9df8:2eed with SMTP id adf61e73a8af0-3c39df84eb6mr364351637.31.1784205727287;
        Thu, 16 Jul 2026 05:42:07 -0700 (PDT)
Received: from [192.168.1.9] ([106.222.231.43])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e6c10dcsm13466080eec.23.2026.07.16.05.41.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 05:42:06 -0700 (PDT)
Message-ID: <e0628cc0-b754-446c-9992-77561eb1e65a@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 18:11:57 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/4] dt-bindings: i2c: qcom,i2c-geni: Document
 multi-owner controller support
To: Bjorn Andersson <andersson@kernel.org>
Cc: viken.dadhaniya@oss.qualcomm.com, andi.shyti@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, vkoul@kernel.org,
        Frank.Li@kernel.org, konradybcio@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, linmq006@gmail.com,
        quic_jseerapu@quicinc.com, zhengxingda@iscas.ac.cn, kees@kernel.org,
        agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
        krzysztof.kozlowski@oss.qualcomm.com,
        bartosz.golaszewski@oss.qualcomm.com, bjorn.andersson@oss.qualcomm.com,
        konrad.dybcio@oss.qualcomm.com
References: <20260708051023.2872304-1-mukesh.savaliya@oss.qualcomm.com>
 <20260708051023.2872304-2-mukesh.savaliya@oss.qualcomm.com>
 <alhIzHVf8_RXNY4l@baldur>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <alhIzHVf8_RXNY4l@baldur>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: e96JqYYam3SB1FqZ2aEF1sPr0zRrTjFH
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDEzMCBTYWx0ZWRfX4d6aWAaOaVYS
 24laf0+pNT1QFou89+lXAYvOLecTANuwfgcqzkyZRyAPaXkyWiVnVg6Ak0G4VCc9+FomfY6B7Rf
 kXOB10vqhkni7myRHv0AUmmjww/0bjk=
X-Proofpoint-GUID: e96JqYYam3SB1FqZ2aEF1sPr0zRrTjFH
X-Authority-Analysis: v=2.4 cv=PN8/P/qC c=1 sm=1 tr=0 ts=6a58d1a0 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=OlrBKP18NtReKxGUJ9moaA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=gVzQGNjsJTxi2T7I5nMA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDEzMCBTYWx0ZWRfX2gdlFNgwPaJd
 b0nEJq4G1+Z1H4a/s7jqVlJtwhzweTtDNOsq2P+YRzIJb9dCNPwJXO60Vs4Rv6s+gYtu2IUREfi
 Xxqvw+wm78k8eRAAI2ntmZulZFryrY/iDO/QO9Co9978CDvLgD4TUHsDxHWvNPLFHnud2UT4pnj
 IrhPdFvBhFp3h4SXx4dxL5mGsGxcPLXjovVPgYWEkI6CEIyWVPMPZ4GCd0EB3pTYuXDSgVWSXMw
 cevVjtCw9zvIM4Eho139UhySQuP0dX+GZrmubSdbnCmQ+bKfwYV0TbZxTQYt3gzJ+KptbpJ5WSa
 fUl987dO7ChqrtVab713Buz6WWW0OHJbqJJmOOYnBQhpHPey8gOL4LjM4sspRYfKpZK6HFC+Sz6
 jzQmxVix7OFeIWpv0K/pJBx+/Fpbn5vHAD6HrUn/A4IZgR2UNx1gcJQJO2jznc7B8NozscaJ0Iz
 RBrXoUnIs/5Q50+V8xQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_04,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160130



On 7/16/2026 8:44 AM, Bjorn Andersson wrote:
[...]

>> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
>> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
>> @@ -60,6 +60,22 @@ properties:
>>     power-domains:
>>       maxItems: 1
>>   
>> +  qcom,qup-multi-owner:
>> +    type: boolean
>> +    description:
>> +      Indicates that the QUP-based controller is shared with one or more
>> +      other system processors and must not be assumed to have exclusive
>> +      ownership by the operating system.
>> +
>> +      The associated GPIOs must not be reconfigured into a sleep state
>> +      during runtime suspend, as doing so may disrupt transactions
>> +      initiated by another owner of the controller.
> 
> I think this should be made even clearer that this defined a requirement
> on the operating system. I also think that "sleep state" is a misnomer,
> it's not the sleep state as such that is the problem (what happens if I
> define a sleep state with functional settings, or what happens if I
> define an "idle" state?)
Agree, only mentioning of sleep state may misguide. Rather, will make it 
reverse, what you have pointed below.
> 
> One way to handle this would be to declare that only "default" state is
> allowed, when this property is specified.
> 
> If we still want this, I think it should be rephrased something like:
> 
> """
> When this option is present the Operating System must ignore any
> non-default pinctrl state configuration, as reconfiguring the associated
> pins might disrupt transactions initiated by another owner of the
> controller.
> """
> 
Thanks for clarity ! Will update in next patch. Let me finalize Patch 2 
with alignment to DMA.
> Regards,
> Bjorn
> 
>> +
>> +      Each owner is responsible for maintaining any resource votes
>> +      required for operation of the shared controller (for example clocks,
>> +      power domains, interconnect bandwidth, or other platform-specific
>> +      resources)
>> +
>>     reg:
>>       maxItems: 1
>>   
>> -- 
>> 2.43.0
>>

