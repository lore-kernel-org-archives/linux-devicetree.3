Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1844779A5
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778845133; cv=none; b=N4weSKdoqKQ3Fmu+bXwhk4QR/c0GLnij2eZc3IJQD1wPlAUbggMIDG2NAIyxFST2UiIkK7dfiD9Ai9QDYfmTqaVGOYveWEuShVCFpu8NbAzXDhzetCa4BL9WmrrkT7vWkTkTBYLV/5Jj4guhoaEiQ9hkcq31FMcEMm+xtDsWcJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778845133; c=relaxed/simple;
	bh=lPtI+7bPwzckydO0iVdbucmaaYhFTrd54lsT9zvvyvc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IoEsDxbqaeRUCUlaf3Cfo/62DgyAcj4B/YZUGF9sHe8BhmEgmRW6UZNNm/8vEnUeALGtZNn0rEt2K75cKUPnEyr0i4TNVCZvuERctTjJM/loOFFaeXKahh9Q6359ILb1PVKfPL/p9Z2V5K+oheHTzYC3dhFqo02sefiHqlZ2Q1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RpeTpTRF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZbE/TQkw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RpeTpTRF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZbE/TQkw"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FBYQW03200389
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:38:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ORx7k8VX7naCq5yHimIPgGtaL9fGzekDHfBPpm1ev98=; b=RpeTpTRFtNxQebua
	Rvsq/hiX3Wg8n7srNtsdZ/bngL1vlylcfA0kyw/0v2RfRF9ayilqJilY13jD6p0f
	3TdBos5k+MHC1yxYkedJmrx+i3pXlCEQVDiNYHwFRZ4YHbHuDsuu7nqb5MxI3SCc
	pTkMu10OIqw3QjZNm8/nnfCtUKVZFQ4kk+pbEfr3SstR61wVnL6DzbaSHfH/yThP
	l3mEgkPS33R665omEk2svN/8bJuL52UYFDYzqemeVOQd9uoiftqhfBuU9FjZCRse
	wdyChgYhE9mRgBVz4CuF1Ktv0HH98zTp+PYaKbgL0p4QNbKaRl+lxPfr+DIiyfjk
	wucXcg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1qu166-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:38:51 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-95d01ff3eecso434268241.0
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 04:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778845130; x=1779449930; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ORx7k8VX7naCq5yHimIPgGtaL9fGzekDHfBPpm1ev98=;
        b=ZbE/TQkw5k+/V2IvSlHKCY62T2ryMoU0/OXbU6z/8sCPwzdQGr/kLdBm6NSh838Bk9
         vsDgqaq44ENpEfM/Tzqjj/HIvggyMBf5mpJNwW1jVg78UvFS1Kity7jzRBZEl8MUQPnc
         IEd3WcYMEI25tT/trHplvAbwEg4QXzJd73j0ptMDELmEMyqas0gStoZzcrhuwchKUWEt
         P6i94Z2Fz2JN+RpCWD8oQ9ZvtkABiDqgGBEzczkUi1K9j6uJTyDMY9q5QAy6vKgfjMJW
         ipP/oBE0TeUCALQ42mvANa2IBtTwAG2IAAYc5FntWtv1wQqKCb0XfDakdtskgu/i7M9F
         Y3XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778845130; x=1779449930;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ORx7k8VX7naCq5yHimIPgGtaL9fGzekDHfBPpm1ev98=;
        b=pGTNxi6fPxr/TR5yJ6h1q2eI/2o7+kLXmSVwAdeHItAUK+uLv5Pu39JQY2YVG7v+Ax
         KGuYaIiUZYfRqYHqzL0lPIGyronyctxHgDvLfy1MaSrXH3v/4AlkOFMSrK4gkBn1hzI1
         zBLtdr+uuzP9P3lC1Mv9ZCgg5MZiLW2DKS/oHVyzY7LoS6ry3OyHvD5hkj7RvbgHAGSb
         29u7cvxu/mFu5Ja9oJ07RRSPn+aess7KEjqoFu97jmQowoGZLaW69DEas3+h9zaNEIqa
         8hOneo+egpLcTsycb7yzaopHuhOk2Bnggky+qgfb/Ifu5Ge8HQLeXGW5Bqtamolo2FwJ
         12Jg==
