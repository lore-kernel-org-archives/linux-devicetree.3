Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5CA21474CC
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 00:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789344347; cv=none; b=eJdZ99sovTEk/Qpna91gii+TLMiuK5u90iBc3lthlbpvUex6OxSBrrk+szgYsjOsjKeTpI3yPt8ftf9HNR6VNSX04faDWJebPQmXPz8iWuabdeoOC/dN222cS22XpDHvijyVXcTkQyMJRcTZt1856KX0dAhAjC6+CgWWlLuGEyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789344347; c=relaxed/simple;
	bh=JYy6Q3cERV5xHpNbYiN90e5j5vQ7I42HtBRU9KR9z7c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k51fpSS5A/XMKPQJvgVGsLZ9CKrfLu8h5h3UFwQVj8cm398C7+ZLkh1xxRGXQxgpNR4nL4TQzQGr60VD9iytKHyk88WWGkXaeuITphMZczNYcvowo+dLLN5t+8MRqpd4HI3Vhc6LXQqkw05cf47UZAqelMdVRnhhf1e/saNbnFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RjGLO2iR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QwOJbWPK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RjGLO2iR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QwOJbWPK"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DNYnpk3284184
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 00:05:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RFfMXnGd4KZ9ZeGQQ7T1vM3J
	mMfNVsWmNXWnKZ/EyFU=; b=RjGLO2iR56z9k1Wyb9BNCcvkFLnw4qHtmwKfIZrw
	EJPCVhCVz0aqhlq8ZAM+gQ+r4Gkv/Ax3LAQEtsX7BWlvFf2mfJWoLzZPhJkGDzaN
	amIa1e9Fi6bSk9GtCtbXOFw+x+fY/3vZlkbn0a4HxBuIurQ9PGeIFY//5nCVAfOr
	xfTfEENE4Pt7V9JDNKMdvO4BqcgiCNgU1pChHNsNCJ6tFNKarLOmrIT6Tb20nChr
	NFzzWvvVKTvNrBbVh/M/MVESsiK9LVH0/iHNFRXv7V3LJ53FVT3rbKqqXJBg7lZI
	iGHb+POvy59JDGsRxhKi1wYqmQW0Y7y/josD5L1Bhr/mVw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3hsr7y1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 00:05:44 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-98066bba118so319599241.0
        for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 17:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789344343; x=1789949143; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RFfMXnGd4KZ9ZeGQQ7T1vM3JmMfNVsWmNXWnKZ/EyFU=;
        b=QwOJbWPKGAC21GFZrvKvzuQS2aVOd7T4s2ooyaglWiX+hgoebuC+4qZBdy8eC9RNR1
         6IgRB/jwEhdcKv0rpsVrsJdAfRxL6q78Ru218WXG83ig+rfoEyyeCizRqjaf4YXoZURz
         MZEBxCH/zMdSBA+IRNTU6LLbA2wf00OOs2/KBl+SFci6Evc9c6yaXSiDiYdUiI9c38fw
         iC/tZQ+HWhpo5YGP0VK/STndN37xeH07RzS9dVLY72g2mtVLFUcqDOXyNsq35iRcYyOD
         qqk5Ft5nEAKfdlP6SvBhh8BErTJ2RwlwnP4HJKi0sciTMg6PLi24OQy6xYUkiPQuOruD
         m/lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789344343; x=1789949143;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RFfMXnGd4KZ9ZeGQQ7T1vM3JmMfNVsWmNXWnKZ/EyFU=;
        b=hiwsJwXezI84BxCmSUiWIDnWif3WvKchm8jKYQEdHH1fVAChY2g85/Vm7hCTjVZiUR
         xfx2wrCmIb52zeelLNb4Dj1H22uPRw3kgCXVLsL9fbP3TsTYP4ttB5a3Xmf0Xa/iJhum
         Ye+DGGkiQEM4FzdHoBZsn/0iqw2Ev/gS4eA78RI3bzciAazyF7XhnrHBr8R6xmudMQ6e
         2UilPPiGwgvv7BD+47odVd8BxNh7R59Rzm2ws8Qzt3kLCCsE4YdVnVaaEaCGzDKdup9u
         BQX8WZBGvIwFPGZW71ZqBLkmbckRA12U8ePMiHKDAb0M6Ld8Mfl3amjbsnQluYCJ8MyG
         TAWg==
X-Forwarded-Encrypted: i=1; AKwUvBzsf27qLHLYTQga5BuBVKVQAVnXFcvQgk/I1FYQM98LXwnnycm+QmaPM7V7XFCOdpVeCtDhUPhMePMJ@vger.kernel.org
X-Gm-Message-State: AFuF++n4AIDGHHhJ490wb2c1KAE8JZmDGaLzfrupMcklb7K0LYQ8KA3H
	9tYUDqOuoTCTjFWNoFv5art3/hzRb4oC3sowGPnGdsqLG42DPSgFm+sEOFC75/gGZ1EK0H0Czxu
	tGExd0kPLw3ilHK9lMy4Jlck7AV1nAeKgFOPLLbAJkG/tOSVM/W1+dHXAWCSsicxm
