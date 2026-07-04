Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE8E17D2
	for <devicetree@vger.kernel.org>; Sat,  4 Jul 2026 00:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783124248; cv=none; b=tgxCvYmscfbPLaLn9UDahl3F5KVWnjwgQsZw4SRR9jMi4PSm4icqfWihDGbI5gSLSJVtA2W4evr2gPcxYkeLeELlspht5KrJ8KZDnTOSCKXjo8m+LUQObQX3NcWXxvT4/iJPpnHAeFRH9K27BBdGmZPgqbQWBX4Zp46mPjPT4Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783124248; c=relaxed/simple;
	bh=9C5RJUSt8UVdMbRPJGWBOVXu5hZdn4wcQY2xt5fYMVc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LM7JN80U0+qCnXp0k+wMaCnU57jpheuTQWcJ3bSl6R4yoABER46uFaPTYmS0T9T5Qd/DIAI20HBiujqAjzBq/8aXDUkmxAeM4YC7S/ygVHNwawv5BF9UTomcgxwSXM1wIFrgGBJMks2BOiLapkvA+lvf9USOOx488vwi3Cc6/y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zpd1yJu/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bCypjqai; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zpd1yJu/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bCypjqai"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KQ0a5872291
	for <devicetree@vger.kernel.org>; Sat, 4 Jul 2026 00:17:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=H1z754F1g7bGdP8+fIZCnGTO
	6+ITPOdx9vaa+Dfdatw=; b=Zpd1yJu/ZFq5Y53hjKfLmS55cLjQV6esll05S78T
	wZJ9VBczYGJoN6uCovB5MIl2bLlgBId+pU4azWepZ+5fX28azaBY/RCsfbFpTVuR
	sATEqhh9HR/cMMCWwiebJnPsPBwa6NknX6ks5sDPAlJLnitLQxaSZo/YngVIM0NH
	TrAIzwcGQhJ3lmugzWKUFNx9UZ7VXwJF6U+SUTk1m0uYoRJ/aQyEO6iN1kDujoRI
	DfJQ2OT8Zj84KT5maSVo3Zq5YE3oqPqmYNPbYbT/XB7PtGX8JSkgE4O/TvntkvQ+
	8BN3fjpb6mSzs9JnPRS89LT+tPOJ77YYSGAkYJLQrxhm5Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f648n4c04-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 04 Jul 2026 00:17:20 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c33f48ee4so11156391cf.1
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 17:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783124240; x=1783729040; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H1z754F1g7bGdP8+fIZCnGTO6+ITPOdx9vaa+Dfdatw=;
        b=bCypjqai3LEVeFW6OmxHaOXBtg0OyTpHiq+gdUkH2Vf1kQjDdqJpyV7nXHxJiRaVZX
         5xGtxElvXGfsx1Rc0sJL0wZgJuZ//m80am2FoCfCa81TzlguTXyOF9nQTwz/VBq6ivyP
         SIuZQ93dBy2Fy9DZr9LxSUIYJeqHC8TJXKZd8/kYGDc/DCTpcUodcgQV2bpVfB6nO5en
         9th7gHRM5ANyr6xNyXe3P74QLuNdFDnkcHz/OpGiwel6FpcHi3wyVjV5pIg+QJVe5JSN
         dlSDNX0Gzz1ATMVL9ThgNT4ZJVtVSXZa9IYibcHTXZZEbKWQewtjT7hbde/6vV47Raks
         u+wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783124240; x=1783729040;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H1z754F1g7bGdP8+fIZCnGTO6+ITPOdx9vaa+Dfdatw=;
        b=SMzIgfSlwAvj/2KoHiwcEMNdI7YAyjBYwA3KSatCJYcmPtlTsXBF7VHmG8BqCJxp3R
         AwXaoabJsdhhSJvf3lWGfLU95EBPCBDC5NhF+77S7dk8Ot+RDmQXIx4MKjoPQp02kMEI
         F7IPw+4ZYZ2nVxWkafYshqlWC67Y88t5NE1ai3k8Dl7EFM/hqboNZfTRognWoiSNQ6eV
         YZ/AT9fkZs91u9ktP1hBWqJwLF4Qkg9Nx8DozmFrJES7FGx4mR/oZpJpfpX1JqQc6TWL
         Sf9AVA0AYPpWIZyXW1a7oQONtPyGlJwTXPDSko/YihHfkoQshYMOIMNffAXKInQUis0O
         wbbw==
X-Forwarded-Encrypted: i=1; AFNElJ9yU0FPk3x2ZMIPMPS2payZwj6QkVva/xwUzBRv+5o6GowiN6cN1Gi3lWaT8F6e3CIZNqJFBcfGHrDn@vger.kernel.org
X-Gm-Message-State: AOJu0YyFXSPRAUYeQjIAhYe1ihz2dx5OpAqXcOz21gdtTDcqyXa0j7Kb
	UQi//CgW1OggTv+jYlE7lDHqQXmLPqv88LU1o9UGv9otRLAugx5pqDXPkYkD2CGTfW7t3OUMPmd
	zeqrJnRKuccfH+6f3wma/OSnc6euMmtm3AJ2EY1XhHXFAuzbJLutyBxMKjf2yxWSF
