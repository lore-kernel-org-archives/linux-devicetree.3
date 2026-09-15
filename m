Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7343C13FB
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 12:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789476106; cv=none; b=Bd0PamfcP7SjZDbagvtet0VI5qBeHJm5QmjW9bPYRyh9qPp4Bqo1d3vD1ePxYZl0VHnzEnIlkFuVxdcFx1duX3OgBtGh0s3c4TZ0KlgRvPtOU9R0QlmiVoA7gkaR36khgsYd54+eVcOENqQopVBBBzelhkNqOSUDPZlUAXomzxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789476106; c=relaxed/simple;
	bh=8xJdsPUuBUKshmuBeGFPsWIjoL0uo/tgR0qCDPFQCDg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V2bEuQkVjgfbGEBzZECgTTWGmmJT2JYfiun2xDZ/5kwis7xi7LDFmtZZL7NxaHNs+DEXY7opI+S/m7hH3usbpJlwDbIuf5Baoj19LShPKuthysAegH/k7AULyUV7p26xHyoFDOKUwVb36KAV7FNsdVlV6/8cifK5mNigMn8fQks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Udb8LRsf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Aym/sRZm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Udb8LRsf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Aym/sRZm"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9h4833317453
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 12:41:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5gEgvPvT8xWf40byy7jStKrUnMKLHbVboNPicag8Xe0=; b=Udb8LRsf0Zsvo9HO
	3zKGyrHpajP543xw6UZ3/hhjHShb0sn9l0WDXdq/TSEZzxnGECoL5pS9bV8FNqfR
	6rKi1Kg9AsXiRehLR+OVr2OgwbHZeWRDx5eH2lH0rdfXLyNu9ye/VPOiVP43sjtK
	g7PSTNYfrHkTJOr+rEEo89ye5vZmbJIK0JHiPDKRB15/I4FTnMy1i9g4n3MamBlG
	Bfb0elnmmcz5RNowM6vqRsO3pdt+CyEI7perLJ28WTqtO4X1Cwckx2NOKn9nB0Qx
	6vE4bZU9iw1G8ZrlUkLqUiKP+JyuHNTcb4NwhFh7XTRpjLwhobI6FsZEfL5C3K/C
	5P20Rg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq38e0u45-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 12:41:43 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d6f75c1219so92256635ad.3
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 05:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789476102; x=1790080902; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5gEgvPvT8xWf40byy7jStKrUnMKLHbVboNPicag8Xe0=;
        b=Aym/sRZmOd0xcPlOURepMZWZZxpwtbYQT3unhyJn4WpgPGtD829JRqK/dEaM5VsDlY
         XrB0ByynO+i48yuyPMJXamr6cvstevgOsTPU+Bx9Ty46NhSHNBJ2EiGcuhnegwBgMQ/s
         KUu7y+ho2foKmnpfmiEu69FKyYnxKCJoabKYzVB1xp5TDA7Ks3fHUXb+0htzMtJ4CKRF
         9US03KVsKtHzGaQ1eGI1vWvEpgmoONMmPopf0FHp8ahVLd1s5p16epMQhArfmFSgqTuY
         WfmS3CpAEXVWsNpadSffJeVjRwio0hHBy5Y9IksT/j5HfI8srJ8VHKFLHSsgnY8q0UuM
         XnOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789476102; x=1790080902;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5gEgvPvT8xWf40byy7jStKrUnMKLHbVboNPicag8Xe0=;
        b=UlW53tyKV/O525rnHYPKWpeKS//RYaM8OiS/PiiR3MHkRbi2LydOpHeucokg+s8RFO
         nbEF4eDb1kgmuJD7GcG8gUGhK+XpjZa9wUsrKagPWDVDJ3Y7zytjxWBENVbKK70TQjEd
         8fas+3Tx35tiTKqaWUQgsEbqYyQSH170bkZVhVJ59xqs8F0cYjfwrLLInYG8HQRFLvtI
         u2DsupZmqjg99YAaIJkf1wP1RZzDJP6fG3m65o1i+Szbz6hvy3FZK85Ypf/QD/kjc3Vm
         r8rGhPJxtk4Xodb47YPPcmIfZD7BC7fVBDdte88g5Eyo3D4hIuw2nkqg7BIlmLRBbXR8
         IOxg==
X-Forwarded-Encrypted: i=1; AKwUvBy14r8oloowy6SeIvp5O0okWvHzfOv7C7zgSbgVGiiOHwhBmpnMVP96z9aYpa/EXJnqjh79X9lxDcAb@vger.kernel.org
X-Gm-Message-State: AFuF++lIoUHy8QOy/0hGcJYJHFeRr/npPNYukGBROScpl302zKKnm5N1
	vr9RXq9Yo5rSxwuURlS08uicoknjoqIie7WFFOky63bvd22gZMeZeYtEXt+LgWUIXxwwydUBKu+
	A0U7fa4iI7aLn+xajZqQu8KRJfFdQSOLv74DS0xEn7ouKvx/5DSahwR00d9yBX/3i