X-Gm-Gg: AYBFou2/hfXQueTLEsv5LLDWHJ+oNAsH9O4K0TLl/hhnKx3XzMscmgHYTKDATPp37lH
	PkSs1mkk2RdqG/+xH2EpPTQ61SvXANGOFQNOQXtZOgXqnwwn1d00pHnzPMiQYFydT3uAFbV/4Pv
	WZ3PhqohinowAoKkZ4CSmyRDCdIsrX9vV/Wr6g3284GTVlPLWjOQtCui1kLeDG8gnyU5y8HZyou
	DvP33ePDmXv3f4eDA+jCUqSBljCrYDtfvIHMhvuuNZvFEvnPgaAiU4a2ZroodpAHhAyOGwVrY9O
	oBQtdYcYRfiaXSG8Xhl9YoQykHX2EnURb77xw8Ap6CuvSD7rQO/BThLS+U7QrzqpdrbgK+RJkwa
	OIWHx9tx7JU90cH3mjPz9leiaxmH8Veiiz+wOJCWEEwtWo+Ew0eDKvFd2QVNH2sllito3W5qjdW
	C0RX7VSTYgP+y3
X-Received: by 2002:a05:6102:162b:b0:797:b4ae:5897 with SMTP id ada2fe7eead31-79b5db96600mr47866137.7.1789344343513;
        Sun, 13 Sep 2026 17:05:43 -0700 (PDT)
X-Received: by 2002:a05:6102:162b:b0:797:b4ae:5897 with SMTP id ada2fe7eead31-79b5db96600mr47836137.7.1789344343016;
        Sun, 13 Sep 2026 17:05:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5a33263c7sm21536081fa.21.2026.09.13.17.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 17:05:41 -0700 (PDT)
Date: Mon, 14 Sep 2026 03:05:39 +0300
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
Subject: Re: [PATCH 10/17] phy: qcom: edp: Add Nord voltage-swing and
 pre-emphasis tables
Message-ID: <rrkzp7kbest7vmkcgq3g4ewhpskl4sdawtjncvfdgmixi2bjod@faldfme3q4wr>
References: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
 <20260911-nord-drv-dt-v1-10-e25c073cf1b6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-nord-drv-dt-v1-10-e25c073cf1b6@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDM0NCBTYWx0ZWRfXz0YKDSDxxG4P
 nRvYv2pB02O3Jd/4GnG8hq8SWEWHTw0VSPmHjQ8APccU8BQlqhMUNbEON242Q5tfp3oFcs265qO
 F5SG+VE4lRL5WntjTScXbTbensUvtBT4CwYNbbC1TxddpHd8Ld+xgDs2y/SouucQg9Cs9+SDMjs
 N4M8QjIYAHnZ+iNzpxjbaigvUtl04Xqc1Gwau3AhECzlQ6wECIHhfyVtSbLQQZNUXdMutNL6JiI
 hIfgvTeYRh33dQcdHvXVomgQsMFZC3W3Q79td3nSCXhkMKRivKyttdjDA2x8f6aVg6MZQ0w5IhD
 CnytkYaC3Z/vy9/sJPgp4Z22gIz/95JYHQqJdOU8ooutWBTiDsiCSU+DgCl48H2EmyywnDc8qYA
 dlSAkzt69DQtthjDRtaWAwhAUzF5Yq5mydlRrY8amx3A7wLVWZRnc2/RFxXvhZVnSWI9+TvkLus
 IWRp+ELqFiOqxh9fFLA==
X-Authority-Analysis: v=2.4 cv=IZwSymqa c=1 sm=1 tr=0 ts=6aa73a58 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=WDH15GvG5mASCzW3U0MA:9 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: s-_DS9IIQ3WezmgzIjz0rfbe2vRdKpMP
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDM0NCBTYWx0ZWRfXwwh0IIT0+Z04
 +7Xzf3LzMehT7rag1l89Huw+bcF4GTuTL3TMLQE+yC8LuHbj1I4YDGwLza/4ZABAKEI01NjB7k3
 raRzrZQzQ0Edh1GTnHsUiqEb98gpBbo=
X-Proofpoint-ORIG-GUID: s-_DS9IIQ3WezmgzIjz0rfbe2vRdKpMP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_07,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130344

On Fri, Sep 11, 2026 at 09:06:41PM +0530, Nabige Aala wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> 
> Nord requires different TX voltage-swing and pre-emphasis levels for
> both eDP and DP modes.  Add four pairs of 4x4 tables covering RBR/HBR
> and HBR2/HBR3 for each mode, sourced from HPG Tables 2-2, 2-4, 2-6-a
> and 2-6-b, and wrap them in qcom_edp_swing_pre_emph_cfg descriptors.
> 
> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>

How many commits do we have for a Nord? There is no point in splitting
it in 10 different commits.

