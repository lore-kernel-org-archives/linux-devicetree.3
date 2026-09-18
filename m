Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C8A222580
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 20:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789764616; cv=none; b=DcXi1mgw6h8bE4mpkeANFF2hglaWGS4MJSwzGSw0aXHBhkpGIWNVE8H0iBUSxR7UYnGiXkOnvH51WGvCGWND4bnEWq5vX0hbsd/M3ofH0vMzgkOTP810xHGZw/K/fcBvuWhPp0cg1yUlDN0eoF3WUYiPQ9x6coqKdJ2SYNsde8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789764616; c=relaxed/simple;
	bh=E/DePtOa4Gf/k/Lqxs95vWwK9X3iJNjnGFfGPaCyzCI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ir5rYhPAwEalNEPm16TONaeShbYio25Xk7HMkJk+6amrTzxOCDAuZduE6dFrNLUQyhWiw+wfRrhR2UhgABJBVMkPZ2HAVrZoO5sYUmFMnmMbUbGrCQYJ0oR9q+CR7HRrIZxmhJfWTqve+5OEugBKzeW9RZ14KiNReeAYjqcbWzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EBpA39t/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A9D/39xt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EBpA39t/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A9D/39xt"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IKF2EX1936596
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 20:50:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EPwT69uFNznJm+gRXP6xEzLLBA9/54Cc5I0vOoxny0Y=; b=EBpA39t/2oGHuf3v
	wd2whd+t4nW6W9iEmvTZ2Kqcf3zX975dr4SkeIpsxofSft6xvGr722Ybd4jBX47U
	GclEpIDkYSPImKvupVpzMWzA8VmtOwQNg+rLoOMdyt+SYF1BDrwq3V7iPZxAU1eE
	pHPbjHsD7YTL7m0QxFhWGX6WKOXVmNziye87ovLqQz7Fcfs07eqa+sGnZxOIB9km
	dc0zr7AeaRFLVm9MTM/di7b2KoAmrnjXc55GsDVeRmiAhkaGxI8a5LFSHttrVkV+
	AARX42s3hH9FBFRbp79WPjvm4HA15QE65gs0bZv11eSgVdq200Eav/cIzxZ4I5S0
	yilVeg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gs7jk9fjn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 20:50:13 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90e8472ee1eso23677576d6.0
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 13:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789764613; x=1790369413; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EPwT69uFNznJm+gRXP6xEzLLBA9/54Cc5I0vOoxny0Y=;
        b=A9D/39xt9dSCRvH49dejRHbE9zmZxk3tBDPVNRpU7BtbCy5bCsiv7E3mXhc05pync/
         XiLKwwKcQE4LpUitxvuMBs5AZ0qkyhzpaYJAl5NcksMikVLMMLdkzG/TonTlRVsfkR+1
         DYLSonMvrkrqzvoG1vV5r+TvZxNEoFIBGeeM6shLMC9nqtU7yRwLpbpPU5TmC3LIGgOm
         4OnVQtwKWFl49JeBWcdsKhwiPIeYr+8bXL47K2oQb7nJKSQXbDTfcbErX4+A0hpH+QFp
         pPxaRq8Hs6PCM5x6Cf0ijLgRJvOEPhpmEerWjJRD7vx4u+9gqKYPe9MJwgSFCVbUOHbP
         I8AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789764613; x=1790369413;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EPwT69uFNznJm+gRXP6xEzLLBA9/54Cc5I0vOoxny0Y=;
        b=PwN86QMGpIW2yYiW4gprbjEnIr1wYCq2HB2K46JwaJxfMoDOEfWJH3WMzsWiQL1dvX
         CaJnLSG9tzZVoVLyXviRnvgWtsM2cdcW2V9f6nykx5bx6sQ29qZCqpAS1unEYibbISTV
         QxeOvrf519kpj8es6QayNQEkN+e/mdUBrDT/eR4hhKadCegu99NXhbrDpCVVz9UJKZfu
         zGpTTAy/y+oRRCr98WZg1fyAbU+ef7uVvqqyc5RmPgCvFn+qX32fW3CBS5D7NEFbXcDO
         nCWoG6SOnjGKhNQEj11x0vkrphWJIqepJbNlLP6RsOt9CULcoggZqw3FXDRehFAcNRRb
         pXlA==
X-Forwarded-Encrypted: i=1; AKwUvBzx3GlucX+3h32J4ENJ9nIv5FOdAbvBJGtOHQ/L7NP9FYx0OrJyuFN39q8GKQY8sd7XWL7Ld5G5KMlM@vger.kernel.org
X-Gm-Message-State: AFuF++krCOgaP8b4rwK0qlO1w9XChccoa+mokNC08JCKqosi/HLXaxjD
	pMpZHiC+w16FLXucVOtnRREjE1ekiYuSEh7aUHzdpQ4FQksd5O8qIA97kptYJ/0SlnxmkxckqBL
	dNHR5Mm6/d4OaRZsLYioc29Zjj+J91rTEGXZznaSO59NA3oO5XPvEkwUf3BsvEU2F
