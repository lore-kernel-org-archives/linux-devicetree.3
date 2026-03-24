Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCBD438C426
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 10:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774348443; cv=none; b=Y8a6oBGAM5WdEJ1DQL9xFByqGlpHbLw9xAaErZQm7Z5NYnLz8WSGvuY/4A/ATkY0kqezjaUQIJwrXOFnkNXVp7MLk9xPXQj73Ougnqcav5PR6EoKY/6rRamjmm+N9s8fvaCwsZe4KJiR+mVUjbnfvzxGEY3uDO5LbYIwaoAkaHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774348443; c=relaxed/simple;
	bh=0XW7qq/cYCeR9OCvHLhwCJaTaNC5jevWMmJPP9v5ty8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OGY1DlpCN319Y/SRDRSc+9jFBAx07XTX+aUpyOPQ+ZWAWlxdGhdjth8S1i5JTqzmry2YSXnoNfi4vbW2Q3CMinn8TDvNDFftiBHzL+a+vXzI20ZCXXLtFZJbhf7cZruUlGZScTmRI7e5o8g1ftjuDxmYy6+vhTrrHsTAOj+KLE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pe6ghYhQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AR0v01Va; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pe6ghYhQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AR0v01Va"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O9Z22O3634272
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 10:34:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GUHL7c2p6O7qQg+zZiT8+TPwPHsQTYr0YGPYhMhdOb0=; b=Pe6ghYhQNzOwwkOS
	8Gps9Fz/tTbU8hgNy77E931fsS+tBNOCA3Acu/yKP7wELYlCVBJ4PsRei9fqQpMV
	t73oEnnZInzoySAhis0ZsPyYjp1NUC6GCPVLam6MDg4WjvQ36F7AD6FjQ0Vn5UE5
	Klzung+YGfqF7gmuU/XE4wXiBiViM1UbHRTBVPN1QmhqMkByd+IQ9e5j3/gNnMEw
	jqZH2MKTn1w6XGNq99VW2skJGYy0Qlj3BEAAEr0xmCYLqQWnpklS1UA4ZCvaOriN
	mG6P8XivfGTXAaDfmcgtuOuqNPGBX/JTSZQ/gdQGZqklZUozBlJhMd3KYnlzMb7G
	m+TEwQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d34k4mkyb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 10:34:00 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c74262a2988so15958189a12.1
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 03:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774348440; x=1774953240; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GUHL7c2p6O7qQg+zZiT8+TPwPHsQTYr0YGPYhMhdOb0=;
        b=AR0v01VaAegcbc/+SG/xqOjkAZMKc6lgUwoM0sVlP9GZBXO6uLR7jnUvRsEEGWBNqf
         iE0Vsbj+fFzSSvGRti8bkTwXuM52Ry1sx30aEODGLliNriaaEw/RLd5Kz1GSGAlfGhBs
         XgswrYZLBg5sXFgK7VbCZw13D1J1V8ij8brM2xP/Elyk8nqM+nSnZ3FedC0uNx7toqs+
         ul9H/IqoXXS4uKMrtHbTC2nCHNSF7DOSGbGD//ifkZIxyeEIbvlIKMAV0XiG/QWLcbBI
         sNj+Lk6rcJT+/BemPvJiPytVP8Cotjt/2AamaBjEu7OTdKUP0OE9yPJQTwJAUyp1oLeU
         aCwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774348440; x=1774953240;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GUHL7c2p6O7qQg+zZiT8+TPwPHsQTYr0YGPYhMhdOb0=;
        b=pixEtSbNyN05JJdqT5DgbjYp9RqHBFm1Nmme5uPwOKzbad49C9/20xppMtmxuKjq4s
         b/wg5QDzDdslntlTMXXFfskgx77KLw/29iEbVWKWVRjP29Z/YE68zBmzKNzZoM3U0wzh
         Ul3nDs5dZWRpVvEK9+jLA5Z3o+TyxpEtnGM6G9l3nr7M8rjFL7ZWsE0No1XMGWVPKmEL
         2fAou8vNAGrLLaTTsbff1vJwPq/bPsHVEXw/RCF0uSJz90YUR6zqsfKFbUbOKSSu2XV8
         6qHD1LabloSip4n7+bTvi6e9JWWgEyYyjGeeY0JwzkPCH1c5kKOOhAujJ40F1W8kPmlS
         +9mQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXxLqtVcfTfgE4OrMQlnHtHbvVqYNuGMaVJMl43O3iNKWQo5g4BQnmNrAxLnqXxnZsfLifJWgQ6tMv@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6+KoBoFCIDiXPK+yr+MPdOspmAVP13+8vFtX23pqUzLIONLkR
	6kEOzGUpQewqzF6AjgIpnI7SpXUAtjHyBvJ6pB7Xls04ZrdhnhbcV3Y53PrEaUk7aobKUSAJhZA
	nIjP0BUAKsnPYce1BoFcvryi9QEvKR4F9MhShx4p+wmvrVqk0sWgswJjRjjCIBwSz
