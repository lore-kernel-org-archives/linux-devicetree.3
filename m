Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824353DB641
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 07:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784792419; cv=none; b=ZkfG7p2eFX6owUk8f9pLU9IVov3x08F0ASN402dqL8Qnd2nkbFvijc/Jp74s9rAyxwTknEoOa9Ho5OCRCnNXhdaFLRsJWwYrkkneTOhX8arkrcHYtIPWJcHFSTnoDML0d2OdFVqQbjqtwyvhhUFQySowFqNSKB+OpQMDghr3vVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784792419; c=relaxed/simple;
	bh=87kbs2npqcqvfJFySp/OWE/pJx7RjfrsrY3bV2Ot88A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M0UwsqmPh6QmTOfGPQBgHtX4GUd5E17TKY/GsW5I2+COIH0mJo+5RGfg614+Ih0h6qwLzWUfIzMjJuFBtq7EJ9RZT538P6EWYAa/fF5/h9g567e8KRKInVZuLkhvNFrQCzrauQnsaLtoJjWY7RIKThkrEx5R6+PRhUwOgl92OSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gbkpRXVa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fiTzx+5s; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gbkpRXVa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fiTzx+5s"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N7Bdtu2815263
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 07:40:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ISzK1DEaHk+EZOYCpng7ILO6U3frD4mricOPPefehcg=; b=gbkpRXVadTWyCcVj
	s7AMcO7zkK0PWvwy6BuzZjeetuDFHMozlpkN8PdRy86J4tq7P2u9w1/6/ww9EWuc
	hH3xNV79Y78tUmtOB5DnZgde8J6mctvJXwkXdGBrUZrk3wEpFGVy5B70IpYBz/bz
	6O8uw0GiMEpUe8zgX2djHCeELv+ieaPHaGFANVURZj8UuSHyTU4bg8MNUnd7Wl1c
	VURN8BKfL1bV0OJuxnedHz5mM0a4l5E9ZP+FHQIwLI7HsnxXk0/dmePOWX4tbxw6
	H4vZ4hkeDk3sXBet/7B/dsFL40TvCeDC9kRiPQXt6Tij4mD94eJZKQKznUtV4jUM
	vVXX9Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjxmgm08y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 07:40:17 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ce7dfd33ffso7350165ad.0
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 00:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784792417; x=1785397217; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ISzK1DEaHk+EZOYCpng7ILO6U3frD4mricOPPefehcg=;
        b=fiTzx+5sFSAwBZJXcb+cK4v7pCAk81H/f4Qrxn/EUHqRbGFeQqP+69dgme77tW+1RP
         hAK3eW3TCkMhUr9jJ0ehyl+yZrh39hJVYm7+98RYWl20XoKruit3WqTBqBcj53xAvf56
         AeOJ+8cIW53mVtcM86EQJ7Hu4eFAg9OPJsuQJSb5hrt1tvYpeIpf2ZdfccRG/dkXarRh
         NacwSixUiq9Wie9J7Tb0e+YegjUHPeQ8jtWCDUFHAHIqa3hIDP1c8EmrbTN8ZMpKHmKd
         bHbKUkALRabKsuEE/7alhM4Qwpr56X8f02kQDkYyUD8L/ZPjyJV+kkKnIUqxrlV9jQU/
         zocA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784792417; x=1785397217;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ISzK1DEaHk+EZOYCpng7ILO6U3frD4mricOPPefehcg=;
        b=Jm/1sFt+SrAAbSwi1X/oG/TTqPz4r23HjG/wTMtCyFeAx/efan8djGTbrKTA03BGfJ
         2/Ebr3+RADDU/DE5xWKEstNfHCAWfsoG702rzlBZa8Sr1ALK3A/Kep3Wta8l8ATY+anx
         FPOeT362HOTQSLxgGd0WN/l3whH+nMnpiEe4XxPGCPebMBTfhj5qxBjSZZ/eqdcTFbxC
         nFR2D0xsv1eHGus+gxw68+Wds3DmrvU+aHQG4LNund8AyUjh7wgbRjrTyHbl44p0VWI7
         PttWF0WdSSNpvtdbWsmvyoT6r518e2iyHx+vAub+m0Ed8Xq765HBpieI6NMRBQnRP9Yy
         QVzg==
X-Forwarded-Encrypted: i=1; AHgh+Rq6fKkPjYCgfjFL0zVgLEOpKPkvz4SwFS0ZekfFgMbnaIZ94EQsTh9mMzmx40aDWtkky/85HewaRHGq@vger.kernel.org
X-Gm-Message-State: AOJu0Yxui8fTpxUoJRdc3KWC3VGXPW3Jj5R//y4enqdYzU7S0crmszvx
	+GxvLdpL6Iv6OLOP0gB29SI7wVJWfSd40jM6bywmgabWj43ekG6kBvE/xzJibnET1GmghXbFHbW
	giu38TY0XPEwPaIYGX9IbEjkMAM6Ccu7VZiWExQoiPcBk+pTogzPZKUpxJOHUOsrR
