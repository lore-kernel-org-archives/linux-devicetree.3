Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6437C2C1595
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 15:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784906563; cv=none; b=WHD9w//J9GFnqb07nl1DLEZ7QeQmwz64NBNnZuTQF8EikSDYEpPN/ZUpopuq9DMY6P9I2nXUZfmtSyMhvM1Z07jicrsjihfJ7AJehZgmlbNpYF6SgrDmivr3RDUbI8q7mIopDa24E6vQaB/B7kECCmT9lVYkBP1gL1AhZlPWbt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784906563; c=relaxed/simple;
	bh=BjasvDDkwHhNv5BcQv11IQz/Auu0rUBaauAiyQZi1wQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rfl9qLA057QhOyqxe2ShJbrFxhx5edY/B5nEcgyFOB67y6uKTQ4BCL6YIxEd8gFnqV/6cRSiwAHXXN0nH6M9bxylICO7BbpPIkBmz/7bM01rrWINdShcsgWkG7k8H8KOu9Co4rbAG8VZQTQH3HkYFzmlDyH70deNc9Qg83qZCIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bb6CY/pf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dwoC0IAX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bb6CY/pf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dwoC0IAX"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ODbJxm3178258
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 15:22:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MTjudTjsFZ++4fLu4bdOkAsyjNhKcu3SGdGBfaWfL5w=; b=bb6CY/pfdNV5oL3N
	ZGWCM1KpDfhyJx7YS5ao9gqjyRvheK0mr3jASzphXVg7Y9dinCNfJlczfrVm+80W
	usYhVxenUVaft5g3nQpb/G0SZQ1hV1KuJ3cM3fEjDjzr2w98SdXIFwwXm3BR2Qkn
	12w97lFEQNXrMBO0fnX3ejnfmwo/dMNh+0lEWyIzxtsTLf6Ux9foUIk21BwMFDyr
	fGmmzS4m9mwwcPVO0hvUixDDvhBnwNesdX/0XN3FpYUpmatTcciwPLpW+W8YfnJz
	QEFWK6d2P8s1V8CANNBSvvizgn1IeFJ2/uJhldAvtGQGrMRkxSpCh1iwemUEQHH5
	1COiaw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm5yah5n8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 15:22:41 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8ebb599e528so1007246d6.1
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 08:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784906561; x=1785511361; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MTjudTjsFZ++4fLu4bdOkAsyjNhKcu3SGdGBfaWfL5w=;
        b=dwoC0IAXa5MvMCFrkjbkidAZUPlFeiFEgCbeOpFgh/qdNEOGBBLowN3NGsMLobTTwU
         u8UX8Vi1ogaiFXr+0AHEd4d78kM2RO/Ld64Rd0fQuor6GByTTUhwrvzwcXf/mRQmhmPT
         Fo3MGEgNMeovEWkRCpjdoUayNnmxL5X+xP/oaB+ORiwL+HTxwNwFw8A9hthVM3nKONnR
         YAbE044fHrvnTV0trJZBqTqenSAUFpEIpqVr7DZU56zmwi5BOSz6z/1rbq0yTaShQlsg
         VOYNANQsIjTgSrkqWcymOWdAR/lcVjrFqk/KO4EgZWnSFn5DXMe7xbOArsfPT7jpNxV5
         xMCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784906561; x=1785511361;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MTjudTjsFZ++4fLu4bdOkAsyjNhKcu3SGdGBfaWfL5w=;
        b=EZI5ij5INVL1N/osVfBs5mXDaY0v/YpD/EOcs8wlc479vFJFll9US/dcRpd+1AChJE
         yPUOlvO2u7WD8emLjBkQZ+aR539v9/xc/W0Mj2X8Nrn8rpxBp710vhFNMoknbL1pMvN/
         JKhxbloCpuV3xM5dbKSk10rRe4hzI6ICsft2yqjN1ZmtQ2I374JGw5knDZ/SJq3fE/2D
         NUoCvXjMMfmbBhpmoM0cWcPxfI4TSy9z4gPu72GT71Dz3KqKz/Q2SAcpQ/1YXRBONrAZ
         dOy8JqOKU2MxFk7ouSLecw2jsgCubAneoJBpYMzFKM+BMhWvTPs6irZgN+9Y3ywJtAfv
         eirw==
X-Forwarded-Encrypted: i=1; AHgh+RpXRKBJMwInzbEiKDSZ2fQPFWFsxGBaSxZVWMB6HMQDPifzle8Bhm/95JhYeNnmEQwBpuRrgg52N3Ee@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/afRkwQ8/DHAHJnnqN4/+42hqJe4P/NVur2cHxR5k0LPacB78
	6StBkPVvcDF2MhtZ3zftxQZRGDtvjMa2QRvy+aVv7yxXHSGIQhaDDtYOQTq2l7IjkI7V0PNnuVi
	Ix0/HJxxsM5XrrIlvoklb4lD9MdSb4DQwyy7Tr+LagKlFiPuUS9vM3J7XzJLrDg7Y
