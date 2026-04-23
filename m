Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070E8379EE5
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 11:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776944037; cv=none; b=dQoUr9nCJSVRO1WM3E1+mQsst6N6FkKHwDj6J3iF8uf/1MU6QVRHwNMn+WkzgTzoxlk5gzeaavsbnOGtTOF42rFobnTdIv+CfxenpoZQ2Y//mfY2WeXmM5gzrrvcIYgItWdhnKEpAjC/93WaMOHyN3s+rMvueGF/ONqciFNdIjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776944037; c=relaxed/simple;
	bh=xPkBnI2wgGNOydM8rQ/yy+jiFReNyjAZLlORe4qET9A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rEq0+sD0GOBMUTNBk6xc22alMdP4vvDIL/0lgK6AivJDf3h53JrHvU4ZLrLpRVRn/HB6AOsSBXZrJCecRhu+ab90OufRVmnFCHm9jva21S2RE/MV2poTYv3gnekS4WgnfQGyh4b9YSiRhwURaJtIZbGLd/nN5AgbQVO1MS1T/UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eSg12e4m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jw/yVxz3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eSg12e4m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jw/yVxz3"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8uL45987855
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 11:33:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0JzILOHEjMNOT4SKDrr0FqziKlNV5iNAFkS/CvFGT1o=; b=eSg12e4m79bxHhLJ
	Zqks9qdFV0C2Md1tFHxjyrYvbYXCpAuunJm1UCOoEl0ks7P9pkhX4Y8mw2LiPiC4
	kXinl2dJzLyZhOpr/BJVDWzKBDtHS/2tdu4WQeU0F5HiS5o3S3zbWUOiql0glnCb
	TnEeDanu7is6I+JF/sLQcaFRAHElsyHjfNa0Obt6CbKdnaO4e9xOQcRqFVJ1Vh59
	nxSKT91vsU30omP3z+fMJB5m1FHidAcYR1rqnJydps2FcpmbdJ6ntPFjjCxxjg1X
	iBTdpq0ABOLAdtizxG+QQhFa5HdSmjY2JiNvHMWnyKKajiC0SGQUg/qUGStZbIOc
	1KwCOQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq16q3pb3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 11:33:54 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-610672f7120so350752137.0
        for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 04:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776944034; x=1777548834; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0JzILOHEjMNOT4SKDrr0FqziKlNV5iNAFkS/CvFGT1o=;
        b=Jw/yVxz3EclFHbMyHCqr6AATNfA54Ygl/pDj3iPZ+qseUSH4cZg88RleDhoELhAhaD
         whKRVliY4FqO99pRElsHhonwusab8wdTkN3twVAVS+B4jFskaji1TyGj8EHL5jaQNWtX
         NZ6hacCRmSYtWXxC6NQdRbsnKboZT6eq9so2ObV1sdFcw0yI1VrlavSSo7p+sCKAQWOM
         WUgCeDBIVQ7UdkgKvERSv7y8s07BU6BRovAULFVKpsU0eVuEUn9DerUfYKnr1kCRTXyn
         XYQp9+uvA7mUwpETp+7Ms8erUkjlEhybgGBK1GG5f7+gfA3WrLE0y92M39YwJnMgJcQv
         1lZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776944034; x=1777548834;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0JzILOHEjMNOT4SKDrr0FqziKlNV5iNAFkS/CvFGT1o=;
        b=q0NYWq6N2BQ6wXV+nO3AWswO9rSsgurYXhffQcTocadzdtlo6AaDT3e1+UbkmYLfDh
         e+YZEueIKUXMjLJ8HnN7j5dKV6z/4P920xGDITc0XMZdCyHexk9Xjnj1fQ8pGODftX2L
         F9WkPpz/13ehXke6Q8PF2YfN7QVSNxdny6SNgzu8qVyQyGzL+1HlllZPZLylFwHLV29o
         ozYXuIcr7j+cLO9ZWIf4TJqg9XRPAsCb5e1gdU+x5Hgas+uVFybW5IZgDX188MIEbK9b
         Fa1IcTE0nGd+Rjq/GT4eiS46y0w8H1oftwR5S1nt7hnnfGa/aUTSV3EX2hxDhUkSGZEK
         RMrg==
