Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41663BBFD3
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 17:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791394612; cv=none; b=rBk4stde9tHBSlXLpHM9W5PgrX0brnquc95li8e/rnKO9CAHQ8HJJsZ/5wZ2rGLBdVd66VSstMs0rywGtIGlLxxzTdO2rQAp6oh+T2BKDl1V/gzzo/9FCdGKpfWKCAeidvT7L2GoCFnDZ8xr474eBSQTAZE9eyMWCtdYFjwt1Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791394612; c=relaxed/simple;
	bh=+6NY74n/C5omuO9JoYsGCZJp82CiewUdJckTC2HfRIE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DUViazJms2frzRyU8zplX5Ssx0al4nOl6kyjRX4Kj3gN0XTijbPytjaFHRwGCYN2Monl4Cki3CfIIv4pMQ3R9mOjlhbH6WJ9mUyDRKHhqz6YR/53WsW0tamKR0N2GX8TNdyA17bUSr06i1hRVtnZmw7cVikSJtBC9RDdXEzAPLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GWkuaMYm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RSNngd+X; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GWkuaMYm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RSNngd+X"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697EtVp63646978
	for <devicetree@vger.kernel.org>; Wed, 7 Oct 2026 17:36:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0ppSelj+LbGu462DrTIiLj378C/LDIJk0hCQ7sXm9YU=; b=GWkuaMYmvttLGWdx
	Yhyxy3cHPd8w1tL64rsju7EXYjQiJaEpYJutWTHO00eHVlC1pZ7Fshjrr6O6Co1t
	fOAZ3B/3qSpZatwz9JwsVmkksLP3/EbGFfF5rjx8wPAIA0acOi5DIixp9DXcoro/
	IN2ZfK2ug/Cz4wRfTZrNXkP5CbqZGDvB76CbjhpKXo57iUP7ZCjemJW2BhDnZdSb
	JAdwkmD1wG3cxrNilnYkTVWMuqpv+oJ/Zq0AXrJPaxykgRePQ89yLoHAWW/Jf+1Y
	SYOuB8gXGtY7E3tMCfN7CRnQBbbDRomEVPhuWHfs6KHYXoJWwrWbDCTvr4FGk8sm
	7GNd7w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c1s3cwu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 17:36:47 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-88d2d26a8d5so2367803b3a.0
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 10:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791394606; x=1791999406; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0ppSelj+LbGu462DrTIiLj378C/LDIJk0hCQ7sXm9YU=;
        b=RSNngd+Xu3dFgEeU5yB01VO9KNwKewCC68NxECUqaLaUITg16ulgaZPdYqasGFeopt
         H1pyt3VlK8ZAGXLpPLTnI9m8LPpm8nbqM+KGK9wrC9+4drTPX6aZgrz1ds13jjk75Nxw
         8+VFK/+oz8PAaq9+SN8JA01Qy7SV4z7wNzrZNwmQ4dGFLVo8cRWl+VbpvDzDUOogQo3U
         YIV8NUI4lCb77lMJNP9SX5+94CMh4MtUFv2r4tuu/Cz13cacWsBy1Yx8w67qMkzuZa22
         pPxJfwkDWdML+siwKf+z4DC4djJaNAU6/Wxeg7pJDdBIZOOlh9BK6W4Q4igi5Titz648
         dKNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791394606; x=1791999406;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0ppSelj+LbGu462DrTIiLj378C/LDIJk0hCQ7sXm9YU=;
        b=Imj1Unb+WOpXvhY8Ge362qPE1LV2AaCKkYxnAcP646RPpvWsuz9L5uI7MaL9GrdcTH
         QGYm1s39B3qJbxRgnPyHFjGChdkTh4j0cKS5Ep3W/c2mq8YIZo095Qg2yUyvG/gZC0QI
         xSJwKmH5KivnYcfI8WwOYCrONT/F89GEa7cBCczkjaSdnifCq0jF+7fhg0z/kHlFtl5f
         lzeQ+GikNMWvlxX20/tM2r58N5Hww1fSOLrHIVSb7Be7KR9RpjoANZzVDcu6/+oae/XP
         yeSw+CGeH0wwmtfTaUzHxjCGMcGoc5Y+6CDVhYWf/7UcopGwC9X+JCfp3HZSBtJ1EeFS
         PoZg==
