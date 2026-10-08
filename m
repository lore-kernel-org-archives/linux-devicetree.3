Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFDC83914FE
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 22:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791496989; cv=none; b=KBeR0xwGHy2qyhmLT0PyX6+hTHhO2G4gdkVupGBHV11sQggdIJGbSXzE0TwqYfk4SIBYxBoTaefoMOwyZl7zLCxXXXGGkntkxUyUaClttBtynwI0IK1Jf7vvfvZoFNawDvuylRXmOEsuzH2CRBUVP5VlYD/K1suZmbXPUd3P27c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791496989; c=relaxed/simple;
	bh=hdhqjJFA9UQyh/iAdCL3+kVk+3FS2g5guKszCgKRKMs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ymh8XNX9kq+cTzveeMCHBsZHwNaTLDKUCss5st923bs+TlmbjIhlzOm0ERvkeLCYdFl/us8EagOdFfBRfmOWAOy+EDY/mc+v1w18OVsRPYZ+vXQzOi7FlulIBD4zZKY3PSX7i87Se9sJpGQSpN7laTMVEjbTwXHc2HFaQRIUXA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z/ApXLEw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PPABQUMQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z/ApXLEw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PPABQUMQ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698L04sA173347
	for <devicetree@vger.kernel.org>; Thu, 8 Oct 2026 22:03:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tH1OwCS82bpX9kusapPnvRENv6Gr7AgMG4+Hp9O2t9Q=; b=Z/ApXLEwB21rFPtu
	u/wN9PD6IEbnY+R+iao1MSIAclfJyeVNMQsztVHW+r/kqA1KvV+25YIsd7rRPO4W
	IAtFPVWaBdhPOhqmOZldxacV0eKq9fxkKEkwdxPBdSam+nTWvkG7vTLD8vXnWhex
	YKT2Q8SaU7LpdhP/TExBXKA8EfgmXgieAwMrCeK0h9XkZILv+1pZURZSJe4bPstu
	2ChAMTxxakH0LtQPsz6oFMvUTCmdQK6x3F17E1LzgXeO8VOaCncnBmZlcLjSY9St
	qfUBLL2QM/2g2QoXOUF6l6mbEYRJelVJIuH98653zbKQv+KHsdiSoXkXihJqkByE
	fWd+xQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fyj0sdk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 22:03:06 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-398dcfabbf8so8508837a91.0
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 15:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791496986; x=1792101786; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tH1OwCS82bpX9kusapPnvRENv6Gr7AgMG4+Hp9O2t9Q=;
        b=PPABQUMQyYv0KBVC+3cGYi44s5sF8mjm3gFu0DlB0BUap0zUyzyEarvn19QJMwqoFZ
         +h/X1ZyelWSBAxHQhknibr34l3Jz1N9dDQ2e67PSbuJAfTRRlmkaHMylqXn+QPiTZtHL
         2Q2Eg1/dc4RfI2gFV/dHYeEWHwCkgbnIZIyE2gOiq6csHTfGGcUVMHp1HDSJbJNAxgUD
         u2AGm4ZmIdhapY5fX7eHooYEKsNXiP5WStnDteOOnwoJkOIrC7SoEjvSU3LAQmeSTPpl
         4sxIGBha3Oh9E0FcC0z4klE4eQYFPB+mqiQZuchCXatwqOgqOSrDo3Xm1QTmCuFiDi+b
         9qEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791496986; x=1792101786;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tH1OwCS82bpX9kusapPnvRENv6Gr7AgMG4+Hp9O2t9Q=;
        b=Nnvzyt2D4beXHSC0qXmoz6krLU9etrHYzCqjYihhA2hi4NZahC3Eb5fctbuUtH7wei
         ve8o0qZOvX2OSg5Jy+5lg9xLPJ3CqkE9f5nvbreNiKVDBM0NVlWUBzIQCLpYbM+AqHV3
         xVL5k18nMLbEGyXMmb7TEpwQuixJncwgYUg6/poho9wx3vw7tX9musyFqO2zLOwQHGsX
         QjcxD3eSmUDL/t1c1FELn/8tiphD1HsF28YKH4+GVLqlyMHVvu+KxXDckoeNZhwqDdQ1
         Pg6Ge690AeDKbWHMpPiMcTapIVfpLZlI/jlubd+oNztwjNhYRNnDolusqOgDpk90RVo2
         mH6w==
