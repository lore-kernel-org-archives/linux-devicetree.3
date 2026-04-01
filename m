Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864E63E92B5
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 11:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775043215; cv=none; b=TSvbg4QEIYRm6i5TMUoh9oDTKu0ITwzoeMvg0Xcp6DvpdMgr4ibBHpmCBN9t1fH6y9NKgZlpVzWBWQFl/VUUOUynSTZ6vnhq8dmyplvFMm+dvHC6nb1iSX+2wHGgonx54mo49DVptqMH4ZrMAOnDgKxS0P9QTN8FWaGKEu1snFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775043215; c=relaxed/simple;
	bh=ndhYHlqda5oAAuruTHIL0EWuEGC/DXdootE3bZQsaeI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WiDW1dVkmgEjeR1oPTaUsA4DoNK92V/tmjOnQkLbDlgO/G83IgafXh4lm6bnBXWiqAsX75GNghtNln5NaZwMwKifs/oDrOfeffYLAde9/qCgarsW3u8J2p0wHReo1AD2tq0epzCqJHONtNreumSX9/DmCuNLPweCVDqAQ6OdyZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BeLeKNmA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AyGGrMna; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BeLeKNmA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AyGGrMna"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6317nrso1578309
	for <devicetree@vger.kernel.org>; Wed, 1 Apr 2026 11:33:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jXHMCZtX7PxRagNlvpa4IXFV
	bG++y7vSi5O2D8DYJPw=; b=BeLeKNmAR55lTJlndaAwjzWFgRBp6GldriCe+4AO
	sYyr0A5qlAw5WAcLdF4sx7CV51LhUU+jB/9jk45I3cjcwtxryVUHRW6vftSHaXQC
	ERFhXSo7VR3GmqPQynZwvCBnOhcAUZBwcLb6hS+vA+5C2UXIaNY7pXjHD+kQ3QKR
	YK5cnj0XXL/+YqmewaUysdozasHJXDXTxDaFnWgJ7DGrW5XftZRSSxmD513kDXkc
	jWl4K9NQLuFVuq0ZgS/JG+cacPo9SWj9/E81WVUpPbuSzM4PEhAYl8Di0uhIHHVy
	ifXcApiXjaansm4PQhQJzdqNz5ILn0KnTvy56Q2X9d26fw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8k6kusur-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 11:33:33 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b34223670so102141381cf.0
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 04:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775043213; x=1775648013; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jXHMCZtX7PxRagNlvpa4IXFVbG++y7vSi5O2D8DYJPw=;
        b=AyGGrMna+aesGUnXA6Ih4AHW9dS+eSjj7Ve4jZtuMBatoxkKn7JAhVlsVR2ybg2CJP
         sxVUVwd+NYkY8pksWx+lLNOMhYwQ2fajOy1k/k7l9VSMx8aRc0PxFwLErLZY3Z0mprc/
         zl/6oglNaFAopJY4Fnqqd3IxhoMGO5A9MfJXCzA1hPiFupKK6fdDEtUprL0M25pKWdpF
         bqNk85KYaEBbkp1iu+z3zByP9zPuTlLjQdBE2bw25NYMVtQDaBV2KepT2eNS/26JScMy
         +q7W8ALGzXbEXKXDfz9n6rh0g2hcRKseyO0S5qCrjCaKvkYTheXdE/PqRuGcYaw2pald
         2vdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775043213; x=1775648013;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jXHMCZtX7PxRagNlvpa4IXFVbG++y7vSi5O2D8DYJPw=;
        b=IBuE2fQzJ/EqRMJODxAi9tX9A2OIDivy4Az/ZoQrEZnM9EOIMJxe4VwOHIvZhyr4lG
         TA+V5V2CtywBvByNtprhSACa8n4h4jjNuFzhcjMUBiWojYbcN9D+GZ2wBpTqShInghK5
         VmYkpZiKmNhKi82b/M01Wlh7FYT3iHVi4fUZ61ZFKnIffxgsM7ZQDH+LMYtkXt5oxRU9
         +fJgwBURivNCJ5lij4aZ25YP3abNPOK3uhgLqhrXHH6xv8T3jaC2g+hdaXJ5s8E7MVQK
         WrySpYda2cjKgOL2VRc6NfDSEBS86DaoN7aV546hECq/Y/BvdqL1jap4yWwl7POtuU93
         h4cg==
X-Forwarded-Encrypted: i=1; AJvYcCVZmJCiGWeEa63MNNHWnpZ2lj3uRoKIdtA5mzCbUAFbLKefsgSyUqn7eC756ZRxR9b9idiw2THH3RlR@vger.kernel.org
X-Gm-Message-State: AOJu0YxCsdcBDJgZikAd8VdKEf+fODZU0wRUU0wCJcGTqlC2ZMP6iSpQ
	IYbYHclnNby8zEhrCJT727gCNU0uxEuK1m7b4Ztm6Op/8ogQMe/QJ+Gvdp+d7yOmcxZ87oeAiGi
	Dtnzo1ouO3NQ+0PDxMsiVRAR1J5odaYdhg13+4V+6ya2T2XkC+vVewWdeOCQZp/mt
