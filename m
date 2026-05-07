Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475643ACF11
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 13:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778159672; cv=none; b=BaeTNB2hq33K7NnZ+9oPwrB3HTG8hSt46IgeN7ZQ0j/Mf5WVFCp0BYh0t4OG/7CAhBj2IEOIOjTy6WTp6uuxV41J5hsv/YyuAwDJWg390cZZVBEHErkatSwSb77T0tZbLntNhkZffQqsKL2dfQA6sS6SErWAZEGBdjBKZSHPAyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778159672; c=relaxed/simple;
	bh=ytXAXdVU1RbIHxAdWPmCMlWrMpcdmU2fG/TIhwr79dI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dn+zVGm1uDEQHNCCHvCheTyb8nmZv7qtu5UQGs0xNIozZdX8NU9zDmhr3sCAfVF7Rbi1UwG+XR4QrXzM86+5WQR09wqapUGghHAib4+1mprSOX2C0ptJMRw78L+FqNL9DoswiBpKkp2c6t4++EbbhzM9jcw0UiaMTCPs2AP3Igg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qv/kG7Ih; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UUcvZfnR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qv/kG7Ih";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UUcvZfnR"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6479G9oV3463998
	for <devicetree@vger.kernel.org>; Thu, 7 May 2026 13:14:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vwQdmTCMHnbwqgGCPCBdP0sdAsnXRvkdsmJBPtlwIGo=; b=Qv/kG7IhXEdJJwB+
	tdiNpHtjCiXTuoQ+YnnzauNW+bgP3XzGu7l7dpf7LDgWmybXSOpz3MqdM/JZyBGV
	KygaJo1WJu3YRy0EW20YoyWDQJa5kpkc0egN1Zg1xCcQuHvl14PsZrSbXetHkoMH
	v96Bjhys/NUmWBCGF8T+VyjZXLHigl9+0EReiZ9ibt94Th5Y/5zdTD5sVh9AZfID
	RC561xME5y6Vw3N+baEzKGamJnHL6FJpMAFyYay/KkqCJLpz5GHbrZGzXqFxJOkq
	XPu+UNqvm//FWbDtMaeoXrPpVJFmEUHDICcCCAsX5ENBLMAONdm51SG/dPN9KfmC
	O4N6MQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0hvn2777-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 07 May 2026 13:14:29 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2adef9d486bso8969625ad.2
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 06:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778159669; x=1778764469; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vwQdmTCMHnbwqgGCPCBdP0sdAsnXRvkdsmJBPtlwIGo=;
        b=UUcvZfnRnfp8sthQSKsrA6aCn8ncVEji6XA7Z4X6WVge5S8MHv0C9lktG6WQMau4ar
         DrXOyYkzvEEe5aavsA0v77YErEMZp4Vr8pdiEhkXC29LyFruKDmoiauHq5Kp97qxJWAg
         uc8C5nHPCoC8QMRrys6yjLSg4R6m9iUf5qrIqr92mymfpa7nDg+E1xymcGsYDd5qYfxv
         qk0PMlIV6sDTN4Z9+jqvuqh5lxZ6HqFL3/rNkk8fZjqfPT7hbVc5xHGT/KjNaIF65AeR
         Pfa0L+g63efDez9m8JPDNBO44ukgLpZr8T523rU6BRNxId+e5cDCe/ymo6VgKZLnjTDM
         XwKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778159669; x=1778764469;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vwQdmTCMHnbwqgGCPCBdP0sdAsnXRvkdsmJBPtlwIGo=;
        b=cx5RA3jjzduGqbODTwjeadxUoRBJNkbArtl4f9F9pFkFAR9ZYEVRg5V775J9IF4V3D
         7GcvP+ZmeDtLLX0q/TFq7QJeYJIUSoJc51kFOSMWQ07vS21ll2sfHTL/eY76BDwsGVnV
         dUMYQHoDtIIV+rMWqoQDqG+kH2Hfk3mR/ZcLG0UNRJE/1b3sGyjcfBapZK/7Ac3d+n0d
         UC0nj2MmaeT5xG3lokINxUPuGeNwpkpAgJxciuMSi4Lpt+QVaffEX5uilODk5a+53Bti
         i3Pd1/plI1A2RMlNxJtzE/3++C+rrSZ9YQ7IBWWLw/fWiJzV6SAVcbzyrtf6vhlNGrGZ
         qp2g==
X-Forwarded-Encrypted: i=1; AFNElJ/I0rJtyQ1Jeq8FP4UAwzz7FGCkmRx+E/Z7hz8CytxOZ4msnDpnMbLhtBW9lXqF/Osbbmxt4W5NKbCS@vger.kernel.org
X-Gm-Message-State: AOJu0YwbmLlbg3WiFSoDaxXbxmaiTEKh3Q+gNEsLrM4ZlHJxnBoumggX
	YdTKy/XhOYh5Jpg7tdcHBTULTtDEDbH/yhrWt6LD3HgLW8n/3maeC/jlE1EMM1BPn8GVApQEVV+
	Fz2tIs/0lbtfaKx/hkAHTMZJc/2jiyFmHIpA7hD65onr0I5G+kkpGJphyBY0mDhis
