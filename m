Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2E83955CA
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 08:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785139570; cv=none; b=UGxb5NRlAnRAvfRdzuZ7naSTlFOaE5RYv9ehS4HFevr9ZKG3FlF+oFZeHXmhFx0LFI2vRgDTjlAjAvubCnpVeCv72qdDS7KUNUCeh8ilvNiH14kA6QSuNM3hTQ2J+AP80DE8fRrqyzFztw7B2sDmIJNKBCJko0lbhiWsmY3Ilww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785139570; c=relaxed/simple;
	bh=BeKZrPy9fdW7EVHNpMyq4DyCehXspxqakFUqSMoELj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L1lou/y+BrvYFz5OFWB9oE8ZJypCFrC6uQoMFHkeSt0mDINEyn2bM0a40VJ6MhT3ZAfoBA7DDSbUJyXkPW2vqhps6jAty8qIZT9r4MkL3701EN0ADQJW03MoClY6pjY1Rl671gkCX1b3c5ug8RqbyX7OAv9boIo8LGVucXSWXlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d46Ez4+/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jh0GZIk5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d46Ez4+/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jh0GZIk5"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R7UB3t3150913
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 08:06:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ApEcPXJdRgfW9Ddtf5dUPtHM
	c6KvRM1cTYchNq42FjI=; b=d46Ez4+//CoLy2SQom6QAe2tIbOIbXhIkTh1xQ6K
	4kcXYF2VVLpb2aay15O84a2dLX3le4pVY0JFKpqu5Gek5pyzQB+Ignq4xljPODek
	p6G2qhftNrngwuJFU7hK9/2lJVzUidCWT6PG1K5ToyxUYpbArEr1iQMZp6JlkEOL
	8CVaiZiUxfSwWa0QS2PW5miRHNEOU32tcyLtaDLFLZZMIb3X/VjH/IYnLsW2daXu
	Y4S0cq8nzKDcBgbzI8cVaNjXGCgBvyEfRYER9dGoyntHOTcXgJco6O6slAR/59v8
	mX62cMtm2b4DXL/nPib+SsrxpxB6f4zgW564GIdxYoYq3Q==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp30g04aj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 08:06:07 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8485b7e18b4so4194002b3a.1
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 01:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785139567; x=1785744367; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ApEcPXJdRgfW9Ddtf5dUPtHMc6KvRM1cTYchNq42FjI=;
        b=Jh0GZIk5iWXo6p6oNiU58/uWiKCSUlJLyZ25AzLILfO1V6EiB7SI83jxIkZwa3bTED
         fepvGn01pL89ITKEuPhj3FkuncGdyNzhsVu25neOSLZn48hDrgiyOpVDc+Ogmw6xmGDK
         pRG1M6s+O/xwGSAwyFCEuH/dMCKUnM+BF/VaISl1rZzquktOlqWdEukayzaeL31hx1E8
         lBAxjUad3NHsE4RyCQKpmgpg8RfaQsplx1b55y1/ZL1y43iqR5VhdP6oCUKS0u47Abq5
         zy+BIbYyYa3PileQSKX6JRI702zBbbyr6K6PQ7jhPmiNjDsxAwQ7LZh8tnYKbdxa8jX0
         z3/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785139567; x=1785744367;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ApEcPXJdRgfW9Ddtf5dUPtHMc6KvRM1cTYchNq42FjI=;
        b=iARt3WvEWoe77r/LpX8XXizm0YrxaE3+lDKz5U/v3fK+BucNRUAmPTA8uyMvrWzRlp
         /aljtK6clc1flJyeN/nRIa5OplCfGcYb2Rnby7c6Dp4s8n26eWpb5spZRSl/lSEAwBZC
         DZUFEWYGpFuaiDGOUM1BTMzeG7uzyp8Kp5b+vfWWHrO9nlUJYD/jpjEEsDVRvvoPrwxB
         oFsZMJPaupvhmybHg80vkcUM5rL0iIdl0GgXmOMRqrwdMAPHP/IUo4eG2AbvO4wMGmpd
         X6q4xrNnsr5D5wh0ztCItLqnioo59LPI7HJH+q6cWjqOUIYAwQqXt4WvsZtvPKcXXO1s
         pE2g==
X-Forwarded-Encrypted: i=1; AHgh+Rq83GFr7vjXkviZ1P8v66iZns3EZvfYilBUzRxu7YAJDQRe+WYgJs2unqr4CPf7lq5/0TFTVP9xVQnL@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/fqX+/rpnz1ABxnNpwOT3F0aRk4+y/9qBbX4ntvmDkooIXNjs
	a5zHuSlk1vfqzFN9Xb8wkI6Hbb+ifMtU5QwViixOzFchVbiG3lXXqc8RkM4hVTmu8m5vKTo1uYz
	8wzW0INAJ9iYrMXz/XNsMjOAOBxbI3H4ypypNgsGIBDr5UkUhsmq747VME/ivYyCx
