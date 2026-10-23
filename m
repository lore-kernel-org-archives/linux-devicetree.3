Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792751176;
	b=xNGNzJl4Q3B0tieKizhAvFeRd0f6cHbF9SedS+73+pdk6I8ntIt4IfkBQv2C4qx+sYL9
	 qCmCP6dHfOQDOawiC3s91ZJ031tAP3WYnEM/dlDquK8zzE1/z7YXkkgPWDorY1Y+Rgs97
	 l9uDkYrNnhgOZrYwmnkm/PEb80E2fhMD+F3KZWZUnSzWlkmtt8Cbv0GilLXeZElsHI0xw
	 ps1f94f7g4t2nyJcMqGDYLpbOxqwR8fFK8BcP3p3CAhtb/vdxkGqpj+uE0LH5FylQMkVn
	 KtjBl1kmPVzGHfUvOJbZ3+11CrIBDB7vUpMFnjMrjQFN63zhqRr5W+Xn4ZxwlMwmPKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792751176;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=t38QF437OGSZbU1LgmCYZ33oL6v3P/HVKC+sKk2KKj8=;
	b=z8hbTHJ+GZ+krxBnTDvgZOOB7WpH8iQJTDxENIT8ODyk9y/j9y2B6iTGk/G3Eqa4Lpxj
	 CkMFT7VXm1F18JIE0vOlnLd125j/mUyuPRJvOO12ru3jyV6Isg6IW7Ao96dQjZNrVH71K
	 ZB5IhMJg+iYuUHWCg8x5kXSeHgLitANzpLJAWjsUnLqePQE1Kojw48GP3VVsmq6eoKSMU
	 ZuHBee2zEZ+svv8KkgNHgguq2RnLBZSI4yf0MwzxAWdzmnC7xPFQ0BelPGhtabvEUdGbW
	 ksczsTBxhdoYgkhHbd5yvDYP5i/8+mw6z6QnLL5ZsMzgqWu/MvQdRy643H8fqKEyfsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QgBLDPCZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jwbdT4rw;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E48606A327
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 10:26:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12E48606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QgBLDPCZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jwbdT4rw
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAATmV3560859
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 10:26:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t38QF437OGSZbU1LgmCYZ33oL6v3P/HVKC+sKk2KKj8=; b=QgBLDPCZRKnWFt7R
	GQySepEZHhLJwvp9cpFc1+XalNBUIf+bv6eGjktc3F7///EVijMuSwVuBL1OzQIU
	beDPm6e3dZCXtad1VbQ7ZrjSiwtQKRX7TGDlo4YS+Z39vTRkJOoEue4ztF4To91h
	oNPxy7VHMwdnba8X0SQrWr1nXsUIny61g0Yb5wJta5Te6CVoBLbk1msoBPew4e1c
	NOprPZKQTHaN/t6u4bbUuvmW2zRsl5W78TKWZCifjcLnkybNEp4GPBjUCzhx59tD
	50pMBcgKYPWhJ/wpQvxcyotIspPglT7QnofnPr9nHCyUkdh8ieEGNhBmGjJ9W0m9
	qxJ/Pw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmpb6x3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 10:26:15 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9178ba8eb30so1636176d6.0
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 03:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792751174; x=1793355974; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t38QF437OGSZbU1LgmCYZ33oL6v3P/HVKC+sKk2KKj8=;
        b=jwbdT4rwDiC2J6hxTHfvkqUXCsjVoFP157nK197lidnh2FgMeJMDyefrhyFNwwpSOM
         b13u9VC7w8sRHTazYLjNWRbXK02QbI0/9RTXgzvz73wi85bOyqH8NJrZbhS8cDDrt6vj
         mAcdfqlIUspd6e5ySasfAw6dqe4nxksr/uCL2suATiC0/mV8xBsz6Rma/wS5HvRvH5Lu
         p43a01I54kFbeuFUwdE94N3CDEaAqEPHsQXdDp5iFapmOreKisp3vpihc16c3Hif7uSv
         XKm6G0XFVZqzlEHC0soKCHDqOhvzOsDl/PYWHR3wqN/pBFEEhx/hbv2G8JhkXSJhhQL7
         j6dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792751174; x=1793355974;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t38QF437OGSZbU1LgmCYZ33oL6v3P/HVKC+sKk2KKj8=;
        b=eXiY/JdRkrH1YKlYbVODKLteiS8VlXt5RHEpBt4oQF/9oKcHiqoLPeTle3/WhfEnhO
         3vECrcHOCKIhqdK1S0RPB9YVlMoQ+nFR81lq0NA3yG10V3nq1cRajQEGVOSXzPDOZbIw
         0MSqgjLJ8b4EgeDuF7YOd4R9D3FzuifhnbvGiXZy+HY78Q1f6cqXc8TOhRffNRchixyE
         sFehQBJ4o+OrLqSTiBg86q1RALT6/AptPBsA8jP7wADZfsYLET5B2EFX6MWnluRu8PJa
         yjFBuxZyUMwPl+rdh2XJ8HAQewxCE9e8t+O1FdbJDExfXa5TdzjpW0Zyn3NB1aGl73Qx
         0EgQ==
