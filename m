Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E78C3BE635
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 12:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789993446; cv=none; b=J3Sxjw5irNF2FV5o76tqPA0GnMW0uSCNzXHL0tITc+yJ+nUXSes0GEGCyB5r6lsmhDrvQVZhI0/zdR0I4YQYEwShv91GZPVR6I/8taOZEdB7C4kOOgqyZgbAbqCdmyZyhXsMVmNQuTndNnssV3HUO0+rFsNFF2FZqVja/n87Mqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789993446; c=relaxed/simple;
	bh=qCNMsx/uc/pNWm/YO7I0ZBuH71mQrPFF88Bz66g6IOk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NERjL1LPlaDUx37J9sjkgCGYWa7/fW3ct7yQ4BPh+ieiB5smvVSUSLV5MtPCwGvmHqqZ1LTQ1IoYPf60Tkw8YBa3hV6eeOV92/qxn3WJky2dbVeFNT3G8Eo6GgF8cwVonH18Q2rUZI1JX9sUrnXU3ffV8Vi2nCS3Fi+NesJExno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OoEWN8g4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Iu4qVML5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OoEWN8g4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Iu4qVML5"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LB4rDY1130242
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 12:24:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2hX0nyMoB0pgtWjEs7TcbpdDDeGxZEojIwJqmRzxhTU=; b=OoEWN8g489Lgn8XX
	YKqdfKr5J3lRp+o07qYkvbnGt4e4z1pctTxnVUHD7KleCXYybvBeYa7gOv8Xf1E0
	jZhSBAncAKtCLT8Be/awroIpW5/VVKWjDnTdwKyl6TXoHPFZiNhF8DBModXdmfUW
	YQbQfRPRKKfm6tw5mtHtFZgW1b6dQK0JeuodOZ+isMqNbZu4DfXpD4vmr3bbM8+r
	bblD42HjvwR/D/APi8of1YGQm4coMgimUhtF/0XFKWtTvsziL8DjqpobFqVXiM69
	vI45JrXrNbWiE/9ppPGs5nBvrtsk85DBdmdh9P4iuuo/AAHW3cWKSmFYI/rFXLlN
	fSIkSg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu3csg9dv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 12:24:04 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c7d6767d06so93090e0c.2
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 05:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789993443; x=1790598243; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2hX0nyMoB0pgtWjEs7TcbpdDDeGxZEojIwJqmRzxhTU=;
        b=Iu4qVML5I9Dgc2Yjey7dGHXIwHFGuNUjqr4dxMvE6kZ6HLqzpBpmU/Pkh5rJSoBwRR
         duUl5FUTTy74oyRquadCIQ2lIlD+5r+bx/J9F1/ohQ4sbfhbqI2VCNl3lm1ecUEsPrsV
         dcdDhP6BS5cTPi73DK9Ag/4MLrcCHcaDK+mTo1DFrTGFqfON5WlymHbBRpcnGJriyhPh
         RhC3RPTeh7u1wCw1ZcBq18dzvufCr5mm1mxYoGNUwjtpX3F+P2cavnt0jghlZc3RZrTX
         4xqpvI3j1J5tJAQ17ftngQtdW3lcy6gzySlTbe/GDZEL3JVtXIi5HeCdEKKVnCpHDJnA
         bNEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789993443; x=1790598243;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2hX0nyMoB0pgtWjEs7TcbpdDDeGxZEojIwJqmRzxhTU=;
        b=2KbwwUqv8JYc8lPBJ60DFS2+CO2sxfGR93Qr0WgmErETBqpY0xD/E6hpPgnCCzup8V
         13U9Soi2luJN1jVYoJD/K2WyYe90yp2SpgilZVeZ2QbM0s9CXoeKUCtVh+oGBf7dEP+3
         QMnvQK4qU9UILx4PuOkZj0ba/686jbkJ6TTjbJb6PRCOeVNnB1DZrhL8401fbyZA/3me
         XME21nTgpEECFS9Ru+5n+Ec8SgeotIyh2RZfopOBtlNr1ZcepRBN2xfe0oHhrxuc6aXC
         TrLgmyiJFPWIyNc2005s9sBv0cnsn0/rK3QoGOAMRNgf65F/MkiZH2RTSKEPWUTRhoWR
         1CUw==
X-Forwarded-Encrypted: i=1; AKwUvBwu0XIKry7surjFVjBL51PMeUirnkaLVqGKG+B/GgwurD+ncVjRrR/0XvGU7v443Vo8CvNf9d07duUP@vger.kernel.org
X-Gm-Message-State: AFuF++krz5C+NmObL4Rn0X+4vdhjUIXUqoouIl4E2x9Bmrb7ZSOJdw+E
	1k9qc8kl5HKmvaerm8qCvSLTTBETn9mx3PwOpyhJewA5hyrVARjFNjYAC327n03Oo49odI5Cf9H
	mzDRPREh84fSkM4o2CwodUlABGZ+BzBEEltvic7uHxI4rqIbW4foueB6GWeLno0RS
