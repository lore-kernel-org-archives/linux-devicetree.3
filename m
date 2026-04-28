Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0335410D3B
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 12:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777378701; cv=none; b=Dysgn8pk3vpfh454mCU7vjQhhSwrDlc0Jg2xckX+V7g5DK3eExaqsqXfN1sX0DpES8tsf8JeWjUyCBUyONVHEZvbFfSNhgFw8dbZtSlk08K+l4Bz5Ca8EJO0cd1mxBDhHeHmupWYZjh9zg9qZRFE0zql0bkEsQn9NAWmwAhcBv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777378701; c=relaxed/simple;
	bh=7Zso9KS+gzl6tIHrYjH5N3xNODteTYkq+N/ntXUkUb8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LdzFSyvWMS2qsMZ7Wfppe6c/wUegPwVOjDKRe3YrOBVucWImlQ+xeAzI0SPK7dSPVBIxtKZew4herQqH91/yOxWk/xkIgfdpjldu1LEA6x7UqUCMbJYohWDZRWX82AQo8GJqeCdqZIHYOJKx0LC8IG3HK9fpvtyWeIFpS8dR5dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A+xZbf2g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BuQV2Qja; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A+xZbf2g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BuQV2Qja"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SA0suf2112382
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 12:18:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b5kFeqYt/6hoO6aGdTKf3E/wifl3FzIvEDfFJxnGaXE=; b=A+xZbf2gkylFt81o
	x+cSbgpkgy2MCYpYlbrhyfOtVlk7k/QVjPNC8dY1doBJk0mHmknvWTQbVpjICUeu
	ryCIKDN6nBNLuxQ0NXTzDPaWJuKX+i83c6bN02soMKSaf/MVKUGnCIvRireT6050
	Bbe2yXPQKyLJDW56Exk1kG/78wtLIpHBraPeluatU0U4YFwlx0HXV59wveMu+7it
	929B3DQxTIVZr5jibBm4YO4rb+/GDFOs2lNM5ZhelSlENe82AjHHjAtGj8p3r0WU
	9lXompbtVmDjPFB7w9ADopV3I9BeACDcnyg+ICxIuR88hD6fQYHxnQwPFrf8tZUw
	2zD56g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtdmbkfmf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 12:18:11 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-362eb03240bso4575322a91.3
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 05:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777378690; x=1777983490; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b5kFeqYt/6hoO6aGdTKf3E/wifl3FzIvEDfFJxnGaXE=;
        b=BuQV2QjapTtvNWxtPEaUba1K8fAnS6x3c8oHGhqlxxnHzomZlKlmDOEB/UJrI3WCiZ
         ImpNbwQdrWwsUYEOU3mgPITP7vaVP0ai2uhTHpeoY55YFrh+SzuyYRko1As3npyUOTln
         owlI6ZQgtJJsK1U2TDNVCpbDQe3BffhvLNa81Jjo6D20Oz5qwJ3EBlGcX6CyjBhxq/CB
         CebkJKDR9EG/uX5vBYjCo1cAzAt3yyJM5IriYovUtuQWVl4rd1gJ3lCyfAK7Go4P0+ED
         EtVsDXu4GMilggJd7eLCzTbJ6X8EHCxM2oe6O1fDptTmU9GbLfDV4jPV/+56ohQ11+Od
         +7UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777378690; x=1777983490;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b5kFeqYt/6hoO6aGdTKf3E/wifl3FzIvEDfFJxnGaXE=;
        b=gR6Les0Eu/Ei2bP5fA7pJBy8u6GVCFXMh1xlSX6VbADBV2U78DWR3nMerEMMoPbC39
         VZIs7FwDP3Ufgxiqw+oZEAXrWaFm+uLWgwLRop1paB/mhV0rDaOr7CM+jmy/UFYPEyt5
         vnrjnrQ/2mOJZQgnCRK1Jkbmq2JPTZ5UYn7DZHUMoKgYg6yC7Xkp8tpkLqPFBmXz8iSK
         3y/zFEdll9vM0fbUuS8mHh8lF/Mbbb1+N7R72GJYDAsvVYBYZsFPqZqdT5EkYPnexIpB
         Z2gWXtRcFVkLU0+yynKmGTrYqGGmerbDARFy4n9O2IXDGC0YZIvUw0KitT2x58JycHRk
         6gKQ==
X-Forwarded-Encrypted: i=1; AFNElJ9F4vfSSiFw8B5Kwpss1WmMgHp5SfyBWJX6Y+vJUqLgDz1lM7CWlFjNzK+Ijt/GnWZeuvnXETuv7hhk@vger.kernel.org
X-Gm-Message-State: AOJu0YwvRJNujAP0e9TY1fiH497jbwwioQnxXiqOwDSRMZX1Ddq3PtDQ
	7MueiQeJJwDuoB9T4Ua7cgpk1t9/q5kpTKOXVRgr3wV03t0RhRMfegFarhWpmo39AX/fpra2E0I
	+kfiIwH3t2eilQvjQFmrDbwu1hVbTsAcZ4H7AWwWPco8l54qI+Nz9JVjJt67WHUfk