X-Forwarded-Encrypted: i=1; AKwUvBzpc7nfewGrmqiFGhO60fwU5BN02Fuc39KWjOM4fVX6mBqWeJDU16iRda8xRsGC0jQK6tz2KHV9t66i@vger.kernel.org
X-Gm-Message-State: AFq9FYKkimIR+WVxJj4LAX0HikPCKGrF7XG6blU0CIBeMtJEbY+BGcIk
	11Td+BGCvDNQTqeBLIb5vDNNmyt6wlUlDXwfiBnM5/6nezgDH1pOnNEQLgn5hvMiTxJfv89pbFG
	R6DPL3MtA1kFbDyzI3i5G6pTuQL1S2LEuJu0Lbj4H2qkd67p1phKcj5Uv1smQw3Y6
X-Gm-Gg: AYBFou3X4+mSi3hpr+BqenGI0DeVWuMELCHa3acms0NEJ812XCsr7m/I2tD8FzmmbUO
	MHobm2RQCvDcj8yewq3zhezryxuVQC+OKKNmFla+F47Z8L4namQR/lUGssfNv1tU9vbC7riMTEd
	lxCNlufqNhreDu8dTkm2jlj779ly6evRe5v48qXOl96pN0Cf4gyF5KQaEir104coDl8YZE3pNh5
	vR8G2QchklfSqyiv2yMcn/6OjCVkMIfr4QGV01qFRAxGE7y/uWwjP/sWTmlw42rqK1v+ccZHoHX
	FuFoJzoBgk4IWg9vcn5R6AhlKHuSb1RzZ5P2RcTFJYApVXm/2Q2ZlMhlDM3wabyW72ZbPKpYshj
	d9pxTQwyfqbuAMNDcq63a5g==
X-Received: by 2002:a05:620a:8121:b0:93e:54fc:2c79 with SMTP id af79cd13be357-93f6f96e833mr361783485a.5.1792751174353;
        Fri, 23 Oct 2026 03:26:14 -0700 (PDT)
X-Received: by 2002:a05:620a:8121:b0:93e:54fc:2c79 with SMTP id af79cd13be357-93f6f96e833mr361779385a.5.1792751173857;
        Fri, 23 Oct 2026 03:26:13 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46a5cf7164sm85473666b.76.2026.10.23.03.26.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 03:26:13 -0700 (PDT)
Message-ID: <2bcea2ae-b79c-4138-98ab-aa401466f9f2@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 12:26:09 +0200
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] drm/msm/dp: Add DisplayPort controller for
 Kaanapali
To: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>,
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
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261022-kaanapali_dp-v3-0-b5ae8e6083c3@oss.qualcomm.com>
 <20261022-kaanapali_dp-v3-2-b5ae8e6083c3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261022-kaanapali_dp-v3-2-b5ae8e6083c3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA0MCBTYWx0ZWRfX40S4xSEMMRqo
 cqCCeLYpnbkvo8QDwpb5LKACKvkLOUHyBEAgA/D7eMRey/P/SRXMDVVkLik5Iaik1JPe0Vw4T6t
 AzgwRUJzsm1k8jN++lCN06IO0T2IoGE=
X-Proofpoint-GUID: Z9cSQZOCqzdxSzNqTHNC7Ph-4plwcDnH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA0MCBTYWx0ZWRfX1ZhBwPevsvyn
 TfSb/ejKyVMgt6IyPZpLAwIipqpBJIROsTpgTPByBQED5JSLSTCYJf2ECfxaQyU4hbNkTW37ZJq
 8OlB0tQnNRIuDMvaUsmTELexoo1ka1VFV2dwoveiETxTPQSTvtbAf772MIcgbBQZ2cOw7LOMe1Q
 Lgy//vhz97zSmE+Sue7BZpL4r+DazZh3lRNDxzmPdL9EcNuQ8VTCXxuTE5TKuGIPF2and15bQr6
 uaz9HfjUY+LFNg9sOY6Pc8R9DE5b4W2gKpiKIIYz5LxCO+iUpo5h6AU8+9L/KZLD643RHTzyn8T
 QpWgeJprQIAFwhM2VrSA710iV2gmlFcK/tcwBUX7+wfrpq0oP4gbGtw0rb8XAVgxsZCOZyeOAOm
 xyrfnqVQACTXdh5FTlPUzYdkKhF+yGTfI0UveFxDebhd4Tpe51WTsPjXL9b8Nc90pScAKyY7sz/
 1Sh80whr2e+YVc07Mvw==
X-Proofpoint-ORIG-GUID: Z9cSQZOCqzdxSzNqTHNC7Ph-4plwcDnH
X-Authority-Analysis: v=2.4 cv=BdBNQbt2 c=1 sm=1 tr=0 ts=6adb3647 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=pYsF8wcMre0XH_84TdcA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230040

On 10/22/26 11:49 AM, Balaji Kalkonda wrote:
> The Qualcomm Kaanapali platform comes with a DisplayPort controller
> with a different base offset than the previous SM8650 SoC, add support
> for this in the DisplayPort driver.
> 
> Signed-off-by: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
> ---

you lost the tags from v1

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
