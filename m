Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FAFC35B633
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 09:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779701675; cv=none; b=mqwHkYdSFONkoIAgx6bXYnXTYI0Vwe9uAv1Ila7kizuz1Mb1M+3bKLUAcN6WW3JE9dbr1etMpi5YXTVFmfoF7ScOGf5jlMacruibR8/0sf4mlgsEd+Uy+YFx6FSS6Smwzd4DMibQTgbf0VmHFdcKumWOsFIZuRFrbHociiUKF1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779701675; c=relaxed/simple;
	bh=sHZwQ8kTbtkLCbKSor+QBOmkUwZQk6J8JDiHoGrcmzQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UTGyzjP2DPX+Qdqw44fZCuNuG98D4s9jM/Ncvb/EG1LzMb6hXTyV7akUJxRj0vOV0KkgvvzbjDUkCKd3lVJEM/fjmT3mi4x2nXXsqTBRmeDHOzH/TueRxMaqD8OkuPymxBc5XovuB7lez+tDOfWGzVnzrMBMIF0qbceTyctE3YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pecBBg+S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TDPB4Lqx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pecBBg+S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TDPB4Lqx"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P70YK51688066
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 09:34:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NWtZANLHzw4I/IUILA+giiDj3hDdk4vM2TOMGAB+8uo=; b=pecBBg+SsBTrRmQr
	Pg3TUzF8MmHBHR09X/FqARhTkfJBdK/6RDtiEhRtj0mRcmkDgKDSdOyuEqytApXq
	WVyX2QxasQhCfnhMP1AAAa+uO8xVM0J4enEU1Tuw/qqDW08qzaNautouP7MWtx5H
	l0e14uTrUywGuttuq2vndYtaxZOjzhC5eBdrP8HGvsaBvTQj4qNigwBwMGN/mtnk
	gOkeXwzCYrLxwvdLGa9b+AqwunWbx9/zRFTvUn4dW+g53zBJ9Ebx4HKlEOWkPiEl
	2XgYhnhjsZ/MxUS/iGyWahjRobN1Z+WsZDjBbv8HOAphLPS69hhTRPa1uX1Z+41p
	Vxg53A==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb4asx31x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 09:34:33 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82fa1c94b37so9513254b3a.0
        for <devicetree@vger.kernel.org>; Mon, 25 May 2026 02:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779701672; x=1780306472; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NWtZANLHzw4I/IUILA+giiDj3hDdk4vM2TOMGAB+8uo=;
        b=TDPB4LqxmUonPgyOf8cS2BdCGQh6NvvwB4O+Mtc9kvyeXegmx2nJwyVJsAB41hUqbo
         /QGKYEt2XKsyfq210116/9elcLUyHOdRhcBntURiko5s8F2Fmg2nzcNBD9JZ596r+Zla
         x4R6yahYjyU+V7bWgnZEWL+moHo/ckrpKidcr6YkAggiG2/W4PxlU5Eg+8ckChgHhTEg
         AU61yhxnVq73TR4uFiP8Q+fcLbWDbI9sHwpP1xmKyZFpHyKbK1lCloXYYFMHcYWVhMHV
         pR/lnmgNX0FSSOBpkPDWPTBnbDpXfY3LZ+SyeE2W+Q+llPMLDQarYcxmA6hecmUC3fwq
         Mp6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779701672; x=1780306472;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NWtZANLHzw4I/IUILA+giiDj3hDdk4vM2TOMGAB+8uo=;
        b=B8cy3MPJhjho71lNrbxjF3ffWA7VQCn+hkMlWPfXQsH5JAsqyKBWi+LIJLibIa4JIM
         SzhYJQNsgicD+STGuqKyr48QykPV9ilZzP9Jw56T4PdCn8cs9wsvrYYpJY+i/YTJvLJB
         /F87qvkEw7NB/7+4G2SDMco7oN7mIjTZPkAfUzbIsD9Sa4ppmWe87qdEt4hfwPabYmoP
         4l6nxMOVxJD2BUI9BcBeq+jSX7AJTuaobF3RnXbbVYgwmUZZWKPcNNPk0BpZgAEUqaf5
         5ud8mlg6hjrgi/Scr8BRk672OCNJ0zhgr0vmlJMU5KAzN4koAM0P6iXLLsULW4cbqZPS
         TghA==
X-Forwarded-Encrypted: i=1; AFNElJ86tzcfVW/dicvXHGJNa14RB1lTYj2X160wocdBQlJ03VIb2DyQkXp9KYoziT8qq2MiHKlVFOOe0Pfl@vger.kernel.org
X-Gm-Message-State: AOJu0YxCYgxCoAcxaUShQmCXqpN4PeSVsyvnZGAMr5fBSazXBvlJUxJB
	uI3d/6BOL/V4YXwUVDukUTfsBt5du+bhIQQ5Dce16D/02VPpXLtAFXoF52ZFBEV/jc42KD6wUmI
	TRa/JZq7g3No6gxM42hL696QPaS5dkYiHGpTRoR+VDIQ3IePipfYRW+9kVNCjaJGc
