Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC2F443E24
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 14:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786976023; cv=none; b=KdUAZ1aoNvRwtvEfcEDCirf0S3v5ci4gTIOLShJILLaf0fxFzgmAIu1KX1vBwWV4vuvD1Cb7eNEhehV9fgraTkTrMaMlJf8wnooOCy0tzdFhxlRGF6uUdKAV0384lCO6M8q0zEuAp7H9iCviiConR2577e4SphEIwk8mnXRNW8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786976023; c=relaxed/simple;
	bh=k7OIn0paOAZo3wXOcgAJfsv6nFVPK+Lo2VTwLCbguQ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GyDJA24r2KP2BKPOsg5B0GidpXOdScByA8c4aHbVbT3Co4e7YM7FBYZn67HL0wxEJp2SQ2VkxHFI9x2Nyw4+NwUXD+FYQ8Eqr119lRbecNS+cucPFeUMKt+Vxs4pTtH+mQ3S9Fsxm/DVzzVps/1Pw+dBI6TxRDeOa7qgXAI0SUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o+ZoEklJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G66fYuKq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o+ZoEklJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G66fYuKq"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HD5oAI2238632
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 14:13:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VgQVHsT19L5HSw7LtJPGoHYvBVum+1zO+UvRrJRep48=; b=o+ZoEklJksEw/ncN
	m1jTfs3bIKwuuaz1OMVfbhk4qYzCNquZtq6rH+QF3FKYLwGBk/XUs7hsdxTmp6ZL
	nVMT+VgqjkpkT5JTr9cNv0ucLoAxTLPJ7ADukQCm9riwyN6iDDb/DvZPqIPAtVug
	Qiwr1spnQHsuRby5r2G3MrtTRNqIHFmtqPXmUDTXaX62Vjs3AXlpWP/nMGw2ionP
	DZ40dbr4vrFWv+gdDj42AIcwFN7ozF4oplv906j4j4ue7iGrMViXQOrzSWlqydsR
	Xgk5Iz3/MQsTeVOwdV0RWyDUPb5j7EH6/PpkavDld2I7oB+SF4SFrwcdjXMHkSxh
	3qo+wA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3xyk99dp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 14:13:41 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7386e55c63cso54520137.3
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 07:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786976020; x=1787580820; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VgQVHsT19L5HSw7LtJPGoHYvBVum+1zO+UvRrJRep48=;
        b=G66fYuKqNI36UHdNOffPPYsJahZ/IbSA0sifTvT40PhBOuUSGxBIEJMqgsjjyhcR5a
         wz/MTumcHuLrDL5b0ZLGMnICfdstS55NGp/kaBruER/EogZZYJzRDGiB7EUY+F/Cn7yF
         gkrSivX3wffZM/lhdJ47o2r2sSYbWdXyhdLJcEVOKRBL5RT3XOqOPtQbGpVO2VRntK6W
         Xa+oAhVDUnh4UWwN8rRT7qselLSUc0q8aYUHIeDSzAfIOG7Xa9yUcH0yZ/cT3dShJ+W2
         sgOI51PHKMU1alzZWob+wAATEDTQDzUM4BsqB1+GPbSlaD4CXomyGFGlJx1o9wnO3sXF
         vM0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786976020; x=1787580820;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VgQVHsT19L5HSw7LtJPGoHYvBVum+1zO+UvRrJRep48=;
        b=O3+1v3PaLrtomZnn55QlKzoe/FnrkHW1mRK4ZbuoiIodO8BEJp8WGnpbfAsav8x3Ds
         RhvM31WJe6b1a2HlrGPp1QdmDngpMEa58z93+usd0fUrlwaU6AbpfX9iyCyvpnNWe49s
         DhiGaJyOK+lNWT8uA2pkQRSm5ItucLYpjDlVMhHxySWdONb7SoZEN0zqUE9uBQ5fmcmr
         E1ctsLoqw/WuRqKAFUPWR1aYc7Uk5fxdrYPvD/oL5UPx8vA4+YfnDtnrsmuEMgEHfhra
         uYl9yYnMuSQ9TeZo+unl+NUMA2vzlu7vfrDUJoG9Pe4WFroeXrBw+jTYZ5Ppa71aU5C/
         ygUA==
X-Forwarded-Encrypted: i=1; AHgh+RqkgphRWGl82elL01fFNrxcTrstB9gOoOf07hQNbEP30hmR/DblPdSLdq2Plw7b+KKp1Yivl22bKyRs@vger.kernel.org
X-Gm-Message-State: AOJu0YzzMobcUD/Ln9FD1IuWamwvkvLQi+p+e1lCpCbjeXyOcb/fvklv
	EFYZtne3r5P/bMrGamwg0ZaaOen7KOPNRJHf4zw8kwHXBOY8RrZoGFyBIF/4QDLpGu1NmdCs1DQ
	UuQp1ZKZXWv+CuDkGGGEXIynuiV6v2/VQAQeHbyy0veBMw7K5iKwVr2qBcj5b8VuC
