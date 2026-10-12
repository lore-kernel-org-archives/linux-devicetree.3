Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C647349B213
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818923; cv=none; b=k6UX0+5fOyzgg552c+RlIZHIKLdTfEvJ013OelGUxbXLFi6wcqDzAp+Ei0/W68/0Rs+/rPjrrOXZpnhToEYSkBojRbj+LaPgVKKfw4WlF74xYP0rEozXM5C1UmZu2PIKPVJuYX8Cc6GNrlT4gwPRB6Esiip0C2q3JDHCpQB2jgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818923; c=relaxed/simple;
	bh=IJRoYw6sJZ0+0l+od7X0+0OrpYFWPVf9diA5uu82KIE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GGpcTeSkLb5bif7n+pp4xWvkJLt7ds8xhvx2EEyyMB9O9sPdhkdlaOZwD/mONDrCZ/hVLFdNkU3FnYrH9gJLqOUchGhQATFJKvoKMevdbzRVOKXoygsHFhxNnmzD4N+WqAkM5EWmwulUc75StCaY/u5k0hOanbih645Hhm0wrOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZeIB+SPs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OHhffzVj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZeIB+SPs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OHhffzVj"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0aob2679915
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:28:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2GOYKBkBIe5rfJaEIMD6Cqv63TqMggSTQREHcWWPJLc=; b=ZeIB+SPsyUVzy8Wl
	QaVJWMbkraYD/z4rzcp/ukC1dB7SO04WEFkjFbbvxAWwbYXhnfFIy99SgXs2roqz
	k9HRp/jhZ8dw3pqTbg3WuyKUQ964g96lFBZo8cKr0AZXJQjyxvzMGgwNyQCZve+C
	DbtuPcqE/RWLSB7VgNrYL9ppfqmusQGsDISwMVVBS+xXrW/AurZK3QWg8xiftYbV
	jKPhOT4KED8HAsa9NDjprg9Q8BsMN5EiwrvYutsWFyF5eHEoWT8F/AD6g6i3Ni9V
	z2hIcACkYIWvMTLpDY587afhwie2FogiFJxXpoLWwiDmaVA/vL+WgQxC1BkIOhlY
	Bh62dw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8sd1tmva-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:28:40 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9179ef12a03so7956886d6.1
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 08:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791818920; x=1792423720; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2GOYKBkBIe5rfJaEIMD6Cqv63TqMggSTQREHcWWPJLc=;
        b=OHhffzVjyehQ2tSYdnLkn1h6+gDb6Lj6ZBlbMlFw797Wl6GfDiFo2Fr1a6+Ym0Ivbj
         xdIj6GBqSUgWe+6E5aABksW3SHWm4L8/N2EmPQAdJHWZblwXKcc2gGO7MMZMRctxj7c6
         WNanS//Z6z8IdA0e4vQ6BLz5aaooGI3PnQp/ZGveKROQsQgBSp6E/fHJZWqfNHHlH+EQ
         cebw0Ziad8wDV1+agngJvgxdqd4gyP/Qw45eFwlobwrEkBKFL2M8DDRfgvaKr9tKtrd7
         +deIdGZi/FtMPa/e6H1lMo6vbXnJZiec4QZ7M6o0S2lvYiQSrdBNNlAp1R1fawM9yMqT
         9XQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818920; x=1792423720;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2GOYKBkBIe5rfJaEIMD6Cqv63TqMggSTQREHcWWPJLc=;
        b=g94RsH+/ZJAPRxFabPDroDI6p+jjbBUH5PnKQ1gKza3mJkVtHI8oZrjYuxr2hQ68VX
         NadLzUrhg0u/a8cxWvQGlhzuU04W9dacR/K4oyN0Lmdd6qy7RC6ZyoT/OCZJ0pWVt25a
         PkgOiRpVL/YU91sxDXcK5eBpp07SDzpLc4XvTHxJ6GxOLzIauagEYUjGfXHJVIZnN3pK
         yuGSLVLggPa0fjhpE5M5dPZTwFvBBmsYFH7dq0kqrBmcXJDjS9a69b84Uo2PIQ3plNbp
         wRQaP2IiotgJmiM880BoMumTdWHK2kAZnaEvOTi567hjCw6iF9NEYcjY138z7Kwnv1I7
         018A==
