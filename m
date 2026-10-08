Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63A33DD86A
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 23:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791501679; cv=none; b=Paz771igPIHaTByJlBOYShHIykdfYHq+1yhEk97O/qCKQ+3QMe+bFlq/MMC3ItYAoTOiUPQvNxQRL2eopD7QJDbivoVS1Fltf0O0ZBtYTa7+gKxC8jhxIzKJnzdXGeZhtBvwlZLkUFKZLWu30XOCCqqEe2jtpduEBB67o4/NVaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791501679; c=relaxed/simple;
	bh=4MJaZrtR4RgWJ4ai+292z6IPnXEaTKNgBrsy96VIl90=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cZP6gB5ZT23SZZTT9tcMMoGx87V6SyyEVHBFPhuNqAg/UiBkHYkoNd140pUi18sx2hhkmABkrP3DM2OCeY01DhOrN3XP5GS2jcS1mE93AlG1cv0hAWRatikPX8bKIZbxU4X/uuI08pxpcREmxsICVg8W9tjHvktOzaYLPkNAUrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SLjXGBrb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NzOs/gCE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SLjXGBrb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NzOs/gCE"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698KxvJg3151668
	for <devicetree@vger.kernel.org>; Thu, 8 Oct 2026 23:21:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+FLWS/ZRP3JLphZpvTJtWhtqU29QF4WSDgFqxaK31HQ=; b=SLjXGBrbBBAi4t92
	w9IuXEF7bg+FSKwz4LD/g1g1A2x7E/F13/y98/gjLoyTsxflKTwylO1nHy1X6SOQ
	bp8QvVXgF3cOqj6whYo7QYAhr35HouczPYyI+RJAGDD8BAQ2TJ5yauTCPj+cL5Hw
	PZAYYHHG0MowVKN8CBKx3aczXFfL8qjBmKalqhOO4bJXh1uWCv65hYRQqteWNFBt
	jT2tbuRpR9SuAIhIXLskeXWOd6YJFEn0n84KIniTIL6Bolk5CWtNggP5Ri4whc2p
	v1rozX9bszMkCgFYDmhvrba5t4u0upcnlLmIjd1dvN+hn+nvomBBKsnt3Ibw2FTQ
	XmfJAQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxk1151-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 23:21:16 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2df8484f12cso62245525ad.3
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 16:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791501676; x=1792106476; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+FLWS/ZRP3JLphZpvTJtWhtqU29QF4WSDgFqxaK31HQ=;
        b=NzOs/gCE1YCbj/rwFWjn/2ElvzOrY5ZYDegXI/+KayagzVNPBw/pZPJLdtNhX4K1eS
         VpRtA5ePvfeGN0S04B37fhrss+3TxycSh4EdCUbDwu/7LFkunXoW8QBpCzoM3T08fVe8
         2xImSwyGaejsn9A79cj9wdFr0UL1Ao4Cnne40//fW2XzBijmd7JmG8JM4NTYf0+7hCzm
         dBGsRJ0XvYgMKN/TypUvxjoBBAfEwzS93hkFmvsWBPVC3ylS6y0QKDJJR9NuKsbcEZ7/
         JgPhjlxr4cDb+qc3eFOKenUEguqJMmjBJiSKTUgqqFnSR7FK4krW7hrVH/ogiYnDrCd3
         o7NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791501676; x=1792106476;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+FLWS/ZRP3JLphZpvTJtWhtqU29QF4WSDgFqxaK31HQ=;
        b=qP1HmZrNRj1vWy0R01uD5pyiXWuFS+f/sK9kDdl6T73i1VVv2OH80y5J5Paz3ce2t2
         8GabcF8POPsUJPO1evpKGgCXfKlmOUnXlOf9pG/4n9Mc1smTP0RV171HgAANiK9FyZ8J
         PjQZms2nXOwy0/4LKfZQs34rZ3GTiARKxiuoE7JJ8EBlz3Ck3A5ZPb2hxezJYrLqMtNb
         jClptg6F/izsYiBGgmO4czy/s5smobfh5hR/0eF7NpMjSqs63Dyj19ITz6KrPoyT1XP+
         rE8Ng9H/6z1L4LxeTGSC/+XqOMoJ5zDc2B8Bx71vVpRFulieUUMBZAbqcMFN2ogpeycH
         yetA==
X-Forwarded-Encrypted: i=1; AKwUvBwq3kKwEqaKGhXjIzbBrcVZMaV6Y0jyeEO/lPsXeiwUKWiXKOgEnD2hynPX0/XzfsbSQRoleUdXhrbP@vger.kernel.org
X-Gm-Message-State: AFq9FYKrT3WH9do+GNYsYTv+ZxyGVtG12II74FOAzQmaX/i9IT/db8QW
	5Mip92ycVNEtvW9qIeFPqJWQIOt0mav+5TN99bgg5V79fLrYBWDY2Z0dMj41x2Z+4fm+4KVAHyK
	jRuznQz0rGccGFDYVVLsWGvFNdJouDrrVSudQCDc3ujRLGNW68lcUC8Po54GnPVE=
