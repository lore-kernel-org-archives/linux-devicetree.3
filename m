Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37E944BC91
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 20:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781211013; cv=none; b=U6jYdEvCj5/q0MD+4+iiYVK9QNeIZ5LvzrPvfYCzbAMg+/YJ2txd+Zv8vCrj0U/HLgj9OUXysnwHfETwaE0ULraKZi/GFoT8ZH777SNgEYHGUQfwUZTrYyfjvOyRAWI9rpGtaLS95ZQpOi+IBjO+o8PGjxoXw6S/Bog39WZvP1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781211013; c=relaxed/simple;
	bh=Mk4MD85wpIgW8gaPfr7INIh+M9eBh/sQU1QLVtpoaoc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KmnpF386ol00oa+3F26lruLPvtolRS39MbXk5BQIPwEe61eDNVRf5aLpf6q+vBjBJMKAM6pDokfvHSc7VXmBzyAYa77kbSVJq6ntkBfWJXbrWa+MOnfsknZ/pRp8E6DGXnEHASNfkQkthOxaeEoWA0QfxNjkJi7/uEhQqYdS6Yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b33fGFdm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZB7s3G1k; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b33fGFdm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZB7s3G1k"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BJ3OT11510627
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 20:50:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7U12GqzKZ3dJsiu7QWLZpQE1
	HJAiLvJ1NIcLGrlb2b8=; b=b33fGFdmUmHrcWlfymGF3o/dulCmz3LRdm9ooGYr
	A74OgzAgDg/YYlewa5wd14Nlzi8BIlGZdEwQLu8DshZF2rFrVdHDjT79f50f+TrP
	6CbQOBykIMAXFDZTspCj7K/q8nPzO5C6xm2zOkOOttY8Ocny8Nv5Ng1PcefMWFHC
	Gb/Mk2sY4arsQ2Ky7NAQcahmI9qHgIhxy1jq4sCwmo58UWIXkNtFkeUwbd94VwL/
	nbuQRkMk+0/Wx/2RWCDCRUuYaa7NoIqiBSN4XSvQckfGYI1dhYmxEhusqZFO3tat
	ryxAxSA5vJsmH18JS/KiFRlhXVzh8vv1ZUqwq9/8xFcEzg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er2u40bw3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 20:50:10 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-304df51ff3eso663413eec.0
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 13:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781211010; x=1781815810; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7U12GqzKZ3dJsiu7QWLZpQE1HJAiLvJ1NIcLGrlb2b8=;
        b=ZB7s3G1k0NOpnTbng9TWrCpkGNGTtv5MSNGMGrVIRL7LfO2nYF5Usv8sTLCdkhaUbv
         jfrU4bCGWY17vl8nMBX54sy+FTsn4mzRsvP+suxdTY4jft1yU2YCJAEeMmkSQxf2WYuW
         UQFjTMiVMgdHHGBxZa1l+Pwuo89sc1Drkx+hFLZd4KiibKs3YOOzHfPiKOM2FSI1ZRdW
         SkfI8zNMUpXZ4Gnx2EU6xVhid9uN8Ob7tP/McPM7rKQjeXM/tmxoAbXeuwdNAO3pGwHr
         gML/Ct4BtKUqcDXwq18sRCaKbaP0BZFQHSpuoU+sI6gSk2ct+OQDvi3Hn6SMXsCfap7r
         r4eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781211010; x=1781815810;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7U12GqzKZ3dJsiu7QWLZpQE1HJAiLvJ1NIcLGrlb2b8=;
        b=J4jrYwZe9m8ZRXlUdWA8LOSgCVisdbQHVcY+By+AEh/ql9ql0IwBemJXUJYVVKsB70
         u1RN86xUNMpHdKjWkuLCg7Ea24svbNOeOLoWS5tkg7RaGt0t1MRQOmtkRzjDlX8kfQB/
         ENhcXDGr05N1HtCMwLnyOnlNqYjrpA68c5pC9blKmlpk1iu7SfMADVBC/KodtqA5TNTN
         pUS8t3QV/K+b4z39aHhGjZLNAVTRww09oII6kHYjsUZ5qyqYS3uB6JWAlOnl/uka6xWR
         LQvQ8M+8roxSYKPAU/IIXQTexjPRGkByfPjgYO1D/52I2m+7LW/a+bcMD6Wq6rV07osd
         llaQ==