X-Forwarded-Encrypted: i=1; AFNElJ8WBbG4qxEX/vzWi+yq8lA/txKBlzBKXwomYD5Oo87mCDMWgqLdnZMS5WvymaqvP9i8d2Z6T3ZQ1V5u@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs3irvAXqFTG31tq1z+qwTem8Si0JtZ9FhyHqBejheAgv2VLpJ
	bE9dsEhw9HyCvQK1Bk6P0p8NgPg3zVLaXcbtptpUxCyVEypMvbLLMy9oF+V+0AV+2We0DU32t6F
	WeRW4WvTiqmOSA1qf4+TYtm23nBXrstx1lwG3/AdsapI573CEhUdwcWjoGmoIJfU0
X-Gm-Gg: AeBDieuz4Z4796urmuIntAn+A/JO0yq1u/8PKQinLeHypwh0e207HOmTXcPeAHQ3XDK
	+HBZmM6lzG3zBw1Zx727aHZir0NMDVhxiXo7iJLsJrTYW0rE2qBkBMZUH3Uxx/o9l3K6Fsc5JDl
	KFKIwezdYvsI4ORFs2/2mCLGfSSRyXck9EQVUvFP7nb1M5xjUHX1s+QcKby3iT0D687slp/TEHN
	rMKdorXSRKKiONuVqO3Jpfvn3wh9tqRNhi7N4aGkDYuVphLyrfsDHXaEFpTGOEHuopbwANXCEpX
	TSOUmxzP6QMzPmLg4OVLe341Mk+WdKZM6re+6M5rtgSInDPuLj+cTppoGPF9ZbuHFiua/L67XNg
	dG4EdcrH7FyDeEqHZ0UKENhNiGXx2iHV5j6Fev8EzYe+Gv4HqD5jrZOJ0qoDJ2he0kGDIgHIfqt
	+nYwb/8uVZGels7w==
X-Received: by 2002:a05:6102:26cc:b0:604:f71f:9f0a with SMTP id ada2fe7eead31-616f70f6114mr4619790137.6.1776944034386;
        Thu, 23 Apr 2026 04:33:54 -0700 (PDT)
X-Received: by 2002:a05:6102:26cc:b0:604:f71f:9f0a with SMTP id ada2fe7eead31-616f70f6114mr4619781137.6.1776944033997;
        Thu, 23 Apr 2026 04:33:53 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb5f66besm43901711fa.13.2026.04.23.04.33.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 04:33:53 -0700 (PDT)
Message-ID: <b86f2bef-206d-4399-94cd-70f7a6859605@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 13:33:50 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: talos: Add passive polling-delay to
 gpu-thermal zone
To: haritha.k@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, manaf.pallikunhi@oss.qualcomm.com,
        gaurav.kohli@oss.qualcomm.com
References: <20260422-qcs615_gpu_cooling-v1-1-d5a984ac29e3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260422-qcs615_gpu_cooling-v1-1-d5a984ac29e3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KPNqylFo c=1 sm=1 tr=0 ts=69ea03a3 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=75JJAfU0c98d6Js1ZXYA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: G0pYOrszlb5NnIOkfk9Cg2VgqiAOqLgz
X-Proofpoint-ORIG-GUID: G0pYOrszlb5NnIOkfk9Cg2VgqiAOqLgz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDExNCBTYWx0ZWRfXw31r19kDBycv
 m+bYK0esBHXDY+v1fjhGoiE3xISTIR8PLWDcSZbWdrrU9VapUlle95rd5/jUaTOpk9y7aikszNY
 X1RS6Jg6dqOcHr/l+Ep9XDi9Tzz0H1WrJHtYTbaok3C2QxcU8b6QIJQG0n5wqKReqH7rIzfQehI
 JOFoIVY7xTJ9/LoBYD1Uz0Q9xVRsGrvB4l/gCI4XPWFk7nZCVWMDVn5++BSQHii8SH/iH2CWZ84
 eU4nLwDJ34Hy5H71/D9pdVS887tKkat1cZtzHf9XJyWeNLbZSJtTXYbm0dVk8JN33H+QN4V9hCL
 xRP/CYpTpvu+9lK1jEvJ37yB+5tYLQLB9NiCpwXqZOLsM6jGamtwVnAG02hpPn33Y/reltNvN1N
 n6sx9PnOh65kOFonMm8cH4+VieK3jI+RmnIDoUH4d0A9E3I0YmGSXTO2lTVD6wB3GRaqjWYI9DS
 blmn+yPS9p4NRAAMqpA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604230114

On 4/22/26 3:45 PM, Haritha S K via B4 Relay wrote:
> From: Haritha S K <haritha.k@oss.qualcomm.com>
> 
> Add a passive polling-delay to the gpu-thermal thermal zone on Talos
> to ensure periodic temperature monitoring while in passive mode.

I feel like the "why" part is missing, i.e. the commit message should
state why that's desired

Konrad
