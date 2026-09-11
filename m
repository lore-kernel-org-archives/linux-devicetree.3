Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4789113B5B3
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 08:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789116919; cv=none; b=MjxFQXn+rigb4s9vB3rCdzZqKcqWYGsieK2vkFqySE291wBUHgVM+3HG3NBxiQFdgvRaA4kXSpxtk436oBmfd+Co1X3US+54b8e7esUNIzECWzpWV1G4dEns0A6+1NotGuI/iA57JnrLBt9Ow+v96LwKHBtFfS6DnfVwhsNEd7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789116919; c=relaxed/simple;
	bh=2IbXZHi371lo7FXX0zW3IyQ0mtUslzhc6wCLyKQtbjM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EuvJzUhrqOCmJX7Ggm016wSIjqNFNnARTjEE+BxRAtkviaiGYHfrrJCidJuK4pS5SDryrkbCn8UweVC8mYcpVh9eUWtrhVy0uIFgZZiNQ1Hgu/7W45jULxqwr77mRlFWbElKq7nLUHejysuYh10uOgfTanEwlatxetf1TUIOaI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XZ9hKgyi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WlKW88dp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XZ9hKgyi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WlKW88dp"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7knMb143881
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 08:55:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2IbXZHi371lo7FXX0zW3IyQ0mtUslzhc6wCLyKQtbjM=; b=XZ9hKgyi+VqKDRWt
	Sg79lJotgtVbJzymLntOnFnfzynIR8cLozJoYcxA/gCQ4FJJ0bIkAwrITno1PjuU
	LGCGxpRoFO/BkTm3UaI/8nqBSkGAvKG7vjmSKclfHlmkZ3iGnxdqJqmDmM1dpizM
	P+z561EgSNXDaS8XtJWoAoxJSBy2STweaO55K3pCIHCD53EC+z2m8MWQL+EtPZRm
	eegor3/SUMQk9vO0JGpaaPISO2LC0d3zImu6cu9oqDzpmjb5Sv+uq3DY2ecd7cRn
	IcLONC5WNKYXI0pmz62ezikhtyTwePRJvrDS4h0/U1ShqQlVwUNzGCBocy93Agyt
	xX4gHQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbd38tyd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 08:55:17 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90e8e3e6ca0so799116d6.3
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 01:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789116916; x=1789721716; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2IbXZHi371lo7FXX0zW3IyQ0mtUslzhc6wCLyKQtbjM=;
        b=WlKW88dp2VQ4sJNkI7lRNPtqXe0/HygVcVhp70z0/9pdVpPLPnn7YFNNaYxOxNczYJ
         gWvx7SiVDUoamnARWR0TAXFeOE4TE46BY7l5LFW+Db75D3iMJdn+aRSg22zZc9rmrpLN
         vZ3I+Emptjb3QzuFq6lrq5At5wXyUdOM87whZ46cnNxQgjm+9kgc5jpNolOiqjuXPtjk
         NZoCdY8eDoZp6JugrP6m/uITUNB2cG8W668M1RsCF1ja8lVZCuq8PVOW+q/kRm2SYsrR
         ajjOn3xr1zwKzwfTxPSjCqnUbJmyXlX8nz4sBfZpUw9Pcq8yWx+o166RzCbwQ2NnFMFq
         agMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789116916; x=1789721716;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2IbXZHi371lo7FXX0zW3IyQ0mtUslzhc6wCLyKQtbjM=;
        b=ZJws+8yQWrP4ETUvsNwCidJmOBO8cU+bXJyzDoWPzU6IOJJ16E2uNruFdCMq3ai7uj
         OgbFpfqIK/yNeJOB7QezrEkEQsTmRdIsFTPuxIdJlNKFIiqYttmyk5pTSMlJqFdDCDTw
         C7ee5uMTUDK2ub+m3Nt7BA+sRVqtatfeNTFYDFWck0u1ztCepEg/NrTKPCRnMLS/gMqB
         6/GNBG4d8DMgsAQVLOn1bsFpJBNtS/5+Uny613dVYknxvbhYy5pGELg7V0tFJ2736Hm6
         XE+uvfaVrz0H84wHzA+zbckPvksbSiJ/FL7TFJBEJDTLBfDqDa1sIVB6UqrUs8yUtrtw
         XF8Q==
X-Forwarded-Encrypted: i=1; AKwUvBxHYIWFvpZwhp/0TxtzhpuVlF2GMwtseGX3mpS6BNcYp7WGj3B7a0MXL7gTOvkM/602XsiHxKUq9p9e@vger.kernel.org
X-Gm-Message-State: AFuF++nMWwdw82Qf3suaJO/0DI9Gh3paSGdTz9zq/NciD4ZcYCL+cSo2
	ZcZm3Tuq5ILsBcE1g/jv8RQmaRGnkkkjmyArsP0p91CclWwcVGJVS1w/Xttw5FWDf1i6fVgPNOB
	o4Hg5O5XM8plzDwmyN0bjeIbyp8tKbxPugJ4irb7D7O8y6zhqWxEFb7FSyCOqui5C
