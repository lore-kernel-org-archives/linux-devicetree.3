Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775353EA977
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 10:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791886757; cv=none; b=UV3oCjcMRKh120ToIeUQTgHR/JGKueluzBZlTB1gEmaGwcJeV7aIrjofLwdRniVUCYesSY7i5T0PZpMp4ddlb/+QRGUro9bLnQ0P+RVAloRd8CiRRwHuxB89kK23twWO7u16qlJ823dNBTpXgJCjkFSl+TczcEMFXaze1NfzS7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791886757; c=relaxed/simple;
	bh=3xSL9LPTGLgFsEJgy6ZzYNM745Z+ZyKzpW4+6bkDYHo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O03j3MyCqvphj73G6qnXiJ4sYr0FfI6GCHft+VEYwno96InnRQ8ABijVjzQblUJYEQ8R4GkDHyWAp7RAwYwmR1MeWDNALWkQj5CHwv3tirb/7r8JE3XbVS24AIdfHZRidEoVThlzibTgSf/wRu8An21FxsTooY9DqeYXDC2mj2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g+SsL8wG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IffmXmL1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g+SsL8wG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IffmXmL1"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D9WSB1173800
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 10:19:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7Hhfq7fiw28ZkDfvmDF1BDlx
	jnaYKRw6TyjN4JrVX4g=; b=g+SsL8wG0HIRiVNkfIddsxB99Jn0oQla+0oDMREd
	rxMP5t6pwMbbuo83h6PuLoOT7kn7YDI0oK6C3XcnmZX0WGxNe305I3U+KJYc8xBj
	jBEM732rBJMa3TVw1wPuwaMus54MJa9KblXoI5u6WE1OrbwoxhTpYSCWruiu/s+n
	Z94zeoPiTilNEsFbF3f9bYFWFpyBh5heV8wzJNRFrGKJHmV6jjd2alQUPBnSXnFC
	CO7DCf2clXltf7sxLa1c5y0ur4ihe5OngyWKt/DV9TnLxaaXHLZcsHDuHTyJJo39
	9tXB9FyZoQOkAoG6dxU3GMARsIH+6Z1bAeE0/GHAxslnlA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9daqsf4c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 10:19:15 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a3f673221so848740685a.0
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 03:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791886754; x=1792491554; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7Hhfq7fiw28ZkDfvmDF1BDlxjnaYKRw6TyjN4JrVX4g=;
        b=IffmXmL196GpZYYhpoBu0XqCES0gQWLtrSJVmwToVor5hQS681qImCvtMP5hsMlQxd
         PFk1ITozzpXihARC1BdJXvbc9dH97Q7aLcufwtGz2y9vIGuPmvnOfYSKMXQ6QajlZ/fT
         9rZK7mvNXT5sXg1GuBBUBGOWnM55FipovGXqnwwsBh96XSNS8EB6YrIFsBibxEb9G0aD
         Fzj7Ru0Qk8eQSuhE5ddEulHD6nbmeo0zAiDPoNqhTGMr0mGeFXjOOIDo1qE1lIPBklrl
         YUeJVKF1m570A+07YqtJFY3uS21Z5D9Npia/DPJNINKwPAQy9G03PRUcWDMg5o3OAeul
         rfzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791886754; x=1792491554;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7Hhfq7fiw28ZkDfvmDF1BDlxjnaYKRw6TyjN4JrVX4g=;
        b=t/cjU82Ka2VvMp8Heea4fUx22IkKHqRJ63sONIEdYK1VlTVH64MtOEoELNjSL7EMIy
         IR+6CfCyLs6hSRHrjt1plS7unrcFwyVPECCcqge36atkctP7ftMuxsJnGySXUKFbd2Kl
         CiZltb5MtaHt3g5nChSmqH1jtGuG/ZvcuhAhITVxs3/EjLQ5YrVTP0Zz5J3t7ev2RP7Z
         JFQUqY/gWdmUv5SbPzebkS2+CL/ADC1Er4wux+VR8NqX8QXIQsX2RvGPzQiszgY/5pKb
         fICV+swBLDO0ttpsghyDhy2OJD1TZpIWbrtaTJCX65BlhQabJmS+Lvi+KU50c6WCjoBk
         UNgQ==
