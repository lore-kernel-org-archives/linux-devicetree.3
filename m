Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795807259;
	b=dLnoMGNHnPmyNR5WGmxXEX136ZxXRLWOnbIpUTuQ7VVhkCmreGL5+eN2nIkg2HYpNW94
	 N9OR8hHWyaQl8U8Yyeg5D4YWRyBcqUJ2JUMkYwpHI0qbxcKG3R3agKhpakd6cQsgc/OFl
	 I53B3az4biTs0TqhoAc6+N57ro7BNtSSTOH8vGzoz+VakeFJu/6nvKj1Et4t9RsmKUzEI
	 6YgweN5ZGtE37pj4Vjji5gIFfhIjt3SNr6LpMHltXU9jRD70FIwKTdYkxzVDro0llbg4z
	 MeLURpJsI+R/mphhpWR/jJeIok9+vGyM7XSFlj74mwDcoIn6l9E+rsGn0+22Gg/IQMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795807259;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=spMqGTfvnGebTBmWprGkb0+x7mXa+78W7iVJ0EOMLGA=;
	b=TUJdi6fCNeHDqA9UhGhll0zpDnMj7CIf1ixIyyJTGa4cqnOtMNbSj+ueXo1Ir8WQZuTm
	 ZWpi1/56p7pV6i0PX67Dzdn4zJTk9AMYP9pLd9yXQ5cBnglBY+752A3nbJ3edrCugsulM
	 6MsJO9rifqkAWaCI53yIiv9uXBfQRLzwGjS8GxNKXVp/n4+4M4P3udFrfY4xr5rhM3mME
	 Iqw3Siq+9NsD0XyNojG+D5Z5Oi2udkJHDNT3ZAl4zY1o80XemCOq7KUM4DtDcYkYnNpB1
	 cOWKbVJddp5ga9fE8PV8dXyEMnxRRBFn2WBMPWTBkwUcUEuuFBhaDoWc1ruBqCfQu0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=zpxwhrjq;
	arc=none smtp.remote-ip=209.85.160.52
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CEE9606A31F
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 19:20:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CEE9606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=zpxwhrjq
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-48ed188ee81so4506800fac.1
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 11:20:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar.com; s=google; t=1795807258; x=1796412058; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=spMqGTfvnGebTBmWprGkb0+x7mXa+78W7iVJ0EOMLGA=;
        b=zpxwhrjqox6YfuCTWrzRVOWk/4CVM967EA+Cngu4+HkdwOwzD5v5CkTuX26trlmyRz
         cnUAca3Rt+Xic1vR7J4cW8ymBJKXorlJT2fB8tHIUHNIWykz+EvzjlLrta+B2wZjzxnd
         n0MOnfiLYicEwWeVjayTpdmUd5EwFTV7INcfzr1aBCm6Fs7wCL5Ef12OC6ZuN0dQge06
         XnYz1i0+1huzx96eJIdp6bsuYUReBtu323z/4W9JnVJ3PlZ1m35gXvqbbKIKs9P0emlJ
         //KkKxeamwWNRf2xLYSJKMkJ8JZCpPCPz82sNL88rq64bISmxAbq234Hh38fVoTf7pW1
         TsFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795807258; x=1796412058;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=spMqGTfvnGebTBmWprGkb0+x7mXa+78W7iVJ0EOMLGA=;
        b=JcQPhf2qf96cNSG3t5gVRePA68wwl6u8JEdn8/3KfAy9yqerA+molznypxfCz5I1gk
         J7EL0MT3sEAgwoGjk8a5EuN5q2Njxufx2WELN86Os1LIh6oxXY956kYKVtSyhrp/eLGl
         /tyDBQF6hoRX5ZFBxyIT9cdOo47JC6kUDsgqJXat3svaA9SLrnu62cNbVBJVsWfCSQW5
         MjzKDVJDXagLhuz8zeYQ5+hypWTqxe3LOfVD0aDjN27oTFk1R/YEFQE5slCBN5tICOwX
         wAetMaSU5u0C2DRimxLaNEBZEFIam1itFCq0WU2Q/Ar3b1YUafcuwrBHei7ggdoV/ESi
         S2SQ==
