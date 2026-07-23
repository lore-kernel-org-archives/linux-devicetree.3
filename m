Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2942F479884
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 11:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784807967; cv=none; b=OCy+yhI+lhPcsMmXT1VmApLfUs0F5VWgPlALHrQfQTndOHIFhclwuTUt9AY+lEfAq4c9JEsldUIqdduDoqPotO6BVDMPR5kahNdmz1mzL1aKAovKKoQB+RCojVIdhOLOHyfORUSCebIrFw+MTf4fWxE7JMQuWPAeVbzdqwd43ZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784807967; c=relaxed/simple;
	bh=3gJPSuw6oM9oPQIFwhRhyxCkwDU9gyPzcFA5x00a/R4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QzniQwwMNFGyvzK7nW/HV866ynxhz+QZ2LQLON2cr+0+/lEGSx5RI9m6Hz3wprjh6NxdTSv75XvUYyVP/k2kADG2TIxNhtQX+39q4GFICDEdi58FH95cId/I9wnlcq3AbpLeon7QniP9CqKEV9ICDJzkMil99akIp8A/F9alhT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dVpfVMmm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MwIkYi4D; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dVpfVMmm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MwIkYi4D"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qW5D3044716
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 11:59:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eMMYVZ1IXrKPNAdTTbF5kFfOPzwty3ytq98RGOAUxms=; b=dVpfVMmmYR6dtJgV
	Ke4evHMQsIYsuxiCMaHFCTSErtNpjY64mvdRqiyJcwuSMNyLRLvJbj1LNbJ8pO4t
	fqaJnGeP9Ow6FRI5WqqNiZZKgBbEbb0PmjtPpaw8DnK2KxYWqmwPUY5EoOGS5IKy
	Gzfebe3tNyCtdIAvFVvrUIEwK9Sm6YyXW20eAoRqOUabuDYexniietkmzw9h1YoN
	2d7AB3/MjKGcOwfk4GrVXdPFCI2ql+jUXUp93A2MqzE7svdz0fHMgIlIBgBWo0ex
	aEUkfRuA5ldWdpMYr04ybj42Y57/JdzbtjzQtbA5BB3bvG2e/p0yCxyQCNS35Xwp
	LlLsFQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkeuq8y3v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 11:59:22 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c07313be5so2291221cf.2
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 04:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784807962; x=1785412762; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eMMYVZ1IXrKPNAdTTbF5kFfOPzwty3ytq98RGOAUxms=;
        b=MwIkYi4D6XvAWAdwvI6K3cnoWtrpercMwMYO4b0DU3q3iWKzIwwYE8gsANHVv3/W8F
         qqFzfQbaTKUoiKdUgOflgxkJeFCEexT55Ariv6nw0sGAPRVQg2y/hdeQuWhQMhZ9SYUr
         UzBiRJGTeONf68EyF3qUtdRyx/8om7kue6S0uxiWBrSbUvrwqTMQyQI9SsrJ+KaBiV+5
         UmmdyWtuSz1spvavy9aAKA64gL1Rf+8AxcY9miRUInd4mMSm8K7zNCIh6jmfhJEPoxFI
         iTsGLEmAb6pAuuNWw40UBDLIPXSuu7K/0FTHdlICdxL/hkgfbBr6koYYUm5iSf2w8nm0
         MRog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784807962; x=1785412762;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eMMYVZ1IXrKPNAdTTbF5kFfOPzwty3ytq98RGOAUxms=;
        b=qKiAxevJSz+jShOkvLLg8+hZXy3LpLVUoZk1oajodii31oeBLJ+ReRWRicqgOl0wHU
         w2uzHrV0ySumnGOH2XRq5hQV6Vyvu2YQcxnoLSdpFpDitRDi94NdD4T75yIUYE9wDSPP
         RB2q/Nwi21MvjGcUMe/JGkv2fCSjzoFJUKfwWBMg4kf5iDE0FRCUzUVuMnSgYZHBUvgv
         V/hzXMTp4YwnHBySe8Lr33cDQHz5J2IxsHD0nykTH8U8fufo+yNAXkllH/8RATqyyT1h
         99HVsrj7SGlj6a/w3iJack/KfX7RLOBgZpN4/OcUV9Kz4TbMxiKK6U5LH072qgKAVS+/
         d8gg==
X-Forwarded-Encrypted: i=1; AHgh+RpjcUyGe6FO0nSqvWKKIz4ni0ULfu0yGztJjHCZqcSiSBYqY83y1smPN4or1IxsL0xE/bD3FEFsP4xJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy296EqD6GDiOitt3H/KaYLUYnqBT+5KkR2Mq5FUpkJFIemNos9
	jFZA0iLnfpSRkIf+ttoZWWnbAObmKSv04xih8e/wZAn1i9ETud28+Vbb+C6PMrzHs3RdDrk2UZN
	cQVksPOPz2ESO1zFk9SL71ofRKGtibi/l9z+ZMcbNmeazZP5fmcxuoIEvhKWxbFAz