X-Gm-Gg: ATEYQzxjqatQ9X7NNtNbAsNr3iLNgg7gPBMGC2SGc/RtzSWLMab0EP2G8tLYKEDFbH6
	bzqCU7XJxv6n49u6zYzXsSD0QnfpzlUZE2QVs6RVVKpbHAwm8IOrBu8QzW1x3F8TloS6ftos0AG
	cob9ACZvODCvz+fD4I/7yccBhYPlde1xHW4lURWwS7ygIdg8C6JumFNkJiHdOPhpt0GJ8pxlxg3
	55LLUJvsigOCAmUy/1HZO1aO3qdJ8V3hZkeLjEwEd7xRIoIrlJLF0dhhX46LdsNbbVYZQ1f09td
	HB0b5XLKdEGrEUCavRgdRDIUyoP4B6WJWmypUHRTlG8i2k2DCv1/Tjxc+QZt2TF+X6al6R48AMF
	yy4zHdZNbexBCxOAzziLVhzoUyBTwVyjrIvgo//VTMDHgS7SZqtbQMs1IMqUGdoL4mpVXnHPvMz
	oT9JYBew+ASJBdYDz5zFMZJwyXFSFSEL2V9aM=
X-Received: by 2002:ac8:7d41:0:b0:50b:409d:48b7 with SMTP id d75a77b69052e-50d3bcebe30mr43769211cf.44.1775043212915;
        Wed, 01 Apr 2026 04:33:32 -0700 (PDT)
X-Received: by 2002:ac8:7d41:0:b0:50b:409d:48b7 with SMTP id d75a77b69052e-50d3bcebe30mr43768911cf.44.1775043212493;
        Wed, 01 Apr 2026 04:33:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b14603d0sm3217033e87.83.2026.04.01.04.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 04:33:31 -0700 (PDT)
Date: Wed, 1 Apr 2026 14:33:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jianping Li <jianping.li@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ekansh.gupta@oss.qualcomm.com
Subject: Re: [PATCH] arm64: dts: qcom: kodiak: increase fastrpc compute-cb
 session slots
Message-ID: <ejt3dzkuo76sb6jipkuae2u47kushc3vporxn3xclts445pgck@5qfcnufjljiw>
References: <20260401073345.478-1-jianping.li@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401073345.478-1-jianping.li@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=bfJmkePB c=1 sm=1 tr=0 ts=69cd028d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=Zer8_0FavEUcD5cz1wAA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDEwNiBTYWx0ZWRfX4PSHvFMkBfn2
 UlSOQPgaqjo5dVk5ZnqTTZZq71kkWVbhWzvAV166Ff3bYpadcNU2Mj4pE06GXdpTu9GcjHPDqT0
 AugfTD5QUutyxH6FYoxg0RlFTVV7TlsMxRzEVZFFrrje/TFLnTjbXcqFFMCp7rdWchh/LE/SBD0
 /koV5vTTThZnCdGTtUCLnHK74YcqzSAP387E3ND8oRWiaDpn7iEwFfGM2GB6AXipJX7cV7eBbrM
 +RbGqj2cezhth/J/+hKJIjWf9y1J/9GPZwaMkdzE/dev5/tDBHsxBRziZ3mn6+FwLHWge0TW2p4
 J97WtgHXL+HMDz99l+wOskxSLPgzqEQLO7DNr4sOTfidfDaBnV2OvRvj66dksaVzm9uHI8FcxIE
 AP8nLs9LFgv+MnZWy8MHCIsEkwUuCmBLIfPMnNLB3PTXnMVK3KiwRAbsuH2ot1Qd3MvNAZ0/0B4
 jP8NYxGlVR2ocPV6Mjw==
X-Proofpoint-GUID: fXYGXcbabW4I4GGDNZUjFySwWmsh4L1n
X-Proofpoint-ORIG-GUID: fXYGXcbabW4I4GGDNZUjFySwWmsh4L1n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010106

On Wed, Apr 01, 2026 at 03:33:45PM +0800, Jianping Li wrote:
> Some workloads on Kodiak can exhaust FastRPC sessions when multiple
> compute clients open contexts concurrently, leading to -EBUSY failures.
> 
> Describe the compute context bank with qcom,nsessions = <5> so the
> driver can provision enough session slots for the compute-cb instance.

This is a software property, so it probably should not have been added
to the DT in the first place. Can we replace it with the driver code,
allocating more sessions to the last CB?

> 
> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kodiak.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> index 6079e67ea829..5bd20909f9db 100644
> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> @@ -4465,6 +4465,7 @@ compute-cb@5 {
>  						compatible = "qcom,fastrpc-compute-cb";
>  						reg = <5>;
>  						iommus = <&apps_smmu 0x1805 0x0>;
> +						qcom,nsessions = <5>;
>  						dma-coherent;
>  					};
>  				};
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
