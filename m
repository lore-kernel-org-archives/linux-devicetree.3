Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F7A37B00C
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 13:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780321067; cv=none; b=gfDo6LkgjLfqmWZbp3tfTGtnBGMwKx7jiHT0MWfieqbLJ7xNuwgO4DEh9LOgjlRxre3h8DSyB5RLREDOMT0Ey1s+Yt7ZLs9PlEII45u+eOsuVLckofhpBCXK1gL0wAP+17a6MQg3CgRN0ovV2fCs2eu6gy3b81GJD0xNdjoA1ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780321067; c=relaxed/simple;
	bh=lxnV2vKDfIRUGiZcM5YCI0yjR1umK+6dZSjMsavVe5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GTJB5Vy+vJ/0YuYDYaYUFQnwOVaOK5pr7Z9OKaKv5yxnXLoBPOv0XxzA/nBVIxaWXG6t/Q3cdAjqqq/E+D8mndrdGuPEZQP88t1xFY+3GoEiBc34x02WHnCfrNKPgsFFKYKhTWP+D5c1updyQZvRO9Z93oDFoAj2mn7Bsc71TrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MBhR3rPk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W/VvF1Cb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MBhR3rPk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W/VvF1Cb"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6518fIFe144951
	for <devicetree@vger.kernel.org>; Mon, 1 Jun 2026 13:37:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nOLt9jtIUA+Anbz0hnd/caAN
	h+SYMOEW+4cc1U4NzK8=; b=MBhR3rPkEYIsAtHBTCBhFtSUVZ6GdKZIaKpHny08
	faMpglKHfVtkUAhYagUMlfD2cQLPkHNY73D5AwuaeH1bO4Q/ECoeAD2YIsIo5vXf
	lwWSzR6sbmkLM4nJk51thbgh206ykhxNbaZlfRLT5kZIvCw237WoWIUggjfA5Pyz
	o+E5AJRKwAnWe3uwyi/GDL6jWRM5U8nDpDhu8u0IIUC63v7PSdG86nKBZjl26SI0
	ppGK2CBcKyLj+N5/DddRLjEac27UWZ//45H/R4ZdjXvSRlJM1S2a4kgLbD/RA6AQ
	DJ+m8tBb9FvRh1YWJUle/CXUP7fn/HgFKnc+CsEUT1Yqkw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6sts4c0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 13:37:45 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-59ebf602dbcso839361e0c.2
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 06:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780321064; x=1780925864; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nOLt9jtIUA+Anbz0hnd/caANh+SYMOEW+4cc1U4NzK8=;
        b=W/VvF1CbBkUfl6zzUqvmo9QE04PGRJlmrbZHF/izaPxjjed1clD3XS/RRdgDr5armx
         9G+LHpSpPvnAv/McdIFFyhgQUTJxGhWkE4nBit9DXayyIy9jxhyNSa0Yf2J5zC+kG4BA
         ivoZb1ptsNGg/G0ogPOv6t76cFqhLkMfvoR4pnWOasstWatL6Xe/joO/Jnh8/tDD7jtX
         y0orXkHMcTb/Ac194Wlf06P2J9rB7NNitH407EEG8pv7QXZk69YD8xcx2k385WtLqcIR
         5BNHnR99W4OrFT0QELINZS94e/f3qayL+AUCL6n3Yp+683RkgkquvS/yQeDsgJqavKuq
         Jivg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780321064; x=1780925864;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nOLt9jtIUA+Anbz0hnd/caANh+SYMOEW+4cc1U4NzK8=;
        b=A1mQIMkxY9oromv6BUgJvQZjoEUdqpT4jXvA0P11g7hPcCCCDg7YfHsZhs2mPya48Y
         B3VmXk8sZVI5lYqAxHRhlzPl56ll0TG3FI//tu67qMv7igr0AA1Q0GdoLXbfR2vBhWtk
         PVQ7euqgVRetzoi0EwGV7gvLxeMNLLP0Zwlp8tgLQ4JFgHg8W91W8xCUK49K7NarW1fp
         bmtv3D4dZwOFjWIzk/qKxTqpuOn+P/30/4q4vcJ8GjMiWABWFt/+pJSF/rVQi5mFvnse
         SWP4M1duDkyo4YiJ3bYYvGiwEgue42DfA/8Pyp/YhqQ4lNUhHC2jPdjdyNbfMtYV7IIb
         WPKw==
