Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F76049B1F6
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 11:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790162305; cv=none; b=EtzBbyvtzjGSxE1yUs/sjRymrq1tPaGqtkVoUQwrRvUun0qgJ8c3gUr/M3C5cajo2Sa9uX5ZOYBFuf8wo/gVhTeno38JmhsMj2kIqkskmVyFid+gwzVOMwE7kOWHqr1GDUGj9vGPtgrc2l//JIvbEWojwsDvWyhRzazyuirl2a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790162305; c=relaxed/simple;
	bh=maTSaclQ16IhwN9YZzXL2nmAdX43DWT4iQJpYDEEsAY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hc46FBKELmjLpzv3lB9qSCV3LZEp8vybhNIAIQp7WqhtghPvXReRT5uKvJlt9LgtcbEPsSshEtmmEDaY0w0RMdzBLpe1Jz6Ql96dtYEiucfv18+genwgHBqS1KFJc49NXW5IgCQSdIKqjXUJUVvXKTe+pZsiJad/hhatjIdWJ/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n6t8J6vi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y654ajXt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n6t8J6vi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y654ajXt"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA2o0R2821380
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 11:18:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y5HvJEnsTYcbFbHF9VSG+7AqvWxgJBjz8BE23CP1doU=; b=n6t8J6viQBHuQx0Z
	pC5UuZ0f2h1zGjtmqozBoFR6EJGtFqrxr3pReq3t6R9bTgqDm8QOUBbEXArJVI8z
	3g9ZjCaLkUdpMLuAzbd4Zl7ugBHCJncyI/aAVZeZ2PfnTvwZU4n8L6Sh58dzcFXS
	nf43IpxmpoMhPFDIC1nrz/q1+iRnsq7VLOLW1cQlThBagT9QvgXs1Pjg0/XCXHeb
	ayz6Jiacpkgs7NlXwhxujVcp/RY9MCSBbqgTTDVZ85CA9NfkWQnmcWfuf7GluAL0
	HjxKQNAMi3jJTca0PKPPYEPaF2dy/c/ejtA1eLtMH+F+5o99aazUgvX4UOTwsxI9
	1B/LKA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvbwargx8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 11:18:22 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e661ce1dcso16309685a.0
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 04:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790162302; x=1790767102; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y5HvJEnsTYcbFbHF9VSG+7AqvWxgJBjz8BE23CP1doU=;
        b=Y654ajXtU1bZPfrfGglGWIWB+Rw2o8c5SNcnNITXW9YN6nag99Th22pIQ/qYcK0goA
         hQDwvIXawqBCaEb9COCwM9pLiyLtZhf30UYU4sXknOWQvI3FOYxQI31Mvf/ElQltBUo/
         6QNSi9XVlYQVMfHtwIUOiwPNkHGNmCHiRpbaTLpePz3+Go8/g+UpcElFsduKrq6/Wd5Y
         vGljh/5yhWxK+eqMeFs1w9nrNe4dwPiNlYretKbOqZZWmungGcNdnaBk5cDi1QnjNLP0
         Uk8wpNGzBZTcaDkZrJ7LuXa4PCD1gHDIbYjuTc6klXatdVeuFwBP/BXu/m2DuVh/qw4b
         zr8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790162302; x=1790767102;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y5HvJEnsTYcbFbHF9VSG+7AqvWxgJBjz8BE23CP1doU=;
        b=wyoAyumtKY7rUcSiPMYbm/niais9wRNLQXqVo+rGRZjpj6W+luoBN0siI1vAuo32UO
         b3Vcsx9CV+pgflmNFI2YHXnbsH6iknjovPCWBdxB5XhB+cOY5ezvAvf7ab+SzOS63wSh
         +mn9NNAywbZ3X0VGHRl7OYEUrUJsTEyKuyJFMi+TRnPck862BNpv2APFQ98+qHTEZqnZ
         4WOjp3uFHkfwRAPuQjPoX6h2I0PVfgLamSdEDeVlnVzRo1He7/y/37nlgzQGAuCdnwh8
         ULodSgHmU/mZDZOR0gaENeUZMpywGYsow6edfEogtBdGea5lrxV15wzAKSGEXlgaveaO
         mHpw==
X-Forwarded-Encrypted: i=1; AKwUvByLXRbaB/1D0VrdeLU6EAlOR28TpZM3xo15mkzpBI6QSJZFnn8h1UNBHwI/jhpMefBL8yFysnrIOxCC@vger.kernel.org
X-Gm-Message-State: AFuF++mzhjWkyjwq5st9JMB2DMyX1NXuJmeKcoAObf6Zi+1kTFSKVJqV
	Ir4y4n2zFr0DesQMPamju6aH83g9KR5MLhUlU18jXTFNmobdhrYIuIjI6yIL+v32y9p7F75wkr9
	Spi3PLt3RwfvrJoRudQrpP9Ih3Phpfc7qWavyZ1Ub4d5k5J4gzkaDwbmGNBAU1Mtu
