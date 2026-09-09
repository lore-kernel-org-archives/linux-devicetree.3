Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEFD13CEBBB
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 09:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788945837; cv=none; b=VveMRYUhe3gj7VGoTufpgEaQ14DkENvqhyM60pNiOWIAIb3xwQRqXRR6Zw4Wg+OW2IhYaeXciNvy/DG7lz3fGxC8PK+ccuC1KyAcVXx6TNbANPrxDEa7XG4zriJELpXXDipkzZiyD4Vlvrxh1fdgVoFqaV36RPCrSbqdmVZ3jVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788945837; c=relaxed/simple;
	bh=MefwGGus+1Q/IuGojqThe9twVN1fqV7QINFZMvuhCDQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f2MJ081QAUDcSQ1b0wGzTRENfH80VsTl9jUbp8o/kVUxFZYxgI3Ro7RkBleVpIJbqoSIrTFmz0JlmdbAPU2aJYYBdTcVsrPSozBB1tyAAKmGAAjeJBMwNaRtvd10t9DPPpyI+EMNTfAtKBRALnLcUpVuApQ+dQxpW/nfsmVK1JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SIHsBrc2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VPyXt7tr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SIHsBrc2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VPyXt7tr"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6896PWuv337750
	for <devicetree@vger.kernel.org>; Wed, 9 Sep 2026 09:23:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gWyEGgxT4E7X9KltLLkSGf6POqbL5iNCiSRb74gc82E=; b=SIHsBrc2LY11MYJc
	HPBKaHwKbKAo0/VmYro9lMRr+FAcUXpfbqdCs0I8WbVsbJ9ZP6FfkrErJWYo9Wkb
	mnqRjQHECn8g93u+5+qBxcpoPCjd4qGRjfu1JOW4egFMf3dVJzMuBIxTbVXyt+M6
	51yQjK3FDdWomqcM0C+5xpjRRAGATTvaEG7sPCnuxG+GAi3329KCp5yDhFVBedI6
	B6OzyqNaK0D+zw5g+scUSTWyMzkNQ65P3t9fxVoFt7UMVsZw0/aJPzq7yQI8yqNb
	4wU0HF9OUM2YSNJ9DdPbY57WjZ/AnUy/jRuqNOeqr9fwzpCRLyF/gsBvOjmaaQBr
	Zh0scg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjqe7k68u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 09:23:55 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-938fd633df7so73436885a.1
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 02:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788945835; x=1789550635; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gWyEGgxT4E7X9KltLLkSGf6POqbL5iNCiSRb74gc82E=;
        b=VPyXt7trWgrW1E695mc/hcGJCwKOHKmaWuZTDoi9A2lg5VgjPCheWX3KW2+adRq/5p
         uBR8ykBuTyh0f4X5rSp1ZUQLs8qt74pe22PfmKhOoi4jgTOkN3436eZSvGiTSIBQeaxG
         ++e4eDpadSSG6ukZ/P2hF8NW6+y+tCnDlETiC28gU7rZV/go9/iHjsTXapxj8R4NXDHo
         UXowQxrGL1Uj0mKnrptfLOz27ANdDkDIVx7I0IXqob7CXyordY10sSMFx9BzJI4aMOPx
         qkt/jaORfpQ7XdjL10JzcFvXPjJaVOAxjqL1tcQ5EBY7fr6xhAh0AiwtnROdLtY0z2Lp
         oVwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788945835; x=1789550635;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gWyEGgxT4E7X9KltLLkSGf6POqbL5iNCiSRb74gc82E=;
        b=iKbIPLXhy+T+MBVuK8ML1HJVcM4q1He5UsEfY3739F4qd07olIjDEKj43+z2Ae9pvM
         GgjIqThkq62KFRRbqWBhiVuYBrFnjWflztyfsTmJ6YEr4yxk+u9X+o2QpFUVZXpEYsj1
         8iPUTorvR0iMF56wxLuIY9QhLaMRLR/dftNv7zzav6gOY8DYcTWtSS2VK2JvqtJlSCCZ
         bt5ynr7LS5t6qZziCmkuVSTNIYwyADkCAT+YvlO/zXUujZSkpDeRBTaao7mL013mfXOF
         4rQGgZcUj5I1HrsR2nSeYKqmIZlbpjug+sA6dRkoHxPs633/MV5h5D1uYGdnZbUMnrj6
         qexw==
X-Forwarded-Encrypted: i=1; AKwUvBwVqutLEVjda0eoiaqk9LFDLlGAlOr5fgwiWu5Oenla7Fsr7JUQ6W6KIF6Qj4lQyhRdX7XjNvQJKq1V@vger.kernel.org
X-Gm-Message-State: AFuF++lNHkAY6d+rqnfDJHCVhTl2yladeBfKbcgTQ2mhJ9onBthZFXRA
	8dOBLRPoXKflJWbMCFPn/F854VBUIf3EHyzaMMmgI7i76IpYT0FIYhqe5X/nezyyTAtopPmJPYj
	YiWiOFLuh27zuJsXomD9Tt5DEJJzVKgXC26avbi9TTAmRN0USOzqBo3C1w5HYmlEm
