Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5755F3E3DA5
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 07:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783582933; cv=none; b=nUT2FO5DJSMyJLibnhICPo97gzodkamfa0sMCDpZ4obP91tDCi64KFikryKyNGSt4W3VUe2BJNa3/Z1/52c5F+4Th354Hx381Q0MpGUq7DRk79Jt7ziBIHvhkn0Mogu2xjoTaHr8Pg2Pd22rHkhxYr5NkF0DhSvA+fcIiy9UG3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783582933; c=relaxed/simple;
	bh=bPecE3m2OmnvvsAJ5paIV4IX5QUb0uPCLNDhDlmDFJc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ePe49cJ26zct31YXTDgc+iyXOKV53b4hNW13Bt7LwvDSwA3rRszneBaewWVsqobqsmlk+ZYt6rTNlsL597qM7tiWkBKV/H0iHIWkStN8qnDsLqbtZgPKNzpJlxM1AqqvxWQJtoIL/teUGSQLEGCorZljrKf8Cp3g5qATd/W/yh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZB+EWCLb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ew3c2/u5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZB+EWCLb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ew3c2/u5"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66960a2B837432
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 07:42:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ddJ7mGajey7LP3OK141F/vuXmTY3mQQg+XD/eLWAZHQ=; b=ZB+EWCLbVRB6LAVY
	FlMili/eUg16k7aTqUKZRX+ZMpA2U7vuegYR5qNnZW1RwHoEcP0+uKC0mP9Ub0Z4
	JjIJiYLu/dLPBSdlAabzq/UUwSZ7Ti+dguYtNhoyBOVIRnjrY8liV/5w9smn96/X
	nwMvx6RrDF2KbPojgd7h+GLG3TP8G6P6nUrn0wC3PxRH6PgsOEfksA7tJ0G3qppN
	3cUawxbH8Be088noUzN8PduC6dAhZN9szo18STmSgbqrMI6AkpIXCYYDjQT1C21K
	zONAgxjidpJ0xHDxaoOOcroG72xYNNi8Oz7ilJM3/jWVq0T/gxLSneiwT1RGZU5g
	hIkDSQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9sqwayxe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 07:42:09 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c26012cd0so19132811cf.0
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 00:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783582928; x=1784187728; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ddJ7mGajey7LP3OK141F/vuXmTY3mQQg+XD/eLWAZHQ=;
        b=Ew3c2/u5/rIcCDlu2Ao+lMelsIJBb/bph9WEBSD0JbULnfTJx3IVT+CnClr5MLxNbL
         x23jP+ilN8NTw8t2NeDbzbcn+V01iyGXlVMdSoJ5wfgw9a20RXrR6SdpT17ASntEzo9w
         pt1Y9sKBthnHWAQLbAma9kIGU8FZcseb0Duz9zKcZWaJpB894PxwT3TSLBqeUR9ptRFd
         gSDYoy/rLZAVJLe5SA4vbfQhj4vShT4jCxTPdEmk+3JPP0on9SRsuqEXebIquaZxSyBv
         1HaExdiJomY+SvdQQqGIS4kNAxs5LoFKvxWD+cH56DlILyEzE0dJyufvZAHk3GgWm2K8
         DsqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783582928; x=1784187728;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ddJ7mGajey7LP3OK141F/vuXmTY3mQQg+XD/eLWAZHQ=;
        b=g2TmL3J6KnCVo7dUixKMy2S0h+ffvI7WjH6spF1CK/qDEjd2znJrTS1J2S9jjv3Ngo
         vXDgogUuNAlrC4iMiz61Qhy+BwRlSG/urOOdXUuf2tDxqmJ+8NuqZvc61ajjw3s6pOK2
         5xKk5XwIEFNqE8997y0ND2H2J8zd1q3wDQpxY3HhlHtkxTg5pfgDezVuGxHcZVsowZC1
         7YO6EK+EkyqY4af/jMqzu0v97oulaN7iUMEzYRDtwk6YVHhEvHx0lrfrKqIgE0ik8IP+
         D102LIqxqjbrfAgjBd9Vk/rDP1GnorYrKzLI1/3IS/JU9n3xhTPzzMt4iShnxbhxSx70
         KZpg==
X-Forwarded-Encrypted: i=1; AHgh+RrzGw0PHBkwuhn9lT6KtJeUxeh5InN8XFS88aSYpa3RTvLFgwO7aCCraW5kFQofT3u5vVPPfnKiBBUe@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb+iyZOXwBuWipTh8kQ4rOVNtkWpbwoiwVtcZBBAs8+gTI/CM6
	St8C7X0t+PkCTKi+Tl0w5OaSTKcM4usSTDKHiFBs+6JImhCFgT+eBC5X4LCdMa/K9Vk3dwB+4C7
	Y1O6erU5TU9lm4nRYCAsu74+mPBrnBmH6nmNoNkUaTkdTdWBEe5s08gIYCU6xB+j9
