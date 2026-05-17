Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE713CAE73
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 17:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779040132; cv=none; b=pJFis93tMttePqRoS8VZJUqHtaLoOTu/wCbAjlbNFwmjA5MtU+fbYBQ7EXvZLMBjKeUy30INEawJFl5EKFIOz70OMD8FEzZ1Sw/BLhZlHfuRLJSwdcncWjOw6NoUAFnghWnfqgs7s5baG4his44585egjCJii7qFLa5CgIVS9DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779040132; c=relaxed/simple;
	bh=LH31HdscTScQYadkTVUyNbrfZEMAWXcUK9ZjS2AH6/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HAsQySQOeAe0tCBD+RuuxxZrE1SU9irMgKFPnzPW8Hc0XroNjd/YeRaJwoIztNYE31A9N/IAIQBBt6pTGveaJo90uhJBl75sLucgBfUt61EQcBGGKxwaA7gNAOt+tFKIaes7E03I5CDAy/1JLroR44jezyT8qCjeGdYuj4wjVOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZAx3RNV9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V6NIYEwz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZAx3RNV9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V6NIYEwz"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64GLuE861779072
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 17:48:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lpHY7oihfb3amRFxiPEd1m3a
	03YdGFnYGYRDDtzyi7M=; b=ZAx3RNV97QNDaeDPBm0eQJO93jOxwpMPGzb/TJah
	dqsXoFDz51gjgpaSU8N7Qzp+AUA2My/19D6jWfO4UdtlZMVXDiUakPU1Ou3UfRaz
	ezSxF5WpCIwrtk0hinjywm2KTy9ROpY892QaKlyHKuaSAPGfH2J36oRJZA5cC9GC
	l0MsRguIRvO7luEi7zN1PiUnz7iddvoYHEr18Nn/7+tkGp3xaLi1kBJPfVqVfX1I
	tnwFwth+FR6U4sMg7cpfckuxWhhE0ko3IlG6rAfQo0QcygceqSX/l51jCphWDY6X
	vMlkZWddo7/fLJ/oFbO23EFnxIIiULneRW5J2nvgs+UpAA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gyw39yg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 17:48:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-90d6fe98316so369327685a.3
        for <devicetree@vger.kernel.org>; Sun, 17 May 2026 10:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779040127; x=1779644927; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lpHY7oihfb3amRFxiPEd1m3a03YdGFnYGYRDDtzyi7M=;
        b=V6NIYEwz9NvzjEcbllGkLk/HclKJdR85CukSlw2AUcSGSK8ANIOkQ1ZPl+MYzlLW/j
         5w+NQgn3eZVLc4/9bd4/bIBFz2yRUpBgu4TUUQFR5Xi2ioCbU0YdSh5pSSwyqS3o6eTS
         bsECC9znCWMPUX66+nqx7wVducKfd03lTmOxh2XhDdlwmRpWunyxMdEIHuSqLP/a6AnH
         kOTpx0+lYFSv5fHmdjJakztWB2XbdRZPFkLtC1RMmLBm2XFuO86U1V6+R0Z6bsZSeXWJ
         X5W91IxsEsZ9SetFuFxJKeGb04EMZlEqDlqcQUhe2Jx4SpSvZ5c8fTtSb8xcaTcSEDNT
         xSAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779040127; x=1779644927;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lpHY7oihfb3amRFxiPEd1m3a03YdGFnYGYRDDtzyi7M=;
        b=p9xzSYWJH1xjiEMmYTV30TWXsBSHqfPPNtPKo4kugV+fkirwb71WNU28cR8CzFChua
         Cqmm6h9ntWEAbhzEoWUugKrdmYGUXc++Jd7mo/4k3EhuMkjolS54tlTPiljn4EGTrzb4
         c+UXmO6OyGCuz0z9mv+KqGf2/9rYvRhFyLp0sc8stZKnSX2HREpsVcZNtDz+9kSj5SPB
         nHo+fAKfncxKo0AbwV84ROy8lhchNkEimywXjRItefnz6yGb5AGjVqzi3WGzZp2f4qfX
         Zv2dBOfX+BYmbimhKgL7wptlclwr6IOK6Dqlt2HomHB8QTD5XcBWYW462/F4PKGK6sfL
         LJRg==
