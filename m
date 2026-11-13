Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794533006;
	b=jkfAPIntErF8R3m+NVfdAWzEgh6BsMm7g++f3J6NOQ2yv0+yxgJO+fwEyDLuSsK0o++e
	 DPoNhfP88qKEMO2a9O3/x6A9nyaLckLlsc0Wjy03xYpptUY6/arkaTE+XW2ZDfS7BG3+N
	 AX4z6CZOCtv3HXFaMv7IsJvDuPIgqdQWcIbXnzZT0wM8qpB7aadhpbcCWbCkqOp01BJEH
	 gTTb/F/iLU4FxHG7bEPG/i2KxJV69iFEvqZQQD41Ubo3sFPE+xPvaVjijdvnsSinUE46u
	 pp1nbpxgQiDZmvJDuiAgrQMsldkWKu2RkpiBaaBFwxGjfk+4kipxt0GuxEBvh2nblJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794533006;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:To:Cc:Subject:From:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=9ThB1/zw69OWXTSMpOLXkS0laxUVjvIT+W3FMQmOb3Q=;
	b=GPElnBSfgzw0l2oWqzy9b4Oyym+XIZdOpkXTtyR3GjXvdsYw+dGXrao89h1kv+rBblD2
	 gy8xXNGVojt3FWMJKWEkKkB8MtPzp3hwytUYvTmvhOd8dH4PBi3dmdq4zvX+9NeWeSP3A
	 2b4H1S5suWGB8PjETEf19wU1QQEu5prQ2alPSCmH7t347vFwxMmI6+gkZm8FYFSse5A6+
	 h4DWbag/PbQ8v9zuVL6piXHP4DAEQmDoH0GvTg1y626nPTAIW+1IZGiwwU2PAdywx+M0c
	 Ls7iEmpZEVITYLCxRdsIDxKoplr4Riu3LRjY6D8VupFmDa6TxVrjNnjXa+84szvPlJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=GTiaISFX;
	arc=none smtp.remote-ip=209.85.128.177
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E380A606A321
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 01:23:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E380A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=GTiaISFX
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8b3541bb1a2so2954517b3.1
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 17:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1794533005; x=1795137805; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ThB1/zw69OWXTSMpOLXkS0laxUVjvIT+W3FMQmOb3Q=;
        b=GTiaISFXFMwlQRO0n2/KtqU9W7SvrXe5qiAcaTbvIMxPy6l6yIO+ycn/shtcvuSkpH
         Ms+TdlOHLFbh5qGXdxR8C41LOY3K27cDOfz3HD7vFkkn3ERTuR819vXjeZcU6W49zy7J
         S6J8ZrNCYAQ/2N/tXm8xoAjg9cfiSSsIMz7l9sv69JbG2fMC9Xjb0vVGtjvyGEmI7Uy2
         2JDhC/MS6YObbZ+fM7zi36etDnJ6kW8iNj442l05eZR5whnbQog4IQXrec5XfsKjkiwL
         s0+MM2plCc52hBujj/3836Huu5My2vuh7x3sriFXDV7GFGYpxjukNbeJsuqv7PUV376c
         4wHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794533005; x=1795137805;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9ThB1/zw69OWXTSMpOLXkS0laxUVjvIT+W3FMQmOb3Q=;
        b=MceAbPwVjs+mQWjdV0wo0VezhND5A+nugg6QT3bNBXNpd6Z+JTuMn5tbIAYNQoa5v7
         HZwc8j8L76FtXw3V6prL0DA9G3wne/TZAl+JQJDXUrJQ6QzJkiCOxfvfirfoblDmUcOx
         DkKCryqUi2HAesixwsloemwGvlu2YaaoTY2XOpVQ6TMsfKGsihjn4kV5Do8jxlc2YJoK
         L/4tIUEJjEZnGVudE9i0r/BmCEkp+C4wBEEX/dhDUSY9AebFlA4F5uGEfenGBufyUryK
         3gfKxL57hSl/E6c5F6tzL6mpkiSiGvJdjQ6Dfdt/XRw4jJhUy90j7dAsjGJo4jaVAT1h
         2cWQ==
X-Forwarded-Encrypted: i=1; AL+hErGyDyaqBNMugA3v70t/48yrZJ230FikYfb0veG1+ChR3aKtGovdX9zTSTqkPPU658yWcTHrAILv0pQV@vger.kernel.org
X-Gm-Message-State: APuU4Z8gLiLZjST+jY6fk7Zw9jAl/97bDS8ts6/H3S6exVnHbfFkxkj3
	0660l/yU4G19BYoQDHuRAf5CgL1uyXAftavTIyH9OwhL1alD52skg3aOUGqPUR5mhZE=
