Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE7031B828
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 08:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790672012; cv=none; b=hnl26KO9lt2Vy45qKMV5zfCcNo+wD/ODm7urskqYeJl0VXovR7Uk+D67cGCcgpGM5V6WnHrDgskWULSTt4LJv40icXOunnyyuLBOjgtNTcHAWf3ZvnErMHS46CbzM6NEdYTZttzVl2yv78ImhflMGzjB9eiKd5/2kMfYBq0Tbrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790672012; c=relaxed/simple;
	bh=kbPd5aEB88RVKC5dTRS0nFWR0+S42v2EQ0FuI8qym78=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J7tZJ5ApNZYafu31FShjHgUl7a959z/kGRq6krkAm5APyvmljhzGH89V5hO6EI+0hT9Xe+fYKpiKtdAjnmb16PdSx0xtMjNtGZLtRf9clnUJLfsJTA6bQMKhSonj+2BB1g/3XA5EYqsFoj/ndhSA1/OWxY4o3Rh1GkS5Z0Dr8Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dy7lHe70; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SroB+0e9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dy7lHe70";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SroB+0e9"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T7Tml84097717
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 08:53:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mDtlofeD7haSM+lzJFlUgBc/2wfLYIn2wjTkFseiHXg=; b=Dy7lHe70TQudM+wi
	wL0mZ5qrqMwol9lb+JSLRrCKJxrRGAEyHZxX1mPFwjxLU1y9nDbPx3EEyftAlHtq
	kXBFSa+SniulUWEVIssinETeZtjxG6UsK0QwHWmvGuCzOzuyAtrbQUUjpAoiWvWN
	XTv7XNXvWtBTjLXz9NxAWAOn/2WaESwGS3Lg6RCfNi2Db31zhkVH87iQfgzKHHuY
	OkFdID38oPXeuWUqTp2sEW/6wwk1rdUe1MdM8Sj8srtJv91V72Vv9ZMiP5Th2xJj
	rogPFcLO4RsrSbxvt5FXCsIksUzc3ghhiAPhyYItRibKHe9MhT93aCC6pfKuVVpo
	YRDdGA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h03ew1kfy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 08:53:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93c614646e9so429458985a.0
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 01:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790672009; x=1791276809; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mDtlofeD7haSM+lzJFlUgBc/2wfLYIn2wjTkFseiHXg=;
        b=SroB+0e9JM8oaRpopi7k+Tgjm0dWHWO6iqfuy2IEKdEVg81uCSyZBkNl3jDIE91SBm
         ZPqtkZNX9MyGpbmKi3Ovt/sfZsxkjwiRway0vHuwmR45+IOpYmEO/K4EaJbKWAonhytL
         sf9B4sunE6lMXTEW4C7Q5AfPHEV8zAYDoRpj5/iUox1TtJlWEb6kUem+7mFHB5rY/EEG
         k5LINt15kDkkcmWOf7C2xnb8ptapIaRSLxFgR8RaOH1z1Xlk0HZlH1r1+oLR+98aubm1
         YvVpt2U2UewkYxReFFlulQ0INNHhaYEY+fsEThSXAMCMpF+5ru6zm99fK317xQrz7Dai
         rzaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790672009; x=1791276809;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mDtlofeD7haSM+lzJFlUgBc/2wfLYIn2wjTkFseiHXg=;
        b=1TxZ317Cf6T512w0uRh7jiBo+wXdiEX/pbK9KslnZF1ZdIMOlv5XyD0OWoFbUiisi3
         57mL9SiGqOJdGpEzxezRVGfkrzNRUEv90egCkHdQcd4EMbPxXJTW5UARB+18By8PFB71
         wdIq0fRFIx9iVwqWCfxT4oBFw3cuirtb4B1j8dYJMTJ4UOO9WJTn8nJBlV9ml/v+KwL7
         KEXRQVB/wlOP3IdEHqw5KjIPz1rln1F/S9MzRwq6hFhxZpvy8u81p13FF2t1fohkSR08
         UOUrMPyEMy/25BAgacy9Bk6XEU1O80/81B2yJpg4mwLhfcny4r6nC9jX6fZyUiIvvjab
         sI8g==
X-Forwarded-Encrypted: i=1; AKwUvByBoWbAxqcJ0uLDd82qSTgN4rjjN4mG5JVYVbyUwPpG+TLwhcKZAU1u4A1IN8gycr6CH0rKc45jgzOH@vger.kernel.org
X-Gm-Message-State: AFuF++nr35UDhQVybXbSwukgdkG+ThU6wm1JSpyHq/5ojqrn4W+e0Q0T
	5fGqYvTKF28zqIfKATNhYkOHjaiUvTneaGlu9lbASQubxb3enWrehqPaQ19Ja4BbYNN+t79YO3a
	GYGYmQhctQNDgaalKCstttg2yJpVM9XgqcUsQFCtz4ZnMngf1Sa96mUjms0xXStSM
