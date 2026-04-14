Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11BE3D75CF
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 10:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776162844; cv=none; b=dyN1QQlZ0gZfWaBXxobTFHeWO7GsU/w4fSFqakwPzuIJqQfvqJUG4YIYn7XabUmTpPbzTVGi7KF/jkU3jZaT9tJpDzTtgOtBpvE3YHXCLmGhUQE2JEUxmov6oYaKwzFvvNyzKzLa65UXlgwUAg5hILVh8DeHbGyZyRI8dYRyfic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776162844; c=relaxed/simple;
	bh=6xVop/Vp6aPMRmYhd/BDDjugJx7MJYQ7ilDbOya3PP8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wx++5o+3eKB3k2ZfxGYGVlMJ1H+Ju6kwfd49REnEnxk5QcIg27HvNqDA/KfjiPi6awmdOg/vvS/eA1zHSStFYU97bC6CVh+ZfuGfRXiKXra9xKeue7o2Co5Eq9B5Di2jkILGuyu2qGMIe/P7z30CzK5hdyr/ZAkr54B2ypoGsnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O5s6uWQ7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cz2Yw2xd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O5s6uWQ7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cz2Yw2xd"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E73Jnb362226
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 10:33:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dw877TpVaxRflXLBD58PE5cB0SmsbMU2KUvevDBMkuU=; b=O5s6uWQ7H9Rt3a1O
	QOdLyVN2ZIocXVY9FUdfMmx5g961XMXl1pBHe1dPIC9+mM1KhgPctWyTg4z2xwx4
	q55Gy7EDbMxUqD/u1uIZU8sK5bMRcAgzCrd02Z4YnFTqQeZtHis+BFkHoHRxGTAp
	Zuxw7nGW17W7d+ILneU3Gfcn6uSxMbiEVIw5EwqR3mmj5/yaGdV4qXSSuu4FhXNT
	XrrcxlECKmfLtgBtZz7Rd7QtKzLlfeMPtobhAWiWD8FyhzBs/s+snq+irKjuPP0c
	YB3xyxbXXVtGy59vsElhtjgjGpHQiIS/ijL4+Xr7W9eJL5Qb3kxSjAHTtAgIWFtH
	xZdtYw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh870tatc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 10:33:57 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d5d076d88so11791391cf.1
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 03:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776162836; x=1776767636; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dw877TpVaxRflXLBD58PE5cB0SmsbMU2KUvevDBMkuU=;
        b=cz2Yw2xdo5vN/WCav8zwcFyvRVX7h9fMcelD6+S5Y4OG33/wBCwJL/F275/4abhmlT
         4RXYM75usKqpr/JBQpyM/y7R+iIhk4N7XIwKEb451HEV6Neay/d6rVkNzztwyRSHXd28
         IP/I9yY24/orqadhYFfIODcInb3VFG7uEwYQaER3Fa8cA+klxk/g/Ffvz1jETEt3cWCF
         EhEW/w2zfOL78K27NxV4p21GIEzyDbVPQm6pvpTxZhMMIuMkZUYCDSAn88I30Zn5oQFt
         xSaOdYdRVu3ByLi5+wpRLTEczb9a2MvB7TBPLrH64aR3qN/KwlhOwD5Fe4iLTsLYqyR5
         Lqrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776162836; x=1776767636;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dw877TpVaxRflXLBD58PE5cB0SmsbMU2KUvevDBMkuU=;
        b=Ck+ELBld1Q2aWkkAbqCMg6NzQWdq/Fwj1osku6m7Z/5IdcFz1rC8NwZ/7XzEUNlhNw
         FALQPbc1GJLmFmehgiXbW4y9XncLx86xXoUuDSQ7VXdt8IcLfVJAxzCpNckq7xGDBomV
         1wJN1Z7qb5odBfX3zNKQAGIMBFi8HP36KpGBQog1QiUBESqIklZ/OKE77Eka0SUBH4eb
         6yvYb6h4coF5aotsPlZN8ncP+5QcLcBZkm3pQakQTHPNuTOLzVYwCfa41zVX0oqyu3gR
         sBXyQgZWXKjY/gYKdqzFWzz7pISUXRlUJG8G3LWFauXhSPP3LJjkgbGlfrWzggJufe/J
         Ag1Q==
X-Forwarded-Encrypted: i=1; AFNElJ9YTMiljeSi0Z1DP+QKks/Os5/cNbX3KaWooHOLDeWXnD04WTeQz2KAbuAyBP4I2MQ9Hpimuwtk/FqL@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4MPToTS6hzIPxDt+lCO43vCfSDcaiHQsK5+yIdoruDVO42kby
	0EnnJC6uv9o4Uyi0Y9VQj91TjNCUX/MriZX/2WSgORl1W/Ka2/SHaz1RPopyNkIUrWNiBglhS6x
	ORvymunBcak3/lR+uK8X78KCKh7lLd0sOhqkZR5HthTPXsQ7LlPaz7/9k6HeC4E5H
