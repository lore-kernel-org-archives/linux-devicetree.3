Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1273BFAED
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 19:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790882359; cv=none; b=XgI977ezuyWrj5SrPbtyUW5wt79idBqD3KV4qNk7irUXxudOekSaKGI+iSgSEs+7vNjaVFDDXqhSjEVV0Q4RDuMLc2kO0BIFEPLW3dZoKvsk4eWeXq3wmUVEz7vy6iAyj8tybiDncehf2k5+NCkxFH6iBiAO5Mew3A4SWOcQrKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790882359; c=relaxed/simple;
	bh=fO68JDy7h2mkSC3wXOiTOR3KYoEnokUrbzSoIUOfMVA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=acGxDjJqE0So28yPzRRyt2862ssO6s56wax23S+AWm6S593MKVIK4eg+4kazG9MOfmP3CdfCTMvHmS6GVglNxh1Tg5STD5ORatuoKcLai98fA/fUbpzUnEmfcmCY9i4EfCOYC3slGpDXJIbtkbgRLlbb8kXvkcWIleY4NoL6GJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=quVvXwwj; arc=none smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="quVvXwwj"
Received: by mail-qk2-f43.google.com with SMTP id d75a77b69052e-532db7db0c6so63307731cf.2
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 12:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1790882356; x=1791487156; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H5ABqliwt/0HVQecrzmM2IfcVofZb65+VwqbBeb7yHg=;
        b=quVvXwwj5ePkH9anmrBdM2truSpmQi7t4poj2NJ0fWi2kvwmLENF1dBP4YPkrB4FiY
         hArb4hcdczVEl2ZTEfDw+chea5oxgc4s8C1u/HTWim1ZCyS5QEI+woE2s4HO5zGe4Dfw
         0j/9h+4LuuIac/tRDmhrrC8adSEa3V0D8mMoYamHS6blSYXFsZCM/49Sz91EwBBLaAAt
         FCwTSWFsJUDBeALpniCC46ClkLUcyqQOp+Q3fMm4zy4FpSAhyKsQR8um0I2yEWyzF+t3
         o4Zw9YpqnGE9QfdCRwDj0Y7paJCLaAQl1FBhZ9X1NFU02lC/4tI2osQTLPMO0gUJwhK7
         Ktiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790882356; x=1791487156;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H5ABqliwt/0HVQecrzmM2IfcVofZb65+VwqbBeb7yHg=;
        b=gHcrjJpyeFMbmp4H9ifHh3m+W+cpteQhdzah9f7iX+j9/0EhJiHaaPgTQw595Wf1C5
         MooLgf0C5OiCW2cuVh/SCwAZDK0w90+ZHUCrkp1DE6dK/wDtiqwNxTJ2r7o0AzvlUIu6
         umyImpBDSzZh859dBjybcbJgYWXQkI61TkxcbnMs82DdKk4vF1KJBx7Hd2OtaOVWIdgU
         Tmed1VTBN9APYGkIFoT3nConDKK2JmNyypG6IQPx8+QEie65gR8HqTI5NgnxS+9DZNSh
         GrMnjJGQ9UmDuGrTjlYf8NuD2zcmBVYh7923se/pwkrEXK291mrwwhm6J63OZ8bRiqUu
         GO0Q==
X-Forwarded-Encrypted: i=1; AKwUvBy+H1nlXIq406eX4DoTNovTPFwK3AIJScjUIAkueKy55fK5F+xv5ixQD+Yi5Zj4Akbg08Bje6+aNd0y@vger.kernel.org
X-Gm-Message-State: AFuF++nhrRINBTM2OHHKYoMY2hWNhSowIza9h/6HLv1nFLx+lgE8mH3b
	uItC5fgJbV9l+VKMDLHbLB8wOJHkLvOPVPWHghbH9X+8X7ebQVyTMyNMP1drNsdhITY=
X-Gm-Gg: AYBFou179H6USWsP2zb//paTPT5RirqRZhtCeq18Faw6OW0dN0l+0xpeq5dnRgeMXOX
	ayfxyTfS9myP8yVuqr4uC5EJPL3OX5u11lDXwUf4/FWoasYFP6y8TxB2bvFeT1GqN1aTJiiTk5v
	FZl2oIB+hJnRiaLyOgx38bjylkuexFK5vwT/zoIKi9VOrnHhXW4SQ/NSp+mWeZ6ysLhEG8dIJSM
	/aEz3sMmSELW0Z52VfooSQmV6BaH/hKQRhc5/YZDLGiuiIzwlHYxI7Xy4qitXgH1U0U6nQ6KiSF
	KyI7Zteq2UCE6r98HDfLQLUiqfF98rc38/7x0kfi1Hthat62kaMx0v0Dk11/1Tk2ciuezEBBzX2
	THySjosfwBqNQ8hQ316amdZGpu5XyAb24VH5BZ6cq+wTvzhsTI04l2LJOLhDYRyy0ZPG7wWkCd2
	sDBRKLZHcu9+ZefM2KLvmY2PNX3G9F3dBumJutMhIImYM/cZRlm7FacdRGshKR5xguovne0lk=
