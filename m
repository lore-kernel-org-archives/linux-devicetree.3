Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3266271A71
	for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 13:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782048369; cv=none; b=BhDSSFGIvDrLwziGyBOdlQ7GJZVuSxXl9vus5fPivCRC5vj0O++HlRVqXn6BY8NErGL28rt248KQwruPzcdO4StqJtF2DSt+wXM5IvHvLZ1TCQoIo0K5I6g7M4RO8WqL5hxANHFZunZK1D6CK5++cZECJ8hv+6j8JRbENU/vkeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782048369; c=relaxed/simple;
	bh=sxbJyRUQvldWAxJc7L72BkA3Q+j4Xzvlov4wtcHv4RU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=o+Ezl9YbAKxEyUpDNu8ew2MP02Y5Bqxj7Fb4rwSlMHOXW6mPxVYxwuEbU7Z3/B93rxy5YDfFshA+JXyAOl2ImGfuuAf8Yi88vLroGSAdtMIMY3ugatr2jtWwq6TCABMNcJL/+HuP5fwoMJh+zLQDl5ViyxZSr3tAxpIekCo3DTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zh59p1nm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j6LKl9nM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zh59p1nm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j6LKl9nM"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65L9vfH81845887
	for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 13:26:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+RcTKE/9DoE6dBWweLVTGAqtmWmBxPGlNR4Xl8V5Rtc=; b=Zh59p1nmikZdSUOZ
	Zd4jxV4fmxFc0xckXq4X0b7TMeI1+ROR4AD0p/QoPQvdsXpAxgUAQuHCYVesN0UQ
	0njDQqeqxzaxsByD5MIhntIy1BZNE1CTKA8pNkRlf3VUHfw+HErs91q2x3jlmH6C
	55cRaREkDXWPpHqK67Y8yPf8znEqYxpGAj6um9yF3ZiEde7GkbZOZYnm79UCbNiJ
	OLLeeFcll3nR8KsSv03MauF3EW0Fd7nmRAKPoLIZtMu3eSTGqGetYS6HfFegtdUG
	xsFI0ols+/WjVFiYkqv6Hza6uYtU9BZ4KDpneHmErddAxTRUvvpXlLjNTeIsrT5H
	bcjB1Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewj6h360t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 13:26:06 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36b982ec338so3577131a91.0
        for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 06:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782048366; x=1782653166; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+RcTKE/9DoE6dBWweLVTGAqtmWmBxPGlNR4Xl8V5Rtc=;
        b=j6LKl9nMSX3ynuCSG8ANoI2KCJAL20IGKoHilrl9DyWLBYdkPZJObjKvK7AuoJTQQU
         ZdYKghBH38YcKnjFpOvKZ3uMXPhH6d806pLan9daCasxOEfNghLi6pt6vwbNcEayLZES
         pVIAFFoXWRfvLEAiY3mdAhWloz9g70fZPet1dmifT5zEKz0eLdIlRDrrVV5mSGr//qPu
         r42m6D82hYUP6rd7Q1YT5eqZBwiHgdGjFBCPMCYRDaNYUg8PsB89uhWSM6Fy0FUd/Q+c
         zrZkyH8jpbI4USn+zr2ZhDVvNYrB/WV92VuakiiMQXqg5/LMGBacse+IcVOfiXsUtM8C
         NgPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782048366; x=1782653166;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+RcTKE/9DoE6dBWweLVTGAqtmWmBxPGlNR4Xl8V5Rtc=;
        b=lnl9jrgLKF1IfmvRNfXACIms88VSr12DKFHT0JNLV6qeoVXiCbj3D1HVCnusPSGrJK
         FJ0pJlT7JvZVnHAJnWx6LUffyFz2Du7IdFLxaCG09aPtfyqtAGSiSuchLZqxknzAm6/I
         cFR4wbl53siW/GdzS8Sw6V1ePYGUVVJ6jjQwtKLYGhbJdIVj5pPDiNGeMsEaSbv+qppu
         fd6Vmur6Hf+Xrao+xq3QwRsMilUN9F/pV2uSdCqiYtaEY+MYm9K1Ngl/fzsXEkKJAMD+
         MtSoohhgH3jS/vbg5RixOQf3nwERSFGTbPhCfJXR3xHeJNaqRbstO5yeia5I8mj9+KEq
         8nxg==
X-Forwarded-Encrypted: i=1; AHgh+Rq3+LBCSekjvv27oZvVj7b2VV7npyrfOUVA44zkvFq99qS2CeFSPg8qO9pcKHcz1POHTcwg1K4npx7P@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0/l19gZNlDkaQsdaiOGt1DhSNC5RukufVEnl+MWdM0eERNAWy
	S3hbWuZGJz5VvS+qnIwWLSjr+dHmIvzv53vQ3gBc6t3AFDtm5ux2OhijI7ZCdYPrcpyKSvObZZi
	MEGStP5XGAO/r2t5xQibllfVyFO0kjSd3+6OpTYeK3n8m23XQ3QWjXEGBV9AWz3bU