X-Gm-Gg: AYBFou1oGa/CkKMwIZsk/g2x8C94vQRJmtozgX1gpLxm7wK6R1NYw5dZyK7XxaK+P9P
	NPm45coMAJ8bwDQKFUj5Jbq+H+V3gHA+op4aiz9EYqpuwTZTrjX0YAfvLwRWOowFLwLf/6gGiCW
	wA2Z/yVGIUZUbKcGoDSn6xH5epw5SX8XO/avs6biIim3hzIqrdVBzr3+EY3OOZuiZwoQjbLxb5c
	BOAym9/YGd5XW/E7x+7HwLuty8qJr0eOm++Spfhj8JpFCMHnOEisu9mRhazbBNdrejiKnfoBZmE
	Mag+WRVMABxKBrdWiiT7z/AQcnHMeoAH1Kr4NzWrF1Z758xMdU99x776B837ZTm16WdtiFqi9UH
	UM0NswGAS+KpgyjkProOHE/uW0Xg=
X-Received: by 2002:a05:620a:4592:b0:93b:d79a:c46f with SMTP id af79cd13be357-93bdca70713mr629186485a.71.1789764613336;
        Fri, 18 Sep 2026 13:50:13 -0700 (PDT)
X-Received: by 2002:a05:620a:4592:b0:93b:d79a:c46f with SMTP id af79cd13be357-93bdca70713mr629182585a.71.1789764612860;
        Fri, 18 Sep 2026 13:50:12 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48724589c02sm1270037f8f.24.2026.09.18.13.50.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 13:50:12 -0700 (PDT)
Message-ID: <e6adda57-a2af-4a64-942e-456896ed1ac3@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 21:50:11 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] ASoC: qcom: qdsp6: lpass-ports: add support for
 QAIF AIF MI2S and TDM dais
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260918-qaif_dai_id_support-v1-0-ed863c0e5e45@oss.qualcomm.com>
 <20260918-qaif_dai_id_support-v1-2-ed863c0e5e45@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260918-qaif_dai_id_support-v1-2-ed863c0e5e45@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: V8Wj1VR3f5k5QhAsGfWvNuTd5L7MrvG7
X-Proofpoint-GUID: V8Wj1VR3f5k5QhAsGfWvNuTd5L7MrvG7
X-Authority-Analysis: v=2.4 cv=FeSiV5+6 c=1 sm=1 tr=0 ts=6aada405 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=GqQc-a0XTcvgjwLuy5oA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDMwMSBTYWx0ZWRfX7ryQ7z5UNg42
 hkfrPf4XnhXmD6AnfBOPWWCbIgE3yu+pzEy0gSrpx+attFvOaBFicg+Yi9aV5yAhJhJOJ2l+9q7
 C8p/6rJdJLBR87IUmTFklRzd7P3a9cOX6KNdOpxLB73YqCrpc6SC2ve362ALL+jtWKMoplE36dl
 qaBqrhq4avhLmLI3n/2w8T1cIWRGgc7MApvGvHuBlVZHsf66Sh9snIr1LJR+HWSSuATjrR1PpSx
 MRNAWkEf4H6Bq0b2WOE1KKgjllDbS9sCb1RCM0ZXOdgouXxnnkYcEgBkfOPz62YJ3DUTd6dIcAV
 6HypUy+k9fcYu9wg4uri8AS37HvNx1RgatoShMhcH9hV4g6nY20k3uxAjXpVEzSFUCFCw1LPY/m
 IcIAbpOiYL2l/2g7Ofqd8nEqm606cnkVJZ7wL2kHDcq/m5sUD+Cln28EV4cvXe9iTWlpPoIxn9z
 8X80MN6xQzM1lxp0VEQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDMwMSBTYWx0ZWRfXyEcjUZWYN9BM
 p1mYeawEbTHMj30myIiyBj4wRH6iImspj+aY3WzwcdWnEB5iqd6AoR3WET7tvjhxy7UnMlcSrGD
 upxdct+jTnEnGF4u2Cg/mnZxY6ULed0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_06,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 clxscore=1015 spamscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180301



On 9/18/26 2:31 PM, Mohammad Rafi Shaik wrote:
> Add support for Qualcomm Audio Interface (QAIF) AIF MI2S and TDM dais in
> the dai-driver, these dais are used in Shikra, Hawi and Nord based
> Qualcomm platform devices.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---

Lgtm,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

