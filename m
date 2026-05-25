Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C11930C17E
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 13:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779717447; cv=none; b=oxXyiXbLH9eL49DTyV+s07tBrLuris9xXxPZQcFbv0wg6T6aujYOyglFwLEnYckMcQwOZbq34e381ZeNCL+EPiwgExVj0ho8N9Sd3cZSQvE17RDWmrejo/zQlyTzoIy85Zd78s6oz/RXfSk6K2yI+QcD6OAUovGolxIUU7Clikg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779717447; c=relaxed/simple;
	bh=ULoE+8zvbjsOuy0ZREHWAwS+PUKadWFHLcTSEr6ofH4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JhnQB5grw38vSdUouQMuN0zegsk4PkDHs4GmTFLq+VzWZ/wP9HWPxcMtKERY9ySIoZCGGiVX/wr0uugobqCob+wZIoE8xLTkVqLZedGAAw2jJ1MLjhuPemiCbjTazKkO0WaRnr/C9PEomaFBC1kvrnzrCqVip/vq9AXzx2a+STI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QJrVBNGB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nkh0G4b8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QJrVBNGB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nkh0G4b8"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64PCh4id1211066
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 13:57:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KIjppU7tpPql8YjmItwFuxQF55bJ2eaCplY4WbpqW+Y=; b=QJrVBNGBR0Ppfdp2
	hdcOGj20Fgyr9lsx6ewZJXwZP3evi+Kn5q//E9JJx/BvLFt7kLFp+Qb9VF/HGmYl
	mL1f+i6yO5MGx1momOKQQ6jPo0zKyKlPrvkkhukuJYak8m7kSTCielO6JZr2/8bV
	CT+lA1U4e4tKZf8mYKDQJni519TZA+mm9r+HsWxefKbi0uQ0x1Wz/aiXvuV6EpWf
	2DC9Cj2PbLHs5Rq0szw00BHhNv+xkU5RSLQOJs+WmIa73m02yeC5vMcy3ZBtZSFw
	w9SGWmoCTFLGXy80LrNgwlU+eVoCAbEJcKr7Jv43P8lg/pGTw8JLl/hHb4U/8mjO
	VYvV1w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb4m7pw8u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 13:57:25 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bc763c7256so212002275ad.3
        for <devicetree@vger.kernel.org>; Mon, 25 May 2026 06:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779717444; x=1780322244; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KIjppU7tpPql8YjmItwFuxQF55bJ2eaCplY4WbpqW+Y=;
        b=Nkh0G4b8bMtB6kgbciwCrbU7D5RBM0wOrwhL/Mnh/5wsjrAtwuZ7tCQ7BT5L8E03rJ
         nayz/SXCKA2b1DshqnBtKMfMBiIde9M47st7VlCl4CbbLnLYaVAHZFRmxP0BlI6TTV9F
         Ceizha6FubaBXyLUZDk6qNloll40lcQYIEEL6q5/U5cBkAFxcWD1huDa9hFjqhN54kVX
         b/cnv+/I0kdmG73iHSOTJGQlO/Pcm5yQ6PXb0F6d2qPfl9TgV74kpG+FuC5Df4XHnmio
         j8LpJu9XfTRPkNxifi8gIk4YJs1e+mMXIfU5I4ofRYPYOP1xf02zUjbxLvrKGD1lcr+V
         z7ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779717444; x=1780322244;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KIjppU7tpPql8YjmItwFuxQF55bJ2eaCplY4WbpqW+Y=;
        b=QtMJVb1RVuxxzVnyuUm9bgu54J/ByuHhkmwpOl0slIze6ztiuSrlqtCY47KoG2gBot
         mgDsT2FldPoQTrkqO0Vfq72vKPKbEXONdVO+G/ttS6BmYRe1EXa2bQ2lOjJvBG9rZXR/
         dSLeZ5GAYzEkwRDPMEFGmmWfnd4fqyIFztzzhCg8WMbNEXrBGetD9Fz7jDIjuM7eN3u4
         kmP4IGbnaZqWePuvD/pA/hbcHy63ptPWkgtihDdePZ6lI/GGruFkTAtLPdCqiMvSUoIs
         Z5hD3NQ7D7ZfWHtSAROImZmttVd8gsDHoYSgOZCSCnOpj6my6OYggYiY400fhimpsJxF
         Avdw==
