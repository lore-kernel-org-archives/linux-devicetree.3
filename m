Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793900451;
	b=Dh5L1Zho7DJ9EdQ/lXUhIzPmGsWOBnGMfpxZBj+P9dYZjytV4lachxlNC8OxdyNFYJqO
	 b00ipm5OujQ4XqceE9aLkJ8GzkDU0D+BmRQPLlKk5bW3LZeEa1PoPN5JhQ4cVfk3rKQUf
	 h/3V0S54AuidOGt73xWO2gfUhFdMLRPHF74+dCf44i4Z3de+DNNAEKBVMy9JG47rdIHiO
	 9y9uNOm3wJ5kGDnpRMZD1iuYmVe8fv6GOujIGE7osBqR93j49sCd94S1RWPrSgwCgJWO6
	 0kfJK9fH0xNhMAocjqrnF45ENWPgbLRYtMjKAAq9bPLt/Gd4/gZtb/bZBpz4b3lsfqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793900451;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=eAner/Tbdm+vBmCGePnRT0nbgyxjtQ03gRdPce+YEP4=;
	b=HoXfzZJ5d3kP9ttrm1y0vIWbr8JRE5zub+omU67IFy7CxW8kZXeENywNgkRrwvQYvUfa
	 35560nUIM/2r4gUtpCGMsQ4c+wzoiqjQfN1GzyV7+LNc9yrAVCWc+GX4UXnxrQqN7COuP
	 UHg7KKJPUxd5/mCHO13NkQrU03jZa8ZmNpv4aoIdDUC4MCesmTOsoLmQlyngOwCwuwNE2
	 HvAHyUuHrZIGG5KyT4FMgN4H5USLUMG8W91YVGfmFdat1OEfkMDZp/FfFXXw4ef1yLTMW
	 Ws3BgjogXth9UsgMYGj12g0Mi+Mpoa/t7kZ5XdexR7Xwe03VzX1iRXhxEZeZ5nODDag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xdSQkgaj;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A83606A330
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 17:40:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25A83606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xdSQkgaj
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so10442055e9.0
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 09:40:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793900449; x=1794505249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eAner/Tbdm+vBmCGePnRT0nbgyxjtQ03gRdPce+YEP4=;
        b=xdSQkgaj+H5AncEd1pKhW+t4h7JEgw/CiAuYSlUcaAbmZptKO9r00mubwDIf3U5fn2
         tLvAkLTSQKneChAZWUYnQbrdz+cZNHc/ytMh+H0WV795twzPSoJEzXGF7pcbKAq+LQYF
         kDTKxYNkxoicWq2MjD/bDC0tBxSis8nn08bKYVxVVImZ8PohlDQXRglOZC/8b5pj5ra/
         A2sduDQZK36rZSSNQ9HGGvfBvdTiEgFzzdJw6U23RHgVHgtlFAKwh4ZXceP0WUt9A+UX
         u4pjWFLhXWtLEMf+pRKdtJ298t1A5NGF5tavyWxW6dxTMJbdmX5AxQtEtFa0Jf8a+Tou
         qOkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793900449; x=1794505249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eAner/Tbdm+vBmCGePnRT0nbgyxjtQ03gRdPce+YEP4=;
        b=DELgCouuopXNuInDNWyKONGLCwpq0xCheJO1QWp4lHi8yaInlFXuFudL1ueqjgOdpJ
         CBWQOtnq2Th9h9gJwqjke7tWpNv4BW3V15i0/YgdUQs8zENEfFDEZ+NwV0KXH1iG77pf
         TQCQ7+jFFlQbYOLS1DkYYJaDr6SzHoze5HuOWuDkIglQHCq+T5vp64hOuhCf2TsGet4A
         tdGvAl+1p4DBfQKRTxYyV37EGhvNia+KIFB7wVvGF18i10U0KhItxy9RJKHxIOVFLE52
         AclJ0iD7SehpZLBkUDnLN1trLcQJf0GT0jr0tva/AstttABsCQoBHZEZbGv99okZCBNo
         nJww==
X-Forwarded-Encrypted: i=1; AKwUvBw4MNPFYxYKu8Wj9U3qxnNAp7+BZ1d8CBKh1JmVGI5gL/G0ALXLxbSZ5wiXvOd+FNmlj8WO9PvqNXil@vger.kernel.org
X-Gm-Message-State: APuU4Z8LDpjdQMXOntNi2NJejEwzrlo3E9HUQ4fMM/LQhffpyKmnXy0T
	c9MQJXdRInN6lyvIr+F/6j+zgHLtAtgSMbMku5CfH/21DEeJDp63FjFO
