Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7365523C39A
	for <devicetree@vger.kernel.org>; Sat,  4 Apr 2026 19:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775332175; cv=none; b=Hi/93DoIqvrFl/P2dJYM0UatLixBkRmfvuzJr98VHMXItaoODHxnWCuHKAYKaFjP21X0vPi3UKTaZXoqbigNmbzXpeYhDChfdclpY6s+sQ7I/9PmiOZEb76sJ4VZRsPGz26yzQCNQBJcbQhy50h0yUTZlO35XT+jsJaCWvAgSAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775332175; c=relaxed/simple;
	bh=IAwlrnp+0DMg9LOro2kueInXnwTewW+7Q6mGsw8BvTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z9yiObXguv4/z1U5fQ6Vb3dM0iYhyDuR5wWOuNkm1oMLemrQnbzY8xzcBE4PwUsdhkyw38CvFIUQYYIebDmgopy02iFjtwC8YyjQ4EutfKfePWxP2d+lYPZjr4M4FAkwVu+0q+L9aH2qZr8HZ0b/0ZcD5L+ZYvVcFCvuIxG3+Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bX/QQLy8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VBXstwSf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bX/QQLy8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VBXstwSf"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 634JFP5N3591888
	for <devicetree@vger.kernel.org>; Sat, 4 Apr 2026 19:49:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7T09d5XZe4Y1nUegx+MQrM0N
	rFbjMQW+OLp9Je1rAuQ=; b=bX/QQLy8orh9s7b5MgtZwPBJ0219VFM87PNf474C
	EsuiVWEyKzboYxYNli/OLISeXvPErLbpGMejZOng0xElq+dwLwkMV7Q7T5djRVrA
	31AAPlpWhMZQHlNQByPo9NBVFTc3BxXajE6GH64wXe3vsagLbubVn8PADnC/yXus
	BR0OsaiGsD+lGbevCgzY76Be5AVUUe72eQQ/k9GkIUKVHhOgFuYzewSABpMr/HEP
	B+3IrBI5APO3+c4YO5LEqQT5WZ+76cDHb/9mJMUtSSd9Se+WM7vbAA87EuI3q8nG
	qE3MyVQROto9tYMeH1ldw/hBWfUIr3UvJMA2IBlsMr1U2g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dar0mhkqp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 04 Apr 2026 19:49:32 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5091327215dso149424571cf.1
        for <devicetree@vger.kernel.org>; Sat, 04 Apr 2026 12:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775332172; x=1775936972; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7T09d5XZe4Y1nUegx+MQrM0NrFbjMQW+OLp9Je1rAuQ=;
        b=VBXstwSfqnrlG9KFFo9Xm5AztH7tE/R9RksWV8xR5jajsuksIlqxzdH85w5d/lOQu8
         f5/jaa5G/yId2vE6Xk5EgDEPL1owb8OfmtLcTrEp5Qzhtd190qWnWH83E7oF4aSClruJ
         dS36ORE/rqHL4NduE4ov54Ry2qepQBPmsC9GD7DV3Ap9dieIQW3Bs7WONYMsBQmjhes1
         +1K/sIeK4ZVMVcwg3Hjr3q6ywanCHculQogaNhUW33MahuWuDhQv2aimdBgHlGI3cvYW
         YpeEUhNqvJDnoqNxe8mjWoNZQFemtayAY/NUhJSeLv8WTA+cwyhnOX8UgfzmBUS73K+n
         Fsjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775332172; x=1775936972;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7T09d5XZe4Y1nUegx+MQrM0NrFbjMQW+OLp9Je1rAuQ=;
        b=qEDXE9vQ2ZtBd57rUO12H/3UlfD73FT4FJuP2qs0BMnbbMHA4Eizea1N4hQKX24Vif
         viFJZpJ7txY9LyAMIFiGP/DHNQibUVW2ctzYloU08ul7ZayvJg//epNbALKKtLMSudqv
         Mnm6W4txB4AKkqm8ZHdWnu2y9XKxFDpqimPSRgbkW5UDlCF0s0M7EGet6gI7/xYpThnL
         0FJ/qcZs95ByCBpan7VRfaIOmEyHi2vuFSgl16+Wbl2TfphxnMIutY5k9OcvL1wkdJ5T
         X6hDp1B6tPlZ8GGGWxEjMzyXRhkuB4FNXb6+c9Cj0FBoQx/hXUIOtqcS2taMXesYNXxc
         ejNw==
X-Forwarded-Encrypted: i=1; AJvYcCW2Dq0d33v/FbYv7G8PWlVhQOIU6j7LMfx3PNUItOn/Ho3Sck9kZNkJ6g5rJjOdzvbcNwnMf504sqIP@vger.kernel.org
X-Gm-Message-State: AOJu0Yx04YoWTg6QL2o/uHsJuRVBvIecIau14EtOsqCaIPLy4WDy62rv
	3OF6P/UWvtyAqDj9CA4RhfkFDqf1aedAmZjSK5gdKhsGqhld6bi6RY4Ij39QbqPGkQpbQeuPm/H
	D1X4ueqYGJXlP6xzHywE8foRrljsBLT04A/mSgr5Ki4SkbNGIXNnH7xKKDPCDFiNm
