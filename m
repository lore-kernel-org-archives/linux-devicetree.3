Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793620488;
	b=0Fmw/2EzSvxOzvFgEUPtU+qzvkqb/ZDbvwqTK+iLl33TPUFZDXCqTz2v9hgFnykDt0lQ
	 l+ySGmN0jpBwQy5LNEwbygqBDZnSmOTmLF1pm0BOWq/cdssQuSU4aE3vFHpc0g/oDxgW2
	 GVRF+gTT16biRsFjJfvtfhR6hOxSDJmFQPh7tHtlX8j7BHzNTPARPyFDiFguDGXpz3dLT
	 MQRGOQB/M/cj0LRcm8tAKV8faNWb0V0NVbhwaqp+FuWeiFLFZD05nnf6ClzB6MywL/m18
	 kUmrU6gZUh73PbXkQlhlQhQDkee66IY8s8bKwmaSqWiiuLtPnriumHIcnNYsXMeumrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793620488;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4N3t4eDhampYwv7B5sS3V2bq9ATvW0NO8kdCR9rWbEw=;
	b=DcW0IMHO+bzaD0ijLvOyo2T6c+jgb4UfX1LLxqZqO9d8d46H1Xp18uQmFre+uJQStZF9
	 93ytDY3p93XWYwOc58HHkkj5H16uaHjOT1739pqbysYWwQ52HrGFuioqgDMaAM8Ch0UHb
	 tMiU2X8Z9Ggyzdo5A00lZP6/LHozXe+tQjlbJ04dOqhsoR9bLH957CfMfqNng4A1z6iuK
	 KHp0gaIAwt4TG3s3PgeNXqCwZTg16Zjv32990Z8F2Rp18av5Da2adHcV30Cpdiunw8Mf/
	 RBArzb/nNYoCveNYp5ij9hrxWTNcxdkNCWvjMvG4fz0w8/zijniCNsyPQ9r2ki5lT1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W3bRWMVp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bvXxk9GF;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35A0606A324
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 11:54:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B35A0606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W3bRWMVp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bvXxk9GF
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A7HY214017
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 11:54:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4N3t4eDhampYwv7B5sS3V2bq9ATvW0NO8kdCR9rWbEw=; b=W3bRWMVp+/iuWIhT
	sG5pY52IZ0yJhEEwBCO3o58i+kUz6HxjW6gnDjz46lg2cugQrJYe5qscPdrX6EIS
	YrZpp/i6i7HBfQnTFWQ4W/E4jTADjVoFS+Wrg6wi69EW17zJyOHDWoxW3z6dvf8m
	lml2+4uKy6RAxwyqR9d+/bLQJT8jFILSfoLSEmoOEXTHZE+PJqeL9zQ/ebfnimxi
	aSGtaEqTw5sSHuyGauhyf8bF5FzdiBdCih7NaDv2BVhk5GAkrm9p+rINg75P7iBU
	XfOF1BrjKZLOxQzzkr6CBjg1exXSJihqsrerrVSv77114bLe32Eew22pBxI1hRoA
	5e9uEg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpmf1sekv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 11:54:46 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5476f5bd009so1733341cf.3
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 03:54:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793620481; x=1794225281; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4N3t4eDhampYwv7B5sS3V2bq9ATvW0NO8kdCR9rWbEw=;
        b=bvXxk9GFNgA8D9vTd72Lkv0tK8aDlBHRk4bFfnGmhcC0fhzWlEY2Zifhw5mSZDVK28
         lmCouDcCxUPMj73En76TO2SU4y+rkvMpPNiQDGsAOruUQVM0eHjFOvd5dNw7QiTvGnoi
         tHLCuSHgoPYHv/dIOwADilIn1e05mvTa1+CasI2559DCWChRbDMSZuNhM110nmYW9D4g
         guVtek/6To3XJuJPnecaOP7QMYe4ddZt5E15m8LJyYa4qRiuVr9Oe23znTh1gccv/jM+
         9ozBqefKGT4+/tg8tD+pxA70rZv/GLbBLqeADk7mU69z8eKWv7B+QNnV9c4BcE6kcmXs
         zilw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793620481; x=1794225281;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4N3t4eDhampYwv7B5sS3V2bq9ATvW0NO8kdCR9rWbEw=;
        b=LvTvAHvV8aLQm5oGQ7ydX6eRZHIY4jC7TGoiB/8KDIyFGxrBkLuHI7Cg/zCifrrnQk
         u2lOa9ZwKP4Kn7lza6Dy/PJ2VrX9GIhqIqr0zsyTc9EQOW5jFi3aHKValhq3V+PZh/BI
         lON3w9b93JnDo5a+P77/n0NK3QKNOstkFlNaZFspSKyQZpqO/QZm9Oi9oOiKYRuLB3cG
         ge82WuKceCqWgYOsXzR99ZvzbI8MN04TphUSpMRSJVLfCylLivRAFm0xmTeAj7KcdSKR
         eT1g83F1YJhzR6M1aH9/IZ+uTdIiOo3q2u9InYQTc1cjAWESIP3xLVQVTOyq2ZGvftxY
         kOPw==
