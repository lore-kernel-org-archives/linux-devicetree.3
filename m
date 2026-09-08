Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F142F619D
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 13:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788874457; cv=none; b=NVARCIfj59SSVD+tjEPFfN0nJROiULBDyjjDqWQPZYyfyo5el3MzLR70lWxhICGZnqmIqU6b5Kp6aPLyxEjeLONOnHw2utRQBnAVpvCgC9K/Rdc6iLy5UsleCMPtS4u6/1Aj5Ro6GoSZ9hq9mnxvJaFXIfGERaX+kRNHjFgnjF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788874457; c=relaxed/simple;
	bh=FjvrtXgSJzrkNWDSJewmiNLwdxNXgytWznHFxUzyG/o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ar8Di5NlM+aTorrTWzkjrkgGud8Zuh2T/jxDkRX/mheNLVTuoItqJDWMk5E1h90bcd3K8wzL8ZglCEy9Ee9+0taTtLV8D9VOHb+ryItB2LA2MeYYreHnfPwG7BHVCXZNztD0gqBYTNgsh6R1Q3v7ixTPWi15+82ItAor78GzljQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jUm4DZ9U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VKdKRbeL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jUm4DZ9U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VKdKRbeL"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688D1dpt2411861
	for <devicetree@vger.kernel.org>; Tue, 8 Sep 2026 13:34:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EGBQTQwqiJYHaFi2riUHM9ZZfmyJuOH5IDkuXvGXM5w=; b=jUm4DZ9U5YqaYH4W
	zT1OlWHlCdHRli+yw5AWuoZzV5g9k5LC6er0QBDPVWEpRoS4o9yGViLzI7AtQ6O3
	9yBLck5AKW48h3gVXXUSMAm/FHOQgd17GzoZHt4xpgBqwvlbfSzc7K9r/EQSVRBm
	nPZCSKaH3AG+T/PWDYfTfadyw7IWTEbcPdX6iQssy/+FFIgXJgdCxIm3mHr8zlHK
	1QC+QEoPOXPsbDlPSXrCtYba5ZvW57t48IyW3H8RkgMKXvOE7ZvNcOpYamK7ki7S
	ulOuB5ijO82rVFDfbJGm+4AWParJ/A7TbEiMTdaXUHqp6ElDYCo73s+/dusKYMYI
	wtcprQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjjvug4d7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 13:34:05 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-98087b0c5deso3025857241.2
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 06:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788874445; x=1789479245; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EGBQTQwqiJYHaFi2riUHM9ZZfmyJuOH5IDkuXvGXM5w=;
        b=VKdKRbeLp0Np5CTIH1jMgDGP/Mrmq/LSmCrt88LgGkz95H5zvJuiAORW5DJP13qrxq
         ynzAQnq0K+CNVg3+gYQ5i8JZrKowFJPrOnmAdPxBnpzt2QxTshOk98KuCl/IF0M5/Jdi
         P5SPSBlufDea3V3bUFoiM9Jsa9fkGvOC1JtCvNWpVtLr22wYS4k7SWFwK0+5tRzO5wE2
         v7KIK30no6biYZQfH5mkroDcJRIaMAn3p5QUCcZgaMNtdOWfnBnOmAJKWXtyNPTQZWJ3
         G2NCD/ubQrrpqPcOsYMV0yD2AXdAbXNBIMWopjJu1XIyt77ZgttmQNrSvWdQkmS0itGF
         kFLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788874445; x=1789479245;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EGBQTQwqiJYHaFi2riUHM9ZZfmyJuOH5IDkuXvGXM5w=;
        b=QIbW++uvWET8UHfC6sEvexam7HzdD0HXUmV5VL8GwabSbhjbAYviG/LmU1D95HL12Z
         55tOKLwy1YU7z+VLasagNRCC+Gkg8rI21G4H7+akOmCOArnGvPvLkOdIbDrXaD9tWN+l
         UDI6AIq6qjxpNg9+PzWca8bT9DvFQMK0oAxBMPw4IkXf5dw0Zpi7/TP8NygTJiOfaOMC
         n/hG9OaNhxJA0hzfHR452KsvXxxPBxzl4LAmwtUyV9BK71qNBSkuOvYZ+GtPSKPpcJhG
         VP9KFjAA6MPDzG1tcpsnAsgqunHHSB/YK6UadFbdH+0XL4qUqwOowql2V//Xla2Ax3LG
         4QtA==
