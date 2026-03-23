Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E7939DBF5
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 12:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774268713; cv=none; b=UfaZaaQ1cogetnS6Xg+2fvgdrtaTNv0SbLWVopHPnnac9vldoHgXFfU27aw+uSwpNUkdzFwzb1H8KDaq1vTuiltl4Sc5aTcZ8LpK5cKT52lwwfxwaXAXdGZtgu5B2/FVIOzkCzJfOOEu8k+hbb/TOBdHri6ViQo4I4m9hvKf14c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774268713; c=relaxed/simple;
	bh=oXai+42/8A8F8jdjgQxmIIDNAn116EPXzscwxWbFhmQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=poISoXyoiWEVwNwmEgnyLvgvpLCp/tivDNGl+HBVFl8NCVEiGsu253chPHPuY5C+YpwMXvSI+b4ecjtS20aUdSMpiLlVN5ai6ZBMrTK8vllOIw2Bl0ILaocwI0XLXEUR7pAdhI9+VC4Vlwt5XpPIDXZqXLZxLSiypYYW31mVxxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BU+lu28d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NKHgSkEE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BU+lu28d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NKHgSkEE"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N83oEB1364149
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 12:25:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lrAAXizoOHygHzB/TmZqVGfrawcHdiN8J7vTtvklL54=; b=BU+lu28d2SeS/6qW
	q60iEkc0Wbqc/09VVWtfNDGcXqfrFVTfSW1eKUc9eRZwSyfh8d4nsbG8VBcCrrzE
	sg2J4prP/M9AhVlgXJYwnopW2eDRHDk7BHDXJlgKuJnoKnB/LevBQyrdGOhnaPm6
	qEB5ItDiqDhdSxPNcyof2BKu6GdVNHsyWYS8PRtsHrpc1NcTH8HZFRdbKmKvJgRd
	vWvVqQmf5/9PhX2T3dseFOdwKnXtHSCm1B6VWQRyLtX2f8Z009qnnNOOxzmT+AIq
	VimyTBxPFl1gAKCPpOSlM38lt6u1kSyNST9DcVGPx9oM0k6bmSCwvvB/k0tJSTHc
	zGHHfA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31p78wrx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 12:25:11 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b68af943eso1675771cf.0
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 05:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774268711; x=1774873511; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lrAAXizoOHygHzB/TmZqVGfrawcHdiN8J7vTtvklL54=;
        b=NKHgSkEE2qvQAlIy/3DrBqd4FEc1getzp7525jJbbCzI4Kd2xbjMXalTRgErm9Du+/
         Io63D+x1vgSsm9LzDO+WuQFtDKhyrGxNklQg8yL+4HqOuQqhujokJk5wusuPF2HUVKHT
         WVH/zp+zv3yHpP0hwBwbZodLbbC0IhmFGlS3AAZDnWX6+OULFR4sX5FYCc/4AjE8ygs6
         bmSGGZTWexN4TKT9TyulfAQLDqQTTpyHOlvF0BHjcMqQOz5lFsWYEzVzMeV8Khxeqtz0
         Tdi6BWRXqviPpVGx/2j18dy6S+QnN+ocfIdMZq9eFBFTKHvvYvIB4pun+8wyxfdcFe2U
         mQZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774268711; x=1774873511;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lrAAXizoOHygHzB/TmZqVGfrawcHdiN8J7vTtvklL54=;
        b=Zi+GjDqHly/rjPMWf+pmOFF8WKsvRf1DWw1BgcoWz1VVi/4xYp0BaLefHAPNNNEmA1
         133t7TKwqE7SDW99qaffd9UfKnBKFs+MMDt49XU5WT9SF2/LWVB2f2+xjZLCrYpAOPnn
         YIetMuHU1/eBGtHAT9hpXB/O3tvYB39C19bCW69mIInPY7+A0cp8UbfmGODFCCXVy7Kb
         pnqMB2WDfvmKWGaJqnIbFv2j+vFxvH34X/NAIksWchz/qdn/1+bMtlYZ/VKunQbUDNE8
         gkEYKu1ncfzqDVBGTyoPbVTx4xWsUFJFrUveFeFyR4bvY5po9YlCU/ycw0+Y+aY49YmJ
         slUA==
