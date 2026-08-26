Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711D0343D7F
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 11:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787743763; cv=none; b=skLkCBQjjUcfQ33TzMjcSKBlXIxzgIZtjs53IDbjusQHWq5QgV4vyGhltpeLAWqwqF0HJqVul+RM9vCewoTodGE3EFngCaPoMJKULNXUOT2/ieudiRN5iScmB0AfFxCUu9DI2Wb1vgTPvKGrqw1jeFJ16Jr2epXnRw48RaIS5yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787743763; c=relaxed/simple;
	bh=9igVRMmS4kNT0dlkUrlkf7C+0xdEBeIUo0HRGNka23k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ezIRZxIytjsff6BXZrsGryQdQGrWx8hE70Jt4x8MtdPr1qAOGsQ1Y99WRxL/36yTG0C10zzZGlGr+b0a+d2dRx4XrzpyYwSnLlmdVzuvIQGuRy9OOetD8pj4jE67snS5gG4lY9016MfcVGgjOju3thIozGBPNjfcsUo0RmYWcwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ez7DJcss; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kxSWWGn9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ez7DJcss";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kxSWWGn9"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAGppm107571
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 11:29:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jiEFFiswgRxMj5BE8ZbhHboskz8MQgocxFXWXunFW1w=; b=ez7DJcss/qGstvmR
	KC8gMwfhxU99K0JiHODXnTeonRy+IC5p48YQtPe/91Zc8ezKNLtY5gcHwqkk1x48
	W31UO3dhS7ju51/4AOttjjm++NwloIIa9mzSgAib+VDpDtemquo7LLPO5wN9eWGm
	z0Ggs3haSxbXEjV+TKLlrRdKpRHMn8bphKVnH5K+xXTh0bmARYM+dldE+fQ80YZz
	A0tj7sLq1o1LDl77FTcBAra606sJgb+omSJcljVeQunAWFAnP74Ug8WcNi/eSRqi
	r2pfgJp9a4Elo2yqsUb6QMPt5/p03dCsfRX8I1mP9clB6/lzg2NG+ZqX0o9A22Vt
	1Ha/GQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9s9g9k16-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 11:29:21 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cce14a21faso12166935ad.0
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 04:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787743760; x=1788348560; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jiEFFiswgRxMj5BE8ZbhHboskz8MQgocxFXWXunFW1w=;
        b=kxSWWGn9DhvxJfKBPoSOc+D+IlXXl8qxLZGmxrrmzmVo12TQrbik8lhl522W9z2ckx
         DBUUdPH1n20KJvxDU4cGyoKNlYYDtVVOHSJ7vGhM2GL5sTHTPY9PSrq1FYngTwG8WgOi
         Ac4p4pz4IA2wt03migEWYy/mTtqiHU9NZhfHcyJ8TFydV1kC5923qrjxkOPBIKUlhLtu
         lRmbLZKYjAu45h9KpOErbB4EG0WXYRZgMRyUVmFb+fxJF1Eyu/EZjuPOkQ4WEjZee9Lm
         5yHz6g8zFbetSoBwygnxBbXtNhR5UA32OmKOTKFCSxbN/vUGsBPzyXyPoifWwHbc/jiq
         efsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787743760; x=1788348560;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jiEFFiswgRxMj5BE8ZbhHboskz8MQgocxFXWXunFW1w=;
        b=BMt+BzYcmCViQJ4AFr0+ycD/3fzkJIj9+RHCuOAyjtyx1AskTCc/6uVkTIXJ3/kSvo
         CVXlE6zjG1/3Klq3qefp05uRWmM2312Y7aStIkPNACPoPxX9NjHQYRPa3Z9479jg9HFZ
         4+7hTOo8w24rlW9B+Rq+ZEbbb43oySjJTc+62vhx8OrhdnTyto4As3Mztq2NO6WfXtnt
         BPfSd6bvQJfw1ifSbiKUiCUQUyu+RRfY9eoOSpYtCIPYU3IOWlrQoNb1z1XLwnj1ugol
         ji5Pl9pNTFugPp5jVNOrw6qz3XOxh2qBaCNMfSWCe3I8ivBnCCmKECH5Qi5HO5x+vimb
         jeVw==
X-Forwarded-Encrypted: i=1; AHgh+RpYg9V5mUaFTVX30mm0D9H1ND4OxmMxNzPnuT82JNS5VLxzS9h/j+3pNqZqgow9TKHvvKGVKfhEdqe6@vger.kernel.org
X-Gm-Message-State: AFuF++mZsjNL1G4YqxpxirRHUDzIsARcCbYMRONfr1CYzV09qj00gaDU
	ta1l6gVCGC2zSfWOnhgyPphZzut6SpUHdM30C1zGWhcQSi9fsOjtk11mB8RYIXA3CGjQLq40tqF
	zR6CF0I+KcMHPj3fmic78dhekV2IdDyrW/vB1eifxPTKjFvoItmRMoWZwaPfnix4k
