Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4682E38BF62
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 06:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775544561; cv=none; b=bBkmQJUIa9mFkYpLxTjjtUVVNrvipY+uJQrAttcOtTvrRt1EENqLdAO5yaX6ZNr9Fe7cE+ZN6+MOqxFd7Regu2BXgNv91w8O0vvnDkT1pUCUqcWCRA1FnV37LDPQS0B/Ie9mcm+3ohGqCG904A9ji53uXOxeClkO4Pvum2qZG2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775544561; c=relaxed/simple;
	bh=ElB9Q6wjeKkH5o3t3M5qORJdH/927KhFCKLUC8zpLfE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AqMdtw2E/YkvLp1AdGnhUGTBvBcWUkbAiX+Tt5SNTmi0Pe4N0E6RBn87/VaOr8eKK470TC6FJVU8ixDVlXQqAkTPdUqTf2qxBENGiXWchoTiqQ9Gxe+28AccCTkbaaZUt2gCN9T7GUZErfPMVEZYojiH9RD2FWeBUq0KX2esLl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ihi1kN25; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PF4+rytI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ihi1kN25";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PF4+rytI"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637645qB2009327
	for <devicetree@vger.kernel.org>; Tue, 7 Apr 2026 06:49:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gTTq1wh4HXvCWB55XG0GY/u8L0iiLNeuQjUXCQfwBBs=; b=ihi1kN25R9yZbXx9
	Ne5xjUfbiLZxb7S/6U+mA9WwKVe2KS75q3ID2pFrBQRJdp55/OPo4UYtK3DfX7ke
	Lj+CRyuXGb+jaCxyODagBIigcOHAQxkh3NNLdzAbC7N/TVuYIyFEroke8B/m+pNn
	hqnYLOVe22nwoquBITPt0HoedbbVwZ6GWc/aztPKeE9XgDZO1hPmNQqliDg50DCb
	xo3OeLhlZQaO20/X1vCKN42GdBfp9Kf+ZDfnuLkfiB0scq2ocA6N+xSuFhK2fank
	xkda9SC/hS5sTUdEzqLOPK01DFx2gRCqdGFOy5pb3hkohOkMVDtAuYZ8+u8Nn1zR
	U4T47A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrrseda-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 06:49:19 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3586513febcso1261489a91.0
        for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 23:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775544558; x=1776149358; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gTTq1wh4HXvCWB55XG0GY/u8L0iiLNeuQjUXCQfwBBs=;
        b=PF4+rytIVzc6Tp/rIN5DaPOlDRVwrDfLSdd5A3Ir4cKj7XV6AJncQAUoaDBPTI5IPm
         HCAtD/o6uMmQ1aWoa7p+3LFBrsWNU5rtKxVD5aANJSb+dqUG34DDLTr7x7odEoTj11h9
         4Q4d6xb0/KG4pFyhc1OAdCNyjA6NIY/5GbiYyXT7cj3PHlEN+ZuxLUCALuoZkzMkEes3
         bfi7VnbDQntB7kxCKzDBzUGGqcpIsJGUyvE9IT1VDo6FF8+oxZW0yKZnBkzuXnOoM2Oz
         b1Uau9Xicf4gbOKV1u4qvRfBNnOfVKkgkKM9qb8JlciOBdQ1V78xSRLXtneTIeghwcyR
         4V6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775544558; x=1776149358;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gTTq1wh4HXvCWB55XG0GY/u8L0iiLNeuQjUXCQfwBBs=;
        b=FsXWlozF7UhO1gwwqWZQYRwAxs9wk2nb2l8VY9ULQEHKlCRKNZXZnzseHQBv/Ws3IM
         rPkIm3ubI74TmOX1zc8LpbMwZ3OxG7tKJz9BvLey5TkstPefdjEcCnGppRORg1vAH2tV
         fEYjsrrx3KT6yTbU8GXxKLHriZ7VlO+dAxL1K+BYYeb9Jj14AbHL4ghBnj6id7hBYSUH
         ariFxI+6uzvNZbqpdNWl6hdjYImxRccOT2iLYgjGHKvlRPPXQ8UyC6+x/G70ra4tpw39
         cgASsT3Yr8KGWjFpvGkFqFli1fdG74eTtxG+bQJDIguCvBSHl5cE3RKQ7oi7ZsYE8muw
         jTRw==
