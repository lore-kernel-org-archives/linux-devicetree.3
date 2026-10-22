Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792659718;
	b=CDJns/TMOAfVLSsiJ0bOJtjPHC4bMSrI2Cl7bqCTKo+FsdZIsqiQZ9uUZ3nge7YdyfTh
	 oUj1VRKt//XvjFRv4fbhJC+66vHdImCm72d5Jl7f/UqpFoVyNW6RQH01WAIE7mKBm2vEn
	 V0G3P5TG0CZxgyP0L+VwZxxfZ3YLlQJoCU9JeXW6IUTDD44sByLPIYLAmu1XHXw9GxhI4
	 tfF/t2tFVtdIHPNY6Iyt0aG8SI7NJl41b6DUvw5JvAyIT3bv2MWsFl4ZAc0y2Fh3BrLa3
	 NzDRYKqVNfk36Wzaswq19Ax2P2O5oAI5zRfHAubk5oJTNei+aYTEJ3NL6sxP2y2chkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792659718;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0I8xuwfQs8v33QT1wAE3DJ/yMu5gOBSm0L3A0Ja5e0k=;
	b=ClGti15mHKEyPnlX+BL+ZpThDgju4ctOhNSU1hLVSJq5mED3BIrJHGXYq3pLMprh+AHM
	 yxXJktQ/4Cpf4G1qFI1LhxyGSUl2rFVsKWuVo5c6jSkDLMV+JnY2EFjDPYnbU6b2tW0pp
	 ejnKvOZRIYsTh62781cwH46KwyPrGsbD5rDOd4xUsjiC0Y4UoM5t9Q0CtBQm9LpM5hvUm
	 Y98ICxlk989whAP47ICAj5+YttKfykLAemAngtVx2rT+Mq3S8lciVSM0+gwGnNFTX4lAg
	 +UQIwO+I7j7eptmoCL8q81oRU0/JgBpl4PdGdyTU1lrAQO63Ruz9MRV53wuScUpT52g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HMPoQa2g;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LEjBTUs4;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B089606A31A
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:01:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B089606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HMPoQa2g;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LEjBTUs4
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M705Ko1995955
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:01:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0I8xuwfQs8v33QT1wAE3DJ/yMu5gOBSm0L3A0Ja5e0k=; b=HMPoQa2guFdKcKJ2
	G8GejBQwAZfoxwjD6s+wDvWlEfmNChBNdsPgLiuINwK0Wm4CJsw2J6NCpLBrF4H3
	XXHfLsVJE+tYVq/P6iUmb2Qat9w7VzhIQ6hcfX472BSG1JJ/BLa+BglC/NHOS7+u
	O1APBbyb9DhHGCfilCdjyzc5s8SFX/FrcXbPKBK2k6inoeoYglLc/mfaF4Ac+EmJ
	R9YUGCjvL2/ZTjlKxVRVQlkAuiTdiI/L6EC4X7V9p4vTbhIOPp1COojbYdOPqIbj
	zuk+Nb97SgbKOEVNmqLkVT4NBH4kcw6dtADDSgUjs2JSwgPGMt7q3oEqVAHuNy2h
	6c1UNg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bsj4y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:01:57 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-990758837bdso22681241.1
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 02:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792659716; x=1793264516; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0I8xuwfQs8v33QT1wAE3DJ/yMu5gOBSm0L3A0Ja5e0k=;
        b=LEjBTUs4gSLMnZVa7pKvd0iDicVuN4kXD2/hXkx5YUYWPL7yhjkXTZ3fdFu6GdUKCm
         xh0L/MC2RIYobQ4ehnwBWxgMdWgpfu0H1NS663dotUnpfkeB4tYvbgxCX1JEuOK/8FvM
         JrQaqnI1DdnVK3C+Mjfw1onHsH51MyazQuezxcOA63OZ0DedzhQd/j8W0ivR7L4wA0DO
         wr15OYnx5ZSq3a8D9+x2UwSgLJ2fl7WZP0jP4EmiQYSuI/gZ2sKMir34sP9+nhuTd7b7
         Jt1FIAG4PNidBdYrh6mtNs+D3LqBSLdIR9QHuFf0R3NFlRwWqQ7WQ8I0ydEWol9KUqI+
         V/jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792659716; x=1793264516;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0I8xuwfQs8v33QT1wAE3DJ/yMu5gOBSm0L3A0Ja5e0k=;
        b=gXXCmRKXoW948yrsAgl5jPBiWGbCtQHRkqXOf9yfDnzNnCYyaVh35xVQ504LW0T2WF
         KdJnU44Bs5E9Mv2dWjIAWdqrvNxhW5iK1Ts8fSTVVIFUBV569ZH96eVz0aUOr2lRx4n7
         adAkEFdaGovo/qksbhUKA6Iypt+vxL90A5exNxjVf+COusLRUZdRybVqiCJfKsRS8l0+
         NYYeytbRKK+4qyfj6u7PgANypM8W78o9GY6wNbcUNK2rQAQx5ujBdxJu6dm3hV1AZBTL
         6cr9z9qAN+an/SIlENKaCN3BrCHhCCbMRYIoEnLSdDrDqBK6DbGph56ir9bpSLQocygD
         y5Kw==
