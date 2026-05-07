Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635A73F23D9
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 13:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778159093; cv=none; b=Lx1JGgYPcElsGXEA/R5VOyMnChsrbLooRhB31sK9jd/E6tC1rrklClzcKR3RH+v3O8s1MW8mNF3ogIXBktxS9LEPXr4y25nPMH6VNak/780vcLC9F4uLeWs44xoIxzzoGjzk8LHCxmUlI43mJHo3Vz5lrYbrf0IeZ1hAIKbJjCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778159093; c=relaxed/simple;
	bh=IJnRaCCRGFSqqcN39JLCOYVUIk6OKKS2XdQzkMVtaI4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FWcjZUlSHEjbI5pZnbHBv90eckSoIgxMBJX6oiuLo3CLwxKG3/ezoKIAJSf7Ix/U0ZCIUx3dMEFi1KcWLuWHXNargDM5XQ2giDpjeWnf29PkxedSgMZw3j76Ife6Y5MaaPT09Jfvc8J1F5/sRhe3M/Z1EqSy3lQFcYCkI59UI8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GAyfpSzp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JY84uva7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GAyfpSzp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JY84uva7"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647C5a5k1971781
	for <devicetree@vger.kernel.org>; Thu, 7 May 2026 13:04:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KEkLRSZuxa15Rr2SajLmdLXU1nO4MBhTedwZPt5xFCo=; b=GAyfpSzpUbrNQ7FP
	s6rlCu4KwSQiyy8o39Xwe+1CFPsFsoDrV3TjVnMnuV/m8k1bgHP/n1H8HNZF9Dyz
	LcUujS3e7AQvFjV6TC4PQApadwPl3OU/O5j/0w3poixSU+pLMJoV6w8k/ZVT2mdZ
	Uwp1HClRlDDnIqyVPBaVGoIjyAai/HZeFflsJiku69JHXUmYdKjlMX9B1i98hjNx
	NCSZL21nXkVC2rlYrlP+65smU7zAaQ2lo3gH3KLzCC4VoylUTyvudi4GYbJZzgEp
	zrugHEMl6TtTy2XPiO0PdtTjgi7uPBb5MEIUykfGgxUwgA47lpSJaGu8nxm9hb6z
	rs1aRA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0tej86ja-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 07 May 2026 13:04:51 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c822ebaa40dso468118a12.0
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 06:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778159091; x=1778763891; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KEkLRSZuxa15Rr2SajLmdLXU1nO4MBhTedwZPt5xFCo=;
        b=JY84uva78SCCKEyy2vz7CyjHpROahi4YbYyLDRWoWxO45jZY8AicIoq29aeFZUE0wx
         3KvgH76gFBdYtumrL2ZYQe5PdNXCevnp45admc82JE12GzMAUk1iiwz0NMn89kjk4ldM
         NPaUXJjXmQXhbvQE8QKXpUpBmGKKxRSgajnxgXZ+0GCcKPzqrV0qri557rgZ9ictK3EV
         Oy+zQ8KmHlEbA2/TC4J1OiRd9ENQ7KydUNkyq3DEArKbDHcoKiochWE2lDP+DG4LJ99X
         Ugx8Pk0VD1XolPwRSr/Cwy0W62iQzPtJAQNBOfL1UVJws8VLkANpOwGvPwQqSiaqQz8S
         ZgaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778159091; x=1778763891;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KEkLRSZuxa15Rr2SajLmdLXU1nO4MBhTedwZPt5xFCo=;
        b=Wkw/BrQbm1GgQBRPbB8E4IsBj93Y49xM5lN1u3Qkw4nM/bO0ldFLqt91ZiE5gpCb/8
         X0bUsYEntaEBZxDJypMN4+49uUvTlvw3nwH9Gq+AkAt5zyRTYKXY53aYTe9KcltIKJEt
         DbM5nKuNQCMo2Eb2sTVQJcSPg206mdXPiU7dqvVCXebdgB80NSSvDvPQ1R0I+dJOd13P
         xyjoj13V57SCb/WHddoL7q7iuEkRZKb19LOG+L4X2CL8ul4U5EqY0EJkjyPs9gdWcuqY
         91Umd8HrmKdaXwwggb/P2ZQPCY0zh6N5WYVPUbiMJp/zb9z9tgiVj/e2o26f8Ef19Il1
         UxWQ==
X-Forwarded-Encrypted: i=1; AFNElJ+SdEHbAv7PGNJEYl/hy9V+XklILGCcLkaATYy1GO4czrJQcJ1aywIdLvBH4Vs3eMPMFJIJL3y71V4v@vger.kernel.org
X-Gm-Message-State: AOJu0YzYnXwUgH5NBGoa5qCz2pCJthQAXlabpt9C8XzS4/oh0VnGinML
	PCurEDDetFyiW/BhqemkdVYDLUAaMtPzf3x7BF9KWvgkUNLiOSgOSyWHrUfuhx+X5CSdqmrsB4D
	t0Es6dp4Qg97FIMWiMK+pHT6oJXL0e/8uRkOK2T5bFrQ8AiQcW5WJlYmllfwqSs1G
