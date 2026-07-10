Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B295407CD6
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 10:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783679138; cv=none; b=PD/Z+fnfu6N/mYxl8Ol/iL6IM2iMM44DDl55QBKoAZjDdKgP70XnpljR3lql7kFbNxG559PAJrCGgSz4o/YiJ07xd7Iv/gtITFo0eCGtUK/wjc1uK72Cn8DDWGxop2fqmzYve3wSW7KnvWIQEOICKld+LZEtsGYMlsMn7h8YZNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783679138; c=relaxed/simple;
	bh=Z9+ukSgv8behdz5igqcYAaF4Pj9GakPc4OjzRwDByqU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eEwCFPzD3f2ddlC6G2KADhtsMY8HJPjAhw6z8tT3jTltvYGrQiVmmP9HGdvma+CRoMdLE+xQr3ZPHjqZ8Do7IhRJ0WMVba7qAgVbiUdR+ez+xtpB6uQOOr6lZMfCbaU6CKOl0irPruB+XH+f0/IxTo5jwh1agfPh05sItCjqOcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d3aACU/L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KgkoplN7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d3aACU/L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KgkoplN7"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A7ddUK172577
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 10:25:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CUlTfSYXAgoPa4vw0S1q7BIkSnsykyt54uNZwdM7Wys=; b=d3aACU/LgmjwGmR4
	CbApjCYNLk8MDaIEB18c9dNJobn7pdmGb0Qm2q4OQJw878quv2fdmMKLmeL4Skm/
	hBR4ApbQoN3bS16FhaGA3stC1akYCLwZIaUOIy+qBmnHmmG8oioVpSkkQiddJUYw
	Q2BoNcMdxpgt6bKkc7E4w4Ucx5LHqlhszl5eQxERsq58CUf15CDhryPsIVaOYNPc
	q/mnKnmc9DGGOX4hfYH+k7qlHWtimju3BFruqskbPYIZGI8KbtjLmvEErbjtJEM4
	hXDgk93iQHnoFjR5SchQOGyE4AgyREoco5R28eLKxV6AmPGxX03ZQCLlMOpXXIUc
	H6EIQQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fanwea1tb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 10:25:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e6ed4fe99so137058885a.0
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 03:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783679134; x=1784283934; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CUlTfSYXAgoPa4vw0S1q7BIkSnsykyt54uNZwdM7Wys=;
        b=KgkoplN7F6QRDucPrKYN64ceX4Mpm6PcKutsGhqJ6Fb/jm63seimglyvXr3DBXP1xN
         N+XaYDLpWTpLbYwd1XLe46bkWs4xry16nwgvMhFqMtB9IFyUHDS3cxEi3h5hEQAX1z9x
         PAO/X2HCU05eUZ0b2A2hWJY3lpkcyvG7pfqI5ECCJLgiD+slFOl8KyKgcNbbPbfYwyaR
         nV5ZVAdnO6K/23xdayUlxco50UhZmKVJv1/AGcj5LI+w9O6XaoYgNvhj0t4IlbyFwjc5
         3Vps3wS8SugRFYUWGFZaeQuVQLP3E4isKZpO5v1o1AaNF4YulyJuD5XPO9ddT7r5f1ca
         vcqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783679134; x=1784283934;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CUlTfSYXAgoPa4vw0S1q7BIkSnsykyt54uNZwdM7Wys=;
        b=R6OQnw/SUoWw22z/Vg+2SPiB+Y47AHOsQ3U6EkCyp1PeXcGC4ODBnMONfGQlGRjEn3
         86u0FlrQrroaQ4V+W8ojZjrnrJvgZADYN8LB7zm1KklxRbHe0J3Wx5B2IMJ/pK34qm50
         2iPGpK2gdgcWBbc5hjxkDjtpLHrEA7uAPg2E1uoiE6/jPtYUn5h2SsD4+Pkr9HutdQx8
         4uL+jxTwXGToV++iZGh7LHY71Pa65R6zxsmRnebTEfQ0ZuMp+jo1NB8XXabkwibPjZvo
         c2Cd8YEmjEdpdilfExwKXQbnuWnu8IdLwmAKFzGyttqmpoDAYpIURGmvF52VgpEphxSw
         XTVA==
X-Forwarded-Encrypted: i=1; AHgh+Rq70ir2pWLbgK8HXN7Qk6J/iXhfRMI0s88Y/Gkb5HVN6Nc0RYepEsZHCdZWiyvuMrzjDjCr1Oq3g50G@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj4KJA5q55XGoW6KraOtyWLvRJqiOvPdONKKlSo8FrO2LrEc9e
	49vAvC+7hrffNhGGs2S6zBXL5rUqyzFe1N3H+fTfoEWamTltGDLsrUnaR9u3fU53QNt4Tlyyzld
	NDrefuRQbhF+zrPtrYOVHnXHl1aLfJFtfS84VX7k2fsZjnlP15RQ6OfKn2hP4GLH3
