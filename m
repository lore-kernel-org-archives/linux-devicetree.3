Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84EA3C2763
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 09:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776850151; cv=none; b=jaj7buiVvoH/Nl1Yk5BJWSG5yQ8V9zZBgA7jt0uksRaxNbjiPI91X1bDEBohQrXurwHjwaAjg0SMu7E7DBK7iH8450zvnlaHcEX22IUIElPn+GGEFnTLJWf/HfXDO8DlxWiemg16VlHHVh6BdhPBvl2o2v3mWxf2ITJL9i45beA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776850151; c=relaxed/simple;
	bh=DYoHvvvz8DI9As6dB9AwFtTr1i6c5D8gJpOitjuge9A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S3FxqGwZ2xYm2Mr+yV5bt84Uq8d0mLep8WWvmGowivFn83CG4zg6XIOkykBGFjIBs0Lj9W9OPihL/2bnp2xGjOvBRX2Iv5vLciyBdtgUc880IDGm2X7vR9eoqEOZt/AdPazY8JD9b5lZxDiv/ntKgxVYG9Qn6WSmHXeIMN0Rw7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E/gw3NyY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FNVHtjiO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E/gw3NyY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FNVHtjiO"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M5Yjdx164470
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 09:29:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KGX113fTh1fhm/h70xcLYgSaHKw4rRJELjaFmfCqZIw=; b=E/gw3NyY8XxZIUgw
	nSZ0MlIFSCQZ4m+FhJLALiCt/N4TvlG69eJIZKhgH0+2SUl1JQKyo3PxW/Z580Js
	Zkoqf/bmH6eDK/RI6CcGnFLB7YGfvnLTirhXrxzEiHI6MJjbWxpMCNpP965S3tj+
	qWCbRjnuCMl2qY/Pb40T4tz54NymhfR22bjTNnRXjR+W2S8Ks0+XKMFxT96IHEaw
	WmfPaNJZfzUutYvi3zbxrRMeoluZSEvqSuEUzZ85D4AXv54MN9xigMwJqU+LXDub
	pV9K54CCC088oe6t7IqzB21XElGi5rBwNEX1lTIbyJPbQwlLhmM3AOV4F4PIMTjB
	7iDKwg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenhjrqu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 09:29:09 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50e576143baso8081401cf.2
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 02:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776850149; x=1777454949; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KGX113fTh1fhm/h70xcLYgSaHKw4rRJELjaFmfCqZIw=;
        b=FNVHtjiORowA6nVBmyVh5ne/ky3NUQfCoL+DBym0o+MzgRs5+b3rRPN3NLmlxq50ZH
         pp8zILGcdQqC03lavt3tJwOFZDZ1EtgpIpyPycuqeqkqemduwvoaRMO9kNg4os/rbJu+
         CT2jtVCWXpXywLrXmKL+9Rf1Bh8mQF40GxlnZKz6wSxGw6io+JsaGw9ocNak7xhpRIQK
         sSuH8q1ZPIYnTUx60w3xvAm2zLceCBbN6U3CNo4rZzJPphyPVD19CBYB3FYk66Y3Lfxz
         VJuiNDkfcs208F/fuDP/htPDS1TsSyLwwzaD50IBiTb2BDO42X0/gZ42RB10pQoXwe6h
         RQrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776850149; x=1777454949;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KGX113fTh1fhm/h70xcLYgSaHKw4rRJELjaFmfCqZIw=;
        b=bU5MqkYhYev2jfmquUkk+Sj8V8qwwfIRomo+W+KOi3W9af1pYcSKg4EE8sGV6kTc/Z
         ru45FqP6Jcv43lj4Zik2eZjkjmFZ9qfbvwnb2dU/qBi+Xq210Xx6WA40IA/rEOaF2SJT
         MzBY01wv69BilRw/cpRVvExH0szv2/7gIn1EEqysS9PznsZYOGBBMTuzEkLxVcXBY11p
         DLxVS3hTp6E7xzUOZoHi32VdXgY19+zwcKiPzthZXUdbJal9jGk3+EClRt+v9m9/VsxR
         UpJcsHlHMYf+C8kA6H8CALXNmKLQYYmE2UeuPRFMkCtHC+5Yk0tlrFICE9QGDBIfOmV0
         2aJA==
