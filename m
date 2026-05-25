Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE0933F588
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 10:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779703871; cv=none; b=RDR1dV/gWQlzcI1ncXvgeavF+qeqiVp9p4bq+iCZixREB78dl8iIFCxTX3Fu3wGcKJeobRt2CWADbyk2Nc7AuM7DBklBXRW/UenZRO7X6QT9YJQ3ekw+f2T6ICmOIpGH1vYJLiDIsI1VXzIff02BN+zPsc02Z7WflT5QK/oE0js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779703871; c=relaxed/simple;
	bh=P4dVGRQKkBEtwZP6u8xE1RJh7CgRpjAHqyFfY2ChCs0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E8/VH91ET/YAF2S0vSUCkHnWM0fMyLwZj2ZDrxCYnjJOUk4qRzaWA+4GsYlCrYyOxXVXyooIEI2LtmJ2ldkvsY3Bc9N+6HLDetH9lLoU/D3VpPdUyIawFZtQKcC6i78RuOpGcNSHBXYy9Kr4MkzyG+q/63X/LdIpg0ZDSinlhJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LU5i+Xov; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hc8fIviN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LU5i+Xov";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hc8fIviN"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P9M1oE3580685
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 10:11:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hnosm6bAr5zKw9j0Wc5bgbJCD/lHL0CU/unVt2stucs=; b=LU5i+XovFgsqSmH3
	1KUOlfdqXm1KDBoDg7ibn+JiZGZnI65NG+JSmGb5YCVGFNPyIYKuHdJ2xrzp3zBC
	n+h55i13YmqZ+rPvfEeJTk24KShDJlH2bLMRl5G9VWBD27klD0BhFOF+aGp5GcP0
	oerNi2XPKV8TjN7U+3eVnzxr2YiapXa3O8QyM7XLuMbYphv3mxcmYYjYBm0q33u7
	FAB5MNzr0FbBZIElOygNT86OwofJaahD22FXOPcZMjCLUox3Q/4rdLxMxoEmzSil
	xO4eA3YabKBkJSeyvK4T/pwLYL9+7vAy3gicPkrrXH4vIPM6JOzydgeK6UFDSfeP
	xYUJ6w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb3txp77p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 10:11:09 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-368b68a33adso13693475a91.1
        for <devicetree@vger.kernel.org>; Mon, 25 May 2026 03:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779703868; x=1780308668; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hnosm6bAr5zKw9j0Wc5bgbJCD/lHL0CU/unVt2stucs=;
        b=Hc8fIviN8TjMC8JTU+ZpFrbR7XkNXw/RevcFdTAmXwIPRGO83zSa5AgMUo7BaE9tbG
         nstbqYrNQN1C69xvJC+KuICrSVIW8qfNOTU4/0oTM5jWwowoW7uM0j2AdK4OitIZQVya
         1VwQDgVFCE42SuidVZJWqKhzJmf/a+QFvrvXmsa/R+SoKo00cWCT62+GeuGpS1i2TZsz
         39eaQCsenEmVIKjkJZaH88sXR0nkZOhZDaOcisnYH7mErr0IUAEYs8WQDvkAjHg8haQJ
         1PigpF3NO4rB4pQ5k4/NxQmLrdHD5uDu/tWLnR0ygHS8n3ngUi4hbfyEEaGdrLtf3ho+
         vrdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779703868; x=1780308668;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hnosm6bAr5zKw9j0Wc5bgbJCD/lHL0CU/unVt2stucs=;
        b=VIcN429bQOoUemG8QqQ5+JlbNaJTc1fsus9wUyQIbfJphWMo6TMGoZ5gtUvgXVvPtw
         1+U+OUYpZVjoI5a2kOlgSVhlNCpsZ0XdgnUSHPelnZeUGoBsKy9LlBqSzcbiVGSVHWW5
         TyBEfEbLtQ68y/8FlyG10g68brzCal8bOOD+yWNEIF+iRcJhAbnKLjYN1kkgXqM2J1dv
         631FtMxZXzQOeXvcbmxQsmZjvPGpUEUdKdaEmo0ChbYGA+Qfl+QTlUaXFwO8sO8Pv+68
         rol+87Cp36jsKD9mb/03T79CixxQ/yJb3DAxLKBNkYvLSkEQoaa9Hro/CZ7GksmTeCol
         G53A==
X-Forwarded-Encrypted: i=1; AFNElJ/E+2qnRUwkYsayKR61+7UUCJD69u7r6HCMq6h0h9yNfFxND0jahBf9ro+RArHmXz+EJLN+jCUSmEYm@vger.kernel.org
X-Gm-Message-State: AOJu0YwOyfd95gbYc5JGnuSUjaFplpHxDoXpDj1N9DNQu7fImPpBjgCP
	60XPNK4vwNQJ319bAfSs6CdaccOUqdIYgJ7hC+ZxayOn0S91WpqCweuNZSuqizWXCIp9yBNE+N5
	LxnzUhoPcfZlnRlyk7+voI9jKHXRZjTl2PzYXN3G9fllkGOM/B8MMfOPRfyyOsoGHKPNJkpXh