X-Gm-Gg: AYBFou1cZEy4UXUu37+6UzxPYU9JxhwYmxdgNp4W59u+xYnouRhDLKdCFCPA4ELAJ8I
	KE6IRjKC3xoy9DLZD5JEwau/nSqkXYuU6Fa+upiDkWUXQDblqo+46cT+zvSz2mPBn662Vi4eWoU
	1DLAGBB0nU+OAxNjUstoamSOGXSzka2OT8py+XjT/G/00t+miruH/ue9zSQlPFdWyz+UbrAdrlH
	S9xTk918aFur1BS8X4WwLs8iVEeffms6c69uuzfqNjrr8XhjNOv2SFncZq6NV7MkpDq+bpAryxV
	TvIx4/Dt7wRqnvSHRYtQ4iIjLBfFP0dc8lW80NSJiYf6eMAG2ODDLbYD5N8WmqkaisOtK7aiN0O
	Wcg9g3P0kkvPGfVvWZDzQbg==
X-Received: by 2002:a05:620a:2913:b0:939:5924:e319 with SMTP id af79cd13be357-939914ccf18mr2213615085a.0.1788945829821;
        Wed, 09 Sep 2026 02:23:49 -0700 (PDT)
X-Received: by 2002:a05:620a:2913:b0:939:5924:e319 with SMTP id af79cd13be357-939914ccf18mr2213612185a.0.1788945829338;
        Wed, 09 Sep 2026 02:23:49 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e68c42c2sm6520490a12.14.2026.09.09.02.23.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 02:23:48 -0700 (PDT)
Message-ID: <387b1aa6-f168-4fb8-95d1-895f74805767@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 11:23:46 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sdm845-sony-tama: Add battery
 properties
To: Shujath Mohd <shujath@outlook.in>, Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
References: <PUZPR01MB51418AF84C1FC5F640144D57C3B22@PUZPR01MB5141.apcprd01.prod.exchangelabs.com>
 <5enkadptjkxm5mmjjwtqehm4futxejzwewevoewlpeedjhszbb@dsfsfewasuiu>
 <TYZPR01MB513102932A34B982696E2AD2C3B12@TYZPR01MB5131.apcprd01.prod.exchangelabs.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <TYZPR01MB513102932A34B982696E2AD2C3B12@TYZPR01MB5131.apcprd01.prod.exchangelabs.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEwNCBTYWx0ZWRfX//hCT1n2tkGK
 2OJmVoq2MKifizDqk7qVO1SmhcqxuOpvYdU5riZDL0Lb/VjzzkTGmk8WkjAokE22Vpf6wu466EI
 wufsQx2ieCu94fgzF9Vm7HvNamV6eWM=
X-Proofpoint-ORIG-GUID: UFgicZrihnOvbf_b2-keJsyEL9XwadOf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEwNCBTYWx0ZWRfX2Q7G+464x655
 tll1PCVWEVPR6hsLirRptmV1iqkGwTOGCy0Tk6AC8IIQkGhASYHzJk4xDndrwO2+Dlltw2V5YGF
 5CKpV3GVMpcuLAXOXirKLmbJAIP5o7i/BD6UxvFmVJ+JZHIHCk5UgDzetnIATRzFTVdrjSSqfWa
 rFOmRnBPZ1sYo5nzpfEyJVGmA+VpzErbwihCxm3whM+sXqG7f/5mkqbHKPb+PuTqRK5zw5gcTFL
 6EeN3Nlv0jYMGQg5JiW24hfJEx0AHlCnFVrUPT/ZX270JAyGeldPL82djX38RCKix251Y83riZD
 Kvbiw3NVwzZES/HTkMPOKPUogf9YoV9UoezGaL3nV61NTjY4eaXCgpMCIobxSHz7gpPwRIRTHn4
 zcdym4lVXb++k0xvbd90WWu/GBhyA/kzRX10MeF1ZhyAvWyEDXbK9VCLPMRgsEeZDmABuBa4Il7
 g9suFH2qwW9Bot4n3yg==
X-Authority-Analysis: v=2.4 cv=Xey5Co55 c=1 sm=1 tr=0 ts=6aa125ab cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=WY477xrWUYgG2yMJyFQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: UFgicZrihnOvbf_b2-keJsyEL9XwadOf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090104

On 9/8/26 9:56 AM, Shujath Mohd wrote:
> Just the commit message, nothing in files
> 
> On 8 September 2026 12:49:24 pm IST, Abel Vesa <abel.vesa@oss.qualcomm.com> wrote:
>> On 26-09-07 21:33:08, Shujath Mohd wrote:
>>> Add simple-battery nodes describing the design capacity and voltage
>>> limits of the Xperia TAMA batteries.
>>>
>>> The Xperia XZ2, XZ2 Compact, and XZ3 use 3.4 V as the drained
>>> battery voltage and 4.245 V as the fully charged voltage.
>>>
>>> Signed-off-by: Shujath Mohd <shujath@outlook.in>
>>
>> So what changed since v1 ?


For context, everyone is expected to provide a brief changelog between
revisions

There's a pretty in-depth piece of documentation regarding all the
(well, probably "most") such expectations:

https://docs.kernel.org/process/submitting-patches.html

And the b4 tool was created to take care of most of the annoying ones:

https://b4.docs.kernel.org/en/latest/ 

which everyone (contributors and maintainers alike) is encouraged to use

Konrad
