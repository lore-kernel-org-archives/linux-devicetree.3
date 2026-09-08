Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6810E599A41
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 18:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788890433; cv=none; b=WG2HbhJ2bEcO7l09nIqAFQrQfZVZcfiX7njJmgY8l6AWYBmi0f4jHfipXnqAOuyT4Z7yZDBC8/vC9w8o0XpYSo7HOcEqyBnHDgZlrF0VVBS+AOoV1aCLlzC8WKVM1JV/kr4n+t1/mY8BUFeLCM5afwHTQyoIla3ZJmEqQmZ7hsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788890433; c=relaxed/simple;
	bh=u6wdLrwyQiDIzovivnZzvX58qPuV0kVPxqekCK0IXbI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iGP4kTgi2FeTpYwGVBwtAMyNCbEF3K6T3AhOs5D4CPKD9uedlia175tzQ+AX7Y7zV3EoVDX0GHyA1uDsRjVgXsCs+0wchUZ6DS9IlA5MQUM5fGhteaHoZjA1EV6pA+EPEelth6KmqrII0dYqV+462Ig9WiV5bZ1KzWex+Kvjx2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kW8Trzvj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NxME9Uuu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kW8Trzvj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NxME9Uuu"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688Fe3RV3614102
	for <devicetree@vger.kernel.org>; Tue, 8 Sep 2026 18:00:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vhI9rygEQ39zKq79+luFBhgAUw/Dcbm5V35+xL/RCJA=; b=kW8TrzvjT2qUPcfu
	rNaAwgnSOWf4omgbMnL0JcwwaNJk2ib3IuRgaJMbQot9CDtjlPRQ7KiE+mPkLChI
	bTeWO13CACG/B9zSVPWyU7xVJpcP7KEgo9HJ5WX5sezviZwANh1RWjYHJWvyG7U3
	F6n0hyqeaq6G8JrSPe6wXKuLygTtreblbatOSxIPmbX9RaZmOfvj75aKv/OoIzXP
	tCVdULIUNuu7GATTgTrWY+lnG92ki36k+vDWXIurtQQR5gudaMmAlgYk6zbuZn1v
	ekCUkWg27fyzJWbcH7EleOYOsEjJFTo4jWQaP4Jwil8IjSk4wGv7/8QnutLq7aVX
	Y3bAQg==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjagukm6m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 18:00:27 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6b12abf0e49so7077588eaf.0
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 11:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788890427; x=1789495227; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vhI9rygEQ39zKq79+luFBhgAUw/Dcbm5V35+xL/RCJA=;
        b=NxME9Uuubk1j9FgEiklZu/0KeL0SFgb1/GXHOrIxfcc1mVzo3cJ45azEW2dPqHTRPj
         zNpHoIam2mIPQUwaETCA0mYJXYGrnfDOJFv+6XFVGoS4RUUqXVqzJFTVGvWRCYoV/qee
         UxG1Oz32YiCEgvuAtd5raKlqTXjVZssdNdEe2l9ZB+b5QXeEndguNNDBJezgSNRcSIG3
         ceTVjdiwuFjHCFZcxvQhaSxMMvmOecaNfl+RaUIdFmKoGVRZU7t2WqdKQhnwgzhKZVXf
         Z98Y6G3/QNJnX+y/j6kkX5fRkVDT64slzbJ4Z0p3yxjEJt1W5iGiD1zRLMVc3yaTr71M
         fbeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788890427; x=1789495227;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vhI9rygEQ39zKq79+luFBhgAUw/Dcbm5V35+xL/RCJA=;
        b=rbCDwyI3hSkdcx7w0hSVGl81AbLv7StX3hPYCMQ3zqV+puyvBVuKUgkxrVM42Hun6o
         t+UCSIZCY764LC6BdIHiirjdIvABQ6B48ghq4HYsPoU8As1VCP5yZpqZFh6gUXByvq4h
         /YV9OnmrPtWdyMoqY60aKKce3epN8a1eYKpL4tmiYIbruifbqlfizfGAOAUkF8zrl+sv
         UFyByFNZJUw34Z2cs4/H+l9OxJHh2BWV7ive8v0V0jfmHP4NXohixJhP5ii898M/RJeA
         5xqHQikMQwDmIvnuDw6FTCUdgB+JnfZn/b5g8CvzhavbDuSVBxA6EuPVOGnh+U9eG+67
         gLVA==
