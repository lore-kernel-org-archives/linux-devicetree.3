Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6B8335081
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 13:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780494816; cv=none; b=oIgQYI4fhVh/M/O84wWU/63+X90xLfX0wk7I2jPAiQCpmov7e7yQEz2R9Z92I4+ORa5hRaTw/hf+HvZih2Iu5K56w1xDTNsTxyymzbstTI6B7t2ulEg37QaYajm0OMRuDwiXP9nZ3zAJNHveOHdd8C4mzFGo3lJKYrNiqXEORTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780494816; c=relaxed/simple;
	bh=Kxg4izlmwj7LwxfFLu2aBpQLhsk4DEUzcCIErk2RmSY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gMWQhH9jvyB3CeKjUFX6bwDfl/VkOoDvV/LtrmHzeK+/6Y8+ohSPt1KdOkGPs/v1VmvQgzFKY0ciu98qCUvxb3GsGDHP88o6Kvqj+mCC8mTT+aKsXuUPVeK/VMptZmLb/DhNOes/dqy4UabJ79fN0NINPAez3vlkVdkxH2YBVDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X6+zCHDv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SePFGBJB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X6+zCHDv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SePFGBJB"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653CBMfE1200262
	for <devicetree@vger.kernel.org>; Wed, 3 Jun 2026 13:53:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=o2gXuSzDvMwhzE9ePHaMQbJZ
	dEEJ2hqlmhoJd6fHVZM=; b=X6+zCHDvowsmUTUhYFBzwcPf35zZ6TfdaEhLrUKr
	qJV+tBg4zuJLlL7X1iB/BnYW69iOrkeUPR6AU0RaP/mbyR01BFVtR0B9K1A9xYa8
	iD+csB5QmW+aDmbfSiDHL9v/wKA5R/xjNdljFH2HXUgBbfoPO9eSCwOWb0eo1abs
	WHVejmiEYVAHMKFLo8FTzgyCrnOsxnWGKtdYwTGVeHVJksjfLGM06zAQjqhP6Gad
	dds2Bv+5hAlBgXDvXT5I83JIrrK2UxLa/L6eiOoXl58ayDlprI4DgJTIIajkCukr
	DGOLhLMq3Y381mtxW+ixav4348Gx/VCpy03klhQZIMZn5g==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejckw29jp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 13:53:33 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6cf37fe12faso1555785137.0
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 06:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780494813; x=1781099613; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o2gXuSzDvMwhzE9ePHaMQbJZdEEJ2hqlmhoJd6fHVZM=;
        b=SePFGBJBq2ghnr+OkrunSQra2SWqOK2FV/QbUqCxj0DUxfdaoUNTcMz/uYbNIiH4/W
         hok8q6/B+Kt8z5ZzI72VMpekx3Suu5AgKMVNxD6v1cUTyD0h9XCQZfqNGUcWPDwerV7O
         gKbnju72QXXBH/mu4YAq9+u1JmNQTbhIbhmQE3RwG4MzAn6xzvvgUgyzRjcKepMbD8yD
         amUh1R03yQCyFKikXfBOHmYmv2dcP58Eg4S0DG7jAEkRz5ssd8SzDjd70FddLKqbfnF4
         +3z0vSxnLh2Np/7WoFgEUYXq1wQcc2sr6fb6v2gJaVWyPS7dkJ6lCqN0zSyxZVGjvuxz
         qzGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780494813; x=1781099613;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o2gXuSzDvMwhzE9ePHaMQbJZdEEJ2hqlmhoJd6fHVZM=;
        b=Zvu2+VxO1Ox4fsIRjsB3E7zWFemCHpsMd4GE2STk60eiSADkNJKQdBcuJfQwrpScyM
         u2G08hEt/EDn/RvtDlEGVmtmWWz02HuoSzwVsuMI6OK68he1Ol+aQoYoGadxL6lwHGeW
         MHcwsMc++kBsBaszRZLYCEyVHDr9AIJ08v7XFCoqnTCziap2JUAP5fKO5Hpg9LBJqfIL
         2zpnJUdE6ER/O49r1EV/ZFDwJdaC2ZKLt6kL0oRpGH7aywA01IjeEoYzI8him04LUcnI
         a+wX8p93/8ZnWK8nIg3Qwawdd3BVRWfNucp0NQkGjShTKKcjz7XQXw9eYQ33T78FSo94
         5zeQ==