X-Forwarded-Encrypted: i=1; AFNElJ97Qg6tXiWJmXRL2raQ1KelQP8EOXfzGT2J9eqiGQuf/Lw7hskVdFCqp5Wp4nF3sArzeYFnLVX/oDbT@vger.kernel.org
X-Gm-Message-State: AOJu0YxxITBfqF8DOlx+0k4c4C24bRXN1F5UBFSWIKwXsGgbGKQnvVRS
	oD6+sq9SRwN7zeb9mtbhdTruYhzv0n10d/op1Xu7gYBDcz4TySNGSMZx/7kNVmPhEw/1ezltGlX
	AG0NeiMmB+mxiS9iwV1SDDObiuW1bgMSl2j6dY0IuPx9HPuVZxZaIuiF58yOZL2ss
X-Gm-Gg: Acq92OE3m3m3k2skJi915Lyi6SDbE9w3XBjObJVXk/VsTbjDFaPOgEb9Ts1QMs/5toR
	84dJherBgJoX4yOkq5MvKCkHE2TfoSgFRDxq3FI+z0fzLQdOGdvRKcDaL13XnkDorWdldvuHSh+
	rmUPOjR7AaKEHDfydFuSvY4M/FiL0QhTjk8zKVwvHXG6UlTuUU0SsXYKdEYRayAQCpY6s4XZnx2
	pFe0Ye3oKdmfgyhwFqfTko8dP1UP9np8JLianbEeEaWs4IGRu646lU+mRuUAp3MmEsCK91iRvDi
	86O1hSQ+F/SKCVYtDzYHvf4NolTeKQFM4EznAnyW0R29nGkacvCAjPZOjLUJ9owKvT7gprIEyxn
	LprOMhiZxhtkpS8dpE+BDkzuOaV+lhF2QSj0insCzN8oi4b7gexZpA4oIbTq6ZRkls3KDKXmD7Q
	zfHR0VpH4LecefqGp6eDIKkn+X1WJ2ngeiR/snnUwCR1P/GQ==
X-Received: by 2002:a05:6122:2887:b0:59e:b127:fc6f with SMTP id 71dfb90a1353d-59eb128260bmr3025292e0c.2.1780321064182;
        Mon, 01 Jun 2026 06:37:44 -0700 (PDT)
X-Received: by 2002:a05:6122:2887:b0:59e:b127:fc6f with SMTP id 71dfb90a1353d-59eb128260bmr3025240e0c.2.1780321063617;
        Mon, 01 Jun 2026 06:37:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa631c7e9bsm1556798e87.16.2026.06.01.06.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 06:37:42 -0700 (PDT)
Date: Mon, 1 Jun 2026 16:37:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/4] soc: qcom: rpmh: Allow non-child devices to issue
 write commands
Message-ID: <4ac5hjmr6divqs4myhcw5sveuboj265sw2jwslbivrfwh5e7ce@6d7ajvgikkgt>
References: <20260528-pinctrl-level-shifter-v2-0-3a6a025392bf@oss.qualcomm.com>
 <20260528-pinctrl-level-shifter-v2-1-3a6a025392bf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260528-pinctrl-level-shifter-v2-1-3a6a025392bf@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDEzNiBTYWx0ZWRfX1NZsHobmKXk5
 YqR0jGKOw+fgx9VzxW7cxw4ytTTkFcNLpkrz5ZwtAXfB0E0QZmPd7rQhgJaUUWFDno1ulJ1Eds1
 p9aZbOwuoS2lpYycyTjINSzPbXPFOOdQ1cxyhZArvGJYc7pFi2nfxPttxv6/SgaQhCHbWDxRCYE
 k+foeK+hydkF401wO/Y4/SvoaiWC4mDnvNUpopeuwTMl2VOJgLxRkQ0VBf+N6sPN5f64pxQl4Gs
 JMScZMmCTLQ85XjUUosuPy+NNjxjrumw/Jvigu3mEy+9X/7OE6aU//R514vnyjIKAHfpc3fX60A
 Xciqb/kAqgRh2Mv2LWfPYO+disDURAyKdKJdBxqIcN0kxX2j3OiERNrcIOtw9qRtM1sjaoBgJ7c
 tefqrTDAlCwcU43vSAV8VfqysgM5EFMS0PHzEyQyunIVmBHi8kOVFjsOgKRCikcNw+JsIZ1cspJ
 SKIhbmzpXcMNNpkv1Ww==
X-Proofpoint-ORIG-GUID: j6MhQS73dJ9nUtycAZP8MlRo_LQySjLw
X-Authority-Analysis: v=2.4 cv=HrNG3UTS c=1 sm=1 tr=0 ts=6a1d8b29 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=p6yASBmuys_a7ks585YA:9 a=CjuIK1q_8ugA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: j6MhQS73dJ9nUtycAZP8MlRo_LQySjLw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 adultscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606010136

