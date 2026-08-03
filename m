Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B4D40802F
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 12:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785760556; cv=none; b=EC/+mahTPlIdtTgEERrn3yPYILjLw7J3b5NCrmlzOSnfpAEqOsdfWPIxpWoF2Vh51FYrz9Lo789AmJbcrVSU0AzgP/cESKsK634Q9yhDtL84o6rvCw/kL62Gz3xjQstQYBf9nmBbvwPChiuGeUNOxNsO3l8IbPeRJJstMVA3rMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785760556; c=relaxed/simple;
	bh=99ukNQ7BdIOZb2JpWnfJu5Xs1lh7ce+r0U0zLUuRsrw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SNazxN5AcN5cQq0IwC74NM6YSYNydzfWnHdQObiENXPHMtmWNQ+H3/CvWye92s3NBQgkAAE0kfR1KZPMDe1dDS0q7UUmwk+43U3NbGEmT/ZNYFSWBBNdzMysrV/yKsQwx0zEsTHb5Xin0u6iJToSJDtG27rGZDMP8wMgD+WoyHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bzz6n/gc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=InmBXmvD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bzz6n/gc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="InmBXmvD"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673C4pbQ365149
	for <devicetree@vger.kernel.org>; Mon, 3 Aug 2026 12:35:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Vc34inBE7889SKrHzyISv1++
	OnZDLFt/IxkNd1Y3Ifs=; b=bzz6n/gcx4wNDTUR80fvp7zdbk1Np0p4Q0+DfsOq
	RUO4Rc9qgJKcKoE3mVBmJqfWPMTyzsGSgkppMaLQ+Bj1cLuU0ZpfO7fZjV+1g2N0
	UBqH2ZzLi5rZWy/Ggv4NXZR+N3+YyqQ7hfBEcg03V+V/OE97BsNkSojdbNPW+jBV
	j4srs+OQQNB7PYne39ga9tGf2ExmoUR6ktZu3wRs65eoN+LEDzm2W4KPLVyZNdBd
	cSY4LgRsZZhH6hdkeZp3IeP+gLZ/xzAfPFUL0vuf7ZqoKWAr4R2TJxNHSKWk6kw8
	EuWrqWc0aFe3DEvmbA/BvtolX/pVLJ59g55RnPmgbQdWXg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnrnsg1m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 12:35:53 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8ef8249f871so34156746d6.0
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 05:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785760553; x=1786365353; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Vc34inBE7889SKrHzyISv1++OnZDLFt/IxkNd1Y3Ifs=;
        b=InmBXmvDOaTg+SwH6mkR0NDk+5+O/+nHtdv/6rkY95d7osSnM9VttUTes1wrVI+hkO
         XxeW0WQU0q7ZkrzS0imJRuAaOd8tarF/D3PNVEJ6VmUBu8ChsgzaaK2StPjQcO3xXiUR
         iHsKsZWEGRif5fF7Yz0d7FUi5MKuG35PkwfKrUdNus9GMDnk4UzT7BfOGV4gizMjrJ7k
         Iutp+ByP+hSZC/Mu/KhzXtVmXxBLdGpfCnDFDHtB/inqfTIWtTrG7xlzKIaSsibAO+UU
         cxT78mx5Y4LWf54CKZyDmcf2c42TD/kovoCyIeh1xjku9PzXjBWgW3E53qTeWsS0c23v
         K8Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785760553; x=1786365353;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vc34inBE7889SKrHzyISv1++OnZDLFt/IxkNd1Y3Ifs=;
        b=S1IN5BmRhVuI4TdsZtfT0JyIHvRSRt6r+dGIbLF6eLXECIjjFrTDLM6YLu+SX01xT1
         3j1LYG9UP3d8z80ZSPcg0A6j0g7fTB4ISakkYeB6KuRG4C36vXqK8rf5byBPEPUXLPWp
         aUnP8IpQh97CcSZ0eIkuuREhtK9oQHCOlXGc37loDK4OJKHm+wKshdDoRUgEXTjJlZGX
         cAr/0TocIBudQWHqL3549pvJaUw3PCckXcV86rHYSrrEa0K4C6c0gY4iFRdkBSC3vvio
         Pz1TBNkH4KJS+paGOEeXzLZMeOQQ4lh1WGSsF81DVvaEx5zJoeVY/x+Bg0SZVqEeI8Gf
         0pfw==