X-Forwarded-Encrypted: i=1; AKwUvByfsMDGonCj1J03MEwlnlyHYR9EceCAtsSh14h8dZXw5oHnt2tzs8fZOJQ2w+jOtHUllHDI1V4xrDfJ@vger.kernel.org
X-Gm-Message-State: AFuF++kb8FI29fCBxISVZJis7HF+gXAknlumwITQ7ssH/uuoLpE7hDQ2
	jKHVFnXGaUDz6dGgkJFbnTIxh5pX+HdCLeHIPiewiz2LxCJU6DMg29v55hsP2uAZoMdixRVghtg
	b/xPCKlnp6uPjhoyLmtxp6cgtSg9S0xVpGTlzINO+ZKcRukPqD1qAokDCRhWNIGpS
X-Gm-Gg: AYBFou1BQoIrd5HsZlcxMO2U+Tzdw62b3iO5gY3NgJMroCIUhfwv4pyKq78z6j+t06X
	scCXZqxRU6q0UPx5oaHDZ6lCHaD1OdcilDz6PYtzPEQkTDNfe4GXOcv7sMeka+GGZiiPrRiIphv
	yoZF7c1g6627uTkNaSNTh5KBsSFD/qOxNlZEvQGikZFtyNrh2wIL1eAUKAtC2Q3l3FLOhrx2TGA
	570yR5EnYcGNar6BAk0XmTVyiV8SIQs3ssyt/uBIr/0KoQWA3eos7wjUQ8DdIqTO6BEYX3CbCUZ
	5LS6+RV0iW6mU9YxeqUzOWPXl69Zo85iwlN4a2nurh4niOYMihU2kUrSPUp4wj4i36DID4beYOP
	4wt/BQ7qJBFL+bDlk1gvSprEGzjI=
X-Received: by 2002:a05:6820:81f:b0:6b3:697f:9f1c with SMTP id 006d021491bc7-6b6fc7d2ba9mr29068689eaf.8.1788890426727;
        Tue, 08 Sep 2026 11:00:26 -0700 (PDT)
X-Received: by 2002:a05:6820:81f:b0:6b3:697f:9f1c with SMTP id 006d021491bc7-6b6fc7d2ba9mr29068622eaf.8.1788890426281;
        Tue, 08 Sep 2026 11:00:26 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 586e51a60fabf-4760cec8679sm10736429fac.5.2026.09.08.11.00.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 11:00:26 -0700 (PDT)
Message-ID: <f1e80aa7-2d92-455c-b7d6-484fb353e01f@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 19:00:22 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/11] ASoC: SDCA: add populate_function hw_op for DT
 function data
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Takashi Iwai <tiwai@suse.com>,
        Faiz Nabi Kuchay <fkuchay@oss.qualcomm.com>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260907083727.733705-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260907083727.733705-6-srinivas.kandagatla@oss.qualcomm.com>
 <aqA29pv18mXzTR0G@opensource.cirrus.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <aqA29pv18mXzTR0G@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TqLWQjXh c=1 sm=1 tr=0 ts=6aa04d3b cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=VczNHz_CLEaalHvbfdcA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-GUID: K3SSzkWN7SFS5KQeCqVESuSZTGkwuMW5
