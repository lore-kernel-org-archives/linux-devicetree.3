Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794776630;
	b=lMbl3+uPLrFAXgtIXyVO2MGA4HXuGVX/nJbIpvwHne1Bht4jzH2Kwg9V+XnVcZ63NKio
	 8qnAcYGMSnhILcj0UJx7LvzgSQsJzeFWPZZcHgexSkWIXXXlSd8Opx/AC42II/+6fy7Rv
	 ykKOv5LHrfWBLLdgnfvkJJiXPXXyIUS13PyxVFzt1hPbwxCle24BCQ/0HmKpNOgq7cDvs
	 BxJ8byVpLUUJK58eOKkaNPd8ODBqLXr7QvS3DDMGMLjC9eJOrswg+IcgZcBeG1g9VrsMo
	 T6I7qnbMtr6whSKBlFuY+5Av51FroSPBZ1FZblq46r+xdKlQFpRRKtOW5jjanl9Mlwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794776630;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=+93V4N6Lq0YxOVjH6mwP1Fn2op2t3h1wY2olnwPC/y0=;
	b=rRgsBfjibEPQv/Ec9mILpUCKdjaiGaODYF1ZjfYM7CMMr6T0m/fQoIoxaNSSVbBzhVlo
	 7wRPBpYU5lyvVU0PZsvRHEH7p8U9LhfhZc9SqarIhYwmu/I/UXJXNTqn/dGG+d8O2+OuB
	 +5DzhxmUDveXVZJgTRXyQ5E6DQlCrQhKHdBlJMr0LftWj3ikgNT8i96mYV2/friIKhvzt
	 +4pHK5EhBLk13yhis4RJcLsE2tV+dSVtYWTLlmjQ7YL/e927eQFksg0CLbNeWdGEKR4Ty
	 ELtN2iS2H426WSIYExQ3uR3HWCTfdW1+NSoNnKkgh//2jAn1I4I34jCxqZHXEAb0bkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=agbTALtS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iPxwGchk;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A259606A339
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 21:03:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A259606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=agbTALtS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iPxwGchk
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AFIS35h1518421
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 21:03:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+93V4N6Lq0YxOVjH6mwP1Fn2op2t3h1wY2olnwPC/y0=; b=agbTALtSR3gbxxEc
	VRvNU4DCIKPvGpMO7CugpH6Uadyx5npRYj8FJv9vBKO3NQTl5CvPYcXjWOUWbMtn
	Axq//AERbURr5exipw8deW1dUK01/D42GkdVxJS2Nkny28LtZ/iUX2aGPbBe8bh5
	Qc3z7A61AmHeExvu24i9LhT76E3P2XSEn7fvlGqNphWMFnSJlJZxR1bOa3ueo5/y
	mqaBgVCB1XM+jyxY8d+ZCvsX3uMQjKQc5aUlSUqnfXdYbQORz4AhR4vDn633F8v1
	Di9+nyS3qXAOiDfm+1q+7TEhvVQfqqp/xC1mQCkjYzV3PxH0izjh5Fwp2peOwvuK
	/ZmTEA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhj43t0g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 21:03:48 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f5844cb60so541608185a.0
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 13:03:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794776628; x=1795381428; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+93V4N6Lq0YxOVjH6mwP1Fn2op2t3h1wY2olnwPC/y0=;
        b=iPxwGchkict8FNXwwuxijS6mEqQTHVXY6RJbzUuKeRhQsgIRnuf+Q8z1Ps0ehae76F
         2WrKMbo5XE2Zk5TFmWPqsWR1/sbQoyEpMxyKJlByUZbegFzbcs01l4Oet32guZuoAeGS
         wc5UQgf2NIt/0tHqSoBBxFusNDaqBcJ1bEKmRmziHSFb3LDD6Pv9sl9TSCfOqLsjjiWz
         ALY6KiCTV+U+ZJEOjnmKjWknc8EvwHcR1+CpSU4uCv+KtvBU2Y1hlqdxBu30ivZ2N6JD
         rQheTgYrTIu3HFLjypxROjQ7unNiz1wrWw4BqUKJg/dxo5yvK0f8URn8aIt+hSmfiJev
         enaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794776628; x=1795381428;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+93V4N6Lq0YxOVjH6mwP1Fn2op2t3h1wY2olnwPC/y0=;
        b=duLCnl6gRm9c8a0crpD+651D2ql+ANHZibCPRZHzQ03qxZ0r8efopp+Yz39OgBq+ry
         AYoN42Z5KyQV0gMFiLl6iLvaGe94eIxIMzWMvCc1HFbCmkPu1Aa4Be3Bv64XlJ0+JI5Z
         Db9Qrzp4o1X3HGw47SOOe85OUaKhdUAvhGM0LRrm7pfgtuiFEpiZeWvdBglnZRL2RPya
         uvmeNltVTFCFM9v4ckqZvAoKH2Z5KZsB42d5gJTPCWZ1JUy3cBVy7wnRcoReeZClLxBi
         b5O7/wingiQaQMlHDguqgPG1Fm0fhAPRihNT4ipioynqFZgccAEDXyfroHNfx7Tq2YOj
         2/Qw==