X-Forwarded-Encrypted: i=1; AFNElJ9q9ppJPWs4rEuOCD0BBBOzlTmGRhKGKP+XxNISsI4WRx2WEgsX/beDiLh7U6+47FgT8W7OK3GfUsXF@vger.kernel.org
X-Gm-Message-State: AOJu0YzxFibRmnatGVP7a+AdopFJbn7P5Vei85niIi0eIOVywr+Yhyb3
	FrEWXWraSbG21J+KuBvh7DbzzRAv0P9h3Tp+eDquZ0iPqG/OzBKe4sEeH6VHYQ/kYaXFNJuYPLM
	cx4/nySXG+I7mdQKKr6Kk+1ILQHeUEwpdN2Ca89Z6mPZukMjqTzaHkRXH3fA2cIYz
X-Gm-Gg: Acq92OHaBE4NVOO67bliiC5L6vkUYXHr2yBjYgqUAxOR9JDdqrKPzglj3L+pFA3Hgmv
	B1tmrFWZPK99326nwBmVU8MyCYagDuGoZTXDd9T5W5tuyyM0EM1kUWj5kuDIbJcWFHR5CChcpRe
	sIuGxvLj7DfBjb1dzgC+2wWxIanVqrr62gqg0C6jCp4WEzwFi8+nuUPRWiMglOLU4KnJohLnGK7
	sR80ov2KIjc1eCkIlnKE3gkLB/omMU4X/J5Lq6ziOooSNzjFK3xmr6snOSlOApoJDi5I4KFgt1z
	8rr1TfxxY8NcmhS1CweEtSa4LuT2BI/807OzjBxQysv64pw31BZP8Zk5XK1CocIqu3q/EyC80zt
	MIONuf4WzpiWNn3zMaIE1qnKPWGldrv/zHoyqsAUsEC47awwUWmshvU7pqkvczkvIw6MzcVfM2f
	aSwFvzCj8pJ8NNO95EdwqBW9fMKjcZKrZZkD8=
X-Received: by 2002:a05:620a:2685:b0:908:e262:52c3 with SMTP id af79cd13be357-911cef034cdmr1880920385a.46.1779040127362;
        Sun, 17 May 2026 10:48:47 -0700 (PDT)
X-Received: by 2002:a05:620a:2685:b0:908:e262:52c3 with SMTP id af79cd13be357-911cef034cdmr1880915585a.46.1779040126788;
        Sun, 17 May 2026 10:48:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f10c797sm2804811e87.8.2026.05.17.10.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 10:48:45 -0700 (PDT)
Date: Sun, 17 May 2026 20:48:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 09/14] media: iris: Use power domain type to look up
 pd_devs index
Message-ID: <bh6g3vne2cnknvpeus3fmwjgyqk4ngstdn5fkvju72rd23lqey@ip2gt4hoqqmd>
References: <20260515-glymur-v6-0-f6a99cb43a24@oss.qualcomm.com>
 <20260515-glymur-v6-9-f6a99cb43a24@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515-glymur-v6-9-f6a99cb43a24@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDE5MiBTYWx0ZWRfX4WFWARt+bAKO
 f03beJXNhAb3EsJSW7MbbyVOrhFZkZ1jhnPv/Jbm7nuKm4OzR5dZjoPegN6N1B6JYNueonB6UYn
 CTa3d8D2p0wdXxIv0Q9V+m7mbT7Fo7WgBOw1tJZ0feJdASnWQjcnfq9jLXd6XGN/Z1Wsna6uizt
 rRpvPnDF3/sn+L6lPUGUKjyqReePzgx1iFWPXuqgotR7wkF7WJphJV2qOi9raNjeysLJScuIEvL
 u11+gao/xkGhb8Pe8n19CJul3prtiTpz9I5BO1m57JmZRm9jKgFUpwhUbEPBKwP4fT2Cld3506X
 wFiDFP9ob6nnTy4cmASNFSGxkPbqBzVU/AdeDr/pMNrz4igHNI9Ag9kn/45POJcA1b2lCH3dfz2
 leb30LdYz5Y+ZSezUeKAFl0lsoQrRhuVXxjbXBlrva1ioGUe+JUeSdhoCVYGinhj3YyYHyRVwTz
 LYgE9etoiBkQJHLv9hw==
X-Proofpoint-GUID: 3NBY45naFTTt5UI4FWu3A0erlIpdMDTm
X-Proofpoint-ORIG-GUID: 3NBY45naFTTt5UI4FWu3A0erlIpdMDTm
X-Authority-Analysis: v=2.4 cv=E5v9Y6dl c=1 sm=1 tr=0 ts=6a09ff80 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=wVukXIzjBZceI6JPWPsA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_04,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605170192