X-Forwarded-Encrypted: i=1; AFNElJ+ZD4PQOTOSkKgs+KBG7hlhIjp60I4jidANGd+Z7apz9+0buleN8v301TqOwr15IKjyQemk3Wop6Qgl@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5VgxtCajYIoFpqeymaGIVH5n9LQ/r6f4fcGrdUCackzSz9EkG
	1OzIoxlcN8oQh5s0iNjzT4ZvgUoGOJ1ZODH0jV7Z9KFwtBZW98Ro0N2AlcDdKGk4TrSjoSu8DLe
	vIGSla0PGEdHJvd0ZQCEYkooUcODLcik4/WhJ7UB2VBOkXFjdRlBp72z6lV69Un9c
X-Gm-Gg: Acq92OHkfKhs8QQM4+sNOKN3C5d1h9k9BGswBPpN1EmKcr+J3vnS7W0hvEK7RNhJOqT
	6Ena13WoQjaRSBc8r0QaeOJ2oWySxGup8X5jokceBKkdBhffu6TQ+dLnw5Li32H0W/GImwKnbZh
	Z5xSh9dqLTb0O9UcIR5tA89VAG6a+tbmr/cX4YVhHwIfVNTWgv1WtnM6Hlkg34hjNLw5Ry0kxZq
	8IRe7dFZ0BLqBZ4ss8m5xg0s6MD5E9zPOZS94mWRYDdYOf+cVNj41GGTK6Gtq7IH2uFOiGN4ZuB
	dVhqQuIANe4FfAlUALB6aoTjQ2K2WTm8reZKF2BEnhAZhQWK6q4yBYRej9S+Mj0PAm6ouVs3Iq6
	cmsnVQN+bNunGiC0znYGhJlRY118boOR30mcUmqX6/Y4q0nkM/03kM3i1bAZikRwDYKXWkQhH+R
	1c3/h6fMkQ3lcZPw8Qp5T28A+cwTBGqw8byyuy09CoZ/azMr8=
X-Received: by 2002:a17:902:c951:b0:2b4:5aff:de60 with SMTP id d9443c01a7336-2beb06fc2c0mr175846025ad.22.1779717443915;
        Mon, 25 May 2026 06:57:23 -0700 (PDT)
X-Received: by 2002:a17:902:c951:b0:2b4:5aff:de60 with SMTP id d9443c01a7336-2beb06fc2c0mr175845575ad.22.1779717443399;
        Mon, 25 May 2026 06:57:23 -0700 (PDT)
Received: from [10.79.138.73] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695f05sm124815515ad.6.2026.05.25.06.57.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 06:57:23 -0700 (PDT)
Message-ID: <ef361240-b302-42c8-abb6-b4129b4e05bb@oss.qualcomm.com>
Date: Mon, 25 May 2026 19:27:17 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: Move board nodes to common DTSI
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        sibi.sankar@oss.qualcomm.com, rajendra.nayak@oss.qualcomm.com
References: <20260326-glymur-mahua-common-nodes-v1-1-12bb26920ea4@oss.qualcomm.com>
 <03996c07-f9f3-4586-96ae-075927da2577@kernel.org>
 <83c78333-4db9-4943-b90f-164981bb68d8@oss.qualcomm.com>
 <hc3bkodsdzq3to4aaax7vaeahhlrisk3iytuaxu46bjm37p75w@4e7c4a3gh3lb>
 <05c377ab-33ef-44e7-8708-575647de088e@oss.qualcomm.com>
 <c07d2798-95e4-4e50-9385-7adfc5791e3b@kernel.org>
