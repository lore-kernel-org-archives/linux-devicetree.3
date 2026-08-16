Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [71.19.156.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E5C1EE7B7;
	Sun, 16 Aug 2026 04:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=71.19.156.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786856208; cv=none; b=b86HGRnM9wsbITOCitQfgBgOh79LlcTdrTQahbgh6k+aWjP1QqNDqWOL4S3J2qwHzi/JR7pzHkrpnCWmuBfu2olaEWy6lwJzktv7COLX2g80eQQCJki7KNsSusOUwGNQFmns+ikAI/wcln60mK5twqAk3ghNqNMkH90EGhoWegk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786856208; c=relaxed/simple;
	bh=9FBVam8b8LSsssuQccOa6a7z83cGvpAyTw53BxOvGuM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EC/K50mcodAI97sGCmrRtasWmwovVlOjcU9jklzlPr3wvcyLHj0ZTOkwudE1vClRD/6qUD5ELG0WIT1+hQX25bi/m7BchkjslNCU/iWnhQmUzu7xab9jlPdzbKRFjWkCJRWL60EcgXHi9IWfncUOqNyxMwQ6h6YwTwO+CmcjgzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bewilderbeest.net; spf=pass smtp.mailfrom=bewilderbeest.net; dkim=pass (1024-bit key) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.b=ZjlFHuJf; arc=none smtp.client-ip=71.19.156.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bewilderbeest.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bewilderbeest.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.b="ZjlFHuJf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1786855758;
	bh=SH81kaqs40gwxAAYK6f8GxK6WGlHqHpk/2gAgBEj770=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZjlFHuJfDQ2TepIAgft9Ee5sOxZappA4HKrXF7EdXh3p9oLlcHa/3wCqhUbm0axp/
	 O4zVHjBiwlxDsfGeBcS942tSyzKkeYydyunzRWbvhaKirGR8ItDJWyXWkha3HLRxvu
	 siEXmClJO9dDm6J51BZHy47IaDiKrGIXZgMFcCvY=
Received: from hatter.bewilderbeest.net (unknown [IPv6:2602:61:71d1:5c00::171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id CF3CF4C;
	Sat, 15 Aug 2026 21:49:17 -0700 (PDT)
Date: Sat, 15 Aug 2026 21:49:16 -0700
From: Zev Weiss <zev@bewilderbeest.net>
To: Tan Siewert <tan@siewert.io>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] ARM: dts: aspeed: add asrock x470d4u bmc
Message-ID: <8b7dcb07-2dfd-425f-8ff3-06114e45c676@hatter.bewilderbeest.net>
References: <20260812-ts-x470d4u-v3-0-c8e266f1663b@siewert.io>
 <20260812-ts-x470d4u-v3-2-c8e266f1663b@siewert.io>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260812-ts-x470d4u-v3-2-c8e266f1663b@siewert.io>

Hi Tan,

Looks good overall to me, just a couple small notes below...

On Wed, Aug 12, 2026 at 01:28:27PM PDT, Tan Siewert wrote:
>The ASRock Rack X470D4U X470D4U is a single-socket X470-based microATX
>motherboard for Ryzen processors with an AST2500 BMC and either 32MB or
>64MB SPI flash.
>
>This mainboard exists in three known "flavors" which only differ in the
>used host NIC, the BMC SPI size and some parts that may be un-populated.
>
>To allow the use of the full SPI flash, add two trees, one of which has
>the 32M layout with the base config, and a 64M tree that includes the
>base tree.
>
>Signed-off-by: Tan Siewert <tan@siewert.io>
>---
> arch/arm/boot/dts/aspeed/Makefile                  |   2 +
> .../aspeed/aspeed-bmc-asrock-x470d4u-data64.dts    |  15 +
> .../boot/dts/aspeed/aspeed-bmc-asrock-x470d4u.dts  | 381 +++++++++++++++++++++
> 3 files changed, 398 insertions(+)
>
>diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed/Makefile
>index 6b68671f9379..e27d33e85fb2 100644
>--- a/arch/arm/boot/dts/aspeed/Makefile
>+++ b/arch/arm/boot/dts/aspeed/Makefile
>@@ -15,6 +15,8 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
> 	aspeed-bmc-asrock-paul-ipmi-card.dtb \
> 	aspeed-bmc-asrock-romed8hm3.dtb \
> 	aspeed-bmc-asrock-spc621d8hm3.dtb \
>+	aspeed-bmc-asrock-x470d4u.dtb \
>+	aspeed-bmc-asrock-x470d4u-data64.dtb \
> 	aspeed-bmc-asrock-x570d4u.dtb \
> 	aspeed-bmc-asus-kommando-ipmi-card.dtb \
> 	aspeed-bmc-asus-x4tf.dtb \
>diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x470d4u-data64.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x470d4u-data64.dts
>new file mode 100644
>index 000000000000..6f11aeab087c
>--- /dev/null
>+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x470d4u-data64.dts
>@@ -0,0 +1,15 @@
>+// SPDX-License-Identifier: GPL-2.0+
>+
>+#include "aspeed-bmc-asrock-x470d4u.dts"
>+
>+/ {
>+	compatible = "asrock,x470d4u-data64-bmc", "aspeed,ast2500";
>+	model = "Asrock Rack X470D4U-series BMC (64MB store)";

Nit: for consistency with how they spell it, and (at least *most* of) 
the other aspeed-bmc-asrock-*.dts files, I'd suggest "ASRock" instead of 
"Asrock".  (And IMO s/store/flash/ would be a touch clearer.)

Also, looks like the other nearby DTS files pretty consistently have 
compatible & model in the opposite order, so matching that might be nice 
too.

>+};
>+
>+&fmc {
>+	flash@0 {
>+		/delete-node/partitions;
>+#include "openbmc-flash-layout-64.dtsi"
>+	};
>+};
>diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x470d4u.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x470d4u.dts
>new file mode 100644
>index 000000000000..80fb2b7c1e0c
>--- /dev/null
>+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x470d4u.dts

<snip>

>+
>+	fan@3 {
>+		/* FAN4 (6-pin) */
>+		reg = <0x03>;
>+		aspeed,fan-tach-ch = /bits/ 8 <0x03 0x0b>;
>+	};
>+
>+	fan@4 {
>+		/* FAN5 (6-pin) */
>+		reg = <0x04>;
>+		aspeed,fan-tach-ch = /bits/ 8 <0x04 0x0d>;
>+	};
>+
>+	fan@5 {
>+		/* FAN6 (6-pin) */
>+		reg = <0x05>;
>+		aspeed,fan-tach-ch = /bits/ 8 <0x05 0x0e>;
>+	};
>+};

Just to confirm, skipping channel 0xc here is intentional I assume?  
(Most other related platforms have them contiguously numbered, but not 
all, so another slight oddity wouldn't be too shocking.)


Thanks,
Zev

