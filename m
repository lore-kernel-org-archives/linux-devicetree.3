Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429EB43F0BF
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 08:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787043362; cv=none; b=NqMuRjs0TQoeGgYE+aP3he0N0vLOukhYsN6tuOLXtBp9umjsuDmksnaC1AxvHTw6plquUmbWuU1lYCdOEY++6qsZITS8SQQlGzw4lNbdfvXiqPZ01lMLp9TCDLPY4hdWdJyDriFSWXQsUOiLgEtN04T5P1EJl0BINmGCurM1Jg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787043362; c=relaxed/simple;
	bh=jdXUg6ge+CkuqPJatY4gmfdrXLXrsfR5VvZfoquwTog=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aQft6AV12PCsp9lTPuxbJ6+ux4I9ePhpb635qbRP6NTEAFPuaXsPzmItTKFQVsgQRZTL2Lj4OxixrfNJ/T/zM/w6/Cxs4f96tcEo6NKSXg/jtlEcWE2JEKt4+bVWtfngDJHxTt5hClQolewoWvX8ekMzuBuaP+/+OwBWuKBNj5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=llLLalVu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=We/mdQ/K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="llLLalVu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="We/mdQ/K"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I8BOdY3991303
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 08:55:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5XpOqc5E/x3j21BWFeP0v8ytaBSccBnOmabQ+CpqYvE=; b=llLLalVu0NRbDmfe
	/V10Tdhur2wSfmzs2NdTbXiVbs0u2xWQRvvwMtIm501Xle5gwGHobaaC413KYLJ6
	zRGO7V2aJqlNsQc2AtMAk5RTICkrKgKpY8T6NDcnlUZ5Au+nhYU2OU+e8C/9KuvI
	Qgs3iYeFKxYJKAvBGYbSF1zv9TklNA7uKkMufdX9hpBVUQyjs+PUfStWyLwAE1Hg
	wc7pPm9FkVJsVxeq3LxUIkPkSX6vENOLUjMPanm7x5NHRd+2ruwvToHMtajeWsId
	0qdmFHM5X/ogKCdY8IgqzV2aRIbAXa7m6h2YIcTTo4lb2bmZjLHvFn9oFF5KpOQ2
	T9B4fw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4f5pscfg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 08:55:56 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8ee7cd05e18so718466d6.0
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 01:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787043355; x=1787648155; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5XpOqc5E/x3j21BWFeP0v8ytaBSccBnOmabQ+CpqYvE=;
        b=We/mdQ/KzJwbg9pfbzAzox2t4ZWCYdp6RyBjsk3G9SwXL43whQAkS4kyBB2jendlhd
         iN9MIthUlSX8jHOYD2UKCRojK0SEpEppUibEqzK2c+VtRzxRJmZdHO30vUjYw9W0uPn7
         tSU3TnFNft9xB5L2I0PBfvYaOMxQkoAjKZZKa8i0R+EG0nXukGyc/X7fAo6kd/SOoKZL
         +Ua79SN0JMlsHttHi6YAU/QgOaQFJDtWHmcFBs1VcwhJ8cmHzhEEqfBiiUJ8ytjMzPXP
         v6PWQPz59vZx7qefxH5CPHolS4bVLEXiy3FgGBTEUNmRxKeRHGxd4UWV/n9CKgNLZ4bk
         hH9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787043355; x=1787648155;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5XpOqc5E/x3j21BWFeP0v8ytaBSccBnOmabQ+CpqYvE=;
        b=eS4L7pABxLJEKEJqp1kJ5HK7EI6ryJ+fndNNuiliPyfm6vV7k+s7zVq6Rb62z3Muin
         sJlxG4reARRfxPd2VK8UFoiZYZUgC34Y3kZaFD5ylF6Grn83X3y+hjYYgQiWLr6ltsLW
         KN9hqBRJkaAKHN5HAmThW6xIxYCgKe6VIbXeOzl5ZK1zkGCzZ181WvDDmWBQSjIWgX3b
         A0x8OpR7uSQUwxNZfqhs8lyc+q+BddCUtAjA9Vj7pPQtMrUwY8MK2aIHpE+U7wem8jri
         Z26YN+P/EdQdV8TUMnUwopVJPInEC+ESBk2+Wg0EbRUXQml65lddV08nIGtrM1DMuLYK
         BM8A==
