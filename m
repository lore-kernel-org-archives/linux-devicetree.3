Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4443647D475
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 09:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790934601; cv=none; b=iM+wVtt3tXA1tbwdwOAa5YDCxUrfq4lq13qPsoZHU4o5aUAs1f1Kt4ZaeHxcvxVrg6IOTgRoCPgvZHFJaYfxZTfIcc473BCsNBpRW0VUcIh8cdbLekwxGg8uAYn8r2KCP8Rhz2r2DUG9DhzRkDw52wIbZyXP/k+QYCbZgtRfPHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790934601; c=relaxed/simple;
	bh=F0sLIblX1LwJTORAx8BzwbeGJ13SNRyBB9uu3B0ACqA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qk7Ol4NrItq26Tgz5u9gTShEmt6C/EneGr/L6kPjNKHpCV+Kie0eKVlPFdk740mMu4HDZAFes1l1G3BjHD5Y66gfNU+zZGnhhbxrBiYnEooPbLNIvwHo9+v/Fe0AcnLjTbzCt6rSCwXfvfdlYpi4WzwdXHZinXU6dHvJplPZAx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KoiWOYmn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UOt9+GR2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KoiWOYmn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UOt9+GR2"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6929nbcD1190427
	for <devicetree@vger.kernel.org>; Fri, 2 Oct 2026 09:49:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mR1Q5bi6LOaKz+4z5fzw6s7JS2c3RQ3jTLLJoeWChao=; b=KoiWOYmnTOOnyP8z
	RrhIaArb0jrf6yayEb1n4SR8GBKjw6fraJDTuhHYU3+jg8dnvpV/eDinoeLlHg/j
	TjLrhNdubY67/GIagsabNcnVmSeg0L4nM8ibHwqj85rYiAj/tWrq9/QzpAQ9FczD
	6pa4Ql3ODOhSIgYhbgbdA8b/zXiFYNJtDJbUbIeWlW5HWhgpUUr3u6PngQF77HJR
	ULilbTQo+SGSTovr3IumjAYe5c5O/cdUL0zrVYxqGeQWurUKBHAjB++P6IxSplWR
	cnP2OD1UAqh/SeVAUXYPr2LTH4J6tFWWQ3puRMRW0mP2A8JaKUGA5Lyky/tF7Lta
	8ETD2Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1w8tjhvr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 09:49:54 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb7f9bb86so359989385a.2
        for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 02:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790934593; x=1791539393; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mR1Q5bi6LOaKz+4z5fzw6s7JS2c3RQ3jTLLJoeWChao=;
        b=UOt9+GR2XeUTP6NwpstOTy+w8O1e9VayUk0KCcqM/Zy3eGBlfI5uxb8gCl9hYUuIht
         +HvT1u6+3tTGp99OS/m1urynsEiQrBf33nkPGmOnf7gzNTU/0gm6yGmwyqnA6PbnIYEG
         kOj4yyOr0jKkI1AImYNHRfkznOSr/lCEC5MTJeBDviirRxttnCR8vCrLLFmUE0xkpdkx
         MnNKRJIP0u1okwnYoBzkZwe2fn87Cvr4FOrfw57MVScHEEyJvfG63vJrl2VTF6GYH2Xd
         9dp5hx9GcHsV50k1Z5Mi6RJTQArWoZwz4lQnv9o3W2e4sOCXwFBQH0kI77WXsgxdbA/3
         wx6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790934593; x=1791539393;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mR1Q5bi6LOaKz+4z5fzw6s7JS2c3RQ3jTLLJoeWChao=;
        b=uAJolw8nH7QLdLF5aydMcr9fC+FlFMtyLWy1XaUrmoWkDZVo5FR8+IOnmaT3TeNABm
         3tG3NyAsx/zeKEWFpiiMX+aw/n8eCucXjM1ITlK2GsguFqhcsA2u0ez0bAzigYzMKs3G
         gSaM1SQ90wQ4X3RCS2QyqAxu9KHfL3dqHabK/Opja68JnryGhv4DedCFNfxqJdotyzes
         yTENMHRwMQYUpOB2dt5E/g5fPa1S9JQynd1Ybd4mu07psliFJ+3BOa8X2Lx01LPWW/AY
         LJKCOWtsTOG29iHQpPGqO+xWlf92fQvG/Ms5ZdabanwCF8UpNTptX0Wzzsm0tUvJ/PpW
         8i/A==
X-Forwarded-Encrypted: i=1; AKwUvBxo5iUNPoPp/FLuvG/n7xMUi5UB0gjpS21UDkFioe0zsVWupHqq8PRxPJ2mUxU+49OhdIBS1skK/MKI@vger.kernel.org
X-Gm-Message-State: AFuF++leNwCPmVezPo15GVtbVsFGu/7mllS0EE3cWlD3aJnssMXTPOJS
	FOxgaCrUElCGuKvV9+bFgguOULCPbc7PwETCUgBbpDviVRFmCdPW8cJ+dV+VCrqZ74/6iXie8mk
	qko5m6FIVC3zMXJ6mLfTFryxFWKqH1A58TfdEgOxPCd3Yn4lvRQ5yRncDYtX66GzK
