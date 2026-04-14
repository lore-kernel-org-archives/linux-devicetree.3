Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BCE73E6DDB
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 15:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776179400; cv=none; b=Ud8yEugytUlNun96qJYi1e2IVqjPciuVqCiVzODsRoCsZ6ZkucJvbYTqrxJtth7o4TFfcXvPeFJDN6T7WVL+bSJv7DPcH5/vklIUYXZXE16e1XRyfo5UePKleXreY2vuPAHT1pJfjqBUqwy9+V8naeoQ83/m8Fp+vDbZ9Pgzp7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776179400; c=relaxed/simple;
	bh=QthrlpRVWSsd0+06nhrQQBDv/w4e9HEzAJhHLln58nA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Re4PhorVQku9W+o2fU31ZjFAv333YCsLRBwZ40/cMSZTVjrG7DSdzfMD3Qh6xWG6cAz/7Z9VbZI3qMt2jWqBYYbkqrAoKtwd5MOT8slNJggtfEV9GZRhXoIncfiedlnV1pIhqPw2jU49CsiSubUIFBcjHFKIitDmqwb/IdkghbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=afOQLkzc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MxokLCAy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="afOQLkzc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MxokLCAy"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63ECn88L3157262
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 15:09:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/I3Ra4jc7Ybsas9Sg4CpJirZh6oaKtL8wZlkqRTGAoc=; b=afOQLkzcTGWSNRme
	ai6D7YmGiEJD9qQgtkp8ABtlW2vYNLYCn9qgEBa43wlFunWdqdIWs3zzbSXW+TRf
	82qtOcZcJRSpWISDTIsBETnVXUg8AzH4H6WpCKSJb3dv1BlBhWzHaW9WY/L1Czjv
	FXRZAlWxqvfwLveCzWQFtc/4ONC1HfgG9SD/Ff38dIKWmEMOMGeEPcU9k+t8HPsy
	A7/NSBqdjL+52zIfAU4ZzqjiTVCLald8JQMuTpzvCs1WGozBtEBMuuFJy5iz3ny+
	eV24H4wlIswCRT5zHl7q+6Fv94H8eYQJYCZ5vDL3C2Yqkr0O4N2cTa94cdJkMJWZ
	l+X8/g==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86bb839-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 15:09:58 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4726bca0bcdso988631b6e.1
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 08:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776179398; x=1776784198; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/I3Ra4jc7Ybsas9Sg4CpJirZh6oaKtL8wZlkqRTGAoc=;
        b=MxokLCAy24X+cLeGUu1KuvO+L9FmHuv0b1y8qKnFq08luYWJQfEitSc8oQaEl3KUSG
         lor8OHKVCPLR6Yg4C8nlw3lbuode0aV7W4uKAEb67OWIbrR+eDinphYtVMO7Y7oeK+Qr
         uaCaXViyKYIusHyg9Ak/dCehEHXEXqjCmekMar2QuHWAAFoirVg2DPp3fJ/KF+5QWtgw
         lskdoVBvRA70my3cd0QyrC5qa4cZHEUpaDiKOdSUP0lI45UxAoFjuVkeSysoMUTP4E5c
         pec0T3JAwOjrvMDEjvcJzpn3MfWruwH7pwcjIpaQjh9EKiggHhYogUEih0nXwEK9S/kP
         MnAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776179398; x=1776784198;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/I3Ra4jc7Ybsas9Sg4CpJirZh6oaKtL8wZlkqRTGAoc=;
        b=DY5wvfBLH+g24VNdgGv81aYDoyYTbH2haS069fL4ka+zAS7hAsmMTWgf5KE+OKZ0ZG
         cBozABsg7po32dycNeVCGeR9q6lsf6AuQQ/fVTn0tycny3/fAWj1T2zVgWk0dIy3YQUa
         d3OLDxS63NcV5ZoNXDOKCtyfoupKl/qn5vJm3//e1hjtXDOL8pJ0NcPqBoH2dy+8+mq+
         170zFyFj9VO3fDnv2giWzauH8Cgav6BbDVmYLgUMn7DIdWT3iNc8EC/y2fLGeiJaRa5N
         DD0Y1wdgeKf9aAohOO42oOqrQr+50KxnmsC+l6k5G2y1b5bndOAAsShOnRQLK0K7xn5a
         lmbA==
