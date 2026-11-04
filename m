Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793798111;
	b=OhMmNJo1s7PSvYNEtiPGjQCdovpGXzRA+NhYyUTuYCxT3v1r6BkJL0bIU7K4kmQd/4O3
	 lqsTm3ngs4HMIQR71tFYUlgSuANwTvFVmcYSEC2ZIafywxETy1wBgrVt5hBke6c0u0lVP
	 WKMsjwCCB5BhX2FnysUhXbYZISb3p6xnC3n1oTENxi5w+1e39CYnZyRhLd+8Bafo4V4no
	 ISjeKUsNF5HHqTR/68f5WwKacQefvzyR6/b7Gn+KNVqcBTT0Cvhqi2tvg68l71qePRk1S
	 w10f5wVXK2CRvPGIGaUwLA4PQ6rZrn3oHUVnS9xhdKkhKWVBAhyaGf2s2nefGA43PTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793798111;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Xh9EOmcuI9wyEV/Jmo9i6NtzTlnDgJymp46o7FRpHF8=;
	b=kbbwWLENnKSnPdIbmVkwh/6i8dNjDsYxwvBTGjg1ljB2nGkBh0l2rSuEFJOsYhNCycxT
	 9nCLFSoeFxptE//WqnhDfm8lIcPqnCvRuS+G6D1mRSiyLoov8kA/sQ09qYyHbAKzRvtaf
	 5Z6rYAFbGBxB4gTz017LLYcyp46K/UsB4IRXQh9oerXduWxr23H3AhgUQ3jOAPgQ9p6XA
	 CbCFbjT8Cd7yNjhCH2QuILzg/wASB3GcPXlEDdG/511PHNUte81P5exzxl0hduAWRvnUu
	 3q+F9GTGrvnv+aFsqRs/AVlfB2775xjAVRf0AQLhR+lc6JsRkx9Tm1sZcLeSoTlAqBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cNnOeYV5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a3Pf2Fey;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F84E606A328
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 13:15:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F84E606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cNnOeYV5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a3Pf2Fey
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4BaF6M2729008
	for <devicetree@vger.kernel.org>; Wed, 4 Nov 2026 13:15:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xh9EOmcuI9wyEV/Jmo9i6NtzTlnDgJymp46o7FRpHF8=; b=cNnOeYV5Qx+nStdG
	2Ty3Uxe5LC7IKPsYJsO+ryjcl1DMmkJGy2p2um6SfkUYaneSsxr05OTL9Eq8lamG
	MqJQEFjAreX3XliKerA373JHZSxtSnxFvRmR3iDzEG7xRNwND7+lGWvDFJFdo4Aq
	lRUrd7grcvT7R7JHB3P/kur93Qt+MxBue+N/dtrGY5ovuj57Pd8u9YBPuAIO4r0G
	rys9n+k7BKZ9I61CDD0nfbvOEpNeBxBagKuSFmJbqkLjyz1WVbPgWz/mLOgGO2L1
	Ik/HYXhhwAYbOUAC/mk1gYfJcbVH1HyJlNrYmXwLK/gFdDe2VLiYaeC4FSjSM6zG
	GPSuYQ==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqpuvbh1y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 13:15:09 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6df538053fcso717293eaf.3
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 05:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793798109; x=1794402909; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xh9EOmcuI9wyEV/Jmo9i6NtzTlnDgJymp46o7FRpHF8=;
        b=a3Pf2FeyxDc7LBcmIIlojpt88fs6HmuduBK+QjrI1IG8Ja6H/DSy4XeEamSpu3pE5N
         UX6bVBhrm8XWZ4UHrLXXwII6ZJPkvxGGPat8Wjflq774d6CWaz84Iko0oJpT5NqPjtn6
         uF7cmATs8kbpRThULfRndjAm6iAshW3/ozHKw5f9rMYxniFns8Gz4jdhGGiOaDsWd28s
         QIg8JL6m5IGoOXKqYmtivr0HKqMHLaJFQXBeskyjp5DsEb6XYuoGMM4ycJaDC83geIGt
         KNwbjDwKQoONUyX5/frqGj6ei88Zx3opQ1y3C5byttXexOmdhPO86iKxGnR9n8AmgBj3
         d15w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793798109; x=1794402909;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xh9EOmcuI9wyEV/Jmo9i6NtzTlnDgJymp46o7FRpHF8=;
        b=Xwfkg0CtBQlh8KRNtI6/4J+rB8zEf60Mu2Q6IyL/i//saJAY15Ipxt4qR3TPwy2q0i
         WORIAX5ejSgGPVdY+MgiSWDKCCEehQmt0kVwmGDAFAJpdFukk5gZ4DROQ8nKwjou1UwR
         il8d52Cqd3FbbUSuiG28j2Hn6NmTszwaCVCidug876i4fN655Yhu7Cqi2s4cDiyKUfMr
         I7kNqFSX3GhLBgJaibM1+DhyEXw0ViAY+RtQCFNZa64H6q3FhNuq3troa5LPxAor6Pt6
         CGG3TShVr73zdqDBnHNv4vmjDWQ2stip1Bi7/nxCgUN2X67tptOMhMbpmkFeiVEZvF51
         BZsw==
