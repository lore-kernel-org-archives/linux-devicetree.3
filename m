Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB18495ADB
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 10:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791369879; cv=none; b=bagMPxah66Tba6VpV1vG/BrNr2viZ3UoSSOYcglkc/DeaK3J+PmTsr2aLXwjVKNTX38Tzr7ef/Ae/eYbrmO6X4/d4r8pRarB8QdqyaoIEWpAD5GEn95GxtRBGXPqB0mnBJ9O7lBt2nTYTwP5ggSvkrGvufwMnVngR2JEoAPyoQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791369879; c=relaxed/simple;
	bh=eKox8evQuuqmlMoftMlCpCcWaOJ7gtEXdoiFAv7AlSo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cKpjmIJbMPH+IAp2wszzKV1BgBYXDwzMhNsTfbqpCFLzvjLfWGM1VXDnEeYQgBRpCtuMd09u6ILNIypu1JjqJd7CyqcoLd+J/E7LbIa5vT+7YGmvxaNgUHB9Ngo0QtHtkXyTboGcnbFpL0CQprXlG3R5YWUbjOdf4I1c/JBZQYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MF6cfFdE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dC+5n22S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MF6cfFdE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dC+5n22S"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697Abohg2686654
	for <devicetree@vger.kernel.org>; Wed, 7 Oct 2026 10:44:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	37Vc/NsNY9W2/CoPj7zYbbW2QO5iD2sTtuJnT5u5AiU=; b=MF6cfFdEdHHNKFgD
	ZgKaNuOLVTAYvrGxYag1R+N6qQLqVl9tIVLAL62OKRzZihLVXllR5K6S/sihyMDR
	eY9fq5KrM/7BA2RqFV+rs+8IMVnR2sl5q0MBNNGohRJOaJgQoFZU/MzHMRvr/b/Q
	Sli05XiINqSaMVynwvdzNNRMLfdD70wXxTI7u1YI2r2itP4bz88onwKVQ5SCdci1
	SAJRko4zuupUdd7mRRUFGJpcVuym/rld1Kb27MFnNZHEh5d5cgxLfSPPhaMGDFrq
	e3pLIgzobxuk1jVhQcjvExPbp5i0uVLNW+suDrKTLPF2bhTmieGNYdUILbQ7jM+3
	Th7VPA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5mge00ju-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 10:44:07 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e54b6556aso3639389a91.2
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 03:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791369846; x=1791974646; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=37Vc/NsNY9W2/CoPj7zYbbW2QO5iD2sTtuJnT5u5AiU=;
        b=dC+5n22Ski5TTlqbqhbZiriDgyBW5fLaHzqQ8FXUxmdxxuCs9PUTBKf+SIp0/MoTQa
         SuRpeqX029v0y2RW+ONO/136BOOtWyGvPCTVua1EZ3TlH5QYZizp248A5S7AKPCqJ9ni
         VrwCZ10nkfrTnLlSSD4Qlucyleq5pE8fiEK1b6iBdo/vKFXc84TN5nNa7gJiHw/twjYO
         QGmz2gp3jz7nvx5XOPPXhys5ZpECCf29dPvdnLtRiDVuNi5L1kr8CjpFDk1yALUYf5oG
         9Df2OdfX4WnAYjRtXWkj2FX5cdIk/nPy5ZVpOIFkuNtmOggKmmXid6cFnBy+8ocu2OPM
         76Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791369846; x=1791974646;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=37Vc/NsNY9W2/CoPj7zYbbW2QO5iD2sTtuJnT5u5AiU=;
        b=ASNG7PB4KaOyMS9PG3k1kveoZ7ax7NVlZgZua6e9EjYLHzCDVRWRdJIKlgm9P6UUtE
         PVOSyqVpGnaMCwoIhp0Lk4sqQmUVTfJADovKtAyoJ2gBYFQBJXx2YN4To0M9GEPkidBT
         oLLJE1yJ2VpmKuOuQZOD8fcqMQBjvh1EMm/GCOlB9oguVtNxogqUekSnl960I2ZUhy3e
         pZtFxMtcEGMch49P2Pua+qJnqI96b/EfXDB6GMMsMC0x6tlswU64AXwOmqq7SxWe2eki
         zOb8YPVIbW07NmnaTae9xPM3hzU7ccwCxhQ4BJa2i78FD/Zi6i/N39DFvrtqAucHvwgW
         1NyQ==
X-Forwarded-Encrypted: i=1; AKwUvBzN+ny71CIZm38xvEPpjgLo3FleSSAkwuo7gf38MZEekzSzs7YaouUhOqjGXUb+HSjNVwyrwTGhWlqZ@vger.kernel.org
X-Gm-Message-State: AFq9FYK1qZJNQWWEERnpzgBidPbtjiXGY5RkgzBn1A82YbJuVE3qy027
	f+BpgYcq8Vy3LvYbC3rkv4rc8wyZuU6KyF95floigjcpQYZjlH7FpoXsz63WxVuj6dtVuBtAxY7
	arQlGxc89YLzjcCeepI8Oq4MAxSpaI1stXAdUY+t77ZSQsEQxezCMSEr/tSlaQ0jM0muGSVH7