X-Forwarded-Encrypted: i=1; AKwUvBymoRPGAdB2AUMxlWNz+MqC/d8dVnedTRQFRavXzhxr5TWbpRlAn/MZU2VhfL27jWU92leUSx18vgst@vger.kernel.org
X-Gm-Message-State: AFuF++ly9Dw/cWkhO4jB/uj0kXao9n5yZKoE+iu/U3w/c9DirFXcEuHM
	xBXGGpU8ccFBLBZQmQ8HGz90Ly1hplZOuat4J9KA7BIlHHrTGkqa1WVzle0LqBdJm1vjSaftrBx
	kzPwkmiBiSibc0g//kjQKfQ7qdVJJkz4n7jMMNyw2cukZfNGihgaWIbk3zFo6hz7o
X-Gm-Gg: AYBFou2zRn8ycq3SHn2YjfvpkbCxtJq6xW1yt/UtspAPiW4/PMOIq0QUA8JX/IIM/dO
	b5IVIXGZl+E0tUlIBJTAhRAjUz3huW8OZ6ZwXZViWY/vp/aypsrXreg3NyZVQxmy9mbX18h1Gfy
	ChvRYQKWnalveLPJawF/n52rcZCpbthvBQqBN+qycnAOrKgynasDzkt51G8oQOxcg9TpzsQ1gZq
	fRwnQClOkl+++J2PQqQg6my0dWasUydPnvmHfneq7TrKoxKPlPcbDhVLak+DTfSGo73n7hxD6Io
	WtZYKeUru0qiXCo9JgLOXx7MVClFkjQs0HphqJ4M8SDMhiqUmq1DrOr3tfcPPacqsmCBySikzW2
	mrQBVxe+rKwFn7lAwviCTT8q0vVCG
X-Received: by 2002:a05:6a00:2350:b0:87d:b6d3:256d with SMTP id d2e1a72fcca58-8904434a3bbmr4021103b3a.2.1791394606326;
        Wed, 07 Oct 2026 10:36:46 -0700 (PDT)
X-Received: by 2002:a05:6a00:2350:b0:87d:b6d3:256d with SMTP id d2e1a72fcca58-8904434a3bbmr4021084b3a.2.1791394605829;
        Wed, 07 Oct 2026 10:36:45 -0700 (PDT)
Received: from [192.168.1.12] ([223.230.93.214])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-892bbd8dba3sm616161b3a.53.2026.10.07.10.36.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 10:36:45 -0700 (PDT)
Message-ID: <602b728b-d94e-41ea-bb19-dc8bb3a0e9e5@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 23:06:35 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/21] ASoC: ops: Introduce 'soc_set_enum_kctl'
To: James Calligeros <jcalligeros99@gmail.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
        Neal Gompa <neal@gompa.dev>, ajay.nandam@oss.qualcomm.com
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
 <20261004-macaudio-v2-7-7b47ed6335a8@gmail.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20261004-macaudio-v2-7-7b47ed6335a8@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: uwlUZyohXSidFkt-pMob55x01ndkqAf8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA3MCBTYWx0ZWRfX/f2o7dQ3T4LL
 tQy5CU+Y7tYpaw04LOQvKGdLUC6emd1G4vbHJvBXQWsD5zN8XMDDy/et6lGTZQWEHle2HAghAKf
 9LhgxoIPCJ6neF/Nd4UCDvY1Zl2piIGdOh/aLBUZUz1gOF2j7v2ZTImHWwnI+WMiRTsr5WaViG3
 Joc7MemVWQ1dnGMYIINS7KzflipugQV8haDeWm39i1XEWaHQQjL5zBUeThlxofGf0wP2dubi4Eh
 Vyx5S5NOnisPjOWSwtaWNTOvRA2UE8ztoraqJu+FJ0N3MfSNcoWKc0sUnZjs1z7xVU3x8UIvGoE
 xwzRIBxKc2JpUrvZVhMEEJjNtk+mu8q4aMD+SRbaQMp3RxUmQMtCxd6t7/ApcGk0q/blCjkMZZa
 hq2Lk6zWXX4ZWhTfj4Nro4zpZ6/qCc8o+k+bhAqPoqj7k4DtlUaJxW9z2qTPykS+HLDRb4q7IVQ
 OJul+XiXhftusPTZZrg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA3MCBTYWx0ZWRfX39VoehFBz8N2
 G5oTHXhdUbM5AJhJ1Qik0vZG9aiZHJx/FKWWBnUh3giLpXChDid9Pqj7sKpqMrYosICZtee/Md1
 yBSLARUEgoDvxT0AOxOa63EBecf6510=
