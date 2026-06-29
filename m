Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439642DB7BB
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 05:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782710597; cv=none; b=Xd0eQqgstC7KtGugHkNgkx1/gJZvnCvKpTB8h75+713v24DEABiIJ+638GiQh4+6dzv06eCrfk8GRYfTnpxLAumt86GjTTDV+AGp0KEcWHr1J01KNbfYqXvNqfwmJ5mq6vE8/h3Ali2M6wgZDqJyA//3DIqYHUXv+8f+OqZv2t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782710597; c=relaxed/simple;
	bh=ZxqfMVDg3FWeOpe+56ZRiDWXBu8hxTAQ+YpZ4xQsA5o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nKPBCi/XMlJuXebJ9GP1QlE1Vf3V3SgRQvX1q9Rc4aq88tkp/nYq8vI6IeumshmvVB7FuY/Uxo6Egjr0fKK+f5qDI2jNFBJkS3BitBqUK8QwsfbGU/7f8yTZ0zKp7STJBtGwDqk63ZlsevNZ9kSpB2orh9v4qjAqyhAO2ZtO7Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nKv15rIA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YTMLp6i0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nKv15rIA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YTMLp6i0"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T4NI421737524
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 05:23:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cu36DmfqEkFszFBjI/w/JiRPAOrfBwPdCWBBCaxyZ1A=; b=nKv15rIAd8eiPma+
	Z2C/yaUcZrVUsUBqftISqyK2WzWM/2uOaBt+BwSqrcbnfKik5mu19W3hOg5FG0bP
	WqVhG6pW1gGYsTDGz0FRm7K+hbiI5DF8Y2LoZpEtm5dDFjcKg7wGJJH46BHsDtjT
	wm7ihNakcGvFD2KqzDIj4sgl/iwWEyU8U8nuNmpnwTswGPBLcnexub+YeijjhtyB
	JGC3DTDVHu/Yi3LOYycYmwl7TD2WAvletgksW/qZRgz+0AllpoUDog8pgQ1OHcDK
	tWNDEwOItWXh5iBZ1Fne2QSBKxWKY7pdl+MlmrDkBCyy2VKPz77ghguGVkYd4kgB
	rZiebw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f279cmggk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 05:23:15 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38001e788d6so549035a91.3
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 22:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782710595; x=1783315395; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cu36DmfqEkFszFBjI/w/JiRPAOrfBwPdCWBBCaxyZ1A=;
        b=YTMLp6i0PCgkQNKdTr2gOLQZ+6vPO7Z+Kl7Y4U0I6DuVKfUANF219kl0lNkjxF2Kvr
         EUahkqFToJZQQ8+V+yErmxAFnR82v3EslU7/TyVI6EOvMUnxG5eU6kzB1JE3K37ReUei
         gGAjaZucruHupdpDScXK3yxPdV5pX5berCgVAHgZ2TlV2ihxTGWiefQmP/JgJrUY0jNu
         tVlDf28wLu9ZAPvWGXW+3tNYuVXHSvfWyHiaEnerIDO3wbMFcIESjHoh2xuAJ6OZrwqs
         Tl/gGpH9EovJxRIbgvX0QQNG9/K9/4CcEulP0CDGDfX8Kbn1kXfiAWcx+O6KJ2T5Q8Yx
         Dubw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782710595; x=1783315395;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cu36DmfqEkFszFBjI/w/JiRPAOrfBwPdCWBBCaxyZ1A=;
        b=eM6Gk+Nx5fxS9KckWKOUx4m2KKVtQqchcfAppMO2C/Ee2YorllRE60THKSNstHtNKV
         6AouVzlZdCsz/tx8RsyX2OaNVicqdvqBmtfF3lZitExSRLYWrIe8Qu5wuuIpHWRr++mj
         ipU4aUcjN82yqSGuUnOUNbkE5Xy3Pl5/SR6VXvyCnXts6/s/6Rnrf45CPz+o+LtGieHQ
         2oEnLCazXQqVmksU1bJS5A2GUXMe9M2q944q4qaJ81imVzKMutALXVcM946/trmW4aFI
         IviT8SfwtxmF7iydRL4rUGDdObzHnnaDd5UibFn/R3HGteiveb7svfX+zEu6FFI9HaNt
         2zHA==
