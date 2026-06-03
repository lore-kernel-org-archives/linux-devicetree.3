Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB3F47CC7A
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 18:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780512708; cv=none; b=IXGmcaZ3lxEM+1+pXtPaBgdT7n+YaSNMeARMAn5CHPzK+AEFkpZatlpFIflC/boHwNAzZa2fy+RaDLsYYTCylCWDY2+GmcsNWSMuWY14NgNkWQmTDwa8mCKXJ22KBtFL+826FOKcUoE9tFkYjJgistZjOVnS/KFLG30B6iDN4IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780512708; c=relaxed/simple;
	bh=SlqtCY60mHsDAVgQllPjTztuC7AhA5LchoyFVMWeoAI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=UMORRj53eZF3ZSwsT+5TgA3YhGoVAAmfJFqz2Nr+H/rD3u4222O/4bfGCJm0Tve19/zYYKXSoIi6dICHuFJSuL2abVEEsI7Ac2nVKA6y7W39VWuaUJP3aImjDQq+b1AgOfTlhMhHJK3tMEAnLpn5tEGUmljnwpwBXlfBWQvRmqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DSSI+Cfa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dhak67tu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DSSI+Cfa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dhak67tu"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653ChKZf1946609
	for <devicetree@vger.kernel.org>; Wed, 3 Jun 2026 18:51:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lv8EJ1diTsBXv/odiyMibLViRdzTqWcOuv6X6cwVhSU=; b=DSSI+CfaYqpxskZn
	Rjdu0PKMxKG+Uyb5wU5NB9fqm72SMVzbOmy2uhC5y9v/y+sCaoGLbzawaI459RbP
	hoi/XvgnEXXW/2ssP3yYhRcjsvLsX3MfeoK0vqc/ySRCgF+McqG1MnlU5mXZ4WPX
	KNS8sC2gxJ7tN2eDYdrTDeKDhl38WehZSfh+tC2OCggjSosgizvYsdngF2Gu0LtO
	QLltNj/mW7ziAPRoNPpeB1ySABpukGjr0OEWQeIuFwEn5GrXF3i6N9BD1KrbV8l0
	PyFseuIbl3VM1V6nkXBlSqw/7K/jRsNHMs/RoeO6Yzu7Q1uQyR7Z6lIbjypUqzd0
	oKV4Dg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejabgm4xy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 18:51:46 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36d97a4e08fso3547035a91.0
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 11:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780512706; x=1781117506; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Lv8EJ1diTsBXv/odiyMibLViRdzTqWcOuv6X6cwVhSU=;
        b=dhak67tunAJjuAMrReSHbLCjz5Etk4uFOvDcDh1HnWzC4E+YtMWi3H4Wx47DWfnY91
         fMr8iRCUswu1a/ta9yDu7XdXLkj21t4bSRpgIrZbPjcuIXvcaVZMdrhh0TLdem/sMXXW
         jlW4dGvWN75hnIHV1xBTJEu049kEoeESTvOGqWlcl6oqUHasFZGQtKrXMUPFY7mttRoJ
         JkKWwlUD+fj7ekk1EwWffjafSRBZc9exEtXH+ItzX5GrHY6mdSEvKkqCUkHq4L8qLSuC
         fbHwoxt+yx4LqyCoiYBKPMi3JpcQ2k+ROAHyj1BOra2YoHLT2N6aPZJXRw/9U8YPkIxQ
         a0Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780512706; x=1781117506;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lv8EJ1diTsBXv/odiyMibLViRdzTqWcOuv6X6cwVhSU=;
        b=EWyEXkn8Eds6MC5kBswtSBcUWPHGMfe+/D7X7Zdb1bmUdVtGN2sYvXf6Bj4GkwPo/6
         T+1UN+EufwUFvoUh7Qf7A7g+niuAjdPT7j7zj08Usu3A24zOLC8Bt5AhyM4qKefiIdzF
         A9RCt8ZVXM0U3yiBg4VJtticmjOqOkdnSmqEOYV1HcOjqupBo92hvoIf+gYm+2AoA8rm
         nyn8i18DpAyN+QFG4R93WyshCtTZNVpkWOH/zGVJbufWQdarQGZJMrATfTyrHpP//0mF
         bfVTW7F0fLO8vGbPgXhMmNCLdx/xuSY4ux6DHF+vq4Y5CM4fCCYShT3SOUizHmAsa203
         vTaQ==
