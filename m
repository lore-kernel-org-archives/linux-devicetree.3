Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B237B3DBD5D
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 09:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774345240; cv=none; b=r3Xx3sQTSSMTmHjU1Aece+sgkaXsrxJIZ1MOcIVaTK2cB90jGC0ytuPiDaAEpDzPbM5igdmJ4MfvJYrEwQ7YdUEFixotxhcB/ufYk5yoSPvkdxln+VuZhfZIWN5TPOTGbAhc8QFnXnHsCwM89ux45ZIGWPxm1C/ZpCG6lUsa7kM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774345240; c=relaxed/simple;
	bh=Q7kecj+H8UdwEC1erd4Fc8Hi+m8S6ZJDQiN1zTPLdI4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qd4rcf5E/UrzRAK6qBtDZ99CPnhtk4ur0JVHuY5bZQVs3oBeeOr1C7ZxkFc29D7oXxKS2qTdTlFfi6f6vhsGLhStI+vYjjaxEIXTfmPK7LlOTNVLPJ8rEupzpqkb0dAFX76VrJ2gXcMmWxeGnKb6x4TfF6q2qPVmbKGfFxDinaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oyaXeBaJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V7ZsUmIs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oyaXeBaJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V7ZsUmIs"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O9Z2rm3634272
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 09:40:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f4a38voHcmzVZ1xVQXEH00EB+JiuYUKbxJzeI96p6O8=; b=oyaXeBaJFoIvFF06
	2b9aW9ZdLtIgog+hB4H3WPpW9nzqd+LkEzcwL5j2xTPMtZftloXTshzPMaGe39uo
	G18aySG5kKf2floPgOHUsrmRlS9TYfz8l1F4P5jtMeVIESV6FiCOOdZp5Of72trp
	P971Gr9x9Wqf6kvdu38/SbRirDhPs/xaFzDhQjY9xhyYTdgMl3ppMiye+9BlK82Q
	k4HfpEdiUoGdiWHHnxmvw2CfX4nnK6eWjhgdzxJdCLhmoHxib9GfrDcEKF2K4hIS
	5zDMKQgI6PbedLvKKDlHFNjYrfg1bIdYfSW3WjXxeQa8lOdYPCszgQLzeaG3TjH7
	zucq8Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d34k4mdjx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 09:40:39 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b68af943eso7823811cf.0
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 02:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774345238; x=1774950038; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f4a38voHcmzVZ1xVQXEH00EB+JiuYUKbxJzeI96p6O8=;
        b=V7ZsUmIsF5+JWVOkxZysz7nFovd8/+JvU0s6YcRcsMAVcHd7i4m8/XJgCzbLbT0InC
         D8u+o+1LfEptd+bPQPkWHfp1vddykplnO+qzRVRfybNoHZVgPkR4BDHfvQzpC8nL2lv6
         XILNhlR2H8rupiltb6UGqIjACVxB7gUTvT+JiyzstdvOlx4F57iJlV0Ul6Cxpi5ZM3gU
         zkTswtmmm1jXFSn2UA4Vhp9EUiygDboi7YSG78KH48CDbdJ9VwbKAr0ZwnP84XC+sYrP
         sONKXL+0AkVKADs2Met/Xq+dUHDP5zr9atFWjFufCZ89UYqtII4PpPL/39kumZf47lV1
         aGMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774345238; x=1774950038;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f4a38voHcmzVZ1xVQXEH00EB+JiuYUKbxJzeI96p6O8=;
        b=b06VfK2zCxWVITOd4Fxsa7mhxDrC9wQFHt64rCYnfnfO7tBuG4E2dkB0htxO8r7PVQ
         u7/X8q3zN0yCjJZfbjnqmH4nsdDxttc5JK7QJgZRKfCvdBZST7h96h3zBPqIkOGEY7p1
         Mthm8cyIeBM3yHuA6nyh1UNz5imHMViw+mgnsnZWiot/HC2OXS0nClWg/IyuyllG4gLV
         cuHzitYQbCQpadXZqURTXrugipbqxVsPL6jzpn5pvpx3jyzmNgL16qAQlI2y0jj4FRJt
         ub1TxPVVh/vcPfPll6f4c4+hkhpQv6BhHAzwmG5MXy6c1NH3JQvr74qxO0KNqDEF6V7u
         h0lQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4xBshfGIrP3dGDcI39F+mcfUe3EDNG7hHV8WUnhWrn73sXBqPsmBZhoxIS78RMYmuXrF5jjPvXnyj@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7NZEjca8qDydm2oHa7Z0BLvG3vulaEdIVAZbcWAqtlVqg3DMK
	MZXmstWm4fjNkU9utuRrxEnqtuL5jmYgytx8JkTzjpQtBiPeMaJuwsGZfZjl7Q9pLPGt0jNJEAF
	y5OzimzkFIak6IVxgvAo9EnVdOKalOlCKQxjMCze1QLO2nvJhZyEX0dAjoXypmKyc
