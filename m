Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9B112E1DC
	for <devicetree@vger.kernel.org>; Sat,  4 Jul 2026 00:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783124293; cv=none; b=uMxCRe9xvMGvznf1lrLtw2WbESjLpKFElNAOanEzw3fMIjix8XavRvEaBLiX50Oq/1RpHDGZ5VswhocIx8a5Jf9GcGmuQo6zBK6M1pganM6FBqBKnCVnEXEnllVvSy15au6cb7CsWkL8EERJ/X35FzjDUBt2NfoBI5jdukQdu58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783124293; c=relaxed/simple;
	bh=mLwEvp20IXBRwdat+VIdPCH6rg2xY0MI+tGWK4yiKl4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WolDT7xrAMi5R8FERtBOh2lihCgUFRy/hF3dPBdR6lrwz8EWDW96IULfDRSd7vveZ7KrF2PgAaZlnCFl6ks8eTPOkgtk4Nzf+fmkLkvAzcJLwaGSWB/S8cr5nf0nsmgc40NGpzNJyurGbu4zOGxqcaYhe91rVuvrP/yEzWYWAzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ijli7j/b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XEYpNvlu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ijli7j/b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XEYpNvlu"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KPVns888361
	for <devicetree@vger.kernel.org>; Sat, 4 Jul 2026 00:18:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Qu88vDNn8lT/9pEXwEgjFich
	A/sNekO5eCuOlfgco5Y=; b=Ijli7j/bVDtCFJRkN2n+vG0553UrgpQF3XAzciUf
	03KQxfYmcDpQ4lDfvqn/6s1NFjUboUUVdb2TyVo6IjsJ38v7qsHPqW81rKpjPxhq
	BhVfF896srmufyPFREzTGKWmNX8/j5ugsQtrbg5Rj5b0guPDpBgzSmByxMy3Yyuq
	EcbMY//a5J3nUKAk+u9c+PoCWEPfcks+P6lE3YjIw2UerrsUQyu+Rn1nqowuIHkG
	Y61GO3xRY4/igmjZOdXE1LLLVUAO+ENKwHHKa7Gdx09vNyAAcp+aayflbYoQFEI2
	f+roSM3AJ4Ky5kLh0j4C2IXQPeyRfpg4AXeZ/+nkH1RmKA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f682bu9tx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 04 Jul 2026 00:18:11 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-91ed0e140c5so182852185a.0
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 17:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783124290; x=1783729090; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qu88vDNn8lT/9pEXwEgjFichA/sNekO5eCuOlfgco5Y=;
        b=XEYpNvluVIz4jU7BVjetOgMPkbS1HgUV+VFYQkDFaf0ZFVb6mNbTRSIUIU0HtDsecR
         6fXdVsHIIF7P5bIFNDNg4atHwLbRWYi8SdcbcZ9BziHJ6rFjHWqxVG9DY8F9xWGyPqxx
         u9zB00Ybq8rggniZAkHrLRZpqa1IhGoWcqwidBKS5UluAuXnk83j1vFKixGyjGsK5gax
         z3GaM6QtTsBVFi/QGXviDioFtYX4Zk67BFul/ZRjCTniJqHGWjvNB4Rojg5BqgKTc10r
         EkUgK8lcmrVQHL9TKPrYRKYO+TmojLDtvhn0lhDgmtoOhpM22t2A099TBiR+slL7pCVL
         lqEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783124290; x=1783729090;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qu88vDNn8lT/9pEXwEgjFichA/sNekO5eCuOlfgco5Y=;
        b=epwgSjMFkmSdMLUUGAIk2IXphc4ZzV9F49+cZjyL9jvlNxdHLKdV2HXWUA8C5d9Rwr
         gfWJEY5s0rw4qxnM0UJ+o1/qQgPNPnSzic1DNXZd+YIEagF3ZopHJASg/w59Rdz/LrYL
         Y+gM30goNbiZ5C3chS7uxadR3v1I5Pk4+HqiB3f9KkE0UhPJpYyB/cegJk3PwgKjksPX
         +9N2Jrq9yXOhmvsggszQExCYuAV4NKaEGuV5017kqlpTFL2miaPO//QtY3+chIEmof/y
         G5iBlGnR3ONgu2TFMLwlcExiKrGBTPeWcQQbCTsQ7wNEN65SBwzk3D+pbBnmw7dVNCzq
         21Ww==
