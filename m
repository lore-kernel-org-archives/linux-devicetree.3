Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25E33672A2
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 06:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778568705; cv=none; b=i1fvX+dfAnzFnp/wNirtKi3SXZieMG4fnJAZoxnAMdVxP9Sn7vJSfUF0goPJHGKy3x7O4+843+OClvR/t+MlrZxGv/EUr47GXiEXY7EH8rw0WlDQTEpUA8Q5WA/hjSr/nhSvRlcQq3/H9lhSXsXwmwe/06HziD2whWvbeV/WsAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778568705; c=relaxed/simple;
	bh=l2q/o3YLzqVvVBD9xt5YoGvrCny7mNfjFIlkwFKF4pI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fOo0nIXWjmv+VK1Mi+NT8Xg+WY3rou3AAfcz+OmJ9SEASl5hlG2SYxfhudeLAZI/jO5/DGCJ4OgTNVor8I6gNcRFkm10bT6kgPK2UugfPmBEk6KPNgNToYdWs6J8e2aRirM/S0gcm9x2qhA86CQlbnmg+00kbpM46S/gV22HLIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jalJ0c4C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R9K/xqrT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jalJ0c4C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R9K/xqrT"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C5BasJ3384827
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 06:51:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rps4+MRn8b+/NfK3qw8jn7TXbGFAbhWtr90VLiZIiHk=; b=jalJ0c4CDRMSfezs
	Dl1dgmNW9TD7oJ3eDj4RI0y0TKbotUzWHDqQAkQt/ETWFTT9E8HcQA7QBsein95h
	q8zAb3Dnyk0bYKEoq4LPZ1rQg1dqmQrlZbEfIwFJA2ZK8gf9p1stuiErrKt+VHkr
	LK6W0ELpbqUMMlTBPivsWakT7E6bOnhNVkgkEqsT0ITJTyo2lKgHFZ+x0gbiz/dc
	Q1IqiwG2vWxE7pULWT7QiEjCG32ULR/pRiYQ0k807dfoXn0rR2D+/MIJYorZ/CPJ
	dvZJSKY6X94gN7hJhNteIdfG7dIzE577ZGtN85AK1GytKWAV3+cnJs+kjH8Huro0
	Cymw0A==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv4hug6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 06:51:31 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c8025414a5aso720043a12.3
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 23:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778568691; x=1779173491; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rps4+MRn8b+/NfK3qw8jn7TXbGFAbhWtr90VLiZIiHk=;
        b=R9K/xqrTMUvi6syJAJF/ggyYfhvHflW+xPissLiPF/1mRRrTv+53I50YO/CHu/MrH0
         uAkwYRZCUQkaLAg0X8XgxRJmqMApFwy+sDYexu9dAs+NCH5kSgL5mwJz1v9D8LMab7zr
         jAiNSOa5Rt37uqqnR8wj0fVc8eh91C1q5MtjY1Qm69r9OxdVb/Z1IXrm8247G1FTCqbl
         sxrN/6xYKj5Jd3odQ4xzwUFBN9+RQiHM0R58IQOL6AUsEgL614lM1giaKOcDRqdxcwWy
         h0RZeqLsQeBRgRcWELndox30sYPZshhNtFeySp6BmJiD/95hLOa+2ehvsANldXdITDta
         CEOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778568691; x=1779173491;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rps4+MRn8b+/NfK3qw8jn7TXbGFAbhWtr90VLiZIiHk=;
        b=OXYzc6As89ah+pu/dJ0iMQFrFtai3WVAEr/oS/fGTqNiMWdl/mIKB4K2wx17XDK2kE
         uRg8/gcK0DnuYpqxOY7ljcK+1CmI3q2qKT09wKPgC+Pvpvq8n6JOJTNz3AgQKi7aZOgZ
         QiBc1Pt97dnlxhDnIExP/YRm9StHrRFzvTO5w259ffCRouANhBFstDjE8ES9bBw+wmNS
         rbaskYzp7awM2YyvDLTEERqDS4EDu+wonym7nb1Ql9IvlyL4d0Cv8CTNT+uadCrBP/uz
         DEGN9FtoXULEeAeHgXmHG5v7Af/ktBT/UllKyuiUodHLqXbdzhFF8oBbzWNyz+SA/9HZ
         8L6Q==
