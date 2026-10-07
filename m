Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68A63F482C
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 06:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791354427; cv=none; b=u0LewCj34QrLbqq3qySt/vhhubuWAG8qUOFEIB3DUHlsTed63QPcDb2LQj12dGJuD5rQi/VaqBhmZGH6ospdizxZK+HDxB76FPjp5IsyoWYmTYUbKAK8rwr2uCPXMyjMgc+PDxyu4h+SDx3mhtBmnBVv+i4+zLGBplt4IhtjRhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791354427; c=relaxed/simple;
	bh=nr3t2c3FfabwAJsY1Y66H6BA/S3O5ZheNY1S7/lXLyc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MYSbMcoIKuKS2hZWVE5n0sVfVAX6C49VO/K4cUis2yF5ad9hix7zz5oA23J/FCIz8lwvPkasJVQNeEGBeu93Yqyc5c+OmxxNSSuYV0ECdUU2VdB+NzEt/Bh/dYBajUfAgZqsCUXRQW4NM/S1m1Pb9kTJ1Sevijcygb47/TzQRB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pQr8HF4+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cCixGBpl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pQr8HF4+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cCixGBpl"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6974UMw92774365
	for <devicetree@vger.kernel.org>; Wed, 7 Oct 2026 06:27:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2Cl6uQFa+n5AW/tdXzfCPHDiO4SySDJDdRMN6Z7wpw8=; b=pQr8HF4+R+USK0/0
	YhmBYiPm6QStkGpYu56s7w67YR6kBhKzyOZK96+UNbegYVGvxlKkOdQuoqybb6BH
	wDBOfT/YDTlSJ4Al133Fwst1T+K7BNJGlqFy2fJpVIbXVlGlk+zRt8wP2Nrt8mrj
	ct8yWuo8hUQPlwBhiThljQHkDTj9F9pfzE5jHRHJQZZUVF4LA3opR+1jUkh8jtL4
	37MWFsBA4U+eaJKQcvK0OfWzEOvxkioOdlMaoDG2FpOvVPedaMj9dSVxkBpnG25X
	DNXSkugPu+P2jtj5o20PHbzYlxbf9PNkwh7kS4Gry8ZvgNvYlJd21GwbD+niWqGI
	I84csA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h541uk0su-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 06:27:04 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc7e92f36f9so3141448a12.3
        for <devicetree@vger.kernel.org>; Tue, 06 Oct 2026 23:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791354424; x=1791959224; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Cl6uQFa+n5AW/tdXzfCPHDiO4SySDJDdRMN6Z7wpw8=;
        b=cCixGBplZxigl/gHq3SRZ208mSddr4+N4CQGXYnxSaemq2JhwaePeTRAD+pGuDhR/y
         BY1ifiFmwYrIKHkPAEqW86A90gfSktLhKNZidaqx+S1IR+8Nmms4ppg+3aO5BurxnAtK
         TKcDK3ZBZcghPaCYUkMseRcbLsJRrtpuefffeDo+vZ5AylN5DtzYH4GAm8z1/gJX1y1U
         IxqxFFz34t3lKyCsP59WbrDBTyokhILHzTm0Oqn9ey1N5Ow18Klp2yBtsHnLr4ygRSD3
         g8JEtWIUUqFKiCrjBp2ddKJWkkUm42dIMoTOiSfOaUOuL4NBCnL/o7grQ6F7ZetVspNU
         jpsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791354424; x=1791959224;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Cl6uQFa+n5AW/tdXzfCPHDiO4SySDJDdRMN6Z7wpw8=;
        b=zBot1HWCyHRjEIjYPEld8uRScvVy79LiaL9l8qGRjKcFQFpkcHFIClFwh4FJyyNfZe
         Fq3sp+xgxZT2Vht0TZm9ctHMLGaXbe1A+YW8Tp/MJxgM9Z6SFeoeMxteNMRlqOe5UKSR
         VTpCtex2CwOx/LFOsVQUoX98aEwh7M0TAf4k26NHXruiRUfQUkp6R/Z7r2U9UdxTjvWn
         W8TbYWxQXoWFWbI9Qq76Wte00D+nGxiVph5mtwgxxyawhTWdXMhRp2RrixdOsFPAZr2e
         qBUnBmWDvwH53Bu59DZfVRF8hIwFqkrZ62EFPZdcMucQ6uoTru7s8O36VXJWDxVnleu6
         m2kw==
