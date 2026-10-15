Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2044A4840
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 08:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792054705; cv=none; b=cJVKknage/5WF5ym0KFgPydqKleSpGkUDt/3fbYOp7t8QsS5/p3FCjidQAfDaTfpJiwFIEodBXwr+PIRvPCbyKmAMAobu/KrZ3AUMJAIxdEt2V1zCnf3jIy2AeD5fwhuDx3m6FB4Rx+LafkiSStDXZeYDgfdJyQ+pKN+Xu3TX9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792054705; c=relaxed/simple;
	bh=7/nbnKW2nnSc1ficaU3jxNOx9sR8BYEaxPIvZsMJXS0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e7svBjURIGz0gUAK8a7bXtSjUYOQtFrXptfnJ1vZ9KinTkZ29pbkq0LKiCgsXKTxChxpGf3+mvBzdEYDRP4L++vdOPAkdQzMUqLYd6IzVqariH9QaWhXI577tErl6Mo2EAagGZPxsbqhOv31noeSD+XKd8p0jIzbOSr9LNm/3as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EhHaThTG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ggf/v8Yj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EhHaThTG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ggf/v8Yj"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F6rQ5b1682876
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 08:58:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xzOVLDhYNiCkQyabQc2njLlkkws8G7Pe3EA53/TYwAE=; b=EhHaThTGShAQNBVp
	DJYfPNHjEN4GPhS/1KePXbs69A8LhyZRyAALD2YuXjw4V1yYRQAHrWLLTlZh1HAz
	ZyerWizZH/8tVmmaoSFh48lEJtwtXG7134jOShVAt9Pr0mvPZTXhfM74Y0OurP9s
	L/uVyhSctgeG/SM/8TaTaHMl1DrqnUDQXxtRJfUDjjI7KmbkmlmcpbvmAHa5R3S5
	wGOvXYSPDKtQw/ezh0nhDe2lR81wCmwpjld6QE79qqfifSGoQ3CD/nCyrEskazQn
	ue7hqM0GwY8neJlsNsxtzNDvQcSU1bunfbkCNv3OQAprQOP+mbpyuS8HIwmEo6dC
	SoExNg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hacb03nrv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 08:58:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93c5ab5c136so865677585a.3
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 01:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792054700; x=1792659500; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xzOVLDhYNiCkQyabQc2njLlkkws8G7Pe3EA53/TYwAE=;
        b=ggf/v8YjqjWPSRyESbucep/QDMeiZwDotnlUHYjw1tfLfYzlAdBP0r5dJu96f0uEw5
         NfmRhIUN2GPejuBry/+S/Rd3wZUgVktTqaBlS6j85qmnxz7ALgl821rnSINYf9nDw9n7
         DYo6mHqgb/iJms41P0mb86RfCDcwLIRtERPUo8kDFqh3kkxPH86CoWbLV12ALqE68uCs
         P+mUVtMFPq7wWc9mhJhUEWl/emfC8D+yPzyjMI8ZbgCBiduIRmGERizXO5UCdS9RtIVL
         XiVpD/2/3BvOJDiro2bVnK3RVY8sDYXjkgDSmYawWEh3w4O5CJHFouGxqt9JUu3Cq3ia
         iHVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792054700; x=1792659500;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xzOVLDhYNiCkQyabQc2njLlkkws8G7Pe3EA53/TYwAE=;
        b=2K++nlHJ8GADrQ+KIcWzd/Hvk9cf7Ks8Xp4ukQn+pR2gJ1O9Ot74Au4/XghC5TCTfy
         Z8XIEbojxcI0dkQrRvk6A2ew3oDA8p6khrrDp3EJvV8DJPYeTFqDsFtGkd9OoKjShtVj
         xp1G42XrY0OljVROw4aXvNphz86x22P9laqwu6ePmhZq7IKgMHyeb5JOb6RhB6OaiVOT
         a3j1IFbtunVC+A40nsHjEBMnRrFyUDpxaCRh665RXWieCdg1LjyXVcMxLhTLl9AwEpIZ
         Ytn+BBLAcVL2/LmZPW+ejU8XyVBHyC0Z5njGomN1mo4SzXNCGCKugdcPFrW9ozzzzTx7
         ASLA==