>  sound/soc/qcom/qdsp6/q6apm-lpass-dais.c  |  2 ++
>  sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c | 54 ++++++++++++++++++++++++++++++++
>  2 files changed, 56 insertions(+)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> index e204fd59e512..83f2711bceea 100644
> --- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> +++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> @@ -386,6 +386,7 @@ static int q6tdm_set_tdm_slot(struct snd_soc_dai *dai,
>  
>  	switch (dai->id) {
>  	case PRIMARY_TDM_RX_0 ... QUINARY_TDM_TX_7:
> +	case AIF_TDM_RX_0 ... AIF_TDM_TX_12:
>  		slot_mask = (dai->id & 0x1) ? tx_mask : rx_mask;
>  		if (slot_mask & ~cap_mask) {
>  			dev_err(dai->dev, "%s: invalid slot mask 0x%x for %d slots\n",
> @@ -474,6 +475,7 @@ static int of_q6apm_parse_dai_data(struct device *dev,
>  		case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
>  		case SENARY_MI2S_RX ... SENARY_MI2S_TX:
>  		case PRIMARY_TDM_RX_0 ... QUINARY_TDM_TX_7:
> +		case AIF_MI2S_RX_0 ... AIF_TDM_TX_12:
>  			priv = &data->priv[id];
>  			priv->mclk = of_clk_get_by_name(node, "mclk");
>  			if (IS_ERR(priv->mclk)) {
> diff --git a/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c b/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
> index c3d8116ad503..f422346a50c6 100644
> --- a/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
> +++ b/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
> @@ -548,6 +548,32 @@ static struct snd_soc_dai_driver q6dsp_audio_fe_dais[] = {
>  		.id = SENARY_MI2S_TX,
>  		.name = "SEN_MI2S_TX",
>  	},
> +	Q6AFE_MI2S_RX_DAI("AIF RX0", AIF_MI2S_RX_0),
> +	Q6AFE_MI2S_RX_DAI("AIF RX1", AIF_MI2S_RX_1),
> +	Q6AFE_MI2S_RX_DAI("AIF RX2", AIF_MI2S_RX_2),
> +	Q6AFE_MI2S_RX_DAI("AIF RX3", AIF_MI2S_RX_3),
> +	Q6AFE_MI2S_RX_DAI("AIF RX4", AIF_MI2S_RX_4),
> +	Q6AFE_MI2S_RX_DAI("AIF RX5", AIF_MI2S_RX_5),
> +	Q6AFE_MI2S_RX_DAI("AIF RX6", AIF_MI2S_RX_6),
> +	Q6AFE_MI2S_RX_DAI("AIF RX7", AIF_MI2S_RX_7),
> +	Q6AFE_MI2S_RX_DAI("AIF RX8", AIF_MI2S_RX_8),
> +	Q6AFE_MI2S_RX_DAI("AIF RX9", AIF_MI2S_RX_9),
> +	Q6AFE_MI2S_RX_DAI("AIF RX10", AIF_MI2S_RX_10),
> +	Q6AFE_MI2S_RX_DAI("AIF RX11", AIF_MI2S_RX_11),
> +	Q6AFE_MI2S_RX_DAI("AIF RX12", AIF_MI2S_RX_12),
> +	Q6AFE_MI2S_TX_DAI("AIF TX0", AIF_MI2S_TX_0),
> +	Q6AFE_MI2S_TX_DAI("AIF TX1", AIF_MI2S_TX_1),
> +	Q6AFE_MI2S_TX_DAI("AIF TX2", AIF_MI2S_TX_2),
> +	Q6AFE_MI2S_TX_DAI("AIF TX3", AIF_MI2S_TX_3),
> +	Q6AFE_MI2S_TX_DAI("AIF TX4", AIF_MI2S_TX_4),
> +	Q6AFE_MI2S_TX_DAI("AIF TX5", AIF_MI2S_TX_5),
> +	Q6AFE_MI2S_TX_DAI("AIF TX6", AIF_MI2S_TX_6),
> +	Q6AFE_MI2S_TX_DAI("AIF TX7", AIF_MI2S_TX_7),
> +	Q6AFE_MI2S_TX_DAI("AIF TX8", AIF_MI2S_TX_8),
> +	Q6AFE_MI2S_TX_DAI("AIF TX9", AIF_MI2S_TX_9),
> +	Q6AFE_MI2S_TX_DAI("AIF TX10", AIF_MI2S_TX_10),
> +	Q6AFE_MI2S_TX_DAI("AIF TX11", AIF_MI2S_TX_11),
> +	Q6AFE_MI2S_TX_DAI("AIF TX12", AIF_MI2S_TX_12),
>  	Q6AFE_MI2S_RX_DAI("LPI RX0", LPI_MI2S_RX_0),
>  	Q6AFE_MI2S_RX_DAI("LPI RX1", LPI_MI2S_RX_1),
>  	Q6AFE_MI2S_RX_DAI("LPI RX2", LPI_MI2S_RX_2),
> @@ -562,6 +588,32 @@ static struct snd_soc_dai_driver q6dsp_audio_fe_dais[] = {
>  	Q6AFE_MI2S_TX_DAI("LPI TX4", LPI_MI2S_TX_4),
>  	Q6AFE_MI2S_TX_DAI("LPI TX5", LPI_MI2S_TX_5),
>  	Q6AFE_MI2S_TX_DAI("LPI TX6", LPI_MI2S_TX_6),
> +	Q6AFE_TDM_PB_DAI("AIF RX0",  0,  AIF_TDM_RX_0),
> +	Q6AFE_TDM_PB_DAI("AIF RX1",  1,  AIF_TDM_RX_1),
> +	Q6AFE_TDM_PB_DAI("AIF RX2",  2,  AIF_TDM_RX_2),
> +	Q6AFE_TDM_PB_DAI("AIF RX3",  3,  AIF_TDM_RX_3),
> +	Q6AFE_TDM_PB_DAI("AIF RX4",  4,  AIF_TDM_RX_4),
> +	Q6AFE_TDM_PB_DAI("AIF RX5",  5,  AIF_TDM_RX_5),
> +	Q6AFE_TDM_PB_DAI("AIF RX6",  6,  AIF_TDM_RX_6),
> +	Q6AFE_TDM_PB_DAI("AIF RX7",  7,  AIF_TDM_RX_7),
> +	Q6AFE_TDM_PB_DAI("AIF RX8",  8,  AIF_TDM_RX_8),
> +	Q6AFE_TDM_PB_DAI("AIF RX9",  9,  AIF_TDM_RX_9),
> +	Q6AFE_TDM_PB_DAI("AIF RX10", 10, AIF_TDM_RX_10),
> +	Q6AFE_TDM_PB_DAI("AIF RX11", 11, AIF_TDM_RX_11),
> +	Q6AFE_TDM_PB_DAI("AIF RX12", 12, AIF_TDM_RX_12),
> +	Q6AFE_TDM_CAP_DAI("AIF TX0",  0,  AIF_TDM_TX_0),
> +	Q6AFE_TDM_CAP_DAI("AIF TX1",  1,  AIF_TDM_TX_1),
> +	Q6AFE_TDM_CAP_DAI("AIF TX2",  2,  AIF_TDM_TX_2),
> +	Q6AFE_TDM_CAP_DAI("AIF TX3",  3,  AIF_TDM_TX_3),
> +	Q6AFE_TDM_CAP_DAI("AIF TX4",  4,  AIF_TDM_TX_4),
> +	Q6AFE_TDM_CAP_DAI("AIF TX5",  5,  AIF_TDM_TX_5),
> +	Q6AFE_TDM_CAP_DAI("AIF TX6",  6,  AIF_TDM_TX_6),
> +	Q6AFE_TDM_CAP_DAI("AIF TX7",  7,  AIF_TDM_TX_7),
> +	Q6AFE_TDM_CAP_DAI("AIF TX8",  8,  AIF_TDM_TX_8),
> +	Q6AFE_TDM_CAP_DAI("AIF TX9",  9,  AIF_TDM_TX_9),
> +	Q6AFE_TDM_CAP_DAI("AIF TX10", 10, AIF_TDM_TX_10),
> +	Q6AFE_TDM_CAP_DAI("AIF TX11", 11, AIF_TDM_TX_11),
> +	Q6AFE_TDM_CAP_DAI("AIF TX12", 12, AIF_TDM_TX_12),
>  	Q6AFE_TDM_PB_DAI("Primary", 0, PRIMARY_TDM_RX_0),
>  	Q6AFE_TDM_PB_DAI("Primary", 1, PRIMARY_TDM_RX_1),
>  	Q6AFE_TDM_PB_DAI("Primary", 2, PRIMARY_TDM_RX_2),
> @@ -717,9 +769,11 @@ struct snd_soc_dai_driver *q6dsp_audio_ports_set_config(struct device *dev,
>  		case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
>  		case LPI_MI2S_RX_0 ... LPI_MI2S_TX_4:
>  		case LPI_MI2S_RX_5 ... LPI_MI2S_TX_6:
> +		case AIF_MI2S_RX_0 ... AIF_MI2S_TX_12:
>  			q6dsp_audio_fe_dais[i].ops = cfg->q6i2s_ops;
>  			break;
>  		case PRIMARY_TDM_RX_0 ... QUINARY_TDM_TX_7:
> +		case AIF_TDM_RX_0 ... AIF_TDM_TX_12:
>  			q6dsp_audio_fe_dais[i].ops = cfg->q6tdm_ops;
>  			break;
>  		case WSA_CODEC_DMA_RX_0 ... RX_CODEC_DMA_RX_7:
> 

