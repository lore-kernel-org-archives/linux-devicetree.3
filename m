Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3063F9F58
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 16:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779122750; cv=none; b=fg7aZZx3w0YqKqaf0yDZdLQiik92aZ/Ss1ZqRZeauHFf6Q1Z2ukiL7DFGJpqMy/h4UTUj5COOqsvw7TMjhzxtV+ihBO0ZO7yFxhgDut6eULioaDwp7eyWc4lbo0+EmrblNEglbX0UiuIxkVeb0LiP7E85FN+X+UgkgLDdNd5lo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779122750; c=relaxed/simple;
	bh=WPhVCpKbpwoDRiM7nIZ0if1ojNpzI4x4yH3wQxhgYIE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X9iPSZNgkjF3+KyFkdqVL7wkcJPOmIzaH+GZ0O0jh1EBhAOtX/dXzioTQ/EnFLToCMAaMFBRzTFMFjRwcupx7oBxfEEpSi+Uu9oFENB6n/rxxSOMSgn8nFIzJDKINSLlw+PhUPAdrs8dW/F3lXdMk1ZoJ6UA8bzt8acMkdJj09c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hvo8jY5P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IgKI+xWk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hvo8jY5P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IgKI+xWk"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IDUaA52891887
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 16:45:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uNBmZ+NCJjtEl6g0SpLmCb8kHltIWGvrKgOLmeM9zoA=; b=hvo8jY5Plsw1Yz+E
	RdCH4GM79aGzqN5NMLXp7dg+eLE3RZzMYXH2CGLKHOXm5chzlcQ1b7Rh+Hf5PKY0
	eRvv2GFc1qzvGnSknE+EfZEHchUnmJncTNyXUGfyeW2T8SusyZiu/VRG1RGNA1xP
	LqbVnQShBJAa0l+idHuhs8drTwqK+exCgHdjLTqAYSkblMw6fZCtAmW8OzEwF1NY
	4xn/SIRPGbDKe3riO6C1eY4TQlWUyO2WmcVT3Zstl8NRJQGiqNWnrev4qMWP7kUc
	+hpVRRq574KMqqmxeFlYTU2ogX5uE6OheVIAM1010uUY0iBXXM+vx1XeY2oWRl59
	rr7EGg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e7xk1a6p8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 16:45:48 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82f756ebd0dso1550625b3a.1
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 09:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779122748; x=1779727548; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uNBmZ+NCJjtEl6g0SpLmCb8kHltIWGvrKgOLmeM9zoA=;
        b=IgKI+xWk1Y0lMI0KcLHOo1hbWDoCV45NSw5pZZOvYS+3eGj901OfOQAyz0vBZWSo08
         dm8Ep/bt/4njy8ld8S6mHmtHBXO1gm/kRujgjqdyJMayoh1nziRLLzXHVnXDMVinTtIe
         HeuaKKaz2Nyy27QWpT6nDmuVLI+TYdwJI1FlrQIEt1HQ6gdZr3w058zx49MOmMKlibBp
         14wo0dG8uzqmEhP7FS45vzMAGdi2nWq3URDi5fKbISPXf+SAzbs2BDsQUESnnv6E3T03
         RzUj4lcSzCqG7k0Qj7p0mLRkNdwYe0EmKoq3PwabjK5n3eVlx/IFbY9vjMpZ15/v0QXs
         iREA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779122748; x=1779727548;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uNBmZ+NCJjtEl6g0SpLmCb8kHltIWGvrKgOLmeM9zoA=;
        b=EsFMqA8L3YOmCGqp80EQ3JgSAUrppdVV6G/nPHhw11gRktO+b523srAo0+UuaScltx
         N5e/XRixASLxRwrflIzLMwVOTbEJxuLBnnes055rydKXrFv9ULG1S9ZIMOIE9TgTdH1a
         6npmwTPL3nySGAGGWvvozUSUMClunLeo/Dp9/iJlxjCehz0KsQYHdHpcMmIJkLtI+ggt
         DytHTjkHYPhJ3QuJhjDm0cqL/Q8m2nzBvuvJGEhMygoAzN3vFCevMLxOwSDsQRQROfpP
         VLeaPO5Ns1uCR2wnxU58cqiEQ1Zvug9fZEU1H6HhzXz/4WA0scSXfRjJ6ZCv+ZT5EJkD
         eiKg==
