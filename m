Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792663831;
	b=JUyRe1iHMOOe21w5wJ4B7vyujmaG6MnmDUqomFenTpbhPUBdxouZbOnB0/2Jzbi0KaCS
	 5onwXrg1joApua0Q+gPW+nebEvnBx0vOGYKWBowlkehfGdIXe8MQN2spFiHO6DQph0lpO
	 JLvkVA7UsOFuG+yTwP42ur9XEVKg5zZ7l+OGFOe9AnAvRZ+L5oHWPEEk8bR475ntJMVqP
	 rlfYu1otQpqoGeCJVxPKfV6UCoJ6n8EOJzXjOsY0E9+1DcV7228OUEYyx7QJ8/uT1bXH+
	 /US2z9gYxxfgWDQ1uQDDNn9mEfrsNbxVsR3rkLkF5Un/Uv+chYcYdecdoDL2ULLiapQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792663831;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fbKLGq9PyipegVYiZapN8cQvPdSHH8CKY+98Y1mqjhY=;
	b=R/+2fnj6DzWjYkZSdM9cdH6bcs30PwKJ0BGjIWnJQ/XBH/vfg887ePaHiHY7Sf/xsOCS
	 0hDqgPdYWW7KqQKAfddoldhqZ7MGYlY0Ri3MKvWZU6AQGPrzcXp1JvhZrmokZOBr3Iias
	 P4GwsUqoajxTi/YufhPbRVgVGRBhn8UGWASih3915LUIL1tgnMWMIczHr/Cq3kLqaPasa
	 HvOAhunSR7QV8rHdhtH2KH/YsJxPsBHn6lOX1HAvbOZSccxRjT2uVDHO5m+VVG9QYURbH
	 g6SyRDtZ92s8xSs3RTT0FVyRY4ZETLr5dr0wmPRR/hCSga7PiP04Fs8R/9cuJoFfEWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QU0Webh+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E2LHjH+8;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5A5606A32C
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 10:10:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C5A5606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QU0Webh+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E2LHjH+8
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA5rwT3440426
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 10:10:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fbKLGq9PyipegVYiZapN8cQv
	PdSHH8CKY+98Y1mqjhY=; b=QU0Webh+X8+jU6IBgNvZcDg6N/kD+t0REZyXD2YJ
	/p8FBZJkvhj6GDn4hMzgSZi6ZbWPzC9vMwMKs2C49wFrrFP2NYZ7MFB7aPzKtPWT
	66jrEIPjbFE1CDIQVEtP1Ay4pyMP78zyFVMMkB8YBzuO9RspfMfXDJDmrkPV0XXn
	/tlxP45MqKFdV7qsLdPdj1ReD1ERCwx7GN09CLY6rqnG9YBbmmdg/2/fJgXuxQ+R
	SOYyNYFVNX0OkZCYZmbLfpSazF76pZHYe40fY6c2tiHuM55oNupzVihSLXEh1a1K
	3t7JecY5+WZ/Zz64JhTumhF8SrmyB0n8L8IoxzxFJTZ4JA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93astxf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 10:10:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f26dd2165so568853185a.3
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 03:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792663829; x=1793268629; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fbKLGq9PyipegVYiZapN8cQvPdSHH8CKY+98Y1mqjhY=;
        b=E2LHjH+8yGLt56iO3X34S+5PoU5WeGta0X7LbnCTNle7OJDOxuglHEjz/yniwy+SKT
         RzvXHWfRIPMO4/IqeOttd3tYGCQnZunzyHi+WC2RCu9wU28OwJMGJlsNsr7jr1Q22UTr
         auueRZXp5qlQJN4TxKPOovZqOQa5Yi4MsVb8A10CsYFKnGWx63/uNuGPMvjhLQhs+8B5
         97u0x9t2LF3SoYvpvE1XRcEQ086RTAHgK2kKJjhM4rf5T290wby81tkkHoCskcUZUi1u
         VtJlUiqYgxR/r4CyU9qtDwkx2mCK0gJq5e2AxW8VfI10unluHM0fJlorb4i3BMvgansy
         9XJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792663829; x=1793268629;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fbKLGq9PyipegVYiZapN8cQvPdSHH8CKY+98Y1mqjhY=;
        b=T0VISB8a8mrF63Wt7m8cxmAc6mILqnNZTfsPaMbCP22hiFhTvpuQS0ODohsTfl1JgJ
         9QWz9GhKGOtdiWPIJPK3xecIJjTHE1bRxmjUShp8mH90mreZPJMwsVa0MGmAtkKbzRbQ
         mxg/wRsKvquRH/sgdMl9HOShh9HeJBTcS/7ppn9eHHZVrGSGVqkMCubeL1h4mnBQwzKA
         M1Bxq6o2I/NWVwu3O0oA+gO7f2iZu1zd/rEI6hpjqKGZ038Ds8+MfqBgyeywJl90eO33
         pVHERKU5SlsFakPj5NHQ2NSGbXhmKaPskJ8zaR6ZJOL6dOl/sV03OKQcl2L0V2q7x+OX
         aDIQ==
