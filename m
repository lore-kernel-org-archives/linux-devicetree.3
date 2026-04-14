Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA74B30EF64
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 18:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776189925; cv=none; b=gcnjue1w8xER7MrwevuvBpFcMDnOJK5twJiSZZGk/kXIyD4whfn/Eop9UxEvCYEHhyfrNm2VRe5MDNJUfGS2MoDKWj5AouOTJS5mvKNlZjy7MRuANXE8pplVxqIst37PEywvNyN/jXDcGNAdMJQdikt5/7MmBidcHm/sICEyUwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776189925; c=relaxed/simple;
	bh=bJjvgZvysPaL60nBzaasDvt3Y3xx8CI9cUxUU3GFnAM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AeDfktyQF0EbVg0dJSsYGjf5k3GuAbsPgZF5fypzAy/rIsmrTCAYBzTisAICx9q9jqiBzGTsjQA4vsU28crXu/0Irvd0Va5vv1K67jYMU/OFr+miZaOXUEpxx0K8BthZrSWutC5mTNg033cZ9R6yKwjc8bPPph19lIOezkhAsek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CVv3UCUC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G/ji2Tt7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CVv3UCUC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G/ji2Tt7"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EGLPut029994
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 18:05:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MLH+Ml13shpUcCPIl39o9hn3
	og6Wsjh0MtJEFyEKsm8=; b=CVv3UCUCdoziWBcze33ltdmLepnmK9I6tjmSWJ7U
	K3aafF7sSL/xsWQ5Ma/DBphuV3CptKQGDsI2x/EndlSdtHQw7YC+PTJ/yLIZqwLR
	gQHV02mFYBdN2/xU+MsYl9SRvE9WlMO8UH256+0d0lShYGOOL4KO1JnuunteQG6p
	jLwPh0O5Jm3iiB5ri4wX5WKg65jSRFUFTfAQ1HC2haTbiX3+KfZbVsCa3RDLl2+5
	K1CzCjEvcCyVAFt3gpYduBRxHSA9Zz3YkdMGzld8GoIeTnNzjC6Ce9+iAqch5o1G
	hvjDxFNecvilZ2N6691X/cg9aBeqJwTpTK6GCjS1cMPSZg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhkgmhr87-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 18:05:22 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-605acae0d76so8018150137.2
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 11:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776189922; x=1776794722; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MLH+Ml13shpUcCPIl39o9hn3og6Wsjh0MtJEFyEKsm8=;
        b=G/ji2Tt7gWCe0HI5lmndRzXAibTTQZeQu/nNGlOLTIl0+7MLukwjGGsYukpYUxvMJI
         Ab1JjCO/9LNd5s8phyYoXC05jUxb6zNNnUXTibZioFj3eFYQTBaCVaBs+Fy36MIZ5lhp
         Z21a43SDnHjjuIBcWtg4U4aQgjy2KLtJj6n1dNse9nzAv0yb4z3OdP553/bQvQcH8RRR
         hMeaReHeCHFoTXiMB/xtaWtqoi3z8ojbnStefQeDVjM3W16xIyWmS8HA/3wwyIJUMzcT
         kvP1I0nnivHzAoukCGA1A1m4Xq3NIhJDzrkGgV2788AzkXDEfXh3ryZP5n2MK0D0xMGE
         yH2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776189922; x=1776794722;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MLH+Ml13shpUcCPIl39o9hn3og6Wsjh0MtJEFyEKsm8=;
        b=hvIoYa7q5chqAr88XoXJ6X68GkphWVHxBnyNPq/CTo9Zhz/iFtDQaWFvpfDOoN4wj0
         LptjsoqMTMnJq9ZE/2/6h3bU5vh/aR2uHiphv8DqXG2nIclTA3Gxs43/C3LnUJffm9UV
         Z1+NlqZ8Kf4SmKUcnSJOI7fX2hxN9poaqTlF9wRaqaL8kgq7UR0kNgd6Yf2gF71dUsWK
         aQtZzdCmGITo9LCDjqOcnqcN9zdssMRb1YxBAVinSikEbm9vLUr28/Hn8cEHWLp7EZX3
         DrTw4xMzOl+SpRQAUg+zgJnL3P6u4bCc1ZC8KTQWswwPKMucRnPLPlPNh9T0UWZhHPpP
         7l/g==
X-Forwarded-Encrypted: i=1; AFNElJ+NquR5TgqFc4AbuSg5xCLp24SNJ9Q1X7krvepcElNdnLhDEJdg8oIGXhiYJwfleCZfA4Evi9oEizP5@vger.kernel.org
X-Gm-Message-State: AOJu0YxFdzRezwikoYOO6e+kGpXlbm9KoS0+rnGaDWAZsioA3RTXiRmX
	TBqrwotIClh3/CrT2y/gdB1Or9D0Qyz43+VkdsSIXMjgOYPNehPaduXxo+Ewdri6RYg9l8XgHCn
	u5+iW/DZaRAuOWCIqj9ER9EWOLMrdOcs31ABn7/66T2iWIhX1i58Seg5YJYHyMr/n
