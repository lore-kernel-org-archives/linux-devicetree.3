Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792573428;
	b=ibmu1/oPnklGaXROxNc7+kjtg9KFvP2O+DfeZnph5jIpmhybzU9fOqQHXW364ZKnsDdm
	 pIC0yxkw9Dbtivc6wuh4aD2NavuFF4fj9ZO/wPBO+ZF4FuhZsg9HM0TEXCKf6P/LoMFu8
	 mtdlXv+VZkcno7ddhz4MiF/CihIDjXYn419Bk+TABVpUWZOyWSkv9amse6HxyXG5ibDqp
	 D6ICbOp/wpOohag18uLw+Qe46a3YXvoOPbUOdMMXxYzVegtjHskLpRHK6LCP/FrjxbCW7
	 KmOyzVCXwT5WGoTU4W9eJ0IMw7TET6D5UhEnGdxs9Iod184YA5Z6SH/dj4QGtNlKtmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792573428;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=b5BtvqtvptDu4T6AHb9Bl48iLMJa4oRxaJrIUF7qgQQ=;
	b=l/oYfVH8T8PcRzA3FzZxmb1YAJdPzRrr1fpgaqmQ7RA3ATB9o399GRmoaKV5az0eCH7O
	 CATRWWW+kAm3XIL6B24SuabDi4PFeb3/YjP7a8VoM9yNuuFMU4400SRNGLwklFJVMgF17
	 sDD7y+8Zz3X/otxbanTwBGxXFAWKLzcRygy0WyrVlWJCeiUEYTm2IWA2Epr3ygcsIwS9K
	 mMpuY0jAZ5/T45lK32vaLVCjShGeW90+6PS/WKGJbhUqqGVwdRg+3/1ri74R6UwqGBorb
	 a4VEo9ylJetqUhxmKFk5f/cLPb8UItb+Q0EkN0fwI6LZKoi94TMVOa/1zBY6yJ89Bpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z+Hq+DUt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T2UIYRLc;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2CEE606A31E
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 09:03:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2CEE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z+Hq+DUt;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T2UIYRLc
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5j04J756335
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 09:03:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b5BtvqtvptDu4T6AHb9Bl48iLMJa4oRxaJrIUF7qgQQ=; b=Z+Hq+DUtwjM3e+7q
	FQiql8qBvO9CK7NZQpBz+IQ1xlHSd3P98RmIslutyrqCR8nx7FY7PMc/tbRLXmFI
	7054hLp+yWXH1m8FoR6tF3/ZuowLXg2QpXNlaI+4lbqWOqtVr7SbTFBQOiUEAYJ7
	E25TqyjLVCxfBhX+Mhk0Lj+UiuTskaTGV8IdC7UY5C80UV7i/ve7UZuBYSMfTAU5
	tA3a7WwfoWf/zvJ2P0POOu0RjedPoZcHWTz931+tTR5s9xMHTSTwMwAK0mNW7/jL
	Y+vnjmjigckwPgu1LF/+rkI0KI6hBPi9WPi4PPnNjs35uMlDjdFctdPLTBCyC5f0
	398H0w==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda4u4j6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 09:03:46 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3548cdfd2fbso787174eec.1
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 02:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792573426; x=1793178226; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b5BtvqtvptDu4T6AHb9Bl48iLMJa4oRxaJrIUF7qgQQ=;
        b=T2UIYRLciffuZJlr26g21fr8jtvvPFPP/gRqchv2nLjkRmPt3B/2k/KK9MxnIpfO+2
         ZeKyJzc3HnYrq0kwnY/jLVTFhhtBJ90u4ld3TjvJmZc4bHFIt+/04gkCj5Gq2NGx45KA
         oorpMgEo/o4i2L5QxULCsx6rihvYSyOsyvdfagYEB9Zlpe5CPomTDqPzWF8/w0oq+9rM
         X6qsAtKvappWozuJW2ldOr9xoobUrpWADZ9+9iL9E4ifJpvrk5mmfTVsmem5LVTw9srJ
         9dCvuNnc7kxqoFF+0TXhgMJgLOif21H7gB9a1qpZ+aHhQfwMMmZWEDHR3grWPIRpORgg
         3c/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792573426; x=1793178226;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b5BtvqtvptDu4T6AHb9Bl48iLMJa4oRxaJrIUF7qgQQ=;
        b=uDTvyAZl/CMPhPFJ+0PBhrqfm5GwPlisxL2vIBTfli2ufo4rESDOWYazgSkc1E+Al3
         G8JW0yZDsen/iZgKRQMFDhHXhtyY6xAdUW5sRCSLaQRcjat3226sz2MdJObY1i+pqmqp
         hVbDgyGO/zvijH3HvZik8Fq7QOV2Mh6/RRk94b3/NvfAlj2YYWCzzfkkQYPRBqPtx8K9
         44iQAou4bXo9hbV/ulaN6BRaKxwv9WRMTiVgKYrWHzoZ0roE9yZDcluKbw9pVB44V+m9
         JzRrDasuRxSMHvSFSnDRN6zVXYWiphb2sE6BTewUd1Bj6XOIjK8yO7nJdI8eO3Dt2sSR
         OuNA==
X-Forwarded-Encrypted: i=1; AKwUvBzq0SobGj/fu0+eCEN4QA+6ZFe4Lgp3K4JbkH94W0zgKFz0N6n5PcTlrdxdqzD9RoEd2JnOLZZuTQw1@vger.kernel.org
X-Gm-Message-State: AFq9FYJPpsDtbKpxNcSIkL9y+Ru0N0aj9/+YO8eQcxqb7hdy8oRMZB86
	iCQPn9JhpWNely3RxviCX2bm6TXGmGJ9lt9mkgWUHsSxtvw+GrZU2ynsfJdoULKJT0lJKwJ3n13
	Kn3SyavHZo6nl/jspnRnyPtlPMORppdH2dULZC1iqGKqKrhRv1GXpfbwkVcLu9Ddk