X-Gm-Gg: AYBFou2JX3erhTAIVCcN/fcexrmpbRnvORQnEgXCFRPfNUZq1VMr5kkgUxlzNc152CJ
	Ef5FdvEOx9k17bqpjOX0K5Q6XeFNR8DB9kxqg1PsE6R6PGjVGTNQn6dyMkqrd3oY7tK/6gImfqg
	3X5ftIRRKZlL5vt/DBQ8qGX9iqAheTykolq33Rkm+RWTz0ZM4G0+QOTtPYOS8dsrBwLcKHkYozn
	YJSG0DZbPrBnwb14l+oo8+Pw9sy8iy+zF1brw3Qol4uFDuZGSQDFIPAmbqSCVOYyNuQC2iWgaJa
	oezVFIlTGHEdv6ojC/VYAjzVgJkb/xsGUNp7B+3vXwJ5ejm57P54/g1qBeUa1Tiqac5sKK1yXum
	Xi5ZFfuXUB5QTqut1ej82jws6F4AatB5OQysFlWumXk6jL4ne+chnQHM8yFELfQ==
X-Received: by 2002:a05:620a:454c:b0:93c:6abf:c8ae with SMTP id af79cd13be357-93cf1791c20mr326872485a.50.1790934593151;
        Fri, 02 Oct 2026 02:49:53 -0700 (PDT)
X-Received: by 2002:a05:620a:454c:b0:93c:6abf:c8ae with SMTP id af79cd13be357-93cf1791c20mr326868685a.50.1790934592654;
        Fri, 02 Oct 2026 02:49:52 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:f14c:b716:c104:4712? ([2a05:6e02:1041:c10:f14c:b716:c104:4712])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b82253e5bsm3914595f8f.1.2026.10.02.02.49.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 02:49:51 -0700 (PDT)
Message-ID: <8eb0b435-e5d4-4429-a807-24e15b0659fa@oss.qualcomm.com>
Date: Fri, 2 Oct 2026 11:49:49 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/4] timers: Add support for RZ/N1 SoCs timers
To: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Thomas Gleixner
 <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Pascal Eberhard <pascal.eberhard@se.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20261001082225.125956-1-herve.codina@bootlin.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20261001082225.125956-1-herve.codina@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: OQokEIwD8kcHWt6qDmN5iLob-SWIZQJ2
X-Authority-Analysis: v=2.4 cv=ML/1C8Zl c=1 sm=1 tr=0 ts=6abf7e42 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=v9AyLkvIsLCxcgOLbSsA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDAzOSBTYWx0ZWRfX3cYhEvVHmdka
 l0nTu4b47ctkRrp91HSzf3y9YbKDC2lsRkhoabYBLsInuKk4K+JHr0zvHIsQPDL6hN6imjPtVFL
 DmKRSLSlC6kIJ/1m//Ih132wPQ6oUeOe0PRpWdmRp0JDVufCd2SjXju67qavE20QDcywLwwnN+F
 HtqaAPVQxlBQy15QkdTyO6PowqkndiOoAxPTG0n1M+9N+CUqpQLORk/4UQEknlVUD0ky6AG73qy
 Yc4gbujz4REbuGL9N1fLxkbJ38RPLAmyd66Zr07bXeNoiYh7CgiK+AecvQ9pl1LxczQ8b57pFdI
 P9BvfYGIFm8/2Kc58zEkyy46J+t529g3X/kyQvxai1ZtUkPSj9QyfkZACJHUWUz7deCqgujR/+P
 BH3LaY50M11X5N6j2vseEBv4AIoHoxnJbOH534BFxPrwl1aPiinGfp5L+LuCQnDmpPOeYZudFje
 md36PUdvOKMStuaprIw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDAzOSBTYWx0ZWRfX8k6SecAzA3dT
 iWLEKnleesX6gtWIY6IcL5J0q/M3+Y1UlZu/mp9FA3U+0rpBxJjYxOd3Hf39z8haNQTuVWQRNwS
 cXhlmI7b530yQtF0PW/aibVYIORZX5A=
X-Proofpoint-ORIG-GUID: OQokEIwD8kcHWt6qDmN5iLob-SWIZQJ2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_03,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 spamscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020039

On 10/1/26 10:22, Herve Codina (Schneider Electric) wrote:
> The Renesas RZ/N1 SoCs family has two timers block controller
> available.
> 
> Each controller is charge of 8 timers (six 16-bit timers + two 32-bit
> timers).
> 
> Each timer has its own interrupt, its own prescaler that can be used to
> divide the clock by 25 (timers block are fed with a 25 MHz clock) and
> all timers can work in either one-shot or periodic mode.
> 
> This series adds support for those timers blocks.
> 
> Best regards,

Applied, patch 1,2 and 4

