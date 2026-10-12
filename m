Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D473BB9FA
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 06:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791787400; cv=none; b=gH0ZitzxvMINDdRLZ6FPS8lSIu/VwpgCG9oim1eAc05WH9lP+/ArJ55mPFfrZTyi9Ic6o+/G2W+1m76lZEdGrQ8tOm+yybc0xeMlKYvikfAW9O0Na7uAmgcHbupwPZ9eF36OM0KMRl2sD3FjA1An5oaCkq/kWt7dJqmViN1nYnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791787400; c=relaxed/simple;
	bh=iT8Zllnsx06aEqmJ78b90QgkejKZANkL5dtvVz5wjGI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ov73gMw7IHlguFbVLjeDWAP+JlpQUreQvWJO5sVSWrK1vklYpb4Sje7u3oTlqN7Fmn4DfIH++e6nJotIRXtGtr9o69gzs8UrySfmBSQZBvcfIXcu9IedXB387y5cGkAbDVXEEkN/XbBxza7bWNfNMqB04DTKNdYW+g5xsNq1ggk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZZEsZ+4R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NV32MvoI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZZEsZ+4R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NV32MvoI"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C55vI44068720
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 06:43:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+UcS8DdSjOk8FBpL85zZqOzwaOXP+zI2mFu8qLHfSew=; b=ZZEsZ+4RcASTU7zJ
	JR5BjNX/RaPONI/1+vWFAdzS1CZXbuC4b4A7F64kk9wigiQ595s0+Md/U73FPeuu
	aYCOxQWFU1C47Mh+s34BawqciZlcf9jB1HETVYYNgtn4kjzHn6qq2L7OCksW9TgL
	ZbywMfk+8UP6S2guG25NArOiEkwxCFF8E8QEQV+pOIswXcghVMKMYTl0wFdeIL8g
	mGZ4S1QpnvihwVT/Bee5S18EfZacEi0mRLyuzMdTrsMnvwUksBAyfeM6qLv7FPtn
	f1qnMaDHTmna/9P4Bqi1qSB+yAvJIw9hYoTpGuDXE8YF0KBhfmzLiO+17z6UPyJf
	xZNtGw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7ehjn5yq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 06:43:18 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e8dd9b9743so3686455ad.1
        for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 23:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791787398; x=1792392198; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+UcS8DdSjOk8FBpL85zZqOzwaOXP+zI2mFu8qLHfSew=;
        b=NV32MvoIWY1Z2+Ak60TU2+bUh4Nkf/zkuIdQorh2BreKjOxTk0ucMrxTxSiC0JNCTv
         nsmI/eLsbLFewnwC6Rgvo0j6fkkfjhQPKvm+GBzSZOoa4IxU5sMuY0A92t6oZ9K2eBvj
         VozwMt6ColgQkll+OezvOvwh+lQtX54+XeeNiF9Auf3l7MQOTTXgvYOeScIOwq7CGaFJ
         5AYfwP1sTsGsHQCoNInzg+s89fa/sJYioKJrFscxyEQTIdpp3LLkkoOgNpU7z2C/FKjG
         9auQqayOJjQ12Z/Zg2uKAqKM6dS9ydEEDF91VoGGvh9ODD+9Ga9+GKdZ9RSzdewjwbyJ
         zqJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791787398; x=1792392198;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+UcS8DdSjOk8FBpL85zZqOzwaOXP+zI2mFu8qLHfSew=;
        b=ViOyaAK62H4N8B+GaHR6I9GFyu5B7he73DBQv4TdLugZUGRcZDd+NIuWRHno8u7rZE
         LQs6NF6KjQbRZ+edyCgd5oK2ejIUT5cfTByI+fWgsQFWCjpzZlPRNflFmFo4FVm+ujBs
         wsoX4LxLxGwINOljXcIXANEcNf2a+BeeuVGyVYDL0P2Y9fd2CXP+Or8nWzVD3K0WmxFz
         1pR9LBudmgY6BrfLTltCdmZvjIKTY2OOGRNb9pv63X+SYvKNu7IxtlNtpWCI0AZWBp5j
         tUK7HJjCEG7bQVCJjKw4iXo35/ErrxXPpMw+znLCzT9Wd5m2pq5moNAHzoKsCkcvsZQ2
         46uA==
X-Forwarded-Encrypted: i=1; AKwUvBzPG8LrKnY/QzdjmtFZtcTnoEckCjfMr5A5B4IQaagAzYYjA40F3LIVNsMW3hevhPahGnyIc3GnANoo@vger.kernel.org
X-Gm-Message-State: AFq9FYLVWwXuxDEd2Mcxd0mM9YZty9wqPRTn/NnoDAVKR5VXHJAyUa9J
	KJS7RRWvsRLW/FDUEHYrxQKhl135dFn6ks6hH3kJP6TvZUK+U9GWaiQGzjfOtx5AuZgSH396c67
	wwqzGm33U8OhHibvM6s57kJRhZfdr9SVIWwemsefhpLlKxd3jNgPv7fsYxv/sMXom
