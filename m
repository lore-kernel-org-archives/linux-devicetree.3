Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201FC386C14
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 09:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774258764; cv=none; b=Ken9uxD9PN184l7C3WcCWfLG0xVfGj32S98jUl+tFX1J6fYJ922A7JJtLMT90kTc0NvAv0ovMMqSwNm/i1NOlp5f/RDaDeuMdPcxssRQ7tKxEhiPwZ1DGt5BdqC+eatG41+Qu1U5jK7qNlvmaucyj5XKp8ZFQi6rNR4DY5Nb9p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774258764; c=relaxed/simple;
	bh=pQxvm7ndzvWsuOsFpJlNW1nlGs8MwK3wXuI2d4hFdJE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mZO2f7a+4eCbIWyBYVddXclfZ97pA45DoJfN9LoEp8O/RrPIIBoR7/w7lYZl0a6W2HHB4RATh+X/BlZTGssI5J/xjA5GM8VMVRcFvOR6EWeyv4zkvAr83OU6Io7EEeK04JVLFIlfoie0h+YGwKbcVc6f9lT7pWSgC1EbRucAZpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iHgd3u9F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bvcjkVpr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iHgd3u9F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bvcjkVpr"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N83hnm1364051
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 09:39:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JxAkSVz8M2FTfuo0qCgFYUBjaV8Dv/qmWNiMLDJQDBw=; b=iHgd3u9FbK4xwvrj
	a1aTOhWyTYw2JvhIe7GCJXL/rabxmZ89orNQcqAdPOeCrxrqeidBEk3lYqmLSiIZ
	7Fn8/1LUXd0NO1TN+S0unUJfUSQ3mJDuj7TO2R8Pew+JJp2hxrnjlC3vdz997jw4
	57qKCY+Y+81Qq6zAPVMcDoGodHjX7/sMfa97FVfxz0Up5FBriVs0Lu+CjZ0gAko0
	Gelba6oDnE1faolgIfzeO2CQhzfCVLflXCvDGZ4WWeOX40dcwPXO1TfkgwHVgh2j
	/nInvJQ6x4z7CYbfWBCDVv3ukrzxt33LvN4PnuXfR/kRmRJaxYyK05j3YQBibprA
	gjqTHQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31p78bmm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 09:39:22 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89c68ac09f5so37053976d6.3
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 02:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774258761; x=1774863561; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JxAkSVz8M2FTfuo0qCgFYUBjaV8Dv/qmWNiMLDJQDBw=;
        b=bvcjkVprNaeD4+op/lmVZLAJJrKeWbXUj8VPTaY9wlGnShpSYNXflFYqdCa/RNj0NU
         H1E9OaLhbyOfYHTZagN+1F8EBon9iayIUEREv6utgOKqrKbt4FR9kQ/vozv7AnXRB6b6
         Uq4+2A2CDkFhmyPMhszpyi28L6YjqipOvEX85TkZpnCkpFOmRWmUpPlY04+QG0/kmSBf
         lzUILK+1vxDxw67433kIKf7hyd78ZTTT4Sp1cWWx0P22CArugIZjku2oCtg3OjqYaeFm
         3TKzzUCPKxwuSdrMtenjlOwL31acVzg4DoGZgkm+svTIseu42fK2Lq8XTeFpAeGdBAwg
         SA2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774258761; x=1774863561;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JxAkSVz8M2FTfuo0qCgFYUBjaV8Dv/qmWNiMLDJQDBw=;
        b=FRuix3ijUzdg//JV/iE6O/mchktFMmzOZaIkvN+GrfMYYWjq7Z8ArtU2SWeXXnTaES
         rbjEPI+IncKETGRKjqrrgz9Ov/1xTG30a/TAlsOVbOKKsMKz9qiekmCwnekCbg6gtVNC
         LTS6zPeV8By7NErkh42A+RDKKnD4D2LZ0dzohPI9JWcLktxD0Tm0w4kJMz8P0Fxbi3Xa
         sc5mvvM0Q33fhbdca2FTYTMEyX7tg5zKszGpWfc1ILvb9JaI7ty/gAhGex/y6rXGs4yq
         CrEpUa2wvuV19zQZJAzOihC2hcfaA1Gqy4ejhh4UO5ItSHPsB1GuobPH7VAKj72C2S82
         S0Ig==
