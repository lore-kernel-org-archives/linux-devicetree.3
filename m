Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792481727;
	b=ci3fqx8AV2kKmR1/XB9PZhrDdVnUrKH948SacPLR/dWn8cGSo/+B1XQ1vKAbZg61XEOw
	 DTdt/A7cuY8S8fxSbcHI1U8qqXTesTYGnTXMpEHwN8QWG3PuoFOz4C7ELtzuwuKN2yXEc
	 GINcbBJwWZgHdkBUW5VJw6sEVtKupFD4qKPqgnf0Swr+qJNbpAxKUbPjVkq2HykSFZ+Bd
	 bpa1Jq4sLhVsaIvKhP9m4PsFuwOQI9tN8dT+tRdfONoX424C8gMN/wijyyX9+YZN05NHw
	 YF+nUBAEggtFQtvudRPa8lec0be5U3pARGsgIXCT7qHmo/tqy7edRaMSeY1rmbi6Jyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792481727;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DZRPJySHmg1AbHi/1VKM5kCKJJzzQaHn48CduryjPiU=;
	b=WRu3Ins4eGjX7PfcXwgXqD1PfyxBMArKz0mDfRq4qD5UyUY5TYPwy86d2YRp6cGMuRDB
	 0phmM4qlKZFEpgLRfj+EJQ2K7iORzDKxNsRygT57xZmIuSL/xqCvGdFKYmDQDTFYLYazU
	 snfZKhx/+cN4DIIpIGBKmEdqONpDFeWP8JnFOP7sldWUMs6qZ1udeUZZ/TzfX1ZndlksV
	 QKcCq/nD85PFs774qYBp9MmqshVuWzls4Kvpo+AhMFa2FLi4RXrk1oJLfQCJmkE6lNHKh
	 Aghz6o3fJVK8gABBrj1AJH6VcRYcJd0tN2yDjCJlNabC1qaNZknE1fefnFIfTCuJ9hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nlRDOa8t;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ei9vJL0U;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA16606A319
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 07:35:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EA16606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nlRDOa8t;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ei9vJL0U
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0t73X1211011
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 07:35:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DZRPJySHmg1AbHi/1VKM5kCKJJzzQaHn48CduryjPiU=; b=nlRDOa8t9Hgr9vm8
	Exp0+O4d+Xq/xMzvPrNn5DYCcsjtKzuLCyw20nRs4FePtAY6GbdMW7zyWxPDL6bA
	19+GeiCCMFgoBnkaw3ePKddjvKYbPqPNXbu8ei0HeNVbwvIi1SO+PETvFZQFjxNQ
	90t9Z0t4j496eyQ5YcbChZ2d8i6fEGd5Jz0onMYlMQssopqHIIzOzde02sfCmQlV
	WmvmbtI42ccAuZLXFPFdj/VNRrIWZtmgYr2is7Q4x+lxqCfA2qu/swuxyGatNtmN
	iqXiRQr1EpvjbRrSbglaH8GdJEzxYHGMU4zEbCcEGENoFD62C48b7mC0nNqgBUUW
	PZKQKg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5p1dhw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 07:35:25 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5356c6d98cbso10523391cf.0
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 00:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792481725; x=1793086525; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DZRPJySHmg1AbHi/1VKM5kCKJJzzQaHn48CduryjPiU=;
        b=Ei9vJL0UREV7NGiEWAy621xe2iRZsXLBXEYe7SecTLIEn2yDIEByo1qPpaJDRcGbRd
         wPCL7tuO+kW335EZsEPFKXzjff4Ba3dtEGrIQj6r8gTNpHhvq6TtleO326jytYjFf/wx
         e31Jh2fi1VYQ9m8v42svVjW/nxoXywX0sxsyQaLIgM1Xyqc5KnpjBnYKwWX19arZlWnz
         cO9ZCIv+h6r07/DYq0MU+L8Y5Jmzm+l0hbxmHaCJDxK1/abFvQkT2mYGVFeh+CHDYIns
         jMfWGkQEPBi/KWpETWFaMN3A6kr3FX1PC9UGxkhHG8lyedZbyk+fIdF7CbalP52afOJ2
         KjYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792481725; x=1793086525;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DZRPJySHmg1AbHi/1VKM5kCKJJzzQaHn48CduryjPiU=;
        b=Feh+lIJfp+spx+zG6GUH4H1T/zRi3BvwAjjuD9bq7ujr/Rwpd68UGUT65HFn++9XSJ
         15aceY/ocViddk20BtPenLW//viu2jGn2qaGTYLyPwN0CLjaBa/pvTYQEtWw4LmjBfMb
         EgpZdrwU/gzsIZohsxnbrvx2e00pBX+b5f5U/7n61Geuxkrn2Xaz63ny+E8C3/OfjYBg
         ttaiXVS7K9X4HDFKpK7rFZf7U6IePKdMjRNwzHS5nXz4x+BiyfW3z5o9g4VcSqpGEXI5
         QPckVsLh2ldwiXfPQUy13EEiUs8SNygeRoJe4ovYFXjFO1mtsgYQfp1SOhE1Ara2mIet
         EoZQ==
