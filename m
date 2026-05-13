Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4083B47E0
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 19:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778699908; cv=none; b=igQFitbvYi8ruZfQBSFe7Ry4wIihJssXaal4giQRaaCCbQF3zV/do01V4vvqsFfMXY2ZOgHCbRiqfGxSJF2KN+QmRYXw8J6HizOfzD+P7iWM7o0Ktpc84ZqyEorjYBh08NGUVA/FfFYfI2Ux9ISOoQEg7DOSbSCsDX424C7P6XQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778699908; c=relaxed/simple;
	bh=TOFV5FhHLTg90n8Ys2jf0xrJ28wQs3Tgz03VtgjgC6M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fqc/01/iNYexwIgRUoilxSVS//AXxPKV/GOpavn1IhW0ekVt884Bt+FRmChcjwODdjkQdLXTJYNd4TGQfwwb75ljlLtwdm+stQAsMJ5ekzvdE0TYB8wPQLeqLcfuxInnE8oro+SNSb+oJLuNNP8t7yC3uWaaTcaRmEzXlbBxyag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fC9U2hIq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Np0VhrQH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fC9U2hIq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Np0VhrQH"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DEd5ce3474786
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 19:18:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dPgTJ9BxVj52ozj6Tom5mPIW
	gYq2r83+vLDiB7tPbgM=; b=fC9U2hIqlrwbWq+tyK8jBrdx5YSB/8GCiBVx+oxa
	Vfdpv9GYH5aW769O2OO3xvamqnkKxhNmrPONO23qZBu8Bi1xMmn0CQdR155rmULY
	rv4xi7JzjeO1VYN516jJ4PC3+Tw/ibVs2QgfbZWF5WTOtTWgT2DLxuWOKWKLSnRY
	EKf159l2xFGvzl9K8EHIklIiLSY00hg6SI1VYgwYP9QsEq2kucCizcHvE2ZlEmT6
	vr8qMEjRLgNo1teIfVC+hHHcIBncKLQn18+/vbwVC9vWP/XiSKiND+vYEZ09cvWI
	qQR9KrB9SND7/UlnN3PInDLrcXyQoMzdnk10y0fu1wR3vA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p41ah7h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 19:18:25 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50fbc70cfbdso173044591cf.2
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 12:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778699904; x=1779304704; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dPgTJ9BxVj52ozj6Tom5mPIWgYq2r83+vLDiB7tPbgM=;
        b=Np0VhrQHtt+q86671yMKHOSRK4sYeJf7Owzv0qpGQ9hABh1qvlFOX3F8JJKzDgGL5e
         JzB7HkM35+VFatWfXMNQyO08XmnoG3N0hqNyVTEmAnCTBu0UGyasFdNkskRwqNVomcl8
         ApvGFCyXVyHYlAUh8YVwPGvbn6rTue7FmYiTxygRGqrFBGOtRkjIs/MJ8C5ecGp4P2BD
         FX7OOq4NZ1Ix7X2VMcRUiUX7Qw98raE86wTSLT0uUHC6Ksy6xmeRd2GAexEzzModC2Gi
         wrOSMVYvXUXu69JqGSoNVbfjcJXR/5G6RRv5LxzRsdRUaPqRYgx1Zm2l4/LALWonQalk
         A/PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778699904; x=1779304704;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dPgTJ9BxVj52ozj6Tom5mPIWgYq2r83+vLDiB7tPbgM=;
        b=R0leLYHdJZB54qTve6dNO7qffckXMoPQjG58CWEaoxLMI5ujogmh8oFnDeRn6+iOj/
         eo4ZVTAah+htzekXxdmPmDt+yZ10jyeLnPKW8CjFWQ+hbNVORKFvnZ0/AiXlCqCiZQb9
         pBEW/4n/HHrtJEmidCpFKNGWBXNN20FQE45nUkTl3YTKXXLzJ3O8cxJd+aSQvRDh5Q6G
         9BMjnet/OikoXEEpNQokK40dLITEHga9kCOmm0yEvyRJwoy6gFN2JeaKmD28y7KPK7KM
         yZAnqDpd/Jvl2uLyA5znMSFIwowU/3OIuzToU0lNtHBk1JJjUXAq7FAVKofJjSfVqHMw
         Hy2w==