X-Gm-Gg: AR+sD10c89J0ssz38Kdo5bexqvwcHweoN82sKz7Cpwddin5P5gxalPSvfnMdX4Hw+4L
	Z4XInZfeoBzoOmyxs9kCNBtsCyzbVMkiCyE+Rh8nFJazTmL9O2jqIjQYxLbYECA5uoDgX4VNtMQ
	8rMgAhvlkhfClI5w6RE3T235V5Nps2/fdPA5cLtkdUOlf/OoJrfkvxkb1zWYTTW4zW+/kaiwy1P
	OaJK2EfyPfFi2xGGkXnoRTF7H2ne5HC22nx3Y2Sb71lUI9b16C/bmx7CvSOFmDdzOlzVoz5kAZi
	m6zbL+kBJ46h0PH/YzzqJmqVT/bj0rpIazuDrSj02CUzwFEhK92bqFnjYZtJmlV3Plju8x0YD/4
	Ytt171oFEUwJwnDlLfDu1PukH
X-Received: by 2002:a05:6102:6a85:b0:739:de1e:6c28 with SMTP id ada2fe7eead31-76f281993fbmr1995155137.0.1786976020677;
        Mon, 17 Aug 2026 07:13:40 -0700 (PDT)
X-Received: by 2002:a05:6102:6a85:b0:739:de1e:6c28 with SMTP id ada2fe7eead31-76f281993fbmr1995147137.0.1786976020212;
        Mon, 17 Aug 2026 07:13:40 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2185b97aacsm34235666b.44.2026.08.17.07.13.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 07:13:39 -0700 (PDT)
Message-ID: <5341e732-0deb-4d00-9a7c-595e317bf1e8@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 16:13:36 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: display: msm: Allow two MDSS power
 domains
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanjie Yang
 <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260720-msm_gdsc2-v1-0-4687866d6cb0@oss.qualcomm.com>
 <20260720-msm_gdsc2-v1-1-4687866d6cb0@oss.qualcomm.com>
 <b36691d3-e996-4fc0-8955-25beeeecc385@oss.qualcomm.com>
 <ccab8aae-d980-423a-b39e-3ce2a7c82542@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ccab8aae-d980-423a-b39e-3ce2a7c82542@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: QW3v4jE63YrHo5Ty_rCGrYcdZ_QU8pvA
X-Proofpoint-ORIG-GUID: QW3v4jE63YrHo5Ty_rCGrYcdZ_QU8pvA
X-Authority-Analysis: v=2.4 cv=dLaWXuZb c=1 sm=1 tr=0 ts=6a831715 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=sndJhVXln6Iqe1BNRX4A:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDEwOSBTYWx0ZWRfX+SVqGUM1CVLD
 ND/Kv6OH1LhOKlIEYe8P8J1L6q3qwdwBnHmdwrEPuO6LLuHdOb9cQx2iFVlZSYyG7C2hx8cRvnq
 WNtihgHrJdNY1adEXAk+0IIymhkcS5ea+h/ox2GE4jgVcnmr04VbasmyU1/JCmp+EI9uDIHmG7Y
 uvrixSM1uMkbfK7CDVAM4cyt53vXbGvs1C3gmerip6FN7bXxIqdvplB29SVbVmjjJqtnL7dVOfN
 7qVWsfubTRBvtMAhvVMK3uIFJ+IxMgs1tgs7B+/gNB8G/aTh3cuD3bACLdTt5b5zVMKzWWHvAEN
 R38ackWXkbj5NzgPnMhmQVzEl3Z+AMI57XePfol5pDIATMjzm5ZfPbS0XCLaqiRb9GADrZ+r7Tz
 4MAkojnd3gp5GxriaYLg9RcqUX0SY8MNKMy8+joK5vUNtfpfEM+R7Di8AVAuyL+RaCZWnA5g0lf
 CyIJGq0umVqe6TjOi0Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDEwOSBTYWx0ZWRfX5L2FYeiBMpZv
 Jyo6tHd8X0GBqcjDwjo6dxP/Kzh+NUN976hHhVeBpT3zlQ0YLaWDRNr9IC0HLWDlTkVYj5URSnE
 zumpQFrzQMUmHAN2KZNhLrHgzQrdMf0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608170109

On 8/13/26 9:44 AM, Yongxing Mou wrote:
> 
> 
> On 7/20/2026 4:49 PM, Konrad Dybcio wrote:
>> On 7/20/26 10:43 AM, Yongxing Mou wrote:
>>> Kaanapali (SM8750) and Glymur use two display power domains.
>>> CORE_GDSC powers the main display hardware while INT2_GDSC
>>> powers a subset of SSPP blocks.
>>
>> Can they operate independently? Does INT2_GDSC need to be
>> powered on after CORE_GDSC?
>>
> On Kaanapali, my understanding is that CORE_GDSC and INT2_GDSC should generally track the same state, except that INT2_GDSC may be powered down when SSPP1 (VIG2/VIG3/DMA5) is unused.

Is the MDSS any useful if *only* INT2_GDSC is enabled? Can the INT2_GDSC
be enabled itself if CORE_GDSC is off?

Konrad
