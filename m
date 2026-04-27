Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9483F3382E7
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 21:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777325175; cv=none; b=eUXdKMkTUDtrLHKl3ET+KAhi4e9wz97Qoza/clQv/c1vQIy4BKeEPzCKK/taMn6d51lF5Nnx1M9X4Y8fdA/wSmvllSd/Mp5X0Q8ty7oc5yCxMzoFHB/Sb4vrYISsXDMrF52ED/EEiyHNdA7Zmu2y1/f5+k6PfILiKEE+q3TFvA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777325175; c=relaxed/simple;
	bh=bSW3WAoBsrFd9H0Shnwo+F3LEYcpztafIuWLW0/ey7o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uuPC0RveIqcZe80VVKE/EDAT8SvJOO8HNq/EGZtOrqYhIQRSzlC8ArcwAYZfFP6G1VgTJKPwjGKI/DbM/e/5bggCCLa4NeD/6HIJyW7+mEwCFagcCRgcHgoVlSn4FC+3z0vQdtbqhL5cuslY93W/5d1EInuEMg3WfjD1u25AtBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FFY+L/2C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KazArD5x; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FFY+L/2C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KazArD5x"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RDrH433961889
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 21:26:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MrW1+n53XVO/1Nwe6562dqWB
	qJzHztQPyL2+RkJZeog=; b=FFY+L/2C1G3HJL/qVawdllPRlyp7UAv1KtYIMDIS
	F1Q9dke9bYRu5QNuqnupM15zObumRApEo3IO9wMWNIjh2XbGWDcKBz/jOze6ZULk
	cQ5rru4hWkHd3SJevvGAjlJKSsrlydeRFDKhNxzhUVRbOOuCqRFA3xwMZn1ErvKk
	YoDQFFn/mdN4DRW/22uUzn/4MELNd03vHYmg/IcIwYUswCcSSxWnBv1k4yzsStCZ
	kKeozLgJQxkI5CtH0lMHEgmQdimvm3jgxCGvtbWIC79C3Xf+veOQNWZWkMcvsODg
	mO+GwUUG82JgRQPSSNVsB4w5Rl7ll4z9EtgUKu2TNriJKQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt4k330wd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 21:26:14 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-12c91ef7009so31339374c88.1
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 14:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777325173; x=1777929973; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MrW1+n53XVO/1Nwe6562dqWBqJzHztQPyL2+RkJZeog=;
        b=KazArD5xDOb8DIs8HJJvwXBRGLENTbOY7uHG1nnc4iJ5RS+wLdj8iCofRSwEbHs+XQ
         nI4uNQQVM834xBs5lXIpfN0GhY30Gjz3GoAedf48bIgmdxuyEJt+fM4dgGof2DU3ZzhD
         NgU58cz3rdqqNj6dSq7l/t1Qj04pMC69x5sc39s/avgRUxAm7v8lb4VsG4ka11640FyG
         9CwnFPF4LszHSf+K7bc3Te2BwJbtigzcFiA0IE/BL2KcMEzTo+y30Pu6FhLBrjQ9mIfa
         h7PppbdxmVz6xz75dwSVmfm9fk0NUDUgAdJPxPGRTv7drFgp/S5BNzo3YVUTEXhhXr38
         42EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777325173; x=1777929973;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MrW1+n53XVO/1Nwe6562dqWBqJzHztQPyL2+RkJZeog=;
        b=X3HzMJTj6itdmGnP8jOua5T+TOFTcY4j+ZkNhom7B0gNaaiMGjXQFZaebsEXkxpdzc
         OuNdWECcu8THgx/nB9cKdE1NqB0CASru0BGSFTJ53uEDCLfL/TCGeq2Z7GD1Z+GiTAUm
         +PQGBQKT/Sl9G6LYQumtzsR/avCNwkDLnAChyuzv1eX5CH9MWPM3Vpe3uRgiM4JPaL1t
         gUeocAbcWqyHL4yFn4Q+d/qtITA6RUm2nFzlRXFjlmy4k8UZAHs1CE+/P1qZo+yiyT1W
         PhepzPVUsT48l14ts2X+cawtWxiDfNC+bodGOHviq7/7O4RMljjqrno963b8aZz3dtnl
         QKRg==
X-Forwarded-Encrypted: i=1; AFNElJ+vZ5sHNV2jEVnzvqB5VxQs/IYSvDa9vY9aWQCthFFz1wtPNCLrpJaV+OR8NlDYVuU6BvmORHH+pLlE@vger.kernel.org
X-Gm-Message-State: AOJu0YySJwQmJ7BAtk/VO/vJnJWYkE1wuLWrfYuVRUin4xHQR8Lj6SP6
	8lAZbx1XMyMUq0ltUTwA1wgW8CY5AL+HgJgMNPjGKyW7Zf1BPMuQzenBdT/NxN2Wmg4NJ6k/drY
	oeyUhXIThuKXdcEyJucGtfGRCbENMkRWCHZnJLfSBm2OgibePSrkENu6tAzKsxT5j
