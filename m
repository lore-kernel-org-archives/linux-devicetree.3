Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F4D2E65D
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 17:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783101006; cv=none; b=a5vKs/R7nzV4C/kN6lAJJktjL+hpFKVzsDNtl6mv7j+EL1U1zXU3JKfo8xy4Nd6ry81Pk/rb9EfuH9XQn9RiruWkW7r/C0juEdi5/X/407cQT0lKNEaCyewk4HOfJwEtjCDAaI0uwVyGLYQSPxLU3cgIjP907CA6rPRc+jVqJvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783101006; c=relaxed/simple;
	bh=UM1/QYhZL2jHpR7AM/QhV9xi/7PCDKlFIVODBk8Qig0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PnzUGwgiAl+WQZS901tfjTrULFTIuSJCoZfJwdZ3q5zTZXOcniN0DMj+Fvzr12rO5ZifMTKicjblDcvcATJ6JM7OcR9ePv/5g/xeWU+138OlEztdfzxDSUteBCNk2bWXKCwnVqp0NK+DQP7XfGJaqC+AAgEOknybaEvZEyjp0Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nFIdkWe1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IKbsxXDP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nFIdkWe1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IKbsxXDP"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663HiNfD695318
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 17:50:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QoqcArHh2FIbReSqL6vk3ystIfXcfIutzyeRk0T2kjU=; b=nFIdkWe1xdgbnSxN
	cRtmUEcVkoV34EN9UEa1uQmw8cAxIWbShoyHp3fXbtE1QXb1AhQPea8pXeWCpoSu
	TKd3LLcDG1Wb+sbMeAy2DNpowk5yKNJQm4RBNlMNdkg1rNiPXWNgIe1hdH82UGEk
	uSsp4q8OwJ2X4Sks7y2Jkn4XsAEXXxf+xMq62QL43vgqrFud9buGrI0EVVfD1a1h
	Qx7Xta5y1bbPbDOXAdj33nKO6MueVC4IQYaltkHnOWBY6/73i7UdN6J0l2SS02Fy
	pB4LdJYiaD7dQjQVqxm2bcY0NWxIOnj+s5GuXoEh8+Do6FublrsLfSLGgjju2uKJ
	cBlaiw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6a849tft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 17:50:04 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-37ca4367860so2194971a91.1
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 10:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783101003; x=1783705803; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QoqcArHh2FIbReSqL6vk3ystIfXcfIutzyeRk0T2kjU=;
        b=IKbsxXDPoQAvmdkuJ8p8Sjky5f/1jEyE+QtvwDV4pyGzP/fVECFM9ChkWG6n/8tFTP
         LV95VkzDMDI+Uj+YxySApANqK86EqAcyepZjFUsGI6/0udbh4iRIZdg8BjaoH6jZyFPV
         44EAA+fbKf6btRGqoXJclGggsb06JXkqWbNuNbSA5m+wQMe7QyzccuX1G9uwG7nbouu3
         66wrjdLxjMS4jQpPvFeCViIRd2TTCiDrCRKaRCqiwGu1PgzkuvPN14XaskFRbh6EgMXT
         Ga07grbK7CTUwjryTSYruqX8iQKeFXpFUZKugY313dZD0vbdWH3ofm6KazC2tC44BLJh
         E0cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783101003; x=1783705803;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QoqcArHh2FIbReSqL6vk3ystIfXcfIutzyeRk0T2kjU=;
        b=R4l6sAvh9RsVmTWFL80v27aiFX/7qm1QUMBzX8Gl6fk040fceOJCFzdgSUHjS+qp0U
         HQYf3htbFxjpCvPDGGj5EySTYOFGXIOCVd0zIArLbF0vgy2XHkwFQupZc2TrCbDH6BV2
         D5b137Na/1WNfyD4eJFl0vOjqFaAgKQfiu+/kykVFAeETDPGk2YmgPv7w8rgJVmnUMFO
         4vvo3vsaSNWfI4VPvoH3O3JclOKrkUiKRPMbedhhPDnBHKtB0tgFx53yxKjZuoNaCBh6
         ecz9g/MigiF4S0ALSTF4O3CjETMckf6kPUYXfG92HkltIKTCdAgzpYjHzXZe4cZTVR9+
         Q57Q==
X-Forwarded-Encrypted: i=1; AHgh+RpqU4MF4ZvascQRiorAX+MgkCtKhML9y/BevTwZ4Xu0u+sJtHIb/H1juCWjmbcV/pHYDPIzrCIU7uug@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9E6j/x21KkNTZUWNaajsyMSorluJUweL+yDD7pIWS1k0SpwfR
	GEoo0SMmUy8yV7MhUyj/vw/4atzq99xifpOMyXTQnd2Ss93Su07NpIGFUzwpjQUTw9RgBlex50r
	ARHnLs8XvwTc60l8Q2hd6pig+7UVd0gwxww9orhh+D3BiIObdovt2+wPIeGh6eu8N
