Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F532F7F0F
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 09:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781515886; cv=none; b=gfIz53uNSaNNyz/PIZ2dRxaMlbasmdsKDUIGJ65jf7EF+wmPHbp9m3V+wCMjod4a/X+MmjXFY7BaG3z93ZtfVZumvzt+KsQ0hWXkuAu69EozMaaJcwcQNn5qyt0UIxaz/xWBuELKxcrK0tD3z7Axv1VTnGutBEXXdmZRl0mL/wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781515886; c=relaxed/simple;
	bh=Cpago3XowY8+PVSiTBvoqVrYD1zFelIovz7BdpMNZQo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=sNgXjYNEmu0ue5SJNrQVbsAmF9kJ/u9UoRLEL3wUe/kmuI1J0r9MdvSUvieRnj9lpDJ28lfhgTarPJ5ZRTmOTWI1FeEsh9JDDjlGsyZAjpJFyE0tTB4OpjLQm5pZgDUvOqfA/afLFpK2yIjdskREdrSCMap894oXJu7sdvmryyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mvWhqZpr; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mvWhqZpr"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490acbb0f89so19981805e9.0
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 02:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781515881; x=1782120681; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LVG0gqQR+AbQ5MBVwgwnI3Wb6LtNeXCB2chKJo0Ac3s=;
        b=mvWhqZprmtxbNd+ppX7kvxUBZGzebyfHRcw+SzKPn8bC/6YN/sBxLLXaUEyQeZGAsr
         2PEQo6TRQxw6u781cy9RQ6DQWnwAHsCAxwExTIBeLs4pL2Qou62AYH/Dg8zJSEM7KuDC
         nF2sCr3LnIBojy6Vf0PLE71t+EZ9ERBG3VBAXN8kk6FkNiasxEPXG+BFeHoUOj0ScgDo
         CbRtxH+8QG/XzCd8Wyt1RrTo1PhZ59R60FQUcxRjimNQvLIRP+yyNfM1S9kwaMlmBTOu
         SaSo9XEAjNrVAS8zheIPp7+eILZJVYbxdgiHL2xZleFGI5ZyxWL+/HBRe0P9R8O7qor9
         RMQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781515881; x=1782120681;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LVG0gqQR+AbQ5MBVwgwnI3Wb6LtNeXCB2chKJo0Ac3s=;
        b=dDSQe/LrAnz/HHQNH9bDqGHDc5P0+8eEj8uiLCCaFxzbEK5v2gaBGow8fFo1ayylWA
         Bw4oIr8rYtYHv6QD/0Damsh+PdzCzTZolT0HuapNL5gdX/3H1yl7lguQAfjI8a6A5/gd
         dcI3ROe7MkR3I8J2BwWlM/HgYm2zhv/4FrZs9r7uS9QkmjGr88mNqXCeQ8fcePjJPX5g
         U0lkEPr/FZAB6vi3Y125hINWJjiGXXA8y+bjonNNE0Rp2cMcfmNxmHfDXKvinvm/bhif
         Ml5hw7N2x6p11tmGjUGj28uRYSbbTN/21MmERtrs2J6YjqWv1ugGaO6I/n7oGKERw1LV
         Oofw==
X-Forwarded-Encrypted: i=1; AFNElJ9pZzP4UWEmktZxgyuegxy+9thBhaNBSE/mj5OyND74i4L3rgduGWpgYD6Nd8DWtQXSzvWI+4hxnALT@vger.kernel.org
X-Gm-Message-State: AOJu0YwxmaEtllgxZrErH9QVNHAUhR99QYKPz6ozRJiuhbjV5yZSl9aV
	wTi+ywXJNqxX1htHntNdREmw41uPz7DC5aVN2Nei8ZBHC9KmjcQwSzBf+FAJTBkbE/U=