X-Forwarded-Encrypted: i=1; AKwUvBy2uX3SI5ayFLyDjKi/GoB6CGgErls2jOw5AzMMvR4U5hRvJgKiXeQ1PBCkzgDUB7n+tAPsQk2EzQVQ@vger.kernel.org
X-Gm-Message-State: AFuF++njWWj+lsADr649HjEgiONF0VHmYc5tCoErUBLtzddXqrERblMe
	NKZoo3/HIt2NyH1T47VOkc14/PtSGkmsmGpzjWwWredLIphKyVlO2ZadRwIY2BYBxm8bs++ew9m
	uoj/7G4TOaXP96rV41z0FkTqswokRS6Oh2M1JhxsEhmjGLlyf4GGXkekZWGUH9m8Y
X-Gm-Gg: AYBFou0tDZWNpKxnK5c5Liz+fjOhal/Ppar9TSv908yORxoL9qYNXtqPOEqFtxaV1xA
	rJ15Y7lb8sttmRc/rQZ/2E2+I3EUOzRQkAIL9BjFCcVd78UsxCaAhHZ1G8Ryo73oNv1Vatt0+B9
	ZOKPpUBDVQeXzhpS2Sn3toBhNU6V/ONt/An7UmRmCbU//xGNo415W/AD3Pedp3B9isZbiRwOLiC
	OIx1LGgsFmRMcqMiwXOBfC1l6VcBAsSTkk3q68elfa9M3Xt8rLS++Bm1HJMo2wHNulpRH+vT1eA
	WnYDhBgG0hkNa0QK/Zsom2BMKVzPu2rNAJXTvkkyak8EZ2uhevtH/CAv6xWx7oxsYWeDgIb4PVZ
	NJoVG8gyBPwH8Brulk9pM/n+6ZijU
X-Received: by 2002:a05:6a21:3b92:b0:3cc:8344:1213 with SMTP id adf61e73a8af0-3e133db4acfmr1098893637.8.1791354423663;
        Tue, 06 Oct 2026 23:27:03 -0700 (PDT)
X-Received: by 2002:a05:6a21:3b92:b0:3cc:8344:1213 with SMTP id adf61e73a8af0-3e133db4acfmr1098857637.8.1791354423123;
        Tue, 06 Oct 2026 23:27:03 -0700 (PDT)
Received: from [10.204.78.119] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd0a92d6547sm850526a12.13.2026.10.06.23.26.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2026 23:27:02 -0700 (PDT)
Message-ID: <10b8c78d-7981-400b-8270-db0c54509272@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 11:56:53 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/17] phy: qcom: edp: Generalize power-on path to support
 per-SoC overrides
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
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
        Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Ritesh Kumar
 <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
References: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
 <20260911-nord-drv-dt-v1-8-e25c073cf1b6@oss.qualcomm.com>
 <mpkoztwm2ts4pb3m4t6347wfes4yeua5a5uxrn66dgmn6b6gpq@syu2fxzfmvp7>
Content-Language: en-GB
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
In-Reply-To: <mpkoztwm2ts4pb3m4t6347wfes4yeua5a5uxrn66dgmn6b6gpq@syu2fxzfmvp7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: e7GTZ_EqpT0Poxs4zN9x8vB4DxR08UgB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAyNSBTYWx0ZWRfX9PUQ1Wso+qQj
 eSz4+jdah+8QzsYM5GPzhrjrVr6Ac+GkwHk+tXhOg5FBmWEpO6dzRKTggjDCPBE4+3ftfjEomMD
 NZXLnEzIcmU41geGk7DKv1gUHGb66jU=
