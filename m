Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794776654;
	b=zH0+xV+2PhFMgwHPpRJocWdmJQ78vpk0OzBFE4Gukylh4QUGOnlppqqSlsfq4bjOrFeH
	 fWtRFPZVh3OH7aeKHgLckt1WxsyGjQL8xAJexdr81ZlUJKbaqp8o7DNcRu0fkbMYtDZmq
	 ihXLizbeaxUAdWnZ6tFtp2r/7LrcE4gppSxKV7q1YFX4X2Q2AVmtS3MurX74wFM5eFoQ7
	 RAMe+Gvrcmbp3qyI+p9xlp+mh6hvnT4KwbVPZ/WaJlBig/xBaLioRDMMG6yiSAmexTDX+
	 xW9NUt4FY10PoGIbRYjPa5WCegs/75z2PT5sPnWIbOK3IP3mIoDyhS+neTukclhjXXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794776654;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dclX5TjXagQdXvyM26xnlyJ5ipiPzjLpHRRtLV+Mu9U=;
	b=q6+otyg/efNcytZ8YafX6Fjou3Ezf8sZfKxn9QMoPdLYx0sPgcZEJLf+jHIE6kPi0kM0
	 wIcg+z3PuTEhQPmYsxO5q4Wqa29nvycnXhvMgAM467JWbe2+I3EPhltRyR3t5zKeUre4S
	 L4ZALhbZZv4vFg0Fa2i0S0tyruNJP89FXslNwNW5VhWi0j8uySubfUfcr3/9yUeATQoBm
	 2yMV03NakZeW/pgioNQ8d1TqtV8sEfwUZm4dNyZ0T+b9N0lcvHxuCdhPeOZbqwq4oOsfu
	 53bXE2Mz7oofhbbpPoC0Fl0cVCGqijniw2uaAV8KhBSpKitOa5kB970gLP0tTpdOevQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hXhbcREU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gbbohgdl;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E731606A334
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 21:04:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E731606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hXhbcREU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gbbohgdl
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AFIQjxw3041706
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 21:04:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dclX5TjXagQdXvyM26xnlyJ5ipiPzjLpHRRtLV+Mu9U=; b=hXhbcREU6EwFVDDB
	Ac8Vq/qFfizpEk/cik4MmxFQpCXugF+GlgkILLWppwGilyRz8fnK3e++71wVN7Zq
	pPnPwFjle7rgE9KBYeE3NWGOtNccZhbYTL8qP4hq09PCSQGupbcRDLF1HUeqIDA9
	xbblNuUZOCKEv3ciOHVFa2fwZKaU5Spa6NBHGecpSv6IO2QKJFuIgX4RICwmcDa5
	79GwDYzfn2kz2k6sNBOXSFQfyMaSaylcIopDsNYIS2iKIwqJsyUBzMq6FgqmpUY/
	Ce0xE1QeiZ81fcTIL/ZDAHTX7vZyfCjcYxDLjOCU5iRq2QvofjZMFXKkOsNp86Sk
	sJd9dw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhjqkvyb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 21:04:13 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-99859876e19so494376241.2
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 13:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794776652; x=1795381452; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dclX5TjXagQdXvyM26xnlyJ5ipiPzjLpHRRtLV+Mu9U=;
        b=gbbohgdl4ZiKWFeaQxrHxD6Qook6v29MRorFw8KuCHOI8M80aKqWbg3AMPrs6ao2Tw
         OZC07Hc80Yv1ytjdvza8NG20LDJh6+B8xM5Y+W4Mf5s1e0XY//ygCZl5UcnYnp/3LZDw
         JXs9k70pxgbKFpXLbrs7D28fg3p/99SOw77I4VzOg1CSSg8N3YwUiKH+j2+HJVaE+aq8
         rIumeBmWO/eAllqTDbs8dYLXjxfm1nEEqHJa6ugqn4haGPIxKHgkjh7BGqvmrTGeVckk
         6CCWmIOY43pNwFnVoR/OEP3Nzvk7iiIsaQF0uq+MOulzP7QsQcaRrU+TC3Ntlfs8F7bc
         jcng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794776652; x=1795381452;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dclX5TjXagQdXvyM26xnlyJ5ipiPzjLpHRRtLV+Mu9U=;
        b=m2UaD3atx2Oq4e1DZFKGK3FXx7U89kQ/P4d7ps00LWDeK0RrBjdCXdyo0sUkn41Unj
         5yzX8AeQVB3qrd9HGdb//wB7axuWEbo20ls7SF9kF5Iw+f+qWKuNAG2oLcRmvmSET1DV
         ut5MX5bW9qMFYuyEdfMQiQX6atyWBrq/tY0dyIb0+RmQZVrZyISXvL3BeEfPph4y9apa
         C8fHwfIt+oCCM3MxgMMXNYxu1EYHZPl3M4BOZc/wAjmxb6OsTjsljWMCHCg1317zBSYW
         jomIiUH5j9xWZFw4Z6PtHhfjdlH4/fAIUUDxp37/Ju0fTVmoxSNcBseSEBld5yCVvnCS
         i6wQ==
