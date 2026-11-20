Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795142189;
	b=OwGpqYDh+gkCMeoXpyFpFaEry/HO7sDtsQtDG8M9Wg9+WxflfY9f8z3d+IsBe0kWm7zW
	 VqWSeEj8xUe7sCiRX8+9y9mlFjMVrNAwONZYpZICKkZs0qzPQ8YkJovYRQKIRDfv7LHEG
	 Dno66hiYw/5x1o50idPts2H1I7Y1YMGljTUzE56BhRVYJizX/Q7G9KdoqqkAbxhW+Plcu
	 eoLtj14e/vd/K1difX/sXrEBZBttSBrppRoVppn/SxjJ/wAco6pgz4jBHGlbEo8sNWqK0
	 5T4V9G8T/7rrWirPgwYse1r6ws0WnEEH+2EKnZIPVZIJTvqotGHGlZK9pcRLB1ZqP7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795142189;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=aVnd9+3ReDHkHlGRcer4MMPc33mybdrj5Cq2BVKAQFc=;
	b=stTcevkSeR5MrFuLfWemQgkGF2F87gZQmZxlZqIQ0zQJVm9/4MkBKBnMLnS2w5rFu8xC
	 AGavO0QzX4S5iI7ocPROdXKJDf6FOj0ucZl7KPPh+9tPq2RO3dM/3MJxA0LetJFsLnuiQ
	 KYWPPYhyhhUToL1sLAWKGITDVj8uErtlFFGPjf1OEx3tU55hcAFCZQVMQXB9q62VPeHWe
	 1AA7cDlzAc3oJEGSaSntMT/rOn2/ymoRMaYqXm/MAwy1+m6Mg3LyRWr3muGeph6657bAM
	 8I2q92Qk2NnzYofnscuJOIumfJG9jQSPWa6MdVZJJmzXzYGwaIcPWcMPdxJEz3rRieQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=foql3SGB;
	arc=none smtp.remote-ip=209.85.210.47
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64603606A32A
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 02:36:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64603606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=foql3SGB
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-862df509d48so285158a34.0
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 18:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar.com; s=google; t=1795142188; x=1795746988; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aVnd9+3ReDHkHlGRcer4MMPc33mybdrj5Cq2BVKAQFc=;
        b=foql3SGBe3Rq9oCsFUkdTTucFdgN3jVrImSDrUxdIZUh/drXxU4ErM5hUkGjKT9WPC
         rz8mDme6UPlFmmraq8LBhslHXuhVymCqZWyO+BlKGXrXxGyBqFO21agxbpbb50I175N3
         NJl2XCkC2L4tqB8rmwnKwltKLqVliUbO3+Kz8uEIqw7g3sShAe4Z++/lubjj74J6fO1H
         JglAuz9pLIEEWelptb4EAdGV7xdriEqLVWUL7FQvQiIpS/X07iErdrdctYQ22rs4SGHD
         1R4slVaPokh9fwr3dOcNiQ7gdYba8xBP0LMNQ5zblaK0mj3gw4LGmLbpPHnTcNCVgi+H
         bUvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795142188; x=1795746988;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aVnd9+3ReDHkHlGRcer4MMPc33mybdrj5Cq2BVKAQFc=;
        b=mLY2+XGAug5+XRAOxjF4OBsAT6wQdaA/DCblUliAHgSAmtQdy0WC15tUW5ObR0Di34
         7K6agggM+Iappy2YYLZVl0jLmG/GbyshVCP/Ah8h95LkBl5DnfIqdDrQOajP7fh4IPdW
         f7qzoxuUuTxRczhCe5IxspTvazDim+bxHk+yIcaanvtRu9udYUEm4sV+PeQ7u3r/QMT8
         bqD/IwBvn4B7DBWZLplz3GsCoMsJ9eQ8Dt4arZ8VItYtzbLTbG3mVRTdk4xfSTt/+E6k
         +KQRcVF4HeILAzR+CQSKOGxa68vLjdK+qh4kXbPcVWDUFj1mMR6xZys0ycfNCqk/a97d
         XZKA==