X-Gm-Gg: AR+sD12HL3mWMOGoCVqBoG/lhjffDSmM0ad6bUk/5xxWP6kj/UnxDNcee3FrqYDIyFl
	tIFiu2uz4k6TSoqiB7E/QSD8AeaUSErdJXkDvSjRXQcR1+iGVojKtI2fq0s00yd+D+ohJ5lhitl
	yW3xRkZxpaxhvBJvfdqtWVV0OIBKLd3BSNAt4rNGksPYmYzpLlDmw3NkiIC+ZEmN46vrRZwP9Te
	ZEZ8PNXaaPY0+W3wd/DO7eJdkFSH4L4MqWGQPvMsBG92b2llwKwlgg401QefZhZwDG2zIqjb8d1
	SSEVkhiphj+NCmrmrSls4SX0vjEvly9QgGPyUs7Uy6Wtn2rz5P8lve0O7nbhsqP0iVbZOKoceYL
	IbxFVYnAuKUK+VrJTUvDeashH
X-Received: by 2002:a05:6214:4382:b0:907:8b2c:ef0 with SMTP id 6a1803df08f44-907d77b19ebmr44100886d6.4.1784906560520;
        Fri, 24 Jul 2026 08:22:40 -0700 (PDT)
X-Received: by 2002:a05:6214:4382:b0:907:8b2c:ef0 with SMTP id 6a1803df08f44-907d77b19ebmr44100346d6.4.1784906559892;
        Fri, 24 Jul 2026 08:22:39 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32ac0fa4sm363635166b.20.2026.07.24.08.22.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 08:22:38 -0700 (PDT)
Message-ID: <f258f8c8-764d-4789-b3d2-6b3bb5b8df75@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 17:22:36 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: monaco: Fix CSI I2C controllers default bus
 frequency
To: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260723114844.63093-1-johannes.goede@oss.qualcomm.com>
 <111bfc31-7f02-4875-ab58-e92bf1ccc44d@oss.qualcomm.com>
 <b690426c-94fa-43b8-a805-7413e45f2849@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b690426c-94fa-43b8-a805-7413e45f2849@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEzOCBTYWx0ZWRfX0WljRtPSCOwb
 Ks6e9/cgXsKRyi19JcKnfOQAuH7ZxpfBtp+shhk14n+b2nzsmHLG8Bp/7uk3Ef7aIev/ijOQS3c
 z/N6yj9kvHsEP5n4BD13zsHUjJfLGb0=
X-Authority-Analysis: v=2.4 cv=Rtz16imK c=1 sm=1 tr=0 ts=6a638341 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=nlT7P3IE1B_2hipTTHoA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: XUDbNVMAJlzUgo63htilhBiA_-UC7SQl
X-Proofpoint-ORIG-GUID: XUDbNVMAJlzUgo63htilhBiA_-UC7SQl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEzOCBTYWx0ZWRfXzjPI1tZiyO5/
 gsJQC/hG819IPPk3aGqIB8hJ1KT1Vr+3l99qlop0Xtc0mohO2Da4EWHWuUZe2kp0+kL5jEQofqU
 TWy/408ouu3cGd265m9CrTm0lOPGfJlbX2Ee/mFmo+ByZSycJc+hjMSNBMss8sqilksds/0lJCa
 nhvrGVyCWG7Vyc7VY2eSxzyhGbg0uB519d66Vblpun8anEY0CrBH3y/i6zMrHBABjEYnd+mE+d5
 Vlqywv8Yp46TbR3lxI0G4OJVAnstOz19kizpy9Xwato2KZCUM+buoGFpr45tJxGNRusgtd+XPkt
 VYMettX26azmdVIreIvaVHPdSDoRfILQ5WynqtuTEE3Q+AqMIQSlgxOAmNUPE5sH67GzlibGHvc
 LafTF8QHBvzLXZlI86tN7ofDIWG4mmEPdlwyEXvkgrrAprBPr0IG7mQUAWXKFX+4+f72pjBjO5Q
 F3p3BovIMpYL5bd2Z6w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240138

On 7/24/26 4:22 PM, Hans de Goede wrote:
> Hi,
> 
> On 24-Jul-26 1:42 PM, Konrad Dybcio wrote:
>> On 7/23/26 1:48 PM, Hans de Goede wrote:
>>> 1 MHz is quite fast for an I2C bus and not necessarly reliable, change this
>>> to 400 KHz which is a more reasonable default.
>>>
>>> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
>>
>>
>> I guess this is a question of what's more common among client
>> devices. I assume you have some that aren't happy with 1 MHz?
> 
> Looking at ACPI tables for many x86 devices 400 KHz is the standard,
> with some devices going down to 100 KHz. 1 MHz is pretty much
> unheard off.
> 
> Note the official I2C spec is limited to 100 KHz anything faster then
> that is an extension.
> 
> My specific reason for submitting this patch is imx219 sensors on
> Mona sometimes failing to initialize at 1MHz which is kinda to
> be expected when going for 10x the I2C specification max value.

FWIW I don't mind this patch but wanted to know more background

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
