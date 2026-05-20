Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B583ACA40
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 08:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779265681; cv=none; b=UdA75ZP5BC725ajAbXIETDan06ZOZHr3O5FAeFzPDmp6Ek5osjRtZEO7HJiUiR+7q/2Aa6UwdkU3rWUARu7ejUBWs2JUzzNc/s5oH1kX60JV2RGTmpFFgvU0S4uVs0tyQWVrurFJgCZfZaZU78eVM1U7R2z4g0Kfg2pn5QAwfvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779265681; c=relaxed/simple;
	bh=VxAoNW25Ujt504peYxTkE8zYDZN7ss6BYNIQX9Q7toM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sh9k2deHeAm/Z9vSFvNKCbkeXti0mmHNWAIxHUvyDfzx9DqppcFA2El054zRxvL2tAyeOdV0iu+LbVZdsQCTyX1xpupIMxG0945Igg9569TZf9XEh3Woc++/LVY4laFpPpAWEIvSKTXa1XISSx/O/Dl92GjU8QWvKIzXTyplzcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P0L0DN5b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ikHNApbH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P0L0DN5b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ikHNApbH"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K773Yn1238657
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 08:27:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dMP+5E3spei8NZdRJwHgG/2/
	qxpbiRP3qgzbcSPUzi8=; b=P0L0DN5bZDsY4P75O1+TE5maTcjFcMq60HAljLUa
	MrfNh2j5YGd8Z0K/32NLCKEIC9hkJj8buLdtTaifnGBcj8G6MeMva5aX4p6wJkfS
	3/y+84tel81M4+QhUBq9+zp6aVGBj2EnDAlw7ac0rPnXD5vcjo/bC3mXRk48Sknq
	N6sKK/eFQ5g8CbxGwCuwgUoL8cBK+t+PCacqGoe7iJ4LmqdpD5ssXygEe2EwitYB
	9RuUgqDj7IUd5laM8Jew1iTLa5G9D1ZQHoasvbfHm6RPQflp7DZtZezwbOK7RD6G
	9mU5KteR6s9elUK6ymy2W/NEX/aVwwWtLkRFRucX02TKBQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3suvx8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 08:27:57 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82fa6c3a77cso2622917b3a.3
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 01:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779265677; x=1779870477; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dMP+5E3spei8NZdRJwHgG/2/qxpbiRP3qgzbcSPUzi8=;
        b=ikHNApbH6UaggCHCJEGDCJzAarDhRpK+gsbUfa5B82HJJUYVGTA9M7aY2niLNPDVTA
         8ZnGX1CEraedo2U3R2uY6LVWgShfw4rzRU8AGo5UGu5frj5xYSupzaV0qjFe/nXHwlUS
         p+lyuScrySvzUqCok4OD3mjWH5YiH6eMUTwenl2nuJUZMZvbYmBmgF7ZJTOzC2rIVQuS
         mkMXoZQ4nQ24HoFq3vh+RGQoRoGu8eKLqgX9qqzcQ/cboBFmurFx8YasJib3IXhz+FJ2
         cQLnKEM/e4J/LElATdI5So8qe4Fh2J3MUvmqOdmbqAKxUxa9hLKaCLD0sF5v8Pgv2L+z
         0Yvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779265677; x=1779870477;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dMP+5E3spei8NZdRJwHgG/2/qxpbiRP3qgzbcSPUzi8=;
        b=bvi5bz1vVpIFo0THaYR3hGrJ70O/TnXWg+jnuaFBfXxVGEHz75IjscO/9p6uIxF8Tf
         onE81BnHSgDtiFTpXf7U2oLDW6N+fkf3J4dDwUM4F04D4hj5OQ5ChjVV4pUSoGT4reUg
         AZrX5VhuPHONnlOUq6Pb9r171uAEOgZ+DYXs8nLQg/4+kIcoo2r+WgLaK1cBscub82oe
         jns106aGwVzVK0ZRHtNMI10uvPnMyTIVkAg5HFsDYnwc3SuTo19+iPeo+tDCvk8Q/LMe
         mCBtgKrbgsNif1Okr4B+DTPTlz9W/HTrutfntPS7RwWN+j5XYL+aVYoWDEYoLcAX/MJQ
         Hiag==
X-Forwarded-Encrypted: i=1; AFNElJ+gIzdu2h0oYg5gy1MlvTn+G+AnJDIx3twqOUPKMu/4GEkDNdV1O0nkOLCEnr1EZ1UpU6ifg9lOx8y2@vger.kernel.org
X-Gm-Message-State: AOJu0YzFGFIAB1DSvgp1CQkPFXJC7w4J5CJSG2DxkyWtBk0oiYEt5I5v
	EuDSls0/8p/s3mCTIp2qAZb0gA5VyTDSM7wBlOJAvB+Ub3HwOcYfEgxmRfaV11ev+Asfd7xEow/
	CvcHIZWGP0potHCMJOMhcq2ci9zRGDlCPAZTSZNzOnTTG9OjKRC947U7fnlfneTje
X-Gm-Gg: Acq92OFrl1uwdsPyHlmhfv40h96S2dXe8NvRcSb0QBbWAdU+wLgacBKEG+9Jcsd+g5U
	Qvp2eIYCLKIMKhHQu055wttGMEmaWshg8EarnjXxaitiWUIrM8HbdOGUFQlleVrRHX+mC4QZVyN
	Jfm2zhIK9XQI3dGa6qkcZOXvRHAyrRe+OHPNBHwsNg6IlMimDQTtzVqOaRP2RmJVFEOsCecBVtN
	ppWu+VJZz/GoJJwvZGtBwP98Cc3Nsz8q14aHidI28+HbcuMoFjeXuWooZD4ju0yOjjZjS6anG/k
	vCD++AWwoycG+urGqDVt0HY4fTKWNpSV2VgthWwjUCi6MubJeyiJn3CfMOmsxe0Ts/J1GqYmtA3
	UZjER4InjABgULQHfhJyTLr7C2MEXrJRKX+FTXlnEN8WdVHjX