X-Forwarded-Encrypted: i=1; AL+hErG+MIU7JpzRrLr8+OEBkIhGEBXvMG1an3dI36WFJIsk9g7jEzXH5LonYkjqGPJIfsi3wk5BABgZ+NKb@vger.kernel.org
X-Gm-Message-State: APuU4Z9gCeGAtidvmXR47HwUDkY9ifDtxlFf2GwNt/J9gHBuy1UhiaZ0
	8Y2ZxiZ/02Ix3BzSyEb4jwiWacJ4kR5XpTRan1QSffQvlOZWMNs3R0Dvk1bi2atsLg9JucEXNZY
	DqucbDY0J9Xbc6HpO7kiHPCZS5azfQSqIJe3BnXCtsZGTTP/IRWZNHLAzP6kzANEm
X-Gm-Gg: AYBFou0vusYIRFY7UB0QODjTNbvOeHxq3SP8W+T6D2HrMnnHzJh0jpQ4T3g/uy84488
	sYHpICjG22cw0E5Wr744UfQCp+b9NBGLhKlBxZc7OWe7Abi+9lsE6wCnAt4yqa8uwboOHWMIWyG
	ohU0pYj4OznD/TTziQ+PTNEOtv8mcFk2gEaX4Rw9StcZO1qD61Y0k7Txs2O52f8bXrxOlk5dEd6
	/q6BPQ4vC1U16DPLDQGKiTi+/rGsmyKuw/duFyDJuvlR1Pv9CWwW4XLscCWs1Rk9IR+rjYHYI1e
	6pbO8Y6aZndLufseY8ABvmEJqwG6gwL166VsSPBkXYTe9kAgeB8LD/boG3W3aG7yOHW9XTWN6s1
	ws7yoiIoWLaMJ0xksyzF9X/HvE4KGMWEu0JEz6EPqkfczSzahTF07YrV5BbD/QovaRwbT8Tu+36
	pJ
X-Received: by 2002:a05:6102:84c2:b0:7bf:74c1:b606 with SMTP id ada2fe7eead31-7d64d8abce4mr1883020137.34.1794776652458;
        Sun, 15 Nov 2026 13:04:12 -0800 (PST)
X-Received: by 2002:a05:6102:84c2:b0:7bf:74c1:b606 with SMTP id ada2fe7eead31-7d64d8abce4mr1883004137.34.1794776651917;
        Sun, 15 Nov 2026 13:04:11 -0800 (PST)
Received: from [172.22.9.204] ([217.110.90.56])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb65ce005bsm156345935e9.14.2026.11.15.13.04.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 13:04:11 -0800 (PST)
Message-ID: <85e400f9-eb56-4d8e-b791-ad00cbbdaea5@oss.qualcomm.com>
Date: Sun, 15 Nov 2026 21:04:10 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [RFC PATCH 02/23] ASoC: soc-pcm: add multi_direction_codecs link
 flag
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261023171433.820092-3-srinivas.kandagatla@oss.qualcomm.com>
 <179476416982.140154.13934302514044276070.b4-review@b4>
