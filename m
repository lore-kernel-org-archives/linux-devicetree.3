Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5ABA488215
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 09:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790329792; cv=none; b=fmNDmKDeJIvORMJQCim+nyFstRkJP1bRlPEFcg648WRn8fip+iC+4IQu1sf+jQcb2Rpo0RxKUQNfFbKAN5NnNmSku23BiT/5Tx9nEbTSDvN5rCfdSSnqE/H0N7dz3Stq3Vi/bu2dn/QmpG6IKpY7/RvOSm1kC+Q82yY5bcJiDXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790329792; c=relaxed/simple;
	bh=FeH+acDenpTghaX1pVxjE07KejLlihMziXIEpwEKE9A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lmMnSLPRVuCEkg+VzXW59x36+DUYRV2CDIwMjWsjtzmb5GkN5DstRgNFGAuYfeLVyS2eZE6YOCjrsz+WNE1WVzvcL+NFLIps6CaPk9VgOT+Y2eyj76szSqHWo0/BO7YO9wZFYqtvNeKzpzav1uNu3SqomXTujJBB8lAHtVpXrjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pS7VbsZJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fZlTG+vH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pS7VbsZJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fZlTG+vH"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P5J3XF756774
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 09:49:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dShaYj6eGbKvY3hQV0EgAQMx
	UIovr5wyDKrGsMRLtVw=; b=pS7VbsZJR2wW5lF4ZO+y6XgrWEHrRT54ZM6BDE4h
	cX77vmKx9dDZ++zzszMDF1tA5m9a2ld1rJf9aKbPYWfUXllmZ6wmv+7UQNe7+Boh
	axoTH1B3Z55UNyOrcrXRVnFh1tCCYMA4UaEUnU0usIrGiNCkYXIlhAQcG1llt+iR
	XXGSOODUWM+C1svBBOU2En0jjijXaRmiw60+Qbuz83VDwnD4P7Ma6Qb3y2h1ghdQ
	Jlue2/cjw6d+IHPw5TWpvVQVqQ8iGxtDxSEYJzgPX4e70Vxc2hlHFG3h+e5TqzEu
	5MLSQ/YEgSeQSRZQkGlFqb6grxeLEyQcZDyGTSU+BCUgKw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwjq08tfb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 09:49:49 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91064f6e75bso19170906d6.3
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 02:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790329789; x=1790934589; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dShaYj6eGbKvY3hQV0EgAQMxUIovr5wyDKrGsMRLtVw=;
        b=fZlTG+vH8jbokqw0/nCqIYV/rtNLyIh+dKJRfY9WAPcRB0eUJa9mpx/QxLHUcEHYZU
         CO/tz+37yG9La2fc+36qDRJwoMLpSCOUTWbutuN9onHcevfNAAfFVNlYCJoiuIMQ9+Eu
         vYUOC+JsPDvX6lhOfdvBlf71+ZNJw8jIsxvuYFTUyWSAnJaRQzKvmfWUiltfRWVFDv/M
         H6rM75jDIOWFEtE+TY5y4eR7wqDEnLEyfAp8YuOBbK8gbM6+kUiofhqYME9FzICK2JjT
         uxI68Dk4s+6UBVKW1TbQgGGFzaRblltA6mPV4g36PFkdo9YznxxM8BZklvbmXtwiYKvq
         4TQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790329789; x=1790934589;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dShaYj6eGbKvY3hQV0EgAQMxUIovr5wyDKrGsMRLtVw=;
        b=E6ZaRz1P9mI5PLaNKNVqU1DPUIzjLm/RE1fhhgvRypu9lyMNCTx8EWloi2qIwEsRn2
         V16s/rr01N1eHZkBFDrukqq0c1tDipjJgpFBewVlwglpcRrxzCrpWaqhdcTB5CT44OSE
         APNYvmOICAmcb2bNVicWMvRQ0vtgOT5Du36AvA2XEHyCKcfvzFuepkXSZzgTQyX8H7Pu
         BQEvOP64KD6LZVsiMkR+DwAQUUfimYO13Q+i5U5OsoUAAQ07e7ST0lnGYydjiiybMfGi
         YwYyLsD31PmhHujXO3YNQFUOw+dbHAdqFJBth6iP+gzujM76piS+uK1IVS1BMGA19jKH
         ZeYA==
X-Forwarded-Encrypted: i=1; AKwUvBzBlmsfv6wzcEgFj/ojBVEA+pjRSO2FPg75cX/OoJA4/ppwMtgtAf/ySRaTKxozzSVOcm7xhujXyIY1@vger.kernel.org
X-Gm-Message-State: AFuF++klpg1+x8JihnJ4s+3oj3eqCKJ3FSPo7ly20tcV1mJtMomXgm/U
	LxwmGXU9aQDNWma6S+XlUuGCX8EmeL2pstImWJYrI90zjLjJT47oJH6X+08NBd8IMWyZUmNUoXz
	9I7krJdmJTdJ1GxipXOV2CXLlzxvRYl8VDDf+1mZnB7XqjBbiaRsquzrXH5UthwiX
