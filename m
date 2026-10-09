Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8863C76BB
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 23:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791590173; cv=none; b=ceo02zHyE8lt2cRzlLUz6RBNuS5vLctZcwYt4kbTp9v7DT9rLdePhjJ3zy3BSK3aWQbn4DpYGFWHw3LwqCa5CzyeSIQVUW4s7gxlohITsqqzD3JHaf4wqapSgKNTONdnU0AfDKBbYYYh9YM+tqbYr7OJJUXoY2DLJE2YKyFslvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791590173; c=relaxed/simple;
	bh=9z7hYxQOC56YcYk/la0dPkEnEgUTeM+W0hts9a9DAQA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uGapiGUNgNMaqroFNVXqS0LoI2hp1Hl3KbS2GbLRL3LcCPew+Mf8KrnW3FWjUFyS0C+FKLf4YeOe8Oyg9DKAks/y0sDrcLj92AT63+tCSBy2KqRMoT2mm4aKxHEXCMKudaqsP+GoQhbLWHd8AJ6nx2CdnZfZTRmoJaTP+sIKwSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QJj/w0u2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Oqzywpsc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QJj/w0u2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Oqzywpsc"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699NKYcf3186597
	for <devicetree@vger.kernel.org>; Fri, 9 Oct 2026 23:56:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sm8UHt0kUeP9v337omYSKLBHjxWM+fIM1E1WXPZ4J0k=; b=QJj/w0u2RDGgekrd
	cAP3WliD2fOKkfKMSWKRMxj9RMXdqP92SDKtMDO0fMw/aG2qMd6m+5hW3PchhkHD
	2nvWkBY9O/wR4TKcuwgXPKXepmDA+we3drKc592+/1OenSWZ/kYzW1U0TUtUIjIf
	y3DEqFwcKSaGhjHRudqXtidWUV+em31rSJWV+mBPYq9a+kgs4DSuifEgW/gbTIDZ
	oEMrqn94bujPXuOktGUlicG3clXjCQz6UQhhbTKuO1P12m6+aR2/SGPCmfunOLNk
	wYlmjcIjta628pgRGhCrjVtGCflClm1D2bG7MZk9nppSwU7E631i0Hju6Kw9kuPO
	UWaTWw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h74t8956s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 23:56:10 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb93c874bso495410685a.0
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 16:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791590170; x=1792194970; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sm8UHt0kUeP9v337omYSKLBHjxWM+fIM1E1WXPZ4J0k=;
        b=Oqzywpsc0p3pGSXaYuY1qf6oV3ajs8N3qhcqhrs/Jhf0SRI+FKpbWfIXsr6rdhY/G8
         bFGQpEVrNPbFVHYOIxNBcPKVvza9NouD3nMM89YPjOy6VTu5BQDtpPUJYNcFkQcrPvR3
         j1SJjsszukTpPQ7WoUPwYngzAyXW+aYCG41WNx2T0HMGubKnbp+x2aGNOZPtAo4bGKgm
         267v1OvRrrVWy52ncCspa7x0P34cHmgqQe/3Fv2HR7awNgIK5p0E2HVIQZOx6hUqVLP8
         W/9nMbD9tQEG0gzkEK6UStQmimaNs1fSxF6slWBje6DG57lUvd3D1txbZIMRAntG/Urr
         l/yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791590170; x=1792194970;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sm8UHt0kUeP9v337omYSKLBHjxWM+fIM1E1WXPZ4J0k=;
        b=FEEj5SjCtX+NqOi0xNga3Bw7yNZvFHNZOHf8lIwmIkaQua5Xga8a1AzLNvngrW9POl
         R4tukneyu3Q2gXgRxHEo0o0RPanVqVCyDX/pO0Oi6nfGFzclX7J1j0k7IaIMvbi23rqA
         1xKJhsbdiIinDdD0p219vhhfnGty1+/V4ha4+LiiMA+nLXkzMQEcDEKFoZGGeFpqkBF5
         ptLpnlsQHvyamGazz5wlsY89RTKXaurkhsCAAOaMN/7z586+E+xq0U2TagJWmA5xmqFg
         EQBfMZ1UdavzjskfWMgtG0+TTDcnJQeIcKsybrRs2R2UXmyDJKk1ajW27MWLWP1Y5xoq
         ydIA==
X-Forwarded-Encrypted: i=1; AKwUvBwIetDzLlbXg85ZoJzrOiHAxhF+85iVXpRsD6PNl7RMmkx/3KHu/iwxcOWtNBO2oBp2h3oo8Yx1VZUQ@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9XU9zxPxjOSi2k245KxPfvhUPFcId874kPRg3NaqIUso5ECXe
	kD2ljnIva5hx20TywrMAWdctQ0xX6StattHLlD9gJc/3x/d7hIyGjRK81/LXIlDJqdyCzkDATF0
	e7GvgGhRFAYB+OFKM+sLt0qOoCLr++W9P5zXn20XecUeJXCznKN3cDVvNVbbXcnDy
X-Gm-Gg: AYBFou36vbNFcF7DJs1N+NucuNGyekVFIR+pGZJ9pS+tat6UZ9l2+gJ/bzg62DQrmYO
	AywOIwQkIs+ZkeWOhLtZJdRXZr3YNBVQP01SL2OsZtX6oegN68f51u6TIJfbpeBKzRNQQS3X1ZK
	K3mQHIPFdBGTPrO7GO0bov/bdYlBlFMsO8ra+sUV2EUIxMZaApXC6S3zARpibMvefqgU0UDQ6be
	bnKCa5JoO97lwnmocqED5RUZBZ2qR+tzhAKdJkL02dBKx0FziKkoysHVBBvz4HMDUJvJTWJB3+E
	1YNmR1L0EdUN1GEmjv7ZW0DawLEcWqQxRrBBMhrZTl7eLwtJNJtl7TTxry0Tutnn8YlcBOo2Gy+
	vjAtwV8YktgND6Ss2qheLAXgYw9ydHQ==
