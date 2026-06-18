Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9175442A82
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 06:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781764762; cv=none; b=Qe3ivECz4QUdqrWX6O6M2IEGb/zWyNnW65NgK28J0KDH/hl6CWooVox/9hsWndwPWP8eyzNsi7Ru6tl8MtpW7lfKAOxXVCLIwUmdaU6ev2adLGXFUOENzQUypc8ogQHyr9xNTgSNiD/4zpDjCcU+hHMvKOdq9gysZ7TUCz6Kwc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781764762; c=relaxed/simple;
	bh=CitbZsiqyq66RRkeKiRbQVLiOa6DYPRfkQxVYj9mvKw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M7pcxlSA+RXcfWnzMqLzG/lHExzrDoBXvXI/yhoQeUe9TY5/ayNeeuBkUlRKWUn8MBhJ5m/ewZbouy+gUztfsErnnO+TnNazvJHkfB9ckqRCKgABJoCf9tXgTBFBXHgXXf1MZ6gxHFj6lRXYcM63wf+KMsARqsAmqYEP5joX4P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OOfMd87j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A8MLK3CZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OOfMd87j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A8MLK3CZ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65I5x3tM3516388
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 06:39:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g/stOCxZ+zAQ9WeYQSMa5ASQyIxGcj+rnwFXY6EZ0JA=; b=OOfMd87jECFH+brW
	tG3LXYftDFyR2s3hcbI8BOfWWKpn0MdvKmRL7PgcUCWzdAil/gBev40fi58N91N/
	pzAPmLaMrmup2nP+jJJyQR+S1LDmiH+KpdXa7me20BANJOvoTOJjiZMKoLnW0xC7
	Vtpfbl9veYHK2+MTowgA8VPUI9VfGk5ICUKhHe6Z80VvH8kjZOQD/NW54PTIDA4W
	4m6Lm7uGlkT7oaM1wnUkAVpX6c9eOD18sZ12V+v5wIg8Wve6fqo/KxFgsXIz6698
	NstepS4HXxVJQ9EMcfsnePPop5CI+KKD4sp7t5eJ8yy/AWrG48Dq99DjYLyDqaXI
	lea2pA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev1wc1wmc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 06:39:19 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c0b1bb53a8so3640185ad.0
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 23:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781764758; x=1782369558; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g/stOCxZ+zAQ9WeYQSMa5ASQyIxGcj+rnwFXY6EZ0JA=;
        b=A8MLK3CZsSO22ZvvmwNv/Y81hnBox7l9gI/ZqdzCOPPygbahtrcpC+Fw3WEZXJMPw6
         6ltNs+3XqX9j+NChGWskrDzm64gadayMVgughpMnXZMpBG/tuWkzYbxQs46XQ6wLGsew
         CMcEqPM3/MY4ErMFvjLLl7wLzvqjKYHBBPDP5JWoyQGJbqmNhAtZ2TGP/6pCq2RkeSUO
         237IaPNTXPRsqec+GrLLzANaX/e+YBMg/GycaGK1Z94ya5ErZMnMs2N2GlF3W9A1mCtj
         SbnLBKeToWLHVk+bsSFVQ22meyWBNGQHgOXiWwU+JRP9gfMPdMbAgukAEPMP0PoecgCj
         3hFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781764758; x=1782369558;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g/stOCxZ+zAQ9WeYQSMa5ASQyIxGcj+rnwFXY6EZ0JA=;
        b=RENABLzOuw5FfOQpJ23llXXrwl8ZePjKkmJRTzrxkuQdsSZ/KVH7lEt8MNIhJ3wgqk
         fEI4mKtOixcGoZz4qN3SMsve8wKSGwhUbtROys3+J/85tNiCUNEKSdz0x4LtI2xxxvFX
         Z2VstS49FzljZYgv5JuIjAaV9P+lDfjkOYfku9xZSpRdIZL6cBlnOv1U6Js2Jd4XJDng
         8zyRoHpQExLzwEDot+Kl4zXpjis5RyV8LstnyZYC4KkOcMsaeeDTQ/hVFJXEFgMYZbs9
         La7dgZvS3OX7h71Ey9n2GzW+jEohgYONDx8l3EKww3el793V/pPrMLK27xPdgzxygeN1
         KN4Q==
