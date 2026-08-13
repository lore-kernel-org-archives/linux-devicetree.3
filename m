Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9453C3630A0
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 08:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786608410; cv=none; b=ROArulHjMBK/RWqavMkMi1K7Uy6pVQ6sQ+WBH3cHwM22EJ5Pt3C/KUhOJz1txipcYT9/KT0iZETHXgz8u4IgXx3oZA96eRBsTaG/iA2347rZRUpJBvHuzinhfdstWr+tPOXqh0f8oH8UxlcdJgILLN5osuAx6Z0XsxG76DBW0HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786608410; c=relaxed/simple;
	bh=VlINqXCi/iiMXTXeTXyhms1lsO/523VBgaa+rvuTPfc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LmjuSpPFTYJLsaGFoh+e3TAMx1QwWUk6T4CGtrrK0tlcCXNRRgV2jrzfmPbg9ZFYOBdfGrIkRrTCR+/zwcYkJ3w2mIdkaEQo4zBaF7V7s4hsUfy3fckItPqbo9Ru15o91P6A/frjUKdAE7/IJ6dtDAtee2WXxhBszv63vB3ffQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kSSsfnwN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fp9L/fTL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kSSsfnwN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fp9L/fTL"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67D5g5jE1530147
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 08:06:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UgCNASx8qOprTigY2vUWSc5n1J6xUE08JXG/QdWQCDs=; b=kSSsfnwNnkLn6RyS
	s9jhIm/Srmn6Lx10b17hYnBaGxLWif7LxqwYr58x9AbPnkGdvbaHXJRpkBAeC7/2
	oVe52FjGcxgBZI3GcAbmcdQ78mIkmSLDNIxoXXw4VuphhlNKWpDsT7E92R3BPemL
	Xn6IGGTSlZVYVNurSenT41WfcBlL7ZbQ/9mz5BsemmH8EYfSpKRcejuIGc07k7AV
	ACB4L8BMwzVkE7l+4bgZfGoTwkahYf7nJthMDkQ4efkH0Nn4fYjstbrOKipAMCHy
	K0LpmWY2/uo94+VuI+FmCY/Vz+aup0o8iqTm319HMKq10RCzLinWrCGkk9Jj4Hnt
	pPSJDg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g143hsctv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 08:06:46 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e8004d60eso349345185a.1
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 01:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786608406; x=1787213206; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UgCNASx8qOprTigY2vUWSc5n1J6xUE08JXG/QdWQCDs=;
        b=Fp9L/fTLUQXJFJOb7CLdhFd+VXDd2NHr1OMnGZQ0edZK9vztqBXjOvfw4JTS+G0XAi
         2Bm3sbumcstiqdVoeYDvPD3ieNC1xDciFOHpp/ta9+RN0zTYBRvjQZQ/ELZ+WbIWiYyZ
         Ir9xoA84OQ6KhepF52FuPg+OM8Sxr9qGUDmoTXnGvSx8A+H+kGJmT7zodqVpyto02G64
         2Vlv7n52q4XbaFWxzne0lByJWv96jl3mRWzERpahAGz5fk5BXolLVOwJyLUA/kla1Iam
         zoNkbPwNxlViwl+7zxPUi8vRdqy9h83j6lyzSX8dKOFiSQqqYK7FtABcHPxDRUFKpSGW
         bQ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786608406; x=1787213206;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UgCNASx8qOprTigY2vUWSc5n1J6xUE08JXG/QdWQCDs=;
        b=Zt+PgexQ7RqLLfIH2gsbWMpdts2DdpqUB4rgWyOqGXGmKaftQ7hQduvwpHGRh9Rjgd
         L4+cxr47NGMeh8/BhA05AnkutiZ+TmliAIKXC+UPMHVkV7tINXncpzJ8rqCiw118mkd1
         8xkDso9Cr0z1clPndThuYW6FgxM4rNqXMFy6/sAn6H4BYVzO7hKaO+0ZZh4/tZdTF7Bj
         w4ozlTecGJA4IsogYHrCAqVHTrbLPdlIcEiOXfFLn36pcsWWKAbfS3aOnu5xTVtGeKS4
         H/twKYPfNm3jYC4uIiUPXZrwZopcAkqsv+Nv4QJSiK7QgJRYfGBCgEJ/yQ0p3NflKZ48
         +ZOQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrq1dRgJA9MF67bPZysmQBK41LomfBcnnsbGAXcXK7bJ+Kz3rBHFWIp6GdeTMC127Tnx9aX7tlC9MQ3@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/CDZhACnqfa2qHiXpTY/DDzI3ZAutdl8ZdNxhk5WNQfzeO5gS
	Yz1Vqg8B6cKNCrr6ek+Oo3wcqO2X+zVSViGZPiYU2u9i6VBq1+7QkCdZY/x+NR0FVLJ23M4zlmp
	pcT7VlY8q/iN4+/R2MpjBpJz9dtd4GFFZ1ElFQshMRekTP4d8r2yF1vQj34qrBPKl