X-Gm-Gg: AeBDiesZ8xJYJJ7SvFV8DEofB1K2d0T08JVnOdIKnYzYCL68hlSI5fpAlv/sF+LlqbK
	xsYoHQ4gdd91xlwN3NXzdQ8oXsETUjv4ts3kV3ft+1WBXe3rs8fLD5fHs50AERT91ZgxJ1x6BuP
	j+8KdyZt4Av+L+2IMhgvzhZF1E2y0qYNkP7gAyFg5NLV/sxeFAt9GB+O8A2rhbZz7hmypudU2SU
	mN9UXulJuzgAIM+NfEvvlR8qoqM7Jd92R6fWrLxqtftzjGdV1TK3mOZjlQBEd/zp6FfJDNUd6VH
	NS6omh517eUvQD7XkG4QTtsPCOav9/LZZk/+S6ozMetv0FekYUsiXaKDn+hBNMSNLo4hts4lzZM
	N9vG5VmpmBAI0bT/poaSnl3AwMgK4R9PtZlH0Uuy4IptgCLTjUy/aB8TLPkgY/2qTcXo38nGuCC
	H4xPT2YjKKlwO+pQ==
X-Received: by 2002:a05:620a:178d:b0:8cf:db7b:6229 with SMTP id af79cd13be357-8ddcff969e8mr1534353385a.7.1776162836135;
        Tue, 14 Apr 2026 03:33:56 -0700 (PDT)
X-Received: by 2002:a05:620a:178d:b0:8cf:db7b:6229 with SMTP id af79cd13be357-8ddcff969e8mr1534351385a.7.1776162835709;
        Tue, 14 Apr 2026 03:33:55 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6718f52c111sm1018232a12.18.2026.04.14.03.33.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 03:33:54 -0700 (PDT)
Message-ID: <462eb5f0-e05e-4cc1-8d6a-6b06e105a517@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 12:33:50 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 4/7] media: qcom: camss: Add support to populate
 sub-devices
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-0-5b93415be6dd@linaro.org>
 <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-4-5b93415be6dd@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-4-5b93415be6dd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=C9vZDwP+ c=1 sm=1 tr=0 ts=69de1815 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=ZL2hiuJarSggSDoTJZYA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA5OCBTYWx0ZWRfX1sFeZiPuRCnt
 F/5E4BfDCh4vCKnNHwRIsEzGYkyyaIHEUOHpSZpITkxkHyqWCXUDKMzhue4jzbLFRK9kyZFGo7z
 +C+0uk3903QoaRtwyzH2BInNgfvy70gxk/B/A5HslISFd2by1NutK5haVN6MAJguuKq/dQCZVpk
 RBw3HEWmryJNz8I+SadIbjAAVyvGbuovpx4gwck9rHXiS/f/oWFcgSL5SFQccriwl6VotTgRSCd
 KRt0wXNBrHxV66zsl++DWo5WicMN4eCHtO1ZEq1H8IZEGVykKZgLvPLFUouEpwW3g08EAtAvpKa
 Dm0cHdNLots/vtrTTqTWsI8whAEgKiEnIhNwhVPup0U1tC06DePjFOY/zVu1Yeo38NPFlcWizUb
 PnWsp0UL4WS+J1Cr9S9wEXmTKpeUb+hn4XaG6yzQHE93JOhV7sCJCbMeElLQdGhRB1/ncKcAjvQ
 y4U5VcG4uIbCRb2I8ZA==
X-Proofpoint-GUID: vWi6C2SJiZsbY-blAwvyWFPy4Da-UUMT
X-Proofpoint-ORIG-GUID: vWi6C2SJiZsbY-blAwvyWFPy4Da-UUMT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140098

On 3/26/26 2:28 AM, Bryan O'Donoghue wrote:
> Use devm_of_platform_populate() to populate subs in the tree.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/media/platform/qcom/camss/camss.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 00b87fd9afbd8..66ea057291f6d 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -16,6 +16,7 @@
>  #include <linux/of.h>
>  #include <linux/of_device.h>
>  #include <linux/of_graph.h>
> +#include <linux/of_platform.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/pm_domain.h>
>  #include <linux/slab.h>
> @@ -4964,6 +4965,8 @@ static int camss_probe(struct platform_device *pdev)
>  	if (!camss)
>  		return -ENOMEM;
>  
> +	devm_of_platform_populate(dev);

If you want the camss probe to fail if any of the PHYs' probe fails,
check the return value

Note that this doesn't necessarily have to be the case and I can see
arguments for both approaches

Konrad
