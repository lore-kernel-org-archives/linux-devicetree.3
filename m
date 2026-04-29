Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233D33BD237
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 09:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777455971; cv=none; b=aKXDKK/17R0kQONG3uH++Jn34nN0RTxZCScmXxxZN0wafNXuU9AsfMDT/CMJeF/8G12P90m6+i4MGW7cOPNJ3Zv1e9huZtUhsf59yP0uv3pGZUtM6B/V0ApSz688+z9B52fUE1c+zCJ5qFGvsd4HPuw++NMzqXIPYRY/wFc6mGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777455971; c=relaxed/simple;
	bh=2iHOsCpqDchWIbn5ivwEg7G6xgoJ9fs2KwBGymi71SQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Dxjko57Bn1SpAuuKNA2EWmjk7MbJRTPmej0m1Godq7Ope0ao/iN6jHuZISle3wTQi+mEuf4p3XYHEpFRCcHRgqFMJGen1TJQorn69+BeJSvuWXT3pVy1HYv0zyw1qJVaZSwEWitzDf1/DtBfKLO8v8qDwlcov7DGANqMDyiWs5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZyX8jVoE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JRVnJaUB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZyX8jVoE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JRVnJaUB"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8qWcp2889803
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 09:46:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a1HoqX/um7TvyRf00b34e6if2JtOYQBSeAXkisbuBWI=; b=ZyX8jVoEdRgS5TlB
	r5nhfjnzKPoIgUnZoDE3jUhpJaimuW3ucvLLLImDe4hbF6uO3n9uAFgT/Dd9RijC
	wa758TyTD1u96L3Xqd9iSGGAO2/WTnpt1+H2KtKwO5Hbv6aUJfAwOF0uUrCDYSem
	FfFEp7pWDKCPwA/pu6qm1ZKzklwgM3JCo/vw3EMi7BHolnfgYHMZdNO0aORu8wGb
	9Fvbttejukt71+AZlSryv5wHZ0EFtyDx514P4Bu07E05nO5wtKQD/1w88H3OMbkr
	WUFM0BRNjdPnZWLFn6RyP0lM2FCks4NQQN2vuytzLTBSH8XyTAXc5J8sfZxxqGvE
	EmvQ4w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du0wqb9yf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 09:46:08 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b2e6ee9444so6852855ad.1
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 02:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777455968; x=1778060768; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=a1HoqX/um7TvyRf00b34e6if2JtOYQBSeAXkisbuBWI=;
        b=JRVnJaUBEt3HDJwZ/UqSd51v40OpVxnJP8rsdOnoN/TquSgdEbQ4LXJmhnUg8TFXmw
         EWpPH1rKQdv81zEwDa+Et1YazQWf8rc3S7SzG/ooxYVKlzWBcrp7gnLszUyJTLbkxmnF
         8WNE7sXQ8oRrlQkOcLD8LJvTxvyGlrSvHrlVVpKcXMJ0RRr2f4UIK3E4OMqpRcXXLUDt
         MICe25spGBVtlUHrCc4O09ASwps6cAeBVPP03EEVCwNPZ09HVzNB6xvYQMYsdrAQSGot
         K1rR7SaQUbREVMz5Y6aI/895b4wyiV137isBtsLazROjEEFEbX0uvJuepf/ubnVNgLoW
         yXAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777455968; x=1778060768;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a1HoqX/um7TvyRf00b34e6if2JtOYQBSeAXkisbuBWI=;
        b=NNM1GR7UiB21rf5LakDFF6JQ3qNOrmEOgBzYqQ3e+8n4EEdxmuROPuW1PKYw3YNxSU
         n5DS6dUc2wt/pWKtrS5tG4e7y9mzLlKgnqfloIMefSIMNdweUsa2iVEhp3N9zWgyYIx1
         WaufOti4jm0IDRdE1syePZKfal8pM25PP0SD744jIYoO/xMEAS0gAueOCByzSMwHn8HJ
         Qx8U/eOaou403SWrLzDynNvtaDpQozwrj0lCbg+/f5iwXi5lj7GdbtMA/CL+jl6ZtRSG
         UJvtyTToUFhCcsPRqyhWQLSU+RGZd1EUxrxl+dGvRQiA8iLA+USvHRxJ5+hAosZm+QjN
         kZQg==
