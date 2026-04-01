Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3733B3C05
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 08:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775033172; cv=none; b=RZZl5IqTY2Fi1dq/FfHWb8RuSTzjOrYw6Am2xdAoToB3uq91RFYlkXdjtzH8zg+8UaYwZ4gJTKMwD/QvG5lA9VkI1CdmdZvYmG+DApmvp+5WJsXgtjPpQurD4WPgLZcSnWWHHalLiHfUM0vxAMEfeWtkVdEkpVlQ/hOnNVuM/MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775033172; c=relaxed/simple;
	bh=lrucPphVTDTsDV59P2Uep9zvhUlx3+vvIARJ3BCWugc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FKtHud6pN3vyapShy4NBmxZbXtGAByUzUeH26TKpno0ei0SE1FUZdCR2Df1tbyrhbvzpLSOlF81UIkju+NIdwHwQ6WHaZaGQlsZvqcfl3oYB3ankOeCqIlC5oLp315pkRoCEV9x20BLedOetAjnbxi5Uku8RPABvXiEG4unuRP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U7XzKVrV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ddg27gAl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U7XzKVrV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ddg27gAl"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6316CPG0639236
	for <devicetree@vger.kernel.org>; Wed, 1 Apr 2026 08:46:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UeYW5+xptUXLWkRdr2dqPLrdEHJM3AnZno/OO5vRIhI=; b=U7XzKVrV7+G8PHim
	83Gx5V9Xs9mUF5cjPSxKt3HKoWJfPBYkKzGJ4McgqJVysnRS75COA9Zq3fxd47P+
	LR85+YQRc207++p9uYmvveSY8qNDCe00ehB3MtsUdtg+boOr0eQJVEATm1YcksSR
	277QtaooaTs1XE0XuudKBioeS32RqwwVXnUW0nH1T7KjkYmqmr9QMHtjey4882hw
	gVt9UMhZiYzEEblwFAoJ1HCBdDrYsVzn9Uj006nk2IK/3vfogV/Sor1bi28d2+dv
	sQTZy9zCclYuHbj3vqRHVQun0MQfAycmnSwfphFuO23RHzCyDTARZ/pctCbpVSHC
	3FJOQw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8g2av8e2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 08:46:10 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89cd541c0edso29186996d6.1
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 01:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775033169; x=1775637969; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UeYW5+xptUXLWkRdr2dqPLrdEHJM3AnZno/OO5vRIhI=;
        b=Ddg27gAlJDg1hHGRV/2aJ/+Rvnx5UpXZA/lSdkFqq97Hj8fFnKi26vWEQ+Hu+yErQY
         cEnrAJrc1Cr3ESKfJIhaIl8Q6Dd2Pw497lgDy/l1nQdADxYpGaCK6q682/B+fj4c3Rk0
         Z/vjfrld8XO4htDILllPITvEMGLbeY4sG2WBhhwkzDIz8elVU7DU9oh17FIbtHroA+Iw
         JYRkqqBIV0peX80aCDDzKguGbA1lAaNUg1jgPF40N2L8lU2lnXW6YnEY+vAfa2Vppxqp
         huNTVQmenP4qclN511TzRPPxz4BwPh8NIK4qIzRYcBloBUqg3xFymUcggcmGTjEcOfMR
         wQPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775033169; x=1775637969;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UeYW5+xptUXLWkRdr2dqPLrdEHJM3AnZno/OO5vRIhI=;
        b=deEifNaHfqZ/W+UICYITb9fPSgnKs5g1YUuUYGjWPS+UhD3QjLPAcLHGgf4vsjemvK
         JzSD2Zri3Xr7dFOqaW+uC76ssIr09jiUBnw7Z1cRpjOHikWy1uFNxXaqQuljFFTGTgzH
         yW5KCJoFmwBQdbBzyPq+k5n6L34DXMIHMA/lR0jtgBPb6ItQLF7Ws2r8Nn4Wo6yPXkX1
         8etz7nltGov6ZzHw8ikOU+J3ndjIvOdRPERpfOgFfWZf4wHl4MvBfGWajYaJvw2iGRNv
         YFsC4mPr3sK/7HSPs/6gUz5qrV4yJCc0445Cx8QJWQjHzUk70G6tmDOg4axSWZ/Byj/M
         NWXw==
X-Forwarded-Encrypted: i=1; AJvYcCX4owENJvQZprb40qqfsFa/jmP/0bpWgvMadRFudAk2F8M+syQayc+BjNe9w+FUo7+DSFmWNurpQ5VE@vger.kernel.org
X-Gm-Message-State: AOJu0YyHdtyrPkcLufKhYLnyrtziU9RRjtrG2sDR7lfkT9m/M60eae59
	BU+THLgmGEhNhJ2Q7knSmXto0pn8qUbCtkNKNcSuGs15bW29Zk+TGJMvbhnG9xX0/G6YFFaEz6K
	6YzLwh6LGRoHt3JKwZeHi8s8x+kn6JMCLxEDpmFI2t2Gw1Kt2xvIBRoSwlD0pSNSH
