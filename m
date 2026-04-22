Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED40735B63F
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 18:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776882335; cv=none; b=IkL5mrrlz/z8+FeQUY/THJiMTbJyA3RSyl9/HLyniA1WAVqmEGfAREOVrVTd8NDYu5bUVX6WJV6S/zWe8nIYMhs+PXNeJkOhNFcG3yxOJqaexoNA4iyYd9UeJuUkxmWfIFXi/HcKN6yXiTlKqYIU8vu6mFCdbPAjnY/LhgsekNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776882335; c=relaxed/simple;
	bh=9DKRl8QYVl9x5TgPt370YkzjxrOSzgrdiRjOVx4OIG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XDd3GnlUL5RZImWQweS3foxHRfkYBO1COKKmLLgzMgxmKP1dCEw55z6mTPrRL/7nsweI4OJ548mc8+LNPXnw05k3eLNLe8cEmdpRqb7NB9UX3TWHGOICJqNZu6FApKzoAGO1hAvC80dFAUCktEtjiTnG5hUJIawMIkKU6NdZ898=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o17J0P+z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YmBhH47J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o17J0P+z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YmBhH47J"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MFfKpC2956090
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 18:25:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nTvaeUQtF7QTlnD5MjA8eD/C
	AAUi0oyVrLZtmtZBRXQ=; b=o17J0P+zrrORnHuLub1eXptrRoY1Eyi2k13i4qNj
	hvzVmg2I57Uv70Nzg81dNyXXx9fIozBLgI+PHt7+MRxJc59oFut9ogj14JZX97bz
	wX9FTH8xK/bmZjy0+Pl4sD51aw/oy4IePRkB9l/CNK6W93ZML7bbDTyi80PBuVhg
	mjzVFLHli3CD7BGRlzOkuEhzz9kq9kEAyWlwQAo9h9i/PTXmqW7+AH/vDM5zVbns
	AdHY2u0XRDGegtBHKOnyBwAjBudOKYEkq/oYg6rv5MYlmDxhC2FoLUmDuFp3bWJ8
	592vwM5aMB73poeVcwfuKhhcLVs0B6oihi55ljCyVVBfsA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq16q0k1u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 18:25:32 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9484dbd65a7so2363842241.1
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 11:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776882332; x=1777487132; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nTvaeUQtF7QTlnD5MjA8eD/CAAUi0oyVrLZtmtZBRXQ=;
        b=YmBhH47JPUno6S/HVlA/JrU2EZOUJzfpgHGapQ4z4TzbPV93C6vlUQb96v0P3G1DAU
         jeeYG1c5AHM5ANmbBvxmx4lM7yNzxvvprCGJoGFYvJM9203rsY4P3gXAHNWQrKTEakYG
         4TmZ/6D45fXpKqAloPK7fv99CyrDtoTnTL4ZmSLIZ0lWwEPXd68hjOSDRwZpipa2g/xq
         rKjvFRr7kugu65cAsu5gdT96ru8aDtLXuaN4uTHkFuadsHi9KkJF07t+b0C7ltrP7qfP
         8VHLVc5hrVh1TkT3/6ArupvvjJYs9Pjfsm6vrHkR4srWU8zGcC/Ck6DHEmYHCG/A0ovI
         8K2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776882332; x=1777487132;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nTvaeUQtF7QTlnD5MjA8eD/CAAUi0oyVrLZtmtZBRXQ=;
        b=sY6XFbEJG5+Csfa3texyqvvhs2Bu4qHKlXWT5E9/lsXJGhD30XMk1QRdMIXAlqOS+h
         1Odp/Bk1ZMkb+R/VwvMarQMVbhsxDpZub2LmUBxjhyIX1MMl5DC99qvicnkh3EhL3ufL
         UaKm1MNxXOD5JlDcpRCGRYDp7s1IYwxuwgIPrC51907ElyHJbwquYnFWhei9+1A9u5b4
         lQhUTcFf8THg3vN/SkXLGsJrB+ZlRTgy4x6sY6XNLEUSCxZRjWpMZLnnf2LJF3d3lF4f
         8fh8NTJzIFe8Q80nKIGHM3Cj0bgArs3020ACGMxViXFsBho7YvVa4G1Zn7+o0IlhwBl1
         hbgg==
X-Forwarded-Encrypted: i=1; AFNElJ8cc0e86R9jLuaVbW5KFY+q4V9F2L7vv07JWGZQqSIYW6LIKOgwLRz7tzJRwvj9lodwufyQVNCCEKpR@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+MS2nbmaw7kqScV68f7jy0ttPkh4ugD/YRwLszIsU2KqLV5N4
	l07/3LJfyxyJe+VhoOoNRAyrBARTUNPQC4110NgKh4wiBvVo3lCpdiyboZ2Qybf9FsvY1DJS86u
	PqKRnUKnKExq0LivwhdEetWoXjJe5SfzJgPb3ieoKcMrrWIFIbz+aZhdYAj5dvU54
