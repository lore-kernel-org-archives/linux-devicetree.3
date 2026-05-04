Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2BF3E3D89
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 19:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777922784; cv=none; b=XT60fcgBwHuBqm3kfcgs7/UtQIJBVsdRC3XUhFK9Z2Ky5t5YRm1o96RBd3uiOBO+vVrnpyr9p1gGa52ypSlggmPNJbWwD7Hcrg3mxsEOwoD/s2HzTBVWhkwbMKpiqg/LLMas7HiOgHBkGiuV2CUPUQLFpSHiMmZr6DmKQz/6Eqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777922784; c=relaxed/simple;
	bh=k7MK9xd2y9NYzKfh0s6OTL5BRCFHrm8pJxoCMM332Hk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pl/fFS08y62urtS/EC/WSj3kOqEokLkrSC2nSHIkVLDYSD0qin2Jn6+kXv98FeigJ3D7eF4PAgpMKyua+X1t360PVPkZ8vk9hqcYcHmyEx8ZQSZkhqTgCDtx2/5DAOTBESHaaRm3HmP2PIn++lYPYH9hIlH38JS4Fqnhla9qXLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MJ9UwSxp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RFG82jFe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MJ9UwSxp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RFG82jFe"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644DrCRt331063
	for <devicetree@vger.kernel.org>; Mon, 4 May 2026 19:26:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+cYOOa0f6jVKTSVkbT8V0IdsyJ6KsR97BTOzCcLqBDE=; b=MJ9UwSxpec0lWnuX
	Pu8t6hCto5TGsuSoKllIXlg8zAe1R1z3aJgSKEMXzMu5ji3OHd3/xQXgrJ8CcuPA
	lFMW4QOdhsTH09pze6ubsEETMR6cw9EFeE/P9sOvGpjRMbnE32BGxcP8vq+Ob2xl
	MfUzZT2DnpzVKlKEnTlS5C/9iCILEsCgJDxk5D+iEFsiW1mYq2IACsKPL8iOHxSr
	d7vG+khDBfssvNrirzKRsrzestywlek17JFzaknoo6L3IfMMeb7elA1FA9aGpBui
	SYOkVCn8sZYzCHkZwyRmhlETPMOnG6pIXg+6MBgKomXp4A+tweR/g0GxVPUSH9Z9
	P5Ekvg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxvr19b26-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 04 May 2026 19:26:22 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b99ffef2a1so4680855ad.2
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 12:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777922782; x=1778527582; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+cYOOa0f6jVKTSVkbT8V0IdsyJ6KsR97BTOzCcLqBDE=;
        b=RFG82jFeCj1Txp3qDOQLfsZ/RBIYkMksIB+a0EYGnPjJ9T5q10bOyqTTnVGw9Ly5y7
         BElAt4M+nygxUCf0tFMVsyBHZapiIyc4ZG3swvvys0t0mL0LNjeovgF1CLM3b56V2u1a
         qKh0zXXcbiB3IEJa3Q5MUZarmO/zWf45PABIo2XIcGIK75J2bYGKBVqW20umPpnxAH+2
         pTmkBa4K6tBBbVgu/AhA81MeyjoQWessp8us3MG2evmUhtVgP5hRrpAa1FHu04JgLluq
         r5XwL59518GNZ/vTeO66QOyQPLrcYjy23gYVPDk/VGp0M2BxZqfUo7NbR2s6lr9tRZsF
         v+Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777922782; x=1778527582;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+cYOOa0f6jVKTSVkbT8V0IdsyJ6KsR97BTOzCcLqBDE=;
        b=B0tlUg+ab+4MrYQ36kw0j+3e01NMNawq1/6Gq1eNryrwhs1+T57M2DtMLvcxOVJOpT
         eONDJ8tJqfyWXYBRWvjshAx5GcCjagJjZ3a94Hdh2NWqPpgJo7YNVNJO+JQI7sBHQVvc
         iWZz+pG7raY4F+ihCt/+HxdkzmIMAnbFBd7ALXqAPzndnGWcNa8ul9KoBUWaRyZox1Yw
         0b8g2wtKpE0z4MKG7+TI04ARqGYQkZ1/I7Z4qBPMk3vl6Lnh5YIyYxUw0Y5qbHwFDuO0
         FCdZhk9YYnv2cVn0C21HERe12mdeecZNzV5htwDpFNASJb1zjKv97jNU136CAw0TZi1q
         teKQ==
X-Forwarded-Encrypted: i=1; AFNElJ+8RuuzGYbVWeEYDFvf0ZPb1X8c2YIaUhZ8cr+Fa5LJ6n96DRPA/qNa9C9oKzy1TcfNno0HWNu2KWL7@vger.kernel.org
X-Gm-Message-State: AOJu0YzbhO81HpAMoqnQISzWNcLCjv1oEt0FUeThbpozsEGIKkIRadzz
	5BUokZlLrpUIYmuTW0N4+RcNKn+lDsdwvmmtoXSCfdwoNgBhR1AySiIoM5nmU8xf4pn3sY765EQ
	NBNpV9bf5And5RGkgqmxfQLMq8QNRe1NCtw68adhCOj8uMSJmdGLrHgu63FNCgjjC