X-Forwarded-Encrypted: i=1; AL+hErFKm/fqg6rWgaTpY1UrguDHRIKh/itWoPMtNUT4xBzOZCToQ6gU6P79Lv6huN+nldeZlhE57bVZd/Xi@vger.kernel.org
X-Gm-Message-State: APuU4Z/VYOapb+PU9BtLnlHKt8eeedLUgx/OmvvIZgnVGA/wcn6/ubkp
	xE5ywrja6w2bTFRh7QJMj6Eo9OVDARN5LKD3JxDxLuT/nrRjB468y+OWbV+DrwvkLgQ=
X-Gm-Gg: AYBFou30/X+yWAtIdr5SF5HKOr6GpWxhBLPcngKDGVUGZGao87q2CZWJaKvL69ehWEz
	6vtKNwDv782pwYDyfPRSZ6CKeBxVuz7DNebn14njvDZ1SkFlhFpWorThLcDn5UBOLGfPVrLLkJq
	rMljhkEsGGg+uZHeszDaRJ1Q1DWJY4oH5wWF8VhJ416qw8MMJOSWVOD5RkWfWi6+0UBNsoWBAEH
	yWGiUu3ffhiSKL7i/JFj/22Wp3Vz2J/wlI5U9nK8vqJMjh9vuDuq0qo7UpbqIcJY3awluzabhXD
	wvejBqXpkSDDjG3adgoJh6LJT5VPy/DdXcMW7Bm2H5Gb+M7XsILbPPNyHYFKeGqJfaH7gDzEPbm
	aJnErGUDbBxvleuVvBkdSiMNygvlvu5535jzz07i3rH9UqkBkwhSVSPUBQkge1CiVxDF/E3KWcL
	JnUK6nxYPdeesNGuihEM2rIYwCPJyoOmwyPeNYpDLNhwLns0dBgpLnsx1epgQ6/8WNGm5vY5uSL
	GxDlmfB0aiOuQZweclBh6IwT6G+uRsHp0CmJkX4D22ZSO21bC2wPrldynD26XMxxU9WNxEVZydH
	mPi8VM7nqAdKrXuJXRNa7rZFHXoa6OsExgS99px9N7B27lH/4Wg=
X-Received: by 2002:a05:6830:4109:b0:861:5d56:bd27 with SMTP id 46e09a7af769-863155f228dmr1753162a34.7.1795142188164;
        Thu, 19 Nov 2026 18:36:28 -0800 (PST)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8631670c44dsm1127151a34.0.2026.11.19.18.36.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 18:36:27 -0800 (PST)
Message-ID: <9066bc1a-3b92-4608-b925-e362847dd1c9@riscstar.com>
Date: Thu, 19 Nov 2026 20:36:26 -0600
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
Subject: Re: [PATCH 0/4] soc: toshiba: tc9564: config system controller
From: Alex Elder <elder@riscstar.com>
To: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com,
 p.zabel@pengutronix.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: daniel@riscstar.com, mohd.anwar@oss.qualcomm.com,
 lorenzo.bianconi@oss.qualcomm.com, fabrice.gasnier@foss.st.com,
 alexandre.torgue@foss.st.com, marex@nabladev.com,
 changhuang.liang@starfivetech.com, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261104004332.2141282-1-elder@riscstar.com>
Content-Language: en-US
In-Reply-To: <20261104004332.2141282-1-elder@riscstar.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/3/26 6:43 PM, Alex Elder wrote:
> This series is comprised of some code that was previously sent
> separately.  It now incorporates a new system controller driver
> that advertises clock and reset functionality, as well as regmap
> access to its address range.  This combination is being treated
> as a new series.  (Details of previous versions are below.)
> 
> The Toshiba TC9564 is an SoC that attaches to a host system via PCIe.
> It includes a PCIe switch with three downstream ports.  To one of
> these ports an embedded PCIe endpoint is attached, and that implements
> two PCI functions.  BAR 4 for both PCI functions provides access to
> registers controlling blocks within the SoC.
> 
> The system controller driver adds the clock and reset devices
> using the mfd_add_devices() interface.  The clocks and resets
> are implemented by drivers included in this series.