X-Forwarded-Encrypted: i=1; AKwUvBxFh/Ivx8x9Jt0SUBlbzy6fyncCp7wvNe8UM2Pe5ftrbNdn7yG5qpIlFUK1xqJ7hNTSxaMe5DFvFJI9@vger.kernel.org
X-Gm-Message-State: AFq9FYLxfQQZfxTdpFSmeeBXsTVnwWGEdk48Eeqwnyy0KFqnSpKFPg4W
	15mO03j/XylgmuGNsHzPTXBrFAogaedLHby/8u+zquXChfQeGUK6Of6DaRnDZ+Q5VbA8qGziKiR
	QyJTDMD29hEgnJmVzjOu8+XDEGBH1dtP04xA8JBkwiWFHpKAcLfNH9Rr8vYaVnKiH
X-Gm-Gg: AYBFou1gNa6viattyHOTGLjRZlnrAE0ldvNdZbDNxhx0oo5JAEmmfwKV2chhAtZVGeF
	vvPSBy0A4yUJt+f4KeCG+jVnQykrv7yd0kBxAiLlNKL6omyjbZ33EurhqpSwhprkthoweWCIFxz
	K0nXZhlFLAuD6dEWacZ+z6u1lSRXZzn4dLPNwkgngnvmHZ/0dlw3vV+o84H3cBXaslDw1oayKpK
	cUVkE3dllrP1uIc6caWraYekJ2MvXk0au9efFa9iYnuxhIJO1G9A/iJ4EikAAx4OELAUDwD99mL
	iiYt9wZg+VC2vYlN2h34ZSSs1KaFhi81EZw+8EinH4oEpgPvkm8tMsnDDjvMv+wow/8a3PRKLIn
	hVoWLcnvjvj+G1HinEhSuQg==
X-Received: by 2002:a05:622a:14cb:b0:51c:2324:666 with SMTP id d75a77b69052e-536460e29afmr170738211cf.3.1792481724817;
        Tue, 20 Oct 2026 00:35:24 -0700 (PDT)
X-Received: by 2002:a05:622a:14cb:b0:51c:2324:666 with SMTP id d75a77b69052e-536460e29afmr170737751cf.3.1792481724319;
        Tue, 20 Oct 2026 00:35:24 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb14a7sm471411166b.76.2026.10.20.00.35.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 00:35:23 -0700 (PDT)
Message-ID: <a69738f1-1c6a-4476-9c0c-8443650d1f6a@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 09:35:19 +0200
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add Samsung Galaxy Book2 Go
To: Luca Weiss <luca.weiss@fairphone.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Jasper Korten <jja2000@gmail.com>,
        Federico Amedeo Izzo <federico@izzo.pro>,
        Luca Weiss <luca@lucaweiss.eu>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>