X-Forwarded-Encrypted: i=1; AHgh+RrBVmvqYWM/nDGp763P8O+io4zMVYHWFJ/s8yAOr7L/Qs1TAGe9TevK25sqIEF9tqFn7HCxUcjSx5v6@vger.kernel.org
X-Gm-Message-State: AOJu0Yxdtr0ZVCuucDNefC9yocgtsG7OvECmLvekJOMYJlE0v5ZEwNrM
	dqQwh6mny0hMpdx9dUYBJ0GEqaecl8npZG04FNlTRSUXI7VtY4OWN3qc23zon+0uzb9TOZRKsRs
	rGo1K5dSeuBXA9rgCbpoE6hI9QmFP7sUhvusfBdhCYPbowYBI7/S+fbxEMYnQVxer
X-Gm-Gg: AfdE7ck1rZ7Rz4velcsj/SZJCe4BgFO6B4Cewx1hNB7YP9H5Qn4T/dXtxjAtHuslCFx
	HZmXlQRBTPO5wNKUz6wwiQI8TeuAAx/fskgk/ca0cN2YOs5PNz8/LDf26BzUGZQuZr06FUfRYhj
	stz47HtjiXpAFynqkpkHjB7JSlJLw2PijIdU0qyIJR2DOdIdNjeH44Eon+qYXYQvmqIsHKkgiVi
	svVyoIA6te35JhjVE/ZCCcoEnBYQFOmlZlJYE5VUN5Ly7BK8c570PZj5xxMUHElmw71Y2DXh7Mi
	Kv1fFq6fo/CE+i4WuUmzzIL76qzIu9HheEYuHcHWcOVMX862TSAfEX/GfuTgW4DK8hgyYX6jfHK
	0uwsIOJqwpR7cgvItx/rb/ctrGgFNd7beDobWMyiwgx0jpjqt5Q==
X-Received: by 2002:a17:903:4b03:b0:2c9:deec:f564 with SMTP id d9443c01a7336-2c9deed0010mr38516745ad.13.1782710594618;
        Sun, 28 Jun 2026 22:23:14 -0700 (PDT)
X-Received: by 2002:a17:903:4b03:b0:2c9:deec:f564 with SMTP id d9443c01a7336-2c9deed0010mr38516445ad.13.1782710593804;
        Sun, 28 Jun 2026 22:23:13 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c9cd6916e3sm29479155ad.40.2026.06.28.22.23.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 22:23:13 -0700 (PDT)
