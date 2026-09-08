Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7252F5616A1
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 15:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788881709; cv=none; b=CTR4ff0AkGHFOZIckgh0co4dHe2qCFDe3yS9im7UXzyh+Z4G1LwPJpolXyfQf8iQ310MCXKzEfwI93FxRR0z8cGbL1cfV/ZLBYslRv/hxBUvGa7ALUlBuforDo3T5b1hkXC2D3vKvx3WEiH0SyAy2/ZIUM9SnwSSnd/izUJcrdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788881709; c=relaxed/simple;
	bh=ztsuEXkA78vbJ/cDjG4h6EM6vidYirOFvoPafcKsGyw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vFL3jzX/4N2jL8yIFD57YlsIRcCmSUzraKzvGawIg/7jZg0tpkxmoWBzcxph95jPep5Vidb0AIdfVvjhuC15241IQKAZPhytGYqVs5pwtwGeEEYaNkxG5S58J8UsKpOTM1A9U9s9cVFUYGM0KDMrcZQOIuDET4yJQK+XZic8MuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ku7Qaw9/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=itf0JZSV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ku7Qaw9/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="itf0JZSV"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688FV2P13305272
	for <devicetree@vger.kernel.org>; Tue, 8 Sep 2026 15:35:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jWU/mIfZINgM9vt3ezwIs0OzEJYoe7zBqZ/JKgNh3Co=; b=Ku7Qaw9/RpU9AT7S
	ldYZpRx+ImifiHDmNWZXMsjUjGqnPZB6gQE+dD/3Es5Rkl18unPftyebqqsJs0Ao
	B8y/SbkCz38nATer3K6reBbgwlPZXpXUZFStSyQKqloCRaem2zMMZ3JBINWZ3UrF
	eQXP6I/1b37caaDoXSbScuejX0oYQTqGacX3CB5Cn/BR2CIBCmaW6CXChn1bpgip
	3KPQbs+zGAG7TwVvVOKuop9euNCGi0RCgwBQfZQbikH/uYNB0G+tKUfs9yMFX0aM
	dgxyHRxSZAvpRTncJf31XBtyhOmcUPwcWvPQLFT9F1+AjcqvQDrh9Vp1W49YnlM0
	vP02Rw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjf1chrn6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 15:35:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9394ad7f64aso740069885a.3
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 08:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788881699; x=1789486499; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jWU/mIfZINgM9vt3ezwIs0OzEJYoe7zBqZ/JKgNh3Co=;
        b=itf0JZSVGvS6NDIH939VH56tlTSzfqlxgI2hWYJBFpC9uC+KInqZ0MlWZj2Gksof/o
         i9InprtXIyPOZEqMJYhHB3OWQeYfi8UeKmladJfA0q9AhyhN9y+c674UUr+GcPiTfDC4
         AOlaWcLhNnEbCq69BbucZHzrlC9imBKx7teVudLinUJXY8wLXzBTOAMgJrUzXVXxJG4L
         586i0RngwyB1zdoNkLVlG1Yz4P2+ZLp6v1FkGmYkFkFzIbDFR4GD3ay+6Sl9vkhh7GQT
         mQD/3I1XvpNt9H+FhrRB0tcRaU6AUhEaaTNTjEeN5QcAQhlTBjCWv9+Ytsa5XZ4ByhIk
         MsoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788881699; x=1789486499;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jWU/mIfZINgM9vt3ezwIs0OzEJYoe7zBqZ/JKgNh3Co=;
        b=bBYpQ3SoJhmIrSSZPdvjl1yI7vDyAnMTvweWB/9GJjo4HBfLuOZ9BlUhFBwxfB0RZa
         uyoWPmNkbyq/THj57oqlIS3ruxuGUblwf7UUWp5CCfIgFGlF8Lqwjau6/+9Ry5T0Fn0X
         bsl9UF191hwFNrMo+dX8IBfoivXo21Mx0OGcN5sQrHijKS/0ZAmRQLTlCxyxSMpCNEt7
         8UCg8mtK/rs6fT6p90qBucXk14FPy31Jy5yaJ1bdkrhw53LGJkF8gJyA1GbnHX1RC8QR
         64FxJqFwDLMJGX4eTfZc4HW9kVgA0v1s9BunPhI+jkEn+0hjmQxdsxjt+rF9ADeqiwRL
         hC9A==
