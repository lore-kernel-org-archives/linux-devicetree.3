Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3823EF0B7
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 16:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778084907; cv=none; b=Qf0jqSLoVJNYHaUpzi++De31uDkrM32qQWZwIH6VErRriLOScLYJ3iuOIxuq7r78wWAeBy11t9WgTzZSnkfw/B907ZxXsvxHfmDXBIHM3VmkO2gVUiFxNqZItIU2Xx3Zks/j3O1szXPTb+9v811gb2Lbg+R1CtWQes7TWCs1Kfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778084907; c=relaxed/simple;
	bh=QYVtzd/xc7fLQtZMy6ElulTvtzvDpcvThePe9t+u1iU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NFDD0qb98lLL2swOs9Nh5XrIPbBuyCIh+LK/F+NDFlqeOMG55CIwz0J0JmiXCD0YzU3MS8rgn6YI9DllPN0eFYNSZmD8e9BxqcUQR81kJ5DkLS+QCaTtqipCtDmmn1jMbLjZmBsJF+vWMthR1C1yMvsRljDWTsPPZ8d/pfYUlNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m+4PBVCj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=diXgGgx+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m+4PBVCj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="diXgGgx+"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646A4iPc3524255
	for <devicetree@vger.kernel.org>; Wed, 6 May 2026 16:28:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QYVtzd/xc7fLQtZMy6ElulTvtzvDpcvThePe9t+u1iU=; b=m+4PBVCjRBUt8x9Y
	1V4nTnB8Xt8sh0FUCkGcY6iMdibhGGM6ZCSfLGsXjpgwBpzNbBJqfigCaWNSfgA7
	fkdoh+95AtuqpBEhTd4EwB7rt0ZSCnDVfYLZZynMPrtVmBJ/T/4FbcTnyMONpYnc
	+cEoGx1eBHT7GJKL402X4JQZBh5EQbW8kUGja2razBFLZB6Rq+ukNtNi6hgH29Df
	8Ug154SyyiHoBpX2pDqdVJlyBC1pVPJdANWUFRjVzVSXtnGhabx8y7im4iDrkjHr
	es8/Uq90zcIswIcITlJGHHgJ5P/92WUd/S+EJT/Zq+X/JC5QwcAG1uOBmgvwWdMY
	6x0MhQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e03jwsesx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 06 May 2026 16:28:25 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b9a6d84522so105248955ad.2
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 09:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778084905; x=1778689705; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QYVtzd/xc7fLQtZMy6ElulTvtzvDpcvThePe9t+u1iU=;
        b=diXgGgx+nQcGF2KOE0gukhBlZFgL3Zyqo4bDQ04bLyqfGeLUZcO4/X97qKyQaHhdhC
         Vg7H/UIzbxNm5zwyco3S2Bk+L6u3Qrd4G9AGOhJW46gGWnGRjRqb77c3sYS+kwG+cHxJ
         BWrgqYcgdswq0SIBO7VNdq/yRo/Oq9DWekF5BDuCKhCZeJYi98dOJCiBuKbMS+tZ8g2a
         1X5Ph7KtOHzE3jF+OriT78i3Nxdoh4UI4CebeMnJf5u1QRVXOeQuHPrbZpk2YIiYPxy0
         6hMQbU6r7+Ftz5IPZqxlMFaE7YASLw92AwAw008qeeyBOMH1iVv/yyRtMWTABF3w0/ie
         kLDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778084905; x=1778689705;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QYVtzd/xc7fLQtZMy6ElulTvtzvDpcvThePe9t+u1iU=;
        b=ikLcbwALvyl/Gsgnfou2DOkMZm3OrFmN1DUBRlThSiEp+zx1aHascpbbPhsZPyffZ6
         Cfw8Edy8QtsmbEhOSC0/GciYPwcsFEnSRYS2QT+DJ9WHT43zIEHwaPcj37cC+kE9WP+0
         7GtWLEqIxYWZ/yXn/8Am+iEwTiaJA+tyVZnQc6T+jLGdbXIAPwh1DP/BCNWIWqoGRsRs
         943LkUtDx9NYASxsCESOF85e6EfKonCfPq9SENBkmAYKYivuHAYBwwgLL2p4Iui2dpuf
         DfhYEyB9ubg/+pc/VvQZDxdbZQX7XXWPcXpxrWlxfu5Z7h2UFwXvpYkS0FCivWTddVne
         vjAA==
X-Forwarded-Encrypted: i=1; AFNElJ/9YJxPJ02Uq2Sri0GKm4gk+awisYlJms/Az/qElTnJUVfRC5YdJstID8nfWq8n0hDGR0sL35lhZK1G@vger.kernel.org
X-Gm-Message-State: AOJu0YyabhOyHpQgfxCEoRyOFO1uHA9vbWmYzqI2CKE+wkEbFG7MerbE
	7oX1cr/pNELUlbvFCcoUk8w67JU6IGT1oifUZYgNm8Nb0dSa2CDb/HJjseGNEb6xM0g2ObmaUXx
	MnGN3UE6zAxP7YTDX1GMeYQaga3TOC0lJD1SIHVcN+84zFJuCac5IXUZdVwNApxFn
X-Gm-Gg: AeBDiesRu6r7Vm37Wr3BjnXbHiG/3fQV9P3K6o9yK9nqG8Rk9YFiG+asZwDn9or/kXS
	3CoGSwCJQ8W0wGwLUelyueuJBttCKwxp7wJhk5NUM5KDi9yfOa9lCfoW33lCbi4OT/OzQXIbFpE
	d5vgkBKwt2ONHp0BGWytxGotqyfB+xZNr7wbjF+9tKj+7pgtRNhtS/39z+4dFYd4W4WnQ/hDiit
	+WWd92daNtdFrDz6M0aUXnxz1MaUzuRiP1C61Zs4M8wra87LJ+LMSJPYyg1yVSgugIPRK8zmygC
	veyJP2ptx1y+/Lr2XA2yhtsBbo4KFNl1Fj0fMt7m9QCyTQ683kLIVMGBMLp30aArPYCymYg0EaN
	gLjWrdCVDFCdbhSrDX3adEY/Xic1XwVNLbTpPbCrVkROrofGAe3tRVjuF9w7NFKu1
