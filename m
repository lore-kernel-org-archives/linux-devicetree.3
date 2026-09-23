Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88A4481FB4
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 10:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790158693; cv=none; b=ZC53PhS190qlnLDIcXLS0UcMKLgovCGS2QfJVZoPDZHkxX3I87gyCT2Tb7TfvBTKGLnw+6QHk2osjD5Sy0eK9IrvBD7vE1vvdhOHfI9UMD01L81rOa2MNAxHNrST9pYR2p0LgxS1QdQqozpSAXVqTfFwkVIfEDsemJNshcPHydM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790158693; c=relaxed/simple;
	bh=z1ZwbLcUNGvULc+QXyi5mL+WX2bmwwnwUztcSc1jjyM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sW2w7AXcweG9E1uZ5mS9hm5wB098/Fo6lAxdQOcAnc9iApLAvqtBhgosamifZJ/2atcYeHMDH3Wm9Pfh8Uuv49d8zS4dZ151Sooe1waMHp/qGQrefQRB1e0mDEH2sH8hhGjah80tUX+t6V+0y+u2V+YM72dg+gLgrLn6ZzKrpVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BSwDJoXD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CPWQ9/3U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BSwDJoXD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CPWQ9/3U"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA2f0H2429421
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 10:18:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qsBE5yNUcKf7Yo4ZHQLDHYBWTTYgVcUf/x5nuIeu4NQ=; b=BSwDJoXD3HJXdLTq
	yPR9NPXhzNzpW6pMf8JX9NbOl+xij5Dzn4UbD4xePCvuBM7JZccuney8z29I0JNv
	FpjxPBLX8gK0phT2ZhWOgvSkW5mQ8OAmN7vubgjruT3B+XV0z6VWDCnf8+jjuCkR
	2JbrkqLxSYqC1IPQQ9qk9sPvq6PDW7za029uoJpSs/BSWebnQkT8F8iHvGJt+RMX
	fYMNv0vXP1OWjXwuLQegjI4e4pQvBu4bn7SzBQLcWKvf9GlFZSMSMQss5Uqtbx4S
	EJJsjvX6OgR1sX/+qTeV+84zCzwQKoCRT2KJkDaMWT1vbhy/MGTbSeDUBzaMFf6t
	RGn7iQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv9bqh0yh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 10:18:00 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33bb08e80a8so734788eec.0
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 03:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790158680; x=1790763480; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qsBE5yNUcKf7Yo4ZHQLDHYBWTTYgVcUf/x5nuIeu4NQ=;
        b=CPWQ9/3UbXkk/qbU1mcUa/ackzXMXZgR6pBWIXO6EQIPcaz5VM0bcOaeC6j8LHHseC
         5axNKGrOxxu1eJleX6HqdSRoPbHZuzsZ1PNXKNF4d+n3t6XQB6a5EvYPuu+8/u2gRDJt
         Cct+vXh0VxTS62iScPA14jDWyw+aNi2pz2jV/Fh/SiuzAMvo09Lakt9JTJj3TsMrbn95
         D9U883lTNh1y16VGwjezzQE+2rcLf2k/pj3HxJjVpaOrxYjGxwxvHVXAJ7wq94qXWIlf
         SIZscueAn6lRIq+CJAOPnEvpUWIwso/e8PP0Nkh2+xaADDzvCK1pix+SWzmcNCXsTJYZ
         s4KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790158680; x=1790763480;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qsBE5yNUcKf7Yo4ZHQLDHYBWTTYgVcUf/x5nuIeu4NQ=;
        b=FBNGOmyhpvTR68GbaT0f9ARMdPUpEWOjMMrJ6gdvJFwPmE1vyLjR78fnYOAnZHlaGn
         6ndz4JA9KSdil93DyY/ie8TAthx75qEmNgH3Vx4CGKXoXPJ/wfcZwF0PNfvYa2Lg8wdJ
         l9xat98Njw5yCI4OEoWkUMvLzDN+X8zx3Tt8AaQmkzH/A2zIazS+avXLgVh7Jy9edmBd
         PqsLXjH492mreJ8t5C9pJXmGFvc/IwJebkiEtkLR0RftSO3wRFClRowWWt+Vxkd4RMXr
         2dF3GiQGNrCPir1VbhKJ1cAJt0wbz+DUu2DwKcWr9NJD27yDOQeqLCjDqJ8DTOE4bZdl
         jdqg==
X-Gm-Message-State: AFuF++lWPbsSiOKFSioCtxkqTWZT0ld1Bch0b9drR+QC7edwPtXPE+hF
	eKkMfQaLOmN+4iBw/7ab+PxTV0H7ekipNwxHtxGfi5QVS83gKcbFCrCZSslifAXov/ugkHtGRUX
	XqXnw4n0ILax54xC3Bijz988buEdVyhZd+SI7rRDgLD0LkNjxNpsGsA7j6MhPdDKo
X-Gm-Gg: AYBFou3Pk+tlBuMQb++vwwSqqslFMOejiHDYieWnvfkI+a8ztlWAvc8hvii1WBHXeNC
	ZFvwPTVJJ9nD5uKivJsAIo8R6sDIcyUftCecI+x1zqHNfIUZ/O27qs9gCkn4coOFDL04blkJZbl
	UG+wlGHhL5kCpq00GaRmen6Sg+RpATGEf7yuF/QQy7oduIzbYFJi0g4FEnHWUaP6w10FSScwiNH
	eeTAOAkf3FRY0QEeGXU7zInsb+p1z/Vv04m5HD7XV9LPW4uK3KbmQle8Ce/8/WXlZxHdsNZePBz
	eDQcLTvI1I12a0k9kTLN4fOw0OW/PLYEC5W6inOzkkErwa0ReNYcF7UFGDHrA2NLCp5fJ5YXesC
	T+k7Kry7Y9Zgnswth1+6Fk2Lftans