X-Gm-Gg: ATEYQzxuDxS4/LuoVY5Nf3/F9amAW98Rxr3r9WXnNh2DyZDHF9z6NO+Ap/68sWXKZGR
	Im8fvCIKK2WUl1kJQ+aV//CFziVDlabgNzE2jiuco4qdVa2674MkMpgYI3GJJXvW2pmBtbK+qZ/
	nVVm2+dEsSA62iqbAx9ZHrmgDE8z2Kwexj05eWsmqYJKUpvbNfXTlrQ2TH2MpkaihtxYXB55zuz
	albjTwIWVFT0g7wqhWBlqhb9fV3E19kxDiLcU1o2SeYAllVrf3mMTDIrP5KmXmfoOOvRYQ4GHDF
	bUq4r+0nY4bPKgaIrqUq4e3r/dNxI4LKYzwnprilIWlNPNgDEZEMb1iBC7Kr3B4A9jfHOIeIwOU
	1xv7WlwFyaJiREn/NbvfcaYPRNje8jtzdeGHZ+vsUyLk3Ap6MW9OCkcev3VKXzAuB+qbwVXkhK/
	xUzQ4=
X-Received: by 2002:a05:622a:65c7:b0:50b:51eb:c355 with SMTP id d75a77b69052e-50b51ebc824mr71180721cf.9.1774345238150;
        Tue, 24 Mar 2026 02:40:38 -0700 (PDT)
X-Received: by 2002:a05:622a:65c7:b0:50b:51eb:c355 with SMTP id d75a77b69052e-50b51ebc824mr71180551cf.9.1774345237637;
        Tue, 24 Mar 2026 02:40:37 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f8c16csm615966566b.16.2026.03.24.02.40.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 02:40:36 -0700 (PDT)
Message-ID: <fcafa48d-3813-48d1-b8b0-11415e93aaf8@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 10:40:35 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/9] interconnect: qcom: drop unused is_on flag
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss
 <luca.weiss@fairphone.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Brian Masney <masneyb@onstation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260324-msm8974-icc-v2-0-527280043ad8@oss.qualcomm.com>
 <20260324-msm8974-icc-v2-3-527280043ad8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260324-msm8974-icc-v2-3-527280043ad8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: xW4bWv9aADmtAVtKcTPZ5nGz6LzE-4Mk
X-Proofpoint-ORIG-GUID: xW4bWv9aADmtAVtKcTPZ5nGz6LzE-4Mk
X-Authority-Analysis: v=2.4 cv=c+imgB9l c=1 sm=1 tr=0 ts=69c25c17 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=k-kk7C7g4wtHnpuv8VcA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA3NiBTYWx0ZWRfX794SO//RqFk5
 vTwJpuVCDWP4YW7gvg1zUnhpm53tub4Zp6GMyQXucTkt0Sh5HwP0vVUNVpba6aHw3m2oZKHRVvM
 bsPuPIiYFBejqn3xrcuA7E0PFqACDDScb4BrDBR1BR0fW1iaTMcjmpGIQE+1U34hhsDkOikogJV
 Pw0ipG2kmOh5Ftk9g9A8xHqiLyWKfQ0MMXQnLBl+ezwVIPKvutdrVUoVGTv3oRq1LVq3ujQVrmf
 qA9Iuw7D0XxegQq8fBj+Co4DtHHlVhQoKI2Xk7kOE0hzbCHqgiUZnNUJjm4zvTRKFZW/bdjqnb+
 +WwqhKaAD8ICcAa4myEqK4TsUoaX2rRgtNtIH1Xt8+s0K64OhWiIbW6XoZf14ohH1roztsQltFg
 jj6EDzPWyb2++esoIo9pRWyGtlYJY4TFszzBhO1TEMSbXcnfa6EWU1hAPqzFCUYMBBmNLkqhjKr
 XivdjGQhmFN3lS0KRvw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240076

On 3/24/26 1:10 AM, Dmitry Baryshkov wrote:
> The commit 2e2113c8a64f ("interconnect: qcom: rpm: Handle interface
> clocks") has added the is_on flag to the qcom_icc_provider, but failed
> to actually utilize it. Drop the flag.
> 
> Fixes: 2e2113c8a64f ("interconnect: qcom: rpm: Handle interface clocks")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
