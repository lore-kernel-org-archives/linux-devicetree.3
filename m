Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B423D9DB1
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 10:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790331779; cv=none; b=b/AuTvxdvZI6Q2uBU+1Vwirud6ypRXjv0EtNrw0cWw+AFhv0RJR/00J0fhlrZsjldTEG86vkCfrGYTYR497vP7iH8wttZ/1QYWClBLsuLd4emAVGPYwt2JXQ22NfqKXqbn5g3TI3G0oGE+VsdDDsX5dJyojU/TxPq4xYxRT9+W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790331779; c=relaxed/simple;
	bh=1cmzu38BZTVImyIqdtTjj0k7aNrM8I7PU5Q9+EG6ptI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E4vvIP0JVeyO6usT28+9c8ydCo72WG6fA7U/IrUnTkf7cU5Au4vQNXsCEuxY3XoI6oyvgYT62VpVg4ydsgAPR8+y9eRRVZZDJWuADwr5ZpkEn0xISVCNbMR8a7dNYveREL6KRT00ZUo/H565r3YAOfjQrGFgRZ/xU0KWFOITi9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=agib69Rm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jNYgXQSa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="agib69Rm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jNYgXQSa"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P5J7kV601381
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 10:22:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jwu3NcQ+CW5et/xwH4aeftAa2eLuWNrGQO7E6h/ovWc=; b=agib69Rm35i7GJMX
	I9LgZGOPvjRbA7C2UNUs+xYo88+KdFN49okAjALVWC35/WAUsa2bsILGbg+k08uu
	pFk9SKZlyQkT3IxV/bVlCSkiF9vTq+F7IQTaSfzuqfe95/yqJHtLRol1gOHE+3K0
	MHghrg3WQLGV4QrSQW040oRhqnBm+cTc2OVH1+WowaAglni/NIamsuoMWhdne+eK
	oaj8ML0EMKPeKxjQUWAR9nMflfu9aj5bU4amxqaM8BcnuZqyLokRUgtv6K1/B6Np
	fx5mEb6QF2NID41Ph+WMnd+slu+S5SBFzJ9iCorev4B1jkJnMXBZ5Omrdke0GBx9
	IgAc4w==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwjpvrwty-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 10:22:56 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3284bbaa89dso2862900eec.0
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 03:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790331776; x=1790936576; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jwu3NcQ+CW5et/xwH4aeftAa2eLuWNrGQO7E6h/ovWc=;
        b=jNYgXQSaVY4C/XJYz4xh3MstM1M16OC0VnI8FKqx2miMLZwAUwwZxPY0wbt1adB+2I
         bOtJlxpVpRErMc0g9mY9GVCGS4MziSSU4uH64qoTX/PeXVlRN7U5vM+MxDUpjK5sxM7n
         PA3YCbItLUx03gcFhlY20yUtkkyjci9QH3CNLXb+RmT1mnp0530QXcTuMZhX77vXDCoi
         OFA1uLMXNXbQUaz9BwsWD1zBjVIT96Ovz/k7lyHF1DSgz7xppyUtdGYyTQ61LKEG6fzh
         W6NF5O38Mxk5nfi5mS5/6wv3sLZ+iOTNtUQ5jArnXD1WW1AedveuQqwBlSl//37n8mq7
         Z/IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790331776; x=1790936576;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jwu3NcQ+CW5et/xwH4aeftAa2eLuWNrGQO7E6h/ovWc=;
        b=G/WVUS+673c6VsXESa1GFzUhy8qzSXNFuYsK1+DTK8EV2RjHrnRmeN4bbAg0X1NcHR
         AG/ReCEJ5OFr0FI+RUAUdSdewtIzZ/t+G8aYgy/v4MRWaHOCbPlrSjZ0DQj+28FIn87J
         Hcq+qCHuE3fjGwFnrd/Qq6jivXmkYV6LAXGKo72sPDMuqZGk/nb2Qyjf6LMEbr3ELNIO
         j9iuIt/s93gR5yZppJH8/DFiDaVKhfh+WkuYBnPHWpheaOswSJpxF+gkD4ovtIRbqRSC
         BXgf9PN2y/jT3FUc9/VczoqIhuXRzADao2Q9B9zcXYObixN0bIxLUm0gQxVZcaIUkMwn
         9ccw==
X-Forwarded-Encrypted: i=1; AKwUvBw1HTSazNL/NfCiKtj9bVPVRh7yR2e2PNkSSmg5sZf246jei8XKpawPBz1ecMZ6HsUe/c1FsbpfRFT/@vger.kernel.org
X-Gm-Message-State: AFuF++ndQGsOZMo2bAH0It0WStyecnGDYN+GZyXOuC4vKQClwbsW0Xv3
	p5/rv1G0S5in6tuSw1aZKYOBrkzB+m93Y9dnfn88ZjlgdzKvIWx+zaEwvOp0t5XVmggrt7eaJiD
	vnNp01VrK38KdcDLiE2+4+Vvo80w4qxmJIaR7ClEh/80QY/Led3rxPDP/ZzG2V2Cm
