Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E10B1BD9CE
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 13:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774270957; cv=none; b=EgwegAdqbljOnUKkaasOqWzDxQ8L4h1FBmu/0wgXGpHaAWHQI8nPYREzrDydZhbfqhy/HjlEgLSfmCbWZaqdv/kKAl/fG/TBpB2qKOkD1vZ/kARSHW4UxLUQMMSCoOhFo1IK5qhyg8ihulYKON9Ddg0jc1KfVHKNB/owR+sVHvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774270957; c=relaxed/simple;
	bh=DBUnQ7IMF1Gr+J9ecn8zwAkezbKaY/aAKdMV8GBL3k0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M8aDynSI7Lwpozi9y2avLmDBUhLgqR8HGnt+N/11sAB1usRPqoC2zA4XRo9vydvMwzDge4VUPhfkc1s8pRiM+632wbNwafFyW3a+rNgZ2N+IYJ3HY6+ck8hriCIgd03kIJYxHgsSP3EKUXfqGB65uykJeEw3nISXL+vE3844gw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fe/YwLPh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XULGPWC6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fe/YwLPh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XULGPWC6"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7u2Ms3468345
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 13:02:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uUMa343R32BhomDdtjRDM4iz5nyUrk3NDyeGHjzbVrY=; b=Fe/YwLPhyoFDu9L6
	tVOnY7WMQLdjP21ef8tR/vlJ4Gn6copc0t14doNUN+iZfWxlbPEJhhY85gBiXOcd
	l675oIQ4Hp08plOjKFUg4PxcKtJotMg2AF5UWhrIEs/nIo90RTv7NiOCRhxO7VFN
	ab6v3GihME9m/excbv3gg5+OURHccc8mvPTc3R8y7dYbQ+GOdN6WhnlNg3IcGdNN
	eLOHn3LNn69w7XKCQy1fzyt15NY1Y76bPbGqej3pHV7Rcaee1aIyh8bxZnwqvi8S
	2boZ0/AWMLX/XlOUbYQD22ZJFSQKrPQX8x731PdzXLGD6ngEeQw8UFzsk5OtYUAb
	JB8zcA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jgh26c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 13:02:34 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-94ac645d5bcso387886241.3
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 06:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774270953; x=1774875753; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uUMa343R32BhomDdtjRDM4iz5nyUrk3NDyeGHjzbVrY=;
        b=XULGPWC6XaW1DkEfI0kk84oZpXC0JFoIKd3SmL/6uvmHHoRRTRqqqdN6F1cL3gSxgB
         kWQzgedFzq7a/9GVmT1gFzcOyRdqgkc1deYLdzKReAID9v6e/ojeEjxeld5P/vMiz2hu
         bcKc/RQQv142493z/E6R+MdQW0TL+U4oL2/ZKaTmA/sb8ZkC3KMZHOiQj+7yLp2ZvP9u
         FScgl7NZaC+JCYADxnZqyyFXXa+dUVnzJG02SlRPIqNcDdG6H7Y4h5wwLN8XOjuCQog9
         ojDzQzuHuh5aBUmfWIh/DdX7oxGt6yMiUZ0+tMFuJTdf5jO1OgB/PTZdKfq73bGvUOZ3
         VAmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774270953; x=1774875753;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uUMa343R32BhomDdtjRDM4iz5nyUrk3NDyeGHjzbVrY=;
        b=hUV5t4l8AyRIRNSU25gey20QKf7VpOTfP0bGkgTqD1Uc2ZugWSnNSG5KSJutWhYQa3
         bYEhaq7Z/iNKyTWDCy0MwGDtQqb2adOjT/he3V9Izdz/w5ygnZU3w/sCgmi9+6PEPa42
         cceDQd9s3MUENCp4opTy3t8teAz9pIzkOznflUDWGTK6iddT9W+8IfGA2y2Su4xT+d0G
         sH1NqHf81QPH+GjTUH+B1RY0QCcI0zfbesz1CFIDNdyb9ySCwtAxhNt1LlWZQP5iccTy
         4CNgC3EkEd5m7W+iNZbw//Cv0lgqFFdSLFhxdd9N0pXJltiYlBSzrxJnQDQN1MqlzIaF
         nlWA==
X-Forwarded-Encrypted: i=1; AJvYcCXizm5sZUl/bCFw2eXGwG3q5QREM/vAsP3p2Pco8gKqUieawyIZjiMroTR2+xP/lMyrvrytR65jV0MT@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw+G7INNMSzzTheUWtSGbE8WW/HzXl20CFMSlelsZWEoD4umAQ
	K1eyLr1GwESSSHiI+v2T6w/8cKFwcOK5JBvT8vPISxh4wzPrhcmJ7RxDHV7nKIYnptkuowQKiS5
	FQVwSyHreebgq+2jWeMYaHJI2OpS0ozHV7fl7p52V+f6u21Oym5UNcISfn8udSl3bx+YXBx1w
