Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4AC5427FB3
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 09:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787130653; cv=none; b=XYqK+uYujk4sIXlxhdJSRjt4nt1mzoa6LeLp8T2xa/ZJAf+f21p98q7g3tTc3Th7q+j57zP9zWGPogwlkS/dNri4D4LrMnuha/TwF2lVbfZY2cWHvsKACaNyijFzPnW3dV6MBysqkwtWxRpcohi0nAghaGMRN2l+J1cRLCXG0Kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787130653; c=relaxed/simple;
	bh=l2RDjRd9f3n09xOgreFDMimJorkbpGJMohrbwuuPX6M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SFOypWSbEDTYILX3mTOyDdPsA598S/9cHJ1zoR59NWrhlKtq9E6CAJ/YkWfcgcdb0RhMipj4HfrhnnbxSato+S6wl1woOTieVO91WgnZMZZsxBL397dA2vDib7W0/qKq2sHs+oGC7AwfU43Hy7u+h3RHr1dS1wd2r5WsWFs1dc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MIqoJlgz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KLJmudiE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MIqoJlgz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KLJmudiE"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67J6Z4on026729
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 09:10:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2MMKp0GDiCPnl181kXWr3csvjn76r0+S61NLsry6PfI=; b=MIqoJlgziFnPJYKX
	2P3aeZJJ1EnU18pwsmHVuQZat6n/RFX9/jJ0r5rDtOceksoXkksVXkj2l/UQ7vf/
	ZE3DtB/8P/9wiNu7/jLP6C8bWPvuODrT1rNV5Dp97w24u6PIrh6+hLplQHUibeLu
	tiAKj61u+PyeHQ4nGu0hED1Ewa+rLx/hXxRZoKIE/YAc3ydeHPSp1Tl7Id+gSRQ5
	7vKgs9Mb3tN0+DAdGTm0kqbTI1nareEPaqA+7VfZ+XwVdgrNKV1ZyASeR5ZjnjgV
	LmYsVauwzg/Oju5jN2jmfInBrfxPMp4u4lhhXRD/50BfEGqCUgNIoqdmuXASj+dD
	9wIdwA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfptabq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 09:10:48 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e22137fb3so1523349a91.0
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 02:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787130647; x=1787735447; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2MMKp0GDiCPnl181kXWr3csvjn76r0+S61NLsry6PfI=;
        b=KLJmudiEvd0TVqpy5Hhu1Y22a2zQPVhclzqTedFw+UIXrOGXoO6joHSgCcYCdmVu8S
         Z2pd31VPnaMvzfUZpB+W6jGTLE/+LjGeSJZC/ZvDDuvRisfD1g1AiLbfhNwTr51+j4n3
         C33KV+ikfZ0ZgYKk6wIflgnUsFAx4H8cMTBvRD7lcF9pxV7tWkxQ4/MrCmRUetuJLnw/
         45bY7yL4Cti/ketfUP9+es2xO3am0I0KxIaW6EC4bzy37qCUH5Unr305oU5jmbi4oq0Y
         +5fIeuUTFANiF5P7Vt58y7h6h3QU9hJsaPtUoMgiUvGEAJAUpP96MsDf1NkVnSKahB52
         CpvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787130647; x=1787735447;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2MMKp0GDiCPnl181kXWr3csvjn76r0+S61NLsry6PfI=;
        b=e4TU4UON6Y6lSlOfa/99/i+RgXE9BL9QhHSrIjZ8t+EIQXN+7iESk3NW5iXBga173x
         5wjm8bokZQvGNGjonTZWbhO6/u6gllGwTaTqRNzvrnbdOXJm2b22o6R7Xvfb+gCNDrOp
         /CVuH0vNChbdwl2mJhIUweFcpWZfzT+ua2jNfWPJ/Uy88W17q4ytn9kkCOBJNyD+xuKM
         YuCCXXFb86yikvOfZYkPbruBho0Pa4Pe4u+FGvSqBEAGWPWLb+DC4BuCVVRTRXfColr3
         JjqSJD/wd+67BVbYTFOZfr/iS2+a+lkWl3itgxZLPnSvkWS6xu8fRn2Dz7vYHR/HnHK+
         p41w==