X-Forwarded-Encrypted: i=1; AFNElJ+OqInSOEI8Qk44mVbagDuKFP0j3ei+cJjBTcJ7i5Cev8floNTWpmI6tq1ftkyoxPLP9yuM+BMOjciO@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9B1SGlvqIZWjMdwW2oPTfIVdIfCShgDDS1cEL0jCM101fmkD9
	oWng4dnL/lQK69kdBFEMVqzlCrxKE8p3b4pGFsBfXJr1gDk6P9G7gWcTwNalnH+ccNYsz1UCEsE
	x/FAxb3Csh3z9zEsxXbZ/rtg88j2juFnK7FuAx8+bfyrvDhcio7IgBaDk5EgqzIJd
X-Gm-Gg: Acq92OHu2ebk0Q1B42U1QVlN8KGZgOi5PGxyVIBLb6VlLPXSFsGfZ7VeDXaI1M9ZbJ4
	oxTdXsCPdaEWgudTUtso/9QfTFSFLbooBNm0/Zu6P63Z0Yn6QXlIwovDSqnZ8doFXqL4UVI6Gs7
	4xtoenYbKmkNrvqMPecAFCIFpoVA34jKhbcgt/N/vseSyJ3+Uuqrdei1mZOglz9H901aL3y61eE
	QlLzIXJqTQ53Ll/95OcaEVWsAdOgqmx4F8IvDLmmeSA2G7d4vdhxJpjIhNoe4uBxs1r6vcjPBsg
	z93AhweLJbpytWbz/oz5gRBpDZ6hkVEzpfV7VmpkBkzCZ+a2c9Y4f8xuWufHsd8Xc5jMKjkVLGj
	qceKYO6DkOYLYY71fqfFgU2Rai5+2jXzalMIaUzBfnrhXiIw+Ghwnmmc67SgbOKbdM9f1
X-Received: by 2002:a17:90b:2d8d:b0:36d:ae6a:22fe with SMTP id 98e67ed59e1d1-36e32288dc4mr4701713a91.16.1780512706175;
        Wed, 03 Jun 2026 11:51:46 -0700 (PDT)
X-Received: by 2002:a17:90b:2d8d:b0:36d:ae6a:22fe with SMTP id 98e67ed59e1d1-36e32288dc4mr4701693a91.16.1780512705590;
        Wed, 03 Jun 2026 11:51:45 -0700 (PDT)