X-Forwarded-Encrypted: i=1; AFNElJ9aXyO7wVPRTF1v3oo2F59QqTQad6bGiB2EsIjCYNQfNWpDadaObmyHH1n3LBbM6rxJX9jaCQQcixwA@vger.kernel.org
X-Gm-Message-State: AOJu0YyUCUeoQZXYQbGyLk6ZMNrAlHgiexkdUpCZRrRaaTv3/sgC3y6j
	Vlsrr/2YWDWCfU7zUgdsv5FHLTDP/BRrlMRdOZM+ylQmd1IsK9vGlgcKjFA4vwsi9uekb4c7514
	AzRUx2FcIxDBPCmFAY1aSDIH/pEbYMmwpIAlAL3MA4wiB4TLS4ik/bRnWQzVrJHB6
X-Gm-Gg: Acq92OFjGif18YWXmG8zA5oj3CXleSAjUvb7F3m9l0rhJCOf4I7UcVGsdQlf6Kep6j3
	vZpY/CjMmLuVhQzL7eqImwZ3GuJ8fLD2XcLDeNEFhfLtxMnPYAbZxTAbXB22lyyvs9t7ZHs7M0T
	qK+jYrr//zKdNSzBrDVq3qIPHiFSUkHqq8amuVf1z8uUWJKnBbld/GbShJRmfNx1DeDCQmt5uea
	hVNmhHevv29keyrh7zpL2WBon+ht0KqSYVbu0A/tMKK/XtmkNNAu4d22JMoGtutLRIsxFxdeP0T
	eEEoReMLzesGNHSI1bDzyhIvK00vK7TnGjOBWzdMnAfGRtW24xyKfY0D9F68YtRmW3bSJS+oW1u
	fp4ABxdfkCoHpKeuzxLgzw+wWhAVZXJp1k6HdFqch67Y/8B2FAiUv1Npw
X-Received: by 2002:a05:6a00:2793:b0:83e:26b:528c with SMTP id d2e1a72fcca58-83f33d26f67mr15402149b3a.28.1779122747610;
        Mon, 18 May 2026 09:45:47 -0700 (PDT)
X-Received: by 2002:a05:6a00:2793:b0:83e:26b:528c with SMTP id d2e1a72fcca58-83f33d26f67mr15402086b3a.28.1779122746999;
        Mon, 18 May 2026 09:45:46 -0700 (PDT)
Received: from [192.168.29.31] ([49.43.226.67])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f197995absm14411850b3a.27.2026.05.18.09.45.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 09:45:46 -0700 (PDT)
Message-ID: <bb032ac7-d818-48ff-9b9e-6f4534a5292d@oss.qualcomm.com>
Date: Mon, 18 May 2026 22:15:35 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 07/13] power: reset: Add psci-reboot-mode driver
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
References: <20260514-arm-psci-system_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com>
 <20260514-arm-psci-system_reset2-vendor-reboots-v22-7-28a5bde07483@oss.qualcomm.com>
 <CAMRc=MdNVBKH_4Ps_QSG_YzW3=BgsMo0bDk6vuJuH7VheY9PmQ@mail.gmail.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <CAMRc=MdNVBKH_4Ps_QSG_YzW3=BgsMo0bDk6vuJuH7VheY9PmQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: xfYGlxTxus2zZ9xqVclzNHsHmrY0Heje
X-Proofpoint-ORIG-GUID: xfYGlxTxus2zZ9xqVclzNHsHmrY0Heje
X-Authority-Analysis: v=2.4 cv=BICDalQG c=1 sm=1 tr=0 ts=6a0b423c cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=y87zbT2qfcRNAzJ9VcpEUA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=_FDhcvgZYVVR_81zoiMA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDE2NCBTYWx0ZWRfX66/GjC0FT0Jd
 ExCKgerqZv/xfgOCNCVQ6VZgyWvuiYyxOWY6J26Bd7r7KXYD6tIXrgB8h379UqizOfMjK7PXgS/
 honLtrTY6+BEqKkGdAc6UZMkJtucUuWBUbGObDfplyBw+sctOVGY/LaYWInhUYBAMugq3xNUOvs
 hYhBOqPdBmaFVFKr2s9Ryrl0IiYtftqlYWgafkvLnfj99pObvO4xKb+amSDrFqio492d8MNyx5E
 oc5MGF7Zi/sMpcysi26YK5NBoNQAymbROChYmdmAJMoYCuZBoGd0VRncbcmhhaz2siEH5/FmwsB
 uRvNIH/KvH+1CsGfdnMkMGrw4HoHmfY8YiQw+O2kMU6i2e703pIEFUbttL6Pm79fMWkkbwTFTeT
 KIz2MxyWxpkcGurNdgJMY7xGD5QlNx7BT02KeMMHzpYJbw7Avm7u3A+RdYgwCbQl9OTTqqE4Tp6
 +waZKISLsvDNhB615Lg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180164



