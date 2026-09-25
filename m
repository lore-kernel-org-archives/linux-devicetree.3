Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4A24C33CB
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 15:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790349094; cv=none; b=QbjkaDA34ikQWBUcsrHaNgyMYPuN9rtbGhFP/0z4Era2nr3ZsFYdPtBNMZSJRMhLmmw+c0b0QDSrphwcWuN5kpPMFmKsqm2qcyoV5knIstMcUXLFGKXzqD5Z8vnVz+eSiGTIxOLKe+ovHc1uQI6o3j6skE2Zh8BGoxBjlKum7wU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790349094; c=relaxed/simple;
	bh=U9e2cTWg4RU+oVRUNia0elOPmEX6VJ2HYr4MJMEV9RM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qk3/tQiB9V1/SHgY6DXfuIC3uFcQUi5u2dmKyMcnc7X/esTyfehcMMWW/4q+K2qCeZ53RTgArX7UkXa7Tu1DeZnxq14Cs1ksft7Yx5Ky+E+xYbUCPHvfnEnP99wS8rECLGNzxFi1BJOKVPfNlBn1ScVkXIZOGhmrJgYvmcWirXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JZibYLSx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BXTTw+Rf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JZibYLSx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BXTTw+Rf"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PDvTPa1194765
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 15:11:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NGVgNcQx8oJT/2gbfw0v3WXm6aB9A/KYFngS34SqQHE=; b=JZibYLSx2Ma1Hcyi
	NqkgDZv/fQDRcOeaA+bXcSAEgvMntHxFvoBGZaNzNkqhxXbnZ+kyJU7E3z7I49cJ
	xNSqaHFTins42aNaVp6/4WgxxxzQnM1P03ct+pIwVSdXAUTW0zUF/BsCCmo3UhX6
	y3q2yEXFsGT0L57wdyZejr2i7+sFClPO14kbLbJFYerGVu+jAi6gLozi8dZFtZrt
	c+4sxEAMZNNmsR+sJPxBDWcrr8nvc1O9/YofKhqK8IJ1gtoWTgKqCnFBXLCU9JIl
	pnIzfrp9A+ALYg6foKOFT8RzsYAQXraDtFpxTd9pNSBuxtgC8V5ow6EeD9M3IUZt
	dNBiSA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw874kytv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 15:11:19 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-78a5a291af3so931550137.0
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 08:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790349079; x=1790953879; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NGVgNcQx8oJT/2gbfw0v3WXm6aB9A/KYFngS34SqQHE=;
        b=BXTTw+RfliwbXwNpcbYJv95Ok36KrsITzbfmqJ4co9Z9Rv0YwgPrKbQQ44geZdYf0h
         IfAwLuhjj9b6rDSFi336xAL0BjnG3bkTj6aot2273fHrVTWScV7DJzuwQGgPPRHjHH9V
         QMYqOzi9TLpSNQYpOwYvIv9jcI3MWV3Sns1fc3vMScz15wRUIKYIbKY0JdVvAsuKjZQ0
         E8lPfcoAhoX6mQL8OADIjF8xpZg5SlGWGyEmE2V3yDMzA/9be83FNURbPTxOxYwngEZY
         2N95gyk4bKDb9XCSxBvfGA9GOQXt8YLPcquMqSD3UQeW8gufc6o1jXNSZJ3KK5EG7nEL
         juhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790349079; x=1790953879;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NGVgNcQx8oJT/2gbfw0v3WXm6aB9A/KYFngS34SqQHE=;
        b=L4k8FmoWOpqCB0byQgzqWFgrdrjAVQZjKVrt6Ko02zGOkQVJHyCNq6XXiCXUYcetrN
         ANb/UHxQAJSP6t+tm/H3CuIZfNMML7aapIEIQe7KoM2YEAV59yn4j6yArC0GKtBO5XEr
         Qg7Y7wDAP8aa/3RnQpHygfqo3b4qa/5qLXS1sQO0YVEbAZjOg2rJ7+17X0wp+LUjf/14
         T1l/J6Hv7df6t5hx6cPBzgoc+5fMnL2vAVXK+QKSbxfTwegs5j2R+GIdPrNMyv8pjREQ
         /4WWKZfM2RzlTOzlLU6nG6qPMSutkbK2hTxCmB/8F6qsdk/ydXFijbpUEkorCQ9+R3pu
         OHmg==
X-Forwarded-Encrypted: i=1; AKwUvBzxibkRd39ZrnT7Jzci6eWnybOHV68UOqx6Lwm0Db7ya929zw7dFjzSFKbnkkZalUWA8Eefy6N4NzYx@vger.kernel.org
X-Gm-Message-State: AFuF++nAH2rvRLqGgl3QSiG7HRscssttXwvN5SPa2idnyVfROwZ82yJC
	1PIBbUe4sTaTd5GbNUXnbFopurtNWEew2vcTElG7qABgzDEqkiuxbfJKOqQTXpKtMZ+gBJzo62+
	d+XgMqpQCOUKVpGH6YDxbiKPyuDOxoOoDHN3ScQw2zzS2GwtoB+FJ2GP+2GW66o0UymjwwN9e
X-Gm-Gg: AYBFou2pxLYElEFZpSOel/FNFF+0rnTzH1gdFFz/N2m8FI5wQ3ttrKuMFBJVGr+7Xy7
	KlpyhYAD32Ceud1npGU4kiPPJmNZ3lB4RNU5+PhLrK6WFcpn4lb2G7T7qYeDoqjeKKDh7NMm6g/
	eP28GvcjrOaI60NFdPJeIobpe2kqtAVMp/fBUx1LwHta4HjHgm+gTxSH5a8chvX2YTTVmAdRN7+
	OXyG0c79/u7sto3nuq+/shBYr9UD2UgjTs1kA1N3dQ3Sfy7MtPBGml/Afd7h7GPgC9Ad1PKVMws
	kBXhaRi43F6CavnBX30LEbFm2BwXtJ7QuO/hT7cIaiVYJXFn1vbHEipyvFtRv4W3mHbzVzUmwwG
	e77WFoieVn0e8WnFKM7EjXdctAw==