X-Gm-Gg: AR+sD11hQa/SfXQJ0yZGC1mzY0wvpHiQQhMTY7U4oZ06AJv1CGQzY8rnQ7NZ3Y3cHbH
	Mf4V9BG0qKeBp0v23aVhTDgVBu8nUJfV3VVHyreW3526R1S99YGcBikMgBbFAqFf2yDAoruAdhq
	4dQVkcL1lGuLo2Pi95ScM3s2LXaAGAV5D3bK1/2EAU/m2ojHXJ5fhcjZZbE6utHsTN/7UzZuynO
	gB9ykAVthBb/C1sTbbWrDqj75LW3sa4PU1Dwy3E9EURjuLtHvV1bJPBqj3YukMx0YcHYAG0jU6/
	qTm9XDg4fC2ojP/isx/8e7SSTmY54Rrtmzmj19MwGWi1Q3gwK49vSVYgC1hHiBV/z7TBH+uxj5q
	tqCxZ4pkscTUSC2wi+Ujdw7bX
X-Received: by 2002:a05:622a:1911:b0:51a:8c9c:7de1 with SMTP id d75a77b69052e-52847442628mr1498101cf.11.1784807961537;
        Thu, 23 Jul 2026 04:59:21 -0700 (PDT)
X-Received: by 2002:a05:622a:1911:b0:51a:8c9c:7de1 with SMTP id d75a77b69052e-52847442628mr1497861cf.11.1784807960972;
        Thu, 23 Jul 2026 04:59:20 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32f151fbsm221176266b.56.2026.07.23.04.59.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 04:59:19 -0700 (PDT)
Message-ID: <97950bd5-3eb7-414f-9eeb-1b19427b5ae8@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 13:59:16 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: smd-rpm: add MSM8920 support
To: Aneesh Pradhan <aneeshpradhan2004@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Catherine Frederick <serenity@floorchan.org>,
        Aneesh Pradhan <aneeshpradhan@acm.org>
References: <20260723012415.48288-1-aneeshpradhan@acm.org>
 <20260723012415.48288-3-aneeshpradhan@acm.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260723012415.48288-3-aneeshpradhan@acm.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDExOCBTYWx0ZWRfX/+vJclJUtAm4
 J7MxXwtgImW0sD6WjSIpPTHfme+5uh0Z9bjxMgzl9bx/+gDD6kEREvR0Xt1hzV3YjhgywCu5WZk
 +gMis9uPLVDIyf48cAMlr8P7eVeXZDM=
X-Proofpoint-ORIG-GUID: IJzW9P4vqYcO0L3FIKn2TmDu05KwWENa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDExOCBTYWx0ZWRfXzbsZCXzAfdTH
 puF6JzKZx+f1zJcU6ypCcePRxaM9ibbAdhQHZB4sN3/L8sGrjyNd8Y54FMZNf9protu9U/IEjPJ
 FR0U9KguUF01TaHz92cy1XQrL1fFMcXR/KXle3GXe3L7gVgVLzWf/2v5OOaBuY3N1vEO77Tlw1H
 PA2QVszvYoylGGuxwfaYO1ustpW5+HoGvRad0PvsPmY3556dmIUiN0NvagMxEW/LwFQxSrSJRBP
 Q1v89RpC6sJsa5Ad5e4nJRGGkd3chZXuU55ObKnRERViR+RD7cE+I4dqGtnP9r9FZBc8ZaCbq6X
 RuxwoEsXkoHdr6oykzrhwCM+nnDJr+SkyTA6zKoGbk9fJ5mbWQWpPNDdpDwfNoTS4r127qooBhh
 Eq2m3j2OfCkkT+dJaG1j24dIHemkGFCiWMYZUxC+5b8uvQv5/epUBqZUh0YvonPvD1uj9WXEzZQ
 2UFA0/6fM6u0ta/BR7Q==
X-Authority-Analysis: v=2.4 cv=cPDQdFeN c=1 sm=1 tr=0 ts=6a62021a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=DhTvykhhAAAA:8 a=N54-gffFAAAA:8 a=EUspDBNiAAAA:8 a=SV-ve9HlrmyFCwFSF2kA:9
 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10 a=dawVfQjAaf238kedN5IG:22
 a=bLiRU7DCRrRo9wiowOr6:22
X-Proofpoint-GUID: IJzW9P4vqYcO0L3FIKn2TmDu05KwWENa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230118

On 7/23/26 3:24 AM, Aneesh Pradhan wrote:
> From: "Catherine Frederick (coolguy)" <serenity@floorchan.org>
> 
> MSM8920 is essentially MSM8917 with MSM8953's modem stack, which adds an
> IPA (IP Accelerator) block. Add an msm8920 RPM clock table mirroring
> msm8917's plus the IPA and IPA_A clocks, and register the
> "qcom,rpmcc-msm8920" compatible.
> 
> Split out from the combined MSM8920 change so the shared clk-smd-rpm
> driver can be reviewed and land via linux-arm-msm independently of the
> device tree, as requested in review.
> 
> Signed-off-by: Catherine Frederick (coolguy) <serenity@floorchan.org>
> [aneesh: split rpmcc out of the SoC dtsi commit for upstream-first review]
> Signed-off-by: Aneesh Pradhan <aneeshpradhan@acm.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
