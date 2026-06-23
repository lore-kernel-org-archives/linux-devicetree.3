Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B5936AB7B
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 10:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782209711; cv=none; b=Vk1cow9wW0KEryx+XvbXqNZGBg8IjnHJwrPUer/0WEKhNKX3BTJEBOz/3z9Lzbd59uJCnsUNpwQbdFLVWFbp6cqJ/7tCkwiGNIz5GcxpZjeCc8dzEL0ETtFmcusIdtRn4GRE9hSCc/oa9aROwNVhcotsxex/aTNI7ih3wgzwKi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782209711; c=relaxed/simple;
	bh=HRjTJvpI7OkyQuWdlZOrCZFlet+k8nzSkJL0BGd/LMQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V4xphdsIGgmvs+D+nsN6/TNGzLIzARoEyif5ceqP+r5fF2inD/MY2AozcMKSZSpyd1PLrkMzh7Q55W/0viedatjm6c3MJD8pYOSsix4eGtxzUKfrgoQhGyHLLBKOaFthTkxFTvPkeVqobWPH0UzKoiesQ43CV4mywFshbP4QFuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HfcyVXX/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iBzIl1lY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HfcyVXX/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iBzIl1lY"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N9KVFm3919007
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 10:15:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zGTaa7c1vAQuKuwagzAaMmJzNETAmkixjUoY7bUjtvs=; b=HfcyVXX/oVYqot9I
	aihKXfOxY4NvBUE9xKbzrCXS8a8WbpF3L80rrQbUp4Q4YWvD8fV0reUu6GPua/Cn
	sRW7MEAY4u9pdgy8j26SnXBHPPlkEGtKpVH7FiY40HOaXSbdEZ+z1+KV/64ctY8G
	J57dTC/F74zfNu0uBRQs3hpLKJQuXGMMwjHJASMVFd79gwPM5IiKbrhT9j9bZilb
	sNqbQzER2kH6fkQoquUpJZ4ZQEYQ4Hnmrb8QJsJtA+ojPqK8uTnqoW4d/mhT9BrO
	D+sdTpefBWtWAnLLTky4yc5dxYNNaBk28QT4ZCPlE5+ZURXaJ5JHGWCAOhJlzCoO
	5sxQ7A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyqe6897e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 10:15:08 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c2c98c1be2so46337355ad.0
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 03:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782209708; x=1782814508; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zGTaa7c1vAQuKuwagzAaMmJzNETAmkixjUoY7bUjtvs=;
        b=iBzIl1lYC3iBGsn1bntQLqStFy8+eZX1nu2sYf3PzmJDEFp/qIP5NQLnopmIKyucdS
         K4phK6hTeF2GxhovR6/wMSE8QcUrgzHF2/7hRwnp09FN4kuiVHwt0Fx33VAQsLr0zIC+
         JZddtigA1oLPuHXUZD1/ylv/8GwT1reTjrPspsR9XWQeh3wQOtunVHPKcy36KB09lALz
         PCCW4iAcp9V0LbH9jHSlcyuxzBdSrS8kjiGPseMnSKtAvt0po7uL8LhLFeenMpDIVS5v
         XxEYujqRaDScKRJEw8jL7ZPjtMprf93KA3iCg4aKPlqm1a2uwVgZc2G1sHOuQFinnLbs
         NDJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782209708; x=1782814508;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zGTaa7c1vAQuKuwagzAaMmJzNETAmkixjUoY7bUjtvs=;
        b=jgQhMVjSUFg64WexM757GeWTxuq1IgegdPUc6JytybNCW9wsmtItC4ZEQ3WyglXo0K
         DO1rUQqSC9XumADGkcjmZ9eVKAcgHM0iSjqT7oNmFp02op3LTdFf8V2llog3+m+Aj7Yc
         CS/AP8OU+1RI3U+KhMsjL00v7z0rmHzLv1dc3gXUQOf/9TDhAA9dfu96WRfpTe5JK7TC
         a0zolUifI/+BMr56GV6qaTyf+co0B2T13iQLaq4TSYequjAzcXFzMEInHZYLWM7HNXh1
         hZDcCpCPs1ZPPXg2vdAYEAyypFH+0twxZU751AUV4/l6+1amuZTYVCmv9+BH0EesKTtw
         9Sgw==
X-Forwarded-Encrypted: i=1; AHgh+Rq7OEdHOkCKJcVc1VDKbdHCV8k/7hru1+JVmYApq1WF3wlLFqJv1UlujfzjlmtUmx++AN887zDmfRbT@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi1WRZ0RSOy1QJZL3UXj+24k+ECh36r8DveDDqTEwCkIRxHw5C
	3jO3adesKVD3P9J2PY0FfIOsYSBy/TuDzfbwPX80iTk7WLhNVmpTHjFYSE+8a0DegrGLKO2KPnY
	D3cjc7vaVe+DBI21/PBBKitjJupmaJNVHG6qPKFCutHRdHMKZ90E3N0o87MwUHBF/
