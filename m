Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2633939A2
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 15:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780588118; cv=none; b=fickNKi2hHWmC/mpSYN6PIVQ8NVofGtlHxHHGrudLeVUld+qaRXNqidm/3UStkv9l7x/cseIbqdAvNrcrMJPtQwXF0rplHUdKBZSHmmlje2JKOBg1ot8Y4dxaHKt6lGqNpXrudxCAx9A5cV1PH58dri4Mc+SPa34KlIWuYXrJsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780588118; c=relaxed/simple;
	bh=TQZ3atWXP/F/XI/SjQlzb5ztk+kdqOw4+QF2X9bBJQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V01P6Y0s7ewWlo6OU70qL9nAtXcAnnwBH0M65+Oqr4y5jfSc1wWqlrpzJPD8SgstXiQpSzIokJYjN10rIViyKCKlTZamy8bCcV7QUaF4dosNvRluIdY3fgX/n6P9UYujZKPeRfUmYVY0Ms/9BqwwE5Pw+4Cy5NZQn5ITiK+JYYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pNByy7ks; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UP6hn2N7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pNByy7ks";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UP6hn2N7"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 654EirWb1132209
	for <devicetree@vger.kernel.org>; Thu, 4 Jun 2026 15:48:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Uw6QCWYPdO8p/liVgrtg/ryP
	3ZKKZlZR6/0SedffSUI=; b=pNByy7ks5oSDTnmu36TN5VYqBmPDe63399FI0X6l
	ZA88pX43aENr1iZ7AnflhF1bzR0OVso3Jw6jDP7M7e4RDnQWxLm0JulstTIvfnoG
	BWAXc3BwzYHx4QwNVrtiutwK9IDFVM6oZVb56/G00KEELVEzCZWfoUtgAvHPHxaT
	8zRae5m7dyfDM3wwu7GSMfNdDe3YNUQ62Qd2zVdBuT0OFNEnDd7j44NrLAOY4tdW
	B6AX8Fi6KILGJTnnJZyLqy4MCcFkOTeqnWQsCm5v2SwoBMs5TiQc0cg+D6qTeEfk
	AhYhIfPWZrnsr1j0XbiVghZ5NNmUXqBr6xotAKuBC2UMig==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ek5wshsjs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 15:48:34 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-304dd917645so783348eec.1
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 08:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780588113; x=1781192913; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Uw6QCWYPdO8p/liVgrtg/ryP3ZKKZlZR6/0SedffSUI=;
        b=UP6hn2N7DlrNGSWLuMG5TXocYUIv04GWvhyh64r6/mAHa9CsqMQbNaFzysPz99NY0+
         J+RJwxHpP6++RsYqgMUvvirV/+xonSuJKtwbPj6fCk5G/uaoj02UfEZ6KO3pbFr3jIpm
         9Gw3QNtZX08eml2gAAoW2oz9l6GkWmAW3VFw0KPe1Oa+fdrSnnzq/qtSrzMObhusWHYi
         Od/DcVepb3bv/FX5kaL6SxAnADcJ0moH0xYvzWwBI5vwE5THKWNCVlwYx4nU5LDYNcm1
         rpqJ1j9nrZe+sOg8eDn3piE4ZdHAlcGx3vBLnIe5R3TvswTKj0jRfrLXmuJYt7zGxgYb
         ULyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780588113; x=1781192913;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uw6QCWYPdO8p/liVgrtg/ryP3ZKKZlZR6/0SedffSUI=;
        b=Wp2rl07tPhRV1nuuywFynlVW3pwsIIje+89pWpJYpZsG8yPbEWV6ZsckPQn+OCfTIV
         7HDW/ukvpRr7wRxpIJsVzvs/IA7YNJGQVtedeE3MNoS6mp32puhSlynVJbpWWyiN+X5u
         2MKMc3U2n41EFsPhPImpu65ktSjLVi1s438IHN8ovRi5UhfKDpTx+zMYxRwbO3jBk4NV
         FiDP2TxseqVjkNuHl39Vm+5apbjI8zSDZtRNdrmBJEc/G4VtuDPlKD3vK5DTIrycfvvR
         iz4eNxbvks5gSY86t+pC6Gvw5yf8C5z6WBGuFKp3cgrocRSORwbJ80+s6MzHk26WUnnI
         v/Tw==
X-Forwarded-Encrypted: i=1; AFNElJ9iwYhF3Xt5bRZyXd9qcRWsPwliP7+J5Hz1rXBrgDhOBG18YtrDCQczGBjTywmGDI8s8bIZL2h74lxs@vger.kernel.org
X-Gm-Message-State: AOJu0YzX2VwUMnUpH+lHIS4FOuKsZXmTHOf8LrPw7+b8lcTsIE6RDGhq
	9nzmzjKVBbKmh0cyYOTB9nBpl+7sB1r05t0sjKU7w7qDhkCSIgz/GEVjc5RYm2qvEnmyBvJcSC9
	I/v46tn7CmDRppuRdbpmNX4IjabY5n4kuK42aZLXOzwAshUxQF8enlMYur9Yma3GO
