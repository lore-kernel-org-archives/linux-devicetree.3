Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06EED38B145
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 10:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774262175; cv=none; b=lwI6SRJSK+xHtZhmT/spdfWw2LKfuZLmRuSh8R7VQTk2sLMkqhBm1oX/MESHQlW61dcKVAaZfbz7nG+tb6y+2P9ENJS13mnGSi/tbSjyiRdioXaVc0dkmQmUpYjO9a18+rKZDE9jM3wt0obwkL7+HjLyODOSIvpc6gLQPIE0qzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774262175; c=relaxed/simple;
	bh=aPdS/oN5R7bXAi3R7oK9DzbqpnEJEHavy9UFo6/M0Eo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q82uwHe0eebVvwWASbgrkkKm670LkaVK5F1oqePLfDWULVhi8M7n4Um4Pd6HRQ7kabVaLiw0glRovfsr1R3VCtGAW5OPEOYyaN7ON9QHvEKkairJuwPft8MWhcriKdJZGUb31Jrc/qKShlxmjznVVlI3YXn2VhuvOIe/I6iToZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JOESnbjk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KwT9kiHc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JOESnbjk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KwT9kiHc"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NA2BKh1584129
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 10:36:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6cu5CX5RqM8GBq6AyqwTPyZJr8Rph3R9Mh7YCaq+vOA=; b=JOESnbjk7oJnzSRO
	8YWHiZxk0JNLlHkgOwWbuo/CiMQD9TAb8pRuwfIFWbZYrDEqUDHTzk4cTxSfz7tD
	SVqeHCI0hiOihYY7/V4pfl5BhRQKFTi9si0VM5VWXIhlVNnpQiC2LOZfJRfYzzpG
	k/VRBuYtEkzwKZpV9cdf1LXTkM6b5hdFegOU+vVyrNYKOhwU9+v67/qEADSABFiv
	RVkqmHRzqG+mGyxOGc/wqn43g72JcFzapj2y8VDwHMhQZRZ+zPQ7B2DVJ76NYIGM
	1kntJihJu42wFfY4SCtM0Yjrmt3Tlz1hn3NXlr5BEeqxOThIttFdFPlQrMPL0hI5
	2HALTA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1jng4yuv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 10:36:12 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b317c4041so27055821cf.1
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 03:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774262172; x=1774866972; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6cu5CX5RqM8GBq6AyqwTPyZJr8Rph3R9Mh7YCaq+vOA=;
        b=KwT9kiHc0hEOY0GQ4Bhe6JSMD7L4pWixv5UYC66BuyemTWXeLX8OLlI1tZ4i7NdOh0
         YXug9ueFLamC3jqfHuJ43YXQfX8TEyeoevAzpbqWlibXQrNKL1e0cya+HhLUQLNW5ir7
         DhMCPPNsh3kxaGSt4wOpMScWsqKGDms7BnZCLZbVyft2CvpS653MvllSTCxhGQHwl6kP
         fGm5rHfZtoI0jbiG1ITW6xA4OsZDMKPl8QY07bKeFSKczFVKG9G8MWyi1ey8myr96iXZ
         MDkfs1I4gAdS9wNGLU0qq7EQP0gU4pb/lzjii6vLcX4G8wiUzXciIOPocGn+3CUT0rnr
         ZxFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774262172; x=1774866972;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6cu5CX5RqM8GBq6AyqwTPyZJr8Rph3R9Mh7YCaq+vOA=;
        b=VVNJsFARqbZY4D/QJE1OjmbG7kw9Pc9h8HmyjH+kTi9aiCmZE202CqFT3uWyj1eXj3
         yLsCER+N9/rAgzhmglq/l5YPcx10c+IvwtTupADYmIfKzeG2YNdlEwX9phw+SxIuw/tH
         7mxDxi/npVd4WdPl0YgPOHzP35DTg2TdixneFkYMBTEyKzCHRuuled48hmgxwfnrqd1e
         sQx7FTJdOPuzo6/cuG8j1l0Bmr0P10YkSLLUwfDvzI4sej7UK/Z2xt9Q7s0E1vAxKe6v
         iDSLXfbW0SxM5X/0Px742uZBdLuty4/RJnBiTvP1dRn0VJOYj3UiDAwktnqY2f6P+PsN
         seVw==
X-Forwarded-Encrypted: i=1; AJvYcCWB7Y0UTxFVGvqvYz56xrla8M3466/CRiPxmYSpXCMRzNx00zfBoMlvoLlQSOXnKfqPn6BEPPqlTVxk@vger.kernel.org
X-Gm-Message-State: AOJu0YxPfRGjLwhYZLo9DVH+6ZT8fhiglAlFHAfIloZd5XvLYh46SXpa
	keZtrnyYE9mnQep+drIy1NIF1d3CV12/zmLc+sT4gNSTAQ+rhslbvAbO4PufquP2YyUKWXqnKiW
	vB++BMKryhIogmDy3z33aYzTsS8oVV7WHu9+TwzZY3u84dCvCfuiRC+lm7HDY9QGv