X-Gm-Gg: AfdE7cmta5oO56eEWOqZs9rroKjtyqaiqfFG6ewxAXmWNi25BFBQC6zPDSNwSnzolWZ
	bwor77C+D9yB2z+P0+2cNXLRj95+fFFQrqxPU65h8BK6v6CqtBzmFAk9KunqV3/E6Id8W6NMS9D
	3vJbgvSgP0XYEQypbUuOn5x8aKY1W+rbjTZQrk0ZKtHmW64a9uj2Iv/zLrLsSFhlwM5H3xF26Xd
	IPuRqbOGHkh9p0gxywrLVK/O1cIFqDQLM+qU1PR2wguLzQpOmo2OrAkUnXSFrmO7I3SL1W7K+T0
	16ulWCakzlANnRTyIG97+8hhxWAk4/UBJRIM+HsCMOafVIKTkuMuut1YTATPnpWZyy2YmApXBN8
	rd781GPynio+n02FxwD6zS8kBTieudQhnUOcAmckbIfFp
X-Received: by 2002:ac8:5d02:0:b0:51b:f8b3:3d4a with SMTP id d75a77b69052e-51c8b54a8f8mr64315131cf.50.1783582928498;
        Thu, 09 Jul 2026 00:42:08 -0700 (PDT)
X-Received: by 2002:ac8:5d02:0:b0:51b:f8b3:3d4a with SMTP id d75a77b69052e-51c8b54a8f8mr64314671cf.50.1783582927994;
        Thu, 09 Jul 2026 00:42:07 -0700 (PDT)
Received: from [10.111.138.111] ([212.136.9.21])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19d799dfsm10078060a12.17.2026.07.09.00.42.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 00:42:06 -0700 (PDT)
Message-ID: <54250163-678f-41e7-97d0-6596123367f1@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 09:42:04 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/10] dt-bindings: firmware: qcom: tmd: add TMD device
 type constants
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
References: <977711ef-c1fb-4735-b82a-4ca2f4797f51@oss.qualcomm.com>
 <8ad14017-bce7-485e-9677-9cbf8ecb2742@oss.qualcomm.com>
 <yvggh2zs6qkuyuzvwydkecswnjoyba2d7t27br6xpk6d2csp53@i25g6okdktz5>
 <10a346d8-fbb1-4142-a650-507c3917b8f6@oss.qualcomm.com>
 <dv4n4ntnfvhouv23asgshgs7wcolkmqs7lbuni52maexo4s44x@4bqhf33x4fr6>
 <1aca8d60-8e39-4532-9095-a5260bba76ac@oss.qualcomm.com>
 <e7eho7ezujbrdzgumshapf2r7hu2jaujib7lvotrqvcj5er5ut@xpd6l2kgipqu>
 <9dc4b29e-e9fb-421a-b789-eb16a68ff915@oss.qualcomm.com>
 <2tu35aavp7sc2npni33ky5bve57idzy3bzp2pk7eh5lryq3r4v@gmm3dhayu4cf>
 <6f179f96-fdd1-4fa9-b26c-df7372eb6d20@oss.qualcomm.com>
 <tq3g6lpb2go4nen3ferx7kzs5g6sshc45ayfyvhjmc3rv3jv7p@fhixqlwbtooa>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <tq3g6lpb2go4nen3ferx7kzs5g6sshc45ayfyvhjmc3rv3jv7p@fhixqlwbtooa>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA3MSBTYWx0ZWRfX1RA9tch2lMLz
 naUZvomNLM2QBx15GFfODvQgxsAA7h7smiaa5B4ewe2Wo/JlWijOf2aPWXJNNWeABeNWTKHkmYT
 7plHPoNEG4zEmgR8NXL4J/lP65QLF5SxMKKDyhxU8xA2g62n3TraJlzNolGDKl75TOl05oQxry2
 V9JN/HSL3qtyqEYx57MJqWbojF/0eg6kBrgfdP+2F2v8uYnuwUgokormemB4KrFF8Dlz5zpl8UV
 Z9oB+CdxL9H4yPkki+JNExnep0qiMpZ83CVTrXsw/CHYxbDCjfN4sUoz7Ugk6HKq60EhCUwj1kV
 ZQBGuvg/KmyKSSfdRJIDdjvR1bHW5H6JMukUcDSeKZ5doS9DlmYX2V5R4olL6WBnkzaAL8zZqHV
 lG/+YK5y/O0i0BYR2o6nbAEnVjQlrIpTJ3GR0D+XLe0vw25sE3vQrLZNrPYN4I7L6LeNAUqpqeS
 QBc13sFyEl386xPpgGA==
X-Proofpoint-GUID: kFEvRM2UUogQOvDS7dHNdUdMibT0QwiG
X-Authority-Analysis: v=2.4 cv=fMIJG5ae c=1 sm=1 tr=0 ts=6a4f50d1 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=/bviTfK1dmy+WGcHzWQ0gg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=fjlDWTYzx9GH-NWLRPsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: kFEvRM2UUogQOvDS7dHNdUdMibT0QwiG
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA3MSBTYWx0ZWRfX+QxZqnkOksGL
 X3exHruUAwhEIh2RNrgLXxd0INeNzTeYdFX+uFF44cUkhMO2QiKG46AG903YxRDM4wfcemIE/y7
 Jv8MrGbzHgvTW6CXqUMz6KHWXHEx0eo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090071