X-Forwarded-Encrypted: i=1; AFNElJ9SP6GhtcKg60j+/rS+Mb9p4p3XbmwUw/wVpuhT39wYYlaySq9xZpa3UnMtlnGi4OXQeQzCLsAJpOQ9@vger.kernel.org
X-Gm-Message-State: AOJu0YwwXjsPKyL2hcbUYW1mtlODyPdIvZTmLwc+VCi0XyeNl49/mKF1
	zCGRyTE6DOs/EsIeilMdo0JhlxeQ80cynraheFR9sZQle4+dr1SQ46lj3ceLZ3z1+ue/xEiE7XE
	O5pBLiYZeIxM4NBBxTiICnNDJxGn78TEo01FV/1PGI/Ra7XrO3Lva8F2NFWTH+BlT
X-Gm-Gg: AeBDietvtSVAXd+GmIkA+np2FTnfHviJ7MyheiH/SjOZpRIN4h33JBQpT1QspKJBXs4
	G095Z+ak09NZtVxZwEKGQfTpL9TofMPYordyYrYylf87FjghLPtl7gGgcowpkUNu1dvM44aAsN/
	nGo+XFhdDeW5PMmRccYncpxjYWaRUGoVXa+mWlJI539welaIHBOJbiMfylhL/cxeNNYw1Nu4+NP
	y99grGE53IXyq3Lvf3hP66HAWh3aOIdQeVuB9jJ4t4dJjlVPqQVFkDyQXaTGA8xRqMxOkKzSkgg
	gfYaq9A3oLXwlfOVMUtM3qWVzKBe6uHNv9qnK9qqMoIiNnx8137P3hNQaJ8ofCxye0J5GmGEA73
	CMctjo1g/VC9alhzjTVuUXITGN2YUMQ887yuE5UAsYc03YQ8piVXxhJIhjqkhaMgsriM=
X-Received: by 2002:a17:902:e741:b0:2b2:5099:2f40 with SMTP id d9443c01a7336-2b98824f071mr20792625ad.22.1777455967931;
        Wed, 29 Apr 2026 02:46:07 -0700 (PDT)
X-Received: by 2002:a17:902:e741:b0:2b2:5099:2f40 with SMTP id d9443c01a7336-2b98824f071mr20792365ad.22.1777455967428;
        Wed, 29 Apr 2026 02:46:07 -0700 (PDT)
Received: from [10.219.57.134] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b98897112bsm17629145ad.67.2026.04.29.02.45.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 02:46:07 -0700 (PDT)
Message-ID: <ce92a493-5016-41a2-8337-d2227cdf760a@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 15:15:56 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v21 08/13] mfd: core: Add firmware-node support to MFD
 cells
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
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
 <c0677503-8073-4940-8eb0-c06b34f843d2@oss.qualcomm.com>
 <CAMRc=MdxpSXiqAn-8Az4ig4N8TFVdE9psacPVG9J9KehuFnbwA@mail.gmail.com>
 <d6112b9c-01ea-483c-98fe-b480e78872e5@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <d6112b9c-01ea-483c-98fe-b480e78872e5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: A-nO5AcophP2SLP1eBW9t_1Dt7TpeSXd