X-Forwarded-Encrypted: i=1; AFNElJ+xFpEAu7Pi7X1erL3Vt/J9IGEBnfQIm8cevTyI6lWjgadrb5oUxa9MZ/L6Oaql0qkHMqTzUv2+Est8@vger.kernel.org
X-Gm-Message-State: AOJu0YzBmPFsM662gSlKCosRA9FXD45XWhXGxBYR/LmWiG+dIaWTPJMa
	6Ro1GN8ziXLHV3OCW7I2XzO76WzygSDJXvrCUirBhSeiGTT1wjUbZmVePRq/jlWwpUb5rbZQu8u
	RlbChksTaydxeJQSav47VdTrfef6DwqTHRCruwZbKqDZVDH75sOVhOZ1KbYfbMYbY
X-Gm-Gg: AeBDiet17yWT8xK6ijCFxrEaANxE8WvQ7KICMOwZdoranSGrbht4Ap6RnhspAfFu49L
	J18/uCNNBAXSEHJwe7MqJVl7IttQiNvah67LmEmMhDqzIJjVfmQ1QbLKb6+50AVcFaXAIJp4Ap0
	ejAQmp4YlPEdseuCTevxwtnB8bT7JZuiaCcMnuLsXVDU5EJpMy0KI2fB1DT+7QcQepkK8XvDu+Z
	lYd1VR7gw2FAQMo9BqJz6fiInnWxDw4YPOuD6LPQJXejRdQP5WfRjGxX2jGRUYczRJNA3q1+pNt
	iBg5zJOiAGp7IdLdWWNmw0wit/y3fg3zQCcnjtuNw4esDjaM4/9OTxGfHU5QuGLWYcERmLBzuGk
	ctAUTf24Zj0gRbOjstB4/9+CZzt2yQlMyGNTv0ub06sYnkJsJ8k4zjP9D46yI7oz6qdU83oypmg
	449YqLZ2kn3lHUbQ==
X-Received: by 2002:a05:622a:22a8:b0:50f:af89:ff33 with SMTP id d75a77b69052e-50faf8a1556mr82563951cf.7.1776850149055;
        Wed, 22 Apr 2026 02:29:09 -0700 (PDT)
X-Received: by 2002:a05:622a:22a8:b0:50f:af89:ff33 with SMTP id d75a77b69052e-50faf8a1556mr82563721cf.7.1776850148605;
        Wed, 22 Apr 2026 02:29:08 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba455043cdbsm530351166b.46.2026.04.22.02.29.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 02:29:07 -0700 (PDT)
Message-ID: <46c20e58-0e2d-4f91-8254-502e5b962299@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 11:29:05 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 1/3] arm64: dts: qcom: eliza: Add display (MDSS)
 with Display CC
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260421-dts-qcom-eliza-display-v2-0-67f8cf155331@oss.qualcomm.com>
 <20260421-dts-qcom-eliza-display-v2-1-67f8cf155331@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260421-dts-qcom-eliza-display-v2-1-67f8cf155331@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: wwWWPwMeK8e76yxtwF09kiGfrWY7BKE3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDA4OSBTYWx0ZWRfX82pSleuGi/s6
 s8FzdGwCbjAcYdzTxULZJPrW74iRPimkvqJmCtDEU1ex7xNoabicseNN+TeQH+fQitWL9Be8iI5
 C6j+QGRVzieGUtLR05LdyKCqEqgVKwufc33oiett4SRD6I91DDK8J3B9281eNpUiFe3SEqp9eKj
 AC3MirNyLIRahM3xlja3ryty+h9T6ThkZuf2StzXdR3go+kSK+Lj/Z2teZp8IyBS+4LovjGv+hr
 2PnfpxMSLqODSr/xTCVRlgTKyU7EOpC/fHolmdHx0K1+9KOnqevFdyKg93Lz7kVtF0JKb+1TlgW
 2o09rZjRfxCtukIdGIVk2ZMflhyRNcbf76oL8Ek4DE6UBt52e6VNJLhD4k9EGjUNDx9iq4dFvED
 gq8hvjG+pez3gWZXc2F0625T6CaidkHl6DwzoBDPOOiZdI5RDRm6B08cJ7TAGyDrtdNptzfwRyq
 jqk5q/Ct8hkxvhdpXJQ==
X-Authority-Analysis: v=2.4 cv=WKJPmHsR c=1 sm=1 tr=0 ts=69e894e5 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Xm-JAFNNr2e8P9nfQOgA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: wwWWPwMeK8e76yxtwF09kiGfrWY7BKE3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220089

On 4/21/26 3:45 PM, Krzysztof Kozlowski wrote:
> Add device nodes for almost entire display: MDSS, DPU, DSI, DSI PHYs,
> DisplayPort and Display Clock Controller.
> 
> Missing pieces are HDMI PHY and HDMI controller.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
