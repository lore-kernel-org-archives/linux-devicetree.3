Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3CB47D954
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 12:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782994205; cv=none; b=Y4ghiPTgZatnphJuVs/T+Jz+0Zmj095TW04v0BOzWieSmLNKnDV1AnxbafByVLf+G2jPdoiZIrMSyYHSjmvYjxw6sfi7N5tFJN9i80wRr67RJZC43FAIBM4cX7IeMgaFLc5aOENbuBeqmZ4uov+gGkvopoZItVDfUeQK0Fi+6TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782994205; c=relaxed/simple;
	bh=S/iYlCNJx0bB4rwLfVdEC0/cbwIYuctYZWTNTYnHWHA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nzfZcMl4BWs13/HHDxM9T/vliv8gmuhvpf6TvAR5tVvn2k0sUcEKlaJqYucXGDGcBxCgN7RObafdFrMBsdav7+B5bOx5bUf9MNPOb+qoIZvHv0Ema8KDg2TrbzyBM8Pgf2nOHZunMKpohnKpTsO85paxmxbV1iqPvrh+ONDbmGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JcZ50FjZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DWPEEORm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JcZ50FjZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DWPEEORm"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6629KnWe4116734
	for <devicetree@vger.kernel.org>; Thu, 2 Jul 2026 12:10:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gl9GSImze61k4JpNEPGLUzkgXHiflvsw4NggzrOW5cY=; b=JcZ50FjZ4o2n/az8
	MMjsxCsLwnbDwmcfahy9X69WjL4VbwjSmHI7nNQzzixZyF6tlgHSM1qwpq2SM8ac
	YyUduhryKhws71dQLI2ULfV9SxLfw2HnmnnD42Wr4AY+iAkhRYpK9bnpw9l6ilAe
	T5Z54NqkkwsivkKdFxlNmzL72OfCae9Up3XP0O+xRxH0fBvZ0CS6PanPM1DdMNtY
	8Oa2pX4QXBTPNoeH04/CjtMsKVthhaAZPuseaGjpFHVFrbg5ElBbrALQVzS/vrmC
	XEHk+giRj1siUg4gzWBmFyZjcVI25PlfIly+gHtq5ohaHf01MDSatL4Rj1XjX+gX
	uOBvLg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5n9bgm0f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 12:10:01 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c21be5bb4so8702471cf.0
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 05:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782994201; x=1783599001; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gl9GSImze61k4JpNEPGLUzkgXHiflvsw4NggzrOW5cY=;
        b=DWPEEORmvKGW1/BJw9bJ2CoKAwm5Lysw0eBXXoQJWoUdor5rAMEpYBzgUP3S5EvOtg
         ikZDaNgY9ui/29r/Lu0R2hQy6AsAdrUHb+/8qgQi4hPaxi4ubheKMKwtlt6hhQCJhH+Y
         MMi3xrTpVWHdJ5Bga+sYnd6E62TzEq6oBwmC544KwvL9UF1xzEBPUyJ9lPib/wuDRLod
         I5XTKHJ7P8rmB3ys9g0+7EqYC53A+ZJXLcswx9DEv+w9UMzIq/eESI3yn7k7/iiA9YBJ
         uz9x4pgRRqwUc4lhn8gkb/4rDbCiRtCIVv8ldr/xuf6fhjseiA8L7kMmu5AdyLJ4lgrt
         EEDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782994201; x=1783599001;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gl9GSImze61k4JpNEPGLUzkgXHiflvsw4NggzrOW5cY=;
        b=dtz5wKZkknp4aZdfEFki4ZusZkxctgpGEPASdOHK5zUtHld8Km2sS/tbsF3YPUTMZf
         PDtW9rEXuCYtWrYevwttmPtEiZrNk8XJ0FYRymtJBQDXy72hAB8PnqriUO5KohnRso0V
         FqJYocNu9LET7agzx+5iW5upDoebqVPZhAri4blwpirPYYimyCkhjv74pixalFV+miCa
         UPSVN7m15I6vrotHdcZK7lzqeckk/mSN8cjXWJZNLNOd/mtzfvt8pkeD1rAZSY9a2kgQ
         EK3AoxcLDE3NHog0qfIPp0O1YJRRZ+0eW/Ix1p/ZQH07EOkednVMIMlHf6f5byKuN9Rc
         lcjg==
X-Forwarded-Encrypted: i=1; AFNElJ9imh9zmFirfxP9yZtrig0DyrowbjYbmtqGn3fC3v4IpFnOlk8sRhwfLT9EtWW4k3XiZZq8DPKBJUIq@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf7hf25pYetwf5fZSaDGP4BusjlvBW53PmMT/ue5uM8lM+hRxB
	70bxzGeuMFeqd3j0EtuAoh5w9KQPjOo1Oc8CC94zWN22BQ/LXiX6TbrPKU+LbNvxP/IUmgxo6Km
	koyTF/iN26kLRA8HXzHKcFXYU1wkY5Spp6vOxAk/ZTWgF3ti5CUWKKPjUBXyOcPlM