X-Forwarded-Encrypted: i=1; AHgh+Rqh1TEnJH4ouF2ym6/xX866p4stNXJdWZBGcn9CyxnJX2vFAzEra59fN6V4dSFo3Pv/KbUYg+kHq5YB@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2ntsVwSl4hPEf03pYhyaYgEgEzard3C9vTZMjd6Exuc4Gdmxs
	/wzQyO/q99dqv7zpCXLJpZECvF78I5M8h5LKQLvgP6HGnipRajEsr1q+vK/ln/+iBfYBwaM5gpx
	jvYczZ7BVl+Y109+z+bP9KGgblNntpIQfNJ9Sv5x+2NUxkPV3LJgl0Fi8lSQ8OvP3
X-Gm-Gg: AR+sD11vH0fmJaN/9XOpae1/2rhWRaJ40ptZD71gacEfBFKyAERQVDRlGogIunpzKmq
	EbZTsQRvGTs0dlV9coxOHIIyHgX3Q03EE8gD3G+SAiw9lqnzvyqEMepjBXQSnPXwfI3QPQXHSMx
	nDjp47RwawngpLLSq0XRLueSV0u8olNaaGMJjtIIxtHr8b1KYtwcy2lnVxU4WRPi3+tRgv067nQ
	CG3zcObqwhSGZj0IjFkzjayAeVoIR4MlMRg5YcnUJk9PjMgFOY5GP8om4y7bsTZ6NjO/WJp/ENQ
	8/G7nGWDH75QyKp2RNfRtaGoplFE0I7bM8FQP+P4fONlLYfKw6xWDWXA/2g8gJUOUOpXJcOMo8X
	Umdf2Nfw0GFd8EaLswSGM64MC
X-Received: by 2002:ad4:5aa5:0:b0:8f1:507a:ed6c with SMTP id 6a1803df08f44-90a91e84256mr216308766d6.5.1787043354999;
        Tue, 18 Aug 2026 01:55:54 -0700 (PDT)
X-Received: by 2002:ad4:5aa5:0:b0:8f1:507a:ed6c with SMTP id 6a1803df08f44-90a91e84256mr216308486d6.5.1787043354537;
        Tue, 18 Aug 2026 01:55:54 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c217fed68f9sm154596166b.27.2026.08.18.01.55.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 01:55:53 -0700 (PDT)
Message-ID: <eb7b528a-6d5d-46af-b0d7-410bd9acfc0b@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 10:55:50 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/10] phy: qcom-ipq806x-usb: add MSM8974 HS PHY support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Andy Gross
 <agross@codeaurora.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org
References: <20260810-msm8974-usb3-v1-0-1a47e1185524@oss.qualcomm.com>
 <20260810-msm8974-usb3-v1-4-1a47e1185524@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260810-msm8974-usb3-v1-4-1a47e1185524@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=S+/pBosP c=1 sm=1 tr=0 ts=6a841e1c cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=HI9WjpCpug938Zx-P8EA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: C_Yq2PeFy7rLKU-U0ybY4194kT-Nm1Ca
X-Proofpoint-ORIG-GUID: C_Yq2PeFy7rLKU-U0ybY4194kT-Nm1Ca
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA2NSBTYWx0ZWRfXyRb2o3J6vu/C
 WOwIncck6abaX23rjdEJFT2wv7DyqGdPPyYUIr7pKugdJDlsYFhtwKnhf+Tg6KqNRGaPeVZzhAP
 wAT6+TQSn/mEhQYL7DnnaAL+JwIa78R0KigZTh0ApjTSvdSNEYd1XOzD8fB6AM+HQ6tiBV9B7Vq
 bh+d+PiSogsGjOZMpKGbEF+PnVBEpcwYUgDLL8BA7+iYnUq1mF534xvlW5mR9bAQMLOEjYP4Zp5
 aCqctwPK0z/Eld+HD3tz+jIQ2FKaoMW0wV9g5LYxLtbndcKrPolzvS8yl9yeBwXdgOS9YzUKOsx
 U/LsPoby/7Bx4ULVnEWlFawg1MRbzWPTZ9NIWwAJ5xOTjwI4ZRol/kxVkO1wNncJbJvun8Eh6sq
 BNicFMcmSJzbQecFrPSq6RG85QjwRqPMJgfprOPs5X26oE1S7ic5q7pA+wa6l218c74fLTSPDVt
 oM+KCHrqavxOBkJikzw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA2NSBTYWx0ZWRfX2L4PsVH3GIMP
 23m4nJUwO027DWhUMA84wY1hjefc/jnUS0ZkBYfd2axbxm7TKS+D2gycNeGxxAOcQw9V33jZR4P
 SX6oN50wDIdgNISnhU/L1VaTW0pS/hg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180065

