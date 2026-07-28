Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BD4311973
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 15:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785253002; cv=none; b=pOUlqfwU7cXeKmNFyUT7igUcaih0zvUpe+4U3oofSVjeePJ499+uQKtDg/MA3K6k40NmPHQhtKgq9u/zHluM0tTtsGv6Z5sOgcGqfPqS/Qn+e5SN172ZfwZ1fii44mFMrW+ZQClvsrtF+8TZh2RsFyihd4fRWSLw9dK2pAezAho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785253002; c=relaxed/simple;
	bh=jTr4WS2NYmhdyKOHSsxcJ8Mk1kaJnfIYHHyXs2tqjO4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ocHrlDZre21ZrGun/1o2L3MKzp18rwoY2mpwTg1fzJlRj339PNTYSIs8Bdj8FbXspUJEGmp0NirF4fzl1Wv1/Bq4ciY3nZQofrnJKpZNbNAFzG9uqzLRLaTmgvMKDfhrrSPtTamRPFhZYDgd/XofclqfgHamJXkfHtMWBAXSVGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OVg+TAY/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SHCZbHcY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OVg+TAY/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SHCZbHcY"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SEcbQK3209106
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 15:36:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+tPfAbLZDTU3izOK/EgYpGIRm9s6aBpybhh/ZrMzDac=; b=OVg+TAY/dAw+y7Zf
	V+ME+TAlrS7Nvi9mdfUxLKowKBLCryrMu5XIhs6GFXnG7xAUWQjZJvUJfEFQaVtw
	6HW0soS25wnJmmfjnH/PxZ4BoU93lAIuxK1rd+0GXgAMD6DQz7KEqeRHsH+HwBLB
	eAFWjV+Gdem3Ectc9xH1h4OOJ7w0ogImDc6Ne0GhXaYpHWVxJAmyoLM/rcXTsq2F
	IIaA1givqxar+teuS7AIRXtdAZC3LEz/eAubtgGP6FV6ayMPKe5sDKce0Ktl7J2L
	elVWjWXK9NWJWoOc8NJK9lWJxk+9u6cGbndrfGjNA8xt71VBXBZvPRpC3wQgkXU3
	3zUdqQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpvtv8wq7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 15:36:40 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c21c01cf3so68857281cf.2
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 08:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785253000; x=1785857800; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+tPfAbLZDTU3izOK/EgYpGIRm9s6aBpybhh/ZrMzDac=;
        b=SHCZbHcYOq1DCafiGnBBHF0uWvddDSbxGJP8IBK3Yrq1f4lbHXgZrtBtIdEJr9thZZ
         /GIxjuZWVC5WsKlgvq5EnFoM3Xh4HxR95PhZ8IxIt/Z6NR4AFVxEb7kfflyX76Rq6M7y
         c7Ga/TRn8QdZbVJfCnCI4lfIVwwRFOPqlO1hz6qdJdMdM4H3SaBFPwDGVQr4Z+PlQ83m
         bbUQ3gfLe2qcjAmRmO5FfN9dkWUHLO0fySYNZwnHvg+yQ6M7jG9vnaW4OVAMo7NzA/F5
         eseGzhTZw8auf6bmwD6XNztJWzav1DKL+uG1WsLMkVfk0N/xJvjxx9CBGAsFGFVAtyll
         ax3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785253000; x=1785857800;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+tPfAbLZDTU3izOK/EgYpGIRm9s6aBpybhh/ZrMzDac=;
        b=tB8icrQ8cRVdwBdYPfw7y5Qcp3j/kVvMxEQNvQS5fvkYusjtfMBl5yN+7JRHV4LA63
         WVZtTRqAKwcuHV8HOWodZK++ZmKBawnCucCTeM5SKXXd3XWwwVuFTl+sRvH3PLblSgaE
         MupaiW4jKY/1dPll6hkaP/Q3cYZYCKOwu9YZv84greY3EqXe+QeMBxxvL1meoCMSZ1v/
         SHRib8GR+UR28R6giSesFj8eHe8jTesayykjs5vv2S5bXSjH+zO+7pesIzj/st5tYuKk
         mOgIykG/8pzn7AXQ6/Kxte7Q8CD2PPbg0yP626zJsp1zVK9GcCm2fW38hypQEsUMDvcZ
         YO/Q==
X-Forwarded-Encrypted: i=1; AHgh+RrDKeXIwqXXcuFzSW4zhkLbLqX/YZZufWOYe5lBu2vePz9syLpVuAMGgY+X24YQ3I1zy0Xc3TjNFGAm@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1xS56a4AYk/VeEmSExIWKq9LQoPxWsnIKQn6aWekw1CF5RmG+
	FUocZCNeC0gK44SzeM1KrD4Vy1eb2ixXesQOBc7a4S0FyOBDgYdRaSUblYoEBvB4k6eN2MIkNBb
	DSj0QZ6ZHg5L39iOloJYENvnUE2acs5PYm0fZHn00Wg0JsIHcpwUgKJOV3OuRLV/d
