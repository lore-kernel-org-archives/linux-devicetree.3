Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC52F3CF682
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 11:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774438993; cv=none; b=bEzGz6uMYWCs54qwfJ+n8lQUtYnfCXyhEWCSgRMiSJT6NhoOEeWYC35ZYYA6QuwuXQy+bZiBxgLosHEa2mu6RvMe3CuGltLUICIkCL4JOuQmONPNSjRmReFiPdn/6FbL2yZeT8n8gWtodtsOdEeeFa2JNw64ababM8FUTqoxL6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774438993; c=relaxed/simple;
	bh=5fH48zH09IkfDjS47szybgjqzM3O4lcUiMANwdM083A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UxcEP9gjVHFrMf2l7FtgqiRz8kEEdA0IOqQTYue8kqBaaRbiOu/iBsYtKawL7anXoom6QyrTxcDTwREUkJVQeccgDmIwjvTNwlUih9lNxGLbzg2n/2EvNUk2p6LEKK02rvobUNOPOtrJD3i/BjKsLYj+ovGHpi4nPGUWRW0lshA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pI2fGdgj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JgHwqd5H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pI2fGdgj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JgHwqd5H"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PBGJAu3091219
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 11:43:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8eI1EOuO8NMniEgloRwv0lRXK9ldn1Em1VDfN/l6TIQ=; b=pI2fGdgj7P1Qhgcw
	XXn12Ljn8C1+/tDQ7HXSKM+3mqlG1jNvOpmuM/w5LgGjuRCStTlwmcyEszIu4B5E
	NOtyjAgC/cvIvcZmglREVeMnau68EDYhN+l+XChrNg4XaYByjc4Zgqv/XtFda2wJ
	BfTNIzXhmcm1UVG8HWy+LjYuCS6Jxuf/AK1Y+yVqdYgAbqaXmgDpeV97ZhcxK7kh
	9G923Z+TumVLMcYSa2Re4148jtx9eOKwA7FgQ8qm1UchqL2QheV0hY3u1vVbrvXa
	hHTgdd+U8FIDmDVApnhfUadOZ25z0ZIYniWSkFUqqOJ0gX3hVQ8S403EcKjDROGe
	azcW2w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4dmprc55-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 11:43:11 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b4b81c632so87913541cf.1
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 04:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774438990; x=1775043790; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8eI1EOuO8NMniEgloRwv0lRXK9ldn1Em1VDfN/l6TIQ=;
        b=JgHwqd5H1Y8KOnEeeTTXv906j8ZjNicvT9M9sdiTJs8JSFnwo1lC0qeLnSKd8wfqwM
         JQu4H76g/UoocAv22a4XtU8Jku22xkjPYH+I9m1fXXj/hKG4qaiKOd7VInn0SC4bvRrQ
         agjoEO2ZCMcDeQCV0BzF/BVhyZjjlJm2XsNXJsEh+p1U0UcNtUe7i3gLoz3mQfbxC+0W
         YkcmrBzphaRhpAZSyEoJAtGVJUQQxaDOiGlkwVHSzpAkXYGtjokm+NSjRbij7hv4I7hs
         S4/gtNH6B9fGDJTJ5w9Pz0a0yOtd3ZxaN/Dwi/nTtT8U09TqaGKyJyg+MjT/mkRxZ6Gg
         eVoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774438990; x=1775043790;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8eI1EOuO8NMniEgloRwv0lRXK9ldn1Em1VDfN/l6TIQ=;
        b=RIUXhquRm3shJOpQizhkMNXbpz//YPSp9HTmzImsGzS8btEwZ7Y6MPfTBfBYPLuo6a
         WjV6gx4i8yLlWVL54MxnUIz2xSMXL0MMJDY41gcUVBNUZw+VzJ0Z3HsSTydOieWGaULL
         0SNZUKwYMrBBzEuA+F7JLM74CAKTbQ5VepIxrzm+Oy3iyjG3FusNHNTOj4UKwD2/HZpL
         6rIlHfaXoiI5edXZxAjUG1JDWXvOyiPeKm+BG+LvGPsvRJpuwE69x3lG9GLU2/87Kzhm
         ZuSF64/XM/uGH+4QqfYKoBRoTAermlIwvzeK14iU/xehk9ItWBw3tjNdcLrbejPuhY4y
         mfFg==
X-Forwarded-Encrypted: i=1; AJvYcCWYX6Kzg/j6FBElGLFnLzkXeq/R6I2ZnziuMrQYHRrWmkjiI2VJnDPTUGF0M/8z+lTvpIMkn/x1bskp@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd8p77K+3P/yIlzhQmwbCfZZZiezruL/xmm3yBDr4xzufs+EBq
	n7PiQBtpNsua10ICJ8DGwYGhUL7LQ6m5U5UnCqvcMkSekjQ7psl/UNFqLz/6WSGPTsHurJKcamy
	5cklyVZAQa2RLGYoO+gYMYMeyXBePpLjHw1F+5K7qV0UFOCbxuF8TmNVYua9E4N2W
