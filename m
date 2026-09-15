Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5972C47CA6D
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 09:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789466153; cv=none; b=IB/NISNnOEiJp0qTTrTPvYEIPUqvQAIjxAmd6iYu4is5l5bry3bjXkjgwWIH7OI8mar/L4VwpQHSX6yrbZSjdq5llFDgryg/apVqA7NiVQPGQp3R5kOVeZBBLrMSHdQj8hKqxros47Asc92o3oqlaJLm43PM0C7edvbXXiiYpuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789466153; c=relaxed/simple;
	bh=gDXbyir9zNLTnY8M+vk+mIoyuEwmxWrzN2KOnQMYvVc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G7vpfBnSEOvTe2zi1F/WPHWjiu67OjJX6Em+kzYIRXza7v5WP3MshjHCGP1KzcRCL/laJhpv3mnCe3ZAsIhAnGzynVpn6XZe6F7rYHTLfhvKFpIVV5ZeHn/bYm9La5lY7u9w/igGmF3RuAmOTK2LHkyP6NOJtJCjLPBlFRkkLaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dRb14ZnS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RXAtF1Fu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dRb14ZnS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RXAtF1Fu"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9h2UM2086724
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 09:55:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6m9X+B65XWswH5gO8xBSHz9W
	RGzYzaS4EqboxMS1g1U=; b=dRb14ZnSW3i4AuozJwtoX1s6PEnBOzpu0B27xsmh
	6kJ3HkSHxAVqQXfBMpF3hFSEej8N+7dI+NYd+E9e4s5mITAD7kaWgn8Y/W06dOn9
	3Kid0SfgNYo+Xi2OwaYs/cXDE5ywiYGdTCKB9kI6bjypH5G5RHjyHHj1PT+Qf/dE
	DW9tKV7CRmgkSVhXdtFoeW0SzbEGoJiL3DWF9BXsPBuENuMFit0i0158YCM+xfSx
	Q4rDWtrS/ZgkESgruYQasnhmAwMlJG3+kbkN2pnsrq3UnGwNFe/aXf5Q+/KVfwQz
	zNufGKn2DOsfOvD9O+m+PvGKygjlOWFroheqPp3C4/2TNQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq1qp8pnn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 09:55:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-934956beec8so796476385a.0
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 02:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789466147; x=1790070947; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6m9X+B65XWswH5gO8xBSHz9WRGzYzaS4EqboxMS1g1U=;
        b=RXAtF1FuSRYEHJ7TMK82jyn542+L+XCPhzCIgUI472Qk830HCJQQ/kFwP52gdIXLnS
         srq8UK+40DdMy+fU5MKU6I5IbJlpNKgeD4JzG6MLXWbx/iF/Y/GazydsJ8UKIIKcfKdL
         uGlJDMmAAlDh1MAy/WOP5PrlRbUI6eqEHnqnIiDsOdvy5IG25GPlnMjTrrqVaQjtfKqL
         K5MVa+lbWyGjua4rtBBudWE1DpG349MBnZp345fpajxhDDnAYxxG+2MXgh5lR7Z8ZT2M
         h+T0vMtoKHNnmfIimNqDhkJZ+EMj9VIVFGWDoKsrfV8YxZBFQDUwwYptsjyHCnfJfJN6
         ++oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789466147; x=1790070947;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6m9X+B65XWswH5gO8xBSHz9WRGzYzaS4EqboxMS1g1U=;
        b=mQQz03MRXb7pU3rkKu695gNCjyAkvganAbTR9kG7eu5YVn9x11rW13cmy5+Z6Wqrut
         uQtBpHV4np7yOLRKDWE5phXxm3mpRDQDQgx7EBp2nupaA34GF3baPF38nQ3JL9ZT4INT
         X5n/M3Q8JIwXDNbV/tXDSuwGhHk0p/Ct8b9wnCImppJjyG4cf5THiphGbhTRqKEeOdx+
         3oYw5oRGtpePhY+dtIeHZXCxnRwnLFmFWLcDCI26vsc4lqrowtZIluOmer4AmvtPorfd
         t+zfAkfeUezPyG8a4ZNKGhKq50D0TpHLiKR2v0p/bmgrj0Mn1I1bKtDX8dNOcT+QN1dm
         qbAA==
X-Forwarded-Encrypted: i=1; AKwUvBwqWjJKtdRpNyI7dfRIdybioO55/HP3QYX7uQC4dy7cZvijzldUu5uCLC7s6XgYjiigrO37p/Pihd6q@vger.kernel.org
X-Gm-Message-State: AFuF++mt9F5UVR7BEn1Gn+ou0xXT+56vYjZAM44H7qDCxbtxglO7pvMK
	tv2XBbfFffP9t66vOwO55RrhAopBbt0iy67TCc3T2AuESIuzbhq1LULSjmBhFaDnnfNqh2c8UUW
	8CMVjdWaUMX3B4u0q1w5xKBeEc6IBfbwCn/dJyol55pTOqnvQ/DWzjFeGFzo75iHj