X-Gm-Gg: Acq92OHX1M9TaJwcRWWzbZ6MKOegcpzoLIICK6CwaKnqPe3AWIQFHAdKX2L7lxaUPCP
	D6Y3o3PDSlcX1v/4jsNfdqmx6nzsTcqDzDCJTKRuQ/nsJiSlUirsmfbxyQh/ZWOWAaBUAoYKac6
	dViE1t+7ZJ5ebJOTSU0in6B6jgoz4WjhiIoxsbgvA0tUEGeBMScGQTG8sVvnqmPjQQfnI/dBgjQ
	Pmx6X7+QVdD7jyRuLw0Ue+gz1dUMmt6uGrAWZ7xVFXV+p1zyScLTN8zyznkul0hSPaoHEby+Mfi
	hZhjQsI0KFgZzfA304Dk87tsy6Ex9ADjUjTAhnsg2V1wBnB4XQZ6rYJZ1bOpuGslD10Jxsvt9l9
	T/gaEuVWUPoSJSaojtbjrONdEuGRAb1vyqvTP0QvcNQ==
X-Received: by 2002:a05:7300:a985:b0:304:6139:5a3e with SMTP id 5a478bee46e88-3074fc35ee5mr4025042eec.34.1780588112998;
        Thu, 04 Jun 2026 08:48:32 -0700 (PDT)
X-Received: by 2002:a05:7300:a985:b0:304:6139:5a3e with SMTP id 5a478bee46e88-3074fc35ee5mr4025000eec.34.1780588112429;
        Thu, 04 Jun 2026 08:48:32 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074d9fde90sm8054492eec.0.2026.06.04.08.48.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 08:48:32 -0700 (PDT)
Date: Thu, 4 Jun 2026 10:48:30 -0500
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Guodong Xu <docular.xu@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Zong Li <zong.li@sifive.com>, Deepak Gupta <debug@rivosinc.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
        Chen Wang <unicorn_wang@outlook.com>,
        Inochi Amaoto <inochiama@gmail.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Shuah Khan <shuah@kernel.org>, Christian Brauner <brauner@kernel.org>,
        linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
        kvm-riscv@lists.infradead.org,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>,
        devicetree@vger.kernel.org, spacemit@lists.linux.dev,
        sophgo@lists.linux.dev, linux-kselftest@vger.kernel.org,
        Charles Jenkins <thecharlesjenkins@gmail.com>,
        Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH v3 08/15] riscv: Add Zic64b to cpufeature and hwprobe
Message-ID: <4dh7hewwdowucpcz7wpg55wruh2ze4afjkk2nwxfm6pfucfnzt@pujmvbwax4ot>
References: <20260603-rva23u64-hwprobe-v2-v3-0-5529a7b28384@gmail.com>
 <20260603-rva23u64-hwprobe-v2-v3-8-5529a7b28384@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-rva23u64-hwprobe-v2-v3-8-5529a7b28384@gmail.com>
X-Proofpoint-GUID: aLUaclWamGTePyARwAylL5ITbvZ0LVuQ
X-Proofpoint-ORIG-GUID: aLUaclWamGTePyARwAylL5ITbvZ0LVuQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDE1NCBTYWx0ZWRfXxDaM4NrxfBhi
 OBT2OGX2sjXFxBiiRV1UwYUTiCYPAq4lgAITP66XFz0KTQ8/pdPyCkIK7cenexuAN7M/gmIWuzb
 M9bFY8rZjYNrnBUoe6BKX5G3uwUrfK7u1Fju+dc3h9H+BrDuPevZ2Llcm5zB/4gDCi98rXSg8b6
 bxjod0yBofLuRrwrga8BPZYtZ+RAsHxulVhYi65FA3u7NbUEXd1hBf1GaEL20nOYbnFDdFXNh0o
 KDByllpncjRRifwXRsO+BQc04/G05bVvg/S9ncj+thnJRBaxyqu8y+CuwdqVkBL2gZYbOOfgmp1
 twY5mNnYRjSuHEf3796HYIzjtjzn8l4iSv9FIJQ0yQGxZ6diEhbOKzMu5p7nj9NvDvJPhWIbRPN
 xo7MLhR0kcDajAqP/at3bJjeXPwpbZIjtWYv5vxtmqlqBXqgBPfDBH+hpxdfCAOG6R8dATLVZ7k
 b4plfCtkbcbitOLa5Vg==
X-Authority-Analysis: v=2.4 cv=POc/P/qC c=1 sm=1 tr=0 ts=6a219e52 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=pe5oJuNUrb7EmSQ8bfMA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1011 bulkscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040154

