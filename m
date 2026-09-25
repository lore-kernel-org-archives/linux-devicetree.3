Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F764C1516
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 15:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790349005; cv=none; b=GI8KYwOqOVidMm6Drp7yG9MchNc2TkVQvHhOrlO20g/ytAEEjijtnlY4te3gD/10c7NyWYlseqOp7a5R2TkoNlOkinljSAt6bYgLEhoc1nZypwuu8fkShdqnb8wZjGz7OBJPkFtDdrZxqcUXFeU7+J/IxijCqfoV+hyps+WMFkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790349005; c=relaxed/simple;
	bh=NTMagOe3iDEq6kSdmNKtv1P83o1iBJtPMgZzB0KSKKI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i/VKT19QnUygq/Qmvb6Fxj0syXCGnou7ajkCW0+Fq6Tq6Q1uq72/0CeHmZluqDsMb/zOLdgJN9HsP8O1IncbTclkMu5hSjNbHGGtt7K/FGU15XGuAA/Cbk8whqIjV7iGyTLZN4n267lxQyJi76INm9+PWnM+JZX9M0twg/iDfTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A0sINOdv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zsv7nm87; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A0sINOdv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zsv7nm87"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PE0OkZ3628311
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 15:09:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iXOwP3BCeE+ZCCgkzQTuk+/ufaW98XhRNBc9TuOr0ko=; b=A0sINOdvcnqxhzlF
	8u63c/kpZj7gY95O85GDc8bkEccDTaV1fYLmdIYo4buPjID32z1pfy6ofz5ucSgB
	7hKk7WFbh2+nlHrRgvxlgewAS42iNYKh4xO4lsEKk9AwTOMFLE1SoRjdVWTORaOe
	IauMNx85eWv/dngWD41PYRNn7lNFWYlMsdsxStKhrr/f1G6KcOn/M0IVo9UIwXgN
	sBHUxxccBXsSlO+62GgWH5n5BjSdbsLOQHMLarVupSEBImQLtMNcgfM0llxkOGz/
	IgpkpVBqD/ZeDtU527rD+YxA+6KLUFMulVgFgI4TYa0zUbhtrUUnKyEO1AT4ffth
	NhfcjQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwjq39we0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 15:09:45 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7b335ce0f18so45118137.1
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 08:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790348985; x=1790953785; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iXOwP3BCeE+ZCCgkzQTuk+/ufaW98XhRNBc9TuOr0ko=;
        b=Zsv7nm87jw7nvWQNJfTi3B/JxHq9jmfj+ENeEOcl0Ppdthgwxh+zyvQ32GqJ/BzpJ3
         hGzxAgWcym8Y75JQYWoRjXkFr4Tc7AzgEcBhGoToGZhoV4GvARdetr37k77BJ8VhgOj0
         sjGjQftLfHonQpF7rpa5UHhfaOAyn7nIFBK/nTApk1adtSdgt/9aed1MJJttKZyKlrpK
         3EVNZuyCIf+T1SNp3lB3SkjDauP+GNokFcjynsDGTfX7tqqCsGlA6N3ywsCsJhD3bvay
         +Mq8od7kh1+AAY9RbUAlfunordch9UqVQ9l8PxK15oS3HNf558iwyZKEJ4GN/vNIdlIs
         R9kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790348985; x=1790953785;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iXOwP3BCeE+ZCCgkzQTuk+/ufaW98XhRNBc9TuOr0ko=;
        b=Z14qs0medPsWQLntxyZob7oha7C8nc2W30YJ2Z339LqIJPf3pwVMs+tQNNOwFw9bEP
         X4692er7CZi5KwNq0HEm4Qi4eHnScNvUTks7AQXSZwbaBQ0FW/gYZhdRgTgf5uLjXsnE
         zS5RB0Lhp9dJP2idZT3DZ7nP5XxxWEKeZ+Pw3zXAOPNI5OrDdnPQD2z3p6p/eKyAYKTf
         nZ/MKMJen/6D1DlxXQTaWz4BeaRPs6XNuZtB0QSxnFYJIpHvEvjSIdlWXRvIWanidRqM
         LD1PhlLG0YYKyDjzlT+LK84c64tJku64WaRbMIGjLLDT8vM3c2hvIEuKcwplfv+sP729
         JJsw==
X-Forwarded-Encrypted: i=1; AKwUvBwpXYNM8aBrM36/ZKkpA6Q9mwp8A8YZ0lYsx7O/BkbKApyMYKySAHRD/6eRGhmMxYrVBn2VdnnRsIWu@vger.kernel.org
X-Gm-Message-State: AFuF++mlJ1XeKeqHUB37NhrLUGQ6u+/CNgGredZkzqzppKaIeOokdDfX
	LVnER/lyH4qxuGSX8FaQNvI6vMiFQ86vxOZFnk+zv/Xx7TWZlLAfEVi2uuUHyD4tiMdvoFVTKFm
	tp73QO8tdPiGBT30Ud+Qig7EKcKY1WVfeLu4H6pI0N2hPcx7MHB0TmpkYj37Y9z85
