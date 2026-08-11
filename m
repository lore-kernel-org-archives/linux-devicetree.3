Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7593AA1BC
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 15:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786461867; cv=none; b=lkL0A/gBHISWiGrlNM1tIcaRi19eNNASTHysfk2m8wICdPfm7HO120wlNLAyeko6VFfQ3MlHpXduxEc0kswd29hkiD59dQHJF9zrYzqwfl4vQyJKZz6TW37eogc9jn5eVS7vTVtdNzyKeAHKIHsUC3ZGf3fZ4BsIB7jyzmnzJzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786461867; c=relaxed/simple;
	bh=sj4bS2/dXB/i9x9sS5ZEco69QKrmigQRCDI2zV24RZo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NdzHRB7agaoR3IN3Ikc3bQJF1fOePNjOPKbnOhEJLZhmjx1Ikke3zNc0XtwPwrEZ+DHsi++9oxvlGmf2vjHoBmdgLb5nKkYAMMTf3it5b/fJuCbQjUeoAfViG9UPLjdujv4KQsBbOuLGeK45uom0badkxGMCwO5hfJCizRi7KMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vu/ou7Uo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LHEu2YFq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vu/ou7Uo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LHEu2YFq"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BDWwpr766916
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 15:24:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t0yHFqTDdSz7c0Ma7aGwQ+ILjZzIZgI1DbbmrQLlol8=; b=Vu/ou7UoaPmns84N
	jDjLKPOGDxANUYMV+3vie79g5ItIEqRIXtiTQ+tA0x6vT1XqrajNzQrB+5a3e7Um
	JYVUDrHiIfDBGxFzA0AagO4LamhLiV123GvuVsWNW76gANu1U0Um6rMXC7vOxPve
	sTWPCu54gKcKG0vMtqECln1IS1pGVyXWD3hDuySvhdtSN3U057Ct7aWCu0/CU93H
	Z9xyT3W5tqIJpLO02MzCedezfKPo3hU23+5Qm34g9zSSZ50ZUnJncnYFETBhkdCC
	LdZyqKEYBbNwPYA3472ZhTtxbGns4kOyKU8/U1DFrzTzD5BWQbY8aBvJ/TmeqfOe
	jXjg6Q==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g01q117ba-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 15:24:25 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb835525b10so4177170a12.2
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 08:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786461859; x=1787066659; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t0yHFqTDdSz7c0Ma7aGwQ+ILjZzIZgI1DbbmrQLlol8=;
        b=LHEu2YFqJol5xwHr+NGL/RNyQZBy4Pb/E1AuMif1XutK/4fcmwmXRRlbCgZYtMtcO9
         vdsIkVViKw28o/hmSZ0ODjjE4bPbeyUjeSdvow/RGsXNBdYXmM9RbiXrdApbua3rZVU3
         sbBhMuAyIb1Vtmo541FwhiB6ktvsrPFoJDUtlRgzAeaR3nR3JIdZaNUdDJY1gk33IHjD
         qkxuNJiB+mWuZeH7Q6aHQu4hFAW6jA/JGnp0nx0ug9UjuMKaW1mqvlBR6w3f2FOeN41+
         pc9U7Zp3rIP3RwCG//cL/rBJ5OgX9RefXnfmElYAkabN1ihvXJOT9Z6n8JKSdMr2V4E3
         baRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786461859; x=1787066659;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t0yHFqTDdSz7c0Ma7aGwQ+ILjZzIZgI1DbbmrQLlol8=;
        b=rcV9Hk5qaRAvqzbAGGMJld+VHX/ssInazUL7rqujy05gWiAV+mspuk7poTEq0NOCDi
         +jhT4oSlLVj+QzCGzWj9Nq4OMqtw70UyWHLawHTaoApmvYUPXRgccNiUeCJ63VK9J5ig
         HW9d6dxcwZcfrBPNyNYILRtB/H0IUqYWsESvoafvWq07wE1JDoKO4FdnGYQ9IPWtXL+n
         TVeBHF3BE2guXIUxbC4rKiVY6udlrGnFrsW6+nhKC8KAm3kCU7elHC+qDc1rz9SB3L+T
         kKde44etbWRIU8y349pon6QmXnqRGAvaLiY3LJ0Xs/V2ZlK831DsVzTLFFQKrNzidyQy
         EY8w==
X-Forwarded-Encrypted: i=1; AHgh+Ro5SQ/ffMStpvhOmAEKR18ngdgXqCwiNgSQx+ovVXQpKxuAZrgYjTLCcSHykNxXBl4ompPUIPtvkLE1@vger.kernel.org
X-Gm-Message-State: AOJu0YxTRAGMVp5k8FlPYdPh4RCch/TF9LMdA+bswJfKK7LycHYenBjk
	2+VpscKNdZgKCrhWqaftAKsOS8WBqHO7sPnqWWPnhMRNdfig+P11uZ/NC7eZqHL4L/xhNGVoGp/
	B1AtFMkU3kUV+xZ48QkdE6Tpo2fH09TtA0y9bBHyEfFuj5LjsfTLBs0e5ecbTdD0f
