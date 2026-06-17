Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7AB406287
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 13:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781702784; cv=none; b=Wcab5/65wNXlu2ujEhsza8zQRbd8VPX1rvHkc6jUJ0p1ESg7g+roIef3/5SIFcLF7ow3yeJI0+TUG9zf2ik7Ljsye5cTA4H8fc8sy4la1XPeS0fltiX9io+pr7SM9aDQZkPOFt1gH1PSkPysRPziun+5xe6MRSj1OaKNJF4xFJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781702784; c=relaxed/simple;
	bh=inIcFos/x0jKX2o4+YkzqWsmsZsjP37LAPvUVyviBhY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nHjxQXFmOHmLiDHhr6lwinEjuXPtrRpLAF+jLiWZbAcTrmKIOBXTePcC6WtxqgXxLj8QZYWJ70dd4sq4ldCZDEjsnrrBbUaJkRw/g4Rgc0jT+HrvzoRj+k1zgkefZ3XhEai6xoVzBdJ75YXKAXQvgrK1HkSSQGuOZBDnbCFyeP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NEXglQqI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OWFAxz49; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NEXglQqI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OWFAxz49"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8ULf6239762
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 13:26:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d9L8d92QIfTFBohwf+5AnyF8y9DpzmN6NgGQoafr83o=; b=NEXglQqIlMtqgrma
	PHQUKfyUIotdvE8l3OThso2pEag+QOXl1vPMOkYhE+1+q6EJlOP7Zw/LeHo9+6cN
	CdPkgLfjmpKYpW3BgXx/c55Xa+qv5gRrY1ozJfILgs9XisOenPf2WWvBMqcwPuyg
	4PYPUeVkE3ej8fSwEPXrQ7MuUnnOPO2y0yTqiX5gfSh1hdSsLGDkQyhn4IqPfv7S
	M1s/nBUfY9CwCCZJxwwbDUnyEn9MMRbU/laP8+QVWTL911PQyKKBtVkXDrCPjFSV
	UC6NanZGe0D78dRVvIuRjCTDdI/7yBCZjwbC/WxDX11FrmfH6tiTfyR33fZwoxee
	RqLnnA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueepk7fw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 13:26:22 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-966d1aa6688so94102241.3
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 06:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781702782; x=1782307582; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d9L8d92QIfTFBohwf+5AnyF8y9DpzmN6NgGQoafr83o=;
        b=OWFAxz49qZMMi+904yowz1cbhbf2d/Mw5N3cDN383lvDqgGDMB5rvjRgKuo1NuC6bs
         BkbucN00F7mh7Z4c8p0g7uWS6CZFzYhesbFDghnLM14FmsXgIgFI8mRccLAXVLhYfg8n
         qRd5/qTeHJbSMjb0e1cONSe5jdBJjGlqZAkxRNU9SQ5lkmHec+g6JyvH5BhzVM1w9zFN
         Jc2a4UTPvXaYWaffH84I1kwOV7CzTeUc/EaM20uSdQBSWiZzsPfrCtHvMn4rCs8+s0a5
         Xlx//Et8G/w58CMfaFI6KxngpSgbE+nSdlARoo6d6XXuRIX0GUYBk2quOsAoIhljHvhn
         rZ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781702782; x=1782307582;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d9L8d92QIfTFBohwf+5AnyF8y9DpzmN6NgGQoafr83o=;
        b=MMK66alTz/QJaBCZN0z6shus+h70nyJuY6ytRgNxnBpUyYYjxjXiHUHpRXpJrD1wad
         9nZggOazvY0NVT1BI4XPtKjH1E9ctjMetu/J3vVsV9rG4/q9l7FCy2wg6MmPgmW1ntex
         FrdgPJorz6PCXKK7X708Nkx0xfVad4deyPwzJIAA0Pf+3OocALQELuant3s6ltauZqoa
         HFP5YIUQnA9aXl7fgJxNXL8bvBQXTANGvrtSaQVx+hlVzDX53nphGlbledYwpIVZzCUk
         s45vAidoOGMJgHgORSX5bRvWCtSLWoWp/PT8OzK/VnZ5nCjj+Q3jq98IAp4JAyNYb+wi
         MNdw==
X-Forwarded-Encrypted: i=1; AFNElJ9hcsisRsRaceRwMzRc61E/3k8kTuf9bk1QOPZAS+xqP94XAip+cNCn8G3xbNuMWsbeMj/WELwVGIcV@vger.kernel.org
X-Gm-Message-State: AOJu0YxDU1bWQe651TG0Mcxk0tmrAzir6OEa4LnFw9t0gFHCU2+olp0e
	ssCzJvnNHzMDi/w5EBDo+1iXYbDeT1KPzxfwnvFgPS2Vwa7O0Z+t2GsLPaD83o6vn6o+FdOYWii
	TxKD5TGqc0fclDpZ9Y1DlN/z10gYc/CMNsN6dxM3FEqB/1NKh22sqXEoIO+5sccwG