X-Forwarded-Encrypted: i=1; AKwUvBxVohFnF8qC7haY4HP3DdHSPGnhDUeRc3adNlzx0y7j7Wsf/6XG9+4/zaMnJ2xLsULUrjgdwfVbIPUZ@vger.kernel.org
X-Gm-Message-State: AFq9FYIIXQapwT/GnNLwkkpw0PxshtODKJL5KqtYBqsveGzupa1YiQ6m
	4v5FBHfMCMRQW+RBr5KN9DXp6NdCEZ6PYTbYB+l6RowPUtkMGjyVtx87ZeY6zOHZvGXvUE4Cfzp
	L7UEUmatB3OQXB2V5s7L2NYDjsgGGCcNrF+pRt3cvk/j6XFBCECVM98IDlM2j06B1
X-Gm-Gg: AYBFou3XKhVUPbeVyO6p/JN84aB7xYt6QWYl49TrQ6OiIiV48KyVT3pyIi+rX5zCaDh
	63Acp3J8GknZIa+RFcsfVi4pyI2SSEX3iThHeq6iGHw3Z6naus/2RzDQlAwGxk28fsUBAwPgoPD
	dMJtPK1zA5+jF1vyzWs4oybDFNEFn81Qw8c9J0MzHw3aGQC1JR0u/ZRScwgHbFW9392MltbrXSy
	G4NzqS+2XBbAWpvmzkz711+3VvhrDxnnpR4YZjdfQoY/o362u3CrFiZNaTnVASKtL/wWoOUCY8t
	qj4iCxnMiKRBNdkyJFUl6hZd0LPCf2IQFXh0ONp/arXAToagaBEunxUVCxNe0JgdDofwnurmDcL
	Txvfy5W6RGQDZpwxLDJf1ML2d7A==
X-Received: by 2002:a05:620a:7106:b0:93e:95ce:53c7 with SMTP id af79cd13be357-93ebd0c08c4mr2959767885a.4.1792054700192;
        Thu, 15 Oct 2026 01:58:20 -0700 (PDT)
X-Received: by 2002:a05:620a:7106:b0:93e:95ce:53c7 with SMTP id af79cd13be357-93ebd0c08c4mr2959765385a.4.1792054699680;
        Thu, 15 Oct 2026 01:58:19 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1bd68144fsm40551475e9.4.2026.10.15.01.58.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 01:58:18 -0700 (PDT)
Message-ID: <690b96e2-af53-41ed-aefb-0475f9b48abf@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 09:58:17 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 05/10] ASoC: soc-core: Add snd_soc_of_xlate_dai_name()
 generic helper
To: Harendra Gautam <harendra.gautam@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
References: <20261013-b4-qaif-shikra-audio-v9-0-f3022e28f2fd@oss.qualcomm.com>
 <20261013-b4-qaif-shikra-audio-v9-5-f3022e28f2fd@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20261013-b4-qaif-shikra-audio-v9-5-f3022e28f2fd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VKpIDNPX c=1 sm=1 tr=0 ts=6ad095ad cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=sFjlhk_xisyrceGg6AoA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzNSBTYWx0ZWRfX3XHwo9LgAVuu
 5OLvdApkWjGOJp/KJPwkWqNYpY/tSGFl6AYmo0ltsa7gb/gNQVzcF7TtjHfC6LRTO0DmAejxsSJ
 hudw5WRYnXMmEf1TISWOKph6Rof11xI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzNSBTYWx0ZWRfX0JPm7i0xivGr
 2UdPjMduOVa1ECVxlxg1YBt8fYLwvMtnBYZlpASJuNFKJONW5s8Pp2GwHuI+OIfHTXE+6Q8sYa1
 NkfWtncxHUZ5Z1l5FqEj0Zj8vDWdGCTTHpxTeisjb5jWXiGfQN1a3Qyfr7a8j/tMX4gqxc3FLa9
 Hh5mwRa74ASbLsQVP3swBWao+g3ALf26AIckQfN6S1YrQUMqQA7e55mbneacsmPTRJ/MPLPK6kJ
 roBT7fpPEz8mV9B9gaB3V+BfNGjnzmdCeqitmRTWPG2Xm4zpOoLBcEKK0GsAqH6sN32on1Nw0kr
 dQ1pOpwuWlzNmft24SD0PE3WICSkIkiFjpyDFZV7XEx5MAtdi2YT/InY1Zz/NCHz3e2KPdqAKQU
 zeRqG5WMHVESEwHMhzPzAKEvlpDjf9r+yREwTvZqNDQTMsiBLyLjYTcfbE/cfrnzUTt4xDQDEdS
 0EG3cGuCxe5Tx8Fo0Sw==