On 8/10/26 1:42 PM, Dmitry Baryshkov wrote:
> The MSM8974 DWC3 wrapper embeds the same generation of QSCRATCH
> controlled Synopsys 28nm HS PHY as IPQ806x, but the driver only knows
> the IPQ806x variants, so on MSM8974 the controller runs on whatever
> PHY state the bootloader left behind.
> 
> Add the qcom,msm8974-usb-phy-hs compatible with its own init
> sequence: unlike the IPQ806x one, it must not overwrite the whole
> PHY_CTRL register, as the power-on values of the reference frequency
> selection straps have to be preserved. Only enable the UTMI clock and
> the DP/DM MPM clamps, signal VBUS valid towards the link, and disable
> retention.
> 
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c | 35 +++++++++++++++++++++++++++--
>  1 file changed, 33 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c b/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c
> index f22c0000479f..21b59d4ca8d2 100644
> --- a/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c
> +++ b/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c
> @@ -17,6 +17,7 @@
>  #define HSUSB_PHY_CTRL_REG		(0x10)
>  
>  /* PHY_CTRL_REG */
> +#define HSUSB_CLAMP_MPM_DPSE_DMSE_EN_N	BIT(26)
>  #define HSUSB_CTRL_DMSEHV_CLAMP		BIT(24)
>  #define HSUSB_CTRL_USB2_SUSPEND		BIT(23)
>  #define HSUSB_CTRL_UTMI_CLK_EN		BIT(21)
> @@ -27,9 +28,13 @@
>  #define HSUSB_CTRL_ID_HV_CLAMP		BIT(9)
>  #define HSUSB_CTRL_OTGSESSVLD_CLAMP	BIT(8)
>  #define HSUSB_CTRL_CLAMP_EN		BIT(7)
> +#define HSUSB_CTRL_CLAMP_MPM_DPSE_DMSE	BIT(26)

leftover?

>  #define HSUSB_CTRL_RETENABLEN		BIT(1)
>  #define HSUSB_CTRL_POR			BIT(0)
>  
> +/* PHY parameter override register (eye diagram tuning) */
> +#define HSUSB_PARAMETER_OVERRIDE_X_REG	(0x14)
> +
>  /* QSCRATCH_GENERAL_CFG */
>  #define HSUSB_GCFG_XHCI_REV		BIT(2)
>  
> @@ -115,6 +120,8 @@
>  #define LATCH_SLEEP				40
>  #define LATCH_TIMEOUT				100
>  
> +struct phy_drvdata;

Can you just move the declaration here?

> +
>  struct usb_phy {
>  	void __iomem		*base;
>  	struct device		*dev;
> @@ -123,11 +130,14 @@ struct usb_phy {
>  	u32			rx_eq;
>  	u32			tx_deamp_3_5db;
>  	u32			mpll;
> +	const struct phy_drvdata *drvdata;
>  };
>  
>  struct phy_drvdata {
>  	struct phy_ops	ops;
>  	u32		clk_rate;
> +	u32		hs_tune_val;
> +	u32		fsel;
>  };
>  
>  /**
> @@ -273,7 +283,8 @@ static int qcom_ipq806x_usb_hs_phy_init(struct phy *phy)
>  		HSUSB_CTRL_RETENABLEN  | HSUSB_CTRL_COMMONONN |
>  		HSUSB_CTRL_OTGSESSVLD_CLAMP | HSUSB_CTRL_ID_HV_CLAMP |
>  		HSUSB_CTRL_UTMI_OTG_VBUS_VALID | HSUSB_CTRL_UTMI_CLK_EN |
> -		HSUSB_CTRL_CLAMP_EN | 0x70;
> +		HSUSB_CTRL_CLAMP_EN | HSUSB_CLAMP_MPM_DPSE_DMSE_EN_N |

This will *disable* (_N suffix) the clamp on ipq806x too - is that intended?


> +		phy_dwc3->drvdata->fsel;
>  
>  	/* use core clock if external reference is not present */
>  	if (!phy_dwc3->xo_clk)
> @@ -282,9 +293,14 @@ static int qcom_ipq806x_usb_hs_phy_init(struct phy *phy)
>  	writel(val, phy_dwc3->base + HSUSB_PHY_CTRL_REG);
>  	usleep_range(2000, 2200);
>  
> -	/* Disable (bypass) VBUS and ID filters */
> +	/* Set XHCI_REV bit (2) to 1 - XHCI version 1.0 */
>  	writel(HSUSB_GCFG_XHCI_REV, phy_dwc3->base + QSCRATCH_GENERAL_CFG);
>  
> +	if (phy_dwc3->drvdata->hs_tune_val)
> +		usb_phy_write_readback(phy_dwc3, HSUSB_PARAMETER_OVERRIDE_X_REG,
> +				       0x03ffffff,

GENMASK(25, 0)

Konrad
