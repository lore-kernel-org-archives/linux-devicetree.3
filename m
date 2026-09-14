Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FC33BB40
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 00:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789344428; cv=none; b=HJOyl7c/4UTvD55VvSgQ7pAOCyKePWg2kxAd4JTNyCdZsV/MqIY9UU/dnI0heM3kkv7x0IgM25wmJei1yloMdFT3NL4PcBOMM6rpijoT3oyhWUQTE/oACST8hlhy2MsP2NHPyFw6oF3xC1e9DJF/zyXYLRvPqtbOC21yW13CdFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789344428; c=relaxed/simple;
	bh=vy1blXj2dY6DW+OZU7BVBD42zx6kntxpbxMgRGNRFBk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WNdIXaXnP7b1EbxVtUMC7aIfS+W6Jx+dy98UNebk8nFS/qmOQAXOPbEfKn6v5S2xtDtbwa8rZeOA8Oo/ZHjm72HSfZSLQxp64KPRE2ZJCKxfm+OGsMYWxUNl8uiBNcKSZYjEcYQ41J23KrOnIWf2LZxlzPUa8ByZnlc0tnUJea8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a2sP1jSc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N9DIEOKJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a2sP1jSc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N9DIEOKJ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E06O1e081568
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 00:07:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mB2tXTYElK9wlaDpsNW/VGIQ
	GRoWVlamEFnm6tcQN2A=; b=a2sP1jSc+J8gb/HzYw5SU4wOvQdqSxXUqCXrRPH2
	qnS85EY12kfioFFdLIj2ySXvcdZUx3jyETjnqDmZ21YwAFPE8ffKMxQhcQS/TcQf
	qDYKU1qR4zkaCWNyS7tRZdXe9iTaMCf9u7rrYTdpp9wNjZWr7Usjaivtg2RQ/TmV
	OPUSgsK4fus+rapk4i4ithO0ySwxxooISnAli+ScWpUcIMO4I5A16CqcD3d/GXev
	5Ff9CgGsSfea8yV3mVttfSEJSjeScwH1XkyK+mNqFf1G+VplsQN60ga1Qy4oc0M9
	iIszyybic4wIrgx47s05tgONvXRfa6rjky8prJ82NHHAFA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9cmd0g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 00:07:06 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-97cc09260a3so3224534241.0
        for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 17:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789344425; x=1789949225; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mB2tXTYElK9wlaDpsNW/VGIQGRoWVlamEFnm6tcQN2A=;
        b=N9DIEOKJqUN1xr+JqKRgXoSdq816kLta5WKZkRQIFJ/lFH8NoEPR5b+TxIMYP6sJVf
         4E531u1m04+dwnoR/x8+uOH/5jGxL6MaYWymU7p87tZLfd06alHuRy1D5F+Qx67346GT
         Z5TNwvzpTYrBikDqX6mpVNO1gzqwU9Cts50/Vc0bmMsPKD8z3inIJZbZkNTvT3JGGpfY
         b0LG6c6Jrxl877aYlFXNuHOu1z86yPWEZkmUbVRCxr87/+SMCaqfLbrAxMQZViagHq4u
         XzSnNgJeUy3x6ayCQg6fXYnYVryoGnEQYfeINqDpKhlmyUzVJ7L9JDuGGnU9pMRiTTul
         ZBTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789344425; x=1789949225;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mB2tXTYElK9wlaDpsNW/VGIQGRoWVlamEFnm6tcQN2A=;
        b=SlzgvwOAE4A6dpUxiDfmGIojzOqQGf7qv3maq8cHRo7OwJg45eZkaf6Hu1SKIVPRuA
         otBhmaNKxwEYHAhcyYfpvoEXwqzqMdZjDWDa4Ie+0FrPxCag1O3cbG0Vnk24yG31aCH6
         GneTu7j4UaFggUuBc1GD38nC7Buwe6LrsOjLrBATPfRH8Hjd6IWvtBqLwHKIMjkSBQwY
         1xMYxrr2EhSPJ3xwlhiK5LEWxKVvgIZESiFkvwWU3C8gkH6hT0RaBegS1lEJQWeV3rg1
         tcDS8E0uk5WWHbou+jw4DKkr4NSyn7cUeZMm2zGgwSCQRieFeRz9IdWa8oMDTqJXmc1g
         iTNw==