X-Gm-Gg: AeBDiesPhrgHbicUTBPr/az0FtKIYl7tP8YAx7pOw79jIPxlH6Kyf8n2F9CHg7wKXUP
	0FO/rQcmRmUhWfffQp9r7nuxpjo2LZPI07y/3mRQTJ9zfjJb15nFKBKikGX3c3IxQ5y+qItnuzL
	xSQC8umnNjWFTRHXhQCmpM2e+YvCrxARRhgOB/oABHnNFzzSMmvnC68radlRin3C3nHda2eX+FJ
	yqs2QEXzEZShdNg8ztjZkW9KYWLdOwVihdlGedb2bRriEAP7iYl1dCv3NiGQwKTX2hq2gfphOhW
	doSIJNgZd8tDsJjPLmrXcbZ1sz1J20lh4Ylz6jNuuPOeyILovWhyod9O/ZO290z+yBt51RbLpht
	GCZQN6AOZJ0U8pZ44PPUsWq1rOJINPxK4otSXNwDKuoA+pkTIyai4Dr8EJyzGJGKUMATvSPvkek
	HD4GyIt8xPFE6crXNXgBfLJlkmPNvxG2JMcgrdoe1JUA+nSQ==
X-Received: by 2002:a05:6102:4a8c:b0:607:97a9:e3dd with SMTP id ada2fe7eead31-60a00e43eeamr8012340137.24.1776189922068;
        Tue, 14 Apr 2026 11:05:22 -0700 (PDT)
X-Received: by 2002:a05:6102:4a8c:b0:607:97a9:e3dd with SMTP id ada2fe7eead31-60a00e43eeamr8012314137.24.1776189921647;
        Tue, 14 Apr 2026 11:05:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3fe377e5dsm1416420e87.30.2026.04.14.11.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 11:05:20 -0700 (PDT)
Date: Tue, 14 Apr 2026 21:05:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 04/35] irqchip/qcom-pdc: Replace pdc_version global with
 a function pointer
Message-ID: <adhldkguq5xazute3yj7f2iteie7qwj6vw3wnm6ouu4gvltt7z@liwfdfdwkvfj>
References: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
 <20260410184124.1068210-5-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410184124.1068210-5-mukesh.ojha@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDE2OSBTYWx0ZWRfXzPrJRa+W5f2P
 B9Elfn5D8VUbZ8UPllepcpoHved6YbDHXXknoz36w7PVDPE/NWy2+iXfoqmhJRm/Gmy94AEs2Ev
 BoYA7N7zh1t7I+rinAu3aaU8VpjF1J1QV3yrvMVosZVSAhoTOf62LCT8SpdbEsZ1yvxr4x1OwhJ
 3HoZLCwM++pyOQ2TIJKN3uBNJ0V7Lvmwvvm3TPn5J8/E5T3ESnD6JBesvpt7C5OPiBO9wFTTOlK
 XahOeyx7vitEgTLv86TYpVEyquBcA49jZCl1j4pnebzDEemAA/oloK4J0kcLsnblkqL5tjfrgtW
 NVY08zDuDw6SihYXh6jiqjtNnliG10NVvEDTGmULz39k+nHQeehIw+seeEkpIN/7jHDMjXiRshd
 dvrKt4USL+MzElU7UT1EGy9KzrO59KllE71awze7iR9DIDQvvblgW13yvSY0/W7zyvW+ZKjxWtw
 PMRDyUVPYPltPBNnOuw==
X-Proofpoint-ORIG-GUID: 0VwxY7P-Ob_RJ0TtlooXnjhb2uU2Tixa
X-Proofpoint-GUID: 0VwxY7P-Ob_RJ0TtlooXnjhb2uU2Tixa
X-Authority-Analysis: v=2.4 cv=HJLz0Itv c=1 sm=1 tr=0 ts=69de81e2 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=k0SPMzxaIUwtrynI4mAA:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140169

On Sat, Apr 11, 2026 at 12:10:41AM +0530, Mukesh Ojha wrote:
> Now that the two enable paths are separate functions, replace the
> pdc_version global with a __pdc_enable_intr function pointer. The
> pointer is assigned once at probe time based on the version register,
> moving the version comparison out of the interrupt enable/disable hot
> path entirely.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/irqchip/qcom-pdc.c | 13 +++----------
>  1 file changed, 3 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
> index 21e2b4b884ee..734576cdce0c 100644
> --- a/drivers/irqchip/qcom-pdc.c
> +++ b/drivers/irqchip/qcom-pdc.c
> @@ -51,7 +51,7 @@ static void __iomem *pdc_base;
>  static void __iomem *pdc_prev_base;
>  static struct pdc_pin_region *pdc_region;
>  static int pdc_region_cnt;
> -static unsigned int pdc_version;
> +static void (*__pdc_enable_intr)(int pin_out, bool on);

I'd say, it's more awkward than the current implementation.

>  static bool pdc_x1e_quirk;
>  
>  static void pdc_base_reg_write(void __iomem *base, int reg, u32 i, u32 val)

-- 
With best wishes
Dmitry