Content-Language: en-US
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
In-Reply-To: <c07d2798-95e4-4e50-9385-7adfc5791e3b@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 5uP-poYEjzBFY4_xUHVmllo2Zquru2v_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDE0MyBTYWx0ZWRfX9J+ZXCjWkuWK
 pGr3jaAWf40SS+8PJVUI/9WkBqIYFks9Xos4Mo7PCXuDLTwVcKZejNK7xbcqxPS4xqU2ZK7K+Gj
 HXWjlWMDfh+8mUncRL1T+NJHqSbuWIzqaZzpdTxJgUmhpiF5iFN29niGmXkI3/iy/O0kt9iC3Ur
 DvdcpiY1gqWjSt9X1h3NT6IKDmEEmzXXrVa2+EuhR9dCmcCe/6B9o8e5Cz7SI/t04KGKl385lH3
 VDLMbQYFXekwLJvUJim/3vWrBOTisqGxpcENjAXnnTzTy6Xwm7YXUnmxeCE/vippSyEtSKdDcKN
 STO5n64T98SH+pVvxoGXgRTr6CUyrTPcUPxBqtvjAG4XfJGfcvL9zh14slDatQ6hCPjH3w225/J
 9nDzq7gXdBzu+oIBWjAVnetpgUydY9hQki5L2pyL9i2lILD7gHg+7EeFLC/67qukFnDhehm5Ghn
 vWQMW0Qj99Zv1I02OyQ==
X-Authority-Analysis: v=2.4 cv=MrJiLWae c=1 sm=1 tr=0 ts=6a145545 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9xvNNVmrUaz2OP-DQ1sA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: 5uP-poYEjzBFY4_xUHVmllo2Zquru2v_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605250143



On 5/24/2026 11:53 PM, Krzysztof Kozlowski wrote:
> On 15/05/2026 11:14, Pankaj Patil wrote:
>> On 3/29/2026 4:27 PM, Dmitry Baryshkov wrote:
>>> On Fri, Mar 27, 2026 at 06:16:59PM +0530, Gopikrishna Garmidi wrote:
>>>>
>>>>
>>>> On 3/26/2026 7:55 PM, Krzysztof Kozlowski wrote:
>>>>> On 26/03/2026 15:21, Gopikrishna Garmidi wrote:
>>>>>> The display, peripherals (touchpad/touchscreen/keypad), usb and their
>>>>>> dependent device nodes are common to both Glymur and Mahua CRDs,
>>>>>> so move them from glymur-crd.dts to glymur-crd.dtsi to enable code
>>>>>> reuse.
>>>>>>
>>>>>
>>>>> Same questions as for earlier tries (why this has to be repeated?), e.g.
>>>>> x1-crd: Please describe here what is the actual common hardware. In
>>>>> terms of physical hardware, not what you want to share.
>>>>>
>>>>
>>>> Hi krzysztof,
>>>>
>>>> Thanks for the review,
>>>>
>>>> Will update the commit message in the next re-spin.
>>>
>>> Before you respin, you can actually respond to the question. Do Glymur
>>> and Mahua CRD actually share those devices (in case of USB that would
>>> mean having the same baseboard with different SoCs being wired) or is it
>>> just "oh, this looks similar enough, let's create a common file".
>>>
>>
>> Hello,
>> Yes we've verified across glymur crd and mahua crd schematics, the regulator supply
>> and data lines are common across both targets for the nodes in the patch
> 
> That's not an answer to the question. Or rather you just confirmed -
> they are similar, so let's create a common file.
> 
> That's not a valid reason. Don't create common parts just because a few
> nodes are the same.

Hi Krzysztof,

Thanks for getting back.

Just to clarify — this patch does not introduce the common board
file, that was already done in an earlier patch:
https://lore.kernel.org/all/20260318124100.212992-4
gopikrishna.garmidi@oss.qualcomm.com/

We clearly describe the physical differences between Glymur and Mahua in 
that series and a consensus was reached.

We have re-verified both the Glymur CRD and Mahua CRD schematics
and also physically verified on both devices. The differences
between the two boards are limited to what was already described
in the patch above.

This patch simply moves the remaining common nodes into that
already-accepted shared file.

Happy to update the commit message if you have specific
suggestions on what needs to be changed and we will address it
in v3, or if you feel a separate Mahua board file is the right
approach we can go that route too — just let us know.

Thanks,
Gopikrishna
