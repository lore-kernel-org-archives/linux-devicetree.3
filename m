Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A957F372075
	for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 18:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783793052; cv=none; b=XL2tCTBKsGToAnrLLXTdPuh/O+TH79JObR1YzfOaNBp09IKcH1NwUamwLdODgJ1E+rFWMsn7sVpSuCDHRx3eTTGxff/a1hkHpRm+7MmeazR1YJHs0YS1W+JAmbam9n6BmkC8+oAxQhiq69eBDASWBHq0yn6WSNr0e6LjOPyE0hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783793052; c=relaxed/simple;
	bh=fMoeKDL01AH/hbKIXK7dj8/vhNF5UG/sgOmRbn0CUYs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JX/HxuPNjGArqqudk7npHsD8IjR7GUnSuQpeVy3XohIqrmSKj2P2X66Dq9wZCgVEuYBDfF3wsQOD9M0Og2OnEdY35PRlPUCqO6tYZ3ISkj8JDlFVSH1mh1nf9Q//bvkAGyG3JE6wKMQ/XhxtS8sPKc9eeap0M3a9J6O5q7QUPHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nlhG9iGs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GEYUxQRu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nlhG9iGs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GEYUxQRu"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66BHorXZ340710
	for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 18:04:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gi7mAsPzRKDSQ0PcWw7D/RRQ
	waT6XIdXYVfkOrbW+f8=; b=nlhG9iGsUHzeL/pnhekXb0cQ7HhewmN3YpC/275Q
	H7XLy/KMwJ1+b2ZI6OhPtuAo6Z8h0M3Sk93fuuw6etBHnbb8uhshs9nhBrbH7cXK
	kLDDcoqjYUC/3uGM5+45SVW8p+6sZSFJfJv0b3z3xXUPkUl11kDeKHHj+2yU1iqn
	MfZ4lmy07AiA54I8IgdSVpsGf3QdoK2PhqnNf55ddEZm42f6cBpi2GhxyMIqsFRI
	K2/6eB0NZjIc0yVfUEniZZQd0WjQ01GTIzxTbQbZZsqw2JnKlWlBiJz0tCyvOI1n
	LdoYGMsVVVbE0IVeC74yZovJiDk1dx993brLSt+EelMtHQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbe8v9are-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 18:04:10 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c19493ac2so21258021cf.1
        for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 11:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783793049; x=1784397849; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gi7mAsPzRKDSQ0PcWw7D/RRQwaT6XIdXYVfkOrbW+f8=;
        b=GEYUxQRuc0ng4GcxE3S13rvuONZKCnonUfVk3G7PBKMMOWrmNnDUdbZLKYTA4vHUo4
         FLy3p8fl9RLurp1rj3YbjD82QgwLRYLgfy0V8eC/nDzD/vDMu/P6671R2ikzkfkDCHTm
         6kCXQtHid7ELefPrDWT8ZGC9LGnx7A/WiIUuvJHyqcY1ghiQdlbjMjFDG9pj3rVB/yGZ
         ZwTXpcN+c6oo51/rR46kshWndbQ1iWYnSKli9v94Om3BzFNtj0tuwUAAx2hacPGBXG8J
         FgXjEedWZqW7U8Ofx+pPSFAP2mX1DxWgj7ojbXTiQoT3zNn9bj7Nrv0IIF59kdoW0iSi
         WS3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783793049; x=1784397849;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gi7mAsPzRKDSQ0PcWw7D/RRQwaT6XIdXYVfkOrbW+f8=;
        b=KGXWqBouZpme/7Kb+RM5CfABDl87ptfVj6gjqftq92eyCv5btXwKHj973HmUnDM3Ts
         fbGRjnGSPsKdtBdsa3LTDipxamqdSG+IIg/sGgj9hn0G9JcmqO6K1Zxdz7H1o3w8LRkP
         f3OOpaAurHfUYI0R0FUXtKsXbte36x564Ntradox7Nm4SY8zLsSk3OibMzKZqvc+xfbe
         gjlIqQR15TTlt8WdVMInMq95ccADmDRptmV0/UGmj6tQt5C32J1hMN6hEq7TtqPm3Wlf
         sFB5oWNgiKBGGAqETCdR8XDKAd32VTTSvxUlojFN76XVAnnDLE4EwTM8wtTRSSw9Xhm2
         fblA==
X-Forwarded-Encrypted: i=1; AHgh+RoM9zoOPATJ4VguOgg1SRF86zyWe7w6Bo9yl559qjeRoH4wbjazIjsn/+37pmjUYU0ZXR6peKbpY/dd@vger.kernel.org
X-Gm-Message-State: AOJu0YxOSzsAFgnV5cMCt2LjfaKqGJiACAZ0AQfSs05f8ov3Y8rLyOsz
	LjzTDhPxuvJTqibQabJwom71A2OTawoTpmPZ/to+AIvukoNjAc6ZM0ZdJANg08jYw7tYpIcZjSo
	lSByXXKl9Jta/pcJ470MNiHvGrk89jYCgUfVrkoBzL7iaTWK8Cj/006noNjdaq0Wi