X-Gm-Gg: AYBFou3H+6euskayQaU1AAUMSUxCch9pB2EGKNJr4+zgJBYWUtYw8zGBTXn2J+zIAtC
	fcMeC36GNzfilp610qHvDjhY2ync6FR9nTpu02lLArXUlDVCEmHVoc8Y/+ZCtsOByv6DbQraACR
	EnaxEHKbeBY26ntl6EUD9pA5CS8a5A0dMGqZLEXyY17Bg4brtNFfF2/0r5IMmoHGQyERQW54LFW
	jRhUI1RkKu+8HC8GSP15Esh/1ASJVds4DQApLw1Dj3cHYLrPaB6VWGrKMhEgSv0KVzSO2+6zydw
	MT8pFd5ddAO/E6uHbS6ku8LrYoW4upHwQZCijt/17LaxPlTzXrok7BrrloSVtFUkq6R5qX3f1j+
	jq6Y/vvFzQ7X1CAB+HaZuOchBfUOfIiduxYrg1/4=
X-Received: by 2002:a17:90b:4990:b0:39e:ad:d31b with SMTP id 98e67ed59e1d1-39e10e2d518mr1366178a91.6.1789476102400;
        Tue, 15 Sep 2026 05:41:42 -0700 (PDT)
X-Received: by 2002:a17:90b:4990:b0:39e:ad:d31b with SMTP id 98e67ed59e1d1-39e10e2d518mr1366120a91.6.1789476101955;
        Tue, 15 Sep 2026 05:41:41 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfd6cd982sm5508609a91.0.2026.09.15.05.41.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 05:41:41 -0700 (PDT)
Message-ID: <14883b46-c632-4f00-b3f2-89568c4b8844@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 18:11:36 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] ASoC: qcom: lpass-macro-common: Add LPASS codec
 version 4.1
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260910-add_shikra_support-v2-0-fdd2129c696c@oss.qualcomm.com>
 <20260910-add_shikra_support-v2-3-fdd2129c696c@oss.qualcomm.com>
 <20260913-illegal-quartz-raccoon-be0d06@quoll>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <20260913-illegal-quartz-raccoon-be0d06@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: -q7ZriI_9qI28INmnQkigB_-AD23G0cx
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE4NCBTYWx0ZWRfX7ZbsYyY4KDCb
 i6FEgbVXTM1BcvkwJckoKICqpbzUGM5g9apk65Xsr+hSXFSxAtKPszLq5LVblZvG2T9F6yjPYBI
 Q/tNjgw/DzMuWhOkEy+ElLY3d1Mrb8Q=
X-Proofpoint-ORIG-GUID: -q7ZriI_9qI28INmnQkigB_-AD23G0cx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE4NCBTYWx0ZWRfXxEIVHnHZZl/r
 Eza+GsnWwr0kFwzP4f1kxwZWp5ET61dv82EPrrqAOrpduJ2PbL5k398zOjZrCfIV1OEcwY1oJtm
 8AWWEAE1FqLWz1mq5U63TP5XUX9rciTF1kw+EEvua9Y4CswQzS80w5GdqiUYF+JsebkyuuM1aT6
 UAa6j/KYeaXQtFf9K9yVElznWiHC4zxDTZ7lE0o5f38Pwmr4kg7XjLQTG9qsUWwXrY32chn1e24
 jr94qOhH2queN0qA8FV7fs/hSawvlkrgco6YmZqJmCa7ocmZ424MsJno+dt/j37xcG96FCa4B97
 Zd3GxiYMRlJvtMuv0yAi5tzUF3GIsJvyr1GdjVJZfOmtuRX1Y8Gw5j7MrmAtFY811Aag1ERSSnD
 uowNCQDbgW4xqCbrO8TePv1E0UqdCNr9J3iRDPaq+g1YtN2kat/vjRR8qKcO0Erw8g3kVqdl72s
 7pcGa0Rv6iNsdQFWm1A==
X-Authority-Analysis: v=2.4 cv=BswIUoX5 c=1 sm=1 tr=0 ts=6aa93d07 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ZrgDs7hp3a_oj-6vkJAA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 spamscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150184



On 9/13/2026 2:16 PM, Krzysztof Kozlowski wrote:
> On Thu, Sep 10, 2026 at 03:16:54PM +0530, Mohammad Rafi Shaik wrote:
>> Shikra integrates LPASS codec version 4.1. Add the new version to the
>> codec version enum and to the version string helper.
>>
>> The enum stays ordered by version so that the existing '>=' comparisons
>> on enum lpass_codec_version keep working.
>>
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> ---
>>   sound/soc/codecs/lpass-macro-common.h | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/sound/soc/codecs/lpass-macro-common.h b/sound/soc/codecs/lpass-macro-common.h
>> index 573b2145e..b52665b11 100644
>> --- a/sound/soc/codecs/lpass-macro-common.h
>> +++ b/sound/soc/codecs/lpass-macro-common.h
>> @@ -30,6 +30,7 @@ enum lpass_codec_version {
>>   	LPASS_CODEC_VERSION_2_7,
>>   	LPASS_CODEC_VERSION_2_8,
>>   	LPASS_CODEC_VERSION_2_9,
>> +	LPASS_CODEC_VERSION_4_1,
>>   };
>>   
> 
> This commit no sense on its own. You added dead code here. Add this with
> an user of that version..
> 
Ack,

will fold this change into the patch that actually starts using the 4.1 
version support instead of introducing it separately.

Best Regards,
Rafi.

> Best regards,
> Krzysztof
> 

