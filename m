Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7BF034165B
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 00:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789520327; cv=none; b=Z8rOFYTAwdjn4y19kabJDFvmiCwbUsly37VPnsx7LbuZYkW1Sti/7Ky/JGcs76cmEgkq34kp5pt2l0gCW7s9T2bKeMzzguaSembO/S/++sQWGBzRjtCZFuR70m/tPUKmtbTWqHF6s7ehRPaZzvQIiUvYA5gLyBs8Y/rz1tRzH/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789520327; c=relaxed/simple;
	bh=nBW4bqcmn+v9zVwrmsWHsyT2rrpkZlP9IgDlt/1GBLE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:MIME-Version; b=I9q+8/rKmJQCqcsgJsxaNh7Fs3FSoH/IfJHoANwbP3An+36s8rHJbnzFo8hDFSaVHl+ZWXVQa3/Aa2BVljUw54HmIYPJqJ+4fJ3rQ2XkT5IDYrc9MUQ1pjAHwI14x9l5T6KPJEkH/cA4eh0pNEM/GltCB+hxBS0AOGniJ+JQ7f4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=at6MwSFe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TCX7U+P0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="at6MwSFe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TCX7U+P0"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FLYtpo721423
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 00:58:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LQ3DI7FftBvPAGhc+A7UsjCVB7Utq8qEnzmdR09+mfY=; b=at6MwSFeH2UU+Qbt
	avXfJKaWEz3MTEGbhMin+yr+fjN7xJ7PuyP3Hb3VydpnW0zAtbF7e6YevQsqEw1P
	NAj65PoZyRzBDx/sYHq9Os7fA04cm4KSnBfgztumBdzKcKxRbsyeNg7aIX9Waeu2
	it4O/bXcLjNh37LnuIr05HJpwH/+nxPQ3hnoJqyA1hcZv2XBV79iIVqo0Nu1jZqF
	4zFnk6hcdEycTb9RV9PYdXmgG+Nyij7pf7DA/mzWPFyJdePzVG5csnttftzPQQzg
	HSyKR37Ta9zSwAUyxZE01GRJqsFmqGyQkCjevT9g/FuZ5cvpXl5PqNhIVGUieWZO
	WF8BtQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqah9skcm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 00:58:38 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-395543dc382so6817560a91.0
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 17:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789520317; x=1790125117; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LQ3DI7FftBvPAGhc+A7UsjCVB7Utq8qEnzmdR09+mfY=;
        b=TCX7U+P04HTh3ufZigbbxzEbvqLHgxaMEIDOC0GJxscx867D2u7QIFZaKnuUf7BUe/
         xi7geAD2dpAaqL4Uu2GpDmh0gFD9LJgA6JWRZzqMa5tS9hL1csBhk9yyHfKaDO0ABM9E
         PdpqsKZWB4yWCDaGBrOa7DV6hQWfN6gwnG4AW6Zco6t40UqvBQbZWnZOirsMPIIhq/Me
         t5oGgCeDmf3+86ONiLV+/f19y8UAy7J4R9snEg9V2eQ7YIBHdovE1gcTzfMDgCarbYXk
         K4EsSDManwBd8iv0jtkTCuJIiWYAnlftK6cEfvTVk9C0A+DqGJJff5JAM50otOG0/l/N
         uETg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789520317; x=1790125117;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LQ3DI7FftBvPAGhc+A7UsjCVB7Utq8qEnzmdR09+mfY=;
        b=2hVPyBxouo0BQFlrUOTfTAN7bCb8+bWWMo3Mu1qtOIK+cXm1SXj0BPB22ajBAhB//w
         UgjXxyGJYg0FmW2Aj/5CMOaxrSNdO2mo6+YYlRXpQCwzkFSUzh3uEgRq7lT+/wugnRDT
         NcuCBHcJ5ZGyJzDpVUV+0LAoPFFn9DxXyVjgi7vbNCz0G3MGVX2UkHD3lqzYnSpVlffT
         nbUSX9jcRVjNbJgKxWEDHAQkGfjpoFQffeS7/wYjgSE+maf16YlZ4JGccqNbAimpAfiv
         vnrotGlM3nn8JJP3dgVM2FChmyUpxM5utKZbC9PIUkqwtdxRqY8TPHSLf02/rpsaxtbz
         odSg==