X-Gm-Gg: AYBFou0Gr0G2212WCI4FW+ZpaX70chOfarYO4cG2Y0MRJLXPqKAzi+MHKctBsF3qRd+
	tILnUHesEfFhAzGw6quhi4sT4MSSTo4JWrLOZSyhEye56DujE7c6yn1wf/9heRg0fEtBWG9l44K
	kH+06ySgN+O4ypQGoGqciuk5w5aEkUyfaqEnMhIuY72el5wJTwGbz3x6MSYn4Q4h4NB5EZwEZYz
	uM/fFWOIjJ6Mgt+bIXyIy+kPqUtTWiiyutVzDkFP5Vht85UD+II0PUMIA1y5hTRcWdjLH5NYxyr
	14Tlov9TC/tdHgryv20yZUEyZ0MuQNKFBUcor8l0GSGCFstoh/nvRgLTWyKX1M9Egl5lSpUMC/9
	xLgRXC+xNXrCHDA9xR2w/2yFNfoPwAAM=
X-Received: by 2002:a05:7300:d090:b0:351:7d5f:df26 with SMTP id 5a478bee46e88-3674db5680cmr2001081eec.15.1792573425937;
        Wed, 21 Oct 2026 02:03:45 -0700 (PDT)
X-Received: by 2002:a05:7300:d090:b0:351:7d5f:df26 with SMTP id 5a478bee46e88-3674db5680cmr2001055eec.15.1792573425175;
        Wed, 21 Oct 2026 02:03:45 -0700 (PDT)
Received: from [10.217.223.82] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3674198f1d8sm7902967eec.24.2026.10.21.02.03.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 02:03:44 -0700 (PDT)
Message-ID: <ff0a5a0a-92de-46f3-9377-ee601d8d12fa@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 14:33:39 +0530
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] arm64: dts: qcom: lemans: Enable
 lemans-sa8255p-ride board support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Nikunj Kela <quic_nkela@quicinc.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20261015023711.721837-1-shengchao.guo@oss.qualcomm.com>
 <20261015023711.721837-8-shengchao.guo@oss.qualcomm.com>
 <45b54ff8-a2a6-4eaf-9d5b-cfd9bb40c459@oss.qualcomm.com>
Content-Language: en-US
From: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
In-Reply-To: <45b54ff8-a2a6-4eaf-9d5b-cfd9bb40c459@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 5NmZ33mueXGU4J_xoggq-OCW6vy90zdW
X-Proofpoint-GUID: 5NmZ33mueXGU4J_xoggq-OCW6vy90zdW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNSBTYWx0ZWRfX4xQTKzQzSOmn
 Np/HS/zUhCmf5Kc+d0YRCE1cRW1YFGr/NjaBxFlNd6cRZN4kk77tDkskZcTKRsLGN24SBZLdrx8
 mfxLkApbmbmUAc156em+vXrXO6j0w9E=
X-Authority-Analysis: v=2.4 cv=R7aWitRX c=1 sm=1 tr=0 ts=6ad87ff2 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=iDK90Gyl-TMhxqDKVhgA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNSBTYWx0ZWRfX8xe7jB1ZJqOm
 x6zH/Un96N7OAOPSMEWKr5NqoKRAEASEwhdJv6kOInOjibjlzg0ZoODJjmhqeM1LenEqMjh4mDJ
 laj4tHK/5v+QCzct8F1UCYHIgNxw0Gh0OF4w3rNauKLxLlbrhltwm6wcSohhha4DmnkAAkse4o9
 ZeJ1bi44rWbokMTvHhEZG3GaxWDaUAkBdmcqNNSRIYs25QNeQiAolFUqp168e64xGZCQmJaLrqq
 HKl0NSeuqMI6uGjHYyG9rTb/YeJ5ySCwgqvxXZF0bL+mqKBF0lkveOYPK9ZQjEgFEdlKM6Jx2wY
 3delPc4k33o91UfW0bG9Q1qk1wIdaSZ/G1GvpB5KDugKM7HmKrNJTQwpJNHy3k0VoGgvaDG/wyl
 rynnJaANPaOaPxoeIa2XgH+Y6tURJefur1zR94ugUytwu7BMl/+x0NKToC+1nfATZcBPhi/4YzK
 9S/2OQwSQioO2Ez1DNw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210035



On 10/20/2026 5:46 PM, Konrad Dybcio wrote:
> On 10/15/26 4:37 AM, Shawn Guo wrote:
>> From: Nikunj Kela <quic_nkela@quicinc.com>
>>
>> Add initial device tree support for the Lemans SA8255P Ride board. Enable
>> UFS storage, UART10 as the serial console, PCIe EP interfaces, thermal
>> zones for PMM8654AU sensors, and SCMI protocol nodes.
>>
>> Co-developed-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
>> Signed-off-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
>> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
>> Co-developed-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
>> Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
>> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +	thermal-zones {
>> +		pmm8654au_0_thermal: pm8255-0-thermal {
>> +			polling-delay-passive = <100>;
> 
> Do we need the polling, is there no interrupt?
> 
> [...]
> 
> 
>> +&pcie0_ep {
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&pcie0_ep_clkreq_default &pcie0_ep_perst_default
>> +		    &pcie0_ep_wake_default>;
>> +	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
>> +	wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;
> 
> This GPIO reference feels like a layering violation - the previous
> commit promised TLMM is abstracted away

Hi Konard,

For PCIe EP, the TLMM gpio's are controlled via kernel and are not 
abstracted. Possibly we need to reserve them for kernel only.

-Shazad

> 
> Konrad