X-Gm-Gg: AeBDieuKZ6i4OY8m9zEnfVnPjntjti0VXiv+ZfjHlEN+svR+Fqd840XeOKZUhKQBFR9
	qTBbO3YJBNU2NqAKu/4Z6lTXsxtv6k/zRud3f6YMf4MkMiB2iUWAfFGQBkEcziYaTT0uHha0kQp
	AhNAGBH9Wjw7ysSFZ1FFJxGE9vouu4apG8ZT5qtrUJAirSu4Yon7aRn85w21lAg0PDNWF7Gkjr/
	5Qhy1I+5DrJKly926Sf4EcZBTe81vwBrGisaNPYP4HXgy/P+l+3a3yf64vcBSE5GJ3Uvw6pEaVh
	bINoeQUGrS2SwqVl8Awu+c5RAUFJ5wnumnJc3rXItT8vQyQwJPObsYERxuLzyYDbIJWrLvhR3nR
	QijVYALdGGqNefc64vN7a4Tn6GxIhqGkf+6juVi46Oe0UmOjxzlaNE1iUbtSlGeRWUM2W9G99oq
	k6sMA7hfCuYQ==
X-Received: by 2002:a05:7022:f94:b0:123:348d:8576 with SMTP id a92af1059eb24-12ddd93f1e6mr393402c88.6.1777325173210;
        Mon, 27 Apr 2026 14:26:13 -0700 (PDT)
X-Received: by 2002:a05:7022:f94:b0:123:348d:8576 with SMTP id a92af1059eb24-12ddd93f1e6mr393385c88.6.1777325172657;
        Mon, 27 Apr 2026 14:26:12 -0700 (PDT)
Received: from hu-mdtipton-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ddd93abadsm592162c88.6.2026.04.27.14.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 14:26:12 -0700 (PDT)
Date: Mon, 27 Apr 2026 14:26:10 -0700
From: Mike Tipton <mike.tipton@oss.qualcomm.com>
To: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/2] interconnect: qcom: add Hawi interconnect
 provider driver
Message-ID: <ae/Ucn8kiDTdjPdQ@hu-mdtipton-lv.qualcomm.com>
References: <20260409-icc-hawi-v3-0-851cac12a81d@oss.qualcomm.com>
 <20260409-icc-hawi-v3-2-851cac12a81d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409-icc-hawi-v3-2-851cac12a81d@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDIyNyBTYWx0ZWRfXxPKPbgYBYVw+
 y7oEY/KVtS7suHn7CUhKs9jUyOnWaiVMouJTbtkRuTWQGjDUcWsUZIZzzJ1vIkJk0eShGzVnmYq
 yqPDaFJQMKQdWSqTW0KSIGzd0vqZhWzp1bOjSaEedYm9R7LZH8svNTWyiCKiEw+Ak5Yntb/AywA
 oHM7rTWFdk90FSCLOIEyUHyo6DTZSWBdtoAFFqMuk1KDF0gspSIs4tVhip/mQ695NuOQuAaDN9F
 3FYFOZ9zjT8xEdYqoIqgBuC1Fa9+6AIFWes1pDV6rugdlxfJbbM2Nv1pPbXogCYGsSa/gfxW9mK
 mivNR0mEATXg58DII2U6e9GrW1XxibtucaY9/fmoB3jyjLPgdh42EbL4O2IEQojzxn1bmK/y/ZD
 ULbA1uZwTHytDy2OPGl1FLVTxmfnJ1ObRf5wq/T+VyPk4VzJCJ30fnh+8skyuroX7GvQuKQmw1P
 Cb70H1QHMycE6xJQN2g==
X-Authority-Analysis: v=2.4 cv=a7QAM0SF c=1 sm=1 tr=0 ts=69efd476 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=4GzhDZxwaX2ww3neWW8A:9 a=CjuIK1q_8ugA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: rRfM_yCy6yyYrR645VKvYQQhsRM8oFI5
X-Proofpoint-ORIG-GUID: rRfM_yCy6yyYrR645VKvYQQhsRM8oFI5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270227

On Thu, Apr 09, 2026 at 02:01:38PM -0700, Vivek Aknurwar wrote:
> Add driver for the Qualcomm interconnect buses found in Hawi
> based platforms. The topology consists of several NoCs that are
> controlled by a remote processor that collects the aggregated
> bandwidth for each master-slave pair.
> 
> Reviewed-by: Mike Tipton <mike.tipton@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
> ---
>  drivers/interconnect/qcom/Kconfig  |    9 +
>  drivers/interconnect/qcom/Makefile |    2 +
>  drivers/interconnect/qcom/hawi.c   | 2021 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 2032 insertions(+)
> 

[..]

> +
> +static struct qcom_icc_node * const cnoc_main_nodes[] = {
> +	[MASTER_GEM_NOC_CNOC] = &qnm_gemnoc_cnoc,
> +	[MASTER_GEM_NOC_PCIE_SNOC] = &qnm_gemnoc_pcie,
> +	[SLAVE_AOSS] = &qhs_aoss,
> +	[SLAVE_IPA_CFG] = &qhs_ipa,
> +	[SLAVE_IPC_ROUTER_FENCE] = &qhs_ipc_router_fence,
> +	[SLAVE_SOCCP] = &qhs_soccp,
> +	[SLAVE_TME_CFG] = &qhs_tme_cfg,
> +	[SLAVE_CNOC_CFG] = &qss_cfg,
> +	[SLAVE_DDRSS_CFG] = &qss_ddrss_cfg,
> +	[SLAVE_IMEM] = &qxs_imem,
> +	[SLAVE_PCIE_0] = &xs_pcie,

We're missing the equivalent for SLAVE_PCIE_1. 

> +};
> +

Thanks,
Mike