X-Forwarded-Encrypted: i=1; AHgh+RoP/jDPaGPHwieWbn1Le1DOGTF1d8vkyBUGvtW6K/EJxH9MJfRdfom3ndkiBdfD5DdqwFI3tIJ4Uw4l@vger.kernel.org
X-Gm-Message-State: AOJu0Yyog1BnOl/8Uoe4glZhPf4pSYn/S4LBjTzM0OyKlDHPK1bmx+Jc
	nuvuk2w/6xnqZPHjQrhKK7Zd2prXe/vJFWZ1ulp2BWr7dW207UrDi22a+kARjjxgnC0M0WClzdt
	Ejk5w3pez0C0jmleSsTJhcGAW9uPUm8zEvkvRQBeFbN8Fe3wmh/mOp/8U/ewLDQuW
X-Gm-Gg: AR+sD11CXCOSTqw0XxXY/QFlRwi4ZMkBS5lvaxQ4T8v4SGzftVX02Ku5xvk+N5OHCEj
	w8EJA2ctzdOZSAIwuguf7O8Yd1g6JjhqCQRT+e8wEzDYLVrbME38hWJ6ow8qmKJBti6sY79z5AY
	8tZihStnv1B4yHpYR8bG4xqrP2bEJeS/GAD0xVtp60lPm46wdgSIayzWNJjFWHJB5uL3iSI6fDb
	KKCqKPO2oydCZsApPDFuoy1CCd+9jR5b0KaDJ848YgUUE1zJWekWDeFgH2YQy2cODPVgglisyg5
	nfl/Gpy3aVAlkxzRryhIPI6xISLbBgNfz9zoIEFNc71W9/97J+Yy/e1814YSXnHjptV7yfXdMoR
	gBE4aXXgxrCEgj3S34O4g2UN34uE=
X-Received: by 2002:a05:6214:2e4a:b0:8f2:1663:abe9 with SMTP id 6a1803df08f44-90849602f41mr218716676d6.19.1785760552610;
        Mon, 03 Aug 2026 05:35:52 -0700 (PDT)
X-Received: by 2002:a05:6214:2e4a:b0:8f2:1663:abe9 with SMTP id 6a1803df08f44-90849602f41mr218706876d6.19.1785760546375;
        Mon, 03 Aug 2026 05:35:46 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90843604cc4sm75444116d6.43.2026.08.03.05.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 05:35:46 -0700 (PDT)
Date: Mon, 3 Aug 2026 18:05:37 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
Subject: Re: [PATCH v14 1/9] firmware: qcom_scm: ipq5332: add support to pass
 metadata size
Message-ID: <20260803123537.utocak6hvhl5ijqh@hu-mojha-hyd.qualcomm.com>
References: <20260803-rproc-v14-0-a1f87b0b0ad2@oss.qualcomm.com>
 <20260803-rproc-v14-1-a1f87b0b0ad2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803-rproc-v14-1-a1f87b0b0ad2@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDExMiBTYWx0ZWRfX5enju8LXX/Dk
 VABNcCXbuPX6fGK2agCHPeecmkh4ipqGLqTKNdJq/fu+sUURyOZ6lNkVsT+tp+Q1QUbVjxvCDDI
 TTi/CisrkN+pw2BXDdg5XZUdFqoWHGE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDExMiBTYWx0ZWRfX1b/xaagJNRAl
 chZv6jhlymsX6Z4Z5/c79SWrhzzWVPi/LlZqjWqESiDJxZEuEAa5AG11G9yemf6rBnhekazJWma
 4R82yqfj16SaovJBYLq9vaw/5SYx39CFaezyVJyD/M2k9kvXoeRVKK0Nrf3lRJW1euS/z2qKj1b
 M0jHPQst6KE43i7Wvs8hZ24wBwtgkiCn29huwBKfHhmYIVn5qyFG3M1JGZBNVsmeLNnAHqmQ/OA
 jn+G9Xx1Eqg43naK3bO1B5c/yHVs/Wwak9Beolx4kS5DYkhJ8N2PSwohFG4bOQ1XfPnAUmuAnZ+
 IPJQQTykuFAW73+n55bWGSQP+Ncbayuk/Ti2+t+qnEwx9GLST1pQ+oA9ci0TfiwKq4PVAl8UHAp
 r8teU+LayqdD6OghUOx38ag3frHW+cmxmFdDIlXz8tmgf1AHMa4j5saxHY6qB8j+NPjN/Dpuo7A
 WlURKxgRq/3YuqAKoAg==
X-Authority-Analysis: v=2.4 cv=Zest8MVA c=1 sm=1 tr=0 ts=6a708b29 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Xm20eXZJH854yidWDHkA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: EK7PQvh444cgYwRVQa_433wbN3XsH_qt
X-Proofpoint-ORIG-GUID: EK7PQvh444cgYwRVQa_433wbN3XsH_qt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030112

