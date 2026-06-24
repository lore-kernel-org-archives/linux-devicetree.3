Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511A935E948
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 08:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782290103; cv=none; b=hB6ymhNPQMWuQjiYo+sy3wZJ7w7YyfmzItdrV3sh0Lx+bYLLVlPUV0wqh112H/aTtguLq3CRdKUEMKzFi1ZJt1QQb0dSt8ZOE0dTK0khOkzvCUFQlfw/7nExgNX+yGQNnrHKHTzcQGSup0OMADF4yMNmTGQ/FO2fs8tei4gIZeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782290103; c=relaxed/simple;
	bh=htoxQB7Zr4deDUOX4Mg2XTgZsnaZj1b8ci5u3iYnfP0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=otrbwXS/peU5N+/Z8Lo6bs98g5TsJJfJJtsu4Z0z94VHIItpn7xvIWC5NmHZBKBcpnQwY6e7zF/mkTyFKs/zsn0mK9Y2pi3Tt20OtPpF8wZgBpvHUYtl6U700PptzmhPIz9llgnRr9J1Av7zrul4gH9sWPQ94kPKFQJglQ0RH8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RhSKEbPH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gCzcj/+b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RhSKEbPH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gCzcj/+b"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65O7FhYX2439241
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 08:35:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5mrd230kpk0uUu17irqvk0Ds0ZSnBgyPtN1TTgwZ7Z0=; b=RhSKEbPHNn8q8j/e
	lguLjB8G1nVkkg10CM8wZv7GhiT4Lo1Kmz1HuUTwjC4JHkfUqJTV6uBCbb7WVWQl
	ne8p7cXcbfjslXvAqYatgyXP0dNERwSRpMXLLbTFKv1Z5qyqk3CcjfONNhsS/+uP
	b7uKVVMp0mRt2r6BURikDlmZ8VDYOY/rDACDaX11KOxRGrd4wunDZT2waN8iVlIV
	QwA8Bm0VoPMmDbC1mnbyqT84iaIxYTJvxVtSGiAfulYHd2GQzfVnDQL/qzRlyblS
	cVcVw059dQfoHO2TQBeyDg6jZ2BgNq0Ol+m6jDuH53FEwpp9l/3fXCBNU5mQn/3Z
	CVIKzw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0apq08xg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 08:35:00 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8454912a507so1524243b3a.2
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 01:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782290100; x=1782894900; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5mrd230kpk0uUu17irqvk0Ds0ZSnBgyPtN1TTgwZ7Z0=;
        b=gCzcj/+b+1jFKCLmVQeG22Hf8e5m2YoXqb4vrpn1TaP/DXFwCz4T/ICfxpYrokXgcP
         pzuqmnPsAJfNlMTfBN2YmmjiYqwh2uzgS9We6ZGFbxYnxeQ3bZbI25Dod8RUe9cBqb57
         baVwtFBiHehRyyVoSXILtbc8ByQ+LCSiDnVCsHYlQaGmmtEcW/ZKlGQmof30Ly4d+1xx
         NfarvzkhUsrkGxY0iwYaFRA0b/fUgy0Ao6XFUHFs1Xwa+Z9tMGFQCgzhWOrpMF717bpb
         JIRNs0uz9bgnQWH02ah5d3lzQOKcDK5EaxjsPEoQbxoFCPx7xvOBF/bpy16KV96pFRR5
         8/Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782290100; x=1782894900;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5mrd230kpk0uUu17irqvk0Ds0ZSnBgyPtN1TTgwZ7Z0=;
        b=CZ1mQngNHq7H1hQ8MgpiNh2FYr9SzyXoubwl4Wiu/ITQdTjoPKyvnySmg2zTP85uxo
         p1Rx+ZghrcEwOawIfzIz99dqtHAF2AgooKsiMKSTZMfzoTXvRIOUfNVssKsT2DN+UoH4
         +a5ixQiJpvs9doBF9EeYSmiWVzaGL8n1N6ROmmoJPT5d5gTuPjHdyGEH95Oo19FN+N+N
         f0e2TCaZ80coFM9QsrLHCkE/mYYrCLzQiY43MeCB12bMv7YPee8g9N/ra9qBgfmo4qzo
         kf/qATNbhntGEePPPl++5I0iv+oda6yndiHZcLt/eM2BVpz4ibo3pbifaLxY1AZjKKx8
         csqQ==
X-Forwarded-Encrypted: i=1; AFNElJ+1hSCrOQKKdH3ITYBg6sxUJMXMRxPhKMBUE5NwJVX4QVN+eiLqr4ZduWTOjnI4a4ZzeaxmA5SawffL@vger.kernel.org
X-Gm-Message-State: AOJu0YwxicQPyszjewq3GShRoNMD1bmvqN0HdBBBm5i+oiicdaUBbpue
	fvB+o6Xu1YupqAlUZt7xJCstpXKfwcDU2qNOMt/c/tjaNTgMbuMSlZplWrqnvOQ3VrV2lgUHaPY
	pKXS4sTlaZtxxk0L0gUTCvk2Ss+9APiIj2SMgEhu3LT9TIk77qZZeB3S260jzc+HS