X-Gm-Gg: Acq92OE01BK9pE7QCGyiYQzQ9Jr49IBITE5TAPSA4IEgVLO7hFyEk0+ab15ACrgv4BS
	M0OVqEjLtoewu8ytszPO/2GihQtbS5C5EjwY11Auf27TGLmV5AbwQCfXw8sCTYh47hnPQMyqq1R
	R9Z0cRPF0efMbh7GII4cZofvd6QZeq/ZFiNV0sxoXmSjqRCcJeJoRbtYg2ec9DluQKsDLNcDavG
	IPLT9Nw58W/g4ga/lAmOn+8skWBlImrVK9hlx4Id/t8/y1ZyhufcBsLSw03LGiL5VWZ59p1XB2v
	jrCOyPBidjvTZRmpFOmCALcyvnfXLxQS3N0+Lvr7OwyBRVUf/dNmXaHq42HbVly38xWtPl61haq
	3p7O32pLviIr89B4Zt5JyKQ6z2TIhwi/n4puQ7Na7B5Hbcg52pcHYqFlh
X-Received: by 2002:a05:6a00:3c6c:b0:841:a0c8:6e9c with SMTP id d2e1a72fcca58-841a0c8731dmr1853833b3a.26.1779701672287;
        Mon, 25 May 2026 02:34:32 -0700 (PDT)
X-Received: by 2002:a05:6a00:3c6c:b0:841:a0c8:6e9c with SMTP id d2e1a72fcca58-841a0c8731dmr1853810b3a.26.1779701671783;
        Mon, 25 May 2026 02:34:31 -0700 (PDT)
Received: from [10.219.57.229] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164fd80cdsm10474835b3a.49.2026.05.25.02.34.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 02:34:31 -0700 (PDT)
Message-ID: <c034a7c5-7215-4e96-80cf-ef0c51f8291b@oss.qualcomm.com>
Date: Mon, 25 May 2026 15:04:20 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 08/13] mfd: core: Add firmware-node support to MFD
 cells
To: Bartosz Golaszewski <brgl@kernel.org>, Lee Jones <lee@kernel.org>
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
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <CAMRc=MdiwwX_XH7JFW8HuLvYA_ao50fjj0Oip2WMM4QROHRiFA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA5NyBTYWx0ZWRfX7r1S2dUkjSG+
 OVWt7nJnqtza3b89a2XLMpD3rkQJ4DHKRaqrheKR4JyBWQRZFsDmTVHAzOjFhsCz+d7JQIgRX9x
 tEmEbLPFjXJ5t0Oq6CfW8xCNwEsFInxn1sm3hOPdJBjw5BwTfBJBWOYGIiRi2ZjTfrEHX6fCS8h
 vKen4eUwHGeQ0wl8FFXJD6nRcgRH8wwzmij3poDf0Ej+saBmjCWWuwV5Sevc7B/ognbX/uGz6kh
 +ZBtQNIkYLnutD353M4q8fzorpXKP0vD4fA5mzjqx4fH752gh014uM7lmoUrXI6qAvfUTlR5a+V
 Qp6sTMC+OQl9H+JrAr4kC7dpFZJCpbZAAs0SDgqvz5+ipRfRqDcpn9PFT15eGRrUnAiKerIy8ob
 L0Jc9t5a3ysNJtfjupHYNL9Pv42rz+tTs3OR1WMj/MTZtsnOLJtkjFK6Oe38v+y1Rka1YAHwE7/
 BQRL6bK1gQK9QdP62lQ==
X-Proofpoint-ORIG-GUID: ZoyX_8MXsCUIDUKatSKWjjNBRXuUfeRO
X-Proofpoint-GUID: ZoyX_8MXsCUIDUKatSKWjjNBRXuUfeRO
X-Authority-Analysis: v=2.4 cv=c6ebhx9l c=1 sm=1 tr=0 ts=6a1417a9 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=VqCRv7ZaHuqyx2qM4PwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 malwarescore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250097



On 22-05-2026 14:38, Bartosz Golaszewski wrote:
> On Thu, May 21, 2026 at 6:27 PM Lee Jones <lee@kernel.org> wrote:
>>
>> On Thu, 21 May 2026, Bartosz Golaszewski wrote:
>>
>>> On Thu, May 21, 2026 at 3:24 PM Lee Jones <lee@kernel.org> wrote:
>>>>
>>>>>
>>>>> I suggested it because of its flexibility. The alternative I had in
>>>>> mind is something like a new field in mfd_cell:
>>>>>
>>>>>      const char *cell_node_name;
>>>>>
>>>>> Which - if set - would tell MFD to look up an fwnode that's a child of
>>>>> the parent device's node by name - as it may not have a compatible.
>>>>
>>>> Remind me why the chlid device can't look-up its own fwnode?
>>>>
>>>
>>> Oh sure it can, but should it? I'm not sure it's logically sound to
>>> have the child device reach into the parent, look up the fwnode and
>>> then assign it to itself after it's already attached to the driver.
>>> This should be done at the subsystem level before the device is
>>> registered.
>>
>> Leaf drivers reach back into the parent all the time.
>>
> 
> But drivers don't generally assign firmware nodes to devices they are
> already bound to. This is racy as in probe() the device is already
> visible to the system. There's no synchronization of device property
> access - properties are assumed to be read-only for a registered
> device.

thanks Bart/Lee. Any pointers to take this from here?

thanks,
Shivendra