X-Gm-Gg: AYBFou2L5frm/Akajn24IkFTVuVYgVapB8gCp1EAO99R9RDtJyEukZtIKLgZ5cXTS3t
	OhkehocDh/q9FsAXwmQ3r0JyN8/wxSkPl6P678en+s8sFpgJfnwzaAf9RhXezyXDydLrfxExY05
	hi2elMlu+8HIpxwcp4QQFRTkHSh39y1UTgXFMwjd8IxM5+gzifY5FPPituFRJrtFg95jJwKpzxj
	s2wAOrHWz29s9mLkYA8ZZ1X4dpCpxsHB3N50Uz6d+BwKUVv8Qr9DQufbUjvmnJPmycs0SjQTd+H
	JxfDL6zHAqyifvXyJHHXK71QrKDekYCrcGEkfdepk1abFmIva0e9mfnyEojkKzA3cyHoXbxXf97
	2+xadP/H2JY2GGjin2eW9wOdtFKRI
X-Received: by 2002:a05:693c:829b:10b0:33b:e21e:4a3a with SMTP id 5a478bee46e88-3400439b178mr5535321eec.40.1790331775560;
        Fri, 25 Sep 2026 03:22:55 -0700 (PDT)
X-Received: by 2002:a05:693c:829b:10b0:33b:e21e:4a3a with SMTP id 5a478bee46e88-3400439b178mr5535274eec.40.1790331774685;
        Fri, 25 Sep 2026 03:22:54 -0700 (PDT)