X-Forwarded-Encrypted: i=1; AFNElJ+kc4t2NUUMqfvuORTsK5nTIAFKo92a7Bx/WxvsWvQZIqFQFs1B7HE2bXXBcEv1zTmqpxXZ19mEc+jO@vger.kernel.org
X-Gm-Message-State: AOJu0YzbSg5C17232cne7s4/8qgysZQgy5xJ/YiT+CgTHw4eIN7pvsDe
	6lgfB5R1dLZBqS5Rz3gG/myVF2a50h6JSMqVGHpwWAEHlRk6F+TpTLZOaV4y7/QPWHXnCuaV8Ka
	WbFWKy5bs6Q+ewmaAGF43HdaaAUvYCr+TeY7Az5QLNdbYoEgK383QFQ00tqIoAjGh
X-Gm-Gg: Acq92OHkt4jezYtXnW5tcgaY5ZpATPb0tKgO6F/5L7GQf8J2PswO8J7l0ulT3PXB/uy
	i02yrVuaPkejG2xuAoEwhLUg/BMWwMpaJ1orkC/itYaF5s0XEiwb0cdb7GVNQSLpZrbyBTBezZe
	VTiggi4z7Nn5IVNNyw+YKi7CD/pr2NwfQl7z9jDV7e5iIL6gpqDLbIOShDNw9w+WNFT5BDW6KN0
	IlUBHFA5fo8ds09CcEnhL/Q4+zyTyfgFXuUkL0fXCSrmSn5EWScG1UZdDRKCeDLCk/kNk5JuCus
	UGdyDOsZmPNZlQDP+iB2QnCNzhbo0OAQyr9wYeFb28TV7NUL1Xg5gudmKWtLomRiwI3jw3q4p4i
	5gJsooiUy02Q3i2sVAAa+cRbzyqRA0xxGXD3RCJT5SRRxsDF2RSq+rufiZ59fFRqLfYoTJltDbi
	yruAw=
X-Received: by 2002:a05:6102:2142:b0:632:8717:e553 with SMTP id ada2fe7eead31-63a3ffa265bmr443664137.7.1778845130185;
        Fri, 15 May 2026 04:38:50 -0700 (PDT)
X-Received: by 2002:a05:6102:2142:b0:632:8717:e553 with SMTP id ada2fe7eead31-63a3ffa265bmr443653137.7.1778845129728;
        Fri, 15 May 2026 04:38:49 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4dec7c4sm221268866b.40.2026.05.15.04.38.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 04:38:48 -0700 (PDT)
Message-ID: <f6fac265-d156-44c3-9c7d-599803ea79a6@oss.qualcomm.com>
Date: Fri, 15 May 2026 13:38:47 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] arm64: dts: qcom: Add Eliza-specific PM7550BA dtsi
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260513-eliza-adsp-usb-v4-0-839936e89aca@oss.qualcomm.com>
 <20260513-eliza-adsp-usb-v4-2-839936e89aca@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260513-eliza-adsp-usb-v4-2-839936e89aca@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HbkkiCE8 c=1 sm=1 tr=0 ts=6a0705cb cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=IyLcjOHkEnF8UVrsuCwA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: wPq5SBVgZH2l_g-Kt3ravW6vrypFvwJB
X-Proofpoint-ORIG-GUID: wPq5SBVgZH2l_g-Kt3ravW6vrypFvwJB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExNiBTYWx0ZWRfX+zJ2WEGBE+l2
 tm9zNPgO/9G7GAwbzcbjcG7XjhVRts/WOlsr2OhuubhYHLXYf+1+LT6zp421p6XvPbLHeontBc0
 3ViQLAVw5Bg2oh6M3GhExHlTQnngoj6dHQHg0V7JD+gaam4FbY1BfWI5rNh4HohtP0fw6qJJrTm
 Hg4gldi3VtFENr5T8qHIh6EQjHHAl32XHx71VTCEFgmoRgHKCdOW58baT1s/AwEYOsjM0eNNx/j
 DeHrev/rCxaGOC75tyByTfvJwllSqJ0ovXnKnV1o+QwmgOqgb9+IsDR8XvjX3t+dB4uxd5ueRQ/
 AriFZ3MfnVPqmaN80hdnioQNozk18ZFmESRKl8QcUVE0X+ft26yFnUEr8Ue9/ph7CIrMgGA9WkW
 QjZC4vydAguedtvnjtzy0nklvk5KQzSN2Vc99yDu8myKuAelFPUKR1gezSUO0ogHjARWPPSO999
 /dMi5DOhewrG7i03tVQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150116

On 5/13/26 11:18 AM, Abel Vesa wrote:
> On Eliza, the SPMI arbiter supports multiple bus masters, requiring
> explicit selection of the master for each PMIC.
> 
> The existing PM7550BA dtsi does not provide a way to describe this,
> so introduce an Eliza-specific variant with the appropriate bus
> configuration.
> 
> This duplication is required due to hardware differences in how the
> SPMI bus is exposed on this platform.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
