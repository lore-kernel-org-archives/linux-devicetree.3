Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D2A4E8E15
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 13:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792416226; cv=none; b=ddFcn1CGF9yPe2eNM8zWo31oyb0arDyiwpkcJGKnYZqoVxBGtM4zeGuftbLLi/pLsozf21Td0GJSQEQcCGkQz35BlhUefeEfvm5FMxrOOnKijyTbRTp2+mRIjz9TdJGsKyMyilcXJjtKM2jHbZcl6zPS2TiwTwZBnXAUUscYbqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792416226; c=relaxed/simple;
	bh=q9+lXsDfVro2dRtb/qn4cukihNKvxfORcaUyBp778Ck=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S7OMFmaDEw9pv7I2DKHO0pB7hVF0Qw4rpcTNZO8xS98M+48QOcKClADdJezg3l4kFfDMF1B08+aLVFa9fabUSkgu57ffsagftyoAet+7KESGVMReeSCnrzDksSeX9WY2rWd70iF/h/nl3Y2TRBOhXfKq1Lt93sZMBOKkd0wgsQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cWUMyhg9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gG/M7uoU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cWUMyhg9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gG/M7uoU"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8P0T63256656
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 13:23:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8hblxjZ9KBP0XKSNbf5MNxLLDFs4xig3vgWNCXG8XHg=; b=cWUMyhg91cLKb5Fo
	STmTeq3iSmi5B1Wlt4PFdpEKCKXgAT8Sddinsz1Wtes3oYW994NV6Qr46w3bNnzi
	/BMVTNfNDJEMkHUNHVFH/TD0FlNV7tnDJpBhvl1WjvIkK03ZI5o9v4poNPfq1hnH
	FKpfhIMua3oBt/69e2rELIp6DNSFBBloizOqiBZvAu0Nyl0SLf1Rm1pSioKpr5SK
	CQgIuyRU62cJMnoMQlUw7U6VGha64wiKRVAMA+FUuszOZyfeEkgSZCcE1+dH/wfl
	iWG/5/QXSqWfsf1nLav42dk8gx99TpiQX7cuy4a+/0X2Zh7WbuIVEwEKFZuGJm/g
	4xaexA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf3f991c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 13:23:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93e629c7b16so37190585a.1
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 06:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792416222; x=1793021022; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8hblxjZ9KBP0XKSNbf5MNxLLDFs4xig3vgWNCXG8XHg=;
        b=gG/M7uoUhRyX5O4JdWVpmtDZ32VbUFvuFpY/n88ZbvpCcuh3grmFJe9nB1dfHGxjde
         0pBNIzzUNmnWxcS7ODo6spf0sWXZg2cFezxSu9QVzwbx+hkabeIBppSRXWlEfsqoLrzg
         t9nqEpCSpCC7Vf6CXcgGkWjhcwaVUTvbDMcX1pAG//gnY4AMcjUKdxdAoyMQeUi0D5mr
         0hYYMqnd2vDPzsbXtlhXYziysUfEl0qnXi19wCWhG71JowIB1vtmpWRgtoAgX9hKTso2
         9urEWs4AiJ33LPzJWoXwM1GeLXUBq2CIIw+okm/a3D8GyOIpxvSEfSx66QJeQXvtlb+1
         7kpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792416222; x=1793021022;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8hblxjZ9KBP0XKSNbf5MNxLLDFs4xig3vgWNCXG8XHg=;
        b=YaVb34c16f2NLSGjdbm36MxIyJdGNtEDTynOp/CwbUAFL+bmOCtulnbRFMqndxz4fb
         /VAoyFanUnlC1Itx9pw7wJ5pbJcgmiD6suM5BT2JlgoX9O+csIZhcUMZ74mYUOqAanV6
         C7mz98nL4RJPH+nMRSulJyN06mGwod82U/x2rUUPk0EmiZENPkx6aJiyznXEv8INRpSu
         xrzgt+0S6UufqUoxqiNcEtGfdXmQjTQTMA78g7ZNkoyXfCGhFo1K2PKmEqGG8TE4NmlI
         FLU4T7zL5c/m6xOgJbhmI8U9OGVxtqNnSLBIrohAEj/ToGABMASXvEWL/ECQj1Nl5X7q
         Vd1Q==
X-Forwarded-Encrypted: i=1; AKwUvBx/swRVD60IdqBL9C5l64JU1g8kuYZddDOTRDg3u1HRMNAVSI7+7wxT1vW3W5G3kj5BWAPZLFfYxqxu@vger.kernel.org
X-Gm-Message-State: AFq9FYLx5zyJc3S1wEpboqvPu+iYdJYUq//4MZicOwnCgGRHMcehFHW7
	IZKJlab0DdlKq6qc9tNOcm447p1fCLaXR7q7wtTqtejiJGqVVmV3LyQR9lLXVJpSO7j3obtejfQ
	eNFNtmpmt8wK+unfs53LGSPmXdGuca/5RtU/M0GwN9MP2t/lKO1gl1bN0KR0xnpie