X-Gm-Gg: AeBDievn0OKOcYIIT4ccFyBDtqRyRbUDVfYoM5xsXnrKD0kFpk2lrP4mova28eC15wf
	OYOe3RlaVm5iMrZwFybE5vQhWKUKa2y89wjrxGQXMRgJdU7r5wrSUYQson8j3pG255dyChK1ERh
	kR32Ku6OKqpTsuBPWNYJvbAdk6vR46OBTOX8IYfYKHEbakWslfnV6BTxDX/cjhxoL8wa0MI3rlF
	EXS7e4R0p0fPXOfapj3d9kvpumGWvU9LyVcoluQXlrQ1WLDWfTwAG83Qenyd60tSoPMkZP8RxKm
	eqBHlX/yuDzI5KT6noOB0eogdDtwnnzuYR1FV2ciSgChaiAR3pwSpiYrmAVOx0l+eiYHb9AAJm0
	23E9qFv8B7FwxH+bPVsKFpdnPjxbb+WvlMgXTDQ41VkclYkuPru92OUDRQOmc+5te0y4=
X-Received: by 2002:a17:903:2cb:b0:2ba:9587:25c3 with SMTP id d9443c01a7336-2ba9587276emr59811895ad.1.1778159668790;
        Thu, 07 May 2026 06:14:28 -0700 (PDT)
X-Received: by 2002:a17:903:2cb:b0:2ba:9587:25c3 with SMTP id d9443c01a7336-2ba9587276emr59811615ad.1.1778159668351;
        Thu, 07 May 2026 06:14:28 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.248.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2babb1f0148sm27671115ad.82.2026.05.07.06.14.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 06:14:27 -0700 (PDT)
Message-ID: <48a5691a-5fe5-41dc-acc8-270037cac598@oss.qualcomm.com>
Date: Thu, 7 May 2026 18:44:20 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/16] media: iris: add vpu op hook to disable ARP buffer
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
 <20260507-iris-ar50lt-v1-5-d22cccedc3e2@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260507-iris-ar50lt-v1-5-d22cccedc3e2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDEzMSBTYWx0ZWRfXxoMfc8EK+QWW
 yo7V65V/aQv3wc0ohw5T5fdF3iNoVEzq/aMiYSmROhI86FwnTeSl5tBKyuwhQKVTlaFEBsD5XFF
 xTlP2upxr55WQdekvxD+PfY2gKl0mYgm/FzTpouEDBKB6vcqnL1j/0U8NYZl2+SBgrx3QnArb3G
 FDvknPeycLwoOPKLRESaZYJaQuvpiMCWZi+S6MVJJd/Kj+NQfcuO26hc2qeHd7AHtQeUecXmqCa
 s7Tj5LV2FUM7tSaLXlL45eEjU14GMHK0jsZr72YGLRgQSlF9zmCg6AT1YDGCXEcicr5w5xt23nS
 x8ETBIi/qszaIgyVW6JqT9bSdLChbsXLrM+B5mHXH1jjJ3Zyf4ON7XTvVt6iTo6SyUjUDI7W8EH
 QczKKxnscc5fnXjt6sSAz4xw81jgLi9iVeVUXXqmfMDvmEsN5DEwoDbcb8/wCYVTpXY4BaA9i3s
 DplqMeI0Qrp0J94rlKA==
X-Proofpoint-ORIG-GUID: t63ppii-gSTj-s9YC5V0CdERF2VdQN0A
X-Proofpoint-GUID: t63ppii-gSTj-s9YC5V0CdERF2VdQN0A
X-Authority-Analysis: v=2.4 cv=ZZ4t8MVA c=1 sm=1 tr=0 ts=69fc9035 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=EkRsrf7Hk27R9rd+nIzaeA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=FahMO_wZLRsdh1i3WG8A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070131


On 5/7/2026 12:12 PM, Dmitry Baryshkov wrote:
> From: Dikshita Agarwal<dikshita.agarwal@oss.qualcomm.com>
> 
> On AR50LT platforms AbsolutelyPerfectRouting (ARP) needs to be disabled
> so firmware can configure the ARP internal buffer as non-secure for
> encoder usage. In preparation of adding support for AR50LT platforms,
> add an optional disable_arp callback to the VPU ops and invoke it from
> core init and resume paths.
> 
> No functional change for existing platforms.
> 
> Reviewed-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Dikshita Agarwal<dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_core.c       | 4 ++++
>   drivers/media/platform/qcom/iris/iris_hfi_common.c | 4 ++++
>   drivers/media/platform/qcom/iris/iris_vpu_common.h | 1 +
>   3 files changed, 9 insertions(+)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
