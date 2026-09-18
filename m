Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7A348E0E9
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 10:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789726156; cv=none; b=Xa9+/j1fjtEGphjgIy1OKD1kBSoOgcgka37QVLBgze+bnD/TUPuylDM+mL9478pE8ZQIEoPSguP0ueU22bqBGxrzIVBHDMvlJGprJbyTkZvKer0h72hMuTcXtSxz/z+A6vkOG04C9bwbvAKax5i0/OevKppCZvWe7zdCyzcl5Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789726156; c=relaxed/simple;
	bh=PdHZlWD9stRXw95qKhpl6GcX5DTPEE/+zggsNCbuTIo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=egPSXQ1hCjpEF8HPKzXDX3S75wTDLnomaiHFZwpIvFHv82DpJFgeoD7vjALvIveHjQUw2MKMjLEdDCYtZy2RWSpAZSAAAmhfrVyGkCIWBOy3CzSrKzhnBUQNW6CbIdOSZMzyXk9Pott/YKfO6ushPHvKMy3tuFp66CyiGKuO5oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LqOtuCAA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YMy0iX2G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LqOtuCAA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YMy0iX2G"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I9dRX5860380
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 10:09:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l7aH3G+YIfHjUylzEkTWI9QbsyYLvYVeAmPcb5XjIHo=; b=LqOtuCAAc+0V0MqO
	kjsdn/DItTqi1uN084zlypVQY/pCnPnuMgHsHdyMPRpGCfhcDV3PFA7jbiKzfehA
	OmC7uFYddN4YjWeG7Iu3YJwPweKm9SCjQ4z9pQ9CWJUVyth0QbbzHpZXUSHKUiKX
	7+DLKuc1xmRPUsoxU9v/HmEvEhSx03GQ1ycKWlQUH8H8BIcMMxRYpMroZPhupyz9
	tSnwUfyj2A5VzO4IcKOZfCaQyz3FlDt78mWpDl2s1XIxxnm6qa5qpRrvuYwZQF+d
	1vxDL2HKyBA4dEChamsSVhWKzZ94OEiDime8q8YNJShhIKaFEn+WnH6U4fUBQTnI
	NWbpDw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gs2hv86jh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 10:09:13 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939fc317691so18019885a.3
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 03:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789726152; x=1790330952; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l7aH3G+YIfHjUylzEkTWI9QbsyYLvYVeAmPcb5XjIHo=;
        b=YMy0iX2GXtjAzvm5rXlO49NWoYI+iMniGKqThv7I/lbn22EQHJvldrGLrB58Q52/Rb
         9LreUByFF+lIhy2zG3A3vxmf1UOMY7x+BuDF9lwusoVJcHCfbqf7leUhP0DuchEGnzxf
         hI4eKmHL1kUBe1TxkCkgxAEOBjFSPfWaDOvGXdljdqXCrXloFiX29UXwR7WVOt5dasOV
         hvOe8uYJjZvDBDDic2dqHTSZEgTcDDoYAML6kAr82/VKrZRD1AnIbXjRssB8V40I5gSh
         +3xDa6w11D61rZKgLc/Xvzpq0YMMGs7CXgFDZAX4a/OBAMOdE1tVz1QbGhtGnovEcA/x
         9yag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789726152; x=1790330952;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l7aH3G+YIfHjUylzEkTWI9QbsyYLvYVeAmPcb5XjIHo=;
        b=weSKCXRM/HGXsIqIS90yjrU1xzlLchNW7xjIZpTx/FlqankweE9PqvU5iyJfNBj9nE
         OyIMOZA3Oa/6E6GjQfE5fXKUXh5RaHp+nHtVQzB4ETxN3PPUXOrGpL+amBCe9+7RtTPa
         pemvt3swJu37i9IIlDmSqrF1T4qMU1Rp/X7aOY/kSbWEicgjLrIdVbYNqeb8sOttBrGT
         aoonk9WIU37f2sfKmHogdIQU/wYc1IodH9IS6l10UloUPOQboC/NNdc1isxF+nBOVaQT
         EYbivb8W6nS08FCHYhgFd+4tzvG7IV5DiLvREqhNvhRhUh/9I7easxF9C8joXw+sULUu
         YWhA==
X-Forwarded-Encrypted: i=1; AKwUvByBRSTyDiuD9D/MDz4lqBSNqQfXFiG04HTvOZ76vuXAffYuJmAH42sE5nsbO1ZIYndIlPWR0/Fd906A@vger.kernel.org
X-Gm-Message-State: AFuF++k8oe2Nf9t3YqsP/P7rUsjqktAoWKFgNZab1LltE16JGTB1a/QI
	os0QPX7X4rlStG8gO3ciJ1YAD42PnxUdnvvpJZH/rPEiU2R3tuTAI7Z7lIRcsHFPNWiuxdzNTlG
	U3Bv/tqa9gfTeHCTZ3fxoLJurq9Voh2AgDbU9vEqyPy3iWe+HqiVVtridux53ssBn