X-Gm-Gg: AYBFou0zuMVYDqiiQ0f6u9Ny+3mXxZcJw0BDQ+OC4OUBqWr4IyAdIKmswD+U1HHnT/j
	gp0wp/2bm1jwf3l9hAxF/dwkaFZ020mdqjU4FazYST0kIMEI8vWAcfwvU2GOOFH2f6im7aS3Xac
	/Ex8ls3a4TcTaZYkumqleQB8kB56HWxllRU3JYV5BitNf++c04E0vfYq41tZCY+VetEd3G5f48S
	j50MfSKVUbiLtJppPvMn5XRIKCw2tAfe2nqErnC+X0BAX8+9wiArrsKNOLedzJF0BIZ/HEWc/AA
	ilzsy3L2ddE/tI8HjiCwlozcMqcZSZ1ELN49Mq9RSwhxmkKBeNiM5V3rio51u4fjAHSkNh1263P
	L6rrLVjrZT61aTjc38O3JUpkRSNmgkZxaKwLoN3xgc9E4i1FmuvlZkZSf1ujx7MaOZycUUAEZjW
	0aqdYh5qwrLMo1VFV7tR0pjlMLALg=
X-Received: by 2002:a17:90b:4b08:b0:39e:4c7f:7304 with SMTP id 98e67ed59e1d1-3a8a19b1e33mr1567175a91.27.1791369846055;
        Wed, 07 Oct 2026 03:44:06 -0700 (PDT)
X-Received: by 2002:a17:90b:4b08:b0:39e:4c7f:7304 with SMTP id 98e67ed59e1d1-3a8a19b1e33mr1567149a91.27.1791369845562;
        Wed, 07 Oct 2026 03:44:05 -0700 (PDT)
Received: from [10.79.117.106] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a853e66560sm9393796a91.6.2026.10.07.03.44.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 03:44:05 -0700 (PDT)
Message-ID: <4318b36a-8fee-4207-a232-0581e2b2c69b@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 16:14:00 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/8] Improve Qualcomm EUD driver and platform support
To: Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260929213513.2401005-1-elson.serrao@oss.qualcomm.com>
Content-Language: en-US
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
In-Reply-To: <20260929213513.2401005-1-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA0MiBTYWx0ZWRfX8BXW8VUamN3M
 CcvqkErstVM16C4MvRnVFmjBUB6OQyRu4QaScMdTFKUcIwyUcVGEMOjCHZM9dyuJqYuf2sO2p/5
 fWgWtuZnu5zOyoVAOKZGkGTF78oxMF0=
X-Proofpoint-GUID: fwYny20R8O41SxiuYtVw6yjX3I1Q5ZYX
X-Authority-Analysis: v=2.4 cv=PdJqFShd c=1 sm=1 tr=0 ts=6ac62277 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=IB2eJBZJimwe791p62gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: fwYny20R8O41SxiuYtVw6yjX3I1Q5ZYX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA0MiBTYWx0ZWRfX/tNtU8kHnglz
 PbcmS5CS5VhM169OXmE9bJR1CaZHQ1UpzCCGOsxKHZTf0SgF55TuHwvXmoGjtpc764WzM7qNnu9
 C5xwoSjp/dpslWkCa/2XKuUPLvr62NcKFvtit2I1yht6mX3GBwDB6/aV/LYNBuDXjY21O1YR81j
 htH9HpWQ5ESjfmEn8NIHb07r8e+UpONLStfKhpwyWBsTU3hGxFe4gVX5ii1yzOzGH7VhX+s/zb/
 Jv1pEC6nsNQ6to4iyYFb5bqfZUpZgoImxuZYnECBgHkuXKch1w3XGXnZ7hCom7twk6Guo7ssiAy
 EJZrsKLx5w8SFr6/FT7RQzvWLcH/V7wgyAMembDyz5kU/+KzELowT4QUDSgRYKQwEppsj6uV6Af
 8UlWbDSRryOEBjGtWEEI+jTtBn0ETJJCy5c3tEq3KEk+7uASu5FAHTTkY//gX52+Y4JIWNpfA7k
 tGFlG+gAev/+/rxfN8A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070042



On 9/30/2026 3:05 AM, Elson Serrao wrote:
> The Embedded USB Debugger (EUD) is a High-Speed USB on-chip hub that
> provides debug and trace capabilities on Qualcomm platforms. The current
> EUD driver, however, lacks essential hardware resources such as PHY
> references and support for multi-port configurations. This series
> addresses those gaps and introduces the necessary device tree updates
> to enable testing and validation of the enhanced functionality.
> 
> Below is a high-level block diagram showing the EUD and its connections.
> 
> 
> 			              EUD Block
>   	                   +------------------------------+
> 			   |                              |
> [Conn-0]-->[USB2PHY-0]---->|-------- Path 0 --------------|-->[USBCtrl-0]
> 			   |                              |
> [Conn-1]-->[USB2PHY-1]---->|-------- Path 1 --------------|-->[USBCtrl-1]
> 			   |                              |
> 			   |      +------------------+    |
> 			   |      |  EUD Debug Hub   |    |
> 			   |      +------------------+    |
> 			   +------------------------------+
> 
> The series has been validated on the Qualcomm Dragonwing Q6 platform
> (RB3 Gen2 board), confirming successful OpenOCD connectivity to the EUD
> interface. For detailed usage instructions, refer to Qualcomm’s Linux
> kernel debugging guide:
> https://docs.qualcomm.com/bundle/publicresource/topics/80-70020-12/debugging_linux_kernel.html#debug-using-openocd
> 
> 
Tested patches 2-7 on Glymur-CRD, EUD port selection and role switching
work as expected. Patch 8 (Kodiak DT) not tested.

Tested-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>