> ---
>  drivers/phy/qualcomm/phy-qcom-edp.c | 85 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 85 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
> index ee0d7f1a90fe..64878398f43c 100644
> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
> @@ -1527,6 +1527,91 @@ static const u8 edp_phy_vco_div_cfg_nord[4] = {
>  };
>  
>  
> +/*
> + * nord eDP swing/pre-emphasis tables (eDP mode, low HBR: RBR/HBR).
> + * From HPG Table 2-2: LDO ON 550mV (0x51).
> + * Rates: 1.62/2.16/2.43/2.7 Gbps
> + */
> +static const u8 nord_edp_swing_hbr_rbr[4][4] = {
> +	{ 0x07, 0x0f, 0x16, 0x1f },
> +	{ 0x0d, 0x16, 0x1e, 0xff },
> +	{ 0x11, 0x1b, 0xff, 0xff },
> +	{ 0x16, 0xff, 0xff, 0xff },
> +};

edp_swing_hbr_rbr? Why do you need to duplicate it? Drop the duplicate
tables.

> +
> +static const u8 nord_edp_pre_emp_hbr_rbr[4][4] = {
> +	{ 0x05, 0x11, 0x17, 0x1d },
> +	{ 0x05, 0x11, 0x18, 0xff },
> +	{ 0x06, 0x11, 0xff, 0xff },
> +	{ 0x00, 0xff, 0xff, 0xff },
> +};
> +
> +/*
> + * nord eDP swing/pre-emphasis tables (eDP mode, high HBR: HBR2/HBR3).
> + * From HPG Table 2-4: LDO ON 660mV (0x91).
> + * Rates: 3.24/4.32/5.4/5.94/8.1 Gbps
> + */
> +static const u8 nord_edp_swing_hbr2_hbr3[4][4] = {
> +	{ 0x0b, 0x11, 0x17, 0x1c },
> +	{ 0x10, 0x19, 0x1f, 0xff },
> +	{ 0x19, 0x1f, 0xff, 0xff },
> +	{ 0x1f, 0xff, 0xff, 0xff },
> +};
> +
> +static const u8 nord_edp_pre_emp_hbr2_hbr3[4][4] = {
> +	{ 0x0c, 0x15, 0x19, 0x1e },
> +	{ 0x0b, 0x15, 0x19, 0xff },
> +	{ 0x0e, 0x14, 0xff, 0xff },
> +	{ 0x0d, 0xff, 0xff, 0xff },
> +};
> +
> +static const struct qcom_edp_swing_pre_emph_cfg nord_edp_swing_pre_emph_cfg = {
> +	.swing_hbr_rbr		= &nord_edp_swing_hbr_rbr,
> +	.swing_hbr3_hbr2	= &nord_edp_swing_hbr2_hbr3,
> +	.pre_emphasis_hbr_rbr	= &nord_edp_pre_emp_hbr_rbr,
> +	.pre_emphasis_hbr3_hbr2	= &nord_edp_pre_emp_hbr2_hbr3,
> +};
> +
> +/*
> + * nord DP swing/pre-emphasis tables (DP mode, COMBO_PHYS TypeC).
> + * From HPG Table 2-6-a (HBR3/HBR2) and Table 2-6-b (HBR/RBR).
> + */
> +static const u8 nord_dp_swing_hbr2_hbr3[4][4] = {
> +	{ 0x02, 0x12, 0x16, 0x1a },
> +	{ 0x09, 0x19, 0x1f, 0xff },
> +	{ 0x10, 0x1f, 0xff, 0xff },
> +	{ 0x1f, 0xff, 0xff, 0xff },
> +};
> +
> +static const u8 nord_dp_pre_emp_hbr2_hbr3[4][4] = {
> +	{ 0x00, 0x0c, 0x15, 0x1b },
> +	{ 0x02, 0x0e, 0x16, 0xff },
> +	{ 0x02, 0x11, 0xff, 0xff },
> +	{ 0x04, 0xff, 0xff, 0xff },
> +};
> +
> +static const u8 nord_dp_swing_hbr_rbr[4][4] = {
> +	{ 0x07, 0x0f, 0x16, 0x1f },
> +	{ 0x11, 0x1e, 0x1f, 0xff },
> +	{ 0x16, 0x1f, 0xff, 0xff },
> +	{ 0x1f, 0xff, 0xff, 0xff },
> +};
> +
> +static const u8 nord_dp_pre_emp_hbr_rbr[4][4] = {
> +	{ 0x00, 0x0e, 0x15, 0x1a },
> +	{ 0x00, 0x0e, 0x15, 0xff },
> +	{ 0x00, 0x0e, 0xff, 0xff },
> +	{ 0x02, 0xff, 0xff, 0xff },
> +};
> +
> +static const struct qcom_edp_swing_pre_emph_cfg nord_dp_swing_pre_emph_cfg = {
> +	.swing_hbr_rbr		= &nord_dp_swing_hbr_rbr,
> +	.swing_hbr3_hbr2	= &nord_dp_swing_hbr2_hbr3,
> +	.pre_emphasis_hbr_rbr	= &nord_dp_pre_emp_hbr_rbr,
> +	.pre_emphasis_hbr3_hbr2	= &nord_dp_pre_emp_hbr2_hbr3,
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