X-Gm-Gg: AYBFou1YIZ7Pvugd0kVAWxnlhyxSpFj6/72H9xSfEHNRW0GpW77ODieIpPcK/1hNa0/
	M/P0mjrdeMkpyjdsQSF6AnF4EnE5hTx538+wehLXZMTxEqT7roxBnR63rGSJNl3MwhKuxONj2ie
	ozkNk59COa7dKbiA+RTuzqXljIl0Iq+Z88jgUTyJTnDhDYL5Qt15iQLQ17LydBn/AaI8Ef6W7k7
	djes2eLN7sF/KvuGU4qDmkmEBFiy5qQI01EG6Wv831gBOLziCtETp+bs9tWYeyYuBh8IGMbJ6YO
	pSpEG6x6XF8zXPuqhmyQYQNRI1uADWR7s1lph1XDVuN27L3/7+TexeSHAgvdSxORZ6EckBP3du3
	3beMGW6REac2Y1oBZL2hzfA==
X-Received: by 2002:a05:620a:2704:b0:93a:3e11:e2f9 with SMTP id af79cd13be357-93bdc6df676mr293459585a.2.1789726152595;
        Fri, 18 Sep 2026 03:09:12 -0700 (PDT)
X-Received: by 2002:a05:620a:2704:b0:93a:3e11:e2f9 with SMTP id af79cd13be357-93bdc6df676mr293454085a.2.1789726152075;
        Fri, 18 Sep 2026 03:09:12 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a1bb88913sm40882766b.37.2026.09.18.03.09.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 03:09:11 -0700 (PDT)
Message-ID: <f1a7e576-b84c-40ff-b4dd-1da6bc0f3990@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 12:09:09 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/15] arm64: dts: qcom: lemans: Move PCIe phy and
 GPIOs to root port node
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
 <20260917-root_port_v2-v2-14-6272b7caae9a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260917-root_port_v2-v2-14-6272b7caae9a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE0MSBTYWx0ZWRfX9w3gdlHnOu+G
 q9ziHHtJafE5yyLSmipY/Y4ZP3gMzOO6g8f/QutNmQ5mM7QY53nRUYFj5EcrgUmUUUw67wGJO6r
 4MJXVRquyxZdyQS/QYyloRWOwmF4e/E=
X-Authority-Analysis: v=2.4 cv=IOWXmQvG c=1 sm=1 tr=0 ts=6aad0dc9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=CLDG33loBYVu3UNdBq4A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE0MSBTYWx0ZWRfX4xcppglNlTUF
 g9hhRDLncRxhPgJFwYs8VN0OuKrDiVKSakRTjYQvZedx2RthFmJYF+r1BwRHwP/+8YQ5vSQ0Nws
 FBOHAriRRINXDb6+euZJKOhz8ttHbJDpvzlmxAEY18Tr28m9omdSCq9hQatcaXdSBUm3ZpdPZJv
 YfOxZGrBzDjm6R+mTxeSNDF9CFGAOOB69Ja59ZtXlMRQnjiuAm8OgVqYDBHenCtJ9GoZfoYJWjR
 ijrJIWvG+bFL1McCjPAldIHyvorW1nT9ObCU20d0F1HPdVe3QBrwViziymFwO/sFrUUocQllMIa
 uIW1Sms0w4BNruwyA9NOCUKCs1AVL2XX4hyt9Nb239HuoV/RJcH9zbnUN9EdzT3Dj+IzCZsdFDy
 9HzZVoQcLAJtJ6thktcFL0qpQfMNGHDmJFmTCwkfUrJgxnB4Dg34IWFECUAYLKgX9LrkU9OyMOf
 GtffG2ZXopFuUIqGIsQ==
X-Proofpoint-ORIG-GUID: e8P9ypo2QZjPFL19TyMmedy8-MaxfZDE
X-Proofpoint-GUID: e8P9ypo2QZjPFL19TyMmedy8-MaxfZDE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0 spamscore=0
 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180141

On 9/17/26 2:25 PM, Krishna Chaitanya Chundru wrote:
> The PCIe phy reference and the perst/wake GPIO properties are
> per root port and belong in the root port node (pcie@0), not in the
> RC controller node. Move phys from the controller to pcieport0 and
> pcieport1. Add the missing pcieport1 label to the pcie1 root port
> node to allow board-level overrides. Move perst-gpios/wake-gpios from
> the &pcie0/&pcie1 controller overrides to the respective &pcieport0/
> &pcieport1 nodes in the board files, renaming perst-gpios to reset-gpios
> to match the binding used in the root port context.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---

[...]

> +&pcie1_port0 {
> +	reset-gpios = <&tlmm 4 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 5 GPIO_ACTIVE_LOW>;
> +};
> +
>  &pcieport0 {
> +	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 0 GPIO_ACTIVE_LOW>;
>  	port {

ditto

Konrad
