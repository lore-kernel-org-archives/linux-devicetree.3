Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F9B340DB8
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 14:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780668167; cv=none; b=csgF64PrfGqyWh0DY36UhNEsoboIsyngNMfLqCxHawJtVdElQRJFeaMRMJhOuP13jEx3pwAdJWT4EjBhy91NABjp/4fYMeSzB9A0NmEiIwFcWIy+ZQsjlJIzLbnv2S5F+ErEkUxmwjuaMdeQ1/uCJbwlgjJiMTlp4KYe41abCiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780668167; c=relaxed/simple;
	bh=AV+WL8mMqsmvfSygNRSeuMcfwWhxeMoNTJseaBWO4ow=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I8e/SqiA0Bzi9Gxjt8Rx0YQwO9U6tM2CjZGZMX7V0BK6PmHwK+k0EOP8NstLSRyWyrtHSXZfOOcCkagT11PP5sIARVMUbpyezb3d0pkyRnJPiCKTh/ftiW61Cat6DbJce7JqB5Jb0FKHICdQifxertFHqxhahXDpRxyeBGx3N3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iR76Fxbc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iR76Fxbc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 198A51F00893;
	Fri,  5 Jun 2026 14:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780668166;
	bh=uPcrV+iYaTLbAEiIZUrUU2DpWbYkJH1btO4i9xeqtSA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=iR76FxbcFBYTrnVAclYOopg77TV28mE8QOYq8HXlCrev9cXDK4aFowUSS/u2Hhw+N
	 B8h4L1VrSrBhbdBTWIZPnpDdc8bJmx0ZyEprGYu+g9wJTLdyOCWo7d1VOmcfmdUsbN
	 kbfj+vLTewS0ue9h4TUdyLxjxn0SQrRzdpLqEe5PdJBsopyYJCNzmLmoCXOLyUvNuy
	 1cze0/NY75rbpBcodfEcgUUmzihJgeqZysNUcVQZdDMfx4pqwYFBnDerf7m8y0EguN
	 c3lr+rEMoIKdD5P5xJUubbBG/BsXe1lSQ8u6QtV2nqqtVTnoU/uhNjDYCGUWv8ZHq9
	 mEOp49pkyHtHA==
Message-ID: <f3fd53dc-7010-4b3d-a33c-4d1d32d3a1a6@kernel.org>
Date: Sat, 6 Jun 2026 00:02:41 +1000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] riscv: dts: tenstorrent: Add Atlantis platform
To: Conor Dooley <conor@kernel.org>, Joel Stanley <joel@jms.id.au>
Cc: Paul Walmsley <pjw@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Anup Patel <anup@brainfault.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Nicholas Piggin <npiggin@gmail.com>,
 Drew Fustini <fustini@kernel.org>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20260604143957.668047-1-joel@jms.id.au>
 <20260604143957.668047-8-joel@jms.id.au>
 <20260604-pacifier-sludge-196f47ab3c11@spud>
Content-Language: en-US
From: Michael Ellerman <mpe@kernel.org>
In-Reply-To: <20260604-pacifier-sludge-196f47ab3c11@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/6/26 2:47 am, Conor Dooley wrote:
> On Fri, Jun 05, 2026 at 12:09:53AM +0930, Joel Stanley wrote:
>> Add initial support for the Tenstorrent Atlantis platform, based on the
>> Atlantis SoC featuring 8x RVA23-compliant Tenstorrent Ascalon-XG cores.
>>
>> The evb machine represents an internal bringup vehicle with just the
>> interrupt controllers and a UART. This will be replaced in time with a
>> full featured machine once details are available.
...
>> diff --git a/arch/riscv/boot/dts/tenstorrent/atlantis-evb.dts b/arch/riscv/boot/dts/tenstorrent/atlantis-evb.dts
>> new file mode 100644
>> index 000000000000..06259cca8357
>> --- /dev/null
>> +++ b/arch/riscv/boot/dts/tenstorrent/atlantis-evb.dts
>> @@ -0,0 +1,33 @@
>> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
>> +/dts-v1/;
>> +
>> +#include "atlantis-soc.dtsi"
>> +
>> +/ {
>> +	model = "Tenstorrent Atlantis development platform";
>> +	compatible = "tenstorrent,atlantis-evb", "tenstorrent,atlantis";
>> +
>> +	#address-cells = <2>;
>> +	#size-cells = <2>;
>> +
>> +	memory@0 {
>> +		device_type = "memory";
>> +		reg = <0x0 0x00000000 0x0 0x80000000>,
>> +		      <0x1 0x80000000 0x0 0x80000000>;
>> +	};
>> +
>> +	aliases {
>> +		serial0 = &uart1;
>> +	};
>> +
>> +	chosen {
>> +		bootargs = "earlycon console=ttyS0";
> 
> FYI, this should not be in here.

It should be there if you want a working console :)

I know it's a "rule" to not include bootargs, but this system has no 
boot loader, so not setting bootargs just means the DTS is no use to anyone.

>> +		stdout-path = "serial0";
>> +	};
>> +};
>> +
>> +&uart1 {
>> +	/delete-property/ clocks;
> 
> Why are you doing this? Looks kinda suspect!

On the bringup system the uart has a fixed clock, I don't know exactly why.

>> +	clock-frequency = <5000000>;
>> +	status = "okay";
>> +};
Having said that, I think we talked about making this DTS match the qemu 
model rather than the internal bringup system. So if we do that then 
this will change.

Thanks for the reviews.

cheers
