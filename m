Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA624D2ED3
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 13:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784813528; cv=none; b=rPA6aRvShphrkxe86wQoJhY+V6HnC9QIpEbT0DaBic7kNvwoD4q1hM/SmUN3gPRSo4hhQKM+elmVreToG85EMU+f03B5k55evQ4eeSF+7xIs6/j0E3TiqWhXyBLvijfpxGvqgOFs7d1piFAM5QjgMzli4BlYMRyNoM/ds7dOkjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784813528; c=relaxed/simple;
	bh=8Ryi5rxkmLYm0Rpkhz905fjJXX7sMk2QZABkWrXs2Ts=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cj/u1nf/+7RJ9nlZKEPfA55KSeGMuNnX4AE2SmDy+KqQI5J3sqd3puvofXr+g41sebPWSJlZvWLgqbd4TqxpSvMy/PKHjQT3GDAxzdVGputBrzykJhMDLVEp+4ZVuy5SeB1/2LYnl4Nsyi9ssC6rlRSdJJnHifhyPoLhG5cuIsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GdEJuSoX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I3AdbNtp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GdEJuSoX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I3AdbNtp"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NCvFuo3951106
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 13:32:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mfFGwI+Y5Nvk+ywMER5eZzI1kmld/UUazQ0TlW4XafU=; b=GdEJuSoXLgSjwEdq
	1M1+MluDFSaOWCzWCZMNipoITgmFV7CwnFljpM8fC07Wq7URywRTBW6BPsgeulEG
	5HabiRU/jUUURqGJOfL1ib5uQ12Nj7DzoAOdQOBQWWy+rc9JmPVx/PyujEtlt93y
	6f0p8WwtNNmjmJvXe2vKH7kt7pHmzeok8bMzZom81REYIpMl4dLpwaL6UAOOWQeu
	oIA7OTqIOKUBO661hzhegjU/bwrQkBlgmHdGPcItwcfjoSGVximP7sy9XJZP6MWn
	rQxTaAPLxQjUfHFSpKVgWRQbfs2hgaI1d9l1g08ugdTSiZkEaRkp9HpHg/OPwSXC
	1LMW2g==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkjnu8bvs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 13:32:04 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7359eba94f2so39227137.3
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 06:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784813523; x=1785418323; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mfFGwI+Y5Nvk+ywMER5eZzI1kmld/UUazQ0TlW4XafU=;
        b=I3AdbNtpTpfCrUVfEz4VLKz+NSVbtYrwbjQUGX4df1XRy3BmFop7wEYVv/H0GXpwg8
         /DbEo0mk0iDGUVHYCn8EejsTZ3XKy4/wgZp4V/cPk2roy+J9W9FMdNTwhFb0CY2AZk2l
         xNF8CmDffIih3efKMLfi3HT11pFqu8aYP//fXffJ3LOjZ0XfZmUKT9pFa0IuvnnGM9Qo
         /CjTE5p4x2UmtiLywlUhr/As/EFCbVbURIPQdpLtlTm7P9twFNv9amYjVvNnLqeqdyBi
         pzkdlyoQTQ/nZ+UzvOWaD6Vf+zHpJwaJctDmlfHpi+74s+3C6UKNdsQDRA/ag9kiwLMr
         mA9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784813523; x=1785418323;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mfFGwI+Y5Nvk+ywMER5eZzI1kmld/UUazQ0TlW4XafU=;
        b=Y3LfgHR70uPYnkOwvuRsDhrnPudGfYRS3/p8BD7bVPzRNYq+R8IY1jAjgE9qn3U2Ag
         l38/3GhQvuAcEdYVTzec3ZfFLx0ohV9PwLGZHK7nTNFdtb9OqBsFrC18gDDcgjV9l3SC
         xBqheGhn7f/3dBqhwZD5yDWzWCkgU4KXtNoqs048ZH9Qn3siNN+RsnK9/wg8Cs4g8R2y
         3NCyipguaGRiI4n5Ht9gJjNQr3ByfXrVwhV/oMm7k6sJgpL21kzg4Y+lJmRM3M9q9cjT
         oL1CIyhhbW8dAXMBzdpLa/q9oWtdzX9R2TpvsQlIkzgdlZ6OmH2DARzRZetUC67jWT43
         uG+g==
X-Forwarded-Encrypted: i=1; AHgh+RqqwRvSMHqLdxfzFEMTWmF8MTnPMyQS1FymzDG7lqYxaZBNema2UWKjsdZ6tyFrY+o81PSlmuMFoa8y@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4nWhW0T1h/8aolsplEH2jUjHY5uWrISPHq99pg+2HAYPXbN+s
	ZcBorEsl2pBwHYXgrnouXrQZMzehSvCZHpQWja+Y5/msrRrpfCGZ2r7vDMj4+Nn2JytjXwxidM6
	CEgO2tHEkZm87Zic/diVYJ6LTLgjob9mBzloOTu8CDI8xoPuUaC9H41Dt4CB2Savz