X-Gm-Gg: AYBFou1tL812paI0/YbxTSBanJe0aHJ8IoA5PHgnZy13iZSCmsCMN7cJs8TV0imCfNQ
	21W+pgswKdx+oZ5a7FeNj6QNSWL9WdRytpGi7XDYyMvDWaBAxNz1FXLvVTxqXnCAVrNOxeXiHG8
	Z9tRpOl6jiinrW0i+JZaktEaLZlm9dyQFuWwrZ09Z1qvQwd/MoxULVAhI50E1gKMS4J6UJECWYl
	zvoldklNZErd5jx+s6ON3eO4v/6JPkJXPyO8fFvVS5OCA8Le8wOBm9VknCSmhE/5BReWaTZVNkD
	dtJ/9R5eImM3c8BFHMzSCv8T7Spv1UfRC03jQqUeibLRz2qy2OYd24cRYhiWeRjH41RDwG34lK0
	FzO0nVVfiLFhn3sgZTb+Ik3y+F1H55052IpIFJz0x6anxigqJr2KgHQK02yyKOYxcgcUrx7JNeK
	gwXxHoqHka0B+/SFQMI1kTfx7P17zyRgxxUFNZRo6Yz5I0YPmu2LWCa6OkXsUgZ0I/LycU0zXNS
	fHxujAH0sKUV7gFq0skbZh+c7HYES/Yi0vR7eu1YtEy2FSy34LEiUUaa0YEW3DWMXZbYzlsSD/S
	VyzpLU9iD9uQrarcAxyjSIH1NOebJ/WcbLfqX6pGwA6v4hRQ65dS+QvGzt7MiFbbd8rYj0iMG4r
	Jo4V0ehwOY8l2x8GSNKYkNi90MWzODe6hhk7Vs/iOOdWgPQ==
X-Received: by 2002:a05:600c:5289:b0:4a2:18c4:61a5 with SMTP id 5b1f17b1804b1-4b55cf2fcc6mr61403365e9.6.1793900449296;
        Thu, 05 Nov 2026 09:40:49 -0800 (PST)
Received: from tachyon.internal (2.155.41.158.dyn.user.ono.com. [2.155.41.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56e2ae73csm81216185e9.1.2026.11.05.09.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 09:40:47 -0800 (PST)
From: =?UTF-8?q?Enrique=20Hern=C3=A1ndez=20Bello?= <ehbello@gmail.com>
To: krzk@kernel.org
Cc: shawn.lin@rock-chips.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	bhelgaas@google.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	dlemoal@kernel.org,
	iav@iav.lv,
	devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: PCI: rockchip,rk3399-pcie: Add PERST# inactive delay properties
Date: Thu,  5 Nov 2026 17:40:42 +0000
Message-ID: <20261105174042.2307139-1-ehbello@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105-exuberant-finch-of-domination-3fbd6c@quoll>
References: <20261104215848.2087944-1-ehbello@gmail.com> <20261104215848.2087944-2-ehbello@gmail.com> <20261105-exuberant-finch-of-domination-3fbd6c@quoll>
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

On Thu, Nov 05, 2026, Krzysztof Kozlowski wrote:
> Vendor driver does not matter, it is antipattern. Do not mention it here
> as reason to do such change.
>
> No need to repeat the diff.

Understood, both go in the next version.

> us or ms?

ms. The 0 case is badly worded: the driver never holds PERST# for less
than 100 us, whatever the value, and 0 just ends up at that floor. I will
describe the floor instead of giving 0 a meaning of its own.

> What is the nature of this timing? 100 ms is a lot. Are you sure you are
> not describing RC delay (we have bindings for that already)

The 100 ms is not something the board needs. It is the driver's current
wait, T_PVPERL from the CEM spec, applied on every board. Because PERST#
is already asserted when that wait starts, it is also the width of the
reset pulse.

On my board (ROCK Pi 4C) the slot supply is regulator-always-on, so power
has been stable for seconds before probe and there is nothing left to
settle. The problem goes the other way: the JMB585 behind it stops
answering configuration reads when it is held in reset that long. A wait
of 0 to 15 ms enumerated 17 times out of 17, 20 ms once out of 3, and
100 ms never in 5. So the board needs a shorter value, not a longer one.
I do not know why this endpoint behaves this way.

Which binding did you have in mind for the RC delay? If an existing one
fits, I would rather use it.

I also plan to drop rockchip,s2r-perst-inactive-ms, since it describes
an OS power state rather than the hardware.

Thanks,
Enrique
