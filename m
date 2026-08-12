Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8259D403129
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 10:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786531804; cv=none; b=Cl7KU6qfc4sMw42BYsXIhB9x9FrssFR33vurvPt4W1rQ5CPNGSdX594ilypH3+bi0pEjm3uhKQi+g2miMcom5MJ41zkWzlzpHGCSP+DVJZUkn+IaZ1lahH5G0Ys+b9h5bHoo221hgnxfmAWhCkHF2I+LFW4XcFwuhZeTim33ALM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786531804; c=relaxed/simple;
	bh=29uv9rNNOe8cJpC4RVfKo9oF63UjVRrTJfBnFmSK9d0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FmkrUn8TFmz54OhI1hBrC7X3QxpiIDfA13M5Kl7m988ztpf5zmAWHNOqLFr3RRoDVO59WYu+RP9uGmfEuz+5fPMy/TklyvmqimDXXbp2GxQ0AhqG1nqpFKyOmperEWlZa2tu6f7mPCkrJGcwFyOxyBfEwEF4I0Txa1O8KMlPyEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QqC/Esph; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d6c9Boz8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QqC/Esph";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d6c9Boz8"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C9gOkF2212330
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 10:50:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UbG04XwAubXPmna3vE6vThuJ/BN7DybPLAShgSUkaz0=; b=QqC/EsphNBDPZwQi
	hmdOM4XHdWRL1y0oej7g++dzUdx/2Ymb3Q7wQiy8FrftGJsa8ZBrLB5acbltG3A0
	IRNx4mvCekL3YU8frd76WjRnF+z5LXsFcwCBfsawEkNTZaJrq7BaFww8NtydBTTF
	v/R/EzFt03ofNMzDiIljgufl2GEM+Oc6L79H5J9pCQ5eUv6gmVB95KGqxx1l2PUy
	Z4cJvuKVYa8LJyDKNmET9iNKkseb/w5IRkVfqM7z/Dgz7q1gcco0zLRPMn5h3vQ8
	dsotr9efOn/3Kgy/7U+mx5gMpwoAbDoKSZx31h2cqgyodwMBRXf4g9wTB6UHYRk5
	zn/nfA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0hfw1er1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 10:50:01 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38f5ac7416eso1021115a91.3
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 03:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786531797; x=1787136597; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UbG04XwAubXPmna3vE6vThuJ/BN7DybPLAShgSUkaz0=;
        b=d6c9Boz8c80UM32bSniEcMksrAhA1aKuvAa4Esx/uQjpP/PLWHBNYnzjxq+77bZZgv
         vRrCNQEJ8hBPJVN25++2jGjYmFz4g8PFk+pQlVx83E0iQHxQ1AjtR4SSzf37bhD4bHMs
         qWpuIJTTL37vinkOaJczc/NyDdBwvrHImjPex7SInkN2cSlRRr8aOUHe0jNNdT7el893
         qBR64VPTPrbS7GD3zCvMsymwS1/nHHgJBrpz5jKfVyowEOCO6XifIYMK/+FO7vobM+lu
         MG/+tmy9q9Hh39jX88zhxCsun9iNcxCz9Clez/0cVVsag0eifWXnskir5/Dp++8NJvQe
         jzBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786531797; x=1787136597;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UbG04XwAubXPmna3vE6vThuJ/BN7DybPLAShgSUkaz0=;
        b=i5ZvMaa/aHZvSKrdL1gT7y8KjN1xCn/pSlIuus43lvs9aF7Ruj7DrlQo/74f1wvsJ9
         zwC77z/I6kGwhw3PhYum9MXjDqxge9TaS8sa04FLO5ZSHnBd45/6Z9c7eNHJJdwibhuN
         YaA0R1BKc9d37nWANRYAy1EKqx9/dUMCHsQdSgrP0dEA1SfJulrDTRNBdcqnuHXhj0Zg
         Whq/QyGyQpCI/oh/Wjufpbu6nLgFu9qr4FsKexFcJaVBmiev0noItvazEG0xJqGdCRNb
         UqYl7yF/KDREzZNVPddiNAaUNsyJ4PRCC62p9kxngP/0JFFADCOg+wocgM/ggytIj509
         AL6w==