X-Forwarded-Encrypted: i=1; AKwUvBzyYViCC6FoWj5BggOSSINsQ9FNVnxCsZhYLl776YNYrd0IipJ6xso2/GZXyNH753PXjMSDjTAgXvIm@vger.kernel.org
X-Gm-Message-State: AFq9FYJEwmADBpJWBk6tRgdPioUUBQXVB67f2NoG4we4Vnq84oYTNn8i
	B2e4r2TM38S4ei9KrTwEYPZKOcQDoSmXcvwR+M4YW/V9wee9Tsc22/LvfVy7TL7ID7mOA0csjml
	6nvHkVPS56puqg/UtL5DaIaUs2fI++Xwier4GyV2HVqWsaILydzU3RGskJViEdzg=
X-Gm-Gg: AYBFou1MESPBENShKMoIybHXlj0fqoWmVWC9bXuVNYJfiEBH7EUoa8j+CShWhNg7peX
	j3t6T6eB1b5GiQb24R2ggfj6z8RaKoY1KxZHTo+OopeucIh96I35UPBkxqSpnD0cNoZVXpB3Oz2
	mOfhagNdf5kq7Z7TddA7Mf+mX87iqeUKuIxY6Ax8SsiaLEr6MPraH8+8V+ltXIp1grPyaqr8q2Z
	cMGNiECPLatlu5OzcyJfqiTkSC0y+yLHQCqpAPHOCWQ+eY6seBLwK+suoQGmPwOj6ZKktde12wA
	7SXk1fR6BPiaXeZ+ECD3Tn6nlh2qUimxQlGVTkrwEg030irqkEQ+J+i0F11HxWaUcZud12AHePO
	4J+VRLGoiLbeJN5axCjAr7goHEJk7ZYUo
X-Received: by 2002:a17:90a:d008:b0:3a8:49f2:8ddb with SMTP id 98e67ed59e1d1-3ab3ae36cbcmr100494a91.60.1791496985483;
        Thu, 08 Oct 2026 15:03:05 -0700 (PDT)
X-Received: by 2002:a17:90a:d008:b0:3a8:49f2:8ddb with SMTP id 98e67ed59e1d1-3ab3ae36cbcmr100466a91.60.1791496984769;
        Thu, 08 Oct 2026 15:03:04 -0700 (PDT)
Received: from [192.168.1.86] ([65.181.12.250])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab371b2f2bsm507326a91.15.2026.10.08.15.02.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 15:03:03 -0700 (PDT)
Message-ID: <630aac65-bf8a-4334-8187-0e7eb0e25217@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 09:02:54 +1100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 2/8] tee: optee: define the RPMI control and
 parcel-reference ABI
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
 <20261005-rpmi-tee-service-grp-dev-v2-2-72f222e23ec1@oss.qualcomm.com>
 <CAGgiveUB4ETEbcfCvagfj6q__jsfPmJoeT_w0xA-9NOZpGNwfQ@mail.gmail.com>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <CAGgiveUB4ETEbcfCvagfj6q__jsfPmJoeT_w0xA-9NOZpGNwfQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=BfpNQbt2 c=1 sm=1 tr=0 ts=6ac8131a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=9v5PfQ1E2GNzj2RibJmqVw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=DlIsFlc6WOmABSFwOnwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: FaaCcj9DA1O2xHhLOccDINYjoUmhH5HH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA4NyBTYWx0ZWRfXxL0X1q78qCjp
 7muEmst8UmUlbPMJCJ6KQ9DucvHMEsy12B69aQ94N2ok2MIiaQR4GkEic/4bVLz74CelQ/x892P
 oXIr3MioFFvSQAhwVDPJQ0V7ffvXWEyUNu78MRyGsJm7NpVjoc7LnCDb4GXLjVqHZOtFGK8LggZ
 4e5lTErNIyDza0XdV/RS89dIIYPFSuTIjn97ErSXdL7gW4qA4EtfiO6pGTKauRGq3/1jqtDx/+D
 bUZrgzobajSsL1QLsQhXlzcNvmTKhYsWDvyXrtBeo+OQbrlN1FHoHt7FRx/VlZvgpxBWS+PZIRs
 QouvWpfSPRTvV7ZTnpUpu3QT6Z+dwDqYpCtpxzVRL4dIElcaqlpmejravT1OBESMv4gQW539BWb
 zI3v9jMaibHUDe02iYLZcvO5BBM7yc/3OYmrtqZbUmL3B6wOE0L8kjJ2iKdDAo7tKcAqxUc6EFz
 S/iQM484dGCdwwU1mXA==