X-Gm-Gg: AYBFou32POSbgNoJJu18YuGPKjIj3r2lKznnNUPKpuLgIdxwnCYCDg2DhkghcRh2kHU
	1J0RV0EmsPwN4prl8/HTKwWBLuDKeWCZpdY5ZnvmedqqVxIas4q8Ma0KlVk0Wa8asCeUm/eYaTG
	jR9pL7hQU4AcuuC0ml+uufAKZkLB1OVLBDA6I4SWd33pqCqXFhBIm9u6LMky1FjNtg4RXggfcld
	Ln3ZX3NMOdwjrfQ+C25W+eeTM/7xCKImZxpcyrOfl4QTRJbz41Rk09PcaIHncKTn3870Q2yVj6X
	v5ZxYiesr/OqbPGFH1YD6hhYZn/3WoBDKJu31KM9MbHwpQxhKkiUfdAEm2cAdGqFz9psmw0aUyQ
	uQWXLMFnIH+ct4/I=
X-Received: by 2002:a05:620a:6602:b0:939:74ab:c1b7 with SMTP id af79cd13be357-93a407b811bmr5427385a.23.1789466147027;
        Tue, 15 Sep 2026 02:55:47 -0700 (PDT)
X-Received: by 2002:a05:620a:6602:b0:939:74ab:c1b7 with SMTP id af79cd13be357-93a407b811bmr5422985a.23.1789466146454;
        Tue, 15 Sep 2026 02:55:46 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d27c88fsm53038125e9.2.2026.09.15.02.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:55:45 -0700 (PDT)
Date: Tue, 15 Sep 2026 12:55:43 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Xin Liu <xin.liu@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        jie.gan@oss.qualcomm.com, guodong.xu@oss.qualcomm.com
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: hamoa-iot-evk: switch typec0 to
 PS8830 retimer
Message-ID: <qwulccp6m22csfxfpivgkzw4qla4cilpwmkcxbszayzxuhdugt@dkw2ytmn6skk>
References: <20260914101233.981643-1-xin.liu@oss.qualcomm.com>
 <20260914101233.981643-4-xin.liu@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914101233.981643-4-xin.liu@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE0MiBTYWx0ZWRfX6D/QIHoTrb49
 xrtnQRUnwTouR5qDCwzbOD8cUCJTAXsgzJTFv+XUk8SfpWusWngkVXb9bNdeIGiys3Fi/hJ35ws
 wEaNrqnIrTSbMfe5w8yORqgQyQiYsL0=
X-Authority-Analysis: v=2.4 cv=I4Xw19gg c=1 sm=1 tr=0 ts=6aa91624 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=0xWNcfA51jHuHAl5ng4A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: VpBYK68fEY_bXx1sQyyJOOnCd1gs6p6k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE0MiBTYWx0ZWRfX/P84Z8vQbUFh
 1M7uuQh7ARxc59URP6YuaZiiVtix4UV7oYWY8t2uqZkpWIPv0MUznPHMRNDvP/CEmtBGUoTKnEE
 Rs2nQqlxs0OteaoJ1craeVe7p/1Pt300wt+Ee4frVeHeQaoJTsrmE+dcrdZa3vMobbVC8G7+lKA
 3ebCFMjWuSyV5aEO+TNoZDe28EOIT+n/rS3xcHCdWiJTZBpLGngdZ3ORWuHE+BAqMzm0nhmDkhs
 2+XL59sKv2jowYhuIQ0jFvk94kROActkMOhm73eA3K+jbkRGw86kOCIdyDEFX7jzZhqNcrjyGYN
 88AA1KM7TO1nGNSIkEuQNnLpQtnlyXPpSaCYq2QxVIpDuJenMYe+bSh9M0mkMBklQF6OqSqx4bn
 X3JfNtGK1ABJLBqqU0uvnEYZUvYl5877bCYZhFHGmaEY9Cdl9DO44mlswtEg1CxKRVjdBYa2b7C
 /QUTtvvU+5Vp4eIcq7A==
X-Proofpoint-GUID: VpBYK68fEY_bXx1sQyyJOOnCd1gs6p6k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150142

On 26-09-14 03:12:30, Xin Liu wrote:
> The Hamoa IoT EVK hardware design uses a Parade PS8830 retimer on
> I2C3 for USB Type-C port 0. Describe the retimer and route typec0
> through it to enable USB 3.0 SuperSpeed and DisplayPort Alt Mode.
> 
> Supply the PS8830 from the existing vreg_rtmr0_* rails and remove
> their stale "Left unused" annotation.
> 
> The FSUSB42 SBU mux chip is present on the PCB but with all signal
> lines unconnected (NC), so remove the fsusb42 node and its pinctrl
> group. The chip is retained as a hardware fallback: should the PS8830's
> SBU path encounter issues, the FSUSB42 can be activated with a simple
> rework, avoiding a full board respin.
> 
> Co-developed-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
> Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
> Signed-off-by: Xin Liu <xin.liu@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