X-Proofpoint-ORIG-GUID: A-nO5AcophP2SLP1eBW9t_1Dt7TpeSXd
X-Authority-Analysis: v=2.4 cv=BfDoFLt2 c=1 sm=1 tr=0 ts=69f1d360 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=44wx8BIOPdhe_q6X2V4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA5NyBTYWx0ZWRfXwyCh7WryQbgH
 fMjeM2B8nNx/czmNqJUzlnAI46Ds62E4aHzJYrIMVf8oHcDL87/YrbrxQ+iWWSvd7scD0r2m8ie
 FWzZuKyg7QSM+oY5inh7w6eXD8CcgnoctN2v1SpEon/4JCPAE2jX+ObpjBKNHV3yB+6ytmzz82e
 mTiB6R8xkQz9Jr7Ri7xUTnOVS7sTRbdDNlgAIINGMGeBCeo0bgABWwy6bu2UjzTXZ+JgvDX38up
 k7FndbcFUdujg9aJ/uaDwv8dKW8rztZEi4wTj0gweJM0tjZ2UCOMj0BZurD6Y50EWQ1VyflXI78
 VNSSQn2Kz+GcnMl0CVOKjDefSbJqNZD/LaH6H0PgzD+X004+7YGuLS7jhJwHGmsNFeaJ2MKH+hc
 sVX+RFEVWc6UlElGVMOmoyJcBmWzIsnH8NfuM5enyIIkjpHZJ2cM2xi4TyKnX/UsoRVetg0ZpK8
 AC9XxsZVAnFO8j4Ql5g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290097



On 28-04-2026 18:33, Shivendra Pratap wrote:
> 
> 
> On 28-04-2026 18:21, Bartosz Golaszewski wrote:
>> On Tue, Apr 28, 2026 at 2:18 PM Shivendra Pratap
>> <shivendra.pratap@oss.qualcomm.com> wrote:
>>>
>>>
>>>
>>> On 28-04-2026 13:33, Bartosz Golaszewski wrote:
>>>> On Mon, 27 Apr 2026 19:34:48 +0200, Shivendra Pratap
>>>> <shivendra.pratap@oss.qualcomm.com> said:
>>>>> MFD core has no way to register a child device using an explicit 
>>>>> firmware
>>>>> node. This prevents drivers from registering child nodes when those 
>>>>> nodes
>>>>> do not define a compatible string. One such example is the PSCI
>>>>> "reboot-mode" node, which omits a compatible string as it describes
>>>>> boot-states provided by the underlying firmware.
>>>>>
>>>>> Extend struct mfd_cell with an optional fwnode pointer and attach 
>>>>> it to the
>>>>> child device during registration when no firmware node is already 
>>>>> assigned.
>>>>>
>>>>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>>>>> ---
>>>>
>>>> In the following patch you use this and violate the supposed 
>>>> constness of
>>>> MFD cells. This also mean you need to modify the mfd_cell at run- 
>>>> time. I would
>>>> prefer introducing a field in mfd_cell: bool use_parent_fwnode which 
>>>> would
>>>> indicate to MFD core that - in case no fwnode was assigned from 
>>>> other sources:
>>>> DT or software node - it should reuse the parent MFD device's node.
>>>
>>> Have one doubt on this, When we fallback to use_parent_fwnode for cell:
>>> psci-reboot-mode, at psci_reboot_mode_probe(), pDev->dev->of_node point
>>> to psci node.
>>>
>>> But we want dev->of_node to point to "reboot-mode" node. This may need
>>> an explicit assignment again of of_node?
>>>
>>
>> Ah, sorry you're right. I'd like to avoid having to modify the
>> mfd_cell entry at run-time if possible.
>>
>> How about a callback in mfd_cell like:
>>
>> struct fwnode_handle *(*get_fwnode)(struct device *parent);
>>
>> If set, it would be called from MFD core and would do the name lookup
>> and return the fwnode which would then be assigned to the cell device?
> 

Or should we just drop this patch for fwnode in mfd-core?

Export a new call in reboot-mode framework as:
reboot_mode_register_node(struct reboot_mode_driver *reboot, 
                   struct device_node *np / fwnode)

Use the parent node in psci-reboot-mode and find reboot-mode and call 
reboot_mode_register_node?

thanks,
Shivendra

> sure. thanks. We can make it a callback from MFD core.
> 
> thanks,
> Shivendra