X-Forwarded-Encrypted: i=1; AL+hErHRoz/d6opBDvQugahb50GRTPz+l/zNPLpumG28q1SZ0qCN59YhcoBabRCP2QIbDo7d04kc0yeww9Aq@vger.kernel.org
X-Gm-Message-State: APuU4Z9NOJv+iV7JP/GS9vjdGLGNfeqYDUC2cbFAUfg1xG5Ok7iHQLlo
	Q/GcDqQDknU5Z9F3PAoQ44eJRfAAxWJrVJ3M7pLt/j15whw6wWAMaUjqp13JE0w4nZoNPE9YsRN
	6saDflaLMOl6PxQKk8lFL/23/jfOy4Y538Yxxg5ZxFhzdFvL8QTHi8WbIf2PNAmbW
X-Gm-Gg: AYBFou0yDgkpYV0hCnLBLJ221Zz2kSf+BiVY5nihoP9HH57ZIxaJSEXzezL2xNoKpLf
	9juvJYd7hxc8k976J8UXxUtDl+dD/EOvuoCSmfB7tKHKO5qKK2Il1e4tC7g4dfJCA4xg0DNpGoU
	j5vaTyQ4Ve/5LxLD4aXYLA0FPj8mjIlk0O3Y1q5/7yFAWTEksFNP9+0fFp3I2X26703FN+x7NPP
	ubDsk2a99lbbBSDlr6Cttw9qh2Zx9ohSPn3rM7UHPcJHC5ycjBynt3twtBJvBHlxpoe3Sp6o5Zv
	c+Ybrmfxu0hQgCgbTc0eUwOyaL5txcbLhI/CaUWjXG5Ys2jFL7uMx4JkjbMibyZo9UxU4rQHqTb
	1O8oEPNcGwFvssfno/RdZ6TjhCY4wzxNcklN/wZgAK6Rqs5YrZOEYdejoSl1uI9lnBAnkKrNtQR
	dT
X-Received: by 2002:a05:620a:40d2:b0:949:671a:cc77 with SMTP id af79cd13be357-949671ace50mr733615185a.1.1794776628055;
        Sun, 15 Nov 2026 13:03:48 -0800 (PST)
X-Received: by 2002:a05:620a:40d2:b0:949:671a:cc77 with SMTP id af79cd13be357-949671ace50mr733611885a.1.1794776627637;
        Sun, 15 Nov 2026 13:03:47 -0800 (PST)
