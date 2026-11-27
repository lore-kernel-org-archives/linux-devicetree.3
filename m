Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779179;
	b=sWOu52thfHd7WBrKFSpRVU597hmSnfuaqU3cOX1RXhJZ+zs5WHAteDZBnrhAjIwKkmvj
	 CxtbYAO1Mq73m1WhmsVcAkrPmmwr87/4Q/24E4M3V5I4G9A7e/yrc9rijZfiDc9dUlShC
	 KgWwQ/9+jJRKaZk9ECjJDJv+oN0i/3qXGuJ8SnpYJb2yhPuacKeDOkregeapLL/gsB30O
	 Qo94KkMH1ZWQ535qefI/ob4+9lMnCM5Z+WvUBTd3GzlzWPjvaO/bIROLXqpUwNgN8MOv5
	 s3SYPxKu51otYOetb2BGYaqDhTzIJGZxVHupdw/ohriMv2emOLV4VzKN9zC1ntneX7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779179;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5MK3jwXB2Bun651Eq7hrE3tVpshhgoIY3bQIF1bdlN4=;
	b=pyauvk69o1OHgPsAV5L7+UJ9geyJDNNa/i5WiCIoqLB0pLouoCW4iWdN8e92WADHkN2H
	 HdwJIq0PyzS81iI8ksjFCPD7GEoNfwEZeoOCUeTLgYx8icFoohfl+MDn+2cczP+IfTs9j
	 m0DKW2PcnWV3cJRkqQl32PuYEpvCVH0EJyBANNE3/oPavEtyZSXswSgJSZGV5pOyA5R0A
	 k8k4BDf0yKJwJY/r/cJaAwU6UDXqH0F67Iq5p/TZb/SBYZwmQhxs/GvxRZViH5qTUQfHk
	 cifcAeZm37vyN6olCayox85Rxmnf2l36fokhmEQwjrKqUyu8IETmUcnaG2Xd25kEObw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NgQqT0Of;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ci0dYSx6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C43606A31C
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 11:32:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11C43606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NgQqT0Of;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ci0dYSx6
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARApYka2058098
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 11:32:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5MK3jwXB2Bun651Eq7hrE3tVpshhgoIY3bQIF1bdlN4=; b=NgQqT0OfSwQ16avX
	XOjIkHa9BL3SX0I6D5+RIXi+i5JopNpxjhTFuA2lwH/XlP0KnpXnb9aVqMK4xCDV
	sks2DpEe1DCToBCrPEBNJYN8wtdE5HTHN+MIpRkOGJlhLkoNbffO/YaGzEbJJr2o
	6cLNURN2IGTInyvUt7ydW2pFFIkTGoGCsZtiO+vwyNjFSqtvTq5AJS1OxMAvpoZb
	Iqjl80oC5Eo7/Iq6tTdKwtCJfhjAof2oGYbVNp1xywvY/MBXc9M+dgVYVhV1uqtH
	FTK+aMwMDBK2IdA94GubnReqNLimTigyxLFbdX6tiG0Maj4llYnxt1a6zIiu8ftN
	rXg0tQ==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74gas7jx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 11:32:57 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-6790b1d3bc9so12911433d50.0
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 03:32:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795779177; x=1796383977; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5MK3jwXB2Bun651Eq7hrE3tVpshhgoIY3bQIF1bdlN4=;
        b=Ci0dYSx6fhtgCIGnA3Dh9XkjaxuHkgDbjfqyoVED2rGE1EqHYaSQqLO5kKiHf4hJEH
         3Gr8J2FXo17JQiZxRyMArgCQIukpV2TWJ+3QabjqHuZ7iGITIVmS3NKxs+iua9LQR3c0
         VY7JwRcKMnycTWuhJjx3a2suEMJILsq2vruZpizFncZBdKhpS181pIml3RsIUorpldOz
         sAdnxfXVopTF0JeFZCNCYZVzeo0/l45Y+cSphir2BozXsPb4VmA4AyOSlUM75BAQVt71
         qeTQbBIg7IZqSUQF4P1JOXsJgN77RoxVnHPGTaa49rUYxbVfQ8TDmmWWlkE0t05Na4mU
         wmDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795779177; x=1796383977;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5MK3jwXB2Bun651Eq7hrE3tVpshhgoIY3bQIF1bdlN4=;
        b=QLmArXTFs6sDMMOsNKlDwhW1yHdlNrmyPLhVqphoixy1rUvA12uv5+S0HIgeyrf/Qb
         STYbf/S/h1JR3t+d3qjRb/h5JwKpiECoSWGwnjqNRUN5UOfiZ60wLcpjLKelddxjhTh2
         ot+W1aB/XHME3ND/wLTzQh5DcVTlplDWsD+FI2yYpcc+QgLMcEoZ3vEdXTotK5142g8i
         nQWlzm5Yd2URPUVx1Rz9VrSk3ByLA5djbpQsSnfbwou3wvr3/X6+/CeYIRwoXczjIbUT
         pWeZkJarx9I+Gl+cNUIRem/skvAmEoy3gPKo1EMisJ1CW05BuStrB25728lOQ06S7RcX
         IbuQ==
X-Forwarded-Encrypted: i=1; AL+hErEB8C3ybRE64fS9tGA9xZkvWeQP8UX1mHjhEiHz1O0wqL9DAMnBmaiunmtSYKI13aHgmtMrfTomCjBJ@vger.kernel.org
X-Gm-Message-State: APuU4Z/wOvJWRiGlqrAlYPPblbO+ykfe+suNMvVcNn08oaf74Pa1tdlE
	xeZZrJIw3WyzBWTlfhitQbmvZJt9RqUgteerOdWWTXaUInYFLwb6Ap3zFzAxYP3iEPweiR6VvA5
	jzRvUVviYJiteS70DLnBe+Ep/4I2/f/CkNvvq8+FXq4Dctd/lZh+/aqKyb1s53tcm3o3M3FXk
