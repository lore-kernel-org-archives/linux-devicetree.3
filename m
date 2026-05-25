Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1CB37FF64
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 12:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779712819; cv=none; b=BwvhkxH4YJLg8L5hsYH9mp7FZ0f2o0sc9DtJW8OUpym0gvIVZXtN4LNYFZgFUVwHKHgHLlZ0iXVe/1Kggw3IylD7rqUXF2eYYfVkSR18L377qVtclaQXJ8oZs+CmOthk8+5QR77aHGlYWNXclWasWnkGAvsZhb3NRb4nMtX/rto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779712819; c=relaxed/simple;
	bh=MmglVhlO6xRIyqHwjXuSIzMFaQCymWUXmP5JOhtQ+JE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mK7r6xBZt6GlzVPvHj4McacWPxxxKVnodDK7kW1c9g8LqK8W4Qvpv1qKYdBwIVVvboJ4e+1We/3XiDrvMnr2bSJZYC7i4oFT7GR1/u+FVW8f+XMw/yGEsh7bjCgp5D4K5XvqJqfCUcyA3lHpLch6O5OH15jt90y4lZLcTXlxFtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CnbHTBxG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fLJ6a5Cz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CnbHTBxG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fLJ6a5Cz"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P7hGwI1588803
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 12:40:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MmglVhlO6xRIyqHwjXuSIzMFaQCymWUXmP5JOhtQ+JE=; b=CnbHTBxGNIfzUJ08
	j0kVrg06YgdpZTAj4LUN6Nzq4fIsVGZvtLuSPcFlPFvuRTtqby6areJRJ85RSo5o
	/S8F3Mmi5IQYhtXa1TIpdH2ro1Y6jZ847LkD9kNbFWPaUmh2e1SpFMYJ3IGyrARA
	pd5KqXEOviFl+SJr64kdLcc2wBfgZQ/cT5nEDEp0/T6diM9vNV6YCSCkabKuM9R7
	9qj+cAzmhVjsDnC7DhxMyDMUmEvMVxJoVUmfHn5HwAazetU+tu3EBq5i58hCQ2Fa
	Fe495Y6rjA3aDlh8YrGgi3YvwPkxkIh7ukh/JH5im2dwElNODNqAxLMW+rMlsHq4
	ASVgRA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb3txpnrd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 12:40:16 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-914ae48993dso67205385a.3
        for <devicetree@vger.kernel.org>; Mon, 25 May 2026 05:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779712816; x=1780317616; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MmglVhlO6xRIyqHwjXuSIzMFaQCymWUXmP5JOhtQ+JE=;
        b=fLJ6a5CzcFpeael5FP2GJ8ZbQr1mhTiK5yO9tVAr4HKxPJseb+8+80WlsY8uGlA35I
         Tmv3h8+xc/77r/J7tQh0FkwzgWfVeLlfXSx+VJYkvm7o2AKpTDDzuTsU7W9cFH32+dgO
         FGlLKUSCDFfMMCYl//+xLq1gUEIMAKJUyNAckEeORdnWOBhlGm6xRN45fD5LSg933rxI
         ojxorH6g0I8KjuHTYzIB3x5qtOJwY/F9NCTkF+9LcJUMC+KTXmCWQ4PD86p+hzSLsfes
         MYTVhWJjh6muCJnx+34VGe7m0Rs3xhnsTxTmur/nAQAJfMXeyfhx5GUzAGBdNU9HWxhb
         /zTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779712816; x=1780317616;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MmglVhlO6xRIyqHwjXuSIzMFaQCymWUXmP5JOhtQ+JE=;
        b=SCXVp61OgGUx3orRVUYUhZTZxSjXw79ZLb/HcnnOquBMlqTEtZmb89hjzNqpMB4rR2
         9fUzgbwNUx9TrKB+g4Ms1PnSNt2d+Myax+E5mrAQHx9pF5pK4CC2/5LxlMN9yWqGmwoa
         0l/bl05m9dk4FFVWHR2BnHrbYzq3QxM78lDKgVRQVTD1egEspfYY3kJtQpgaNwOGDl6Y
         /6ZW37SPTINs0gMmsO201wcqBNd3mZniI+nKM0TTx1NlQnG8aEDV1arihgMhEVKnSMPu
         WWSltPGlPs3VQ2FlJKuGUt0pGg2LIh2JTeZG8v34aAw911vCCu43ha69eRIn/Z1w3Iii
         yEyQ==