X-Forwarded-Encrypted: i=1; AKwUvBxha+2k2S4NbgmQ9T8WQRB6oWxWYiAZ77/wWaHxDtuKlwTc13fH+WX/pElbo7wUmhLuBkyy0uXqsZlx@vger.kernel.org
X-Gm-Message-State: APuU4Z8NsmCaZOXZKaQdxWkYRyVqKj1QzYBlfd6+m9xd2FGcTCY3mlZs
	vfwryo0sPm8mQ+OiX1b21QjV8NjuhId0QiOZtujKY8Q9ccReWwnjI8hejep6QQPSiLDu+ifVeCd
	emGck8JFaNvZeVCKAk229aSzIx51ybMAPzelRR00SiR25ndpQ6g3hSityN14eCmuF
X-Gm-Gg: AYBFou17huOyT6J6eCpH/ulDxp6cwzaZGPyTTngF9I9Mw0I9XN0HpyW+x5XuB/wq2Xv
	hhkCA2fFu5i2DLN7HJJhKF+iVwL9NGbCY45aQvLX29kt469qo75Vp69cctAjt15H3KizWe1/I4+
	tR3sylnNn4slWH5Vs3kOue7YeeXChMW+oyvLN0tUfah9Emt/O7/PaQOEI8LmCcoXzQDt3uxsjLz
	wD0z1ZoqMGxXSu4Rjd/GpMIiTrTCBrhW/4cj4WNS+fA8HuFbBwp8J+tjBexvEXm44ZuqklZw86R
	h0aCaq3WxOCwMD5wiFpXIvHTmKraA0OajEImmXDIqHYVTVwFu+A7w/5MWlaTUFT19XpK4xrTef3
	EAKUbpY+IROVlCbKnz0SEP7fOKKM8u756BXzZp3XefhYhh0NNonY8bEsWO2+2DffjipY=
X-Received: by 2002:a05:6820:1504:b0:6d9:8fed:b732 with SMTP id 006d021491bc7-714f29d7767mr8519154eaf.56.1793798108862;
        Wed, 04 Nov 2026 05:15:08 -0800 (PST)
X-Received: by 2002:a05:6820:1504:b0:6d9:8fed:b732 with SMTP id 006d021491bc7-714f29d7767mr8519124eaf.56.1793798108043;
        Wed, 04 Nov 2026 05:15:08 -0800 (PST)
Received: from [172.20.4.37] ([192.210.17.203])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716c1317c7dsm1583094eaf.13.2026.11.04.05.15.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 05:15:07 -0800 (PST)
Message-ID: <d0a13ee7-c3b7-486c-b3a2-6c4fc06694ac@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 14:15:04 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/7] thermal/drivers/loongson2: Fix trip programming
 and add Loongson-2K0300 support
