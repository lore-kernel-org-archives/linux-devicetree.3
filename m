Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE333DA5C5
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 22:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789511441; cv=none; b=PUMZS2fhoLFzrm++UZ/cV6sRewN1HdqrMu0i9JWvSz/F8NfkR6FrgTqtkAugK+YpCA+/mmWYNtlGBok+M/a+bpbZiTJ9CRNSwVH1k2BYQHxPrALctdSaumYD08Ajem8X9HKV6aXZxy7bdMHmWRWBlNB6nIIfhJd+XdKW9nsV5V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789511441; c=relaxed/simple;
	bh=vVmTWSLMVujJSG3CQY6fFBRFGflHp4JcNvvw1BRS2so=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fPnr0I0RA+20KyC2Y6HwcDScLcUKAP71gP2DR6QzuJhNKPMiJ/qqUhi9og1SUvHL+mZR0ZYTA1cIED0I9H+PiuXVfLLE/DrxJbkVbIcbFMGFmPzdXRCZjVugjv0DDnG2qt8KuT68zjRaRa9KQTrnTuge1qLQ+eLam+HReKhMY2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZVDAdXDo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gR7t7Y7c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZVDAdXDo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gR7t7Y7c"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FLZCEB620298
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 22:30:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OoaUvNij8YmbcFsxH3lXmPdyT4LUwKvkwpbwWWFHxPE=; b=ZVDAdXDo0ulVpyXb
	g8NopG2tbvKSgTtcqDpDuO4nio/SQwZ0JzyDXFJ0rGtBNkZo/LmUNoa3jT7hlceo
	6w7Mhbw6AfmN2EdU3pRwH6JZ9HqJlcU2PLDuqBZfaykiIb6ShRxb8EfEYcFwkDZ5
	PTIdh17Y96kV5BeHTk50zBiw3iogDbOVtK/yfZI17mAHitg7rRfbAF1pLDmEKcDh
	WNSX/EDeIRPcXhVy0VN6MPcC7ly6233oHvBDjJH9KN56YDulhUgZeqDfBV9woUfy
	2hc2LKssaAgonXCEHqjV+37z/2SQKBIyXBgmz/uCg3bMHzabGv73qApnxcTBCIdj
	brA15w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq2y2kk0k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 22:30:38 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-90e8472ee1eso108211476d6.0
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 15:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789511438; x=1790116238; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OoaUvNij8YmbcFsxH3lXmPdyT4LUwKvkwpbwWWFHxPE=;
        b=gR7t7Y7cyhJpDp2CnGQzkQB2fpHzSWv+qO/P7VaDyKbSGmyDIa4D3pq+v2ITaWYWrz
         AsdybGRP5rr45idNI5z7xjnBCjeQDH8WALE7MZbfTkSQMejGg7d3r6lMYP01VU52xBaR
         x+pd84S3u8qHC+ahal39qCMu01RLVN+PlpE2YSAAJGU4sqdK4fXVi3ArpyM7jOyh/qk0
         Uudpu5rjlYWVg3pgACvcUYr7KR/l0JHbCcLHGwAhp7tWT5NWKwDEU8cnQHcwXMmsGeSJ
         vQ8jI+eOrja3E7X5fsDbcqziaE3lPN4gE6/ZOceoOpdK435nP4ld+bgbLtvjzrt+8F2a
         PztA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789511438; x=1790116238;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OoaUvNij8YmbcFsxH3lXmPdyT4LUwKvkwpbwWWFHxPE=;
        b=P7pbA9IZIyel4mb7O0Zyk8mtD/xzuMck1Bl8mCA28Vse812WaghbbHHbZMFh8bNcRZ
         fP/i5fWHMuo2CfJ7a/GSbA5eFZd+ihAyKIUBaOVspGhldqseNIMUSWa0En3A+7tTe0ff
         RAyHjwkwuNTvMRhWmQ0j+uH5xo4KkSgtETAYHjbOd3FL4vPCXiwlZrKN8jq8ZchGc/u9
         kwEBhqkn8gqOZWf+SkDgikXQGkw+C6hJ6QFSWsc2xhaaEe6Ag67Vw1tnNHwHOgOvKG7A
         /xbh81DUnId8NQjmT5uWI9gHt6+WA+V1RIMSBcfx3o/B7hiLM8/6tP5qB9FaZMj6r5Yg
         BOFQ==
X-Forwarded-Encrypted: i=1; AKwUvBwbqvtZWf0wq4tFJdIdGjZbFhqblKjxXonM5rH9tEqd7LY0RO7QIdSj+uAKr9eB1B0ZoWAtifdByG3A@vger.kernel.org
X-Gm-Message-State: AFuF++n/8avymZ+kbkWcbgQQ4NtyoaALbWrAVC/LNvTSrpzIQLj4j+hI
	/L9/KzjP+uglK0K/iq3aZIOB5vueGq6KShJ3RWk1kA1EYOJEAg3PKIHSOeAY48TDJe5N6L7MTAI
	ZY65M6VyHmCCHhbObDiSn3cnirOSpouJL+ah2Lv0Cl/XG3oJxad0vlOZx+9qeZWO8