X-Received: by 2002:a17:902:ebc3:b0:2b2:3eec:c75f with SMTP id d9443c01a7336-2ba798a9396mr43247235ad.28.1778084904622;
        Wed, 06 May 2026 09:28:24 -0700 (PDT)
X-Received: by 2002:a17:902:ebc3:b0:2b2:3eec:c75f with SMTP id d9443c01a7336-2ba798a9396mr43246545ad.28.1778084903722;
        Wed, 06 May 2026 09:28:23 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ba7ca106e8sm32048405ad.62.2026.05.06.09.28.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 09:28:23 -0700 (PDT)
Message-ID: <bb008913-1100-9b8a-c7f5-1194df33eea8@oss.qualcomm.com>
Date: Wed, 6 May 2026 21:58:15 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 02/13] dt-bindings: media: qcom,venus: Remove clock,
 power-domain, and iommus from common schema
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, iommu@lists.linux.dev
References: <20260505-glymur-v4-0-17571dbd1caa@oss.qualcomm.com>
 <20260505-glymur-v4-2-17571dbd1caa@oss.qualcomm.com>
 <20260506-inquisitive-wondrous-lori-a9e639@quoll>
 <455376f9-48c2-e663-3be3-fd310afb7f7f@oss.qualcomm.com>
 <333ba4cd-8168-41f1-afdc-348f99ed0611@kernel.org>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <333ba4cd-8168-41f1-afdc-348f99ed0611@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=J4CaKgnS c=1 sm=1 tr=0 ts=69fb6c29 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=Ao3bqe3Qqjuf2QKdZGMA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDE2MCBTYWx0ZWRfXx6qd8Bs/Zo84
 5TtZnud/H9ldUkQa31DWjt6yU0I2zWBOeblWKjM8UYVYrNCjuOuFHL73J7UW4/k7Lg6xjF5o23Y
 Re9RtcmOQmtqmVqPFSWdMyZt2YlYSSsRxsijzRr37WfcoXnDIbSL6bcU+/Plz1KrUC+kfO7/xa0
 /EWI8Vd1/lPCbknQBzMnVNxVOXaY+X12BGXKwmfpIrm0aBeXINSLPsqZC7lBRadMax4HIgmb3o5
 FZmsCAqe6wnihls87h17LNT0t49xG6T1K9b2kUyl2NSZhe1a0mYSoFGgWobxOuvY84J0qWnZN3P
 BCvusblmnjZjsWCkdaFl+xCzOPMIKAxScilXUi3KLHLeyRWKWpwaqNrmiuC7PVwKGxw802Vos6W
 hsaDlUDtRWLggEXIssot9WPeVlt9eh2Xez0AaYyKGPp7nllq3DJ7miKPoou6SpCJnQjqpGmdfi9
 Ym38OTyvaMbZIlCa8tg==
X-Proofpoint-GUID: MSz8M3q-MlY0BG3zrDgpmq3EffWnCYD2
X-Proofpoint-ORIG-GUID: MSz8M3q-MlY0BG3zrDgpmq3EffWnCYD2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0 adultscore=0
 phishscore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060160


On 5/6/2026 6:39 PM, Krzysztof Kozlowski wrote:
> On 06/05/2026 11:32, Vishnu Reddy wrote:
>> On 5/6/2026 12:11 PM, Krzysztof Kozlowski wrote:
>>> On Tue, May 05, 2026 at 12:29:23PM +0530, Vishnu Reddy wrote:
>>>> The common schema defines minItems and maxItems for clocks, power-domains,
>>>> and iommus. This suggests that the number of these resources can vary,
>>>> while in reality they are fixed constraints per platform.
>>> OK, that's interesting approach. I am fine with it, but then you need to
>>> remove these from "required:" list as well, because requiring properties
>>> which are not defined here is not the most readable.
>> Ack, I will remove them from "required:" in the next revision.
>>
>>> I still do not understand though why you cannot just grow the properties
>>> here. The point of this schema is to define common set for range of
>>> devices, because all of these devices are supposed to be veri similar.
>> If a new platform schema uses this common schema but does not explicitly
>> re-declare clocks or power-domains, it will inherit minItems and maxItems
> But new platform MUST define them, because each platform has both clocks
> and power domains.
>
>> range from the common schema. This gives the false impression that the
>> resource count is flexible for that platform, when in reality it should
>> be a fixed constraints.
>>
>> If a new platform requires more resources than the current maxItems (e.g.,
>> Glymur due to its dual vcodec core design), we need to keep bumping maxItems
>> in the common schema every time a new platform exceeds the previous limit.
>> That makes the common schema a moving target driven by platform specific.
> That's pretty expected, I don't see a problem in that.

I am fine with increasing maxItems in the common schema. I can set it to a
reasonable value (for example, up to 20) so that it accommodates future
platforms without frequent changes. Anyway, each platform schema must define
fixed constraints, since clocks and power-domains are mandatory per platform.

At the same time, I am also fine with the alternative approach of removing
these properties from the common schema entirely, since the fixed constraints
are already defined in each platform schema.

I'm fine with both approaches.
Could you please let me know which one you would prefer going forward?

Thanks,
Vishnu Reddy

> Best regards,
> Krzysztof
