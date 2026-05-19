Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D259A3E1CFF
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 08:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779179622; cv=none; b=JxLM3ym9UYYAiBsS40ddahUg9gw2AdWy/whxJzFxmEGS5UlRZ7CKxK2bROsOF0DphD2MxbOdTj6E0oTKVzX8yr688y0lRInaa2mPknyk+/uz95NcZS2ObROkjSnLnvg1XpamDnhdISs/muQUHnicyeQjs6lgFZchKk4rjnQCaBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779179622; c=relaxed/simple;
	bh=5VDmw6EVBSY19Kh4ckawKa2UeToCfnVQ6kAam/z/G4I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ABUAlu01p0vyv6ZBvR3JMt3zOcMOxIoPs8Q4dV3dSzAGSJU9lWZxfOGR5JLynYtoGT9cSUnHUyIKRgyRubkoMB+4JKuUbQ3cf1xVeEeugMYtDtYRNtPXperacoKoRqcn2MNDrWbUGr0Kt0xFPu2JA9IZssHE8kAMkdhzsVoQat8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VA2YcSro; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZQRjIDrw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VA2YcSro";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZQRjIDrw"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J5USTt2438091
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 08:33:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NCEF9FcioixssM2nc9MdKQTK
	okCifycvGnvJXrz6rRk=; b=VA2YcSrobwt2Sme4e+RIcUvC9emfkYlWD7ykLX2n
	MlkshIJgjtrvZSUTbAPNJRF4JzBMoRWXu6tY0g3Df1rvtOgO+jBGEOT/4lFi8JAM
	nnJJDokZ2Qfoj4zs/meQvGBhbh7KCgklzwHvdqZND6zms2E8XlGcuEMFJmpEwPRI
	0zvjO9lyccyv7PW8McEy09LQbsq1YkpMFWGxrE6jevRciG+sbN8IwAqjOV6IWdwy
	Bz+jguMBrrroQoMG4cdHq4ANIJzepsZvDc7DcJ+F8+ZAavEUeTzUQ+3SPerXo9Gz
	CwgZvGlOWWY2eZv2amV5u2DLvyRj09eYN9FLgDN6ebvV0g==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e834v419b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 08:33:39 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1353ac304f3so5840901c88.0
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 01:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779179619; x=1779784419; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NCEF9FcioixssM2nc9MdKQTKokCifycvGnvJXrz6rRk=;
        b=ZQRjIDrwqFtgwBBVq0JCUKIhSfQDqrGsummxi4dZu+bLackZdbgJpoXxX4a9KzUK1N
         DT84QsG4JytsmZ0zC3QT1+gGr3N5w2aR4v2vsDus+xAN0cUi220thGMIGJg/I8dhci8N
         FbqG0AXz1nlNXDYRvjfn/UVmueIHBXXkSAQZH5O4puqb7B5QKcs9Vc37gQmDrCPbfJRM
         mLHC3v1f/7Ag8lUCURY8GbgsAqHyum9svKJIq0m/8cuTbm0hdBkPd6cQH5QcDftcGjXD
         BeMtgQHG727IICX6i27hO1vsw6ecZG/MP65wlHyMVyrVSwbg+f02KQUfBgUUKlI2RPGZ
         JtAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779179619; x=1779784419;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NCEF9FcioixssM2nc9MdKQTKokCifycvGnvJXrz6rRk=;
        b=ZsRqy56b4pcOBYg37HO9nMQnjJ5MlzIRGImlo6a3cDYA6FCRYumlkEPY/4GEks5w6S
         ZjU4OTnjbJt09Z5AiURdpuN6NUeFZcRh2yILOVPCq+UtRi9dVbOsd2DKtc56dw2N/esj
         tFfuDNUlWVzC3fEd+jGJa4rFlNStN0bhkOykHdpVNfZFDW8CsJSBejd27m+U5jGAulGs
         G1fj222nJTzLPK4yJXrwBMCWBWPtYuZs2MRfTSFODMuHdR+eR73IOxaAPVtjR8jHIk4m
         8MEhW8oSV8o68bwS+GzJM/Gv/FfpKmC3ZocALhgexINc/bYjfQF2QB4JbLvuPxedzt5J
         DPxA==
