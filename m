Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E781F33CEA8
	for <devicetree@vger.kernel.org>; Sat,  4 Apr 2026 23:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775343774; cv=none; b=U+vz5sQhzoiHu4k1QTQbISRhMoWNX+8FEDBtCO8Loge2y5dCpekcPDS2ys+P5GkjLU/ztu+JNruStC8TT46AeFtygI2jcCs2GFjGlvogoIGqQyfMPmXf1i39SjIR/YMZGmdrj+pyY750wZjBRJA2A5R43YHiCmvXT+nPZphTcW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775343774; c=relaxed/simple;
	bh=coPFnu8a2n+qWRhI4LWkWpce4vEalRAqJGiGW8z4FK4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YKl6uFnN86LVb8sl50NocxylfT39ge3zn9oU0SajkFg1jkjkQJAKkCoF/5HYj4skmBVbEHf/Bxn+OS45nPodBYznRqYZejdQZ21qmxNrMhvUwSM5FK6+uUrQ/kh+cQ9xILon5l4y13oVkmE6PAFVY4lwJgIs7SlCoghX7pA1J2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E8amIfe6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e0UmfD9d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E8amIfe6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e0UmfD9d"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 634JFPDc3591888
	for <devicetree@vger.kernel.org>; Sat, 4 Apr 2026 23:02:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hIFgpkquzAjeQNC3t8wsfdrd
	AKli3ZjO8/bY/XiA0Qg=; b=E8amIfe6I+w9GvLabkg2HvU8/xKOpvHxLB6ziRtD
	cri3RBPcJ5cFUOidi/JH1OL5+rG2gCC+P5w+K3ls5RyHtzvYiD2WzrifhLRWUD+9
	rNZVo7SvA/s6MzkPDfcM/w+DzoWbWG3ZxnLt+PIOiDHllOKvEvViRIkR5wlQaOwy
	ET3N/8FMEj1zjJSCxnBeOtWnxAc2TzfejBXZM5tNLxkqHdsyE6mQ7GshkqCm644O
	sYT46U/Uq621fFOfNeRDqOrOLFAmNlqb2SMGkN9ttlPn+Zlg/0ubnNB2LVBTDrER
	H5jRG/8DoOm0JBIGFhrPS1Tmdq2gQxmQW/kaGRC/qM7z1Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dar0mhty0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 04 Apr 2026 23:02:51 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50917996cfaso95432171cf.0
        for <devicetree@vger.kernel.org>; Sat, 04 Apr 2026 16:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775343771; x=1775948571; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hIFgpkquzAjeQNC3t8wsfdrdAKli3ZjO8/bY/XiA0Qg=;
        b=e0UmfD9dFmBEY6hQflakwsWWEuVhRnaZx10r9V0NbbIBwMY/8737WMvKLEyO5IBVHo
         WBf7kHe9bi5q8ZWNyW2tU4VZrAX+9hra8cvn53YOUoVCip6mPCZ+weoljYS5p7V2uTlw
         ais9qkmAWLh3AT1eob4oDHVrljCUNaDd8Ur3BOIJjratbInm7bmlPVnNuY1WxK4uM3PV
         VAjTB4fM25y063jw9FhPzas8sqgKKTXFcT1d4czAecq+wpCarGmxfMvphOiDd7JhH941
         1mLVfmVhnv/4hxE7GPUHiKRrTnfP+HsMcma4KEi9c0HQIf58TvS8b0OF2zwkQv6NXoTU
         tQDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775343771; x=1775948571;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hIFgpkquzAjeQNC3t8wsfdrdAKli3ZjO8/bY/XiA0Qg=;
        b=KxuWC9t+hfB5iIXDAoAN0izgKFVdSuroeEt02P9vkARTO5XMtjq8+11vQVMBivub4a
         FZuJqBc+Tp375zG9tPyxwEBL8pv0uXQPBvX343lvGEWEJrJuyHl1cjI54wceAyHqrQdL
         Uo/tOPVv6HN9JHy65RUnguUCiz/vHFJ2ty+W8ZWmMgaX5Uxb6ADwhqFDVBxh62Rrfmqp
         H/pZD8a48+MFpEGfg3LHLArlFKxQo+H61r9HDeG7pLbr+6cWSEa9H6pAD/dx5KWBBxaS
         mXmMAOK6ev0Ob4nrXKgwS35Kn8MnKe1p1hIMOWZt93dZRnuwD8ibMD444MQmbuM29mnK
         thUA==
