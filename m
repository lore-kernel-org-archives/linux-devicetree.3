Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416613E4C7A
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 07:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791532409; cv=none; b=O2flK/CrHIAa7iE2YE92FgiVtb0H3nGk7TwlEWpS8TFG3G6wpy45Iph8KpJe2aSZJMGqM3eluAhLNBOHD6b4f4ZLeF/DyQG6XG1Nnt3NYuCjb3WaT1dTwXMsJ/agluMLMOOuJ6vAYS22fcUlP5QqwnEu0gwQUl7U7LiZWR40Nhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791532409; c=relaxed/simple;
	bh=G/vvd9mxZDnForomR/5H4CARhTx9tNdjXMbrALabxjI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B6OA3cn3tnc5oZr56n7mw8ZNUdGcnUuPWxdCVJTcCTrUb6+iC4RgzNDKFPucWM1geDtKTM8T14JHjhtoTThIxsMfSwUxdnp+zTvGjyHMTy9f05403proXfMgQFEOfWBWg2CkfcdVr8lOEWnzB4lqx0sQfP3vvepT6uoDojIz5o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eRtHNQvA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hY7HEu/Q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eRtHNQvA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hY7HEu/Q"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993HHdL451485
	for <devicetree@vger.kernel.org>; Fri, 9 Oct 2026 07:53:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3UKiKy6lRVjM8cH8ORwrZCTt
	rzXMU2z8fX/6JI8ilSY=; b=eRtHNQvAiRbKNoyIv27dFi6IO9sCBlix/nNXwaaa
	QjzK8xQ5Q3QglazVsrF+GMG+n5WBM66mwWmMwnBQSYMZmvWSbQxqqkwhUxjyBmil
	9mA8h/HKv+UZCGE8ImLDtcnjidrdx/aIQhApHbwJ2+z8hhAp/cZQ1dQ5D+lf+yKr
	zIz5JGPBoLSGyBobdri2m1YPi/XE5SIhLKHzM8jOyeUMGq6GhNALlxDqCSEZhniN
	5LbDIaGkEZOf/URkhdxX3lStC7vxH+dEfln1xwLMhEPoeCdJCn5hsZCUWh93otnc
	i0CC90SVbne1utOkNLB80Bb3DvxtgecGtd4YkLoCuyC3SA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6b9kkpr1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 07:53:27 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-34ef0362d95so12647333eec.1
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 00:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791532406; x=1792137206; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3UKiKy6lRVjM8cH8ORwrZCTtrzXMU2z8fX/6JI8ilSY=;
        b=hY7HEu/QeHORmi3xYtR8T4ewaG46cy7822OoeIV74TKslZbrvWUCvldb2AXfqHAVqK
         KeWZMn1hUF1ZgLa69NHY7dcwZAUgfiKFupnL1Qicro+Ag0ePke2dDuhLGQgfve9e/4HC
         r9ELTvkwVIMQgneT0h2KGX4xRMIfWZhnST+Mfje0GFzQF6vPzb/yx/xuvx+wvdU0TlzL
         zoSIPoPE+rCcYDLdQmPmf6Z1e8Ncon6postUiuMsIb1jdbxZowZjGXZxTo/P78QucFzI
         kZxq6bbaJx35ZGINBMhYbtA7XVZemszOFMmioTZ+ivMuby8BOgsWBZs5RWsDxf5m9bqU
         54hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791532406; x=1792137206;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3UKiKy6lRVjM8cH8ORwrZCTtrzXMU2z8fX/6JI8ilSY=;
        b=ASLJo9vrfwKo81SPl8AdwAXJw3KGUqVUjVgsIPM8wkNkoit+oBCo2CQlJLUgutWLWA
         AZFwD1WR5+Gxg/ofOGxGcK/KytoXuUBfeoiMmDjB4EU9eHMGP6+ZbO2vBR7ScysEvVJt
         ce+NxDmulVs7jT2hL6BvV0UKktmJnkTHmKcdxhV+0aZ2QJn2r/10spXW0mUXhANpiMNG
         chFlVEaesEi/+tutbE2uJs1Gom8qHLFf67cJiNyLFsJxJg1TDPP2eJdhW7MfHmuKreKn
         FRz0nnqkw8lLslK/thDog4Nw9G+Qo/j8v5M7U+Moovz32E2hFa9DUtFGPjOmkygagDIl
         pycA==
X-Forwarded-Encrypted: i=1; AKwUvBw+wy3Nr7lrL6hLL+bGDysQ1DLiACI4eOwtlNN03xtB7MrN9tkIjXL4CKHQQeNY1/QzvCL2Th1NnozS@vger.kernel.org
X-Gm-Message-State: AFuF++nSG7A/H8hG41uLO2WmWzEN//9BCQ0Da5j16ObjfbrmP+IVsE97
	MF0P0jox0S9jTGIdGBk0jme4qjtCdGgGT3UZgU3bhqE23mTD5XzR28J5WbndX5lNymOxOi7s7c3
	s4qcOVp9BYdFKvn4UA2qZaQEVytGRX+tv7GED962qy1hU6vkibQ0hidSXexxwAwE2
X-Gm-Gg: AYBFou3FOv7uppXTGG+L/kxgoio8WlclgnMRjYV4yJO4yJg2XZb3yltO/pdm1kNizFj
	E2JZ5deTSvcFqHnVxhUN8/0VYX9gFtoteyUsL3P32R01aE/sIKYI1+C0eafefFEsuS8ZxXNma9B
	kTsU8Q4gdVa4sPcwVXkrEs70l+TLJr/Gs2C9r0PEfbqLsnnrcnav332lrnNTRkarfQyXiBfzwqW
	dR8dn10yTl2wBQ7VC9msLrhzVx4msu1kscU16B9sOwbbj0iAS2TgbjRkpk38kFbc3CEDOjtKmrf
	QL1iBb9r0hHLrYZewCTfLcuo+h6BpUcHL3dofJC1hFUjJ/ZsCaWlYkAOdizg1NM4ZW43kNP/ZFD
	KNNieVSg5kjD3zNsTbm76UGXvXxXccLF5ODUtF3p8uA==