X-Received: by 2002:a05:6102:41a9:b0:7ae:c2ca:8dd with SMTP id ada2fe7eead31-7af1e6ef68fmr2998426137.18.1790349078762;
        Fri, 25 Sep 2026 08:11:18 -0700 (PDT)
X-Received: by 2002:a05:6102:41a9:b0:7ae:c2ca:8dd with SMTP id ada2fe7eead31-7af1e6ef68fmr2998410137.18.1790349078240;
        Fri, 25 Sep 2026 08:11:18 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49ff27eabc1sm69594075e9.15.2026.09.25.08.11.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 08:11:16 -0700 (PDT)
Message-ID: <512dc68e-d1cf-4d69-a8f7-52eee01e1dcc@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 16:11:15 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/8] ASoC: SDCA: export PM helpers keyed on
 sdca_class_drv
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
References: <20260918131914.681588-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260918131914.681588-3-srinivas.kandagatla@oss.qualcomm.com>
 <20260918134942.555421F000FF@smtp.kernel.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260918134942.555421F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8sureShVN4ijg7megGw5AEFdJElcTJ6H
X-Authority-Analysis: v=2.4 cv=MI71C8Zl c=1 sm=1 tr=0 ts=6ab68f17 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=b3LgcfY4BDCpY9HWiaoA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MCBTYWx0ZWRfXwzUCmjA0BpsB
 AwxqVCeBYBMENGOFnsAZWmeUhvFrx1Qu7Hps5Ps920ap5bIXokcoknnTGa/YNqsIz9WlS8b7k2a
 ubtDxeeJeCPjpGQ6BR8x1RXsLVYrgxxCZp/ds07MUxNb2Z4rht7Pw2VRHPX3HCsOwSvTVmZ4I67
 a+rh9MpKV1cvVpvvXE+Rbwdb1YNCtDn/LY3hjLn2+E6Uaftz3/jmv1ytqEXIpiIQHJ4JDnA8J6M
 0tXtzQddtngPsMLkwTqv+eiS5VOhSD9BD1iAnFOOPG5DWooU104T0/VRO25P6pFgTkvuR3Xi9V2
 j1/XzLUZc4AuahLYrbiw95i0UvkXzbWQ7X1Je7DdwPJg/yTpWLSPeca+P4Tj0FcVRBpwbbmHKC7
 FkjIRj0BmpxW0ulKPbj1j4aoey9hrrKKdX6CzU2z61eV+E5dLZcYKvQ6FPOWI0U/pOtx/6Rqy3u
 qOpzeISwHegpY4pZeFA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MCBTYWx0ZWRfXwT87HBHW7wJn
 IgghWpmPBtbz4lBT2jZuZgwLlWoTn7Y8baYMbqs7Rlsfr2dta3FLqsnh6AS0zxAGf9+XpqhitOm
 ZMkp86Tl0w7Rcey1MLvenOv15PmGzeE=
X-Proofpoint-GUID: 8sureShVN4ijg7megGw5AEFdJElcTJ6H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 spamscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250060

On 9/18/26 2:49 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] sdca_class: code and commit message mismatch for pm_ops export

This is fixed in v5.

--srini
> --
> 
> commit 43543cd6fb0171b62979b93506768ae9a2b2e709
> Author: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> 
> ASoC: SDCA: export PM helpers keyed on sdca_class_drv
> 
> The class PM callbacks pull sdca_class_drv out of drvdata, so the
> built-in class_sdw_driver owns the drvdata slot. This blocks codec
> drivers that want to embed sdca_class_drv in their own private struct.
> Split the four callbacks into exported helpers that take a
> struct sdca_class_drv * directly.
> 
>>     For the built-in class_sdw_driver, add small dev_pm_ops wrappers that
>>     fetch drv from drvdata, wire them into sdca_class_pm_ops, and export
>>     the ops so any generic SDCA slave can pick them up as-is.
> 
>> diff --git a/sound/soc/sdca/sdca_class.c b/sound/soc/sdca/sdca_class.c
>> index d7444f442c71c..a092ebaa620aa 100644
>> --- a/sound/soc/sdca/sdca_class.c
>> +++ b/sound/soc/sdca/sdca_class.c
> [ ... ]
>> @@ -265,10 +283,37 @@ static int class_runtime_resume(struct device *dev)
> [ ... ]
>> -static const struct dev_pm_ops class_pm_ops = {
>> -	SYSTEM_SLEEP_PM_OPS(class_suspend, class_resume)
>> -	RUNTIME_PM_OPS(class_runtime_suspend, class_runtime_resume, NULL)
>> +static const struct dev_pm_ops sdca_class_pm_ops = {
>> +	SYSTEM_SLEEP_PM_OPS(class_pm_system_suspend, class_pm_system_resume)
>> +	RUNTIME_PM_OPS(class_pm_runtime_suspend, class_pm_runtime_resume, NULL)
>>  };
> 
> [Severity: Medium]
> The commit message states that sdca_class_pm_ops is exported so generic
> SDCA slaves can pick it up as-is, but it is defined statically here without
> an export macro.
> 
> Will developers attempting to write a generic SDCA slave in another file
> encounter build or linkage errors when trying to reference sdca_class_pm_ops?
> 
> Should this struct be exported to match the commit message description?
> 

