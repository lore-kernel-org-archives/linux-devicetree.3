Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4375E3659FB
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 05:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787031874; cv=none; b=Rz3pNvLdxyp+ft2/7CadMpgO9ytcqFa8mEkoA14F9FApwVVkj14zoF7C35YS5Mz9X9BaAbDOceTZY0g+InNDTy+fxomTKyW+qXP9V4L5YWGaUV3te4esFylxXz7ooJzBi0F34dQTX7BkjzeH1bPeUUe+lmSIpMthwQkPMqwkllo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787031874; c=relaxed/simple;
	bh=sHE07R+E3ock5k80GQbOzo7oDqEzd7hmLX9F51ZOOTA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QTZ3A6Paf3Xpo2NyLj/FmiABj0P9sLhc0snyaLUB+PFz1hzwHNE+qauWzXIIHPXGdPA+9p4ZmtA7+a7RmDk6v3h6z0wKM7yDoc1Og9JWKZTT8Jy0XoNbx7zeBCKuE4Ekvdaj9F36ztBUKgzHwZgHbWzoo7qXUQ6XE9VdusWYSLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MdB/aI7g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PpE7smxM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MdB/aI7g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PpE7smxM"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I252rq3602839
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 05:44:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HW+t7QxvsT7H1vLeb9Eb6FkDCG/wQu3JC9K2ceXpNaY=; b=MdB/aI7g6QOpoB7e
	XQ8yNtedTszSMN80FoDCnb7nzxWD/v4NxGfy3NpSMA5Cww2bz8x7C3oKErZq9zdT
	Y3WooUHeVCEmD8oy7ifT00mCoUpvQZMmouRctZGKWrxg66I/DB1KjYWrRo2M5B79
	S/TaPRBwEeSHkQKiXsKbwyRSBjsYN3mWAcHX+3Fac9mVYVWFQcfrdDz2LRwzK7bt
	df12+VM46x4g8aUyCqSf3SXcUWjCAVY5FMWSS+lgkz8hOGlEPPfEzCD+C01LNZL8
	ZJhLgzns1iSxqdc1pxS7ia5zwTAPKMQqxzkHgpc5CBiQC8BMG0EuFEWBR2Knafc3
	53DXmw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4ea2gv63-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 05:44:32 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-388cfc4848dso3871071a91.3
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 22:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787031872; x=1787636672; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HW+t7QxvsT7H1vLeb9Eb6FkDCG/wQu3JC9K2ceXpNaY=;
        b=PpE7smxM28GIyE3icKJjFJBGzgGcImxeNo8oQUw05qIgAk0z7/4jKPitCSacgKWW4P
         7FaIn6f77HYcbG81kcdDOreyRA0SwXg1bcQe/+Z9h19auyBNGF4HP94EYDK/6xpS8s+U
         gwuVT+vMuk8LAEFTuM6yDQXbGiaDOAB9bu3r/pA8TrYdq7+PWsRmhkEnjdAWwu1jUsby
         aCH5M3inbymNNmRvgByGXMz4hyIRNaM8NP2swGQv4ZJal2woxHd/N4LSMhXKQHRY5XTz
         f4sroFWo/+ZM/tFtAi1iV7fMBSxMKKvdTm+5F6kDAAjpj8vOzq4djLpw3aarZSTpnNRF
         po2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787031872; x=1787636672;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HW+t7QxvsT7H1vLeb9Eb6FkDCG/wQu3JC9K2ceXpNaY=;
        b=q5YCFcnd3cgCy4dt8CuSMiTCJ6UH5dObVglXKR9gYH50dYRaOPdPyd/K98zkJwtckT
         dkSyocg/vW/hZLa0O07JlijPtgx3vif3Emo+UQzjoP2LpE4wgR5uBS3HzKlgN4rbcy/m
         cMXDY9gOz/eJ7Wct3TsYlZjm7qGYi+30JiFh5q2wSbvwf9Xro5rLomZ8E0y2kYh4yHjc
         5vfc/IzgxMeyR88dLeb2x9dtYHI1FiyZ6mw32Zt/59TgdijZGsZ9Zsbrzlh0XS+UQ2DV
         c3yAdYqehrK7pSEnIZQ4MZ4yR8JJXD1ECgb06RCGdOAF0g2SrZbUmAZow5calSmL+oCi
         aIPA==
X-Forwarded-Encrypted: i=1; AHgh+RrBwuEVRsWiH7v2fk9WasWw7tk3vAUrHqwjEqeQaJHEGL8pjvdAFSqAVXHQkxJ6+op6DLq1Gdolq3eh@vger.kernel.org
X-Gm-Message-State: AOJu0YyjFhkgyOokBYc3LH6o8KVKtVF8IeU1Sa0XfgV/LNvEdFt0dMPd
	4Ay21pUxuL/UCQq2VtMC8yqWPIblTNplA2t6fJLXIYKFTeKSMNzlr4OIw8IaAn0QjP9wy8z1Gkd
	DcxKKTHUkifprOWg2O+8Ogv9TZTXpFJvugkfNmIsF6cxszMgy10cf8ZDBf63V8N8D
X-Gm-Gg: AR+sD10YeX7C+/r1rADnBELr664N6Z6C2lr2q7hMcxZmZCmU1w+v9ZYa0zmW2cskGG3
	9c/8GEgjpfRHypkhMdlaHxG1uYKlwV1p6fZ9chDHOCpaPY7Ar4uOTXac8awNwHvY6M/vtOB6fSZ
	liSHOOigbJIqKXOlsmM7kTJPGIzFtpe2uU8v1zY+zBBH/UqgY7SXCbdhAZND7/4wXcuco/tyzra
	m+RtS6H0jYDdTvcRbOyjiBOfOgotVZ2BVAsvCpiyKIh1XPQmyqE7q2RPLUvWOr9W8uoULA4/wyU
	oc2hXnvWmlDWZRdNVbimMyCDD9/hkrOFHzaH+JYy5IZvc0OsAbUxyygHmzE2VIrIdWR3r5ZAo2P
	vV8rsmlF+TSp75JFyKOd0s/ScRMXLLnfdjIo=