X-Gm-Gg: AfdE7cl3/v+zlUjgGXtN4dwyKcrKbtpjW8sM6IVxA+qnpYSUyAiIvP1ldj5XEv1FWqA
	54ewc3OoleOOtsvralmS9QtC0x0eNujudfrCXEeLplfiKA5Kw8NjEQVl8MAO33fq+iCaxx5IAN8
	gMKvpV+8VFZbRAUvTYbu1gaCeyPCHB2tfzSYkFYsMNrt6Tkng1GziYrUIZoeWHnv7DMMkSBggez
	aqWpR/JRoYQadjjryiC2oFvHZcJzLiEfPilh08rPlfSHARz7ofBPfEXXBGPYoG2gwlhTEzY2dao
	4z07wSuMIs/vKI9GRClrw+3vKPJhAiqofmG9absdu7UKD6iBkbSChdiHWN+iAoycqqoJt0dDed4
	W5lZTtScS4L8gIb00VGCCpjPMzGBDtsKq26jmb9dUctaMBQ==
X-Received: by 2002:a17:90b:55cc:b0:36b:b903:994 with SMTP id 98e67ed59e1d1-38112063e00mr5494204a91.4.1783101003385;
        Fri, 03 Jul 2026 10:50:03 -0700 (PDT)
X-Received: by 2002:a17:90b:55cc:b0:36b:b903:994 with SMTP id 98e67ed59e1d1-38112063e00mr5494182a91.4.1783101002901;
        Fri, 03 Jul 2026 10:50:02 -0700 (PDT)
Received: from [192.168.29.31] ([49.36.211.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b7b9a1bsm23319264eec.3.2026.07.03.10.49.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 10:50:02 -0700 (PDT)
Message-ID: <3c7f437f-110c-4cc2-8450-807afe1cd3a1@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 23:19:50 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 04/13] firmware: psci: Introduce command-based resets
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Sebastian Reichel <sre@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla
 <sudeep.holla@kernel.org>, devicetree@vger.kernel.org,
        sashiko-reviews@lists.linux.dev
References: <20260514-arm-psci-system_reset2-vendor-reboots-v22-4-28a5bde07483@oss.qualcomm.com>
 <20260514212353.881AFC2BCB8@smtp.kernel.org>
 <c2bb7a24-e1d0-4308-ab53-208901108a5a@oss.qualcomm.com>
 <akOUrV5BwU9/PuLJ@lpieralisi>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <akOUrV5BwU9/PuLJ@lpieralisi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Pe0RRpKY6_yrz38JDqTxLi6TaqT-_mpf
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE3NyBTYWx0ZWRfX+JFrP85TFhnt
 E67oxA4zwpqm4h2qliQDKeoW6gIYTwoAs586DszTX8BFweYhSGYoaRrocdCk1wXZrqtJb3Orqxt
 ovAEOt5+FwmqguZLl9q34V8oBtKomLk=
X-Authority-Analysis: v=2.4 cv=a6QAM0SF c=1 sm=1 tr=0 ts=6a47f64c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=rC9KOIhp3uddGQGwuJOTUw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=D0bSFzudHjEVgqge0mwA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE3NyBTYWx0ZWRfX0A+nNuE3ulnE
 ik+nZOjyqva3giOYsrLmD+IEBhi9vacJ3WHoM2CaLsOh0vtO1R6cX7/XY48Y6W37u3QbkATIzh/
 8mxeL4a542RKSfD4GkFTjOKTuTObxn0Nx33SFdGn7Wy2dojmybKdB8rxjqF5vs6PJNNRx9NhUh2
 iNafWmr+0N3inHhwW3TCdkUZLDAC/lAphbSmqCRkcKTh//iNOjBIktWYM+yG3NAEZV3Lg0PMoS2
 Lpt7gA7WvXbL6ucDJnuSeOokSZgRAgGGjwkGWUAckbDM8QOzEfu//UfLZxlUNdDpidMMmzu5IyR
 8Wc/QUkdkLLsQP1G/9OtyKfTeAYJw8ed6Fni8ebkSN3GY2vzgozcElRzFrmEXIleJTbdhCUgReb
 +wKggxNdFgeAxFTNoaDf3dR3GjoMY1Oju/B75p5G4ggMG+kDACkUwm4jopjw3FQOBEkvu+0ceok
 OGSONohVtzQhA9WX27Q==
X-Proofpoint-ORIG-GUID: Pe0RRpKY6_yrz38JDqTxLi6TaqT-_mpf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030177



On 30-06-2026 15:34, Lorenzo Pieralisi wrote:
> On Wed, Jun 24, 2026 at 02:04:54PM +0530, Shivendra Pratap wrote:
>>
>>
>> On 15-05-2026 02:53, sashiko-bot@kernel.org wrote:
>>> - [High] The API illegally truncates the 64-bit PSCI SYSTEM_RESET2 cookie parameter to 32 bits, violating the ARM PSCI specification.
>>
>> Hi Lorenzo,
>>
>> Was going through this comment. The patch currently uses a 32 bit cookie.
>> The spec also talks about "SMC64 - uint64 - cookie". Can you please suggest
>> if we should add support for 64 bit cookie here?
> 
> I am afraid the bot is right, it is not correct to assume that the
> cookie upper 32-bits are always 0 :(

Sure so we should add support for 64 bit cookie?
Should we modify reboot-mode framework to take up-to three or more 
32-bit arguments?

thanks,
Shivendra