X-Gm-Gg: AR+sD10ftqM79fIBOxLr7f6BKAuF0WZ9q9jcQoToGzHbVt9W8HWLWSL/wOZIXAHgYSP
	F5xUA0kJBZJzPvF1SuNeOFawtd6LchdhU9jFgY9+rLYtl52DVO3AeZxWJhG3nYgb96ZMTGEKr4D
	dd41UGilkSmOTIMjMsmW/gXTnOXDJdBp3qWls2N/wzfHSkXIaIqRRDqDulqZYaRvvq2xlxLc/42
	dfY/nB0pbQBuF8QqESfJXiXZW0p06NIvrJQkb2GlTdQAmbS1ZG7si/H8LXn7dPltBFUft7D5+cv
	hCcG83ftklT8B+k2s9Ya3QaY4q2dQTkOVzw4VABFLcPZiQyS8LsIjSdojIIQRyKRHLEUr3oyne0
	mSjvsaJojoFB1GYEClJUW7bCT
X-Received: by 2002:a05:6102:f12:b0:631:4d32:a86 with SMTP id ada2fe7eead31-74e4cb505famr74946137.7.1784813523170;
        Thu, 23 Jul 2026 06:32:03 -0700 (PDT)
X-Received: by 2002:a05:6102:f12:b0:631:4d32:a86 with SMTP id ada2fe7eead31-74e4cb505famr74923137.7.1784813522708;
        Thu, 23 Jul 2026 06:32:02 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32c90788sm232087066b.40.2026.07.23.06.31.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 06:32:01 -0700 (PDT)
Message-ID: <0c8979c9-6d3e-4bc0-a324-e36d4f0a6a37@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 15:31:58 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 7/8] dt-bindings: sound: qcom: add Tambora WCD9378
 SDCA codec
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org
References: <20260722234221.884765-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260722234221.884765-8-srinivas.kandagatla@oss.qualcomm.com>
 <dd22171f-7444-4c17-bcc9-f337fe9677c3@oss.qualcomm.com>
 <8d7ee8d0-66bb-4420-9e1d-615557dac277@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <8d7ee8d0-66bb-4420-9e1d-615557dac277@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: SAIK_Mn3cN5N0XvzzFlHSBz7K34GffmV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEzMyBTYWx0ZWRfX4DqwC8oTa3hD
 wkBFhvhghbdu6VcAmk+MkN/lPyOGx7LtCZlSYNMiaokDf0hyiXbHFj7Hj6lh0juPfKufFo3Oron
 /tjsPlXRynGZ6erUrkkv5LTljjH5EDNQc5dx1n5nFytgCB9RUEJQFP/uEF+kEvDLJc/nebO5KQm
 9Jqq+bP1DiTwaQZ2gNLX1IGMoWik3E2AZcvn4F3R8sB0541QFmetjRJhZcC8QGAV9ksGXUuTNKe
 bN8vRABaqGpNKeuHRJEf9PD4XLuTYbma3moyzhO6FLhcbVVcCO5h7/j6YMLp3Xb31aDPPLzjF3q
 GREDJ/6dW0cdogMfO21UlOQp2yfnzfs+21gie3kXYLSxCHM1q4LfqyRvln1bos5RVd+FOLG8vh4
 0QQ9PoBf2MqGb1qZkPSGYdQDgSpSMSmYwV6Qf4LxYID7bM7BbbDbw2UKSJyj2OfOrLTOIJCjUQB
 XI7p5G0TlwhTzfv+dbQ==
X-Authority-Analysis: v=2.4 cv=Een4hvmC c=1 sm=1 tr=0 ts=6a6217d4 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=mSxn-Q1uSbZy4lC67FIA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEzMyBTYWx0ZWRfX6TPAzrsOeNNM
 5HMH7XZvVxsi5ZJDE/dK2EYCSumSxroa1oA0RIvJHb1xwTMrVGmk/MSJAWnGz0CDo64cjfQvxm+
 U0HdBPQFaQrz7CrWuoQM8Top2k26Opo=
X-Proofpoint-GUID: SAIK_Mn3cN5N0XvzzFlHSBz7K34GffmV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230133

On 7/23/26 3:28 PM, Srinivas Kandagatla wrote:
> On 7/23/26 10:14 AM, Konrad Dybcio wrote:
>> On 7/23/26 1:42 AM, Srinivas Kandagatla wrote:
>>> Describe the WCD9378 SDCA peripheral node (compatible sdw20217011000)
>>> driven by the wcd9378-sdca codec driver for headphone playback, headset
>>> mic capture and jack detection via the SimpleJack SDCA function type.
>>>
>>> WCD9378 codec can be wired up in 2 different modes.
>>> "mobile mode" on phone/tablet SoCs is enumerated as tx and rx device,
>>> each of which has dedicated control and data lines.
>>> "compute mode" on compute platforms such as Glymur is enumerated as
>>> single standard MIPI SDCA class device.
>>
>> Does this require a different hardware wiring, or is that just a
>> difference for the driver? If the latter, can we choose whichever
>> mode we want (i.e. use compute mode on the Fairphone or use mobile
>> mode on a laptop, depending on what the OS supports)?
> 
> AFAIU, Its not possible to change it because its fused and this also
> brings in some physical bus level changes to soundwire aswell.
> Ex: on compute we have one control lane for 2 soundwire masters driving
> 4 data lanes. on mobile every soundwire master has dedicated control and
> data lanes.. Bottom line is its not possible.

Ah, sad. Thanks for explaining

Konrad

> However w.r.t to driver given that is same IP, I wanted to explore if we
> can have a single driver for both.