X-Gm-Gg: AYBFou33PENm9k62Dg+S29JPuKSJ64gd+MhPAbFJDLxfjR738Nju5q7uXdzlTEDL4Fc
	H1tQW/16yU+5SooX3IPo4idoNX6RYsAUhHFXgK1CUWklltjg3Vt3TtUqeQgtVBy2gXjVXtWKXm/
	wrrDs1vT81qu4S2/ipjwqGSYRazr3mxnDa+u0ulMUMHn7uX55aW2uXwUifwXJ2ZsFmu+LVhhEXy
	i4aK5rZReU8XYYXjmk/Q7+m3XKWj9KD4PXLtEdukJyRTge0C0WPULfp9+XZM8iwyFiVU0QHymSi
	RRdB8mQoCgbo/yDDPeoem46+I4bnd00YLYY76I0THsqvYK7VA4FEOaBbCAkwKMmvzSEH6XZXdDP
	Ls1jnW2e4pgkduDi0YqfsdQ==
X-Received: by 2002:a05:620a:800b:b0:939:eb09:4458 with SMTP id af79cd13be357-93f29ce0b63mr1507861385a.3.1792416222010;
        Mon, 19 Oct 2026 06:23:42 -0700 (PDT)
X-Received: by 2002:a05:620a:800b:b0:939:eb09:4458 with SMTP id af79cd13be357-93f29ce0b63mr1507838685a.3.1792416220282;
        Mon, 19 Oct 2026 06:23:40 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4090dceeafsm370255866b.17.2026.10.19.06.23.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 06:23:39 -0700 (PDT)
Message-ID: <1cd852f1-ce14-4559-8215-2c3ca7bfda1e@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 15:23:36 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] drm/msm/adreno: Add Adreno 620
To: patches@brar.si, Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
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
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261016-adreno-a620-v1-0-4a7ed6210d7d@brar.si>
 <20261016-adreno-a620-v1-4-4a7ed6210d7d@brar.si>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261016-adreno-a620-v1-4-4a7ed6210d7d@brar.si>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 6N7ZCuq8T9RfhkMi_0WwLM9dnilQIG8Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1MyBTYWx0ZWRfXzbnsW+2d10Nm
 HIH0XzGCqKo9gxTi/aABdQK/QxQUjVm6KN1zWkyZB/VvNYXMhaPyh6TrgjzZH2qSwd2jqL/UWLX
 zy6TLbo0Nlfv/zM/EQCg2CrI4VVFRRoIyJEc3rqhj3feBZ99D0rRpWRWGp15VPtMN6f5aWsOTkO
 7WJBsGP3gAdAmlhcmVudE+ifjDQzRxe50zdP9W+Juanu06MnZR1y+C2tneVOFfLuV7xQPfZbpRQ
 +Qm0mZ1K+RvxnG6mmsnzbwFrht3meq0q+MU66kzcG/44LpXI4xqvrf2iz4Jfqc2iUexhjU5YU2E
 xsLmhD+HwPTG3zSWhhR4EWYsdARt4i8cDBBp6AyS05B3rSzkNZe8mIBGid3rtlQe78qDkPidheg
 dc3YgO2S4TkFZ9I3O2Mw450XJXCvCmtguSBmd2ATMiyRVEAghY68ruTQczupcNU5655MWQikB6N
 Mr2h4byPvwTPBcBuamw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1MyBTYWx0ZWRfX446FGKZNnO8Y
 dWXNHODd0pB3mbB4Bfq2RIVxy6sAI3TCy7Cv9gr/84ivlvA0aEXorIzlFKdxMXv6tPyPEpmbcw+
 j/rboIcWeVCx2xk+VhV+unATQ012kYc=
X-Proofpoint-GUID: 6N7ZCuq8T9RfhkMi_0WwLM9dnilQIG8Y
X-Authority-Analysis: v=2.4 cv=OaANnRTY c=1 sm=1 tr=0 ts=6ad619df cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=ODsmY_3wxSbvKopP8XUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 adultscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190053

On 10/16/26 2:53 PM, Ishu Brar via B4 Relay wrote:
> From: Ishu Brar <patches@brar.si>
> 
> Add the catalog entry for the Adreno 620 (chip id 0x06020000) found in
> the Snapdragon 765/765G/768G (SM7250). It is an A650 derivative and
> uses its SQE and GMU firmware and protect table, together with the A620
> zap shader.
> 
> The speed-bin fuse values map to the OPP bins as in the downstream
> "lito" devicetree: fuse 0 is the default bin and fuse 132 and 115 are
> the two alternate ones.
> 
> Tested on a OnePlus Nord (SM7250) with Vulkan.
> 
> Signed-off-by: Ishu Brar <patches@brar.si>
> ---

The protect maps differ a little, GPT says this:

- Downstream entry: {0x1c800, 0x1e7ff, NORDWR}.
- Mainline: NORDWR(0x1a800, 0x1fff) ends at 0x1c7ff. The next mainline entry is NORDWR(0x1f400, 0x443). So nothing covers 0x1c800–0x1e7ff.
- Registers there (from generated/a6xx_gmu.xml.h):
- GMU_NMI_CONTROL_STATUS (0x1cbf0)
- GMU_BOOT_SLUMBER_OPTION (0x1cbf8)
- GMU_GX_VOTE_IDX (0x1cbf9), GMU_MX_VOTE_IDX (0x1cbfa)
- GMU_DCVS_ACK_OPTION (0x1cbfc), GMU_DCVS_PERF_SETTING (0x1cbfd), GMU_DCVS_BW_SETTING (0x1cbfe), GMU_DCVS_RETURN (0x1cbff)
- GMU_CORE_FW_VERSION (0x1d3f8)

and it turns out that a650 should naturally reserve those too..

so please just add a

+	A6XX_PROTECT_NORDWR(0x1c800, 0x1fff),

in a separate commit there

Konrad