X-Forwarded-Encrypted: i=1; AKwUvBxrDro+kKWEspCFbG8/dSzHSD7Nsm9WYaOUuUQLa/6/UqsxxYtrPO33VbQRNKx8mxvYtH1ecBZv9RLR@vger.kernel.org
X-Gm-Message-State: AFuF++kmImnwXqeF933dlIDlD7OjfSs3+bL49QRBb0ej27fPiC9K/G4T
	/zrmRRqFFzLhsQcoDNNpj8b6UrBxMbQVrr+VGyc2kcS3+WdVNP/1dUjtae9gfjy7rJCrB6quNhl
	Qj0Kd078270dwY0YBobbgTlwvXPumk94cZgjTaG4Hy/TdefKAdrym2D5ewB6v2hHG
X-Gm-Gg: AYBFou1hPoQpMWP4MOwu6fECrPt0Pzs0XbO+Wtl9JXlfCjWL9k1IZX3T1keQZrtm8f3
	ifcve0o7xCdHpDX321qkIDAhztWbeZnCE873TlB+XGcExSYWWNqsTfBU/sbhXyB4ovAkEFmeQoG
	PqmaLIU0yQU2U8KLeD3PAKIh6ImOzSdND4DTANcJddzJRKBF3jxUM7ziL3qi7WLJZ0Xo5zBVFrG
	qMLFPPwZBSfzwJI4Tl7t/urdVXljLPwNWF0OJEsEZMAHZe3e4b7gHcF1PKCZQDUP8zsKRA+kosp
	KLfThf68H8bQXJOoRnExMW1mP05TBit6iYZSWpn9nZ0/LnXdofo8xTk7ZW9kpt06IxlgBmMLZL8
	yii31xHr3BVKYiyDrAww07FZVHebGu+/JDofFqUGoKzwLIZyP3kPy9dR+4vDoTw0BzNs76X2x/J
	S08FBinPkl0j93
X-Received: by 2002:a05:6102:638a:10b0:780:c9c:bfcd with SMTP id ada2fe7eead31-79894637907mr734618137.17.1789344424879;
        Sun, 13 Sep 2026 17:07:04 -0700 (PDT)
X-Received: by 2002:a05:6102:638a:10b0:780:c9c:bfcd with SMTP id ada2fe7eead31-79894637907mr734605137.17.1789344424487;
        Sun, 13 Sep 2026 17:07:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a045726fsm2036893e87.20.2026.09.13.17.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 17:07:03 -0700 (PDT)
Date: Mon, 14 Sep 2026 03:07:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: Re: [PATCH 11/17] phy: qcom: edp: Add Nord PHY power-on and reset
 state-machine callbacks
