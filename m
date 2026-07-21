Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 382F947124D
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 18:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784657714; cv=none; b=D9Bfd8bEFQj8+Rcb6WbKRHxI1UgE7+PO66ApTmxdRgksAKTpcgHzVFmGRW+WdKlekMN0dLrO9a8dSkA3gF2KoXi8AwZzl2z7GsInflo6X8odKrYTdUzBLXUdnJSZtOYRjmLtgl5Z4yBSXob6hc4lF4p/D74kMloYg2pvXguKBkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784657714; c=relaxed/simple;
	bh=jHDslgY4naOsDD/iTlKigpajtxUB2hMiQ6iSi1OgwUY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bKR8DNVvmTVNHHGe17aZz0F7V/Q8rxLg8/CozVbLTaDcJtpCAmdqO1aoy/ZZZXOW6W6UoZ4II0fMpCTAdHJ6RpgqDutoJ0iwDxnrd8qlEcX7ZGoqZd6biVak60xpiyr86L7uy19m93rviFhgXj9Ly9poBH1eTsA0ynvivk2XDCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YSb4FWru; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DfyRDyFt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YSb4FWru";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DfyRDyFt"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LH2lah2449317
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 18:15:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=C9B7gQofAP5c3h+mXK9qB1+Y
	5wJGrLg5Siir/2Q9cAs=; b=YSb4FWruH5cKiGB1qnGj5ugUGy0l1gCpFN48u1Md
	y6njsdEQE5AMLmNIAYSV1802F2i1XilRVY3q2T/F3vNjSEY59nUm/ucae1OxyKir
	1GDJ3AUJuKdgUqXBvMzKbPdxhWJ7qyKuZBDaLHC0siVjncdXdNPg6dbIIswwiZJE
	4U+o1VSiLJNHbZgvqtMZLl3MzTGHyIuQ8zxjWOjheR8V7fugKgKGBiW2Z0VtAzvq
	Q1IGumN6aaGwWLmAPN7qPTVtjB/cuUcR8GroQgSsbqqAAKRsE7T4ARJcl0GZtEsZ
	MyTV+38xjn0+QRrn7aYiuMn/4iF9guJZaPD0JkbiPV5Tqw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6862f7k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 18:15:11 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-930dda91cbdso540245385a.3
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 11:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784657711; x=1785262511; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C9B7gQofAP5c3h+mXK9qB1+Y5wJGrLg5Siir/2Q9cAs=;
        b=DfyRDyFtwoaBeDx+kttxpaEhGYB4cPCNpWZSqu1ZplE/62rITiuKnFW7PlJvfd3ks0
         MKPrbO55vh5gDRB7DT1tZ6WjiukhlLbA2cWszN18w+KnWnsRDo4ZTVGaweIqVspqu232
         8pT45KGtQIVK1DlmN4BptP2qayu1WCZoEW+2hblAedE1LIRSwZuLBb9lctRhUENym8r5
         qY7tkfeR3Kmm4B6qK09zDZn2lozuNbfLjPHmeEmG/LMGJyArXssgfoRvqvkxdUbcEvOu
         4o+6yvoRpcIWmtB56LTtbMi5z7RXHV3doMyNn4gfT4bO+fwD2I5BnOtsGnzyZHbcejNm
         2ZvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784657711; x=1785262511;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C9B7gQofAP5c3h+mXK9qB1+Y5wJGrLg5Siir/2Q9cAs=;
        b=g/r05kdaWamti6ABCxlN4/0v1zl8GRozwvj+/tBoq1uKbXimgkGGOCLoXA22Uz2FWQ
         40eoRAxEtCY75FCW7E+jw3f3YfSfwK/uDYQIgdF1xt6scnRFu4GrGrNRAqS7c3B7SRPD
         a0kpuKOADzcFhiQIeGuNrmkMGrIwe1RaPCz+lxXYC9pX9AYahInncC5DPoMCWXgHbc53
         0wl+d45UA79zm5OwxTnLQA4e28oaHnB6m4md+0jJoklJTChE8mohe23rBjKMfo57DKK/
         U/KyjlTFPxq8KcD/tJ1FITCxktddxqWAMxrHq8GIrMyqGvUJzfNY3Jg+KsQOLRImmHv1
         BB+g==
X-Forwarded-Encrypted: i=1; AHgh+Rrbti3/+hD1utFyJ5hhIdUvlV/0MD80I3gpg771xmN+lU07UFuuLzMyrAL4WqFHpsGPvJcNpbfyoN63@vger.kernel.org
X-Gm-Message-State: AOJu0YxnHNFMVmKSCHv72qe50O2TeWRtKxm6jO2ngxWWnMqVRc2Os7F6
	CnVtxU67pnXzSHWReNak07Mrj7q3RiZSNFlMpOatvDvTs4rYNI/+Y0apEXjVaxUODSoxv5MV41B
	XcxQuRT8ejAZKukT8RtshuQhDYBzF8vOGU8UIbbnFCn9RTZa9Xv33LKqQ9Xp3cc7O7/LuJZjs