X-Forwarded-Encrypted: i=1; AFNElJ9x+behz19cGAReZbMCII7YAjXJwS4fKKtQrNWCqjRq1Z20ow69yjXUTxqLehDRXkHwncvdsKkKyA75@vger.kernel.org
X-Gm-Message-State: AOJu0YzRnMn4s0pYYC9EC6jVz7o/4PCYINS1+9cDe0TAKxvxTx/6wCIP
	rVT0eO1AB2Vhd+Lay9jQdeDm0AYnDtMsaUxCAJbCMgnXInL0I1Y3A4SFfy/ZnCJQILVGavGR17d
	lRdojWTleqaF+Lcxr/Tlb3YC2qT8lL9RXXYPjOtCIw0GJ+41WiUUlS3nj62aq5tat
X-Gm-Gg: AfdE7cntmxH7hN1bvkDfDsPqREhgZM8RDpHtRexfLfMAX61MfA86kbJAAYDwWK9KOqp
	XL/CJK/3zfQJhrKv6xuQE1V1bORsTTOG0+sxn6nuVFQshEnGoVLNeHXnyNFdUg6kQQ1G18vJeXm
	cA9xMeegApucLHU4O2WhR8XBs/84turiusU3i4KZc4iqxX6kXZFTrItTG8dLnYDTaUiU3WLAArJ
	t0iEr3s7ueWxYBnt2YGAPMHToB4hc45aCXGzl9H7xyB+V+1DpN69GSW0Xu3i5N3aqSaVsOF8+dA
	jZwMe8/YYUkHBtXhXbY0FlthAPA1zYjo8EaD+9nl1YueIrEgBJutig9BD6d1JSM8KYDDr6+836c
	BVVt4OdA+yBYQ4zIxFmbewIgQVbrEHRz5hXm7O5IieOs+H/Na/Z0rNcd4M9h8s9XPp7DUnNMzmP
	IPaVd/
X-Received: by 2002:a17:903:1b43:b0:2c0:b31b:b19 with SMTP id d9443c01a7336-2c6de79ed27mr21996705ad.21.1781764758106;
        Wed, 17 Jun 2026 23:39:18 -0700 (PDT)
X-Received: by 2002:a17:903:1b43:b0:2c0:b31b:b19 with SMTP id d9443c01a7336-2c6de79ed27mr21996345ad.21.1781764757497;
        Wed, 17 Jun 2026 23:39:17 -0700 (PDT)
Received: from [10.133.33.101] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c6a1878426sm68884315ad.64.2026.06.17.23.39.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 23:39:17 -0700 (PDT)
Message-ID: <c0478a3b-dcc0-44e0-abfd-2c86f24db733@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 14:39:12 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] soc: qcom: rpmh: Allow non-child devices to issue
 write commands
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260528-pinctrl-level-shifter-v2-0-3a6a025392bf@oss.qualcomm.com>
 <20260528-pinctrl-level-shifter-v2-1-3a6a025392bf@oss.qualcomm.com>
 <4ac5hjmr6divqs4myhcw5sveuboj265sw2jwslbivrfwh5e7ce@6d7ajvgikkgt>
 <18235340-cd42-4d88-bfdb-19aecdd63d68@oss.qualcomm.com>
 <9927f5d7-1eca-4936-b38c-678e76ac11cb@oss.qualcomm.com>
 <vmk6b6cd4jolhisfphgai35eznr5d5uwrhx2qktdwd2qayxwm5@fb2js7bw4dca>
 <837dc7e2-4db8-4a7d-a19f-e53ddbcc9cf6@oss.qualcomm.com>
 <4edaf745-d24f-4ce0-9605-e3971f067b68@oss.qualcomm.com>
 <ao2bl4vzgb3mvqnk2kgvgqnifujbvy6oyzuj4rnvjrv6teyrel@56txzbrtwm64>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <ao2bl4vzgb3mvqnk2kgvgqnifujbvy6oyzuj4rnvjrv6teyrel@56txzbrtwm64>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TMt1jVla c=1 sm=1 tr=0 ts=6a339297 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=l5iDvloktsjau2Z1kDIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: ty0bply1JyHPHnYxDCJmzDlCUxGpoZPG
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDA1OSBTYWx0ZWRfX+xq/qqQG73wv
 p+qeChS7WsPxrf6AbyAkEraM9//rxaOjuSXzsJHpNoy2yMtogrfKUUB1+GhkH/IkIt+XyFZtGUt
 dUM0Kid6zi8HBrf/spXBP1w/Y1PhQpo=