X-Gm-Gg: Acq92OHhsklEsDcJCozp1xk2OwNEtPHICw3jUlQJgFEfpCUqBmsuPc4O7bRnOOnbCyf
	49Or0k1wETi1gGlUxefazBtchpVBCDDlNEmncEJLdQVRXVkjJi++zpVBHN2evl/goh6u0qXAZ7G
	Ks+g60uxeBZcIjBlod+4edsmwoxsIcAJbA7td5K0dqO6wMOlCV2AeHQyx/RD7qFTJP0K+fgtiaU
	RRNbc8l2f0+GTVOk9nrYP6UzBd38ANGIi41PNJ8ig5LykPzioPJLgu2Yxvj+DEm1azHjQgbEq8Z
	RO46OPF1B6GM/X2SYFmmSz2r+kEPHrJnZ/kB9umwlH8YMiFSkqMdKUGhY/clsjREg0twGjhcvwD
	y1TD5bbqz7OJflNSSHu7GDj3CvcU8MHHHssDdtBYqyrDWguxE6bgXnhFOIfYYarPimix8vstigH
	EDSDBF+83aTz9snN5w/1vEj1AE4Y2cy7aiALU6CxB/89bhw9sOtHp8+oVg3vI5NjR+rDZI3WVUO
	8vrtgk=