X-Received: by 2002:a05:693c:8005:b0:33b:da1c:9bec with SMTP id 5a478bee46e88-33e5ca9ae39mr2432334eec.15.1790158680100;
        Wed, 23 Sep 2026 03:18:00 -0700 (PDT)
X-Received: by 2002:a05:693c:8005:b0:33b:da1c:9bec with SMTP id 5a478bee46e88-33e5ca9ae39mr2432301eec.15.1790158679401;
        Wed, 23 Sep 2026 03:17:59 -0700 (PDT)
Received: from [10.218.7.34] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e939fdd91sm5885830eec.4.2026.09.23.03.17.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 03:17:59 -0700 (PDT)
Message-ID: <e8b656aa-bca7-4a1d-9588-c082a4bd665e@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 15:47:56 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] mfd: qcom-pm8008: Tolerate missing interrupt
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, mfd@lists.linux.dev, lee@kernel.org,
        conor+dt@kernel.org, robh@kernel.org
References: <20260918-pm8010_i2c_support-v1-0-de33d78fad9d@oss.qualcomm.com>
 <20260918-pm8010_i2c_support-v1-6-de33d78fad9d@oss.qualcomm.com>
 <20260918165721.CA17C1F000FF@smtp.kernel.org>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <20260918165721.CA17C1F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: HAwn_WHCbVQJmscSNFdBhDwz18djx8pc
X-Proofpoint-ORIG-GUID: HAwn_WHCbVQJmscSNFdBhDwz18djx8pc
X-Authority-Analysis: v=2.4 cv=WZuZ+EhX c=1 sm=1 tr=0 ts=6ab3a758 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=y5K7N4shZw4fCDjzXqEA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0MCBTYWx0ZWRfXx9XOr3fC6B1+
 lTRoJaacR/xQ3hyGcImez8epTTMAhfKb3MQ4UrocSnhhEqnXzJSsPmUg9xSKtCam+SD02kyvkji
 RplBVs2QdJ/iOCR9/1/oskf2Oc/jHGs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0MCBTYWx0ZWRfX6qOAn6gyEpJA
 yUaNTmI7Wkak4+wfeLB3jkS4F5VDsB5pLKx+/CHl+qYcswObvPq/rrNthoOUv1WjlNaTnD55eCp
 d/2ZCNNBDSNxENnI/pH0uPGAMfltrSk6vM4liZHb/BJLq4dw0mb1xZNrK9YSqO+BIBz91r2Xt2P
 GOyBL13Mwh2v2aWKXWBWi9pGeuxMPxxn/T74PflRDk2EEfF2APi/E4aPh5A6XGeKWwqrnxXM6xf
 iaELnf5pUNOfFjhXS2LOex8uGUiR1kgbIKVSFMbtphdCcxFZo7iEY+f4pmFMvim9kRzdNSC9cSL
 3v/jNpYQAb8tAsnsYoQQWd6i3tjbkvSPSd9k/2k7vHy1R+5aW82IDuCA3teThSeK4ZqaoC5cKwT
 f5te4c4DRGtcIi0YA17eks+IHos0JDwAxkrAu9jf1k93VXcvY62lsLluhXCw7rd0GPSyEWyzpKi
 LfrLuRzdMvZulTZk9Uw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230040

On 9/18/2026 10:27 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] mfd: qcom-pm8008: bogus IRQ mappings for child cells when client->irq is 0
> --
> 
> commit 2c273914596163e5696becde808ceb33d98f0fe8
> Author: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> mfd: qcom-pm8008: Tolerate missing interrupt
> 

...

> [ ... ]
> 
>> -	/* Needed by GPIO driver. */
>> -	dev_set_drvdata(dev, regmap_irq_get_domain(irq_data));
>> +		/* Needed by GPIO driver. */
>> +		dev_set_drvdata(dev, regmap_irq_get_domain(irq_data));
>> +	}
>>  
>>  	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, data->mfd_cells,
>> -				data->num_mfd_cells, NULL, 0,
>> -				regmap_irq_get_domain(irq_data));
>> +				    data->num_mfd_cells, NULL, 0,
>> +				    regmap_irq_get_domain(irq_data));
> 
> [Severity: Medium]
> Will this lead to bogus IRQ mappings for child cells when client->irq is 0?
> 
> When the device has no IRQ, irq_data remains NULL, and we pass a NULL domain
> to devm_mfd_add_devices() with an irq_base of 0.
> 
> The MFD cells (such as pm8008_temp_res for qpnp-temp-alarm) specify IRQ
> resources using DEFINE_RES_IRQ() with hardcoded offsets, for example:
> 
> static const struct resource pm8008_temp_res[] = {
> 	DEFINE_RES_MEM(PM8008_TEMP_ALARM_ADDR, 0x100),
> 	DEFINE_RES_IRQ(PM8008_IRQ_TEMP_ALARM),
> };
> 
> When mfd_add_device() processes these IRQ resources and the domain is NULL,
> it falls back to assigning the IRQ as irq_base + start. Since irq_base is 0,
> a child device like the temp alarm will be assigned a global physical Linux
> IRQ matching its offset (e.g., 0 + 5 = 5).
> 
> If a child driver requests this IRQ, could it steal an interrupt from another
> hardware device on the system, leading to unexpected behavior or resource
> conflicts? Should the driver dynamically strip or adjust the IRQ resources
> from the MFD cells when no parent IRQ is present?

This sounds right, I'll make this fix in the next version of this series.

Thanks,
Jishnu

> 