X-Proofpoint-GUID: uwlUZyohXSidFkt-pMob55x01ndkqAf8
X-Authority-Analysis: v=2.4 cv=NatzRGD4 c=1 sm=1 tr=0 ts=6ac6832f cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZXy6yrx+fn+bJIgs5eQ1WQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=NwbpVL58AAAA:8 a=pGLkceISAAAA:8 a=xWCIabhjMllZ6jREgyIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=tNWvAHffTtQgx3ZTRG8Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070070



On 10/4/2026 11:33 AM, James Calligeros wrote:
> From: Martin Povišer <povik+lin@cutebit.org>
> 
> The new function is to be used to set enumerated controls to desired
> values. It is something a machine driver may call in fixup_controls.
> 
> Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>

> --- a/sound/soc/soc-ops.c
> +++ b/sound/soc/soc-ops.c
> @@ -505,6 +505,75 @@ int snd_soc_deactivate_kctl(struct snd_soc_card *card,
>   }
>   EXPORT_SYMBOL_GPL(snd_soc_deactivate_kctl);
>   
> +static int soc_set_enum_kctl(struct snd_kcontrol *kctl, const char *value)
> +{
> +	struct snd_ctl_elem_value evalue = { 0 };
> +	struct snd_ctl_elem_info info = { 0 };
> +	int sel, i, ret;
> +
> +	ret = kctl->info(kctl, &info);
> +	if (ret < 0)
> +		return ret;
> +

Could this initialize the control IDs before calling the control callbacks?

The normal ALSA write path does not call `put()` with an empty ID: 
`snd_ctl_elem_write()` resolves the control and then calls 
`snd_ctl_build_ioff(&control->id, kctl, index_offset)` before invoking 
the control's `put()` callback. This helper builds a zeroed `struct 
snd_ctl_elem_value` and passes it directly to `kctl->put()`, so 
callbacks that inspect `ucontrol->id.name` see an empty name.

There are existing enum/mux callbacks that branch on 
`ucontrol->id.name`, for example `rt700_mux_put()` and similar SoundWire 
codec mux callbacks. So this helper should probably initialize the 
callback objects from the target control before calling into them, e.g. 
set `info.id = kctl->id` and `evalue.id = kctl->id` before the `info()` 
/ `put()` calls.

While touching this, it may also be worth heap-allocating `struct 
snd_ctl_elem_value`, matching the nearby 
`snd_soc_clip_to_platform_max()` pattern, since the ALSA control value 
struct is fairly large for stack use.


> +	if (info.type != SNDRV_CTL_ELEM_TYPE_ENUMERATED)
> +		return -EINVAL;
> +
> +	for (sel = 0; sel < info.value.enumerated.items; sel++) {
> +		info.value.enumerated.item = sel;
> +		ret = kctl->info(kctl, &info);
> +		if (ret < 0)
> +			return ret;
> +
> +		if (!strcmp(value, info.value.enumerated.name))
> +			break;
> +	}
> +
> +	if (sel == info.value.enumerated.items)
> +		return -EINVAL;
> +
> +	for (i = 0; i < info.count; i++)
> +		evalue.value.enumerated.item[i] = sel;
> +
> +	if (kctl->put)
> +		return kctl->put(kctl, &evalue);
> +	else
> +		return -EINVAL;
> +}
> +
> +/**
> + * snd_soc_set_enum_kctl - Set enumerated control matching a name
> + *
> + * @card: where to look for the controls
> + * @name: name
> + * @value: string value to set the controls to
> + *
> + * Return 0 on success, else error.
> + */
> +int snd_soc_set_enum_kctl(struct snd_soc_card *card,
> +	const char *name, const char *value)
> +{
> +	struct snd_kcontrol *kctl;
> +	int ret = -EINVAL;
> +
> +	/* Sanity check for name */
> +	if (unlikely(!name))
> +		return -EINVAL;
> +
> +	kctl = snd_soc_card_get_kcontrol(card, name);
> +
> +	if (kctl) {
> +		ret = soc_set_enum_kctl(kctl, value);
> +		if (ret)
> +			return ret;
> +	} else {
> +		dev_dbg(card->dev, "Tried to set unknown control '%s' to '%s'\n",
> +			name, value);
> +	}
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(snd_soc_set_enum_kctl);
> +
>   int snd_soc_bytes_info(struct snd_kcontrol *kcontrol,
>   		       struct snd_ctl_elem_info *uinfo)
>   {
> 