References: <20261012-book2go-v1-0-7188e7ea7a15@fairphone.com>
 <20261012-book2go-v1-3-7188e7ea7a15@fairphone.com>
 <fb634f17-de56-4f43-b139-3d040a35f019@oss.qualcomm.com>
 <DM3MSNLF42BV.1UV490PXB0C07@fairphone.com>
 <emdm463llmoi6vsv3zmfjddqrfaf2iubdnydsqye2n6ui56oae@frsvj6el3zvq>
 <DM4DIJZOLJC0.2KAZET8VYUDY0@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DM4DIJZOLJC0.2KAZET8VYUDY0@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 5KBtg4t_LnMfNbpXhtFzwi2ng0bMotr0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzMCBTYWx0ZWRfX03hPQT70+tus
 /LAYzNPwymREb3Sh6yaDUhaJuInRMCElyI2jkjG6jViv9dAL5KtIpmoF9Svu+eMfR2dHPnUoUtv
 8KqmeDS1D5mjKcjpc/ReTHGaI3MTlaM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzMCBTYWx0ZWRfX7jUYUWhCQ5Nu
 EQuw6gNSbW8RIQ7xW0pp2SZKNHHNmVOTDT/rTgMgA420gInQ9aIUiwpUmgKsXSDCPYETwLVUsaL
 XjEWGG62RIR2jt6e8kdxnNc6kTCtdY72TWgtLuLMrgOJGZrGFZweYYmkKQruB7tHcauHqERa/JI
 oQNw6KFmGqhlelYoIQ16tzUzdN52XLpEIGjZTFYNyMvOuoBE0bMEt9fxXYf0Tw4dXtQbXw5791n
 smg9DSwHjWqiCWZbUZZuzWgJgu/1LP9BVPmBT3N2Poa295431p6yKTGfFN8Gl7wcUODuB3+JtMu
 Pl996+sfc7tpsVmTuZNu560U7m5KHcmxwlMuikvJ/Ogm1NHkyfe6txjkUHVV95+lItTu13Vwrfj
 nDTglj77DyzmAGxq/bPr0dykTPfoFd22xASjL/fGp33wdiQuDwnN/UNdQLaHG364kaPsKAd6OT2
 REUl31X0Gs2BY6QCqRw==
X-Proofpoint-GUID: 5KBtg4t_LnMfNbpXhtFzwi2ng0bMotr0
X-Authority-Analysis: v=2.4 cv=crUOAF4i c=1 sm=1 tr=0 ts=6ad719bd cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=b7wq30jk4QowdIX3xroA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200030

On 10/14/26 9:13 AM, Luca Weiss wrote:
> On Wed Oct 14, 2026 at 3:28 AM CEST, Dmitry Baryshkov wrote:
>> On Tue, Oct 13, 2026 at 12:17:05PM +0200, Luca Weiss wrote:
>>> On Tue Oct 13, 2026 at 12:10 PM CEST, Konrad Dybcio wrote:
>>>> On 10/12/26 8:11 PM, Luca Weiss wrote:
>>>>> From: Jasper Korten <jja2000@gmail.com>

[...]


>>>> I'm assuming there's no pmic-glink on this device?
>>>
>>> I'm not quite sure yet how the USB stuff works. For sure from
>>> observation, USB-C only works when stuff was plugged-in at boot time
>>> (UEFI?), and charger also only supplies any power (but not actually
>>> charging) when plugged in at boot time.
>>
>> This means that something is not 100% correct, for example, missing EC
>> support.
> 
> For sure some bits are missing. This laptop doesn't have an EC per-se,
> it's got a "EMEC" - Emulated EC, where on Windows there's just a bunch
> of drivers handling EC-like functionality.
> 
> So e.g. already for battery, we just talk with the sbs-battery directly.
> I assume this will be the case for the other components on this laptop
> as well.

I guess sweeping the i2c busses would be a good start. The other day
we got a contribution for a SM8550-based Samsung tablet which also
didn't have pmic-glink, but used a SM5714 IC instead:

https://lore.kernel.org/linux-arm-msm/f7ba4d5a-0e8c-417d-a1fd-5b5e392df71a@dxdmail.cc/

Konrad
