Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4D13AB294
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 09:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774863416; cv=none; b=NTR6MwpM8Vodc7j5Lm7ZNeKDIJqO0Opu2qjR+KejstkvfKVW3vXxBqxEQH9MQNp5oXOYG5jV/Iz/HsAtvZ2zru3SNYs7TQPmfHIf4e66q94aGtzFuDfzpG+/IX42O7qIaQ15NSelVK/nv3fNzDRf6dKI72YjWJeKuxXOTT9h+C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774863416; c=relaxed/simple;
	bh=ow+j/FbhJNpyJ4jd32OsvrK0BH4YUa2nELDDf6A2lz0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jquNeLGRKiuNI9z7aIuhVj9SPHz4Mcebpj1JLcNtPVbHIwzczGYmUl7Fc9Um1KCRoNJX1B+c50FSnEVCPj7GL1QEtaHFbRjjiWL/d6bdWrH1livP29L5ZHrK5eVQoLjlqkuRvhLB+JAqQ9j0gWaAE1cK1D3mz7M3MfLyPFP5qTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GpSMTQL0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ip7Kmp5i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GpSMTQL0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ip7Kmp5i"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U4r7Tm583059
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 09:36:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y829VMWcjmy2e+KlsWr0uhjRtCYBw0ZDjtDzMWwnIiE=; b=GpSMTQL0MDvPBO1w
	Qo0d8XFfBeVfuOcVtzpwHNSz/Np6+C2puYTJNBy+u5/iSoppkEx8AMwgsrT5nUjF
	ZJvRfgw0fsBkZRDBsNmajUvjpnaWYEkEBZMh13YNnv8/39NLdSYS+V2PT17fjU5X
	MacRQRfcPXbbT+RQSp5oaVwjagF8Ps4nEG2VlN7gsxnh44g2ikrtlSP+8jOvM9IK
	ABI6Drhu5NfRINiPiPmYS4XCS8IWPhQ2w+c1p9KDMD1xV6XAP70Ipj7HTJYJoWS9
	nL5hvTD2SOebM/XTXrxYj8qtgl9encn2YPpchgWANayA66drgVbediT6CLIjuDjU
	c/cg1A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d65xqnned-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 09:36:54 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35d9dceda3aso445102a91.1
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 02:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774863414; x=1775468214; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y829VMWcjmy2e+KlsWr0uhjRtCYBw0ZDjtDzMWwnIiE=;
        b=Ip7Kmp5iHHOUNF+CNEQHpcDNN5+C5Z+uJiU0qmA7Th2NnRoCVjRU5mciRYHK3zArP8
         kVPnmrf9gyUfSLW/h4BaajOTFDNLIs5T8OqgsB+SUpXmu0fH0ClbKCF7lY9AF2KkiX9X
         rRBwJ86hMe40EuWOGh7CPMiM2Etgn95oqzO2Ixso/+IJw00SO79noDBXKmq2fU0p8BBN
         qUR+u+cuepoWXboED/qshXXDEvXEHTZZEJlSmoz4dTbzp8DLRQC4E88tnETa0i6pkoQ+
         AcyC/zIXlpKLilE7uBZcvs4Te9VN4/Fftufds1YnTVnq+jB389WBkrWa0SShK9ZSOo3b
         QqmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774863414; x=1775468214;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y829VMWcjmy2e+KlsWr0uhjRtCYBw0ZDjtDzMWwnIiE=;
        b=pjyIPh3/L/Ca5OYpBCRs9Z1kzoFK0oU59rIqK9N/iRutfI1i3ZeQloRrbp2RUc1/sK
         jDbmV+Gi7xKHV2fXEiP+OK7cqutB3oMvQw9nSD9ioh5QIMiF8dzWiWqOXE1zOTwT8/Vv
         9FVFmhu2tiWOnpZL/RA7LzIQmcz9HuvjBNl1T0aXwSi52yGXyLng516sQdQudWFf7oPf
         5ZFSCAJMvZIyMyl0VMRX2F5LEYtHZc/sCaEIFIA1uc9Lf3FmDw1atJNbDXRA5Ms3AOxk
         86o0sPK1pDRPD5mYl23cMZ62JtoyhqnLC8Q/zU6rskgHRQ+BITNXShntVmVrlhbm8X3y
         S9nA==
X-Forwarded-Encrypted: i=1; AJvYcCUE+OwpTnXSR8gR8rJZpibC6fbaTA+9EWJvMhCrfPyt0s6zVI7C6m+VoZRICSeTzfFPZFjVD0Uz0sKJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy52/zr25FvWq4uHpCJqUM7bnjM2MNxeJYhAhq8fI4QKdrLWKkJ
	vceZ6aYxbnSseKFqYIJ/HwEfHhNGZXFJiyK2RJ16zxlQswoIx4eyB0nBTV9ocXTFIQyw0eIP+wu
	YrrOVAulcebhMXVDgECleKLJU3duyAz/7wQVCM3Wse3bLhxkl8MPCMA2fdDSehtrh
X-Gm-Gg: ATEYQzyh2Bbqi8yxal/VNgyWM0JdfWBcCVcoZi9giPtDHE3FDQj5/+ghbD/2PmeEm15
	+N2nokcylN1RyeF7Z/RMB8cbMkoZMkUwbCdiqcju+Tv+cLEkvxNGlSIdlvEeLWe8F/VN01vFQO7
	Bi6bW4NGw//aICGsgNuemxE9//vPJ8HeWbq4pLkUr0QTPMShB3D4QAazrctsHlWbofzFqNxipOT
	5Z+Y7BHfoaVUQiqErqiMAnkrjK3fEbLOFmqdD19W8vMhBJi3crMSFy/nKPEX2uTnHfhLLGwut15
	M+0ga2hTGI6mc9uXWC6N+XrNJd8Hwti1XnRvV4Fn58cNUy4bgzxAqiRWrQc1M7829CeIWNM0hHK
	TIRTkhInd24RBRPJXg0NhO8qgy+u7Ta3UfNUM0wcqcPVa73Va/Q==
