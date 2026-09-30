Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2B051354E
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 14:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790777561; cv=none; b=n+4Rub4AYLEuo9SZdKEjjrkVHMR5SL9YdRpJDpCNyHj3Na0up3jPsCSM/cfiPFhMnCH1tK2yCAgb8/hHeuAOXJG3MhXkYtw8gRV1wWGelvSXQdEuyq9ymnaaiKE48qU8t9wrjCaDIm1accysbf7M/AEs+VA96vLvm5kw9MzaWH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790777561; c=relaxed/simple;
	bh=BAfVVG4YeNyLYWswmxxI4gyFcDhsSkcKNuXMTsotkM4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MEO+TQfgVKhU1IqBqxpVN8O8hhnUpro7gApshdS/L5P2TnZm35hK3kNkKMfC3C2KkcEuEQbs5pu/pxgQGW0WBRTjAP8G3v5rJugv0TZWi7qa6Qr6SZaXIIpZJFYQzbRF6wtWd8HlITPJjrS18pDG4fMKxvgSMlNrt5LaH5IjVk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LvstrZ3F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SJb0h/Iq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LvstrZ3F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SJb0h/Iq"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UE05aZ3942409
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 14:12:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GmTEgmvcedeaRztRcqF8ocCncIDFUGQAfG0sHwoFEVA=; b=LvstrZ3FmNqKMCU+
	YOINyttxrcLdo6zYFXhCPETIYunbXuJyuTqRGDLu9Otuqgap/pqrgWd6vcZ2SZL3
	mjLol0XuWqD6dWusIvRgwWSAyxSWT/C+N+OdgjeV1jxx55YwDlHQEaVtafWpvXSd
	LB7tyGOd3O8MAseyX0xzFMsFgChrnqw70H1sDxyn2R9WkoTcUBatDC+U9nt7iYMD
	LEpIQCVeJFvzlH16r7yEEG/MEM5fOve+umiEgAmbMOhnOhR9mRT6jZ/eDpxzyYvR
	VSIc/Tc1+c9t99ivi6EW7dBsOTZG47ZhxGgG+ctpWAUNMlYReI7vHi3FzF06a5JL
	293foQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h10bk91ka-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 14:12:24 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2df8cffbdbaso37469225ad.2
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 07:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790777544; x=1791382344; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GmTEgmvcedeaRztRcqF8ocCncIDFUGQAfG0sHwoFEVA=;
        b=SJb0h/IqPhYfCNsszodYdNscoGMzt4GEE5l3iZQWYbx2+iStT/LNw9A9amZy7uQAyq
         qe1FL+cGm155UI1MkJChjUbKdlYNRTqC/riBkrGBEr9KMtf1PKEDFlwWzzTnRp3Jee1b
         Haw1mB1IKEY06z0tMn1t1SKeVWvc0ZSdjD9thr+ta6q0GJ8/jAknFbqjQyZeQWP61MFZ
         iItLO1S7zBMqBMFIwrQfk8uuwD9SqtMUCNtBubHdbmEFkBlJd5hDigKlr6KP827KZqjZ
         k3f+ZKXo5SUv4qBEUTyXfJED4toQAKJnzEFrE8GyDZ/LzbdfWcWTAB7aQl0HiuNgdXUX
         FO8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790777544; x=1791382344;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GmTEgmvcedeaRztRcqF8ocCncIDFUGQAfG0sHwoFEVA=;
        b=sOFmRZ5qCtRltNudAyLyQu8/dWxBRCNq7KGIsymRyYfDvbE2chCeodTl22lgq1RYXx
         ZECpuj5eHa00E3d3MNhuDG7GS2YBI/FblzHFwnU4avRRKSNBXVkyvCrrQhPpwDXNP1m0
         R8E/Zpq0IGaz7R56ufudPUWavmt4rgyV39F3uS1ec/LJt32LpK/WnQvRl8S4Lu+v7j1v
         axzB0Y8N+tEh4uy02TheX63nBvhrJmBuUHKosQn+ZevC/qTBPYaOLQKSwsM1jHZ31lTw
         5CUdLQ1/+zbvn+T1xKMGoIx4b2yoCCUuT+hlj3tu3DbHH/c5iCd4GhFotmw3PcXMBjru
         BS/g==
