Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E6B372EDD
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 16:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788194636; cv=none; b=X3/61qFOj34UDhydDiACJqMqp+lyPJMw/Y0tIuHu55op23jVVJL446wc7oPLNehYfXfEfpHr5Kgg7l3tAnq4c+l8m63icn9SGyjlnbVrATDMrq/JjBZXzgxYQ5QxqChMkwgR2d1anGE+wjQiIjw9nIyAxPuk2o+lkFQPyDC5Kew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788194636; c=relaxed/simple;
	bh=NDHKMcrotrpW63l0I/1FWliwQz5j8JzXrdP6dzyb4x8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nqqfp6vzggnf1JcoG0XpCkhUKHpK4O4HmLsVLG/RC6JwhNS8SBruNcJIijAFPHfTEmp7M1srw2Hitv1CZG+MhX3eQZIl08NhfxEHL3SJc1Wxz+ZV132wBii2yTSMfxVOjurbFQu1K2YAig6qy0fuMr806IKDlmc+ybpDF4Y9Qek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=er3aqxC8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MjOVOs22; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="er3aqxC8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MjOVOs22"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VFq1in2900888
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 16:43:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cVfCCX/QbLHdAwzzCna+Dt34SELB9Z4yDIidd7xilm4=; b=er3aqxC8PVHtCYzV
	L4jlvAHk+obCR5qbz7Y0Ad2XJSb+WD+CHraBf5cnTLZsrtYLwExozv2sslWJgNoX
	DWuKWlJBMFLG80/GsnBAL/ESRCF9MafyALmedoTfs2rSnAzmnbGLgyXBmeoH3rM5
	yEiwdVTq4ACOJUUqooef9R7YtHdYRpEVj9sXQXEdTFMlvKHeM7vKqAONyEFoRS5/
	gTB6rrTkKFtu+0mK+XpGDQ54vztxgA34oJryU4ygCmlTSgPJtIRU7uRCGM8M8yA+
	KI1v9JouAhTUYwR3Op32gcurGiJ8+qYVOx310B6g7HB+FgrFnlRzogMFuuK4Swht
	m3naMw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6vahwsh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 16:43:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-930bd2bfc45so122608685a.1
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 09:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788194632; x=1788799432; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cVfCCX/QbLHdAwzzCna+Dt34SELB9Z4yDIidd7xilm4=;
        b=MjOVOs22i/0Hv+2ey1owZcNuWyFEAk5p42U3LVV72v4uL2axzkLoFQLmCBIWrxvdCi
         /p5kxxOb+5UY0k3Xx9AtE6Ga26dKZDYsbKVMAfuqIGTLnyR3rf8DhvUEbEEW2cTWI7+P
         W2yfbWiNEwZ0UMXBpBViFE48c7C30fCr1tx6QuUTjJ5L0KvwOg/S8jYjxVs4C917cHr6
         P1X0Z0aW701fCsL5ISWzMZTMswTdpUHaDdqyh9ANQehDiinXoHVt0V8N3a2qf8AOlq65
         2y4rsq51hgSpHHFTKq67l1aAqo0Ny9SUdNBwCMFj/JQlQBl5+Wfoc6sPI3OpaPQycU0q
         TnRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788194632; x=1788799432;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cVfCCX/QbLHdAwzzCna+Dt34SELB9Z4yDIidd7xilm4=;
        b=WdJzPyt7dloyL+47TkePf/hmTY4FJKhRZmqcmP5aZuzKvBKzmz+GCrHdVRQpDN4DtS
         y5puhuAaawvdjhvvsxFG3JpBUrTqmq3TPGOXb3QbpsEOPwaJzFWexjFM0Pe2XkLgiLSr
         eRK2moEUXRWiKqDIKil3/AP4eidd9lM+ixoq8hS156l8i6qJtWv6Hg5gdmpxNwWTD/6L
         GEIRCv+RloRL28w5ER6nigLeUBO9Grx9H2R0DlcK4PtcWkYq9mf5dauRlvsEstbF+lKN
         z9JjyitdWDiqsOuZek74m2QT2eDar7jgnkoHepQj1MYnNomgtxIXdlDdCtAbzSAE7Ee9
         fGwA==
X-Forwarded-Encrypted: i=1; AHgh+RocPLjiDEy2JX4amdIXtkqQV69tFMClUFtvJ9qv5iTFcKugCkG8H2q077TFUHYXuMiDhpDu+JRIoEO0@vger.kernel.org
X-Gm-Message-State: AFuF++n9CDA7V+eDCo9qYykd2yfKz7fxWE8HpWJnwS5HxPdsRBPFUepG
	2UYiQZWmxe0rnS5gy3BuF/ahwqj4jaWtL/hH6AgxclNBMjD5tUfCI4ZThvtb0c0lbVL2CoJ2NLY
	GwuYKcjgNC9JI8AVgJ/7+MnHLEhXYND1TX+6NyuONXAHsAdneF1s4Axz0R1ba0VI3