X-Proofpoint-GUID: FaaCcj9DA1O2xHhLOccDINYjoUmhH5HH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA4NyBTYWx0ZWRfXwKggggNV0VN2
 YBJ+UIUOzSHAqQNzfGrDHc4Xq1BEhcSBKx64DZJSCelZLi/wSiAuRIUVum0YEdcK1t/CiFmrGUg
 DueQxKXNVQrpHbN8MvChTpHsjVETC4Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_07,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610080087

Hi Jens,

On 10/8/2026 5:51 PM, Jens Wiklander wrote:
> Hi Amir,
> 
> On Tue, Oct 6, 2026 at 2:40 AM Amirreza Zarrabi
> <amirreza.zarrabi@oss.qualcomm.com> wrote:
>>
>> Define the OP-TEE service protocol carried by RPMI TEE_CALL payloads.
>> Add operations for version and capability queries, shared-memory
>> unregistration, asynchronous notification enablement, and yielding-call
>> start and resume. Use fixed-width little-endian control fields and RPMI
>> error codes for control responses.
>>
>> Add a parcel memory-reference layout to the common message parameter
>> union. Identify shared memory by its parcel ID and nonce, with a 64-bit
>> byte offset and size, without changing the message parameter size.
>> Encode NULL references with a zero parcel ID and nonce, leaving parcel
>> ID zero usable with a nonzero nonce.
>>
>> Document the wire layouts and ownership rules for matching Linux and
>> OP-TEE implementations.
>>
>> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>> ---
>>  drivers/tee/optee/optee_msg.h  |  38 +++++--
>>  drivers/tee/optee/optee_rpmi.h | 234 +++++++++++++++++++++++++++++++++++++++++
>>  2 files changed, 264 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/tee/optee/optee_msg.h b/drivers/tee/optee/optee_msg.h
>> index 6c3043f8da33..028f8cd95fdd 100644
>> --- a/drivers/tee/optee/optee_msg.h
>> +++ b/drivers/tee/optee/optee_msg.h
>> @@ -31,6 +31,9 @@
>>  #define OPTEE_MSG_ATTR_TYPE_FMEM_INPUT         OPTEE_MSG_ATTR_TYPE_RMEM_INPUT
>>  #define OPTEE_MSG_ATTR_TYPE_FMEM_OUTPUT                OPTEE_MSG_ATTR_TYPE_RMEM_OUTPUT
>>  #define OPTEE_MSG_ATTR_TYPE_FMEM_INOUT         OPTEE_MSG_ATTR_TYPE_RMEM_INOUT
>> +#define OPTEE_MSG_ATTR_TYPE_PMEM_INPUT         OPTEE_MSG_ATTR_TYPE_RMEM_INPUT
>> +#define OPTEE_MSG_ATTR_TYPE_PMEM_OUTPUT                OPTEE_MSG_ATTR_TYPE_RMEM_OUTPUT
>> +#define OPTEE_MSG_ATTR_TYPE_PMEM_INOUT         OPTEE_MSG_ATTR_TYPE_RMEM_INOUT
>>  #define OPTEE_MSG_ATTR_TYPE_TMEM_INPUT         0x9
>>  #define OPTEE_MSG_ATTR_TYPE_TMEM_OUTPUT                0xa
>>  #define OPTEE_MSG_ATTR_TYPE_TMEM_INOUT         0xb
>> @@ -149,6 +152,23 @@ struct optee_msg_param_fmem {
>>         u64 global_id;
>>  };
>>
>> +/**
>> + * struct optee_msg_param_pmem - RPMI parcel memory reference
>> + * @offs: full-width byte offset from the parcel's first byte
>> + * @size: logical reference size, or required size for a short-buffer response
>> + * @parcel_id: firmware-assigned parcel identifier
>> + * @nonce: nonzero REE nonce supplied when sharing the parcel
>> + *
>> + * A zero parcel ID and nonce encode a NULL reference. Its offset must be zero;
>> + * its size is preserved. Parcel ID zero remains valid with a nonzero nonce.
>> + */
>> +struct optee_msg_param_pmem {
> 
> Without an internal offset like in struct optee_msg_param_fmem, an
> explicit register SHM call into OP-TEE is needed before it can be
> used. You'd still need the TEE_MEMORY_PARCEL_CREATE, but we can save
> one round-trip into the secure world.
> 

The original intenation was to use parcel-relative offsets, with the
secure-side memory object covers the entire parcel. OP-TEE can retrieve it
lazily and apply the supplied offset directly, so this design does not require
an explicit SHM registration call or an additional round trip.

Since we are implementing the RPMI parcel memory-object cache independently of
FF-A's cache in OP-TEE, this seems simpler: it avoids a separate
initial-offset property, preserves a full-width offset reference, while
keeping OP-TEE ignorant from the SHM concept which is a Linux side concept.

That said, I can separate the offsets to matching FF-A's memory-object
model. But I am not sure what we achive?

>> +       u64 offs;
>> +       u64 size;
>> +       u32 parcel_id;
>> +       u32 nonce;
> 
> I wonder if parcel_id and nonce wouldn't be better combined into a
> single field. They need to be separate when preparing arguments for
> the TEE_MEMORY_* calls. Everywhere else, it's only an opaque memory
> handle, and one handle is easier to keep track of than two.

I thought about that before. This would push the conversion to the
firmware boundary. I was not sure if it is acceptable. I'll do that :).

> 
>> +};
>> +
>>  /**
>>   * struct optee_msg_param_value - opaque value parameter
>>   * @a: first opaque value
>> @@ -166,18 +186,19 @@ struct optee_msg_param_value {
>>  /**
>>   * struct optee_msg_param - parameter used together with struct optee_msg_arg
>>   * @attr:      attributes
>> - * @tmem:      parameter by temporary memory reference
>> - * @rmem:      parameter by registered memory reference
>> - * @fmem:      parameter by FF-A registered memory reference
>> - * @value:     parameter by opaque value
>> - * @octets:    parameter by octet string
>> + * @u.tmem:    parameter by temporary memory reference
>> + * @u.rmem:    parameter by registered memory reference
>> + * @u.fmem:    parameter by FF-A registered memory reference
>> + * @u.pmem:    parameter by RPMI parcel memory reference
>> + * @u.value:   parameter by opaque value
>> + * @u.octets:  parameter by octet string
>>   * @u:         union holding OP-TEE msg parameter
>>   *
>>   * @attr & OPTEE_MSG_ATTR_TYPE_MASK indicates if tmem, rmem or value is used in
>>   * the union. OPTEE_MSG_ATTR_TYPE_VALUE_* indicates value or octets,
>> - * OPTEE_MSG_ATTR_TYPE_TMEM_* indicates @tmem and
>> - * OPTEE_MSG_ATTR_TYPE_RMEM_* or the alias PTEE_MSG_ATTR_TYPE_FMEM_* indicates
>> - * @rmem or @fmem depending on the conduit.
>> + * OPTEE_MSG_ATTR_TYPE_TMEM_* indicates @u.tmem. OPTEE_MSG_ATTR_TYPE_RMEM_*
>> + * and its FMEM/PMEM aliases indicate @u.rmem, @u.fmem or @u.pmem depending
>> + * on the conduit.
>>   * OPTEE_MSG_ATTR_TYPE_NONE indicates that none of the members are used.
>>   */
>>  struct optee_msg_param {
>> @@ -186,6 +207,7 @@ struct optee_msg_param {
>>                 struct optee_msg_param_tmem tmem;
>>                 struct optee_msg_param_rmem rmem;
>>                 struct optee_msg_param_fmem fmem;
>> +               struct optee_msg_param_pmem pmem;
>>                 struct optee_msg_param_value value;
>>                 u8 octets[24];
>>         } u;
>> diff --git a/drivers/tee/optee/optee_rpmi.h b/drivers/tee/optee/optee_rpmi.h
>> new file mode 100644
>> index 000000000000..252216aad09b
>> --- /dev/null
>> +++ b/drivers/tee/optee/optee_rpmi.h
>> @@ -0,0 +1,234 @@
>> +/* SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause) */
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +#ifndef OPTEE_RPMI_H
>> +#define OPTEE_RPMI_H
>> +
>> +#include <linux/bitops.h>
>> +#include <linux/types.h>
>> +#include <linux/uuid.h>
>> +
>> +/*
>> + * OP-TEE service ABI over RPMI TEE_CALL.
>> + *
>> + * Requests and responses are carried in the TEE_CALL service payload.
>> + * Control fields are little-endian. Response status fields contain signed
>> + * RPMI error codes, distinct from the outer TEE_CALL status and the GP
>> + * command result in optee_msg_arg.ret.
>> + */
>> +#define OPTEE_RPMI_SERVICE_UUID \
>> +       UUID_INIT(0x486178e0, 0xe7f8, 0x11e3, \
>> +                 0xbc, 0x5e, 0x00, 0x02, 0xa5, 0xd5, 0xc5, 0x1b)
>> +
>> +#define OPTEE_RPMI_VERSION_MAJOR               1
>> +#define OPTEE_RPMI_VERSION_MINOR               0
>> +
>> +/**
>> + * struct optee_rpmi_probe_req - request without operation-specific arguments
>> + * @op: GET_API_VERSION, GET_OS_VERSION or EXCHANGE_CAPABILITIES
>> + */
>> +struct optee_rpmi_probe_req {
>> +       __le32 op;
>> +} __packed;
>> +
>> +/**
>> + * struct optee_rpmi_status_resp - response carrying only an RPMI status
>> + * @status: signed RPMI error code
>> + */
>> +struct optee_rpmi_status_resp {
>> +       __le32 status;
>> +} __packed;
>> +
>> +/*
>> + * Return the service API version.
>> + *
>> + * Request:  struct optee_rpmi_probe_req
>> + * Response: struct optee_rpmi_api_resp
>> + */
>> +#define OPTEE_RPMI_GET_API_VERSION     0
>> +
>> +/**
>> + * struct optee_rpmi_api_resp - GET_API_VERSION response
>> + * @status: signed RPMI error code
>> + * @major: incompatible protocol revision
>> + * @minor: compatible protocol revision
>> + */
>> +struct optee_rpmi_api_resp {
>> +       __le32 status;
>> +       __le32 major;
>> +       __le32 minor;
>> +} __packed;
> 
> Why do these communication structs have to be packed? With careful
> design of the layout, padding, alignment, etc, it shouldn't be an
> issue.

Agreed. The structures already have naturally aligned fields and
explicit reserved fields where needed, so `__packed` is unnecessary for
their current layouts. I'll remove it and keep the wire layout explicitly
defined, retaining unaligned access helpers where transport-buffer alignment
is not guaranteed.

> 
>> +
>> +/*
>> + * Return the trusted OS revision, not the service API revision.
>> + *
>> + * Request:  struct optee_rpmi_probe_req
>> + * Response: struct optee_rpmi_os_resp
>> + */
>> +#define OPTEE_RPMI_GET_OS_VERSION      1
>> +
>> +/**
>> + * struct optee_rpmi_os_resp - GET_OS_VERSION response
>> + * @status: signed RPMI error code
>> + * @major: trusted OS major revision
>> + * @minor: trusted OS minor revision
>> + * @reserved: must be zero
>> + * @build_id: trusted OS build identifier, zero if unspecified
>> + */
>> +struct optee_rpmi_os_resp {
>> +       __le32 status;
>> +       __le32 major;
>> +       __le32 minor;
>> +       __le32 reserved;
>> +       __le64 build_id;
>> +} __packed;
>> +
>> +/*
>> + * Query secure-world capabilities and limits.
>> + *
>> + * Request:  struct optee_rpmi_probe_req
>> + * Response: struct optee_rpmi_caps_resp
>> + */
>> +#define OPTEE_RPMI_EXCHANGE_CAPABILITIES       2
>> +
>> +/**
>> + * struct optee_rpmi_caps_resp - EXCHANGE_CAPABILITIES response
>> + * @status: signed RPMI error code
>> + * @secure_caps: reserved for future optional features; zero in version 1
>> + * @rpc_param_count: nonzero parameter capacity of each RPC argument buffer
>> + * @notification_count: nonzero logical key count, including synchronous keys
>> + *                     Keys range from zero through notification_count - 1.
>> + *
>> + * Version 1 defines no capability bits. Unknown bits are ignored by Linux
>> + * for compatibility with future extensions.
> 
> Note that we expect the ABI version to stay at 1.0 for a foreseeable
> future. Extensions to the ABI are primarily negotiated using
> capabilities.
> 

Ack.

Thanks Jens,

Best regards,
Amir

> Cheers,
> Jens
> 
>> + */
>> +struct optee_rpmi_caps_resp {
>> +       __le32 status;
>> +       __le32 secure_caps;
>> +       __le32 rpc_param_count;
>> +       __le32 notification_count;
>> +} __packed;
>> +
>> +/*
>> + * Unregister a shared parcel from OP-TEE.
>> + *
>> + * Request:  struct optee_rpmi_unregister_req
>> + * Response: struct optee_rpmi_status_resp
>> + */
>> +#define OPTEE_RPMI_UNREGISTER_SHM      3
>> +
>> +/**
>> + * struct optee_rpmi_unregister_req - retire a shared parcel in OP-TEE
>> + * @op: OPTEE_RPMI_UNREGISTER_SHM
>> + * @parcel_id: parcel to retire; zero is valid with a nonzero nonce
>> + * @nonce: nonzero nonce associated with the parcel
>> + *
>> + * Success means OP-TEE stopped using the mapping and released its receiver
>> + * interest.
>> + */
>> +struct optee_rpmi_unregister_req {
>> +       __le32 op;
>> +       __le32 parcel_id;
>> +       __le32 nonce;
>> +} __packed;
>> +
>> +/*
>> + * Enable asynchronous notification delivery.
>> + *
>> + * Request:  struct optee_rpmi_enable_notif_req
>> + * Response: struct optee_rpmi_status_resp
>> + */
>> +#define OPTEE_RPMI_ENABLE_ASYNC_NOTIF  4
>> +
>> +/**
>> + * struct optee_rpmi_enable_notif_req - bind an incoming RPMI doorbell
>> + * @op: OPTEE_RPMI_ENABLE_ASYNC_NOTIF
>> + * @signal_id: allocated TEE-to-REE signal, not a logical notification key
>> + *
>> + * Success activates delivery and raises the doorbell for pending work.
>> + * Raising the signal requests OPTEE_MSG_CMD_DO_BOTTOM_HALF.
>> + * OPTEE_MSG_CMD_STOP_ASYNC_NOTIF stops future doorbell generation, but does
>> + * not drain already-raised signals or release the signal ID.
>> + */
>> +struct optee_rpmi_enable_notif_req {
>> +       __le32 op;
>> +       __le32 signal_id;
>> +} __packed;
>> +
>> +/*
>> + * Start a yielding command using shared command and RPC arguments.
>> + *
>> + * Request:  struct optee_rpmi_call_req
>> + * Response: struct optee_rpmi_call_resp
>> + */
>> +#define OPTEE_RPMI_YIELDING_CALL_WITH_ARG              5
>> +
>> +#define OPTEE_RPMI_YIELDING_CALL_RETURN_DONE           0
>> +#define OPTEE_RPMI_YIELDING_CALL_RETURN_RPC_CMD                1
>> +#define OPTEE_RPMI_YIELDING_CALL_RETURN_INTERRUPT      2
>> +
>> +/**
>> + * struct optee_rpmi_call_req - start a yielding command
>> + * @op: OPTEE_RPMI_YIELDING_CALL_WITH_ARG
>> + * @parcel_id: argument parcel identity
>> + * @nonce: nonce associated with the parcel
>> + * @flags: zero in version 1
>> + * @arg_offset: command argument byte offset from the parcel's first byte
>> + * @rpc_offset: RPC argument byte offset from the parcel's first byte
>> + * @arg_size: command argument extent in bytes
>> + * @rpc_size: RPC argument capacity in bytes
>> + *
>> + * Firmware validates ownership, RW access, alignment and disjoint ranges.
>> + * RPMI_ERR_BUSY rejects an initial request without acquiring call ownership.
>> + */
>> +struct optee_rpmi_call_req {
>> +       __le32 op;
>> +       __le32 parcel_id;
>> +       __le32 nonce;
>> +       __le32 flags;
>> +       __le64 arg_offset;
>> +       __le64 rpc_offset;
>> +       __le32 arg_size;
>> +       __le32 rpc_size;
>> +} __packed;
>> +
>> +/**
>> + * struct optee_rpmi_call_resp - yielding command response
>> + * @status: signed RPMI error code, distinct from the command's GP result
>> + * @result: OPTEE_RPMI_YIELDING_CALL_RETURN_* value when status is success
>> + * @resume_token: zero for DONE, nonzero opaque token for a suspended command
>> + *
>> + * DONE releases all access to the call's argument and RPC ranges. RPC_CMD
>> + * requests RPC command handling; INTERRUPT requests resumption without an
>> + * RPC command. Tokens belong to one accepted call, service and caller.
>> + */
>> +struct optee_rpmi_call_resp {
>> +       __le32 status;
>> +       __le32 result;
>> +       __le64 resume_token;
>> +} __packed;
>> +
>> +/*
>> + * Resume a suspended yielding command.
>> + *
>> + * Request:  struct optee_rpmi_resume_req
>> + * Response: struct optee_rpmi_call_resp
>> + */
>> +#define OPTEE_RPMI_YIELDING_CALL_RESUME        6
>> +
>> +/**
>> + * struct optee_rpmi_resume_req - resume a suspended command
>> + * @op: OPTEE_RPMI_YIELDING_CALL_RESUME
>> + * @reserved: must be zero
>> + * @resume_token: token from the preceding response for this call
>> + *
>> + * Resume must not return RPMI_ERR_BUSY.
>> + */
>> +struct optee_rpmi_resume_req {
>> +       __le32 op;
>> +       __le32 reserved;
>> +       __le64 resume_token;
>> +} __packed;
>> +
>> +#endif /* OPTEE_RPMI_H */
>>
>> --
>> 2.34.1
>>

