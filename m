Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3AC350298
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 08:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790324069; cv=none; b=TUk8j8Qzyxo3x31YmYgyVcdFHhCDm11CsrdDCOejv3Y6ovUWdY5jvxssDg7Scgk6N/Ys5E+m0xfAb08OPYxwd6Mr/iNl9U/xVkvdE78kPq8Ct4Q+omhNoLPumqa/o6oN5Kmtf2rA057t9TF+lYDpjlkqW33h0V0YDgDuY1tKfEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790324069; c=relaxed/simple;
	bh=RfM1E3VYKX9wiL+0X5EDW/fIg41SnkKGkIi9naOno2E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nuaq3yyxWroQVI+J+6is4HSVhJp8Py+iSAmbGO/c/PqTpl8mjOSGIYc+dM7JJeA9yh0tErt8lBXWgbyo1+DDvd4wF27yjp70Et78m1QP8C5wpUv3CZfa2OLXGv83WB0sVAD6gzpOLb2NAaLu+WjDXQl08PngHoSnZhJZjt1Jttw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mnAc4f4V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gzm3MeaE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mnAc4f4V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gzm3MeaE"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YXGK289464
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 08:14:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3tN7fzTN6Fvf4xQakRN52v4FP1Y7P2zuIjqDy4DV+jE=; b=mnAc4f4VUJsj19FL
	Q1P9Ok/vWPgoWXUfsOUT/oG0C/dZQep5KFBAZzGPmCAfZzLGzPf9VFRvEvSOXJbW
	BHhNXwWhljr+f07X7OAsiv/C1bcUVJ+tTJy6+SW9oE+rsswoiDSoFbvyGAeuxz2u
	56jKtKlCLQZQasSfIaEAS+kwtIXLvIeTm7XTZp8tATijSTPo23W5v2iwa5NlxItN
	J31k0IyNdRxCASy6lezOI+nIcyylkcpTv+5nOXDhqwsQTADQMP76BBhOolQAK1i4
	p4Xm1mexo2uMNW5YsNnYycyLuaOtFxpVyz5mk/zjnlqA59JwpxJ/HWbO/S/LnExQ
	PSPFew==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw881tnc8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 08:14:26 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a1e564fd5so117840585a.1
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 01:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790324066; x=1790928866; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3tN7fzTN6Fvf4xQakRN52v4FP1Y7P2zuIjqDy4DV+jE=;
        b=gzm3MeaEKmbisBMrND0QNFPBfDxtiNvumTPR8yFC23rXRewkvq4fPnEKuJ/dvTQkFb
         v7RwRjZ7JYsJRGLHHgUqBmWBQAMVgT7RDAICeUuHTRhNK7JkyAJnWL1zx49TrBm49M/l
         A3UBrOTxpWtUKRufGWjvvXQD3uh9rRGOvoZ5HtAYdbUtzKsdFD3vRf3juEZaG0KMAPSA
         p6So3t64CgxxBQA/jSDi8cQyS0yAX/HOzcQ4KDz4w4bCEqPfCfYwnUDIoQoWOPOW/rWS
         81P2rbfj7cqSG4VGABpe/B4Uk0BFd16Bi6XKbhUb71+mFln5eakjaQu8MHNTwan55lpf
         sLqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790324066; x=1790928866;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3tN7fzTN6Fvf4xQakRN52v4FP1Y7P2zuIjqDy4DV+jE=;
        b=pIN/PC+ex/11d8RcmalOn2GmC2fC2BLsHwIdzsAOTSW1d5fxoQUteRodcAXl0rXnMu
         64ifrnUpMJXgDMW+mnPoGTfLkWe/lq2Y3KrxHgVFOWwnDwsB1gsKSJVDvS4/eKeNhV6F
         3fn3ES4juj2uxPNY3OLt21lG73nOSd16gKK0g7Up5sbApkSXm12rAp1ckIkeozq4O3m3
         wzifykvp23xqnKsEsKAJS/t5qwtEJK4+JKSNp7g5uOTrRewOActKZaIgalZaJG1chbWi
         v/WoO0lqyHGvyPz0YFmhj1ZBB/47mOTCuQj5N9FzqXu4VZgmgsWIEaU9J2HlkqhXYfat
         p4DQ==