X-Forwarded-Encrypted: i=1; AHgh+RrPRnrEG3QAlhEn2AnQ/NL4KTy5PJ712f7gL1GTFemRfh54Jw+rSsq5vyeGL98Iw6EelzKPfp4LwYzR@vger.kernel.org
X-Gm-Message-State: AOJu0YwSojkxM9qcFfEWHCzuyMsdCz25qv4gwuYVtqTeBuRTVlHkGrau
	yCpcYK3KXr2BMHDIVY1s4FVjtZh5/1o6a2JxVvSxOtCvr6zo4RVxiyRAxJGImqsQ/xG7DL02/uh
	zfmHKuPt4trBJ7bSoiYnuZixsdZaQEzlvN27JXhyGeg07BmqcdPKeNh6PzQ75qs1P
X-Gm-Gg: AR+sD11kUmdJ8bnn28vCj6msIfgeRFAm2LFGsrowRUkOcJHNUGvi/XHCcjK7BocIenZ
	U4ruJIQxVPktnrl6AoSDReKyZQv/7ODvf1d/cA0we8bdrlIqW+DZsgvCGluDtWw9ci0pUs5xNbd
	0TC4uCO142olrJ62CyBZChQhEYGm5rysoqqd9PNtMO4xvK7YPAhVuLqXIRg8fv7O7dYuKvoUCnM
	OLTXLZgPh1fjPxWAmpY4vBl6+gs6j0t1SAr+567ffPw8n161+CrQEbCKbfkk3jqQcGfbBYkV5MY
	dYcuN4TpGW8jJq+QBYLvj9h6GPPQUMnMj43+ZxKodIDihgOkenXF0dAM5s9JwvtXXF9ej/GzaKG
	ExcbWfbaZ3bfqFB4y4slJkqT1isVTTcUP
X-Received: by 2002:a17:90b:164b:b0:37f:b0a9:1a68 with SMTP id 98e67ed59e1d1-3930128c13cmr3916864a91.7.1786531796746;
        Wed, 12 Aug 2026 03:49:56 -0700 (PDT)
X-Received: by 2002:a17:90b:164b:b0:37f:b0a9:1a68 with SMTP id 98e67ed59e1d1-3930128c13cmr3916838a91.7.1786531796248;
        Wed, 12 Aug 2026 03:49:56 -0700 (PDT)
Received: from [10.217.217.28] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392f8e3f565sm3191597a91.13.2026.08.12.03.49.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 03:49:55 -0700 (PDT)
Message-ID: <6978a578-05ed-49ad-a9dd-814d518cea8a@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 16:19:48 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] Introduce EC driver for Snapdragon X1E based Dell
 XPS 13 9345
To: Aleksandrs Vinarskis <alex@vinarskis.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Tobias Heider <tobias.heider@canonical.com>,
        Val Packett <val@packett.cool>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        linux-hardening@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
References: <20260809-dell-xps-9345-ec-v4-0-88306dbbc7aa@vinarskis.com>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <20260809-dell-xps-9345-ec-v4-0-88306dbbc7aa@vinarskis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA4NyBTYWx0ZWRfX5DH9QHjLfiuJ
 IWjpeY8JRpmyviFZ+geAqaUMFWdJNtWGxFqLMFv2dpg709xAhcZM5p6m1eOmCbHFs+BGMlPZ/5/
 qznTMqXTBERDGtVbUqZv9ASimaUgmAo=
