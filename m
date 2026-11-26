Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795698954;
	b=HtSXdwDaVzm2BASsnyeRxiFYLYMupeQqzHOlOFAcQ2PIKykdFzK+t4G6D4H1e2gUkpBc
	 n+hpwIb6bruo43P7OgS5aJzA3CVz63txbBdOzvL1UREtnCTvGTjKxUTPtfQlzYWNpgkIP
	 Um2JHThKGSpcMG8VMogbe7Wzq+ujABsjgFTlKKVVOVF9w6KpZ0ivKzTEQ5p/9DWidCXX5
	 QLqFeY6cZvPicQEZBJn4+hI0DmBVsa28E3Mrt5Tz+NGOQBpC5W8FP6XsJIHYahMFCQDM2
	 HBleIQFG+X/aMcrNAXtTOhDKTBgdbf2WKpS/FfNFVj0omMIJ7LCyYkSYiaqXmalZbMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795698954;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=/8RldKvPQUEazbYpydH6ulNIbu8h2Gc8WOSWGgj6gjU=;
	b=IuqAvak+7eW0UlJ5J1pKVzFNKp0lZsmHNvic25IrnpuNVKBtDX96GjeL4YWppBvuyyYN
	 XgWCdmEC3r9V0C9aqIPMj4v32u3N3JucePCPhvkLUl+eSBraZFVqFWHAwvDqpDUcy5Pj1
	 XzUI1lVRgUcMrQ9aVEu75a0DrLDKZ6R8Dy/oAAd3PrmpxmiLorpm9yezxT7ugwS6YGFj+
	 WsDdEnWGx41gX5He32OZtMN4RoHEZJ6zVI8WdACpT/t9aNNoo4uXR22OSXyfhSDaaIfcK
	 DPPF6xgiaRrlTH7WWHrOrVoMJmUVtmZnzqTjQoQCuyJVjZYEcwvUWgtX7IjpvqtUncA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52BFE606A331
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 13:15:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52BFE606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2f04e3bf46dso51691525ad.2
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 05:15:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795698954; x=1796303754;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/8RldKvPQUEazbYpydH6ulNIbu8h2Gc8WOSWGgj6gjU=;
        b=UP1y3N+sRb/6gq0w9Rf16deIN7F6bBDs6EWkb3D7b7mEXyYZdoOHMXz2wZvaYW7pA/
         leiJsqlP21fhOuDfiZsVFHuk9ApXGaZYhB5KcEellry84joA3FgwREmNfo74wiFBWYxr
         2QUCwGeYCfitiEvAc+TQuLqsgYHXnDjAYE7ux2V77cEWherYDIR3Qu8yc5AdYUhJtKJ2
         nbJZYfEzCodjs2n1WsxUssOCavYPLfSMkAKV6iWTLA9bHh372QBBA4RhEHFAxrXaq1N4
         BKvf6PprwgFxDBxY/iekWIhI3CTTRYs6FAS+oT6bO2emLkex1J/zA5Ufb2685sFfH6pd
         bW0w==
X-Forwarded-Encrypted: i=1; AL+hErFXtryWexPqwB3kBFfkTHRgYyVCeEPWN9Ieb701dAwVswD+g6+D5deB6/RXXJLw2Zf/pqxYHZ5CGtXv@vger.kernel.org
X-Gm-Message-State: APuU4Z/X8VhkqW146K7W83bkcfTHhOfZClr+nA/einZVPF0mkTOutjIw
	ikmtoxU1AFBuL7YYkTwGSl2KfWKZcYS4MMkoAfcJrpgSZiuWjo8ZMSpiElo8Tgiz
