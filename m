Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C322E3A6F0B
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 09:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775555152; cv=none; b=f/gzjUioQ7hXCAz2o6XasSYEuaZDanPTHQtUv4QLWXEq5palg0Hz8zxMvsXdESL6VILfONP0uSr7b0cpuYA+t97mpbdt7L5bF0k80dWmYMDL8KrRRc/7A47m5KVc/kA3WgWk0++2eTYCClARb5/SLBIcY7MIv0bS246DrQaTFUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775555152; c=relaxed/simple;
	bh=4vu+xpeoaYPyVCYQG7c7Ux5C2i40ZI/n7vWOXcJWAa4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LTYdQ+XcIO6VxZNCQjHAdpUNk5wR5bAvpVizfO/h+6/cg0iFaO/Lns1iXXbhOkWbpYeMTW7goRhLt5HQIPZJGHOE//pnW131VkkW7MU9NLMc6rUE4nMrFAQPWPNUXqC5F5nBup4qLE92yJDBGKgMn5sIicOhsFcKemgueHSR+ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GHXcsII5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QM3OKVZU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GHXcsII5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QM3OKVZU"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376LPNh1405865
	for <devicetree@vger.kernel.org>; Tue, 7 Apr 2026 09:45:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cfskHRxWs4Q5ZjCixV6bAcEHRAVNhSSPy9XEfrsCxLc=; b=GHXcsII54awwJtTj
	vlbtWSyiu1jswi3cOAxhKlnjUbzxDKCh2Je2iKAxisMM/VaUTHMheBRX5hC08aLN
	/riaLY980pg/7sVXdjm+ZnSO2jjnAcCraJVzR75R5tTWV2wbR5r/86ySuj0tUr69
	o8aP0M1LNuXzcL82lAwdOS7qyO/gqrppr3Ov6ZMdGiuknSJoNyqwdw0dAe4F7YlL
	qlrpx/bNXb/JChWcTo58eyeUwDfsMqTyl5uXHc06Zko9cNaXl09JrVFU2iTD6ROu
	92YJ8Pa9qf9f8RPwyIcZLe2jS+/mr+bpQoNU0MQqfl8bl6ytsZ9Zi1PY3dswfc41
	uT9CpQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrat452-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 09:45:49 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8aa34663273so7175646d6.2
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 02:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775555149; x=1776159949; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cfskHRxWs4Q5ZjCixV6bAcEHRAVNhSSPy9XEfrsCxLc=;
        b=QM3OKVZUPatRvNZD82bhGn4+GGnOOyZqIB+XKRAY7PfcEHKu9c0yf059IreIE+4OlS
         am2aF/bpCYvj0JStTdV2xR2Oya6oO+zXSU/rnaHZNeZ4nP4lN4KJqHH2D1OHVMVuXzeL
         khIjRPXbvpwRUMUrCnQ9R79bwuKCbVuSxfXdy7vm+xn2DeTXVzASAM72oil33s7P8Ubi
         7CNqIOVLQjjchR+ZG5ABprnLHhYR19C/wmcGiI74FGtvEdMzOFr3K96HRM45/FjDbP+e
         rOmXdTr68f8+f5B/wFhwozpKWi2KrU/Lb/2m6H0oz1DNhxWilKbO0bij6/vlLtIRQi2j
         FdUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775555149; x=1776159949;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cfskHRxWs4Q5ZjCixV6bAcEHRAVNhSSPy9XEfrsCxLc=;
        b=Fzt5lsOnh5dTt3Scr+FoeMiKoOGOxDISOO6r6BqjZKnFietoVmZhi30x8PGzIfu0MY
         6IZ5E5TdMA0UI2tq78QBGfEyUKHkyYH/zUUMs0eJmAcr0OGsmhyKvW3V6iPHuXN3atsu
         cXRjgVKRmlzwbQO+WykKRfbvW0dQv529aEq6G1k0XBi3HKwi//cD2fUr1EtnTlRXrVDH
         ljIB5iKBBHbA0vpYrJb0tMCF8ie74xjSts10NNqA3ZAwY7IkterfdepnNvbBe9aTpcNX
         vuqBojnlVzjU4MH8aQT0zEeCdWX3WPaJslaAF5Cdx4/jJ+x5+KlBqFoSdLheGbumH6PZ
         Garw==
