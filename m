Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177132798EA
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 04:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782708686; cv=none; b=hcU41rQob7dkkY/lF2lXmWYTAv/EAYwtIpVDjb8lzQnuzxUAMPKuoutzrRWtr627GNvYTRzegiLT/1g9rPI52yu3Soa2HN/2+RBvG3TKYUz6sYom1mZUI+ueSncJ5arbA8LW3ByCWbMr6HMJVTlt/WqSaxm1LbUWiiNAVdVmZWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782708686; c=relaxed/simple;
	bh=T2k769MKZqT5yEUVpWFWxieUNhOvc2eKWBo5shbADlw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TsMWpoTGZfubmxOqTqLgUf0V7Rh7i52xMGVLBb8bgV+ynLItmgmFzvr+80Or6UPgEuBh/MD84wuy5OdhecgybHX01ClP8dcbg4ojoliktsACoZ1ML+hw07FCZ1aWVH3WerJoDUbi3ocVYpqdT5bIQ1LDoE1xR+ByoziknrBU3TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bqYWQPJN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TeMox3Da; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bqYWQPJN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TeMox3Da"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T4NDIT1718813
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 04:51:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	STdw/jIr7I775vO0I2+wfAaDmJDdKjY7SxCC86PcJqQ=; b=bqYWQPJN1syE/CZK
	0d9/ly4zI0dILjUJPETN891MR7IZkedrfQt/jb4uPx47H9mM6MBgw62ElYGketeZ
	bdpOY/G2jVuVGe0NNLcMRXHneieD1Pvnhv6eGxl4jBymULCkYrSk693DqePdjHgg
	EcdwAXo+RxRVoWo9ZsEz3rOTiVtA5kbD1DtW1BCHSH/E49W1NuCcKxWHlpKaIXnD
	mRMA0kEgWZsSgMtCdTWHuW1LTbOZaWJlRY7cMkc8RXvN8UruyKv+wWkZKvoWs1kw
	TuezOHjzPuIxF9hOlGHtSRARvjo/BF/oK4GrzYJ1roxiR+flDf6VuBN89OvgU1TP
	+XHirg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f27pf4brt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 04:51:24 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c011c7cb9so7239046eec.1
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 21:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782708683; x=1783313483; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=STdw/jIr7I775vO0I2+wfAaDmJDdKjY7SxCC86PcJqQ=;
        b=TeMox3DafRuu8g0nMGV1LuCo7V0XURRN+rhY2CLsPFquyX3zzTo8S5spn1MdsY9DTP
         YAINA9+1k6nWDferdqTeZxEm2bzPBF/XDlOBwIYD6RtFawlTaezMMcnimnfpyS/OXlkr
         Az6Od+7T4HHU8phq5SIag78HmNxto9LRQHHd+uhIKt30w//byFnpaXS06qfkCKj3ayby
         51V8ReudhkxkuDQkw6JOa2jqgqpKjTX62zXnKjBnEKIRV5Tdx9cryEY6Mi0Ucnctw9xd
         PxHsOCnjj8X6gWQYwdcExgn0sqiIjh/VbMCUiPcsLnd6fVzW9n9JLvhU0HFyEU7IeKLG
         8mqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782708683; x=1783313483;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=STdw/jIr7I775vO0I2+wfAaDmJDdKjY7SxCC86PcJqQ=;
        b=aAzi+VDd4vjgjZ8OQvqjx8LOcjHnK2G8MT83aFHcHL3p9AUBEMaU+nqmBHeRJD0UHj
         gp/dUybyTj5m/UK155fjMb7GrYXn7FuzqiWTCwf8q2lAMMx+edO/fiXLwAxQo3wW0kSB
         1bteIr51qkUT2CNs8M51NpnyAfnFiTINZkcUGGuM8FYnYnRkefqdDyyGCbITM5BUD7KV
         r9BWfcDhZL8ISIYxWF+sAUAODW0oBtQN/zNPezaT6RFzURfj4EZIv0O2+bRt7oBYAhkk
         0/vHy9yAWiCzyh+bY2PNoYZ0++WMirz4IZIWFBRdyUFbZPRYUU0T2yX8wOyDpKepC96I
         OyZA==
X-Forwarded-Encrypted: i=1; AHgh+Rr+LfRGezXoYMvzjjbQifkrdXVk+Orwb+UaO6j3HoS8DVC281Ada9aDOMCLNfBCMEoDGL0OWmbehyyH@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg7lqbsKmXZJNGU4z6lkySzlrZM8oZQPDEinOw+kIjO5J0pPqH
	EI94RWnfjLg9hiiWFJ47J2aMZ+yN8n9R4co1IZWhecLaHxaNNK1RPziD5YUGiucYVVVtt4HdA8Y
	z1soIsE+mZaa9SA6O8QgpqJzYnVHHmUDTYgLegdjFOluwQTRhLeT+u+aYXE3RahjS6mjMJ6lS
X-Gm-Gg: AfdE7ck6HHvAV78iTrNKflj4V1cJKjD6DYiDMdwVSvnoalVDxvrFWQMsVXvdX3iCPMb
	mCKAhqseOq5lcqRxDypdAJbG+W3mlxRwrvfCUEY5T1Fhsp7F47eNERSilkvbBDqGDr5h43iP/KS
	NAcL/xl2414CAINfGe4UHZHX8Xu0yqJevNm6rM07RTEyMqjU4U+pGZkq145qrhynhNxAx8GZp9X
	mHQUrvd7LTuGghB3yIomqBkkkpyfNZ3yfFr9PKpzfpEPICdGqkGdKZbU03oDBo7BODL6CyqdLO4
	Ltd0rtZhw6Su3os4+ScO0wO3QW3I3vsY3vzNYge/WRC7h6HbXnQrbs9i9CFawk9zcGgleXZgz9L
	h9145RsM+PcNCjX1os2hmOt6P51Q59LqXBo/XrxD6oU8GtPZ8PQ==