X-Forwarded-Encrypted: i=1; AFNElJ/6ME3fMt7fcOGQDa6q2g2ZiTSCMF0fpRjzGybfDDkBuhAJapos+SaCpThJYpl8r99sZvuCIyRkXjhK@vger.kernel.org
X-Gm-Message-State: AOJu0YwIMUl8F29i3EFNStzaLXwx8Wlx3hvhLbZtamxENKcC6SQTbzAU
	6vyjiwzSUNboIF+2buhoBNZ9gMTbjDuAbdU0BZ8bvG77wa3bH7BevXWDLa3w3nsDRJ9/Kv5bkx2
	kJYwLFRpDbOembrvo3+JGQzliYYgHJfwE7kHjYe4/+QB5pzyuwPE01ud/PZnQ8rx2LZQ8MWAl
X-Gm-Gg: Acq92OHG7NSkSvjlIDyg2X68uPQytDfQLhBN3QuF3iSebmfwwuoL5pys2fLOV/3ct8j
	eRTy0GAA1/ZniSdnGtC5ET4Pwn4fOpVNOPCZd4MVC6dEeP2CtsNlb1NjwlO3qwCRUvvzWzYwx3p
	ce5Yded/erjX5o70CoA0+5nNydMl2WPA0oCXUI6egjoW+YeMm5SXsqJ8iTGnlyA5mfHZAGSYAw8
	opiUFYFPN4Uzvs14MQRNxJzcvHIjzP54VbP9Fs4tST0wEHXwAjtK3HOzyna93YDcWoz5VL1yxha
	/VboVeKC4w5WJhHPfXHKj/tz6p6/SqoTNHWn+bXaGaaU5yd4lLlnk1/Y+nhDS1b6LTpRkxOZT7c
	7OXo/e4y887128muU+oFsGhpK9qgDuBPhFVtqiMFDB0GUCBYm3dY=
X-Received: by 2002:a05:6a00:a804:b0:82f:21ee:270d with SMTP id d2e1a72fcca58-83a5aaf7794mr13651046b3a.1.1778568691180;
        Mon, 11 May 2026 23:51:31 -0700 (PDT)
X-Received: by 2002:a05:6a00:a804:b0:82f:21ee:270d with SMTP id d2e1a72fcca58-83a5aaf7794mr13651009b3a.1.1778568690660;
        Mon, 11 May 2026 23:51:30 -0700 (PDT)
Received: from [10.92.198.185] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839683a6252sm22579715b3a.59.2026.05.11.23.51.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 23:51:29 -0700 (PDT)
Message-ID: <fcd68c71-2581-47dc-9e9d-2ef558b7a6d3@oss.qualcomm.com>
Date: Tue, 12 May 2026 12:21:22 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] ras: aest: Add panic_on_ue module parameter
To: Ruidong Tian <tianruidong@linux.alibaba.com>,
        Ruidong Tian <tianruidond@linux.alibaba.com>,
        Tony Luck
 <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, catalin.marinas@arm.com,
        will@kernel.org, lpieralisi@kernel.org, rafael@kernel.org,
        mark.rutland@arm.com, Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260505-aest-devicetree-support-v1-0-d5d6ffacf0a5@oss.qualcomm.com>
 <20260505-aest-devicetree-support-v1-4-d5d6ffacf0a5@oss.qualcomm.com>
 <24e7a997-9479-447e-a1e2-cfab9a904668@linux.alibaba.com>
Content-Language: en-US
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
In-Reply-To: <24e7a997-9479-447e-a1e2-cfab9a904668@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ZrTd7d7G c=1 sm=1 tr=0 ts=6a02cdf3 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=XXTmVIMiA0tzt-EScKkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDA2NSBTYWx0ZWRfX2ngSnqrVe/vO
 0JzLXMCPYcVgn2U6BkVPCCLDXO4Vgc/JJTSTzkspvFe2fyPCfTVUagmw5XjZwVexRBFsrPYAd9G
 9foOiFlAaZ8bFgJdp2HQbDDnVPkiQbFCQNsm0CzwN4Wjuzu1pMakn4wjwU3YFksKZP39aoqV6yx
 wBMP8WLXU6MUeKbKko2TTK/pJFpmuTswum+QpNfamwSoEHQ5uCVo2LVAIn5SeX9dUKPLC8/7ssm
 9HCNM4qHfS8VU6qkyvcLm3fOHJwn2KkhbmBHmjMFDTU3kAPbuq4fs/LfoDhfJAf/0WM+bMc2Lbj
 5tPI68+2XTOjggb0K2KIc/pzeKtJO4TBQCA34vUiikyqbTmOtwE3s/XBPX7cDLrlNW6oizS0GUN
 P6bMZ3oCLSdEOKQT4+z3EozDWVu7SIJrlaOtM8aVwqsmedO1dC3pbyugOTh9/cpINUFVV00UMU8
 2OWbKgyceU7KuwLvZrA==