X-Gm-Gg: AR+sD10iBP+w3GVVwIW/wROeTgiEbfs+/rg9FKV2N509a9Ky4i1DblYBB6crCSIwxy4
	r7H4b+yOYzCyq9V+QkXEAsSmLb7bENIsemh67OrB44hlsB273kCH+YYYkkYUXpkHfsUYg+b/65G
	Tvjgfdy3hQ1qsfz1cYIuyVBipi5pIvSpbc2+wPgkxrenZUrpNQXJIyXNRKbmOkecA0o/bcafseo
	Lsh7XlvkeVZO07wOaQ7JvQ2Z6I3+hMGNc+ih3UlBEyFtJogsv5LHZZ4vr/kgUQ/tTGM5gQU3fnt
	XEpFKrgZwYzw/2u+46QmMSpQWM8kT3TzwSPSBjgRYZPOmJUWCjTaOJKFGiYa648FVJgKB0XJSLl
	L3kAtdp9p08XgE9JkeOVh0B72lGk4PxB5Pw==
X-Received: by 2002:a17:903:41ce:b0:2ce:8e70:3210 with SMTP id d9443c01a7336-2cfa7436e9fmr24584785ad.16.1784792417170;
        Thu, 23 Jul 2026 00:40:17 -0700 (PDT)
X-Received: by 2002:a17:903:41ce:b0:2ce:8e70:3210 with SMTP id d9443c01a7336-2cfa7436e9fmr24584415ad.16.1784792416640;
        Thu, 23 Jul 2026 00:40:16 -0700 (PDT)
Received: from [10.92.198.88] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efd8a9csm28597255ad.30.2026.07.23.00.40.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 00:40:16 -0700 (PDT)
Message-ID: <1dec53f7-53a6-4905-be0f-96c3acee8938@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 13:10:10 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/10] hwmon: Add Qualcomm PMIC BCL driver
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
References: <20260722-qcom-bcl-hwmon-v2-0-febe2805e17b@oss.qualcomm.com>
 <20260722-qcom-bcl-hwmon-v2-2-febe2805e17b@oss.qualcomm.com>
 <amG0f57O5-e_Qg5z@monoceros>
Content-Language: en-US
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
In-Reply-To: <amG0f57O5-e_Qg5z@monoceros>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=D+V37PRj c=1 sm=1 tr=0 ts=6a61c561 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=BWQAxAc5KOlRlpeuKSQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: atcgDckbx5IIqRNHR5tcrxhX_INPvk3k
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA3NiBTYWx0ZWRfX6K/TTJfWkYvA
 DhGwOhS9s9UHVbESYAp9ZPtPSqdPbgW5JlPgoFoPatuOMECDc/OBU1b4f8YBbAM58y8KixCHzWM
 Xnn9JtnEuHwZ7a71EdBbDaKOuPFAse0=
X-Proofpoint-ORIG-GUID: atcgDckbx5IIqRNHR5tcrxhX_INPvk3k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA3NiBTYWx0ZWRfX18NBSpIiSaxe
 rCWb4daNGZjjCF3sUkoYhFKem44Ygl5a36xoAjJzHVrLt8tJ/OzzEU2X24upGrbHEe8MTh3Jbq7
 yE4SAhppFvWGYxJbAvB+U6lzz+RyEZsiNOLK/S6TzwtZsmH6OwVE2HkuzRNrRe4l9uFoMuOwt8l
 /HfQqqLUN1QWOsjQo/ZZUo9TlZx4FvsYuufAmMp7ZbxJAeLv6dRAHZ6+eEs6adngnt2FCEvypIv
 QDQDI3nxRkd7OvxebcVC/TEn2zc+s91qYrzYLreBCso41ADQmJwJwYCKGoZRKiRYbBfr2gYQxLW
 T80kM9RLr+sERcAsrvvXQSZUoMc3BSNr/oyViCOdnBEUlbSBW4HRYfaMDrxItTF98aY3/9oU2NJ
 Lyx/VjcTsXl4wa086ayvfs17npTJIaW5Dg+rGR6u19m2haCm3NXT0o8jTevFO8sLUlyX7qODNfv
 /uK+Ag21Jx7xXXB65tg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230076

Hi Uwe,

On 7/23/2026 11:59 AM, Uwe Kleine-König wrote:
> Hello,
> 
> On Wed, Jul 22, 2026 at 12:00:07AM +0530, Manaf Meethalavalappu Pallikunhi wrote:
>> +#include <linux/mod_devicetable.h>
>> [...]
>> +#include <linux/platform_device.h>
> 
> <linux/platform_device.h> already provides struct of_device_id and
> <linux/mod_devicetable.h> will go away soon. So please drop the #include
> for <linux/mod_devicetable.h>.

ACK, thanks for the review, will remove it in next revision.

Thanks,
Manaf

> 
> Best regards
> Uwe