X-Gm-Gg: AR+sD11C3vh71oE9hK2/9ze6/R4zRsJ/hQ4IriRL7/jCxwdM42B4uWPzh/7vDU0jW0L
	crRMELwgb7APtchi4sT88Iae+7ULKUZOlP1M/4JjB6ScjkRdk+H8PXA9NX34+/D/yp8XIRAFhMp
	jCOPOrVCBukZUHoyZcvwF1mdIZBvfUqdFwiVaiwCI0eK54+x4ejZ1848PPUjkRvONw7JxU8bbrR
	LLWFH9/8nVl0Uns7kpfPvmebFUWNZftRDvpS8JqYybaJaRzeX81QcdPBNEoCy0ZfnjiMW5PUwOM
	FC14Ggi+XEe4LPkaxNJFR2ibx06pEaOA/Hs0+tUhv6qFuUN/RuwhCRvAxoBpNWTFaGttAI0AMIG
	vL+HzZcAW4iJijkmFYOCGrg==
X-Received: by 2002:a05:620a:1722:b0:930:a08c:cf9c with SMTP id af79cd13be357-9392873f3c9mr1005151785a.2.1788194631569;
        Mon, 31 Aug 2026 09:43:51 -0700 (PDT)
X-Received: by 2002:a05:620a:1722:b0:930:a08c:cf9c with SMTP id af79cd13be357-9392873f3c9mr1005147085a.2.1788194631028;
        Mon, 31 Aug 2026 09:43:51 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255ee27b19sm455018966b.19.2026.08.31.09.43.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 09:43:50 -0700 (PDT)
Message-ID: <294b2d4c-31d7-42fa-a55a-b57fc7d0ef6f@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 18:43:46 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC/DO NOT MERGE 08/12] drm/msm/hdmi: Add support for PM
 OPP table
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        linux-phy@lists.infradead.org
References: <20260828-drm-msm-hdmi-eliza-v1-0-67843277de17@oss.qualcomm.com>
 <20260828-drm-msm-hdmi-eliza-v1-8-67843277de17@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260828-drm-msm-hdmi-eliza-v1-8-67843277de17@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDE0NCBTYWx0ZWRfXyFAymtSUTzF7
 oYx8vu49AI8QyVPRNxCOyT2bHQCcrPOXHw4Mt7I1vjMhhRhNWBcenoG+QzOEO9/DNcPxkq0V64X
 GiaOuxp1zOQ8Sb2CsjJamjCT1aDbl3VARwxbwDKEHMckNjyTSLpkTW1ektKf8K47PeT3JtSCS0A
 ScsbyReub0/i+ETMmjErLK4MJyNFEn4ORv0BY2DoYFqgrCm057lCiRpBhRaqc79TdxBnU8kqHyw
 PK0KVPo+wyL3Vhz9r0qV9C0ZCAcxgplvgOGMO0lQDPdNwkfTvnGUpAdzeZmooVSvBBlH5Ks+Xna
 eOLWsOofrFJgRv5bSnG2HHE91njAR0D7xB5oxTTzgsctF/YIWTC7KMf8r0b9x+qBIN2BjEINwLA
 NS558hT7Vzd+feSB31x0SXV/ZpeA7T20HJbMmIVVDR3rg4hazxTpli19a1TrXVp8sbew7rGSDSj
 NuM/PzGNsnMWwpjOZPw==
X-Authority-Analysis: v=2.4 cv=YYmNIQRf c=1 sm=1 tr=0 ts=6a95af48 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=oZguCmW5wH7aHc4LmIQA:9 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDE0NCBTYWx0ZWRfX0np5lM0yn8e1
 biJluC4PadPDPC5uP1IlFqPh10BEsaEYqPrZMXifAGOy5VUWxEG/FBHKtI1m27PXSTb4wwxoi1B
 6Mk3eEM4SKtFoEnyrttf7NLNe2zIKlA=
X-Proofpoint-GUID: 3hyN3rIJEYlJPNkjjZMkUY_9fHiE3zDK
X-Proofpoint-ORIG-GUID: 3hyN3rIJEYlJPNkjjZMkUY_9fHiE3zDK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_05,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310144

On 8/28/26 4:05 PM, Krzysztof Kozlowski wrote:
> Allow scaling the domain rails with PM OPP, which uses the pixclock
> ("extp").  This allows proper votes depending on requested HDMI pixel
> rate.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

[...]

> -	if (hdmi->extp_clk)
> +	if (hdmi->extp_clk) {
>  		clk_disable_unprepare(hdmi->extp_clk);
> +		dev_pm_opp_set_rate(&hdmi->pdev->dev, 0);

FWIW rescinding the vote will happen automatically as the device runtime
suspends. If you think this is necessary, let's do

dev_pm_opp_set_opp(dev, NULL);

instead, since dev_pm_opp_set_rate(0) is a ""dark pattern"" that is
usually misused, see e.g.:

https://lore.kernel.org/linux-arm-msm/20260728-topic-dpu_power-v1-0-e7783b859a70@oss.qualcomm.com/

Konrad