X-Gm-Gg: AfdE7cnqFsi9gl9Bo/6wz+tnRYqfkPfyR3QY4nJHzs8jhbfP9l4XzzRyamrfZHNzbZ/
	gOjoItT4wkFJXpMsouFgyFDUWLa1L8vboGLV5iD8nebFNFLmgMzYd53H6/CsRJUE+O8Up5FTige
	eoBjRQxjMZbLTrBtWJ6T1N5rSiAVlNPl9tPjHj06kZNfweZ+jVn7K8EzRwutEHnBGFvWQiJxahj
	/KoyWq7lanfJcEnzwbUR2ckZ5lEuddDwIBW7gDlQI8ithG04Oel7H0CwC9Qks237VMZTICn1iTh
	Z93XfckAsHjbBAceKbmEi9129i+1hxiNlwxkPVr9hH/hkM6FrS+v1+bvpK9XIYsKCXccwoap8zG
	cFIZG63xdNGWlZI2U/05MyNY0PLe6Ac6UyFwhMqE=
X-Received: by 2002:a17:903:41c3:b0:2c6:bb55:4078 with SMTP id d9443c01a7336-2c718c88c55mr199553125ad.8.1782209707771;
        Tue, 23 Jun 2026 03:15:07 -0700 (PDT)
X-Received: by 2002:a17:903:41c3:b0:2c6:bb55:4078 with SMTP id d9443c01a7336-2c718c88c55mr199552735ad.8.1782209707315;
        Tue, 23 Jun 2026 03:15:07 -0700 (PDT)
Received: from [10.92.171.15] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7436f5ff5sm107134765ad.29.2026.06.23.03.15.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 03:15:06 -0700 (PDT)
Message-ID: <0a911743-b372-427d-b188-3521c6ccab63@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 15:44:58 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: thermal: Add Qualcomm MBG thermal
 monitor support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
References: <20260601-spmi-mbg-driver-v1-0-b4892b55a17f@oss.qualcomm.com>
 <20260601-spmi-mbg-driver-v1-1-b4892b55a17f@oss.qualcomm.com>
 <20260608-sweet-powerful-ibis-8b2adb@quoll>
 <4d643a18-a044-4350-b7f9-2c61f50cb792@oss.qualcomm.com>
 <97a16bfa-2315-47f7-ac5e-b130e7fdcf26@kernel.org>
Content-Language: en-US
From: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
In-Reply-To: <97a16bfa-2315-47f7-ac5e-b130e7fdcf26@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: GWsggHzAFTvotiRBMhQiSF0H7z2YOzJ2
X-Proofpoint-ORIG-GUID: GWsggHzAFTvotiRBMhQiSF0H7z2YOzJ2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA4MyBTYWx0ZWRfXzxSuu3LM2M6H
 7mxV7gZkcg91m2xm2AfDM8WHqZQh/5GCnVZxCx4Vwyp7VeEKJEda69qnpakGmaHTQ4NEcEw5BRi
 WCvYVl8VDvaSjH+x88zNZ86brvc9mXg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA4MyBTYWx0ZWRfXxDnDcY8vPzo3
 /AbIFaKe23YGNUt1ezQHm6GnIZ4fDSstF8Sy32iu8f15RpJDCqMYUhwwf0NmrfBrPbTAjF6nfcB
 U4dHuGO73PezGAOEyMLfkMxsRBmpfUIvOJ3G4bkiZ3OOawyg1pJixtJosJYTjnqaULC2Mm8sl+M
 WsMJ3+KQYo9SdeEDCwlN6vegdRx62KB+u3pI4nnpUgNWtj+4Je6F+SDUSYMyko1eG7t51cgwyYY
 7fDgI5E6IMiGry3nITHPyhww1FPesgq9WOBw7cpFcDLB6Kv2IGT//MDU4yhBCvywBYAtfgzSiN9
 rh7SiUaXRBXiWzgbAsJPF2aSq+VT27234FJ5re2/ZEniS6czMvXSSsyQJpZ5HH0yziNIqbXXS4q
 xXjunqkFvUtr5hIoxzyDKbxLdTo+Dg==
X-Authority-Analysis: v=2.4 cv=OeKoyBTY c=1 sm=1 tr=0 ts=6a3a5cac cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=cM1uwEMTts-In_BrvGwA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606230083



On 6/19/2026 6:36 PM, Krzysztof Kozlowski wrote:
> On 19/06/2026 08:44, Sachin Gupta wrote:
>>>> index 000000000000..a0ecc9f35cf6
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/thermal/qcom-spmi-mbg-tm.yaml
>>>
>>> Filename must match compatible.
>>>
>>
>> Thanks for the review. I can rename this to match the compatible naming,
>> but wanted your preference on scope:
>>
>> Should I use a generic naming scheme (qcom,spmi-mbg-tm.yaml with
>> matching compatible), or make it PMIC-specific (qcom,pm8775-mbg-tm.yaml).
> 
> The second one, please.
> 
> 
> 
> Best regards,
> Krzysztof

Sure, will update in next patch-series.

Thanks,
Sachin