X-Forwarded-Encrypted: i=1; AFNElJ99qexacmV770GgsuqD6RIa27Lt+3Ah4KfOrbkDm6BEe6AvdiKH/6L/1gmso9Dt3GvXIo+cTFA+Qfeg@vger.kernel.org
X-Gm-Message-State: AOJu0YxQdxvq4YAuWmXpZIaJ8hHOoAlGO30fDz0zK0B4CraE6el3U5L/
	/r17kdov+yAtwzh6jnEsT5tD6OkLhU1oImXPsR+aq8yO7TxmfF1o8IGN4qsm/pmy+313bmMIqRe
	iTWEl6bBVSRrnXMwQFZ4pcLM1KFiJ3v+7irfctAQ8lK34ydOWvidUOgH3hvwdW0iS0ruwOgn3
X-Gm-Gg: Acq92OHZK69c/kJumj6+/LCkK9E+thmO+ma9bOvNqJMtdPvigBXkErIyeRNp6oEOOgS
	md7iddEzNb2/XJH6Vrc434rBmDOGVHW4hRZQo7Leq+kCSpVNwZynXhdCT/6a56hGgWYcdO3Aeam
	hwOMEsB920iRwszql48HvoDqH05HLWX+6MNMBvgcoaa/xAFuPXXJomaGz7bNVO4TTD97ZlY3KMC
	yRVHgPELA9d2Dr0UTzirjh8jznDxHh5s8e4UxkdwjLzEOCRI+5a/VfxYDrNiwitYjLPpZZ1V+3F
	qAKOK+EA5JWBdJHtNRFhVUFqp7VcOgF3qEnTqvQs7Gy6oEAaGBUbKb+ix1VXvrjkGHxWg9IjMMt
	FVGQTltBsOM1QPKo5bcrtEmT9BYbyEg==
X-Received: by 2002:a05:7300:1481:b0:2d9:6373:ad0a with SMTP id 5a478bee46e88-308047729dcmr3430141eec.11.1781211009836;
        Thu, 11 Jun 2026 13:50:09 -0700 (PDT)
X-Received: by 2002:a05:7300:1481:b0:2d9:6373:ad0a with SMTP id 5a478bee46e88-308047729dcmr3430111eec.11.1781211009350;
        Thu, 11 Jun 2026 13:50:09 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081ea4fe55sm303031eec.25.2026.06.11.13.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 13:50:08 -0700 (PDT)
Date: Thu, 11 Jun 2026 15:50:07 -0500
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
        Inochi Amaoto <inochiama@gmail.com>, linux-doc@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org,
        spacemit@lists.linux.dev, sophgo@lists.linux.dev,
        linux-kselftest@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>,
        Qingwei Hu <qingwei.hu@bytedance.com>
Subject: Re: [PATCH v4 09/16] riscv: Add Zic64b to cpufeature and hwprobe
Message-ID: <uttb7qknse5hk6suato3nelqatkrkoyo7r342pqay4wh6vyr4x@xestyyhoygtn>
References: <20260611-rva23u64-hwprobe-v2-v4-0-3f01a2449488@gmail.com>
 <20260611-rva23u64-hwprobe-v2-v4-9-3f01a2449488@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611-rva23u64-hwprobe-v2-v4-9-3f01a2449488@gmail.com>
X-Proofpoint-GUID: 0UjUAqQ1W5vYK9F3Fxw8TEH-muRTurZQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDIwOSBTYWx0ZWRfXx5ZD7NUGO/4L
 ebwE0Jqz/eRynhINswWRsAme6bAfOa9ahgFVA71bk5EJMZG+A8sSaNMB5u0dBgh5yuGONk1Pf3k
 qDBQA1YJcTzmz3UlbB9qVit5wzuWPgg=