X-Forwarded-Encrypted: i=1; AKwUvBy6/1PFD4trXgtfp5OuLL5Vrh7H81PMNfu81AFWU4jn4k74K+icAG6FeizBFw7eW9yFBfQw7dWxm9AR@vger.kernel.org
X-Gm-Message-State: AFuF++lleR/Pm+SjLyVu6RfPAzQ7tqPg+M4i2MDSynKJryqkQ/4KIelp
	ySSqCMmPzZxKA+Oj+b5IP516gctMiLaFnTBxHpebBPTMdTak1ZzCLa1h4+xB4YJ7P75M2awZ6Qe
	hPtIL0bjMd546VB6XcN4ITUEe5gFhEaLqCOr7vnpawiHQVZj0eeuu/Z+JoGC9ixoN
X-Gm-Gg: AYBFou1tTGkZitDCB2ZscH7BaIGgNdPV1COteRwHOO9sSmNF8zXTZVcNWDs6cOtosSt
	y3mqr0wg9HGAxVe2yEYLQdoZDWaZ5gvkM1i04Jvd0rI8dLXvK6GeW9XKXTGml0ceXLR1vr69vDv
	JmaUmI+uDlbuVOg5GWvs2Yy3vBtzsjBPFgF4O+2Dh6HlGCCulzKsWa0neYpEexDbimp74QCqhjL
	ar6DcX5Y3+ydee1jeycvGY27uBR4NgRWRHaWU4tvxKnmFn+q8mn/4CdbKF0VyshCrmIQ6lMasBR
	vbOcsY6H9VXs6m6oMYFN/wNSREskZ/PP2agzilFkeOEC6kF2x6JJ3wO7XbU7GzoK7tH220tHgy3
	ChTj826xopxrF/vB/fCX00lWAV7g=
X-Received: by 2002:a05:6102:5487:b0:738:1ef6:51b9 with SMTP id ada2fe7eead31-78a4a96d8c3mr12122008137.5.1788874444864;
        Tue, 08 Sep 2026 06:34:04 -0700 (PDT)
X-Received: by 2002:a05:6102:5487:b0:738:1ef6:51b9 with SMTP id ada2fe7eead31-78a4a96d8c3mr12121978137.5.1788874444393;
        Tue, 08 Sep 2026 06:34:04 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c262f97f1a3sm454448166b.19.2026.09.08.06.34.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 06:34:03 -0700 (PDT)
Message-ID: <9ed5d56c-9231-407c-ae7b-9c608c603254@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 14:34:02 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/11] ASoC: codecs: add Qualcomm Tambora (WCD9378)
 SDCA codec
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
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
References: <20260907083727.733705-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260907083727.733705-12-srinivas.kandagatla@oss.qualcomm.com>
 <525f887e-cb3b-4e74-8b93-30c3baeb8018@linux.dev>
 <7006ad74-334c-41cb-bcc8-9ef5e75dde7e@oss.qualcomm.com>
 <005e3c81-778a-47bc-a8ae-fb5c38ea2e2c@linux.dev>
 <c7fec9d0-b79f-437c-ba8b-37858842c545@oss.qualcomm.com>
 <ap/MFVMHG2Hej8k/@opensource.cirrus.com>
 <a6ae0ad4-6fb4-48f7-9636-7c0e266b6940@oss.qualcomm.com>
 <a6d1f575-2431-4951-ab5b-e5bce5ecc63a@opensource.cirrus.com>
 <af9a7339-1e21-435a-9d58-b29977195520@oss.qualcomm.com>
 <aqALjdlyZfUb5fDu@opensource.cirrus.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <aqALjdlyZfUb5fDu@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Q-aOj6C7U8UTIuVy1tW1sQw1bIdjgbHd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE0NSBTYWx0ZWRfXzGlXBqoRYBz8
 JpCWTPnQCRvHzRUZnLfH3HgxblC6qRxDbPU5YzBgVkLtmHORi5g9aRYdFk6qa6fmOhJ+prQDMCJ
 1x2+Y9sfs64HrbkssiENOBlyS8GA/abah1LREw4XoeP7R5HfO7WU6DUAiyoHDtexEbofD+bYkvr
 2VBy33PsN/ST+bI/RKygjjxDYpb9XCVkHFluxBQ1Bw+PoYWf2HPC+Z8nP5D4Fu8PsJwyabbgY82
 btwhigDr5RX91qCmQQHrzy5KASUHoCLY70EFsBQdFP06EBc2LYzBiOFqQCeYVep2GN60pbpVd5j
 im6gD0deRXcnP4TxcDUZmiil8ZbI842+LfKfVrtE/eZzkt3DB8UgTVUAEFwgpIU6yrRz+l1hVAO
 JRKSeLJYVlJx1z+rBoJqB9t7M6r0ejpJeK2B7IGyms1FIQV3rogf3qexUOb2R6p/cZ1tlC/IPg6
 dMIM/Mj24n2NkXDH1kQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE0NSBTYWx0ZWRfX+s2m5y1/CoZc
 rdpP7iK7mf8U/aNe1j7iHcD7sCXG2jVUzCd+ViRkxyA6gqdAQEEB5BouQmiQQyyagk8+6PLFX8o
 sShsbiW9cJLkdxoRS8GRl9USO7C0h50=
