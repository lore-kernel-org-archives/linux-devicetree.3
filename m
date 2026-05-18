Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89733D1A82
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 07:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779090828; cv=none; b=Og5aaxCYntvLezhJi9z1qFfhsZnYEU+2qr6RpWOB4qLo80HbGi5rkNGa3tOsCaK8gCOHXOlcmOW4WsU1UfvseE0LbIsZ/gH0cLidDB1dhpsouEm5oFBCF29PyA6fdEHIJI2Q6LtfL/t8PfuLUbsLmW5FN+l6NoCuAmJSc6VS6YU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779090828; c=relaxed/simple;
	bh=B9gyGzCV1B54Pe8zE/IjJGy0FqlQ/bm+Wt6xaBcByfY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BOVRuG1Z1+8Az9QmQYJKH2blRkXZrry6V7jh9PGqV7I9fGntG4KADv4g6PUzcEJMeJAs6a4A2tmQ2kD5DKUyPiv2D6YXnSFluQQ/jUAoa1Ozkg1h1+xUu8nEHUEjzws+B0MuSmhh+6PBnGSiyHpCxFCJ0w/6360Zadl219HXxc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mbgbxFSR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ECODCa32; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mbgbxFSR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ECODCa32"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I7cNEI353041
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 07:53:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dXxtdNBAthLA/h80lp+57IJHfTZAirh3+QYdTFgQFE4=; b=mbgbxFSRDwBQdxNy
	0+oxP5n4iF+DtH42d/MWqM7JoEXQSrCfwGQ/3s2THAU6/35ess9Ud4v6BHe1lOYO
	g5aiJasDhXLphcMoNxd5QHA9adm+EHEed8lIGBPDdl7K4BqYseVtlMV0oQlv/Cru
	LTYIOd7/8fvros62aRVAstKOzF21B1oLDF6d+k9SAcnZ1HEtDZAvVdKVr7BJJymp
	IWiqz+BPcAJTDOapXhY3G6BIPc41Ub3Y1ns0jrQOEmB43Hi9PNLSW6vvxklKRNC0
	EQUll9rqsS/qT/n7knGd4JDTcqpwQlLulnlWeCUtIQbu4UDMSq9GblUxE7swk5ZI
	VONyDA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e7xjag269-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 07:53:41 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d840206c3so7890051cf.3
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 00:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779090820; x=1779695620; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dXxtdNBAthLA/h80lp+57IJHfTZAirh3+QYdTFgQFE4=;
        b=ECODCa32MXLcT0QSscfT7pRQ0vvaRwa6g+6IsLovQVaUX5qWEudNQqtCy3pHzkcGUO
         s8iWXV1AnfYXJ2d+Xaf/VjPmLJjyyzwm2Alkhr6bl1FSA0ZmIj2X2Mhh4ohEzJmtmaOV
         OQyzHodlWO2vYjuZ3fY0ywuenAW1XQpqF2HVvRKHDPI+ahBf+WSO0mH5ool30yaWlfO2
         UjHfgl2SsAGdCd0Oqa5dViwcYy9AAJ8ZvIonGLbdh4/9sP1tgm3XlptsfhbA4VwUcd+c
         UW6+mw347uo9Dtgz2MtQdwDRx9LXmYCSyuJGCBuzEM+a0YIAYFaWsfW5tCd23xxN0LLi
         YxIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779090820; x=1779695620;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dXxtdNBAthLA/h80lp+57IJHfTZAirh3+QYdTFgQFE4=;
        b=AFLk4wnF0cnVwUIAX77EDFEUukBLuCSbtT2Xmx67r2T7q4QQsvhpnvBWpZdh0cjJE8
         ckc0ZAOS1QABoYSFm0tkSzznLMC9x+hw6MSJ0vRdmYbDGYT14mENW5BuK0hPs+xbYJWw
         /iN4FDscLcYj/4j/yJn77f0/GbGYveMwKBEsqAdFdrp6pupOetmg5es3cUxMZlj8R0X7
         YIHm6nTT8a3eXnkUoefKBc52z2WGZZZNnIggflvX5E32/j4ZqV/I//SoFKvRnxUrfwHs
         7AIxVzIXzam7hHtvySKbweyNgehhkjzrOaImvQdT7zA8RyDuSyjL5y3bO8SIrpv23YPi
         9x1g==
X-Forwarded-Encrypted: i=1; AFNElJ9ei/qcTcZrUmpzr0d5zwkujtfJfm50ksmrlKEKgzwIqOKBU099qL9cm2ZehvoJ6/J3HPlFra5tI7e4@vger.kernel.org
X-Gm-Message-State: AOJu0Yxpga3QL8UZfUHUQJLVihbll7IhPxsHojBVXI6vZ8V0cBS8kr1v
	lb6zn10A211q4iliRZxGcm69EBjSvRdmDXAy8S53c6RJ9ZzpUttFPe80BnBUwXWuULGr4Yjq7nP
	RNZ06rh93/I0+TilY5Efqr+46AA+T4Lj8IBYMkgFcYggKwGS9LaFyrhCdKQWfq0vI