X-Gm-Gg: AfdE7clIpBjQmvWYOkFdaIeOMDPOYvQz+/nNO22IFaghgQs++K6Y3C+eUQNupmGEcIn
	3ntR/PXLWbrC8lan272yuLSmXfz8DmvIUXaxfV4yj8qufnOARcmzMlGJXktuRfKRWB72wkXNy3r
	OK+Z97Li5lMRKAa20dvu1wV7g3toaKmvKE2LpXx1L6jjtflGomKA3tcHg7Iy1iK6wbuDDnS7sol
	DMuvSuyEd2TcmFobFKA76mOWieMSlFqMohjSdG+CS09qfL7LmRUicO/2n6jnrH3JD9R5UeA5l4Y
	JBhxW5nasRh4Tz6pyevebnuw+ZBFZ9So6xeEx1IjjOFUhO6LVg3IpzO80KPeJDa0KeVHGbREtev
	E7MypWbI+v0aWgerezrOoP1coNooDTt9+yPtxdGsWGr3suw==
X-Received: by 2002:a05:6a00:b46:b0:842:7992:bdd6 with SMTP id d2e1a72fcca58-845a2cad138mr3014607b3a.36.1782290100039;
        Wed, 24 Jun 2026 01:35:00 -0700 (PDT)
X-Received: by 2002:a05:6a00:b46:b0:842:7992:bdd6 with SMTP id d2e1a72fcca58-845a2cad138mr3014577b3a.36.1782290099604;
        Wed, 24 Jun 2026 01:34:59 -0700 (PDT)
Received: from [10.219.57.229] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a40f4722sm1628731b3a.43.2026.06.24.01.34.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 01:34:59 -0700 (PDT)
Message-ID: <c2bb7a24-e1d0-4308-ab53-208901108a5a@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 14:04:54 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 04/13] firmware: psci: Introduce command-based resets
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Sebastian Reichel <sre@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
        robh@kernel.org, sashiko-reviews@lists.linux.dev
References: <20260514-arm-psci-system_reset2-vendor-reboots-v22-4-28a5bde07483@oss.qualcomm.com>
 <20260514212353.881AFC2BCB8@smtp.kernel.org>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <20260514212353.881AFC2BCB8@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: nzbGMSCnxwCGmuq7mys2eD0PmMBsuEww
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA3MCBTYWx0ZWRfX/Wjts3R1V0Ka
 tHyan+33VQn4AMHj+4ny/Ba8ekVNvdvKyoHVNHfDZC3L7hrIWgjB5appF9JK8hdexEL+MtKdd4r
 QdFgRBx02oyMOxSHcfKqd2ayFtelJY9FtlJcZaeMvMNoEhzMqxDCAo89fc8op/JAIChhiDA360B
 oVabkQ2bsH6gs+HpnD9PTA1fLFGxfC006VZBgEyvepl2mMGqf7f/c7MNlkxjs8L271JkXehTI37
 mALVQlGI7B2mTPoaH4J2KiuN0GK11idczzhCMFTAAdkKqgMFLO1g+T/SpLi6wdBBsO/o1skSg+/
 BLPJIsUZQaUogRKuHbqQUwOg73EzAi03wXIc7392fsbGgwvlN0iFu6Z3mGDZBr6B+VOvd127K/t
 QIagjuUYvAou/Z3kzY4eUR+/+awlok1+pGU4qy02ryH75rumeWvnqkVKK+6+M70LGtqJNwI0vvC
 3YKu438OG2HeHf7VLQQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA3MCBTYWx0ZWRfX0UYUEEfKPtnk
 1Bh0pCyv2F+ZAn3WRuyZNVNKukcPDMe2yX7JdXKqYmN/9oRntraFL1WuWupZEi4HdmbT1hwIeMz
 lw/9qWFYE4J568SiJ7DKNXV4ZrooY5Y=
X-Authority-Analysis: v=2.4 cv=NpbhtcdJ c=1 sm=1 tr=0 ts=6a3b96b4 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=Mda6OO27nty_hdtp-zcA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: nzbGMSCnxwCGmuq7mys2eD0PmMBsuEww
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606240070



On 15-05-2026 02:53, sashiko-bot@kernel.org wrote:
> - [High] The API illegally truncates the 64-bit PSCI SYSTEM_RESET2 cookie parameter to 32 bits, violating the ARM PSCI specification.

Hi Lorenzo,

Was going through this comment. The patch currently uses a 32 bit 
cookie. The spec also talks about "SMC64 - uint64 - cookie". Can you 
please suggest if we should add support for 64 bit cookie here?

This will require a re-design for supporting about up-to three 32-bit 
numbers in reboot-mode framework.

thanks,
Shivendra