X-Forwarded-Encrypted: i=1; AKwUvByV+UZtea1xqpgf70SrezXwYowqySjNJ+0i2I4zPB9IrUkvZ0Qn2XeVhEoYj+GG43fz5GPUeWHPOBiF@vger.kernel.org
X-Gm-Message-State: AFq9FYIeDnMfdsxrLTmexalZoOPRPWIIc9Ot+aHgg6tL2KC+PWzpLgmL
	/5ma15N/3MR+5fOAlFTH5wnN9wZjAFPv9T+FJYeuU/kwWUvCIWEOSLILw6zUs7/FMnQxbOfCQMA
	4u/d2wP58iwwaO/DokmrKAZ0UGDQdM6XP0qqL11fPFfOhhHvdHSscGXPKHJKTrUMO
X-Gm-Gg: AYBFou30fPwxghPGAbTRlJ2zoEEK5Eezp0nBWEH61aR5ib4tXnrjutY5lM3PwENsizV
	G03n89rbJ4uI1lllZLom1PYmISYm7MiMQHLb3ZBiAqmeKsTnuTbRxPCyHqWcI9sXhTY2hBdQAuq
	NS6aJIJ4Fe3PWPMsA32X5LQVKeLYqTU9fNIAs8Dw2QXNbDj0yF8kZH+VYpr+vKfyVR1hunTMGLV
	ILP63vi6+NJKB/lwsyO+AEgMV6rrPTqHQSmY189TBt9djITka85JPL6pF4D94dfzXI5JSqdAU9S
	AEGltzcRO2W9KstjavkQJRE5eNrFmFuldPsEjGt/lUDE7SuvUChoKBGeWuUqgI7arTSrJh/bJKZ
	vzHBAVlMpVYt8JTqqF7Yo9f2FbYHmTalEi7LFswT6eRnUR3U8J5xYC6lQG6L99c2ZarGEWUItjh
	wjOi98slTTihec
X-Received: by 2002:a05:620a:688e:b0:93e:d364:c9fe with SMTP id af79cd13be357-93f57f5129emr848795285a.40.1792663828382;
        Thu, 22 Oct 2026 03:10:28 -0700 (PDT)
X-Received: by 2002:a05:620a:688e:b0:93e:d364:c9fe with SMTP id af79cd13be357-93f57f5129emr848789785a.40.1792663827828;
        Thu, 22 Oct 2026 03:10:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfa1244ee8sm1026945e87.84.2026.10.22.03.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 03:10:25 -0700 (PDT)
Date: Thu, 22 Oct 2026 13:10:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Abel Vesa <abelvesa@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, iommu@lists.linux.dev,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v5 04/13] iommu: of_iommu: Add support for "iommu-ranges"
 on a device node
