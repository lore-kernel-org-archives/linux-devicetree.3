Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746173E51EF
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 10:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784110489; cv=none; b=qyZhN1W39A84R2+166Z7l1045IWH9BYm/bFe7no2gtPF/9UVbM7xQ6nVGq8v3v7uWusbKrp3sPHCepShf4CuZDPY+4GCkiePQO1aolYkBLkR6l0l6sG+Q7+xhDK5jjc75GZw5oIuGrMac0c43wPN6ir8w3ex2O2Lp5s3BKd9CS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784110489; c=relaxed/simple;
	bh=CM3oNOpky1GVxEH2HvS+J0A5rz6HVQ8GhVyWtzPpkbI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WXNlAsYYQExn+sWzCrpqFzVBMpPBXFU9uBAAJr12QP4ueCjNUm7Ea9a8R+xgLGrhhdZbZ0Phpv/MbKPNN7NIoLUCfg3/dkntoQ5AVd+jXT3Am/46kzWy5nnXafaWV6Dpx7ipwNERFPnzVHO662G2XiRml4RQ8Def7pY9id5tqAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jIrI82CM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Uw9vIfu6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jIrI82CM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Uw9vIfu6"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FA5Yui2621249
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 10:14:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bbsF2fQdcTbf2JLDFo/HuAan6yEZDXshNeH69qyTtwo=; b=jIrI82CMMSUcdBh7
	QylbR64MXYXPY/oV5vBCbZWqC6yB9JXjzSMZDm/7INQIl2qS2gJ/IWIbefnFrWgq
	FKcoi8AwINh1drydAjp2+azYxWeKtZZT5osN+8xtJM12TXjAi3Pj0Nw3JHX1t+jZ
	2q5azBOwPcH1RZWt2+lzPB7Dy1BvNYLfcSXqwigehNvzuFTYrI25x/FpJZ/sHORS
	iZj5DCQ6gehKgAvMWshYtfYH62Dih/Tpt1ser/9Gn2oNPAj9eo4iNfhq/EwDjczI
	EdXnXTrt0i+vUqZFJT32alj/pQmdgIzlTcxQFVZ62aE5FVI0DPy8EVXJ1z/+ilxk
	N6JTNQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe03vhrnq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 10:14:47 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9058a836724so10572976d6.2
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 03:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784110487; x=1784715287; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bbsF2fQdcTbf2JLDFo/HuAan6yEZDXshNeH69qyTtwo=;
        b=Uw9vIfu6p6uo/Ne3savcVze8Moahtule5EV+45BIQH3UxIBNAgHhNT2Vu0SlE9udcS
         7pC9B+gZ/NiAhT9VdAD4X5+SFyLF6NNtinBa3PYoX8Bg+pVR7WrUEj4Zplrk7sLxnCsP
         pDj7F/OKcP00wxylPuwunlue7105ySE/+8OMtx7QsmihOcfy4YBGH5qkkt3oQJ2niGrF
         K0YoImS/oYG2ryth3S0dr/3/2vWi4Ms2viWTFNCXzP7dTlOviBPyl0mRk6i0dximBApn
         qzLB7DH0ZCEZkWDkdoI3/M8/zGKmSK4Op24YRHqp2P5+jEiEhKMEXzoW3yBNyzJT1Cfa
         kyIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784110487; x=1784715287;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bbsF2fQdcTbf2JLDFo/HuAan6yEZDXshNeH69qyTtwo=;
        b=BM368kwbwcBal5M+PRQvu5sA8UOvT48VqmNsopDCxuTMmEWmKFxTwBCg2w8+n68Q6d
         l84ajhbcn6zGc7DetYLKqzMvXaXOXoJ3p7cvx9Lyq6WGTS4HCdhQFkNHi/dFLkM14dkC
         3IFscAdoPUdB7pzc01+0nKe8hMF/IDrK++2oSD826umpnRWKSD1zpXFi1SPtxZsZF+l9
         kfoDgd8yrxtlFyVTq8mR2w/oofrwHj3ueIBhxRVNk3M8Q7njHGQStQ7Aw7dxSToHbEYe
         12413J96Anhf/iZe5CU2XFiXH6eTcwBTyh2yetZA4uakt5Vqb8AKCzamYEbhDkmpSOVq
         QgaQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro6dfZyWEsZuCf4eOlo/qXitNyIkDUpaG8U7NQu4m7IqR2Xtecza1IAEnJHLDM4Hgx1OU+sqHWqAEaD@vger.kernel.org
X-Gm-Message-State: AOJu0YzUsEMteG+Uo4alNIJDJ0yqVAbbPCUscAmE2bTB4DWHUr8N6WEe
	X+6L2n75JwWEOgz1FhCrX+LxCXIirSQQhgGCg1tF2SyQ/UjK+7s3+IYw3aYbtjvXDnL+K7cb2Cf
	Fzr07GcrZ/mdAeyqN0iJWRVPemcf8Qfr78kR8bXwI17oCyNzUESF53GhcmL67QnMs