X-Forwarded-Encrypted: i=1; AKwUvBwwHIYe1TIkzra5x7BW3TwSSAJu93h+/Xn+NWj8C3sA/T98ByRg0uyMP3CzfrLOlSw8IGD+LVPkKreW@vger.kernel.org
X-Gm-Message-State: AFuF++kRbC61aLAxHmkvJRmroMp+32gYw8T60Bj24LOz5S0ozt0nHPfM
	N1varEJ/Zdo3JbCp6v0bQsRnqgRzLogS7k2QORTMTfpyQsngBE7oGAY+zq88GQcnkxu5F4cO2iK
	h+dkTK2yc65dotTXnF+hoxhTRaSP4TiGk2OTRdZ7lPbF8VM+YlXWCla11/V2WQXIz
X-Gm-Gg: AYBFou2de9pAle7q66EtHR5fgRNnXz/1irbhWD8WmBPBuf7hg4RFsVWAU2hwjeN98oz
	YeW1T3yPPjocs96pynCApjsX0wz+ihZaz7Mzps0poO1iueeiRXPynDtiJqOL/OUnJiNLehw+jiR
	97E6KkSvqPNfaVNZvSjv38WE1FF4WAxXnS90Ug2lCUrO/mM4akPkYbZ+ZFYFa/Zzs1kZHVGSngG
	CabUOtfnipwljwXDYz99IcfO2eZBvqR2vWgGdUAr4orCvf8Qn+3eEXRQX1py62NsA1OOrHdjSiy
	uq4YV8j1kpzTvBgbnpwA087TajHrBeS2qcdQAyaTZSQoJxGU0Hhup850OA==
X-Received: by 2002:a17:90b:2803:b0:39d:ef3e:9035 with SMTP id 98e67ed59e1d1-39e1e324463mr1568486a91.10.1789520317179;
        Tue, 15 Sep 2026 17:58:37 -0700 (PDT)
X-Received: by 2002:a17:90b:2803:b0:39d:ef3e:9035 with SMTP id 98e67ed59e1d1-39e1e324463mr1568416a91.10.1789520316669;
        Tue, 15 Sep 2026 17:58:36 -0700 (PDT)