Message-ID: <325qovw4tt75qgk5uncamb4ca6ql5ulyivkgocumi3bwogmkwn@ijk62fhpxptb>
References: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
 <20260926-vpu_iommu_iova_handling-v5-4-0322ca5dc10c@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260926-vpu_iommu_iova_handling-v5-4-0322ca5dc10c@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0MCBTYWx0ZWRfXzFKX3AgSUflB
 0qXfyzLRtUGkC8GTNZ3rt9MzySjTFkK9StPVxSCMOqEzKwEINzmub7bL0K3x7mHceJVr4dz9dXa
 +LufGL3wnSGDpCvxXo47i/xPOcbIw+DyzP/kiyqTy2Pn341eGkYctuLiBp2bKxJP2//i3XyMWya
 z052t2C6V+lDF914l6y9gnwkseooNF1vlSXampSGRKO0Mc65SE+syZyHSDp0+xx7u1BRTeNOY1R
 F5Se2RwnSiMxxJ850DSNoQV/JsiVIkG0uELm6k2bMdHqWL+2DOqO7xkTALZy8hz0orRuQfJ58sk
 ApJT9IG5WB5KrhK9OYVmLf5wsLVNPMIF3N3xbTkXolDTxPGh0f6ptL3hQDg3YCwCb7JmCwkzMx/
 0Zcp2VeUZ7Fa3ocKdulBVD7jfRSSScv62Qyje5RwknKYaU4DWOHZfE5O73eU4ZkN9wmrojrTml9
 qQCRE+LN7uk9ixDLZxw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0MCBTYWx0ZWRfX35Z/la1ZerfS
 DRfmPvNwY5D2ryDL7KcOZeHrwofdpDmXcJoBYANqnorKD6lKX4KYzV3khghaNZnxNhAoSrUPsaT
 Z806JuCCvVeKJb1NljSjsgnKaCWZqQI=
X-Authority-Analysis: v=2.4 cv=QPn91QLL c=1 sm=1 tr=0 ts=6ad9e115 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=AypnKj6NB4iKfuN-KaAA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: QcyaCeETZT5-TUic8ngK3ZSrXJT0VSoj
X-Proofpoint-ORIG-GUID: QcyaCeETZT5-TUic8ngK3ZSrXJT0VSoj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220040

On Sat, Sep 26, 2026 at 12:04:03PM +0530, Vikash Garodia wrote:
> Reserving an IOVA address using "iommu-addresses" requires it to be
> placed in the reserved-memory node. But when "iommu-addresses" is the
> only property being described and there is no backing "reg" (i.e. no
> actual reserved system memory), it does not really belong under
> /reserved-memory. A device IOVA range is specific to its own address
> space, and does not describe the system physical memory to make it
> qualify under reserved-memory. Given this, place "iommu-addresses"
> inside reserved-memory only when it is paired with a "reg", otherwise,
> define it within the device own node. It was discussed here:
> https://lore.kernel.org/all/662f7093-fb0a-4564-9ca0-98e03e68ba9a@kernel.org
> 
> Existing "iommu-addresses" property expects a phandle, which does
> not make sense when the property is defined within the device node.
> Introduce a new property, "iommu-ranges", to specify the device
> specific IOVA ranges when there is no backing "reg".
> 
> Suggested-by: Rob Herring <robh@kernel.org>
> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  drivers/iommu/of_iommu.c | 128 ++++++++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 121 insertions(+), 7 deletions(-)
> 
> +
> +	list_for_each_entry_safe(pos, next_range, &ranges, node) {
> +		if (pos->start > next) {
> +			region = iommu_alloc_resv_region(next, pos->start - next, prot,

As pointed out by Sashiko, this can overflow on 32-bit LPAE platforms.

Other than that:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

As a note, we'd need this patch for the upcoming Qualcomm DCP display
driver (posted a week ago).

-- 
With best wishes
Dmitry
