Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB0E3CF679
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 07:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777967562; cv=none; b=lj+RYJ1qY8XAq1tsFK6B2NXa7z5kEMTqYSHmv4ponwSU7886OM16yrpy3xMfigwyqXBl9A4kLCOn7PaZPRFSlLkCRGwM72LA695XJfB2Vq+2BTL8X3wk/G8mrpKfHwRE1FHy92L6ymjbB8FJ5aoW8HKSZhU3vmoHC+LygisQp/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777967562; c=relaxed/simple;
	bh=xdun6LdlXAGdhBxR1x4Opt6gNYAbFT4ZJI7bayxSWmw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XECXdaLXbmh0bEzb9qTkWD7B6DgAJRE5ctNAPQmP1ktQDfjdMUCm7EdQOThukLtNwl2IfnVKKONMTNCZxx+M/VqUbO/Rl0GNSse6+UOSxCJPqSVX3dE+TIPjjJjw4Rex8T5uFk7+aM+MhJuQphDP3IuKl4DwJUlmDKVg1sqyAM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cZ9GopZ7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OjnEeedr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cZ9GopZ7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OjnEeedr"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64570V5m1960830
	for <devicetree@vger.kernel.org>; Tue, 5 May 2026 07:52:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wU+VbCf5YgKYDqtVfrNBU7YnnK1qS5oh6UUW6wIDDk0=; b=cZ9GopZ7J5FwKM2E
	GP1WrEFRgF09SeEE1X361cPV9TdbawXPucj1USz0fDo4Gte+AHn5rJiwD5LyyHLB
	GnbeW3xy2ZnwVK6mATiG3srtLkr2nZpXKC9Qw7rhP5wxUDpIFkOeo2zviqP4eeij
	BDphKUEEn1wuEpQYvHLus2giWvp7r8yLz9OakZ06PQwr6tme8LGSrnB8v3dtREuT
	bURWNTNUuATmxAKzqNQzzMGoxrKxl5Dvrc7xTfZ2eohjuGhWsG/KISCarnUBbBd9
	ymL6wBGLs1+h2TyNYLv1qSM9vrJXVO6e5g5My9QOmm5V54lxA9KPKnnuxu+ed0Ej
	feqhAQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxw5du96e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 05 May 2026 07:52:40 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8b49424ad88so117015246d6.1
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 00:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777967560; x=1778572360; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wU+VbCf5YgKYDqtVfrNBU7YnnK1qS5oh6UUW6wIDDk0=;
        b=OjnEeedrdd6koP4DWKZIv48SaSBalvN5vV4biArzLZJyIUHWGaxmyelJNQqUMmMNrY
         Y9lEtubJ6kDEwVZYNrsn5Uof4de4cgq4PzqZGhToavwlhBsbQUr7jzLA4CPSCUTHF6St
         Jr7YX1/CZDqQXJWGXdmDxpXVLhVzoIXhvgC6NQehtdC8LNbJn6+oHUCCShIlyXYwDfgU
         RMnv50BBZss16MzbusTyV1Qhrzj80hC0r1wlk9Ljueu5Jh7J3SzIzOKZVm6HCrCDxEv5
         2qZFIXaZdpUCMVSJpo60/EapEpOjoEIRwgHeATIIkEijD3hQCQ21zl9Wp632cc/NNrqA
         EGcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777967560; x=1778572360;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wU+VbCf5YgKYDqtVfrNBU7YnnK1qS5oh6UUW6wIDDk0=;
        b=KH3tQx2aIzncsoJ2vaY64XaPal04ZSuo00ptnOVeV2chvYUG0vMurGKySoXBq0aDeN
         OmGLlyjEX/vCOP/MagEkoHd9chJMQ4L/6wNXUq9c6lrCe23+4IkRSsc/ynNNB8+icUS+
         AUTCpLjn/cIaG8HlSG+vSmA7DUyARnVxu/CMtoh/crgevDk0LygFdQO70mWJh3IfALdv
         A/qhG+OKiJ6a6DuFcTScz93ECYNozAarUkLoqQ4//WuTzx5193FakhYZC7vEC6vrADuP
         ZM+Nl9Ckq461SDbe23CbGGlGPm6AIT+FHMJx5bAKWNIUntaZKSBiE4z4FNR51Aa2/wvz
         lPww==