X-Gm-Gg: AR+sD10yoNCvM1GnxpocjzS3kP0W9xSZfM7AT6AmH5Yby3QUZDoAsVG0NMYdwCSVNOq
	r6tLF6gyuwJAK9XUGYTX2mTPU0haRG0BCYMMZ3HcIF+9gYirK6+zdB5zs1hKWJYYIpFNdPsZBiW
	OxlgNIq1hCOB1hacmHiZyXFRQF1yBEqkIFZHo/OHtF/vkSj+mS53smIyxu7+BgX8WPMWPlKXALw
	2pNwDWK7R+ztCGhD6WKPTYqZl4Sh6gP/Dm8jiFG9+xtmz+UAISqymnCUVwcqYBCvObMZDy5ZA+p
	noeEeSAq8W0AoDRFlhASrw/HUNAVKIQXcJaB/IW5pGhAAeHCwFCqy3pIDrYR2vbGauvyMeHDccs
	2Xo75xLkRN/0kqR/7ToOyRWUP9CJDP5Ts7yyVx5pxyTg=
X-Received: by 2002:a05:6a00:801b:b0:848:6720:6fec with SMTP id d2e1a72fcca58-84e5946745bmr5855636b3a.28.1785139566651;
        Mon, 27 Jul 2026 01:06:06 -0700 (PDT)
X-Received: by 2002:a05:6a00:801b:b0:848:6720:6fec with SMTP id d2e1a72fcca58-84e5946745bmr5855619b3a.28.1785139566150;
        Mon, 27 Jul 2026 01:06:06 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e5344e577sm2627352b3a.58.2026.07.27.01.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 01:06:05 -0700 (PDT)
Date: Mon, 27 Jul 2026 16:05:59 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] remoteproc: qcom: pas: Add Nord ADSP and CDSP
 support
Message-ID: <amcRZ8OpfhBytcT4@QCOM-aGQu4IUr3Y>
References: <20260727074621.561661-1-shengchao.guo@oss.qualcomm.com>
 <20260727074621.561661-4-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727074621.561661-4-shengchao.guo@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Wac8rUhX c=1 sm=1 tr=0 ts=6a67116f cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=VojNNS5daEuw-N1JAjYA:9 a=CjuIK1q_8ugA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA3OSBTYWx0ZWRfXz+XFudPopHBL
 CX8fsN+9v1VvDszFV6Jz8DTjdhEgw205NfOfxDIM7rFttHKohEBBbLz2T5mxhpX3mR2NunkGMQT
 BgVz39qy+N9zZOB7fstVKsMO1S8QLOo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA3OSBTYWx0ZWRfXxeL/FBf7mg4U
 kZ/bmd4txc8RuHrNuDKCHoPcnwocZpJBkaKFU1V2zSbttmMCdto1pv0rA5cthWc8pYkRcp1RH6A
 JAI/tsuQJtos9ly1GmzuTYA202GbDjp6dPLtcTgfVVLaEmGpS1YrIsZHvxIztLNHeDIbHbOvBWy
 keYnCSCgk6lt/xv5QGgBteFu2aUkL3tDG4K3b4fqMGm8Wqs28gCNdVMZZiq6kEPf44CzIl8ez9e
 Ui9DHJyNqfHCbZ2WcHbUejWnac9r5Q8PDRqUfoAb2HiIl55zqwpUmyJfyDbF0qJkVNjvMcJR3m5
 FOSzCLTXx2e4X5veiZXhwqzhmyXe9F75ExzcFoAvgrFwMeoNhr79Qr1e4oA80970HGLzpyIzjtR
 Ul7vKai69s1CbRIeLOu440W8qpexLWsb5hUAspUVshJHLUVeWmgjht91NsS9dyaUoa+9itUVgVp
 C0ETyX7K4baS2dN3sdA==
X-Proofpoint-GUID: aLOeJRCoS6kXlaj3XMUHP769ld66-Qgj
X-Proofpoint-ORIG-GUID: aLOeJRCoS6kXlaj3XMUHP769ld66-Qgj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_02,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270079

