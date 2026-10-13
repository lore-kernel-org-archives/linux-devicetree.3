Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9504E39FCAE
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 09:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791882595; cv=none; b=G07MK/ZFi/uBr3uKSRh1gJMCxlSrxYCK/VzrTufrZLi6TIcVKW3W1eSw2EJAbu/lesapvSXBBO+D7ScpyeBARFvKXsCj7dcfUMf98iEi7279sNLFEkLioWGxhWzRi5JbqFsaEy97PYrc2gu49T2osDEh3pLJgIwPgIBPBC8vFIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791882595; c=relaxed/simple;
	bh=dvOSiE56w7Qm83tAR9oMfBVofaeE/H677OshvkG8l88=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rLnN/Wzyh3YfQEH7RHH7WAOHglR7iJuU33WQLrkXfy3B28DVftKR/+PNud7Zw4rnbvSnFF2MjtvL1ikvk/FZPyNl2QQEsiDyd8Dhufk9DyXhncT1v6LNTXNhSOtgQb1NscEIdTbq0Ao/OH7lUiBJqLhv/Yf7LNvxZJpd6uiRyoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YUfM87e4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ua71yRdN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YUfM87e4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ua71yRdN"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D6CSqh949406
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 09:09:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pVmMhjXCnL0F6kCOvaVqBvxdEW0fHS/jmnR/FpTpHQM=; b=YUfM87e4+bmfJx+m
	su6PlVNv668YvPg2VqZ15qZaAIABHBCxJcHnh29b7TNZTzGVQ94DIa9hiuZlb9ng
	eXbwEOERs1CFGQIRW320SgaQLqStN1IygunY8WYiNYj2xupw5Noq8A/GwAh18U8S
	y/ANDNs1Q3dch0dSfYMrusL1Qy4iZ/FkYc6O8t7fw1tuXap0F6/J9u7qRVO0row9
	ldX75I1WLuqyys45hlp4V8QXUSOc3qMIjqNsM+E3RMm4zb7WxJlaIZhG6Ti5nuYs
	feTrOfFsw79vhAFMnpcbwI8OVX4ubeS9v2pI3Te8pUPlr3MfH8KYQW/Bi/5x7ffL
	MtZdeg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9f628q3a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 09:09:53 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3aaf955db5fso3929327a91.0
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 02:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791882592; x=1792487392; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pVmMhjXCnL0F6kCOvaVqBvxdEW0fHS/jmnR/FpTpHQM=;
        b=Ua71yRdN/tbbKTSwfGxw73VkKWGrtT46jhiaBrxrO701JEewuKFTJPoD0SSM4MF2Fj
         jp5ssaWqIHRCVneh8uFXOdV/KsdRwdKcwVBWuqf3tTE9v9eNiCasnviwik4kUcl3bfUe
         DgBjA4t82QI8Wo8fa5wXMQ3GZnpBXZZmMcIHLzSByGA2SbWgmzI7tiIHwXfNC1tKycWn
         lFF4dxN86MOhwo1kCN4jlbG2Lw6WXbmqPNmKLH3p5xRyEhWwmAXu7fVvHLNyXrAvbh9k
         YTKDBfiDlH2ZpCtvx15IeLaZDacMObZZZVIUF54OffvbzgaHMnpK0pNlWuaIwibaYDEf
         6zZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791882592; x=1792487392;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pVmMhjXCnL0F6kCOvaVqBvxdEW0fHS/jmnR/FpTpHQM=;
        b=nBgR2FoYbNE6HOYXHcNDBFXJG5fgeKYW/C9ujgbVsYhzBQDN/wbERi9otkdCUCdgAQ
         h17ZUdhtJTpcvgwdtJH8Saggx7yLmwD3crQTy5hCLM8+tOuwzb1/Yq3mA88sgtkv5aPl
         xUilHIqZ/Z7b8XuTSpPGgPYJSpze5mpMgzFe30Bs4g9dcgpoF0tTvpSmYLajcVH1p56e
         IGr+oF1e755u9ahb2CQ++mt0R79Fu1sefvE/GagFvMpg1W7/Kh7dcOshGWj9PDS9CgWi
         ZHVgGNAFgAUrEox7TNFkR+3819u6aU/f+JtmkPsqowsV+fzPyphPqpw64Z6phWyLSNVo
         E2tw==