X-Gm-Gg: AYBFou0LrTCJs018sjGkiWHwwmPqPP7ODISb8jeS4GoWt2ew0fc5prkgrm5CtBCg9wx
	OmP3nElnFAMPDAquP+k9FftWTH5yVSI4AUgPv6A7gDVY1FK/gpQeQl3XwfeJKjlV/UHN4ucnRE0
	ctnZ3k3jcdDy9R4o02OW39bE/7swjg4bfmt2pJWjGhOidJ9SY5ls0gvwnMZhvqDcwjMjTM6OGr7
	YePCi2qAsH9MaQJNd/hKbwBOA98c3AGbvvUsyLjE0tnisRSg89E29Pm7lWs8ESNLOm3GFTxC9wK
	0Nsin8jy2dYxOx/nYcpj3gm2SiugKzYDdXoLtTWleX/BRx/4Q/EuIPa7kLdtZPwT2La/ls7mFYu
	QRvq4qi1Arwjt6ew9rGjK2vWEFzyaBv+9wg==
X-Received: by 2002:a17:902:ccc2:b0:2d9:2149:57c0 with SMTP id d9443c01a7336-2e842aaeb61mr76706885ad.22.1791787398032;
        Sun, 11 Oct 2026 23:43:18 -0700 (PDT)
X-Received: by 2002:a17:902:ccc2:b0:2d9:2149:57c0 with SMTP id d9443c01a7336-2e842aaeb61mr76706715ad.22.1791787397479;
        Sun, 11 Oct 2026 23:43:17 -0700 (PDT)
Received: from [10.152.193.243] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8421b0aa4sm38539625ad.35.2026.10.11.23.43.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Oct 2026 23:43:16 -0700 (PDT)
Message-ID: <3fc7d852-b36b-4d89-9e9e-fd690d258587@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 12:13:12 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 01/17] dt-bindings: net: wireless: Add QCN6432
 device tree binding documentation
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ath12k@lists.infradead.org
References: <20261008-mpp_bringup-v1-0-2c5797b5e4ac@oss.qualcomm.com>
 <20261008-mpp_bringup-v1-1-2c5797b5e4ac@oss.qualcomm.com>
 <20261009-brainy-alpaca-of-focus-31fbbd@quoll>
 <fb81a042-82b5-4565-9a5c-1a3c038a0d14@oss.qualcomm.com>
 <8befec82-035d-40b6-a3b0-f1ff2ec9e53e@kernel.org>
Content-Language: en-US
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
In-Reply-To: <8befec82-035d-40b6-a3b0-f1ff2ec9e53e@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyNiBTYWx0ZWRfXyYZglOGN3+FT
 CBqdIy+talC+uS0f2vAidkd66GDcRyl/BvRavSaY4NCMYX4BF8D7UHcwirO1buMKjNeTiSSFHtf
 aSdYlDP/+/bXUUbV+Hd0blothYLAodiKJeUchoZaXNgFkukxWxKXJ5H8P0xW9FuyhmpVp50qTVs
 QisuderM30dyTQBT8+Lf5AvU1RAROq84qxu/V/5XNkosyStgy8nHmiBexDVx7xdG9a5kVE3M2Ga
 tCxvs4AjWRg4qjZggT01oruhJusz13HuwMLogCYHJ/kqL+hX9c26HAHQnMhqEE+Uj7qt+ZdBgia
 /rCYDRHz8aer7PJ+9CH24giXTXg2PEg4aY1Ww8PMyroqd0JVlqP41pTgevQfvVBDTAocUnX6DKb
 dPZxrSSU6XoCqXz4o4p0WFmu6gcek2hxqYpjp+EP+6WJdx0CY5LrsDut/nwb01ORAeK1reI30X2
 1mv20pJBsqHjghvvU0A==
X-Proofpoint-ORIG-GUID: 97TVCivYM7b6Wn2TgrOmoe-olf-ZkXwr
X-Authority-Analysis: v=2.4 cv=MpTHeGae c=1 sm=1 tr=0 ts=6acc8186 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=iJS4XZidABw9b6rZcNIA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 97TVCivYM7b6Wn2TgrOmoe-olf-ZkXwr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyNiBTYWx0ZWRfX6QcjA3lJGb1Z
 BAup2brbbAiJCcxjuit0f53ZRJgXHihM6ZTWbIEyeoH/5IvwyZilxGpot7Fb+Utc5YTNNzHd9Sy
 WuP4GCiyLaKIoIGLASbQzv5GvvLsJN0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120026



On 10/12/2026 11:26 AM, Krzysztof Kozlowski wrote:
> On 12/10/2026 07:29, Aaradhana Sahu wrote:
>>>> +  Qualcomm Technologies QCN6432 is an IEEE 802.11be Wi-Fi device
>>>> +  associated with the WCSS Q6 subsystem. The device is represented
>>>> +  as a platform device and uses MSI interrupts for its Copy Engine
>>>> +  (CE) and Data Path (DP) rings.
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    enum:
>>>> +      - qcom,qcn6432-wifi
>>>
>>> Is there qcn6432-something-else as well? Neither commit msg nor
>>> description explain that.
>>>
>>> Best regards,
>>> Krzysztof
>>>
>>
>> QCN6432 is a Wi-Fi device supported by the ath12k driver, and there are no
>> other variants requiring a separate compatible string.
>> Hence, qcom,qcn6432-wifi is used to identify this device.
> 
> Then it is qcom,qcn6432.
> 
> 
> Best regards,
> Krzysztof

Thanks for the clarification. I'll update it to qcom,qcn6432 in the next version.
