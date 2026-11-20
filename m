Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795201477;
	b=M4RNPSpWzNquvMSaOpB7sDJeKLs3ICS4oWKlHUbKzrvlWKDSZuuO1OUge1+1KL4SdVoW
	 3s+9Ou8unVZkcxtWAl8OdOTyAc8DIjzTdHqQ6Dd8HkRQ7xY2E1SxEjYz9qbhrSEnxsxGg
	 p0SpwXqXAHuQz6PqDr2iF1pV2LFgq786y5z53JGfomqqJlPHDiw1VjOrEcs6RdGBMK3D6
	 v7zinDOnIAXHoQP7Uujqw9arjyCbf8C+95W1Cyi9Y8AhBPp//ke1JhvFWHne4v81OqdZY
	 Cq+w3T8H/V7mRDHETmvDQyt55bvhcTIjWNgmdMNLYUG/0tdNz9O3mivpWjVsUJM/sxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795201477;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=UUBLYTEYTnacPQdSElmQNWFU9xXzQHJKHgKzBBSzYNg=;
	b=VlWttt3EDLbaPm+Q36PrQPoc5P9VbvkWKewpnx9jdBT6LVe5MUwXsZHwT87qWo4IhdSe
	 +X0NoTBLEF2L4+Xuwl4t8qwYl9JU2GfeuMkr0ejVyLzJwxOaX68xEEl/etZ924T1K3tqP
	 8VKb3sAAl0ahiFtToy29NhVKkwMpTeuAOB+byekVyXUAOsNms53uKrGXxPWvwppoxtwnL
	 PT+6rKqGPUqListkj53yX5q5tY0eu2fOulp2x8XV0bURGOcNWRM1g3hm7B7iYVm5Rgqp3
	 f7Gp+FU8qSRs9WF2+TPR3ddQNVR/8r+ZC3taWfX7TggR1dOmJhWEA6fT5HEWymh9GGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=JLrvzWrj;
	arc=none smtp.remote-ip=209.85.160.45
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABDD560A261D
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 19:04:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABDD560A261D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=JLrvzWrj
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-451a49abd8aso1334516fac.3
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar.com; s=google; t=1795201470; x=1795806270; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UUBLYTEYTnacPQdSElmQNWFU9xXzQHJKHgKzBBSzYNg=;
        b=JLrvzWrjv1Foo6HYSfTDQVhyxDufy62fACyY4TUuvVaXgUa8lSg6ccU7ISvUaCI27H
         XwtX20FM0lAco9h28TTdGDJhvnP9d5NX+97YXXXWpfbFUFWZDBvFgg0CG7FJ6fqC6xii
         L0UBMr7K6SzVuWyOSuC+n3EjKbo93TyJbcZGK6sRvqWpJEBbQYZwztZIOHeCYvQ/fsrb
         7JC1ZqV0uo6I0urwInXjmsBf3Wbk3RFBF5WWgi3xER0qNs+Rn9fLAbWzqDHFsWJt7BcC
         kNuMepTIGP5jkW7TM25coWgEjy4zyRZOe5lWrtuJf5pOEYx3Ep22hoon3Z4TQnVX7O2U
         N8Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795201470; x=1795806270;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UUBLYTEYTnacPQdSElmQNWFU9xXzQHJKHgKzBBSzYNg=;
        b=H2LscM5bHR8W2Flveuumg+LUwoWU/dIwQmAAgH+87rHuCd9dFGqThJt2AJt9prgiqg
         9z3VCqxWpvtOnwOercncCKoaU3mS+l4PWshnvqPBIJHSvPfx8GQtToPG6jXLGgjxKoeS
         RzAFfy69izfVX8SyLhxwKTSZ82cQ93cOsoniBdSgZNuRomEYHtlNTzusJUElpBUV/g1J
         DFKKBbVkHv4OU7WeTog2rJTsncjmTNf+C6QlyXuT6ewy82JdQOihiuD80Jp0zVlA15Ep
         7l569RbTI+R8LFB1g4SzYcuWk9GDx0odbL+PkrbwnzHZ9ZD38Y1FLlY2gye7rdxJsiWX
         NqPw==
X-Forwarded-Encrypted: i=1; AL+hErHluhHvOZ/RO80tj5BqndiiVILiSvI2wIMUV3NQHnZrpLXqlU2I3/AUaPAJwU3D9X8oQNqJfPLoXbvO@vger.kernel.org
X-Gm-Message-State: APuU4Z+BAgvL2BwmFOR7gbC7Dlmp8WHEvuI20XAR104yxKXxU7Hm6Wjk
	2mPZjPzkfHJooeboTe0/0ULhPugdYYV5PHFz8UKc5QZN3g/457KTIvgjrwehzuKIkmY=