X-Forwarded-Encrypted: i=1; AKwUvBzWa+HIupcfSTgVsUTRFMXgmap0nbJKHh5+hFzqcJ6XExkQd26z3qz3EMsvIWw+D9cQnwrBN/KBxkzY@vger.kernel.org
X-Gm-Message-State: AFq9FYIjgsytPpnal2y/WYLMRtuVHLPxNyFZ950BKOhERsO9qd6u/7VE
	5eRMvFoUqY6gXnBk/IBFMlmdrtnbmoEIAcXF858X2xu20dm74IQH7zNbYVO27sElye+7dI6xXmG
	ERE/StlRuwOPe48d8XE+lAvsH7GBq2BXir5XGWZJcnxm9fHf7FiY7V4Feyq/Ye4EZ
X-Gm-Gg: AYBFou0M/KuxDgmhWVapuwKcRUASiJUZfCzdb083FrzJqRIXDUjPS55vJdO6TcNxDYw
	tmhMrwJQfzx4UT2E5iZOZvVcvwKORDUrpET7CNSYKpMUboL4TtDyV+vnZjZBw4kGbYnPiEuJvmM
	oP6jLDkeZGRw/bAmBQmb2CcXkFGk1oxMGbd1ASSFlzW64/yhhcZya+SF3yEiUMyqoKzdOAZBMFN
	RiFeRXbSm93pu/ml4sQ1xpoXwCOflq0xiJS7VjHgeyFlDLTMvPv3uza3h0vAa8YLSPUT/R0BJQH
	Sg/9BVlGP3VvXiWzg/JTyPiQRlM19n3/hizVwb+dyIMcmbkoAaO3kAiTRpt7EEYAbisEPIihgte
	cNPzMPBOC8nX2kjivnZPNoErY8XnbLCMAxq0jV4KVd+oydAR1GBsskb4/nL7Kar8=
X-Received: by 2002:a17:902:f64f:b0:2df:8c28:886e with SMTP id d9443c01a7336-2e2e49172bcmr13489585ad.4.1790777543824;
        Wed, 30 Sep 2026 07:12:23 -0700 (PDT)
X-Received: by 2002:a17:902:f64f:b0:2df:8c28:886e with SMTP id d9443c01a7336-2e2e49172bcmr13489355ad.4.1790777543304;
        Wed, 30 Sep 2026 07:12:23 -0700 (PDT)
Received: from [192.168.1.6] ([117.143.161.217])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e2e5bd5c67sm8402635ad.48.2026.09.30.07.12.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 07:12:22 -0700 (PDT)
Message-ID: <5286c573-1331-4bf2-a97f-e06fd004f6c4@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 22:12:19 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 08/11] media: qcom: camss: tpg: Add support for v2.4.0
 TPG
To: sashiko-reviews@lists.linux.dev
Cc: media-ci@linuxtv.org, neil.armstrong@linaro.org,
        devicetree@vger.kernel.org, conor+dt@kernel.org,
        linux-phy@lists.infradead.org, olteanv@gmail.com, robh@kernel.org,
        vkoul@kernel.org