X-Gm-Gg: AZFdTZdKN89zSTbJNGtkStY4BWl5MV3CvBG7SCfNlYwzPbj0ecNQ9NUYdLPGsUE1QpI
	UwtOerA+ZFsoHX38Fg1Zx7JB/eHnPJ85pfbsGpDR/I43qWEOW0jS6dzPgnEX4aVeG+VM/06+W6M
	7qZiLV8qksaOQ3nqFO4N/z2BIpRmzhhPP0E93Swwa7nBzAWzubgL8W7GLF0/zO8OU+8H+cXhNgh
	JdD/p4njal1OruFvvILEC+2alRxMUCeizze45LxYZ+89ETJvz4P1SicsojGgklowoRaocEqznD2
	cjRPpdHpdGOR/Rl1VTRN01EJDgqd2J/0uyYyRaWAKJhbMLOeuWqctfT6+RkHE+YJnMfVnA6sXDJ
	WfhJFN7Hrf+wSTKNHJ7WXhWbC8twQ/X3L9f/Z8POsQp+l8efvU9gm/xVJPAXdS+B5+Mc09y8Lk0
	GlhGI2KuKAUH7FiG8P/xdksWfWIvMJj63Znmg=
X-Received: by 2002:a05:690e:4846:b0:67a:184d:3a59 with SMTP id 956f58d0204a3-67df4494d13mr6976139d50.91.1795779177502;
        Fri, 27 Nov 2026 03:32:57 -0800 (PST)
X-Received: by 2002:a05:690e:4846:b0:67a:184d:3a59 with SMTP id 956f58d0204a3-67df4494d13mr6976132d50.91.1795779176927;
        Fri, 27 Nov 2026 03:32:56 -0800 (PST)
Received: from ?IPV6:2a05:6e02:1041:c10:32e6:6e2f:3645:b017? ([2a05:6e02:1041:c10:32e6:6e2f:3645:b017])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab9cf005f2sm38627061f8f.45.2026.11.27.03.32.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 03:32:56 -0800 (PST)
Message-ID: <bb32fe8f-0fa1-464e-9818-b71799a4db90@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 12:32:55 +0100
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
Subject: Re: [PATCH] dt-bindings: timer: arm,twd-timer: Allow power domains
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Ulf Hansson <ulfh@kernel.org>, linux-pm@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>
References: <20261116-ux500-timer-twd-binding-v1-1-58099a54a440@kernel.org>
 <CAD++jLma2AZstGAAmCHRFouwC7fNQB5d3=LTjx42fSQBKsHDOQ@mail.gmail.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <CAD++jLma2AZstGAAmCHRFouwC7fNQB5d3=LTjx42fSQBKsHDOQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: JEgfSbryiMHXWdpEQFX8muoMnZJon4ZP
X-Proofpoint-GUID: JEgfSbryiMHXWdpEQFX8muoMnZJon4ZP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0NSBTYWx0ZWRfX4M8v/XPV/ZpX
 /2SkQ0X6dTrJTG3urJQEbvLpVQI19CmuuI5IygHwPWhFcIfGwIzzBzahsNgu06jFD16XGeO2j9A
 +dgX+GhkPq8Ei3z8/qSLfpqX4nA3qQfCQSiLEI4JROT7UN7YTTB/AtzgcZf2GVCFxOLCSgLqCp3
 HKkCqvloKtSw/3IKSz8VepMR7YD72t0sWNyjYsgyGK7Kp7j1CsO15Qn4QwGHNGPXJdZ6n+zufFM
 JPc7nUOu5/yyWg9WUeDxC/n0y+51q7GS4MNEmB3L8M5azzlwkZI72c/m/zlkbo4f0eEMko9PLlj
 timTS7m1qnPO5WH7M+SX22x65fcieAVlFzneo0ivPQpe/6vNvPCxX8D7Xotp0MSurwDKK4IT9NX
 cEzI+ZqA6h+jIjjQDWrVGLVwI98JXxOY88gvrPe7kLKy3+fg9Z5BbE5Wi+70R9DgZ+RYqj14sZT
 rbDHTCVuOmnQfMHcp5g==
X-Authority-Analysis: v=2.4 cv=I5bw19gg c=1 sm=1 tr=0 ts=6b096a69 cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=rBar0XDY8gZIIZe4CYoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=nd2WpGr1bMy9NW-iytEl:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0NSBTYWx0ZWRfX1i5sJNZKB35H
 +s/EBlyCyyWvAAfOojL6bBblmTic+6053fn5AcLhbBBDTcQHJc65g/xYw5UwtzvIlCZuPDlj6RM
 kBfWxeHoeNlaCjeM98CTujBBgBzZlRw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270045

On 11/22/26 10:26, Linus Walleij wrote:
> Hi Rob,
> 
> On Mon, Nov 16, 2026 at 10:48 AM Linus Walleij <linusw@kernel.org> wrote:
> 
>> Allow TWD timer nodes to reference their power domain.
>>
>> Acked-by: Rob Herring (Arm) <robh@kernel.org>
>> Signed-off-by: Linus Walleij <linusw@kernel.org>
>> ---
>> Allow ARM TWD timer nodes to reference their power domain.
> 
> Is this something you could take through the bindings tree?
> 
> I don't think the timer people would mind. (Or else they can
> say so...)
I can pick it