X-Gm-Gg: AfdE7ckbjMchyU5+s8w3T7MbBluVKPoT/in9aofwQXboLgzncTzGuHH93LOOzStMTX1
	3gnvaX7zqCC0WMsQVbrpg2RHUGtVa998HrYb6Dv9PJml4n+6eLQyHIVOyPGRI9DjwiteuykMqO/
	c1XwatIPLt+1m6OGnmYc9+W0WHpEoXhtHKt3tsmuxk2qqHD8lvx8jud+ZE8YDX+IEN2+rvMV/yA
	w4mucBwC0PDfpOBBWONjxqjOlvKjBKsfpUilqPyMnF3M1me7Lkh8eH4/LH6j49nu818/Gu84vje
	UFgKc0XZH+HNVrsQl0byq0jTO8rEuU4cJy77rI/N0YVuBGmh9R9hkJkin//+N8PN8kini1cauby
	g9ikLySSJ2QlAlTsXxd31OnyRSiUGwOdTUWI=
X-Received: by 2002:a05:6102:3f0c:b0:6d1:8f7:18a5 with SMTP id ada2fe7eead31-7245d1f4fa6mr841355137.1.1781702781695;
        Wed, 17 Jun 2026 06:26:21 -0700 (PDT)
X-Received: by 2002:a05:6102:3f0c:b0:6d1:8f7:18a5 with SMTP id ada2fe7eead31-7245d1f4fa6mr841342137.1.1781702781292;
        Wed, 17 Jun 2026 06:26:21 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb7b6d934sm799439166b.40.2026.06.17.06.26.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 06:26:20 -0700 (PDT)
Message-ID: <8754de51-bfbe-42f2-84bf-36cc000afa3f@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 15:26:18 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/8] irqchip/qcom-pdc: Move all statics to struct
 pdc_desc
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
References: <20260616-hamoa_pdc_v3-v3-0-4d8e1504ea75@oss.qualcomm.com>
 <20260616-hamoa_pdc_v3-v3-2-4d8e1504ea75@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260616-hamoa_pdc_v3-v3-2-4d8e1504ea75@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AY+B2XXG c=1 sm=1 tr=0 ts=6a32a07e cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=YnNygKpUfyAIgCZGubgA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: 7nG0CRxEVpCQuICelG2ZkSJXPHHSLfTT
X-Proofpoint-ORIG-GUID: 7nG0CRxEVpCQuICelG2ZkSJXPHHSLfTT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDEyOCBTYWx0ZWRfX4UZZlVXzSbfo
 cVJvQMaygL2/qQ3s5CyBBegAO9Ezuoj+O9tn/ilMnmhysbxxNrpVWlJP7/cMROEaByP459gXV2+
 Q0SdleF0eqDXZW3o95UXHURzy1XgyQtwurcNR2rj3kGu4znGr6+X9kniCoJp1AGhfeIeH3/YOUS
 ZC91RYEa+214vOpYhx0l1DDvikiwzMnjIe8B7eiH/++2urKbLfm/RqsLh0fm7g2KGs7zDMCSir/
 6JWcQToTID0mCXtCUNZgSQ5ZmZCso+eimjtafC+gc5VfHTHoswrAELr6R6v7jMEB1cj+vZYQkCh
 APk//EfvSZCRZ+YgtUzCW5w7ZWTsiZHCJ+PS9w/shyzcZEjQN9TV2Xn9CHQakzSphxjWWhvsuIo
 sCmo6CPsa8QMl4GlPK3rJgk7Kqbbe2CTqfHypHzK2wPxcPtvnw0Gjk13+5d1xysOE6EREst8Z0M
 cPdFESkEFNEukHv9o0g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDEyOCBTYWx0ZWRfX3dTyohWTKjRf
 lPCKDUukb3orc5ajexAwscepcZYq4t+nkrzv/4js2tzaTZ2D2q3rEbLEL7zdGaLOgvZaOkdbiPH
 y9ZGURsB/Y+eJCPpldvCzqf1n8pW1YE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606170128

On 6/16/26 11:25 AM, Maulik Shah wrote:
> There are multiple statics used. Move all to struct pdc_desc to better
> align with versioning support. Document them.
> 
> No functional impact.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

[...]

>  static void pdc_enable_intr(struct irq_data *d, bool on)
>  {
> -	unsigned long flags;
> +	guard(raw_spinlock)(&pdc->lock);

tglx suggested to use guard(irq) around "the other callsite"..
which I'm not sure where it'd be - maybe around __pdc_enable_intr()
in pdc_setup_pin_mapping()?

Otherwise this patch looks good to me

Konrad
