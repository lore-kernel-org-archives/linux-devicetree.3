Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF21374198
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 21:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789765255; cv=none; b=KOdW542EmHyyla1uzh7R+dYooYMhdCo36bgMaQbzV6j9vZSKTZw5ZZRwudeqQ042s9ho3NEFS48jzdVyxRUj4Vl0laDPhwOrI1c5rhJanXcgT5gvh5bN8TKDjFu6ngUwLvpMiuYQGeawi4T1zRFzBBRBxR88TP6cgL/hd+1GX4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789765255; c=relaxed/simple;
	bh=M88bPIZ6JBhfra4C0yG2FP5BgCRpCg0pD9q2rJygXxA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cM5p6AwtPBhls+Ioz9fR449wMWti09Cqzh1joKivcfA75Oa3ASpAGFeSe0Ge11adpI9BuwCuqJ5r45FzaIjqjdJCzd/LTVSzQEE7zYjKBuALp75Zk4rrvNqPoqHXuqNmZldIM3RV9kf3F8zrQeukF6hp4AFoXbJtqAf4o8g30DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LnH5547L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ixcoDo4s; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LnH5547L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ixcoDo4s"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IKEcPL1122648
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 21:00:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+74vVhIAlUrLGO9XQ41n/9Wrffg94iCHFJHxKjYxQpQ=; b=LnH5547L+sCuvqss
	4wVFVEyWtknBP6UMoeA6NUIkR1iDPsWYZCRXGUtQQ50ruatV+Bs5ehbHiH7F0O38
	AOl3qHdWlHbdQm4eHKc0N8UAak8hbnBbvYyUD810ST6UINfXyo+adeWmbW8FVAxG
	pTmMk8NCushBUZgWkWdEKIjROjqHGrDItubNmNxsIQHYP74r3f5IFp5vspLxxp2x
	YnfH+KlQ4uRye9YT+z+utXR0FBTI6zEj5FhYR8QflZxpuEz2Y4SG0TqDygvYble/
	SNUiv/PlMOh91l2TTywPetDxgPM6OmvgSEHzBzhOZgHT6IjG7Q9vGEE4ezF8t9is
	TVj1FA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsa6mrn5s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 21:00:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ae8e7e546so257401585a.1
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 14:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789765252; x=1790370052; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+74vVhIAlUrLGO9XQ41n/9Wrffg94iCHFJHxKjYxQpQ=;
        b=ixcoDo4sRWgaVQ3xVOW+vrQm8CFMKmcljTSeAV7u00+qLOMJOkMMa5ZqC9DWf+boDR
         +bikWbHz544s2GHE++o+z7Xj1OFn2MFqvuReEgn21bD6RFrkVWA889S65MgQvtQZd3KJ
         vYKHAsED33uBUL0pP+JN4/MZz5OyVP/ol2r+0HXJOBqJB2VVjKi8kzTwywWU8O2Sjuk9
         aLavAYa2nfcfWF/pvRc2HRovxN2d2+/16wLVS4uFmSBZ61lZPrjLK1ztlWnm6jz5pDIL
         1JfEbebu9QjnnNkdAvcwJND8+0rdeFLbjeDAg8ZMLuRg85eJCC4GuvYn7D9r0UwKnI+A
         1DyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789765252; x=1790370052;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+74vVhIAlUrLGO9XQ41n/9Wrffg94iCHFJHxKjYxQpQ=;
        b=m/SKdd087Rl9fKhx156G5dgKmWtrxqLnK38KZfhsCKwjUGarZuOrugVWGdXRZt71FG
         MVhC/n6Z4HFuOlX3tFGccHejzXjmhOeSmNo3cLi5FrKXHsPD+aDA3SMnEIDbfZfjQwAM
         55/L4W6v0T17vtFwYGef9yCPkyPUqFwJWjZ5GQo6BOHgxgHesdS7bTGFxY4eO2A/p2o8
         j/IkzRWKzOuhpIVs0NW+UpZuGIoJbrWPBNa/8cdwT0R5gwg+R2goYzmvkLg8YHD2akXq
         MiLtLONISjjETUdpS5c9YEz5FSCn0s+u17adRrFzwowcwXqjwST7o9fUHUQ7knjMubF+
         QSUA==
X-Forwarded-Encrypted: i=1; AKwUvBwEM+ZlNpsR0px5O93HSGe8NXGMMshTmSBR2VL7ARgKb77YHIkkWq3CNTjOcUxwm1iG142Ek9pwZxxx@vger.kernel.org
X-Gm-Message-State: AFuF++kdf0t/A1yzAsTV/td3p6BvUtMXtHyyvOR4cj49z9GZQQdlDsyn
	26n3iS/jLJcvoXij1A5oCwdOGeqld6fhm6PMDoGsFgDSECL280WqwMcYsXquKZeQGhfaJlFRBaz
	3EJ2A+yekXK872Pbiw7RWFGYq6dVh2PGkpbfp8XXdEj9Dyy3XcqWt/630DdRwEk+3
X-Gm-Gg: AYBFou3+IuxJczj5FYF86jM/1PdYtJizOb8GSCru0loNDwrqCJ0H9ffRRzpP107O9Vz
	x/kNgQVG3DW3pO3lFXifzUJPJ5OXnCUmx33vuEJWiXI7GR5dYCoxZjrt0itGYFCoIfBLEUwko3Q
	SrdBMNHxLNdLp8rr/cP/5onzZMwyOloHwp0HqNG1991ZmKSvPZWU5hkLNm7uGMqA4IwYofcExtd
	5NQLOkzsaU365MqAgxDx4xjwF/cf9/QXXY5UCXZd7RW8EYN9OMY/TQv6sD2kDjaIcd5+qEXhnUR
	8KVjLUdOIDJhqJ75Gt5lAJl/fOmEdykUyJgf1YNFB1nDsh3d3vd5o8N8l25OO7clm80TKa6O3FV
	q+1bwOww5QrkgR/nJxHsZrtueJIg=