X-Gm-Gg: AeBDievq6CWqGOvvwZOSt79QAitA7joW1icDsne7SFS+p7m62qi8eTVSTp5vSxDz1FI
	mm1euNYxbl5qv23OEJtWk0gyJtB93CiLATwZCGOxYdKg21crL+/kqbpCoHjzNgZZXVcz1waSeG8
	Lz1GmKBjFGUxIlZNPrhgl4yVsFmVNT+esTR1ypkrL4ogSk42shC6SlJkzaNqpIFAB+YDLg+1Wcg
	ijwF2q9EhglDpcJbLIRreXVfnMstFuA9PcT/EUl+8FzniyjpNEUmtbzaa8EyZPlEmc453ilpARG
	6A47DUuSkKZT6/x5fowvs5ocgk13hq7zPcgX4+tbrQw47dtlOX+Ljyiv+gAI/z01r5CgDXsh0wF
	eBFDkJ4zBHBlRS1/ryAKMv8+wpKmgW6Igioy3vrUGc7MJyWbu0cWkI5CPoApJ2l42tMA=
X-Received: by 2002:a05:6a20:958f:b0:398:7830:8a40 with SMTP id adf61e73a8af0-3a39c0ed8c6mr3526731637.23.1777378690297;
        Tue, 28 Apr 2026 05:18:10 -0700 (PDT)
X-Received: by 2002:a05:6a20:958f:b0:398:7830:8a40 with SMTP id adf61e73a8af0-3a39c0ed8c6mr3526670637.23.1777378689785;
        Tue, 28 Apr 2026 05:18:09 -0700 (PDT)
Received: from [10.219.57.134] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7fc6015691sm2244868a12.18.2026.04.28.05.18.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 05:18:09 -0700 (PDT)
Message-ID: <c0677503-8073-4940-8eb0-c06b34f843d2@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 17:47:59 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v21 08/13] mfd: core: Add firmware-node support to MFD
 cells
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org,
        Florian Fainelli
 <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger
 <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
References: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
 <20260427-arm-psci-system_reset2-vendor-reboots-v21-8-dcf937775e73@oss.qualcomm.com>
 <CAMRc=Mf+-04Zr7jjRoaxTzO3LKSMyQ7DzxJc=dHNSyThEUiq_Q@mail.gmail.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <CAMRc=Mf+-04Zr7jjRoaxTzO3LKSMyQ7DzxJc=dHNSyThEUiq_Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: EGwX-vgMfHOdh9UysvAtws61Jg-r00kV
X-Authority-Analysis: v=2.4 cv=PcrPQChd c=1 sm=1 tr=0 ts=69f0a583 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=SHOFGYX_daQPcY9Fc6gA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: EGwX-vgMfHOdh9UysvAtws61Jg-r00kV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDExMiBTYWx0ZWRfX4mrk+zMlfwuX
 Hvnh1+K06RveIcj77UJGGws2QFcfMZBmglXu/jCZLUR7NwVmYscW4y4Nt0MSKaYhZ+7LLxYpdeI
 tzNHsNrSIdxnsi9/+8CZzajxWvlSrRnIiZ3AIIL7OUsH6NKFn2NHdbTcHp13xx61qHh8rB+7Scr
 28jEp4p0/1NOGHhgf9YvnZakM/rUcMCxNDPHW422gwKETV08eAr1cd4Sd8daRNdR+4X3+ZXvJIe
 mHCS4X0A0LLaOcqr2X+UZ51WTkyc5+dEr9+DqxLA8+h/jRgqrMJVOtbS5HYwiHf21Gmgz/Eth7f
 Q1erfYp+mmOnIhB7x+xemC39skdwwM0D3BQiN3Uz/p6vUQmRWhmiMysjSUKEmC9W9BO/33y4JO9
 mueyR97qBS0Ox3FrQCOb2uMsspMcddJii/X/dNkUgsZBjfhAtzwboK29Uow8ylhjwzDo7gsvZgs
 4KUJPjCVMUJGZCG4HbA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_03,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280112



On 28-04-2026 13:33, Bartosz Golaszewski wrote:
> On Mon, 27 Apr 2026 19:34:48 +0200, Shivendra Pratap
> <shivendra.pratap@oss.qualcomm.com> said:
>> MFD core has no way to register a child device using an explicit firmware
>> node. This prevents drivers from registering child nodes when those nodes
>> do not define a compatible string. One such example is the PSCI
>> "reboot-mode" node, which omits a compatible string as it describes
>> boot-states provided by the underlying firmware.
>>
>> Extend struct mfd_cell with an optional fwnode pointer and attach it to the
>> child device during registration when no firmware node is already assigned.
>>
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>> ---
> 
> In the following patch you use this and violate the supposed constness of
> MFD cells. This also mean you need to modify the mfd_cell at run-time. I would
> prefer introducing a field in mfd_cell: bool use_parent_fwnode which would
> indicate to MFD core that - in case no fwnode was assigned from other sources:
> DT or software node - it should reuse the parent MFD device's node.

Have one doubt on this, When we fallback to use_parent_fwnode for cell: 
psci-reboot-mode, at psci_reboot_mode_probe(), pDev->dev->of_node point 
to psci node.

But we want dev->of_node to point to "reboot-mode" node. This may need 
an explicit assignment again of of_node?

thanks,
Shivendra