X-Gm-Gg: AYBFou2H+LGBrkzn+7zFiSqw2vs0rh1Kq7/8BHjrCnIq7bzDc4RVWc93z+DxPpATJ4k
	yuViBps0o8NXeHGPbt2UOIa7tbPKAHseZsb3cnHAknhnoyoaTJ0qfWc/fZqhs6CHtunfvg7HilA
	1Zki9gTz62recHiI1bvm0Gi0T72iNsmebHGwbMH91OdmvjKJVHiUII5I79iZ0peaHxHqbsc/LMQ
	Sl49ncEeoSqrE++rjx6M29ZzfsXeRbANQ04AdYCyEd06E4g3cmspuFWDzzMRvfoCrM2ufTSkzF8
	2Nx3WzG0ozfbwlGKp7HbaJmJXCbfaSUdrM10GrPeVons/9i4XZB9+1G3uSweUkEFevEQioX5OyW
	AQF1WN9LK3uoXhvf7BpfKuRTCcS8=
X-Received: by 2002:a05:620a:1a03:b0:939:7c8:78b1 with SMTP id af79cd13be357-93bb789cc86mr30104485a.24.1789511438288;
        Tue, 15 Sep 2026 15:30:38 -0700 (PDT)
X-Received: by 2002:a05:620a:1a03:b0:939:7c8:78b1 with SMTP id af79cd13be357-93bb789cc86mr30097185a.24.1789511437739;
        Tue, 15 Sep 2026 15:30:37 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49e83dbb0c1sm24618435e9.14.2026.09.15.15.30.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 15:30:36 -0700 (PDT)
Message-ID: <6266fd8c-d941-4eb4-bcf2-fbd54d093186@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 23:30:35 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/8] ASoC: codecs: add Qualcomm Tambora (WCD9378) SDCA
 codec
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, patches@opensource.cirrus.com,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260915165652.914893-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260915165652.914893-9-srinivas.kandagatla@oss.qualcomm.com>
 <aql-HLWq4NOh3cgk@monoceros>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <aql-HLWq4NOh3cgk@monoceros>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: BvXv1AGpjQxm7mGxwhiCsGaSwjACvJhz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDMyOSBTYWx0ZWRfX7R0nQWuqkrfw
 +GGfZqoBdA76Eowfmc27e7leo002peUFUNTV0N9BEkNyAOrkNwHRX7FdtcBunjUXpKhlyrnb/vi
 yV2hcrABRJo1XtwOivF3LW1Scc+8RogNb8JL17983sN269ts/3U+N07OimVmkXH1v9lNlbZ6q+U
 VNZ7VcPcBpIvdQCHIKVE4zcrI+mmsLOQRgl3xNZD14CAd4X02k1I3zvqO/tFDPpEXu5SGsjiJNB
 EEU2up4tRAYWnkBTeyMUSEDac2Ki9eqemhKLd2EiobLsR7SAymEwcZs8jNeg3PMFyVm30W8iyDR
 Pu28Vh39UQTivzM/4XCEazH6seLwUdrD6Zy6ntSJGRE7OeBs+FIzwxLwQTkB77V/cYuhcURBMZM
 XL2WUQjBShKl1YgEQbcWOzQxxc1Cggivaht0iXwKhNjVuOQDQlTvBpqqqpNQpZ/idAmNKdaYMm9
 XaPb35XY/d9+0yLsfKQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDMyOSBTYWx0ZWRfXyzo0kUEeJ4Bl
 QJ72vc+VVd/b4Ixcz/d82XvQ5e2vhfurwPfgZAyt2txlmLuIB4rXS7iVs34IVV7wAa6xKueCkrU
 M0AXB8hwehnxpXh6UhZD36XxCgm5JgM=
X-Proofpoint-GUID: BvXv1AGpjQxm7mGxwhiCsGaSwjACvJhz
X-Authority-Analysis: v=2.4 cv=IcISymqa c=1 sm=1 tr=0 ts=6aa9c70e cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=ohbBbs68x0cw2nEFerEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150329

On 9/15/26 6:22 PM, Uwe Kleine-König wrote:
> Hello,
> 
> On Tue, Sep 15, 2026 at 05:56:50PM +0100, Srinivas Kandagatla wrote:
>> +#include <linux/mod_devicetable.h>
>> +#include <linux/module.h>
>> +#include <linux/pm.h>
>> +#include <linux/pm_runtime.h>
>> +#include <linux/soundwire/sdw.h>
>> +#include <linux/soundwire/sdw_type.h>
> 
> You can and should rely on sdw_device_id being provided by
> <linux/soundwire/sdw.h>. So please drop <linux/mod_devicetable.h> which
> makes a bunch of useless build dependencies go away with it.
> 

thanks for the comments both fixed in new version.

--srini
>> +#include "wcd9378-sdca.h"
>> +
>> +static const struct dev_pm_ops wcd9378_sdw_pm_ops = {
>> +	SYSTEM_SLEEP_PM_OPS(wcd9378_sdca_system_suspend,
>> +			    wcd9378_sdca_system_resume)
>> +	RUNTIME_PM_OPS(wcd9378_sdca_runtime_suspend,
>> +		       wcd9378_sdca_runtime_resume, NULL)
>> +};
>> +
>> +static const struct sdw_slave_ops wcd9378_sdw_ops = {
>> +	.read_prop = wcd9378_sdca_read_prop,
>> +};
>> +
>> +static const struct sdw_device_id wcd9378_sdw_id[] = {
>> +	SDW_SLAVE_ENTRY(0x0217, 0x0110, 0),
>> +	{}
>> +};
> 
> s/{}/{ }/ please
> 
> Best regards
> Uwe