X-Proofpoint-ORIG-GUID: ty0bply1JyHPHnYxDCJmzDlCUxGpoZPG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDA1OSBTYWx0ZWRfX/Z7/RcEvGacS
 CaNook6unvCFq0KiuCABRPCUnFP3DtipsvIlS7NxvaYDAPdPs41zPZ0pKqk3EaigVRqXH3M5x3R
 YsXi5Qn37llzPQlXg+rkJdxF3wvE61C+5Q11T+WmyswXiU9p3slkD63AS+hd/HexvAyozdStdjo
 g2M49fGSOynJxj9TDB9T6+X6l5bfUbRVXJFdNp/CdNmiz7Gez/DeA40wuybsNaYDkC51kRg1JZW
 6gNh/LR8Dx9PBhAL/z9JwK5O6NkUzpgh6dKidykREusb5cGLVLkyZ3whP7w1sqDlXEtecke+tXn
 pZl2Ha4ZAhQvfLHWSy3z9rWtlzWFem15x4/BPVbtkihGHXHEL7PQy/o/xYMFWocpC1fVB/u9eIW
 9weneo4oLT3URf6w3+TBBiU9G0XMOjLw4kVgZUp2Q5HgJE9rj0L+QEnHAoJIIAfXXALUFiO+lft
 RzS9fqw4pCsTRbAsUdw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_02,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180059