X-Proofpoint-GUID: cabpbikMUlIB3x7A9JjbY28n8zBrTxBS
X-Authority-Analysis: v=2.4 cv=fpDsol4f c=1 sm=1 tr=0 ts=6a7c4fd9 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=I76Qk8w-AAAA:8 a=FXFtw1A4AdT0iKmZFxQA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=vUPM0Wvl0xcrLs4nqPIT:22
X-Proofpoint-ORIG-GUID: cabpbikMUlIB3x7A9JjbY28n8zBrTxBS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA4NyBTYWx0ZWRfX0ICjHztoTXjX
 gzuoJAMdQBFW10/gALQFvKwNoUJim2OIL8CzFGnkOcZ8lPjBf88Xsmt8P5XhpzyrdDE/beGjBLB
 o35hzzbQ6MriEzquqEGbEax6dF2tH0XivqYyI89mnLH6puIpzw7SJq96rTLsChF4mJK9Ip01SyC
 G4670fR3mH2jVCj3Da4vDOSGF3TBjyn7wEEYMQRQ1vi/avVHnvuPH2uxHMFIjJ6roQ79Lz89IPe
 BcLcaLqeTWHXqVW5OH6+FSBgbmqH0X7OJKcd3yn0mJnXb+54tyeULerOsg+B8SScQZoA00mbbHR
 yRqsSxm4MmAxxqHrR12FjX/3jC8tGoCQrhjDpYbYGWZ29EmXMGxvZXED0oqPJFos7wxN9iZQJXY
 U+j0oYKqvTyYEFxu8jHfjVuf9UCfa4j3QauNdko0IkBe8CcJt7OOtHipCxq283yDoo4aD19rR6G
 UFmUIo87CAHb7/gC0ow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608120087

On 8/9/2026 7:02 PM, Aleksandrs Vinarskis wrote:
> This series adds Embedded Controller (EC) driver for Dell XPS 13 9345.
> While EC appears to control most of device's peripherals, particular
> driver addresses power and thermal managment issues. Key operational
> principle involves initial thermistor constants configuration followed
> by a periodic reporting of these onboard thermistor values from across
> the motherboard to the EC. The latter then handles fan ramp-up/
> ramp-down internally. Suspend/Resume must be likewise propagated to EC
> for power management.
> 
> The driver was developed primarily by analyzing ACPI DSDT's _DSM and
> i2c dumps of communication between SoC and EC during various stages of
> operation (bootup, suspend, resume).
> 
> With EC driver in place, the following issues are addressed:
> 1. Fans were not properly cooling the laptop, would kick in late and
>    spin lazily, resulting in heavy throttling. With EC driver fans
>    start sooner and hit high RPM under heavy load.
> 2. Fans were not stopping once SoC temperature dropped, they would keep
>    slowly spinning irrespective of suspend and/or closed lid until the
>    next powercycle. With EC driver shortly after SoC temperature drops,
>    thermistors temperature drops, and fans ramp-down.
> 3. Keyboard and touch row backlight were not turning off during
>    suspend - only lid close would power off the touch row. With EC
>    driver behavior matches that of Windows, suspending device with lid
>    open powers off the peripherals.
> 
> As thermistor readout depends on pmic's ADCs, this series introduces
> EC driver and its schema, adds missing ADC to hamoa-pmics, and finally
> adds thermistor and EC nodes to x1e80100-dell-xps13-9345.dts.
> 
> Additional findings:
> - Max fan speed depends on Dell's power mode settings, configurable in
>   BIOS or using Windows app (relies on ACPI-WMI). It appears best
>   cooling performance is achieved under 'Ultra Performance' profile.
> - When the said power mode is changed using Windows app, EC IRQ is
>   triggered. Windows performs what appears to be thermistor contants
>   readout, though its not obvious what it is used for.
> - Given similarities between Dell XPS 13 series (codename 'tributo')
>   and Snapdragon-based Latitude, Inspiron ('thena'), including matching
>   EC address and response to suspend/resume command the EC driver can
>   be likely used for both, though in-depth testing on 'thena' is
>   required.
> 

Hi Alex,

> This series depends on QCOM SPMI PMIC5 Gen3 ADC [1], which was added to
> `linux-next` for v7.1, but must be picked if this series to be backported.
> 
> [1] https://lore.kernel.org/all/20260209105438.596339-1-jishnu.prakash@oss.qualcomm.com/
> 

Just a minor point - this link points to V11 of the patch series, but please note
V10 was the version of the series actually picked in the kernel. The difference between
V10 and V11 is minimal though.

Thanks,
Jishnu

> Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
> ---
> Changes in v4:
