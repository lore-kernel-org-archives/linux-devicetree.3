Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4DA538F626
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 11:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782733000; cv=none; b=bcIvAdqvAFgwEzg9oeQvO4E4o8Zja2ubqid4o1o4x/N58LHT+nTXX0GUFrn8vN2TVWRSQ7AiK47ddhHnSUjUfYqtlHqGL4amfWP4/IZUKO7ai+ZNZhRggtnmxHLVdhagDRKMZWs6A6Hl294aYaPWhWvukFPpjq1hiFnafcys7Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782733000; c=relaxed/simple;
	bh=y2/GUC616dyG9ca9cuwDD56ballSDJtk6O9dWyXXJAA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=idWdKscTb0vAKUfNxVx/QZukBnNHNoX4P/qzt0g2H7q0HzbPkaHBWMAo7HlB3pEVIdGsfnZ5qcRuQYHLyJakl7Bcp73nIoLQtZjRgXB51FaJP9AfHFSf62shsbqPa1Y9yphFAGfb8bcrH+oxjdGY988zaTQ2D0P56IKBDT8ZkSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rcn1jUN8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JDkttjFn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rcn1jUN8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JDkttjFn"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TASuPn2640832
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 11:36:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CgSpQ7qTt2HK2IViHcPA7HBNhCTaHXWp3o8qDUqdAmw=; b=Rcn1jUN80pxVLwv8
	GQYYRA5QkkF6rvfyfIHZZBeQKFgK6MpF1vyUSjeHvW4ztEorR0o/YaD6mOS8GUBL
	ePq5kfgAxMsZILftczk/ldp5IEM7bU+KkjfchooSUHbZfpVzzRpTan3OrFcdeQJd
	6BbwjovCwh9A1Zm4QTDnap6gY1bjwTAqim+8Gx4zjoJ8PXf0Ip8kx5RYuCQPyOfx
	U0Ziy/U1KdUrW2k1dnnVqSmAI8W/2S30YQT+HWW5zYLSMtMjPz8T6cYVHlXVcDmo
	PWDALLCVJ6tFAnKS9aJI2nT5MsxqmGFUyoRnoW0p/IQfhQfT/S73F7yJ8tA7sHFg
	p2Iafg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3n5s0rm5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 11:36:39 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e4ecd1ae4so20552485a.2
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 04:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782732998; x=1783337798; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CgSpQ7qTt2HK2IViHcPA7HBNhCTaHXWp3o8qDUqdAmw=;
        b=JDkttjFnaKpg2LHGKngoP0duqIWU04+tufSrvqZf1KS9pmPgmtIwNcytz8VolRXc6M
         Gxd6qENFiQtUm6cWNTkUVO0xiqlFeiusrkdakpQfg5GMjsOrCJHdFNaiyGBbPQBmyCem
         T/y4qoh1h4DAhEAcmFJ64dn4f6q80PxPRbIoWTlGValtguQU4B/fXyZWNKNqLNSbLIFX
         06WexpaIsvQCmlrA4AKG7K4ekEC8hhVgkq5e64QBUvNj4RxIc4XzVcZGZLSlUOjDJ1u+
         yEJB8j1R5mV+SoV9KmitX51hMaCJM56nSumRniJxMqR9SwZT8yIg9qOBBI4H517s6VDp
         pXFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782732998; x=1783337798;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CgSpQ7qTt2HK2IViHcPA7HBNhCTaHXWp3o8qDUqdAmw=;
        b=bikoU5YGezK54bUAVnJn+khRbQvh0evOyHy4nvj79OI9I9oYR4HSzAbWeG0CFnTadk
         DzIqzQZzLBZodc7zQFYufmo00rI/LbqrXR69CBKctZLYhK693HKV8OJYBxtLifaauZiJ
         AMfkx0BPyGr55uT6eIwHNge8UWXIIeq6DDEORGNgqYKP4vTL6KvDkVr2w/NT7cKGKY10
         MtK6iF0Zte/PONEKmTyFb4rSOukQJ8WPn31zwh+8Fmopw5tHYOwcdYxiKOloZjgILGgE
         mAc+g1P1YRHSfBGtxqHTAXoEqsPpDxFJH2N1nki14K2Xx9VTggYuLx77Cg1r1H6lWOhW
         JF4w==
X-Forwarded-Encrypted: i=1; AFNElJ8XNsFJft0OouZvUYfoUUEQg91JZn/q4m1mJdA1wOATD9yEgxkZzTPhCkjG0Y9cVOc9P6C3LHURtRZn@vger.kernel.org
X-Gm-Message-State: AOJu0YwI5kbUMfjjPPwCXoXO60+5BPg4vtr2SH6GdH7uoMNF5LTCQJg2
	cO3vbglS1qqgbjjky7iUa+XTtFr3+dKkXRjEPM79uUxujhPywDcV0AmVBnmzP0iPn/JzOyKcrHm
	3DOYoNx4ZtCV0vjdfoiDOvffymDj3ZB+yKPjFhCYsrdNw0u4taoeaE1jxWPXGnrxd