X-Gm-Gg: AYBFou2i0rAsBV98dYu+dl5MesLXdNM3dxItPnaNAGelGg6E2GlLDxnQecvVFL4pH7s
	PcxAzaIRcstTJHTkp0xUUlXBoXcFKDeII2MQGaMX1Q+W96uZNuRvhEscyFIs/vJbL1TDj9fgtyo
	6K45Bfi/IMUnM+upjIoXp7Br8WXukf50IbcWDZMsCHYaT4grNgwoZbBStv8y4u7IDHOFSxMGi1V
	/w1pCiKKqzZVIYX2UGerfXTQycmylPn96pBcsJpAg0/IWCUClxfClWtnqdloIEN6UkTpxrZj0h3
	sXP6Ddl9BeB4tXUHI8wFF6reRwZBPW/qMpI/9u7yw1BZ0TQQwCsmBdAexBXihLl4fXIg3VQ3KzI
	inZqDmnksMnSJ20VeACtt2tKmow==
X-Received: by 2002:a05:6102:1490:b0:7a1:f971:78f2 with SMTP id ada2fe7eead31-7af1dadf678mr2604740137.30.1790348985040;
        Fri, 25 Sep 2026 08:09:45 -0700 (PDT)
X-Received: by 2002:a05:6102:1490:b0:7a1:f971:78f2 with SMTP id ada2fe7eead31-7af1dadf678mr2604724137.30.1790348984417;
        Fri, 25 Sep 2026 08:09:44 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49fe5dfa6a7sm247685835e9.12.2026.09.25.08.09.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 08:09:43 -0700 (PDT)
Message-ID: <ffb0bf6a-5891-41aa-a463-a4b3a5a530ba@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 16:09:42 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/8] ASoC: SDCA: add class_ops with populate_function
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
References: <20260918131914.681588-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260918131914.681588-5-srinivas.kandagatla@oss.qualcomm.com>
 <20260918140807.C04521F000FF@smtp.kernel.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260918140807.C04521F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MCBTYWx0ZWRfXxJGr6pjWlom2
 2LgspLjCA5pR5bCeeP0/iLhVqt6yrVIttd5zy7/eI2Lh6QzZ5EF3vAhO4VLHVXl+IRtfvoukXw5
 LJkaA9pS5TwtDmEsiOah77Trx7cGIyQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MCBTYWx0ZWRfX6tF9PY1mz+Rm
 eZyrGcJoE/Zzi3j6xATkwUkSiq4jB/1ZhG4LosSFcuUSf4NxilWjjo+4QqEZ3NIxKei6+9n9bHv
 8qgu+1IACKeuj3eRssJjpoYwqO5IVJXs7DgLCRZp3K/gDAvV7qg/r6w95w7OjPRpkwgjKNN8Yn+
 uJaBpCfv6pDvrYhhb1Za+K7Ey48aPCgexa/ZBxmGQfzdPanxQSk+BwNy7ESoZP+gqDEcOf7QMb0
 b+M0vg8fFltkKlJSY9ZI2Bqwc6gVWIywtTD7LQJKPv/7+dxs7A7BGXrH7QpvpUwgK51SHKfqqld
 2LyyRlJmKIb1R20bUGt7LZxXlVNWPSqSIfjgkBSjJijiPjdQEqr1feKRcJXo6hItsZlkmhboN/1
 TEBcL34GbuTI5WUDoZxJKlHLDSrNlh9PxmfWd2qmy3B7+U5Z8VzHDtJfnWOYg+jQuTxiohHuEot
 S6/3bphLa3UdUSLtL9g==
X-Authority-Analysis: v=2.4 cv=VuO2kO2n c=1 sm=1 tr=0 ts=6ab68eb9 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=zVefBeiqBZBOXOB_AKkA:9 a=QEXdDO2ut3YA:10
 a=O8hF6Hzn-FEA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: U9-ijlCuxlCJoLKoQ7BuYVCXNmvtvjMl
X-Proofpoint-ORIG-GUID: U9-ijlCuxlCJoLKoQ7BuYVCXNmvtvjMl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250060

On 9/18/26 3:08 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] soundwire: type confusion via dev_get_drvdata() in class_function_probe()
This is pre-existing issue, none of which is introduced by this patch.
I will try to send a separate fix for this. But this is not something
this patch introduced.

> - [High] soundwire: infinite spin loop in regmap_read_poll_timeout() due to 0 delay
THis is set to 25ms for tambora so it will not hit, but we should patch
the core to avoid this .