Message-ID: <1aa30528-6cec-41cd-9289-a3979c989740@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 10:53:08 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/8] arm64: dts: qcom: shikra: Add gpr node
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pratyush Meduri <mpratyus@qti.qualcomm.com>
References: <20260616201315.2565115-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260616201315.2565115-4-mohammad.rafi.shaik@oss.qualcomm.com>
 <7ce8356f-ec09-41e2-a57d-60d20a08e850@kernel.org>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <7ce8356f-ec09-41e2-a57d-60d20a08e850@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=evzvCIpX c=1 sm=1 tr=0 ts=6a420143 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=P-IC7800AAAA:8 a=KLxTuU9TmGYBU-aeN2AA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA0NCBTYWx0ZWRfX2VrmyZIYq34c
 PrWopORmm9zSyJ8OG7OoNWR0su463d+JMLEhRUVvisP7+P9ESkWqt2K9MIGs1ahfPG022nunppZ
 wJHhFUdGKj7r3rLS+F0/y1Q5PITH1Gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA0NCBTYWx0ZWRfXzRUImqauAmIa
 w7I0LevpcDctEF+J44i2O/2oRIeOdA/ByuU/07qLZJWMKmxfrVdh4jQlEFBDKdPDO7QMs/FkwBQ
 qYEA73pozzdViVfq5J1grAipQ7fSKzpvQMlMkqC97Zrqn6i8/NkRNMkFG9J6uFm9GEBIBY7ZLMX
 HOYys0HQHLY1UpZlI6DYb0PntfRLACPs5reZJSHaY6SCH8Yh+ZuSGGG4fsTcb+gFbieYPbivv8l
 bkDrK2ROPlxd82FrAF1SIwUuovJXAb5E0nUWQ/Tnn7txQ1THtRTWCmKAPZ9KzQAZZdkmHci2sCN
 GbCBolouuFfF/FVknR6fgEhuRbfsviA0+JD0k3bJkb06EzGAU4n2qCssmKeXfbOkGPNqmM5SgW2
 By9IrJXEFzzK+JcdtofFW3HoWRtL/slsmDgZ79LeAgio9dfaYIxVRrjLMyJX0l/KijWcLaYUluT
 r0G3manZjUIB5jjU2lw==
X-Proofpoint-GUID: z_bigPkajQs-Ln4-mgjIGJzvFZMr_vGr
X-Proofpoint-ORIG-GUID: z_bigPkajQs-Ln4-mgjIGJzvFZMr_vGr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0
 malwarescore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290044



On 6/22/2026 7:14 PM, Krzysztof Kozlowski wrote:
> On 16/06/2026 22:13, Mohammad Rafi Shaik wrote:
>> Add GPR(Generic Pack router) node along with
> 
> Missing spaces before (.
> 
>> APM(Audio Process Manager) and PRM(Proxy resource
>> Manager) audio services.
> 
> 
> Please wrap commit message according to Linux coding style / submission
> process (neither too early nor over the limit):
> https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597
> 

Thanks, I’ll fix the spacing and update the commit message to follow 
Linux coding style and wrapping guidelines.

> 
>> @@ -1851,6 +1854,42 @@ glink-edge {
>>   				mboxes = <&apcs_glb 12>;
>>   				qcom,remote-pid = <1>;
>>   				label = "mpss";
>> +
>> +				gpr: gpr {
>> +					compatible = "qcom,gpr";
>> +					qcom,glink-channels = "modem_apps";
>> +					qcom,domain = <GPR_DOMAIN_ID_MODEM>;
>> +					qcom,intents = <200 20>;
>> +					#address-cells = <1>;
>> +					#size-cells = <0>;
>> +
>> +					q6apm: service@1 {
>> +						compatible = "qcom,q6apm";
>> +						reg = <GPR_APM_MODULE_IID>;
>> +						#sound-dai-cells = <0>;
>> +
>> +						q6apmbedai: bedais {
>> +							compatible = "qcom,q6apm-lpass-dais";
>> +							#sound-dai-cells = <1>;
>> +						};
>> +
>> +						q6apmdai: dais {
>> +							compatible = "qcom,q6apm-dais";
>> +							qcom,vmid = <QCOM_SCM_VMID_LPASS
>> +								     QCOM_SCM_VMID_MSS_MSA>;
> 
> I don't understand what is happening here.
> 

Apologies for the confusion. I will update the commit description in the 
next revision to clearly explain the use of vmid,

> Other patch made a change like:
> 
> -qcom,vmid = <QCOM_SCM_VMID_MSS_MSA>;
> 
> But even here you do not have it.
> 
> I don't understand what is happening here, but for now it looks that
> this patchset is incorrect and incomplete.
> 

I will also incorporate that change directly into this patchset to avoid 
confusion caused by multiple parallel threads, and ensure everything is 
consistent and complete here.

Thanks & Regards,
Rafi.

>> +						};
>> +					};
>> +
> 
> 
> Best regards,
> Krzysztof