X-Authority-Analysis: v=2.4 cv=XZYcX455 c=1 sm=1 tr=0 ts=6ac5e638 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=LataAnNBLSGNWv3D5v0A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAyNSBTYWx0ZWRfX/96QaWDIzL0e
 OjgrM1Hjj8/IsgHC0DxcrvYTz91Fx8VKWlcHBhks475AfI2R2iXcYFjxFzl/+8eqwD5D2J+Vcvi
 IxYJ/ESRK9nJrNzbdNRIN4gg+E92BS9yu1eZ4imXhM/PX4UCvkVjRKTIIkXzdKdVtwYvIpUFPo9
 xf71rhiSAwiiRUFVYW/meLIRqMV/pqubiBQA4IAt8kfo1elR4MMcDEon14Lq098aQMR6O2tZXgD
 vyzsPz+eHli2TheaFxHwgl2WPh9iFgwGCUWx9cgSDRCAuxj2dP16kWZbn+CO/5OUNxlbLZYbewI
 KNexpZhyiHVekgNeDzfnwtpS5X3Li0UC2Saou9g9la7gRxSs2wbfEHSgaUr48hvzCJpWZNerR6r
 imYNoZhvd45FoGXwSuqNIZUYuP9xLJNPtMx4etcf2LPIy8V4FeCjTvOUiYkz3Jtavcaie87bCh1
 Djzs0t6l4akUj0Dynzg==
X-Proofpoint-ORIG-GUID: e7GTZ_EqpT0Poxs4zN9x8vB4DxR08UgB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070025


On 9/14/2026 5:30 AM, Dmitry Baryshkov wrote:
> On Fri, Sep 11, 2026 at 09:06:39PM +0530, Nabige Aala wrote:
>> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
>>
>> Nord has a different register layout and power-on sequence that the
>> existing hard-coded paths cannot accommodate.  Make com_clk_fwd_cfg
>> optional,
> Why?
As per the HPG, Nord does not require the com_clk_fwd_cfg callback 
implementation. However, qcom_edp_phy_init() currently invokes this 
callback unconditionally, without checking whether it is present.

I see two possible ways to address this:

1. Add a dummy com_clk_fwd_cfg implementation for Nord.
2. Check whether the com_clk_fwd_cfg callback is present before invoking 
it. This is the approach I have taken in this patch.