X-Gm-Gg: AeBDietZhgPATLF/6oiVxnLbuYLxoGV9rtcI2qfQX5hNqM7tjvsfEM9K3X8I7LL7vhb
	fC0eJrGxolh/bLWYoYbs771mh2SxAcqw8K1pSU4jiVQteEAntMs9k1sHdTd5A+5hzGuoEcx4sa3
	KLFTw1W8TFhyXnCsTeO+5xoRyu223EerAJnH00k7Uh2aIGq+M2++kMQsslD0cuOb0Za9HsX7pg5
	PqhgSMA6G7VrPlHRZ70PVZCMuxWM+wUBqRG8TSbD/51U+yYQ7HkjhbS2yR+a22fNuH5yi+/YANR
	EGg76CtyPdkd/wJ9X7gWhFsNABIEE2LthNfjd01U0ux4FJfgHa70ovYRhSzqzIjYJMElOWxLurG
	8QFSfRVKiZqdVC8k0xMdv5hq7rlwpyzbBN9MPAeHy75Gv8v/RKtkVxk75H9kUuIUkf4cWtWBKn8
	jp9BbHpuRPAv49GbT98xXlHIEsIAAHGNgchls=
X-Received: by 2002:a05:622a:288:b0:50d:71fe:85aa with SMTP id d75a77b69052e-50d71fe8a92mr75779921cf.16.1775332171828;
        Sat, 04 Apr 2026 12:49:31 -0700 (PDT)
X-Received: by 2002:a05:622a:288:b0:50d:71fe:85aa with SMTP id d75a77b69052e-50d71fe8a92mr75779541cf.16.1775332171332;
        Sat, 04 Apr 2026 12:49:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c97cd008sm1972571e87.27.2026.04.04.12.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 12:49:30 -0700 (PDT)
Date: Sat, 4 Apr 2026 22:49:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: Re: [PATCH 3/5] arm64: dts: qcom: glymur: Fix USB simple_bus_reg
 warnings
Message-ID: <gqisopxxvaqkkxsh4r3pwi2p2gzlmxrlcds6l3lsmnweeom2kz@iibps66i6e3q>
References: <20260404-dts-qcom-w-1-fixes-v1-0-b8a9e6806e0a@oss.qualcomm.com>
 <20260404-dts-qcom-w-1-fixes-v1-3-b8a9e6806e0a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260404-dts-qcom-w-1-fixes-v1-3-b8a9e6806e0a@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: jMqNSweg4OMwFOlsJlHNndJJ5WfkOkei
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDE4OCBTYWx0ZWRfX+46drvJhWrLx
 gOjcYybOihwetw2ZbZxI7YQoyQo9pN1ytdfY+tE9xYHkHwQ6f5XcywkeUWSDN3RZDP/4VHRguaD
 39WesOsfkiumSTRtYbx9y1X1jh4/gr/EbgiGNPOKg4mWh9JxSJ7HCEb7yUYbnBuxpJijkrhvmGS
 +qWEtvxeDG9lDk2Wp8HjpkNhdinnJTPUjVThuBZe5rr+i3n8yASelSPKcSPqAGXyeMyq9992Etj
 hOR1ywIo/QDZ6VBqTHgPYpvlO4NNTGsNWgC5C51HM0LiCyD/4WXggjaWIHaOoRzImquvDPVIXfp
 Ij0aPRGEsVxzRho6TyzePQcLXGNq2adYJo/XeWKo91ytD+Db5/bVOiMWJl7a3e9d7/NLrZdmsjP
 mzAGFn6F2KV3cNBtmmh5XQvfGA99N/dYd3xz99ISLbxV/WqEVYgvDrT3wgf3MNp/nO1UmPQwzit
 5fj0xpAR6pK/KOfSplA==
X-Authority-Analysis: v=2.4 cv=PpaergM3 c=1 sm=1 tr=0 ts=69d16b4c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=ZI9eA8xiAYmwxBboHLoA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: jMqNSweg4OMwFOlsJlHNndJJ5WfkOkei
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-04_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604040188

On Sat, Apr 04, 2026 at 11:51:02AM +0200, Krzysztof Kozlowski wrote:
> Correct the unit address of USB nodes in Qualcomm IPQ5424 SoC DTSI to
> fix W=1 DTC warnings:
> 
>   ipq5424.dtsi:642.22-693.5: Warning (simple_bus_reg): /soc@0/usb2@1e00000: simple-bus unit address format error, expected "1ef8800"
>   ipq5424.dtsi:733.22-786.5: Warning (simple_bus_reg): /soc@0/usb3@8a00000: simple-bus unit address format error, expected "8af8800"
> 
> Fixes: 113d52bdc820 ("arm64: dts: qcom: ipq5424: Add USB controller and phy nodes")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5424.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