On Wed, Jun 03, 2026 at 07:12:03AM -0400, Guodong Xu wrote:
> Zic64b mandates 64-byte naturally aligned cache blocks and is a
> mandatory extension of the RVA22 and RVA23 profiles.  Allocate a
> RISCV_ISA_EXT_ZIC64B id, parse "zic64b" from the ISA string with a
> validate callback that requires cbom/cbop/cboz cache block sizes of 64
> bytes, and export it through hwprobe.
> 
> Signed-off-by: Guodong Xu <docular.xu@gmail.com>
> ---
> v3: New patch.
> ---
>  Documentation/arch/riscv/hwprobe.rst  |  3 +++
>  arch/riscv/include/asm/hwcap.h        |  1 +
>  arch/riscv/include/uapi/asm/hwprobe.h |  1 +
>  arch/riscv/kernel/cpufeature.c        | 18 ++++++++++++++++++
>  arch/riscv/kernel/sys_hwprobe.c       |  1 +
>  5 files changed, 24 insertions(+)
> 
> diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
> index 002d5046ab689..601e81f561421 100644
> --- a/Documentation/arch/riscv/hwprobe.rst
> +++ b/Documentation/arch/riscv/hwprobe.rst
> @@ -425,3 +425,6 @@ The following keys are defined:
>    * :c:macro:`RISCV_HWPROBE_EXT_B`: The B extension is supported, as defined
>      in version 1.0 of the Bit-Manipulation ISA extensions, and implies the
>      presence of the Zba, Zbb, and Zbs sub-extensions.

Need a blank line here.

> +  * :c:macro:`RISCV_HWPROBE_EXT_ZIC64B`: The Zic64b extension is supported,
> +    as defined in the RISC-V Profiles specification starting from commit
> +    b1d80660 ("Updated to ratified state.")
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index 58523b3a1998a..36572c1ff438a 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -117,6 +117,7 @@
>  #define RISCV_ISA_EXT_ZICCAMOA		107
>  #define RISCV_ISA_EXT_ZICCIF		108
>  #define RISCV_ISA_EXT_ZA64RS		109
> +#define RISCV_ISA_EXT_ZIC64B		110
>  
>  #define RISCV_ISA_EXT_XLINUXENVCFG	127
>  
> diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
> index 430dc49a82863..36ec8ab470423 100644
> --- a/arch/riscv/include/uapi/asm/hwprobe.h
> +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> @@ -122,6 +122,7 @@ struct riscv_hwprobe {
>  #define		RISCV_HWPROBE_EXT_ZICCRSE	(1ULL << 4)
>  #define		RISCV_HWPROBE_EXT_ZA64RS	(1ULL << 5)
>  #define		RISCV_HWPROBE_EXT_B		(1ULL << 6)
> +#define		RISCV_HWPROBE_EXT_ZIC64B	(1ULL << 7)
>  
>  /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
>  
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index e0197160af6dd..79ff431768139 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -154,6 +154,23 @@ static int riscv_ext_zicbop_validate(const struct riscv_isa_ext_data *data,
>  	return 0;
>  }
>  
> +static int riscv_ext_zic64b_validate(const struct riscv_isa_ext_data *data,
> +				     const unsigned long *isa_bitmap)
> +{
> +	/*
> +	 * Zic64b mandates 64-byte naturally aligned cache blocks; cross-check the
> +	 * cbom/cbop/cboz block-size device-tree properties to avoid inconsistency.
> +	 */
> +	if (riscv_cbom_block_size != 64 ||
> +	    riscv_cbop_block_size != 64 ||
> +	    riscv_cboz_block_size != 64) {
> +		pr_err("Zic64b detected in ISA string, disabling as the cache block size is not 64 bytes\n");
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
>  static int riscv_ext_f_validate(const struct riscv_isa_ext_data *data,
>  				const unsigned long *isa_bitmap)
>  {
> @@ -524,6 +541,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
>  	__RISCV_ISA_EXT_SUPERSET(b, RISCV_ISA_EXT_B, riscv_b_exts),
>  	__RISCV_ISA_EXT_SUPERSET_VALIDATE(v, RISCV_ISA_EXT_V, riscv_v_exts, riscv_ext_vector_float_validate),
>  	__RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_H),
> +	__RISCV_ISA_EXT_DATA_VALIDATE(zic64b, RISCV_ISA_EXT_ZIC64B, riscv_ext_zic64b_validate),
>  	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicbom, RISCV_ISA_EXT_ZICBOM, riscv_xlinuxenvcfg_exts, riscv_ext_zicbom_validate),
>  	__RISCV_ISA_EXT_DATA_VALIDATE(zicbop, RISCV_ISA_EXT_ZICBOP, riscv_ext_zicbop_validate),
>  	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicboz, RISCV_ISA_EXT_ZICBOZ, riscv_xlinuxenvcfg_exts, riscv_ext_zicboz_validate),
> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
> index dcc102bf8f183..3e80e5551ae0d 100644
> --- a/arch/riscv/kernel/sys_hwprobe.c
> +++ b/arch/riscv/kernel/sys_hwprobe.c
> @@ -211,6 +211,7 @@ static void hwprobe_isa_ext1(struct riscv_hwprobe *pair,
>  		EXT_KEY(isainfo->isa, ZICCRSE, pair->value, missing);
>  		EXT_KEY(isainfo->isa, ZA64RS, pair->value, missing);
>  		EXT_KEY(isainfo->isa, B, pair->value, missing);
> +		EXT_KEY(isainfo->isa, ZIC64B, pair->value, missing);
>  	}
>  
>  	/* Now turn off reporting features if any CPU is missing it. */
> 
> -- 
> 2.43.0
>

Other than the missing blank line,

Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