X-Forwarded-Encrypted: i=1; AFNElJ9vRj8BieaK46SWT0sw971GVkHh2ZlixIFmDPUbUiAq2X67e0163tFf3dFvr3SSS2m1q+/9iswpYCmc@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe61W+EJ/koPBnbuccviirdetc652ccX1aWc5ynFSHb6BUIcEt
	VuxZJqHyjd67OXdzmBw9Ad7TdzKMPcGcKC8dcJb+ojc54f8gsjbeP4vZBJMLrJk+PZ8XF/F1yXy
	Rbr9V8kmdX9bGoSkEq0bOYkZPoTiU+7nj0rmpT/rHBGxielTJNq2My1JrkcSCpBci
X-Gm-Gg: AfdE7ckVKAmSTDkQL1AbOQVXfefltXKN3fLkFXQ/PD5CRPFBogtfWWL7ZG+MKJlUqp9
	B4lf+x8JBg8im0mP4Tjt5FvPf3b2wdc/lWHpM5xgDRzjaXS9oAtCmBSvCx696ar/vOEtTedqwL6
	sK21TlAKMFZEGbtWDJNTwGHG/cgXxZvoJDkrhhn/DWH+pUnUYrjOTBs2Q6SJcWtVKZYCG0H3yJq
	T++C/t2zlXbBRRRsE7Uz66A5DKthXb7AiaG0W4LMVNP9H6TsjsEvmKmtYLO/74GhLhi6Qo1VlA/
	qGZoPt+8IISs3PoYlesz27PCjDb1oqPeOR9/peesTWlnesr+eDdkhdTs6iwLxwRcvpuoLmLe91p
	Iab8ox8q3bhVTOFwBg6+Yp+QMXPFjRvYfUEY9JZgvYAz+8k3xb6b/YsQSh5t499E14ZPjqUKH0B
	VYXFudIN8gu7/GLXVGni6kEdHd
X-Received: by 2002:a05:620a:370e:b0:92b:6805:9191 with SMTP id af79cd13be357-92e9a53c040mr220537685a.73.1783124290069;
        Fri, 03 Jul 2026 17:18:10 -0700 (PDT)
X-Received: by 2002:a05:620a:370e:b0:92b:6805:9191 with SMTP id af79cd13be357-92e9a53c040mr220533485a.73.1783124289565;
        Fri, 03 Jul 2026 17:18:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13c1c4dsm850468e87.66.2026.07.03.17.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 17:18:07 -0700 (PDT)
Date: Sat, 4 Jul 2026 03:18:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 09/19] clk: qcom: qcm2290: Set POLL_CFG_GDSCR flag for
 DISPCC and GPUCC GDSCs
Message-ID: <e3s42sg5lxb6e54dbd5wyvdgtcakolt5assoa4ukqtgkgus366@4uzp27sftrkm>
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
 <20260703-shikra-dispcc-gpucc-v5-9-cc13826d4d5a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-9-cc13826d4d5a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA0MDAwMSBTYWx0ZWRfX+uehLuOftQRs
 uz558Hhe/63l9i3ER5jl4MDdC5V9pAQT6EsJiO3X4txyRDpyvNqGw5tykyjPASLfB5xJHTS5jFh
 o0dXwtmlCte/sn0w5iBM7vwebYp5AZV3lUU0vdfG/7001Jpco2PILGH8yxTGv5pqQgJTQatRUKN
 zRnOd33LGdTbaCOBU9cK1QlrD/9I8bXOQ9xI+nfPpZS1RtYBGW3IQv8jQqS5exdCF5JOl1h8QUG
 w21yoAfHap7y9m6+8Sxae9mLIRfS0taVIDCPUwUCeFg6eKCkvBQ8QviJME62RXBbYzj455dPqH5
 FcopmyMbsGSNTEnRLBM83bvcwmIEqi1MhyR0gS41qdmL4ZN9iwWKYiEqfDO5DTJ3TnYJ4avOw6d
 ntFmtK6TL+Ti4093mxk8kHVNrvhVJPE2FAHrygpqzXSttRNxNvEqgkNRBJe7QoYNxIaEw2RpFIl
 4C8gs5kDln9/3R4n1jQ==