Received: from [172.22.9.204] ([217.110.90.56])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5d03b104sm18917479f8f.6.2026.11.15.13.03.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 13:03:46 -0800 (PST)
Message-ID: <ea0f1a60-b2d4-4d3a-a7a0-767f4132f8be@oss.qualcomm.com>
Date: Sun, 15 Nov 2026 21:03:45 +0000
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
Subject: Re: [RFC PATCH 20/23] ASoC: qcom: x1e80100: carry WSA VI feedback on
 the WSA Playback BE link
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
 <20261023171433.820092-21-srinivas.kandagatla@oss.qualcomm.com>
 <179476416983.140154.148298781294201106.b4-review@b4>
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <179476416983.140154.148298781294201106.b4-review@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE1MDA4MyBTYWx0ZWRfX+/WfT3dzBvQM
 yZuznv7AX04GGJuq5TwT2EXHIEnuyZVJcLUph8J8hZWpuL1tNZ8cnIIwPc2NdN5QXpibDQMqLKQ
 sVcKobXIBjw7OhG6JN/J+MWLbEWcqBh8Y+ISTe2dlgPp5niOeOm6rHBD/pu4wbQLrMddZqpaBra
 U8aiDh2P+j0Y9WRQKgBwXQGdQcWBORyixZujPMqeBzzhU6Q52GlUcw0Fu8k+emCxFHfvBw/MDFj
 uunD5VZYTQEzc89pLT+viMovJGyxUaCDpl9nqhmjE5g6ENk079jwYhzR7l24xIn22uyv0qJ5u5T
 oMwWYQZS/NSsR8twxSM3aEyh3zF9HcC0BkzdRoCakrIeog/ZSb1y8lnsgGFn2wMVTv/d8QLOWUd
 Yb0E8VB23BRG6gJSKFLS8SHT+eoxEKhkDfZdfsxebntFbzYfCc5LoggnVohQj1PL2ZOlKmqt36e
 pIB0cBqUQHelNjvpE2A==
X-Authority-Analysis: v=2.4 cv=av0nmiZV c=1 sm=1 tr=0 ts=6afa1e34 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=hzUeyGCwRGS7WCfWEAyTKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=eRThcyuUgiMSaGfv38QA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: JLn6OK5hUucV10XTHqPbhJWvFCNJttVQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE1MDA4MyBTYWx0ZWRfXxLTbmCch3OrP
 l4QGibXPKTqlewwIfy4jr28wcYH29QEOBp9rwE737hBFADEZaKOJaDe/qqr//FBLoUxUhQPBREK
 z0TD12Jqlg1A4EBClUi5WXpQfGC1gqY=
X-Proofpoint-ORIG-GUID: JLn6OK5hUucV10XTHqPbhJWvFCNJttVQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-15_06,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611150083

On 11/15/26 5:36 PM, Mark Brown wrote:
>> Speaker protection needs the WSA V/I sense capture running whenever the
>> speakers play.
>>
>> Set multi_direction_codecs on the WSA Playback link so it can carry the
>> VI codec DAIs, with a params fixup for their 8 kHz, 32-bit format. The
>> core's capture stream events for such links power the VI widgets.
>> Nothing changes until the DT adds the VI DAIs to the link.
> 
>> +/* VI codec DAIs on the WSA playback link run at 8 kHz, S32_LE */
>> +static int x1e80100_wsa_vi_params_fixup(struct snd_soc_pcm_runtime *rtd,
>> +					struct snd_pcm_hw_params *params,
>> +					int stream)
>> +{
>> +	struct snd_interval *rate =
>> +		hw_param_interval(params, SNDRV_PCM_HW_PARAM_RATE);
>> +	struct snd_mask *fmt =
>> +		hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
>> +
>> +	if (stream != SNDRV_PCM_STREAM_CAPTURE)
>> +		return 0;
>> +
>> +	rate->min = rate->max = 8000;
>> +	snd_mask_none(fmt);
>> +	snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S32_LE);
>> +	return 0;
>> +}
> 
> Shouldn't this also limit channels so we don't get something wider from
> playback?
vi has min max of 2 channels, so its fixed in v2.

--srini
> 