X-Gm-Gg: AfdE7clSsg5vctLJywOcPKz+mZxfFcPxqXNohVZCdd9IkOHpcY5znCGra8PpCVs1yRD
	uOo9LvjGj6QBvY8S//ObqZ2bx3wJaAtF79XdcyHWEvS2p7z5ubLn3BEUFmH5jqovJVQPN+ZN+Wt
	SeWb5mR7ABhqCLNmwXwmZCdWkoPYth7ivJtnYtcs35P6hnzyP0bcjAxIh+YF2svEPz5UvsDuaiu
	mQ4dzsO/rs8DhKVV2eVD9kUA+BWLhwNPwd2H0A+nXdHNVwgAr37pI4Qnw/KpvO1CcnIakC4svsV
	O9CWKUxmaUaRPvFOAjjTMNZuVoTBjfYrLNq0CSETmk6EnqO2ppJgG0Erntt8uWiyzG7whIFH5Qp
	ta+9RT7WP8si1DXC+xh/1HBYtQFH/f55sfPd1gk5rbXlZ
X-Received: by 2002:ac8:5f11:0:b0:516:e249:e30f with SMTP id d75a77b69052e-51c8b49bb4emr116835001cf.42.1783679134709;
        Fri, 10 Jul 2026 03:25:34 -0700 (PDT)
X-Received: by 2002:ac8:5f11:0:b0:516:e249:e30f with SMTP id d75a77b69052e-51c8b49bb4emr116834651cf.42.1783679134203;
        Fri, 10 Jul 2026 03:25:34 -0700 (PDT)
Received: from [10.204.101.214] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19dbee72sm10785038a12.30.2026.07.10.03.25.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 03:25:33 -0700 (PDT)
Message-ID: <8131d408-7822-4bd0-bd6f-c4145ee7de5b@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 15:55:25 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 11/18] media: iris: Add framework support for AR50_LITE
 video core
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
 <20260709-iris-ar50lt-v7-11-76af9dd4d1f6@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260709-iris-ar50lt-v7-11-76af9dd4d1f6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LbIMLDfi c=1 sm=1 tr=0 ts=6a50c89f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=t_zrhGeEmQNc_LLHSoMA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEwMiBTYWx0ZWRfX4gczGNnhan2a
 048uBDHi/YEYte8YFNxiN3kSy3hnSmF90cgemDATXG/ZU4yQlvFPwLydf4p2b6rUFhe4l/+Sg6I
 6ZRn2PCNgWziJ42iEYadmbCUy35WYsD79UhPrE213zxxdfl54LtIUXw8pleCXvrvnB5Ptai2ZNl
 Fcd6nX7rROaa2oaa+pFg8eB+Am1WZGi41Q0aY+/eB7JJnILDiA+uHaMOwNI2ZqPyvfLBZM6evRn
 eoosHpDqA3e5jIFdV7N/ixUf4TZFQA0xFnj8oBxjWcgxw/r1NzLfwHUVf3O1CiHmfsyLfCelbLl
 aZf0wT9bxUe0u9X7aqwdSIZsX1wxadLLI0El4qDn8AdP6hCsRRGgiSBrIjI+5vGozUjIHaoUAPD
 lKQHpwt+ylUufawVPT7oU8dLr0UiPfyZqJUNqiVS5rQFR8T+bQPR2xcPfXRSQDft9imH1mfncNX
 5MhWJhCX3kH0wGg2eGg==
X-Proofpoint-ORIG-GUID: KZItDHtGHqKM-cc0z88nXeR2mSADxrri
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEwMiBTYWx0ZWRfX+EAo1A70Qxbb
 NvNGinmjrRexdjejxoGIDL6BNbMAqDNXESd2HNFehYhUXTDcVdhciCABoihydHsauNPlL4nI3zX
 9MdMx6y2kCBPmlyoxWjUasgrTwpDenQ=
X-Proofpoint-GUID: KZItDHtGHqKM-cc0z88nXeR2mSADxrri
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_02,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100102



On 7/9/2026 7:12 PM, Dmitry Baryshkov wrote:
> From: Dikshita Agarwal<dikshita.agarwal@oss.qualcomm.com>
> 
> Add power sequence for ar5lt core.
> Add register handling for ar50lt by hooking up vpu op with ar50lt
> specific implemtation or resue from earlier generation wherever
> feasible.
> 
> Signed-off-by: Dikshita Agarwal<dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/Makefile          |   1 +
>   .../platform/qcom/iris/iris_platform_common.h      |   2 +
>   drivers/media/platform/qcom/iris/iris_vpu2.c       |  28 +----
>   drivers/media/platform/qcom/iris/iris_vpu_ar50lt.c | 130 +++++++++++++++++++++
>   drivers/media/platform/qcom/iris/iris_vpu_common.c |  29 ++++-
>   drivers/media/platform/qcom/iris/iris_vpu_common.h |   2 +
>   6 files changed, 164 insertions(+), 28 deletions(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