X-Gm-Gg: AfdE7cm+U6Dk/ZeDmUAtTl9SyONitDtDgJqrI6M6APFli85MTXylvI7oWefGs4FciQI
	nudviw9Q3ZM8ZELMP3DVBB0IuP9i2RBzsTDDOPJ3/SlRDqiZZYQlpaXb07lmRnEI1+EYzdiXM/0
	//g7rtlEzUvDD5zXb27YpXXKH1F23Eki10plbJUnJnYAF+R7VSsOrAR87fAd2ZOfpbZvP9mzAqi
	mzRWEqDplpDMEFaKgLOsBiqqawxOOge9Z842B8ql9jUILHOtrSi5exuLzgF0eR4JBvVU2ORqX4c
	yra1v8/UGYptYgadbiwcW9pk3nkXuupFhTmx54r2yaI01/GZ9Ul8+Lb0puFEJNsjMfwH81D6cVY
	u6dQmigzkV2XUSCcAppyq3F15A0G+Eu/7Cc0=
X-Received: by 2002:a05:622a:14d1:b0:51c:223:3c57 with SMTP id d75a77b69052e-51c26b41df6mr45865991cf.10.1782994200593;
        Thu, 02 Jul 2026 05:10:00 -0700 (PDT)
X-Received: by 2002:a05:622a:14d1:b0:51c:223:3c57 with SMTP id d75a77b69052e-51c26b41df6mr45865681cf.10.1782994200108;
        Thu, 02 Jul 2026 05:10:00 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62c53c1sm119359466b.45.2026.07.02.05.09.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 05:09:59 -0700 (PDT)
Message-ID: <9281844d-5570-4100-8517-d1bac4e08a30@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 14:09:57 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: sdm630: describe adsp_mem region
 properly
To: Alexey Minnekhanov <alexeymin@minlexx.ru>,
        Nickolay Goppen <setotau@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20260422-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v3-0-274ba3715db0@mainlining.org>
 <20260422-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v3-3-274ba3715db0@mainlining.org>
 <337d362d-93de-4e81-8141-a51fa75d615c@oss.qualcomm.com>
 <e282acd6-dfcb-45a6-977d-eb71b2619b7d@mainlining.org>
 <976824fc-335a-4f47-a4b6-29966137f2bf@oss.qualcomm.com>
 <edf331e2-73a5-4afd-9a44-56cb786626c5@minlexx.ru>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <edf331e2-73a5-4afd-9a44-56cb786626c5@minlexx.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Xz7ibrSDlcXZByrYV61aTEgwFrmwDlpy
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEyNyBTYWx0ZWRfX1vYQVlb9+QR5
 1zpSqOoeJj+3cRBCp7dWvirriQmDS8MIWG90TOrX4Ad3veS18rq1K0jJ53tI6VZawL3nkIDgrRu
 GBvOaIKowjR7kn3XV+nKrrnAX+7kgFI=
X-Proofpoint-GUID: Xz7ibrSDlcXZByrYV61aTEgwFrmwDlpy
X-Authority-Analysis: v=2.4 cv=bOom5v+Z c=1 sm=1 tr=0 ts=6a465519 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=PMVDw0DiDpggxp4qDyAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEyNyBTYWx0ZWRfX4Ut5+T0JQ8Xt
 GMUoL6Uil+XEDtzFHIUAxQwue2ZX7apL9iaE6okJheUlPqaAbwiPEYTVWxMM8TKQnqjFVIBDkFf
 9xkmR2WIDB5Ew21fNCeIEpanV+8+Eh/HwKzMUvcULTijfKRzlz2ytRhjoF6vyvBF0hf2e5KRUdw
 6EnH+3HfvBbRQU08q0PQ9Hy9r3KLVOTN6kdR9hnSndjVx+Jyqlfms9Iwk2HyGiYV03MohPDfjWb
 UPMtcDli1mgkY8nzdCx/FXrGRFeexOAFt9qlycNsVzPFrwxWwRtdjHrcrz3f62Z/T1f9HeWK1U4
 OEuoSNkZ+iKOt6MSiZkHZ/m8np5HNQvuNwCb69TIWhQIfCXR/8SHNqPYaoyrKqL/n4b4S3F1xLv
 UpBzTHVXGpCJUsgFr9VeykRbik8EZQeA/XwPGPo56e0M6ttxuJNjBChw9eYLp6jGO2zlvXXuHsY
 bERdpF7kd7jCT5sgTuw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015 suspectscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020127

On 7/1/26 5:31 PM, Alexey Minnekhanov wrote:
> On 01.07.2026 15:48, Konrad Dybcio wrote:
>> On 4/27/26 5:20 PM, Nickolay Goppen wrote:
>>>
>>> 27.04.2026 14:49, Konrad Dybcio wrote:
>>>> Please make this = <0x0 0x80000000 0x0 0x80000000>; instead, since the RAM
>>>> starts at 0x80000000
>>>
>>> +Alexey Min found out that on 3 GiB xiaomi-lavender RAM starts at 0x40000000
>>>
>>> 40000000-855fffff : System RAM
>>>    40080000-41bfffff : Kernel code
>>>    42600000-42fd0fff : Kernel data
>>> 88f00000-8abfffff : System RAM
>>> 95000000-feabffff : System RAM
>>
>> My docs happen to be silent on this subject..
>> Do you have a device that has more/less RAM to compare?
>>
> 
> I do have quite a bunch of devices based on sdm630/636/660.
> Logs from UART including longs from stock bootloader are only
> available for lavender,  though. For others I collected dumps
> of /proc/iomem (and debug/memblock/memory):

Thanks. Let's do 0x40000000 - 0xff...ff then, I think that Linux
should figure out what to if there's no memory below 0x8..

Konrad
