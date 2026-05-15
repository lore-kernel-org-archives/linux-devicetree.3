Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163FC43E9F6
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778839811; cv=none; b=b3ombjncA04sKj/fDBgYOvuDJXciu0Ynged4QKMZq+nqwfT0cXH6MPsUO19Jj1Ju9u+DezffFaGo9hxJXO2nsSShPnNnXWWQtyoBTEGUc+rrdP79gQH1822FPykRaaSZeyKfNNnPjML/oWtkERdCZskZh3uABfheuuaum1LIq3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778839811; c=relaxed/simple;
	bh=r119k2qqSvMGfTsUYPr/T3TtmvauMbPiahQOfS/2/Cs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XFQ8ckl36qdjOORPRco3qycFAjnWL7fKdk/cfnNKcn5FwjNhhhqwMuQfCU9nMItcmhBswtK6ci5O4npo3M3ttJBjGjGEThINPfysmkC0O9BspkO1aBT/Ty64Gb3VpOhrOD/ixo0KL642B+b0pXi3JXkT0ypO6waEqjgDZ+p/Rtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kx8BpcW5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Liwwskkb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kx8BpcW5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Liwwskkb"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5UjVQ654865
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:10:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xiB3OnvSBLF2318DOoqhFlBDTm1gOmHvdH9fY8XWtYM=; b=Kx8BpcW5CCOyLqn5
	qPVO3Pg7IHdHtW8U9cVrC00Qqi8lDAW11Q1Hf5QcoAHzFatSVpHpoI+Xmo0KhVjs
	vcjKuzpNo+SqBVRHKDOopfcJePRTwrDy/RM31PdKkR5oWqT2LLpazXl350Gri+Li
	n6HCFyBsHP8Q+Nn2yjQ6286mdc+UC5pACubgd14eZQiDJAjj4J+0/SsSO1EJGeKx
	+SUBIlxr3xdRNKFPLe1Am8QwA9/mgtPaxC0hCNwPQ8SR7FTZSB8dfMqqBuJR640U
	wiBFXt+eT/lbUzO5IQFbu93ouufb70SBr9wxurFHKYLTOSoWwWQNHAlUVxhvkpVs
	TyXKGw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1ptu5a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:10:08 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-90fef17f6f5so65710085a.1
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 03:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778839807; x=1779444607; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xiB3OnvSBLF2318DOoqhFlBDTm1gOmHvdH9fY8XWtYM=;
        b=Liwwskkbz4JRu8CuBB8Skq2nYGMPR+o5c4brv2Z+Xsjr2JkJCTGlDAp/LQ8aOXNBOP
         sB7JDwZC0hG97Xm9Red39sR0wT7JRJvxwUvRzpVEY9Y6v2qumhfNiTFp/EHhBRW67UJJ
         sie2cBurSXkkr4QNeRhLjZ7yOkxPDNAYwGg6pVufC32hEdzSxni4gMH6Pz2QjzfLe6g3
         yto5mnFn5ggD+9R6xxomfWXuKlsdKsCKPD6wm91HTjQ98qJt9U2gm3D2jMHjf5fhegpj
         CXWVu8FJkqQyha+J+8EFwha3RAeBJ7IRluyxOcXd9YaTeTIZ+VusS0+TwOUDGV5bhkhW
         p0mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778839807; x=1779444607;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xiB3OnvSBLF2318DOoqhFlBDTm1gOmHvdH9fY8XWtYM=;
        b=It67pwuxVWgKnoBmbnpDnmM3Sfaun87mtKch+8D9tUzUk58yvxFN8w01usK2hF42sO
         t2VW9uYx5n5JW8MC4CWpvy7b6cBH0EsWkiSe5sK+owhpc9IxDWU+uafB+he1BNcEE7G0
         5ZjfwMViXkgh5g8nI/e1OvcOv9e+NAfXr+m1S//ufyoUEwnZ2qejzXHoMi7/8jXxpdcJ
         dBb7mh1KvPO5mHIp8Rl9tKnOjfETFMotKGmAdNxRFlAwe6zE9SZmCclROmWWv6lcSB6A
         G78obVHxT9zw1H0ghKI/zn/TrwDy9H11pMx7pyBzhRIwXvM2Siq/xk6qZZD/+K/An+IR
         BqrQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Mu3T6QqDVYYbWjcEPYaMHQxC0VIW9zr2rzRM3AelU73Dk0DtXKhE6qq984bzk4ZtDTwIn+D4jnR9C@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5s8e01AeXbdArna2kwpr5lM0LvWqbysPdiQwa4z5qUXdU5BAO
	PE++fUM8tjfuHO8eNoriT1jJxmuVoeYQMMcVGS9Qyj9aAFH1Nh+V8LwgFifb6jgeVR6OxdP+wrf
	toYxpQV5l3slhSNlJmiuCv+HOfLMgSedz6zTjtb9nuX0KGjMBchbUm4/oAdt4cIta