X-Gm-Gg: ATEYQzx8VbvIzA92RkaVN6xgM9RIGFl0VhflvmaULFGDjsm1zdom4oTtQJ4HkjoB2B4
	1zVnkzyASf+QW4iMKDYQzc1KOVpJOEc1OOaNie+r/YoQ/hUhB9pG/qDz5Z7FkR6quCPNIuM+RU5
	GRX16JOUyyUE5WNvOAbPZcP9EZcmUEOG7Wk9ewugFRKK+YkyCLysGgNgyKE+eL8eBF2gCEZ7hCH
	eb1/EQ5n5x8K8j6+lOFXPIKFHjL98ViUwxQhjz2Nu/4gox2yqQnDpV8SSis1KSs6X6rYRPp3EiW
	l0QBI/pbHfCe6Hrjmx1iKQXfcXA3+jkKQPp6zvrgbc0Y9O+sHjJYqgwmORiv4sR+feeyHfY+Eto
	CvVWC5TMm7EhkiqbjWIg2pwbGuzrBIrqZ5yaTkCPrBKYwFMjBX3rlRu2Z1V3caXMv7JMLkqgUPV
	C9rTI=
X-Received: by 2002:a05:622a:1992:b0:509:d76:fe73 with SMTP id d75a77b69052e-50b373d748amr141113371cf.3.1774262172377;
        Mon, 23 Mar 2026 03:36:12 -0700 (PDT)
X-Received: by 2002:a05:622a:1992:b0:509:d76:fe73 with SMTP id d75a77b69052e-50b373d748amr141113061cf.3.1774262171972;
        Mon, 23 Mar 2026 03:36:11 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-668d238c8basm3555652a12.22.2026.03.23.03.36.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 03:36:11 -0700 (PDT)
Message-ID: <5889e10f-87eb-4943-95ca-d75daa16b3f5@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 11:36:08 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] interconnect: qcom: msm8974: switch to the main
 icc-rpm driver
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
References: <20260323-msm8974-icc-v1-0-7892b8d5f2ea@oss.qualcomm.com>
 <20260323-msm8974-icc-v1-7-7892b8d5f2ea@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260323-msm8974-icc-v1-7-7892b8d5f2ea@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 7hRTr8olO87p-6yKQg5-IVHNXwAIi55P
X-Authority-Analysis: v=2.4 cv=Q63fIo2a c=1 sm=1 tr=0 ts=69c1179c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=vYfEZkc75eIydLf1ogMA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 7hRTr8olO87p-6yKQg5-IVHNXwAIi55P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA4MiBTYWx0ZWRfX804tqOlRxcre
 p3gjkbxmXg3yAXuov0Cxp9KNUbZ22HuWsHTH+wJ0MxJ89ms2VBvp4vd7DFzWcGkEFEansu76EPC
 fXev0yEg/unLbIyfv0t/E9yTZR7LLkBvchZWGP/simyQdsf0paWao2FM8pkzUKcOQ8cnAJh3d8C
 I3uN3lrcvxodR/UAi9U3OZMBIyVxm7ZawrUooX259Ztxl4TWY/ElVx9dvCqYsQuXGMxu6yXpJQq
 bJvbSsPZU6Lo2mpwQp/r8H6jv70gChiBeCK4c2yhzYblfiVmUXQO4ElZwCQYjSRwepsjAlhnBbx
 NkQEYpGZjyJiuIGJ4+jRAFbIImMORWGj0JrknxRv5GJCLW0hkvjvxvvQcOVG4e/2QP7dcpRg3iA
 LSr1XqOHvGWbgd7CzvzNOrtFp6R2RCh/NB4ptecTwFxdIF2jH+8JyZeSKXWFUTjt8pwTBQn2rN7
 EEKIP6gKXuakz0CR2Jw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230082

On 3/23/26 2:17 AM, Dmitry Baryshkov wrote:
> In preparation to restoring the ability of MSM8974 driver to work with
> the modern kernels, switch the driver to the main icc-rpm set of helper
> code.
> 
> As platform-specific workarounds, set the get_bw callback (returning 0)
> to prevent initial setup from programming INT_MAX into the RPM (which
> otherwise might hang the platform) and tell RPM programming code to
> ignore -ENXIO errors from the firmware (until the QoS programming is
> sorted out).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