X-Forwarded-Encrypted: i=1; AKwUvBwLs3T6HzbBsVSbA8wZCm7UuHjB/J3UrmM3DwegzG7zFI5qBtlecSk+59yJB4NDyjM4cUZoK2yWh5fG@vger.kernel.org
X-Gm-Message-State: AFq9FYL4lYCMC1/g8tOjYsimI3Ym8kECsrEa9MJxegA24Rm/X7RDJiDG
	WZtt7xzQ8lPXmt5x7cSWAa7nw4oVhpwPpmek2sYGhphYHc7O2LCjFAIHWtHnBD1+R4axl3jNuVt
	frmPZgNsAk8KKQIOgyl6XazrxlgIIN5fW9yW8Gt4lXIjvxtGTUs0Yfn374Fj9+AHL
X-Gm-Gg: AYBFou0ap+ezp7x5fXZOpVwl7yLWK4vZHvYlUOqGk03yqE68ZRoOvSDCuswqwW5EZNE
	5rFK2t5NQoZV2UoWCgo0Vp6uTTkdv22/xGNHQxNLeds8u7JqBmlVIp6rL3gUax9y/E/N4j3rCzS
	Nvkl6GqFE1CTrSHXcBfNk8+2nR1++yNHWeHM62RHEVpBp8Phy5dUbvia4P0eY9dqbnrCkuJQieD
	p0W+1MxftUQiCByK3ilHBNitsj0S+tl0I0iy5KsURLGPT3rfLy4bfbWHqK+7QXpp6I/FO4+TT7U
	imKk6rT+dUFlsp2/rvQX4h0m7cTdqsPl2Qj9LQzsEaPkt/oGN4fnO8kBxDzJtAmpivjdTcRv/Z6
	FRgV8XEC16fsQZ7npIcJrIM3PD2HRTDmTPen4PDnyBk0ov8hsXWMsiQtZ9DMpjWL6KLEuzcQ7rA
	C27s4APNb7ZIfn
X-Received: by 2002:a05:620a:6405:b0:93d:e031:5ad with SMTP id af79cd13be357-93ebd224911mr1904653785a.17.1791886754570;
        Tue, 13 Oct 2026 03:19:14 -0700 (PDT)
X-Received: by 2002:a05:620a:6405:b0:93d:e031:5ad with SMTP id af79cd13be357-93ebd224911mr1904649885a.17.1791886753984;
        Tue, 13 Oct 2026 03:19:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcf282952dsm1594993e87.7.2026.10.13.03.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 03:19:12 -0700 (PDT)
Date: Tue, 13 Oct 2026 13:19:10 +0300
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
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: Re: [PATCH v2 07/13] phy: qcom: edp: Add Nord-specific register
 offsets
Message-ID: <q7riz5qxge3gqjqz23xz5aecfhlg7bry5w3wzgblnyozm7ac7y@b5s3z7vk2k2w>
References: <20261012-nord-drv-dt-v2-0-a2ab9af954d2@oss.qualcomm.com>
 <20261012-nord-drv-dt-v2-7-a2ab9af954d2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012-nord-drv-dt-v2-7-a2ab9af954d2@oss.qualcomm.com>