On Mon, Jul 27, 2026 at 03:46:21PM +0800, Shawn Guo wrote:
> Add support for ADSP (HPASS DSP) and 4 CDSPs found on Nord SoC. The ADSP
> is pre-booted by XBL before Linux starts, so set early_boot flag for
> attach path rather than a cold boot sequence.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 110 +++++++++++++++++++++++++++++
>  1 file changed, 110 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index 25599d728208..6f3850a3fa9e 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -1434,6 +1434,111 @@ static const struct qcom_pas_data milos_cdsp_resource = {
>  	.smem_host_id = 5,
>  };
>  
> +static const struct qcom_pas_data nord_adsp_resource = {
> +	.crash_reason_smem = 423,
> +	.firmware_name = "adsp.mdt",
> +	.dtb_firmware_name = "adsp_dtb.mbn",
> +	.pas_id = 1,
> +	.dtb_pas_id = 36,
> +	.minidump_id = 5,
> +	.auto_boot = true,
> +	.early_boot = true,
> +	.proxy_pd_names = (char*[]){
> +		"cx",
> +		"mx",
> +		NULL
> +	},
> +	.load_state = "adsp",
> +	.ssr_name = "lpass",
> +	.sysmon_name = "adsp",
> +	.ssctl_id = 0x14,
> +	.smem_host_id = 2,
> +};
> +
> +static const struct qcom_pas_data nord_cdsp0_resource = {
> +	.crash_reason_smem = 601,
> +	.firmware_name = "cdsp.mdt",
> +	.dtb_firmware_name = "cdsp_dtb.mbn",
> +	.pas_id = 18,
> +	.dtb_pas_id = 37,
> +	.minidump_id = 7,
> +	.auto_boot = true,
> +	.proxy_pd_names = (char*[]){
> +		"cx",
> +		"mx",
> +		"nsp",
> +		NULL
> +	},
> +	.load_state = "cdsp",
> +	.ssr_name = "cdsp0",
> +	.sysmon_name = "cdsp0",
> +	.ssctl_id = 0x17,
> +	.smem_host_id = 5,
> +};
> +
> +static const struct qcom_pas_data nord_cdsp1_resource = {
> +	.crash_reason_smem = 633,
> +	.firmware_name = "cdsp1.mdt",
> +	.dtb_firmware_name = "cdsp1_dtb.mbn",
> +	.pas_id = 30,
> +	.dtb_pas_id = 59,
> +	.minidump_id = 20,
> +	.auto_boot = true,
> +	.proxy_pd_names = (char*[]){
> +		"cx",
> +		"mx",
> +		"nsp",
> +		NULL
> +	},
> +	.load_state = "cdsp1",
> +	.ssr_name = "cdsp1",
> +	.sysmon_name = "cdsp1",
> +	.ssctl_id = 0x20,
> +	.smem_host_id = 69,
> +};
> +
> +static const struct qcom_pas_data nord_cdsp2_resource = {
> +	.crash_reason_smem = 665,
> +	.firmware_name = "cdsp2.mdt",
> +	.dtb_firmware_name = "cdsp2_dtb.mbn",
> +	.pas_id = 57,
> +	.dtb_pas_id = 60,
> +	.minidump_id = 29,
> +	.auto_boot = true,
> +	.proxy_pd_names = (char*[]){
> +		"cx",
> +		"mx",
> +		"nsp",
> +		NULL
> +	},
> +	.load_state = "cdsp2",
> +	.ssr_name = "cdsp2",
> +	.sysmon_name = "cdsp2",
> +	.ssctl_id = 0x1f,
> +	.smem_host_id = 133,
> +};
> +
> +static const struct qcom_pas_data nord_cdsp3_resource = {
> +	.crash_reason_smem = 666,
> +	.firmware_name = "cdsp3.mdt",
> +	.dtb_firmware_name = "cdsp3_dtb.mbn",
> +	.pas_id = 58,
> +	.dtb_pas_id = 61,
> +	.minidump_id = 30,
> +	.auto_boot = true,
> +	.proxy_pd_names = (char*[]){
> +		"cx",
> +		"mx",
> +		"nsp",
> +		NULL
> +	},
> +	.load_state = "cdsp3",
> +	.ssr_name = "cdsp3",
> +	.sysmon_name = "cdsp3",
> +	.ssctl_id = 0x1a,
> +	.smem_host_id = 197,
> +};
> +
>  static const struct qcom_pas_data sm8450_mpss_resource = {
>  	.crash_reason_smem = 421,
>  	.firmware_name = "modem.mdt",
> @@ -1695,6 +1800,11 @@ static const struct of_device_id qcom_pas_of_match[] = {
>  	{ .compatible = "qcom,milos-cdsp-pas", .data = &milos_cdsp_resource },
>  	{ .compatible = "qcom,milos-mpss-pas", .data = &sm8450_mpss_resource },
>  	{ .compatible = "qcom,milos-wpss-pas", .data = &sc7280_wpss_resource },
> +	{ .compatible = "qcom,nord-adsp-pas", .data = &nord_adsp_resource },
> +	{ .compatible = "qcom,nord-cdsp0-pas", .data = &nord_cdsp0_resource },
> +	{ .compatible = "qcom,nord-cdsp1-pas", .data = &nord_cdsp1_resource },
> +	{ .compatible = "qcom,nord-cdsp2-pas", .data = &nord_cdsp2_resource },
> +	{ .compatible = "qcom,nord-cdsp3-pas", .data = &nord_cdsp3_resource },

Oops! It breaks the alphabetic order. Will fix.

Shawn

>  	{ .compatible = "qcom,msm8226-adsp-pil", .data = &msm8996_adsp_resource },
>  	{ .compatible = "qcom,msm8953-adsp-pil", .data = &msm8996_adsp_resource },
>  	{ .compatible = "qcom,msm8974-adsp-pil", .data = &msm8996_adsp_resource },
> -- 
> 2.43.0
> 