X-Forwarded-Encrypted: i=1; AJvYcCUJEBmYe+VRThgsfsgaJ68C8tTHgTI2PL4K6PMePri99PYZqlsaRO/58AlstSfaxKnRk1yO2UnxEJmB@vger.kernel.org
X-Gm-Message-State: AOJu0YygbEhmGCwnOBDgXXH2qb/picPOiatkvjaq4SdwypvvmgXXK7ik
	2G27slSD4H2ZXEjHY0adenVhaZPeHKlMgdbi9Wu4CbV2TJhVWxUtFbAkYZ9km9PCSlJj3QAEvMe
	zKKHgje14egySIwnTdzfhmSTzoSSBI9P4YiIhJOaC/zM4/odoLIEieCSaqknOTfg6
X-Gm-Gg: AeBDievWcX1+HEgnxSjb5y5Qn+qIIKh62zgDTOMMaNzVnHuCub6TavbBjak6ODmibBP
	vELRchlmxSj6gEIzr80Eg5xsNh3g9nqgl7rThKEAJ66iXgCoszMNRcW9vw9eYOrFi5+paItrrNJ
	Hjs+pm1LV2oAIlXNrgQ/LCFdwzLE2OCuKxwMeLVW94sT3g1oeRoU6Y5AcXKGHkibl3zoVW6T/X8
	YTzXD13T6GjMmv4u4rgaCnwE+bTDvRsoAUL7+xAbaZQ2VjZ3AClscay6O8TWxM4SAlSX2r7p73r
	q+4ritX9qjQDkgg51QfCgv/2VLWMkkiJW+b44YmkSQplDfvbu30iwWcND8mgeUByE6HCQSyhIPv
	Foug1WL62pfjr3mPtiUsYaKydVdiJWRWfiYetmzv783B10lbbxQUgK522DEO7Xqm3ukV+pucrau
	xgIMI=
X-Received: by 2002:a05:6214:5090:b0:8a0:ee7:7abe with SMTP id 6a1803df08f44-8a7022bbbf4mr191172376d6.1.1775555148584;
        Tue, 07 Apr 2026 02:45:48 -0700 (PDT)
X-Received: by 2002:a05:6214:5090:b0:8a0:ee7:7abe with SMTP id 6a1803df08f44-8a7022bbbf4mr191172116d6.1.1775555148162;
        Tue, 07 Apr 2026 02:45:48 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cec6c47sm516276866b.41.2026.04.07.02.45.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 02:45:47 -0700 (PDT)
Message-ID: <1b9891d0-39ca-4b31-a21c-32d8954aa7e0@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 11:45:44 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 2/6] drm/msm/adreno: rename llc_mmio to
 cx_misc_mmio
To: Alexander Koskovich <akoskovich@pm.me>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260402-adreno-810-v2-0-ce337ca87a9e@pm.me>
 <20260402-adreno-810-v2-2-ce337ca87a9e@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260402-adreno-810-v2-2-ce337ca87a9e@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: sYoG-_UTZZpDa5fSBAUXyP21GDf03oLT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA4OSBTYWx0ZWRfXzl1NeSGmwpfB
 ZUnQj/7HOcHKNz+PWfdN24dvBlqBE7pwQ7ZlkjhSy/Cs+Jh0YZJua8UBIKgAbCSN7ECzyiKFksO
 nRQ7vkXg9wxFMXYHFml0on5rCcnNPLrpF2CtvtNBbZByqrVsNvJcPyZblfd1G43vni53UMeey0h
 dKiWKDCtY4M32xhhpIk/3sYKJ508D2bF1+ffhRbyITYsXW0w091mD3PnHLwvT4DZCcwMXjcZkeR
 eQAGoN8FgneH7RnjhorUIT2YKkDzoQwJMc3kaheKYiCKGmvTLyJkpNhsarUkQv0XRZ6Ns3STdjc
 Jq3Rhl+Ie1e7kp73VooZUnhQVxcaCVP5bP3t2qSQSGCHODyBQVFirgo6n7rMGIpvBvtD8eJyeTN
 BgokOTr+IiCZSU8FG1baHqkcn+G3/EobrC95afVx7SutZVzFbRgezgz08vtj7Pg4d3tI8r6Y1Pu
 Uc1fOyUCRHG/H9e2jww==
X-Proofpoint-GUID: sYoG-_UTZZpDa5fSBAUXyP21GDf03oLT
X-Authority-Analysis: v=2.4 cv=D/d37PRj c=1 sm=1 tr=0 ts=69d4d24d cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=EWmrOR-qnjryNtOcuEoA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070089

On 4/3/26 1:09 AM, Alexander Koskovich wrote:
> This region is used for more than just LLCC, it also provides access to
> software fuse values (raytracing, etc).
> 
> Rename relevant symbols from _llc to _cx_misc for use in a follow up
> change that decouples this from LLCC.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
