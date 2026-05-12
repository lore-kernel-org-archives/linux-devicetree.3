Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C413C0A1A
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 17:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778608495; cv=none; b=g9u3gjTVaVecFOuaugBDTWOXD0EUAiG6WW6OnkPUThkmY1GRW6lMWvLiNMA+NYghiuxCupJhsHti1M9VdsXf7Zt9i+OCdFSMRj9EyTf4g9sacXihNkWRIMtW3V7+CZElFA8bc0MTlLgHMLRiSx1xWmvo6a1vKSJJm5CvHQIxisM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778608495; c=relaxed/simple;
	bh=3+8jnK8XI2iwZthPRjCLqFq3mERrWJmHeszgeFA7XlY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O9abARZJmaZl6nlpyH7sybsRQG2PjepuY9cBDnPqxaOJ/5bkPepRMUD+Bz5WniYLXL8w8/EMbk2lETBUZPQHQ0oTQ5IfuXlJz+A+/v7cg8mleeKa6ZVPUZod5eCrriUCsLJEI1E+CmSjd9CMKR+qZK0WcZ74m652650vMQrOOJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B5cFxzmb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F2SVeQej; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B5cFxzmb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F2SVeQej"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CBxJIc129096
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 17:54:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dTPg8xs2E+E/JBOzkf2F2fve
	OOKD8h9RFmbi3eb+g9c=; b=B5cFxzmbhn7c4C0999w44OMYa2O1XJ2SURV5PLvS
	Wfh3NUVja3dyCCOrxpPZvpbIEYD79Pb7MKINbgU7MVFab3MtrggAJW4Yd/nZPm/A
	1sSLp0l6ciqgOdM+mcRO1K+VPS+93S1FhET2XBkYibYhQgmawLTSqMA0gYAFCDQp
	s7xPUaD+ipxoOHtEC4dbb7v3qQbLuIftJd113wKtu06X9z2hg7zHUjt2KQznQ9Z4
	zv1emP/BIFKBMw97P4I0hRV4BWkGEXSBjsoscD1Rh8HyWDoX4MqYtbV/6ZWFnrD0
	Qm7Arpo0c2bB29yWnYe08c+vVFgyqI1vScPW1CSZ6anV/g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e43tn1cu5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 17:54:53 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-514a182b90dso40884291cf.1
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 10:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778608492; x=1779213292; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dTPg8xs2E+E/JBOzkf2F2fveOOKD8h9RFmbi3eb+g9c=;
        b=F2SVeQejiEmvOkyE1Q++gTaJMZFn1WpMV+wZCfMCki7IaNNJhQ5/j1ztmLrvcjtNCV
         n92CHSjPpxL9vcVi90jw1WxqnfaQXFMvcRxRAsQ2WSY1EFo6emI7JhABt2zyOOLH/s9A
         aVsvMCh4uFy5vpRreu5t12WWBeprWj3zCmbY1MmnMqr5b/gJlVVPoaP/9wrBGYELyd3X
         yewWxgdScSyGUaxYvNScuOujv7Olu3rUo8tGaIKbteDx8PFMOKxwUXO7sJSRMN+6/JwV
         tm+K6RtF8HPjCGi+QA0em39JJBqDhKVSkjqIyM4pT3me9CV+aJH4RfniH3FKn0Tdwt+8
         GFfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778608492; x=1779213292;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dTPg8xs2E+E/JBOzkf2F2fveOOKD8h9RFmbi3eb+g9c=;
        b=oYsnN0sILg2AE2S1UG3mUGj0GHihXmEyakmFvuXhy+DhJBPd7bpvbWJrJprBuNJtqK
         zNZkJdsRMV11Nkz9pZYRrDMfShunOldl87hZ5QRQlTcCDst9O4ewTFm8CgdwFWiv8fRw
         3RcuBIzwMoI3INL6BKcxDCJ32Nwod2oYVycdNxoGyQxoPmA9fFZxcR79auQFogs/Qohv
         +WAcz1FCh3InvacChabDXKL2IhDVG4nppnYRzZ4NtecXL0dnreNllc1XM5msSOgMjQJG
         n1cbxg9UEgIYG/k+W8fQPbwxxCgcA3pgCwmgUVGt//gYOmaYhquoNAVX0w8ZaPrbu1VL
         ZaUw==
X-Forwarded-Encrypted: i=1; AFNElJ/gRAjOcZIKiv9/qhdRL+5JS5oG1Q04femwV2vutqF5Fj8GNEJR9Xg3fdyoGCcdXiJSxodx5zpfOXxH@vger.kernel.org
X-Gm-Message-State: AOJu0YxPrmcmTLlvKFrY7Fa7o7RYp1MRbwklFbCls/mQywL/Rc9nWQOb
	BAtvlBRiGA+Or46T0nRE1al1IRebJNAOpEAo4/5KhAL4q1s+wJzY3S8J193NlcAaLfCetPt9DnR
	zk8NegGauF6hJTmV98eIdnksBqOps8ls87KiiWlsczhpsCAb0+84rbmDWwjVs7K8f