X-Gm-Gg: AYBFou0gE9j+EqnboS1272dUOtbp4XUMLZo12EvcdBl76LbVB0GROlUVOaR4eWYEHDu
	6pyn0hI3ke0hr2RD9/olSpXqvHQIr7Ae3PJNDFFXzoHt9ZN9C/5FdGobEiGFxEtRI23IrIUIY5i
	LtT3TUpVqk9sgoQ/Ws3OZPox8rPZdnrDexkentZGOzqXHKsxesyKB2PN/wlUBD7UKXvdC3t1rJL
	d0LuMXE8xBTTsqj0En8fxO9WcQZQwMWswAM4fNjNEx9twSbJzEfb353RdNuXMUIhg391MWkfqdO
	JvQjcZjdASUokSvJtL6obMHx/IO7TdlKsjzIZUj+YyX9GmSKFm5If5I0aZu6WRYvV2JOTcDAL+m
	8O1UR7Rmq93qnGiD/9rCSg+6Al/mCVwfb+hYdUnt4PcjMzjM+PSlTBIeTV1yDsw==
X-Received: by 2002:a05:620a:2b97:b0:939:1222:b9f1 with SMTP id af79cd13be357-93c439cff38mr2562087585a.0.1790672008568;
        Tue, 29 Sep 2026 01:53:28 -0700 (PDT)
X-Received: by 2002:a05:620a:2b97:b0:939:1222:b9f1 with SMTP id af79cd13be357-93c439cff38mr2562085485a.0.1790672008082;
        Tue, 29 Sep 2026 01:53:28 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7? ([2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a012387337sm18281345e9.8.2026.09.29.01.53.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 01:53:27 -0700 (PDT)
Message-ID: <5c0317c1-f4df-4b2a-ab03-2a7b7132b1c6@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 10:53:26 +0200
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
References: <20260915191131.25214-1-sochnev.v.74@gmail.com>
 <20260915191131.25214-3-sochnev.v.74@gmail.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260915191131.25214-3-sochnev.v.74@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAzNSBTYWx0ZWRfX/M+QaGAKVnuR
 TvEPgUT4aHGUIPVelormKGtJd3qVCNGvtAbWZgW49huk30RTMqm+eZV/a6Gv2/WL1R8kA4tczu5
 Gigr9rluoJnQHNiiUyCvD4U8Mfa94jQ=
X-Authority-Analysis: v=2.4 cv=IIOXmQvG c=1 sm=1 tr=0 ts=6abb7c89 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=pGLkceISAAAA:8
 a=4F_TT5Ia9pFYpsbeirgA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAzNSBTYWx0ZWRfX74TjFijeEvIx
 V+G4dBjb+x8bflgpPeVygEOQJmBj4lgk3RbeRlfUxsFvBsH0tsvBvUSolySfDn4Nmor1vrH5hEm
 nCM3XXx/fZapaBfrna5EWGBBdHDzkRbcEYlVak2SLRMLlAfX9UeHIBZS+O2xKlZTRYoXg3ci44Z
 cnir6/sVircQSYb9OeWKG6OlF23bKT4uv6sWMJv4AHmJdqoZTyET452NLjczGqrWC4ZkLK+RYwv
 4cEjvrhD8l9j60hdITC6KG6kIZbllOfycr8v5y+ajp/DkHNC4CtInhnDrlqfatBG5VjCTJu/E8/
 eZI33nvURyu0SpWXLZTkOnEsb30uFmANzYAV8Gn6af+ulFWQxFFfQ8cxYmV7H5/iB+uInXsrBou
 Wv0f/k0dMuXHNSloWbaBsyd0CnYp+5XP14g/Kltxdfg6bo6OpeeC9w+fmkjHOpTWNOV2HeDiVmi
 uvHv9dgvGxcIFQbQJuA==
X-Proofpoint-GUID: OPsh3FQF1Hj_OgesIkjCkW5I_TWq6STU
X-Proofpoint-ORIG-GUID: OPsh3FQF1Hj_OgesIkjCkW5I_TWq6STU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290035

On 9/15/26 21:11, Vitaliy Sochnev wrote:
> A read selects the sensor and walks three diodes with a 10 ms settle on
> each. Nothing serialises this, so concurrent reads interleave and
> convert samples taken at another mux position.
> 
> Mux writes are dropped silently unless PLLRG_PROTECT is lifted, and its
> save and restore do not nest. The cached TADC value also skips a write
> after another reader has moved the mux.
> 
> With the AN7583 sensors read as parallel zones during CPU frequency
> changes, a zone crossed its critical trip on a chip at 55 C and the
> board shut down.
> 
> Serialise the sequence, drop the cache, check the selection after
> writing and after sampling, and return -EAGAIN if it does not hold.
> 
> Signed-off-by: Vitaliy Sochnev <sochnev.v.74@gmail.com>
> ---

Should this have a Fixes: tag?