Received: from localhost ([2a12:a305:4::30fb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1bbe3e62sm1231229a91.10.2026.09.15.17.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 17:58:36 -0700 (PDT)
Date: Tue, 15 Sep 2026 20:58:33 -0400
Message-ID: <b677f038a23d6cd0572b12053acaf3ab.guodong.xu@oss.qualcomm.com>
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
To: Conor Dooley <conor@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
        Chen Wang <chen.wang@linux.dev>, Inochi Amaoto <inochiama@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        Paul Walmsley <paul.walmsley@sifive.com>, devicetree@vger.kernel.org,
        spacemit@lists.linux.dev, sophgo@lists.linux.dev,
        linux-kselftest@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>,
        Andy Chiu <tchiu@tenstorrent.com>, Florian Weimer <fweimer@redhat.com>,
        Peter Bergner <bergner@oss.tenstorrent.com>,
        Zihong Yao <zihong.plct@isrc.iscas.ac.cn>,
        Mark Harris <mark.hsj@gmail.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>
Subject: Re: [PATCH v7 09/11] riscv: cpufeature: Introduce ISA bases bitmap
 and rva23u64 detection
In-Reply-To: <20260915-widget-defiling-e22497c228cc@spud>
References: <20260915-rva23u64-hwprobe-v2-v7-0-aa35ebd9ae96@oss.qualcomm.com>
 <20260915-rva23u64-hwprobe-v2-v7-9-aa35ebd9ae96@oss.qualcomm.com>
 <20260915-widget-defiling-e22497c228cc@spud>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=BtkIUoX5 c=1 sm=1 tr=0 ts=6aa9e9be cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=0WmU45QFm0n7b77IdSEA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: 5-yVrvnSULw86znltyAMrmNaY6tCVgLq
X-Proofpoint-GUID: 5-yVrvnSULw86znltyAMrmNaY6tCVgLq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDAxMCBTYWx0ZWRfX/Tk3X66QMgiY
 X7c5OB0CZX01WkC0jGff6bRiTDZRUyIBkUbYqK1+IicWog30lmLLbaK3/rdpIwjhuosV1L1R+ih
 Q5Zik4sJezL5J5wGEO25BEp+QEaYQZ+zxM09eAEIHHsFS3uXmBDa67Px2UZdrxAOHWjBWBARWaJ
 vw+YfkjLGW2mmOLFJLMH41pePbUEFlXyCcpLojkTzgCM5Yfc9CtDW+sAW6cR3KaS0+bcuUFNDTt
 RaIjAgNaEG6GcdNOPIH/YGbnNp76Uef+u2sfe1nuTC8fn40N6/Qi+O1iuPSbX9c2kvNLw6ltbzA
 QmzrpaqZzFnq+F/Uf/SRica0RWZsjhMx0woZOFoaxDekVD2Z7covfbEjRy6tLL990/QliYZ7XAY
 afnzJd3sKmmK4XJXzRWc7889KY9iclqb6pbtoO98hcwB1WxnlCNzxDEw/kjylZOkC+Gngvx28C5
 weAWSjrnw0ljFGSHZfg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDAxMCBTYWx0ZWRfX+l+AUpSZ4wW2
 a3L7mRMY1AWSfcD1fnaHCJCYDDp8RLIdUgQ+/gzUYSawl2egWun0yhUhCi/ex6hL4NiaYs+/u3Z
 KYcogmPtwh71liKShn0CuD46t2brTKs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160010

Hi Conor,

On Tue, 15 Sep 2026 17:52:23 +0100, Conor Dooley wrote:
> On Tue, Sep 15, 2026 at 03:15:35AM -0400, Guodong Xu wrote:
>> Introduce a per-hart and host-wide bitmap of conformant ISA "bases"
>> (named profile-class sets such as IMA and RVA23U64), computed at init
>> time by riscv_init_isa_bases().
>>
>> Register riscv_init_isa_bases() as an arch_initcall. That is late
>> enough that core_initcall(tagged_addr_init) has probed senvcfg.PMM and
>> populated have_user_pmlen_*; without that ordering,
>> riscv_have_user_pmlen(7) would still return its default false and the
>> RVA23U64 detection path would always bail. It is also early enough that
>> arch_initcall_sync(init_hwprobe_vdso_data) finds the bases populated
>> when it snapshots the hwprobe values into the vDSO data page.
>>
>> Consider this as the cache that subsequent consumers (hwprobe's
>> RVA23U64 base behavior bit, /proc/cpuinfo's "isa bases" lines, etc.)
>> can read without recomputing, which keeps them consistent with
>> each other.
>>
>> Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
>> Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
>
> Something is wrong here with the signoffs here, Drew's probably missing
> either authorship or a Co-developed-by tag?

Thanks for the review. Yes, will fix in v8.

I didn't look closely enough at authorship (which I should) when I
reworked Drew's RFC into v2. His Signed-off-by was carried over, but
clearly it needed more careful handling than that.

Rechecking these three patches that came over from the RFC (09, 10, 11),
here is what I plan to do:

- Patch 10/11 (cpuinfo) is still mostly Drew's patch; I only switched it
  to the cached bitmap. v8 makes him the author.
- Patch 09/11 and 11/11 were rewritten in v2 (the detection moved out of
  hwprobe into cpufeature), but part of Drew's implementation stayed.
  I'll adds his Co-developed-by in v8.

Drew, please shout if you would like this split differently.

Guodong