> - [Medium] soundwire: DAPM widgets silently omitted due to missing Entity 0 padding
Last entity in tambora codec is Entity 0, so its not an issue with this
codec.

> --
> 
> commit fda476b8426451c92a8bb60b96f3c646d1aed378
> Author: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> 
> ASoC: SDCA: add class_ops with populate_function
> 
> This commit introduces a populate_function callback in struct sdca_class_ops.
> It allows codec drivers to supply SDCA topology data from static tables
> instead of relying on sdca_parse_function(), supporting non-DisCo platforms.
> 
>> diff --git a/sound/soc/sdca/sdca_class.c b/sound/soc/sdca/sdca_class.c
>> index 0e6dead414959..79fdb672be1d7 100644
>> --- a/sound/soc/sdca/sdca_class.c
>> +++ b/sound/soc/sdca/sdca_class.c
> [ ... ]
>> @@ -144,6 +144,8 @@ static void class_boot_work(struct work_struct *work)
>>   *       allocation and sets its own dev_set_drvdata() -- the framework
>>   *       does not touch drvdata.  Typically embedded in the codec's own
>>   *       priv struct so codec drivers can keep per-slave state.
>> + * @ops: optional codec-provided class callbacks (may be NULL for
>> + *       pure-generic SDCA parts that need no quirks)
>>   *
>>   * Codec-specific SoundWire drivers call this from their .probe after
>>   * allocating a struct sdca_class_drv (usually embedded in their own
> [ ... ]
>> diff --git a/sound/soc/sdca/sdca_class_function.c b/sound/soc/sdca/sdca_class_function.c
>> index 411e3d717bb6b..d83be8474e7b8 100644
>> --- a/sound/soc/sdca/sdca_class_function.c
>> +++ b/sound/soc/sdca/sdca_class_function.c
>> @@ -329,7 +329,14 @@ static int class_function_probe(struct auxiliary_device *auxdev,
>>  	drv->core = core;
>>  	drv->function = &sdev->function;
>>  
>> -	ret = sdca_parse_function(dev, drv->function);
>> +	if (core->ops && core->ops->populate_function) {
> 
> [Severity: High]
> Does dereferencing core->ops here cause type confusion and a potential
> kernel panic?
> 
> The framework documentation for sdca_class_probe() explicitly allows
> codec drivers to own and set their own drvdata:
> 
>  * @drv: caller-allocated sdca_class_drv storage.  The caller (a codec
>  *       driver, or the built-in class_sdw_driver in this file) owns the
>  *       allocation and sets its own dev_set_drvdata()
> 
> However, class_function_probe() retrieves the parent SoundWire device's
> drvdata and unconditionally treats it as a struct sdca_class_drv:
> 
>     struct sdca_class_drv *core = dev_get_drvdata(dev->parent);
> 
> If a codec driver embeds struct sdca_class_drv anywhere but the first
> position of its private data, won't dereferencing core->ops read
> arbitrary memory?
> 
>> +		ret = core->ops->populate_function(core->sdw, drv->function);
> 
> [Severity: High]
> Can bypassing sdca_parse_function() here lead to an infinite spin loop
> during hardware reset?
> 
> When populate_function() is used, it skips the default initialization
> of reset_max_delay to 100ms that happens in sdca_parse_function(). If a
> codec driver forgets to explicitly initialize this parameter, it defaults
> to 0.
> 
> Later, sdca_reset_function() passes this 0 value to
> regmap_read_poll_timeout():
> 
>     poll_us = umin(function->reset_max_delay >> 4, 1000);
>     ret = regmap_read_poll_timeout(regmap, reg, val, !val, poll_us,
>                                    function->reset_max_delay);
> 
> Because the internal timeout check requires a non-zero timeout to break,
> won't this cause an unbounded spin loop if the hardware condition is not
> met?
> 
> [Severity: Medium]
> Does supplying a raw entity array via populate_function() cause DAPM
> widgets and routes to be silently omitted?
> 
> The core framework topological helpers explicitly skip the last element
> of the entity array:
> 
>     for (i = 0; i < function->num_entities - 1; i++) {
> 
> This was safe when sdca_parse_function() artificially padded the array
> with a dummy Entity 0. However, if a codec driver provides a raw entity
> array without appending the dummy Entity 0 at the very end, won't the
> framework silently skip the final legitimate audio entity?
> 
>> +	} else if (drv->function->desc->node) {
>> +		ret = sdca_parse_function(dev, drv->function);
>> +	} else {
>> +		dev_err(dev, "no firmware node and no populate_function hook\n");
>> +		return -ENOENT;
>> +	}
>>  	if (ret)
>>  		return ret;
> 

