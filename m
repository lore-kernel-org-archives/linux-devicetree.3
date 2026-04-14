Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907893C5546
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 09:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776160291; cv=none; b=On0m+Dp5UC5xk7ne8Fo9wevoCRfWCXrlTN5NnOiwKK/eK+bziF5wQUhjoxOvtnDEM8ADtzYQhMp8VUTwUVVVgmxcm0ozJwuXIQhsl8ypPIX3FGg2g++ezinybp2EC9pdW/xf9+9OLWRFgWE6/kJJFYuDeLF+PZn3sulY74x6NfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776160291; c=relaxed/simple;
	bh=GjYSzpaBOY+tQSBP+F/2fNUDYZP16CuhUhfczyEWtsA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hBcmwZbwIgCXoHwErdgTNMxHcfeWnhTrgarWW9M2PIl2MXTL1RbO2sgMetomUFA5668NvOJCI5nf89M5TZ7jICH2IaASlr7R4xsPqf6HwhXMU+VLffCn2uOF3Jj9Vzvj2iLn9O9XbDBELy4Kf8Fb9G7Wl//3kWNd/+3wfWFfUf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YHYpQyby; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VWT1pj9B; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YHYpQyby";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VWT1pj9B"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6mhG22511007
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 09:51:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M2Nqoj6YRG35dW9rwuMRPa4c0UNKE0+QLsU4feV7SfA=; b=YHYpQybyafBetHKj
	D+Rj6GEvCn5Aya/tQ7HJNdaVNIAN0UJ6pOCCzXHmeiV+1oediw9BlZ5tnrMw08rl
	tAu++N+534fsLXnodyfgs3+FkaSLGg20+T1E8UYwvanuKHrO1Z3fHRbYYPnMooKM
	cjsP6aPDdXLs6DPHlikThtlz5Rx831qx3w45IHL+Wosmc9LN7V03SdzbJl4qUPTx
	mjdcPK5WCzoN2c+0CZwockf+V82ZBx406+Hir/LlBe3vdA016u1LqgCk9pQHQYns
	2Smj5ZL9Z7UuEuKmnt5DxrvbFeXMN5N1L3F1l04wEhRLZUs6O8gTYHTKUwoZQzdH
	zvmd3w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh867t4uu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 09:51:29 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-895375da74bso14293636d6.0
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 02:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776160289; x=1776765089; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M2Nqoj6YRG35dW9rwuMRPa4c0UNKE0+QLsU4feV7SfA=;
        b=VWT1pj9BAy9NSOxP5h104dWFE/OYblOUd0fvFR1nGiqZdhklaKhDx3NPL/Ejyo7Tts
         XqKdfgI5vEBhVG7KOeHZxVcDTAyGVqV+cwQF3nrga5dSAegzVMtQWbMbRtHgnyN2w7lH
         3ABxjfoFW/19ENTjOvWUDJmCHxlPpBu68BFpvQoQttTTNLgNzunx/9QyFZLPgzN4sOOK
         fteatgVSOqJkXGFF0Kf/XRp8TmOTlLYDyrmkBCBdsXrhix8fpn5s+I2aC9e2jdf1xPpX
         lRER8sDwXCqHJIOOLP5oYTx1wOKEGqQAa8/0itif16yl/Jn+ISJuJ0zxBciZcVafD6G/
         Ap4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776160289; x=1776765089;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M2Nqoj6YRG35dW9rwuMRPa4c0UNKE0+QLsU4feV7SfA=;
        b=SE8M8lfruvt25pkvVRRMzKhnO2gdNXV61L5LXJQVmFyhHPAz8Tpo/9obFcFuEnlOE+
         ES9yvKeelIEqmXVxYQC16FYeOf4DIHQ7U9/iSt9OfDuCpDcBclw+6mkg7xNpjYIZATMz
         w1Lqhig1Bi/T2FwKUjqCMXrME2vbnKuon6Y+hrE7l7v+luHh56O0TCApuW17a5njDDEJ
         3+SX9+p8dKRGn9R8WrPmfZf9B5GrXz2r6E26agB4qmfWGrfEsxG9F87ZKA9ML8vqxlJq
         DtL/pH8NrsPtuhcEBLqlNioqBcpYtvSxfyrDFlOXuBa8EP+hyuKL/ZlvKEl8FHJe+8Rf
         kqpA==
X-Forwarded-Encrypted: i=1; AFNElJ/KN0bSW6b8z5kysewCqSvy3q1OBA7HE1t/hl46AgzXzo7ZgjOSOwJNBlAVpSvU+QCA4hSm+Di02eY8@vger.kernel.org
X-Gm-Message-State: AOJu0YzGViqOY/FPCindTFRMWY9WVSz8Tql7zoUVCQfblAQkBlojXlcM
	ioVstB41tx/Q/LkoG7z8c0pKXJzjbPMn1HxRzjYq1dzE455gq1Lg/tJawqJGqFNI30g5bnMfvru
	KMKyGVtyeTtWcyU5SZzxYGAqDndYV+lLPgvqycJZCmdhZ9HBBDN2xEb4mZpWY+vdg