To: Binbin Zhou <zhoubinbin@loongson.cn>,
        Binbin Zhou
 <zhoubb.aaron@gmail.com>,
        Huacai Chen <chenhuacai@loongson.cn>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Yinbo Zhu <zhuyinbo@loongson.cn>,
        zhanghongchen <zhanghongchen@loongson.cn>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Cc: Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>,
        loongarch@lists.linux.dev, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <cover.1793690276.git.zhoubinbin@loongson.cn>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <cover.1793690276.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=O6SsLx9W c=1 sm=1 tr=0 ts=6aeb2fdd cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=3CSVYe8HblTQFsWiJzwA3g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=PsDKY8HSHSVfbGAcyQIA:9 a=QEXdDO2ut3YA:10
 a=-UhsvdU3ccFDOXFxFb4l:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: F1eHhOYcFP2b0FPvQnisxPu6NKSx0sEy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1MiBTYWx0ZWRfX7ZC0Y0Fn4tIx
 EXgok16WqnQDd408UHFfl0SOaFKFnJJsLnHn+vNLuG1/ZoaVWcLmFOCrgYU/TTTwG7dSyYjBatH
 IlV/Klpw+mWm1OYKxwk5sHZ1WYZnFiA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1MiBTYWx0ZWRfX4/M4IOeUUGm7
 h8BB0RB9XEt2zmScLPTzuNmK508bZt1Bo+oNjVNNmwnCYsTEY2ekoljfkw1UymoauxAubV4K7yw
 r+fh/JGmEyA9a7H+4ST8EL1etQojYJn4t5RGOrQjyc5LiEbZ5HfJdNRS6qTv5TsD62u2LztZriT
 0q5opC/OrYo2MZCV7yPfGtwPFLuuBpfbpVv1oqqEPqBBgQkXgfnGspOA94JlE8dz32ZqYOCU7VI
 26LHJsSwoIpqwQV3Bp+7tvWdhhv24DQ0yI8oKbd1ts8W9xCFZ5fWuJEoEMZ1WEtU0rYAU7eYVso
 n27MOGiBtMWYTmeOuvfWOWgkUOGVGWbBmdgwzdLJ0mCbfWfifDlOL9uNV2vXsxiRCZ0jocMP7zT
 bsk59BnilvxFscqP5dBI3Fntlw8euebmlZs4WWTRpcqxR8A5VrtbzmalU22KTEGlp+0QRXYavtG
 IVq+xus2UXQjSNpaMAQ==
X-Proofpoint-GUID: F1eHhOYcFP2b0FPvQnisxPu6NKSx0sEy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040052


This series still has report from sashiko

https://sashiko.dev/#/patchset/cover.1793690276.git.zhoubinbin%40loongson.cn

