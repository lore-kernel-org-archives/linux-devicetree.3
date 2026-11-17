Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794940052;
	b=TlJJc3gO0xap3arPwl/RacYw9AZIzuuNMVgwIp5pT6PyhCv2gsdJzzH23VtpzljBf0VQ
	 STePHKGOw+fW4GNlgWn6aGepoVyA6Mw4VDdc9sGQby3tgr3towm6JragD+Z3eIF79yHVP
	 Q3v+4qfmrhoLsbH1wbIfk8j0Fk4l+mtse7jjUwSTAwxjVwoOhuqpWwKmDI7R2Kfxm5dZ9
	 syQgIdH8A0CBgv7NKKwpSugCmEeoM58+vHSyDwNc7wXpWHqaEYjCLnD/+yPzgoEV0Qp7x
	 quz1BlE1+t4mr81LavOSS0zOcMLDQkYW6/jAO6+mwKldYNZKW+qgB25uvp0OUNN3jUA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794940052;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Content-Type;
	bh=Ono9E1opT8JaFJyEmNrBRx7Uw7yYbLKTsou3aRgc7Is=;
	b=GQ7TPngQpMQVtdAVhAKTsHvoM7sb/67BXKU5cGt7cf3g1+6Tz8AdOULmFuHfTlsDosaK
	 iGw4acp7bvqH2apnN98drJwAbXojAZtIw4sOWOOwA9qFkGiXARxAEj2BXrvUqwPXbQ+CL
	 P0xm1w5ViFqiIT//RUVy0GSYvelswqC27sqZOCV7R07cmNFRVz2UajN3QMPp+6XKI7CLQ
	 YGGkgAyg7qJfzUx56wBB97JvHTistRLkmyPr2xj45Gxrervx+VZTkluPJ4H2FOj1Zc1I+
	 ob47iu+hAdBaqmGbEAMikyldPfHkji70k65E5Be0mjxasqMKgsRgH28MyPZ0ruFFq9Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BvZDrDGn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.54
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27629606A31C
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 18:27:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27629606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BvZDrDGn
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-6767d92cde6so5323500d50.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 10:27:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794940050; cv=none;
        d=google.com; s=arc-20260327;
        b=UjsYtRvKJezklqamTtNGTBuVOU9ANOy5ksK851WoEF7rUJJ1klqTQ0zJmL8jSgVo9W
         HjFCHhNhWB531+7SZ8a/kMowkw0UVxZwWGO744aJf3dLesEB4U3x+xv27NHFszC8vP0R
         1Hv3U0Ul3KnDJAW/fVfv7ewA7K30WESR80/6wyC6LLAokPa1zEGKZum4tOhgLGEqbHP7
         wR0kFlGK36vtP5wVMcFDpM5OajDU/3rje+vRuPWSSHv3QQ3jw707zJfR1LvW93TIKSGv
         end6YPJiJpcX9gnVNbuwx69xAGSrnakkd0ZIBwgE0fWEcgco8oEiBmGWOORdYL9+S3VL
         8w/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=Ono9E1opT8JaFJyEmNrBRx7Uw7yYbLKTsou3aRgc7Is=;
        fh=AAhidXQq5Wc9zTKdoHKkcL1QimkkQxun3WXJfE2dTsA=;
        b=Z65X7LQEX2ybSA1S8FZZ93TcolWbOycwmVEAgLaMAIW9SZ3qClFSjUTrdiZwSoVSXr
         glM9iluVgrQCSGXQ+Cf6E2zwL9g/sB/szlkJFoOWwQXeQsw5ko4VAVQlgfjSAZPqiqcV
         mTREg0ZKUCyzd2BpeBgH8LtYbe25dGKN0UeZIS6D1tIUMZ3lNzJJFjo6TmGcMHHi1kWT
         755oFz0zzZPhhEYaoDpdFHdUpx8nXS3kZnMTcptZQb+HZNmPzYEJ5ZsD8IJnSBaa1B3D
         i4/znEbLX7YMZg9LKkYVn/RpZe05BQps8gKwclxNGnEIAZIyBjsSFik5ZewmFMBR1fva
         SVHQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794940050; x=1795544850; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ono9E1opT8JaFJyEmNrBRx7Uw7yYbLKTsou3aRgc7Is=;
        b=BvZDrDGnbVIhIGqiLzY1/S+PkC3X4QadaVcXkKqHcBfAulFtJP5MAp+m2X70IotA+Z
         57CbnVh8+dpGMAKynLnYUVJGnS5JswhcGq0USxKUN8pVfTZh14Pdns5CdXZr+Uol+JpP
         y/c+FhQfUu4/HAWu6R+g92DUsm/gz/HM+Je/YpC73LArF2HAvGtm79wsarJ9z05mLyBI
         81GWCjBZsQA/y8za9+yaekBpwVLioi2bCqTwkolA4OaTQqqmsjljyjoo24jSPokiLgI3
         lRu+SFMtTNDRo82Am++LQDVy5icDANIoQFP7IqGf8v90Hm0wQvXOw3YOfClhWytFgY18
         xgUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794940050; x=1795544850;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ono9E1opT8JaFJyEmNrBRx7Uw7yYbLKTsou3aRgc7Is=;
        b=TvJedAvlLDYcaWzeZw9LZH+g9WGx3JAubwcysy/l4GUBBwh+RrWE885bGAyrch7uWV
         GMqtg7rhh4tDlxo2jgKrkcWE6rMyg+GeLuG3HTHj41pETnJPN44PAsT3vamiKs8DDED+
         evGV6sJAfTbY+PMEdxV0KYcpU42Pmj+OtrQBimbfqbQX+fjQDKxT99FjtekGU1HVsAQ+
         mBK0wZiHRr+NN8mZ2pH3D446+LeUmpHZMCXhtnHOMaatDOYb2RiWG/hCxN73vGjMlgqb
         0ytk/Y1u4rXvhtTmbafVRs7E/md1LnGw1LSoQbLAZ7VaAVrIZcSiIFXLZEn7ldOQzLzB
         ZZwA==