X-Received: by 2002:a05:701b:454f:10b0:14d:baf5:c411 with SMTP id a92af1059eb24-16a5faa7697mr1351023c88.14.1791532405956;
        Fri, 09 Oct 2026 00:53:25 -0700 (PDT)
X-Received: by 2002:a05:701b:454f:10b0:14d:baf5:c411 with SMTP id a92af1059eb24-16a5faa7697mr1350990c88.14.1791532405301;
        Fri, 09 Oct 2026 00:53:25 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-353810403e9sm3782878eec.2.2026.10.09.00.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 00:53:24 -0700 (PDT)
Date: Fri, 9 Oct 2026 15:53:19 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] remoteproc: qcom_q6v5_pas: Add remoteproc support
 for SOCCP on Nord
Message-ID: <asidb-ikeFXEXreX@QCOM-aGQu4IUr3Y>
References: <20261009-soccp_driver_dtbinding-v1-0-40862f7fc58b@oss.qualcomm.com>
 <20261009-soccp_driver_dtbinding-v1-2-40862f7fc58b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009-soccp_driver_dtbinding-v1-2-40862f7fc58b@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: gmNO-UgN4XPooXEr0n8ZTHfBMxFyHaPN
X-Authority-Analysis: v=2.4 cv=U98Hnuru c=1 sm=1 tr=0 ts=6ac89d77 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=JR6eoTKC87OEK718H0YA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAzMSBTYWx0ZWRfX/WmNcgD9hGE9
 zyZYj56YBbgFq4uzRRWapeK4C7KdWakNa8FXsbIsFj8Uevurqi/7mqqrhd9HE8B1TJUxR/34yot
 vWzh1I/ZUS/mwnt8XLGvOGFjpk3hsyc=
X-Proofpoint-GUID: gmNO-UgN4XPooXEr0n8ZTHfBMxFyHaPN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAzMSBTYWx0ZWRfX651GZ2DvmJKj
 xHHrWdeUr3W6enW1UDtEd8CU3sk2xoby/KKMAMF1jC5Pj/zpmxT1N4HKBF/TgvIo1rM0ZRZdE+Q
 AXYDZSAuJy27IAf3bhzr7kDsBFmaeW2Q6U8sweXrA6mT56d71s7BqHj17PuJmhIjhkr8oXJ3XsO
 SM3dmGuib8VlfY05/VbirLTKo2S/42C0Yzqj+qH0LSsnyYKL/Mlt0dL3M5/6cSUC3tnUK1cQbgr
 i+Kxu6nC1Sj8tFnU+DlmF7Bi/cjp88jKpDYoNP9RTlhC/1CtfAgqoT5qO1L9pFGtMMqjYEDYOMc
 P8MvPWdlYBgpbB+J1LsPrFmtpGYymOcQUXlbXuVAbWtzUYuLZKR0kgp54RuHFtOUKUO7eXb6IIt
 9gtXBwl0U0/iilNrIq3sKkh5O/lQq64h+CnzRDvF45VPCrjSy8yyA0Q+j2IhFehXtir11wBQL9R
 JGSxCpY0QMRQLjuCUvQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1015 malwarescore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090031

On Fri, Oct 09, 2026 at 01:05:40PM +0530, Anurag Pateriya wrote:
> The SoC Control Processor (SoCCP) is small RISC-V MCU that controls
> USB Type-C, battery charging and various other functions on Qualcomm SoCs.

Are you sure about this? It doesn't seem to match what cover letter
tells.

Shawn

> It provides a solution for control-plane processing, reducing per-subsystem
> microcontroller reinvention. Add support for SoCCP PAS loader on Nord
> platform
> 
> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index a005546c265d..6fa958044218 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -1545,6 +1545,20 @@ static const struct qcom_pas_data nord_cdsp3_resource = {
>  	.smem_host_id = 197,
>  };
>  
> +static const struct qcom_pas_data nord_soccp_resource = {
> +	.crash_reason_smem = 656,
> +	.firmware_name = "soccp.mbn",
> +	.pas_id = 51,
> +	.proxy_pd_names = (char*[]){
> +		"cx",
> +		"mx",
> +		NULL
> +	},
> +	.ssr_name = "soccp",
> +	.sysmon_name = "soccp",
> +	.auto_boot = true,
> +};
> +
>  static const struct qcom_pas_data sm8450_mpss_resource = {
>  	.crash_reason_smem = 421,
>  	.firmware_name = "modem.mdt",
> @@ -1844,6 +1858,7 @@ static const struct of_device_id qcom_pas_of_match[] = {
>  	{ .compatible = "qcom,nord-cdsp1-pas", .data = &nord_cdsp1_resource },
>  	{ .compatible = "qcom,nord-cdsp2-pas", .data = &nord_cdsp2_resource },
>  	{ .compatible = "qcom,nord-cdsp3-pas", .data = &nord_cdsp3_resource },
> +	{ .compatible = "qcom,nord-soccp-pas", .data = &nord_soccp_resource },
>  	{ .compatible = "qcom,qcs404-adsp-pas", .data = &adsp_resource_init },
>  	{ .compatible = "qcom,qcs404-cdsp-pas", .data = &cdsp_resource_init },
>  	{ .compatible = "qcom,qcs404-wcss-pas", .data = &wcss_resource_init },
> 
> -- 
> 2.43.0
> 
