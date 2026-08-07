Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA98F3C1D7B
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 07:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786088579; cv=none; b=oTa1cu7Xft1UE5BrDscJDUn/VDpZtP3ltr+S9dp70/2DBLewKSoQIUbnD/WCuJ4UtDlaYjCSOGjVhepkkprqhwcGOPJezX7mZePsz8672Q70/swWcLI6VTA1iWOMhNkwGRyxlbstGouU9Kn/F/h8P2sw0Y90WkF2pYk7iY1cslc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786088579; c=relaxed/simple;
	bh=BK9hgk6vItfxqnsIoISGzlpDU9uEpG1Eg5FlYdfLaUs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Fc0wS4081kN0ZuNGXH0rlCW5WllJZNSGAntag66CovkQa7eLZwooKniHpDAOj6Os1v/q+KoLUp7LSuRQlwomGgcWyv7kjNzIIbCSpQrzi7FoyoLzIpjj/Xljm0QaypxJwZ5ZnD5m66YxQxL5WjgIA9AUOH3UoJVdB/5x2+GDPY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osyx.tech; spf=none smtp.mailfrom=osyx.tech; dkim=pass (2048-bit key) header.d=osyx-tech.20251104.gappssmtp.com header.i=@osyx-tech.20251104.gappssmtp.com header.b=Pt59ZD7v; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osyx.tech
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osyx.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osyx-tech.20251104.gappssmtp.com header.i=@osyx-tech.20251104.gappssmtp.com header.b="Pt59ZD7v"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4807df69172so44743f8f.1
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 00:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20251104.gappssmtp.com; s=20251104; t=1786088576; x=1786693376; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ubKtK2cT3F7Eeuk7KUajYtaFkIOEcFfT6C7ChKCXeuI=;
        b=Pt59ZD7vP5By9u0uJTnNwqigq4pl3tWyO7b9Ri7OnGgTlZf4FY4XG7XwPLIfwoT2Fk
         cu+JGKL8NITz8w3kvkIG7ii35iextVYxpArc6QXrWfqw12fUikG5Jrsl9gmqnVHAi99e
         N7E3Vo3iTsvZQgzOKsdR2MWEPixpI6SuBtGmwiLbYZjG5Q2x6UmUWKiLwqGGG2D3Qpwm
         7FCX1Hhb2H91Tt27Kr2i6BlrlyMfAUzOidDFqzMmPXdZ308L37iCPJwYgJ2Hua3eeB/D
         7KaQp6KdBgzMX93u1bREQFfm+HZGIKV5Nv3c29CbAyRVerD/pfy69Y5Z3g5Biu7cxUK0
         hU4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786088576; x=1786693376;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ubKtK2cT3F7Eeuk7KUajYtaFkIOEcFfT6C7ChKCXeuI=;
        b=n2npD3//TVc6NGgwQaD1yShcE9VvUVtW6JCr6gX7pv8vj3Euo/ZCDP+eUdjeAyksN3
         tsbjPWi1lnT7Qb0OfTeNXCtkGlNaKv6GUDwC9t2zm5AVXcujYPEc6VLVuMVEvws3wLgR
         NtjFWLgba9Wc4u7d0PgoXw/dtKFMMySKkpEK0iVt08rglV90F5O3OtOftF3ceBAqdJWn
         76UNse6oeH54KWgYbqv2cmOndr/Ypj6cRM1lNqfmjEYoZLabpdUYpjiWzlPQB6+f2PZa
         mtyQ/Y6vJGZx6Pc0830SROC2H6fsWQhBF3/4PxfFQ+povEOvvE5hHDPx5ZIvUdUOg9Ua
         9qBw==
X-Forwarded-Encrypted: i=1; AHgh+Rq8fTJCWtwOuehaszfkYs5b8YTmT7US7he0Ewp4EZIInyQ3oHLdE6cOEgML17tjcXj7rYd3gSm9MCuU@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5pOIwpkJl/xgh0dCw66gSYNsPyvWhZq6/DY2ep/5kuwro4qvn
	ymPvWeBeDBbIqWh9X0p5PCOea9OjarvEkxP83hhbCpHVjvBtm+mPt34zlwMcMg8GS1cBDMp/Xn3
	O+93n2raq
X-Gm-Gg: AR+sD11/F2D/ntbUfyOfEbUb3mVafVP32U/NgnyPu44zBuPogGjFj8TYy0ZyesVXrQw
	oR3HAxlx7BbCA7j8lLF15V4fAbzhgMgVlq0lFs7Qs7KwP0c7UCpaFxOzCFeLWeVo7uUrcMe6LZ8
	F7Hb/w1uK8c+41vGKreenFaMV5d399nDlfp9voU4URLZ6I9HNOyIPlN4suzlv0pTbTJR2fH2/jZ
	EL4LhFanoR7v0ZmkazbKLayPE+NSxrMEH6SRgu5lTxLwHDdEW41QLXqgtj2V3fCQxWvOKF/I4zU
	Zrg1Hgmxv1Fv7ET0rhN5kRVNBILpT+CVzv6wWU+I6MzWvmakVcE1kRfy4jWt8mIz5VV57kjwjl2
	cdj6oa0YBDXmVt5ZwfDgGvhK+73Ba4GBb10vBA2eLGWRtefh6Tn+b3zqwNt4Wg+ngyKOB3CQ0fH
	DAFLYa+mevB8gcSm6UgdOkSC5Cpv/oQQuQUP7Shjm24ugwVWOQuyPVo94mTdrubvcGuADyjFOSs
	Wjx5Pd5+01BRa6xB59tQuk3pW5jOfpFLQ==