X-Gm-Gg: Acq92OFuFg7aS7tlcG/8n457qDwKXgEJMb2eI8/+/JPxwnwYsLITdo+QwWrsl4VgrUE
	ZG7tdrXYIzHc+ZKDb/69HjU+elAibT+9cfcLMvjSRrsRa1V2W//x3lLqHXRCRd0ENEgUpqm42oE
	AltPtNZtBmQJ157Br93bvCEBZiSp7Nm6VYIKdcLDIOhUz6vw/XSpthR+xZ7DPVHQ1U2SfAd6b6Z
	XTqlyXKlt8/slY5VR6jxcalfw2aVS6FKMCLqtWFvreScgGys6Hyx+oncwxygwRCuZhOQankNZoe
	W8FxusrvuNGcPLoCCMYr4pK+jSrIMC0WXOY9An915gi9UQnsngqtddTHuZNb7AZbAEEsRHltqQ4
	5c5OO537GlWqJ+aiBhvl2ykOU7U04ScAcqTcDsDk6ZV8fq7hImmSruPaPYc5Jz9XRmyxchOTK+a
	rvDu0=
X-Received: by 2002:a05:622a:111:b0:509:d76:fe73 with SMTP id d75a77b69052e-5165a0dc367mr28649951cf.3.1778839807313;
        Fri, 15 May 2026 03:10:07 -0700 (PDT)
X-Received: by 2002:a05:622a:111:b0:509:d76:fe73 with SMTP id d75a77b69052e-5165a0dc367mr28649781cf.3.1778839806902;
        Fri, 15 May 2026 03:10:06 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68311879bb3sm1812289a12.26.2026.05.15.03.10.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 03:10:05 -0700 (PDT)
Message-ID: <d41015e9-c31d-475c-a88e-791351ed243f@oss.qualcomm.com>
Date: Fri, 15 May 2026 12:10:03 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] interconnect: qcom: sc8280xp: Enable QoS
 configuration
To: Xilin Wu <sophon@radxa.com>, Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260507-sc8280xp-qos-v1-0-15135858cd98@radxa.com>
 <20260507-sc8280xp-qos-v1-2-15135858cd98@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260507-sc8280xp-qos-v1-2-15135858cd98@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: mMu5DrLWjLDFrq3PfnIzEA5YhHwQNpxJ
X-Proofpoint-ORIG-GUID: mMu5DrLWjLDFrq3PfnIzEA5YhHwQNpxJ
X-Authority-Analysis: v=2.4 cv=GrhyPE1C c=1 sm=1 tr=0 ts=6a06f100 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=ksxQWNrZAAAA:8 a=EUspDBNiAAAA:8 a=NfFXuZlUh8PrNxB2MeMA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEwMSBTYWx0ZWRfX9wmEp3YuhAQP
 165cmzOrYRxI6pLz57Z4YEbtYfMQzvzyAIXnxi+Tud48HkVtJ8lZPunA81fBVemvB+hE3QPSVf3
 3yNFQ+1eC2mui3EBDV78MpcM8niJReJ1CuFVEcEPaZ9vHpq49NwK6b6p7X/15mgsIMiBgiCoap7
 5S63bO1VMWFQE1VFJD1K87tqMbUHt3y1+k0WMMUSQAkHeMH+7l0cmhaZaySNCBTWXrt8C3mrNDZ
 u3E5gcvPF84IJHPKEegG+y7j/b7qu16fQCTLWARnFy1pGe1HxRtoHncKst4/cXvADukIGp770Cc
 Zdw6UUXvxLIXPIPdkvZ737CwHbLx99Pw54FQOyEN65UH8v5/UjLjHBpscIAQdFdhYjQxnI4JrHX
 /lMfaO1g/De31eOArzhaGzMsSDscomMcb6T4JpQ/7mItuz216VCB4v1WNEMyG8dvNypMM3YGRz4
 02h9182TR3MGD5cpSSg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0
 spamscore=0 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150101

On 5/7/26 4:25 PM, Xilin Wu wrote:
> Enable static QoS configuration for SC8280XP NoC master ports with
> predefined priority and urgency forwarding values.
> 
> Add the QoS box data for the SC8280XP providers, add regmap configurations
> for the real NoCs, and mark only aggre1_noc and aggre2_noc as requiring
> clocks for QoS register access.
> 
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---

Checked the QoS settings, they seem to match the info I have

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