X-Gm-Gg: AYBFou3i1H/JwTOudotssui/VnCQ8AHjH2JzFbN2Cxzu88AAaAlLfhOXuUfb1et2YPD
	kt5nnvzjuHJsLFIqlAGZ5+AJX8ld14CIjEqs4Ldy/XVBtsAag/k/qgZFsk1L866WO8hk4erOKZT
	1XFBHSSYIWKZs+/fXr56pzES0TqOQEj2kZPaMBLd8urRrSeo/4RW93r+KJHt5eK9J1W3xPrIIUv
	5t7maGTrIJYsEntJJ5GIxOWyjmfEQctmvX63lgEm+beYUcT51aOP8Xk52N+gBPxslZhwhAbnIvs
	s2trxy504i9WUrlMjBAUbyTHVeRA4S9Y4qFCJpR2poQz2O1NifPEweAklDfjWR1eKuv3K707y/c
	HPnaegx4JXB0tUhlkoQyj52ZpRk7e/mQM
X-Received: by 2002:a17:903:1b0e:b0:2e8:21a7:dd0a with SMTP id d9443c01a7336-2e842e0b04bmr1070355ad.63.1791501676156;
        Thu, 08 Oct 2026 16:21:16 -0700 (PDT)
X-Received: by 2002:a17:903:1b0e:b0:2e8:21a7:dd0a with SMTP id d9443c01a7336-2e842e0b04bmr1069975ad.63.1791501675602;
        Thu, 08 Oct 2026 16:21:15 -0700 (PDT)
Received: from [192.168.1.86] ([65.181.12.250])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d9d49af2sm145399a12.2.2026.10.08.16.21.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 16:21:14 -0700 (PDT)
Message-ID: <2a3b8bdb-0f75-40ca-a653-3e4d45c9d358@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 10:21:06 +1100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 0/8] tee: optee: add RPMI backend support on RISC-V
To: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
Cc: Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rahul Pathak <rahul@summations.net>, Anup Patel <anup@brainfault.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Marouene Boubakri <marouene.boubakri@oss.nxp.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org
References: <20261005-rpmi-tee-service-grp-dev-v2-0-72f222e23ec1@oss.qualcomm.com>
 <CAGgiveXJXXaRNyfq6Gxk4moOHqM-vBuptugn5bHK5x9EeeGSQA@mail.gmail.com>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <CAGgiveXJXXaRNyfq6Gxk4moOHqM-vBuptugn5bHK5x9EeeGSQA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fKesTpae c=1 sm=1 tr=0 ts=6ac8256c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=9v5PfQ1E2GNzj2RibJmqVw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=4N8_HuqegsxoWIsicYAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: UG2QA2x4bPOPg_xgT7rHsaCiz-pyKFC2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA5MiBTYWx0ZWRfX9dPDcEttevB+
 PNqKZEU1D8r01wLI6scHjBrml1OVVbrkyKbgzhRWADK9qQ0Snm6S6TCbX4YUIknfTMBxFAJC4OY
 hmLuHm7rifvWn46pcLxfxZ0I1CtTcCI=
X-Proofpoint-ORIG-GUID: UG2QA2x4bPOPg_xgT7rHsaCiz-pyKFC2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA5MiBTYWx0ZWRfX1Xi3RmcaitWa
 kOvXHII7Se+GZizhuXomyNFy+tc8mRb2LMKcpjWgLYd13FUGQqNMrd9XNqBk1mwvj9W2SNa982A
 X4Cfms02dSnE4YEtYNU66LrgyMGtuP5lVpVEdkwYZdXtP1mhTgrmeZEPMcBQ3EVUuGV7G8LUsNk
 UY4CDazpNUXQ/vmVAoA1l9avXxTUPYBHwDniYZ5RM8CDgyQnh5+ySuFZ8oIM5oHNtR59Zv10pX3
 P5ozdRZ5sX8SrldETfRdV+Q5OQzdlIsUC+/jNWOjToGPM/cmweLqV5mGC0mdbwZPOWIKirhYGk4
 ZdpUoykXJyt2N5LKm4qzO2BkRIusYSYx+37foSXxgaoyCQBS81hLpnZ11Ov9mlXfFVuyFj233DQ
 Bj8HciVERzpxQT2fi75wCpWs2JvEmk6fyOxB1eF86CQxixdfi65kwIgy6jQhrEDkm/72zj72wnY
 4ADR1Oskmr3/I+bq8nA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_07,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080092

Hi Jens,