X-Forwarded-Encrypted: i=1; AKwUvBwFAPk7aS0VzE9p2c0/soi9xz9+j1wOSUNNbgvxmqBANM638pYS41Gbqfc1DAMPcC/JrAlVgYekxyOT@vger.kernel.org
X-Gm-Message-State: AFuF++mVIfRJC3jjd00SBmPYiA6u12F0vt+pFBUDQHZ/4hMccyuM8aay
	oo6jK71lffcTZ4W9W8uKMtcup8oMYnYFDVwFEcoxZdRJCowJuRGnpI85sTpKVROoVRveJrJlHcF
	bWpnaa5ibLEk7y2yd849frFDy2CiO/S3CwLncj/Ow+ElyXfda9v7Ij7Li7Gh0jXhY
X-Gm-Gg: AYBFou3Z5RKZiA/uuNhbscy2qgw1NmwbkjLVVwDX3jI/UPaKBSH1NI40nuzdXaA1bVO
	zWz+3m/Y9fMaotBcDchM8XBovtnlzCvT03u4GH4MSnVGVYorMhwnkuFOmzOHr0S92LS9MOcwuvv
	tXGQMyVM9Ff8j/Iqm1t/LcsOUqcDBq5e9TVpryAJmZyddJXncA3nYg5AM6wN5gmGem+CPl9e4ss
	HgOZaMmSBSf5RwxDfc59KMYPsQ0xx0UlbCOe1f/ro2aQzOmmFeLknFJOhKJMORInaQxm1cc7Vbc
	qMrneUsZcJZP850QSGcRf4h5JE0tw5GVG4j0yR2E66MQSQhqYwOJNIkxHmxOis0lmYQfX3HuyDO
	a+Od3H7hgTESrR20MsD+wcJ74Aw==
X-Received: by 2002:a05:620a:688c:b0:93a:12eb:b626 with SMTP id af79cd13be357-93c43b80ed4mr291568085a.4.1790324066052;
        Fri, 25 Sep 2026 01:14:26 -0700 (PDT)
X-Received: by 2002:a05:620a:688c:b0:93a:12eb:b626 with SMTP id af79cd13be357-93c43b80ed4mr291564285a.4.1790324065567;
        Fri, 25 Sep 2026 01:14:25 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c2ae735725dsm77113266b.14.2026.09.25.01.14.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 01:14:24 -0700 (PDT)
Message-ID: <d29c3741-0c47-46b6-9d27-1e8a54c51b83@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 09:14:23 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/8] ASoC: qcom: sdm845: Demystify TDM masks a bit
To: david@ixit.cz, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        David Rhodes <drhodes@opensource.cirrus.com>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260924-pixel3-audio-v4-0-85b5d133aa5e@ixit.cz>
 <20260924-pixel3-audio-v4-1-85b5d133aa5e@ixit.cz>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260924-pixel3-audio-v4-1-85b5d133aa5e@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TptzFzXh c=1 sm=1 tr=0 ts=6ab62d62 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=eN4gI1Pk1yANhL5TOoYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzMiBTYWx0ZWRfX4rrzyKf4lvjD
 VAF++VYZka8aVrh6tC4VxyGavSAExiwcHpKxV+0Bt4zjLXwNeE+w0zrI3QDEk9HVFNvE5M7r/ne
 K3rmSzHj44OjrLjpgGni36EVjU89Xy27pbwLkyBX6jY9YJi21mMCVwnjFVde4P/D7BO/OZYXbO6
 XzRp9ru9OEdJTJeswJ/w6fhpA6UdZx7a5IrmeYDowTF+ZTD6NGCdUmEFZAhNv2FPQCRFp9zmtf8
 Hz4MVTXpIVOI3c2k+mt1xUzewQYKhMX7McfxDgmocFHQeTl4holMjGJ7c4QatI8QhdpGNiQ4vwE
 2A46r9ErL/RfQ9rysfKFPmyV3MgEjfe4GF4TNNPr6tzcI6TlJLZ995i8DWW5FK9v9mebuywe4S5
 T1MUFoQ0rAfEGVQOwKc7RafcUelJ79ybpll5ciTZLTONZBw27YUlg1FvabrRqeiJ83trVwQ/kCg
 efICJMKqoDoSFU2QSCQ==
X-Proofpoint-ORIG-GUID: EB32VF-DV6wVrT3X3cV9DJ6X-hvh6ayq
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzMiBTYWx0ZWRfXzFIrQ5Yu4kSC
 r92xA1t23K15NbumkYJ579NAqyNcHS+m48s9ijvFGpAIffahSt128HONxf0/iK5skZxE7VfEDbi
 z3WJDH2QnBSHaqta/hUtB9RSQo3lFlU=
X-Proofpoint-GUID: EB32VF-DV6wVrT3X3cV9DJ6X-hvh6ayq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250032

On 9/24/26 2:24 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Describe the mask with the bits used for each RX/TX.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  sound/soc/qcom/sdm845.c | 21 ++++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/sound/soc/qcom/sdm845.c b/sound/soc/qcom/sdm845.c
> index 6843ab8ba017e..0ce8265ab1c1f 100644
> --- a/sound/soc/qcom/sdm845.c
> +++ b/sound/soc/qcom/sdm845.c
> @@ -18,19 +18,24 @@
>  #include "sdw.h"
>  #include "../codecs/rt5663.h"
>  
>  #define DRIVER_NAME	"sdm845"
>  #define DEFAULT_SAMPLE_RATE_48K		48000
>  #define DEFAULT_MCLK_RATE		24576000
>  #define TDM_BCLK_RATE		6144000
>  #define MI2S_BCLK_RATE		1536000
> -#define LEFT_SPK_TDM_TX_MASK    0x30
> -#define RIGHT_SPK_TDM_TX_MASK   0xC0
> -#define SPK_TDM_RX_MASK         0x03
> +#define LEFT_SPK_TDM_RX_MASK	BIT(0)
> +#define RIGHT_SPK_TDM_RX_MASK	BIT(1)
> +#define SPK_TDM_RX_MASK		(LEFT_SPK_TDM_RX_MASK | RIGHT_SPK_TDM_RX_MASK)
> +#define MIC1_TDM_RX_MASK	BIT(2)
> +#define MIC2_TDM_RX_MASK	BIT(3)
> +#define MIC_TDM_RX_MASK		(MIC1_TDM_RX_MASK | MIC2_TDM_RX_MASK)
> +#define LEFT_SPK_TDM_TX_MASK	(BIT(4) | BIT(5))
> +#define RIGHT_SPK_TDM_TX_MASK	(BIT(6) | BIT(7))
>  #define NUM_TDM_SLOTS           8
>  #define SLIM_MAX_TX_PORTS 16
>  #define SLIM_MAX_RX_PORTS 13
>  #define WCD934X_DEFAULT_MCLK_RATE	9600000
>  
>  struct sdm845_snd_data {
>  	struct snd_soc_jack jack;
>  	bool jack_setup;
> @@ -107,34 +112,36 @@ static int sdm845_tdm_snd_hw_params(struct snd_pcm_substream *substream,
>  	default:
>  		dev_err(rtd->dev, "%s: invalid param format 0x%x\n",
>  				__func__, params_format(params));
>  		return -EINVAL;
>  	}
>  
>  	channels = params_channels(params);
>  	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
> -		ret = snd_soc_dai_set_tdm_slot(cpu_dai, 0, 0x3,
> -				8, slot_width);
> +		ret = snd_soc_dai_set_tdm_slot(cpu_dai, 0, SPK_TDM_RX_MASK,
> +					       NUM_TDM_SLOTS, slot_width);
>  		if (ret < 0) {
>  			dev_err(rtd->dev, "%s: failed to set tdm slot, err:%d\n",
>  					__func__, ret);
>  			goto end;
>  		}
>  
>  		ret = snd_soc_dai_set_channel_map(cpu_dai, 0, NULL,
>  				channels, tdm_slot_offset);
>  		if (ret < 0) {
>  			dev_err(rtd->dev, "%s: failed to set channel map, err:%d\n",
>  					__func__, ret);
>  			goto end;
>  		}
>  	} else {
> -		ret = snd_soc_dai_set_tdm_slot(cpu_dai, 0xf, 0,
> -				8, slot_width);
> +		ret = snd_soc_dai_set_tdm_slot(cpu_dai,
> +					       SPK_TDM_RX_MASK |
> +					       MIC_TDM_RX_MASK, 0,
> +					       NUM_TDM_SLOTS, slot_width);
>  		if (ret < 0) {
>  			dev_err(rtd->dev, "%s: failed to set tdm slot, err:%d\n",
>  					__func__, ret);
>  			goto end;
>  		}
>  
>  		ret = snd_soc_dai_set_channel_map(cpu_dai, channels,
>  				tdm_slot_offset, 0, NULL);
> 