On 11/3/26 08:23, Binbin Zhou wrote:
> Hi all:
> 
> This series fixes trip-point handling in the Loongson-2 thermal driver,
> refactors the driver around per-SoC chip data, and adds support for the
> Loongson-2K0300 thermal sensor.
> 
> The first three patches are fixes and are marked for stable:
> 
> - Patch 1 fixes signed division when converting negative milli-degree
>    trip points to degrees Celsius.
> - Patch 2 fixes the arguments to clamp() so trip points are limited to
>    the supported sensor range.
> - Patch 3 fixes Loongson-2K2000 trip-point programming by adding a
>    per-SoC register callback and handling the split HI_GATE register.
> 
> Patches 4-5 are cleanups and preparation work:
> 
> - Patch 4 removes the unnecessary multi-sensor registration loop.
> - Patch 5 moves the per-SoC ops and hardware initialization into chip
>    data.
> 
> Patch 6 adds the Loongson-2K0300 DT binding, and patch 7 adds driver
> support for the Loongson-2K0300 thermal sensor.
> 
> The patchset have been validated on the Loongson-2K series development
> boards.
> 
> Thanks.
> Binbin
> 
> =========
> V8:
> Patch (1/7):
>   - Use MILLIDEGREE_PER_DEGREE macro instead of explicitly casting MILLI;
> 
> - Split patch-4 into two parts: the bitfields section will be merged into
>    patch-3, and the remaining changes will be merged into patch-6 as
>    preparation for introducing the new SoC.
> 
> Link to V7:
> https://lore.kernel.org/all/cover.1791512067.git.zhoubinbin@loongson.cn/
> 
> V7:
> Patch (1/8):
>   - New patch;
>   - Fix negative temperature conversion in set_trips;
> Patch (3/8):
>   - Use writew()/writeb() in loongson2_2k2000_set_trips_regs;
> Patch (4/8):
>   - Rewite the thermal sensor registration loop to clearer;
> Patch (5/8):
>   - Fix `loognson2_thermal_set_trips` typo;
> Patch (8/8):
>   - Read CHIP_ID1 only when EXTERN_ID is set;
>   - Simplify the Internal ID calculation;
>   - Add the necessary comments.
> 
> Link to V6:
> https://lore.kernel.org/all/cover.1790561983.git.zhoubinbin@loongson.cn/
> 
> V6:
>   - Rebase on linux-pm/thermal;
> Patch (2/7):
>   - New patch;
>   - Fix incorrect clamp() argument order for thermal trip points;
> Patch (3/7):
>   - New patch;
>   - Fix Loongson-2K2000 trip point programming by adding a per-SoC
>     set_trips_regs callback and handling the split HI_GATE registers;
> Patch (4/7):
>   - New patch;
>   - cleanup: use GENMASK/FIELD_* helpers, add named constants, and factor
>     common trip point setup;
> Patch (5/7):
>   - New patch;
>   - refactor: move thermal_zone_device_ops into chip_data and replace the
>     Loongson-2K2000 flag special case with an optional init_extend_resource
>     callback;
> Patch (7/7):
>   - Updated the 10-bit output to 11-bit in commit message;
>   - Temporarily remove the implementation of `set_trips`;
>   - Remove unnecessary header files;
>   - Rewrite `get_temp`, separating `read_calib` and `detect_old_fuse` into
>     new functions to be called during the probe;
>   - Use macros to define the relevant numbers.
> 
> Link to V5:
> https://lore.kernel.org/all/cover.1789546118.git.zhoubinbin@loongson.cn/#t
> 
> V5:
>   - Rebase on linux-pm/thermal;
>   - Drop patch-3 for it was applied.
> 
> Link to V4:
> https://lore.kernel.org/all/cover.1785829933.git.zhoubinbin@loongson.cn/
> 
> V4:
>   - Rebase on linux-mfd/for-mfd-next;
> Patch (3/5):
>   - Remove the operation that adds `compatible` to the `select` node.
> 
> Link to V3:
> https://lore.kernel.org/all/cover.1785480242.git.zhoubinbin@loongson.cn/
> 
> V3:
> Patch (2/5):
>   - New patch for moving thermal_ops to chip_data;
> Patch (3/5):
>   - Correct spelling errors;
> Patch (4/5):
>   - Add Acked-by from Conor, thanks;
> Patch (5/5):
>   - Keep loongson2_thermal_data->chip_data as const, and use
>     data->flags as the private data.
>   - Renmae LOONGSON2_THSENS_OUT_10B_MASK ->
>     LOONGSON2_THSENS_OUT_11B_MASK;
> 
> Link to V2:
> https://lore.kernel.org/all/cover.1784619512.git.zhoubinbin@loongson.cn/
> 
> V2:
> Patch (1/4):
>   - New patch form Sashiko;
> Patch (2/4):
>   - New patch for adding chipid syscon compatible;
> Patch (3/4):
>   - Use `loongson,chipid` phandle replace reg property;
> Patch (3/4):
>   - Refact `calib_offset` calculate routing;
>   - Add LS2K0300_OLD_FUSE_FLAG flag.
> 
> Link to V1:
> https://lore.kernel.org/all/cover.1783670011.git.zhoubinbin@loongson.cn/
> 
> Binbin Zhou (7):
>    thermal/drivers/loongson2: Fix negative trip conversion in set_trips
>    thermal/drivers/loongson2: Fix clamp() usage for thermal trip points
>    thermal/drivers/loongson2: Fix Loongson-2K2000 trip point programming
>    thermal/drivers/loongson2: Simplify thermal sensor registration
>    thermal/drivers/loongson2: Move per-SoC ops and init into chip data
>    dt-bindings: thermal: loongson,ls2k-thermal: Add compatible for
>      Loongson-2K0300
>    thermal/drivers/loongson2: Add Loongson-2K0300 support
> 
>   .../thermal/loongson,ls2k-thermal.yaml        |  73 +++-
>   drivers/thermal/loongson2_thermal.c           | 359 ++++++++++++++----
>   2 files changed, 332 insertions(+), 100 deletions(-)
> 
> 
> base-commit: 4358090906b01806ee483229e8d7163b806bd116