X-Forwarded-Encrypted: i=1; AJvYcCUuXcNRkdVvXrQBsqgcYuQ6/9dKOkDjQEjPLoeu9YTbidx5amApjYa/QusKeWA33wP5JLgF+fz1f4HA@vger.kernel.org
X-Gm-Message-State: AOJu0YzwZE4uEX4OQlVy9XCuK2uxuOiuasAr0RcKq/5MdGPFzlBn4aK8
	l6tlVeMzqP8Btpbx/V3y3ZpQlHedjUmDwasWTCCQwNyruhUNGz1qeInVYd4Berslqtz3B8dZtwt
	Ae3gyc9S9/TaA999tkgZRBXIt3yQK2zaT/Re+C97MknQ2qrJJcLlzmd02G9P8gbPf
X-Gm-Gg: ATEYQzxkCnlok02M6tXALV3LOZ/9cP9PRv3l/UyWDZQtMC/XpAeOUEH1+x07X8dK6f/
	PSV6LKluzD7PgbY0kyYzsNqxElRuF5QbC4QQamQWNxb63CQOk9iPZdowVI5kkJM7wBzKa3DbyWA
	IfaapzX1BowP+E0pT5UVMoW13ho1F40duoyYKvqZLbLN/7vnfy0QlGEhkVgRMiEu40By06GJzhQ
	FkL93tgD7AzImSQyhhq1KQ9tLBRJ9wCR6sFo8WUKOSBhfeVACdls/UUgaydgUOhPFQz2CjUYTom
	7Y6Ta5hLeYOwVw21+1fZEEaTJ9h9a0O5EOEurpO1Ax1RT3b6G8cnJo5VtT7DYYKjn1mZQYM6Ezx
	bhveuiTYlqbAR438gE5MhW2RuEJxZuIX+nmduZADVSOI5xAcLvQLpHF8rhks3qSF480ci9/TYge
	VoYJY=
X-Received: by 2002:a05:6214:2588:b0:89a:50b4:bc94 with SMTP id 6a1803df08f44-89c858ec443mr152756686d6.0.1774258761390;
        Mon, 23 Mar 2026 02:39:21 -0700 (PDT)
X-Received: by 2002:a05:6214:2588:b0:89a:50b4:bc94 with SMTP id 6a1803df08f44-89c858ec443mr152756386d6.0.1774258760871;
        Mon, 23 Mar 2026 02:39:20 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b983365d86asm476556666b.48.2026.03.23.02.39.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 02:39:20 -0700 (PDT)
Message-ID: <fd8c59b8-c35e-4add-a028-5f029a09fe4c@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 10:39:18 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] arm64: dts: qcom: Add AYN QCS8550 Common
To: Aaron Kling <webgeek1234@gmail.com>, Val Packett <val@packett.cool>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Teguh Sobirin <teguh@sobir.in>
References: <20260311-ayn-qcs8550-v2-0-e66986e0f0cb@gmail.com>
 <20260311-ayn-qcs8550-v2-2-e66986e0f0cb@gmail.com>
 <4757fd22-fe9f-4228-a0a5-11d9309549ac@packett.cool>
 <CALHNRZ97zmk0BmctznXrrnyyk50XH506GrdWSU-mEeN3NVEBFQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CALHNRZ97zmk0BmctznXrrnyyk50XH506GrdWSU-mEeN3NVEBFQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RMC+3oi+ c=1 sm=1 tr=0 ts=69c10a4a cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=PRwFffclZ0ixmdfpURsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: E5HumOKI2t83-G07UDAmFHFAl2blFd9C