On 6/12/2026 8:27 AM, Dmitry Baryshkov wrote:
> On Thu, Jun 11, 2026 at 12:36:43PM +0200, Konrad Dybcio wrote:
>> On 6/9/26 3:28 AM, Fenglin Wu wrote:
>>> On 6/8/2026 5:21 AM, Dmitry Baryshkov wrote:
>>>> On Thu, Jun 04, 2026 at 10:02:43AM +0800, Fenglin Wu wrote:
>>>>> On 6/2/2026 3:29 PM, Fenglin Wu wrote:
>>>>>> On 6/1/2026 9:37 PM, Dmitry Baryshkov wrote:
>>>>>>> On Thu, May 28, 2026 at 06:05:35PM -0700, Fenglin Wu wrote:
>>>>>>>> Currently, the RPMH driver only allows child devices of the RPMH
>>>>>>>> controller to issue commands, as it assumes dev->parent points to the
>>>>>>>> RSC device.
>>>>>>>>
>>>>>>>> There is a possibility that certain devices which are not children of
>>>>>>>> the RPMH controller want to send commands for special control at the
>>>>>>>> RPMH side. For example, in PMH0101 PMICs, there are bidirectional
>>>>>>>> level shifter (LS) peripherals, and each LS works with a pair of PMIC
>>>>>>>> GPIOs. The control of the LS, which is combined with the GPIO
>>>>>>>> configuration, is handled by RPMH firmware for sharing the resource
>>>>>>>> between different subsystems. From a hardware point of view, the LS
>>>>>>>> functionality is tied to a pair of PMIC GPIOs, so its control is more
>>>>>>>> suitable to be added in the pinctrl-spmi-gpio driver by adding the
>>>>>>>> level-shifter function. However, the pinctrl-spmi-gpio device is a
>>>>>>>> child device of the SPMI controller, not the RPMH controller.
>>>>>>> This replicates the story of the PMIC regulators. There are two drivers,
>>>>>>> one SPMI and one RPMh. Why don't we add a separate, RPMh-based GPIO
>>>>>>> driver targeting only those paired GPIOs (and we don't even need to
>>>>>>> represent them as a pair, it might be just one pin).
>>>>>> Thanks for the suggestion.
>>>>>>
>>>>>> I agree that adding a separate, RPMh-based GPIO driver would be more
>>>>>> straightforward from RPMh control perspective. It makes the new device
>>>>>> as a child of the RSC device then it can naturally use the APIs for RPMh
>>>>>> commands. The main challenge here is, we need to make the level-shifter
>>>>>> mutually exclusive with other GPIO functions when the GPIO pairs are
>>>>>> used in level-shifter function, which means we need to write SPMI
>>>>>> commands to disable the associated GPIO modules. I am not sure if AOP
>>>>>> already handles this; as far as I know, AOP only manages the
>>>>>> BIDIR_LVL_SHIFTER module registers. Let me double check on this
>>>>>> internally, if the GPIO modules could be controlled along
>>>>>> with BIDIR_LVL_SHIFTER module registers at AOP side, and get back.
>>>>>>
>>>>> I checked on this internally, AOP only handles BIDIR_LVL_SHIFTER module
>>>>> registers, it doesn't disable the associated GPIO modules. Also, I still
>>>>> have no idea how could we make the "level-shifter" function to be mutually
>>>>> exclusive with other GPIO functions after moved it into a separate driver.
>>>>> Do you have further suggestions?
>>>> So, for my understanding, we still need to write SPMI registers to
>>>> configure the pins and only then AOP can handle the level shifter?
>>>>
>>>> I was thinking of using gpio-reserved-ranges to prevent those GPIOs from
>>>> being used by the normal SPMI driver.
>>> More background: "level-shifter" module is actually an independent hardware which is not part of the GPIO module. However, they are sharing the physical pins. Which means, from PMIC chip perspective, these pins can be configured to either a GPIO function or the "level-shifter" function. So in PMIC base dtsi file, for example, pmh0101.dtsi, these pins should not be restricted in the GPIO nodes in "gpio-reserved-ranges".
>>>
>>> Also, we need to make the GPIO modules are disabled when the "level-shifter" is enabled, to ensure that the "level-shifter" circuitry is not impacted by the GPIO modules internal circuitry. So it is supposed to write GPIO EN_CTL register (offset 0x46) to 0 through SPMI bus when the "level-shifter" is enabled.
>>>
>>> That's why we have the requirement to access both RPMh and SPMI bus in the same driver.
>> I was thinking about other ways to solve it.. maybe someting like:
>>
>> &pmh0101_gpios {
>> 	pmh0101_ls_pins1_2: foo-bar {
>> 		pins = "gpio1", "gpio2";
>> 		// appropriate pinctrl config
>> 	};
>> };
>>
>> &rpmh_rsc {
>> 	// should this be a gpio controller? a mux provider?
>> 	// is there another class that would better suit this?
>> 	rpmh_level_shifter: rpmh-foo-bar {
>> 		pinctrl-0 = <&>;
>> 		pinctrl-names = "default";
>> 	};
>> };
>>
>> // but where would it make sense to describe?
>> // fixed-regulator or something akin to that?
>> &some_consumer {
>> 	someclass = <&rpmh_level_shifter 1>;
>> };
>>
>> i.e. the "rpmh level shifter" driver would consume a reference to the
>> pins, configure them as necessary (just like any other pinctrl consumer)
>> upon request
> SGTM.
Thanks for the suggestion, Konrad and Dmitry!
Using the pinctrl state in the new driver to disable GPIO pairs is a 
good idea. I’ve been considering which class would best support the PMIC 
level-shifter, especially since we’re moving it to a new driver and it’s 
no longer restricted by the pinctrl framework. Functionally, the driver 
should provide following capabilities:
1. Enable and disable the level-shifter at runtime. Consumers, likely 
I2C client devices, will enable it when active and disable it when not, 
mainly to save power.
2. Allow sharing the level-shifter between multiple consumers, even 
across different subsystems (currently managed by AOP).

I see flaws in each of the following approaches and haven’t decided 
which to use:
A. Using the mux subsystem: The level-shifter acts as a switch, so it 
fits the mux subsystem physically. It can be enabled/disabled via 
‘mux_control_select()’ and ‘mux_control_deselect()’. However, with 
multiple consumers, a second call to ‘mux_control_select()’ is blocked 
until ‘mux_control_deselect()’ is called, so votes from multiple 
consumers are not allowed and can’t be aggregated.
B. Using the GPIO/pinctrl subsystem: After moving to a new driver, the 
level-shifter doesn’t fit the GPIO controller or pinctrl device concept. 
It has only one pinmux, and each level-shifter works with two pins. 
Also, both GPIO and pinctrl frameworks require exclusive control, and 
couldn't shared between consumers.
C. Using the regulator framework: The level-shifter is controlled via 
the RPMh XOB resource at the AOP side, which was adopted from the idea 
of power rails sharing between subsystems. The regulator framework’s 
APIs and reference counting fit the requirements for sharing between 
multiple consumers. The problem is, the level-shifter isn’t a power rail 
so it is conceptually not a regulator.

Please let me know your thoughts. If there isn’t a suitable approach for 
supporting the PMIC level-shifter right now, I’ll stop chasing on this 
until there is a better idea.

Thanks


>> Konrad
