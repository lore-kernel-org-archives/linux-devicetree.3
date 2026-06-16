Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A9478F26
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 00:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781569896; cv=none; b=LbJKtRhM71ppeA9NggyYwOr82jas5GFocBMf3+mCsGnUfZgi1U/8IGKTkcLJBH5CNfw/WXaVmyD7FTdYqqwxYIyU28MiIixaEgAF6aALSk3ALyKlnbyfkjd7EJFEI1sd6tBf9xyDx0MpXnrqGVK1cpvs7EJB1XLqpzlA6AXEQ9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781569896; c=relaxed/simple;
	bh=MHwjTHvHldb8ebS0Ql9QpRAPb/oqg9bsQq0znVXqMUo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=feWoReNLrBRAzcgT8pQRp6E1vwdl/25mpVitRaFP9Q4Z0TJ4fe0JEW/anXb4TWhCE9ww8E61m9HRRm5XKmY6WgUP+c4gop4P3bQ0w7AGZfLx4mBRW0v5W9qyKAN4eqkXi/pjCMSd1GvNPmEBWSh7hEVIgC2BviXI/zLj1iiZrjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ANKS3kF2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=by3amVI9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ANKS3kF2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="by3amVI9"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G0OS9V1562289
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 00:31:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QeuYUVvks51Py3yMh13V2/P4mOBXDRgd4Fev52Wcl48=; b=ANKS3kF2hZKZtse+
	f6jUFa2eG73NobFaN9XjaoxGsp7wCcXzXrVIFD4GI6vjsvU3Lovr+ub32uxmbHly
	e+35JvTF/Ci4lveSCbzICDz8yFk5DOujUAqC9OXVEuAGRvMTWNkCCBE/bU8NkWio
	OHJMrrUYJ8KeXyiJo0aWpP3r443uc09pFfC3bjAlJOtIw+rr9uSxgkqyueuyp9RZ
	njl7/mCWjM2+gYJqJ3lsf4tsmVtWQiB9M48uIBzOetTnH8cCJXIdQUUp1E0tzlwd
	TYStRuLEVtveh5dWLGR4QkR3eD4RgKgDlL/0LetU0xiJOJr6F3k6BLPiCvXjx3wA
	fZ96rg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eteydbr56-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 00:31:34 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-91576c147a4so1012319985a.3
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 17:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781569893; x=1782174693; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QeuYUVvks51Py3yMh13V2/P4mOBXDRgd4Fev52Wcl48=;
        b=by3amVI9IQNSarKpIXLt+pJXh+kvn3I4jh0FvhduS0gRvzpunHOfy9jgdj4DqRYLd8
         06EuLjcB02MNbwV4E7QdZEFn2lK7VC2s8N3+/GjQAReRuHXAYtBKPYRohdOLzQ59bMT7
         n3sGVNCb4YcgOngxm0S+MKICdOpc2/aThNXiNG1v0NRZOmNTyLdou6pFB3wKdvgQhn0y
         56LOMsWgRm1nkQqqa1dAx5aAmUqG7iFNuu1idQA2r9P806F4CbriMOV54zmr7dlgXum+
         +0QD1uzKfih5xJWG9PZjtPospb91qVPDnU8cDjnDj/+0AgGkE2k5+acRNPf2J3i2zqTp
         E5ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781569893; x=1782174693;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QeuYUVvks51Py3yMh13V2/P4mOBXDRgd4Fev52Wcl48=;
        b=nmfJvGr7wdTvwudy4ZL2YdrC5QQo/9UubO3QHrptgNradPCB9C+7PP1+grx6sKqAAY
         jPoCt93D8NM+4vlQSEDgOInSJ2yqav/Q4dI1AXfO9vRxBRtzYNL/R812vZzU+7Jb1Y8H
         ZvzD5Eo7IJRnl93giyEy7WfOjn0zP2tunkSFXT72YPlIoLAEDt22eZYqBO+8Xs1BaahO
         X3q3eLX/zBsl4DCL4R2tcZVjQa9dE6GGkhaGYIm7abNd+rWVl9RRcaePgVIx6BjP/miF
         ptj1+cdrRo4bizsxyZiYKaVsz+973i/JvPNTKCHQUYXAm9o57h+I/5bTP8cCZIi+wWJ3
         nqdQ==