On 18-05-2026 14:28, Bartosz Golaszewski wrote:
> On Thu, 14 May 2026 16:25:48 +0200, Shivendra Pratap
> <shivendra.pratap@oss.qualcomm.com> said:
>> PSCI supports different types of resets like SYSTEM_RESET, SYSTEM_RESET2
>> ARCH WARM reset and SYSTEM_RESET2 vendor-specific resets. Currently
>> there is no common driver that handles all supported psci resets at one
>> place. Additionally, there is no common mechanism to issue the supported
>> psci resets from userspace.
>>
>> Add a psci-reboot-mode driver, and define two types of PSCI resets,
>> predefined-resets and vendor-specific resets. Predefined-resets are
>> defined by psci driver and vendor-specific resets are defined by SoC
>> vendors, under the psci:reboot-mode node of SoC device tree.
>>
>> Register the driver with the reboot-mode framework to interface these
>> resets to userspace. When userspace initiates a supported command, pass
>> the reset arguments to the PSCI driver to enable command-based reset.
>>
>> This change allows userspace to issue supported PSCI reset commands
>> using the standard reboot system calls while enabling SoC vendors to
>> define their specific resets for PSCI.
>>
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>> ---
>>   MAINTAINERS                            |  1 +
>>   drivers/power/reset/Kconfig            | 10 +++++
>>   drivers/power/reset/Makefile           |  1 +
>>   drivers/power/reset/psci-reboot-mode.c | 72 ++++++++++++++++++++++++++++++++++
>>   4 files changed, 84 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 36ba42209c0b332813a296880cd55798a5592d2a..4b0815c31679550f5ab719de4a5852990c7cc643 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -21342,6 +21342,7 @@ S:	Maintained
>>   F:	Documentation/devicetree/bindings/arm/psci.yaml
>>   F:	drivers/firmware/psci/
>>   F:	drivers/mfd/psci-mfd.c
>> +F:	drivers/power/reset/psci-reboot-mode.c
>>   F:	include/linux/psci.h
>>   F:	include/uapi/linux/psci.h
>>
>> diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
>> index 124afb99febe92450b6ae322aeed3b63fa2070df..d9d1f768b8691abc3b32f2675519f2ddbaf19b84 100644
>> --- a/drivers/power/reset/Kconfig
>> +++ b/drivers/power/reset/Kconfig
>> @@ -348,6 +348,16 @@ config NVMEM_REBOOT_MODE
>>   	  then the bootloader can read it and take different
>>   	  action according to the mode.
>>
>> +config PSCI_REBOOT_MODE
>> +	bool "PSCI reboot mode driver"
>> +	depends on OF && ARM_PSCI_FW
> 
> Can you add COMPILE_TEST coverage here too please?

Ack. thanks.

> 
>> +	select REBOOT_MODE
>> +	help
>> +	  Say y here will enable PSCI reboot mode driver. This gets
>> +	  the PSCI reboot mode arguments and passes them to psci
>> +	  driver. psci driver uses these arguments for issuing
>> +	  device reset into different boot states.
>> +
>>   config POWER_MLXBF
>>   	tristate "Mellanox BlueField power handling driver"
>>   	depends on (GPIO_MLXBF2 || GPIO_MLXBF3) && ACPI
[SNIP..]

>> +static struct platform_driver psci_reboot_mode_driver = {
>> +	.probe  = psci_reboot_mode_probe,
>> +	.driver = {
>> +		.name	= "psci-reboot-mode",
>> +	},
>> +};
>> +
> 
> You can drop the newline here.

Ack.

thanks,
Shivendra