X-Gm-Gg: AR+sD137OnN7StZIQH8x5nnvuBJq6Yp0Jc5eJSN6PDy7XQaIXlWoQgCFEHuWpHz98vV
	QN8kIEBwJrzEpiVIZk92LJ1nyR+P/p4iwXotrWANL4x3SueTDhzs+hgHtxDQ+gVnTtM6JcZyw7W
	mo44dzr4WXd1luHLup2dyDc9dbs7/ogA68s7FaG/X/bI4a0Jp5tsnnuModYpx8vX5QrASPsfC63
	XHMf+rsBD2wZrBnPbtZFUkrXFQBqsjaDcT8gnw8THRGV2tiTIYB4/e2rgulIipPfigbcWhdQDy8
	yeognSaMuq6v7cCQPU/Njc5I0QL7pmhYD+sgMtUZAR32ZwufxYK0gGvBqmpo+1UQrKCS7JGCm6e
	0uDfxxrcOpxMHLHgJhB463VblCmslQLY=
X-Received: by 2002:a17:903:32cd:b0:2cc:89ce:2f07 with SMTP id d9443c01a7336-2d704ccd9f9mr65099565ad.1.1787743760425;
        Wed, 26 Aug 2026 04:29:20 -0700 (PDT)
X-Received: by 2002:a17:903:32cd:b0:2cc:89ce:2f07 with SMTP id d9443c01a7336-2d704ccd9f9mr65099045ad.1.1787743759994;
        Wed, 26 Aug 2026 04:29:19 -0700 (PDT)
Received: from [10.218.21.115] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d704b9f555sm6477885ad.40.2026.08.26.04.29.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 04:29:19 -0700 (PDT)
Message-ID: <4bb2ff3f-8047-4212-b845-62ba87142a22@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 16:59:15 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: shikra: enable ST33 TPM
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260826-shikra-dtpm-v4-0-8476223184de@oss.qualcomm.com>
 <20260826-shikra-dtpm-v4-2-8476223184de@oss.qualcomm.com>
 <72be72cc-57c0-4b17-ae7d-0b28752bc708@oss.qualcomm.com>
Content-Language: en-US
From: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
In-Reply-To: <72be72cc-57c0-4b17-ae7d-0b28752bc708@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _xh68BCcH1d-oWMFjkM3CpFlPX_pEJ10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA5NSBTYWx0ZWRfX8HSLRrtXE05G
 utfv8a1M+Q6DINwLfbqdWsFoDbIqbG1w+FNEEuyTIOokZV/mOMx1jJoOwcbcifr/BE69GWq+LIS
 0Z6CAePj+yr1pVeMgLcoDjHlZLymGznUSmBMu1frv7+2ZszJKRY2p9qrUdDw1zIWTB6fO6QA11m
 9DOHv7sSvKluJjWuQNJgx0VutRBGCgKDN5sDRdXy6+yTYx/x5Jv5gDcALkK40bNT3qTGgd9FUge
 YFnTpn94sVP7SpeQF/czvF8+TgKvbkXJWvqtcvkhrgkADZjR9IMyQwGhM6ClkipcDxQpgY3Tqm+
 XXePu+ZmOBH3IycwyWyyNZwISQ/nBio02YI3WMiXHgCMkPY1urbB74txlho+MyFyIkDb/ze+wWA
 CJ5l2bzsM06qcMqbn18HHKP9VZrIi6knLNHigX9gazjFnSTwtrXDimduVHoQkiIn6kGQ3X/ZwEg
 P+TL1gf2jNkydnfbzcg==
X-Authority-Analysis: v=2.4 cv=Xfq5Co55 c=1 sm=1 tr=0 ts=6a8ece11 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Z39qGPvTphHJc2tveQQA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA5NSBTYWx0ZWRfX5toV4NMOUIBt
 SsOc4hvzdY/YHpj2dMohLeWhwyI3z+3noN5XJqZxgTRFapHw9TSGyZjGh1zuViKMyhzoKwCkhDo
 LlIQO6csOxgkI4PR2NPoh2cUfvaNvfE=
X-Proofpoint-ORIG-GUID: _xh68BCcH1d-oWMFjkM3CpFlPX_pEJ10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260095



On 8/26/2026 2:41 PM, Konrad Dybcio wrote:
> On 8/25/26 9:13 PM, Khalid Faisal Ansari wrote:
>> Enable ST33HTPM TPM over SPI5 on the Shikra IoT EVK by adding the
>> required SPI and TPM nodes.
>>
>> Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/shikra-evk.dtsi | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
>> index 6eb4184f7642..9f3a880e95e6 100644
>> --- a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
>> @@ -12,3 +12,13 @@ &qupv3_0 {
>>   &uart0 {
>>   	status = "okay";
>>   };
>> +
>> +&spi5 {
> Please keep the alphabetical order of node references

Noted. This will be corrected in an upcoming patch.

>
> Konrad