On Thu, May 28, 2026 at 06:05:35PM -0700, Fenglin Wu wrote:
> Currently, the RPMH driver only allows child devices of the RPMH
> controller to issue commands, as it assumes dev->parent points to the
> RSC device.
> 
> There is a possibility that certain devices which are not children of
> the RPMH controller want to send commands for special control at the
> RPMH side. For example, in PMH0101 PMICs, there are bidirectional
> level shifter (LS) peripherals, and each LS works with a pair of PMIC
> GPIOs. The control of the LS, which is combined with the GPIO
> configuration, is handled by RPMH firmware for sharing the resource
> between different subsystems. From a hardware point of view, the LS
> functionality is tied to a pair of PMIC GPIOs, so its control is more
> suitable to be added in the pinctrl-spmi-gpio driver by adding the
> level-shifter function. However, the pinctrl-spmi-gpio device is a
> child device of the SPMI controller, not the RPMH controller.

This replicates the story of the PMIC regulators. There are two drivers,
one SPMI and one RPMh. Why don't we add a separate, RPMh-based GPIO
driver targeting only those paired GPIOs (and we don't even need to
represent them as a pair, it might be just one pin).

> This patch extends the RPMH driver to support write commands from any
> device that has a pointer to the RPMH controller device:
> 
> 1. Add rpmh_get_ctrlr_dev() to lookup controller via device tree
>    phandle "qcom,rpmh"
> 2. Add new APIs: rpmh_write_async_ctrlr() and rpmh_write_ctrlr()
>    that accept controller device pointer directly
> 
> With this change, the pinctrl-spmi-gpio driver is able to issue write
> commands to the RPMH controller by using the controller device pointer,
> and vote for enabling the level-shifter function.
> 
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/rpmh.c | 173 +++++++++++++++++++++++++++++++++++++++++++-----
>  include/soc/qcom/rpmh.h |  21 ++++++
>  2 files changed, 179 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/soc/qcom/rpmh.c b/drivers/soc/qcom/rpmh.c
> index ca37da3dc2b1..9dbc42b775d9 100644
> --- a/drivers/soc/qcom/rpmh.c
> +++ b/drivers/soc/qcom/rpmh.c
> @@ -12,6 +12,7 @@
>  #include <linux/lockdep.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> +#include <linux/of_platform.h>
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
>  #include <linux/spinlock.h>
> @@ -76,6 +77,21 @@ static struct rpmh_ctrlr *get_rpmh_ctrlr(const struct device *dev)
>  	return &drv->client;
>  }
>  
> +static struct rpmh_ctrlr *get_rpmh_ctrlr_from_dev(const struct device *ctrl_dev)
> +{
> +	struct rsc_drv *drv;
> +
> +	if (!ctrl_dev)
> +		return ERR_PTR(-EINVAL);
> +
> +	drv = dev_get_drvdata(ctrl_dev);

This is racy, because the drvdata can disappear at any point. Having the
handle of the device doesn't help because the driver can be unbound even
if we have the reference on the device. 
It's not the case for RPMh (which if unbound will break a lot of
devices), but it's still a antipattern.

> +
> +	if (!drv)
> +		return ERR_PTR(-ENODEV);
> +
> +	return &drv->client;
> +}
> +
>  void rpmh_tx_done(const struct tcs_request *msg)
>  {
>  	struct rpmh_request *rpm_msg = container_of(msg, struct rpmh_request,

> @@ -271,6 +294,126 @@ int rpmh_write(const struct device *dev, enum rpmh_state state,
>  }
>  EXPORT_SYMBOL_GPL(rpmh_write);
>  
> +static void rpmh_put_device(void *data)
> +{
> +	put_device(data);
> +}
> +
> +/**
> + * rpmh_get_ctrlr_dev: Get RPMH controller device from device tree
> + *
> + * @dev: Device with "qcom,rpmh" phandle property
> + *
> + * Returns: Pointer to RPMH controller device, with a devm action registered
> + * on @dev to release the reference when @dev is unbound.
> + */
> +struct device *rpmh_get_ctrlr_dev(struct device *dev)
> +{
> +	struct device_node *rpmh_np;
> +	struct platform_device *pdev;
> +	struct device_link *link;
> +	int ret;
> +
> +	rpmh_np = of_parse_phandle(dev->of_node, "qcom,rpmh", 0);

Ugh. I think this kind of phandle properties are not recommended.

> +	if (!rpmh_np)
> +		return ERR_PTR(-ENODEV);
> +
> +	pdev = of_find_device_by_node(rpmh_np);
> +	of_node_put(rpmh_np);
> +

-- 
With best wishes
Dmitry
