Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24DC2244661
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 13:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783602221; cv=none; b=N4FvcOzzyWC1dIlLhM4qoy2pSqOmjpUwJo+EUSYsmfoeC8nujjYY6QN1+ATEX24j0MAsM+eMjyzXVQYAYl4DIFRj3ERS/SIav/9t/TqrZ5O/BslmtQz6gSQOJvzwwOQALdtJ7+o2uRw1N+LwNidEa6q60Ie5cwQBXTwDrlqo81U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783602221; c=relaxed/simple;
	bh=WnckAIHlaTmAFvP6s1AxpeWPyK4BmV81YD7bCW8Qmuc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BPScdIyXsvdRhla3O7rD6q+yFSjEyTdb8zPZXhCTeLg0w7lWUc9B+F0IQ0nAp18D22MOwW+DsKM8HL3OA5ysFXagQxFN38FU5i58NNYJPSAy4iid3ZWaEqQ8xhsqeUYxnmAfCtsUQ4FqowYDJkvYJltK5UDWF6UT+UQjPPO/Nlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qw7ua+O+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CA1/HDe3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qw7ua+O+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CA1/HDe3"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNV6B1667893
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 13:03:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6hes+AyfmlrE00EiSFN67s5z
	YH/93a114Q8pXjrH7gY=; b=Qw7ua+O+UB3grvP+67fYmPnISpR8ncdbPMkGqkdF
	QUdqZDCzWKWoWeJAaby3Gic0piPCsP7cOB9cIOgyxDkGeUwzQpCfviJntm3IuQmg
	wl1dSOx0btaMqZylZOY2UUCqWqs8fqPXoR8CTQXOXUh8St1qncbKPK3eR2IYP0MG
	HoDBmROOcjC9JUoALmWQixEL/EvVUkZu2zNJAzZoxjHgcyfcN7qNLfsHHkA+pgRh
	T8nO5tB2ggpTK4khhUnQtHQvGGxzoqacwv38pvFcb0WCANIVXL+jtsAZqYcd5JHO
	RbXDD5KeNC5sltWs5VJwQ+Ez1AfyuE7DWsV5hE5QBUrwkQ==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9ug6kv3h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 13:03:37 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6a0c02365c7so2747585eaf.2
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 06:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783602217; x=1784207017; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6hes+AyfmlrE00EiSFN67s5zYH/93a114Q8pXjrH7gY=;
        b=CA1/HDe3EXjLiJcAiu/7vAnnkuk3CZIzsmTjCWhcyqJbb7lQGDtTFIPrpACtu+jFYF
         ONb/p/8RaEE2vFmNIGYWbnwmAUuM2TBNsMAxxlx3pxgS66VV1+835HFSoazn/aFPUOvS
         Cd6tGALYdr1mpDqd9Vft8FT4If4NKSWh0ANWixkeIv8wUp7H4G2sHyHlxo+skCNKzWay
         1XjXABCVwKoHoB4exBhttLiaqRBCWxlVrBu6YV4dwxXOMPH7hpltCRBmc4jl9DO/bR/A
         Va9SO15kPGCuaJN5p5dJJKmj0ZX6kBKW+FMUVPErUL+TzZOCT+qZXmdATXbkH3YqzJO9
         R5Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783602217; x=1784207017;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6hes+AyfmlrE00EiSFN67s5zYH/93a114Q8pXjrH7gY=;
        b=lqAsvmB/kyYC4AHpn+qbD6ucDhOaGX+tlpSvhefZUev5k+lZ3p8VsM15mUNiO29pf+
         CT/cfcwjJJM4lUiHvUO0s/Rfccu6GxACMeZiEBmLC3u/Q/bdYgby5bIVKmnDCbwDPDnx
         4COI9NMy9RflE0kzItroj3OCXMZT30wQy2AKOQxFMZH8KDT13DURNKI1/kGsT3Yy9QnI
         1g44Awt2Gc7AnRWQC3plvfqMv5qtbSZ6dvQv45d6sD1XLlAUhZ6fqdGEsVLOvDGxbgIW
         KTBlZaBvpkJLZ6lrIcs4tnw+KrcBb5o3pUiZRBcBo8cB+z7ReO488gZgtse94XYnsw6R
         omTA==