On Mon, Aug 03, 2026 at 04:16:07PM +0530, Varadarajan Narayanan wrote:
> From: Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>
> 
> IPQ5332 security software running under trustzone requires metadata size.
> With new command support added in TrustZone that includes a size parameter,
> pass metadata size as well.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>
> Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Tested-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 16 ++++++++++++----
>  drivers/firmware/qcom/qcom_scm.h |  1 +
>  2 files changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index 3eaa4c9ccf3c..8902c445cf19 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -598,7 +598,7 @@ EXPORT_SYMBOL_GPL(devm_qcom_scm_pas_context_alloc);
>  
>  static int __qcom_scm_pas_init_image(struct device *dev, u32 pas_id,
>  				     dma_addr_t mdata_phys,
> -				     struct qcom_scm_res *res)
> +				     struct qcom_scm_res *res, size_t size)
>  {
>  	struct qcom_scm_desc desc = {
>  		.svc = QCOM_SCM_SVC_PIL,
> @@ -619,6 +619,14 @@ static int __qcom_scm_pas_init_image(struct device *dev, u32 pas_id,
>  
>  	desc.args[1] = mdata_phys;
>  
> +	if (__qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_PIL,
> +					 QCOM_SCM_PIL_PAS_INIT_IMAGE_V2)) {
> +		desc.cmd = QCOM_SCM_PIL_PAS_INIT_IMAGE_V2;
> +		desc.arginfo = QCOM_SCM_ARGS(3, QCOM_SCM_VAL, QCOM_SCM_RW,
> +					     QCOM_SCM_VAL);
> +		desc.args[2] = size;
> +	}
> +
>  	ret = qcom_scm_call(dev, &desc, res);
>  	qcom_scm_bw_disable();
>  
> @@ -644,7 +652,7 @@ static int qcom_scm_pas_prep_and_init_image(struct device *dev,
>  	memcpy(mdata_buf, metadata, size);
>  	mdata_phys = qcom_tzmem_to_phys(mdata_buf);
>  
> -	ret = __qcom_scm_pas_init_image(dev, ctx->pas_id, mdata_phys, &res);
> +	ret = __qcom_scm_pas_init_image(dev, ctx->pas_id, mdata_phys, &res, size);
>  	if (ret < 0)
>  		qcom_tzmem_free(mdata_buf);
>  	else
> @@ -683,7 +691,7 @@ static int __qcom_scm_pas_init_image2(struct device *dev, u32 pas_id,
>  
>  	memcpy(mdata_buf, metadata, size);
>  
> -	ret = __qcom_scm_pas_init_image(dev, pas_id, mdata_phys, &res);
> +	ret = __qcom_scm_pas_init_image(dev, pas_id, mdata_phys, &res, size);
>  	if (ret < 0 || !ctx) {
>  		dma_free_coherent(dev, size, mdata_buf, mdata_phys);
>  	} else if (ctx) {
> @@ -2528,7 +2536,7 @@ static void qcom_scm_gunyah_wdt_init(struct qcom_scm *scm)
>  	gunyah_wdt_dev = platform_device_register_simple("gunyah-wdt", -1,
>  							 NULL, 0);
>  	if (IS_ERR(gunyah_wdt_dev)) {
> -		dev_err(scm->dev, "Failed to register Gunyah watchdog device: %ld\n",
> +		dev_err(scm->dev, "Failed to register Gunyah watchdog device: %pe\n",

stray change..

>  			PTR_ERR(gunyah_wdt_dev));
>  		return;
>  	}
> diff --git a/drivers/firmware/qcom/qcom_scm.h b/drivers/firmware/qcom/qcom_scm.h
> index cf90a565fdfb..e58c76aba45c 100644
> --- a/drivers/firmware/qcom/qcom_scm.h
> +++ b/drivers/firmware/qcom/qcom_scm.h
> @@ -105,6 +105,7 @@ int qcom_scm_shm_bridge_enable(struct device *scm_dev);
>  #define QCOM_SCM_PIL_PAS_SHUTDOWN	0x06
>  #define QCOM_SCM_PIL_PAS_IS_SUPPORTED	0x07
>  #define QCOM_SCM_PIL_PAS_MSS_RESET	0x0a
> +#define QCOM_SCM_PIL_PAS_INIT_IMAGE_V2	0x1a
>  #define QCOM_SCM_PIL_PAS_GET_RSCTABLE	0x21
>  
>  #define QCOM_SCM_SVC_IO			0x05
> 
> -- 
> 2.34.1
> 

Otherwise, looks fine.

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

-- 
-Mukesh Ojha