X-Gm-Gg: ATEYQzx0MDsIf5ru/ann4Lj1E1MW1XYWds5B/mhBzxE4Q22Ya5kkHwsEHPHBGIYc9x2
	jB0GJu66u9zAEhmhK2Unhxiu8wu1xj20/tYt0R9HHjWpDBukVgITjqGDc6QOb6d/TwXgNuIt2mO
	0/FsUckGc8t3OhJ3utoRl8kfut4jxcVDypUWdzy6WAT9Pe375T+HZuXeG5x8WFprwdoDqFgSphI
	lP0tzl0mE5iuL808EKiPdiEuRouSRjb4ZpI0Eaj3IuRy1NTVgc21r6ouIVQqVhQET41o4DqRKRG
	TxuHRlD2O6UtrvvkIRDXjUlSUZMMY+Wyj+2Zl/cWZ126qoiLNPG54Ibd4mNqY8hG30j7zKl5Xgy
	sXxOA4JOVaGtoeyRk+5Tl9vK3VL8Ocrwn4PsrRcCjcRM8SUZAN4czLE5L8tGtq+MSjiVnnmBI+O
	X+GE0=
X-Received: by 2002:a05:6214:1c46:b0:89a:46fd:3001 with SMTP id 6a1803df08f44-8a43404af75mr34157736d6.0.1775033169080;
        Wed, 01 Apr 2026 01:46:09 -0700 (PDT)
X-Received: by 2002:a05:6214:1c46:b0:89a:46fd:3001 with SMTP id 6a1803df08f44-8a43404af75mr34157466d6.0.1775033168669;
        Wed, 01 Apr 2026 01:46:08 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c2249fcbcsm37375066b.5.2026.04.01.01.46.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 01:46:07 -0700 (PDT)
Message-ID: <c01a99cc-77f4-4dbb-be53-5c0c91622c82@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 10:46:04 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] drm/msm/adreno: set cx_mmio regardless of if platform
 has LLCC
To: Alexander Koskovich <akoskovich@pm.me>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260331-adreno-810-v1-0-725801dbb12b@pm.me>
 <20260331-adreno-810-v1-3-725801dbb12b@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260331-adreno-810-v1-3-725801dbb12b@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA3OCBTYWx0ZWRfX2mqOBQWLMoBe
 aR4wZGAjSuYyVpM5LgA8Vzt0bwwi8egh5R/P1OkpDwsLby5qgR5n43IcB10qc3rHP1neiif7jw2
 jMzivU33SO1B2yqlYY7Vis7DlXv7kTd60YdT54ob4VNsQtrc/rfVvY67x5NovPBUdaD/i+QaA8C
 1VJl1zEAey1n4BMoWeWGjWHQSW7Tf1fE5S3/TdvnrIf/Ek6AF4k314kwLDxDELpLou4QV2ir7n3
 OdjnM8hNsdHdmOiZCLFn9l6EvTDCRqnA5MCUJXeKSNfj37ZQQWp4zxwoZwED6nF34oyDsZC7lwx
 8ABAjqnRsp9kr8BQNGbqA7l2cS0PXd8K0lS2EE7knxEtaannJ3SRZ8OmNtS6aEK+SC0DhE7WFq6
 4HpbvLmI5d8OOVqr3hTEjDMVl+ba0WxhsHxjKvq92MJHr4WTMYmIHxDkRxirUm6P+oNndIpNLTb
 t5HtjyleKrQDKW2l2bQ==
X-Authority-Analysis: v=2.4 cv=G4ER0tk5 c=1 sm=1 tr=0 ts=69ccdb52 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=k3NpOJoY7FANPw3bM2sA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: uuoQA55H_MQXl3OI_HLwWWDLVDxmxXC2
X-Proofpoint-ORIG-GUID: uuoQA55H_MQXl3OI_HLwWWDLVDxmxXC2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_02,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604010078

On 4/1/26 4:17 AM, Alexander Koskovich wrote:
> Platforms without a LLCC (e.g. milos) still need to be able to read and
> write to the cx_mem region. Previously if LLCC slices were unavailable
> the cx_mmio mapping was overwritten with ERR_PTR, causing a crash when
> the GMU later accessed cx_mem.
> 
> Move the cx_mmio mapping out of a6xx_llc_slices_init() into
> a6xx_gpu_init() so that cx_mem mapping is independent of LLCC.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