X-Forwarded-Encrypted: i=1; AJvYcCVXv3I3yCHSscXzAd65c0PI/Avo91Hk+1xkyRL4rRuM9NyTD9Ps4eDTVMUnJisJ/I4HAnvmOpXRflV8@vger.kernel.org
X-Gm-Message-State: AOJu0YzulDK/FVnWTkjRHujtCcm4E3BEXafI0VXXoCVMqxHjRWrMabRS
	jOLJfr3P2owL1dGkkhVWtMfoUHHPzxsZzdGnQx6ttdVMOZz8obCi/ELlJhGxM1MrZyWveuPQeYr
	JS04w8oiwLzi7CLLeeXExSRUKB9s2AkAPguAiEtrrt3m5ibdwRnE6E5DmvT9kPgjb8ojQNUTO
X-Gm-Gg: AeBDievoMMSqcHyOKUQCOK4A6ld31KuqZNzV4bqeGbe9Ub8OOD7mVUlJ3hFGpW3IFdc
	SK+8e/YaNq9MSmug83Rcez5SY11wZb4V+E0+xlpcDKdMhQGhT8OzY7vu1Ta+Zma8UoIZdeYvjmL
	S8cQUAhklRrY1TuWkI/XjfCjaCUT0uXZym/dLrOC1qOj0ghfN5YncMSF8PJ5tZ39tasz9XrQiQv
	EdJxGCe1Uwn7NRZwtD4YX1bT1vm+Cr3CLNXwfawzRsISLM7fisiM28daDzXllV0CrTEp+2XGYAN
	lYnxhKHG0nQKf67HTA6bETM+RG3Dzn8EmdBBYJRtDGMHNpozR5dPCnMN3WvAWXPTAvNBVeJibLn
	IQd8/FFSAKvd1HnsnnL3MVWhIY2wjwCpim7A+newbMabKdw==
X-Received: by 2002:a17:90b:2fc4:b0:35d:9d38:5375 with SMTP id 98e67ed59e1d1-35de6809efemr8591989a91.1.1775544558012;
        Mon, 06 Apr 2026 23:49:18 -0700 (PDT)
X-Received: by 2002:a17:90b:2fc4:b0:35d:9d38:5375 with SMTP id 98e67ed59e1d1-35de6809efemr8591964a91.1.1775544557452;
        Mon, 06 Apr 2026 23:49:17 -0700 (PDT)
Received: from [10.231.195.100] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe9709b8sm19867415a91.16.2026.04.06.23.49.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 23:49:16 -0700 (PDT)
Message-ID: <e4ddeada-1da4-4795-995c-ea4386918898@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 14:49:11 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] arm64: dts: qcom: kaanapali-mtp: Enable bluetooth and
 Wifi
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        20260224-knp-dts-misc-v6-0-79d20dab8a60@oss.qualcomm.com
References: <hyy65v74scdekci3kdowxdcujbmoeyx3vxv6dahvif6rzhloxi@rirggsitayqv>
 <ee38eaeb-d408-4228-b7a8-bc2d6e4ef056@oss.qualcomm.com>
 <c46islnlfzdawtw4o3holunf2a6rvfs7h5dznaggzptatdlqc6@7pjbwcqdtccl>
 <0279f334-95ed-4df8-9e42-749fd854c551@oss.qualcomm.com>
 <3xb6ya4zxhmaode3u3al5r4g3rfzlq2ifbyodvwtr3qgt34pwc@ia2xqfaeufd2>
 <ed5a18f8-04f9-4c4f-b4a8-9fc2a277ac40@oss.qualcomm.com>
 <ohg7jn4lozqw3lhwmhpx7qyiuw2pmjl7zwv6cbbjmbr2vnnw2e@qz6wbrjynbta>
 <bf1df5d9-787c-40e9-93db-536612982427@oss.qualcomm.com>
 <vxps2mbj572en5yjickrfdeebdjmk33olxdw6qd7vpfsye4x2d@xrgbjahhgdrz>
 <4a3887f7-9445-4d46-b250-5fb160c9795b@oss.qualcomm.com>
 <crlrsxrpzqad2oj7u7sjdtpdxnbdjjfw7kogughydgnlatw7m7@qpytwjgmrzke>
