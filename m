Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793023972;
	b=MRbOMK++UoyB370aUcDVuoRnSsiuGqioLSaHyejIHQkFest9B0fL5aFj7TfOiGbwV0US
	 HjRb2o7N3aWpH4xubDB4KnvBckn06AGYP2yKj+Hc1Nk9K1iL4wPGGg26gwaIE4ZHgJ5/3
	 n645znWvcqspJ9kNzDZkDF6hYPQ+YDXCu7lFafjACXZgv3yy+WSdUuQGSMN7Cap1kvYBg
	 8jgloRpF49mA0qaW37CHbTBmXcZYrrOXBiMb/ICAV7flq5MeSDob+Yut5xRVoZQhfT9lP
	 wC/KleIHij7EXwrCZ1rKMAMM+cjErgl21P520413Cs54iYDRcz4OZVDuUptXBcjV0gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793023972;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=f71ES1dXlHTRx/wzrOZvmx0zX3vslqjQHHXhtcOSokg=;
	b=FRBO8t7mO+CTmSksPnkgHO8j176H3gdVK6mQD8ktiH3VjxNkIXexE7tPcCBfy3n2rVBh
	 y5zanm91cM/GVdgRLGCV6DZV4DqG4HyZm7uNd9y8BU28GI5xa+tNQS3Oo5T8BjIEB3wEm
	 /ceK6lhgiaXO4T+vNo8RIiDlyt81uZRzCAzyYrqLyZGjHQ6FEP6baa/3UZU2BC2mIu7qJ
	 aEH8GGfdk6W7NZOHnx2mzP27h6Sc+aNj3BpwSH4hs1oqt0bqv4pgOnvE6HdtTgvZDpkaN
	 aAKzDY0qb+HYutaiEbVVvsr5Y+Qzh7VaOjoxxkwrg8ljMLMyytEJ+NtZfIjqtBHOzBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UjaiqTmU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BkBAK2y8;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461B1606A31E
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 14:12:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 461B1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UjaiqTmU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BkBAK2y8
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtM6P2009926
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 14:12:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f71ES1dXlHTRx/wzrOZvmx0zX3vslqjQHHXhtcOSokg=; b=UjaiqTmU7fiHzeyZ
	26KInDkK981IDmWIvg9QuSIwAoRV4uKC480pT7B9TvrbbGMNboQbblR6ZNGkcdd7
	vQt+JGNJSX3DvH11byU/7zUqgnMYTcMB2I8KV36wj0v7Tv6Sd0Ai+VnHteyEeAFT
	WQC53Qbg0aCOJMLFVkp/lDZSh6v22a2HYb6kThPbpe79t6tajROE3x5Mv77jwssM
	OqAcknKfA4zAC1u5nkHH4o4Qz14/wkOc/2TMoJgDUhtRzj2knlTRpztfgTGHiu2y
	fzdVvwp3fjIm9AZq0grmzITjTOfOxrCcLccuy5mgw379LWBrg3BS1GqU+s/OVD4V
	cIKY0w==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgn27xrb4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 14:12:50 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5eae4d7ebd2so147439e0c.1
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 07:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793023970; x=1793628770; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f71ES1dXlHTRx/wzrOZvmx0zX3vslqjQHHXhtcOSokg=;
        b=BkBAK2y8PUc76+Kwqm9PwBeXioHdb+XtGZ14Pij6IusZQYn4d/AL6vxekTQC/V76qw
         U0w4zZpTf7X8D7myROs7WuwwH1VkbR/KuGuNRktAdzdBtdEFn2gMxg3x8cuOihzikfiK
         MEcKjM/TO+ghzquecQX62i9AWTaSEBj6jPKjOfoKhxDwXdAvTbYxxO3sKFdcxOOhSJY2
         HxeXJQiHRs4R87XOjkfC8zkaaPB7FcNdZKLQi+2IyrgeoQwv6uJfgRznexyK4qTOQaDy
         8lh02tFTmA4XT1YqhEOgjUcwJGowRPidMPsQoOxU4xXb3Uo2J1ZQ8pWwufJVy5MvECBv
         BXZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793023970; x=1793628770;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f71ES1dXlHTRx/wzrOZvmx0zX3vslqjQHHXhtcOSokg=;
        b=kB5QuRFuw9WuzRHfexww765ZCMIqNUM41DznJInUt/H8IttTiCAtVJNWHEaLF901RS
         ZqOWKmBem6mxQGLeq/3NVt154wYG2SX1z2Z53Lrq4RIQJiSiqsJMr2s1B1yU7x38CyS3
         yK7rYkcz6nIL1NvDFXQeOKZBsXxgnORBi6YaBXlko6lazpDWsMgS4Alok5SMjB9EeIHw
         RqrsHLjWxbw6Hjwyq7N2auBXk+5bozlHXJFQF4O7JnGlIlG+1hm7GYdgLmtpgmtTCflX
         grfykX6W8qMF26EjJuwxuo9MsYXxXI76r7GiVFnQSsZfnI+pUvlOIE7lBMc03yWbVFqK
         2q7w==
X-Forwarded-Encrypted: i=1; AKwUvBwagiCs0Isacbdf4wai+xz2lqPMOvX4rQ4UoDL89HCvzOyW6P7WbDAKl6WCaC3aAcN+2hDDKtt79s6a@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/NmWS+688cCbxRrXHib7LwvS5oTQckBjBeCi3h0VzzXDuAKhr
	TJpNs1nrZFDT9/aJ/Xl8GHOuiz98UiBAccznLQ5/hC2nn7eEZ0EIsveUMQ5WYXpE/97cJl14oAi
	gY5e0oV9C1HwEpQdn25khdKiGcZMnyZcFRXqBE+FlUBh+PwvLI05WBw9GdIhgoJit
