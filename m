Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB7D4A0143
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 13:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788357468; cv=none; b=LAqtlXwqXKJQ8VdWQaPzExJ+Yq53VQqdpo+A3k9LUumxkW2KtKCG2e4m/62xHbx9vhpTUjYczO7CMU6ld6Of/VVcbYhsX7+8wHbmYYky26jskDC3xCKrW2WY0wYInfx0bGYeWcl1l+4jLrmZcENv2bv+Q/nYWb5R8OE029SgBgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788357468; c=relaxed/simple;
	bh=mbPB8TJm0SEs/kNNc3al0XqMbhDTl/navwPpGCPdZA4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=crQF2PeT529PvQeWNkhffIIUYyjgL6GozpgQfP6/N3kVdomkKP+NHlTv7Jt+8hXFhfx94VCLr04/+TlfaUn1d9mh0JNE+qed28VJaDhPTIm+FLzfWMpaYn7M7qTA0MxdVnZrTqcdLpnLIQoKW8zqG38apVevKfUgpcpxklr6md0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iwHmFP64; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PfqHYBGs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iwHmFP64";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PfqHYBGs"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682CR8Q21549926
	for <devicetree@vger.kernel.org>; Wed, 2 Sep 2026 13:57:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ihOODbYYBl20K7j9RBcJCe+Yb2VmHVhiJmcPvuSo0v0=; b=iwHmFP643AT5acfS
	hqqwU+mB/Tb/+WOAtCM6VRZhTk4QkyeuTfyrklIkCVu9DgwzW7BRJHe6pjFj/PgB
	dl6I8kyNmVsVRHlOIZV37LQZRt0fHhMAh5C4dK4t5zY/Xr/qYjHkLBhNHzzlIfji
	AzcJqEMRbW4CSX1ORST1RIMboKKqQqcNe10gGqddmzm2oykjOjJIkhpcGX8r3GEV
	4WZ2LzbhI/YhbWupToBjrJl6u2mXpZACj7GBYAPRmzr1YYQCtCFHt53UOxjIXM3F
	7GEfg34qliJEKsucJap1zuLW5URY3xGjtpWeLZJK8gOJkDh04mseGGwgsLL0kXVs
	lNDKKQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gej2c8s8j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 13:57:45 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-97bf9097592so16101241.2
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 06:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788357465; x=1788962265; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ihOODbYYBl20K7j9RBcJCe+Yb2VmHVhiJmcPvuSo0v0=;
        b=PfqHYBGsXZ9EDnwsFvVm4uV/bHDV7kMMBs8VxttK/zn3CXSIhgVOodeJYfZm0msOmp
         /EK3NcIEx71v1LUXIR6sERBP7zA5iyhZkdDDticAPfA6tNb9yqGNYpg7/0DRxZ9NUxn3
         DhtAUMt6IgjMggto9gENl5AZVnSjGh0ZNNMjLumUNN/n6A6J/SI5h7/x7y/2wigA35DS
         UDZDdNN7GeCOPUe7JQigus4MMAYuiWdkePmb74Ep39b+tIUqtkiDn076gPC4MHi1K5TX
         oOHitX1TcE/vsy08IQaU73UB3lEGovB0LEUJ0bsNhAHC7JaKzDhtQA+Oy7Cg4+6N1uSM
         LRmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788357465; x=1788962265;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ihOODbYYBl20K7j9RBcJCe+Yb2VmHVhiJmcPvuSo0v0=;
        b=XBAqQ1HagtcDG8+M6vsEqDq6xcZsDQZXq/LneEUyu3D8OnmfEe1JvOyPp46O184VaA
         wMaR9wYNW6u8KDUzW0IcG+mznYqOSmm27HTAun8729MwdI4sGDFd+gQU2Sfd0twCnhC3
         6mISHmk4/locKz8EsQtE9IuMVTpKi9MPG6IEP355p5pyBnL+sL9z/ZdeFMrihdlgNl67
         L7lHdU3b2Fm+uJdaFsfkCZelx7GD4KyMxL6gyxRUbw6ueybw88vXYavClbxx2PgHpT3Z
         aSekyy8aFIu56Yc6aYHHPwAbpremXSWjb4zBqxPChi4jJdiiSnguGuV+UfKthGoaRvaA
         t06Q==