X-Gm-Gg: AYBFou2uGtZdihjH17hnGQFwf7SAG0bjWlELPjPIrVFB46qlRDJ8K42aMtmUFgxlF6h
	H5Avc1/VGHrpNUxX5xgxvK1TLM5Vrb30lttIxin4Sa+5BvUa0wnp9HNtX73iuIgBTLF9qz3LYbb
	HHAfLLQnpJiNykw1Lsed3fZ5GuD+sdTd/K40pnTkcjafE8UajLvwUBGmTw/Y5fOPZaWYu3EyuPy
	8TJWu5wn2w6hq13KrSFiA3ictGwaQBuKPlm+Ol1DeYleJhGRYh8vWg9N5Jl/7YQH7dyGgERztYp
	CfhcJAHxyCkrszlngOF5oVNoIoKPx7Hs57L/gyN29XQBRovyvXG3ryrcAfNOvJTLBUoPIwwWt1P
	ErIeamhyb3wwq2BAMaiGHzDDdTfdvgqLvQ1ATecGYMt9q1sLqAoREzWKTi+V2WOE7lZiH1V/uil
	/q9Peh+a1w+h/WsMo6cYlNEyDOYv0S1isReTyFsLY6DruVhWDIkHLZ1Lu6er1KmvDUJ4I5WrV+h
	oHO6hEfBoq3wnlyJeSbkgs2Jj4y3DiyxbA6VRRIRBnCDIYFH5oTbK9YBmlryfjw/ON0tp6ERln0
	34SOW7IdSWgdpD0n31fMQY4+9I70S5FwkA==
X-Received: by 2002:a05:6808:1528:b0:4f9:a153:8446 with SMTP id 5614622812f47-57a0980a5eemr4879032b6e.38.1795201470007;
        Fri, 20 Nov 2026 11:04:30 -0800 (PST)
Received: from [172.22.22.28] ([76.156.233.211])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a35655a5bsm2814524b6e.13.2026.11.20.11.04.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 11:04:29 -0800 (PST)
Message-ID: <295d75b9-b346-4669-8c1c-397df433b699@riscstar.com>
Date: Fri, 20 Nov 2026 13:04:28 -0600
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
Subject: Re: [PATCH v2 0/2] clk: tc9564: introduce a clock and reset driver
From: Alex Elder <elder@riscstar.com>
To: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com,
 p.zabel@pengutronix.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: daniel@riscstar.com, mohd.anwar@oss.qualcomm.com,
 lorenzo.bianconi@oss.qualcomm.com, fabrice.gasnier@foss.st.com,
 alexandre.torgue@foss.st.com, marex@nabladev.com,
 changhuang.liang@starfivetech.com, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261120183212.1264522-1-elder@riscstar.com>
Content-Language: en-US
In-Reply-To: <20261120183212.1264522-1-elder@riscstar.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/20/26 12:32 PM, Alex Elder wrote:
> This code has gone around and around in various forms, having been
> included most recently in a series that also added a system controller
> driver.  That system controller has now been removed.
> 
> This series introduces a devicetree binding and single driver to support
> the clock and reset components present within the Toshiba TC9564 chip.
> 
> The Toshiba TC9564 is an SoC that attaches to a host system via PCIe.
> It includes a PCIe switch with three downstream ports.  To one of
> these ports an embedded PCIe endpoint is attached, and that implements
> two PCI functions.  BAR 4 for both PCI functions provides access to
> registers controlling blocks within the SoC, including the clock and
> resets controllers supported by this series.
> 
> To avoid any confusion I'm only going to refer back to the "syscon"
> series", which provides some additional information including links
> to earlier versions of this code.
> 
> 					-Alex

If anyone would like to see the DTS file that uses this clock
and reset functionality, it's available here:

  
https://github.com/riscstar/linux/commit/de0515ee2967d8ff7753cc179a8e05283ee62829

					-Alex
> 
> The previous version of this code was included in this series:
>    https://lore.kernel.org/all/20261104004332.2141282-1-elder@riscstar.com/
> 
> Between that series (v1) and this one (v2):
>    - There is no more syscon, so its devicetree binding and driver have
>      been dropped
>    - The clock and reset components now have a single devicetree binding
>    - We no longer use a syscon-generated regmap for accessing the common
>      range of memory used by multiple drivers; specific sub-ranges are
>      instead mapped
>    - The clock and reset drivers have been combined into a single driver
>      located under drivers/clk
>    - The config option for the driver includes COMPILE_TEST, as requested
>      (last month) by Jerome Brunet
>    - The help text for the config option is simplified, first suggested
>      by Philipp Zabel
>    - The driver now names clocks using dev_name() rather than trying to
>      hand-code a unique name into a fixed-size name array (also suggested
>      by Jerome)
>    - Certain functions now always return 0, which simplifies callers
>      so they can simply return what the called function returns
>    - As suggested by sashiko, a counted-by field in a flex array is now
>      assigned explicitly
> 
> Alex Elder (2):
>    dt-bindings: toshiba: introduce toshiba,tc9564-clock.yaml
>    clk: toshiba: introduce a TC9564 clock/reset driver
> 
>   .../bindings/clock/toshiba,tc9564-clock.yaml  |  73 +++
>   MAINTAINERS                                   |   9 +
>   drivers/clk/Kconfig                           |   8 +
>   drivers/clk/Makefile                          |   1 +
>   drivers/clk/clk-tc9564.c                      | 501 ++++++++++++++++++
>   include/dt-bindings/clock/toshiba,tc9564.h    |  50 ++
>   6 files changed, 642 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/clock/toshiba,tc9564-clock.yaml
>   create mode 100644 drivers/clk/clk-tc9564.c
>   create mode 100644 include/dt-bindings/clock/toshiba,tc9564.h
> 
> 
> base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726