X-Gm-Gg: AfdE7claTFVn9M0KVbnwFrQ+VJNQthsLrUnJ6RuGdpdpraDSCVhuF/BzIIjwwx/IppV
	TAPvBPpKIEKbYblNg4ZFf26znnolU8AhW8sXGrPEhmy0MZvk8udolzG8rev4kQeTxRBczKiM5wn
	jh1DStNUzk+0zimNc10Y1N8l/KwormFti+9xPCf3GnS4aVCdvAPNvxyqLUrDKDlyy18VA/FKi66
	cv6Ypmpd1enqAWniFGEre9lAS+brk0LU+7Jnbt6Yp7D9ygsQf+qtq24ZqQiT3sqyDtBKBhq5gT8
	DssrmXalhCcEr4pxubU2CxoRJ3sURAmNKDasNANAwzLZ9AajkylezEEpPWvvvXl/uKhYJEG0j1m
	6rEanqxjsbY3DYhhQZ3yOG5jvunlU4XicZ5bXlQqJn2BYvEraTqRhulrGh62xWSpEWb1KixYiwX
	qEKId217AJw5BWog==
X-Received: by 2002:a05:620a:3190:b0:915:cda5:27f9 with SMTP id af79cd13be357-930b41d135amr2214047185a.56.1784657711269;
        Tue, 21 Jul 2026 11:15:11 -0700 (PDT)
X-Received: by 2002:a05:620a:3190:b0:915:cda5:27f9 with SMTP id af79cd13be357-930b41d135amr2214034485a.56.1784657710486;
        Tue, 21 Jul 2026 11:15:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9ba342esm62718e87.27.2026.07.21.11.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 11:15:09 -0700 (PDT)
Date: Tue, 21 Jul 2026 21:15:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 3/3] firmware: qcom: scm: Allow QSEECOM on Asus Zenbook
 A16 (UX3607OA)
Message-ID: <vqsxu4idfsk5tu3iigaxuzfeybj7uvu2wnwqim5kzhrkw5tfbl@uc6sacujyw3n>
References: <20260721-topic-a16_submission-v1-0-8ea213130d05@oss.qualcomm.com>
 <20260721-topic-a16_submission-v1-3-8ea213130d05@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721-topic-a16_submission-v1-3-8ea213130d05@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE5MSBTYWx0ZWRfX4nJ8qhZzAj0Q
 NlreKpDUvF7JBqVAj4qdG9FIti2StPhUiBu/DE4m/lfrcEWwIVxv132RGYNIXHvHxS1Bid8wnnS
 fckfv+PTV9OOtEqCJhnmdXSk6wphdPY=
X-Proofpoint-ORIG-GUID: jEleEN2R1T9vULkG_rhfhJyz4iCRRj19
X-Proofpoint-GUID: jEleEN2R1T9vULkG_rhfhJyz4iCRRj19
X-Authority-Analysis: v=2.4 cv=X75i7mTe c=1 sm=1 tr=0 ts=6a5fb72f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=Ss58B_KWQD8EFHPeiEAA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE5MSBTYWx0ZWRfX09lB4u8pmeUo
 tjfMZSyhd2nJwX8jhLbYV2CSbF9KRbQ/iOYhTkXRLHfmWn/5yM3k5HnnjwrlXrCoSes6UfXHr+Z
 LnVGplETtZJxd8tp/B3H6/5D/aXA2Epm03cQSwD1cq/e/FyNA4+IB8jp6nvWFIIPV4OpmZpideE
 9TyRlScqUsIL9NCXFek9cRX5Ik/wiBT7seBTxslTnu0V1RmjQneDNeRbABlnGbzZg+hpqbXgPSI
 3cQkyx/VQ34EzU6PsCOovAHocsIl9wenwuFGZWc3OKtGyxqiM/9V7v6/6tOHHvj0txH3AG5MMmu
 kuY2DRqPnNWOM/zvL//FwQsQyLS/iadMuuZYEe1N9Q4tz47QTV2WLB0uqYg9sP8PpjQlDj14Yft
 oWNQsnKhGdYmN+fwrRh24x4hQ93FU7H3E5U17uS8hk2ON4bjIS2wn1+/2wbwgQICbw9V2DXpXLC
 QEguB4atyRtbuiBXGYg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210191

On Tue, Jul 21, 2026 at 07:11:28PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> In line with other Glymur-based machines, the Asus Zenbook A16
> (UX3607OA) exposes EFI variables through the "uefisecapp".
> 
> Add it to the QSEECOM allowlist to enable this access.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