X-Forwarded-Encrypted: i=1; AJvYcCUrxe9C8tB7/hoGM6c2vRoWv/W8GhBjx3sZ67Vg74ZsLBxz8wdYRkT18X1A4SOtQ+KcC0K0iDiaacBr@vger.kernel.org
X-Gm-Message-State: AOJu0YxgHyvgCRBL/+echBDM3MBYbOUuHk+5VQ83uI2ShmcOyMO1dBzx
	Tuj7S+P9s6lKooZLf7JEuPqZFXILvNnSGAT5lRS+EoeWPTgfRVXPmrAiWWnuKOzBKboOVNvlQhY
	hD3DmsjIPP5Cc78sEGm9szzicxaQYE2uwstja3iOrO3ZG7a+RN9Gq6W767d+Agfjs
X-Gm-Gg: AeBDieuH09D9j/YcshnIPMJ4Dawr/w80jlLezbXtTujJ1JRKPihuu9dReHCN0ncoP0d
	5okG+jzxw+7i0fj2BWdKpYqIusUppnlM4qxjtaMmSMrj1dnuboib6sPv+GHC+2HPSNUMrygbPBo
	1O0MDuzVDDBMk/pEud1NNziSpZv0mtbuyce7WVnrW4zbn3BP3QRe7R9XyzF3kkTp7EhZ0DszTqL
	6mC4zQMj5fYpTg36A41l0ZlFViW7TrmVbYy/eugR0xH5few4AZhAOzmAayjtV5vkE8Ch5VIaIqV
	TUK2/lnb8mNlzLDVsTN7lncR3QLcSZiIWj8RApTxzt67RpUl3gti+BG8TCqCQ0+quq5CeqTbMuU
	Sm5n1P3vUHBlTwSCnfSGkaVdCux/sKyBlKS8Tp7ypc0CDsQnmV9Id2uYp6TKF25rgUV7yKkS+sz
	jFCkdIoFVOYxoYSxd6HKGrvYKbtyA763QDuuI=
X-Received: by 2002:ac8:58cc:0:b0:50d:8699:ecdb with SMTP id d75a77b69052e-50d8699f5fcmr13553151cf.48.1775343771244;
        Sat, 04 Apr 2026 16:02:51 -0700 (PDT)
X-Received: by 2002:ac8:58cc:0:b0:50d:8699:ecdb with SMTP id d75a77b69052e-50d8699f5fcmr13552411cf.48.1775343770627;
        Sat, 04 Apr 2026 16:02:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6ccc8e0sm2417132e87.58.2026.04.04.16.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 16:02:48 -0700 (PDT)
Date: Sun, 5 Apr 2026 02:02:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/7] dt-bindings: display/msm: dp-controller: Correct
 SM8650 IO range
Message-ID: <xujhwsk3ne2nlzs4yefb7eiscdiqa65xllu47skbdk4wgrjw4p@eicdyca5gz3w>
References: <20260402-dts-qcom-display-regs-v1-0-daa54ab448a3@oss.qualcomm.com>
 <20260402-dts-qcom-display-regs-v1-1-daa54ab448a3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402-dts-qcom-display-regs-v1-1-daa54ab448a3@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: R2jtHH-IMNzeqIKs2jSDnptf1FjUAsNT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDIyMCBTYWx0ZWRfX9233/45JqFNA
 Gmj70k5C0xV1H3jEJBJOpqDJcXJqGWsTkoXeJnEgBBE1Tdy8i8VVHNVCisjOn7Qa8rgDwjrUOxv
 44BnfI4QPLeKtKQYh2WlTdkOzFS8yuTUL/Zb9Jr3xeKC95/ld8CpRZ9QO8eC3rHpMyt+bhe5Z1m
 hlEQDCBMEfSwAemeXEC/zoPoZiGB6zew5klWqtqsqrMrA135g/8eMZN7BQk+d7SBLRn/eb7Hznj
 bUMh8DwYvAboOIHlJQklRw/vx9SEd4O9RXVdnMHaRdsS3CqRO3yJZmNl0FgByAFivTmhMCropsq
 mE8YMgRbgkhWOgTsbQQw6E3XdkSZdY4G0xCTnHU3StIDUaEUESWdyGG4Mpo7NDLSynPWV87dui2
 NhLxsVNp3NRQc8k2EJfU1usHxX+oRsq4VoLm8xDnYQ+ml/NLMqSJdCWw8JdIqwzCHmgeM0SdXRE
 R1UZTQSgArEqCMjp9MA==
X-Authority-Analysis: v=2.4 cv=PpaergM3 c=1 sm=1 tr=0 ts=69d1989b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=P-L8s1RTvU6d3TPFcGMA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: R2jtHH-IMNzeqIKs2jSDnptf1FjUAsNT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-04_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604040220

On Thu, Apr 02, 2026 at 01:45:12PM +0200, Krzysztof Kozlowski wrote:
> DP on Qualcomm SM8650 come with nine address ranges, so describe the
> remaining ones as optional to keep ABI backwards compatible.  Driver
> also does not need them to operate correctly.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../bindings/display/msm/dp-controller.yaml           | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