X-Proofpoint-ORIG-GUID: 0UjUAqQ1W5vYK9F3Fxw8TEH-muRTurZQ
X-Authority-Analysis: v=2.4 cv=N94Z0W9B c=1 sm=1 tr=0 ts=6a2b1f82 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=HwFc7jivAAAA:8 a=968KyxNXAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=acXkj6VtvC73PAOtBy8A:9 a=CjuIK1q_8ugA:10 a=PxkB5W3o20Ba91AHUih5:22
 a=kr7TZk85JJIQSqC0cl8G:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDIwOSBTYWx0ZWRfX5sycCzxUurCj
 k9V/F+SQZ+02+Ii/Wxf1Dh8sN1IkLqyat/FatDgyLsRDao7vgvqRl7yag/rv8JY8sbuaGwg9uvq
 u5fmWbH7ijweRkPPB2T9UipIQvA7UdhrWrpYG3qg2Pn6gGuijJ2DFE2optPi/4be1iIELqBs4bW
 054EG6HilsGahUMfV33L1d54KAfLmOB1WP9zS39/c9yTeRk0G0x6kSjA0lt8+ScdmD3JlgcoZOy
 eiAMOivMLzKqZZ0sWbOxrN0720RWEHeqayxtdscVahZjgaIh6n6hx5MxlWtxK3qBZx2YVEznI60
 5i8IsOgaxHhABUYcsVD5TyrI40VeRXYYr6RWOTz/BZgQL3Ua3PZHlh3RF7RyXkLxx+qrWp5j08J
 qC2M5/tXUYiYe3HEiVEOaoB631LyLK+2ZErvmwgUsXWitvkoUVm8sDBcwoHf/VLmqgLUpGEWC27
 rcnP3Rx7g+d2NAFFYIw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_04,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110209

On Thu, Jun 11, 2026 at 04:12:46PM -0400, Guodong Xu wrote:
> From: Qingwei Hu <qingwei.hu@bytedance.com>
> 
> Zic64b mandates 64-byte naturally aligned cache blocks and is a
> mandatory extension of the RVA22 and RVA23 profiles.  Allocate a
> RISCV_ISA_EXT_ZIC64B id, parse "zic64b" from the ISA string with a
> validate callback that requires each cbom/cbop/cboz cache block size to
> be 64 bytes when it is present, and export it through hwprobe.
> 
> Link: https://lists.riscv.org/g/tech-unprivileged/topic/question_about_zic64b_and/119631059
> Signed-off-by: Qingwei Hu <qingwei.hu@bytedance.com>
> Co-developed-by: Guodong Xu <docular.xu@gmail.com>
> Signed-off-by: Guodong Xu <docular.xu@gmail.com>
> ---
> v4:
> - Credit Qingwei Hu's earlier Zic64b cpufeature patch: set him as
>   author, with Co-developed-by (Guodong Xu).
> - Validate only the cbom/cbop/cboz block sizes that are present; Zic64b
>   does not imply the CMO extensions (Conor, Qingwei, Greg).
> - Add a Link: to Greg's confirmation on the tech-unprivileged list.
> - Add the missing blank line before the ZIC64B hwprobe.rst entry
>   (Andrew).
> - Did not carry Andrew Jones's v3 Reviewed-by: the validation was
>   rewritten (present block sizes only) and the patch is now authored by
>   Qingwei, so it warrants a fresh review.
> v3: New patch.
> ---
>  Documentation/arch/riscv/hwprobe.rst  |  4 ++++
>  arch/riscv/include/asm/hwcap.h        |  1 +
>  arch/riscv/include/uapi/asm/hwprobe.h |  1 +
>  arch/riscv/kernel/cpufeature.c        | 19 +++++++++++++++++++
>  arch/riscv/kernel/sys_hwprobe.c       |  1 +
>  5 files changed, 26 insertions(+)
>

Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
