Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC29839A06C
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 08:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789373296; cv=none; b=W0M9YNDz2Elr4TAt+X4jIsQLkMUCSmyIpLYCxR5hOXyKRwSmCqkKCHq4XhepjU/7kdAKs2RY27klFIkHtPuigqcGkUkEoSUMBIRNF40pe/VsSOGfEkXzATICR6r1RDO1DOfhnvmiD8V6gNVoCFM0wO6cAKSAQWbsbLNZ47nAoMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789373296; c=relaxed/simple;
	bh=oI7VifzfMn1zpU+IkOS28i03E+y/fe9j1/M0UgR7+Lk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PJ0BWrmJwaopP4WAr514JZLRpVrUBuy6CbTzh6Y7M3/+fwtbBIcr4XeBbkFO9hJ6UHRyJDmrYSRVO91cnp2EzheDlJqfu3KHumS6cA4Lg4UxDBbdC6g284kz4ss2xUsO6VBGoSPGXsqTpE/tPnhyEHsJxrvUu+Z/FRw4vITGg5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=imN5fpI9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OwPAjXb2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="imN5fpI9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OwPAjXb2"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5jE3L3842307
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 08:08:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LrqX32EnO3d4Uq7N4G8r4oWD6xf4vvdnOcV1PMGcjmU=; b=imN5fpI9OinQuYhs
	Zm681p87GeCmBBbnNrsmV+rIMI3TIs9DAG63YrWCk4+cv0xplTeOssEsSTDfC3gf
	FCNFkRpVuiiMue+2+16QSY29pGduwe4c/flZYQiz319NL316w0em1y4KIKl06OL/
	u2MXHvKc5c56927lq1UFY9JfkW6h+5Y+Z0U3tTjODp0iBg3MFfp6HGTpyanRduDA
	i3eyhMEZ8GiqvjdxD6f8NIqJOlbILvDpmPHlps9/YS8PZiZtAVCBD+s+XXO1GUHs
	xh3zfbtYP708s+YalzI0KsFeFwZirB9r+Hw/RW+tNtajftA+MONIeBeMqbQgbWRN
	B6AEvA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c5npe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 08:08:13 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9103df70f2fso6512606d6.1
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 01:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789373293; x=1789978093; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LrqX32EnO3d4Uq7N4G8r4oWD6xf4vvdnOcV1PMGcjmU=;
        b=OwPAjXb2A4xP9gygAdxqJ/Ng21PoaCCP0MOK/+uEThWHgxbCl2jw4rS5vvpVbrITf5
         3RXB1XfqswCnstgHJft8RY6HlZaD4VvUMGbEcoehbX9XX7irSQzl7IpRfXk71opK2H73
         K1p5dmHX68mCtw4cmAZjxfVSScJrhv65orH0Pla9OS7aBjjY6kgs+BVSeyA2d4N+5DyG
         ijOS1XwmwEyBLp93Sch/ujJGn6zdFAh1439S1FSK6nOEoXjaHwUTmYrr9EUAyZ8b6qyH
         EOCQ/u/C5zqm9qniPhosZh2w1zZ1chbdURPI2Km6APjSvWRgu0Kfow5XEj73dkXYCcAv
         88bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789373293; x=1789978093;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LrqX32EnO3d4Uq7N4G8r4oWD6xf4vvdnOcV1PMGcjmU=;
        b=XJ/cmqODZUxCBiJ7vFrI9swqvewdKTTBd26+qBDX6pe7aPSf7l/r7xAfS918ns8H3p
         kNgqpg9zUzixuy6oeBruPCCIWB8CEAqwXdZMXFvbmjdq672b5/yAMXmqpRZYISW3tFJj
         4Gt8RHE+ax45FbTWrdSaLmy+NW8f2OwRIMIpy0Gm4R1RFXsfeZXkVq7U5bViXQC4OzXA
         RWhvTNTG4kgrAPw2jiuQU1VVT/9tkunMhfRBnHIxItL7/z4m8UDxNuzxLHlDa5VQigtg
         NYBC/fmrWbZdGsLH6uqIssDAU0kU6vBICAl+YEw5tE5EvwkLH3L8TGAIwIUYXbLAOkBA
         UYLA==
X-Forwarded-Encrypted: i=1; AKwUvByTc0WLz3dmBzfarpunYo463ZGWo6WigxkXKhBdcXZBPHnsnfcsG3jKXc/YjB8ICx7fVi0alrIHFHPR@vger.kernel.org
X-Gm-Message-State: AFuF++kPUt+RMU/2s0qAoBqi29F8EPw4H8FzAmUnXe+pc41R4+s6NHlj
	/MOhMUI8ziEX3Bcn1fRC8glZUHkbuRJdRGJAa4f2EEnfdETeOsytmfF+55nfcY6fQx2PuLvs1tp
	gtq281h8fcpoOmheoZMZjrsJJ838zDWK8gZ2kTm7rTcB0UI419H2uXtGeOQskviby