X-Forwarded-Encrypted: i=1; AFNElJ/QfNCeLGNq4PWJQ5rqatbYVkm5QivHgwG/6zPYVq/P+m/4O/+sXskaL4Hhei1C2KZIf/gzfro50ua3@vger.kernel.org
X-Gm-Message-State: AOJu0YxameHsrW1SaiLMZkk9w2nGlTm8JRr1uLOPtBQ76IFcUX2gEiOr
	+2igb7CnFViYLg6T7UBZ2XnWRKsIeajhl93oI+GDYnYoUYeR53JHMDUeWotfA1Wwh4wid2Rl1ZR
	BG6CtkbGPeEtu5Uxy6CO/tH0p+wpTXQJSMB5m4d2JqJR1Xk9X09R0OEv8DKC8UKDJ
X-Gm-Gg: Acq92OGhYH6gLdf9P9HjzsuqD9fYm1g0JHpbjiRQATU8T7cFqHfS7j+6n3HlBOjV1/n
	5vOV68tAosbhMnbW+ZSvJqqEQ+3jygOeBLMO+ZipTTEoqZEdMIaLMJWVu0ou62ty6Ubb6Q0y0ym
	Bx4ugwqBYGd0NCLzciyASHMpO+mK7XnS+/r0oEceQZZvwFef7BEAWf45i6b74CR+1r0L69QDCvf
	1jqfZPyqC/DwoWOE57rJlBqXKo+gwZ8G2hr6RbEAQezkgbiZEwYnzo6QF+0PSSeRW6OIBH4T9tZ
	2nCIAj7odqldDpGmObfVSaLepSuVqMzuPMHpoWKsz8Y5CLRSl0T8xJP7ZApKiEEUEKAN6O2IspG
	DU43dYn54R5JraClmzYgEE6Y1djMQB5TOMvxc6OFxrzK3rGyvmF2jjAQYJTjdKPyj49APx/BiDD
	p0EZhcDK/CHdO+9jmdy6OGh/colj+rQYhpHyDTXm+WRv22Gw==
X-Received: by 2002:a05:6102:14a8:b0:634:92c:bdce with SMTP id ada2fe7eead31-6ec2c4c37acmr1647390137.12.1780494813139;
        Wed, 03 Jun 2026 06:53:33 -0700 (PDT)
X-Received: by 2002:a05:6102:14a8:b0:634:92c:bdce with SMTP id ada2fe7eead31-6ec2c4c37acmr1647372137.12.1780494812648;
        Wed, 03 Jun 2026 06:53:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8fbcc7sm671127e87.23.2026.06.03.06.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 06:53:31 -0700 (PDT)
Date: Wed, 3 Jun 2026 16:53:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: george.moussalem@outlook.com
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 4/4] net: phy: at803x: add RX and TX clock management
 for IPQ5018 PHY
Message-ID: <o4a5xuxznwkgpdj46w3xi7ouvktkwziedkbkdmd5aqdzd444qm@ggkfcgyzjk6i>
References: <20260602-ipq5018-gephy-clocks-v2-0-65a1f1d881f3@outlook.com>
 <20260602-ipq5018-gephy-clocks-v2-4-65a1f1d881f3@outlook.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602-ipq5018-gephy-clocks-v2-4-65a1f1d881f3@outlook.com>