X-Received: by 2002:a05:6000:2889:b0:47f:f002:3656 with SMTP id ffacd0b85a97d-47ff86d5b33mr14529837f8f.12.1786088576046;
        Fri, 07 Aug 2026 00:42:56 -0700 (PDT)
Received: from ?IPV6:2001:8a0:f59c:a900:2600:fba1:8d1e:1692? ([2001:8a0:f59c:a900:2600:fba1:8d1e:1692])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021506c0sm3100099f8f.11.2026.08.07.00.42.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 00:42:55 -0700 (PDT)
Message-ID: <ba698035-28a3-4b63-b1c9-5393c840d3f3@osyx.tech>
Date: Fri, 7 Aug 2026 08:42:53 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?Q?Jo=C3=A3o_Peixoto?= <jpeixoto@osyx.tech>
Subject: Re: [PATCH 2/6] virt: bao: Add Bao IPC shared memory driver
To: Andrew Jones <andrew.jones@oss.qualcomm.com>, joaopeixoto@osyx.tech
Cc: linux-kernel@vger.kernel.org, ajd@linux.ibm.com, alex@ghiti.fr,
 aou@eecs.berkeley.edu, bagasdotme@gmail.com, catalin.marinas@arm.com,
 conor+dt@kernel.org, corbet@lwn.net, dan.j.williams@intel.com,
 davidmcerdeira@osyx.tech, devicetree@vger.kernel.org, dev@kael-k.io,
 gregkh@linuxfoundation.org, haren@linux.ibm.com, heiko@sntech.de,
 jose@osyx.tech, kever.yang@rock-chips.com, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, maddy@linux.ibm.com, mani@kernel.org,
 nathan@kernel.org, neil.armstrong@linaro.org, palmer@dabbelt.com,
 pjw@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, robh@kernel.org,
 will@kernel.org
References: <20251224135217.25350-1-joaopeixoto@osyx.tech>
 <20260107162829.416885-1-joaopeixoto@osyx.tech>
 <20260107162829.416885-3-joaopeixoto@osyx.tech>
 <lpocmy3nmdcudoewe6uxal4srnd2acvb4fi73fthbruyb3wpo6@ky5cpwirm2vm>
Content-Language: en-US
In-Reply-To: <lpocmy3nmdcudoewe6uxal4srnd2acvb4fi73fthbruyb3wpo6@ky5cpwirm2vm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 1/14/26 20:37, Andrew Jones wrote:
> On Wed, Jan 07, 2026 at 04:28:25PM +0000,joaopeixoto@osyx.tech wrote:
> ...
>> diff --git a/arch/riscv/include/asm/bao.h b/arch/riscv/include/asm/bao.h
>> new file mode 100644
>> index 000000000000..35658f37e1bd
>> --- /dev/null
>> +++ b/arch/riscv/include/asm/bao.h
>> @@ -0,0 +1,31 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Bao Hypervisor Hypercall Interface
>> + *
>> + * Copyright (c) Bao Project and Contributors. All rights reserved.
>> + *
>> + * Authors:
>> + *	João Peixoto<joaopeixoto@osyx.tech>
>> + *	José Martins<jose@osyx.tech>
>> + *	David Cerdeira<davidmcerdeira@osyx.tech>
>> + */
>> +
>> +#ifndef __ASM_RISCV_BAO_H
>> +#define __ASM_RISCV_BAO_H
>> +
>> +#include <asm/sbi.h>
>> +
>> +#define BAO_SBI_EXT_ID 0x08000ba0
>> +
>> +static inline unsigned long bao_ipcshmem_hypercall(unsigned long hypercall_id,
>> +						   unsigned long ipcshmem_id)
>> +{
>> +	struct sbiret ret;
>> +
>> +	ret = sbi_ecall(BAO_SBI_EXT_ID, hypercall_id, ipcshmem_id, 0, 0, 0, 0,
>> +			0);
> Just let lines like these stick out. We have up to 100 chars and these
> types of few-char wraps are the most annoying.
>
> Thanks,
> drew
Agreed. In v3 the IPC hypercall ID is a shared constant, so
bao_ipcshmem_hypercall() now takes a single argument and its declaration
fits on one line, and I unwrapped the remaining few-char wraps. For example
the RISC-V ecall is now a single line:

     ret = sbi_ecall(BAO_SBI_EXT_ID, BAO_IPCSHMEM_HYPERCALL_ID, 
ipcshmem_id, 0, 0, 0, 0, 0);

Thanks.
