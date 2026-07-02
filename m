Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC3C355F46
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 12:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782995975; cv=none; b=gsajASkMkHl8NMKGOb3KiRH0oiC6OiLvfngYzuR4UQIic69lYr3MFcMkA+Yr8E1Lwr4Nu7Uf40X5QrInAZ4qbgq/ZDxxOrcurVUBAmIw87ZJSmsz6pj81iYUgA/qAhL7OmvsAD8yNUdj4Q30EUKlUvrhcn8gOPvS/iU2tPKcKy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782995975; c=relaxed/simple;
	bh=M/1IO1ovD3xv7E7bwlWhzJmzQk00aY6O8z3/PeBE8DE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MIVpnWDIee8/3AzLGbrdnrJe1Yz6nNDqP4l4z8oq9ONoLrZFk1eD3M+7a62PhZkG11XNGHUkYBU9lSN/xpjFBebRaOOp50lSxVzLjyWrUb6+kQBn0J0vX35pjxAHppq9LbYJ+bcYLub9eDrSNNvg8CeAX8jQSpHLhdIB48JTeQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fza/WWmC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dazX+XzC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fza/WWmC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dazX+XzC"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662AVWrh3591605
	for <devicetree@vger.kernel.org>; Thu, 2 Jul 2026 12:39:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9CnAJp8KHEUhQx8/mU74U/fRMf07e+imvfeLUvkYie4=; b=fza/WWmC380toLK/
	tHkJhoz7hhJw77/0liY0hTcH53/gnckUuFovyfcL7LP+LAhlpcuoLXs8WpKVTqfV
	egxX2ePfToyWWUNRllWUV1B/SaEoF+7Q2iFX3m8HWaxE29Bik2tayo5h/st6S+We
	/gXOgvymgN66zWT+jNpiFdK0MoXWyUb4Gr4OyWkTfzHh7Wj/GXank2w7l+3BgpIE
	pgNeBhzbvG6kcwg7ya7krJjdmfVsQ1iMNuGRaeWCh28H8oJ/PvfEWE5mWOdmbTds
	nL+lnSrAfW5gbmbCWxABxdcDQ6qVbS8Ug44ILepZMAsr7gxviPFlxTNouFn1BTfl
	ti0Hdg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5h7n9r0x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 12:39:33 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c19a2da0eso1291851cf.0
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 05:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782995972; x=1783600772; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9CnAJp8KHEUhQx8/mU74U/fRMf07e+imvfeLUvkYie4=;
        b=dazX+XzCBzsIq/2oYnz1XEEoCFCqexXbXOR0iEXBaTYMnJCDqNddTk2e7t3Z26zGmh
         lS7KWttUXAlKs/R4RLn1mkTPLn07NZuIqB8cjjs2ImRPdMLbPvvS/0b/dFlHh+aS+76m
         2nE9Q2jsiE3CfQ3rFg20lU9TIfMdV+kLIV3YONYentTFYVH8lhfLooXNbfxsbSQNmkot
         N2f+N4dPl/NUWdVw0OINHHw7zhFuvYZatB6ZuRBgN+Itj9GPgVqzNbFIVyIL8jP0JFCm
         fi8j368A1n8pOeyHBQ4HKmDHUkoLaKwDPT78d+jy3IUdgVyw5WJytkIgFxjmfrFKpLcG
         CVYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782995972; x=1783600772;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9CnAJp8KHEUhQx8/mU74U/fRMf07e+imvfeLUvkYie4=;
        b=KPh6RFlbUI3kxBtwgb9swNwonPIqet6ZoOowwGETWI/C0aKZ4x/8/YOt4mXUi1igb/
         zwyfH0Yz3UBhC63MvKqc0M6cB8pCHenfFCm7IUvGVmTVLT171xO38vH4/ZTgRKB9tN7P
         BPOqzS+K8EtgW0ybQeWMP0wYM+duU7LiGO8bIKecvVPCq1Q0YUrar+FF1NfODRCAlMdh
         lIX8NxcHbL1l+b8LpqozEOsb3+tx8NGZB7/NaR8YZ9RBsqTcu7ez3+s9comZsi/9uCj1
         p+RjPlA3G99oLoeq++gMnq6yg9Ho/zpaNhjm7oNs9Vmj7ERp3aKs7vOaU/X7wqAit2xI
         a1EQ==