X-Received: by 2002:a7b:cbd3:0:b0:492:834:24a2 with SMTP id 5b1f17b1804b1-49220095624mr77804975e9.16.1781515881269;
        Mon, 15 Jun 2026 02:31:21 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:fdaf:c588:880d:106a? ([2a01:e0a:106d:1080:fdaf:c588:880d:106a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f264333sm33319260f8f.4.2026.06.15.02.31.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 02:31:20 -0700 (PDT)
Message-ID: <a5a957d0-a40c-424e-9d6d-622a4f624343@linaro.org>
Date: Mon, 15 Jun 2026 11:31:20 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/4] ASoC: qcom: audioreach: compute active channel maps
 from channel_map
To: Srinivas Kandagatla <srini@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: kancy2333@outlook.com, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
References: <20260610-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v1-0-18bb19c5ca22@linaro.org>
 <20260610-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v1-1-18bb19c5ca22@linaro.org>
 <937aed10-9ec6-4ca4-bc60-db892121a416@kernel.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <937aed10-9ec6-4ca4-bc60-db892121a416@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/15/26 10:38, Srinivas Kandagatla wrote:
> 
> 
> On 6/10/26 8:41 AM, Neil Armstrong wrote:
>> The Qualcom SM8650 based Ayaneo Pocket S2 gaming device has a set
>> of 2 WSA speakers connected on the WSA2 lines.
>>
>> But the Audioreach DSP only handles WSA2 in pair with the WSA
>> interface by using the upper bits of the active_channels_mask
>> for WSA2 and the lower bits for WSA:
>>
>> /-------------------------------------------------\
>> | Bits  |     3    |     2    |   1     |     0   |
>> |-------------------------------------------------|
>> | Line  | WSA2 Ch2 | WSA2 Ch1 | WSA Ch2 | WSA Ch1 |
>> \-------------------------------------------------/
>>
> No, this is not totally correct, if the setup only has WSA2, then
> channel 0 and 1 should be WSA2 channels.
> 
> What is the backend dai id that is in DT, it should be
> 
> 	sound-dai = <&q6apmbedai WSA2_CODEC_DMA_RX_0>;
> 
> I also noticed that you are using
> https://github.com/linux-msm/audioreach-topology/blob/main/SM8550-HDK.m4
> which has WSA as backend dai, that is not correct, you should have WSA2.

So I did try that, and DSP would error out when using the LPAIF_INTF_TYPE_WSA2,
but I'm retrying from scratch right now.

Thanks,
Neil

> 
> 
>> Setting only the WSA2 upper bits is perfectly valid and
>> functional but the current Audioreach code builds the bitmask
>> from the channels count with:
>> 	active_channels_mask = (1 << num_channels) - 1;
>>
>> In order to enable the WSA2 bits the channel count should be 4,
>> but the lower WSA bits are then also enabled and the DSP errors
>> out when trying to play on the disabled WSA interface.
>>
>> A solution would've been to add a fake WSA2 topology element which
>> would be translated into the top bits only, but it's not clean and
>> add some special exceptions in the generic Audioreach code.
>>
>> The solution suggested by Srinivas is to use the channel mapping to
>> set this bitmask.
>>
>> This works but makes all the other calls using the channel mapping fail
>> because the DSP requires the channel_mapping table to start from index 0
>> and using num_channel length in order to apply the mapping on the
>> active_channels_mask bits in order.
>>
>> So we need to skip the empty channel mapping entries in all other
>> users of the channel_map to build valid channel_mapping tables.
>>
>> This should not break any other usecases since the default channel
>> mapping always start from index 0, and will add flexibilty to allow
>> some special non linear mapping for other interfaces as well.
>>
>> Suggested-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   sound/soc/qcom/qdsp6/audioreach.c | 47 ++++++++++++++++++++++++++++++---------
>>   1 file changed, 37 insertions(+), 10 deletions(-)
>>
>> diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
>> index a13f753eff98..9b80cfa56e8a 100644
>> --- a/sound/soc/qcom/qdsp6/audioreach.c
>> +++ b/sound/soc/qcom/qdsp6/audioreach.c
>> @@ -703,6 +703,7 @@ static int audioreach_codec_dma_set_media_format(struct q6apm_graph *graph,
>>   	int pm_sz = APM_HW_EP_PMODE_CFG_PSIZE;
>>   	int size = ic_sz + ep_sz + fs_sz + pm_sz;
>>   	void *p;
>> +	int i;
>>   
>>   	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_apm_cmd_pkt(size, APM_CMD_SET_CFG, 0);
>>   	if (IS_ERR(pkt))
>> @@ -741,7 +742,12 @@ static int audioreach_codec_dma_set_media_format(struct q6apm_graph *graph,
>>   
>>   	intf_cfg->cfg.lpaif_type = module->hw_interface_type;
>>   	intf_cfg->cfg.intf_index = module->hw_interface_idx;
>> -	intf_cfg->cfg.active_channels_mask = (1 << cfg->num_channels) - 1;
>> +	intf_cfg->cfg.active_channels_mask = 0;
>> +	/* Convert the physical channel mapping into a bit field */
>> +	for (i = 0; i < AR_PCM_MAX_NUM_CHANNEL; i++)
>> +		if (cfg->channel_map[i])
>> +			intf_cfg->cfg.active_channels_mask |= BIT(i);
>> +
> 
> This one looks good, this should be a bug fix patch.
> 
>>   	p += ic_sz;
>>   
>>   	pm_cfg = p;
>> @@ -840,7 +846,7 @@ static int audioreach_mfc_set_media_format(struct q6apm_graph *graph,
>>   	uint32_t num_channels = cfg->num_channels;
>>   	int payload_size = APM_MFC_CFG_PSIZE(media_format, num_channels) +
>>   				APM_MODULE_PARAM_DATA_SIZE;
>> -	int i;
>> +	int i, j;
>>   	void *p;
>>   
>>   	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_apm_cmd_pkt(payload_size, APM_CMD_SET_CFG, 0);
>> @@ -860,8 +866,12 @@ static int audioreach_mfc_set_media_format(struct q6apm_graph *graph,
>>   	media_format->sample_rate = cfg->sample_rate;
>>   	media_format->bit_width = cfg->bit_width;
>>   	media_format->num_channels = cfg->num_channels;
>> -	for (i = 0; i < num_channels; i++)
>> -		media_format->channel_mapping[i] = cfg->channel_map[i];
>> +	/* Convert the physical mapping to a logical mapping of the channels */
>> +	for (i = 0, j = 0; i < AR_PCM_MAX_NUM_CHANNEL && j < cfg->num_channels; i++) {
>> +		if (!cfg->channel_map[i])
>> +			continue;
>> +		media_format->channel_mapping[j++] = cfg->channel_map[i];
> Each element i of the channel_mapping[i] array, describes the channel i
> inside the buffer where i is less than num_channels.  An unused channel
> is set to 0.
> 
> For some reason I get impression that user is trying to set a 4 channels
> instead of 2 channel.
> 
> Can you fix the backend-dai id and play it directly on WSA2 instead of WSA.
> Or was there a reason for not doing it otherwise?
> 
> --srini
> 
>> +	}
>>   
>>   	return q6apm_send_cmd_sync(graph->apm, pkt, 0);
>>   }
>> @@ -1080,6 +1090,7 @@ static int audioreach_pcm_set_media_format(struct q6apm_graph *graph,
>>   	struct apm_pcm_module_media_fmt_cmd *cfg;
>>   	struct apm_module_param_data *param_data;
>>   	int payload_size;
>> +	int i, j;
>>   
>>   	if (num_channels > 4) {
>>   		dev_err(graph->dev, "Error: Invalid channels (%d)!\n", num_channels);
>> @@ -1113,7 +1124,12 @@ static int audioreach_pcm_set_media_format(struct q6apm_graph *graph,
>>   	media_cfg->num_channels = mcfg->num_channels;
>>   	media_cfg->q_factor = mcfg->bit_width - 1;
>>   	media_cfg->bits_per_sample = mcfg->bit_width;
>> -	memcpy(media_cfg->channel_mapping, mcfg->channel_map, mcfg->num_channels);
>> +	/* Convert the physical mapping to a logical mapping of the channels */
>> +	for (i = 0, j = 0; i < AR_PCM_MAX_NUM_CHANNEL && j < mcfg->num_channels; i++) {
>> +		if (!mcfg->channel_map[i])
>> +			continue;
>> +		media_cfg->channel_mapping[j++] = mcfg->channel_map[i];
>> +	}
>>   
>>   	return q6apm_send_cmd_sync(graph->apm, pkt, 0);
>>   }
>> @@ -1127,6 +1143,7 @@ static int audioreach_shmem_set_media_format(struct q6apm_graph *graph,
>>   	struct payload_media_fmt_pcm *cfg;
>>   	struct media_format *header;
>>   	int rc, payload_size;
>> +	int i, j;
>>   	void *p;
>>   
>>   	if (num_channels > 4) {
>> @@ -1166,7 +1183,12 @@ static int audioreach_shmem_set_media_format(struct q6apm_graph *graph,
>>   		cfg->q_factor = mcfg->bit_width - 1;
>>   		cfg->endianness = PCM_LITTLE_ENDIAN;
>>   		cfg->num_channels = mcfg->num_channels;
>> -		memcpy(cfg->channel_mapping, mcfg->channel_map, mcfg->num_channels);
>> +		/* Convert the physical mapping to a logical mapping of the channels */
>> +		for (i = 0, j = 0; i < AR_PCM_MAX_NUM_CHANNEL && j < cfg->num_channels; i++) {
>> +			if (!mcfg->channel_map[i])
>> +				continue;
>> +			cfg->channel_mapping[j++] = mcfg->channel_map[i];
>> +		}
>>   	} else {
>>   		rc = audioreach_set_compr_media_format(header, p, mcfg);
>>   		if (rc)
>> @@ -1243,7 +1265,7 @@ static int audioreach_speaker_protection_vi(struct q6apm_graph *graph,
>>   	struct apm_module_sp_vi_ex_mode_cfg *ex_cfg;
>>   	int op_sz, cm_sz, ex_sz;
>>   	struct apm_module_param_data *param_data;
>> -	int rc, i, payload_size;
>> +	int rc, i, payload_size, j;
>>   	struct gpr_pkt *pkt;
>>   	void *p;
>>   
>> @@ -1284,14 +1306,19 @@ static int audioreach_speaker_protection_vi(struct q6apm_graph *graph,
>>   	param_data->param_size = cm_sz - APM_MODULE_PARAM_DATA_SIZE;
>>   
>>   	cm_cfg->cfg.num_channels = num_channels * 2;
>> -	for (i = 0; i < num_channels; i++) {
>> +	/* Convert the physical mapping to a logical mapping of the channels */
>> +	for (i = 0, j = 0; i < AR_PCM_MAX_NUM_CHANNEL && j < num_channels; i++) {
>> +		if (!mcfg->channel_map[i])
>> +			continue;
>>   		/*
>>   		 * Map speakers into Vsense and then Isense of each channel.
>>   		 * E.g. for PCM_CHANNEL_FL and PCM_CHANNEL_FR to:
>>   		 * [1, 2, 3, 4]
>>   		 */
>> -		cm_cfg->cfg.channel_mapping[2 * i] = (mcfg->channel_map[i] - 1) * 2 + 1;
>> -		cm_cfg->cfg.channel_mapping[2 * i + 1] = (mcfg->channel_map[i] - 1) * 2 + 2;
>> +		cm_cfg->cfg.channel_mapping[2 * j] = (mcfg->channel_map[i] - 1) * 2 + 1;
>> +		cm_cfg->cfg.channel_mapping[2 * j + 1] = (mcfg->channel_map[i] - 1) * 2 + 2;
>> +
>> +		++j;
>>   	}
>>   
>>   	p += cm_sz;
>>
> 

