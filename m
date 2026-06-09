Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C87408608
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 16:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781024393; cv=none; b=mSHQK6lhF8GZLa9lvbfRqwBSRLMBXV3Ybyq27BSqlumhr2617C1sExFoj1VHmk78N8B+b61CLyVfdsIM3ZVjdTy8hUyu2eoEXNO1ZWjl6BxqJJMlqrrNdGnLASpKtli+oyd7mV0GxbolT4j2z+0Ea4kQuGjh16fbGont/4iYxis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781024393; c=relaxed/simple;
	bh=MNObcwtk3k62SOnd78c5GiP0KzkCASkkFMdouK8Ue6Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HoYdMDIiihZ3dp5kwsBdENPCFbAHAj5kScdsz4WqoMRdQO0fbkxCPrGZuXVS/yBgGlex739RxXFXMTs3gxcncfJ1kWZGJT/yIo/AwC0OHI64h/oWXz8ilgZHeQGAKpRhWGUEZVqsfrfmxNVkE3FgsAVfbYhNs8DB3UPocOxH+bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cyWQb/Qd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XAsK9hdU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cyWQb/Qd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XAsK9hdU"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659GP0Zg2684240
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 16:59:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e+aXLrz4Rbwm/JvVNnxvQFAPWGYjid4r3eNfZwYnoDg=; b=cyWQb/QdL61a1mtE
	tuwsSaK2PpYEmlyq/B69ieQamb8jXx/hsdU6HQ/nd9wx1zlF93Wzj8EE2ct2JIRU
	INDa95oZeSOFI54F4SGCkP/Wp+n+2MSKVVaZJweTqwjxX55YqEDrC3tbY3SKWKHg
	gmftXMHdpbKC9yTvAPeARuu/2JYxC+6iOr7xLk5MS0s1eU0fR7Srvc4b2w03PFJz
	nu4SONvk2MdpwN512Hr94pKz0GJ4Bmcrlp4L8RhvD1BOJcIU5LogewsLb+e0pvvw
	vzM751yCV8JH2+AJo8SIrIsfwnAKiN6SjLhWnXcDDg3JlcyGsinmtvmuCQY33yNF
	CHDvNw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epenrapum-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 16:59:52 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c858e0cbc89so3303039a12.0
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 09:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781024391; x=1781629191; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e+aXLrz4Rbwm/JvVNnxvQFAPWGYjid4r3eNfZwYnoDg=;
        b=XAsK9hdUeW10W3Jr6oA7qhA85TIh0+Mh9+Lsnp+lgAW75MAm4ZWuLcnEw5IVXV74h3
         E26u38TCqd6npGyRmWsOyZjCt3789vps/X6qrN0s3y44pOkuhjim8o2b7/6Qy8no9gH4
         mfxtOLR1SmzmK6Q9iT7h7ShM5i4nzsI19D6+shkW3045Gs3szBHNxwccIhBkkjSHUAWH
         Bmus3VnMuyKkGHHHuWZbudi74FYasi6XvJxoNdkRrS4QI8qO4kqoP/W/hBqNBEeA5iVp
         42kKIpVhoJvyfNzJVckQr2XZZWNyPd4EuUVpGAPcbJLR6iL4mOZbxyATSoizEzOlARc1
         Hlpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781024391; x=1781629191;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e+aXLrz4Rbwm/JvVNnxvQFAPWGYjid4r3eNfZwYnoDg=;
        b=MZ6GwLoKJDUcQOzIPEEPZVm6Z4vIFU569WripzRCRna0F+At3cxJ80Xt+/cRbDm8Jo
         nWTMJyxqJGp6oN6ssXHKXG+5jzZlwqWXL79bX7u8A2yRz++TFMHrymx0ealKTY1enrI/
         d6jdouqqztD2tCZVcqZ0wpe0RZno0HnCWSKihr7WxQR/uBaebaOvdhlrszFCw2jSLhii
         WUWqvqBQD8yq8aNd/s89ypNvy3vvenyEVo/lfb2g6Bl8eDuff5Td6/sez62NQrVIg8F9
         be79gAkP1gGJ+V4mgcNnd3fWCYj1o1bi8QWgRR1oeakv9bhbKvEcpKglpOJ4wniwDXFU
         Cpng==
X-Forwarded-Encrypted: i=1; AFNElJ9L1zvtoFm1Ycx19KLVtWPkLSNM8/hI9kqY7tHasvDaAkRzDkFBNZC6zMqPZqNcQacrC/sN4+/CbJJm@vger.kernel.org
X-Gm-Message-State: AOJu0YzoRUijPFvGqZTJCsN7ZKcRFu2gnAW9jZ6xnUv2r4sYoVSe05tz
	wXsy7CXlagUzjO78ASB0gOgdz2/Rr4cdfVpuSFYJb/BKXX45OMettzfto+PXm2osTAQ3rTqiao6
	YMO6FkHzqPZdKl9SIfxwCnOgWf7SKPfiN0QfXoP4m7LXB9viL/Qp8tmXkXMYyuVI5