X-Forwarded-Encrypted: i=1; AFNElJ/v4hkpM05/7sUmW4vVgolYIn531kOSgoQobjcdo+xd21JUOYc3/k+tWVUg0EjtsVVzfaSSsprCTWxu@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8bj4uae9i8ebDDPybUWF5OtaxyOMSnrmDvhG7nl4Acoj8nPkn
	fhsSLWno77G21ibT5Yi6KkCDbtlyESPP4hw+po2lx3dPDxxZ94HCdccGg/jXWrSrvn2boJpY92q
	BOeUZbaAtvKoUgLfqIpjin+uhbRYsEJAJyUbaAdM5GGuH8WYF3PDn7IIAWj7+FU0+
X-Gm-Gg: AeBDiesRR8+UX0B+dxK93uZzhb1wkl9yblrcfFxrGxQSxyF25SPspR3ia/dNqoEGHKC
	FgOt7JHtXNMO6o1sNpSla/ba69wTdFJ1z8AXYUphUOyrNouhbeHEWCGroSwQIJiblZVXQ632pHZ
	/xbFOq85ywSGxTikH0f8Zomyhy9v2dC2uXaaB2zh+iyvfjtRrMbU3degPjd+GKYRWWzUox/JK4u
	zqMqkv7khk4obc4RxTp2/GUhhFsx/gJAblMOKitJ76guEP3js+DpgEBI/KgH0VlsKfKBeneyq6N
	EGuOMki2GA/SW2WfjLB2H1hHRS6zdwyG2adEnp8Q5QIbc15o850N8wlgYbiEL3+KwdeZ/Ue7wkj
	/B3288/NPXWokWGgSK3txKapRwa4gHevGOWSU+tEgqpl7rvLaXJD83Ou4fUxIVNa1m+KxJ8hf/Y
	sVDb3QPBReidgs6A==
X-Received: by 2002:a05:6808:178b:b0:46c:e542:cc16 with SMTP id 5614622812f47-478994928c2mr5359389b6e.0.1776179397622;
        Tue, 14 Apr 2026 08:09:57 -0700 (PDT)
X-Received: by 2002:a05:6808:178b:b0:46c:e542:cc16 with SMTP id 5614622812f47-478994928c2mr5359365b6e.0.1776179397084;
        Tue, 14 Apr 2026 08:09:57 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e5c52b3sm424730566b.30.2026.04.14.08.09.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 08:09:56 -0700 (PDT)
Message-ID: <3267eb10-2fd2-44f4-976e-aeb4f5014085@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 17:09:53 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100-dell-xps13-9345: enable
 onboard accelerometers
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Aleksandrs Vinarskis <alex@vinarskis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, laurentiu.tudor1@dell.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260228-dell-xps-9345-accel-v1-1-daf9e3b3b5ee@vinarskis.com>
 <630bcc07-5290-4099-bdf3-b7e37105619f@oss.qualcomm.com>
 <kFzSXZV8ReVKN_rvfVDZw9pOzHeLI1ia9bepKas6qG-7G4WiRKk1RcvEhMnPrKrFDvRzLMUSIZgnDY5oerb7kdSBreCjnxJEdPZG9iyYp9o=@vinarskis.com>
 <0ed387b7-c4ed-41e7-bccb-eb1a96064c69@oss.qualcomm.com>
 <l3cfeezstqrabhgba2xnzciztfwp6ijunzemlb5uanpxhgmscu@kh3jdcc2dhbj>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <l3cfeezstqrabhgba2xnzciztfwp6ijunzemlb5uanpxhgmscu@kh3jdcc2dhbj>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDE0MiBTYWx0ZWRfX7w6OqXroXBQv
 7OT5P2PFHTR3M/keIrvo8DzdMIooSYDcUKegcMgPc7X2Y9O60+DeNdoCcRLGUeT39XWjdqDIa6S
 kO8fSM5SNcQFTGN/ljWVPKUuIcHaojsp0a7L/SHLpEzTBIEaDVtmEFyK5teLRSMZYCBFxeZqg8P
 4HJSYRTUxF7II+hpvVhsFrp2+4PqtXz3+rJMFuQO2RSHjgmhrcOVoqIUZr3AVgkTpWhB4T6yXDB
 QjHOwgJteMSXik3RtY7yTliBOyAZq6p20+SkN6S/UqRLLPBhSHFi6yUE9iqct3SJCPmL91IMJmt
 qhWlC2ew2P2yRPUNoDvsp+uvTgw7+zRWYLfKImEtL5gPddtBGx7zXruNujI0Nj1Djp/S43ArJOW
 Hg1ni8Zdg/L1qYM6PRQ/rY+mW64yKycoETukwa/6A4rU93TybtHO1nUm5IqTKGR54ldDm5yTHLz
 p5g8XTCEd81SWl05Mhw==