X-Gm-Gg: AYBFou3GM/AYhsPyEydEHfP8f89SLa8rvu8dXUruT9AX8+rmNmSUsfJp3jEVI4El/N0
	SsqzQGBCX3jYIdx7MYZLIxqE9WYFMdGtXKLXn44vxx4J5ogdOvN/dQ+A/09BONXWk50xH02kDrh
	VAmbPjmlxFZJFBvxDSwPuRormKKvcj6DgwcD+7RWWGweXbOgWKwKG/pWNip5wH8AJqNy2Kz/j5m
	dXf6NWNOoxSGspoTRRdX3yS/YpNE/kb/b/uOLAr3CUHSFeByn1RpzyCJlAgWJdndh8eesHnfrbd
	Nd2h8TA8932bbvH5eSGVZE+X0/mIoGT8pY3I7EmVWr96uXJMG9pSQtqyS3N6Bnlw7R7ZO8q+DeL
	//YnUejIUwOxmqkQ=
X-Received: by 2002:a05:620a:4398:b0:93b:d7a1:ba0b with SMTP id af79cd13be357-93c4752c7ddmr242440585a.54.1790329788770;
        Fri, 25 Sep 2026 02:49:48 -0700 (PDT)
X-Received: by 2002:a05:620a:4398:b0:93b:d7a1:ba0b with SMTP id af79cd13be357-93c4752c7ddmr242434685a.54.1790329788186;
        Fri, 25 Sep 2026 02:49:48 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff0658747sm53094755e9.1.2026.09.25.02.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 02:49:45 -0700 (PDT)
Date: Fri, 25 Sep 2026 12:49:43 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>
Subject: Re: [PATCH 5/5] arm64: dts: qcom: mahua: Support GPU and GMU
Message-ID: <lptn542jabpanhquit4yyq3rylax7zxj67nmes752h7hvmxbjd@53d3tk33sslt>
References: <20260925-mahua-gpu-v1-0-0fa0bfd8d315@oss.qualcomm.com>
 <20260925-mahua-gpu-v1-5-0fa0bfd8d315@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925-mahua-gpu-v1-5-0fa0bfd8d315@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzOSBTYWx0ZWRfXzNI0qKZjWsIL
 R7rSStKyotFEdPIKpBbtJkTlaTNbzTu/ixvB9AlB6yKGDEzPER4IsqH7q+NlJZLWLoTR4rl6YUz
 CeJC4anIgKIJzrKYO9Wh5vP+jvSNnmQ=
X-Proofpoint-GUID: hRD9-iYR29814EOTmZ5Vc1LQ5ycYOljR
X-Proofpoint-ORIG-GUID: hRD9-iYR29814EOTmZ5Vc1LQ5ycYOljR
X-Authority-Analysis: v=2.4 cv=LNPz05W9 c=1 sm=1 tr=0 ts=6ab643bd cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=aW3lQomTbxCpPOFa2w8A:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzOSBTYWx0ZWRfXzVeZxxGR3OuY
 c8D95MNIGIZfAQNtttEG2hEIKyc9TZb/ff+TB/7Qm4YqedPXADBxL1k9pR9Jt9jiZdcha+6UBIa
 XhNAEDUGxjPDgpKc2hHWfteBqvtp8A5NaFQ6aI+hiv+dkP3nU0My+KhLzF1lKCXe0FEIJvNfQ6g
 b/GSpaNlc/lvYbEX8yiKKNDul/qDolaA8jR+tLLVJgnLtWmbuTsBu6kKSBWXu+Pim7BpJ1EcJas
 Bf24MrSWOCqB3+DQe/tgsD7zHJJBa7DnCfA0YuaXrHdIx4JRReHmMVaYSh5w5375N0TtuxOZA/m
 hYd3iQrWX2MJSD7/I3kN5ej3/V8WkJi7LRSF5ILQ/8FypPB5EV+SPDShwAJM6g2TCTwuaSp5P7v
 3clP2Aq0likrJnJYYT+TmGwa8xsA0Q/Nb9BjtYQjCuZGm67yhytpdnz/WCM20Xv1i+ygP1dLfRC
 vx3ePQdLD1saVRN1wqA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250039

On 26-09-25 02:44:36, Akhil P Oommen wrote:
> From: Jie Zhang <jie.zhang@oss.qualcomm.com>
> 
> Mahua SoC has a new GPU called Adreno X2-85, a slightly smaller variant
> of the Adreno X2-90 found on glymur. Override the compatible strings to
> correctly support it's GPU and GMU.
> 
> Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
