Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33BA3E122D
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 18:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777313925; cv=none; b=JFASbklP2KlmXMfJF33tmjYcWe/Rzrmqfi5FbK9xn/TRULXXvKjt04LWoQjTLwfo7wsVvD6d9Rv1r5/CpV9djbsPy/XH9FZM4Wa/b9OpctlshWp7JR++in02+8E2dDe4z9u87Ik2SJ/356glpKOBFnkgGQfIlQnTq2DuT+BwUXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777313925; c=relaxed/simple;
	bh=XWz2b8DYDaLIIiyDtf+GBRRTgJFCkw4yyBezhqIWX8o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vm8ehcqvw+oYlrmarRyxcMPNcxWUoZr+SvMzWPwbhsWeGhgcEOJrHpnAKkurzB3IjPevXQNjANpROqW+/HSo5kISRPey/a2MQ3XiwF9E/aKA4ZewYRPWNY8kziW152++f8+mLGuSM4EdTBSNXGt37OCSc5EXArYUZtti3ZArD3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cA1znqri; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KOOn4bvH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cA1znqri";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KOOn4bvH"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RDY6ZN665693
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 18:18:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bhDiK6qYw1rrEnW7/C2FzVLd
	Yl35djd7wNOVBtB2jiI=; b=cA1znqriAZCqMDtNOsIGJyQvxhFq/L9Kt/yQDyL3
	QBvL4h1g8eYMAAxMkySVD6x2jpoP9ryLjwGoOd7k/64gdaz5aqGfDfxswXvWhm8K
	8q+j7vr7i/1tqgL0h0PfReKOGkJjcXYpnnOQzXJSt1edf2/wmi43uOfDdTVXEIFK
	KjWBhMjqJbb1ojx20fUejMBIwSBBp96O7iNtJ2uAq3576Qn0zJ0/52MYsxHy2RYc
	fycPpApfBmwSwkOLrE8RJSH09HMbE7LF+SpS9R/EszWpfifJPhQx5E0GMI2f8LDF
	UlLSqkynBH+eTrV1QoCFC3/CD8hd2pLfpFvq6VsryJiT/g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt30n2qk1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 18:18:41 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d8ed08aa4so75242281cf.3
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 11:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777313920; x=1777918720; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bhDiK6qYw1rrEnW7/C2FzVLdYl35djd7wNOVBtB2jiI=;
        b=KOOn4bvHC/mUtaOaRM+o/QZNbPqiTYQIWiUSY8O3M4F9ZTedYKUr10UTewqProENw4
         CT/DwLCoFSw7gR806vMDVDfRpcLoop3TcLchelpNf1vZYrf2F+T9TYF8+77K616bI/D1
         lHJiL4iwOWlCfbYQx+NFiHpQq8uOP9gYJxemP/Efu0rGvrMICxr8FUC0ZXxb2bGb/b4j
         pn9mwxwuP7kSzC8aVi7p2uj+B9IQesY0fdEWJIoCaJtRBVKAYFmHQIFNfaQF7526JIzo
         oM4b15EyTxofyteSfsCKnKwp4siKSLeH3UzRmUsLKB8dyrY+CTBudX9hFHUhq1/Qi7Aa
         4dhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777313920; x=1777918720;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bhDiK6qYw1rrEnW7/C2FzVLdYl35djd7wNOVBtB2jiI=;
        b=DtYWUiZDej9ObdjjKWQchEOqTExHUNelOx9Umr14SDDZRfKiax+4aNfpc2zsEm5SL6
         sXCChQgw/FY5HdBpmLV7dybvfVq4DvS8OSRc0CCpUtLMiImPXRXKrtaDrkWEdiFIloc2
         wmut0a8bax9VcZMkqi+NOjhtJdr4akpSE4VLVdsvrRhc94DXBr9FVU3BLdjk+LZDJVJL
         YqbrDVipvdTYPgd63fxLY1k2RrQvzSLyP1x/dNEUYr8XEYWNElf8ekXoj2JtquB2kzGX
         EHsLk9ykNhB37/MWEbgkvtF+GUcg1Fq7RF530pU1+Wo0N1D5dKkZXHBGjUQlnYIV1Rma
         xkSA==
X-Forwarded-Encrypted: i=1; AFNElJ8aNWfig81bgPrTFC6/T8PNbWMqlX2WWiLs7TE/qBLwtNhObeqObCo/3O0we7OpJfeCboII/ys4kpjO@vger.kernel.org
X-Gm-Message-State: AOJu0YxankjclGufucMhbf2CJx9B3H3cNnvY4gcklIjPL9EiLFdCiz38
	FXL7hew+ttH011gAlfG/Dmt9diATRJFpdXL1ZNYP+5nowUAWPTZ3St7tjR2uMPKMl4fKOq/kf0f
	BKGH6dEGQCcLnw6ep9uEbRuHf/boKq/EUQAv7AW/yg3k8x/jPh2+21z6HMsmMEiIj