X-Forwarded-Encrypted: i=1; AHgh+RrK3ZWhPT+XJ+NfidHzDj4OLT0qLoXWqIfQ/p8MjTLYpoJNnao7CCynuPnTDM4Vmxggq2NV+NbVUF2z@vger.kernel.org
X-Gm-Message-State: AFuF++lBQh6Rmg3XPF7bVAUXPL6FewN+jp4Ow3g30GJv2wM8Z1uMcNcE
	tDlGquIE3Lq9LPIZQ7uXj+hOL51yAU/npJgIlqUbsGc9dKz4BUhfFbUBbAHRTzTPbI2bS7lOOh3
	tXEkvbrwaZN0RtRyUfZOoxBW5uuB0HNOczaX6gEQqJPW5WNy2lZ3RLf8Ao0uNfk1N
X-Gm-Gg: AR+sD10Eurtj0RGfweTFjADhGxNcaieLsc1X8BKYa+KxNfAPlOhx9v7pqSV4+WmJpgC
	Sk31JcezDZzAprMY4k6aPxM63lvT0/THUlk7M8RT55v1jVE1ijviLa6NTXgyl6o1VTKjoWrMscf
	rSbamu4AntvKC+4s9/iNiOtwIwGc+6DlSf3ERQYOWHdjdPDH2jc7Pd8O6XQOpOsaudY4BNUsjCP
	1tXDyHQCjLjzz6c9wipDyacRdcta5GveRFTyGuPF2bO5jaHOOF/mYX7Vrjf+7okT0NYQhgzh6bu
	BkK/eRjF0bAPf9phwr1+A16/VK/zZFjsZLA1BFbXEBMxjuBBSsJEEzmAXnxZj5ZeAazRM89CFFq
	vWaHuLAzz4xb37Kkb4ew6VMLHxCFpXUZ03gOQaK18dFJ4t0PeJxRjrWJg/J+TNFlzwbWQGw==
X-Received: by 2002:a17:90b:1f82:b0:38e:2524:724f with SMTP id 98e67ed59e1d1-3958108a4c6mr6209021a91.12.1787130647326;
        Wed, 19 Aug 2026 02:10:47 -0700 (PDT)
X-Received: by 2002:a17:90b:1f82:b0:38e:2524:724f with SMTP id 98e67ed59e1d1-3958108a4c6mr6208941a91.12.1787130646918;
        Wed, 19 Aug 2026 02:10:46 -0700 (PDT)
Received: from [10.133.33.191] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957fb60a2bsm1985820a91.17.2026.08.19.02.10.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 02:10:46 -0700 (PDT)
Message-ID: <54ead445-4b48-4c99-8670-5357451c1827@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 17:10:42 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] dt-bindings: arm: qcom: Add Maili SoC compatible
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260819054203.61385-1-prasad.kumpatla@oss.qualcomm.com>
 <20260819054203.61385-2-prasad.kumpatla@oss.qualcomm.com>
 <9cb0c647-e1bd-40c8-a1db-7a0f6382aeb5@kernel.org>
 <1a2f89d8-3c9f-4316-a2ca-e515359b012a@oss.qualcomm.com>
 <16c0cb87-a25f-4d6b-bb52-24c51aa975d9@kernel.org>
 <4b3d0df7-083f-4acb-a568-99f1f74c933e@oss.qualcomm.com>
 <7808f348-6f9f-4fb6-92ce-74aedd6297d7@oss.qualcomm.com>
 <3598b276-b2db-4457-bb90-95bb231fa499@kernel.org>
 <7e66a373-7a3b-49ee-b8b4-8577544ae0ab@oss.qualcomm.com>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <7e66a373-7a3b-49ee-b8b4-8577544ae0ab@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: -UDTnN_PVjTnGLtIXebvewkLvgjFeIaG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA2OSBTYWx0ZWRfX0KmlC5fQrVmX
 ROEsOo74aT5nG/Eyxqc3Krn7AGKthNghpx1M6uyeyAf27u3F6gFWHrmfbOkzG3dJU8ggFnfolmI
 e6aw/Lg9Wq1lt7ApNlRSt4jdpubU5zeoRyNPkjwWwtrWVRGg3JekJ84iLqbdHuGw+gpNnhubVqg
 XPEzoehh4/3Thdl57coiEHMmQwjfmPj/IqvZWC0YzSM60iw0kncjRy9Flk2aH/7TDG1VQ0POtw4
 NbQwSCG/QyAIyj9UrtAUXagONpJpI1L7W15f4rewveMAWBd+m8Vpyfajbm3TOG7+A+kyO5/uy4f
 SUEeQ5fvhXY5S7SbikR+IdWzQncXxhN6t5cLI+pZegSVtm6xDSwioQqhLOixjjxTxMlWRJq1PGB
 nDGI6QedjEDZbTjwBZAUxVu9hmSqxg+S6ezk4I4KYK+iHh5yOn5J2A02NHgt11X2qfvjaK3Ln2G
 smgEROOA1qzU3x6hkSg==