X-Gm-Gg: AR+sD13kEkxAYpuqCNoDa0V/BU0kfCKSZohZQS2FyqH2e2nv0iKpW74Gh2dsIQAKO7m
	Qyoqy5WoSYS8PYUAvltSBUioruO79pnUcUWdGhY/n1Ac7IYcZ3j8Iu/Eh2EidcmlJqlQmaVvdGV
	4jOlBF4BMY2+i4EupkupeYm30tW6FZm53fnsqObZ3QeKrwMIQYPX+eDSOHfX3RfJE60E8+YTWkZ
	FGL/VxMeOGTXek1oVP+eMaFyBJVZtkOrqfaRRvR4TbyS2NaujFOyMTYLi7TKjX9UUldNlzCmFen
	E5iKFMB+Wbd2bHlzL46XBhghzStGzS8yYCay5MQhFJ6LB2eHWOJB6QrXMfeZxt3mOrVmAJJvkZJ
	l5hRfvZPnGrbDP1mWVSvjdUppFHcErNHD3jzbOUG45QeddIU5C4gcqfSQDH9/pMTk
X-Received: by 2002:a05:620a:4721:b0:936:583a:dd75 with SMTP id af79cd13be357-936bf8eca91mr390518685a.17.1786608405859;
        Thu, 13 Aug 2026 01:06:45 -0700 (PDT)
X-Received: by 2002:a05:620a:4721:b0:936:583a:dd75 with SMTP id af79cd13be357-936bf8eca91mr390514085a.17.1786608405459;
        Thu, 13 Aug 2026 01:06:45 -0700 (PDT)
Received: from [10.111.164.29] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-936c19988a4sm96648685a.18.2026.08.13.01.06.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 01:06:45 -0700 (PDT)
Message-ID: <edf70a43-feea-4688-ba29-1c00748a55b8@oss.qualcomm.com>
Date: Thu, 13 Aug 2026 16:06:36 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: display: msm: Allow two MDSS power
 domains
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
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
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260720-msm_gdsc2-v1-0-4687866d6cb0@oss.qualcomm.com>
 <20260720-msm_gdsc2-v1-1-4687866d6cb0@oss.qualcomm.com>
 <5jozediov63riomokjzcphmpkpfqdgl73j4hd27vx6yttyddar@7bvbitl5ag2s>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <5jozediov63riomokjzcphmpkpfqdgl73j4hd27vx6yttyddar@7bvbitl5ag2s>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=R5oz39RX c=1 sm=1 tr=0 ts=6a7d7b16 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=R0RQ14XjvGgjv4nrYs8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDA1NSBTYWx0ZWRfXxZmG2GDG41R1
 6uBkRZuHsJ1SXqT+e+1wGno1F9V1iccJkExPUsZn6IumnS6TkeI9cPCdFV2i2W+Q8xwJIH2JCqP
 FKEMfpiUWa3C3wzxgRWZWW8FrxYYAELXve7hHKbHo8dU5l+UhH7RHGT3bSuCAX9Jzw+vr6arOkz
 oRAE/6TPPzqHVnLQY2UtgAZgbZBgQOScUfZf3cjFP+Rjl4CYTbshuSrUlMPWU4y8m/ySeDFywOv
 mAsIKRlDz/5CXGe8gz9uDEs1qrKaSr7AfuMrlkJDFTcQqLoSL42nw2GxQ3wFX9nnlzjmntI8qz0
 YoezVJXSSGgtXCzUCxFo/jajDFsLP3rzGTNDBULz6UCgxJ2EQD7+Ho/xB4yJ5VOB+Bdqf5flLrI
 Mj9EhlBZYrUMNbnFePTuTwoJSknooD7bRMPbhqsbNTim0xR0o4+IGGlfcsKlv71ra5D8Xl3Mw/S
 RSfBdV62mfcrA50Wo7Q==
X-Proofpoint-GUID: zGojVvxsjXNkhXeinEC4WOcYSXLRLjJB
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDA1NSBTYWx0ZWRfX1MJVKlKDAb4y
 ytzojTtakr+UG8ZQu4dISNUJvUizpXCkI7qbrFzSp5R5xSrGYaz1eEMd9EzC/X+WeswAySamfqW
 zh3iMitY1pDp5jNVeAlH2PryK9eoPhM=
X-Proofpoint-ORIG-GUID: zGojVvxsjXNkhXeinEC4WOcYSXLRLjJB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608130055



On 7/22/2026 2:20 AM, Dmitry Baryshkov wrote:
> On Mon, Jul 20, 2026 at 04:43:53PM +0800, Yongxing Mou wrote:
>> Kaanapali (SM8750) and Glymur use two display power domains.
>> CORE_GDSC powers the main display hardware while INT2_GDSC
>> powers a subset of SSPP blocks.
>>
>> Allow the MDSS bindings to describe both power domains and
>> their corresponding power-domain-names values.
> 
> Another question... If INT2_GDSC only powers up a subset of SSPPs, why
> is it being declared as powering up the full MDSS? Can we move it to the
> DPU device instead?
> 
Hmm, yes, it only use for VIG2/VIG3/DMA5 here. we can move it to DPU. 
Since listing more than one power-domain disables auto-attach, a small 
driver change is needed to attach both domains explicitly — MMCX with 
PD_FLAG_REQUIRED_OPP to keep performance-state voting working, INT2_GDSC 
as a plain runtime-PM supplier.
>>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/display/msm/mdss-common.yaml        |  3 ++-
>>   .../devicetree/bindings/display/msm/qcom,glymur-mdss.yaml   | 13 ++++++++++++-
>>   .../bindings/display/msm/qcom,kaanapali-mdss.yaml           | 13 ++++++++++++-
>>   3 files changed, 26 insertions(+), 3 deletions(-)
>>
> 