X-Proofpoint-ORIG-GUID: Wl_qlNM4XwEMR80DSSlMqpDxYb2U8awZ
X-Authority-Analysis: v=2.4 cv=edUNubEH c=1 sm=1 tr=0 ts=6a2031dd cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=UqCG9HQmAAAA:8
 a=G26YxGutZnFJZCfQOsMA:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDEzMyBTYWx0ZWRfX8fx0ucwHqkkO
 fpglHsAZS2/KZvHD7sX1RMXxSVcQQmaiaF5T5fkk8onAQT5H32Iu91BHA1MJHCXyQItMYp6mGGI
 7YbXURwBm78Xp3SIptKw/uavlvDl3DrLRnvqqDNCjat0xHcVNoGLcIH3qy7EAtGy1CPKIXvv2ZG
 0yyz9XpyDeywpADRYeJRf9gR4l/AKwDChMDE2Z7e+W+JeX5hG47mFPjL8naumNhJdL3HlBYtPJu
 8aXEApFVBamtvXC4Aawd4nnP7ndNGudRUTZ9RcbkBydjZ6c7sakvf944L/GD3Vw/dfDehHKg2Qn
 i+Cigfs3IekESO1MSrY0Ke0XFRfFHIxHGp5mkFx2Jd3Ga/ij8AXBY4nL+AEEk+fbDcgGD0Tfq78
 BuDMSXsnvh4URdb7zNrBnlp/XsgiDJVTInC5fHhz/OJ3qcoQDsWpA+JlFoyzG/O91+UZo23rwCK
 G69gpK2c8Ia6Fk0GmTA==
X-Proofpoint-GUID: Wl_qlNM4XwEMR80DSSlMqpDxYb2U8awZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030133

On Tue, Jun 02, 2026 at 10:50:40AM +0400, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Acquire and enable the RX and TX clocks for the IPQ5018 PHY. These
> clocks are required for the PHY's datapath to function correctly.
> In addition, gate the clocks upon link state changes for improved power
> management.
> 
> Fixes: d46502279a11 ("net: phy: qcom: at803x: Add Qualcomm IPQ5018 Internal PHY support")
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>  drivers/net/phy/qcom/at803x.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/drivers/net/phy/qcom/at803x.c b/drivers/net/phy/qcom/at803x.c
> index 63726cf98cd4..b7361a14220d 100644
> --- a/drivers/net/phy/qcom/at803x.c
> +++ b/drivers/net/phy/qcom/at803x.c
> @@ -19,6 +19,7 @@
>  #include <linux/regulator/consumer.h>
>  #include <linux/of.h>
>  #include <linux/phylink.h>
> +#include <linux/clk.h>
>  #include <linux/reset.h>
>  #include <linux/phy_port.h>
>  #include <dt-bindings/net/qca-ar803x.h>
> @@ -176,6 +177,8 @@ struct at803x_context {
>  };
>  
>  struct ipq5018_priv {
> +	struct clk *rx_clk;
> +	struct clk *tx_clk;
>  	struct reset_control *rst;
>  	bool set_short_cable_dac;
>  };
> @@ -1062,6 +1065,16 @@ static int ipq5018_config_init(struct phy_device *phydev)
>  
>  static void ipq5018_link_change_notify(struct phy_device *phydev)
>  {
> +	struct ipq5018_priv *priv = phydev->priv;
> +
> +	if (phydev->link) {
> +		clk_enable(priv->rx_clk);
> +		clk_enable(priv->tx_clk);
> +	} else {
> +		clk_disable(priv->rx_clk);
> +		clk_disable(priv->tx_clk);
> +	}
> +
>  	/*
>  	 * Reset the FIFO buffer upon link disconnects to clear any residual data
>  	 * which may cause issues with the FIFO which it cannot recover from.
> @@ -1084,6 +1097,16 @@ static int ipq5018_probe(struct phy_device *phydev)
>  	priv->set_short_cable_dac = of_property_read_bool(dev->of_node,
>  							  "qcom,dac-preset-short-cable");
>  
> +	priv->rx_clk = devm_clk_get_enabled(dev, "rx");

Why are you enabling it here? Won't you get the notification to enable
it if required?

> +	if (IS_ERR(priv->rx_clk))
> +		return dev_err_probe(dev, PTR_ERR(priv->rx_clk),
> +				     "failed to get and enable RX clock\n");
> +
> +	priv->tx_clk = devm_clk_get_enabled(dev, "tx");
> +	if (IS_ERR(priv->tx_clk))
> +		return dev_err_probe(dev, PTR_ERR(priv->tx_clk),
> +				     "failed to get and enable TX clock\n");
> +
>  	priv->rst = devm_reset_control_array_get_exclusive(dev);
>  	if (IS_ERR(priv->rst))
>  		return dev_err_probe(dev, PTR_ERR(priv->rst),
> 
> -- 
> 2.53.0
> 
> 

-- 
With best wishes
Dmitry