X-Gm-Gg: AfdE7cnyHP7HFw3RlNon44RsZ/bMkXGHxS0vXSMWDNIArV+G0DFAnsRnFyjb9xEMyVv
	hNym+SzAboioZzV+C8mycNMu1WlpFNw6SxwDIV/2Rmn4DSUEZO/OgWyWiBpTRX5W9KfOFsB6MIR
	QHQ+/RzlClCXUJa5G4FyNFIInyssxOdGTacGSaejazk5LGdKtD/JcvUzaR93/U/OMngeWuAEb5q
	wwjjnLFaCK0KImmm79vVLMo5HnA8uxD6PSA/8zpZOiH/4r/uwtFwVTcwchd+7TBmDdeRDupE5ht
	ZVGVhEaCeZT2QwlbbbRJ2rTSfS6ADXqCAwdIXm30xv3XFYmohnG0wax8eXxNYULetWYj9gAncw2
	QfjncOm+WlQpizEi2MWWZGrnOkGiYd8I2t6rrNg/QsnFuvK9Jozoan7SX3+/BUWJhWtttWcxxuV
	CZcnwT28egKT6V4LZz/p3acdF6
X-Received: by 2002:a05:622a:4c05:b0:51c:df0:1b34 with SMTP id d75a77b69052e-51c4c2c3da8mr25420651cf.33.1783124239720;
        Fri, 03 Jul 2026 17:17:19 -0700 (PDT)
X-Received: by 2002:a05:622a:4c05:b0:51c:df0:1b34 with SMTP id d75a77b69052e-51c4c2c3da8mr25420201cf.33.1783124239238;
        Fri, 03 Jul 2026 17:17:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed1377052sm866292e87.21.2026.07.03.17.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 17:17:18 -0700 (PDT)
Date: Sat, 4 Jul 2026 03:17:16 +0300
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
Subject: Re: [PATCH v5 07/19] clk: qcom: dispcc-qcm2290: Switch to DT index
 based clk lookup
Message-ID: <2vcr3x46sx5d4aogdcw3k7bqwe7bf7i24d436eb6o6gdi3zwwj@3duglhhchfx2>
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
 <20260703-shikra-dispcc-gpucc-v5-7-cc13826d4d5a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-7-cc13826d4d5a@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA0MDAwMCBTYWx0ZWRfXzZVNh9c0iVTq
 TbBU1t76LCQJb+GsDvjcxkQfR9uU+8nNXzgsLB1s04ZeOB1FsdgarXG7wM/uysA18xnP5u7jjP5
 SWKHwGn2ECFYfzCYVaTrhxQF6HI3Qlg=
X-Proofpoint-ORIG-GUID: HY1baeFpRCeJzJushQWwlOfwy0hoF0QQ
X-Authority-Analysis: v=2.4 cv=O4wJeh9W c=1 sm=1 tr=0 ts=6a485110 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=bvhocwI2OAlG0vE5sJUA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: HY1baeFpRCeJzJushQWwlOfwy0hoF0QQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA0MDAwMCBTYWx0ZWRfX+ePnxeV+jkqG
 3ZcHc43dKxhTj0GCV2+Is6BTylNrJuWUVP5ilpkabYcyreDI7WgOqusYsyHO2PYg7cUJUriQ6UM
 dqaQP+XbxUYW7e6U6Qedi22HQUT8dNn09kmrsMdRqmTQmrYNU7mqjNnODY0m97LXpQ6Meaxw8pf
 QzgmozR/cf6UI5jnSAsjbfbHWVvvlD5Xy7/3TEaGN85zbPq8DZndKTKC//CEEvWnmwleXwCq5Oz
 8U/M+/gXCGfE5sUagv4GmtdzjRu5Zdl0xZgeEo0aQ9VqWJDb2gbByyRc9EnRUdqav2a0ARXeTCm
 B8ZrfTcbEzExQ4PJTccFfT5FqTGip/1s6xrDQPOrIFfhT2Ab2kRGSPufyO1YWNvp+fyo8NPx3ma
 Q/0vIGP0jhQkTDS2Rij23OSCmtu9wn9m73dxtkIS7AwSQ+P0rej/E6xKHAbiHyA4O10G6jMQIJ9
 BsGID/CldbI5fSkwumQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607040000

On Fri, Jul 03, 2026 at 12:01:29AM +0530, Imran Shaik wrote:
> Update the QCM2290 DISPCC driver to use the DT index based parent clock
> lookup to align with the latest convention.

Why? Missing the reason for a change.

> While updating the parent data,
> fix the MDSS MDP clock source parent to use gcc_disp_gpll0_div_clk_src
> instead of gcc_disp_gpll0_clk_src. This parent is currently unused by the
> frequency tables, but should be corrected to match the hardware clock plan.

This sounds like a fix. Please never mix the refactoring and meaningful
changes in the same patch. Also, I believe, Konrad suggested that the
change in invalid.

> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/dispcc-qcm2290.c | 36 ++++++++++++++++++++++++------------
>  1 file changed, 24 insertions(+), 12 deletions(-)
> 

-- 
With best wishes
Dmitry