X-Gm-Gg: ATEYQzz9x3xMgLOVfAzuG4zMFVLZvvNhZYz84AvtZXjxJ9n7cVY25dwt+R1pemkg+aQ
	aczpefxl54sPtRcXqUVAJaL7F4Q7fitVbn4h3Yg2PgJ4pJZms0p4GnssFXeEGd+zInMiKYgKXPl
	XfQBV+jFNDvZnWf+RZgQUAKJC50HsU+t7GnxPso8iyho1DTN+sxP7lzXrp9xFpsOfsyX3gP4Q6y
	XOSOPrIrDzM4Kho9jkjdXTlO7kJyea1HqOOPrIErlCDntwdn2LweIbgnEl6ZNb4GAtF3Trzvece
	N4jsyLSGTqvkw9rxq6wLbhFfcyEL5MR+ADsOff+IhtXMz+qkMYN4UNK2vmB0I3CSWH6FEw7RwQQ
	E0aJiiu0V7oJO2/71EHx/WuJlbAz8d10Oyo0AwtTl/g2BDg/MRlL8
X-Received: by 2002:a05:6a00:139e:b0:829:9382:50ba with SMTP id d2e1a72fcca58-82a8c3b3bc0mr14523333b3a.60.1774348440308;
        Tue, 24 Mar 2026 03:34:00 -0700 (PDT)
X-Received: by 2002:a05:6a00:139e:b0:829:9382:50ba with SMTP id d2e1a72fcca58-82a8c3b3bc0mr14523307b3a.60.1774348439776;
        Tue, 24 Mar 2026 03:33:59 -0700 (PDT)
Received: from [10.218.44.178] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b03bbebb2sm13264445b3a.14.2026.03.24.03.33.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 03:33:58 -0700 (PDT)
Message-ID: <9c8dfa88-f820-438e-8418-4919e1175edd@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 16:03:49 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/11] arm64: dts: qcom: lemans: Add power-domain and
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
 <20260323-qcom_ice_power_and_clk_vote-v4-4-e36044bbdfe9@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260323-qcom_ice_power_and_clk_vote-v4-4-e36044bbdfe9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: InOttdaZHcDulszL6e7szmnMmpeaTrPF
X-Proofpoint-ORIG-GUID: InOttdaZHcDulszL6e7szmnMmpeaTrPF
X-Authority-Analysis: v=2.4 cv=c+imgB9l c=1 sm=1 tr=0 ts=69c26898 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=RcdfdvLsBkETvr5PKcUA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA4NCBTYWx0ZWRfXw3vqOJU0r2Au
 b7X61bdITRllxOpZQuwRkfpNS9O6er/r8YfrFDdV97QVQRMRLhvrgzN2LhrKVP3c5njPiUa9XJX
 ohq64xw5IK3O/EDCybEs/lBh9YqJd/UBHTvsihl1cW6+10xlYm48231qzZ7JLfh9gyPjTR0T2zR
 KQmoWyPoTfYgxLM04HZM/dsPMxlBNpHzes3+gI9T4ebyOVcg2davl//KEw6zxLjBUBcXChUBgm2
 +MLVamCwh2JPUahHj3eTyFV+UVcVSZQnIS1ubERYMZF9YoftrbrifspDvk7Y8iUsO3o9M/KDffX
 wwEP35l3JGXLVw80f42ZuHlMw7jOEaluTdGM/Dxj+4n4eaVeBDwDfnrLnSrQ1Ae/mBrCmFc+BOL
 fGkl37i2rHRQYjWRECSBlbj/9kJUIhI6qrsxxwDuhcjWMW0eMhcsXq7gn8ydfRt8SRAlxFdFuCy
 6gGADnApiXGeW7BipfA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240084



On 3/23/2026 2:47 PM, Harshal Dev wrote:
> Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
> for its own resources. Before accessing ICE hardware during probe, to
> avoid potential unclocked register access issues (when clk_ignore_unused
> is not passed on the kernel command line), in addition to the 'core' clock
> the 'iface' clock should also be turned on by the driver. This can only be
> done if the UFS_PHY_GDSC power domain is enabled. Specify both the
> UFS_PHY_GDSC power domain and the 'iface' clock in the ICE node for lemans.
> 
> Fixes: 96272ba7103d4 ("arm64: dts: qcom: sa8775p: enable the inline crypto engine")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>

Reviewed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

-- 
Regards
Kuldeep