X-Received: by 2002:a05:620a:17a0:b0:93e:c12d:4ec7 with SMTP id af79cd13be357-93ec12d54f1mr427906885a.39.1791590169793;
        Fri, 09 Oct 2026 16:56:09 -0700 (PDT)
X-Received: by 2002:a05:620a:17a0:b0:93e:c12d:4ec7 with SMTP id af79cd13be357-93ec12d54f1mr427902885a.39.1791590169279;
        Fri, 09 Oct 2026 16:56:09 -0700 (PDT)
Received: from [192.168.0.31] ([212.5.153.243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db94e30a7sm6357514f8f.12.2026.10.09.16.56.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 16:56:07 -0700 (PDT)
Message-ID: <6713512a-d879-4fdb-9138-12e125c21ed6@oss.qualcomm.com>
Date: Sat, 10 Oct 2026 02:54:36 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] zram: Add QPaCE zcomp backend
To: Sergey Senozhatsky <senozhatsky@chromium.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        minchan@kernel.org, axboe@kernel.dk, rostedt@goodmis.org,
        mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
        linux-trace-kernel@vger.kernel.org, djakov@kernel.org
References: <20260930145215.3380977-1-georgi.djakov@oss.qualcomm.com>
 <20260930145215.3380977-5-georgi.djakov@oss.qualcomm.com>
 <20261001-dramatic-hasty-pug-68ebfd@quoll> <ar4070oH8lRCJMRw@google.com>
Content-Language: en-US
From: Georgi Djakov <georgi.djakov@oss.qualcomm.com>
In-Reply-To: <ar4070oH8lRCJMRw@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA5NSBTYWx0ZWRfX9yabxNMhpcr7
 sFWWK31iEE6gAylUJPY3rEHpXLKuIjBjriqLJbgnjLKCuDxF4sFjoPTa4IIkCF/T4ZB7PJsp/ud
 EX1LVnWSJOrvnSFoBLSKgfIDk8jvEKE=
X-Proofpoint-ORIG-GUID: Xy2hw6DPjFk-NaTx-5SXJ9jCFPocVMti
X-Authority-Analysis: v=2.4 cv=D9jSufRj c=1 sm=1 tr=0 ts=6ac97f1a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=douLNevBrtimd63D7eljNA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=nv9Pdalr7dmODPptRzIA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: Xy2hw6DPjFk-NaTx-5SXJ9jCFPocVMti
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA5NSBTYWx0ZWRfX/Gi4OvNZEop4
 0LffwSUVLemtmxO+OZvzErLMGMUy3/DZRa4C2Cw8eHTITZ9yaGEYGZKLHG9tLBySrPnWuPoeASD
 k48dDR267ly/zsosU4FcR82YQ7txJj8TPxw0nFSPRpatfReMxiazLdRitH5q//8fUbanHe4izl2
 q/gJTx5AUeA0V2yf0YtvVmonyxlj91zi+7Y9/q1391klw5EtGW3gPaMD52in911bYPu3I25a82L
 O1TTjQDvjXQYsWlPIVFEJuPLt2QlKx65ZwjPXapdXjB5YOQsL74Q/sb6mB8ZYrt3xVlkP/PgfpD
 S8EZB2P5JZfc/F66/HGmRRsw6acvaKFKGawOdOwY5KM1P/krsp/ocPJ0ltZN2yEgmvVCT92qUx7
 r1gj4gjqfsCMrm7pKCQ35uziiZN64tzXcgxxsnwQR7qs2KJCPrhm5GpGkyVGMkKPzXNIAI5ymeO
 y/kIJfGET+jCkVCo5Hg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_07,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610090095

On 10/1/2026 1:27 PM, Sergey Senozhatsky wrote:
> On (26/10/01 10:51), Krzysztof Kozlowski wrote:
>> On Wed, Sep 30, 2026 at 07:52:13AM -0700, Georgi Djakov wrote:
>>> Add a zcomp backend for the Qualcomm Page Compression Engine (QPaCE) so
>>> zram can expose qpace-lz4 as a selectable compression algorithm when the
>>> QPaCE driver is available.
>>>
>>> Compress and decompress operations are handled via the QPaCE urgent
>>> synchronous path: each request DMA-maps the source and destination
>>> buffers, issues a blocking hardware command, and returns the result size.
>>>
>>> Signed-off-by: Georgi Djakov <georgi.djakov@oss.qualcomm.com>
>>> ---
>>>  drivers/block/zram/Kconfig         |  11 +++
>>>  drivers/block/zram/Makefile        |   1 +
>>>  drivers/block/zram/backend_qpace.c | 134 +++++++++++++++++++++++++++++
>>
>> So entire qpace should go here, no? Why did you create this entire layer
>> of indirection, singleton management under drivers/soc?
> 
> qpace seems to be standalone/independent arch/soc specific, and can gain
> users outside of zram (fs compression, zswap, etc.).  zram's backends
> potentially can disappear all together, if we switch to acomp crypto API.

Are there any plans for switching back to the acomp crypto API? We moved away
from it some time ago and dropped all the crypto dependency in favor of the
custom comp backends, right?

Thanks,
Georgi

