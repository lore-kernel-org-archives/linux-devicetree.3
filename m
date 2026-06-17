Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6BA3CAE7F
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 09:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781688646; cv=none; b=Zu/2TxynmUfm0hFv9IhjuxPwNg2J/1vd+NuYb5P62roDxQv0+hv3IbHQRojnUGA3D4EkEWX0yLHhLRnr5BgEDL/PL0KLd/7QS9ltBWEnxFhP9fpTxmwup8vYO94Zfimal2+kivAG7L/xbkZRk8aSkEhpzxUCbX6/2b4gGbfKSxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781688646; c=relaxed/simple;
	bh=h7NqFiL/vZAhxbDLER2nG3vWh/Se87PBLNeoY6zZN2M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g9Ue3/Br0GRttD8JSEeplq5NCwSJEPGJxEY3RWacDE0oqCAC+dPdQeDfJLuiajmyWp0WFvJfkllgIGn5SvKYR4lzJJgyUbrCYtitIH5/FzMloerlgu5hV97iKQOVx9fV5KwQcro1rGjG3YotQk30tKv7Zl2DFrlKQkO2H/EbOws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ftQQj5X/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EFkHxAGi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ftQQj5X/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EFkHxAGi"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8UDIK1734962
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 09:30:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mbELSQCe+eLHzp84jgggoNFJ8/wasOftbLaK7oSIbpM=; b=ftQQj5X/9G9fSF45
	Yq/2s+3OHwxxSyMTC1LXYst8SBO7fq8lJdpwgdpVGK2MXeaJTahnMhHQpZwmO6nT
	qTC/RYWUxSFUiyCUgMLgaR9V1j11SZLi240Q9+bq765ifD1rCkPHh6Rp4Pbh0+hv
	4/E6Sw1OEG9zdsNs5rdZWy+NZG3Q3BrB1Q4XoWVlRCz7BvivY12XYVL6q+m0zHOl
	0VD4Inru3NRMX6h+8l3pUaWIuXWp1sUYZmT3lq5F8CMZwSgXW3THbB50DVP2tYK8
	xKDTdjYNSPvVTuYZWxDGcK/L3KuWx4n/lXK/dPSm/CzFZlKNJWL8/gGtIhtSAXSq
	vCti5Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueemjex1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 09:30:44 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9160006de85so144100385a.2
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 02:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781688643; x=1782293443; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mbELSQCe+eLHzp84jgggoNFJ8/wasOftbLaK7oSIbpM=;
        b=EFkHxAGisHfi7MbLt37ZxGyInhwBSMyHzhvE6Y33E8uaSFC/po1Yf3Et22uZThBgWL
         enpsbQzwvW/LfCx9ggHNigEbaBBZvgB2n3Z8Szwtt0T6KDXgvTSbVJL3LEgtQ9hzzAgJ
         cGgTlIAl/6ihuhBE5Fmc86aJ5SNNb+aIjfngogLWJbLqHjG30FW3FTJ4ifI1sqhXcTD2
         nCU2VsdkXGx87NKHcdyoJlHFmE14EsbmaPAKjq+ZMArbZ3Y27g2BpBOlpPhePquS48Qf
         tlb1ccBNqwed3/XLWmMkxAJYldBUESPPyiJ6twAfO3qqvkD+uMXoD0TxRqN+gxaKc430
         HeBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781688643; x=1782293443;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mbELSQCe+eLHzp84jgggoNFJ8/wasOftbLaK7oSIbpM=;
        b=FA3oU+CCwdDdrq9T63Br0kZD8txcYi7UbSqA6KheilG/bCIJ/FeCNT+cNn+KHlRBei
         pV8aJhzv8ORLcXL789J+HlPtWN0DH739QBr/AAZ8GFeWK6zq9/bMdUWJnCTrkr0M/Ff7
         XwfPF9T76Ry4eCU4DI9rOGhcOSf0ZOj45e+BK9hH95id/3H01FWRThijrHU+WlkxMwYp
         KLWB4I5GfR4WfyA03tf9kjd/zD3HE0sL0nPtg6X7z19SDuoH6sZyxU7Mc0hX9ZNCFRPx
         UzcETK8reIvcChv6we0Z2ysKC0SyAhEI58uxunu/1UxgGDa00x8lgsegVABnYLwnYRb1
         cpfQ==