X-Gm-Gg: AYBFou2reMtBV2Rrl2zWchu+01ybBE9XwzfXAMJI00yPzwH+avTM+XBMNuTy7qYkrjN
	Z2Oy4+pcxQ0NduUkQRXUF4j/3Bfm3S4K7atfJfeAyM8e8PBEcc121riEaOd6UpAJ7jBhBKhocSw
	ehEvOpb2QnbN9LHrhGYkYCfBDPpG2fjUTNAbBE0sTXQa37fjAINFgdnB2r3Ivb780z1+fXM/DPd
	XcNVkw2Fc2PR1rE3UjsxCI/A4XvxyGwWnpjIi03lFpA9CapDN6RCUKml1ZR4YybwQsWASXVlq6m
	AsbyRt+MaA8SZ3Ta83NV85tOjlC+C0UAYNGxBkzqZFlc9wjSIruUY72x1IBNkGl39kYwroMpqzX
	P2hQLq/cVjI1IVc62EMvINQ==
X-Received: by 2002:a05:6122:8494:b0:5cf:ad27:3a67 with SMTP id 71dfb90a1353d-5ec232aa431mr1648641e0c.5.1793023970285;
        Mon, 26 Oct 2026 07:12:50 -0700 (PDT)
X-Received: by 2002:a05:6122:8494:b0:5cf:ad27:3a67 with SMTP id 71dfb90a1353d-5ec232aa431mr1648609e0c.5.1793023969822;
        Mon, 26 Oct 2026 07:12:49 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd5202d9sm327107466b.32.2026.10.26.07.12.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 07:12:48 -0700 (PDT)
Message-ID: <e8a228e3-a414-4b2f-bfc8-e3225063bc49@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 15:12:46 +0100
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
Subject: Re: [PATCH v2 5/7] mfd: qcom-pm8008: Add PM8010 support
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>
References: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
 <20261014-pm8010_i2c_support-v2-5-b395d2b3f668@oss.qualcomm.com>
 <a940a7e4-95c1-4207-91d0-6aa5e715c2c7@oss.qualcomm.com>
 <6a5124bc-2191-4470-9d88-7d41bb6157ca@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6a5124bc-2191-4470-9d88-7d41bb6157ca@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=G7GJgNk5 c=1 sm=1 tr=0 ts=6adf5fe2 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=1XWaLZrsAAAA:8 a=EUspDBNiAAAA:8 a=QnRxpVyo2ezrWcQ_LvsA:9
 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: u76_XiSE6R7UcH2ALN_Rgt0OMPVYnmM5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1NiBTYWx0ZWRfX8teAjMH44hdq
 mssLFw9jjFq11GzVWv+rZHRKIIlZrpjZ66z6iSZjMAPh+jDZotqfh9CqY7bSvUQkQQUKoz89CMN
 RxxKNTDVUSvoHeTZ5JAsqkqN38BQf04=
X-Proofpoint-GUID: u76_XiSE6R7UcH2ALN_Rgt0OMPVYnmM5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1NiBTYWx0ZWRfX1NGzl+pivar9
 wdO4mblAzX9MBEX0OGpewVd3QBjcDPKImlKolWH9Qf6zfHGuT/SgLrrmAWiSFhtIsPViBKj3uvq
 v1CYpY/+HiehNeswvZp17z4dKxxj/Am/IRLJXP5i9gtML0F5s07B7ZuPxytvnUJ9XGurN6j3x5h
 QmIkzI+4tz+T6Q85SZCnrAmqn/R+E+8svJJsnS8yIUx/CaaG4lbPwnRduT5saOvL970O11RZW+d
 DezxLfHKrecGUKc4e/CoUSto70S2Fjz+xaKDBMbfpY2s8Ji6JbP/IQ2AhdwxcZTeJBEhvLfFNvl
 11Pkb+9KZVqw0NSrCml4yDdd1wz6AT8y8dwsoE8G5fmuwg/alw4Q4l8YsHOZ84gWBgkzoFiiUhM
 ZU899Otb44iTLXKazi4jcpCK5k3+R6FrgAYjnuW0jmNy4USgkr1akSNksVVhB/49hkh/DdZD9mo
 Gg43r27qA1IXPILpQDA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260056

On 10/19/26 7:00 AM, Jishnu Prakash wrote:
> Hi Konrad,
> 
> On 10/15/2026 5:34 PM, Konrad Dybcio wrote:
>> On 10/14/26 12:32 PM, Jishnu Prakash wrote:
>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>
>>> PM8010 is effectively the next generation of PM8008. The device is
>>> generally designed to serve the exact same function - power camera
>>> sensors and the associated supporting hardware.
>>
>> [...]
>>
>>> +	pmic_type = (unsigned long)of_device_get_match_data(dev);
>>
>> I don't understand why you changed my match_data_struct approach
>> here just to reconstruct the same data
>>
> 
> I was asked to do this by Lee here: https://lore.kernel.org/all/20260922093327.GA2308615@google.com/
> and also by sashiko: https://lore.kernel.org/all/20260918165137.302631F000FF@smtp.kernel.org/.
> 
> Using an enum ID with switch() statement, instead of more complex
> match_data structs, seems to be a convention to follow in MFD drivers.
> For example, I could see the same being done in probes of
> drivers/mfd/rohm-bd71828.c and drivers/mfd/max77620.c.

Okay, if the maintainer said so, let's roll with it

Konrad