X-Gm-Gg: AYBFou0WhK/mVpvLqfWd0TxSwx7Wi8W1rl3DFp/WoICZ88ruCxsp+yCeEwfb/nI8Jba
	cfQClOZb9AC+iKNEnPwqTaXhgaSSSh0PWTjIhpc/58w0+N4IR2Rk0UWSgo3k+jn4DAabXbci4fl
	ksS0tmGJN8mWuaSzBx6Syk7EKarUNftxdU1R9izAF+0sDFE+3zFftcmpRtWCvfMmnwZn8/76+1E
	ryCoQ3lL/MKCPj897p/n0EFqphtjKSJYXmXLsfxWtD7WLEuXEaSdF/vJUX9bvrLJp/82CNk/Lu8
	iwDJt6Wm2Jr58bv5VDZLmZVWTeFHcU8lPzNTBvh33x2PAmr8/dLMWc4Vsp/wPXHQ9Juhn0/24W3
	pTMomiX5v2mdgkHSR0qvmMf7qIL5b2PWmxlNkO/1Y3+q2CdWvg2EVFQ2QN9u2tmWhIe+fgA+spp
	A3HQ/GoVH/OGsfm9EAcN6scUXPekgn75dbJeEQmnQfGm8h9qHzdRYeTcX6htUS/Fn9F4xDyjSaR
	dSGdDAwgzeENIyYywU/uMlCiRamjnyY31FxU6s9On83jL3wK7qjcUwMuWCJbYXGVlJ0fmdrmyp0
	mZD451gy9noDVmGwd1ivI8ShfKBzG6uqiZGe6oZgkKgNhcQ=
X-Received: by 2002:a05:690c:c1c1:b0:8b0:95a7:37e2 with SMTP id 00721157ae682-8b4aa33412cmr5356997b3.80.1794533004833;
        Thu, 12 Nov 2026 17:23:24 -0800 (PST)
Received: from localhost ([23.145.140.5])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa9e8d20sm9341667b3.38.2026.11.12.17.23.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 17:23:24 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Nov 2026 17:23:22 -0800
Message-Id: <DMTOUWAKBIER.19DO7XAP7Z2R3@nexthop.ai>
To: "Rob Herring" <robh@kernel.org>
Cc: "Saravana Kannan" <saravanak@kernel.org>, "Frank Rowand"
 <frowand.list@gmail.com>, "David S. Miller" <davem@davemloft.net>, "Shawn
 Guo" <shawnguo@kernel.org>, "Grant Likely" <grant.likely@secretlab.ca>,
 "Grant Likely" <grant.likely@linaro.org>, "Pantelis Antoniou"
 <pantelis.antoniou@konsulko.com>, "David Daney" <david.daney@cavium.com>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v8 0/6] of: teach overlay code to keep /aliases in sync
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
In-Reply-To: <20261112221205.GA1425386-robh@kernel.org>
References: <20261014-nh-of-alias-overlay-v8-0-0f74f05ac762@nexthop.ai> <20261105124030.GA1449284-robh@kernel.org> <DMNRHQBO1JLB.3IO0N8NYJML4G@nexthop.ai> <20261106132432.GA2551143-robh@kernel.org> <DMOE1TFEAB6G.EC2KYRBTZR9@nexthop.ai> <20261112221205.GA1425386-robh@kernel.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, Nov 12, 2026 at 04:12:05PM -0600, Rob Herring wrote:
> Stable bus numbers is a solution to your problem. What's the problem you
> are trying to solve?

Labeling hwmon channels on an embedded Linux system.

The board has an x86 host with ACPI firmware and a PCIe FPGA that
provides a dozen or so I2C masters, with muxes behind them leading to
PSUs, fan controllers, voltage regulators and temperature sensors. The
FPGA driver applies an overlay at probe time that describes all of this.
Userspace labels the hwmon channels with libsensors, and sensors.conf
picks a chip by its bus and address, e.g. "pmbus-i2c-12-40".

The same parts sit at the same address behind different mux channels
(PSU1 and PSU2 are both at 0x58, for example). Their hwmon "name" and
their address are identical, so the bus is the only thing that tells
them apart.

libsensors has a "bus" statement that maps a bus number in the config
to an adapter name, which would avoid relying on numbers. It doesn't
work here, because the adapter names aren't stable either. Mux channels
are named "i2c-%d-mux (chan_id %d)" after the parent's dynamic number,
and the xiic masters are named after their platform device, which comes
from the MMIO address the PCI BAR ended up at. A udev by-path symlink
for /dev/i2c-N wouldn't help, since libsensors doesn't use /dev/i2c-N
at all. It reads /sys/class/hwmon, where the bus number is part of the
parent device name ("12-0058").

> How aliases interact with an ACPI system is another aspect I have yet to
> consider...

On these systems the base DT is drivers/of/empty_root.dts, which has no
/aliases node. So no alias is honored from the base DT, every bus is
numbered dynamically starting at 0, and the overlay is the only place
an alias could come from.

> Right, but there is no fallback for some cases. Having that is the only
> way this could work.

Can you spell out what that would take? Does every subsystem that
hands out ids from aliases need its own fallback, i.e. the i2c, i3c,
spi and mmc cores, plus mtd and the serial drivers, before overlay
aliases could go in? And if so, would you want each of those as a
separate series through its own tree, landing ahead of the OF patches,
or all together in one series?

Thanks,
Abdurrahman