X-Received: by 2002:a17:90a:b396:b0:35d:92e4:c0aa with SMTP id 98e67ed59e1d1-35d92e4dc2dmr3259275a91.6.1774863413925;
        Mon, 30 Mar 2026 02:36:53 -0700 (PDT)
X-Received: by 2002:a17:90a:b396:b0:35d:92e4:c0aa with SMTP id 98e67ed59e1d1-35d92e4dc2dmr3259262a91.6.1774863413472;
        Mon, 30 Mar 2026 02:36:53 -0700 (PDT)
Received: from [10.218.41.33] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c2ec27da0sm3709913a91.8.2026.03.30.02.36.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 02:36:52 -0700 (PDT)
Message-ID: <a39ca7b7-b277-4518-ad45-1f42506b615e@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 15:06:48 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom: Add monaco-evk-ac-sku support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260328-monaco-evk-ac-sku-v1-0-79d166fa5571@oss.qualcomm.com>
 <20260328-monaco-evk-ac-sku-v1-1-79d166fa5571@oss.qualcomm.com>
 <20260329-accelerated-pigeon-of-joy-c6c903@quoll>
 <f7e63fa7-2579-4dce-974a-8c81a1aee00f@oss.qualcomm.com>
 <7f5bfeb8-7d91-419b-981d-1f0f568f01d2@kernel.org>
Content-Language: en-US
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
In-Reply-To: <7f5bfeb8-7d91-419b-981d-1f0f568f01d2@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: xlYbNF654Y94kPSIcyhjZnRctAkzYNQw
X-Proofpoint-GUID: xlYbNF654Y94kPSIcyhjZnRctAkzYNQw
X-Authority-Analysis: v=2.4 cv=evLSD4pX c=1 sm=1 tr=0 ts=69ca4436 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=TMvvwhOKWeLxbQ7R-5UA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA3NSBTYWx0ZWRfX1ykqmGMoabBg
 V0gcPS193fMkmFltG2gGBqb6IHcogm5z1LO1xjKpYecK539WK0uItAFSXhjFh3cfgJvz/g/6gBm
 HNXYqBuJItX5R5AhBPYb6kQyB9/FwofQ8D5ty1LrERKWyY97O3x5TrL89pd0K87IG9Nm8Id5MB9
 gwNfysByWhQI8u3Q0Ldu7GIFhpv7pNUnM9nuIE9Y9jiRhY+e6VMV3XzdbzD54XiQeymsDAYKVnx
 DkjWOdEqpcTRzgP7Z1acQJh5twnV8QwAvIvU9Z1+fzQiJ0x3Xta6J8Zc33HRbCySH0GVXV1EyYF
 n86wxZUdjGGkau3A9t209w1OKYzXwWg0d5tE8r2uRGBs8mbfgbbT52fAE4Riy/snIw+Ak5hMZ1X
 TKqCHi8AlN1Wu+B/BZR8xRLOHLVFSXxZteaZ6CajAsPS3g/0gT1Fns3CoCzc/IH6SVqGjBHj7/Z
 1qVtgpNNBtG7o4IgELg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300075

Hello Krzysztof,

On 3/30/2026 12:24 PM, Krzysztof Kozlowski wrote:
> On 30/03/2026 08:50, Umang Chheda wrote:
>> Hello Krzysztof,
>>
>> On 3/29/2026 3:22 PM, Krzysztof Kozlowski wrote:
>>> On Sat, Mar 28, 2026 at 05:11:17PM +0530, Umang Chheda wrote:
>>>> Introduce new bindings for the monaco-evk-ac-sku,
>>>> an IoT board based on the QCS8300-AC variant SoC.
>>> Please wrap commit message according to Linux coding style / submission
>>> process (neither too early nor over the limit):
>>> https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597
>>
>>
>> Ack
>>
>>>
>>>> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
>>>> ---
>>>>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>>>>  1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
>>>> index ca880c105f3b..07053cc2ac1c 100644
>>>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>>>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>>>> @@ -918,6 +918,7 @@ properties:
>>>>            - enum:
>>>>                - arduino,monza
>>>>                - qcom,monaco-evk
>>>> +              - qcom,monaco-evk-ac-sku
>>> Why adding name 'sku' to the compatible? What's the meaning here?
>>
>>
>> Monaco SoC has 2 variants  - monaco-aa and monaco-ac -- "monaco-evk" board uses monaco-aa variant of SoC and this new
> 
> so ac? or ac-sku? Decide.
> 
>> introduced board uses the monaco-ac variant SoC. Hence added the compatible as "monaco-evk-ac-sku" to differentiate it from
>> monaco-evk board.
> 
> Wrap your emails.

Ack
> 
> "ac" differentiates. Why do you need to say that a variant is a
> "-variant"?
> 

The intent for using "-sku" here was to match the existing upstream
practice where boards that are otherwise identical but differ in H/W
configuration (SoC variant, storage etc) are represented as separate SKUs.

For Example:
  - sc7180-trogdor-*-sku.dtsi
  - sc7280-herobrine-*-sku.dtsi
  - mt8183-kukui-jacuzzi-*-sku.dts

Hence to follow the above convention and practice - Added "-sku" in the end.

Please let me know your preference ? if it is okay dropping "-sku" - I
will re-spin v2 with suggested changes.


> Best regards,
> Krzysztof

Thanks,
Umang

