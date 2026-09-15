Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D2443A80B
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 13:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789480108; cv=none; b=RlGPoVpcDZWdIQ7qeyAl3ir7zpEjMy/ElsFMu1EzNabomcJU1IHaV9YkO1O5WE395vjMosbeXyGFtYuSA9ei7HuZd/1tJxx4yi16JCF8RpnVdIFgLDCk/POr9YNgT2AsmGl6MLA9zWyg/bUEOfgIh2ee6k3emoOLXhQvMhG15QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789480108; c=relaxed/simple;
	bh=4eKyhswm/4t8PNCpNSn58PMTddZyn+n13tIZCaGth5o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cGMtKq7uNL1BKustHScnDzQdsUdzFdhRaWPLkH6vY1ZRVNccxPHyCcJLNW5679MwIMbvK3Z9EtDLWVnAea2Fai8an/2AthoyTGFO6Y1bysL0vq0oF/n0h8p9KLYUssTCpLf8oEobI8nYYDL15RGNyj4KMmHa+L1sqUZQu3S68QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p5L1smna; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EKJpSmxA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p5L1smna";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EKJpSmxA"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FD0Yij3756847
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 13:48:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JrIpxB6rXC4YQU5JBuOmbKCLgyAWZtcf2l6ITQl/W9s=; b=p5L1smnachr/d1NE
	L4RZXm5Cxn2WnlTelhvrx2hRVfzVugygvCHD+L8ogsbD9J1cgB6gvUabDTlmrCUT
	04RUkkA7KNZs3okqum9FAKrnA9r7JAwTcMvAj7agTWnjsWpR2ZRpvS5shX++slIs
	FOjLU5NPqXh8H7c+eOkBAdiLX9uEvs4jcoIM40G7p4Kg12cfkRWQNXRwe3uApKqJ
	rEjcXcCIlOfPMUmDD9Rn4Xq1SbF85cgH2NqnycaeFqokasYN3pV8wQp4wilOKj40
	xK9rQ8SQFxG9DgRdCmvYpk7OgkbC2k+PBeKBnSqWDZi+SP/jV2jh9XQKE4LMYLnj
	NZ+Abw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq38e152e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 13:48:25 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d9057fab9eso71649015ad.1
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 06:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789480104; x=1790084904; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JrIpxB6rXC4YQU5JBuOmbKCLgyAWZtcf2l6ITQl/W9s=;
        b=EKJpSmxAfTm00g9qnFWYRb+YilViXE+fKUjfXPAM0VoYRT3L6vsiSoZr9K1h2VKtHM
         7ILxXFUYpfCEt7SzaYF1qseFh28EFoA1mWoXv4PWavswrVYsYYwMoL80eG6dDSc+Jj0N
         Ezd07s7DZZXsnjNbsEODsrnW+45PQyR3vEaSyDhrTGIY60Kj74cofhTCJH9BzdPGxWDP
         eh/G7Q27mLqz3TSaR2AsPBzhJ5T6/sqzRyyESsmD2fb/44PI9NXfmTs5ANXPditn/mw3
         ECbdDBqbWoPB6E0c5eYwK7jbuppStaiLy0ynDf/zgVTWlLHZlPZUop4nfGEZzuUSEs7g
         94oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789480104; x=1790084904;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JrIpxB6rXC4YQU5JBuOmbKCLgyAWZtcf2l6ITQl/W9s=;
        b=pYdooQNJ6rVTn250Kv2LjRl22FcOMC8ZHGSIQagQFCSRh040c3jyCFYnl94o5agfUE
         KdFqnmd7qgpoZ8U7Q1RGhRxHgf/M2yJI0Twu+SQbM09RONlXCO/CFfpOA2GX14VKKUCi
         DfpCtYuqp7aE8jJDbIkU2lrorj5FpGlExusta3KnE3nNXdRfJjEDjLO0BeB/whWhgVyZ
         FEraHS2BemEKtYB5D44LpEGlXSmhuMqhY1fvEk7iCjVlR2dPct+vhqlNxbTmKjOkYZi9
         4kYty1XEUDFBCGua8bFzNtdw/iyJX2ghyVhUwXJb85WfxfhzqS1aP4truWN6v8M/Q3T6
         ea1Q==
X-Forwarded-Encrypted: i=1; AKwUvByqHUQVK89Hv5dnGCl4q89FM2JdB0ol4AZwHt/NQn5b60ZQwXSxemKYa4UtZYHpDKhh8cwUdtpzOzQP@vger.kernel.org
X-Gm-Message-State: AFuF++k8N787KkXlDnBHQW1Z2r2Qj93n6941q5edbPwdGx+lvy893mRT
	e9EPmXAn6HoLAAjzQRDZZ/diW4NUZKEEKZE5EYO7wgCpxZO6CjYRznx/GOrF8UU0U+MnILsQ6WS
	dIUkq4Y/zIT0He1NQUlq9/qgm2zaOhO5M4QO5Vi6/Ae2k2tlO1L2YWhSxHSTOtmZc
X-Gm-Gg: AYBFou2SyP0UC12x5XrS+k6SKWX3sT8iAnvsXBtt5C9NgxOElaiah3qsmOQmjona9nC
	Nvoe+Cg8EnHdmR0fT8wT9VzYV7L0LgXXCZE/kOlOEfrkQhsHIvxx/sGCEn5R/piktVup+HhhvmD
	yTOtACCiCETWoLTxpUZw4mflm2MQocFkFWjpA9c2PQwemMczdhZ7yUzLbL8s69Ra2urea1JFW41
	CMPP+8NBFfWPmSTo9TWMh/GXUm0cURWGLIU5KDWaIy9wWuZSODE5GHUNr+QGMqLXpT3MLMWqDLO
	M6+UmXF98EiK121lJaOXX8EHVPVq3T+hl446bdXvEqyzAtnG6GehBijEf8qPFCChdhkWgalFvbl
	jNbAC+WPOeZCapHCVCaHRVKJWwgEK5B8c