X-Forwarded-Encrypted: i=1; AFNElJ8F4/d+I55Vi0w+kRnvM/1DNzawngk9mvDm5hcAyB3D37LneV5DWl7d3BFCUStOSEKgQSwWPHpx/ISI@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl45UT2YrcHmAl7rvJDO5Mh5eXh9DyTCyX/BPeQpQ+7Z1v/KZE
	apnRAnxKaG/Pj1mb1szVuwcAa9TlUqTNkq84tW0w+c/Qxyd9mlz7IyIQyg7uSy1E+gN4c8tI3+V
	j7WAL1TCk1MZddPlZE1jYOzFys6nuQTHf+H4U9eimf/fS+K04ASTMD/ysqMdBucjO
X-Gm-Gg: Acq92OEzbA8jxd5Okp92+CAX8jFMydLUOQcWn5O3hY8Ga5boKQcTz1g6r01suRKqf4+
	WyrQDB5rxpl7TAAHpKuY09oYoTKx6mPBYNqmrNLwO35+tkArjhTglkepljhHI5otY5gh/P0uy0n
	1MyBL7ThxrT3TEZu0Zha34lESVUtn3CoDwWQEwDmAknM8BIV/l61lb4+SGpQELwPdq7oAgzcOsj
	S1x6aY/4v07LHlmvrh0xdnQ09MLWSF/XEliTQMgIB2iC9nrIa0cs2q/Xh5m0yiCMU3OvvC2RO5A
	wjtgS79zqjKg+8sHvRP9LNAfmXSF842NFfkiPKO/yl6C1i8F3+L37GoMmerfzeBfYoH+pupxvJi
	v3DJAjllU6e/OeWF769kSGQEVDtttgH67XSXpP8WD9OwPZg==
X-Received: by 2002:a05:620a:468a:b0:8ee:a1d:bac6 with SMTP id af79cd13be357-914b49e9d14mr1374572285a.4.1779712816372;
        Mon, 25 May 2026 05:40:16 -0700 (PDT)
X-Received: by 2002:a05:620a:468a:b0:8ee:a1d:bac6 with SMTP id af79cd13be357-914b49e9d14mr1374569185a.4.1779712815873;
        Mon, 25 May 2026 05:40:15 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688b9f603desm3917557a12.12.2026.05.25.05.40.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 05:40:14 -0700 (PDT)
Message-ID: <934e6039-4639-49bd-8cf9-a1674f86b8c8@oss.qualcomm.com>
Date: Mon, 25 May 2026 14:40:12 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] soc: qcom: rpmh-rsc: Skip TCS init when RSC is
 managed by firmware
To: Graham O'Connor <graham.oconnor@gmail.com>, linux-arm-msm@vger.kernel.org
Cc: andersson@kernel.org, konradybcio@kernel.org, robin.clark@oss.qualcomm.com,
        lumag@kernel.org, abhinav.kumar@linux.dev, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260522060645.4399-1-graham.oconnor@gmail.com>
 <20260522060645.4399-2-graham.oconnor@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260522060645.4399-2-graham.oconnor@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDEzMCBTYWx0ZWRfXya2KN94prtQG
 i84o5LutsG7VDWQQXf9WfEcRkSH1nheRHwCKvBTR4jXDZCTA6pvTv+UfgNXxd++dWnERXibuslw
 DEj0tARYIWL4LdoYRZ2lzJqdAlpvxpfNqgN0CbOV6OtRUu9r63qFdsC99hukiG1DKo0McnbRCcV
 La9tiXw1QUMLPkVHH56T84V2Ik0dYItHSlkJGLI2mWeXvils0F5JfODQfqO3nxlgAT6LzyhVuqX
 HUiIbFOGAjzk9E5GXQpxuM48O2CVO9EzPAM2zIl/Ep/YtVo5gYluBOe/L4CMcsR1n30u4S+GdYK
 Z9T6a0zz7nvHuqTJQfktDKj+BXGrHIuL43upzMGmgKfsoI9gJFB7wKkiZhbLhkUMJ6yMns4c/bC
 vPNL3ElsfnmtePAGH6VRGbR3Ac2eh+fzwPkTPi0tWm0y1BKor75o3qz4tO14U7GFLZ0oSqkuGJP
 7VHQSm+HC9k4Z7aPuzA==
X-Proofpoint-GUID: eQo9xQ_8Pa-lERj63Hmok1gUJDtV220W
X-Proofpoint-ORIG-GUID: eQo9xQ_8Pa-lERj63Hmok1gUJDtV220W
X-Authority-Analysis: v=2.4 cv=MetcfZ/f c=1 sm=1 tr=0 ts=6a144330 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VOnKaOCXMBmNH4hAPL4A:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250130

On 5/22/26 8:06 AM, Graham O'Connor wrote:
> On QCS6490-based platforms booting via UEFI, the RSC hardware solver
> is already active when the kernel takes over from the firmware. Calling
> rpmh_probe_tcs_config() in this state reinitializes the controller
> while the firmware is actively managing it, causing a security
> violation and system reset.

I don't think this has been an issue so far on other platforms..

Do you have some more details?

Konrad