Krzysztof Kozlowski questioned the use of the syscon for this
chip, and after some offline discussion I agreed to go without
it.  This means Conor's ack won't be included, and I won't be
doing anything I said I would that was related to the syscon.

The clock and reset drivers can each stand alone, without
using a shared regmap.

Each of these drivers uses two registers.  But in both cases,
the two registers are discontiguous:
   clock:  0x1004 and 0x100c
   reset:  0x1008 and 0x1010

It has been suggested before that separating the reset and
clock drivers has advantages, but I think in this case, the
simplicity of the combined driver (especially because of the
interleaved registers) is the better option.

For that reason, I intend to *combine* these two drivers into
a single clock controller driver that provides both clocks
and resets.  The source code will reside under drivers/clk.
The combined device will have a single DTS node, defined by
a single devicetree binding, and will use a single contiguous
address range:
   clock+reset:  base 0x1004, size 0x10

The next version of this series would have no syscon, and
with the clock and reset support combined, it will basically
be a new series.  I'll provide links back to this and older
code, but the next iteration will consist of:
- A single devicetree binding for the clock+reset combined.
- A header file defining clock and reset IDs, here:
     include/dt-bindings/clock/toshiba,tc9564.h
- A single source file, drivers/clk/clk-tc9564.c (plus
   updates for Kconfig and Makefile)

					-Alex
> 
> 					-Alex
> 
> The system controller, along with its devicetree binding are new.
> My hope is that this new model addresses concerns that Krzysztof
> Kozlowski has expressed in prior versions of the clock and reset
> code ("fold into the parent").
> 
> The clock controller driver was last posted as version 3, and all
> feedback from prior versions has been addressed.  This driver has
> essentially been completely rewritten.  There are now three clock
> types (PLL, fixed factor, and gate), and each defined clock has
> a parent, and the is_enabled callback is implemented for the gate
> clocks.
> 
> The last version of the clock driver is here:
>    https://lore.kernel.org/lkml/20261012152408.3729237-1-elder@riscstar.com/
> 
> The reset controller driver was last posted as version 1.  All
> feedback received on that version has been addressed, and it's
> a bit simpler than before.
> 
> The last version of the reset driver is here:
>    https://lore.kernel.org/lkml/20261012164354.3872326-1-elder@riscstar.com/
> 
> Alex Elder (4):
>    dt-bindings: soc: introduce toshiba,tc9564-config-syscon.yaml
>    soc: toshiba: tc9564: add a new syscon driver
>    clk: toshiba: introduce a TC9564 SoC clock driver
>    reset: toshiba: introduce a TC9564 SoC reset driver
> 
>   .../toshiba/toshiba,tc9564-config-syscon.yaml |  68 +++++
>   MAINTAINERS                                   |  23 ++
>   drivers/clk/Kconfig                           |  12 +
>   drivers/clk/Makefile                          |   1 +
>   drivers/clk/clk-tc9564.c                      | 288 ++++++++++++++++++
>   drivers/reset/Kconfig                         |  12 +
>   drivers/reset/Makefile                        |   1 +
>   drivers/reset/reset-tc9564.c                  | 135 ++++++++
>   drivers/soc/Kconfig                           |   1 +
>   drivers/soc/Makefile                          |   1 +
>   drivers/soc/toshiba/Kconfig                   |  12 +
>   drivers/soc/toshiba/Makefile                  |   3 +
>   drivers/soc/toshiba/tc9564-syscon.c           |  42 +++
>   include/dt-bindings/soc/toshiba,tc9564.h      |  46 +++
>   14 files changed, 645 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/soc/toshiba/toshiba,tc9564-config-syscon.yaml
>   create mode 100644 drivers/clk/clk-tc9564.c
>   create mode 100644 drivers/reset/reset-tc9564.c
>   create mode 100644 drivers/soc/toshiba/Kconfig
>   create mode 100644 drivers/soc/toshiba/Makefile
>   create mode 100644 drivers/soc/toshiba/tc9564-syscon.c
>   create mode 100644 include/dt-bindings/soc/toshiba,tc9564.h
> 
> 
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4