X-Forwarded-Encrypted: i=1; AKwUvBzQH3Zu/O+t2/FyoQdYHB8VTa0wZ+qn0iv2VHO5o+j3DKxn8lOiJr6uJBELV4RDzwdQwj5LuNReRq88@vger.kernel.org
X-Gm-Message-State: AFq9FYK40kzoCIj/MrVp3gHfJq0SHV2Q53NoxaBU2wQEoJ0Fp5EtR036
	28guwu6clALLKautItV6x6r11fz4qSlhxYFaeJfLhHRiUQVZ07US+w55wWKOIjaST31O1x5fFw0
	E5VF857NbB1Y39Ciy27B+yVPY7Dqg8pm0NfvJFli1syxN+Vg6SHq/aJOHp0teN1GF
X-Gm-Gg: AYBFou2cjqU2xScgu7ScWLpR69PT58m01T9qkidu/45ns/A77/oMpfEtof2G5LGTAcv
	uLrSaL173VKFt4AmvIWiUCuLVAXy6J57JpakR7uoYiRuNJEip78oWwcfQC6sAdWhfzwJr8FGmiF
	/apQDnt4lcv2s6f6rb5GhVTthggAT9AsCLzUW6BpN5/0UjtL5JlAUD71m6hahu64yYSW8+Gr0dq
	OUEBg4HgNX3ipcPIZMTKbhyrR8+wd7Q0NO3yVEYmPcktPjYabLXnJFu8BenV+Ml82aj9hyKQHBN
	dJ4RMJhZq8ieMOVDpXhDjBzhFDy0n/5k0tnyJsLHRhPd4KzsJ8eb8LT+TKgdTRM9xRE4KYE9RpG
	7z3IjIM+kSmPsXbVdz/xQ1024U6Y=
X-Received: by 2002:a17:90b:384a:b0:3a8:c0cd:57f7 with SMTP id 98e67ed59e1d1-3ab3a735f76mr9500159a91.23.1791882592041;
        Tue, 13 Oct 2026 02:09:52 -0700 (PDT)
X-Received: by 2002:a17:90b:384a:b0:3a8:c0cd:57f7 with SMTP id 98e67ed59e1d1-3ab3a735f76mr9500121a91.23.1791882591022;
        Tue, 13 Oct 2026 02:09:51 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38fc9e52sm20346608a91.13.2026.10.13.02.09.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 02:09:50 -0700 (PDT)
Message-ID: <65a55d4c-4a88-4cc0-8c5b-57fc8aecbc8d@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 14:39:43 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/7] ASoC: qcom: sc8280xp: Add Nord sound card support
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Srinivas Kandagatla <srini@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20261009-nord-asoc-driver-support-v3-v3-0-0c1897f21ccf@oss.qualcomm.com>
 <20261009-nord-asoc-driver-support-v3-v3-7-0c1897f21ccf@oss.qualcomm.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20261009-nord-asoc-driver-support-v3-v3-7-0c1897f21ccf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FOKOVOos c=1 sm=1 tr=0 ts=6acdf561 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=-2NoP3fm8nS2ubuM0EoA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzNiBTYWx0ZWRfX01wKdlrxjJnC
 x7k0Sq0h8P2s2fBiKgGjIjfD5rYDU5i8ckJrr+CJRB63wzBjJel8A6Qz0ECtbb+0Dairp+LQIMn
 FcVEGttsxlUcgeIjuK6H55Z7SpclJSY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzNiBTYWx0ZWRfX74ydmGp7jtRm
 QrxqtrRQRbt3suQ3VEz4ta7l1t/eccuv2f0yI+ODdU4hK+HHvbp2deGoqW5qAI3YflL8zxy5OFY
 WYPFopMo/cQhfxVh4kmMH+Gfx42lLnqP/U0RzDa64U6Yq7XZhNob/KYarRfys4/Zh/WHnflwf1W
 oIoXb5cS07hrigbYENM7rjzVfaL1DCqXBgKwEScovGmZhiBUAXuxJ8XbWZ3uC83ZsM1wXcE5wDM
 +VgFFapBrlds7KWMc7/0OgNgTY1N1pgA3F9wOfPFf3YdbLHGXgrYtebNoPUbObkXPzHDoI4RQef
 4THt6wBCpg0V9z1+jY0CJ/56EmpCuAPoPSJM96Xia9dEX+BEwBieLb9+7YVVQ3YEjmVOJ5yE9VN
 IaeEbDFPZhFJzRmUYM1WIwHQo5JH7lDqTxLM5JzkVMGadYk57tHoJM//De6dbHCMVVYQrq71XVx
 P3l6yyNt3/NvQppwQSA==
