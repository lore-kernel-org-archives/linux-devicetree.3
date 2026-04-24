Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5863B37C0FC
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 11:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777031233; cv=none; b=OOZ94kUoRC6SD5N0YFM/QW0xxsZ2bRBDbOP/vxKLt5sOZVhhzSc0FpQe7jJWbyGdukFb1Pq/DV9KGlqYEhgFQEOvbsphvYPs0fBbZpJg0u8ot3dpTWsuaAqDeeFVju8hL30hEz0GcL9xWqvSZeWgqpg9jmHw9f33Fad0jOlr5I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777031233; c=relaxed/simple;
	bh=hsfN9zqUQQPVY6wVotmB/RKKneXRti3CposjCB6+Lgg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oN7EqOu7Z8O4463w3QfKjrkZAFMDLCpXW3xkI63bJ645z7n0VkkarnSkLx5m3NhrLAg8qf2zLev/vkukf+W9Y0+YjAK19z/30VLK2zpnHnWPwiuZQSqMf2BKZbhJdsyF0u39kt0kLUYG4Kvvc6GtoZNpGerBbSSjy23dYVJ2Fho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y1XgbVFz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VfRytoEb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y1XgbVFz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VfRytoEb"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O94JIj2710099
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 11:47:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8xp0jm1bju2i0TWQ0regUkm9kkI1kpmGQXqWOuUWnLw=; b=Y1XgbVFzfWFRWnRK
	ko8fbb3Ty60dIncQWfDCy/pVT6J4J78HVlXDawSUNgAmwBIPMBSSrxLt8hIpfv3u
	A9eQPnt7lp7LUy57ZIaGoVpzZgOttCjUfXZ5QLlVcdcsVQDrZqX/Xg03wHE6X9Y4
	CFkl5FzcPeJUmmzmFV0WWIHBIXYnxdCZv1fWwpEVYbm3/0V9t9kNsg4zQ5vaVKBy
	oX13LH/bLGDNwf7IM/77tfh4+jwcSrPcUI4upGvm1TK2zBX2HgjxH7Mp/LrVwMkS
	tu/0efujFZiAYjm2wWEwhJqkfLE7wEcMTRXIKpqTJ0oBgl2LpEI5GZIHIbIqt75F
	oXZ1hg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqqu9v0tg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 11:47:11 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d8c183c2eso70262691cf.0
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 04:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777031230; x=1777636030; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8xp0jm1bju2i0TWQ0regUkm9kkI1kpmGQXqWOuUWnLw=;
        b=VfRytoEb1y+eHdaCLpMfidME9z/dedkno404OWx1kX7XdmUJKB/l5BZapJVDtdG94x
         blBKDx+bEotYRoBVCeY1eCfLrw+GrZC49zt3ZlQK0eI1i9R9NawbkCd1QdcxD/jZ6T/j
         3hi0m7co3jP32WsSH8fAw5xkKUDZQ2uPTVRumvytP9M19HOpxAFVppHmdDsi/Qh3mTZo
         mG1qHn3hz6Mr0QR2XPF7jTYLlgC3sXnjkrcggiU31AzIE/MHjmA32i/6bINkIT3+QUOc
         sklxC0uldQ84Oo/0tGgEqlyKDVjMdR3tRsmrLKXh1QlQgaPSSyo5g+QGktsZYeMgeRCY
         f/hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777031230; x=1777636030;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8xp0jm1bju2i0TWQ0regUkm9kkI1kpmGQXqWOuUWnLw=;
        b=pPT84Pof/47TDAN6QcYiDF5kzw6ESY8zF9yUYsY70ZbAhW9i8H+yz1Yiq4+UqubWK1
         zN/MjlFHwAe5j8oHFjUuoTp2m/ys9O9r1b0J93KKYyp/v6CXZeB7rFYayly1Ge+gmZ6s
         ry/leFuU6EXmE6Wq3Jhx+C4+lBTWzKqckNNnDbxDWbYgaNJ7Q5cctfxfP5fYU/WcCv7G
         8cQ0ih8Jqm+zoLG0QWLZ+v+fHhXoX/haDGxAD5JZzcO/OPkXjxB2A3yQngVzF0uLdX/R
         lM7ULIZ8ID3fMC7ts8bn0I//8foxeC4tzHi2YXTezPmxt9UO8qBP1pmqlA+jHDAW5GFg
         iEVw==
X-Forwarded-Encrypted: i=1; AFNElJ+pPpURNrIV7adzeH4Gx5b6Qo3wxVSJNoShe8d8TWDilR/OkK8Kql8bv+X/5Wgy9bF/6M4L1PZ8lKaA@vger.kernel.org
X-Gm-Message-State: AOJu0YzZwmzsVrWB3QpkDmLSzQwH5AQGsldkgMWScLiYNVndD/DKI+L5
	Rbi13J+iDtarvRbnr52s3y7oGe1r06cqm3r76Yezh7wCeW2Wvai67WfSZwJ6sRJ6ssBz5G/EdEC
	z354HpavS6eebmKVa7Jx1+ijytaGVTEhwMHwFF090RKLBnrR+/r7nyxpeaeObQC8g38fpjbEE