X-Forwarded-Encrypted: i=1; AFNElJ+dLy5+qp0z3bMMZltsF/zgqSeNb45mVOma6E/0TQxf3xv+6tU4s/7InyCrzSzCOkW4sQQ69tKuprLJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yxip2jFzQw9HDc+D95jy8//xaDPs794f4bcESOHruKdvvMkDY0/
	PYU7wLTba4OsRH6tOIJLtlE8YuU5TV1oLaE9sHY9UGiTU6R9NIv3YPJmnZOdeur08NJlaJolLOv
	IQy04XIdOzuJGxLUb6DehJgJZLQky4JyGUv5lMq1mswwpO7lzhW0EbLpdeaYqwip9
X-Gm-Gg: AfdE7ckhJqYFCBVvkwKjaykfmcirZMbQ9gtwANtzUq+K9pHafUSu4iTTRobVG3sqhdD
	2afPrzKL/TV9dDIKKAmZkve0QSUi41TPBE6VaiMwt7OuHdMLiOQ8WUH6VGkRHeAhUiQT6wN09Jt
	qAjMNIzJ0WfIzZWXQtQNe9AnE5XoPE216smde3mk/ct4pDCM2Vlzlof7plNBLpTatgbTZmd2bry
	o1ZyB2qLm4tTPmaE+JBudO5e5lAt3bhBkXIiVojT0YTnx+RmgJYW9/Wf6Ucv9IYEa9+pqWjmMPK
	m+Ocksxy3zTBDKFlUNfwZ+Pgtl9T0ha1QjCuDPYE6kXJyoCV4tNP4KuSMuRNVNpr8QykszcfLyt
	4lOSW9xzawwDuzobGB7cOQnIwCujDTz/j0eoHWIoMMtA5so1tELBOVD3uGBjoxUePFFmSdv+tr5
	7SdTpJIh9UfBOBTGVDMZmoB7Uw
X-Received: by 2002:a05:6820:2d42:b0:6a1:7644:772f with SMTP id 006d021491bc7-6a36da2e65fmr5613940eaf.63.1783602217187;
        Thu, 09 Jul 2026 06:03:37 -0700 (PDT)
X-Received: by 2002:a05:6820:2d42:b0:6a1:7644:772f with SMTP id 006d021491bc7-6a36da2e65fmr5613861eaf.63.1783602216506;
        Thu, 09 Jul 2026 06:03:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c849180ddsm3055701fa.3.2026.07.09.06.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 06:03:35 -0700 (PDT)
Date: Thu, 9 Jul 2026 16:03:33 +0300
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
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [RFC PATCH 07/11] arm64: dts: qcom: hamoa: Move Iris IOMMUs to
 sub nodes
Message-ID: <3t76ahxtn6e7rhxzxtwhbgq26tdztgfow5kh6lxgtmtr7mucxh@dydqcmawo5g2>
References: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
 <20260709-vpu_iommu_iova_handling-v1-7-72bb62cb2dfd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709-vpu_iommu_iova_handling-v1-7-72bb62cb2dfd@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEyNyBTYWx0ZWRfXzIS8t+z6oPv9
 jtG04D6Weq94hwZ2VQCV4zyZ4cbzr4UpHMkZjOHUA5QnIuTKnz7Olf3wES+OdfFG9Q7AeSuxIIs
 L3SXLnFVM//u0wzdEzVsEnvUBZitrT4=