X-Forwarded-Encrypted: i=1; AJvYcCX8LGSiANxBN3w1VDxvT4yIY/lFigqsOzvdsvfKOuGN4cv4num608vJibb83e5e7ZqG5ezj5d0DCi2D@vger.kernel.org
X-Gm-Message-State: AOJu0YziVHE659dsVZP6W0YaRePUUVOxOV9+Cnyn3P1d6briNPHlnr1W
	oZHsKl3SyTInZL4HGVcoQMxovstu4jiN+9uRx4/OoTH09MYh/ziVsQdn0vgvkWdHbysXWp/ZyeC
	EREoIIX1HvPu8NNqZNgTlvR9kdGFKsVuyMDnbkUVGKG4BM3RwNdWftIt7XIZTMsY8
X-Gm-Gg: ATEYQzzkOnbnNB92+hgEObPSZgpzgk4g84rCJRDgB+xHoJAjoLuX1TXSDV1AxpPlSpa
	off2vPxLttKvv1f7HXKtwHcLTAuhwJEyJxWryZaK88Rk5gkS9Or6h55cab1BdCezgTzVYjxtZC6
	vYVLDxC9Bz0kw/CT4aGw0g9E1zOH/ykt4qmrayCOhkVmeUdhsLsOcZQkO9TSwrcloV1ngO93LUb
	8sfqW4eJLafJc1FOxqs9GYGux9ohDVvcsowShOdH7hPjdBbq0149nfflXdrbRrwp4Rr6Iw6Ji7r
	cg7l9OUJukYb/k+aWztqSghLEcfkXdGwjh83T21EBvMOduR4LPu5g3uNE1rlBZgwq8uAGbfrk2t
	0Dcr2ucL2jjQLVbqVgjXt4cTbFU6If/JawysNOaVgDfObSbnr5FsjmvrfbfCHVtXp3QVmFPMJ1D
	MVFyk=
X-Received: by 2002:a05:622a:293:b0:509:2b5a:808 with SMTP id d75a77b69052e-50b373d3484mr146051091cf.2.1774268710758;
        Mon, 23 Mar 2026 05:25:10 -0700 (PDT)
X-Received: by 2002:a05:622a:293:b0:509:2b5a:808 with SMTP id d75a77b69052e-50b373d3484mr146050711cf.2.1774268710253;
        Mon, 23 Mar 2026 05:25:10 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b983398c140sm496780866b.63.2026.03.23.05.25.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 05:25:09 -0700 (PDT)
Message-ID: <96074093-b653-4024-bd09-efcd3d68927a@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 13:25:07 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8750-mtp: Set sufficient voltage for
 panel nt37801
To: Ayushi Makhija <quic_amakhija@quicinc.com>, andersson@kernel.org,
        konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        dmitry.baryshkov@linaro.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com
References: <20260323102229.1546504-1-quic_amakhija@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260323102229.1546504-1-quic_amakhija@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RMC+3oi+ c=1 sm=1 tr=0 ts=69c13127 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=WnUHuuy95XYsLch6RvQA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: R04vepuGLVHpaLnQbk8_OMVRBeBuqOuS
X-Proofpoint-GUID: R04vepuGLVHpaLnQbk8_OMVRBeBuqOuS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA5NiBTYWx0ZWRfX/oGBdOK+O4sJ
 wDrA/IQGg13+eBnZ5A8K/ZeABv4hbHunif+azy9DaRy493qRKYUNCvcAZL0mQKoDusGvIX1w7td
 cqoBXm4w4ojkxKBfimLHIOLp6iE3M+Ux1Rx5625qkylwG6v638FJrgzXwdcfzi7havDZtIUH2a7
 +YGrI6eh9K5GcinUgeKneF67bYpqoP1/Xc+0JYZUkas4AFH8H69p/NB6nN4QN3MviAnKL1I75/E
 tk12PHr8l8+TmE0HzJ9jGGE3+e0hBqSlVb0J06kzYxXbUYy9BqXEInWbQ3lqUmbkPx4x617iogg
 OTup8IUlwy9N42YKdt26BiOszvAMLhLqMiZ387vmi67TJ88Yu7LFYptLoEBpRnSx1HBVdHwaoSY
 6HEiozNdA0km38AzlW42ZxQRKwSvLchm0jZgBbqW5nPhyP1VRvXcLskPeJ8rUBDryHvcIb4Hqi+
 yxSGvvQ+UsaO6wbSx8g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230096

On 3/23/26 11:22 AM, Ayushi Makhija wrote:
> The NT37801 Sepc V1.0 chapter "5.7.1 Power On Sequence" states
> VDDI=1.65V~1.95V, so set sufficient voltage for panel nt37801.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