X-Gm-Gg: ATEYQzwHDA2mfpChK0AQmtt54ak8UgDNJy+ZTgEwWTBQICcRiXi8SSCz28kw0dXH4wc
	EbYstS5y0pyYlOgq4HfBrq6WSfr8KMWGq/hvYxI5soZGBtvXjGT3gj+JD5KAESZ9o7eBlxT5eEu
	C/+1N4OcLBP0mMmoB253ElKN6V+VaMLL5J2UhAKSeoLlL09xuQCkxvfp30uVyGLhFS4dEgPmwRu
	sb7zau+CjgtdzuNN3KKYt4lGBHmH1trq4pXB1/X2FsT5oIPzSET+k5fKowQq8rgbeDvFfyjzsXD
	+psz4aAYxRoG0AYY3Sis3u0ry1qso9mCd/wCMmbig9Yacw5iiBAeauVd+40hUzr1Zw1MVG57lWK
	vrVw+NyMMexQr4kQqmJLBUeiDL4zvv5HhFaKjogz96jpRhiUe
X-Received: by 2002:ac8:4055:0:b0:509:2677:68fc with SMTP id d75a77b69052e-50b80cabfc8mr34124541cf.10.1774438990167;
        Wed, 25 Mar 2026 04:43:10 -0700 (PDT)
X-Received: by 2002:ac8:4055:0:b0:509:2677:68fc with SMTP id d75a77b69052e-50b80cabfc8mr34124121cf.10.1774438989701;
        Wed, 25 Mar 2026 04:43:09 -0700 (PDT)
Received: from [192.168.68.114] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-43b64717e97sm48911817f8f.35.2026.03.25.04.43.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 04:43:08 -0700 (PDT)
Message-ID: <4d5c4953-94c9-441b-852d-62c03fde6554@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 11:43:07 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 13/13] ASoC: qcom: q6apm: Add support for early buffer
 mapping on DSP
To: Mark Brown <broonie@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org, val@packett.cool,
        mailingradian@gmail.com
References: <20260323223845.2126142-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260323223845.2126142-14-srinivas.kandagatla@oss.qualcomm.com>
 <9a9ea82d-e299-4a9c-bb68-f430761387f7@sirena.org.uk>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <9a9ea82d-e299-4a9c-bb68-f430761387f7@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA4MyBTYWx0ZWRfX4extb17DUagu
 Phs5XTHpDfWRSyp/Sh/nAquT60+aNZvXy1l2Lp3694wtSfa92DpTDv+qeIWx7mi7CRrXop6nBjK
 phrN0vTk9pu/kMb43ey5W+Xy6XgZe7eqYiIBmbkc/qbWV4o9QN+THTU8v0mVQDd61hwnPTNSZTk
 p7PlyCjTmQVvbvWksJEi21ruH5sweCImhkc4Zo9GoUxh2ictMJWMzT++0EagvcDyfFM57cNB1Hg
 tr0GX7NGb/Utih51NG4cJ6zhNWdi/yaCsORvzedVG3JmrZWXqOsf1TtxNbuROZ1prrC+aobneBA
 xeGIv8ZNzrDxLC0SUnfD2alLchK3uVx75x/RdPx/a1L/aLCIKncWM0FKOl5U9VNV4rwfvgE+mCh
 YdYx4+luiUJGBNEf1+0T8rsAlwXNijVLgQIRMM9qNktFYJDw6PnMoQbr+KZ/YVDOhQE9BAH5/fA
 2XPjsGrWbAahH+bcwiw==
X-Proofpoint-GUID: yy8jO0fERAGrUn8ve5VuvyDhngYoUHk9
X-Proofpoint-ORIG-GUID: yy8jO0fERAGrUn8ve5VuvyDhngYoUHk9
X-Authority-Analysis: v=2.4 cv=O7w0fR9W c=1 sm=1 tr=0 ts=69c3ca4f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=Ty_003Nu86zhfu2WEF4A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_04,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250083



On 3/24/26 7:09 PM, Mark Brown wrote:
> On Mon, Mar 23, 2026 at 10:38:45PM +0000, Srinivas Kandagatla wrote:
>> Buffers are allocated on pcm_new and mapped in the dsp on every
>> prepare call, which is inefficient and unnecessary.
>>
>> Add new functions q6apm_[un]map_memory_fixed_region to map it on
>> to dsp only once after allocation.
> 
>>  static int q6apm_dai_pcm_new(struct snd_soc_component *component, struct snd_soc_pcm_runtime *rtd)
> 
>> +       if (pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream) {
>> +               substream = pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream;
>> +               ret = q6apm_dai_memory_map(component, substream, graph_id);
>> +               if (ret) {
>> +                       if (pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream)
>> +                               q6apm_unmap_memory_fixed_region(component->dev, graph_id);
> 
> This looks like it's handling bidirectional DAIs but...

TBH, we only have one dai and one direction per graph, this check was
added for completeness.

We can not have bi-directional dais, as all the be-dais are uni-directional.

> 
>> +int q6apm_map_memory_fixed_region(struct device *dev, unsigned int graph_id, phys_addr_t phys,
>> +				  size_t sz)
>> +{
> 
>> +	info = idr_find(&apm->graph_info_idr, graph_id);
>> +	if (!info)
>> +		return -ENODEV;
>> +
>> +	if (info->mem_map_handle)
>> +		return 0;
> 
> ...we have one memory map handle per graph ID, silently ignoring
> attempts to add a second one?
there is no second one.

--srini