X-Proofpoint-ORIG-GUID: K3SSzkWN7SFS5KQeCqVESuSZTGkwuMW5
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE5NSBTYWx0ZWRfX9W0OCb3ps5FI
 lAch6S2oJQ3TsJRaL5LteygSDDvFXxVjORf2qwHRGM1DJk5mWatyVbxefz8cMbWGDIcqZ64YDoJ
 a2FbGWbxEqivKMRylx1JsdGPZ82chHE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE5NSBTYWx0ZWRfXyzEx3dTdzNAI
 Nb20jbqRiFmf7BQADM5/+W4kcmFqN8hGkOh8rc/BNtAHOeuzsExO08RSnI41tYt7vcxAWa+u4tW
 /tEjoY2qE6eIkGyPLSl9mR+P5shob6dSDTSK65DVxmJerHGTUkjVs6XBhuJFa7BAjGHYudxLlkS
 7qxFBIzfKjfMIDWGnYLjyQbWQVUAPSRWQAUIHqKsgxX6BHx/Whe1vSUPZZ2dKW/cQxyWPuGRMJF
 guqLr8t5BgfDsnAtGgLk57X8NLZsu3mwkslp1961k+QYa3FG8bjQG4EEio0mOif8me6JOmfg81f
 WwrQpHVflrE8JOTQSFbTTRVKLFzf4SVww9hKyu8OzaKXIpwZR65sLrRyUfWbQWjopQr2GQ4ztRJ
 dckTzLpzufPuHnA1PuvqaEjMT35v5DDbtOxo2YeJdtTU9pb+mMleUAX5V2NTi4fvmzeGgQKYRXe
 PUerdOjtbJxFVJmdA+g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080195

On 9/8/26 5:25 PM, Charles Keepax wrote:
> On Mon, Sep 07, 2026 at 09:37:19AM +0100, Srinivas Kandagatla wrote:
>> sdca_parse_function() walks a firmware node, but on DT there is no
>> DisCo node -- sdca_lookup_functions() is a no-op and the SDCA
>> function descriptors come with a NULL fwnode.
>>
>> Add a populate_function hw_op that the class function driver falls
>> back to when @function->desc->node is NULL: it fills the caller-owned
>> sdca_function_data (entities, clusters, init_table, delays) from the
>> codec's static tables, matching by function type.  Leave
>> @function->desc alone -- the framework owns the per-instance
>> descriptor, so devices with more than one function of the same type
>> keep their per-instance SoundWire address.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
>> diff --git a/sound/soc/sdca/sdca_class_function.c b/sound/soc/sdca/sdca_class_function.c
>> index 10a2b031b572..8bca88865a4d 100644
>> --- a/sound/soc/sdca/sdca_class_function.c
>> +++ b/sound/soc/sdca/sdca_class_function.c
>> @@ -329,7 +329,14 @@ static int class_function_probe(struct auxiliary_device *auxdev,
>>  	drv->core = core;
>>  	drv->function = &sdev->function;
>>  
>> -	ret = sdca_parse_function(dev, drv->function);
>> +	if (drv->function->desc->node) {
>> +		ret = sdca_parse_function(dev, drv->function);
>> +	} else if (core->hw_ops && core->hw_ops->populate_function) {
>> +		ret = core->hw_ops->populate_function(core->sdw, drv->function);
>> +	} else {
>> +		dev_err(dev, "no firmware node and no populate_function hook\n");
>> +		return -ENOENT;
>> +	}
> 
> Is this the right logic here? I feel like if we have a
> populate_function() callback we should call it regardless of if we

something like this?
-------------------->cut<---------------------------------
if (drv->function->desc->node)
	ret = sdca_parse_function(dev, drv->function);

if (core->hw_ops && core->hw_ops->populate_function)
	ret = core->hw_ops->populate_function(core->sdw, drv->function);

if (ret)
	return ret;

-------------------->cut<---------------------------------

> have a node. That would help with the use-case where this is
> being used to work around bugs in the firmware, and
> populate_function() can always call sdca_parse_function() if it
> wants too.
+1

--srini
> 
> Thanks,
> Charles