X-Gm-Gg: AYBFou1DSvONAihp7b8kSL5JGFAzoxvgbqysS2rijYgRRsRbJ7+KE2yOE8kAFofPPg3
	MmC6UDmjJJFeivCjDaMdGZhckh0gochOSn5Ujg7/KwGE7TluGDhOmlTk9csrd55hAiDUkCTHOkw
	5qnfP5EASrGcWEtUETSXHFFe/a0Kht7jqT7SnRK2qB+d1/wKPLfkHYlmL3tKP5Mw4owbWYlOD0r
	ZKj5fE7mjlgmZB4qeGHVi8bxIGunYy4iAUwhumGDeZDZgA2lFuGfEgRWPa1POCJJLw5a5P1KVfP
	IOXYBita1/GHceqWyne4+xI1f/1zT1RB4yW3GYGa9aoBN7ME2GOFxWpYs3xPg0r8Z+w/5gHCvpy
	KnQPM1Dbd7T+vFBc99TchYQ==
X-Received: by 2002:ad4:5aaf:0:b0:907:8b2c:ef0 with SMTP id 6a1803df08f44-9121211e4dbmr33150866d6.4.1789116915944;
        Fri, 11 Sep 2026 01:55:15 -0700 (PDT)
X-Received: by 2002:ad4:5aaf:0:b0:907:8b2c:ef0 with SMTP id 6a1803df08f44-9121211e4dbmr33150686d6.4.1789116915562;
        Fri, 11 Sep 2026 01:55:15 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c296608aee3sm56924666b.37.2026.09.11.01.55.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 01:55:14 -0700 (PDT)
Message-ID: <477ff72a-fe0b-4c23-8448-a0ec87c7e039@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 10:55:12 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/3] Add driver for Novatek NT35596S panel
To: David Heidelberg <david@ixit.cz>, Sumit Semwal <sumit.semwal@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Molly Sophia <mollysophia379@gmail.com>,
        Arnaud Ferraris <arnaud.ferraris@collabora.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250913-nt35596s-v6-0-b5deb05e04af@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250913-nt35596s-v6-0-b5deb05e04af@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Bv8IUoX5 c=1 sm=1 tr=0 ts=6aa3c1f5 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=XtAJtvJZskthm95za0cA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: FVykKordgcoAuse-qayGHCBagOkI5uQc
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDEyMyBTYWx0ZWRfX7r6CwQ3puO1R
 lqZoOYtbWKGOCxgA5PKw4BGB/m/JDDcHJTeWi0Uvm2CbZoUdQcyksUVmRbNaiCLNB0j40oGMaT4
 We9RSJu9EV/+jFhu2bk7kPxMqpeLNac=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDEyMyBTYWx0ZWRfX/B2DPyMet5A1
 6LVAeb77VfYXuRl2VjGp+sIKcLcxU3Y/TknEctwfSVqYqwyChTrl5bbWDPFVIcZ9+rad4dzmkKd
 ghhrwSGlZaQuIn+5D3DSQIBnP/9WSb3T3Lo+qarAiIb8m1qgiSiq3z+b/8saZtLXurDAWXJ7p32
 WMlUvQskEVrY4c7aO5FMATzfzQ8nflTJ0N1sJhCYsuxGjdtTOcyrBVG/aLZSW8rpxnvO/WoPbEP
 PdH9/8E2GLLuZ498hyZnuqzBzFBkw7GsSNuUCFUMg/5m1XEHAGGMM2z0nyJK6vlQQJnu53GhWUV
 vauQLudyB18CBI+1xEX01BJ6H9efnaCGZdeTfMTZgYniI5dVyTs+RBPmK+uB7XkgtS5s4yJFyat
 yadoNIN/ru2Dwi+WBgkOYRqwT/ebDrmp9jtOXVFxH2g5kuhUYTLvhCr6cqBLO2AZaiUy7fS6wPQ
 SfmR53VvRoInqxAKnkg==
X-Proofpoint-ORIG-GUID: FVykKordgcoAuse-qayGHCBagOkI5uQc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110123

On 9/13/25 9:19 PM, David Heidelberg wrote:
> These patches add support for Novatek NT35596S based JDI FHD panels.
> This panel is already used by mainlined Xiaomi Mi Mix 2S mobile phone.

Hello, are you going to be following up on this?

I noticed we've had the jdi,fhd-nt35596s compatible in the QC tree
for 3 years, without bindings and even without a driver..

It's producing DT warnings, so if this is not restarted, I'd like
to drop that node soon to quiesce them, with of course proper
reintroduction being more than welcome.

Konrad