X-Gm-Gg: AeBDiev2+PgfI4eo6GrZyBnkGh2EVreZ73Ew1gNqILFwgjcZEmWkXxN325UeHXYWNqu
	yJGr4s5rymKD1AQUjzfLE40/SHXrjMu98kv06G20C/5J0W3uxoAUXeJ8tLO/fo9vnYAvA/1ZE2T
	rLnH4JRcTdwNv9+9N96cTEKfAbvSWR1EsplAQmGDNKu1jVhtWE9LYILre/T8a9MVkwhsGJtZxkW
	T88/gTi1U6sLwGI3DLvjsRQo/Ze80VYA87uV4Gn1lhzXeMtf5uS7LRDRzTnqZpw5PPzVxuH0wLr
	MVu/Wuoe0Cox98fa7F+nsmpjTzLksXh/9Q5H6C9GMZg2E4bgbXJWZS6cV5Q/HqsA72r/8r339L9
	8PlRpPpxoo5dtTEOm/LdhjETCQPo3xBx+51foEup/2pxCWfRJePbWGMzh30K8UNmAhW0apEW/Ch
	ZPm65IGV+QqcBxGQ==
X-Received: by 2002:a05:622a:4645:b0:50f:ae67:96d5 with SMTP id d75a77b69052e-50fae679915mr135702721cf.4.1777031230618;
        Fri, 24 Apr 2026 04:47:10 -0700 (PDT)
X-Received: by 2002:a05:622a:4645:b0:50f:ae67:96d5 with SMTP id d75a77b69052e-50fae679915mr135702411cf.4.1777031230164;
        Fri, 24 Apr 2026 04:47:10 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba45503c435sm768221466b.43.2026.04.24.04.47.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 04:47:09 -0700 (PDT)
Message-ID: <73cd6f96-07ea-46c3-8f6f-1cc8086a28fe@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 13:47:06 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] arm64: dts: qcom: Add Xiaomi 12 Lite 5G (taoyao)
 DTS
To: Stanislav Zaikin <zstaseg@gmail.com>, devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-kernel@vger.kernel.org, val@packett.cool
References: <20260417084749.253242-1-zstaseg@gmail.com>
 <20260417084749.253242-3-zstaseg@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260417084749.253242-3-zstaseg@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: z1KNcX0mpxpxAojLScwszn8kbEE78T1V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDExMiBTYWx0ZWRfX0WVBVc4Np54I
 Y/HkwtuUzaY5MOXmHEZLaxWiYXO4dMAyQXfseRLtCjxJr7e2wumiYoXrHSzfxQR+fY4GZQ+yoM8
 4anDrXt/Krerz7+8L7c0x08vGFfLdu7F88ld5kyz0RqXrx0+3xqAiorUJzY+ziRtGva9+5CcywK
 f0CkJrR2LULzEymPyjWiNnB5RgiJolXXyXeLFwwWIJg/vx04uIBNSHVS+vTXEGgR9ILUMwETeUN
 +uE3lMWZ1mcGDWgUgi2Q5ONF76mdY7OLfK4IOtew7BKqpjIrX9Nv3KQ6FzumCn/wdf6CXBXkNK7
 W+twspOqzxo+qEKZ0hDzklDwJY5Hu9LHTHvMtkGDWChmlck1+MpfBb56exccs3XGj43+euDZDZ8
 fDgz/TgOGMUXB94Pcy44u1mML/Mqv026R7np5W/PtDs1Cj9n1SyYk015kFihWJeobfuNsRlRZu9
 KrCUwfGQhykD5s3/A+w==
X-Proofpoint-ORIG-GUID: z1KNcX0mpxpxAojLScwszn8kbEE78T1V
X-Authority-Analysis: v=2.4 cv=QJNYgALL c=1 sm=1 tr=0 ts=69eb583f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=yr-2ec9jEi1U7REnfNwA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 malwarescore=0 adultscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604240112

On 4/17/26 10:47 AM, Stanislav Zaikin wrote:
> Xiaomi 12 Lite 5G is a handset released in 2022
> 
> This commit has the following features working:
> - Display (with simple fb)
> - Touchscreen
> - UFS
> - Power and volume buttons
> - Pinctrl
> - RPM Regulators
> - Remoteprocs - wifi, bluetooth
> - USB (Device Mode)
> 
> Signed-off-by: Stanislav Zaikin <zstaseg@gmail.com>
> ---

[...]

> +	hst_bt_en: hst-bt-en-state {
> +		pins = "gpio85";
> +		function = "gpio";
> +		output-low;

You shouldn't need this property, since the driver will control the
pin

Konrad