X-Gm-Gg: AeBDieunHdhVj1Ey3emK87P1dYqOFcfNFz3JW8WWGV2YFLqhMIAlBLRVaHj5YAZuHfT
	9uqxIeERG9WXG7HX9yhXGSCo/shZpDV3q0ECdlvqvS9042ZqcIQQSMtjzCcO7Ofvp5egDa3pJ/M
	KT6tl/SsGb2z3Ao+u8R373Vj/uHT050OS0b24LO8f0hklF7wzxQ/mfQhNqFojAl5ng6NvIsQMC+
	0vLjw59zhwV30J0kv8F6d5M/+bTmHcP1Xvj08llKbGRA1ktsNHwdSPqgBsG4EItwcaG4uD3ssB0
	VVlf/+piwphEc8G3x8YfFPCVszYByMJ5UZl+LDcOuBIj+boHMq7Kim3Fzj3qy3vkIsTfzY6h1+d
	bC6JGLmtnDSYbGgpMN1GV4d5sG2JAFHOJecuynd0UQChssYHwjy/T3JRKUmEg4VXnT5vsJ6Apz1
	aQQ3Dxw52ze7gLHQ==
X-Received: by 2002:a05:6214:ac6:b0:89a:7d14:66cb with SMTP id 6a1803df08f44-8ac8629bcfemr194153456d6.5.1776160288882;
        Tue, 14 Apr 2026 02:51:28 -0700 (PDT)
X-Received: by 2002:a05:6214:ac6:b0:89a:7d14:66cb with SMTP id 6a1803df08f44-8ac8629bcfemr194153016d6.5.1776160288365;
        Tue, 14 Apr 2026 02:51:28 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e7c8a78sm384964866b.50.2026.04.14.02.51.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 02:51:27 -0700 (PDT)
Message-ID: <d1834575-768e-4805-9e21-50a796690bda@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 11:51:24 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/11] media: iris: Add support to select core for dual
 core platforms
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev
References: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
 <20260414-glymur-v1-9-7d3d1cf57b16@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260414-glymur-v1-9-7d3d1cf57b16@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: jDDR7Qnhbe3o82uBwcta9EAlRLjQBifO
X-Proofpoint-GUID: jDDR7Qnhbe3o82uBwcta9EAlRLjQBifO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA5MiBTYWx0ZWRfX7Vsw3GelbhOY
 dp0gEgKGFgJcklTBYa2KzRiDBuh9lT69uUmtVAGbh4N35R0eBIEVwa5DpjdLSVlE/IrF3v0mpBE
 gXc4docTfcz4Ul01FAPNXIJL6rWVg+jYaz+UWTK40mrykgkRjiu1n6fH/oC2rN2WaLsUMup2eG7
 922VYdHnuYmZRGjCXp+Td85wwKmjQKi5zb/JHwquYcH35Sv811IqHe38MJ9SwDf3SK0ByGd+sw9
 d/oIrDCLsZedz8TUTE/CstimQf07YoBdVNyyVePAZvTDiYprCxLSSIEBBAS8VTQqdGovuAVG11b
 OYwJmFBtiSb+RiEOwg99XyS+tTNQdICwXiWuj7/b2sFn8Y8DS5eJmIHJ2xDj1cEQpCGOUuAz6ko
 XvoHTBmxOUlo3MrSORtLyLy8cTrluLoodf+bP5UilSE7//QDqpvtxujK+UH6oGkpxefbTcvngSA
 gM2JgxZmqRQLVsnaR2Q==
X-Authority-Analysis: v=2.4 cv=etzvCIpX c=1 sm=1 tr=0 ts=69de0e21 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=LyQ9poKqOzz0K_9SBp8A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140092

On 4/14/26 7:00 AM, Vishnu Reddy wrote:
> Select the hardware core (vcodec) for a session, based on load when the
> platform supports dual vcodec cores. Assign the session to vcodec if its
> MBPF/MBPS capacity allows it, otherwise assign to vcodec1. Communicate
> the selected vcodec core to firmware using new HFI_PROP_CORE_ID property.
> 
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---

[...]

> +	if (core_mbpf[0] + new_mbpf <= max_core_mbpf)
> +		inst->core_id = BIT(0);
> +	else if (dual_core && core_mbpf[1] + new_mbpf <= max_core_mbpf)
> +		inst->core_id = BIT(1);

Let's store the core ID as an index and only wrap it in BIT() where
necessary to pass into the firmware

Konrad
