Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8852523392C
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 15:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779290099; cv=none; b=Kq1iM1seUJmTHdIKpnvTsZ1wHXPyIq63uMIo2ezVMltMgwVM1YEmoNiAuiYgaYWLrVwxjCNmkYJBxTZeXVLrlX9adLsFsa+vEZ6T87tIXV8MbEIJiKRiZb1tkADYhsS6pI0vc4w2TYj2joRvutjKSyLgo9n6mhLRYLk58kXoqZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779290099; c=relaxed/simple;
	bh=y5jTeM7iQS9GtServCM6rYMm9uUi7c5h4UjEU/9BfSQ=;
	h=Message-ID:Date:From:To:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GYrjTjLBonCyLZ7rNaMfBqIPvU0VnjB3/5Ysqbw9Ef2C7ldTI7zCnUcWzlhEGLWTPA6pIZEj9kk8GgRe0b+WqlFV1mS3LWZ+JESD7BLVN6yG6P/VnrDotTfjP2jWh4WGodFP7SIlCywOHTT9pOgSYk/81VOpWc9YX0VNFIGB99M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mEwrDqi4; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mEwrDqi4"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso30813035e9.0
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 08:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779290096; x=1779894896; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:to
         :from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ccZEEEBlnDZ7RGFHJwE5hSCMMi66BiukOOfPa72Eyrc=;
        b=mEwrDqi4GxOigY5IB1YbzbTHpRJtSpCNvHStI1fEa7QFsEhmk91EyvdaALnrYd+BV+
         TMRt6/INrNtUWMaQwbpXN7btFHr/ZMriR75WTO1hExxs0TTbdQY9cxgB5uZaVzPuGI+w
         ey8fwh7qVnenYQTkytJoRg5rbwrrSA99yMO+jhVo+4cX3/MGRwjOD67ykIEpdzts8s4B
         ZRTmEYo1+ambPXUTTB3EKQwMvw1KyBJFIpsbZOHxueuorD6LB7PydueN7p9rJn4fIetu
         aIn3jcuz/GrxtnI0kibysjtEYMo9eTBTrNrRYQKfF6NY00JX0/QKA6TFEzvnPepaT2QW
         5tMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779290096; x=1779894896;
        h=in-reply-to:content-disposition:mime-version:references:subject:to
         :from:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ccZEEEBlnDZ7RGFHJwE5hSCMMi66BiukOOfPa72Eyrc=;
        b=hY6EUX6v/GtuuxZrCI8W4sj3vzw+TM9h7K56USekoWzpnA3JZHFbbKEDdeZ28q7u9k
         PG/4j8DFUCjOyZ2Gla/bigHQ6F7ayQXMe1umwgSe05lC7lsiafEJnfoh0SPJSqPllrTD
         fyv1/bngQJGqoLLxtUPi6KyxYEkqhbtBF8ULI9wgRsCIzvvpYixzbBrz9Q2oWsu1EI7c
         iSLbIkWx/d3gt+dLQ5rJbE2zZ7i0LkGfcmywEr2AXKiBOKsnTxtysGQzHhewKKxVPBi2
         dbpS9VEqSX4anec4FrGabHZnkhmh7lU+7gYaiAn8CQ1TTylLgGgMjsoT31Vk0W/V0UkZ
         99sA==
X-Forwarded-Encrypted: i=1; AFNElJ/fl82/g2b+ckPmt1rV7duO8oLVxCMlhmgXoNfNulQJBilmUSkbUVnOgUogjhCt82Hgjz7j74bBTOiw@vger.kernel.org
X-Gm-Message-State: AOJu0YzV+/MVV0PDQW9B+pR6a3N43t8eyAjzHKGU6r8wZ0tsYD25U9gI
	hTL7JtpWgVqStAK6nIa6rOvgQf2ZJBvEgGi7OwdKaKj6DxDNSUICBT4F