X-Gm-Gg: AfdE7cmslee2oOw4oofEZiqSwdfZvVN4lNpY19e3ga1Tg+MLlf2dRaqeiikE8RldE9j
	s/Wf6Ff40eKW1CKXQzj0/iHfRJVk05pP+1dCpIuIHS1LExjx7Dd9UEIINvtZvp8CTjSmGn89CsI
	JWupF9dYpXBcabQ60gXBZfJafBfpVpQj4bUARJv5m8T7y7yohupldwFhXXn48UOmFThTRkOrzjB
	fOKQc80N7dZwInhTM+VHXiERX8Aelc8XEkpOgAuD0ZJNdt87y4KiS5f9ZRlTRjJsjwzfUymzeK8
	DMAXdgZtyJiQzSPx08S5HcwndP/4c9yecgT+rJOenKPERHqwl4M3DBDkuXyN3f2ym8IQw50/cE1
	3vCv3hCsHQL3pESKkD/5+PX2R7vIhhaHkpBI=
X-Received: by 2002:a05:620a:2614:b0:915:6433:2599 with SMTP id af79cd13be357-9293b75c8a9mr1509018285a.1.1782732998173;
        Mon, 29 Jun 2026 04:36:38 -0700 (PDT)
X-Received: by 2002:a05:620a:2614:b0:915:6433:2599 with SMTP id af79cd13be357-9293b75c8a9mr1509015285a.1.1782732997629;
        Mon, 29 Jun 2026 04:36:37 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12227a4cb4sm524597666b.47.2026.06.29.04.36.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 04:36:36 -0700 (PDT)
Message-ID: <0e7a5719-9271-498c-bc0d-5fa76341ede7@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 13:36:34 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8] arm64: dts: qcom: kodiak: Add EL2 overlay
To: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260624063952.2242702-1-mukesh.ojha@oss.qualcomm.com>
 <8fbfa82f-aae7-48d6-9406-d04e719f028d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <8fbfa82f-aae7-48d6-9406-d04e719f028d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA5NSBTYWx0ZWRfX8RkUkDodumWq
 Vb4FSzo5OjnK4FQDgb7isAsVSpPBIFLHVgZAwanacs4Sx59Mj6DO6D8xcaIiiWxcE0+yyLjz5A0
 NzlcOcI6dJPcl+aHrGRyFCGMT/w+qfA=
X-Proofpoint-ORIG-GUID: Om3B-qXjCU_VzaWfsfzegLb4jRMqpr-M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA5NSBTYWx0ZWRfXxZWqDTEyMxHu
 7HeGN9s9kDmVk/3EBMiQmWMj+eOK3rhaMFGlJZD2YtbBurhMymB6Ub0lvlie5WNop+sjb0MmE9W
 AXsvDFqjXcHq4a+c64q+YRGg7kyvLXvK8A1EN3DMhotLhPMHyCZ6aptxa9wKuijLGbLpxrU/R7u
 4cjpDJhLA2NCgOgekBedtX6K+D+xbXZlncYDj42utXLAfG4y6msbA0pDpRaGLpNpBZfCRIXFVGi
 ZtZXv9yCh5v1jGneGQ9CbcZvp5u5sz2CclZ839PQi+SovlCQevETKCyZpWCq7aPcJRX31Golo3A
 5hQoXRdKJ8ouL/JFoEUGLqMYiAc6k99lvIEniT9xDbKUat7QdkdhMJyAld1u01sMHj+AYjAgi1s
 dHkXaEAlf178ryhWCmpdCUtvgOIlfnEbzongnouT3b5EIWoy5cG0dd2B1TAFKaFM9OrXp1x3/eK
 UQpmZdwQ0gc+7sf+Icg==
X-Authority-Analysis: v=2.4 cv=NZzWEWD4 c=1 sm=1 tr=0 ts=6a4258c7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=cECbqmLR6XDCp-6X3FIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: Om3B-qXjCU_VzaWfsfzegLb4jRMqpr-M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290095

On 6/25/26 3:14 AM, Miaoqing Pan wrote:
> 
> 
> On 6/24/2026 2:39 PM, Mukesh Ojha wrote:
>> All the existing variants Kodiak boards are using Gunyah hypervisor
>> which means that, so far, Linux-based OS could only boot in EL1 on those
>> devices.  However, it is possible for us to boot Linux at EL2 on these
>> devices [1].

[...]

> Is it necessary to redefine |wlan_ce_mem|? Can we consider updating |qcs6490-rb3gen2.dts|?
> I have verified that with the following changes, *NON-KVM works fine*, and |wlan_ce_mem| is only used by the WCN6750 firmware.

Is there a good reason non-chrome devices never defined that region in
the first place?

My guess-understanding is that UEFI allocates a region for it on
Qualcomm platforms already, and if unspecified, we reserve memory
again, wherever the allocator decides to

is that roughly right?

Konrad