X-Forwarded-Encrypted: i=1; AFNElJ+kAg0TTaTELqt8+L8MKJsmW9FLIRkoBxyiuudSgteG9RkmujmBjBxPvfTAsjFjjEgdzVOmPJk4TNIm@vger.kernel.org
X-Gm-Message-State: AOJu0YxIbqeNPaODGBzYy7EN3KWFH9BNuLYjNOwvOVz8K7ziWg2OOYQA
	UG6UJympNMUtSuomoHYUcOLht4lcMobuZMwkN5x+8IPW0Hfmxc/xo2x+pSBvf3124Lwcj9xve8y
	HZLG/0GEZzEwx9rZTJ0vCnQcLQtdRqFC0fbG4ZP92PnEX9jIR9BLdjtMq8DNT5n5h
X-Gm-Gg: Acq92OHiwUAXRohCHwKs638EHhjspHllIa54YfDNB7WrTIXjjcbOhbM5VnaUrGBrh+G
	riQ/XW9Ui3Dj+5VFlyaqDISCQK5q+I05ND6+hDpjhy66jqFFXKO4FyQK9xEzjed6WVl8Di7bm6Q
	k3JqtCu+iJ1sfuxk+lrbe2xc/ZKiXBcgb7y31HmbMmfkVg6b2RWlnTZ56Kp9Fv1P51aBw0y3GAa
	IcJFf6iu/114NM7HC1Kvi35/5yoh1miSBeMMJtpCup1/xAbEPhwYOLFkbqyw8OCYbRPGHTY2wd9
	tS+QN9ChfcjvrX9Jk9eIoQeOXYWPx3sGobIvjEJEz8lg3FNSbf6YnNqJbVfg3faJ+z6oBsdM3yz
	c0TH4c+W0pwkx70KdknyeYPiC/PLzqUaiVBhqGi+8mt0pv2R+EqUYiaoKbb6lmKLN
X-Received: by 2002:a05:7022:627:b0:133:3c47:92de with SMTP id a92af1059eb24-1350451daaamr7996460c88.17.1779179619048;
        Tue, 19 May 2026 01:33:39 -0700 (PDT)
X-Received: by 2002:a05:7022:627:b0:133:3c47:92de with SMTP id a92af1059eb24-1350451daaamr7996435c88.17.1779179618461;
        Tue, 19 May 2026 01:33:38 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cc2352f2sm22425874c88.10.2026.05.19.01.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 01:33:38 -0700 (PDT)
Date: Tue, 19 May 2026 16:33:28 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
Subject: Re: [PATCH v6 5/6] remoteproc: qcom: pas: Add late attach support
 for subsystems
Message-ID: <agwgWLdL9P-z8eqo@QCOM-aGQu4IUr3Y>
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
X-Authority-Analysis: v=2.4 cv=F9ZnsKhN c=1 sm=1 tr=0 ts=6a0c2063 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=UBS1206eJaUMAjtCYMMA:9 a=CjuIK1q_8ugA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: 8Ks1rqgonC0bpAqQsJxUeiGWcxjGoNYU
X-Proofpoint-GUID: 8Ks1rqgonC0bpAqQsJxUeiGWcxjGoNYU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA4MyBTYWx0ZWRfX74Pp8TTKAx1o
 kt18lFZAZD4km+PV8W6miCqvIhmWw/XACSRpoKacjliwUyFFfcrhKznVxc870bMyyDdCmEA6iDT
 MVaj7TKym4P1bimk+CAtHNX/4Jnd1S47gMylPm49kZiKCXyZ7oakzHkG1JvjA7b5mY6ohvDVuEf
 KPnEK6xQ5RiId7lzN7qGk/4J7E5YGL2cGMfOtgjo38DjYCh909DFERCWkIRFZIXfVMugiNiOZOh
 wgxjRavGkKQ88fWh5jI560EmIuA772bc80T3MXSBdeVXwO9LNtgczyVtchzZVrjlQfy0HjGHz+e
 NYCoAGRVdZ0I4xQ5NWkOmL7UMFAKo63Ml9NYO/UlQu2CLStVi4nuHHtz2DhREyNm6GeaOzY5gER
 QlWChkt/DlgMl1kuWZbqfAfZzofVGFPMrWrmNopAMGzc8D39YiQ9phDvt2ZqlkYNDzopmX2tuld
 RN212+ZtD0w49gCxQvQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605190083

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