Received: from [192.168.1.25] ([122.183.173.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3413fc2413dsm5474040eec.0.2026.09.25.03.22.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 03:22:54 -0700 (PDT)
Message-ID: <2c37b9fa-9810-482d-8ca3-67072a0f9072@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 15:52:45 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/8] ASoC: qcom: lpass-tx-macro: Add support for Bolero
 v4.0
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        ajay.nandam@oss.qualcomm.com
References: <20260922-add_shikra_support-v1-0-6c6cb6444caf@oss.qualcomm.com>
 <20260922-add_shikra_support-v1-7-6c6cb6444caf@oss.qualcomm.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20260922-add_shikra_support-v1-7-6c6cb6444caf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: okTmZ21J4hshv8A4ZAIGov85nCTf9uvn
X-Proofpoint-ORIG-GUID: okTmZ21J4hshv8A4ZAIGov85nCTf9uvn
X-Authority-Analysis: v=2.4 cv=aLBlOr9m c=1 sm=1 tr=0 ts=6ab64b80 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=uk8ae9/F1LYL5lfeGCaUoA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=NHDDfAIwdS3HBU7MvnUA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA0MSBTYWx0ZWRfX1DsNFxSOXJcV
 IJ5rzX8oneQDuP8G+Pavlu78B0IG/apG+TTDGc5TzWZiElM0HUlfz4eYL2lzX+d/vYspP25aq/h
 pSFfzV1c7U4eaZCDDVHqC3NTjkGk8BU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA0MSBTYWx0ZWRfX3XoadCJNnkDu
 oKdc6lh7JmjNElDgH5s9G9I+uHDAAPzymdoXtiyp9a8KFJxNeGOHr09tkZE6PMmg34SElg64VZQ
 di79oJjltcG6BwXP4P6+VrTxpU91LE/IC0N5ZrJ0GIVnAEwYCfYYEmg9BQG+h8g1ij5XgFGT4zS
 96uDN78tvr6VrY31NG7RT1oA/Mz2czM0m+JwH8+jRWnhNdMGYIfae2nArYg4+4ECUsGMK1Oq7Br
 D52kTp84UHZdMXc8kIAG7hkjenJueJjYhXnjvSThJ4hM4OcSJ5SgJjbEgtkQI42iHTosCPRqqNC
 2ps6xLTpPW7DHGLN/VeJOk906+iJ6zet3Z0+96KE0nQUS8gDliKY+2zGMSPRP3YgiBztu5/H39N
 QiBB5IWcGh4Yhwv/e1CipFyZUpjXsuhf4/ma6NEtyNsJMDppl2dWKIX6UKzAbfgdBRjaGRzhW0q
 fg1ctbL3qVe+NUPl+7w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250041



On 9/22/2026 3:12 PM, Mohammad Rafi Shaik wrote:
> From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> 
> Hawi integrates the Bolero v4.0 TX macro, which extends the v9.x TX
> macro with a port-select stage in the SWR microphone input path and an
> adaptive filter (ADPT) block.
> 
> Add the additional CFG2 mux registers and per-path CFG2 registers to the
> register map, extend the maximum register offset to cover the new ADPT
> control register, and describe the new v4.0 decimator, SWR microphone,
> WSA and port-select mux widgets and their routes.
> 
> The ADPT block has to be disabled before a decimator is enabled. This
> register only exists on v4.0, so gate the write on a has_adpt flag set
> from the match data rather than issuing it unconditionally.
> 
> Add the "qcom,hawi-lpass-tx-macro" compatible and its match data to
> select the new widgets and routes.
> 
> Co-developed-by: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
> Signed-off-by: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>   sound/soc/codecs/lpass-macro-common.h |   1 +
>   sound/soc/codecs/lpass-tx-macro.c     | 442 +++++++++++++++++++++++++++++++++-
>   2 files changed, 442 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/codecs/lpass-macro-common.h b/sound/soc/codecs/lpass-macro-common.h
> index b52665b11e35..707b22a6bda6 100644
> --- a/sound/soc/codecs/lpass-macro-common.h
> +++ b/sound/soc/codecs/lpass-macro-common.h
> @@ -16,6 +16,7 @@ enum lpass_version {
>   	LPASS_VER_9_2_0,
>   	LPASS_VER_10_0_0,
>   	LPASS_VER_11_0_0,
> +	LPASS_VER_15_0_0,
>   };
>   
>   enum lpass_codec_version {
> diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
> index 6deaaabe43af..b1eee16e968c 100644
> --- a/sound/soc/codecs/lpass-tx-macro.c
> +++ b/sound/soc/codecs/lpass-tx-macro.c
> @@ -67,6 +67,14 @@
>   #define CDC_TX_INP_MUX_ADC_MUX6_CFG1	(0x0134)
>   #define CDC_TX_INP_MUX_ADC_MUX7_CFG0	(0x0138)
>   #define CDC_TX_INP_MUX_ADC_MUX7_CFG1	(0x013C)
> +#define CDC_TX_INP_MUX_ADC_MUX0_CFG2	(0x0140)
> +#define CDC_TX_INP_MUX_ADC_MUX1_CFG2	(0x0144)
> +#define CDC_TX_INP_MUX_ADC_MUX2_CFG2	(0x0148)
> +#define CDC_TX_INP_MUX_ADC_MUX3_CFG2	(0x014C)
> +#define CDC_TX_INP_MUX_ADC_MUX4_CFG2	(0x0150)
> +#define CDC_TX_INP_MUX_ADC_MUX5_CFG2	(0x0154)
> +#define CDC_TX_INP_MUX_ADC_MUX6_CFG2	(0x0158)
> +#define CDC_TX_INP_MUX_ADC_MUX7_CFG2	(0x015C)
>   #define CDC_TX_ANC0_CLK_RESET_CTL	(0x0200)
>   #define CDC_TX_ANC0_MODE_1_CTL		(0x0204)
>   #define CDC_TX_ANC0_MODE_2_CTL		(0x0208)
> @@ -108,6 +116,16 @@
>   #define CDC_TX0_TX_PATH_SEC5		(0x0424)
>   #define CDC_TX0_TX_PATH_SEC6		(0x0428)
>   #define CDC_TX0_TX_PATH_SEC7		(0x042C)
> +#define CDC_TX0_TX_PATH_CFG2		(0x0430)
> +#define CDC_TX1_TX_PATH_CFG2		(0x04B0)
> +#define CDC_TX2_TX_PATH_CFG2		(0x0530)
> +#define CDC_TX3_TX_PATH_CFG2		(0x05B0)
> +#define CDC_TX4_TX_PATH_CFG2		(0x0630)
> +#define CDC_TX5_TX_PATH_CFG2		(0x06B0)
> +#define CDC_TX6_TX_PATH_CFG2		(0x0730)
> +#define CDC_TX7_TX_PATH_CFG2		(0x07B0)
> +#define CDC_ADPT0_ADPT_CTRL		(0x0800)
> +
>   #define CDC_TX0_MBHC_CTL_EN_MASK	BIT(6)
>   #define CDC_TX1_TX_PATH_CTL		(0x0480)
>   #define CDC_TX1_TX_PATH_CFG0		(0x0484)
> @@ -186,7 +204,7 @@
>   #define CDC_TX7_TX_PATH_SEC4		(0x07A0)
>   #define CDC_TX7_TX_PATH_SEC5		(0x07A4)
>   #define CDC_TX7_TX_PATH_SEC6		(0x07A8)
> -#define TX_MAX_OFFSET			(0x07A8)
> +#define TX_MAX_OFFSET			(CDC_ADPT0_ADPT_CTRL)
>   

These registers look v4.0-specific from the commit message, but 
TX_MAX_OFFSET, tx_defaults[] and tx_is_rw_register() are updated in the 
shared regmap configuration used by all TX macro variants.

The explicit CDC_ADPT0_ADPT_CTRL write is gated with has_adpt, but 
regcache_sync() can still sync the new default registers on older 
non-v4.0 hardware because the regmap config/default table is shared.

Should this use a v4.0-specific regmap_config/default table, similar to 
the VA macro, or are the CFG2/ADPT registers guaranteed to be 
harmless/present on all TX macro variants?

>   #define TX_MACRO_RATES (SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |\