X-Proofpoint-GUID: E5HumOKI2t83-G07UDAmFHFAl2blFd9C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA3NCBTYWx0ZWRfX2cJRyWRdFYU1
 Rq99MVIPm9lRw+NIwD6t5TYBs5RwbVPcVyvEH2CEM00SX4vAKFC1C08AU/p2kAM45z7xDtIKtSG
 fCWtouBoZfWcf6kjm6N2Y6lmAMIAld26IBHPA1GabI5rZZWpqHZE4OiZCgUoH0TUHNPnZtgr8qd
 sMejlMAkgyDmqrWFcA3iE/MRGiJKHlxwhQp5AYF2JjGFu+zgmTqNaT6808omuNiW2a6+DU0btG4
 OoASIZysMUwaCvmV7ni660FzCwHLVbiw+xabmKthCtxm2j1bb8BhRkvsxOl3FbrQg2yBXUYveEW
 BWTtmWOJ9YcJjBrcGJDGvJ1X3K6sCZuROlHtiGWDeW7YUCOwqBGwfMbGs84NiPLa+8cllTcCZVx
 DA4cuDdIndwEcLa9ZtRdKgXlsA1d2CgoLfI4NuVy2yXe2M4WYYkWecykBGcpCDWSrd2zEmaD+ey
 zI3FxJMPdjhWWyLXrKw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230074

On 3/19/26 11:31 PM, Aaron Kling wrote:
> On Wed, Mar 11, 2026 at 7:49 PM Val Packett <val@packett.cool> wrote:
>>
>> On 3/11/26 2:44 PM, Aaron Kling wrote:
>>
>>> From: Teguh Sobirin <teguh@sobir.in>
>>>
>>> This adds a base dtb of everything common between the AYN QCS8550
>>> devices. It is intended to be extended by device specific overlays.
>>>
>>> Signed-off-by: Teguh Sobirin <teguh@sobir.in>
>>> Co-developed-by: Aaron Kling <webgeek1234@gmail.com>
>>> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/Makefile                  |    1 +
>>>   arch/arm64/boot/dts/qcom/qcs8550-ayntec-common.dts | 1777 ++++++++++++++++++++
>>>   2 files changed, 1778 insertions(+)
>>> […]
>>> +/ {
>>> +     model = "AYN QCS8550 Common";
>>> +     compatible = "ayntec,qcs8550-common", "qcom,qcs8550", "qcom,sm8550";
>>
>> Huh?.. All existing -common files are .dtsi includes without their own
>> model/compatible, and the compile-time "dtbo" support is only used for
>> EL2 where we want to apply the same thing to many many devices without
>> polluting the tree with extra glue files. I don't see why this should be
>> a "common device" with its own compatible string, and not just a dtsi.
>>
>>> […]
>>> +&gpu {
>>> +     status = "okay";
>>> +
>>> +     zap-shader {
>>> +             firmware-name = "qcom/sm8550/a740_zap.mbn";
>>> +     };
>>> +};
>>
>> Please use the &gpu_zap_shader label.
>>
>> And does the generic zap actually just work?
>>
>>> […]
>>> +&i2c0 {
>>> +     clock-frequency = <400000>;
>>> +     status = "okay";
>>> +};
>>> +
>>> +&i2c4 {
>>> +     clock-frequency = <400000>;
>>> +     status = "okay";
>>> +};
>>> +
>>> +&i2c12 {
>>> +     clock-frequency = <400000>;
>>> +     status = "okay";
>>> +};
>> If the individual devices actually use these busses, better to enable
>> them inside of their .dts as well I think?
>>> +&iris {
>>> +     status = "okay";
>>> +};
>> Works with generic firmware?
>>> […]
>>> +&pcie0 {
>>> +     wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
>>> +     perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
>> Current binding is to put these inside of the &pcieportN (renaming
>> 'perst' to 'reset' which I just noticed I failed to do for one of my own
>> files :D), see x1e78100-lenovo-thinkpad-t14s.dtsi for an example.
> 
> I tried making this change, but the pcie port failed to probe. I also
> notice that all existing sm8550 devices still use the 'old' syntax.

There's a ""feature"" in the parsing code that will only let this work if
both 'phys' and 'xxx-gpios' are under the same node (i.e. both under PCIe
OR both under the root port), I think this may be changed by a single big
change later on

Konrad