Le 09/07/2026 à 09:37, Dmitry Baryshkov a écrit :
> On Thu, Jul 09, 2026 at 10:54:26AM +0530, Gaurav Kohli wrote:
>>
>>
>> On 7/8/2026 7:55 PM, Dmitry Baryshkov wrote:
>>> On Tue, Jul 07, 2026 at 03:55:13PM +0530, Gaurav Kohli wrote:
>>>>
>>>>
>>>> On 7/7/2026 1:04 AM, Dmitry Baryshkov wrote:
>>>>> On Mon, Jul 06, 2026 at 08:11:35PM +0200, Daniel Lezcano wrote:
>>>>>> On 7/6/26 19:47, Dmitry Baryshkov wrote:
>>>>>>> On Mon, Jul 06, 2026 at 07:03:18PM +0200, Daniel Lezcano wrote:
>>>>>>>> On 7/3/26 17:42, Dmitry Baryshkov wrote:
>>>>>>>>> On Fri, Jul 03, 2026 at 07:43:39PM +0530, Gaurav Kohli wrote:
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> On 7/3/2026 1:23 PM, Konrad Dybcio wrote:
>>>>>>>>>>> On 7/3/26 7:03 AM, Gaurav Kohli wrote:
>>>>>>>>>>>> Add Device Tree binding constants for Qualcomm Thermal Mitigation
>>>>>>>>>>>> Device (TMD) types used by remoteproc-backed thermal cooling devices.
>>>>>>>>>>>>
>>>>>>>>>>>> Qualcomm remote processors expose thermal mitigation endpoints
>>>>>>>>>>>> through QMI. These endpoints can be registered with the thermal
>>>>>>>>>>>> framework via the `#cooling-cells` property on the remoteproc node.
>>>>>>>>>>>>
>>>>>>>>>>>> The QMI TMD protocol identifies devices using string names (for example,
>>>>>>>>>>>> "pa", "modem", and "cdsp_sw"), while the DT cooling-device binding with
>>>>>>>>>>>> `#cooling-cells = <3>` requires numeric device id in the form:
>>>>>>>>>>>>
>>>>>>>>>>>>         <&phandle device_id min_state max_state>
>>>>>>>>>>>>
>>>>>>>>>>>> Define common TMD device index constants shared across currently
>>>>>>>>>>>> supported platforms. If a future target requires a different mapping,
>>>>>>>>>>>> additional target-specific constants can be introduced while preserving
>>>>>>>>>>>> existing DT ABI.
>>>>>>>>>>>>
>>>>>>>>>>>> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>>>>>>
>>>>>> [ ... ]
>>>>>>
>>>>>>>>> Why are you using only those TMD devices?
>>>>>>>>>
>>>>>>>>>> More constants can be added as needed.
>>>>>>>>>
>>>>>>>>> Kodiak is one of the supported platforms.
>>>>>>>>
>>>>>>>> What would be the benefit of having more than thirteen cooling devices
>>>>>>>> declared in the thermal framework and having only a couple of them mapped in
>>>>>>>> a thermal zone ?
>>>>>>>>
>>>>>>>> I agree there are more TMDs but if they are unused for the moment, why do we
>>>>>>>> need to add them ? Can we do that incrementally ?
>>>>>>>
>>>>>>> That's what I am trying to understand: why the implementation uses only
>>>>>>> the selected two devices, if the modem on Kodiak supports others. How
>>>>>>> can we find out, which TMDs to use on other devices.
>>>>>>
>>>>>> My understanding is that is an initial thermal setup. Gaurav will add them
>>>>>> step by step while setting up all the thermal zones instead of sending a big
>>>>>> patchset. And TBH, that will be much easier to review.
>>>>>
>>>>> In such a case it should be noted in the commit message and/or cover
>>>>> letter.
>>>>
>>>> Thanks for the review/guidance. Not all TMD endpoints are relevant for
>>>> kernel thermal zone binding — some like BCL and cold temperature are handled
>>>> from userspace when needed. The constants here cover only
>>>
>>> What if there is no userspace? Or the userspace is different from what
>>> you expect? I doubt we have TMD-speaking userspace yet.
>>
>> Thanks for mail, The TMD userspace implementation is available upstream at
>> https://github.com/qualcomm/qmi-framework.
> 
> Is it?
> 
> lumag@rohan:/tmp/qmi-framework$ git grep -i tmd
> lumag@rohan:/tmp/qmi-framework$
> 
> I found no traces of TMD there. Moreover, I don't see why QMI framework
> implementation would react to thermal events.
> 
>>>> what is needed for modem and CDSP thermal zones on the currently posted
>>>> targets.
>>>
>>> Again, SLPI, ADSP?
>>
>> Sorry, I should have said "generic subsystems" rather than listing specific
>> ones. SLPI and ADSP do not require active thermal mitigation on these
>> platforms.
> 
> Could you please provide details, then. What is cpuv_restriction_cold
> TMD?

It warms up the zone when the temperature is too cold