X-Gm-Gg: AeBDieskonP9v8ch327KTp9zUVz58Y2hPyfMwHJC57jn9I63m6jU2+S62p2BFvy2Edi
	B3lMVlSE/Uct9OMxfR1VGMxf7BoKwHJhZovezxqWme8vQqTwJqINFs96DI/7/tVSf8RDgrxjO40
	NSoAe6tJBdWJqr66ok9aZavDmuyuiPWoIG6hDgAh2VgJKdYodM0tDhjJxnpSGTkkp1H7DOuq6da
	7+lWQ9Y8IQu83v+JmeAJ6itPvcDsnnpdyVfZFn+4RXAi0UD6QZraCa3xOSYHxzR+LVytRnckhxr
	L//QXmb5er6yz04lTCD2RszrPRL7ld8V/sKh+H6O4ln4vtzyU1EhAMlO9mCn5kJuGju4I6k+OGQ
	4TNlyuSyX0nKpqBInNwgc1a/Jx6zSum+ppk/eJqBkxUexQqsj2f/P/ilS8/J4KidXcG6ia671ZQ
	zdsux1jTWiAF4B5MaNrhiQP5R6kd5VGwRZnjGKPSspEBLbOg==
X-Received: by 2002:a05:622a:a06:b0:50e:a1ab:67ea with SMTP id d75a77b69052e-5100c9c1990mr5796251cf.40.1777313920413;
        Mon, 27 Apr 2026 11:18:40 -0700 (PDT)
X-Received: by 2002:a05:622a:a06:b0:50e:a1ab:67ea with SMTP id d75a77b69052e-5100c9c1990mr5795531cf.40.1777313919851;
        Mon, 27 Apr 2026 11:18:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187e7ca0sm8312126e87.65.2026.04.27.11.18.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 11:18:37 -0700 (PDT)
Date: Mon, 27 Apr 2026 21:18:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Jie Zhang <jie.zhang@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: hamoa-iot-evk: Enable Adreno X1-85 GPU
Message-ID: <daceahzxbmwmxxnyvx33ojhgwr3x4n4b755sysaz63brvw2qih@zcrybuy32ozq>
References: <20260427-hamoa-evt-gpu-v1-1-5434b5be76f5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427-hamoa-evt-gpu-v1-1-5434b5be76f5@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE5NSBTYWx0ZWRfX1/L7T6xxlgVO
 PxXJeYpEaIsnPkK1eRwq68p8xFY35hb8gLjP6la1jfqnVR+rDdZUKyntXEq2xTV9t0EwFf8tsyU
 ziZ0Rx73sM/FNCe6/1AhAE0pEohfMrH/tM32pMxdmOurmu3LI6MGAAtyBoZ+rNQi1LS4PFWwKro
 FXI/6/dPmDFh2vxJ+lckzUrLLVkmOzcyTpK5FqiJgPukWHIBIrWPPJSRlcym8LYTSzc1aRMMw0G
 xAtZroJyBkfa6XAa2LFQpY3llY2QUEuiF0YXKLrvGLrXVfmvWNvJRNWOeuYULlgbjjAhDEcYZQ/
 vxq9qNvSmBQ75UcV4KjpvGVBuemk/Ar935WynJPDlZJY4yiSwJR5N01no42WZnZaBsakxdkBK/A
 VT7fKr2s9YKPzOnq2TrJPYL9n0Pn76Ii9HVP68ijytEq0NJ23NVnRONKVcAHQ2X/UcQ0QBZLSIP
 brsJlCZa2GlI/92ar4g==
X-Proofpoint-GUID: IjWv9c0Ikwhif60f1jD56mRohpFfs5oM
X-Authority-Analysis: v=2.4 cv=efANubEH c=1 sm=1 tr=0 ts=69efa881 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=UQAiW8fk4jwks4S4FoYA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: IjWv9c0Ikwhif60f1jD56mRohpFfs5oM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270195

On Mon, Apr 27, 2026 at 11:23:53PM +0530, Akhil P Oommen wrote:
> From: Jie Zhang <jie.zhang@oss.qualcomm.com>
> 
> Enable GPU for hamoa-iot-evk platform and provide path for zap
> shader.
> 
> Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