X-Forwarded-Encrypted: i=1; AL+hErFgBHXn6SFD95cZYA5ypQkpX7CmmUKx29VFaPVwySDllDapio41tLJtc4IfeTxFmMH64kdIm2jP5rHC@vger.kernel.org
X-Gm-Message-State: APuU4Z9WeXYSrY7xqVd9rVaz7ghvIojugCqmvOPyVhB08Bx76hbUQ8jR
	f+EJdo8MpplV1UtJBgfJoCC7/9fY4XMW55FLF1G16kYyKs3yTijc5DYSTA0nPtevsvQkqpNa5JO
	nOP9nQ/dwcFQDAeJaR5b1sVqEMZY9sKCqFw==
X-Gm-Gg: AZFdTZelpD4SSMAMqkUsfHj2u6GA0aW6TzCiAxvU3HdixEeHCNyJWvFZjbMWtqO4enB
	LWtLiqKqrQq68Rvc4FKYnD2ZdguHK+/60qM/VTfWOIJW8MjslTGKkA1BtTZsxjrfRFUg7NLDa2m
	6JNt4htZNimQuggq64yOszKT+B2Q/9Vr1l8boCgtwf0yK7yVGZzZfN5jH+pq4NOYi93JanvQSk5
	qt6ONTqbYqbDVT+dl05Vo06k5Wz7B1C4gkD+qDia+D1okz3YNTOjeXX4jaHuVihnvtRdqAQa6Kn
	26kne0Rde7E76mQZGomjqkBHLtOptEyAzJiWRqQ3d1rPoZ9U01oke1KnKrj+GbQqL2jguBNe2BQ
	UQQ4GY8EcU4oknvM29/C5V7QvYe4W8l26cWC7kZAAvKYGJqIFcMUnFDYDp5xj9N5Tfb8=
X-Received: by 2002:a05:690e:450b:10b0:67c:17fb:ec8d with SMTP id
 956f58d0204a3-67dd3f1ac63mr164188d50.27.1794940049825; Tue, 17 Nov 2026
 10:27:29 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103194410.6632-1-ansuelsmth@gmail.com>
