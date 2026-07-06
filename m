Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CAA142255D
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 12:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783341722; cv=none; b=f+IC/HRwpyO6bDqjXVkhqKwvyq60mqBf/llPx0B0PlRkkhJcj2u6h8DTiZaOeTwmGc/vhOsHHb3m2juiykVSWWLMdgPQtwlDPU6uGMvPLMqPTYhuat/aJAW1i5zmGvJJoQOF+zYTe1JLLi16O7yLv3Rqc/BNQPp+U23BORUdFIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783341722; c=relaxed/simple;
	bh=5d5qoXwl6X/5EBmgduABc6v7RYTqWqznF2Ylbfa9TqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HeQQw+LWayfS//4w3UInhen/2al+Kwd1vviHsmup0EAc1YxAxsZhhri1yKxgjrHfKOExN7fGrV49ZDnOxDE7+34Gs+LIC5eUolviB5I77xbP2xD8yOtwkqYpB59okNhsYtGXfnK8oN06Qx7IK0wP2QX0R4gYt024W9X1nkICb+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D2GfBjLY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NATlTPT2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D2GfBjLY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NATlTPT2"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxTE3367424
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 12:42:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=E7a8FZgAvm2jtvI2nBoVIO8e
	/0jyCPrf9wufDVot4/A=; b=D2GfBjLYdRe1tLMLQF1YWlnizNBaOHEkRx8Eg8HC
	8dqKiG/a6cYKufC4d7/iy2x37ogIE8KIpXQQfO1F2NRU6qKQn4/tBO76n0uSD4Wm
	XUKDZZEOFmxCMuTZT3qej0eBsA14+iBArEWGQelS00rbBW/QIOMaa1EmsSLG1Cxa
	2IhW1DVVHbARbDv8B0iKq5EWnnUvLk4ObT+O+2Ddfa8PaJhwE1eAozGbpxmTJb6Y
	+ss/uWvVSojTX6HZYxRQO/dlqz6hzictxXfreMihG82MUlqoRkf6GHy7ajLfuAVf
	m/6mudTI+I2j7L3uK9a+fr/NMbTnYg00OQsW1NekaM90Ug==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f891urw44-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 12:42:00 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5be0d09f5fbso2872552e0c.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 05:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783341719; x=1783946519; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E7a8FZgAvm2jtvI2nBoVIO8e/0jyCPrf9wufDVot4/A=;
        b=NATlTPT2OBA1sMfmqJiuzPUYyFa4/t+5WX4d4rgJARKf2k1UXi/4nbv2qDEcmrhigw
         3D9HJWLzs/vaugtNy+5jT1cmELppi00oApJPXRfMB4xoBRFIdbQCWgPw/AmRyx0vaf2y
         cfJl4bl4hfmQpZqDbfc0N+UxZx0M0jWnIDSyneNg1OrMKeT4UUZ/3kgGU9+DgrSdsLp8
         rFIaonLjin8NHfxDW3WEx79vFGj+6n1cfoOE56ErDFwvWLx4JIh8KJWMdwfpLPKRfwBv
         V+tntSFCP4aEn0G8GwNDGSTZR7hdQQFnpKAuAt9eT59jfs/NXTgGNRD7aXHD/1voROQR
         ISyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783341719; x=1783946519;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E7a8FZgAvm2jtvI2nBoVIO8e/0jyCPrf9wufDVot4/A=;
        b=bHm0X6BKh3RvTNO2D8Gz8NbjqmYa+FqadfOtKcHQkpdyL9Np1tS08AgwTkyZhAOr9R
         Yy5iujcL3dt1/1eFGgCRHm4NlgfYgqLkl+6lzW9icsRA+OqIJ0kV58OlfN4ZQsYwzKZq
         o21PXxMsZZHrdk+rj5zlobwwIEnd6yICjYvUQgOau3hxiKLlQLrz6I6XMfzhKwSqJKv6
         nOKh50pMxtqpkm9U5LfboI4Grec5VrO4kwM2DUlK9CEp2zOXRZGzkeq2rBHgGQfiN+2T
         532kbhH2yGDXiMVG29c8Gn5WjzmtOYLsqIQ/pBxOBAEb3EKaEYInCHGlw/N0WAJizO3T
         vd6g==
X-Forwarded-Encrypted: i=1; AHgh+RpQmug3/ixcXVwG6KsCYpFMB9GxANySoUkZ0sZqmGFKyvq+gZ0l/7jmQAfNipRDJHEmSmdfOUpAw41T@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/cjkvPojvq/fv0/nC18+CEHKRG+0wnd/tD3ub57fdCty0pfzh
	m8epJ1ns+wtJJiinzoNDMzbBWAJ6KCWhoWky/wuSAOLPSwyFJ3PQVnt1eUgfDR/1GfjgbIHwB+Z
	WWeUbFREJODrRFgV31ygZO7wmbDG2EhYloclswBPEl4/WsZpRdYnWHvvE3/K+Srg2