X-Forwarded-Encrypted: i=1; AKwUvBz0Pnxgp1mOxjzIbvKNMNBXfPDt1tv/QTnfAIZMGi4AHASOj4ItJVVGc5kiRjUMkzYJeuawbKow6goo@vger.kernel.org
X-Gm-Message-State: AFuF++n829dcKZcUxuD3PKgw1C1o0yW+F7grkggbaU1uqB9XXyUu1bdB
	OuLE1icUeFZoWWCSAst8BseHhbfP15+48nk5FpYtwdzrnVSFiD4l8flGOGd4l4S0if6qklsOTqm
	rh+ZntBK0HLZbTGp/W4kEPk1UFkLo5Uoe8ScWKHlQFjYVdBv6G/T5/MJ+JcAu1V9b
X-Gm-Gg: AYBFou3xgCywG3oPvGMkfZu6MRDYhNuvPqIuZt7Ik3XZwvHXl3CtKHNksXFpn2mVhvF
	VjPZdOpSKpG/bgAPFwojHJL6MBRtQd/fJG+a1pRL0wfDhS/QTMbcl+HsGdeRg+iRpAnIkeG7YJV
	63vmLQy7U628HMVwD5W/yckJQWUpeKJrnjjR6tYsCZ8i4NXdHqY8oGY+YBboKJJM8oQ6NNo2y3H
	SGBpw7nvGKy3YPfDF9SZ8Tzb+fQm8DPcd+K8YG0qKyTwWIEzbQ3I9FqhEhetpyY448PAVibLjEC
	A4CDG+7rdFJX0eD2PnUdWehpvxv2F5mp7IBom0yq+aoQkd2AU7p6uLVS7kLogYFPr7t01DrmvlX
	KQU8oIkxbWpTUNVv5r4TFdg==
X-Received: by 2002:a05:6102:292c:b0:78a:135e:feb8 with SMTP id ada2fe7eead31-78a1f241009mr637120137.0.1788357464851;
        Wed, 02 Sep 2026 06:57:44 -0700 (PDT)
X-Received: by 2002:a05:6102:292c:b0:78a:135e:feb8 with SMTP id ada2fe7eead31-78a1f241009mr637100137.0.1788357464435;
        Wed, 02 Sep 2026 06:57:44 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a34ad006e0sm5819851fa.23.2026.09.02.06.57.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 06:57:43 -0700 (PDT)
Message-ID: <16304e5b-9be6-4f4c-85b5-c03a7ef67d23@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 15:57:40 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] arm64: dts: qcom: nord: Add the SPMI PMIC arbiter
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260831032103.341633-1-shengchao.guo@oss.qualcomm.com>
 <20260831032103.341633-4-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260831032103.341633-4-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDEyMyBTYWx0ZWRfXyG9B38ganX8b
 BrXxdSvv8O9LZ0dWBkUn0Ys/sFDePxWhnj5D4K1rlPOPeYOgZVwKSjKWUa0EH6eTRQP6aLLzXsL
 MK6uT7tVq4bLGeOOzFJEWcBHTfurn0w=
X-Authority-Analysis: v=2.4 cv=G+ss1dk5 c=1 sm=1 tr=0 ts=6a982b59 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=BVw2MW3o-W1nHbPf4OAA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: d-1lGij-_5EhS0qNYNjbGe-MV4C6f1oX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDEyMyBTYWx0ZWRfX3mq9rUHRmZrB
 ENoa+4O7h1V2dQGAcU2+etLC7A7E3Xj9I/llbhiKWcgT0NaK6WJ8FDLjY88XFj4rItpno4TI2SW
 zl3Ua0JGDqUoKJlbDctjkO41/2leE+o80EBFpT1f6ZpKBSGaH2Ri9/vbmjdhhE0j+LNF8LFi6iL
 7C/jVxEuViZ9qLQ7jj5EfM9Bu+QGMIPBKInpSms8EHPyVIGTe9sRsD89G8yzXXOs+j0S4f7GvUq
 TFzkp7ZMTOUsy13U9XiTeKZPTM1IuRMxRmNbgBACkJHCCNNKpZRHBr21uium+ItsId+wdNcvZrV
 oKb9ALP5dKinWmM8dhoe6JbsJE6zJz9v+Oki+ivI8rZX1Ms2YtcR9NAotY3evsXW1xsU9r0CbeK
 7VqOnz+kHqDqKlJvINBwnetYDqxSpEXW8eYUtdvG5beRTIL0qMND/8HouGZaertk5z4LMYcZCHp
 /31Gx6qXY7qMqS9zcAg==
X-Proofpoint-ORIG-GUID: d-1lGij-_5EhS0qNYNjbGe-MV4C6f1oX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_03,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020123

On 8/31/26 5:21 AM, Shawn Guo wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> 
> Add the SPMI PMIC Arbiter node for the Nord platforms.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Indeed there's only a single channel

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