X-Gm-Gg: AeBDieuxMllFXtr+8G/MpepjVcURY8iPQ23o2rRNUeXzPl6jfU4ypTonerdosHRdg3Y
	9wDtUOjyEe9v/M19kJPgAgrwkxV2Mln9bkjOgsJknfUgDw+SUvkbatcpjb1TBUht4Azba/4AGhC
	6b7EAkvQQJ6sB3isZ6EvfSAdHd3ZmRiKLRTmUKUL1R6acjqah26LnGi2xMUEZF2wNu4CPobfWCK
	y8aaFKtXo+zRpStDXh71wsAWrGRXVl1KiJE7Wj0Hg9KUozgWz7WieW1seI4TtPlhMhtF7RYkel+
	egmKtHQ9TonMyrHc31KW7aFwppE6wwa8SOdf1aeKWjys2VEbAb/zrbqMXTuKS5xhP/GTwvs3vCU
	/oqJtTAmYhXCya3tk1PM3N8Bit3GQhwOWtQP2oivEjqjCaYZ+Tm1+ZysG2yWi
X-Received: by 2002:a17:903:1249:b0:2b2:5c84:32ba with SMTP id d9443c01a7336-2b9f2530f9fmr54736935ad.2.1777922781738;
        Mon, 04 May 2026 12:26:21 -0700 (PDT)
X-Received: by 2002:a17:903:1249:b0:2b2:5c84:32ba with SMTP id d9443c01a7336-2b9f2530f9fmr54736725ad.2.1777922781247;
        Mon, 04 May 2026 12:26:21 -0700 (PDT)
Received: from [192.168.0.8] ([49.204.27.253])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9caa8c3f2sm135648775ad.4.2026.05.04.12.26.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 12:26:20 -0700 (PDT)
Message-ID: <6cea3306-280b-4f01-be46-28e546cebbda@oss.qualcomm.com>
Date: Tue, 5 May 2026 00:56:15 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] arm64: dts: qcom: monaco-evk: Extract common EVK
 hardware into shared dtsi
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260427170505.1494703-1-umang.chheda@oss.qualcomm.com>
 <20260427170505.1494703-2-umang.chheda@oss.qualcomm.com>
 <36ghmwuwqgm3d432nkklw4igl6wpr5snug7jpha6ioz52qev7f@4g5pxcjxx5rg>
Content-Language: en-US
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
In-Reply-To: <36ghmwuwqgm3d432nkklw4igl6wpr5snug7jpha6ioz52qev7f@4g5pxcjxx5rg>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: VcDGOKHcdDLXOtvqrBXuJYx82dZ2fh_L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDE3OCBTYWx0ZWRfXzoqJJK2gs7mf
 31WSq4DHtNTxasSZEwi8HugEGOkeoPgK+q9VevqOIgBb1PpAioBMCVkXb/nVBfnLwpskoieg1sB
 TYDqbefqZoLlOv0UMZq1b/SlbvEu07ALheU6dPQ4/NM28NL89LPX8rrosu4wcQFHSeOg86lgObo
 s11azh5wJ2cT+noxcr7Yt5FwjiTbEP7xt7swGsvqp7To4cBdi8B9Zucmjau+cD/QKnTw8WwLOqO
 pwW/TY4dK9vJeA0PTxBuiDwJptflbOF7B5OHhOX2450IVJInO7BRI1nbLp74il0C+2RKIxC2tjP
 DWP4CRCE+4ouEMAWTHXld5Luanu47IhAaTqagDBmH7+43GDA1fB7S2//5A3dQQHZlrIo2Xruv6o
 sFfyxhbiVRWEpMRGNCDipFnfb7wAajaFirUTTZCdjRhYLYAd3bCzIxqed+PW3qeIu8+U8jV3JGn
 vcD0HVRSht+C3o8YqMQ==
X-Proofpoint-GUID: VcDGOKHcdDLXOtvqrBXuJYx82dZ2fh_L
X-Authority-Analysis: v=2.4 cv=RvL16imK c=1 sm=1 tr=0 ts=69f8f2de cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=U0tfe/lGaXrCh4Nw9m/t+A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=R7i2ZOxDFFjeJBF8qEcA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_05,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040178

Hello Dmitry,


On 5/5/2026 12:14 AM, Dmitry Baryshkov wrote:
> On Mon, Apr 27, 2026 at 10:35:02PM +0530, Umang Chheda wrote:
>> The monaco-ac EVK is a new board variant which shares the majority of
>> its hardware description with the existing monaco-evk board.
> 
> No, this is not a good reason. Is there a common PCB? There was a long
> discussion for it for the Hamoa / Purwa EVK.

PCB is not common for these 2 boards.

Also, not sure if I mis-understood you - You had mentioned to have a
common file for both the variants [1] in the earlier version of patch
hence refactored it this way.

[1]
https://lore.kernel.org/lkml/7r6373fo56alzqa4e2zzdnsgwfhgdkmbhxe4cvdo4p7fg3zren@eyiml4uedfbn/

> 
>>
>> In preparation for adding this variant, extract the common hardware
>> nodes from monaco-evk.dts into a new shared monaco-evk-common.dtsi
>> include file, and update monaco-evk.dts to include it and keep only
>> board-specific overrides.
>>
>> No functional change intended.
>>
>> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
>> ---
> 

Thanks,
Umang

