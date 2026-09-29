Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D9A3CA486
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 16:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790697971; cv=none; b=lNp3+pfLrtmCBgtVByoVWwxo2m0P+6HJhsJouD1RQiXRyGYmoR8XoZmmRdXPIVuMbw36m+XHZ45LN/gsY10nebcmwbyIKW7LEOp3ujMvbgLDUaojiGKLErI4zdSX3id76w4Z4x1OzZ3X1LW0r7PvymVZVUvhfT/+QDn7ALck2mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790697971; c=relaxed/simple;
	bh=0KMbIGlkQ9Fdd4ZOQI+nyu1yu8DbaVrV6KBtZclJbNs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=utZ3QYpXTwmzxA5vtCs7CHeuMR2CuLdRTdORjxwg38ipUlXjraoBEGzavio8PvBHUMCOYAFkmj2sT/+OcKosj4tKnz+5AOOVBnbZNxhek7QqQNW1XATXy8NVhlbpKZW2Avhepczn4SFrRHWGf8LV/X8zx5803Rxb68uPHvT2CnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YJ4ze8yQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j0lR/4EE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YJ4ze8yQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j0lR/4EE"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqlZK205001
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 16:06:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KCEzOarjsAvhV1WwVWXKXzlUThiKoigcykcG44bqyDc=; b=YJ4ze8yQ0UKQGuhF
	lypgBv+kwWCcUQsBrnm0h2TmU4ScPT62nrfZPREIli6hCakpdiWJzsIx0APeI6CN
	27o86YY105YOeS8i69lMl4Ai6jrUOL/jPJn662cmIKMDlP/z7+nIDfI4EbYw236d
	NZN1OOTtl5Y47VOxSjY7UKGaz2XWEdOS82ND0K5wSKAF9tEYdFreqjKCK09TFz5C
	Qd4ncX8w3cDuFZiIn6WN/cviIekM8rT+i+l8MiwVd/iInvZZVZE7ce5RUqRbSJzL
	GsAqUMHvi8bV1CJcVwwzKemfWqiC/bYMiG+Q8KUANFvb/L95B+RLlkgRCd8UUmtp
	7D/uZw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0144uxp0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 16:06:07 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-988bc0ef0easo198552241.1
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 09:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790697966; x=1791302766; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KCEzOarjsAvhV1WwVWXKXzlUThiKoigcykcG44bqyDc=;
        b=j0lR/4EEY5qMzC+ZRzClfDKzbWJQa6cJ5C7InwhTRzEUl4ufTF7HpL1LVXGWd9lSFK
         Lu/8qgNbE6nZRyrsEHU/xSMpyO/5yiqcoXlLhtoQ+kjgZZ8U/PkIlVQuNILjV4bSUOU9
         ivPnWjK4dgenbUoKX4jhCNaWS6qvDMb0WrnJXOUdHGhX8KpMdtftLqicMwyVjrJFnORS
         Y8liyZKRof4gdONwodpEZmPqp1kMo8IjDEUEx05hXMh17tsaVkz7QMcR/zMmzPwg+JLf
         k/lvI80Wd+PuEnBYUnLnrRlmSZ6UlAroSTQk7yiTAjX4unq7wAsrBccHgNndae7u25dc
         HaGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790697966; x=1791302766;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KCEzOarjsAvhV1WwVWXKXzlUThiKoigcykcG44bqyDc=;
        b=q6LuaUwJKEV2XF4pw+c/cZGKwKw2N/P10Jr3d/DjH7oYADiTWGOtCiqoZ6KoW+DL7A
         Nv42clbJ+dtilfmQDTIedTAz7Kw7qYIwbIxkUZQFvM3SHtWQGMaS0H6gvpz9TBfkH01n
         RPv/eQz0xpMHVXeg7nkpAxUEs1cvx4Upaw/+DnaBdBbH47OFA0dVSIVKbcLQUMEKFPCm
         Ae+pXj+1Zkst0oP0kd00+fx6hKdcD7ELoDXGZDZYvgExoy0kOfVzaXDdlOInYGOXJhwN
         Juwcv8HK3spnVOsyI5VQN79WNZGwFKRATmKp8TX0Y7biHQ4GIhYneLFrZxpamSwjEewL
         vkAw==
X-Forwarded-Encrypted: i=1; AKwUvBxumxYFVVNIbKMgujxQ1CYR4/wIw7D5oy7IupQXIYfrpY7epmFp5jiJpKzeuPBplyHMeNMbM5K8SZ5L@vger.kernel.org
X-Gm-Message-State: AFq9FYKiP9v+nF5GrfnTPB3Dnrs4msT1L6AgWNPJA3B0hVny1byfjJbu
	yi9y7t75Ws9He29KVv2rMCDaaGFAv1+9oAzK+t9JNkSAfkjs30ZUYwnYi332egd67gzn6qVuCQV
	92AFfDLky6UZcQHlaYaKzmzmKuvj6q6I8UwE4pWmwZLCBmx2esf4noCUvkbOKLeEq