X-Received: by 2002:a05:620a:2b8c:b0:93b:d79b:9a55 with SMTP id af79cd13be357-93bdca3b4bemr505546385a.54.1789765251991;
        Fri, 18 Sep 2026 14:00:51 -0700 (PDT)
X-Received: by 2002:a05:620a:2b8c:b0:93b:d79b:9a55 with SMTP id af79cd13be357-93bdca3b4bemr505539985a.54.1789765251390;
        Fri, 18 Sep 2026 14:00:51 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4872456325esm1556457f8f.15.2026.09.18.14.00.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 14:00:50 -0700 (PDT)
Message-ID: <d9f7507d-442f-46b8-95ed-05a6ba351b84@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 22:00:48 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] ASoC: qcom: sc8280xp: Handle AIF MI2S and TDM
 interfaces
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
 <20260918-qaif_dai_id_support-v1-3-ed863c0e5e45@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260918-qaif_dai_id_support-v1-3-ed863c0e5e45@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: A44RZU2JyKjQr0nsKl_eO7v2VNu0f64S
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDMwMyBTYWx0ZWRfX5tHC7/qcgNNX
 ZE/pEMh7N3adAIkbLDeEWLp9T6reBCli/qjDrZDsqkt8Q6vxBF/tBGkJ4pb7Lju5qc1qE4bZ7xM
 JkhSFndvnzhpTRW/oF2oPjXzICr7Alk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDMwMyBTYWx0ZWRfXxdQcp5wvh+0J
 ScLGfwi4zup1oslBGBKqh3zIdCTOU1TpSTwkmbiQwvRIOGSDlQn0zgwY1JOPWoXxTR9EVxYuA9W
 T9wiDJB8PvVTn767B9G2GyaRxU5hx47MxCV45AX/n+jDMn4R1iFHYSMO2CXo5HpeTKR9WguYExp
 /27qKDtVY99buvjNwPP0u2z1mGpG5WeKutpmAgz6J/59yOc5gS7Nl21fuCiGHeuga44ckX8cBbM
 L1/hG/zPpg1RS+7KEe65wwisWZqoGG0dwwX6dDIXocaDYRgPR68yLj8HGSrtlz/e71L3uw+BP3s
 8Nc16fBsoF2D7GklOKQrlCGorbIwTHwcgDpOV0smciMoLT1tOhn7wmNkrJQruzvm0XRSEm/xaql
 nTzV8G0U8tclGw9luKADfnN7jWw5QzHEMOevz/DrtMQ1GMmUqYEV7LiGRrpwSEIW9FhrjjcsDtH
 Yj0cJRt9i84dSSmQLng==
X-Proofpoint-GUID: A44RZU2JyKjQr0nsKl_eO7v2VNu0f64S
X-Authority-Analysis: v=2.4 cv=YYAodARf c=1 sm=1 tr=0 ts=6aada685 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=C9_n30b5a7b0bi08pjYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_06,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180303



On 9/18/26 2:31 PM, Mohammad Rafi Shaik wrote:
> Handle AIF MI2S and TDM DAI IDs in the SC8280XP machine driver
> and extend LPASS_MAX_PORT to accommodate the additional audio
> interfaces.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---

lgtm

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

>  sound/soc/qcom/common.h   | 2 +-
>  sound/soc/qcom/sc8280xp.c | 2 ++
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/qcom/common.h b/sound/soc/qcom/common.h
> index c1deac109f24..18171656408c 100644
> --- a/sound/soc/qcom/common.h
> +++ b/sound/soc/qcom/common.h
> @@ -7,7 +7,7 @@
>  #include <dt-bindings/sound/qcom,q6afe.h>
>  #include <sound/soc.h>
>  
> -#define LPASS_MAX_PORT			(LPI_MI2S_TX_6 + 1)
> +#define LPASS_MAX_PORT			(AIF_TDM_TX_12 + 1)

Only concern I have is that we are now bloating the array. We should fix
this before it gets out of hand.
--srini

>  
>  struct qcom_snd_tdm_slot_cfg {
>  	unsigned int tx_mask;
> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> index 4d48e1012cd4..0876b9be136d 100644
> --- a/sound/soc/qcom/sc8280xp.c
> +++ b/sound/soc/qcom/sc8280xp.c
> @@ -260,6 +260,7 @@ static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
>  	case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
>  	case SENARY_MI2S_RX ... SENARY_MI2S_TX:
>  	case LPI_MI2S_RX_0 ... LPI_MI2S_TX_4:
> +	case AIF_MI2S_RX_0 ... AIF_MI2S_TX_12:
>  		ret = snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_BP_FP);
>  		if (ret && ret != -ENOTSUPP)
>  			return ret;
> @@ -296,6 +297,7 @@ static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
>  		}
>  		break;
>  	case PRIMARY_TDM_RX_0 ... QUINARY_TDM_TX_7:
> +	case AIF_TDM_RX_0 ... AIF_TDM_TX_12:
>  		return sc8280xp_tdm_hw_params(substream, params);
>  	default:
>  		break;
> 