Thank you for the work, Jingyi!

Tested-by: Shawn Guo <shengchao.guo@oss.qualcomm.com> # Nord ADSP

A couple of minor nits below.

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

Move "int ret;" line here to get reverse xmas tree.

> +
> +	pas->q6v5.handover_issued = true;
> +	enable_irq(pas->q6v5.handover_irq);
> +
> +	pas->q6v5.running = true;
> +	ret = irq_get_irqchip_state(pas->q6v5.fatal_irq,
> +				    IRQCHIP_STATE_LINE_LEVEL, &crash_state);
> +

Unneeded newline.

> +	if (ret)
> +		goto disable_running;
> +
> +	if (crash_state) {
> +		dev_err(pas->dev, "Subsystem has crashed before driver probe\n");
> +		rproc_report_crash(rproc, RPROC_FATAL_ERROR);
> +		ret = -EINVAL;
> +		goto disable_running;
> +	}
> +
> +	ret = irq_get_irqchip_state(pas->q6v5.ready_irq,
> +				    IRQCHIP_STATE_LINE_LEVEL, &ready_state);
> +

Ditto

Shawn

> +	if (ret)
> +		goto disable_running;
> +
> +	if (unlikely(!ready_state)) {
> +		/*
> +		 * The bootloader may not support early boot, mark the state as
> +		 * RPROC_OFFLINE so that the PAS driver can load the firmware and
> +		 * start the remoteproc.
> +		 */
> +		dev_err(pas->dev, "Failed to get subsystem ready interrupt\n");
> +		pas->rproc->state = RPROC_OFFLINE;
> +		disable_irq(pas->q6v5.handover_irq);
> +		ret = -EINVAL;
> +		goto disable_running;
> +	}
> +
> +	return 0;
> +
> +disable_running:
> +	pas->q6v5.running = false;
> +
> +	return ret;
> +}
> +
>  static const struct rproc_ops qcom_pas_ops = {
>  	.unprepare = qcom_pas_unprepare,
>  	.start = qcom_pas_start,
> @@ -518,6 +570,7 @@ static const struct rproc_ops qcom_pas_ops = {
>  	.parse_fw = qcom_pas_parse_firmware,
>  	.load = qcom_pas_load,
>  	.panic = qcom_pas_panic,
> +	.attach = qcom_pas_attach,
>  };
>  
>  static const struct rproc_ops qcom_pas_minidump_ops = {
> @@ -529,6 +582,7 @@ static const struct rproc_ops qcom_pas_minidump_ops = {
>  	.load = qcom_pas_load,
>  	.panic = qcom_pas_panic,
>  	.coredump = qcom_pas_minidump,
> +	.attach = qcom_pas_attach,
>  };
>  
>  static int qcom_pas_init_clock(struct qcom_pas *pas)
> @@ -855,6 +909,10 @@ static int qcom_pas_probe(struct platform_device *pdev)
>  
>  	pas->pas_ctx->use_tzmem = rproc->has_iommu;
>  	pas->dtb_pas_ctx->use_tzmem = rproc->has_iommu;
> +
> +	if (desc->early_boot)
> +		pas->rproc->state = RPROC_DETACHED;
> +
>  	ret = rproc_add(rproc);
>  	if (ret)
>  		goto remove_ssr_sysmon;
> 
> -- 
> 2.34.1
> 
> 