X-Gm-Gg: AfdE7ckhoY/LKEjjrWvF3Xhurs+eI4djpoItDQzuUNPH0WJhLwbpDw9qYZ155w2cU4J
	uYfS8piILVmnq1uqcGqWaTALkJ5AfRUYWeCYi7+IM5Vj3/ojVXnyol+mQ6r1wp3+FMClSrFkK+c
	f0taK9sxEG3YUdBWD401p6YokHhX1aqXSk8PJdUTX/xNfaeGUZHaQ8WGGT19ff0OBhnQZz0ynJo
	nl2aeQ/2wMxF0NAcopljEyJIQsmt7bhHaKu9fSxQCkXmyRNAHA2fKCLiuJkxB8dOgS1mu9kWilJ
	F+WZY7s8HHKy5OrJ7OZR8HU0RrySgu+mmxbVmQBmzLLVJ1T1fcjqOFIfmQVY2arYoNspGRljayn
	k/rUiTSI+XV3lqhTHOLa5gxlcs9ZACSrVZUMT7X7m+01omYtwcMXA1oYGB+n0qFB1yPKzTQPoRN
	HAPUCoYjxpuEDbVw+eBuNzEe7y
X-Received: by 2002:a05:622a:58cd:b0:519:ef86:127d with SMTP id d75a77b69052e-51cbf07149dmr36273371cf.18.1783793048965;
        Sat, 11 Jul 2026 11:04:08 -0700 (PDT)
X-Received: by 2002:a05:622a:58cd:b0:519:ef86:127d with SMTP id d75a77b69052e-51cbf07149dmr36273101cf.18.1783793048432;
        Sat, 11 Jul 2026 11:04:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01ca9ddfbsm1478518e87.54.2026.07.11.11.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 11:04:07 -0700 (PDT)
Date: Sat, 11 Jul 2026 21:04:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Esteban Urrutia <esteuwu@proton.me>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-phy@lists.infradead.org
Subject: Re: [PATCH 2/8] arm64: dts: qcom: sm8450: Remove unneeded reserved
 memory nodes
Message-ID: <vbsdddrjoq73h2tal77rdm573ydomwsagr7fujjh7znw3dnbka@olj35zj5pyzn>
References: <20260622-sm8450-qol-v1-0-37e2ee8df9da@proton.me>
 <20260622-sm8450-qol-v1-2-37e2ee8df9da@proton.me>
 <e1e492ab-884e-442b-8410-cc100c54fd5f@oss.qualcomm.com>
 <6123a923-21dd-4f69-9ac5-02165963027c@oss.qualcomm.com>
 <b3541802-3035-40ee-8327-a65bd5d2dfee@proton.me>
 <4g6y4q2udludhwmoqc34afwj5svra4a4j5bmpqza7h3av2oov7@6k5r7a4meruk>
 <c11f9ddd-8533-426c-8a88-0ed461f6a30e@proton.me>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c11f9ddd-8533-426c-8a88-0ed461f6a30e@proton.me>
X-Proofpoint-ORIG-GUID: pdySTKqPxqH0bVfyYqt6eqFf3uFEIsO0
X-Proofpoint-GUID: pdySTKqPxqH0bVfyYqt6eqFf3uFEIsO0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzExMDE4MyBTYWx0ZWRfX+uTMzz0oSODs
 ss5QTdie6uqodXhLVzLGgBfONq5wjbeXNhRWhEMOhpIiqUxXifeKen57leYvwmmAMFu6Z2Xiues
 gbxbcLE++X9EqTnsKrxu7ri/2ne2y6k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzExMDE4MyBTYWx0ZWRfX0SmGf9Lst/aU
 M/IM3EHvrn8ZDnAQAn7cxtS8kvtUq48+EGAKuspe4jTO1u3H79N4th1NREjuY3rUV0w5zjiG62X
 AH88bjHbJfX8Mv7HkLibwXqdK9bqQaDW99IcFBVp4SOpGzkV5PzQDO+cmvONVaeGpk5drFHHw0b
 giH7FaGI84lYj0wwheAFnIcemskssbCtedT3vXBsnFOPRgSfMeTNPq/d9wDUGy4qM53jSt/aCwV
 hKo+bSk+C6XJfipaohQl4JEye1uHi2nvAxwilPRigVe2qILx5tgc6CbdxMFVCyw8EslYIrvkKSq
 fMlsm3IiwZrhQtVXf4agYFQ8/LiRz2IEmiXzv0OXzDbWZKhGeD2JP89UZEtuxCKpR0qSa7qurMA
 5jyVUKmVo8jyDU+gttyzRLnT0ma4svw8PWWgqGTA3ukt8Ip+hNuWiY2YH65/kKtqs6Vd7U6SRtQ
 pFJoEqqMuxUaD7u4eOw==
X-Authority-Analysis: v=2.4 cv=WONPmHsR c=1 sm=1 tr=0 ts=6a52859a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=A3yFiG93vv4HRecOgxcA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-11_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 phishscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607110183

On Tue, Jul 07, 2026 at 03:19:22AM +0000, Esteban Urrutia wrote:
> On 7/6/26 2:24 PM, Dmitry Baryshkov wrote:
> > Please verify that you can actually access those areas (boot with
> > memtest=1)
> 
> Thanks for the suggestion!
> 
> I actually did boot an SM8475 based device I'm mainlining (motorola-bronco)
> with this parameter.
> Deleted regions in DT are as follows:
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
