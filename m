Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4461E42AFAA
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 15:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788276295; cv=none; b=BhU7BM6rW2cehWQOGH6b3ZuW85m8mSIru0lF7J2kojAyuKqN76IQJMMcLkoJIluCyY+PWN81NE0DEtRXxGQouiTlaUrSJTeumO3rVxmvmRnZwztgyXH18eC9GGZgsoq5GyCpv+mNeLlstng0zvvjw1nsY9dRmXXzNbiSeRpxv7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788276295; c=relaxed/simple;
	bh=pPhJgHfrcROjobsHow5Oxnu2biZuSv+iISwhseA3TaQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IjwWu42vVxEofdAISinHCN2l3YkFouD7ZFLHg2YYZKDrMFrN24XwJOv361Tmn96+66OeSS9a5k7qTmfAiXXLAJngAK+zTLgzKXJ02ewaT3bTYz7kf0ISUQl6hd6XIghLJ0jspxNafLF9rUpgRtrw5+ly15ClRYSGu3FNMkImQro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=muVxvYW2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QctJEbvY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="muVxvYW2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QctJEbvY"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E9Rt01638686
	for <devicetree@vger.kernel.org>; Tue, 1 Sep 2026 15:24:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xjME20aToxnhz3+QwdAGYRX2CsUKY1brED6ajTqF4qw=; b=muVxvYW2xOTh1Qh8
	0IdDOqxK6W9136XN64vhff6g/0bs3E5WZ9lhTvPtqZ9BimoTidDmlRD/NvyGoT3S
	1qcPEAIXiXhGOKfe7XvbARI/3pkEtQWTSSl15fBgK3eUFBAhy/FO43/KBuq65bEQ
	h0ma+KnYAykT7tgVNmHsAaFibQEW+Tz8y6RbaVtg3Enj9wUjiPId7Eo7aXGjBEmu
	V2ofuDssdH5LrFC1Na/Pc3DnVfQIH4SQDEb8/QxgohVkKIrRcxFIKfhG+PSwX40T
	oOelfBnKB1wT4yJCJKARkfXCWMiIjxPWSDbAWQaI9RAgW4CsuOkyLRQ6pr3VseK9
	Bdm8+g==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdrcsjmbh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 15:24:53 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c59dc5aa18so3126e0c.0
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 08:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788276292; x=1788881092; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xjME20aToxnhz3+QwdAGYRX2CsUKY1brED6ajTqF4qw=;
        b=QctJEbvY81cOCnJ/Rf40Peetm5QAQmsYq+lqzVxjjlT6fnZfdiqbEVdc9xUbHy+l7A
         Rt/Kb01T7s+y++wN4lC+QtH4Yx7hqPc9475KWDeTWZp7HhQ97PrJaTsjn9mA6YRlQBPI
         Frtd5IaUNpwy0O69mtN/ZYOLYK5UILy37gKUSFhre7OVayvd3pWvZYk7pCsbnO3t+ST3
         pW+OqWsAPFp6ZKmMxmvtPnXQq0s+B7gub8LiKtzwn9U++wvc+WgZ8tgdFlTwajH1VUK3
         YXzSy2id86OySDDNUrUa+IFolA+SzV42HDYS9u8uNGK3JuKC2mThrysZh23CtGqRyPCY
         b3QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788276292; x=1788881092;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xjME20aToxnhz3+QwdAGYRX2CsUKY1brED6ajTqF4qw=;
        b=B60CpHDyyDUJzt0eT0fND/YKrpFQuw3w0E+wiSRNHbSmOU5ayXDiMFlktp9towKWxY
         GQHoTC8fvXqkUzuPPAi3cKUFNK2FUm3bqr4FGF8OfHcc+vPkhRplcjOvfKV3n5ttlsg6
         2vsz2ipPlwNC+QUYHUxAPrdIl4NxqBM12M5kD039l+8uOBBzbJ8dLC69jHQ3wf98twng
         QeVDSTJPcqsQYuwVJNbHjTld6sc34mai1ink2RFza8YbzM3PuNbBxG0bFxoJUyu2YK3J
         16Sbhfhdysv2aOIY8mQ1h/5UhiVGFfI6kFk4Fkz+rgiHmgL2wroZpJpnI0lH+Ssr18Re
         Qm1Q==
X-Forwarded-Encrypted: i=1; AHgh+Rov95Ku1iYYq2V/iRxaby9Xm3GJIDuG7C1tUVu3owfGgXM7oGRVkjLcIqLwDbwNdfOvwaP3Dv39mnh5@vger.kernel.org
X-Gm-Message-State: AFuF++mD0tgIBcLqxxxEZOdNU03z+vbXU41YH1mk13D/+vdtE1rHzH9c
	CNT6I4BmDRxAXhyV1+4qs58BCvhswr6wCWlOeRAoEJn5oqaOu5HPXr0hhg5OjwH/Vt99e0bghzs
	8fQDcvEKD0zbLpyhXgmLIZcxXfmeiaccN6hFe5F+8L0ZxZ8hBqtqpm9o+WRAP6M9a