Do you have a preference between these approaches? Alternatively, if you 
think there is a better way to handle this, I would appreciate your 
guidance.
>
>> add phy_tx_lane_cfg and phy_tx_res_cfg callbacks to
>> phy_ver_ops, and add phy_status_reg and bias1_en_2lane fields to
>> qcom_edp_phy_cfg so each SoC can override the defaults.  No
>> functional change for existing SoCs; new fields default to zero/NULL.
>>
>> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
>> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
>> ---
>>   drivers/phy/qualcomm/phy-qcom-edp.c | 43 ++++++++++++++++++++++++++-----------
>>   1 file changed, 30 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
>> index bf8a17336c7e..373f13b3d6d5 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
>> @@ -92,6 +92,8 @@ struct phy_ver_ops {
>>   	int (*com_configure_pll)(const struct qcom_edp *edp);
>>   	int (*com_configure_ssc)(const struct qcom_edp *edp);
>>   	int (*com_ldo_config)(const struct qcom_edp *edp);
>> +	int (*phy_tx_lane_cfg)(const struct qcom_edp *edp);
>> +	int (*phy_tx_res_cfg)(const struct qcom_edp *edp);
>>   };
>>   
>>   struct qcom_edp_phy_cfg {
>> @@ -101,6 +103,8 @@ struct qcom_edp_phy_cfg {
>>   	const struct qcom_edp_swing_pre_emph_cfg *dp_swing_pre_emph_cfg;
>>   	const struct qcom_edp_swing_pre_emph_cfg *edp_swing_pre_emph_cfg;
>>   	const struct phy_ver_ops *ver_ops;
>> +	u32 phy_status_reg;
>> +	u8 bias1_en_2lane;
>>   };
>>   
>>   struct qcom_edp {
>> @@ -316,9 +320,11 @@ static int qcom_edp_phy_init(struct phy *phy)
>>   
>>   	memcpy(aux_cfg, edp->cfg->aux_cfg, sizeof(aux_cfg));
>>   
>> -	ret = edp->cfg->ver_ops->com_clk_fwd_cfg(edp);
>> -	if (ret)
>> -		return ret;
>> +	if (edp->cfg->ver_ops->com_clk_fwd_cfg) {
> Why?
>
>> +		ret = edp->cfg->ver_ops->com_clk_fwd_cfg(edp);
>> +		if (ret)
>> +			return ret;
>> +	}
>>   
>>   	writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
>>   	       DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN,
>> @@ -1131,7 +1137,13 @@ static int qcom_edp_phy_power_on(struct phy *phy)
>>   
>>   	/* TX Lane configuration */
>>   	writel(0x05, edp->edp + DP_PHY_TX0_TX1_LANE_CTL);
>> -	writel(0x05, edp->edp + DP_PHY_TX2_TX3_LANE_CTL);
>> +	if (edp->cfg->ver_ops->phy_tx_lane_cfg) {
>> +		ret = edp->cfg->ver_ops->phy_tx_lane_cfg(edp);
>> +		if (ret)
>> +			return ret;
>> +	} else {
>> +		writel(0x05, edp->edp + DP_PHY_TX2_TX3_LANE_CTL);
> if it's about a single register, add a register to the map instead.
Ack, I will update this in the next revision.
>
>> +	}
>>   
>>   	/* TX-0 register configuration */
>>   	writel(0x03, edp->tx0 + TXn_TRANSCEIVER_BIAS_EN);
>> @@ -1169,13 +1181,18 @@ static int qcom_edp_phy_power_on(struct phy *phy)
>>   	writel(0x00, edp->tx1 + TXn_TX_POL_INV);
>>   	writel(0x10, edp->tx0 + TXn_TX_DRV_LVL_OFFSET);
>>   	writel(0x10, edp->tx1 + TXn_TX_DRV_LVL_OFFSET);
>> -	writel(0x11, edp->tx0 + TXn_RES_CODE_LANE_OFFSET_TX0);
>> -	writel(0x11, edp->tx0 + TXn_RES_CODE_LANE_OFFSET_TX1);
>> -	writel(0x11, edp->tx1 + TXn_RES_CODE_LANE_OFFSET_TX0);
>> -	writel(0x11, edp->tx1 + TXn_RES_CODE_LANE_OFFSET_TX1);
>> -
>> -	writel(0x10, edp->tx0 + TXn_TX_EMP_POST1_LVL);
>> -	writel(0x10, edp->tx1 + TXn_TX_EMP_POST1_LVL);
>> +	if (edp->cfg->ver_ops->phy_tx_res_cfg) {
>> +		ret = edp->cfg->ver_ops->phy_tx_res_cfg(edp);
>> +		if (ret)
>> +			return ret;
>> +	} else {
>> +		writel(0x11, edp->tx0 + TXn_RES_CODE_LANE_OFFSET_TX0);
>> +		writel(0x11, edp->tx0 + TXn_RES_CODE_LANE_OFFSET_TX1);
>> +		writel(0x11, edp->tx1 + TXn_RES_CODE_LANE_OFFSET_TX0);
>> +		writel(0x11, edp->tx1 + TXn_RES_CODE_LANE_OFFSET_TX1);
>> +		writel(0x10, edp->tx0 + TXn_TX_EMP_POST1_LVL);
>> +		writel(0x10, edp->tx1 + TXn_TX_EMP_POST1_LVL);
> Either use a register map or move defaults to the callback too. My
> preference is towards the former option.
Ack, I will use the register map approach
>
>> +	}
>>   	writel(0x1f, edp->tx0 + TXn_TX_DRV_LVL);
>>   	writel(0x1f, edp->tx1 + TXn_TX_DRV_LVL);
>>   
>> @@ -1187,7 +1204,7 @@ static int qcom_edp_phy_power_on(struct phy *phy)
>>   		cfg1 = 0x1;
>>   	} else if (edp->dp_opts.lanes == 2) {
>>   		bias0_en = 0x03;
>> -		bias1_en = 0x00;
>> +		bias1_en = edp->cfg->bias1_en_2lane;
>>   		drvr0_en = 0x04;
>>   		drvr1_en = 0x07;
>>   		cfg1 = 0x3;
>> @@ -1210,7 +1227,7 @@ static int qcom_edp_phy_power_on(struct phy *phy)
>>   
>>   	writel(0x19, edp->edp + DP_PHY_CFG);
>>   
>> -	ret = readl_poll_timeout(edp->edp + DP_PHY_STATUS,
>> +	ret = readl_poll_timeout(edp->edp + (edp->cfg->phy_status_reg ?: DP_PHY_STATUS),
> No hidden defaults, thank you.
>
>>   				 val, val & BIT(1), 500, 10000);
>>   	if (ret)
>>   		return ret;
>>
>> -- 
>> 2.34.1
>>