X-Forwarded-Encrypted: i=1; AFNElJ9kdXWpTePUBmwI/UfkFnEdeKw3STVChRru7ETi3h7j6Q9IVg+X0EXHAt0bsn/sBceiSIYp1XAKVwoj@vger.kernel.org
X-Gm-Message-State: AOJu0YxNn3DMUv+uo1veHz6frzEPMsNnNpQAMVxW1JJDX3fZJqqGG2a/
	3DTshw5wCWNh/CrIr7LlTxnX/UwlFpQjsC6/Mo1S8wErQVdwnR/PVFNZivVMd7R45+CdiWc0tzH
	gibxzcREeiD/0gdibm3YYpLelDgEQRgbwFtSO1V4spuy2fdS3TQftHjMyp9wzt3uz
X-Gm-Gg: Acq92OEREVxyF9csy7sHlFxx1gNQPGDE/N7qmHOe9nw92LbphzuUg9n/67V1tI845/V
	nwokt1Wd4C9VFs++SPToD2f4Bw22D03xtmlJO3eZlCfvGGaBqBwY/4MZprZ6tLU3ejH3VGjlW5B
	nf8nl8WlOXRwTOkgxaXIJ8PzyTTUSoRg0dvujeq+iME2nML5UiSlua8JsUSpg3AfCrUpXr8TY7p
	DenAHYFGoeN1QIbBBt91R6SpBWd2rgmnAs+Dp5kA3aUeWnfWDNgAkxQogRQlMxY0QXeHGBe0/B+
	w4vGvndwNGuPXfHJNj3oeWCvHu3Ia3zlGDrlbwxe4Rv54J0ZwihhhyIca2w+AeQZe1BJlqPiK/7
	ZIsrMI2CWIqRZIroTX2IZWL5QO7xAFsKoZWeuWqQMR6ftXxD6Yx5Zb08H3MZAGbiQ8a9+W0R5o2
	/GvShkRxnjeTdVc5AlqvWIiQKI+dQYcHASXEk=
X-Received: by 2002:a05:620a:390c:b0:915:7e22:6f2e with SMTP id af79cd13be357-917f089a6a4mr2109734685a.24.1781569893327;
        Mon, 15 Jun 2026 17:31:33 -0700 (PDT)
X-Received: by 2002:a05:620a:390c:b0:915:7e22:6f2e with SMTP id af79cd13be357-917f089a6a4mr2109731085a.24.1781569892836;
        Mon, 15 Jun 2026 17:31:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1a734csm3110455e87.40.2026.06.15.17.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 17:31:30 -0700 (PDT)
Date: Tue, 16 Jun 2026 03:31:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 14/16] media: iris: add Gen2 firmware support on the
 Agatti platform
Message-ID: <zutpgilzb3v37yb4hc7gsgirsh62e3uuzo2hwzyabsgn4nxoag@nglxdirumfv3>
References: <20260616-iris-ar50lt-v5-14-583b42770b6a@oss.qualcomm.com>
 <20260616002607.0BABA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260616002607.0BABA1F000E9@smtp.kernel.org>
X-Proofpoint-GUID: g7gW8GPCY7i-Mv2wcY02EIiUbBa0hM4D
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDAwMiBTYWx0ZWRfXxbop0U9KCtoJ
 RdO29r3xxh4mk40BI6nfNtGdqDGL0fjjuvaWoDw15VuQlVms/XWVwojcCLkxiABgrPZ5WKNyPDp
 4lJfk+DdBUQoFu0Pj7O/mN3S0XEPcmk=