X-Gm-Gg: AR+sD12hK1L6FJNNpr8RgggHhzGZTLKd5iThan4pFi5aKJZ6/EJ6JHYF0gzRm/9F5J4
	Decp8WQ4rj5HQYC7oW+u9D5P3tw3qJ/vgQFCYebM3F9/jrv0/fY2NRHa3xtN94jcx7ntP77xfCC
	WLhv6wDnXWR2few9XoQwfwJyNIDXvkSE2OAFKmt/pQovyYoKZEHZmhTgk991jdAkCivtnaXR7Nz
	OxtAYtnGTk7gNC81QaCBpgR7zru/jW/aRK4YIVeXymXx2PmMZz6nKGmIvRoJBc6uITDqZorDnj6
	oRxQ/dDIdyTuxR/SAxAVc8iJUILVxuJBkZr7ZSsiZp2zu06/yXEcCISNFMCxe2OreVzfR74haYg
	ZsOMQGs3SLGTEzW8LkCuTHw==
X-Received: by 2002:a05:6102:c16:b0:787:74cc:2b68 with SMTP id ada2fe7eead31-78774cc2e65mr3308974137.1.1788276292418;
        Tue, 01 Sep 2026 08:24:52 -0700 (PDT)
X-Received: by 2002:a05:6102:c16:b0:787:74cc:2b68 with SMTP id ada2fe7eead31-78774cc2e65mr3308951137.1.1788276291866;
        Tue, 01 Sep 2026 08:24:51 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a34a8f03fasm294011fa.9.2026.09.01.08.24.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 08:24:50 -0700 (PDT)
Message-ID: <4d96c593-ff1b-48f7-9e33-ded415056f99@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 17:24:47 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] arm64: dts: qcom: ipq6018: Flatten usb controller
 nodes
To: George Moussalem <george.moussalem@outlook.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
References: <20260825-ipq-flatten-usb-v1-0-5c1f3170bbe9@outlook.com>
 <20260825-ipq-flatten-usb-v1-7-5c1f3170bbe9@outlook.com>
 <bfb0d840-fc9c-41a2-9b05-959f2222a298@oss.qualcomm.com>
 <SN7PR19MB67361579E71DBC197E21F44E9DAA2@SN7PR19MB6736.namprd19.prod.outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <SN7PR19MB67361579E71DBC197E21F44E9DAA2@SN7PR19MB6736.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEzNiBTYWx0ZWRfX1PGoDO3uggpl
 QIwSkRIRJjrtsjtsuQj5302IYWI7uxLQAPWzmuCtxGZwTe2BujgRaOA60RbyzJFQKYRnw+aru1C
 1pRqnjAzOT3Ccs5TXDflAZ6S9rs9sNY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEzNiBTYWx0ZWRfX6h1PQkOdsbYg
 gu2Xt4l+p1dw/O3Sxl4Mtca3tOSU+xweefyBK7IKPdrHHvt5VlWNRqhV27XbI2HFbjaTSFbZDH1
 57SeKFKwjZBjzMvd3xm8nTvgjek/lNIFfaZJyRb/15SXGRXd30DpkR3sxdrtsEenO0BEfvh5r0d
 vkzlWWQjiC5yiT9fL+l0S9JTxRje3ao3+lJ/m+ffhzgRUxDwDOUWITyLecgV7P0G4l6JsdkmKOd
 JJvbErofWeMIiymeT9Lz877LMobk6XsKmtJZK+c4sEV1moXSFpYzAELOY8/F6fyv47LYsaKVi3o
 fq+lfOc3SF+fy4U7pyuTIX3oXuepYOHWHmamfxv+ydRov0fXZsUvy0yPm9oPY/yHcCPAvqBCB/X
 23Za4J/TzLZPUt5JxeU36TSmMQujWRN4/z1Tp7uH002Gp/7AdPYy5ed90CXOFdBoAxBx91iMVHv
 BGLCNFTB2Gvt1aVqKOA==
X-Proofpoint-GUID: hE1JqruYrr0x_l6x9dURnskgKaojbGI_
X-Proofpoint-ORIG-GUID: hE1JqruYrr0x_l6x9dURnskgKaojbGI_
X-Authority-Analysis: v=2.4 cv=QsNuG1yd c=1 sm=1 tr=0 ts=6a96ee45 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=UqCG9HQmAAAA:8 a=TRAoSw-b2ojpbG_mUrMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010136

On 8/30/26 5:12 AM, George Moussalem wrote:
> On 8/29/26 20:48, Krishna Kurapati wrote:
>>
>>
>> On 8/25/2026 4:12 PM, George Moussalem via B4 Relay wrote:
>>> From: George Moussalem <george.moussalem@outlook.com>
>>>
>>> Flatten usb controller nodes and update to using latest bindings and
>>> flattened driver approach.

[...]

>>> +            tx-fifo-resize;
>>> +            snps,parkmode-disable-ss-quirk;
>>> +            snps,is-utmi-l1-suspend;
>>> +            snps,hird-threshold = /bits/ 8 <0x0>;
>>> +            snps,dis_u2_susphy_quirk;
>>> +            snps,dis_u3_susphy_quirk;
>>> +            dr_mode = "host";
>>
>> This controller is DRD capable. Please move this dr_mode property to DTS
>> file.
> 
> dr_mode was already there. Removing may break existing implementations
> and should require a separate patch.

"Yes" and "yes, please"

Konrad