Received: from [192.168.29.31] ([49.43.225.172])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36e6d169abdsm2001534a91.0.2026.06.03.11.51.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 11:51:45 -0700 (PDT)
Message-ID: <81680397-3bbd-4f66-9166-546c8fe753fc@oss.qualcomm.com>
Date: Thu, 4 Jun 2026 00:21:32 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 08/13] mfd: core: Add firmware-node support to MFD
 cells
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger
 <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Sudeep Holla <sudeep.holla@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260514-arm-psci-system_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com>
 <20260514-arm-psci-system_reset2-vendor-reboots-v22-8-28a5bde07483@oss.qualcomm.com>
 <20260521112638.GD2921053@google.com>
 <CAMRc=MfqaCjiALZyVBHQs=Taft1M9xmNTFvQHWPrd5PgcTfJDQ@mail.gmail.com>
 <20260521132419.GA3591266@google.com>
 <CAMRc=Me5QS4xA3PJWXNuRP1N_C+w3sP9ZvqH36GNh2Ebc9hwcw@mail.gmail.com>
 <20260521162705.GH3591266@google.com>
 <CAMRc=MdiwwX_XH7JFW8HuLvYA_ao50fjj0Oip2WMM4QROHRiFA@mail.gmail.com>
 <c034a7c5-7215-4e96-80cf-ef0c51f8291b@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <c034a7c5-7215-4e96-80cf-ef0c51f8291b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=R6sz39RX c=1 sm=1 tr=0 ts=6a2077c2 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=eYGGw6GSBUcLogt407YXxQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=7l-9YH0O8PdptT7AxrwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: PRZff3YriGm818hdQG0D-2v8rqAKn4Ln
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDE4MyBTYWx0ZWRfXyhMtapHOAh7A
 bNJQnJPRlbAipF6oeRP/NeYfIJDG8V111UoiZxZcyg1I1G2ipND0pWPD2uTTfdYzW/ePWT8wqvl
 z8Qer1o/Z6ZGZ7pDpy2GKZpv7aQ9ZchOCeAf4CoCaXQaFPQH6Dy0/RvzUn6w9EF8RszddWJjTCz
 9/4yBjuJTmVA002xK5EEXRbVrMXXRz66rYxGz7LgAr6Im7LolAzj5i1WqUheqYojxDg3+TA/gs0
 guGwQCj0bx/S2IQUdNmcjcsqy2AJAmFK80/rHcpOYPzvIKDZbfiKQ7BnCC2pcXmtCVV0QwSEA0S
 g5NNzLSt64lAgXllrgKuyxvm4squIVisYrtKQjyPzPxvKkPlUqhKpxBCi8rGvxAdF6tYzKpT8uQ
 FmZRc+Rvrmekofq2uwO8fKpjx9q1WKo0aIaMFbemjRoxSgEt0odhlF5v1z3k1i8VLtgQfyB/Bzs
 ujy/1cKtiahTnV4SHGA==
X-Proofpoint-ORIG-GUID: PRZff3YriGm818hdQG0D-2v8rqAKn4Ln
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030183



On 25-05-2026 15:04, Shivendra Pratap wrote:
> 
> 
> On 22-05-2026 14:38, Bartosz Golaszewski wrote:
>> On Thu, May 21, 2026 at 6:27 PM Lee Jones <lee@kernel.org> wrote:
>>>
>>> On Thu, 21 May 2026, Bartosz Golaszewski wrote:
>>>
>>>> On Thu, May 21, 2026 at 3:24 PM Lee Jones <lee@kernel.org> wrote:
>>>>>
>>>>>>
>>>>>> I suggested it because of its flexibility. The alternative I had in
>>>>>> mind is something like a new field in mfd_cell:
>>>>>>
>>>>>>      const char *cell_node_name;
>>>>>>
>>>>>> Which - if set - would tell MFD to look up an fwnode that's a 
>>>>>> child of
>>>>>> the parent device's node by name - as it may not have a compatible.
>>>>>
>>>>> Remind me why the chlid device can't look-up its own fwnode?
>>>>>
>>>>
>>>> Oh sure it can, but should it? I'm not sure it's logically sound to
>>>> have the child device reach into the parent, look up the fwnode and
>>>> then assign it to itself after it's already attached to the driver.
>>>> This should be done at the subsystem level before the device is
>>>> registered.
>>>
>>> Leaf drivers reach back into the parent all the time.
>>>
>>
>> But drivers don't generally assign firmware nodes to devices they are
>> already bound to. This is racy as in probe() the device is already
>> visible to the system. There's no synchronization of device property
>> access - properties are assumed to be read-only for a registered
>> device.
> 
> thanks Bart/Lee. Any pointers to take this from here?

Hi Lee,

To take this patchset forward, it would be helpful to get your views on 
fwnode based addition in mfd-core. Maybe, a member like "*named_fwnode" 
in mfd-core and then a lookup logic, or any alternatives?

thanks,
Shivendra
