Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67968547046
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 00:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791331433; cv=none; b=IiO5m7Cb6kqIfo8pX+Zd3kHmqNkm3FHNy3zDdUKkGaWoOB5g7QsZKjgHK6Zfs8sULLwWF7dwfmk2mHSfEXqdmTdzQDyDnAF3yTCbjE/Yx7+oHkushCf5vuEGFermhbWwYXdvlA8wKBfB+jY7fQeHpWRBxuCDUAHra6sCCRdKd4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791331433; c=relaxed/simple;
	bh=ruCjfSGct3MizqSDE0TmtgUXUHy5mBaRnQhxTHqCOrE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WCMcioQ0+m6IUGZ42jyB4Bkm5sn4uKvSP0gd8xMMrgTNQq8S0PGT/Bm7eZHY9yTNj5zM3Jpbe/2r3kNtNGUm2qgvwi7UpZsHH8t+aV5RiMITUttDR+urHPH36lpujM6YcLVER4dAVBuwpOX4Z20cZ65hpkYPa83RjHnP9zfemao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DODPSc5e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G6YJXUVK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DODPSc5e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G6YJXUVK"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696LeI261029262
	for <devicetree@vger.kernel.org>; Wed, 7 Oct 2026 00:03:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mEBVU7YoQnA6oJNQRreS9t217ifY2fL30vwizF+wfYU=; b=DODPSc5en+vzuHMX
	iBSMHbRqul1ViSDbLqtkcEm95A1obvei5t67JLIFPs6+sjiclHmd5FxRgvnLJS/i
	wxP2/q3a1cOkYwWRHaSgkhGkbog/jrszRKceroPxgurwIdIosJVGT9oZvpyewfC/
	A9u6zIXH45mg3s4hRMf5jImfGjSH6ugMcEQ7byo+h2ZVr3P/32Wouidvt2Mp0sX9
	kCJzoJQ/u5u4bM2h+kLD3Sx4hoZHN5Jf2Ns+qnq/SaytMgaINVXedWlVeSLS0wld
	M4NIxKvoR6C8FLOYX63x5gyugRTczckyXb68rasnQ5XihftwqMvBP+3660dUpz97
	8fSwyw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h53asj22h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 00:03:50 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-34d62bb27a1so14444724eec.0
        for <devicetree@vger.kernel.org>; Tue, 06 Oct 2026 17:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791331429; x=1791936229; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mEBVU7YoQnA6oJNQRreS9t217ifY2fL30vwizF+wfYU=;
        b=G6YJXUVKdYtCtZXr1zjYSey9uNHU3u1iWbbs9z1O++Ihi79w4PhDm7UJn0nUV3A5EX
         nKAst8fWcIqpGsnCGq5+P2Tr9lDroF0DPnmW6iLUqOmYcLfjoQDZVXR5DWI3aUsFQgXj
         0DJKVrUCpcxFSwuwKCU78cANtRq0Dv5IAJs0+AhIiogWRVFWwKrYRlnk7e6fvlF6uNOj
         4PNRR80atnTIHxhxkmBlqzcnSjcF6UEdf+BmSoRWS7gDG0DErXMY6hiX65GITGRb5Tq4
         SfQf3Jhyx6Zs9KzwdwIg4XENUVUpMzwlnM9skjbpYcTcaL2QJwFvpTViCYMmJ+FpOhSU
         Aw0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791331429; x=1791936229;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mEBVU7YoQnA6oJNQRreS9t217ifY2fL30vwizF+wfYU=;
        b=P8PNcVtG44VrMcAch0CFpXGZhlEbdl7uK3FukHNOrYy2dlG3yaUzI0cXNQl8fucLpB
         75flP4V7OyKg54F1DGPeUiJEeQt31RqwMDWT21HojamiaPCBBcwXX45nQc/MfEixFdpr
         VEgjBNN0CYhYOqANVk31vb7mzYemoYDooVQU9JqmKybqgSdLGHisX6+9IE92OErKP5O/
         hVIxv4kv3F0KVgau8TWYzTXRIADr80L0RFjQZR6/spVHX1BATr6HwQ64/RkPk2ORCYBS
         YXNSGkMTw72M/yBxiDoYr5tslnTIj6DL41aePNaPIB4/yftsW6Gs6m4oXVkkhCnMWUjX
         oBfg==
X-Forwarded-Encrypted: i=1; AKwUvBzKLpzCzsak1mrdHIKzdFWnxNQYld3v9pdq4YrWWp9n8e6izrnvRLcNcAem7ufgPxN/BBTkMAyoJAVy@vger.kernel.org
X-Gm-Message-State: AFuF++lQsqnI5Qwvai0ldXmfuBtmhWyNfPSe9I+ztlY2itMMoLhkxuif
	KCnR5oThdImEER9wxbYQE/FageS4m5+/hlOeYNxM6MwT3Dkko5HUnw7Nnu8hjLUmoc4xmuZwKde
	J8TPzVXjBl/arGXTtp6DdES5YHMA4fOEs5CWspHqDj4mHMDTppcBnho7YWWvk/on8
X-Gm-Gg: AYBFou17mzKwDPTsmfWpo5gtQLk/xzxXUDRBYo3HNf+tZ0nJIrIIm7msktPIWaEPZ2J
	dLs4EkmxcV9Zogx8rVqPftY1nl72iwaFpZVEbhQ7+wa1lYyfG5VH1q0grJYhlp3ZzCOb1GscMts
	24mBwn5+TfzvZ7kkN7ODa1xL6geVhBp3MUNr+UGi2/DID5bvKqt+D9hlaAy52VAaBkArEq6RJxH
	aVsMvUeZrTJdvrOcT8oUBbNQcC9sdsytJ+Llcg8FKzHYodehgddWyeBD+QwSpF/1Ot01ngNi2tL
	5Y5EPWKEb0hGsArwHd/Sf2/HjTnksgAHp2gXbLyTNxBTYBnnbsWYlfDRCAmGFyoSSF0JbBL0zRW
	gXDJgz06xPpiAJm2FIrqhRJdIcqS6fzkWtecvE28NgNnPQNjQ052aeJC/WjrIrFE=