X-Proofpoint-ORIG-GUID: LJ9HNFjjDf-RLlLaUO2fv04qZD48AYOZ
X-Proofpoint-GUID: LJ9HNFjjDf-RLlLaUO2fv04qZD48AYOZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120065

Hi Ruidong,


On 5/6/2026 1:36 PM, Ruidong Tian wrote:
> 
> 
> 在 2026/5/5 20:23, Umang Chheda 写道:
>> The driver unconditionally calls panic() whenever an unrecoverable,
>> uncontainable UE (UET_UC or UET_UEU) is detected. There is no way
>> for the user to suppress this behaviour, which makes it difficult to
>> test UE injection or to run in environments where a kernel panic on
>> every UE is undesirable.
>>
>> Add a module parameter `aest_panic_on_ue` When set to 0 the driver
>> logs the UE and continues instead of panicking.
>>
>> Usage:
>>    # Boot time (kernel cmdline)
>>    aest.aest_panic_on_ue=0
>>
>>    # Runtime
>>    echo 0 > /sys/module/aest/parameters/aest_panic_on_ue
>>
>> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
> 
> Hi Umang,
> 
> Thanks for the patch.
> 
> I understand that this parameter is intended to facilitate UE injection
> testing and to avoid kernel panics in certain environments. However, we
> need to carefully consider the potential risks.
> 
> When a UC (Uncontainable Error) or UEU (Unrecoverable Error) occurs, the
> hardware state may be unpredictable, and data integrity cannot be
> guaranteed. Allowing the system to continue running instead of panicking
> in these scenarios could lead to silent data corruption or other
> unforeseen side effects, which poses a significant risk to system
> stability.
> 
> For the sake of robustness and data safety, I do not believe we should
> expose an interface that allows users to suppress panic on such critical
> errors.
> 
> If the goal is primarily to ease testing, I suggest handling this via
> local driver modifications in your test environment rather than
> upstreaming it as a configurable runtime option.


IMO, it would be useful to have a module parameter for this. In some
cases—outside of test scenarios—it’s necessary to avoid triggering a
kernel panic on UE errors.
Would it make sense to keep the default behavior as panic on UE, while
also providing a module parameter to disable it when needed? This way,
we can preserve the default safety behavior while avoiding the need for
local rebuilds just to change this setting.


Thanks,
Umang


> 
> Best regards,
> Ruidong
> 
>> ---
>>   drivers/ras/aest/aest-core.c | 9 ++++++++-
>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/ras/aest/aest-core.c b/drivers/ras/aest/aest-core.c
>> index b4f4c975da1d..9ce782a66edf 100644
>> --- a/drivers/ras/aest/aest-core.c
>> +++ b/drivers/ras/aest/aest-core.c
>> @@ -22,6 +22,11 @@ DEFINE_PER_CPU(struct aest_device, percpu_adev);
>>   #undef pr_fmt
>>   #define pr_fmt(fmt) "AEST: " fmt
>>   +static bool aest_panic_on_ue;
>> +module_param(aest_panic_on_ue, bool, 0644);
>> +MODULE_PARM_DESC(aest_panic_on_ue,
>> +         "Panic on unrecoverable error: 0=off 1=on (default: 1)");
>> +
>>   #ifdef CONFIG_DEBUG_FS
>>   struct dentry *aest_debugfs;
>>   #endif
>> @@ -342,9 +347,11 @@ void aest_proc_record(struct aest_record *record,
>> void *data, bool fake)
>>               aest_record_info(
>>                   record,
>>                   "Simulated error! Skip panic due to fault
>> injection\n");
>> -        else
>> +        else if (aest_panic_on_ue)
>>               aest_panic(record, &regs,
>>                      "AEST: unrecoverable error encountered");
>> +        else
>> +            aest_record_err(record, "UE detected, panic suppressed\n");
>>       }
>>         aest_log(record, &regs);
>>
> 