X-Authority-Analysis: v=2.4 cv=aMrAb79m c=1 sm=1 tr=0 ts=6a857318 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=uKfpDHMw6nCf4ZIY2h8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: -UDTnN_PVjTnGLtIXebvewkLvgjFeIaG
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA2OSBTYWx0ZWRfXxEAOGeooWMxt
 dqb+bY2xGXag/u6zF6LzbhKksWBTcVGspNSpQB3tAML/y7V/gt83gkKDdpQIVnqVIw8BB8oXvT/
 bMq1b5mwKhex+J3r07/Ie+vMe3p7asQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_02,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190069



On 8/19/2026 5:05 PM, Konrad Dybcio wrote:
> On 8/19/26 11:04 AM, Krzysztof Kozlowski wrote:
>> On 19/08/2026 10:56, Konrad Dybcio wrote:
>>> On 8/19/26 9:02 AM, Yijie Yang wrote:
>>>>
>>>>
>>>> On 8/19/2026 2:35 PM, Krzysztof Kozlowski wrote:
>>>>> On 19/08/2026 08:28, Yijie Yang wrote:
>>>
>>> [...]
>>>
>>>>>>>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>>>>>>>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>>>>>>>> @@ -175,6 +175,9 @@ properties:
>>>>>>>>                   - qcom,kaanapali-qrd
>>>>>>>>               - const: qcom,kaanapali
>>>>>>>>     +      - items:
>>>>>>>> +          - const: qcom,maili
>>>>>>>
>>>>>>> Heh? This cannot go alone.
>>>>>>
>>>>>> Keep only the SoC compatible string and exclude the board for now, as
>>>>>> the latter is not currently used.
>>>>>> https://lore.kernel.org/all/20260622-brainy-rapid-tody-dd7c3a@quoll/
>>>>>
>>>>> No, read my message there - this should be rejected! I even wrote:
>>>>>
>>>>> "But if ever this commit is used in argument "oh, compatible without
>>>>> user was accepted here by Krzysztof, so I can do the same", I will
>>>>> simply NAK such future contribution without reading the rest."
>>>>>
>>>>> So NAK because you did not even bother to read what I already stated!
>>>>
>>>> In patch 2/2, pd-mapper serves as the user. Is there any other reason to reject this binding?
>>>
>>> This defines/allows a top-level compatible of
>>>
>>> compatible = "qcom,maili";
>>>
>>> which is missing the board part, and that is strictly required.
>>
>> Not sure if you are agreeing with me or disagreeing...
> 
> Agreeing - I'm saying that we need the board compatible to be present
> in the tuple, which the submission doesn't contain
> 
> Konrad

Okay, will hold this binding for now.

-- 
Best Regards,
Yijie

