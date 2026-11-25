Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=116.202.128.144
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795567824;
	b=A93h1CKyOuc2F9lAS9wxZkUoJIh94R8JJrb30p4QWDUPi0Ey6ycwkpMDKt87UNRaGNgX
	 fVP8VMEJg8wjKTaW75rDZM4UY3iYM60K17YNtPISLEk0DbtPYiAxziiQXMzbAMEhuVFh2
	 Y9RZV6Ok9u9thlkbXGJpkA63+WeBJ7faC/4vZp797dm/CFCMDPwYN8gsuZ6ToxWxHPZ3o
	 D9YJ8Te87DvaYowRFDOQxF1+vQChN829bZwGYuaYvIEraqcV4y8BQsbQhwWKvi5UJ2LuM
	 9VTe1mnM5iKRVHN2vr5yfr0IjR3b4y+GbpxOKm3jvKREKrRh3laL6nLVhz/aNvoIRFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795567824;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=JuUwzHWhZZaMYBjv7XG6XqaquyoaNPEepSOTGWcwgfM=;
	b=Wt/16dqzLxEpFRFYfLw00hA0DZjoOzIGZw/9ICU71yD+WbCQBb5mvBlnKxoHhmcVsZ8s
	 k87ybpWC+MFLH6qwkxvqyNC9ltZOooYepx8jBHmLTW3eWdn9yf7L+wMw/gDWQJtcn2/IA
	 FUsBGfiJPy7ncTJPsLMJmLNX2T8ZdRZTt885mXhM9BBGxgQqk/ZKAxs1kct5omEzsjryy
	 fbaQUoZgKU6ySVVyRtmOPoKmjfqRuWOSgM0iji3pPRDrOAyELOe2/lnENN/M0rVsCIuom
	 Duo8akv5kyu3cHIfwdQSwdKJO/2rqV2gAXQVc6MrA+Sqi0gdHAFnFatV9BwnOXu+bJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=freeshell.de;
	spf=pass smtp.mailfrom=freeshell.de;
	dkim=pass header.d=freeshell.de header.i=@freeshell.de header.a=rsa-sha256 header.s=s2025 header.b=g3+MPGUM;
	arc=none smtp.remote-ip=116.202.128.144
Received: from freeshell.de (freeshell.de [116.202.128.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CCFB606A31E;
	Wed, 25 Nov 2026 00:50:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CCFB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=freeshell.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freeshell.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freeshell.de header.i=@freeshell.de header.a=rsa-sha256 header.s=s2025 header.b=g3+MPGUM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1795567765;
	bh=JuUwzHWhZZaMYBjv7XG6XqaquyoaNPEepSOTGWcwgfM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=g3+MPGUMqcE0pyupobLlvRPp5zb6Ms/XBPfIcuRfmmP7LWJTRk+LMu6bIQWCHbbNw
	 0vDeuPs09oionSBocXBZKwXpxzs0Cz9aNw0QeEmqH+5Lhnpb52GhCnlv840DDmbGbM
	 4VIbEFXLtZwsMmKFC7xXW/yVvnDgFYQVfo5dCoOzmrRvvMfcznQECjx9edTvDTvUDr
	 391/O69rjbk8gKGDcUwtjtwFQy917q4QvPZtNiBDvtzj5+8HE9EhjTySEuRAD1fvfw
	 w9JQYe4VEDtQPsVLSAiYCgYp5iDMBGZn9XdsAlf5DnQJF/LIDhl7OP9jlYlvDmhaSl
	 6rYkvr2lkvr4w==
Received: from [IPV6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc] (unknown [IPv6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 93A9EB22081B;
	Wed, 25 Nov 2026 01:49:22 +0100 (CET)
Message-ID: <311a1481-0849-4865-88f4-636f13c2c6dc@freeshell.de>
Date: Tue, 24 Nov 2026 16:49:14 -0800
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
Subject: Re: [PATCH v3 0/2] riscv: dts: spacemit: mark K1 boot nodes
 bootph-pre-ram
To: Yixun Lan <dlan@kernel.org>, Hung-Chun Tseng <alan.tseng.cs@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20261024092558.143621-1-alan.tseng.cs@gmail.com>
 <20261124231909-GKB245721@kernel.org>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <20261124231909-GKB245721@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Yixun,

On 11/24/26 15:19, Yixun Lan wrote:
> Hi Hung-Chun, 
> 
> On 17:25 Sat 24 Oct     , Hung-Chun Tseng wrote:
>> On the SpacemiT K1 the BootROM loads the next boot stage into SRAM, and
>> that stage sets up DRAM. This series marks the nodes it needs for that
>> bootph-pre-ram: the SoC clocks, UART, boot media and the two I2C buses
>> in k1.dtsi, and the board EEPROM (which holds the DRAM configuration),
>> the PMIC rails and the SPI NOR in the board files.
>>
>> The vendor confirmed that the BootROM itself does not access the
>> EEPROM [1]. It is tagged because bootph-pre-ram covers the phase that
>> sets up SDRAM, and DRAM cannot be trained without it.
>>
>> Testing: all K1 DTBs build, and dtbs_check is clean for them with and
>> without this series.
>>
>> I used Claude to help read the U-Boot SPL and the device trees. I
>> checked the changes and ran dtbs_check myself.
>>
>> Changes in v3:
>> - Reword both commit messages to describe the hardware instead of what
>>   an SPL does, and drop the U-Boot paragraph from patch 1 (E)
>> - Tag i2c2 in k1.dtsi too, as every K1 board has the EEPROM there
>> - Tag eeprom@50 on the OrangePi RV2 and R2S, missed in v2 (Sashiko)
>> - Drop the Assisted-by tags, see commit 1e035297ffda
>> - Keep E's Reviewed-by on both patches, as the changes are the ones
>>   discussed on v2
>> - Link to v2: https://lore.kernel.org/all/20261017180141.3477743-1-alan.tseng.cs@gmail.com/
>>
>> Changes in v2:
>> - Tag i2c8 in k1.dtsi instead of in every board file (Yixun)
>> - Rebase onto the spacemit dt-for-next branch
>> - Link to v1: https://lore.kernel.org/all/20261012235624.77993-1-alan.tseng.cs@gmail.com/
>>
>> [1] https://lore.kernel.org/all/20261021083425-GKA125937@kernel.org/
>>
>> Hung-Chun Tseng (2):
>>   riscv: dts: spacemit: k1: mark boot-critical SoC nodes bootph-pre-ram
>>   riscv: dts: spacemit: mark K1 board boot devices bootph-pre-ram
>>
> I'd not put this series on hold, we generally could address other
> remains of issue/improvement later. so with
> 
> Reviewed-by: Yixun Lan <dlan@kernel.org>

With regard to mainline U-Boot use of devicetree-rebasing there is a
robust method in U-Boot build system for overrides such that we may
adopt these proposed changes there before they are accepted in Linux.

With changes-requested all addressed for v4 I expect the shape of this
will be good and it is not holding back anything in Linux kernel. The
hold is only due having to ask for what the closed-source BootROM is
doing and waiting for this confirmation now instead of having access to
see its code directly. There are intellectual property warnings
published by SpacemiT prohibiting reverse-engineering the BootROM so it
cannot be expected to proceed any more quickly than asking and waiting
for a reply.

If you would like to abandon the approach I suggest of considering the
effects of BootROM peripheral configuration as a hardware environment
needing device tree description and bootph-pre-ram hints for
constrained-memory SPL, then that topic can also be discussed. Please be
clear what your expectations are, thanks!

-E

[...]