X-Proofpoint-GUID: fGqj_I2Hwu3GjGdJw4LIM_FevbKK4RU1
X-Authority-Analysis: v=2.4 cv=cL3QdFeN c=1 sm=1 tr=0 ts=6a4f9c29 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=e5mUnYsNAAAA:8
 a=EUspDBNiAAAA:8 a=KY5bm7jO3qav85b11RkA:9 a=CjuIK1q_8ugA:10
 a=k4UEASGLJojhI9HsvVT1:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: fGqj_I2Hwu3GjGdJw4LIM_FevbKK4RU1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEyNyBTYWx0ZWRfXwv7lQ9/K91JX
 hEOhJgW26q5ROqW5lW/02dhZy+/711e9OFHTLt6FqdEchndf8EkQEjsN+ih1N4y1ztmMxpYJFwG
 +QrYQRFH+2nQxA4Spi/3yoIUFm4owWk9WX3EbP5+DTzLmTJYWik+uwm1+J9GsWhUZfEudoBSHUS
 FLXa3ZCg2WalGJAA8hdmiMy9hWh2cFJHkPknk5mnIkqXvz02Ym3W2QbV6JSiTyQlebuPQav9jEn
 vyKKE0uIPpqEY5DhEJAX6QX1lIdYtN6RU6e4GA+oWSKqbWL4uMAe0zmRKr4R2OQJNXOncV+BjJM
 Lixsf8eiIs38uEBHKNd5kyNUEN7Oib/k3+SWCZgsH/3Yh44zTB1hyLpeFZQOuZhN2V4HOOA8ZBT
 C4BKgqAoUq0pbQGnVrp0TCZTFgpqhKgG4Hi5/Fnwby/rWf07Rit356AorM186/tQuwQVJFrUxd5
 o0QWR2jnaXrABXYL96Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090127

On Thu, Jul 09, 2026 at 06:05:53PM +0530, Vikash Garodia wrote:
> The Iris VPU has separate streams with different IOVA constraints. The
> non-pixel stream must be limited to the 0-600 MB IOVA range, while the
> pixel stream can use the full IOVA space.
> Using a single set of IOMMU entries for the Iris node does not describe
> these per-stream limits and can allow accesses outside the supported
> range, which may lead to device crashes. One such issue was reported at:
> https://gitlab.freedesktop.org/drm/msm/-/work_items/100
> 
> Add non-pixel and pixel child nodes, move each stream ID to its
> corresponding child node, and add a reserved IOVA range for the
> non-pixel stream.
> 
> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/hamoa.dtsi | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> index 60f485a4892e062980d01f0b930af4b02f36513c..a2baa2c9f46dc19c3db11dc784358223a035475f 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> @@ -657,6 +657,10 @@ smem_mem: smem@ffe00000 {
>  			hwlocks = <&tcsr_mutex 3>;
>  			no-map;
>  		};
> +
> +		iris_resv: reservation-iris {
> +			iommu-addresses = <&iris_non_pixel 0x0 0x0 0x0 0x25800000>;
> +		};
>  	};
>  
>  	qup_opp_table_100mhz: opp-table-qup100mhz {
> @@ -5435,10 +5439,11 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
>  			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
>  			reset-names = "bus";
>  
> -			iommus = <&apps_smmu 0x1940 0>,
> -				 <&apps_smmu 0x1947 0>;
>  			dma-coherent;
>  
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +
>  			/*
>  			 * IRIS firmware is signed by vendors, only
>  			 * enable on boards where the proper signed firmware
> @@ -5446,6 +5451,15 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
>  			 */
>  			status = "disabled";
>  
> +			iris_non_pixel: non-pixel {
> +				iommus = <&apps_smmu 0x1940 0x0>;
> +				memory-region = <&iris_resv>;
> +			};
> +
> +			iris_pixel: pixel {

Unused label. Also, shouldn't you specify the IOMMU region for this one
too?

> +				iommus = <&apps_smmu 0x1947 0x0>;
> +			};
> +
>  			iris_opp_table: opp-table {
>  				compatible = "operating-points-v2";
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