X-Gm-Gg: Acq92OFVUVzc26a71MgBCp2AZWK5JPtba21W7/L7EFl3qB4fCegSjBL3xNejm+Muuft
	mtpteZWp3+iqn/Bqx9f+C/d3U1GM4ss9BKoMKHbI2qRM+dNcnmPs01htP3jZ6aUJYNHpQ5raYnX
	hR2S4cDUYqpXR58Ij7SPmE/574paev4mEH2TgDX495bi+oCnkQd6yKbT75UW/UwpX/aecMgw5Fx
	oIZD3Hd1lg3LqCwyPvCWU80ycUv37tDjpWa55m4keenT5sfyRN98KBPNnMS808qooy6f/kwWh73
	hxdit0GT36J868O2SnbazPIon7Z8uXNmWvInrQPDaiss7tigY0R+UgVM/pqrrKU+YM7HiWO65FR
	OLJgdBBc4HschR67Lsxwvmj+eg1xD8EIRDwdpx5ThQeDGSd5DpwuaDz77pFKgIQouekS9OP2Fn0
	Kw2pPRylxgu75A0Jjx4LrKt/dAx0elYMTOnIeEhR5gArF6nWLoCbWGSSvew953SQ==
X-Received: by 2002:a05:600c:a405:b0:48a:52ce:a4b1 with SMTP id 5b1f17b1804b1-48fe60dd5e8mr371333235e9.15.1779290095645;
        Wed, 20 May 2026 08:14:55 -0700 (PDT)
Received: from Ansuel-XPS. (host-79-22-5-99.retail.telecomitalia.it. [79.22.5.99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe585absm136106415e9.19.2026.05.20.08.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 08:14:55 -0700 (PDT)
Message-ID: <6a0dcfef.b6ded719.106719.1acd@mx.google.com>
X-Google-Original-Message-ID: <ag3P62h_xNArpB2V@Ansuel-XPS.>
Date: Wed, 20 May 2026 17:14:51 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org
Subject: Re: [PATCH v8 0/5] airoha: an7581: USB support
References: <20260520150912.11614-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520150912.11614-1-ansuelsmth@gmail.com>

On Wed, May 20, 2026 at 05:09:05PM +0200, Christian Marangi wrote:
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
> Changes v8:
> - Squash header to clk Documentation patch
> - Address comments from AI Bot
> 
> Changes v7:
> - Rework to double PHY implementation
>   (suggested by Rob)
>   Now the clk driver expose a PHY for Serdes port
>   USB PHY driver selects it
> - Rebase on top of linux-next
>   Link: https://lore.kernel.org/all/20260306190156.22297-1-ansuelsmth@gmail.com/

Typo for the link. It's:

  Link: https://lore.kernel.org/all/20260519220813.28468-1-ansuelsmth@gmail.com/

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
> Christian Marangi (5):
>   dt-bindings: clock: airoha: Add PHY binding for Serdes port
>   dt-bindings: phy: Add documentation for Airoha AN7581 USB PHY
>   clk: en7523: Add support for selecting the Serdes port in SCU
>   phy: move and rename Airoha PCIe PHY driver to dedicated directory
>   phy: airoha: Add support for Airoha AN7581 USB PHY
> 
>  .../bindings/clock/airoha,en7523-scu.yaml     |   9 +
>  .../bindings/phy/airoha,an7581-usb-phy.yaml   |  62 ++
>  MAINTAINERS                                   |  11 +-
>  drivers/clk/Kconfig                           |   1 +
>  drivers/clk/clk-en7523.c                      | 216 ++++++-
>  drivers/phy/Kconfig                           |  11 +-
>  drivers/phy/Makefile                          |   4 +-
>  drivers/phy/airoha/Kconfig                    |  24 +
>  drivers/phy/airoha/Makefile                   |   4 +
>  .../phy-an7581-pcie-regs.h}                   |   2 +-
>  .../phy-an7581-pcie.c}                        |   6 +-
>  drivers/phy/airoha/phy-an7581-usb.c           | 554 ++++++++++++++++++
>  include/dt-bindings/soc/airoha,scu-ssr.h      |  11 +
>  13 files changed, 894 insertions(+), 21 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
>  create mode 100644 drivers/phy/airoha/Kconfig
>  create mode 100644 drivers/phy/airoha/Makefile
>  rename drivers/phy/{phy-airoha-pcie-regs.h => airoha/phy-an7581-pcie-regs.h} (99%)
>  rename drivers/phy/{phy-airoha-pcie.c => airoha/phy-an7581-pcie.c} (99%)
>  create mode 100644 drivers/phy/airoha/phy-an7581-usb.c
>  create mode 100644 include/dt-bindings/soc/airoha,scu-ssr.h
> 
> -- 
> 2.53.0
> 

-- 
	Ansuel