X-Forwarded-Encrypted: i=1; AFNElJ9B0AfgS8TJqQDWwr2PW6YOWli4dIbGXaAIAP1id2q/REqVbOe2GsATJrHxATOmlWl3/FRvV0yYAx5j@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/bl04QKm/fIDxDPIT6K21E8I62KZs8+DqW1la9+8cZm8nbx4b
	gRQoDtdEjqXTY5m+P6VoqMSmXFrwTFniT30LuL+K1/t2cY4CfzFYa97ySii+6a6KQWTMi+sllNs
	nl/cDjD78C6zlX9QmdOWH0ZTCHK7eR4sCvSvKUJEAM/rG/dKIpFdg3pDL0bKQqvGi
X-Gm-Gg: AfdE7cn5lB3rjdv9AIfJJeKOwU16fjpAJ9HbsiA4knAyvtfXC+ZHfbNE5BbH70OinaK
	mR6tnWtwOtTdWndH3M7vo/RwHAm8jjqmfNXCdnPrLxnCTVS0pqMPk1h6iw00q/zlaYjNscvyWDm
	1/grIoq5fihBSF7HfrFBX+dgLXSblhKBM7ecMR4GkFZR4tJ2MpZhaajd7NHxR/eTKRnSJCZLkXS
	CzggZtR/X5aA/rXO4AaahJNZ+0m90wvy0R44GqYlcprhUZDHmudFUHTKo7FjNvNNpfm6fHqbEl2
	Bev7y5/Zq6JcuWZ3j7pG0v6vYccMsVh0s1RrnJoFt8guiYpGp4bQBUAM9pFS7gVQf0yUanBr5EJ
	3BHv+efH8wwIjK5sZdDcWkapSwgyr8IYp2ZI=
X-Received: by 2002:ac8:590d:0:b0:51a:8c9b:6492 with SMTP id d75a77b69052e-51c26b25d63mr44656451cf.9.1782995972038;
        Thu, 02 Jul 2026 05:39:32 -0700 (PDT)
X-Received: by 2002:ac8:590d:0:b0:51a:8c9b:6492 with SMTP id d75a77b69052e-51c26b25d63mr44655921cf.9.1782995970668;
        Thu, 02 Jul 2026 05:39:30 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-698ad0fff43sm935595a12.17.2026.07.02.05.39.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 05:39:29 -0700 (PDT)
Message-ID: <c3922558-dead-48b9-a49c-7d0d6a2dde7c@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 14:39:26 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] spi: qcom-geni: Add property to force GSI mode
To: Pengyu Luo <mitltlatltl@gmail.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260614083424.464132-1-mitltlatltl@gmail.com>
 <20260614083424.464132-2-mitltlatltl@gmail.com>
 <qwbda435on6rhsbf5o4jqijakanjmnmswnc6g6qsubuqbyvbok@fuoclv6u7tq5>
 <c29776b4-04b8-4c59-8f1e-d766bf982a2f@oss.qualcomm.com>
 <CAH2e8h75xeRVvo+jOjRuFaBko5NNCnBX0dawFFsWBaiTwNd4Xw@mail.gmail.com>
 <99eaf1d1-fbf9-4336-a13c-ae8ab789cc99@oss.qualcomm.com>
 <CAH2e8h6aWW_=pD6JAuFB-VqEZDj9x8gZVh9TdvTCRQakKzm3pA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAH2e8h6aWW_=pD6JAuFB-VqEZDj9x8gZVh9TdvTCRQakKzm3pA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEzMyBTYWx0ZWRfX4fY/z0Vsdfu7
 0T2UegVYFtPCOphz07to/HXHsFxKqxYCCyccAMDAj2yTsjs+XaGLFZJmHoh5rSHg8XTc8jbO7II
 IMd3KVz7iJikZFce1L2NSif9UCrf6+U0Q1u+NHvajBq0x4/ZAL6YbRJ6Ly0JWsGUa/B9kLw0RIZ
 H3oUDD1at8k+FfsWz2acuTQU/4CrUadu8A2jKcGVOLV1aOwkiZMHYf80YJVETfu1/OqPs6PHfp0
 xz6Fz/W6gAO1NkeCgMwpVAAw/drHx5ocmyPFgsJ3oc3tsr4JIs2uYMa41EAdb8kNOh/fTS2JS6S
 If4woG4w6FYJN7xCouAZwkVMFxwC/t9x+68jmO64KpnkDIySuRw9QnWrI01aLZBMKh3hAcm2YBx
 AzynBpSvr+dw9523x7z/0QYRFs4SWBgBFbtglO4HWYz+sHc3LFTwZWnvutk9MErSvjKr7H5p+Y2
 Jg0teIy3kpL7AUVVi5Q==