In-Reply-To: <20261103194410.6632-1-ansuelsmth@gmail.com>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Tue, 17 Nov 2026 19:27:17 +0100
X-Gm-Features: AclHuK8Bn8CUkBXh-_M6ikN4qkk1xw_6av3oEY3utHhv9XplUveKXs5p4Y_0xOM
Message-ID: <CA+_ehUzi7gp-4u6J6J3R_u6z7osGUe+2-e444a183fuQFDMpsw@mail.gmail.com>
Subject: Re: [PATCH v15 0/3] airoha: an7581: USB support
To: Christian Marangi <ansuelsmth@gmail.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Il giorno mar 3 nov 2026 alle ore 20:44 Christian Marangi
<ansuelsmth@gmail.com> ha scritto:
>
> This is a major rework of the old v2 series.
>
> The SoC always support USB 2.0 but for USB 3.0 it needs additional
> configuration for the Serdes port. Such port can be either configured
> for USB usage or for PCIe lines or HSGMII and these are configured
> in the SCU space.
>
> The previous implementation of a dedicated SSR driver was too
> complex and fragile for the simple task of configuring a register
> hence it was dropped and the handling is entirely in the PHY driver.
>
> Everything was reducted to the dt-bindings to describe the Serdes line.
>
> Also the property for the PHY are renamed to a more suitable name and
> everything is now mandatory to simplify the implementation.
> (the PHY are always present and active on the SoC)
>
> Also other unrelated patch are dropped from this series.
>
> Changes v15:
> - Rebase on phy/next
> - Add review tag
>
> Changes v14:
> - Drop blank lines at EOF for DT patch
> - Fix SPDX tag for move patch
>
> Changes v13:
> - Rebase on top of phy next
>
> Changes v12:
> - Rebase on top of linux-next now that clk patch got merged
>
> Changes v11:
> - Remove clk patch and move to dedicated series
>
> Changes v10:
> - Rebase on top of linux-next
> - Add review tag for DT patch
>
> Changes v9:
> - Add spinlock init
> - Add ack tag
> - Add review tag
> - Add additional comments for phys on USB 3.0
> - Add extra logic to make phys optional for USB 3.0
>
> Changes v8:
> - Squash header to clk Documentation patch
> - Address comments from AI Bot
>   Link: https://lore.kernel.org/all/20260520150912.11614-1-ansuelsmth@gmail.com/
>
> Changes v7:
> - Rework to double PHY implementation
>   (suggested by Rob)
>   Now the clk driver expose a PHY for Serdes port
>   USB PHY driver selects it
> - Rebase on top of linux-next
>   Link: https://lore.kernel.org/all/20260519220813.28468-1-ansuelsmth@gmail.com/
>
> Changes v6:
> - Fix kernel test robot (sparse warning)
>   Link: https://lore.kernel.org/all/20260306190156.22297-1-ansuelsmth@gmail.com/
>
> Changes v5:
> - Add Ack and Review tag from Connor
> - Implement Ethernet support in the USB driver
>   (testing support for this Serdes on a special reference board)
> - Use an7581 prefix for USB PHY driver
>   Link: https://lore.kernel.org/all/20251107160251.2307088-1-ansuelsmth@gmail.com/
>
> Changes v4:
> - Rename PCIe and USB PHY to AN7581
> - Drop airoha,scu (handled directly in driver)
> - Drop dt-bindings for monitor clock in favor of raw values
> - Better describe the usage of airoha,usb3-serdes
> - Simplify values of dt-bindings SSR SERDES
>   Link: https://lore.kernel.org/all/20251107160251.2307088-1-ansuelsmth@gmail.com/
>
> Changes v3:
> - Drop clk changes
> - Drop SSR driver
> - Rename property in Documentation
> - Simplify PHY handling
> - Move SSR handling inside the PHY driver
>   Link: https://lore.kernel.org/all/20251029173713.7670-1-ansuelsmth@gmail.com/
>
> Changes v2:
> - Drop changes for simple-mfd
> - Rework PHY node structure to single node
> - Drop port-id property in favor of serdes-port and
>   usb2-monitor-clock-sel
> - Make the SSR driver probe from the clock driver
>
> Christian Marangi (3):
>   dt-bindings: phy: Add documentation for Airoha AN7581 USB PHY
>   phy: move and rename Airoha PCIe PHY driver to dedicated directory
>   phy: airoha: Add support for Airoha AN7581 USB PHY
>
>  .../bindings/phy/airoha,an7581-usb-phy.yaml   |  61 ++
>  MAINTAINERS                                   |  11 +-
>  drivers/phy/Kconfig                           |  11 +-
>  drivers/phy/Makefile                          |   4 +-
>  drivers/phy/airoha/Kconfig                    |  24 +
>  drivers/phy/airoha/Makefile                   |   4 +
>  .../phy-an7581-pcie-regs.h}                   |   0
>  .../phy-an7581-pcie.c}                        |   6 +-
>  drivers/phy/airoha/phy-an7581-usb.c           | 559 ++++++++++++++++++
>  9 files changed, 663 insertions(+), 17 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
>  create mode 100644 drivers/phy/airoha/Kconfig
>  create mode 100644 drivers/phy/airoha/Makefile
>  rename drivers/phy/{phy-airoha-pcie-regs.h => airoha/phy-an7581-pcie-regs.h} (100%)
>  rename drivers/phy/{phy-airoha-pcie.c => airoha/phy-an7581-pcie.c} (99%)
>  create mode 100644 drivers/phy/airoha/phy-an7581-usb.c
>
> --
> 2.55.0
>

May I ask why this is still in this state? No report from sashiko, all
review tag...
Would love to have some feedback on how to proceed with this :(