X-Gm-Gg: AYBFou1/GhRL4b8CTPzKuFbtcmeW7t34itO4P4dMzsA/o6y6+5jHpIc6ZMsx7Sd+eko
	6RGoRhc2icsjD01+K7XxkVA8zKxnvZS6RKpCDQJiBUDFXHDiUT902QBLB4zPDuJCe8IyVEydZAT
	iVGBrI1zHxVrtj3VHLZTnbasMj/N+dmhzs3r4w1n3B0q87A24DsfMDG+88wREKho1rfsAGIMHz4
	1Ur8VfsC3o/gEdsHkly8GNMO4mMM5eEdMDLlxdyee7iieDg76mlbrjp+kqaksmN5XVfPxpTzqTp
	TuoXLY8YD5nUCNV6dzoWqzGhVs3+1FJVndoP/UEDv7ud9p3K4tquxQ9lCTu6JxrkXqu3IKmLgyd
	lIE44ZiWLPErth181gpoorkUROQo5r5QA
X-Received: by 2002:a05:620a:438c:b0:93a:19cc:107a with SMTP id af79cd13be357-93c250972e1mr336213785a.1.1790162301567;
        Wed, 23 Sep 2026 04:18:21 -0700 (PDT)
X-Received: by 2002:a05:620a:438c:b0:93a:19cc:107a with SMTP id af79cd13be357-93c250972e1mr336210185a.1.1790162301150;
        Wed, 23 Sep 2026 04:18:21 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae6e3677sm100600266b.62.2026.09.23.04.18.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 04:18:20 -0700 (PDT)
Message-ID: <75d01a06-b943-4dc8-85e7-0eb578bd0e27@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 13:18:17 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/15] drm/msm/a6xx: Honor perfmode_bw threshold on A8x
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260923-hawi-gpu-v1-0-0c3c79a1a470@oss.qualcomm.com>
 <20260923-hawi-gpu-v1-1-0c3c79a1a470@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260923-hawi-gpu-v1-1-0c3c79a1a470@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0NCBTYWx0ZWRfX0afOF+W/RUnj
 32vUOsLOwOtqdxvkGBKfJsXPTuUW67ZLh7odPYqyMwxzCNTd4LeGsjNXcfm+/UGsi98q4K1E7IG
 CNyiglRtaBZDWVc8kbewkU/HHkbAGI71SCr38ctEIAozuJ5FqvddLigAA1goai2pUS3B1LGuxVf
 I6ztY6el0Tb8DzVGkpBNJdjAceL4ul+n4ck4CwQJ5Pfg/ayikHDvWHGpVczcxWQ8ra6sI7o0gGd
 VPV6gzrlw4M83/Rri6ju2OCjImj+aPN4aXtkXm4kIdwsBSiijMh18jVyaqghMg2Rw469xbjEHpR
 oT9h3PNYjjZKrTjV2ECZfVyuqEW1P0+vZFTzf8nlK7HqzxCeZpndBrdWuQ3qS2ka8l948RG58wQ
 J7fBPZHocWLfU2I08V+6LtMF6Pfz6ClsS3UqroJk/MunmXSqWdczOUStExHO9GyBiGRnkXExhFZ
 79Y9Ni4MkD5Mv1thEaA==
X-Authority-Analysis: v=2.4 cv=HfuB3SE8 c=1 sm=1 tr=0 ts=6ab3b57e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=YJv5aonfaXPMDC4gfg4A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: Z-435gfOltWDgh3f2yq6bJaWVKuTzXX4
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0NCBTYWx0ZWRfX1RzYyc/htR9G
 kTFxrQwEYpE4g28/NMKEFD26W+5KZlukfjN0CA//DxeuC3cYWbDz/KuH5O2nUhlz46ELTokLjme
 TljqpU0zSci/BCGYbtUuodr88zX9ODE=
X-Proofpoint-ORIG-GUID: Z-435gfOltWDgh3f2yq6bJaWVKuTzXX4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230044

On 9/23/26 12:25 PM, Akhil P Oommen wrote:
> Instead of voting ACV for all bw corners for A8x GPU, restrict it to BW
> votes above the perfmode_bw threshold, similar to the A7x GPUs.
> 
> Fixes: 288a93200892 ("drm/msm/adreno: Introduce A8x GPU Support")
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