X-Received: by 2002:a05:622a:4296:b0:533:3fc2:8b19 with SMTP id d75a77b69052e-533cba5b5b6mr2082701cf.20.1790882356405;
        Thu, 01 Oct 2026 12:19:16 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53398bf8196sm5954131cf.22.2026.10.01.12.19.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 12:19:16 -0700 (PDT)
Message-ID: <9c426950-b3f3-42fd-b31d-f14085a7d2d1@riscstar.com>
Date: Thu, 1 Oct 2026 14:19:14 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: qcs6490-rb3gen2: add endpoint
 buses
To: Greg KH <gregkh@linuxfoundation.org>, andersson@kernel.org,
 konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, arnd@arndb.de,
 bhelgaas@google.com, abelvesa@kernel.org, daniel@riscstar.com,
 mohd.anwar@oss.qualcomm.com, lorenzo.bianconi@oss.qualcomm.com,
 devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260918152659.413268-1-elder@riscstar.com>
 <20260918152659.413268-4-elder@riscstar.com>
 <2026100159-retold-could-3468@gregkh>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <2026100159-retold-could-3468@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/1/26 7:06 AM, Greg KH wrote:
> On Fri, Sep 18, 2026 at 10:26:58AM -0500, Alex Elder wrote:
>> The TC9564 SoC incorporates a PCIe switch, which is connected via
>> the second PCI segment (0001) on the RB3gen2 platform.  The third
>> downstream port of that switch (pcie@3,0) has an embedded PCIe
>> endpoint that implements two PCIe functions.
>>
>> The SoC implements other peripherals, and they will be accessed via
>> PCI endpoint bus.  Define the devicetree nodes representing these
>> buses, including the mapping of each BAR's address range to its
>> local address space.
>>
>> The endpoint's ranges property must be defined, but it will be
>> updated dynamically to include all BARs.  As a result of this update,
>> the parent address portion of each range will reflect the specific
>> address assigned to the BAR.
>>
>> Co-developed-by: Daniel Thompson <daniel@riscstar.com>
>> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 30 ++++++++++++++++++++
>>   1 file changed, 30 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> index 3bb5fca8e2b13..5b7f5292a8864 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> @@ -955,11 +955,41 @@ pcie@3,0 {
>>   			bus-range = <0x5 0xff>;
>>   
>>   			dev@0,0 {
>> +				compatible = "pci1179,0220";
>>   				reg = <0x50000 0x0 0x0 0x0 0x0>;
>> +				#address-cells = <3>;
>> +				#size-cells = <2>;
>> +				/* Ranges will be updated dynamically */
>> +				ranges = <0x0 0x0 0x0  0x83050000 0x0 0x0  0x0 0x4000>,
>> +					 <0x2 0x0 0x0  0x83050000 0x0 0x4000  0x0 0x80000>,
>> +					 <0x4 0x0 0x0  0x83050000 0x0 0x84000  0x0 0x200000>;
>> +
>> +				pci-ep-bus@4 {
>> +					compatible = "simple-bus";
>> +					#address-cells = <1>;
>> +					#size-cells = <1>;
>> +					/* Map 0x0-0x1fffff to BAR 4 */
>> +					ranges = <0x0  0x4 0x0 0x0  0x200000>;
>> +				};
>>   			};
>>   
>>   			dev@0,1 {
>> +				compatible = "pci1179,0220";
>>   				reg = <0x50100 0x0 0x0 0x0 0x0>;
>> +				#address-cells = <3>;
>> +				#size-cells = <2>;
>> +				/* Ranges will be updated dynamically */
>> +				ranges = <0x0 0x0 0x0  0x83050100 0x0 0x0  0x0 0x4000>,
>> +					 <0x2 0x0 0x0  0x83050100 0x0 0x4000  0x0 0x80000>,
>> +					 <0x4 0x0 0x0  0x83050100 0x0 0x84000  0x0 0x200000>;
>> +
>> +				pci-ep-bus@4 {
>> +					compatible = "simple-bus";
>> +					#address-cells = <1>;
>> +					#size-cells = <1>;
>> +					/* Map 0x0-0x1fffff to BAR 4 */
>> +					ranges = <0x0  0x4 0x0 0x0  0x200000>;
>> +				};
>>   			};
>>   		};
>>   	};
>> -- 
>> 2.53.0
>>
> 
> This doesn't apply to the char-misc-testing branch :(

Sorry about that.  It does apply to to the for-next branch for
Qualcomm, so this should probably get merged through that path.

https://lore.kernel.org/lkml/20260918152659.413268-1-elder@riscstar.com/

> So I took the first two patches only.

Thank you.

					-Alex

> thanks,
> 
> greg k-h