X-Forwarded-Encrypted: i=1; AKwUvBxVgl5ckn1kSerUe9mfCO5IpxqBC4BAWRxp45OT8eLTszxYLYp2yyyGCoGIB0xtVzwoiPsbWPZqh12w@vger.kernel.org
X-Gm-Message-State: AFq9FYIBp43zgBULeYlf134y2no3wmnG+hLV4J7X+NcvWbyK+m5oRqf6
	8y8Xdq+L7BgPyGZ0s1toNx76CHynzZh6ZNxYwqM1DxVTc3944EwTs/PIDGYBvLMxtfGhrbovq6q
	8rAmTFX7EPODhVj6L3KAA9uumj0TiWGH5S0qf9pT1eSqZToECuPSnRVvUFMVfxZwx
X-Gm-Gg: AYBFou0VlUCAFzcy6gnFFa7cFxGgSTOv0sL/d3IWqqWXMZfQsYS6BHmAnWyvHqYio9i
	WeTJhy0slmgxvh1TyOJNLjwFqpjhsTCWo3F3ZjulrgrnxZ9hzeAlQaiVLUnOOYUwNqpqb67d9/P
	1EHUSes6W3+0EjhJum1DRz+uyx/6ra+AZxLrgHUQCumrfiIsEf25wkb1aov7u/QfpMF7+XYqG1r
	UY5jdDR7HjkdQVo87WPnGrMEe4KEBQ1Nu7URTr2bRuBR7JOCHqfBMvepgVXmmmpsoWSBV5sX3sR
	YvJhMbT3iG0LeaN02lwmDVlhlOEipKROeFk2WRTdLj0Zv18rZY7myHYOGRD1qVxzrufkjtegvgZ
	AG0XJ1abPKmHyUxP74HuNoA==
X-Received: by 2002:a05:6102:2d04:b0:7cc:22a0:de89 with SMTP id ada2fe7eead31-7cc926699a3mr1620660137.3.1792659716426;
        Thu, 22 Oct 2026 02:01:56 -0700 (PDT)
X-Received: by 2002:a05:6102:2d04:b0:7cc:22a0:de89 with SMTP id ada2fe7eead31-7cc926699a3mr1620635137.3.1792659715973;
        Thu, 22 Oct 2026 02:01:55 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a55c001sm82124366b.31.2026.10.22.02.01.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 02:01:55 -0700 (PDT)
Message-ID: <8750ffa0-33bc-48c3-b136-fd3aa4d75743@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 11:01:51 +0200
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
Subject: Re: [PATCH v4 5/6] arm64: dts: qcom: kaanapali: add iris video node
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org
References: <20261001-kaanapali-iris-v4-0-642f9ac5e699@oss.qualcomm.com>
 <20261001-kaanapali-iris-v4-5-642f9ac5e699@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261001-kaanapali-iris-v4-5-642f9ac5e699@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: dxiY4dcLXILRFp6K9TV3choztKv6e0ot
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNSBTYWx0ZWRfX8zvjvjO6NVVu
 FiLMC0q9yzn0OvBkW2Zo1yMTccTdAEpYSsmhVAXttfj4MLDGx+Hz/L/2u92BISkzqueCgqUntUC
 gNcv6Ajk/zxmLDdSlCe9dL1YKw+wXRU=
X-Authority-Analysis: v=2.4 cv=F4fC5ahN c=1 sm=1 tr=0 ts=6ad9d105 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=fK-bvxQjctYCA93nC4kA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: dxiY4dcLXILRFp6K9TV3choztKv6e0ot
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNSBTYWx0ZWRfX8KDdSv1Pp2ji
 MVTmWplvmBrFxgiT7t2a+ysqrkTtXkAjmAPtZuD91RdO0MP0sXPOolmqX/r0RCsgIKmw95/NmuT
 6UedNda9Mkb7SqDpLeJxSmQg0VqFtdRCppG6EIynRupn9m/W4YjExR9Zq2Xgq0Wm9BBJvSCGk+M
 iVA13zBhVu4PjQTUDPXqjZVqZYOXAQ+3rtMkggaoQlznQ3R1P9DyQnd6CerojIpJfIFPue8yphl
 L+TaMRAPFr8y4ntFnUvnm7tQ3IKhfvYFmBcXo5lrSsvH5QJNvnD6k1++wQRnvJ1Ah4BhvfGvGCj
 GOQDU0BRfcctJ7U7xYdY5LATAekFXRQQCsnxQTnkINPhUeigbpJJizYSdYYYdUmNd1r2JoxVCX6
 OAi/o9Emwcv1BWjjCwi/L/FqzyYWz7x0EOJ7afjstk3EnMLHV7FaLKRIoetyYimvL6l7xv7OdV9
 R6yhiAjCz457fT9oDGQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220035

On 10/1/26 5:17 PM, Vikash Garodia wrote:
> Add iris video codec to kaanapali SoC, which comes with significantly
> different powering up sequence than previous iris generation, thus
> different clocks, power domains and resets.
> 
> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
