Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAED733998
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 00:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789344214; cv=none; b=qHs+yFKfu7ghJ9UgSTViScszheQaLqiMsd63TA1Mn6nmlNbl6ipABq39PpVfPaQLwd4+n0Ul0b1vlmozNjPjgbwkmVuhhJPoC3w0P9j2VerTBRnYFh3tGRk159tdS3CwcQw8IamdbVtyO+p2uAXKEJ1/UsPsmJMselCHyLVBsxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789344214; c=relaxed/simple;
	bh=UyGdKcNE5kMETonI+UoSDNlO6pqe62oNJFOnsokLerk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KfkOMl6MRd04sgux5EumJCPX0iLAJs6RhnIO9eY/xpj86DajHhhb9K+Uh8gfj5Ahq280A+HVN+kJmMkVMxSpWehoExDvZZowhs14faTMfwtb3dwbN2kkyQhocI1PlL9TWtteNiv8rzsYxTzeOwgD1gpOXgZPWYlKfqNrbnlLTLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A13MD8t5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ONZs1XqM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A13MD8t5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ONZs1XqM"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DNYpWc3067035
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 00:03:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QCkweCa7F1/CfL9F/9LUYh2D
	moFaRAIGZJkNvknrjg8=; b=A13MD8t5ztJPFtfgVH/8KEWLJcSSvt+HA2SlvQbM
	AZK5ZLrulxyLHOFRHGSD1EKyQx5gDQn9MN984XcBQ9hSqkPCuIX4hdKHr2UzY3eC
	vbrwkfTcjmzqfwUnPcojt31V0O6roFyb/+erS4Yx8t0TVuZyglYeWxiPUUj/cxbJ
	ETH9p6bWWCqxYwGxlL3s/IleiDANgCQzD6FCCnuw+Frp7qqBfFuo55yssWA92iSC
	SW4k+Vi6DgqLKc+kKR0BbESfq4v0urXQjxpQhiUfVsPdkDNprzK6HAmNRAiKCxm2
	UTuqQQeUYqZjGODhiJDWf0PD3/D5Gy+XPpGaOeXJOhQCOg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c4dfa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 00:03:31 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c405d3e18eso4365925e0c.0
        for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 17:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789344211; x=1789949011; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QCkweCa7F1/CfL9F/9LUYh2DmoFaRAIGZJkNvknrjg8=;
        b=ONZs1XqMJCmBdwR8Gfg6D5Z11WlDpFEx1ocVjCVQIKz24KRuXFf1fNha3hMOFMqX07
         AqUxdihhF0W5PBa9LWSNw3oM9GgF0bNMAO4yP2Dawlnd115/3jt6QN1t7ep8QyqYIL8K
         0lUIVeMpfDBktmwuwruWA0H0cL4egUIAsVtD6OKjcpvrz/mxbgpcJyoStVwmSK/K36xq
         r87fz4eQEzL/PEbNGm9HRRFbfv1AHTi2rZSt6dupafUt116brNx+JJDzbHAq1UWzCMS1
         9dtUzJLhuhf4Iukk8GV38rbX9owVEFLjhF0r/F1ODsHw3QQhrcQTtytDuNCKdykEIsne
         sppA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789344211; x=1789949011;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QCkweCa7F1/CfL9F/9LUYh2DmoFaRAIGZJkNvknrjg8=;
        b=VCWsovM/zFepkXClLoCx78SgnvWFXnPyOOqdeLmy+qXRtWGj0Bo9O+6uN0TU/c8fLB
         +ixVatPuPi+U6l9ycpLKtDDHthGkzF1ROu2OEB82+OiOioXDqZGsBV6I78JYNKP/AVdW
         2G4lRxtH7q8o68E+zrvTHXbcA8AQ7pg6NsF8rHMuJybz+IfYpJlCxBOg0w9czs7cYhJY
         HCXkCAz1U4leroipvGGMQSY/qWY67POkzzapE4JmciTklR/14EMxaLHimoBrUV9eKcUc
         dXKlNKRjEYXX9X50xomc7BF38yX5E1lQn/bJ8YIW8To8a9hjHQKtmCoA1ik41tIwnUY+
         FMpA==
X-Forwarded-Encrypted: i=1; AKwUvBzfx4NYwDWxcUSNXjhg4fF4wCuGCYDOVxw5S93xtqoN7e1tG6CJdvHdKB3btIWy5ys0qaZbg/bHqIVX@vger.kernel.org
X-Gm-Message-State: AFuF++kHLvalLJXexuQbao+L7n3dwkMpLOB6ziqGgU9qfFLDUVeAkko5
	kKtBqJx2h5FMz3nmQLhiv4OhzeFkxUzYKRVH5hWY/qTBuERVWoCmFwaWgxqExHi5H1mtU+UQMUo
	DvgpBmdjfwzwnpox42n9PvHz3vJHfhAnHTGW+9eeiD60ozxLQNMt6YtMxDh9sMS4z