X-Gm-Gg: AfdE7clYHbSjuMl9sqH1xEkFFP3VKtYz1p6A8ryBn8EJZjhDvcDXYUjmkVqfrF+pZlB
	pmTukqzgF03yO66f6bsjXhfD4rO4OSGhzTq0nP9AsbozhFe5QKMjG58GMzBkxLzcO9RoJ7aqASC
	INOh2WmyA68TWGzqICtxoJd/Xre/5T4uP4Gx8aaayjF43K+3uQuvQVdL+JzGpBDVAyTX0+uQ5Vy
	A516EjP2ZSr28o0qwhn8PbxGSJtQCLXVK7tCumGZMQ8qt8Hje6wqBVnikAKhnLGmftixwVmfXwJ
	9WVrh71HJr6zYYDHY+sEK/Fc3qB3IvvdaeTUpmjc7KWYHMLji4FGPV5cA6JhPMik1hw8vJpXiLa
	FFPhKR0rYGfCLqpQGSihUMQ+YxFpywQ2lnoLD7JXchIWKs21WT7qEjdP7ZIdDyowsu0cm3i+kqY
	PKnFA3RAf3YLLkEsPNVqy9EKRZ
X-Received: by 2002:a05:6122:1809:b0:5bc:58d:ce4 with SMTP id 71dfb90a1353d-5be8952c6d3mr190085e0c.0.1783341719165;
        Mon, 06 Jul 2026 05:41:59 -0700 (PDT)
X-Received: by 2002:a05:6122:1809:b0:5bc:58d:ce4 with SMTP id 71dfb90a1353d-5be8952c6d3mr190070e0c.0.1783341718729;
        Mon, 06 Jul 2026 05:41:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bb685sm2849659e87.46.2026.07.06.05.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 05:41:57 -0700 (PDT)
Date: Mon, 6 Jul 2026 15:41:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, bryan.odonoghue@linaro.org,
        vladimir.zapolskiy@linaro.org, loic.poulain@oss.qualcomm.com,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v4 1/5] media: qcom: camss: Populate CAMSS child devices
 via DT
Message-ID: <7agyvdlmpnvvjnhigs2plukv26johazvxw23qg62v6eroavkih@dz45xwot36mx>
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <20260706071113.383215-2-atanas.filipov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706071113.383215-2-atanas.filipov@oss.qualcomm.com>
X-Proofpoint-GUID: m4TmiAYjE1VeKnAbVMcGGsI0nL0tItd7
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfX6LakKBg+WqoC
 5X/tmJAqAs6m5tH8p38FjqgiArCHgteOaRBSPnrkD0bWufNOVfglkEFFH4l8kRHIv3V5mcIxrIE
 OwCxzLZNODOCXOfAyFR6vOckUR0AF6Q=
X-Authority-Analysis: v=2.4 cv=Mo1iLWae c=1 sm=1 tr=0 ts=6a4ba298 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=jnYD6DY7q27B8yBxuWgA:9 a=CjuIK1q_8ugA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfX0bTWTlvGxdau
 ImQnc6S4lBsWPL/yVUHj9QM3PFddtDSzEkrcWuCtHdAvB690/U4qiYNPBkDqIHCOleZVoxW33jR
 dg/z1hQeFDIjoWBzhXAtOb9JLI9T/4wjeAP6eWZD3kwArrkUfpUt+C4dGhbrSxJD+/uj/8tbPjh
 4Nyq4wkNyQnNyFgQLjF6ofaeO727ZjIvbkXib5zkjO86ukawxY87vZ5X1LnQoZ9ycG00yVuiPnt
 XtnOMY82lobgUBHUR7mQajto8qx2m4slKhlBB0w/82270YuGKT1w8y7GShIg0LDscUkDqTexSgw
 R2/mhhsrxbKcEbpkH1sCy0+3H5gVoQYh+ZcuKc9BjG7I6LqkuMShOxA5kucPbkvUmM7uaMwEzcB
 beU9dRY3GhwORdoKwbCWMoCLFt38N5wFAlBDohSa1ihfa//DL0KFlbTMNd8fby/5pm04l+g1JQs
 HdI3nHL6q50OYAqJXwA==
X-Proofpoint-ORIG-GUID: m4TmiAYjE1VeKnAbVMcGGsI0nL0tItd7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060129

On Mon, Jul 06, 2026 at 10:11:09AM +0300, Atanas Filipov wrote:
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> Use devm_of_platform_populate() so that child nodes declared under the
> CAMSS device tree node (e.g. OPE) are automatically instantiated as
> platform devices. This is required now that CAMSS is modelled as a
> simple-bus and ISP blocks such as OPE are described as child nodes.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/camss/camss.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 2123f6388e3d..95e655a8b6aa 100644
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
> @@ -5362,6 +5363,8 @@ static int camss_probe(struct platform_device *pdev)
>  	if (!camss)
>  		return -ENOMEM;
>  
> +	devm_of_platform_populate(dev);

Don't ignore the error code. Also, are the children ready to be probed
at this point? Usually, it should happen _After_ the camss is being
fully set up.

> +
>  	camss->res = of_device_get_match_data(dev);
>  
>  	atomic_set(&camss->ref_count, 0);
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