X-Gm-Gg: AfdE7clHzV9MA6B66baXXQyMqiyLH5TNiOcsDkTHTp//1ee2dx3weFTi00/xcHszT0m
	ShzAj5XeEdrROiD6F3GsthSamEf0qgWaqzZIcAoSROiB3bxp9larWebrENNQQoOGw5YME9xKlxL
	BOmaS4oCQuwEDhG9Va7wk/FBEqRjAH5tYY1Efa9UeTcnppJoKp64KMYR26u0uqKW/kiXNdSbXhk
	r3JS4QuE+sW+dY7vD2ArR9L9I3mwz7zHSZd5Hp10J62knSlelB7ZBEad78Siiv4OyZ6ontq6wFC
	BCmawcayDHQROyG6fQC09mOj9e6wP6tuIULtn07e17KRNulVHRVGtVluWg2U7SABsJu7F4+dZ8j
	PsXthVXLHTXnPlF3pK0OPinBGR86OVv3h324=
X-Received: by 2002:a05:6214:4518:b0:8d7:4d34:5da7 with SMTP id 6a1803df08f44-90402b68904mr156551106d6.7.1784110486684;
        Wed, 15 Jul 2026 03:14:46 -0700 (PDT)
X-Received: by 2002:a05:6214:4518:b0:8d7:4d34:5da7 with SMTP id 6a1803df08f44-90402b68904mr156550816d6.7.1784110486129;
        Wed, 15 Jul 2026 03:14:46 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e12ccd067sm867509a12.21.2026.07.15.03.14.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 03:14:45 -0700 (PDT)
Message-ID: <c7b576b5-57cb-49fd-a09d-8d1ffdc2d0bf@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 12:14:40 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 4/4] arm64: dts: qcom: Enable SD card for Glymur CRD
To: Monish Chunara <monish.chunara@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sachin Rathore <sachin.rathore@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260706141346.4180348-1-mchunara@oss.qualcomm.com>
 <20260706141346.4180348-5-mchunara@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260706141346.4180348-5-mchunara@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ife3n2qa c=1 sm=1 tr=0 ts=6a575d97 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=II8e66OH0A0ETUdyiIsA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: v6_l5MkFeyvBALMk9vTpU_GMYnPE-r00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA5OSBTYWx0ZWRfX0VOg/TGGSz/S
 ElBjvM/q6aQpNgbaLDReZOsfZ+ZE2lZkWHwmMHIjdHAdH/pDBo9GmDrpkVppQOyRWC1N77N8DHj
 hNN6BhFZbWXCJNlpvL/GXXioQoizRyLI1xgOQTFqei1Npx8jUxmUpvl+ZZbK/XmpH/pJck2MQH1
 Aho9ualh0TxGY45527Pm0F2f/npRFkO7GnNI2uJS6K5oL5w9xJPWfAhAXx2mXG0V7VKqjIp8IpQ
 AtYBal4U0JqXF2SaWL7Q3rOefr9p3f5j42zo/VXjPdGOFHqiplf3JiVyK5YK/yfENiJRhS+Wzec
 JHyHklur29EZwCfDOQU8qWm4+KlgUrCPJmUQ8/NukeUHNaKVnEP1iK9EonRT3HmJ0JhiWEl6sJB
 mvhjAQYUc8wHvE7pLrFLcU/SmOIGAJt+LsfkKE9h6wNlsn3HgG4Am50cLUVTPCIPqhiuPLiYRMo
 NSV5v4rH8yvbROiuP9Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA5OSBTYWx0ZWRfXyRO5AisPOnQD
 YSIvAdLe73TO0KnPRKhygjZ/Ks0YFSJB6iksa7djMubsBSCHozJ8NF9kqo5j6JPy2seHnmyxVoy
 q+INcjxjk6Nv+eK8YL3wKAmqCTH1Xu4=
X-Proofpoint-GUID: v6_l5MkFeyvBALMk9vTpU_GMYnPE-r00
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150099

On 7/6/26 4:13 PM, Monish Chunara wrote:
> From: Monish Chunara <monish.chunara@oss.qualcomm.com>
> 
> Enable SD card for Glymur CRD platform. Configure the vmmc/vqmmc
> regulators and gpio-based card detection for the platform.
> 
> Co-developed-by: Sachin Rathore <sachin.rathore@oss.qualcomm.com>
> Signed-off-by: Sachin Rathore <sachin.rathore@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dts | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> index c98dfb3941fa..48407e47aaca 100644
> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts

glymur-crd.dts is the Glymur CRD strictly. glymur-crd.dts*i* is also
included for Mahua CRD. Does the SD Card slot exist on both?

Konrad