X-Received: by 2002:a05:7300:2152:b0:30c:43fb:3a69 with SMTP id 5a478bee46e88-30c84d9b4eemr14897187eec.6.1782708683581;
        Sun, 28 Jun 2026 21:51:23 -0700 (PDT)
X-Received: by 2002:a05:7300:2152:b0:30c:43fb:3a69 with SMTP id 5a478bee46e88-30c84d9b4eemr14897168eec.6.1782708683084;
        Sun, 28 Jun 2026 21:51:23 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7ca87caasm39793578eec.27.2026.06.28.21.51.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 21:51:22 -0700 (PDT)
Message-ID: <4228e2c6-e5d6-4173-a0ad-4fd82854dcfe@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 10:21:17 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] ASoC: qcom: lpass-rx-macro: Add shikra compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260608172023.2965292-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260608172023.2965292-3-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260609-pretty-coral-weasel-e951ef@quoll>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <20260609-pretty-coral-weasel-e951ef@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDAzOCBTYWx0ZWRfX3IyPpAHRNfPl
 pXdQiQd4ZD7SYGn2XTUSYzxGAX1NBKQglswbf/8WKfsrySmNxb+rQcxNOuul34Fk1CqkCjfiU8r
 2N+lm45+g/zYnDlQoTDUoZPIfGUS/VE=
X-Proofpoint-GUID: L20XpR8ITqwy9b6KmqNJjsy2c7vWn6_k
X-Proofpoint-ORIG-GUID: L20XpR8ITqwy9b6KmqNJjsy2c7vWn6_k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDAzOCBTYWx0ZWRfX+uZj4AqeoL0C
 yjKct4ENfREodtihp8rV9TlKMXOU81JhPmVKTmczuHXcOZC0evIIU0h6tUE6JW3T4RIsT24W+sh
 hAIP9wBKVlHXpw4RIUnm+C9lolbzWpS2DD6Qw5DMlfiZYuL0UA9KWNH/DSEWYgcM5K+6aGrMRgu
 /cYmB/8dgpc9nuUTQD+82V//OjG5BnT90U041UbxhBBFcwHpgIYN+fKD3Ecr0dazXJNRhm5aqp+
 uG4hl6E8m+n3pRxeQhuBbKqPVoWh8REs/QlHB5UYLQomAQpuCy9cgK10chJywXJ7f7PeIjLTbeH
 nasJbs7e0+q61/SybX/IdITazBwn4n5c69zIyP53a2oinQnz4BYDc0vY66Ni4ovvQx6Slw/Ohd9
 M6cSteOL0LxiU6ae2hlMsdu5ExLTMqBcfmB38i0Ja7VtvZbBFk0AbkIg+cHS0uvvsdpQqjz6qHT
 TTjqMKzOyJ6UMnBtxRA==
X-Authority-Analysis: v=2.4 cv=R7Mz39RX c=1 sm=1 tr=0 ts=6a41f9cc cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=r26TJLN4OFIrFanpHjAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290038



On 6/9/2026 12:58 PM, Krzysztof Kozlowski wrote:
> On Mon, Jun 08, 2026 at 10:50:22PM +0530, Mohammad Rafi Shaik wrote:
>> @@ -3648,6 +3655,7 @@ static int rx_macro_component_probe(struct snd_soc_component *component)
>>   	case LPASS_CODEC_VERSION_2_6:
>>   	case LPASS_CODEC_VERSION_2_7:
>>   	case LPASS_CODEC_VERSION_2_8:
>> +	case LPASS_CODEC_VERSION_4_0:
>>   		controls = rx_macro_2_5_snd_controls;
>>   		num_controls = ARRAY_SIZE(rx_macro_2_5_snd_controls);
>>   		widgets = rx_macro_2_5_dapm_widgets;
>> @@ -3809,6 +3817,7 @@ static int rx_macro_probe(struct platform_device *pdev)
>>   		return PTR_ERR(base);
>>   
>>   	rx->codec_version = lpass_macro_get_codec_version();
>> +	rx->bypass_fs_control = !!(flags & LPASS_MACRO_FLAG_BYPASS_FS_CONTROL);
> 
> Is this specific to Shikra or LPASS v4 codec version? Commit msg
> suggests latter, so detectable from version, no?
> 

Agree, this should not be Shikra-specific.

The behavior is tied to the LPASS codec version, so it’s better to 
configure it based on the detected version rather than flags.

I’ll update the implementation accordingly in the next revision.


Thanks & Regards,
Rafi.

>>   	struct reg_default *reg_defaults __free(kfree) = NULL;
>>   
>>   	switch (rx->codec_version) {
>> @@ -3831,6 +3840,7 @@ static int rx_macro_probe(struct platform_device *pdev)
>>   	case LPASS_CODEC_VERSION_2_6:
>>   	case LPASS_CODEC_VERSION_2_7:
>>   	case LPASS_CODEC_VERSION_2_8:
>> +	case LPASS_CODEC_VERSION_4_0:
> 
> Best regards,
> Krzysztof
> 