Content-Language: en-US
In-Reply-To: <179476416982.140154.13934302514044276070.b4-review@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KelHIgYD c=1 sm=1 tr=0 ts=6afa1e4d cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=hzUeyGCwRGS7WCfWEAyTKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=xKiGHf8qJV6DUAaYMh8A:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE1MDA4MyBTYWx0ZWRfX3LmfdhB583WQ
 nYwcc+h1/PXsxck1GUNz7iQeoEwx7KP0Bl0D8L4gkCLshzm65QHYYvREWpU7rLz+9bPuJLOoGiA
 5L8w4Ifiz7W2K1nnR9JodzVu4pnxJHE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE1MDA4MyBTYWx0ZWRfXwvVlb4o35NcM
 dQOWaOWmeEKHWBCjLf6T8RtfeGBtp8Au8Fai1aSk1xug9cZoRSFmgTwRRj14PvQc+1yn3FZ4GHH
 dq7w5Vq9/oRZCXGmsA94/F4+9Yle3qIh41anPbsEuwNhaXg7oezcvZDQwGx0VhMwvAcFFGSa5rs
 2LNEhjIDDjgdC5ZVHtnHa4MhrIAf13y8/PLcTDSCm3+raya4BJR0g/d497/p+opKPxrfU2Q/fPF
 xIF3OjA1pO4NrRrwFoHpEHlfovrEQeb2Z1/nG7HSpukJVYgKSYtwHFL530zqF1KDp79mpkqvlM6
 8w5bgFC4DrBI86ESwkkEEgJ6P1iyb1lNf5tQ/Eg0QSSP7FLJ85vEZC3h+WWH9ne/zITjyARd2uL
 U/r+PGm09fa5nDVvOHOggGHCDea/9vC+Gqtg2gsDvHjvwKtA4pg1rxbtfXKzMv+68XaUDt+riC4
 FuBEz062vGxpuYEZGPQ==
X-Proofpoint-GUID: g8Jc2-yXpCzJYLrlyIsWLNkh-y0Cq7sm
X-Proofpoint-ORIG-GUID: g8Jc2-yXpCzJYLrlyIsWLNkh-y0Cq7sm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-15_06,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611150083

On 11/15/26 5:36 PM, Mark Brown wrote:
>> Speaker protection needs the amplifiers' V/I sense capture running
>> whenever the speakers play. Putting the capture codec DAIs on the
>> playback BE link ties the two together, but the core skips codec DAIs
>> whose direction does not match the substream.
> 
>> Add a multi_direction_codecs link flag. When set, the core also calls
>> .hw_params and .hw_free on codec DAIs of the other direction, with the
>> substream direction switched to theirs for the call under pcm_mutex,
>> and sends the matching stream events so their widgets power up and
>> down. An optional multi_direction_params_fixup callback lets the
>> machine driver set the parameters for those DAIs. Links without the
>> flag are unchanged.
> 
>> +3. Optionally calls ``.multi_direction_params_fixup`` so the machine
>> +   driver can rewrite rate/format/channels on a per-codec copy of the
> 
> Probably worth mentioning the ordering with regard to other fixups.
> 
>> @@ -986,6 +986,9 @@ static int __soc_pcm_prepare(struct snd_soc_pcm_runtime *rtd,
>>  
>>  	snd_soc_dapm_stream_event(rtd, substream->stream,
>>  			SND_SOC_DAPM_STREAM_START);
>> +	if (rtd->dai_link->multi_direction_codecs)
>> +		snd_soc_dapm_stream_event(rtd, substream->stream ^ 1,
>> +				SND_SOC_DAPM_STREAM_START);
> 
> This will update every DAI, including CPU DAIs.  That will mean that a
> CPU DAI could be flagged as actively capturing due to playback or vice
> versa.

Correct, we should limit this to codec dais, will fix that in v2.

> 
>> +static int soc_pcm_dai_hw_params_at_stream(struct snd_soc_dai *dai,
>> +					   struct snd_pcm_substream *substream,
>> +					   struct snd_pcm_hw_params *params,
>> +					   int stream)
>> +{
>> +	int saved_stream = substream->stream;
>> +	int ret;
>> +
>> +	if (stream == saved_stream)
>> +		return snd_soc_dai_hw_params(dai, substream, params);
>> +
>> +	substream->stream = stream;
>> +	ret = snd_soc_dai_hw_params(dai, substream, params);
> 
> We flipped stream but nothing else, if hw_params checks things in the
> substream->runtime things will get confused.  Usually everything is just
> checking params though.


I think the documentation should capture this and the codec dai that is
supports multi-directional should be ready to handle this.

I will add a comment about this both here and Documentation.

> 
>> @@ -1061,9 +1117,20 @@ static int soc_pcm_hw_clean(struct snd_soc_pcm_runtime *rtd,
>>  	snd_soc_pcm_component_hw_free(substream, rollback);
>>  
>>  	/* now free hw params for the DAIs  */
>> -	for_each_rtd_dais(rtd, i, dai)
>> -		if (snd_soc_dai_stream_valid(dai, substream->stream))
>> -			snd_soc_dai_hw_free(dai, substream, rollback);
>> +	for_each_rtd_dais(rtd, i, dai) {
> 
> This has flipping that __soc_pcm_hw_params() doesn't unless I'm
> something?

Yes, this needs to be split like what we do for hw_params, splitting
both cpu and codec dais. Will fix in v2.

--srini

> 