Content-Language: en-US
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
In-Reply-To: <crlrsxrpzqad2oj7u7sjdtpdxnbdjjfw7kogughydgnlatw7m7@qpytwjgmrzke>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA2MSBTYWx0ZWRfX/wQFK3jeD/1L
 rQMdrrQjKpCrN/XszybdrlbFFPH+PfkzXK1sgwUFcfzoAVUjywpz+s8bkZrY8aFwzFQzXrBEu/s
 6ldq7dm4ee21sMlW/AbRbmvRDXE1qjD9b3seTR8XZC5Rg9IgSEQ4EO6r+oQgihyT7ZyGfqwYJni
 zaLoUcsq0NkJVJsI9twp+aNZXmZpCa7EQnC7cXDhQkSmHfHfQfhbb8dEbnXsTAi+PPQq0Ahfl+9
 xt+P8RIzIiqgvsKiXdQsQJCdc8oq9hzbC8aAZJmjbMS/gtZ+jlEOn8UPnJtxdr15R/0o0um2PYb
 Q6pCivKvXVFSp6xfThdGbW9ciqzq9hrq+8winZG5FhV0VurkkwQWYQ+olM9DQ94fX9PIgfILfHt
 UgZOocXeF0wLNxUGyhdkhhouXLrt/0Q4j19PJwR+Cm9Oiylr/18NLCoHI3zHf6fyMiISXAJH8yH
 77Ne3rmaMnuTRneDMMw==
X-Proofpoint-GUID: RPiD5y5aePpZXwiBD5OAbo_bJOFqgcEy
X-Proofpoint-ORIG-GUID: RPiD5y5aePpZXwiBD5OAbo_bJOFqgcEy
X-Authority-Analysis: v=2.4 cv=LquiDHdc c=1 sm=1 tr=0 ts=69d4a8ef cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=JdHaf1hwYJhrKAK1CHEA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070061

On 4/1/2026 10:07 PM, Dmitry Baryshkov wrote:
>>>> 2) its driver does not parse and use the property 'swctrl-gpios', moreover, the
>>>>    property have no user within upstream DT tree.
>>> There is no "driver" in the "DT bindings"
>>>
>> 'its driver' i mean here is the driver which drives the device which is generated
>> by this DT node 'qcom,wcn7850-pmu'.
>> source code of the driver is drivers/power/sequencing/pwrseq-qcom-wcn.c
> DT describes the hardware. The driver behaviour is not that relevant
> here.

agree with your opinion which is right (^^)

> 
>>>> 3) the property is not mandatory based on binding spec.
>>> Which is expected, because on some platforms it might be not wired up
>>> and on the other platforms the pin to which it is wired to might be
>>> unknown (think about all the phones for which the community doesn't have
>>> schematics).
>>>
>> got your points and will explain mine at below 2) together.
>>
>>>> 4) upstream DT tree have had many such usages as mine which just set default pin
>>>>    configuration and not specify 'swctrl-gpios' explicitly.
>>> I don't understand this part.
>>>
>> For DT node 'qcom,wcn7850-pmu' of products identified by the following dts file at least:
>>
>> wcn7850-pmu {
>> 	compatible = "qcom,wcn7850-pmu";
>>
>>         pinctrl-names = "default";   // config SW_CTRL pin default settings, but
>>         pinctrl-0 = ....;            // this DT node does not specify property 'swctrl-gpios'.
>> 	....		
>> }
>>
>>
>> grep -l -r "qcom,wcn7850-pmu" arch/arm64/boot/dts/qcom/ | xargs grep -l -r "sw[_-]ctrl"
>> arch/arm64/boot/dts/qcom/sm8550-hdk.dts
>> arch/arm64/boot/dts/qcom/sm8650-qrd.dts
>> arch/arm64/boot/dts/qcom/sm8750-mtp.dts
>> arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
>> arch/arm64/boot/dts/qcom/sm8550-qrd.dts
>> arch/arm64/boot/dts/qcom/sm8650-hdk.dts
> So, let's fix them too.
> 
perhaps. also fix for kaanapali-mtp whose DT have gone into linux-next.
BTW, there may be other 'qcom,wcnxxxx-pmu' which have the same problem to fix besides
'qcom,wcn7850-pmu'.

>>>> 5) kaanapali-mtp is originally preinstalled with android OS which supports some
>>>>    qualcomm specific feature which have not been supported by up-stream kernel.
>>>>    so kaanapali-mtp H/W has some wired pins which is not used by up-stream 
>>>>    kernel sometimes
>>> Again, what does that have to do with the hardware description?
>> kaanapali-mtp hardware supports the feature pin SW_CTRL involved, but we can decide
>> not to enable the feature based on requirements.
>>
>> any advise about how to correct DTS to not enable the feature SW_CTRL involved ?
> You can enable or disable something in the driver. It doesn't change the
> way the chip is wired (that's what DT describes).

got it. thank you. (^^)