X-Received: by 2002:a17:902:ccd1:b0:2dd:40cb:a04c with SMTP id d9443c01a7336-2dd8386925cmr21452815ad.19.1789480104496;
        Tue, 15 Sep 2026 06:48:24 -0700 (PDT)
X-Received: by 2002:a17:902:ccd1:b0:2dd:40cb:a04c with SMTP id d9443c01a7336-2dd8386925cmr21452295ad.19.1789480104152;
        Tue, 15 Sep 2026 06:48:24 -0700 (PDT)
Received: from [10.218.4.101] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2ce92e99sm67934895ad.25.2026.09.15.06.48.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 06:48:23 -0700 (PDT)
Message-ID: <467c19e0-a4f8-4e67-a750-be695db34c05@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 19:18:18 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] i2c: qcom-target: Add driver for Qualcomm I2C
 target controller
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260813-i2c-qcom-slave-v3-0-1d3742e2ad47@oss.qualcomm.com>
 <20260813-i2c-qcom-slave-v3-2-1d3742e2ad47@oss.qualcomm.com>
 <ao7vB8cDufnJZKAI@zenone.zhora.eu>
 <5c6b120d-f791-424b-a41a-6c82de73000f@oss.qualcomm.com>
 <apDPu_uJBTT9GPmZ@zenone.zhora.eu>
Content-Language: en-US
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
In-Reply-To: <apDPu_uJBTT9GPmZ@zenone.zhora.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: UPlCYKGnc3Gqd7GOrJN2bbZMw2tUEBRu
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDIwMCBTYWx0ZWRfXy0LK7VmyJVOP
 vk19ZGQ/9st5jW26RAYSrw1shcBRq8Bf0D6ZRnhSEUAMaFwZuT576FO/8y3WpbpxfQnKW1DcEI7
 PGIUzKRZ+OyR74IgyEdCpdkUv0dSmzg=
X-Proofpoint-ORIG-GUID: UPlCYKGnc3Gqd7GOrJN2bbZMw2tUEBRu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDIwMCBTYWx0ZWRfX4KYgbcnTqW2u
 KmIGZumIxGrAH87C18cz/b1Y/w/djHj3QXCU8MPxl4ppmQ5gL6zw9WHybG6sDRBo+2sG1FOAyMv
 q4Qo7dcsf0Y4E5zR6msPZNw6S+x23DlAOWcJvQbKREY8dv7p8lUTHT81Et490i7uKIp1w5nkenS
 L112XWafdeX4CxsdJGq9YH2siUV4JGeFmyezxz2BRMTLJDof5pOXOm8f6fetf0zIOUGtfO4Q3t6
 om2+4OtxsLUXFizu9QNXq6BGyxpRn7Z5Lr1/xO88IzzHcZxyuFSufoIUBDj8JbDQORi/d8tnDfc
 MiKd8ibwJIbr9JR6XjXCRy48CZt8PhjSiZ7BZ96HiR4fMkSjku1b/uvcjW6HRVvKUlu6OIVsnKp
 7xlb2pI1ftvM7yox+mU0SrpjMxzLhoQHB7kgi8tEgA9P0lICFkWCWWQzBLAitOD78r1mZqJudbr
 8wJ3hU1sMTn8bvHOQmQ==
X-Authority-Analysis: v=2.4 cv=BswIUoX5 c=1 sm=1 tr=0 ts=6aa94ca9 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=5oCPkDSuF8hkarQvZ6UA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 spamscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150200



On 8/28/2026 5:32 AM, Andi Shyti wrote:
> Hi Viken,
> 
> On Thu, Aug 27, 2026 at 06:44:21PM +0530, Viken Dadhaniya wrote:
>> On 8/26/2026 7:27 PM, Andi Shyti wrote:
>>> ...
>>>
>>>> +static void qcom_i2c_target_hw_reset(struct qcom_i2c_target *target)
>>>> +{
>>>> +	/* Clear error bits before SW_RESET; the reset may not be instantaneous */
>>>> +	writel(BIT(ERR_CONDITION) | BIT(CLOCK_LOW_TIMEOUT),
>>>> +	       target->base + I2C_S_IRQ_CLR);
>>>> +	writel(SW_RESET, target->base + I2C_S_SW_RESET_REG);
>>>> +	/*
>>>> +	 * I2C_S_SW_RESET_REG is write-only so completion cannot be polled.
>>>> +	 * Use a conservative delay to allow the reset to finish before
>>>> +	 * reconfiguring the controller.
>>>> +	 */
>>>> +	usleep_range(10, 20);
>>>
>>> This is also called in atomic context from the irq handler.
>>> Please avoid using usleep_range(), perhaps you can put this in a
>>> thread.
>>>
>>
>> Thanks for the review. The delay is only 20 µs, so we were
>> thinking of replacing usleep_range() with udelay() instead of
>> converting to a threaded IRQ, to avoid the added complexity on
>> all the normal fast paths.
> 
> perhaps before sleeping you could check the context you are
> executing (with an explaining comment).

This helper is reached from the hard IRQ error handler, so it must remain
atomic-safe regardless of the current context. Since the reset wait is
only 20 µs, I will replace usleep_range() with udelay() and add a comment
explaining why a non-sleeping delay is required.

> 
> Thanks,
> Andi