X-Gm-Gg: ATEYQzxnV46ENcoToD05SyoVOIvd57lKObPr8KM9gPA6noxRCDFruH8p9yUS8PSbULq
	T0K1bUuBYWKxcgTQOys5SulJGuHdUwF0wJ4uK14j3zW2nYUdtS6ETnONbd/pfaHNp4ubu0d6uZ4
	cwFsNJhi1SOwc4wPwfVhwODL/uuiJw2ZSPt1He6W2S9L62z4FByBGjVSmFAR6CtztQawhImBqT0
	wD7jI/1cxwWxypuFoOea889FdwKl1ni5nb2UI0csmaI5H+ULt6QdkRCr884+FzqSgmIA/VpyiFQ
	eZlDNxJgyw189NzMfUU6RXV4fz7HyzZx1WWWKa8MSrYOt55augEfl0VUYjnLMxist11rXju5ORR
	HyjjZVcnEFsta6H+3bWyhGxPE9c/ISazoBs8QG9htKio2WZ/NZFzLwuh7xtDhtSsrD094vfzuIa
	M1Xtw=
X-Received: by 2002:a05:6122:c244:b0:566:fec7:2ac3 with SMTP id 71dfb90a1353d-56cde1c89bcmr2005533e0c.0.1774270953152;
        Mon, 23 Mar 2026 06:02:33 -0700 (PDT)
X-Received: by 2002:a05:6122:c244:b0:566:fec7:2ac3 with SMTP id 71dfb90a1353d-56cde1c89bcmr2005489e0c.0.1774270952442;
        Mon, 23 Mar 2026 06:02:32 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b983398d82dsm490430066b.62.2026.03.23.06.02.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 06:02:31 -0700 (PDT)
Message-ID: <a73af369-b122-43d2-b28f-e97ab33352c9@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 14:02:29 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: glymur: add coresight nodes
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260318-add-coresight-dt-nodes-for-glymur-v2-1-d76e08f21fa5@oss.qualcomm.com>
 <ef89e328-fda6-43f4-b40c-8834d16e2cfd@oss.qualcomm.com>
 <7972211e-d735-4401-ada9-b83c7b96b612@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <7972211e-d735-4401-ada9-b83c7b96b612@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: wlxjGPY8LYDqkNh7qgco7SrLKfQjtt7p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDEwMCBTYWx0ZWRfX7yAul97bUNxF
 Gyg65YmBFVQfor4gPkLUtyOygTsG+6FOCpiySZkADw4K2W80HiWJ/WwElUeEuQOfaEVD+Gq5oO9
 MWSRWuJNP5ZOZ4g2wnEaSfPpEZGbhKlM4znpI1tZiZlHpagfUWYv3P4hzE18NSHpT5+6C+TESWP
 mBLwXl2qDg0vhaYLEgl6Ona65n2Un7gk6LdiVp0rNoRZpSa91xx9DyGxgfHF+oQeNStWQmJEGR6
 iR0u5+XVX8+UcrpGw/K2DzWd62yP4uvXcI6jfPAdI+Bi6hJVEqX3kk8csQp4U3lOgF61JoUg54C
 wGJbPg1Hx9bKw/gurTCJ0URdJ5XjfFEHPT4Rcutr+l1RIRQ8gUqikF4TRD5uteb6gIq2Sd0AC5t
 xaUtn7wJbczxXhwW1vRts0js0N47LLMIuY3EHDf7ooGw4smxvsox6M0F0Ol3UeYJHiAzwYjwOfM
 X6RCjxoJOgqla8k2x3g==
X-Authority-Analysis: v=2.4 cv=CMInnBrD c=1 sm=1 tr=0 ts=69c139ea cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=M4mPnNHhtMrhvY3s-vwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: wlxjGPY8LYDqkNh7qgco7SrLKfQjtt7p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230100

On 3/23/26 1:30 PM, Jie Gan wrote:
> 
> 
> On 3/23/2026 7:05 PM, Konrad Dybcio wrote:
>> On 3/18/26 12:42 PM, Jie Gan wrote:
>>> Add CoreSight nodes to enable trace paths like TPDM->ETF/STM->ETF.
>>> These devices are part of the AOSS, CDSP, QDSS, PCIe5, TraceNoc and
>>> some small subsystems, such as GCC, IPCC, PMU and so on.
>>>
>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>> ---
>>> Changes in V2:
>>> 1. removed two cti devices due to GFX block is down
>>
>> i.e. "because GPU is not yet enabled"?
> 
> Yeah, these CTI devices have clock issue for enabling due to the GPU block is not yet enabled.

Do they need the GPU to be online, or a clock from GPU_CC, or
maybe something else?

>>>     - cti@11c42000
>>>     - cti@11c4b000
>>> 2. changes two TPDM devices to static:
>>>     - tpdm-cdsp-cmsr
>>>     - tpdm-cdsp-cmsr2
>>
>> They were TPDM instances in v1. What's the reason for the change?
> 
> These TPDMs havent clock source for accessing registers. We only need enable its ports to output trace data. So I have changed them to static-TPDM compatible.

The registers are clearly physically there. Are you saying that we
(currently?) can't enable the clock required to access them? Or is
there a design defect that's preventing us from doing so?

Konrad