X-Gm-Gg: AeBDieuOxhm3s2o/4OL7t6X8QfGG9udwOLzR7s9ZVO2kdLQdLHj9YP5EyrF3b1sF5f/
	kka+ZZ2vB3hvxo9QnmTYfy85PMNbrYikvI+/TKgtFNF8qpSeK6ndD2enbHl0DqPJUxzuIsSoMsf
	Q38IFpwIY5xVRs2T7xsimD3T6P4omqMumsUdb6xWDscmfytBCcab+wIBHaX6tQBAzfN/gwrJoQD
	OrsUQrBkuUFhr6k5smMsdlNc48eAD+Y487CuUCQjEH6mbqh6f3/Q0f1C8sPm/lD/X9yX+wdeywA
	6DYu0gm50vQjeCrEm5QgTAqDnG4PfNlWAMxxl3FSmjgjCpue4NboZN/oX+8fvpCSOQbwo9brZyM
	G6Ja6KaadTIoAjT6QHJnAQTcSA7U6n88tmp60nGswHB9R5E07Rjx8uYWGOP++HWnCsCsHeNYxRi
	t+49Gq41HDRKCmVTsPZqYEYiOYPDXnvcmK5q12aBBt+0b4EA==
X-Received: by 2002:a05:6102:689c:b0:608:94e4:1c00 with SMTP id ada2fe7eead31-616f4e7a272mr10488488137.2.1776882332136;
        Wed, 22 Apr 2026 11:25:32 -0700 (PDT)
X-Received: by 2002:a05:6102:689c:b0:608:94e4:1c00 with SMTP id ada2fe7eead31-616f4e7a272mr10488468137.2.1776882331561;
        Wed, 22 Apr 2026 11:25:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb5f652asm36295321fa.12.2026.04.22.11.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 11:25:30 -0700 (PDT)
Date: Wed, 22 Apr 2026 21:25:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Subject: Re: [PATCH 06/13] clk: qcom: clk-alpha-pll: Add support for CRM
 based PLL ops
Message-ID: <olwylygq2ljeqa2jobis3nfryqtqfqui3uhtb5rpl6ix4gegli@sioyi3kyvb5f>
References: <20260420-cesta-sm870-dispcc-v1-0-eb27d845df9c@oss.qualcomm.com>
 <20260420-cesta-sm870-dispcc-v1-6-eb27d845df9c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420-cesta-sm870-dispcc-v1-6-eb27d845df9c@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=KPNqylFo c=1 sm=1 tr=0 ts=69e9129c cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=x0UCZEZdVX72ttqwImEA:9 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: 6ALpk0N1o_C1kDIPyYo1CqrsSQp4kGjI
X-Proofpoint-ORIG-GUID: 6ALpk0N1o_C1kDIPyYo1CqrsSQp4kGjI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDE3OCBTYWx0ZWRfX5NjyMlpe4LqU
 nalSj9J7fguN1PE2XFFNJGnDibNFq+B6dvSPMw3A5ej7nbaWiudp35jKmD7uPqwrMK7YC1EqPbC
 pIwAESr55lJ77avjUAc9w6XaHn35LinOFLkAxK8Znj14hkLNRmDbnV2/LUJXhVcAXX09rk+F53c
 eiWk0gBkRdaaErQfTktl+tHDRECpU/Se8OX7kk9Pv0TFQs2Zi9jDhPW/j3dNBF1ihc3bLi+x/Ym
 exoHexyfoLY/PKrrrdXgCOxYNGLCd71Y/uG2uXBpAZAekRmbOZoJyevJvfjaR2LF6EDcuZNxhnF
 tmP6hhGVAJNHSCyagQlESAcwM91q2us97aPW71xi+c18KonBnyUxCo3PHGEg2OwJb+1IM4JczBf
 4Ls/twetGbOIw8wiedFjkEjSw1qfYQRFRi9D3OMrJ4VvKmDOg4G1WLGrPnXI2Jx2XEpVJeikkpt
 heblpKszQ47qoHIGZ9Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604220178

On Mon, Apr 20, 2026 at 09:58:59PM +0530, Jagadeesh Kona wrote:
> Add clock ops for PLLs that are controlled by the CESTA Resource
> Manager(CRM). For these PLLs, CRM programs the hardware based on
> aggregated votes, so the clock driver does not need to program the
> PLL registers directly, but can still model the PLLs and expose
> them as parents to RCGs in the common clock framework.
> 
> Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-alpha-pll.c | 7 +++++++
>  drivers/clk/qcom/clk-alpha-pll.h | 3 +++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
> index f8313f9d0e30ffd5393e3163ebc0e51b2bd96437..67fc97739d0d4c26aec0bac5d43d1b87d297bc6a 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.c
> +++ b/drivers/clk/qcom/clk-alpha-pll.c
> @@ -2,6 +2,7 @@
>  /*
>   * Copyright (c) 2015, 2018, The Linux Foundation. All rights reserved.
>   * Copyright (c) 2021, 2023-2024, Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.

Note: you are supposed to absorb th QuIC copyright.

>   */
>  
>  #include <linux/kernel.h>

-- 
With best wishes
Dmitry