X-Gm-Gg: Acq92OHeVnFDYpghSvlTlfhOgcugBtutsvU/N/moJbsAO44VBKkRqZceLSnZmhHjWr2
	F5TXCnIJBlnACVRKfX5KzvpSvGQ17hxOXTelyPOg3cHJrvJgNx5sLcLa4FNuZAvtpWutqAbEIAf
	mLrJss4c+FSXkBOgzUqLsfyj1ErMp0vzDar6u4YmpbbG/MdLibyLxC7kV5QZ6fAOi4bQGYiwrPQ
	v2ocKmRnM/v222/vjUvs45iJgJ8thJwSjS0a/FOVFGBZK1nxXoFd3WuozSx4OP8FzjZo3cSz30N
	mQyXiT1mKeM2wfdXiieVLhmWrb4nV9Q5M0pan7X/d8mhuaQEo7UWZvSBqsewk//MV8AyyimLamo
	EKqGFkr+FxmCBBfQvvSQ+6CTCNN3aMZgmhJ5FihJnK3ihgP1gh1hHAufov8m6ir+06rOgjPzuG1
	pgsNKd3sek/Ity6Q==
X-Received: by 2002:a05:622a:4d0c:b0:50f:b9a6:82ae with SMTP id d75a77b69052e-51659fadfe7mr113897921cf.2.1779090820555;
        Mon, 18 May 2026 00:53:40 -0700 (PDT)
X-Received: by 2002:a05:622a:4d0c:b0:50f:b9a6:82ae with SMTP id d75a77b69052e-51659fadfe7mr113897711cf.2.1779090819967;
        Mon, 18 May 2026 00:53:39 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6831187d5f0sm4789600a12.28.2026.05.18.00.53.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 00:53:38 -0700 (PDT)
Message-ID: <e35598ad-85f0-4f00-a2af-b1dc92210040@oss.qualcomm.com>
Date: Mon, 18 May 2026 09:53:34 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: qcom: dts: qcm6490: Add JPEG encoder DT
 properties
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Kapatrala Syed <akapatra@quicinc.com>,
        Hariram Purushothaman <hariramp@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Gjorgji Rosikopulos <grosikop@quicinc.com>, afilipov@quicinc.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260515-qcom-jpeg-v4l2-v1-0-f38c2e1b3555@oss.qualcomm.com>
 <20260515-qcom-jpeg-v4l2-v1-3-f38c2e1b3555@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260515-qcom-jpeg-v4l2-v1-3-f38c2e1b3555@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA3NCBTYWx0ZWRfX6kTiOp3TLMei
 X9nLkVlly5EgfSL+HY1fGRdHN8HniJQEUYC4Xs+aKWByp/TyrOmfyTHFKX9n04Ipp5yXHgMXlXV
 s8KmxF3qDcHOvjtyiC8oNUN8tDBjusniVbVJECBCU+dgki56opULVbyTMQu8UqY/UrWqa8FQztX
 QGXXRTla1eR3LUlnomNnijzOp2VPwhis5vxTBHDrugnswVRs+m+HJJHAh0lmgT5/vbbpKcdEFUO
 P0Wwn0CvYreW2OhPpxkHYz3bFKFWzoJW8DM++JPc2imvZCd2+tgzO8Uf04GGJBGDiof7TSgTK3I
 GZp59FMJTV8fxEwVrDZHG6+Ne+4cju5DPuqN6lxWVTa027IwQ7uIKb72nlc+6e9FDXTZgigpADi
 ZqYO4XPiwkiq+lahQUtXni6Lm9u8qMDxJizCFIQ2jB+xDwSIxyLZGttKECSBVeT3836VZz/Bqew
 W6UwJizDrprovHv20Zg==
X-Authority-Analysis: v=2.4 cv=BYHoFLt2 c=1 sm=1 tr=0 ts=6a0ac585 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=xYWKWClV66zwq8RDQgIA:9 a=S4w2FMICIi4s7N89:21
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: vsPqrtmNAKYfhGXXQcJwk9l8SLxa379w
X-Proofpoint-GUID: vsPqrtmNAKYfhGXXQcJwk9l8SLxa379w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180074

On 5/15/26 1:47 PM, Atanas Filipov wrote:
> Add the required JPEG encoder definitions to the device tree.
> 
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kodiak.dtsi | 52 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> index 6079e67ea829..dbfc6cc051f3 100644
> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> @@ -5198,6 +5198,58 @@ port@4 {
>  			};
>  		};
>  
> +		qcom_jpeg_enc: qcom,jpegenc@ac4e000 {
> +				cell-index = <0>;

Will there ever be more than one instance of it? cell-index is
generally discouraged

[...]

> +				iommus =
> +						<&apps_smmu 0x20C0 0x20>,
> +						<&apps_smmu 0x20E0 0x20>;

Please use lowercase hex

> +
> +				interconnects =
> +						<&gem_noc MASTER_APPSS_PROC 0
> +						&cnoc2 SLAVE_CAMERA_CFG 0>,
> +						<&mmss_noc MASTER_CAMNOC_HF 0
> +						&mc_virt SLAVE_EBI1 0>,
> +						<&mmss_noc MASTER_CAMNOC_SF 0
> +						&mc_virt SLAVE_EBI1 0>,
> +						<&mmss_noc MASTER_CAMNOC_ICP 0
> +						&mc_virt SLAVE_EBI1 0>;

Instead of zeros, use defines from

include/dt-bindings/interconnect/qcom,icc.h

Konrad