X-Forwarded-Encrypted: i=1; AFNElJ8PqMzG531pNJa+b3em2/JYJhRQpZIjVjr5+AxncQK8U/GpOOMmAarTVWeNUJTA6DdqlQnysKiXvQQY@vger.kernel.org
X-Gm-Message-State: AOJu0YwuCaC/qEga++qX8TOg+dj/0s37C/XeUxdHo+f9rRb+vAkXMVDj
	PHxG9JHg9aRFJJUZjDufULrEEiceX/OMiNA5NIoIpMWbTVG+zHWa7QlFpDxsTT2xAzyzSWfy53u
	qryzY524DJ1MaO+EMO5x4+hoOPz5nWMDEm55j8gbZ7j3diGWUyNh8nyMcHwX7kwSj
X-Gm-Gg: AeBDiet6dYdUzB7pU0tpT6o8dqxohsK1WdojQdcgCS5VvhmV9GURv6Df5x+J66A7kbD
	k0sAWiVJEXHi4H86bsosg1PWoYzS2LFcbQOdCK+0mS+KtsB6a1rWBuDdiy7JNjPKmDfMsAjRmMO
	kqmHau3MMnt4J1fIGe6k1NKesCSHkZReCvyg9xMMItcgs6sDACch6dBtOjKIwWlSvjvrRrWMSvs
	0QDQfU4Yy32CGf6oAuhSF9gmTNvx32l+KT99RYQTlPhCydsJkFpGmHOJiGzookRM0riD9EI0MUp
	6F0TP7gKvoX16G8aIKgkiZ4j3AcstOC9+qBMNnODO+Y1NxUIPzSN7wTbaqL94tcnWPcG1bpLOY1
	5O+jxt6O8fSP1O08F/UU9TJpPtN0Rcy2R8Q3PV3/Oz91LHY2IJxcUpFv2VRe7et9nDXky2FP65i
	YFFRr0L0YKRodpF74a
X-Received: by 2002:a05:622a:408d:b0:50e:631c:c38d with SMTP id d75a77b69052e-5104bfed310mr176997861cf.46.1777967559962;
        Tue, 05 May 2026 00:52:39 -0700 (PDT)
X-Received: by 2002:a05:622a:408d:b0:50e:631c:c38d with SMTP id d75a77b69052e-5104bfed310mr176997681cf.46.1777967559582;
        Tue, 05 May 2026 00:52:39 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:3d0:c2e8:9f02:5c9d? ([2a05:6e02:1041:c10:3d0:c2e8:9f02:5c9d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48d149e35a9sm16483455e9.1.2026.05.05.00.52.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 00:52:38 -0700 (PDT)
Message-ID: <510d693f-1cff-47cd-91fd-4d14af40b65e@oss.qualcomm.com>
Date: Tue, 5 May 2026 09:52:37 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] dt-bindings: thermal: qcom-tsens: Document Nord
 Temperature Sensor
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260504081236.825755-1-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260504081236.825755-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA3MiBTYWx0ZWRfX5AprNINUaxYi
 3va4156vuWqF/0cXXSlLjIZ1iEyjYhM016MZMWWYB5pBEQmbig8mfFrA49emZ39If7GNySC1M+y
 VeLw1gAoucEsc4A/++j/kjBbZAlQ7j+D+3O4W3kTRYdWGUuj1m/bgTFywyeXkz/+gIgPA4JZath
 SyNt0c52sdfZQStOHRS45w/EuN5Qjk/cn5vSILJ7ThuX2tcmqQXp5zf07yYJQyy3+k9/MWVqIB9
 JeQjNH+hwUPr2bRxGFu5j5yapnqoX7vVeBGe+QkW8PzSMXLvD9KbTsrPjlbh5g4mJC9PrZx5XrZ
 KMdbNi+zXKPIai6HyQoh/qrCVS2xpRUaKCYFPbu/u57nowAYUp6VwY2etmfR7DM5NfX2dPQ6NFo
 H8XOWBwq7XS1WE1G32sUTwTY2Hg1hl8s/E2jM+FRDPcnfcFeTM+mjHt81A6tqDE2wu27oH5ogCQ
 RupNv/Gw7EtA+DlfBJQ==
X-Proofpoint-GUID: LkaTzSLFBFFrl291wl6dneAScw0MiPJy
X-Proofpoint-ORIG-GUID: LkaTzSLFBFFrl291wl6dneAScw0MiPJy
X-Authority-Analysis: v=2.4 cv=HpJG3UTS c=1 sm=1 tr=0 ts=69f9a1c9 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=CVofd9qyej9kTKCMH18A:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050072

On 5/4/26 10:12, Shawn Guo wrote:
> From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> 
> Document Temperature Sensor (TSENS) on Qualcomm Nord SoC.
> 
> Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> Reviewed-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Applied, thanks