X-Gm-Gg: AR+sD12OZG/d1vZ7Oq5ushKC8E2Yi/KE2Pcc/QwSTkaCfRoHkO7mlim2VJpVACTcWt0
	YGLyuI+z9KB5Ypjtqz3pr4Pyzv2Jx4DlL0KlAE+/RgsvjOgvR1LVGJvchsPaG6ncGjjj2kXGall
	uVOlZXvr7w91Xqw1RxxFfe1/YlHfKsBuJX5spXlqaAWFPfGfJ1BzTk5AwJg2eJPeD6Iabkno3A4
	Dt/zwcMidZbKyQvWcldYF7XXTsiNX2/0fxskaruBc80RzvplRVPUc5fFQxArBN+iHljJR+SRhj2
	Kb6a9+QBwhguT7eRt86bAw5QcUgifTQM+g6rESfcsllbTuSBFKIE3zqS7kOLLdt7WWsX/MvCjZV
	qsaLL1w56/pyzFSVFTmLH4ELZ2tkNO/L3fY0cl9s+Mc9hs8cUCXn5ih1/g6EevDi5xjxL
X-Received: by 2002:ac8:7f14:0:b0:51a:8c97:fb90 with SMTP id d75a77b69052e-529d71d2b65mr25828271cf.57.1785252999677;
        Tue, 28 Jul 2026 08:36:39 -0700 (PDT)
X-Received: by 2002:ac8:7f14:0:b0:51a:8c97:fb90 with SMTP id d75a77b69052e-529d71d2b65mr25827731cf.57.1785252999103;
        Tue, 28 Jul 2026 08:36:39 -0700 (PDT)
Received: from ?IPV6:2a0d:e487:237f:3a69:9c1d:e9df:6c3e:258d? ([2a0d:e487:237f:3a69:9c1d:e9df:6c3e:258d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c4443396sm97758175e9.0.2026.07.28.08.36.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 08:36:38 -0700 (PDT)
Message-ID: <fff5487e-5c0a-4567-bcc0-3e5a083c4e75@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 17:36:31 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: thermal: qcom-tsens: Document the Maili
 Temperature Sensor
To: Haritha S K <haritha.k@oss.qualcomm.com>, dipa.mantre@oss.qualcomm.com,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        manaf.pallikunhi@oss.qualcomm.com, gaurav.kohli@oss.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260619-b4-maili-upstream-3-v2-1-e54516c37022@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260619-b4-maili-upstream-3-v2-1-e54516c37022@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 8MoX6T7r4i1YalyUJgpCPnPbnYZFb3d-
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDEzOSBTYWx0ZWRfX4FTZR6IB6HXg
 soskKJnwPFqAQLQTzzdS9+3jI4lIIsoyBPuo74C7eKcSMN2slW4mqK0if9MOoJSDqYiNDDME1YD
 X4LL2Ux3lOrFL0yUqCOZpMjvP9ZcMgQ=
X-Proofpoint-ORIG-GUID: 8MoX6T7r4i1YalyUJgpCPnPbnYZFb3d-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDEzOSBTYWx0ZWRfX3oLUk+uYxdlB
 nznBts0qwSNSyeB+mxgb76DMoslWWcz8VgeTNyvt6Hk7xCy/Yfd/G5ctcrYjK0Nl85TUp5r517y
 N+8dECpGXfKmTQ/Xrt+b9Cl9Nfz8MqmyfEaMFSj61iSbKgyRMUR4JbqPhzzMPE6hCZ74tK1gopm
 nBT/kS7fSOSeRWFc6JiTenEUAKHozitz9/Nz7zy2tbE7lVmxzNEI6ryejzaquQMya7GG1YEzARv
 1B+6LQiaRkPhcaVD+6UDzMgBRdB8m/IMdRG2aX18tClSBo+m4qRLZoAwV0O3Qa2ovI4JebHbzcf
 hDLIlw3B1JTTVJWFvevhlynZPrAc0/EY2NCsYazDZxpdJQWap9iVC9hcuP4Sv8PsqZAWQUHbCUG
 A/NELXGp3XhBL9TjHBDQlw15yIv/tGH544P9hr2WpVSOnKha+v++ZTtBqKu39dY4sn5IwPY0EMO
 1kz+z8Io5QzEy6Lc4XQ==
X-Authority-Analysis: v=2.4 cv=dOiWXuZb c=1 sm=1 tr=0 ts=6a68cc88 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=_eGdy_ivWqBgClNpbDIA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_04,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607280139

On 6/19/26 12:20, Haritha S K wrote:
> Document the Temperature Sensor (TSENS) on the Qualcomm Maili SoC.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Haritha S K <haritha.k@oss.qualcomm.com>
> ---

Applied, thanks