X-Gm-Gg: AYBFou2nhboXkiXh9VwAeozySOvS/ZQOvD7hNju5SKlAmKJYdWF7oLEkSL67QRNk8Rl
	7kyZrBLBmKlQB7ZaAdpQ0wOWc17qg0SsmI2Sp8PVZ616k3EV2lB2vWRc0TJAwiTO99wWrCE7yBN
	EsWBrT6/b72VntDmjuzQm+muji7591b91+3vsZpCMJTa/KJc23JasE/wBpk/ryvNRU0m+DjmiAN
	LnC29dXZ0WSDLhwltg8Ho73xf2RTNL6c6D1z3FGZBEFWYN1CQ/+CW6MRPD+B90W7LjO6EP6frB9
	J1Ih+cNoZU+0o+kSU4a4PtU//Dhv8Xuh7wwM0YgLPLBy5/i/nGUd+ZFsTMD5nsCrv7oHUmHtHbo
	UCMxqHbgIshim+S8GSw==
X-Received: by 2002:a05:6102:3941:b0:7af:87a9:28e0 with SMTP id ada2fe7eead31-7af87a9296cmr3601907137.12.1790697966348;
        Tue, 29 Sep 2026 09:06:06 -0700 (PDT)
X-Received: by 2002:a05:6102:3941:b0:7af:87a9:28e0 with SMTP id ada2fe7eead31-7af87a9296cmr3601887137.12.1790697965785;
        Tue, 29 Sep 2026 09:06:05 -0700 (PDT)
Received: from [192.168.10.46] ([37.167.105.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfec703sm82549515e9.6.2026.09.29.09.06.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 09:06:05 -0700 (PDT)
Message-ID: <77b27663-c248-448c-848d-308d774dd413@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 18:06:01 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] thermal/drivers/airoha: Serialise access to the
 shared ADC
To: Vitaliy Sochnev <sochnev.v.74@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Lorenzo Bianconi <lorenzo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <5c0317c1-f4df-4b2a-ab03-2a7b7132b1c6@oss.qualcomm.com>
 <20260929160356.38468-1-sochnev.v.74@gmail.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260929160356.38468-1-sochnev.v.74@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA2NCBTYWx0ZWRfX+skLqnWyyxbY
 PpyAhVSN4XfwOOMoDM9swTf5KkN6+hWzZXNnwAd9oQw+zIe41yLDokgBse06ADLTVIBBfC+5V+h
 SdWBQJDJHzhH0sfyQFg5i+vZvgqPdApGjuPhDlo2Gx+9ntfY8JH7SvZDZNp/pl9jTgQixo6Rugh
 3OToe5GNxv2t+6SlsjMNySf6IuIkn/rsNiyAhchAJ4swKDhpklFWVbMTreM2uRb1ClO/BpcXYSZ
 jWlhT+qu4FMCZ4fSlX9EIllA9YWNmQK8hts8DZPxzFC6DQfXBBbtKTSl3Kzghx8/TM0CbitGAH1
 DJ10+InE9fd+oXz4o9Ja8CeQOqW4KlsxP/0T4qMfDigZpiDmEbhkiHOvXVe1sPVkkkEOR9Q20OF
 sRBG4ACT/fTFAANpHubGU1LbhGmx79J5SRafigwt8UAJkExUUoTUpPHdJdZxUGGkle2JWm3L6BP
 vG7zvD5E3Y2UZBYzGDQ==
X-Authority-Analysis: v=2.4 cv=FJSOVOos c=1 sm=1 tr=0 ts=6abbe1ef cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=kT0prZ8Py4Rt33E10uL5pg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=rWyjvxLpqfaSTwYGxYQA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: GlyNDLz2uTVPJovspyUbP-djdVOIE6pw
X-Proofpoint-GUID: GlyNDLz2uTVPJovspyUbP-djdVOIE6pw
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA2NCBTYWx0ZWRfXxJ0y01JYVM0D
 AK0oOBCcAiclN3U06zAcdpomLYrOwqoIWeRwsaE0dxwaD5nEG2xUmrD8LhR8LpplMFZkEsgFo1A
 fAmQ7CuHxORfdBJ6vdy90h5B2J7C0WA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290064

On 9/29/26 18:03, Vitaliy Sochnev wrote:
> On 9/29/26 09:53, Daniel Lezcano wrote:
>> On 9/15/26 21:11, Vitaliy Sochnev wrote:
>>> Serialise the sequence, drop the cache, check the selection after
>>> writing and after sampling, and return -EAGAIN if it does not hold.
>>>
>>> Signed-off-by: Vitaliy Sochnev <sochnev.v.74@gmail.com>
>>> ---
>>
>> Should this have a Fixes: tag?
> 
> No. Before this series each device registers a single zone, and
> thermal_zone_get_temp() serialises reads under the zone lock, so the
> current driver never reads the ADC concurrently. The race appears with
> patch 4/4, which registers a zone per sensor; this patch prepares for it.
> 
> I can state that in the commit message in v3 if you prefer.

Yes, thanks