X-Forwarded-Encrypted: i=1; AFNElJ8r7HezA+6IsIiAqyxW0pDDvLC4oTHODhaF19jAuWQCusTfNFF0XP4HzYSabdqQmg7UrRC0K7v9ZdMn@vger.kernel.org
X-Gm-Message-State: AOJu0YzkSblL4SxeeZ61ClZ17lTweUNSGAIwDD1si1rvRsAyR/rikQ7c
	HeyteWv7kygT59+bqagItiKeG6d5dIFTVeVCqOJoe6LX7nVL9xGkB6GlRTR9GPNRqlEcaFEkK35
	hIbpYTCoCvNOsp9KlodGQHjHti+eisG9R4XXybaPxBy7+P/J6DLn41EHAGMmNtV+i
X-Gm-Gg: Acq92OHPnNyeurqWUXvg3DOIIrIX7GjhVDvlo8r32YUxczi1t6oXPWuOp3UGTHN1LE0
	6Bjp9JW7HMy/ELNjMByPQgL+ffCPAma28XKOmlFuWOpKUiamU3x3XGYWVGBBPwwgLkYWBQ1LCn8
	eNoXBylMvFj/CJMQEajU3y0n+BwazsSlGpjZ5Hkbv8G6Mtk61qXrBASaW3vR7lSABkMQ7FKtiYl
	vfwjlx/M3+9YMVoSP0ttFM9ONu34EpTPzhPsqkYAnFd4YOtoY9Z9rTuPPPhHqLCFwNu2UppQcO4
	13X4IQOzYtkgZD7SbHtgxPcg11ilVvhoihA/P06G2LEHNgiMjX75MPVvsdz0D0o+FaX9UuNtexh
	RrXYTsnJX42TjXETbyzCrzm5nSNP8iUXfhVM=
X-Received: by 2002:a05:620a:438b:b0:8f1:9e59:2208 with SMTP id af79cd13be357-91d8acdc8f3mr299014585a.4.1781688643509;
        Wed, 17 Jun 2026 02:30:43 -0700 (PDT)
X-Received: by 2002:a05:620a:438b:b0:8f1:9e59:2208 with SMTP id af79cd13be357-91d8acdc8f3mr299012085a.4.1781688643022;
        Wed, 17 Jun 2026 02:30:43 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb4b22136sm788125566b.15.2026.06.17.02.30.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 02:30:42 -0700 (PDT)
Message-ID: <29806448-0588-4590-8540-a689ccf1e7b0@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 11:30:39 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] input: misc: Add Qualcomm SPMI PMIC haptics driver
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260616-qcom-spmi-haptics-v1-0-d24e422de6b4@oss.qualcomm.com>
 <20260616-qcom-spmi-haptics-v1-3-d24e422de6b4@oss.qualcomm.com>
 <eb693705-c0c3-427b-a924-5aa907fd65bb@oss.qualcomm.com>
 <1bcf00ae-2558-4c3a-970d-aee1da0c06f9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <1bcf00ae-2558-4c3a-970d-aee1da0c06f9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDA4OSBTYWx0ZWRfX9YidYdmTCeSU
 f7RxLK5WQ6ZbVh+wYXgRi9z69Slvt/EbGUagwO9vqEuDMkH0iWJWnu2sntUpshvpLrIi1L0tSkT
 c/zN4UGfOv95yKENiigSUPt0soTaXD8=