References: <20260928-kaanapali-camss-v17-0-dcf3fd37f76c@oss.qualcomm.com>
 <20260928-kaanapali-camss-v17-8-dcf3fd37f76c@oss.qualcomm.com>
 <20260929061248.E035C1F000FF@smtp.kernel.org>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <20260929061248.E035C1F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 1kLaTl0r7mVnqPjU3vBBV67yLzqKTNKt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1NiBTYWx0ZWRfX2Clt9tXibCGm
 yG07bbzfmQFBEwA+f/V+fbNwVBFY4Nb0sWmhEK50SzRIRvwKcpbuTFt+DNHYqOnpqt9mdmvEC4J
 6qvI83jgvIfC3O9FtwG0O6UWoGc+MPFc8A3pPbRpN6N0w1PcjAk/ObmcwknpoYWkSzN14mIzDxG
 l3oR0qpDDWp4GdGHPqZ31Nf8Z1BUT62tua5N9upI/23R+s6QTGJqvIz6JNNML2/uP/x44dJd3aI
 rWnG6cASAG+Expm6z/CxeVESw0+EqlfD73fz3dgsBuDt/YgnX8sQiZaf/M2mwhd1RWMaNrBzJvz
 jBptE1dCyfXi52dcwcQkTquKOz4txaRqHVYsZX/U9366hVL/fuBNS+cmM24miW9w7Zh65LkWX9q
 FwqSdcunsr4dt2Ib4rZeYR5bDYnOtGvL8lsOmJE2vVUowsgYcqjwzNgOG3ZUZGVRlzMFuILmROw
 lDCV2PuGcJwJ98Z1h9w==
X-Authority-Analysis: v=2.4 cv=MZn5KJ/f c=1 sm=1 tr=0 ts=6abd18c8 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=K/RrOd38U9TixX+j9hIN8g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=N7nUT5zUQ4Ea-L6S4pIA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1NiBTYWx0ZWRfX7+1uYaRubG3Q
 PrYTQ+vEydPRqeGENNkYixLH0X7z2ZTSkIL2OPrNg2aZQXT6ItWH1eQjTHih86aaKJ2dE1EObc/
 A9fsdI6t2SRxpH7MeMYqRgyseSK15rg=
X-Proofpoint-ORIG-GUID: 1kLaTl0r7mVnqPjU3vBBV67yLzqKTNKt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300056

On 9/29/2026 2:12 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] media: camss: uninitialized tpg->hw_version used in tpg_reset()
> --
> 
> commit e2a0aed20f3751127d25b2596032eac51d537c58
> Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> 
> media: qcom: camss: tpg: Add support for v2.4.0 TPG
> 
> This commit adds support for the TPG hardware version 2.4.0 found on
> Kaanapali. It updates the configuration and reset logic to use the new
> TPG_CTRL_CMD register instead of TPG_CTRL.
> 
>> diff --git a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
>> index d29de5f93c18e..770a9e5d5ba5f 100644
>> --- a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
>> +++ b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
> 
> [ ... ]
> 
>> @@ -164,18 +167,30 @@ static int tpg_stream_on(struct tpg_device *tpg)
> 
> [ ... ]
> 
>>   static int tpg_reset(struct tpg_device *tpg)
>>   {
>> -	writel(0, tpg->base + TPG_CTRL);
>> -	writel(1, tpg->base + TPG_CLEAR);
>> +	/*
>> +	 * On TPG older than v2.4.0 test-enable lives in TPG_CTRL, so clear it
>> +	 * first; v2.4.0+ drives both test-enable and reset through TPG_CTRL_CMD.
>> +	 */
>> +	if (tpg->hw_version < TPG_HW_VER_2_4_0)
>> +		writel(0, tpg->base + TPG_CTRL);
> 
> [Severity: Medium]
> Will this execute the legacy reset logic on v2.4.0+ hardware during the
> first power-on sequence?
> 
> When the driver powers up the device, tpg_set_power() calls the reset
> function before calling hw_version():
> 
> drivers/media/platform/qcom/camss/camss-tpg.c:tpg_set_power() {
> 	...
> 	tpg->res->hw_ops->reset(tpg);
> 	tpg->res->hw_ops->hw_version(tpg);
> 	...
> }
> 
> Because the tpg object is zero-initialized and tpg->hw_version is not
> populated until after the reset function is called, tpg->hw_version
> is strictly 0 during the first execution of tpg_reset().
> 
> Does this mean the condition here evaluates to true for all hardware
> versions on the initial power-up, inadvertently causing an unintended
> write to TPG_CTRL?
> 
>> +
>> +	writel(TPG_CTRL_CMD_HW_RESET, tpg->base + TPG_CTRL_CMD);
>>   
>>   	return 0;
>>   }
> 

No. The version data is always valid no matter the reset is called or not.

Best Regards,
Hangxiang