On 10/8/2026 5:15 PM, Jens Wiklander wrote:
> Hi Amir,
> 
> On Tue, Oct 6, 2026 at 2:39 AM Amirreza Zarrabi
> <amirreza.zarrabi@oss.qualcomm.com> wrote:
>>
>> This series adds an RPMI backend to the OP-TEE driver for RISC-V.
>> It builds on the separately posted RPMI TEE transport series [1],
>> which provides service discovery, synchronous calls, memory parcels
>> and asynchronous signals.
>>
>> This revision is effectively a full rewrite of the original RFC.
>> The generic RPMI transport has been separated from the OP-TEE backend,
>> and the backend has been reworked around the service bus and a new
>> OP-TEE control ABI.
>>
>> Unlike v1, the OP-TEE backend no longer manages SBI MPXY mailbox
>> channels or implements RPMI TEE service-group operations directly.
>> It binds to the OP-TEE service UUID on the RPMI TEE bus and uses the
>> transport's public operations. No additional OP-TEE device-tree node
>> is required.
>>
>> The backend reuses the common OP-TEE session, shared-memory, argument
>> cache, call queue and RPC infrastructure. Shared memory is represented
>> by RPMI parcel IDs and nonces. Yielding calls pass command and RPC
>> buffer ranges within a parcel and resume suspended execution using
>> an opaque token returned by OP-TEE.
>>
>> The OP-TEE control ABI uses fixed-width little-endian messages carried
>> in TEE_CALL payloads rather than reproducing FF-A's register-based
>> message layout. Asynchronous notifications use an allocated TEE-to-REE
>> signal as a bottom-half doorbell, while ordinary logical notifications
>> continue through the common RPC path.
>>
>> Matching OP-TEE OS support for this ABI has not yet been implemented.
>> This remains an RFC for review of the backend integration and the
>> Linux-to-OP-TEE protocol.
>>
>> [1] RPMI TEE transport dependency:
>> https://lore.kernel.org/op-tee/20260928-riscv-rpmi-tee-abi-v1-0-04908b81d885@oss.qualcomm.com/
>>
>> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>> ---
>> Changes in v2:
>> - Effectively rewrite the backend around the separately posted RPMI
>>   TEE transport and a new OP-TEE control ABI.
>> - Remove backend-owned per-hart mailbox channels and the OP-TEE-specific
>>   device-tree binding.
>> - Replace the register-like control payload with fixed-width messages,
>>   explicit command/RPC buffer ranges and opaque resume tokens.
>> - Add a parcel-reference parameter layout carrying the parcel ID,
>>   nonce, and 64-bit offset and size without changing parameter size.
>> - Make argument-offset support part of the baseline ABI and retain
>>   the common shared argument cache.
>> - Use a transport-allocated signal for asynchronous bottom-half
>>   notifications.
>> - Link to v1: https://lore.kernel.org/r/20260912-rpmi-tee-service-grp-dev-v1-0-1d1d35c2a859@oss.qualcomm.com
>>
>> ---
>> Amirreza Zarrabi (8):
>>       tee: optee: allow RPMI transport builds on RISC-V
>>       tee: optee: define the RPMI control and parcel-reference ABI
>>       tee: optee: add RPMI shared-memory and parameter support
>>       tee: optee: add RPMI dynamic shared-memory pool
>>       tee: optee: add RPMI RPC handling
>>       tee: optee: execute yielding RPMI calls
>>       tee: optee: bind RPMI services and negotiate backend capabilities
>>       tee: optee: support RPMI asynchronous notification doorbells
>>
>>  drivers/tee/Kconfig               |    3 +-
>>  drivers/tee/optee/Kconfig         |    3 +-
>>  drivers/tee/optee/Makefile        |    1 +
>>  drivers/tee/optee/call.c          |    2 +
>>  drivers/tee/optee/core.c          |   10 +-
>>  drivers/tee/optee/optee_msg.h     |   38 +-
>>  drivers/tee/optee/optee_private.h |   54 +-
>>  drivers/tee/optee/optee_rpmi.h    |  234 ++++++++
>>  drivers/tee/optee/rpmi_abi.c      | 1059 +++++++++++++++++++++++++++++++++++++
>>  9 files changed, 1389 insertions(+), 15 deletions(-)
> 
> The rpmi changes in the optee driver harmonize quite well with the
> rest of the driver, but there are two things I'd like fixed:
> - avoid <linux/cleanup.h> macros. They are distracting.
> - use rc for the trivial int ERRNO values.
> 

I'll make these changes.

> I would be great with a QEMU-based end-to-end prototype to demonstrate
> that the ABI works.
> 

The OP-TEE side implementation is nearly complete. I'll incorporate your
comments here and update the OP-TEE code accordingly. I haven't started
the OpenSBI changes yet. Getting a QEMU-based end-to-end prototype working
is my first priority before moving the series out of RFC.

Apologies for the obvious oversights and bugs in this version. So far,
I've only compile-tested the code; it still needs end-to-end validation.

> More comments to come in the individual patches.

Thanks, Jens, for the early comments and feedback. They are very helpful
in shaping the final code and guiding the direction of the implementation.

Best regards,
Amir

> 
> Cheers,
> Jens