X-Gm-Gg: Acq92OGhx8DbiWcm04gGFr/A1Dbn7Kjx2lydtW5dyx12ElIq8BNaW667xJjODvdPazq
	kvj8lapNDYOFhW6y0Ho5/hivXHmsO1C/aB0pJdqgPx99EzG16oGLi3a/2oyvHF/AddmeY8DJ8Le
	6uVbP+P2WrGgcfhRfhNLpsLjIzOZQExqqZODmEBAiPud0Q4cnipSeWsmpWFnb10L64ysuTS8tRb
	CMqHxsGIx/k9PmoYWw0mS3XUazLPoLE/1U8VCDIDFIH/qaNF2JBwmElQLvEaHQGoLOq8N2voCgD
	6CtIrCeGYPP/E+frwldxNyu2SscCZvxO3c94/5vUTqMtSo73LwXbxbtYAtzpyvSPHOMgNn/d5VH
	02MTMFxMBK4aMDEeMq2zPmlE5B6eb2HmN8Tpe1fD1zpgIl8Ho
X-Received: by 2002:a17:90b:4986:b0:36a:f623:83a4 with SMTP id 98e67ed59e1d1-36af6238686mr538519a91.26.1779703868237;
        Mon, 25 May 2026 03:11:08 -0700 (PDT)
X-Received: by 2002:a17:90b:4986:b0:36a:f623:83a4 with SMTP id 98e67ed59e1d1-36af6238686mr538480a91.26.1779703867725;
        Mon, 25 May 2026 03:11:07 -0700 (PDT)
Received: from [10.218.46.60] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a72c913a1sm8638003a91.15.2026.05.25.03.11.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 03:11:07 -0700 (PDT)
Message-ID: <c60f75b1-c2d3-49cb-b8f1-549391c815ca@oss.qualcomm.com>
Date: Mon, 25 May 2026 15:41:02 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: kaanapali: Enable cpufreq cooling
 devices
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260415-cpufreq_kaanapali-v1-1-1fa94105d5c2@oss.qualcomm.com>
 <020442d5-5697-476b-a96a-6e96ce054363@oss.qualcomm.com>
 <95a01fa6-52d6-4e44-bc8b-69743b2b48fa@oss.qualcomm.com>
Content-Language: en-US
From: "Dipa Ramesh Mantre (Temp)" <dipa.mantre@oss.qualcomm.com>
In-Reply-To: <95a01fa6-52d6-4e44-bc8b-69743b2b48fa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDEwMyBTYWx0ZWRfX7F6ukfkgi6VA
 kcvOqkMqwQZDCwdPIrVqTnRNAfy8ozt1a3+DYtd37TVHLjBXk09UlZ6hn3dQv2jrNWBm+TZ5GL1
 4h8qS0odkt/a1WCjOZ8HNdpcm1DR0gg5yCdkpyjsT0CzjpVYJITxS08/8Kd9sPt4pFU6PyfISKd
 Qwm7fY8eNyEQMCbS0t9Y1Vr25m00qMSked6DYVEF8yjlB9RKqpO5oSPkpVw9kVoc8KSfQW3kE0T
 tbQhT0qJeOZ1LhVbee+FL1s9uHrf7nfhZOM96oZqfNwG51G5WaGoOZuHQ1hk5YaLzQvCR3wsTxc
 KYexJxhNk3Rvi2uqM4GVHVf/sIVRbYgnxM8wjTcn99GPx6aH2rkg0dSNTcLMtp9bYxNVFlCMQhB
 MpPP6C1/sjE4Brtvegut2PEYDsL7e4ZigrC5r/HsA9nEI9iRHILaljxIX6rCujQexatDoYQW1Yl
 nirdGB14IfVJL3ZUWMA==
X-Proofpoint-GUID: J83dtO29R8rJcpSn6KDS2Kza8Atcx8G9
X-Proofpoint-ORIG-GUID: J83dtO29R8rJcpSn6KDS2Kza8Atcx8G9
X-Authority-Analysis: v=2.4 cv=MetcfZ/f c=1 sm=1 tr=0 ts=6a14203d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=G4GDIulgaXVMZWVEnn0A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1011 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250103



On 4/16/2026 10:44 AM, Gaurav Kohli wrote:
> 
> 
> On 4/15/2026 4:31 PM, Konrad Dybcio wrote:
>> On 4/15/26 12:57 PM, Dipa Mantre via B4 Relay wrote:
>>> From: Dipa Mantre <dipa.mantre@oss.qualcomm.com>
>>>
>>> Add cooling-cells property to the CPU nodes to support cpufreq
>>> cooling devices.
>>>
>>> Signed-off-by: Dipa Mantre <dipa.mantre@oss.qualcomm.com>
>>> ---
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Konrad
>>
> 
> thanks for this change:
> Reviewed-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>

Thanks for review, gentle reminder to pick this patch.

-- 
Thanks & Regards
Dipa Mantre