X-Received: by 2002:a17:90b:1641:b0:38e:63de:730d with SMTP id 98e67ed59e1d1-3955a3daf70mr5813236a91.3.1787031871748;
        Mon, 17 Aug 2026 22:44:31 -0700 (PDT)
X-Received: by 2002:a17:90b:1641:b0:38e:63de:730d with SMTP id 98e67ed59e1d1-3955a3daf70mr5813168a91.3.1787031871167;
        Mon, 17 Aug 2026 22:44:31 -0700 (PDT)
Received: from [192.168.29.31] ([49.36.209.30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39531fbb41esm7223248a91.10.2026.08.17.22.44.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 22:44:30 -0700 (PDT)
Message-ID: <359e5cf6-c30e-4cdb-a6b2-baa2aa21c4e0@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 11:14:17 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 04/12] mfd: psci-mfd: Add PSCI MFD driver for
 cpuidle-psci-domain cell
To: Bartosz Golaszewski <brgl@kernel.org>, Lee Jones <lee@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan
 <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz
 <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev,
        Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
 <20260803-arm-psci-system_reset2-vendor-reboots-v24-4-889281373870@oss.qualcomm.com>
 <20260813123841.GC1820248@google.com>
 <CAMRc=MdA_zM_pHCmk7dd7kosqvNmFgA+iXvHS4qpNs9bdsUMCg@mail.gmail.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <CAMRc=MdA_zM_pHCmk7dd7kosqvNmFgA+iXvHS4qpNs9bdsUMCg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA0MSBTYWx0ZWRfXxHWIr03uEuP1
 F3iRFkNPiQIufR77ZnXB8vgw+janBbEdOWV351dvFUKr1uSllbzVuo9Bc8LJwaWamH2MMCTV4/u
 ovd01NgmU+aRP3hi4L69zv6o41/aJq40OsDcxa6LJYRVqFPofL3CTStny2GHoNNm1IoBzIPhO69
 SDoVpo1C5i5FtpUBMoZghW3lcVqi/SmViJVQ9PlHe7aIc769WPxc4DerI7PeFXShwotZyMoUfk2
 7bK4L+CN2adl/D2DnhyLM5NPLXcG9u+C6Dqoi9z8pzPxN/4wfJjDa7G4pPHkCu41ZOQGKy8C3d7
 rY15FDcC2J187R9JZ7qHMjCRb+e4UQdHUmq+4qL0jThA+T1AAjdJrvoJBnCzl/1SuwrNO83pWxE
 JWizpdhtRCrvja5Ol/gLMv4Q1R45gIdhLCpeqHdt39bh4L4L3zw//bmUHWBERNIyxemGrF7LbVM
 jbKj9pdSrX0hw0iaStQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA0MSBTYWx0ZWRfX6g01gy0hMAhK
 EU0CSPN+LNLOPzWcIZ0fu78cqBO0R46YvRUXgrQE5kfWrfX9A5iO1u7NkeAXpwWoRndEd4jB15G
 g4Efxr9ZgXhtHoIovCnYtGukCVErXbI=
X-Authority-Analysis: v=2.4 cv=XtfK/1F9 c=1 sm=1 tr=0 ts=6a83f140 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=LF1w/1kWa9VLj9Mif7fHrg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5DcdI_qaGnyFb-cuGoAA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: Rd9uoQT4WuEUO1PfIFqPVM_ti5dg5pm4
X-Proofpoint-GUID: Rd9uoQT4WuEUO1PfIFqPVM_ti5dg5pm4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180041



On 8/13/2026 6:36 PM, Bartosz Golaszewski wrote:
> On Thu, 13 Aug 2026 14:38:41 +0200, Lee Jones <lee@kernel.org> said:
>> On Mon, 03 Aug 2026, Shivendra Pratap wrote:
>>
>>> PSCI has multiple kernel consumers, such as cpuidle-psci-domain.
>>> Currently, both the PSCI core driver and cpuidle-psci-domain bind
>>> directly to the same PSCI node "arm,psci-1.0". Additional consumers, if
>>> introduced, would also need to bind in the same way, leading to several
>>> drivers attached to a single device node.
>>>
>>> Introduce a PSCI MFD driver that binds to "arm,psci-1.0" and registers
>>> PSCI child cells. As the first user, register cpuidle-psci-domain as a
>>> child cell.
>>>
>>> Update cpuidle-psci-domain to probe as an MFD child and use the parent
>>> PSCI node for power-domain traversal.
>>>
>>> Suggested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>>> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>>> ---
>>>   MAINTAINERS                           |  1 +
>>>   drivers/cpuidle/Kconfig.arm           |  1 +
>>>   drivers/cpuidle/cpuidle-psci-domain.c |  9 +-------
>>>   drivers/mfd/Kconfig                   | 12 ++++++++++
>>>   drivers/mfd/Makefile                  |  2 ++
>>>   drivers/mfd/psci-mfd.c                | 43 +++++++++++++++++++++++++++++++++++
>>
>> We don't usually allow the use of the term MFD in devices.
>>
>> What does this do?  Is it a mux?  psci-mux?
>>
>> If not, think about what it is and call it that instead.
>>
> 
> My two cents: I'd call it drivers/mfd/arm-psci.c

Ack.

thanks,
Shivendra
