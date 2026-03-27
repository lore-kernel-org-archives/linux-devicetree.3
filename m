Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3A73BD24A
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 13:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774617006; cv=none; b=LKIF6C8HmOU+E+sUj10Jc25cH2Y4AKcKvy9SuS8HPWwReSx+l9GSYd+zuUn9nTLyHGhKOLEkP7Ug/p5z3BYsOqn3HYgIQZ8IxGatEwWWgyc4bWhtcGNjoYxCoBv9kJhzrxYDKbw97TXX/QlbiBLZpwgJK5wKEmHuu0sUM/cgQBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774617006; c=relaxed/simple;
	bh=OR7A0CYYFZFRplPf3XDj4MKp9ETSFd0U+CSV1sqIg9s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SSXDvLHsYiyNivIMyr/IiQX2uIZEcc0xV/63A5WSVDxWVtQCkXsetX8NKbjkd4zY21/T6i0eayoUv+iwYEZIUGhporZgKzi1Ykt2bid6WjlkEfFhEh00DcJ2rWDcDFahHdl0UYiP0PI2zAGAaVPTgYvogAXdicMxPyEAGnXR+JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mTDqPt6g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cNZ59oK2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mTDqPt6g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cNZ59oK2"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RCauia3716302
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 13:10:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Go92zMhLOcK2bdJWTyPcYvvCCllne7feqkL0/kEMOYI=; b=mTDqPt6giiGGMqXS
	uXq+eWqAXeW+IWRKfzmRrlNxzWukPti9cpy9md1PBdhwp/xZWgphIIbCmpFgw794
	6+fVjZ0uuT1dwkNAANCd/+vSopkX/lf1y4hhgzfxr6HlS19xLpjreZsknKM33T+s
	SHagpjwvVptoF4H1nd2PlstN9hz3jXnefvpxBvDgx4K6ODMB5tV/g3TPrqneB2bw
	qEdiF9Bl52zrOB5LmFwQ74/1WN0K6ZwXYtkXT0ZOKoY0WiEnpiq+j7X0bd0k6ipv
	DWjOkx8dsbWc7Hyc3Dbt4MlSd4XkFoJWFygeHBgaWR7zbJYEmABaq15qvBDTEexn
	WaFF8Q==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5dd6ju8q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 13:10:04 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-604dcdfb3baso56037137.3
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 06:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774617004; x=1775221804; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Go92zMhLOcK2bdJWTyPcYvvCCllne7feqkL0/kEMOYI=;
        b=cNZ59oK2h67mIqhQz7xwRnu2wurq96a8/+fxY4nSUxFi6avcOrJZEqOniiIht3ThTB
         jlUx4zJNDCrXGboll/LynvvUmqbo8mor5v+PwIb3XNsJg9fJWSFtr/OVc+NDQZCyQhMK
         dpVi4NDVVPsAf+MU0k7xDOCl9Sl40oSRVKdDb/Pfy2/lcabl5OXPGzktbFDXzBasE63d
         54Y1Pe6TF6lyxLeMbs7bpJRv1ClaiNTmn0820jaF43P/YKkY8XMufnfHIluf57bxmjE+
         YtJgUslPsKTmfBlS3LWbZ5mWTWX2ZkskjzkFGcoMxtkihVEiPpLf8Ci8WIX5tu5WO6Rf
         Z5rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774617004; x=1775221804;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Go92zMhLOcK2bdJWTyPcYvvCCllne7feqkL0/kEMOYI=;
        b=dCI5xUIxMlCBCvq/kmZnIfNwDd4tFiM6s0KlpiyL9CRSAyYbXgx842b9tO24BFfN1T
         y0lMYz2u6rzexzac9MJTjmU92UZqzZph5/YKX3mGJGnze/fAUf7n3HGItN/IIVGvTnbT
         Oob6I2ErbRZTpHeQSahnTBFjOmHvQkUEL4QG7Hd5ZbrfFQVwDQYzdHi2RqD9woCcOQjj
         OxOcvNltimz5ZI4Ico0sa7r9hiyG6lgwaaPmLDrP2ex6sU3FhD4NDwNXCyieGb2QIRsN
         VmdgO8ngV/818gYD887e6DcanaA7PgYUn3UfliYrSMN/VC+YwzRTBb/N2S1N2BvM/ify
         ksDg==