Message-ID: <53h45tzuwxcpa3dgto5jcpc74hpeifzuhdjwvwlgsbvkxaxlcg@p2p5rciv3e2g>
References: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
 <20260911-nord-drv-dt-v1-11-e25c073cf1b6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-nord-drv-dt-v1-11-e25c073cf1b6@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDAwMCBTYWx0ZWRfX5fGm17nfzpmp
 flFygfe8FSrneTTyt1XOVDqw3BoBdn+uLB+zPTMY49tVXd6rU+XIPGfKw3ZfeaXZ2UMc2Kojm4z
 t3xW6WbN6NAF9c3bbq6Y4w6ycQATn2uJ8uAX99A/t6voizcksZ+xknpotOVcedXyX789Rz7Ud25
 o/i2xnUMXoQn0s5D02UooK7jd12b1HnIjevqMiy2jqF/aAmbga5nYD+hoTnxxwQMRmujM1DCcWk
 VMeEkKKImVEe3TWhjO47HQRgN4yd1MHR6km6dEXKDDFNd3BxxTlyuZhD3/6zc1UIdTgt6XVV7U1
 NJvWoqwXwErqN2XEMEymgqf3DY60CLWoIFo0MhyGL5TvHuylTEvDH8cjTmUd9CqMHIDecQ3cmCp
 J5WDIIYAX+99/h06cgleqhdl/Gabgn4xeLP0WtJUuH7gP9AETQkhrqfs9wVE7w0lZ62mhRRM7XX
 C5xtxo775uS0VZQPg5g==
X-Authority-Analysis: v=2.4 cv=EMyTQFZC c=1 sm=1 tr=0 ts=6aa73aaa cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=2o1v5Kz8aWF9ZuGQiYsA:9 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDAwMCBTYWx0ZWRfX1ofKF0O1thcx
 uVoTtNT0dpfA8MF9cmZrlmQsXan0j2XoyFnJWDNyujdbfpXwyhw6uMB7W/7zfwGjwqHtLPebRS0
 NxsVAZGLQKPn3ICMt5be9JT/5WIngew=
X-Proofpoint-GUID: 41KvvrNazmc4bgRWRsLjFhuQjtph5oz0
X-Proofpoint-ORIG-GUID: 41KvvrNazmc4bgRWRsLjFhuQjtph5oz0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_08,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140000

On Fri, Sep 11, 2026 at 09:06:42PM +0530, Nabige Aala wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> 
> Nord relocates the QSERDES COM CMN_STATUS and C_READY_STATUS registers
> so the generic sequences cannot be reused.  Add
> qcom_edp_phy_power_on_nord() which powers down all lanes and polls
> CMN_STATUS_NORD (0x1d0), and qcom_edp_phy_com_resetsm_cntrl_nord()
> which triggers the reset SM and polls C_READY_STATUS_NORD (0x1f8).

If the only difference is the register address, please use register maps
instead.

> 
> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-edp.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
> index 64878398f43c..6cac4b55b66f 100644
> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
> @@ -1612,6 +1612,31 @@ static const struct qcom_edp_swing_pre_emph_cfg nord_dp_swing_pre_emph_cfg = {
>  };
>  
>  
> +static int qcom_edp_phy_power_on_nord(const struct qcom_edp *edp)
> +{
> +	u32 val;
> +
> +	writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
> +	       DP_PHY_PD_CTL_LANE_0_1_PWRDN | DP_PHY_PD_CTL_LANE_2_3_PWRDN |
> +	       DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN,
> +	       edp->edp + DP_PHY_PD_CTL);
> +	writel(0xfc, edp->edp + DP_PHY_MODE);
> +
> +	return readl_poll_timeout(edp->pll + DP_QSERDES_V8_COM_CMN_STATUS_NORD,
> +				 val, val & BIT(7), 5, 200);
> +}
> +
> +static int qcom_edp_phy_com_resetsm_cntrl_nord(const struct qcom_edp *edp)
> +{
> +	u32 val;
> +
> +	writel(0x20, edp->pll + DP_QSERDES_V8_COM_RESETSM_CNTRL);
> +
> +	return readl_poll_timeout(edp->pll + DP_QSERDES_V8_COM_C_READY_STATUS_NORD,
> +				 val, val & BIT(0), 500, 10000);
> +}
> +
> +
>  static const struct of_device_id qcom_edp_phy_match_table[] = {
>  	{ .compatible = "qcom,glymur-dp-phy", .data = &glymur_phy_cfg, },
>  	{ .compatible = "qcom,sa8775p-edp-phy", .data = &sa8775p_dp_phy_cfg, },
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