X-Received: by 2002:a05:6a00:4c13:b0:83b:a723:d704 with SMTP id d2e1a72fcca58-83f33c2be4amr21997934b3a.19.1779265676918;
        Wed, 20 May 2026 01:27:56 -0700 (PDT)
X-Received: by 2002:a05:6a00:4c13:b0:83b:a723:d704 with SMTP id d2e1a72fcca58-83f33c2be4amr21997891b3a.19.1779265676390;
        Wed, 20 May 2026 01:27:56 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f196638d0sm24595500b3a.7.2026.05.20.01.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 01:27:56 -0700 (PDT)
Date: Wed, 20 May 2026 13:57:47 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, shengchao.guo@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
Subject: Re: [PATCH v6 5/6] remoteproc: qcom: pas: Add late attach support
 for subsystems
Message-ID: <20260520082747.7seyyua4gfv256ev@hu-mojha-hyd.qualcomm.com>
References: <20260519-knp-soccp-v6-0-cf5d0e194b5f@oss.qualcomm.com>
 <20260519-knp-soccp-v6-5-cf5d0e194b5f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519-knp-soccp-v6-5-cf5d0e194b5f@oss.qualcomm.com>
X-Proofpoint-GUID: hB5vrHShnt3zUP4aY4pbCKOgo-lM5qyv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA4MCBTYWx0ZWRfX0AuqsUt7i4cl
 Q5vrtrL3g85uoOsu1vlpGmqtQVZq7umkAFPGJv2jbADt2wMJiunfprw0wLA6NDNlzcoelXm53Ag
 qdYRZzr3jG4pEuTx62sNnj9NFePJ3OBX3JgEi4VNrrSdBY7eeXkaerfcp7A/2RhFdzemkvOhTAU
 aQtyOF+FePALdjQzmJzQ99WdRNTKwTLA7olqYgWzgvfl+t7/duTEPgaEMGkhrflixTM7D9vKGNO
 qC+Ks0CP2bzU78nJ4jbPzbRpwLs8RWq3h8s1rQIB16BbT92cz3hHiuQay/J/6lJUoJY5O0pRrgy
 zfDxyhKhcR5AZbvynCnPEQIvFrWcXvacSfuZLpgQykxRx/xcmY4qbMhpdedKxbNdebuefiK21zX
 iyAMhSIm4Ga1KHNDYanNnkAVv7PXi7H7mq0R1k9fqLCBC2scgpiQb+tH/qBEn0+7l6Qri+9pYBO
 BdBwBX4CHFUhO4I8u6w==
X-Proofpoint-ORIG-GUID: hB5vrHShnt3zUP4aY4pbCKOgo-lM5qyv
X-Authority-Analysis: v=2.4 cv=SNhykuvH c=1 sm=1 tr=0 ts=6a0d708d cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=4OTBKPfHZ21lbMHTwgYA:9 a=CjuIK1q_8ugA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200080

On Tue, May 19, 2026 at 12:24:23AM -0700, Jingyi Wang wrote:
> Subsystems can be brought out of reset by entities such as bootloaders.
> As the irq enablement could be later than subsystem bring up, the state
> of subsystem should be checked by reading SMP2P bits.
> 
> A new qcom_pas_attach() function is introduced. if a crash state is
> detected for the subsystem, rproc_report_crash() is called. If the ready
> state is detected, it will be marked as "attached", otherwise it could
> be the early boot feature is not supported by other entities. In this
> case, the state will be marked as RPROC_OFFLINE so that the PAS driver
> can load the firmware and start the remoteproc.
> 
> Co-developed-by: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
> Signed-off-by: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 58 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index da27d1d3c9da..ac2a00aacd2e 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -60,6 +60,7 @@ struct qcom_pas_data {
>  	int region_assign_count;
>  	bool region_assign_shared;
>  	int region_assign_vmid;
> +	bool early_boot;
>  };
>  
>  struct qcom_pas {
> @@ -510,6 +511,57 @@ static unsigned long qcom_pas_panic(struct rproc *rproc)
>  	return qcom_q6v5_panic(&pas->q6v5);
>  }
>  
> +static int qcom_pas_attach(struct rproc *rproc)
> +{
> +	int ret;
> +	struct qcom_pas *pas = rproc->priv;
> +	bool ready_state;
> +	bool crash_state;
> +
> +	pas->q6v5.handover_issued = true;
> +	enable_irq(pas->q6v5.handover_irq);
> +
> +	pas->q6v5.running = true;
> +	ret = irq_get_irqchip_state(pas->q6v5.fatal_irq,
> +				    IRQCHIP_STATE_LINE_LEVEL, &crash_state);
> +
> +	if (ret)
> +		goto disable_running;
> +
> +	if (crash_state) {
> +		dev_err(pas->dev, "Subsystem has crashed before driver probe\n");
> +		rproc_report_crash(rproc, RPROC_FATAL_ERROR);

I am not sure if this is already discussed, but what if it is the first
crash with recovery and coredump enabled? What would be in the dump,
nothing? As there is no segment, is it expected since Linux did not load
this?

This is even true if it is a crash after a successful attach.

@Sibi, has this series been tested on Glymur with KVM?
I don't see the iommu property in the below patch.
https://lore.kernel.org/lkml/20260403-glymur-soccp-v3-1-f0e8d57f11ba@oss.qualcomm.com/

-- 
-Mukesh Ojha