X-Forwarded-Encrypted: i=1; AKwUvBzeV1UhHCkmDwTAsPTAfiML0SGH0u4EfOnsfnX2+VhrSCQZU34to0lKg0pNbNEywJ6/UhdkG/uec/g9@vger.kernel.org
X-Gm-Message-State: AFq9FYLEv/vDUnpAyWU4lMoyEBUT85Zy9eXqfosqCFhbxt6WEE/sHfgn
	3sNevPEgpuoFLJG/CAi6Q67+QdW/FLBHYinwoH/lnr2abycSWn7CudsGv9JVOYln+QKcKd6hsXr
	/D4sTIa1ZLEaTKOAP2CqpZlZ/EIc8wwHukd2O85s10tQlWv7xIGW6lbyAiZ+97caw
X-Gm-Gg: AYBFou3ssJK07Iapl2IGPC4qCl2It0jAfEQ7PAsKg+kmEXNoOw9EC064VvQQUq18ZoS
	rR3l6/kJ090Ao6FEsNKCPngOOgpp8XfwsoTLQlR6bv20ouqoD6Wpn5h123IKFt2PsnDda/oKFZW
	5zatOSN0QVQ7E9pxwpkFbtjY/ZyVMe8kw4Z0tNWbCgd8S8hUgDKhYfo8N2nJmI++oNJ2HOHaJk3
	lSUlSaF8v7ZXyvpvGZbJn0SO0mGpIh1c6icmTbZ0V6A/xG2jcH65BaBGayUhKTYkj+/ihBR89yR
	UZPrJDaavwRe5q6CxZWPpb4HQXPWgEaLU3j9hQdbkaOA0jN4wQl++z87LDlHN4VfIBEG6WHoJds
	ihuwfA8h0KOxawL8WjNypcg==
X-Received: by 2002:a05:620a:458f:b0:93c:61e0:81ff with SMTP id af79cd13be357-93ebd0a3722mr1993449285a.1.1791818920046;
        Mon, 12 Oct 2026 08:28:40 -0700 (PDT)
X-Received: by 2002:a05:620a:458f:b0:93c:61e0:81ff with SMTP id af79cd13be357-93ebd0a3722mr1993444785a.1.1791818919607;
        Mon, 12 Oct 2026 08:28:39 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9ac702fsm475916266b.65.2026.10.12.08.28.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:28:38 -0700 (PDT)
Message-ID: <dcffab0a-85f7-44ce-8b54-255d500a63cf@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:28:37 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 20/38] arm: dts: qcom: ipq8064: Add newline between
 subnodes
To: Waqar Hameed <waqar.hameed@axis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@axis.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <2d1646878546c44fa184d7759ddd52b2f16b8b1b.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <2d1646878546c44fa184d7759ddd52b2f16b8b1b.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: t9F7YDo7WYeIZCmuwpxIfRSt3Vc-nrVF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfXw75Hg+SB0qqy
 FZk3poI8i2uQnBYZ5A2+a6PXbMC2U1Nc6CM8dEffGxjdBQNg/WywXVUqo8/M+2LNH20W4nPqHnG
 bjATqWRouAyZB8x3DN/ZmsxuMxrfit4=
X-Authority-Analysis: v=2.4 cv=QtHLTlyd c=1 sm=1 tr=0 ts=6accfca8 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=3-RhneuVAAAA:8 a=EUspDBNiAAAA:8 a=WWQFUNGd85j635JlVwcA:9 a=QEXdDO2ut3YA:10
 a=hTkh0tvSPVsA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-GUID: t9F7YDo7WYeIZCmuwpxIfRSt3Vc-nrVF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX4N8ybsAGJjnO
 kYUcU/AzdwemyuafEswvxAyBIHs6AUJk1bBHf0FeK+MBsxbIVeZXXxGGak+fAKuqLiUzlN5NidJ
 /zpq6QAKVdQi5NBL32L08dmsG1EQK7q8J4ILs4LdcOZYOscNhUCH5ksIYTBSEjVLCEEImIO/NuS
 eaJtEFqPA2Ng0tEFjI2ED8wqdPWcIQvuSvXnd1UdIjzMWcvjnkgWEVGLGFE+zJF69M9VpxJKgzm
 RVs8C+vQDxhbJ/JfN1dHPr+84bgNM98ncCZL7Yl3iZeQ88TicoIADrxkrmRG3MGzJTxxFGHrKSo
 1njn6TlBL9vDAsHdIVblkMXjOZRNQ833OLmX1r5IEjBli0bx/bfnsUamxsPqEcrX68P3E9k2xCf
 bGse1VV5X/M+9AGaPdLnac6PCekX70/+d1GZxwnc3I0jasdcDBAg2EI7ixWBM88CGSKkIfWfpw5
 TfqDWgldVpk3M9Mky7g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120061

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> There should be a newline between subnodes. Found/fixed with
> dtfmt (Devicetree Source formatter).
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