X-Authority-Analysis: v=2.4 cv=D4d37PRj c=1 sm=1 tr=0 ts=6a326944 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=IsPFB7xf8fGKp3IZfZcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: Bx4S8GcpyZ3cWBtqXXmC3K3-K2FHqDnm
X-Proofpoint-ORIG-GUID: Bx4S8GcpyZ3cWBtqXXmC3K3-K2FHqDnm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDA4OSBTYWx0ZWRfXyKJrUwmSFIew
 M5Pgkqiw7d6AUe9KdJqi/reSkB57Jx4peRDrvJRGHOTN/AweTzLCAWRDhwyg9N9QWzInuuevxRE
 1NyBQhiYxSLYhrMsvhZdW1q9v47YNrbzhnnRT2exJfvalh6RmPv5jicGX9P/ftTlB5h+IuRroUo
 nCufcx0cmlQp8wk9lJumm0ngqKckXEjvB6PRpzEpodex5zskCp113F2bUlcFYV6tdo5lHtjciQM
 73NU7xn92rXtfUZcFQPG82Rysw9SQ0q1Q+q87KsDYDWMgvF0hgiCNWUKNrdxUH00YlC4XRUQzvo
 JNAtMiwAjdCt0P586+dRdkCWZYhGN+E6VKv5czC06/VCiWjiXtB1bGXlUK0ziA/kV1ZHtUQlkN4
 LWf7yKK+JIqFtKYWvvZfMmym9Bp/YD63pRcu8ER+vsWTqgxqo4BXpEckij9b13AfD6yhG+7AwkA
 KvFRCfRcO4qGh0OmVVQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 adultscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606170089

On 6/17/26 4:31 AM, Fenglin Wu wrote:
>>> +        ret = ptn_bulk_write(h, HAP_PTN_FIFO_DIN_0_REG, &data[i], 4);
>>> +        if (ret)
>>> +            return ret;
>>> +    }
>>> +
>>> +    for (; i < len; i++) {
>>> +        ret = ptn_write(h, HAP_PTN_FIFO_DIN_1B_REG, (u8)data[i]);
>>> +        if (ret)
>>> +            return ret;
>>> +    }
>> So if i'm reading this right, the first loop will always write
>> 4*(len//4) bytes and the second one will be entered at most once,
>> to write len rem 4 bytes.. should this be an if instead?
> 
> I should put a comment for clarification. Here’s some background: FIFO data writing supports both 4-byte bulk writes using registers [HAP_PTN_FIFO_DIN_0_REG ... HAP_PTN_FIFO_DIN_3_REG], and 1-byte writes using the HAP_PTN_FIFO_DIN_1B_REG register. The 4-byte bulk write is more efficient, especially for waveform which has several Kb data, and it helps to reduce software latency when loading effects and reduce the delay in triggering vibration. It also helps prevent the FIFO from running dry during data refill in FIFO-empty interrupts. Typically, we use 4-byte writes for the initial 4-byte aligned data, and 1-byte writes for any trailing remainder.
> 
> So it still needs a 'for' loop here since the remainder could be more than 1 byte.

Right, I mentioned len rem 4 but failed to notice it's a
single-byte write.. anyway, a comment here would be good

> 
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +/*
>>> + * Configure the hardware FIFO memory boundary.
>>> + * FIFO occupies addresses [0, fifo_len).
>>> + */
>>> +static int haptics_configure_fifo_mmap(struct qcom_haptics *h)
>>> +{
>>> +    u32 fifo_len, fifo_units;
>>> +
>>> +    /* Config all memory space for FIFO usage for now */
>> What's the not-"for now" endgame for this?
> 
> The hardware supports more modes than the two currently supported in the driver. One of these, called 'PAT_MEM' mode, also shares memory space with FIFO mode. However, 'PAT_MEM' requires memory to be pre-reserved and waveform data to be pre-loaded. The entire 8K bytes of memory can be divided into partitions, and it is configurable, with FIFO mode always using the first partition [0, fifo_len], where 'fifo_len' is set via the 'MMAP_FIFO_REG' register. 'PAT_MEM' mode plays waveform using data preloaded in a memory bank defined by the registers 'PATX_MEM_START_ADDR_REG' and 'PATTERN_SPMI_PATX_LEN_REG' (they are not defined in the driver). Since PAT_MEM is mainly intended for hardware-triggered vibrations, such as a signal from a dedicated GPIO triggering a short vibration with a preloaded waveform, and although it also supports software triggers, I haven't found a suitable way to support it well into the driver under input FF framework yet. So, I am currently allocating the
> entire 8K FIFO memory for FIFO mode only. We can adjust this later if we find a better way to incorporate 'PAT_MEM' mode into the driver.

Sounds like a plan.

For the other mode, would that GPIO trigger need any OS intervention?
Could you speak a bit more about how that works?

Konrad