X-Forwarded-Encrypted: i=1; AKwUvBzoFSU5SGCpz2p7FKF7NkjwtVvR2BeC+je/BTHUHxh1C8+NrysTtsOI4FDKpCzW6qQL9XieseGPfh/k@vger.kernel.org
X-Gm-Message-State: AFq9FYIJC0m2WW3YRfix0cTiGPUAiulciITNXAihDIx+wXjQlCuMHmdW
	t1r4sg3eMWXkcAQjcQ+pjiLUxc70n4mC3ejToDeAJDz/Zd4bszEeCR2lwlLsTxbnQjj3aGK0suI
	pD76aVoeBxTJdRgUy7DYK7CNXFcJCiPcUo74S+yfp11yyiE2zXqs6ilG72XZ3+h8f
X-Gm-Gg: AYBFou2pDhDkEha15K673nrpohthW2z8r2LoEmOEyNxaPVL1kiClTTGZHfdSrZlWffq
	lKEFBmyzkgA2ZKg6SXAZBHa8yrTy6pCsSxBPJPBdErMaL7DBqU93BbSnrI7iHkINixjZz5pNDgR
	FcFeY/okrReaMPFR7zl6DKALIJ+bR8wIEa6atpUDd/UKndsWImqTjQx+iTOWxy+RumKGMemp9ip
	s80OcKuxpYf7LudDQII6ip0ttWnjApB5EpsrgnwuS/Jd38nXYsSHisMgn9KIw5V9XnOUbXbFdbG
	eOU1vHu6PIrkNtXv+gIaDSesodL2XS1NkPY1Stu9UdaHa5uN48ISLcxxGfAIIKtWQ1OvineM0Zz
	RWrQ9FkgZkx7JsET9L7DuSNvzDlKV5gSTfgcl5/+VrQJnL46V9Qyq2Dw3qq4j3bUfQvTGCQk=
X-Received: by 2002:a05:620a:6f9a:20b0:939:9205:4d78 with SMTP id af79cd13be357-94421654ce0mr1515923085a.3.1793620480911;
        Mon, 02 Nov 2026 03:54:40 -0800 (PST)
X-Received: by 2002:a05:620a:6f9a:20b0:939:9205:4d78 with SMTP id af79cd13be357-94421654ce0mr1515920885a.3.1793620480494;
        Mon, 02 Nov 2026 03:54:40 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe10133sm376949166b.46.2026.11.02.03.54.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 03:54:39 -0800 (PST)
Message-ID: <34479df5-3f4f-485e-8204-3744a09ce08d@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 12:54:37 +0100
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
Subject: Re: [PATCH RFC] arm64: dts: qcom: nord: add ADC-TM thermistor
 channels for Nord PMICs
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>
References: <20261028150103.520428-1-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261028150103.520428-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Urkrn0h-EtLn3rrHVtOupiXfvEiDZ7zL
X-Authority-Analysis: v=2.4 cv=bNaDs/+Z c=1 sm=1 tr=0 ts=6ae87a06 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=dR0caxw8Kkv1fo8ERtEA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0NyBTYWx0ZWRfX2YnuwTaMmBpK
 7QcUqb6fkYEaGaTvkFxdybJCqKWbJqCeNXz0toY/iyQhKHmbf53fFKFnNn2kQzr6LhuXjpjM0mb
 2l0nMT5rfttorLAE++1CzjVd+Jheru39abXOvJ5qnYpG8PKMnJFaZZCVuwjTmQMp1GjKQesDgbJ
 VSI1OOiuUpykjnyoh0HhzF+ymEVuLVzyf0K6oqKpddk07vVmvol2Ky2+y2Dc5fB/17VtT6uH4vd
 oQO5k2GzYGjPr56jIWs4T6EKO4cdAkBIxWm6BFLbPDezLGqbTzbB0FIRVdce9sDRtMHWf+T0CqA
 XlpR54io9gvouU/yOiQKb8X/QsxAjOpNdaODD8Ww+g6cDpQdI/FV6e2qhK4MuA1GRu6W0gMw3oE
 PbalXsP+CneO19my7WJs2TnRAXLlasPHBOe81WZalfQcBfH8q+N7TMdnX+uSNfXv335KcXuZ7HV
 K60Mwqi6mVySPhZTxZQ==
X-Proofpoint-GUID: Urkrn0h-EtLn3rrHVtOupiXfvEiDZ7zL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0NyBTYWx0ZWRfX0CVWZNDADwkz
 /dP6P+Bo6JMsE5WXNMixHP3jc0A1cLhcpdCYeG0pYyKNDc4LiVqfygcCgmspO+3v2mYyDvxsDzL
 JoGPFSbLSj+aTrP0z1NM4jA0tMoSMTU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020047

On 10/28/26 4:01 PM, Shawn Guo wrote:
> From: Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>
> 
> PMAU0102 (Kai_MV) and PMM8650AU's Kobra_MM ADC5 Gen3 controllers only
> expose REF_GND/1P25VREF/DIE_TEMP calibration channels; none of their
> AMUX thermistor pins are wired up, so none of the board thermistor
> rails feed the thermal framework.
> 
> Only 3 AMUX pins are actually wired to thermistors on Nord, all on
> Kai and none on Kobra: Kai instance E's AMUX1 (SDRAM3 THERM) and Kai
> instance I's AMUX1/AMUX2 (SDRAM1 THERM, UFS THERM). Kai's other AMUX
> pins are either DO_NOT_USE or wired to voltage-rail monitors, not
> thermistors, so add only these 3 channels.

These thermistors seem to concern board-side thermistors, not
channels coming straight from the PMIC, so these additional
thermistors belong in the board DT

Konrad