X-Gm-Gg: AYBFou0/RKOGMTDZQUEbp0lcj+xePQjvrprbym6lQy37nCQ+Ekekmlr3FQ06OvhDEci
	fWTnE4AtriXvVlaKglIYHrcsJVGqlzlR3sbqVmm3tTit6HDxrpUGwzHLeKv+XOFsTc61qvJqPsK
	X8DszviDnODsEY9qVSfsW83i+jHEfUxBrrl5c5X5mE1qUvq9HvJOmjVPSAJwKr/pOSoyDH6U3xd
	Ji8P4ZWoiL0JYxtOSumIvdJQXztwhn/fHyRKkUsSsgHF0L6kMeY2ffe+c0SIn20jkyiPF7TmYsF
	M6+SBmnLHDKrqKMecqUwIIQE452TVFMH/aXEA3L/MdsgRPl6ibtowoNljRZClJ2CnF70EwXuR7E
	Nk4PEGFaxqdMOXLI5luEj2t5KFQsIArZTj4Obr3TLjoO0HpyKPVUceaAyKV/bksaloS8lttKOCW
	ki7Z1DL3h6wxj9
X-Received: by 2002:a05:6102:5093:b0:77b:28c1:210e with SMTP id ada2fe7eead31-79b579b2355mr81974137.1.1789344210741;
        Sun, 13 Sep 2026 17:03:30 -0700 (PDT)
X-Received: by 2002:a05:6102:5093:b0:77b:28c1:210e with SMTP id ada2fe7eead31-79b579b2355mr81948137.1.1789344210374;
        Sun, 13 Sep 2026 17:03:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a047aa12sm2040899e87.74.2026.09.13.17.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 17:03:28 -0700 (PDT)
Date: Mon, 14 Sep 2026 03:03:24 +0300
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
Subject: Re: [PATCH 09/17] phy: qcom: edp: Add Nord AUX channel and VCO
 divider configuration tables
Message-ID: <clxbpw3awcpispcixwrvwj7hocvoag6fhhp7d4azamxghk5x5o@ar3infqpcy56>
References: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
 <20260911-nord-drv-dt-v1-9-e25c073cf1b6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-nord-drv-dt-v1-9-e25c073cf1b6@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: _A9xx4irorKszRbTON6g7wQXqzQpIrxA
X-Proofpoint-GUID: _A9xx4irorKszRbTON6g7wQXqzQpIrxA
X-Authority-Analysis: v=2.4 cv=c5Y+0h9l c=1 sm=1 tr=0 ts=6aa739d3 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=_h1llJ5GsiActe-pZHAA:9 a=CjuIK1q_8ugA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDM0NCBTYWx0ZWRfX+EkNW9pfSTKb
 W9q9ezGkr6H/hDW4QnppXGjeamJ4p25xDE0y9F46q7iJhBI6fcHMr5NSG36HS+bYIq+1XDRn8fG
 zi3c5W7hiGdg6kMIrs30Hv+Q7D5JfD3ynB4rD60uSDt/Q1mEfw/4dpdDLlXYVYOTi9Yoq52Ysbi
 /AD+IvwJLx/d3+yHyfcjfj05Qu7zupSJKTpwRdan+e7QEOuxzagSRYSg9giRkKodDHskHk/undo
 b2lqNffFb0ysj/OqdhUyKbZUAvinAPLiRq+ZjO+fm8fcq3b0NzQUDecpblPbkJY0o2Q1U9DMsPe
 550YwXgTSTT8cpPOOvgf+qwVnWH8fEAY33bPelVllpHFvPG6NByVKynSyOQL+lVihTJAdrJXp0a
 9MqaiIeUJ4ZPXr137DYuyLNeXO9/Nh4TeG/FPKTdbrRbToraIdGQJl11FJqUmgj4kon4Bzn0iTg
 LYKaNXUIzbTBegJYYjw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDM0NCBTYWx0ZWRfX5+pndIqoMtD8
 nNlWAJ/JPUrwPITpj/j4k6hPcqx3mifW4mgQVvBeBz4yl7HpEKIthaIaYkpXk8tKrRKyANjjmzl
 xPTYwyllElm4c7kyCbqi1T5ovFuPn48=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_07,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130344

On Fri, Sep 11, 2026 at 09:06:40PM +0530, Nabige Aala wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> 
> Nord requires different AUX channel and VCO divider settings compared
> to existing SoCs.  Add edp_phy_aux_cfg_nord and edp_phy_vco_div_cfg_nord
> with values sourced from HPG Tables 2-1-a and 2-1-b respectively.
> 
> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-edp.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
> index 373f13b3d6d5..ee0d7f1a90fe 100644
> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
> @@ -1508,6 +1508,25 @@ static int qcom_edp_phy_probe(struct platform_device *pdev)
>  	return PTR_ERR_OR_ZERO(phy_provider);
>  }
>  
> +/*
> + * nord AUX config (eDP mode).
> + * From HPG Table 2-1-a: edp_phy_aux_bist.csv
> + * Index:  0     1     2     3     4     5     6     7     8     9    10    11    12

Drop useless comments.

> + */
> +static const u8 edp_phy_aux_cfg_nord[DP_AUX_CFG_SIZE] = {
> +	0x00, 0x13, 0xa4, 0x00, 0x0a, 0x26, 0x0a, 0x03, 0x37, 0x03, 0x02, 0x02, 0x04,

So, it's the same as edp_phy_aux_cfg_v5, except for the last register?

> +};
> +
> +/*
> + * nord VCO_DIV config for eDP mode.
> + * From HPG Table 2-1-b AUX Clock Settings (eDP mode) - Nominal/Turbo column.
> + * Indices: [0]=1620, [1]=2700, [2]=5400, [3]=8100

:-(

If it's AI, fix the AI prompt, please.

> + */
> +static const u8 edp_phy_vco_div_cfg_nord[4] = {
> +	0x00, 0x00, 0x02, 0x01,
> +};
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
