Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F29D3998BF
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 07:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779348449; cv=none; b=E4wtihg1L3lEg4/7J4KF4NtIxpFE373N1t2MWYctMqKBBnd6yuu2c7z4OL07C6V2yQk4bOrUkaoBpWwagSDJw+wrsiOq9oIKg+A8tA6D3ByupZL4bnJGCL6KLwM/PSwJkfL1hJqTgSvgIEaqBIZFNBv+xZH41JYTjIUvbVB62CQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779348449; c=relaxed/simple;
	bh=ZEyxLI0lf564rDk4JjFFdxgPMl+0k4bCxBPAjmJ1U8k=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=uley91mVGi7kwYud0pAF3lONhkIFcWwZ+vHHLT/70DAQ6ZdY9Un9yPUdwht6fJM8ARhJCDMX65jAIwKGWMfmLkrOv7UGdaoQCvVqfd+oGySTEWzPqHbGMcT700lTC3wA0GfSg8ruPVpcPjWs74AlLp180CciWkbtmBn9GS9tOPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=xy55XxSG; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="xy55XxSG"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3367A4E42D0D;
	Thu, 21 May 2026 07:27:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DB95360495;
	Thu, 21 May 2026 07:27:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9FAB3107EA6BE;
	Thu, 21 May 2026 09:27:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779348440; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=LdCmqb+Q/RWbEKnG9EY6/RiX3h/16cPj3Fyl+P2nPJA=;
	b=xy55XxSGj8wfpzSly2SLiplATXUej0wVb1nJbVpSvYl+2JW0eU8oZPSWIdBYcsyx+GLjad
	T1FAb5HyZE/P1rDfgx9eCp3Uvgc1E3ZaGyspLIV/k/wubdH/GF63WyxRhk/iDu79q5VBw3
	oe1xqz8bZloI+DH4woo7KpLxIMgtTe9mpNTBXq5Cl1vuFYEXMDozYd7MBLltNJbE4wutXi
	VN6RJ4r2zkH+n4A7CWG+ujzrTbU+82BFz0N53MzcpVy2Y3J8USso4w0AJMKU/G09HMyhBk
	qIBxBfv68H2uSaE/nznx4f9uLX1EV7d8dycsUI+nCdzzPD8FR98nWAMc8vZLiQ==
Message-ID: <dbd4078b-180a-45fe-850c-86d86c66614a@bootlin.com>
Date: Thu, 21 May 2026 09:27:17 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Richard GENOUD <richard.genoud@bootlin.com>
Subject: Re: [PATCH v2 1/1] arm64: dts: ti: k3-j7: Reserve memory for LPM meta
 data
To: Nishanth Menon <nm@ti.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Udit Kumar <u-kumar1@ti.com>,
 Abhash Kumar <a-kumar2@ti.com>, Beleswar Padhi <b-padhi@ti.com>,
 Thomas Richard <thomas.richard@bootlin.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260427160326.370415-1-richard.genoud@bootlin.com>
 <20260427160326.370415-2-richard.genoud@bootlin.com>
 <20260505125945.mxucy4cfpno2x66z@slacking>
Content-Language: en-US, fr
Organization: Bootlin
In-Reply-To: <20260505125945.mxucy4cfpno2x66z@slacking>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Nishanth,

Le 05/05/2026 à 14:59, Nishanth Menon a écrit :
> On 18:03-20260427, Richard Genoud (TI) wrote:
>> From: Prasanth Babu Mantena <p-mantena@ti.com>
>>
>> For TI SOCs J7200, J784S4, J722S, J721s2 which support low power modes,
>> a chunk of memory is reserved for LPM meta data, which is needed for
>> saving ATF context and the certificate information of ATF and OPTEE and
>> DM image. This LPM metadata area is firewalled to be accessed only by
>> TIFS.
>>
>> U-Boot/TIFS will use this area to save and restore:
>> - ATF context
>> - ATF certificate information
>> - OPTEE certificate information
>> - DM image
> 
> DM image is loaded from storage, correct?
Actually, after being loaded from storage at boot time by U-Boot R5 SPL, 
the DM image is copied in this memory, so that it doesn't have to be 
loaded from storage at resume. (This speeds up the resume time)

For the context:
At resume, U-Boot R5 SPL is executed and detects that the board is 
resuming (with a flag set in the PMIC), then it:
- brings out of retention the DDR
- retrieves the LPM memory region from DTS
- authenticates certificates from LPM memory region and applies firewalls
- asks TIFS to restore TFA and its own minimal context
- starts TFA on remote proc
- loads back DM image from memory and jumps to DM