X-Gm-Gg: AYBFou2/xuzyvs+XgXIvAx5J+YoR7I4frkbjkWVU88ut17BYV1s6gvt4+PMkkPFDcsg
	7DNuuo7x+5rFzHPwZ+3lt9QoH3Oz6bFsyrSFOkC62FdcMY40TqhDmnvfSeM2VOsqFfsKqDKfH2Y
	CBROeAShRGCBx1ixN2WBL09Ajsx1AqpGDZipYcac6rP89pe9Vpdy7vFzqulU3LTg75P1SFOrAq9
	JPLLb64JEVX+zUPW1Q/dqmhmTse0D6lykIZOrBX1T6duTvND3Eu0xzJzUjP+m9qsxyHuv+AVJAw
	xrMcOd6HAPrJw3aeBO2UEx+uF1NU+/tqFsKIyxdJxaE3rkitC56GetQGtWU3vMagE3y9vEUyd4i
	TqQNyJfDeHtxceCf4WrGNvQ==
X-Received: by 2002:a05:6214:410b:b0:90e:9616:d7ac with SMTP id 6a1803df08f44-9122e67e91dmr18605776d6.4.1789373292989;
        Mon, 14 Sep 2026 01:08:12 -0700 (PDT)
X-Received: by 2002:a05:6214:410b:b0:90e:9616:d7ac with SMTP id 6a1803df08f44-9122e67e91dmr18605436d6.4.1789373292507;
        Mon, 14 Sep 2026 01:08:12 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2966067345sm391067666b.32.2026.09.14.01.08.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 01:08:11 -0700 (PDT)
Message-ID: <d9671bb6-9924-4b37-bd7c-de9e343e6f4e@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 10:08:07 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/17] phy: qcom: edp: Add Nord PHY power-on and reset
 state-machine callbacks
To: Nabige Aala <nabige.aala@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
References: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
 <20260911-nord-drv-dt-v1-11-e25c073cf1b6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260911-nord-drv-dt-v1-11-e25c073cf1b6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Su-PMy_lxSlbU5Zc1xt8Zum2SEf_oVtK
X-Proofpoint-GUID: Su-PMy_lxSlbU5Zc1xt8Zum2SEf_oVtK
X-Authority-Analysis: v=2.4 cv=c5Y+0h9l c=1 sm=1 tr=0 ts=6aa7ab6d cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=vbpSL41SLP_TpwptBaYA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDExNCBTYWx0ZWRfXwXMVXxmFqfT8
 TGBH/wsGEpw5ZX9/09Rq3uGQmNoOYbJP5QUs+2fTvVccZSVC8evuxASkTRZBEUUEkS39BYH+hMy
 2flgaBp1Cdd1iHgHwMxoJTPjbZf7oFej525JVf3XCUuFrDzmLX3NDG6Tbz99171pPssuGns/zlK
 5tOPfElEyMqnQHAaJZfTEiGIsmG2+1v7eUKeWI/Pv9G1sfV23i8o3Gva19S92byxbIVsWRQp7M5
 Jqfn+LjJTfJ3GPUgcxuLP+J/udf9j3PvrkhqaLY3uM5xjhcN7Tt2X5PSlH5YwBWoZR9JHWJA2Az
 fFnxD4wMCWRSo3vz+8FDSjRg+SikBV7y3fqqafKPbGG8vHmdWVBwn/3TDY2h12IRpi7hHMcxQTe
 18hT1JhoPpS47zKOuo4M/aR/Tx43gSjK/5ovrC7YO5/kwmkc82nJIKduLX+6m3ffayjbxALpSmE
 OUnCGHHrbR8U/EYjlAw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDExNCBTYWx0ZWRfX8aY8bbkxHnCk
 r9atxTA06AzvltavOZD0UsP3hx4FjsG2ZbIqnZkny7uyLEBwJ4VXL/+bTRdCcU0SgZum+bou4bN
 WXpkMFfvZsOyxRqsXFYCNzSpXP7R+7M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140114

On 9/11/26 5:36 PM, Nabige Aala wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> 
> Nord relocates the QSERDES COM CMN_STATUS and C_READY_STATUS registers
> so the generic sequences cannot be reused.  Add
> qcom_edp_phy_power_on_nord() which powers down all lanes and polls
> CMN_STATUS_NORD (0x1d0), and qcom_edp_phy_com_resetsm_cntrl_nord()
> which triggers the reset SM and polls C_READY_STATUS_NORD (0x1f8).
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

This commit introduces compile warnings (-Wunused-function)
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

Double \n

Konrad