X-Forwarded-Encrypted: i=1; AFNElJ9/C7XT4jilbYg8Xx3TPr187FCwKfKuwzoYN19TUZvldOyAOaxBIqGM9wNmCquDIfzA3hom7Zaea3PO@vger.kernel.org
X-Gm-Message-State: AOJu0YwjvQk0eQvESxvqxNjlSFANW8kqE4CA9wv8n2hqNJCb/iZiLbXp
	qEjmWFHsGJIPnKqkF01WouMLvp2mSnS2wydMolRZKQrtKfD1tbwaO+72Bb9sq3OQNPUyW+261tC
	aoh21iO7UaQaI8kZwsoKqddFF1gqYFEJh+56fGwA0Mlyw+YMozwUQYZMu/gCJL72I
X-Gm-Gg: Acq92OFc/JQsPo2bnmn7LI9YtJkTteNmTn9nP8zpKWPQMvpaQ+c/jzu8GuYedYL3tss
	Gfco9k1HBk5VlbvUlixbGHFDrTwk07C/LDeLj5JfSx6u/C5s2sUUaS2SfXEVRBDCPZweDkB0GJY
	RFB8yNzhoJARpkb8BR1AKf9L1HkHcPceS9i56K0yxVDqbrh0ZmQpB9LwAE3IyF7K9n96VghqZLX
	FV2yhJa56hmrhBgPn1CcDGYETgEWJpXN9flLR6UaK3Dp1nfQdiNkaaL5C5/iFq8qDMg2T0XXfBY
	e03pxTZeasyB4YTvilRSTjfeRTbnQjzNbGzfqFIbv0VfwNumlzHBADG90LoBpHahtY8Jy19kKnR
	lzjI/9S1fyogpZiFunhOmy2X+ztuh82C3Oy00BxIcjJ1Q3J1grl7hHyCfUnwNpfcUihJ8Yz7zyK
	RhsXuHzz6QXcMxEi3LmCCPxPdiLSc61S3iG3w=
X-Received: by 2002:a05:622a:190d:b0:50f:bc35:aae with SMTP id d75a77b69052e-5162ff73829mr61258611cf.52.1778699904294;
        Wed, 13 May 2026 12:18:24 -0700 (PDT)
X-Received: by 2002:a05:622a:190d:b0:50f:bc35:aae with SMTP id d75a77b69052e-5162ff73829mr61258141cf.52.1778699903767;
        Wed, 13 May 2026 12:18:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3945cab2808sm626681fa.19.2026.05.13.12.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 12:18:22 -0700 (PDT)
Date: Wed, 13 May 2026 22:18:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Subject: Re: [PATCH 2/2] remoteproc: qcom: pas: Add Shikra remoteproc support
Message-ID: <g5wv5mi25l7jyq3vbe3dovriyxguw22m5uvyslkbjbyprbxfnq@kep4x3kxeqmj>
References: <20260514-shikra-rproc-v1-0-9afdedeee002@oss.qualcomm.com>
 <20260514-shikra-rproc-v1-2-9afdedeee002@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514-shikra-rproc-v1-2-9afdedeee002@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=df+wG3Xe c=1 sm=1 tr=0 ts=6a04ce81 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=OX9z2a93DQOUP5chVv8A:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE5MSBTYWx0ZWRfX2xAgIZ/ANEzs
 TbJlJnzpU+Yao/kCJYj0RcbJxrYbzoxDDwzBvOSfc1OCBglC7mDdJ3PIN2XF6FioG1BF+wbWWYF
 NKfGxhsVcYfQRV9Z28kR/HocFyntRJ62auDqy5nVqO697CAnDXY6U4KVPwYup/hgEfNPqs9tA4p
 KtADF1hDaiIH6tYVmStriOZYvMrhgGshPzrYbCXLnZG9/6jBMBrFHhtdAJeZaLNuvGCMYyUFaPt
 zF/71jDY1KavOcxApjORKMS6HE8RzDFhlzLpd/fsR4A4k9g+FNQN6/JniNoHv4iLn0cuK6EVQly
 mHvh/zMkggOTmFtSGvala87urflC3Il9lj7aC/7M9pOGKvc02SFZjR9G9qwWo3lNXLBspXPsVKO
 CAQTY540/wruuRecctrvTcdbFsvFHQOgs4hsPqthxe0OxJu7rN/9YCqZC3Khy+6/LgAD5gsMyCr
 /ySTf+/0pi7hl960HcA==