X-Gm-Gg: AeBDies9SV7wmry1ITKcIHKisPyfLArYN4QvCyEsB0sHplwNP74g8Y/LmCgDnrgGlVc
	q8MF3SyYS0px5kd4+Qqg669Ds05ZQL3/l5LblXsZzICcaVOBH0B8ltxmjFTM67Dluxr1qQQBC54
	FFsH6HiEmC1xnDf2UxYNw6/tE814/PV9OJiSH5c6/cVZazJE1NY/GS9QSydM6UpApKvJwfRROjo
	4sOA49pya9oDN5PD3jLZjYJrCkDqS7fs3HOXPwO/xZP23Z9UxVEGxeDHC3R+++lV4wg1nCh/Ba5
	M4+q8Tc+spmCELrTFgJAFYYgtIJY8Lkrr2qFMTyvR4uvthLYiDa+njdkpSBndJN52cwCEA21duh
	ZLh3j68Pj2NSDo8qIaRJgO7rkv4TEOpBnBELHE53ZOQ0KnNWq7o8bwTbZ21bv2fylGF4=
X-Received: by 2002:a17:90a:110f:b0:366:1c9e:99b7 with SMTP id 98e67ed59e1d1-3661c9e9b87mr1075284a91.25.1778159090878;
        Thu, 07 May 2026 06:04:50 -0700 (PDT)
X-Received: by 2002:a17:90a:110f:b0:366:1c9e:99b7 with SMTP id 98e67ed59e1d1-3661c9e9b87mr1075122a91.25.1778159088839;
        Thu, 07 May 2026 06:04:48 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.248.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-365b4cba340sm7857065a91.17.2026.05.07.06.04.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 06:04:48 -0700 (PDT)
Message-ID: <25ff90bb-a5af-4ca3-a5a4-60550a8f73bf@oss.qualcomm.com>
Date: Thu, 7 May 2026 18:34:41 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/16] media: iris: Filter UBWC raw formats based on
 hardware capabilities
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
 <20260507-iris-ar50lt-v1-2-d22cccedc3e2@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260507-iris-ar50lt-v1-2-d22cccedc3e2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDEzMCBTYWx0ZWRfXzIOIp6EbCPQI
 h1cel0CbEeXeZyeUx6/8l3KpskZYtwewTZb2SQ0p7CpvhpuCKzUmkRpn+kYaoMYsIfUJM1kggTA
 X3lJr1nHfvFxOFAsLCySCGO1vFH3bg2araA5EjTPNz3qd9OK9El6UUQj3oUuclswAu9j6yFKAtX
 OyQZUrjZ6IGymAAh2k2DX9cam2vf2P1/X87dvisIyqaTeu2wdxdwRBa6crmQQAwyhIkyC6Dngwu
 v66jVd9gkc32j9BPxfaLs8mkrtD9e4Dcf8TnY+wHzBCFGKytogGDXcdPLiWPEnwitm+B7Xn+c/c
 0z/VKlg10BpXqo46fcKYrDs/FRJCN3QH5gPPL/KNxPpyA8jDj7AfYiO8rhWSzjtVpNy/FPi4+oe
 w3UCRlRuTm6E9M8gziuNDLGaFDC4yN49No0MnsVj+VjyYIc4wACbQ5NHcrxO491/7Ip8gnW2dZs
 IgUbeY3SSRRF8ZcLgiw==
X-Proofpoint-GUID: K4UwOnBfd0zByt4bIgaDMVfHDCWnYoQw
X-Authority-Analysis: v=2.4 cv=VNbtWdPX c=1 sm=1 tr=0 ts=69fc8df3 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=EkRsrf7Hk27R9rd+nIzaeA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=h2Wfa9npekS_yxA4jjUA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: K4UwOnBfd0zByt4bIgaDMVfHDCWnYoQw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070130


On 5/7/2026 12:12 PM, Dmitry Baryshkov wrote:
> From: Dikshita Agarwal<dikshita.agarwal@oss.qualcomm.com>
> 
> The raw formats supported by Iris were previously advertised
> unconditionally, assuming UBWC support on all platforms. However, some
> platforms do not support UBWC which results in incorrect format
> capability exposure.
> 
> Use the UBWC configuration provided by the platform to dynamically
> filter raw formats at runtime. If UBWC is not supported, UBWC-based
> formats are omitted from the advertised capability list, while linear
> formats remain available.
> 
> Reviewed-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Dikshita Agarwal<dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_vdec.c | 9 +++++++++
>   drivers/media/platform/qcom/iris/iris_venc.c | 9 +++++++++
>   2 files changed, 18 insertions(+)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