X-Proofpoint-ORIG-GUID: xCFoJFokFqZLOodZPJ9g-GvJTKn6jZCq
X-Proofpoint-GUID: xCFoJFokFqZLOodZPJ9g-GvJTKn6jZCq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150035

On 10/13/26 6:51 AM, Harendra Gautam wrote:
> Some ASoC CPU DAI drivers need to resolve a sound-dai phandle argument
> to a DAI name by matching the argument against the component's DAI IDs.
> lpass-cpu carries a local implementation of this lookup.
> 
> Add snd_soc_of_xlate_dai_name() to soc-core.c as a generic helper
> that can be assigned directly to the .of_xlate_dai_name component
> driver callback. It iterates the component's DAI list using
> for_each_component_dais() and matches by DAI ID.
> 
> Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
> ---
>  include/sound/soc.h  |  3 +++
>  sound/soc/soc-core.c | 33 +++++++++++++++++++++++++++++++++
>  2 files changed, 36 insertions(+)
> 
> diff --git a/include/sound/soc.h b/include/sound/soc.h
> index 553bb7e2be98..6f15086f7313 100644
> --- a/include/sound/soc.h
> +++ b/include/sound/soc.h
> @@ -1329,6 +1329,9 @@ int snd_soc_of_parse_tdm_slot(struct device_node *np,
>  			      unsigned int *rx_mask,
>  			      unsigned int *slots,
>  			      unsigned int *slot_width);
> +int snd_soc_of_xlate_dai_name(struct snd_soc_component *component,
> +			      const struct of_phandle_args *args,
> +			      const char **dai_name);
>  void snd_soc_of_parse_node_prefix(struct device_node *np,
>  				   struct snd_soc_codec_conf *codec_conf,
>  				   struct device_node *of_node,
> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> index 06167a198591..609706733bf1 100644
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c
> @@ -2906,6 +2906,39 @@ int snd_soc_of_parse_tdm_slot(struct device_node *np,
>  }
>  EXPORT_SYMBOL_GPL(snd_soc_of_parse_tdm_slot);
>  
> +/**
> + * snd_soc_of_xlate_dai_name - Resolve a sound-dai phandle argument to a
> + *                             DAI name by searching the component DAI list.
> + * @component: ASoC component to search.
> + * @args:      Phandle arguments from the sound-dai property; args[0] is the
> + *             DAI ID.
> + * @dai_name:  Output pointer set to the matched DAI name on success.
> + *
> + * Return: 0 on success, -EINVAL if args_count != 1 or no match is found.
> + */
> +int snd_soc_of_xlate_dai_name(struct snd_soc_component *component,
> +			      const struct of_phandle_args *args,
> +			      const char **dai_name)
> +{
> +	struct snd_soc_dai *dai;
> +	int id;
> +
> +	if (args->args_count != 1)
This only works with sound-dai-cells == 1, the api itself does not
reflect that fact nor the kernel doc.


> +		return -EINVAL;
> +
> +	id = args->args[0];
> +
> +	for_each_component_dais(component, dai) {
> +		if (dai->driver->id == id) {
> +			*dai_name = snd_soc_dai_name(dai);
> +			return 0;
> +		}
> +	}
> +
> +	return -EINVAL;
> +}
> +EXPORT_SYMBOL_GPL(snd_soc_of_xlate_dai_name);
> +
>  void snd_soc_dlc_use_cpu_as_platform(struct snd_soc_dai_link_component *platforms,
>  				     struct snd_soc_dai_link_component *cpus)
>  {
> 

