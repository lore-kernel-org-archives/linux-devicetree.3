Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA1A3E3164
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 10:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774348761; cv=none; b=KhYMb9JLzp49E9Q+GfuLvnjLMkN63JiiXnLvqWY5h38aoRa4dFzQzTqBN8HlrEd+mqt4D9/OEOQcp1pgFhygo1O/DIukdHQpcCGrquUhXXPtqcBQ33E/YiyI7BNvk+1eVnzZ1AIiNnqh3tuQHcJaFYxEBE9f5MiYj55LVgNJtro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774348761; c=relaxed/simple;
	bh=aixy/4nOGtVTADyTkPYzo4GgfdqV1G72q2wVa/sm6ZQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f9yLS5ey8T1QO73j7rjptixksg+38nW+APxeLYosDFyG7mF1knXeBNF2f2VzboFleoLmwvPNE5sd2L4K6pjIfGgyED8lMRH/miZkY1WFM8YbttCRoxLJS4taHPcpqDUxYLSvgNbSXZawC/sT7WMLhn8oZG6BOi8FnCcqw2IoOqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ncx6ADOr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XLpkGrBL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ncx6ADOr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XLpkGrBL"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OAZM653170672
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 10:39:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Uj5qYX8FhfQc2+1CHGK1yl39nh7ddqgU8t5AUa3/6Rc=; b=ncx6ADOr+KwUM7yI
	769Cw/e6gqp0AtD4FjBfrfcy+ogQg3dmuA+2FfDTeL2P1L5F5W5jzU2WP+nxHeTS
	GxzENAL/7mtjsP7lUfry9BGJ7qERXd9o2+1EsB4yPDTwoMjwE+CxHMcHbdbwv09S
	2LpHS91tNZiXYVY/ZtG3vipFit7aH+aOXb4eAUxeRPlORcoHS5nhTsKCtY2nTnae
	Ask54iUCBYGs3Z5Mkcnrj8j7oNlcrWmtqb5iwjDFy2AQlHgcoCYcdPiGlcYwcW/+
	4s3R+Wf9jQFeIWOP0PlijQtSz/MZUdUokCIsE0W2EptAZIzcjkuIUdZFY53e3uUf
	njloWA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d35r249e0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 10:39:17 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b04293b16cso193257685ad.3
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 03:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774348757; x=1774953557; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Uj5qYX8FhfQc2+1CHGK1yl39nh7ddqgU8t5AUa3/6Rc=;
        b=XLpkGrBLfN52GP0hjTk/mMOAZEF+996DGKKu9ormubxK/fClLPoRvhguymZVvJfItc
         zFmSwRQyoAioglPjvImS69ERvwx7ei/4VeP7hcgxoxv6U5IaDDKSm48/8CphrsrPjSdP
         UUKwIDRmfEOrbE9ijfEv7mMAdogWw7lpu6cuMZ8zs+d2pLWi9yYLHohu6I1PvlEDJr9/
         1MSR0R5WXRO3YtKkcwwTrdFGES+sdgjG7IwG8SXaUXBetKbW6Czoqr5hkpJEL1lvYekb
         oOypvYwqQmAf5BnUZEUS0OBEJanrvhOfGMCiPTaRG6WPi2cPRH1GBwZBRs2+EJlHvKJz
         jNCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774348757; x=1774953557;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uj5qYX8FhfQc2+1CHGK1yl39nh7ddqgU8t5AUa3/6Rc=;
        b=a7iJY1jZygxJI2OCZp3YcJIikjfpoFMWbXpPEUmMKMfv+CbHjfMLV9syfCskQvjm+r
         ttOx5+vADZQbyKYHzXhynkhhRhsBjo8tlEn/wzTjz8VcHYy2fF7CNH6496d/NsiR0vCe
         Z4q/ZVDICsFjEI68K+runWoRRxVkU99ZrOjPcPr6A8PifNVxq+NJJL+H4VgsjOV8zeJu
         nOzrXZ/gZo32/FJOIVvcx0agf7onkC3sOxy2syuUNBVKOiZseR/cXHUlnPeWJfgpiLpe
         3jcYep29cWUafh6+lV7xKfv8LkvvqaEfToiXmTAaOj/L1/ijTH3jHKbl2FxirCuHuRyB
         OUYA==
X-Forwarded-Encrypted: i=1; AJvYcCUeg9oRr0O4awusaAzIDR/UMw/5sdwTtt/+HMacrmY51Jm4S8CvuVXrwXhtvjKjfEBbppAzokMtWsg4@vger.kernel.org
X-Gm-Message-State: AOJu0Yx436uuQG04eOk1JRbfaudN5NKU1WIvOW/gDknzkAbmYOf+nBTm
	ru2Lv3NepxQJJj9pE20p6PfdO1ekYlShBmi7Cn14wpfXRT+0nQDEV1yq6YRlzQFwGxokxvOXCNi
	z2tle8XUcGsBNJvJpPGkY5wEvgdUAJfd73WM0FxhhHjIYXin5C27z//eSkNV31Ii/