X-Gm-Gg: AR+sD11YzELlE2zDf3w6sD+vvtxtR2lqvQ+jlDgxPwmaV7rTNvqnICXfdEL3MuDa7BQ
	0njvdDldP2y23FWDRi34u8mXSU5pSU6RtNM6p/2SrIaH0PdUnqY7mBvEyaNOTtxK9oU3WFmdprL
	wlq9LJX/e/Px9jG3ixKN8PpNi5mIwJljYnP8leuLlbFPaZ+skh0uhgN0fKRJhVUTq5rpC65GhhG
	feX6GVEoqVW3SO+/8vsxAo3cwDMJwvWr1JQbZzhf9PbiyDkA9Hmg/+Rin8830ghYOasHCqajj8D
	xUz9wcwgoU98YSzdjT1wzt7m15/sevKDH/XT7IvWMWuALwWUoBmgPyhcecclX1+aIqq3lij1fQe
	Qz5HwxOtU1QoZ4o+v6bPqBSJjfoK6ryLWMKSZe6GgLxFAaLrAW+pRcumWXWfZUQ/p
X-Received: by 2002:a05:6a00:3407:b0:846:4d4c:23f8 with SMTP id d2e1a72fcca58-84fa8670b69mr5076164b3a.1.1786461859323;
        Tue, 11 Aug 2026 08:24:19 -0700 (PDT)
X-Received: by 2002:a05:6a00:3407:b0:846:4d4c:23f8 with SMTP id d2e1a72fcca58-84fa8670b69mr5076087b3a.1.1786461858816;
        Tue, 11 Aug 2026 08:24:18 -0700 (PDT)
Received: from [10.133.33.35] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fa9552bf3sm971806b3a.49.2026.08.11.08.24.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 08:24:18 -0700 (PDT)
Message-ID: <5a8a773d-5fa8-4e93-8130-2b49997691fc@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 23:24:13 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: ipq5018: Add pinctrl for MDIO bus
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260811-qcom_ipq5018_mdio_pinctrl-v1-1-14ae9dc62a3f@oss.qualcomm.com>
 <076b0942-7e1a-4a6c-9293-04a7ff77abcb@oss.qualcomm.com>
Content-Language: en-US
From: Jie Luo <jie.luo@oss.qualcomm.com>
In-Reply-To: <076b0942-7e1a-4a6c-9293-04a7ff77abcb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 5r7CurRQrk0J5ApmYTBNZUv8aal-4fm2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDEyOCBTYWx0ZWRfX1dON82Cz6p8g
 u7/7vWNxLPzJJbaZGk31NDr+s3t8pUBE3AJKo3MtcuDfF3AVA9P4wTXAEsqONkhFjSgLBIXsc8b
 DEsq7VFvKQAVwuDANuQxUFDZ0+3k2HT/W9GX0xTPxQadrNerwtUTCI00aStpo1C/6P9+IwJ6pkq
 bVUmL8nW1GwTq+RBuOSHJOhtjd73jLIAsQyvtLVSBMrGVm0fOuAoUBl2HAjIyCWP94mI2a6eCKE
 zAY4gjplOqN/kDIuNnauBuBUb8b+EpIJfySlPRnagFsZKe7c942C/zfJOnbZVhJ+MuXgBQijV64
 QmMqsmTQRiVvzMWFYnbE6AHF04XTJZEFDqmPIzs5mb7OpmDC+n0yUxiZ9VfX0pjWfb/TU92ruvW
 BY4p6A/cg07eWEARGCRpM/4PVhKMAV77n61M+E9PzHA6IsCB3vnRUFTD9cMHgP7s1/aFqk3fEzx
 jkSEDvn6XWtZj2JHbQg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDEyOCBTYWx0ZWRfXzmM9M0o2XFrj
 Z5OfyJL4M3u2WVts2Ir/VuDp6U8MsvqlTxrs45ZzpUtbM54AMWpy6WUyqt1Jtuu/WFjdAVapMf8
 +ojpVA1xAEIT2GpCdc30V+F/OsgV3mM=
X-Proofpoint-ORIG-GUID: 5r7CurRQrk0J5ApmYTBNZUv8aal-4fm2
X-Authority-Analysis: v=2.4 cv=brt8wkai c=1 sm=1 tr=0 ts=6a7b3ea9 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=sE9hRS_1S9_EAqV7uWoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110128



On 8/11/2026 10:00 PM, Kathiravan Thirumoorthy wrote:
> 
> On 8/11/2026 7:06 PM, Luo Jie wrote:
>> The external MDIO bus (mdio1) needs its MDC/MDIO lines configured via
>> TLMM pinctrl; without this the pins are left in their default state and
>> the bus does not function on boards that enable it.
> 
> Should we move the TLMM definitions to the board DTS file rather than
> keeping it in the SoC DTSI?

The MDC/MDIO pin-group definition is SoC-specific. On IPQ5018, only
these two TLMM pins support the MDIO interface—one for MDC and one for
MDIO—with no alternative pin assignments available. Therefore, the
definition can remain in the IPQ5018 pinctrl/SoC DTSI for reuse.