X-Received: by 2002:a05:7022:43a5:b0:148:306c:971 with SMTP id a92af1059eb24-16206f0616bmr619629c88.22.1791331429184;
        Tue, 06 Oct 2026 17:03:49 -0700 (PDT)
X-Received: by 2002:a05:7022:43a5:b0:148:306c:971 with SMTP id a92af1059eb24-16206f0616bmr619459c88.22.1791331425354;
        Tue, 06 Oct 2026 17:03:45 -0700 (PDT)
Received: from [10.71.184.34] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1615f1ac8c5sm3343825c88.2.2026.10.06.17.03.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2026 17:03:44 -0700 (PDT)
Message-ID: <6d16d5fe-3165-4026-a3e1-27be256f5378@oss.qualcomm.com>
Date: Tue, 6 Oct 2026 17:03:44 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] zram: Add QPaCE zcomp backend
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <georgi.djakov@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        minchan@kernel.org, senozhatsky@chromium.org, axboe@kernel.dk,
        rostedt@goodmis.org, mhiramat@kernel.org,
        mathieu.desnoyers@efficios.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-block@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        djakov@kernel.org
References: <20260930145215.3380977-1-georgi.djakov@oss.qualcomm.com>
 <20260930145215.3380977-5-georgi.djakov@oss.qualcomm.com>
 <20261001-dramatic-hasty-pug-68ebfd@quoll>
Content-Language: en-US
From: Oreoluwa Babatunde <oreoluwa.babatunde@oss.qualcomm.com>
In-Reply-To: <20261001-dramatic-hasty-pug-68ebfd@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 90UjLxO62qJ1sL-sVuZW2kfdrgDX7UHd
X-Proofpoint-GUID: 90UjLxO62qJ1sL-sVuZW2kfdrgDX7UHd
X-Authority-Analysis: v=2.4 cv=Xt5vqlF9 c=1 sm=1 tr=0 ts=6ac58c66 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=DSiY3orsq6dgR2GKpvQA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA5NSBTYWx0ZWRfX/cAr8ahOVevw
 9M0+gIAipQIJ8OQS0I990ilQZbDKUQjjdH8vFnHhZdZfBySo+ui2q2o0EoMo6Jh/SnitODuUna2
 rkcCtZasbU2niPIpvwqtKI/172frNNRAXcPQufZjwZrHrXXeIURCPLwBmm+j1oLh03bPAA2mS+N
 gsy4VTudVcxFf1saaigiChEvsQZNvKyaXotgcK0R2OjxXdgTydqnOOmbhKUalfJq6ZGNBIyaTq6
 ahZWGakzTE/7wsxohBEbQH3wUXkhIdUeDxAbfZdIPfLf1OSyofs1bwaoUQAuO96G05WlnosoGDg
 CWY2AqEXDzyU4wx36UkJ9jCOvpRyfBa0W/zp/aXdbAzKJKwtMkSta+b51UA7fOLhlQtXZG4TIiN
 Rbc1+DJLmkr0zB8TjhTbEn6I3T+Gv1tsSwRt2EV/vhRrB/Nwb82/8PVBHg/guCyjtIv6FPgMtm4
 P+296ifzz3ihOyAjtMQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA5NSBTYWx0ZWRfX6AJQ2StGU1Yh
 SXJ5uhFqC/6oK99wBDZ9/Zqqwsc85vk1oA4e9WQT0X6reXG6PKf0OnHpADqT5I3ln0luk/CzcAp
 PbIxqhS1H+IFZJdTYkruwnmBjvvN4ro=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 impostorscore=0 suspectscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060095

On 10/1/2026 1:51 AM, Krzysztof Kozlowski wrote:
> On Wed, Sep 30, 2026 at 07:52:13AM -0700, Georgi Djakov wrote:
>> Add a zcomp backend for the Qualcomm Page Compression Engine (QPaCE) so
>> zram can expose qpace-lz4 as a selectable compression algorithm when the
>> QPaCE driver is available.
>>
>> Compress and decompress operations are handled via the QPaCE urgent
>> synchronous path: each request DMA-maps the source and destination
>> buffers, issues a blocking hardware command, and returns the result size.
>>
>> Signed-off-by: Georgi Djakov <georgi.djakov@oss.qualcomm.com>
>> ---
>>   drivers/block/zram/Kconfig         |  11 +++
>>   drivers/block/zram/Makefile        |   1 +
>>   drivers/block/zram/backend_qpace.c | 134 +++++++++++++++++++++++++++++
> 
> So entire qpace should go here, no? Why did you create this entire layer
> of indirection, singleton management under drivers/soc?
> 

Since the qpace driver is not specific to zram and may be utilized by 
other kernel components, it should remain independent of drivers/zram.
Consolidating everything under drivers/zram would couple the 
implementation to a single use case and reduce its reusability.

The backend_qpace implementation was intended to setup zram as a user of 
qpace and follow the structure of the zcomp frameowork. As per your 
comment in the other patches, we will check if this can be done through 
the crypto framework.

>>   drivers/block/zram/backend_qpace.h |  13 +++
>>   drivers/block/zram/zcomp.c         |  11 ++-
>>   5 files changed, 168 insertions(+), 2 deletions(-)
>>   create mode 100644 drivers/block/zram/backend_qpace.c
>>   create mode 100644 drivers/block/zram/backend_qpace.h

Thanks,
Oreoluwa