X-Forwarded-Encrypted: i=1; AKwUvBxFH9AyMTc+G6Go8RxsarX0Q1edKqwbzxTBFbVQ4hT0feWwF1ZCo6BNS8k0ebBoPu4FG0d/KW4NdZwQ@vger.kernel.org
X-Gm-Message-State: AFuF++lJ7gVLZJuxeZwRHJfEbPUL8Fsj/Sy19rneD88iahEJPkEStVTE
	6fyfGat8N6hesQfFTFHc1t787yn04a1rhDCt8bJJbjyFcJxL32Dc7ZRUjNeIOCrp4x9igRpt1bO
	Q7ED0ghlBHr3Y8jxmVjT0BMCCbnomVac1zbrtlJgeAs+rWMnbqvOWCyvluxQYCx+yk7K9fjvv
X-Gm-Gg: AYBFou1UklIMogv9ATu5EDJ0gNgC5ql178ERbpiFKiEOFI9SPXyKIKtsQTfVy/FAcE2
	W1X1KpcwQcySTo3qND1CYj2JzRSVp6nE5zjrb0TFIBtbO+3ruyD530QnwGq3hBn7wNxgKeCoZke
	G4qKgFyNFfHLEptfnauiXssFnQ6qFW5EqpdCD39+WjOIPv6CC0g4IFrAEOysIP4r3Ngl+D7tAJ+
	3TFMBF6wdAoXMHCIWctSMovq/1HbLKNvf6XS4cdBM1pP5DFG0NyoY9kpG7/hQ1WcmXzAQ5jly6k
	BTI3I7dMTlF+y0cBhX5e9YiBNZL8XTCTASLqxjVtqVN3P9NvE+Joun7zWWxpScETcCUNCXEeqNE
	p34CwgvaALRTjeK54p2pVEivoU3A=
X-Received: by 2002:a05:620a:6089:b0:938:d7e4:7fe with SMTP id af79cd13be357-939804536d0mr3563034685a.37.1788881699525;
        Tue, 08 Sep 2026 08:34:59 -0700 (PDT)
X-Received: by 2002:a05:620a:6089:b0:938:d7e4:7fe with SMTP id af79cd13be357-939804536d0mr3563025985a.37.1788881698939;
        Tue, 08 Sep 2026 08:34:58 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4858ac2b4cdsm35628669f8f.16.2026.09.08.08.34.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 08:34:58 -0700 (PDT)
Message-ID: <9c0adaab-b725-4ce6-86cc-e57dc33bfa9d@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 16:34:57 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/11] ASoC: codecs: add Qualcomm Tambora (WCD9378)
 SDCA codec
To: Charles Keepax <ckeepax@opensource.cirrus.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Takashi Iwai <tiwai@suse.com>,
        Faiz Nabi Kuchay <fkuchay@oss.qualcomm.com>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <7006ad74-334c-41cb-bcc8-9ef5e75dde7e@oss.qualcomm.com>
 <005e3c81-778a-47bc-a8ae-fb5c38ea2e2c@linux.dev>
 <c7fec9d0-b79f-437c-ba8b-37858842c545@oss.qualcomm.com>
 <ap/MFVMHG2Hej8k/@opensource.cirrus.com>
 <a6ae0ad4-6fb4-48f7-9636-7c0e266b6940@oss.qualcomm.com>
 <a6d1f575-2431-4951-ab5b-e5bce5ecc63a@opensource.cirrus.com>
 <af9a7339-1e21-435a-9d58-b29977195520@oss.qualcomm.com>
 <aqALjdlyZfUb5fDu@opensource.cirrus.com>
 <9ed5d56c-9231-407c-ae7b-9c608c603254@oss.qualcomm.com>
 <4d6ed30b-65df-4f29-b0c2-245e854021df@linux.dev>
 <aqAq0TPQ8euPoXXj@opensource.cirrus.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <aqAq0TPQ8euPoXXj@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VN3tWdPX c=1 sm=1 tr=0 ts=6aa02b24 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=UsgDQBPQtW9oUzukNeMA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 5EOUkC2_jIi1txxsewT-8VL5HoPEmtQR
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE2NyBTYWx0ZWRfXzlSxZD+67Uuz
 q8EMdmzmjKcB9kQWns/oT4aN00g/ACEedS8F02Wy1aKI1kyHmIbdpW3xLMKSOjdyRQ0K5e5tze9
 3UgRKlzFc9sTaFkwnzsCe3udC6WSC+w=