X-Forwarded-Encrypted: i=1; AL+hErFFWkDI7Svm12D3iH/n9YO9Se0m58ZVPJwuymZ2/KwfgRizFuTzAceNSCAie8gnZ1SuaqYPBZyEF88n@vger.kernel.org
X-Gm-Message-State: APuU4Z/ku4X6jUqdHdgXuGhmWHm6LKZko+U5q5PSwIiW+GIlJDpP/2G7
	0G2guwuSNTnJ2SpI8tIVzQUL1sEujNrfUBPpf+Nfhd7NXAB8rXGMNtXT5uyCRTI3Zg8=
X-Gm-Gg: AZFdTZdSyaBXB96KMn2wAeflxisDWyZEMiMrqTFyCPDSeKmpTwpyzPye0cq0Fd2EzqE
	NbG6C0BbbmN7dN6Nt8/ObClOBgwxY9WyTyatYbiapKTV/3BWi94Dg9o9Fw6uWqAMy3FwjM4jwGg
	ga4NHk2TiW52vrUf1HYKu36l0ufjAaw+R11uUwwMsTC7E3kw1ywV8u8zSacWZ5q6QI3BVtrNBbM
	A58lS/RXuT76JKu1ySksjRYjb+m5TJW6S8EHtYbvQmm46+hJZMwxrJJXSrEAy3srQzdgWcPrLWT
	XzchJS/JyhZRYWr10ndtbo0TWfBsnXnDaQ4gln2ZVvJqbkcFOzI1Ae2F+rGAV9RKhs0SWiXyaC2
	MKttgl8Ly5Q1hbujmH+98iUBE+BiEelV1w3PU7D26yZ7zdVzUEf9uZQ1frFC2IVqWlCArb2KUsN
	1rUrLpivhz9KucrgUemquaDOLyqJmNsue7RRkWLdUXCGNhc9tIxlGLvYPp5mR3ax/ft84+ajQmN
	z1XO1cUBHeGCqeDb6tM1NJU4iNsPLdGcolqCE+iyu4mNblMbaS7xgbe6uBQgFXyz42G1pHqsn/4
	jS+GNOddn05rn8HivymUIrXDJVSNxm36
X-Received: by 2002:a05:6870:6b8b:b0:4ba:35b1:7227 with SMTP id 586e51a60fabf-4bc7782a116mr20876208fac.0.1795807258018;
        Fri, 27 Nov 2026 11:20:58 -0800 (PST)
Received: from [172.22.22.28] ([76.156.233.211])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc5ebdc0acsm24208446fac.3.2026.11.27.11.20.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 11:20:57 -0800 (PST)
Message-ID: <5f389412-a036-4792-bdd9-e86377ee7e44@riscstar.com>
Date: Fri, 27 Nov 2026 13:20:56 -0600
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
Subject: Re: [PATCH v3 2/3] clk: toshiba: introduce a TC9564 clock/reset
 driver
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 p.zabel@pengutronix.de, andersson@kernel.org, konradybcio@kernel.org,
 abelvesa@kernel.org, daniel@riscstar.com, mohd.anwar@oss.qualcomm.com,
 fabrice.gasnier@foss.st.com, alexandre.torgue@foss.st.com,
 marex@nabladev.com, changhuang.liang@starfivetech.com,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261125202141.1288493-1-elder@riscstar.com>
 <20261125202141.1288493-3-elder@riscstar.com> <awgCFMH6xerE510f@lore-desk>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <awgCFMH6xerE510f@lore-desk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/26/26 3:55 AM, Lorenzo Bianconi wrote:
> On Nov 25, Alex Elder wrote:
>> Define a new platform driver that manages clocks and resets implemented
>> by the Toshiba TC9564 SoC.  There are 21 gate clocks that can be enabled
>> and disabled, but currently only the clocks that are (or will soon be)
>> used are defined to be controllable.  There are also 13 resets that can
>> be asserted or deasserted, but support for some of these is omitted as
>> well.
>>
>> Two registers manage the state of the clocks, and two others manage
>> the state of the resets.  All four registers are found in a region
>> mapped for MMIO.  The region is provided via a BAR on one of the PCI
>> functions embedded in the TC9564 SoC.
>>
>> The I2C and PCIE clocks and resets are treated as CRITICAL, meaning their
>> state should never be changed (and a warning is issued if changing their
>> state is attempted).
>>
>> Co-developed-by: Daniel Thompson <daniel@riscstar.com>
>> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>> v3: - Fixed problems/garbage in the patch header
>>      - The Kconfig option now depends on RESET_CONTROLLER, and can now
>>        be enabled if COMPILE_TEST is enabled
>>      - The generic gate clock controller code is now used rather than
>>        implementing a custom one
>>      - The PLL and internal fixed clocks IDs are no longer available
>>        outside "clk-tc9564.c"
>>      - The PLL is initialialized, followed by all fixed rate clocks,
>>        followed by the gate clocks, to ensure each clock's parent is
>>        initialized before the clock is
>>      - Updating the reset registers (read/modify/write) is now protected
>>        by a spinlock
>>      - "Unnecessary newlines" have been removed

. . .

>> +struct tc9564_clock {
>> +	void __iomem *ioaddr;	/* Mapped clock/reset registers */
>> +	spinlock_t lock;	/* Protects reset register updates */
>> +	struct clk_hw_onecell_data *clk_data;
> 
> I think it would be more readable to have 3 different pointers here:
> - struct clk_hw_onecell_data *clk_pll_data;
> - struct clk_hw_onecell_data *clk_fixed_rate_data;
> - struct clk_hw_onecell_data *clk_gate_data;
> 
> (using the same logic you implemented for fixed_init, gate_init stucts).
> 
> Doing so, I guess the code that is allocating the clock data would be
> easier to manage.

I don't know that it's easier but it would avoid keeping
track of the difference between array indexes and identifiers.
I think I was trying to avoid registering three different
providers, but I think you're right, the result will be
simpler and more readable.

The PLL is a single clock, so it will be more like:

	struct clk_hw *pll_hw;

So I will implement your suggestion.

> 
>> +	struct reset_controller_dev rcdev;
>> +};
>> +
>> +/* Indexes into the fixed_init[] array */
>> +enum fixed_clock {
>> +	CLOCK_62_5M,
>> +	CLOCK_125M,
>> +	CLOCK_250M,
>> +	CLOCK_312_5M,
>> +};

. . .

>> +/* Caller must free the returned pointer if non-null */
>> +static const char *clock_name(struct device *dev, const char *name)
>> +{
>> +	return kasprintf(GFP_KERNEL, "%s-%s", dev_name(dev), name);
>> +}
> 
> nit: clock_name() is running just during probe, I would prefer to use
> dev_kasprintf() instead and get rid of the related kfree(). Moreover,
> clock_name() is just a wrapper around kasprintf(), do we really need it?

I think you mean devm_kasprintf(), but I still don't like keeping
that allocated memory around for every clock for the entire life
of the device.  It's just a waste.

What I'll do, to get rid of what seems like a weird kfree() call,
*and* avoid having the allocated memory hang on longer than needed
is have all the callers do something like this:

         const char *name __free(kfree) = clock_name(dev, "pll");

I do agree it's a simple wrapper but it's used in three places to
create a consistent name, so I prefer to keep it.

>> +/* Initialize the PLL (parent is the input oscillator); called from probe */
>> +static int pll_init(struct device *dev, struct tc9564_clock *clock)
>> +{
>> +	struct clk_hw *hw;
>> +	const char *name;
>> +
>> +	/* Initialize the PLL clock first (input oscillator is parent) */
>> +	name = clock_name(dev, "pll");
>> +	if (!name)
>> +		return -ENOMEM;
>> +
>> +	hw = devm_clk_hw_register_fixed_factor_index(dev, name, 0, 0, 50, 1);
>> +	kfree(name);
>> +	if (IS_ERR(hw))
>> +		return dev_err_probe(dev, PTR_ERR(hw),
>> +				     "failed to register pll\n");
>> +
>> +	clock->clk_data->hws[CLOCK_PLL] = hw;
>> +
>> +	return 0;
>> +}
Thanks for the review.

					-Alex