X-Gm-Gg: Acq92OH835sQf0XXgyQejjHPHBNz3L1SWvsPPwxIBmRFX7+bHfeEgC+a+WZhJYs1dzM
	EGEuZQlfArhV/+PTQGtF/JRL8XLYIqYVcFkuYUGkCggatlsQCtRxUJc/pJzJa8jop8+UHauUGA0
	wQ+tmuMySrcqQh2IN29KwCL5jiX6Nh4kvFIRtB+BlBA27Unw0LZJJJfdZK4xnFdUBuPO5SQVbCo
	MFKYsDLcua20JsH3v9haHpCn4IxFvPCMYk1RqATvPocimvHttBsl8pLe9nTEYgl/Lzago3PsYFo
	ji2hf/IRLyBEoMN0ePitVVQgndXmwzrkgmTwkcxKbDcCxI+/3yO1KMVIw+cc6QrT8kavFdXOaEN
	9mGX+dxhyits21JO0bqIpzXB+rJifo+i0G45dKbkWgozNuUBDWzYVJPTiDDbHOKcVYtXhKnEr3o
	bRvAMbfDMGKAhK8dFfMg+gCyG8wuWiKawyrSM=
X-Received: by 2002:a05:622a:188f:b0:510:1543:31e4 with SMTP id d75a77b69052e-514621e9218mr416223831cf.59.1778608491872;
        Tue, 12 May 2026 10:54:51 -0700 (PDT)
X-Received: by 2002:a05:622a:188f:b0:510:1543:31e4 with SMTP id d75a77b69052e-514621e9218mr416223291cf.59.1778608491227;
        Tue, 12 May 2026 10:54:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8c66facdbsm2073776e87.28.2026.05.12.10.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 10:54:50 -0700 (PDT)
Date: Tue, 12 May 2026 20:54:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 7/8] arm64: dts: qcom: hamoa: Add inline crypto for UFS
Message-ID: <s4mb2v5xbbt2ssbo2ji5hkyuc66sgiemegj3uv2lybepm7regb@ucd3fpbbbuk7>
References: <cover.1778498477.git.harrison.vanderbyl@gmail.com>
 <3ef6b7bec298de5109296a9e64d12b896e017d0c.1778498477.git.harrison.vanderbyl@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3ef6b7bec298de5109296a9e64d12b896e017d0c.1778498477.git.harrison.vanderbyl@gmail.com>
X-Proofpoint-ORIG-GUID: dICLM1PbA35ZYNYEnUr8S9FnqCggJxS3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDE4NSBTYWx0ZWRfX+5UEHoS2PNST
 hW4bbsHUwVHAA0x6gOEhaoMb3gUMlZD/oweCck6zLhOwYNt7fykRHcFWiPkaVuGQzlWVgg6hsIZ
 pt6/rX4n5Cum4Hz86S8ciKV/IHMjAG3UjJG3uwOth5WZrowqJutQtytkQKqsq0zmfnV+nb8dD5Q
 n2FKE63SRur9NxnSXXdyqJ0fm8/QnT80rOG0LKm+N6bE1irekoR4GK/Z2KZ//HZ2pZuG9D9cRBM
 NzVgkRcmZUNfEIP05ZXXZsdyVW6dF/O63/fPSeh881zYAQBPaWdgly28avKnLp1I15kd1yawP8P
 lC4ybwgOlEQ5az7Uuzg7Ejtz4fnbMYFRqIlJO+srhksSBDO4BNA+Mdcw55aokvNIwE+lclWFLQE
 UM4r3ol8JC0cNjnIq7KKd2e3/k88fl0N2w6Q7kbcYrrxUm8p851pEESOz+7uE5V+kWjDovW6shF
 pQDnfs6OfM9K8T7JYbA==
X-Proofpoint-GUID: dICLM1PbA35ZYNYEnUr8S9FnqCggJxS3
X-Authority-Analysis: v=2.4 cv=Ebn4hvmC c=1 sm=1 tr=0 ts=6a03696d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=pGLkceISAAAA:8
 a=MQIoPJBItOCSEHx-f5MA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120185

On Tue, May 12, 2026 at 12:40:56AM +1000, Harrison Vanderbyl wrote:
> Add the Inline Crypto node and wire it to ufs_mem,
> enabling UFS storage encryption on x1e80100 and
> derivative SOCs.
> 
> This is needed to support encrypted storage on
> the Microsoft Surface Pro 12-inch.
> 
> Signed-off-by: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/hamoa.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> index 051dee076416..35755eabe549 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> @@ -3952,6 +3952,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>  			phys = <&ufs_mem_phy>;
>  			phy-names = "ufsphy";
>  
> +			qcom,ice = <&ice>;
> +
>  			#reset-cells = <1>;
>  
>  			status = "disabled";
> @@ -3997,6 +3999,14 @@ opp-300000000 {
>  			};
>  		};
>  
> +		ice: crypto@1d88000 {
> +			compatible = "qcom,x1e80100-inline-crypto-engine",
> +				     "qcom,inline-crypto-engine";
> +			reg = <0 0x01d88000 0 0x8000>;

0x0 instead of just 0x, please.

> +
> +			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
> +		};
> +
>  		cryptobam: dma-controller@1dc4000 {
>  			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
>  			reg = <0x0 0x01dc4000 0x0 0x28000>;
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry
