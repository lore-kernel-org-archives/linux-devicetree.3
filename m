Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8BD3F12D5
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 08:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783585950; cv=none; b=JHSBDOXFIBytpy4GaqMmXvTVQ+UCVJDdbU0lhzIwvAuLG3Au8GzyAdVyDEzd1Q+1jnHumFCG0zcjegkO+nAapeBwO1CrCLH5judrCHrSsSdwvBNiGDqwUc+trJQEEf/ZJHi+O78xV8+tGViYTYX6Ck5wVP2L1ALQEzqwu8zUHv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783585950; c=relaxed/simple;
	bh=V0YXLnYwbPTjAP6F5DvVbhUKyuCphnicmr/wDylbkw4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FKM4CRsJLVQf0yNGdEOg5ZdgL+Y0aky+IUdB0UcfHwEyl65UY3ApNgvG5oN1gE1inek14/k2jPl9zi/cDM/tHC0AX5O2RMepWyIb0ZmjHGJg6QQNzpfthY4tDOCahwpBtI3yLHSfQbL/Ls2P1cIC2dWkJSSuPhRYaGmXuH+QbT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F14SN/P2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PikIUVBr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F14SN/P2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PikIUVBr"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669600sd710993
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 08:32:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J3JFZSW8jxg1xUGpFotteVGsloZBdgsWdR4Ns16niIs=; b=F14SN/P2ZZEPU+vR
	MIMBndaSYEAFgqDT9PDp4xrOKND6zZizHM729CTxuoAwS/Z03uXGeB+SHQAjJ4EA
	hZ4W6cdZiB6PVOg/6LhXmp/qJHJP2kUGBmtPdqjmiYYAITj35qSQTb2ZO4ZPhWTk
	XkxMkbiU2/FGuSWfU3E1KpsNWagTb4m8g5m7i1lz2GcVMmGcDBZkw+LvRVct+dtw
	SQdACpujWhDPyXS4+cIz1GOlH5cDMnJbnzMy7tMerDeApQDfphHabzpy0h1ppsxs
	NlNtEhbf5lLQV2rHcDNX5rmOHv1f9AI8zcY9FHRTA2/7yTzhYtOEz6VvpWm+X0li
	9cmdvw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa55vgtxc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 08:32:27 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3881937456bso1349085a91.0
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 01:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783585947; x=1784190747; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J3JFZSW8jxg1xUGpFotteVGsloZBdgsWdR4Ns16niIs=;
        b=PikIUVBrY/xEXaUuyyhjdF7hdXh0GwP0dyeUiRCf46HCWrnCvtTO/yRmBr7F2ys9bM
         Jfuwshlxx0TzmLfuhGf/gBZih1Q9rrm4nGxJsCUzcEX9VaOe7bjLl26F5RgKMgD937eg
         z2qi7iTdREIlnLu7QSochfAh5VyFnUGF85ZrMq252RXsVIsKsgourjsoE5NjiT58rpem
         SVFKOPrDg3/UctPrZcTzQvxgs5KK7ugOv1JKFWbisnPBcembkStDBeV+xQ28KTGjFo3t
         z0BFkkaag1hHjAPbRZSus3riEqocj5rZzVJnqwXszU+zPflrkJP4MvPZpmi4NsoC4Oa9
         bMog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783585947; x=1784190747;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J3JFZSW8jxg1xUGpFotteVGsloZBdgsWdR4Ns16niIs=;
        b=mwI85xcCDhMLulbJbWyDtqD0Tj7LUpU/1NkntVGo/BiGZO6P3AvdE7PjuYV/8eT28W
         dscYuo+0ln0Vh/Nh6Fkfc83FoixoYWwl1XZo4/E2jXNQbDsptdiYK4llHbCooURxz+NI
         5yrnC+q/npb1mljQMCWgfpD1RvJg0zcJfSrQM0xf0bOn8ud6HzJQ17sV1FlzXKRzvYOE
         CRvvHVewl7aeCOSIwY5HRI1g/A1IzExb9urLCUfw4jryID6gltFS/yjvJF5KDGm4x1NV
         gILcDt6Y/GXSNrg8Qy17EkHjtArqJInokSKmAvcuHdmlMc74z9jZUuG2f4eaOF1LjtLQ
         3VyA==
X-Forwarded-Encrypted: i=1; AHgh+RoV4pyGnqUx/T0PUkLE4jh7f4PCC3/5S3ewlGUL1bRKfTe6VN1pUhq02IFcKD5JOiqdNSXE7p6Xoqv6@vger.kernel.org
X-Gm-Message-State: AOJu0Ywks1wi80gYyKjogaMbd9LBHhU1siAadBwSJT5rhRu4TJcJuF3O
	I3n2vcOIhKzNX8isJRE8FeelgHEBpnDz6k1XI2Y9yL3ACrlWbSeCdaXNAlGZTexJjqT8htptV+J
	8tZEVJAb/+rIhtn05ukuzMTh7Gob2rxRhO5gyCo7NYkTmoFiLvF/n7n4W+3XsyH7t
X-Gm-Gg: AfdE7ckrAmUi2ys5HeLE0SYUNHI9iNYM4DnK5/LB14KSiuIGUwyJcMxPK3CWlL37VYX
	3WFsQ5mthUWQhxiq+/BichEXte1JqW2cItLc9eM1vgIYnqAHZgUtShXFCXEGYEOUzxx7oAdsjWc
	Ei7wK+022lohLD+qdq7TkY3Qg1SXQ9wuOrqNlimGWR1693gtbxuUBW4kuosZprpPkDr2Ri9CiIU
	l0Kb7u3PNj+U9znXj8wCMoPZW1RWwCGCkMNuk3S+h+cVokm6702ce+Y+mAfFaCxTcH6MMnnF3NA
	TAcJicfL2oiTK7gY1DL09Tc04Aw6YjgwN9tgY52u7Y6E0PtqlSp97De0wFWs4QrK34rFWLURi40
	CjJKStaGdLM9pWtYZ3Cvu2WAH1y1JJpk8eTeO6o8=
X-Received: by 2002:a17:90b:584f:b0:386:ca4b:16a9 with SMTP id 98e67ed59e1d1-38b7493b7c2mr1671118a91.16.1783585946850;
        Thu, 09 Jul 2026 01:32:26 -0700 (PDT)
X-Received: by 2002:a17:90b:584f:b0:386:ca4b:16a9 with SMTP id 98e67ed59e1d1-38b7493b7c2mr1671084a91.16.1783585946361;
        Thu, 09 Jul 2026 01:32:26 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38a57dc5820sm765039a91.10.2026.07.09.01.32.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 01:32:25 -0700 (PDT)
Message-ID: <5344fcd3-8c2c-4b61-a21c-af11550aa8b8@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 14:02:20 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] ASoC: qcom: sc8280xp: add Shikra EVK machine
 variants
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260611112946.954172-1-ajay.nandam@oss.qualcomm.com>
 <20260611112946.954172-3-ajay.nandam@oss.qualcomm.com>
 <qcvb4wvfsk6twtvkvkechysrihngaugnhe3po6qbqjrfmqcml5@mn453je73fm6>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <qcvb4wvfsk6twtvkvkechysrihngaugnhe3po6qbqjrfmqcml5@mn453je73fm6>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA4MCBTYWx0ZWRfX4o7x2ruWQdnR
 zLoA89Rj+xoEGX2egGA7XTP9mxtdfqvE4RT3Wf0XF8I16xRyE+14uZzxa+9yptMZHIB0jt4vmMG
 c3SKR81we6qImKfQvZXfJ0Z+HcC4wWJ3mLrNtgch5ISEfaJ4yzSOmBOzlsOAv0dGmQO/1UmH2D6
 Zzjx+ueXb+xgB82/ipookHzx9IToEKtu0mBwnVzcz27n8oK3TOfApgfSo2kJ165yKSgLtKoh1v0
 XpUgfZEju0UQ93VIF/a8/gN+uHejnmQ8p1qxINwjH8kyu9gGXRhCyd1qTW85ajL4QtezVxIiSCT
 X7y6ohiL8pD0wrnJO0ODLyg0k3mj0LoDsKO86dz/h94GWtKrfgGB/cpGvXLQrf12+G9uuNTucYr
 ydSNAFCAFiHYef7XiVypw9PQllH7LauqAkS9K12W/O1EHTqCbXNVJqImzj1y+3pMNNDnIKwb7Lk
 zkw8NFn9qnAJpJgVSnw==
X-Authority-Analysis: v=2.4 cv=KfDidwYD c=1 sm=1 tr=0 ts=6a4f5c9b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=2RTvg86By1wPwCRoaxwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA4MCBTYWx0ZWRfX6+yJBNTcPCWU
 JCOgFo9TtVjX6sQblKcQi6qJ/StWN8p4MqP4dOvhp/vylEte0NH76+cVH14Ej3PHeXhNOeRceXR
 +QJPhuH+za4vvc2Q6546FYQCTUcQjCg=
X-Proofpoint-ORIG-GUID: 6ryPqi3uyFUgNdN9Bxdpa9HlIcf2a-OQ
X-Proofpoint-GUID: 6ryPqi3uyFUgNdN9Bxdpa9HlIcf2a-OQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090080



On 6/12/2026 4:46 AM, Dmitry Baryshkov wrote:
> On Thu, Jun 11, 2026 at 04:59:46PM +0530, Ajay Kumar Nandam wrote:
>> Add machine-driver support for Qualcomm Shikra EVK variants by matching
>> dedicated compatible strings and applying board-specific audio behavior.
>>
>> Shikra platforms are available as CQM, CQS, and IQS variants with
>> different audio components and processing architectures:
>>
>> - CQM/CQS use an I2S-based path with WSA885x amplifiers and
>>    PM4125 + Rouleur codec components.
>> - CQM runs in DSP-bypass mode, where the complete audio pipeline runs
>>    on CPU only and no DSP is involved.
>> - CQS uses modem-DSP based audio processing.
>> - IQS uses a third-party MAX98091 codec with modem-DSP support.
>>
>> Introduce variant-specific handling so codec controls, DAPM widgets, and
>> clock programming match the board design and avoid invalid clock setup on
>> variants where it is not applicable.
> 
> To me it looks like several independent changes being squashed into one
> commit.

ACK, we will make seperate logical patches in the next version.

> 
>>
>> Co-developed-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
>> ---
>>   sound/soc/qcom/common.c   |  2 ++
>>   sound/soc/qcom/sc8280xp.c | 58 +++++++++++++++++++++++++++++++++++++--
>>   sound/soc/qcom/sdw.c      |  3 ++
>>   3 files changed, 61 insertions(+), 2 deletions(-)
>>
>> diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
>> index f42c98ded..32d6c09b2 100644
>> --- a/sound/soc/qcom/common.c
>> +++ b/sound/soc/qcom/common.c
>> @@ -3,6 +3,7 @@
>>   // Copyright (c) 2018, The Linux Foundation. All rights reserved.
>>   
>>   #include <dt-bindings/sound/qcom,q6afe.h>
>> +#include <dt-bindings/sound/qcom,qaif.h>
>>   #include <linux/module.h>
>>   #include <sound/jack.h>
>>   #include <linux/input-event-codes.h>
>> @@ -430,6 +431,7 @@ int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
>>   	}
>>   
>>   	switch (cpu_dai->id) {
>> +	case QAIF_CDC_DMA_RX0:
>>   	case TX_CODEC_DMA_TX_0:
>>   	case TX_CODEC_DMA_TX_1:
>>   	case TX_CODEC_DMA_TX_2:
>> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
>> index e5d23e244..4c985f81c 100644
>> --- a/sound/soc/qcom/sc8280xp.c
>> +++ b/sound/soc/qcom/sc8280xp.c
>> @@ -37,6 +37,25 @@ static struct snd_soc_dapm_widget sc8280xp_dapm_widgets[] = {
>>   	SND_SOC_DAPM_SPK("DP7 Jack", NULL),
>>   };
>>   
>> +static struct snd_soc_dapm_widget shikra_cqm_dapm_widgets[] = {
>> +	SND_SOC_DAPM_HP("Headphone Jack", NULL),
>> +	SND_SOC_DAPM_MIC("Mic Jack", NULL),
>> +};
> 
> No speakers?

We are using the WSA885x external I²S speaker amplifier, separate 
machine-level SND_SOC_DAPM_SPK() widget is not required here.

> 
>> +
>> +static const struct snd_soc_dapm_widget shikra_iqs_dapm_widgets[] = {
>> +	SND_SOC_DAPM_HP("Headphone", NULL),
>> +	SND_SOC_DAPM_MIC("Headset Mic", NULL),
>> +	SND_SOC_DAPM_MIC("Int Mic", NULL),
>> +	SND_SOC_DAPM_SPK("Speaker", NULL),
>> +};
>> +
>> +static const struct snd_kcontrol_new shikra_iqs_controls[] = {
>> +	SOC_DAPM_PIN_SWITCH("Headset Mic"),
>> +	SOC_DAPM_PIN_SWITCH("Headphone"),
>> +	SOC_DAPM_PIN_SWITCH("Int Mic"),
>> +	SOC_DAPM_PIN_SWITCH("Speaker"),
>> +};
> 
> No controls for CQM/CQS variants? Why? Or rather why do we need
> kcontrols for IQS?
> 

CQM/CQS use Qualcomm WSA885x and Rouleur codecs, whose audio paths are 
already described by the codec DAPM topology, so additional 
machine-driver pin-switch controls are not required.

IQS uses the external MAX98090 codec, and therefore the machine driver 
exposes the board-level endpoints through DAPM widgets and corresponding 
kcontrols.


>> +
>>   struct snd_soc_common {
>>   	const char *driver_name;
>>   	const struct snd_soc_dapm_widget *dapm_widgets;
>> @@ -49,6 +68,7 @@ struct snd_soc_common {
>>   	bool codec_sysclk_set;
>>   	bool mi2s_mclk_enable;
>>   	bool mi2s_bclk_enable;
>> +	bool dsp_bypass;
>>   };
>>   
>>   struct sc8280xp_snd_data {
>> @@ -219,6 +239,10 @@ static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
>>   	int mclk_freq = sc8280xp_get_mclk_freq(params);
>>   	int bclk_freq = sc8280xp_get_bclk_freq(params);
>>   
>> +    /* Skip DSP configuration when operating in CPU-only (bypass) mode */
>> +	if (data->snd_soc_common_priv->dsp_bypass)
>> +		return 0;
>> +
> 
> How are e.g. MI2S signals configured / routed?

In bypass mode, the MI2S links are configured and routed by the QAIF 
platform driver rather than through the DSP path.
The check here only skips the DSP-specific configuration performed by

sc8280xp_snd_hw_params(). The MI2S interface setup required for CPU-only 
operation remains handled by the corresponding QAIF/platform driver, so 
skipping this machine-driver DSP configuration does not affect MI2S 
signal routing.

Regards,
Ajay Kumar Nandam

> 
>>   	switch (cpu_dai->id) {
>>   	case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
>>   	case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
>> @@ -239,7 +263,7 @@ static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
>>   					       SND_SOC_CLOCK_IN);
>>   
>>   		if (data->snd_soc_common_priv->codec_sysclk_set)
>> -			snd_soc_dai_set_sysclk(cpu_dai,
>> +			snd_soc_dai_set_sysclk(codec_dai,
>>   					       0, mclk_freq,
>>   					       SND_SOC_CLOCK_IN);
>>   		break;
>> @@ -284,7 +308,7 @@ static void sc8280xp_add_be_ops(struct snd_soc_card *card)
>>   	int i;
>>   
>>   	for_each_card_prelinks(card, i, link) {
>> -		if (link->no_pcm == 1) {
>> +		if (link->no_pcm == 1 || link->num_codecs > 0) {
>>   			link->init = sc8280xp_snd_init;
>>   			link->be_hw_params_fixup = sc8280xp_be_hw_params_fixup;
>>   			link->ops = &sc8280xp_be_ops;
>> @@ -375,6 +399,33 @@ static struct snd_soc_common sc8280xp_priv_data = {
>>   	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
>>   };
>>   
>> +static const struct snd_soc_common shikra_cqm_priv_data = {
>> +	.driver_name = "shikra",
>> +	.dapm_widgets = shikra_cqm_dapm_widgets,
>> +	.num_dapm_widgets = ARRAY_SIZE(shikra_cqm_dapm_widgets),
>> +	.dsp_bypass = true,
>> +};
>> +
>> +static const struct snd_soc_common shikra_cqs_priv_data = {
>> +	.driver_name = "shikra",
>> +	.dapm_widgets = shikra_cqm_dapm_widgets,
>> +	.num_dapm_widgets = ARRAY_SIZE(shikra_cqm_dapm_widgets),
>> +	.mi2s_bclk_enable = true,
>> +	.codec_sysclk_set = true,
>> +};
>> +
>> +static const struct snd_soc_common shikra_iqs_priv_data = {
>> +	.driver_name = "shikra",
>> +	.dapm_widgets = shikra_iqs_dapm_widgets,
>> +	.num_dapm_widgets = ARRAY_SIZE(shikra_iqs_dapm_widgets),
>> +	.controls = shikra_iqs_controls,
>> +	.num_controls = ARRAY_SIZE(shikra_iqs_controls),
>> +	.codec_dai_fmt = SND_SOC_DAIFMT_CBP_CFP |
>> +			 SND_SOC_DAIFMT_NB_NF |
>> +			 SND_SOC_DAIFMT_I2S,
>> +	.codec_sysclk_set = true,
>> +	.mi2s_bclk_enable = true,
>> +};
>> +
>>   static struct snd_soc_common sm8450_priv_data = {
>>   	.driver_name = "sm8450",
>>   	.dapm_widgets = sc8280xp_dapm_widgets,
>> @@ -408,6 +459,9 @@ static const struct of_device_id snd_sc8280xp_dt_match[] = {
>>   	{.compatible = "qcom,qcs9075-sndcard", .data = &qcs9100_priv_data},
>>   	{.compatible = "qcom,qcs9100-sndcard", .data = &qcs9100_priv_data},
>>   	{.compatible = "qcom,sc8280xp-sndcard", .data = &sc8280xp_priv_data},
>> +	{.compatible = "qcom,shikra-cqm-sndcard", .data = &shikra_cqm_priv_data},
>> +	{.compatible = "qcom,shikra-cqs-sndcard", .data = &shikra_cqs_priv_data},
>> +	{.compatible = "qcom,shikra-iqs-sndcard", .data = &shikra_iqs_priv_data},
>>   	{.compatible = "qcom,sm8450-sndcard", .data = &sm8450_priv_data},
>>   	{.compatible = "qcom,sm8550-sndcard", .data = &sm8550_priv_data},
>>   	{.compatible = "qcom,sm8650-sndcard", .data = &sm8650_priv_data},
>> diff --git a/sound/soc/qcom/sdw.c b/sound/soc/qcom/sdw.c
>> index 6576b47a4..0be743cec 100644
>> --- a/sound/soc/qcom/sdw.c
>> +++ b/sound/soc/qcom/sdw.c
>> @@ -4,6 +4,7 @@
>>   
>>   #include <dt-bindings/sound/qcom,lpass.h>
>>   #include <dt-bindings/sound/qcom,q6afe.h>
>> +#include <dt-bindings/sound/qcom,qaif.h>
>>   #include <linux/module.h>
>>   #include <sound/soc.h>
>>   #include "sdw.h"
>> @@ -41,6 +42,8 @@ static bool qcom_snd_is_sdw_dai(int id)
>>   	switch (id) {
>>   	case LPASS_CDC_DMA_TX3:
>>   	case LPASS_CDC_DMA_RX0:
>> +	case QAIF_CDC_DMA_VA_TX0:
>> +	case QAIF_CDC_DMA_RX0:
>>   		return true;
>>   	default:
>>   		break;
>> -- 
>> 2.34.1
> 