X-Authority-Analysis: v=2.4 cv=QrJuG1yd c=1 sm=1 tr=0 ts=6a309966 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=c92rfblmAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=j5hSHYduVrFwP0ah2ksA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: g7gW8GPCY7i-Mv2wcY02EIiUbBa0hM4D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDAwMiBTYWx0ZWRfX7RUwgykNdBOk
 vIAIGQSVREkIrl/XY/W8cYRIurnz4b8wtBRxn5KgOEawZPDVVWetydrUAejri4e48wVHG+9ogBf
 bXPvUOhAGPOQBfwc1sfKgtorkJXCPjlwVOhLoLSGe5PB4EDvVAZBo48Y2H9NllxQBgsFbzwVMDV
 o9UhEK8UZgFgd6xF2+OeJ0laIw/zyX8zSFdgnmlFdVbFFH+U+JnULHrsOWwzpl3OW1VF5nPfNH7
 1koGQ87Rt4pVJva7OPWAUTodEUCSGnC6ZbLtw+CFXuRUws91FF3uo5FzK0+pgZqwyaI9Oj39SB0
 c9tU5dtbuY7OOe55J/LtrKExZohWpRtNNNsGDvqYseSlTZjdFIUxbK2r1hkba29E9Q3ciiSrL+d
 tBtJb4kDth4XY05PbjEFuHKi55PkPJqs1Lgu5E5fmiKXkuF/smJOmWiOXw5dZvAoT1uuZAbE8jD
 x6BPTnF9fmW9fo6DAMQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_01,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606160002

On Tue, Jun 16, 2026 at 12:26:06AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Incomplete dual firmware refactoring leads to build breakage and NULL pointer dereference during device probe.
> --
> 
> commit 56abb89242d476eadcfa7c399ffc9ee1dfc1fca4
> Author: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> 
> media: iris: add Gen2 firmware support on the Agatti platform
> 
> This patch extends the iris driver to support both HFI Gen1 and Gen2
> firmwares for the Agatti platform.
> 
> > diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu_ar50lt.c b/drivers/media/platform/qcom/iris/iris_platform_vpu_ar50lt.c
> > index 393256f39112b..d9de7dcb59e3a 100644
> > --- a/drivers/media/platform/qcom/iris/iris_platform_vpu_ar50lt.c
> > +++ b/drivers/media/platform/qcom/iris/iris_platform_vpu_ar50lt.c
> 
> [ ... ]
> 
> > @@ -78,7 +84,8 @@ static struct platform_inst_caps platform_inst_cap_ar50lt = {
> >  };
> >  
> >  const struct iris_platform_data qcm2290_data = {
> > -	.firmware_desc_gen1 = &iris_vpu_ar50lt_p1_gen1_s6_desc,
> > +	.firmware_desc_gen1 = &iris_vpu_ar50lt_p1_gen1_desc,
> > +	.firmware_desc_gen2 = &iris_vpu_ar50lt_p1_gen2_s6_desc,
> >  	.vpu_ops = &iris_vpu_ar50lt_ops,
> 
> [Severity: High]
> Does struct iris_platform_data actually contain the firmware_desc_gen2 field?
> 
> It looks like this might cause a build failure if struct iris_platform_data
> hasn't been updated to include these specific gen1/gen2 fields.

Huh? It's listed as a dependency patch.

> 
> Additionally, does this introduce a NULL pointer dereference during device
> probe? If iris_probe() in drivers/media/platform/qcom/iris/iris_probe.c
> still unconditionally reads the legacy firmware_desc field:
> 
> iris_probe() {
>     ...
>     core->iris_firmware_desc = core->iris_platform_data->firmware_desc;
>     core->iris_firmware_data = core->iris_firmware_desc->firmware_data;
>     ...
> }
> 
> Won't this dereference a NULL pointer since the legacy firmware_desc is left
> uninitialized for this platform? It seems a prerequisite patch refactoring
> struct iris_platform_data and the probe function might be missing from this
> series.
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260616-iris-ar50lt-v5-0-583b42770b6a@oss.qualcomm.com?part=14

-- 
With best wishes
Dmitry