X-Proofpoint-ORIG-GUID: 0eOmiJqBSltQgeYYLqJyBaTsFj0XYRLm
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEzMyBTYWx0ZWRfXzJJpfHZd8lWg
 s7rkMHUvFr2ctaYvGu1XZbBHmmhV4wPsGFn2q6KBmT71C2Tpm8VJ4pGrG42AewE/UPxoyh4V3vx
 Az7YOQ64UU45nkibAwXDbM2z3rRxKm0=
X-Proofpoint-GUID: 0eOmiJqBSltQgeYYLqJyBaTsFj0XYRLm
X-Authority-Analysis: v=2.4 cv=WMBPmHsR c=1 sm=1 tr=0 ts=6a465c05 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=6QUDDQO5MDr9iEhkdtUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020133

On 6/30/26 12:06 PM, Pengyu Luo wrote:
> On Tue, Jun 30, 2026 at 5:52 PM Mukesh Savaliya
> <mukesh.savaliya@oss.qualcomm.com> wrote:
>>
>>
>>
>> On 6/29/2026 1:33 PM, Pengyu Luo wrote:
>>> On Mon, Jun 29, 2026 at 1:36 PM Mukesh Savaliya
>>> <mukesh.savaliya@oss.qualcomm.com> wrote:
>>>>
>>>> Hi Pengyu,
>>>>
>>>> On 6/15/2026 2:48 AM, Dmitry Baryshkov wrote:
>>>>> On Sun, Jun 14, 2026 at 04:34:24PM +0800, Pengyu Luo wrote:
>>>>>> Some devices (such as gaokun3) do not disable FIFO mode, causing the
>>>>>> driver to fallback to FIFO mode by default. However, these platforms
>>>>>> also support GSI mode, which is highly preferred for certain
>>>>>> peripherals like SPI touchscreens to improve performance.
>>>>>>
>>>>>> Introduce the "qcom,force-gsi-mode" device property to hint and force
>>>>>> the controller into GSI mode during initialization.
>>>> Why to force ? You can directly configure in GSI mode. Note there are
>>>> some configuration done prior to Linux bootup too.
>>>
>>> Sorry, I don't get it. how? I know there may be a qupfw, but it is
>>> impossible for a normal user like me to generate one with GSI
>>> preferred.
>>>
>> If firmware doesn't program in GSI, you can't have this working in GSI
>> mode, its going to fail (and work with fallback). if it's programmed in
>> GSI, anyway this will run in GSI mode. So why to add extra things
>> without any usage ?
>>
> 
> What I can confirm is that fifo is not disabled on my device, and gsi
> is definitely enabled (under windows, check the register
> SE_GENI_DMA_MODE_EN), forcing the device to enable GSI mode on linux
> works well.

What's the value of se->base + SE_DMA_IF_EN (+0x2004) on this SE?

Konrad