X-Proofpoint-GUID: 5EOUkC2_jIi1txxsewT-8VL5HoPEmtQR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE2NyBTYWx0ZWRfXx9xBqpOWNbfJ
 GfIm3uKWK28xhHQIJAkmw+50aRtIGJA7RwAWzy58MZXHo7t8JA1z1Cu2rxeclpcMEvkeDp8A5ab
 qaI4aQCbT09hqALMjGwbSdhbIm1poOvtTnMyji/Hi201JF15KBY7v3SUsDwplbO/MvQGqfRlziv
 /Puzes/PKslGLLP2aWuJ0e/bg8DdTDyHlz2V3MdszN+xCwueKNVgqFAWmpZ8k375vx7ds6GBLsK
 3NQKrQR2lZLxJnY5zkTbLYzx2oYHpLN5RWYho0EpeyU4Ss85KY2YSNyLquPnhFKV2Lqz2WBwT4V
 rlmqevxu34MD3gJTvEmMr9VTixoHU/KtKz2nOkTGty6d/7V4nyXbMUm1mJzsBDoBK9r8c0LqCTE
 bZD9aXJ9Ok6YAo2bSDE0wf5x81mUM+K92na6uhc/R/ZWmTwbUMh8sCSS8NZvWlkY9OKdxGXddM/
 vd2aTzIGItd0Gwg5XQg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080167

On 9/8/26 4:33 PM, Charles Keepax wrote:
> On Tue, Sep 08, 2026 at 04:22:53PM +0200, Pierre-Louis Bossart wrote:
>>>>> That's why the current series takes the lower-overhead path
>>>>> (mechanical transcription in C) rather than proposing an intermediate
>>>>> DT format as part of this submission.  If the concept-DT direction
>>>>> gets traction at LPC 2026 DT MC, we can revisit.
>>>>
>>>> This part I follow slightly better, I would be happy to proceed,
>>>> pending reviews with the current approach, although if Pierre
>>>> is or not probably remains to be seen.
>>>
>>> @Pierre
>>> Please let us know if you are okay with this approach of C structures.
>> Now that I have more context, I don't have any objections with Srini's
>> proposal. It'd a good step forward to use common class drivers across
>> multiple vendors, we'll probably find a couple of bugs or harden the
>> SDCA core and that'd be good progress for everyone developing or
>> depending on the ASoC/SoundWire/SDCA frameworks.
>>
>> If this means that in an intermediate step C tables are used, that's
>> fine with me. In the long run, things might change with additional
>> options such as:
>> a) ACPI support on all platforms
>> b) DT hybrid mode to reuse ACPI/DSDT tables
>> c) DT native representation of properties.
>> We can review the preferred direction when the platform firmware
>> plumbing improves.
>>
>> I believe the point about binary/opaque data was noted by Srini, it can
>> be handled in multiple ways and there's no reason to block.
>>
>> Best to start small at the SDCA level with incremental changes later on
>> how to fetch DisCo information from platform firmware - that wouldn't
>> change the system behavior, only optimize by making the translation from
>> DSDT to C tables un-necessary.
> 
> Super, thanks Pierre. I will start working through a more
> detailed review of the series.

Thanks Charles and Pierre for reviewing this series.

--srini
> 
> Thanks,
> Charles