X-Proofpoint-GUID: J0pPj7ODYJivWWVTuJzE-L_Zv5QcYRjc
X-Proofpoint-ORIG-GUID: J0pPj7ODYJivWWVTuJzE-L_Zv5QcYRjc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130191

On Thu, May 14, 2026 at 12:17:31AM +0530, Komal Bajaj wrote:
> From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> 
> Add the CDSP, LPAICP and MPSS Peripheral Authentication Service support
> for the Qualcomm Shikra SoC.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 51 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index da27d1d3c9da..4d43201b9ada 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -1457,6 +1457,54 @@ static const struct qcom_pas_data sc7280_wpss_resource = {
>  	.ssctl_id = 0x19,
>  };
>  
> +static const struct qcom_pas_data shikra_cdsp_resource = {
> +	.crash_reason_smem = 601,
> +	.firmware_name = "cdsp.mbn",
> +	.pas_id = 18,
> +	.minidump_id = 7,
> +	.auto_boot = false,

Why? It should be true for CDSP.

> +	.proxy_pd_names = (char *[]){
> +		"cx",
> +		NULL
> +	},

Hmm, SM6115 didn't have proxy votes here. Is it requried?

> +	.load_state = "cdsp",
> +	.ssr_name = "cdsp",
> +	.sysmon_name = "cdsp",
> +	.ssctl_id = 0x17,
> +	.smem_host_id = 5,
> +	.region_assign_vmid = QCOM_SCM_VMID_CDSP,

This makes no sense without region_assign_count

> +};
> +
> +static const struct qcom_pas_data shikra_lpaicp_resource = {
> +	.crash_reason_smem = 682,
> +	.firmware_name = "lpaicp.mbn",
> +	.dtb_firmware_name = "lpaicp_dtb.mbn",
> +	.pas_id = 0x56,
> +	.dtb_pas_id = 0x57,
> +	.minidump_id = 0,
> +	.auto_boot = true,
> +	.ssr_name = "lpaicp",
> +	.sysmon_name = "lpaicp",
> +};
> +
> +static const struct qcom_pas_data shikra_mpss_resource = {
> +	.crash_reason_smem = 421,
> +	.firmware_name = "qdsp6sw.mbn",

Why is it not modem.mbn?

> +	.pas_id = 4,
> +	.minidump_id = 3,
> +	.auto_boot = false,
> +	.decrypt_shutdown = true,
> +	.proxy_pd_names = (char *[]){
> +		"cx",
> +		NULL
> +	},
> +	.load_state = "modem",
> +	.ssr_name = "mpss",
> +	.sysmon_name = "modem",
> +	.ssctl_id = 0x12,
> +	.region_assign_vmid = QCOM_SCM_VMID_MSS_MSA,

Again, this doesn't make sense without region_assign_count. At which
point you can use sc8180x_mpss_resource instead.

> +};
> +
>  static const struct qcom_pas_data sm8650_cdsp_resource = {
>  	.crash_reason_smem = 601,
>  	.firmware_name = "cdsp.mdt",
> @@ -1571,6 +1619,9 @@ static const struct of_device_id qcom_pas_of_match[] = {
>  	{ .compatible = "qcom,sdm845-slpi-pas", .data = &sdm845_slpi_resource_init },
>  	{ .compatible = "qcom,sdx55-mpss-pas", .data = &sdx55_mpss_resource },
>  	{ .compatible = "qcom,sdx75-mpss-pas", .data = &sm8650_mpss_resource },
> +	{ .compatible = "qcom,shikra-cdsp-pas", .data = &shikra_cdsp_resource },
> +	{ .compatible = "qcom,shikra-lpaicp-pas", .data = &shikra_lpaicp_resource },
> +	{ .compatible = "qcom,shikra-mpss-pas", .data = &shikra_mpss_resource },
>  	{ .compatible = "qcom,sm6115-adsp-pas", .data = &adsp_resource_init },
>  	{ .compatible = "qcom,sm6115-cdsp-pas", .data = &cdsp_resource_init },
>  	{ .compatible = "qcom,sm6115-mpss-pas", .data = &sc8180x_mpss_resource },
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