X-Proofpoint-ORIG-GUID: DXMeMI_8QWC1NlhP9XMa5kz4Gli1okfG
X-Authority-Analysis: v=2.4 cv=cc3iaHDM c=1 sm=1 tr=0 ts=6a485143 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=oFJMpgkmR7-raAe1-hgA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA0MDAwMSBTYWx0ZWRfXw1ff0e23Bh5w
 cGJpkLyUY4oXgSiQTi1KLegtwdDo52C5nPFfr/+BRv8xiLZuuhl4trIVhjE7H+OHD9pO62BGiWm
 qSDukHGRWfK4CwtRy/bJ3+Oa+1SOLAA=
X-Proofpoint-GUID: DXMeMI_8QWC1NlhP9XMa5kz4Gli1okfG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607040001

On Fri, Jul 03, 2026 at 12:01:31AM +0530, Imran Shaik wrote:
> On some targets, the GDSCR status bit may not reflect the actual state of

Which targets? This is all about Agatti.

> the GDSC, instead the power on/off bits in CFG_GDSCR must be polled to
> determine the GDSC state correctly. Set POLL_CFG_GDSCR flag for the QCM2290
> MDSS GDSC and GPUCC GX GDSC to ensure the correct GDSC status. This is not
> applicable for GPUCC CX GDSC, which relies on gds_hw_ctrl status.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/dispcc-qcm2290.c | 2 +-
>  drivers/clk/qcom/gpucc-qcm2290.c  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/dispcc-qcm2290.c b/drivers/clk/qcom/dispcc-qcm2290.c
> index 89a6cdd26217381cd44a515766363cf94d0aaeeb..6ee074555099ab72106cfae7c21adbd1b4a0fdac 100644
> --- a/drivers/clk/qcom/dispcc-qcm2290.c
> +++ b/drivers/clk/qcom/dispcc-qcm2290.c
> @@ -467,7 +467,7 @@ static struct gdsc mdss_gdsc = {
>  		.name = "mdss_gdsc",
>  	},
>  	.pwrsts = PWRSTS_OFF_ON,
> -	.flags = HW_CTRL_TRIGGER,
> +	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR,
>  };
>  
>  static struct gdsc *disp_cc_qcm2290_gdscs[] = {
> diff --git a/drivers/clk/qcom/gpucc-qcm2290.c b/drivers/clk/qcom/gpucc-qcm2290.c
> index 66dea9d2a0e519dfc64d977ef107b5c875da3869..3b130f69bb93898ce49654f2366851a7c1c94524 100644
> --- a/drivers/clk/qcom/gpucc-qcm2290.c
> +++ b/drivers/clk/qcom/gpucc-qcm2290.c
> @@ -313,7 +313,7 @@ static struct gdsc gpu_gx_gdsc = {
>  	},
>  	.parent = &gpu_cx_gdsc.pd,
>  	.pwrsts = PWRSTS_OFF_ON,
> -	.flags = CLAMP_IO | AON_RESET | SW_RESET,
> +	.flags = POLL_CFG_GDSCR | CLAMP_IO | AON_RESET | SW_RESET,
>  };
>  
>  static struct clk_regmap *gpu_cc_qcm2290_clocks[] = {
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