X-Proofpoint-ORIG-GUID: Q-aOj6C7U8UTIuVy1tW1sQw1bIdjgbHd
X-Authority-Analysis: v=2.4 cv=X8hi7mTe c=1 sm=1 tr=0 ts=6aa00ecd cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=_BpqGgUEnCmz7QHiTJEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_02,2026-09-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080145

On 9/8/26 2:20 PM, Charles Keepax wrote:
> On Tue, Sep 08, 2026 at 01:31:37PM +0100, Srinivas Kandagatla wrote:
>> On 9/8/26 11:37 AM, Richard Fitzgerald wrote:
>>> On 08/09/2026 10:09 am, Srinivas Kandagatla wrote:
>>>> On 9/8/26 9:49 AM, Charles Keepax wrote:
>>>>> On Mon, Sep 07, 2026 at 11:37:49PM +0100, Srinivas Kandagatla wrote:
>>>>>> On 9/7/26 8:47 PM, Pierre-Louis Bossart wrote:
>>>>>>> My take is that rather than encode all properties in C, it's probably
>>>>>>> worth exploring a DT representation of the concepts that *can* be used
>>>>>>> fairly easily and make the life of codec vendors easier - not as a>
>>>>>>> literal translation of ACPI.
>>>>>>
>>>>>> I agree a DT expression of the *concepts*  not a literal DisCo
>>>>>> mirror would be a better A.  I want to bring that back to LPC 2026
>>>>>> DT MC as a concrete proposal grounded in the earlier DT-maintainer
>>>>>> feedback rather than re-litigating it inline on this series.  Because
>>>>>> B stays put, switching A later is a change inside populate_function,
>>>>>> not an ABI break. so landing this series does not close the door on
>>>>>> the representation you're asking for.
>>>>>
>>>>> I am still not sure I really see what the value is in a
>>>>> completely different DT representation of the DisCo information,
>>>>> all it does is give us potential issues with future spec versions
>>>>> and create a whole bunch of new code than needs maintained. The
>>>>> ACPI representation translates perfectly well to DT, should work
>>>>> perfectly fine using the existing code.
>>>>
>>>> I totally agree with both of your comments, there is no way we can
>>>> replicate MiPi spec into an different DT representation, this brings
>>>> both maintenance overhead and is fragile. This a very big effort.
>>>
>>> But in your previous message in this thread you said the opposite:
>>
>> Yes I did say that, and I still think an intermediate DT
>> representation would be a better A in principle.  What I'm
>> highlighting is the cost side, any intermediate representation, by
>> definition, deviates from the original MIPI representation.  That
>> deviation has to be kept in sync with the SDCA spec, tracked across
>> spec revisions, and translated back to struct sdca_function_data at
>> runtime.  It's a real overhead, not a blocker, just something to
>> weigh against the "concepts read cleaner in DT" benefit.
> 
> I am very sorry but this reads quite strangely and I am really
> struggling to understand your position. I think I am reading it
> as you are happy to go with the group concensus on how the DT is
> represented and don't favour either approach.

Apologies for not being clear.

I do favor the C-style one that is submitted given the discussions that
we had so far.

You also seems to be ok with that approach, I will wait for Pierre to
comment and stay with it.

Am happy to fix any changes as required.
> 
>> That's why the current series takes the lower-overhead path
>> (mechanical transcription in C) rather than proposing an intermediate
>> DT format as part of this submission.  If the concept-DT direction
>> gets traction at LPC 2026 DT MC, we can revisit.
> 
> This part I follow slightly better, I would be happy to proceed,
> pending reviews with the current approach, although if Pierre
> is or not probably remains to be seen.

@Pierre
Please let us know if you are okay with this approach of C structures.

--srini
> 
> I would assume the DT guys would be happy with a completely
> different representation that was more idiomatic DT, that is
> essentially what they have already said. The question I was
> aiming for was less whether they will be on board with that
> and more if it is a good idea.
> 
> Thanks,
> Charles