X-Proofpoint-GUID: 6mSWW74U8j7E8_dvzQnpMprsULuwLVIG
X-Authority-Analysis: v=2.4 cv=FZuiV5+6 c=1 sm=1 tr=0 ts=6ace05a3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=zGc1Ob07GAFFi9FfrWcA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MCBTYWx0ZWRfX282htBASRUIk
 i4gK96x8DflDaHnXV3fIQ/4e1CIfhwfttWQDRSZOdUWADEEuVCAKPv/j+YFG467tE/QbLlk8HIJ
 k7E2Reh3L8dJnDTjoN8NCy5ofo4Wjro=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MCBTYWx0ZWRfX14J87iQjiWE/
 1XHaIxJedwLGJEV+vWcjttg0apEszV6EhdKPfO4AzhUU3ANlcIPyIIf/gMxVhwTonVAknlwqjgH
 Nq2IxAKnM4DUXtNcgeBYmTWDSzb2/T5QdM6+lFocKRL1a/DrhmxV8QchxxMb/M4Z/2FsuBW9Upi
 iKNNdC3zqSeEJl+fzm76kGAv0cOljP0qNHy7/fUHLietJJzb9N8qhCJguctQWfS/gTxwQ6pQiwk
 gO56qXp3WFFQLxfvAvbJSA2UvsL+dM4lwH0kuad0fyBx1FdZlW3Px+cjd9RzVToQfKMESEd5+tR
 hyw3lSduM7GI5xC1vVk5wVG4RPAturEh5nrgoVyFOPbWsWgNmERlu5vOECEAWyGyw9yZIclo7Ys
 DZIWaXYscTiNng/qvd6xIx0Jc3viBh1x1zsF1Dlxnh17r7cSRPwXOuEocG9W7sH9sqK3Gn9UPR7
 MFTmLdZ560K7uzkTBcg==
X-Proofpoint-ORIG-GUID: 6mSWW74U8j7E8_dvzQnpMprsULuwLVIG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 impostorscore=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130040

On Mon, Oct 12, 2026 at 07:02:17PM +0530, Nabige Aala wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> 
> Nord relocates several DP PHY and QSERDES v8 COM registers relative
> to existing SoCs.

Why?

> Add Nord-specific defines for the relocated and
> new-only registers in phy-qcom-qmp-qserdes-dp-com-v8.h and
> phy-qcom-edp.c so Nord sequences can reference them by name.

Typically we don't do it, If something differs, it should get its own
set of headers, describing all necessary offsets (especially for the
QSERDES). Otherwise it's not obvious if other regs (without the _NORD
counterpart) are valid or not.

> 
> Assisted-by: LLM
> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-edp.c                   | 7 +++++++
>  drivers/phy/qualcomm/phy-qcom-qmp-qserdes-dp-com-v8.h | 3 +++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
> index a3c893f72908..d5c6835b6c70 100644
> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
> @@ -42,8 +42,15 @@
>  #define DP_PHY_VCO_DIV                          0x0074
>  #define DP_PHY_TX0_TX1_LANE_CTL                 0x007c
>  #define DP_PHY_TX2_TX3_LANE_CTL                 0x00a0
> +#define DP_PHY_TX2_TX3_LANE_CTL_NORD            0x00c0
>  
>  #define DP_PHY_STATUS                           0x00e0
> +#define DP_PHY_STATUS_NORD                      0x0110
> +#define DP_PHY_LDO_CFG_NORD                     0x00f0
> +
> +#define DP_PHY_TX_LN0_DRV_LVL_NORD             0x00e4
> +#define DP_PHY_TX_LN1_DRV_LVL_NORD             0x00e8
> +#define TXn_TX_BAND_NORD                        0x0024
>  
>  /* LANE_TXn registers */
>  #define TXn_CLKBUF_ENABLE                       0x0000

I'd suggest adding these together with the actual users.

> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-dp-com-v8.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-dp-com-v8.h
> index 93edabb830af..008b17222a8d 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-dp-com-v8.h
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-dp-com-v8.h
> @@ -48,5 +48,8 @@
>  #define DP_QSERDES_V8_COM_CLK_FWD_CONFIG_1		0x2f4
>  #define DP_QSERDES_V8_COM_CMN_STATUS			0x314
>  #define DP_QSERDES_V8_COM_C_READY_STATUS		0x33c
> +#define DP_QSERDES_V8_COM_SVS_MODE_CLK_SEL_NORD		0x17c
> +#define DP_QSERDES_V8_COM_CMN_STATUS_NORD		0x1d0
> +#define DP_QSERDES_V8_COM_C_READY_STATUS_NORD		0x1f8
>  
>  #endif
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