>>
>> https://software-dl.ti.com/tisci/esd/latest/2_tisci_msgs/pm/lpm.html#lpm-msg-lpm-save-addr
>>
>> U-Boot has to parse and retrieve this area from the device tree, thus
>> @lpm-memory node are used instead of the generic @memory.
>>
>> Signed-off-by: Prasanth Babu Mantena <p-mantena@ti.com>
>> Signed-off-by: Richard Genoud (TI) <richard.genoud@bootlin.com>
>> ---
>>   arch/arm64/boot/dts/ti/k3-j7200-som-p0.dtsi  | 6 ++++++
>>   arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi | 6 ++++++
>>   arch/arm64/boot/dts/ti/k3-j722s-evm.dts      | 6 ++++++
>>   arch/arm64/boot/dts/ti/k3-j742s2-evm.dts     | 9 +++++++++
>>   arch/arm64/boot/dts/ti/k3-j784s4-evm.dts     | 9 ++++++---
> 
> Split this up into platform wise. I dont understand why you'd not modify
> the ipc-firmware.dtsi and use the phandle similar to https://lore.kernel.org/all/20260318-topic-am62a-ioddr-dt-v6-19-v3-4-c41473cb23c3@baylibre.com/
The wkup_r5fss0_core0_memory_region can't be used in our case because 
the DM memory isn't retained during suspend.
For Sitara, the LPM metadata are stored in the DM DDR, but here, as the 
DM memory is not kept during suspend, the LPM meta-data is stored in 
another memory region, so I don't think I can use this phandle.

> 
> Split the patches per ipc-firmware.dtsi as required.
> 
>>   5 files changed, 33 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-j7200-som-p0.dtsi b/arch/arm64/boot/dts/ti/k3-j7200-som-p0.dtsi
>> index 5a8c2e707fde..756928a2d411 100644
>> --- a/arch/arm64/boot/dts/ti/k3-j7200-som-p0.dtsi
>> +++ b/arch/arm64/boot/dts/ti/k3-j7200-som-p0.dtsi
>> @@ -40,6 +40,12 @@ mcu_r5fss0_core0_memory_region: memory@a0100000 {
>>   			reg = <0x00 0xa0100000 0x00 0xf00000>;
>>   			no-map;
>>   		};
>> +
>> +		lpm_memory_region: lpm-memory@a4800000 {
> 
> vignesh already flagged this in previous revision - just use phandle
> reference in u-boot and make this memory@
I would happily use the phandle, but as this memory is not related to 
the DM DDR, I don't think I can.


Thanks!

Regards,
Richard

> 
>> +			reg = <0x00 0xa4800000 0x00 0x00300000>;
>> +			no-map;
>> +			bootph-all;
>> +		};
>>   	};
>>   
>>   	mux0: mux-controller-0 {
>> diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi
>> index 12a38dd1514b..ceab8f057640 100644
>> --- a/arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi
>> +++ b/arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi
>> @@ -42,6 +42,12 @@ mcu_r5fss0_core0_memory_region: memory@a0100000 {
>>   			reg = <0x00 0xa0100000 0x00 0xf00000>;
>>   			no-map;
>>   		};
>> +
>> +		lpm_memory_region: lpm-memory@a9c00000 {
>> +			reg = <0x00 0xa9c00000 0x00 0x00300000>;
>> +			no-map;
>> +			bootph-all;
>> +		};
>>   	};
>>   
>>   	mux0: mux-controller-0 {
>> diff --git a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
>> index e66330c71593..eebc5cc7d4cd 100644
>> --- a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
>> +++ b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
>> @@ -63,6 +63,12 @@ wkup_r5fss0_core0_memory_region: memory@a0100000 {
>>   			reg = <0x00 0xa0100000 0x00 0xf00000>;
>>   			no-map;
>>   		};
>> +
>> +		lpm_memory_region: lpm-memory@a6c00000 {
>> +			reg = <0x00 0xa6c00000 0x00 0x00300000>;
>> +			no-map;
>> +			bootph-all;
>> +		};
>>   	};
>>   
>>   	vmain_pd: regulator-0 {
>> diff --git a/arch/arm64/boot/dts/ti/k3-j742s2-evm.dts b/arch/arm64/boot/dts/ti/k3-j742s2-evm.dts
>> index fcb7f05d7faf..d0752c8a6b37 100644
>> --- a/arch/arm64/boot/dts/ti/k3-j742s2-evm.dts
>> +++ b/arch/arm64/boot/dts/ti/k3-j742s2-evm.dts
>> @@ -23,4 +23,13 @@ memory@80000000 {
>>   		device_type = "memory";
>>   		bootph-all;
>>   	};
>> +
>> +};
>> +
>> +&reserved_memory {
>> +	lpm_memory_region: lpm-memory@ab000000 {
>> +		reg = <0x00 0xab000000 0x00 0x00300000>;
>> +		no-map;
>> +		bootph-all;
>> +	};
>>   };
>> diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-evm.dts b/arch/arm64/boot/dts/ti/k3-j784s4-evm.dts
>> index 6c7458c76f53..114594f37f0b 100644
>> --- a/arch/arm64/boot/dts/ti/k3-j784s4-evm.dts
>> +++ b/arch/arm64/boot/dts/ti/k3-j784s4-evm.dts
>> @@ -23,10 +23,13 @@ memory@80000000 {
>>   		device_type = "memory";
>>   		bootph-all;
>>   	};
>> +};
>>   
>> -	reserved_memory: reserved-memory {
>> -		#address-cells = <2>;
>> -		#size-cells = <2>;
>> +&reserved_memory {
>> +	lpm_memory_region: lpm-memory@ac000000 {
>> +		reg = <0x00 0xac000000 0x00 0x00300000>;
>> +		no-map;
>> +		bootph-all;
>>   	};
>>   };
>>   
> 