On Fri, May 15, 2026 at 04:51:24PM +0530, Vishnu Reddy wrote:
> The pmdomain_tbl was a array of strings holding only the power domain
> names. Callers had to pass a pd_devs[] pointer indexed directly by the
> platform_pm_domain_type enum value to iris_enable_power_domains() and
> iris_disable_power_domains().
> 
> A future platform may need to introduce a new enum value that aliases
> an existing one (e.g. IRIS_VCODEC1_POWER_DOMAIN aliasing the
> IRIS_VPP0_HW_POWER_DOMAIN on Glymur), which would break the assumption
> that enum values map 1:1 to pd_devs[] indices.
> 
> To fix this, replace the string array with a new struct platform_pd_data
> that pairs each power domain name with its platform_pm_domain_type. Add
> a helper iris_get_pd_index_by_type() that walks this table and returns
> the correct pd_devs[] index for a given type.
> 
> Update iris_enable_power_domains() and iris_disable_power_domains()
> to accept a platform_pm_domain_type instead of a struct device pointer.
> They now call the helper internally to resolve the index, removing the
> need for callers to do the index lookup themselves.
> 
> This prepares the driver for adding new platforms where power domain enum
> values cannot be used directly as pd_devs[] indices.
> 
> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  .../platform/qcom/iris/iris_platform_common.h      |  9 +++-
>  .../media/platform/qcom/iris/iris_platform_vpu2.c  | 18 +++++---
>  .../media/platform/qcom/iris/iris_platform_vpu3x.c | 24 ++++++----
>  drivers/media/platform/qcom/iris/iris_probe.c      |  4 +-
>  drivers/media/platform/qcom/iris/iris_resources.c  | 43 +++++++++++++++++-
>  drivers/media/platform/qcom/iris/iris_resources.h  |  6 ++-
>  drivers/media/platform/qcom/iris/iris_vpu3x.c      |  7 ++-
>  drivers/media/platform/qcom/iris/iris_vpu4x.c      | 52 ++++++++--------------
>  drivers/media/platform/qcom/iris/iris_vpu_common.c | 23 +++++-----
>  9 files changed, 115 insertions(+), 71 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 07cc0ce25b84..1d757cb8e9e1 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -70,6 +70,12 @@ struct platform_clk_data {
>  	const char *clk_name;
>  };
>  
> +struct platform_pd_data {
> +	enum platform_pm_domain_type *pd_types;
> +	const char * const *pd_names;
> +	u32 pd_count;
> +};
> +
>  struct tz_cp_config {
>  	u32 cp_start;
>  	u32 cp_size;
> @@ -270,8 +276,7 @@ struct iris_platform_data {
>  	unsigned int icc_tbl_size;
>  	const struct bw_info *bw_tbl_dec;
>  	unsigned int bw_tbl_dec_size;
> -	const char * const *pmdomain_tbl;
> -	unsigned int pmdomain_tbl_size;
> +	const struct platform_pd_data *pmdomain_tbl;
>  	const char * const *opp_pd_tbl;
>  	unsigned int opp_pd_tbl_size;
>  	const struct platform_clk_data *clk_tbl;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> index 41986af8313b..bcf873829fd3 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> @@ -62,7 +62,17 @@ static const struct icc_info iris_icc_info_vpu2[] = {
>  
>  static const char * const iris_clk_reset_table_vpu2[] = { "bus", "core" };
>  
> -static const char * const iris_pmdomain_table_vpu2[] = { "venus", "vcodec0" };
> +static const struct platform_pd_data iris_pmdomain_table_vpu2 = {
> +	.pd_types = (enum platform_pm_domain_type []) {
> +		IRIS_CTRL_POWER_DOMAIN,
> +		IRIS_VCODEC_POWER_DOMAIN,
> +	},
> +	.pd_names = (const char *[]) {
> +		"venus",
> +		"vcodec0",
> +	},
> +	.pd_count = 2,
> +};

I still don't think it is a good idea. You are using these lookup and
indirection to make _platform_ code take care about _platform_
specifics by the price of complicating the core and the core structures.

Instead it looks like it's time to push power domain handling to
platform code and then hopefully drop all IRIS_foo_POWER_DOMAIN enums.

I'm pretty sure that the clocks would also need to follow that approach.
There should be no need to bother the core code to introduce the
platform-specific clock type. It all needs to be handled in the
platform callback and platform-specific data structures.

>  
>  static const struct tz_cp_config tz_cp_config_vpu2[] = {
>  	{
> 

-- 
With best wishes
Dmitry