X-Gm-Gg: AYBFou0bPjzgXjrzw+qNiFtrAP3CpfJ8mj+V7b74ODzJGJ/lJluxU8juA9KLgw33MJ2
	U3aLuFfAQaUcnGsQcigot3eoTeKwF2mPn42qtOLFpvxW9/HKxHDWb7L+C1NhlAr6Tsx5sfocdqw
	dQmx1uZJ9lsvf12iPEW9zmCUN2TVQMv7lPj+me6fwAL3z8PghXMhSoAcNGTbtnHd00TFIntUnk3
	OgHuIs9ZvR8qSwBPd8TsuJE+ZX1WgCrxm5Eb/pqPYtySBORPfzXo2gHgGrziYcQeF50OQZzaImr
	q1qA7SwAGNm3+XohOsnxHFPIZGKNK4wxZRTSgqV5OEdQglbDfNC9ZTglKHNndCSVSY3A2WT0SnP
	Ao3JC8FWgO0dTo/o5X3notw==
X-Received: by 2002:a05:6122:4a11:20b0:5c9:91ba:5d7a with SMTP id 71dfb90a1353d-5c9b8a53dc8mr3456232e0c.1.1789993443329;
        Mon, 21 Sep 2026 05:24:03 -0700 (PDT)
X-Received: by 2002:a05:6122:4a11:20b0:5c9:91ba:5d7a with SMTP id 71dfb90a1353d-5c9b8a53dc8mr3456214e0c.1.1789993442897;
        Mon, 21 Sep 2026 05:24:02 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8c7961f4dsm1961105e87.68.2026.09.21.05.24.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 05:24:01 -0700 (PDT)
Message-ID: <579939eb-92b5-45a8-b782-8e79a4366a8e@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 14:23:59 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] platform: arm64: qcom-hamoa-ec: Switch fan profile
 based on power supply state
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20260728-ec_add_more_commands-v1-0-771abd65ee1a@oss.qualcomm.com>
 <20260728-ec_add_more_commands-v1-3-771abd65ee1a@oss.qualcomm.com>
 <cf04c613-ed91-4929-aaf6-421fe9bb7ab4@oss.qualcomm.com>
 <1612b46d-1291-4593-b24e-464ba2a180ed@oss.qualcomm.com>
 <872897af-6357-460e-9aa0-158eda22aa43@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <872897af-6357-460e-9aa0-158eda22aa43@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE4MCBTYWx0ZWRfX2fQjqumwhOEB
 71B29oDNy1pWYM00ap15TVuvOAivyQuGjKO4ruWludQHIy+yD8P/pDJU5UkRTp0n0qeRNogA90g
 JbLJV6V3gV2/n2CvhSWeTTGGPuE8T0I=
X-Proofpoint-GUID: P90xIBJPV-BxJ0Kx0VRAJtcH299pAwfV
X-Authority-Analysis: v=2.4 cv=QovLTlyd c=1 sm=1 tr=0 ts=6ab121e4 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=gD9UIibj9IRekF7xquYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE4MCBTYWx0ZWRfXwpuCv/UfrCzO
 74oUAvd0T6d157i7DiwqqfI+Ag8Tkp3341FXmpWNFNzH/XTPtYaFxJJucmmsy7oJSZaWh0OOtF6
 vm5be0XTlf5a+7SnpWJJ2k+0XkYWQOb8QyvRBHbPDnUshpKzUf8kcR02q7KNQORMO+7Hkoi/SpD
 7pCXnhx0pASnVs5Npc77VO4Egp+9QQIS1wDNzhgw3xnMvm7VIUFO+NQJWoNNu9oLLFGDSrrlnG4
 HWGv1mvv3gj0HcYa1itZW0Csaj/sV053NTxz2/pbhwmahp7MRtf+4PP9B0dqRDDUjvIkyKla9th
 lYMPZQZv5GTtZ4UVMvwXvBtio5rTgMT+rX8x0u/Vgi+CqONMMMteNjveVxxIXAmPi4C4Ltsehum
 06SG/c26kNDnCkmB0Cr/UGQcRV6Eu3AHQN4UO1qcZbpH70n7mUWWRcHwzkFHLnerXWGxU7e5OxL
 CDxSd+RD4lInk1SUceg==
X-Proofpoint-ORIG-GUID: P90xIBJPV-BxJ0Kx0VRAJtcH299pAwfV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210180

On 8/19/26 7:19 AM, Anvesh Jain P wrote:
> 
> 
> On 7/30/2026 11:51 AM, Anvesh Jain P wrote:
>>> Is being on a (powerful) charger a prerequisite for entering this profile?
>>> Currently plugging in a 5W charger would trigger the switch as well.
>>>
>>> Should this instead be exposed as a fan profile for userspace?
>>>
>>> Konrad
>> Fair point — power_supply_is_system_supplied() only checks mains
>> presence, not charger wattage, so even a 5W charger triggers the "best
>> performance" profile. And exposing this via platform_profile instead of
>> an automatic AC/battery switch would let userspace make the call
>> instead. Will check on the feasibility of making this possible.
> Even at 5W we're still not battery-constrained, so best performance
> still makes sense, it's about wall power vs battery, not wattage. And I
> don't think userspace needs control over this either, it's just an
> automatic fan curve pick, not a performance setting users would want to
> tune themselves.

I believe fan profile control is very much within the expected
feature scope of a personal computer..

Konrad