X-Proofpoint-GUID: SPF9QGdFlsNg7nHWbypwj7x19xqxBP7W
X-Proofpoint-ORIG-GUID: SPF9QGdFlsNg7nHWbypwj7x19xqxBP7W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130036



On 10/9/2026 6:42 PM, Mohammad Rafi Shaik wrote:
> Add support for the Nord Ride and RRD sound cards by introducing the
> qcom,nord-sndcard compatible and associated platform-specific data.
>   
> Nord uses external codecs for its playback and capture paths and requires
> board-specific DAI and clock configuration. Configure the codec DAI format
> for DSP_A operation and enable MI2S bit clock handling for the platform.
>   
> Add a platform-specific sound card initialization callback to configure
> the ADAU1979 capture codec to use LRCLK as its system clock source. This
> configuration is done during DAI link initialization so that the codec
> clock source and associated rate constraints are established before the
> capture stream is opened.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---

> +static int nord_snd_init(struct snd_soc_pcm_runtime *rtd)
> +{
> +	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
> +	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
> +	int ret;
> +
> +	switch (cpu_dai->id) {
> +	case AIF_TDM_TX_8:
> +		/*
> +		 * adau1979 PLL clocked from LRCLK, no external MCLK. Selecting
> +		 * the source also installs the PLL rate constraint, which the
> +		 * codec applies from its startup() callback, so it has to be
> +		 * in place before the first stream is opened. The frequency is
> +		 * unused for an LRCLK-sourced PLL.
> +		 */
> +		ret = snd_soc_component_set_sysclk(codec_dai->component,
> +						   ADAU1977_SYSCLK,
> +						   ADAU1977_SYSCLK_SRC_LRCLK,
> +						   48000, SND_SOC_CLOCK_IN);
> +		if (ret && ret != -ENOTSUPP)
> +			return ret;

If this link is always connected to the ADAU1979, should we be ignoring 
-ENOTSUPP here?

snd_soc_component_set_sysclk() returns -ENOTSUPP when the component does 
not provide a .set_sysclk() callback. In that case we'd continue without 
applying the LRCLK clock source configuration, while the commit message 
states that this setup is required before startup.

Is there a case where AIF_TDM_TX_8 can be paired with a component that
legitimately lacks .set_sysclk() support?

> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
>   static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
>   				  struct snd_pcm_hw_params *params)
>   {
> @@ -552,6 +593,15 @@ static const struct qcom_snd_soc_common kaanapali_priv_data = {
>   	.wcd_jack = true,
>   };
>   
> +static const struct qcom_snd_soc_common nord_priv_data = {
> +	.driver_name = "nord",
> +	.mi2s_bclk_enable = true,
> +	.codec_dai_fmt = SND_SOC_DAIFMT_CBC_CFC |
> +			 SND_SOC_DAIFMT_NB_NF |
> +			 SND_SOC_DAIFMT_DSP_A,
> +	.snd_init = nord_snd_init,
> +};
> +
>   static const struct qcom_snd_soc_common qcs9100_priv_data = {
>   	.driver_name = "sa8775p",
>   	.dapm_widgets = sc8280xp_dapm_widgets,
> @@ -677,6 +727,7 @@ static const struct of_device_id snd_sc8280xp_dt_match[] = {
>   	{ .compatible = "qcom,hawi-sndcard", .data = &hawi_priv_data },
>   	{ .compatible = "qcom,kaanapali-sndcard", .data = &kaanapali_priv_data },
>   	{ .compatible = "qcom,maili-sndcard", .data = &hawi_priv_data },
> +	{ .compatible = "qcom,nord-sndcard", .data = &nord_priv_data },
>   	{ .compatible = "qcom,qcm6490-idp-sndcard", .data = &qcm6490_priv_data },
>   	{ .compatible = "qcom,qcs615-sndcard", .data = &qcs615_priv_data },
>   	{ .compatible = "qcom,qcs6490-rb3gen2-sndcard", .data = &qcs6490_priv_data },
> 