X-Gm-Gg: Acq92OHx9jQiK5V0YDI+dBprdWe3Dtv+eKvfFhBiPb0F6qhgQZ+gwFlfqPEviNM36eX
	nrVWhudwIfLrlUISi2w6M3MXKlSwdkVv89iCgoVQRVeq18KOoKB93UevzfDfI3kNTyELuD5MmTV
	Aqe0i7SJ17SwJLmJeJsXF0+pRPNWNKCpHCQuHwz9BSMDDJ10DsvI/wSmmGhCBVzMrt8Ckz6U1Pv
	by5JGQoLoTLiG2DvFzZE5udR/4GyBNKNNwsUMNpq3aJrJWQa1fs/wv51U1sGc8zazrZkRtYS+c8
	xyDUsvdQQxgUZ7d96/PygJZ/wBIbCmRHJh3SMsg0dH111a/cL2jmXEWTMbgsXHWGfeh46g1F8d8
	5j846RP8pOZzZ3XnrwTgl1SNfmbRVOA/j/+15THVy1QDc2z0N5biSoizwf78VDotVCI1hEGS+mh
	O3
X-Received: by 2002:a05:6a20:d529:b0:3b4:6155:cde8 with SMTP id adf61e73a8af0-3b4ccd858e4mr26753019637.21.1781024391265;
        Tue, 09 Jun 2026 09:59:51 -0700 (PDT)
X-Received: by 2002:a05:6a20:d529:b0:3b4:6155:cde8 with SMTP id adf61e73a8af0-3b4ccd858e4mr26752983637.21.1781024390803;
        Tue, 09 Jun 2026 09:59:50 -0700 (PDT)
Received: from [192.168.1.45] ([122.164.83.29])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0a4e59sm19343348a12.16.2026.06.09.09.59.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 09:59:49 -0700 (PDT)
Message-ID: <9ab1340d-72bb-48df-8784-a584a37b5c76@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 22:29:44 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: ipq5018: Correct CMN PLL reference
 clock rate
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        george.moussalem@outlook.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Luo Jie <jie.luo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260521-ipq5018-cmn-pll-rate-fix-v2-1-04b28a92e0f2@outlook.com>
 <cca7e305-bdf0-4ddb-b299-aa25a183e229@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <cca7e305-bdf0-4ddb-b299-aa25a183e229@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: he3q6KWFaCNijUW7_9hpIg5cGE-yNzyU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE2MCBTYWx0ZWRfX0u1lJft2vRmd
 z74L6jtSHT+a+whvnQxrV//0/3Sputr4pYJUiPQEm3k71JzYBUzApR/p25jtksrSLwyR0oVo2iD
 pVixKNx6LuuL9xPuL+0p+6Lqcs0ZOofPEmKD0VJK7fm5AFqr4YJSUBl7e/gkv8a3Hyz0lvBt5Sf
 Z++H5N6b/uIksU2GqTO426diNTltm2QZaUxpyiwKOxfeSH4LgFDLRj2wM2nCeXW7NH8QkDqDSOp
 2NhxkmM+IiAN7E9tVAy/KU0gzZXntJtTBZWai3HNf25XvZT92l4h7d6iWECAUz17qFc965c93+n
 ZH40Mb2qf1zUVY8T1XNn8eCf5tbn3daGJNrtHNgKCkardoGtdnxImRm4eiszyDb5pWi4yejt8hB
 +I9rRL2w4lnQRLFcVWn7CAUXKvUXrS4fzEtSME1c0PkISD/QRYOQsgqv+NbWApll5wnQdFa2s+j
 CBcnK8tgue9GcVk+GnQ==
X-Authority-Analysis: v=2.4 cv=NKPlPU6g c=1 sm=1 tr=0 ts=6a284688 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=/Dmoft2P+kuiDiPUxd+r9g==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=bC-a23v3AAAA:8 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=ZRiWFtQW1K3ZmbnfVNIA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: he3q6KWFaCNijUW7_9hpIg5cGE-yNzyU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_04,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090160


On 6/9/2026 8:42 PM, Konrad Dybcio wrote:
> On 5/21/26 9:55 AM, George Moussalem via B4 Relay wrote:
>> From: George Moussalem <george.moussalem@outlook.com>
>>
>> The correct CMN PLL reference clock rate for IPQ5018 is 4.8 GHz.
>>
>> The CMN PLL driver did not account for the ref clock divider which is 2
>> for IPQ5018. Therefore, the computed rate was twice the actual output.
>>
>> With the driver now accounting for the CMN PLL reference clock
>> divider (commit: 88c543fff756), set the correct reference clock rate.
>>
>> Fixes: c006b249c544 ("arm64: dts: ipq5018: Add CMN PLL node")
>> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
>> ---
>> Changes in v2:
>> - Removed line break in commit message between Fixes and SOB tags
>> - Link to v1: https://patch.msgid.link/20260519-ipq5018-cmn-pll-rate-fix-v1-1-3c83a173c27f@outlook.com
>> ---
> I have no reference for this, but I trust you.. maybe +Kathiravan
> could double-check

Thanks Konrad. As per the HW doc and the commit 88c543fff756 ("clk: 
qcom: cmnpll: Account for reference clock divider"), default ref clock 
divider is 1 in IPQ5018.

@Jie, Can you help here?

>
> Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Konrad