X-Gm-Gg: AZFdTZfJeTY+/MYFpgl4RREQz+/3b8qLlluAzGMJjrX78jV94xCziX347QPB/w3XCnh
	Q0jKNQOYVcxWFED0z4g/I9jRH4lqz84Hh7llra2GeEERnK1d1W+RZ+g1Qk50RfO3k/HdphnKEsR
	urvWQwN80/M5VLZQQ9gTV26dwqdltsGlni1XS1r59lRatfbGHlVzpkp8FSITSwLVkpTg+tNlb6c
	E6pWwiDH/jqgHTJ4mlgDyo/5bAMnItbOV4wzZLJqrXq/eGmfqp4sef/IgDCdWO8WRSsNLJ92GJp
	jfEQGhNqPGmECq7iGw8Blv3zSvMnG4jrsCR7hzgisOKVzpcwSTGEkseDAMj6iaMkM83dYtUeYbF
	6hNPYKY8DA7CUr20PWaKddXzl9i/OhqQeUcra2EvWFkN6neELxzXoVWJ5SiyougNMkxRGvgSJ/g
	4ieguzTL/WhUIZ25NC9Gpg5GJP2RiJLy7z/HTEutqQQr9msVzEnBMJl+jdHaC8bz2jdhKrYgC6H
	VvpsJ+9DP9tXh7gGADRUDNtqJUmmAxDWnY1plXV0KFteBNr+0uEAOrA3Py6lHFYjqtV5Sb0zERx
	4PpdZcqRLfPQsC9BGTzTr7L7Q3I0gw1WDKSsZKSGwZ+Kl35zrKkRfrntYK9SDKMKMyP0WPk=
X-Received: by 2002:a17:902:dacc:b0:2ed:472:b9d6 with SMTP id d9443c01a7336-2f03efb1397mr232962965ad.2.1795698953574;
        Thu, 26 Nov 2026 05:15:53 -0800 (PST)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com. [209.85.214.182])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f14fc8csm101838425ad.74.2026.11.26.05.15.53
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 05:15:53 -0800 (PST)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2f02ee04378so55401435ad.1
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 05:15:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEJY+7w40ervx9S0Q3ZU4nvLS/HNFf/Oxe1g3vkqEWgAcSZAiwR3FHy6ualNf5LqXxKF7Ye+d0gjl0r@vger.kernel.org
X-Received: by 2002:a05:6122:8b87:b0:5ee:27c9:ebec with SMTP id
 71dfb90a1353d-5ee8ae89d30mr10164180e0c.6.1795698590878; Thu, 26 Nov 2026
 05:09:50 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020031049.969895-1-den@valinux.co.jp> <20261020031049.969895-16-den@valinux.co.jp>
In-Reply-To: <20261020031049.969895-16-den@valinux.co.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Nov 2026 14:09:39 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUodx0aRPvj9YZVS5SV_42vq0bvnk8VgPFmeOoZDXh4NQ@mail.gmail.com>
X-Gm-Features: Aa3M54oGF1y6BfpWLxe4xGuZFgd7nGmTk63s0g99O3cHf_svXMj9Q2unpIc8mY8
Message-ID: <CAMuHMdUodx0aRPvj9YZVS5SV_42vq0bvnk8VgPFmeOoZDXh4NQ@mail.gmail.com>
Subject: Re: [PATCH v5 15/17] arm64: dts: renesas: r8a779f0: Describe the PCIe
 AER interrupts
To: Koichiro Den <den@valinux.co.jp>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Shawn Lin <Shawn.lin@rock-chips.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Jingoo Han <jingoohan1@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
	Niklas Cassel <cassel@kernel.org>, Wilfred Mallawa <wilfred.mallawa@wdc.com>, 
	Serge Semin <fancer.lancer@gmail.com>, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 20 Oct 2026 at 05:11, Koichiro Den <den@valinux.co.jp> wrote:
> The PCIe controllers report Root Port AER notifications through
> intreq_pci0_lperr (SPI 421) and intreq_pci1_lperr (SPI 428),
> respectively, separately from the integrated MSI receiver interrupts.
> Describe these interrupts with the "aer" name so the controller driver
> can use them for Root Port error reporting.
>
> Append the new interrupts to preserve the existing interrupt indices.
>
> Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> Signed-off-by: Koichiro Den <den@valinux.co.jp>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