X-Authority-Analysis: v=2.4 cv=MahcfZ/f c=1 sm=1 tr=0 ts=69de58c6 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=SXzkmgPmAAAA:8 a=EUspDBNiAAAA:8 a=swH9GFkNOy5Cv5XthtYA:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22 a=EWLf6cg6Bh5aS0AxDgDu:22
X-Proofpoint-ORIG-GUID: JMjhG-F4IsoMyeZ2JIbC9E6Q9-KBGbwp
X-Proofpoint-GUID: JMjhG-F4IsoMyeZ2JIbC9E6Q9-KBGbwp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140142

On 3/23/26 6:05 PM, Dmitry Baryshkov wrote:
> On Mon, Mar 23, 2026 at 04:06:53PM +0100, Konrad Dybcio wrote:
>> On 3/2/26 2:25 PM, Aleksandrs Vinarskis wrote:
>>>
>>> On Monday, March 2nd, 2026 at 13:14, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
>>>
>>>> On 2/28/26 6:46 PM, Aleksandrs Vinarskis wrote:
>>>>> Particular laptop comes with two sets of sensors:
>>>>> 1. Motherboard: accelerometer
>>>>> 2. Display/Camera module: accelerometer, ambient ligth (and more)
>>>>>    sensor
>>>>>
>>>>> Define both i2c busses (bitbanged), sensors and respective rotation
>>>>> matrices.
>>>>
>>>> These GPIOs correspond to ADSP/SSC-bound QUPs. It may be that you're
>>>> poking at the same bus as the DSP is, concurrently.
>>>
>>> Indeed, Val already pointed out that there is hexagonrpcd to access
>>> sensors behind Sensor Core from DSP. I found corresponding .json sensor
>>> files in Windows for all x3 sensors, but could not make it work yet.
>>>
>>> Without these additional things in userspace it does not cause any
>>> conflicts: I've been using this for a week now, no i2c communication
>>> issues and device orientation information is present.
>>>
>>> The question is then if we want to keep this series which ignores DSP
>>> capabilities with the advantage that it will work for everyone with
>>> the new kernel vs doing it 'correct' way over DSP which requires
>>> additional json (and binary blobs?) and userpsace configuration,
>>> meaning that most users will never have these sensors?
>>
>> I don't know what's the endgame for sensors. Maybe +Dmitry knows whether
>> there's any action on that point.
>>
>> Going through the DSP allows you to keep aggregating the data at close
>> to no power cost (""low power island""), notably without waking up the
>> CPUs if there's no other work. That, plus I'm somewhat skeptical about
>> going behind its back, since it may be that a firmware update or some
>> other trigger makes it start trying to communicate with them.
> 
> The sensors story would require DSP libraries matching the firmware,
> sensors descriptions and several still-closed-source libraries to work.
> There is an open-source libssc project, but I don't know if anybody has
> tested it on this platform (and it will still require DSP libs to
> function).
> 
>>
>> But I'm not 100% against this either
> 
> I guess it is a necessary evil until we get libssc to work on it.

Aleksandrs, if you're interested in trying that one out:

https://codeberg.org/DylanVanAssche/libssc.git

Konrad