X-Gm-Gg: AfdE7cmhCrF2QNuPE6zWy0it3bHJFesZnV5VC8j9HoHpzTyOYwQ+GL4fAa9GOjZkncO
	aqS2ePdM6HkdSH0WLhnWsrpS4PCKSSAxhJagN9EaHeEvMMVfPegg7zfANDkO6DtqbAz01xmUSFe
	obzBATBaZj7p5nhkKtMjVULbxN04yUm9Pw0TEmdq5ckanYKHp6LdSZa+kaz1S3KsvzF0UGUv2Vp
	p55fzbdBNSrZXnYcLvNFqC1B8G1yYBc1DQjxr7188tJAnLfR/CpahKObIQk8N8+YXeKIJstH8XA
	xl2qlMZfICQE9UgrP/QRsl66/StcGh3yIWQ9SG8Y/Mt9ypmrctg42h6fY9SzTpzVwzbV0qYXVk1
	zSYcJYdJzzYg4ZGXBSdAK3cIIL9m+EzhnOrUSAxtN
X-Received: by 2002:a17:90b:5708:b0:375:2a38:1d40 with SMTP id 98e67ed59e1d1-37d1617a684mr10789838a91.20.1782048365876;
        Sun, 21 Jun 2026 06:26:05 -0700 (PDT)
X-Received: by 2002:a17:90b:5708:b0:375:2a38:1d40 with SMTP id 98e67ed59e1d1-37d1617a684mr10789810a91.20.1782048365428;
        Sun, 21 Jun 2026 06:26:05 -0700 (PDT)
Received: from [192.168.29.32] ([49.43.225.115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d4f2d2615sm4469608a91.10.2026.06.21.06.25.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Jun 2026 06:26:04 -0700 (PDT)
Message-ID: <70f37f20-dce7-4592-afb2-4fac6d7c513c@oss.qualcomm.com>
Date: Sun, 21 Jun 2026 18:55:52 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Subject: Re: [PATCH v4 02/13] dt-bindings: clock: qcom,qcm2290-dispcc: Add
 DSI1 PHY and sleep clocks
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>,
        Ajit Pandey
 <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
 <20260604-shikra-dispcc-gpucc-v4-2-8204f1029311@oss.qualcomm.com>
 <20260605-eager-lynx-of-eternity-f77ecb@quoll>
Content-Language: en-US
In-Reply-To: <20260605-eager-lynx-of-eternity-f77ecb@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIxMDEzNiBTYWx0ZWRfX6gYUtN/VS2q8
 68nrTzNuCqa70OdPuahY7CN+1i2DE77gmmOoeZ1s1ZN6QLx0XPxbKuewgTrDd5fnVAt08JSAnBs
 Nps9+tI2kcjPkT+bD00n9o1YQ6xVvo3nxDIk/JQkoLsi3YT8XQTZ+SzAVhsAQQ0SOSBRDoxx5kB
 6eX9o5/u0TnO1vG5WXFhcKX0nHovKb1dGN4nFdyucRyestdLRHb5a0JYndbGpPhz3aEdcyR9QIS
 gYiUuS8KE08a72nhBj9Sk7VY8/rT4XDGe1kAzvGtVXsrkZWyRjgskchRndKjNb6zuBe1zMd2EU3
 I8H8c31H0nwzfNWPJVTS9hQQ8rVk1uxZRjtJhXHjRQiYnr8Na/XND6F/cpTiie0kHKgSWGyE16S
 twA6HgXhlns+m9pOzszFlHhywa7FSuCWPDrYHUOHhRT2vt8Q2MM7t9aoSKTvrYgDjXVHQLrr740
 oAjXLUUM9paWw7yuO9Q==
X-Proofpoint-ORIG-GUID: mDkO_M21av_1eyRdzz9Lg45neiqs9JUC
X-Authority-Analysis: v=2.4 cv=E7P9Y6dl c=1 sm=1 tr=0 ts=6a37e66e cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=HwFTmRh04JSsUSWzyQ2edw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=6Xi6mpGAEk2f3eWU2LkA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIxMDEzNiBTYWx0ZWRfX5SQo/v/G3/82
 CidQN+eq3mJXUXLU0sapSqriAxLDa69/BvB/HmirKcTHqGo90q6oAdRpKKsPbwSbPBq3yVanBpZ
 CYLyRdiKv0zl6PJgH3mTCf+rnsVpr1g=
X-Proofpoint-GUID: mDkO_M21av_1eyRdzz9Lg45neiqs9JUC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-21_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606210136



On 05-06-2026 03:53 pm, Krzysztof Kozlowski wrote:
> On Thu, Jun 04, 2026 at 10:56:08AM +0530, Imran Shaik wrote:
>> Update the QCM2290 DISPCC binding to document additional clock inputs
>> supported by the hardware, including DSI1 PHY byte/pixel clocks and
>> the sleep clock, alongside the existing clock list. This is an ABI
>> extension, and existing clock inputs ordering is unchanged.
> 
> That's ABI break, not extension, because you require all these clocks.
> And "dtbs_check" would tell you that it is a break.
> 
> You need to provide reasons why they have to be added - something was
> not working? Something was missing? Did it matter?
> 

Apologies for the late reply.

The DISPCC hardware supports additional external clocks (DSI1 PHY 
byte/pixel and sleep clocks) which are currently missing from the 
binding. I will capture these details in commit text and update the ABI 
break details in next series.

Thanks,
Imran