X-Gm-Gg: ATEYQzxPRuICu9ENMUXY6CyXvMuFK0LzXjaPYM92IYYeaY8iYY7YpqlrPLSoivW2uJ6
	drub7Rw56J8oTP8GPUtpQsNXoYXT+u676lrMZV73+1GdXqV9vSHEJwmzQazUWq2od//VKk5cNgg
	AcSSdo9DkHdSFnPmnxqKGz2VCtdbMWIPb0xehGdBdvY2fhR0tHJm6cuI8w9Mbp+hSG+COMVIXYN
	YOKxgs0u7VhQSqozga5r4A5YuCyR1TjmK7ccpbSsDWw+eiCYsLClg+LbNEiV9FrULBWtCOG9R66
	ruOmghUUglGFdYoZWUjcZsdgGxh3eFTias6WP4Q9N3p0PZpg3dZFZl8tjWx4oNi6/H3NTGW4db+
	2rbdjdhToFCJbkA+RB+/dRJHDH85UzD3r4MCP4nFdkRDO12V7VUjI
X-Received: by 2002:a17:903:41ce:b0:2ae:508e:5019 with SMTP id d9443c01a7336-2b08271fb32mr146163445ad.20.1774348756694;
        Tue, 24 Mar 2026 03:39:16 -0700 (PDT)
X-Received: by 2002:a17:903:41ce:b0:2ae:508e:5019 with SMTP id d9443c01a7336-2b08271fb32mr146163185ad.20.1774348756210;
        Tue, 24 Mar 2026 03:39:16 -0700 (PDT)
Received: from [10.218.44.178] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083527f90sm137972405ad.19.2026.03.24.03.39.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 03:39:15 -0700 (PDT)
Message-ID: <00a59d9b-cda7-406d-a53f-33ccf1ee4817@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 16:09:06 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/11] arm64: dts: qcom: sm8550: Add power-domain and
 iface clk for ice node
To: Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org,
        Eric Biggers <ebiggers@google.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        David Wronek <davidwronek@gmail.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Alexander Koskovich <akoskovich@pm.me>
Cc: Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260323-qcom_ice_power_and_clk_vote-v4-0-e36044bbdfe9@oss.qualcomm.com>
 <20260323-qcom_ice_power_and_clk_vote-v4-9-e36044bbdfe9@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260323-qcom_ice_power_and_clk_vote-v4-9-e36044bbdfe9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VvUuwu2n c=1 sm=1 tr=0 ts=69c269d5 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=RcdfdvLsBkETvr5PKcUA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: sU_GXdbD2e4WUTCCYnjk-jZ5bVLkvizK
X-Proofpoint-ORIG-GUID: sU_GXdbD2e4WUTCCYnjk-jZ5bVLkvizK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA4NCBTYWx0ZWRfXxPtrful63yL3
 1QYKbYwmha+lGO6ICwu5cs9z2zXYIVfyKJBwyz4CCQn0IRWeGGBYEg7+AmA0PMw8zKI9ws1xRb4
 sV5mktAGRYmrfKq4R0g3EexTCww9MC4YYpzbwPOaLnytqvv+APaNc/y9DUkM/POYW+TsLFNNSwn
 nReQE1T7K85g6D7l7/F91KWGknCYPIW2hvNBEp1F/THlw8/3Ig4aL7B5gbjlXWiRhxtBzz/KZ6u
 claq5aCZ9UAueQLV1DWfy5V+O552PtJNsFqs02gHdd2i1561PLfLmghdsIIxmnPY2jwEhroXonJ
 exg3dWz6EPGOxj1ZMW83viyi8u3xBAwBheMU/HLZLrXKlzeZ+l/kJzkGi0GAzsOWLXo6//KOEVw
 IIPuB2wfAr+YUOfAFHgTdt1pdhhlj3vH+6efw6ExRhA0uilRO92aGES93PTMJKcXRSVBiBFuxcS
 xA7C3hlUe5hBqp18tGw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240084



On 3/23/2026 2:48 PM, Harshal Dev wrote:
> Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
> for its own resources. Before accessing ICE hardware during probe, to
> avoid potential unclocked register access issues (when clk_ignore_unused
> is not passed on the kernel command line), in addition to the 'core' clock
> the 'iface' clock should also be turned on by the driver. This can only be
> done if the UFS_PHY_GDSC power domain is enabled. Specify both the
> UFS_PHY_GDSC power domain and the 'iface' clock in the ICE node for sm8550.
> 
> Fixes: b8630c48b43fc ("arm64: dts: qcom: sm8550: Add the Inline Crypto Engine node")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>

Reviewed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

-- 
Regards
Kuldeep