X-Forwarded-Encrypted: i=1; AJvYcCWJ1YLHUFU9zIA1zg+2WFvYwR51Q1Q5ELxR109nWVfx396c5GEQByV9Zp1wMoYrb2fyO5f8+zkOZaUJ@vger.kernel.org
X-Gm-Message-State: AOJu0YyEj1txxKXOEcMU0VNWp1Pc7lMF9XEGLzoO10hRUDDBGK7IAvGR
	do4bMm5B3BE6at/ZN3g5r1qOI2YHAoUuV46sYI/m+IIVjUnHZoD1srj7wxcBfJ86Zrwu8bWR/Nn
	EvpXhz9aTRLUqOtu8EDTiEL/lUx8MJFUwSyWMvP/m4Cqp2/tZvSNgxVrm/AYMqRDj
X-Gm-Gg: ATEYQzz30ka2PuSMP6yxnudpOTwVCf+LYAZ2FR+ExelisZrl5jIfRNjZcyQwY6b/INj
	FA5vPEabq27HRdIjGYy06iJkEk87RACmOVzm7HeSR+n9FqXQfbRHa4ivHBMa20WocZWpQDq+bJa
	wirZors/+jx5DBcfgzEjbn5Nff2ZvzDmJQPxk+bBLaEHvhIqhPOR1wLKi5gtuYNDUajISPOVecj
	t2af3zd4cM6HTp+qozr0XIrtj+OkrF5nmJDQR93xBHGXcWLCenmNYZ/pwsEIwC734DCKBuf+gm5
	ND56WVU2qIQ9jcpZtu0SsbGrTufIF3A+t0LXLdFTbH66oEGA+KGG+uXCQFRR9LctuTAKo/mG1ax
	OidPwCnKD/7U9Q9jy30C1Ay5ef4bEpyh04XtqSAlyUY3r2sGVsyEDwZ7PDwGDf6zeg4gI2+zFvA
	ayElU=
X-Received: by 2002:a05:6102:358e:b0:5db:f553:4ca0 with SMTP id ada2fe7eead31-604f8ffd2fbmr500372137.1.1774617003869;
        Fri, 27 Mar 2026 06:10:03 -0700 (PDT)
X-Received: by 2002:a05:6102:358e:b0:5db:f553:4ca0 with SMTP id ada2fe7eead31-604f8ffd2fbmr500349137.1.1774617003421;
        Fri, 27 Mar 2026 06:10:03 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66ad6c568cfsm2269086a12.30.2026.03.27.06.10.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 06:10:01 -0700 (PDT)
Message-ID: <e1d54a0c-dcaa-44e7-8a30-7a575f7433d2@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 14:09:59 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: monaco: extend fastrpc compute cb
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260326154111.2781802-1-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260326154111.2781802-1-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NenrFmD4 c=1 sm=1 tr=0 ts=69c681ac cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=eypNieujGm-Z0LZePf0A:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: WsJsaKf9pNKzVIFwvFXpYSGi499sdg-9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA4OSBTYWx0ZWRfX9ddAZQW/fNJy
 balrbq8APv8TWdMYTh5wElbFlQv+JJDxgis8XRTwZcEytPPlXy+mOBD6PbN8GX6k7s3dS+iAjWb
 9TdBQ8LuDYwu6a47zMxzNzVHqlG26UZ8g2+FKxBlJyJ66U8zGhs/4H8ffDGAwUQeLzj4L3MWhUI
 X1C9/z33QBXosz7gx9+X90fFm05RYv/Yrizz1oT8348tNp/0PsJiBTVxW5nPfynyFW0LkrDB+T7
 MPOYUf9Dsa2/Bf3My0U4BxVO+pw+al3uzyMmOBKp9SMPrzhyn+s+0kHPze+KMnC35mJrrkC1MQT
 wawBKdPFoxlYauoxq1QoGIytvK8WmQs0tQ23u8u0gU1lygiGsftrxUqLz8pRPTLJFVT4yEbKh/S
 mr+ymRxToe/lkf8xobVW/FjtOHkATlKDTJJjCbTO7dSAsuPYLy5zco8CY2j3wUS9hL3aVUtNjkS
 hFnc99dASmvnTar/b+g==
X-Proofpoint-ORIG-GUID: WsJsaKf9pNKzVIFwvFXpYSGi499sdg-9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270089

On 3/26/26 4:41 PM, Srinivas Kandagatla wrote:
> For some reason we ended up adding only 4 out of 11 compute cb's for
> CDSP, add the missing compute cb. This will also improve the end
> user-experience by enabling running multiple AI usecases in parallel.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
