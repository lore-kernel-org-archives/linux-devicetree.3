Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF585336884
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 11:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788781301; cv=none; b=mmFqNYvUiezrfnxoYXHx3Tn/jLYbteul2MsY0WFBrZTJ8RA70AqWyjiRWpTFX8fEgOcZr+mOffTssVfLtxQ6VqZXTvovtsp/3a0fL5BwxX4efakWhv0etX1FKLCJS0NxK/9mK72EUyBAM6ErDJU+gX8TIfaBQmLXrT7WeLQEaZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788781301; c=relaxed/simple;
	bh=b7Hmk4cNyp3rrqJdAEe17kwY+5NGv4bOQ4fm+78tCZw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uwmaUZ9HvElEda/PBdXbS39xbXyJ+JhF6EbMck08PuOd90VYmFEsCpjEBh9JK4FbdJ0pZpqhcg0LZjxJ19RLDEu8aO8I7i/lAsXZtGElGi/jBaELLoI+BYyx9RlPqWGL8Jn4Fz/kTiPfVjdu2dLNH9HuxxFPiYhel9SFq4s+uxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WhC0pmmq; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WhC0pmmq"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4859245e493so1496898f8f.1
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 04:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788781298; x=1789386098; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WQUBOPYyowxH3WcaM03g9fGKTEt+Ia5xxYG+47H3YdM=;
        b=WhC0pmmqIDI2P741nJW8oAplTD0O9UXAfYUliLL8STcuEeFL0KzW5Ix6D6DkHtu+G/
         +17IFPnAa3X3WMNsL5tc7P4zGH9USu2uGmyKce1TS8BXkKRxjquvyLpFw8KAveF1bopa
         7zvHMjnYzsWCHEUu7WAnsjTV4D3P3WP27j5yLQwMENSSmUpSg98td4YOB74LHG1lyLmY
         /Ifv+UsU1ZMyffSwV+Zj0bUU8gqiwJkZ4AU2q8Z0cD+8GKmJXEhbazTRK64jJqjoe7B1
         dlFwOsIyj5bjV3JZomwj+JSi/DlTBQZeFVtsr6N1xrMEF6zcNqKZ2uNxU36mTCw86lit
         wckw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788781298; x=1789386098;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WQUBOPYyowxH3WcaM03g9fGKTEt+Ia5xxYG+47H3YdM=;
        b=BkCg9GG1VGXZwwfZ19fmMY2xpPgAiIpjXRb2FCsbaZoLhWIXn/TZd3GJJwoJD0MRgd
         V94wWDU0EuakHo2u71Apk16IG6f7jsTqmH8FIDSIO48ds3M7RC07UBXZN7JJEby85s5V
         Nd5JdW9NEu8S+kQOeInx2PWcp9Lx6ghRCRHedcgXNFZ+viFujmmvYcNr/VxzGHui2yM5
         ZEmpm4VcSH0qk4ChIVB4ouf5IEoaVJhYVi02GjFNA4OnKV8QNcuHXCEOtwJf+io+H5rJ
         MfWNXXHnkrIuUtEy7jHX/MaZEa2Wuqs1M/n1c9yfuxZ8t/P8HkYbSyrIEBfRalSMvBAj
         ePgg==
X-Forwarded-Encrypted: i=1; AKwUvBy/2DlrKuYcjpFauQzbEQrwNqffuq1kE+I4K2SaTVsugKULRO82UxvaZM4tIfp+CsKVkijq+nupfFKm@vger.kernel.org
X-Gm-Message-State: AFuF++mNvz5PM1FuqRDX0lDwO8aseKOY9NPPcdxnr8QGQEWKJvEFKABW
	Z0k65lBg5D5xbXGX9OmZPv/WF7Wxr5sTW2cLo9uYPF0kOhqJHpiNeUIe
X-Gm-Gg: AYBFou05PMGyaW4XVt7cQjWQxNvmZOaXA27pvMc7gGTAjnmF273ED11jb0nNJnVtOyX
	khnC9WJSyEShNccIhyCPd5M9ZQoK9xwHtOAjZnGiONVw/f9JGg6WulgfRGeJ8PeQH8Vskd8eaeW
	BSMXyUmyNY1bbjzxeN+a7FsjGhWw390p35oZu+ec3H8OcGgKe6BZHKzuSBhvGSNwTusUaty2ftO
	O+jUYZfftzK2JGiN8Fh6MPLkAxcdfCQuR7zNjTVU5R+IbeD2nxlVj4g9a0mNDwOogtfVq4qC4bn
	csexP8xbnfa72xcg7s7V9TwG2ffVOGFkoLaE51j5xlgz9pEXEOyAhbYVRikphx60hFARYAqqWsh
	oCIF6JXZYKml5+xDtDoTrdUmp3XBL1W8OonZ3OmgUJhZDc9SwoD8Zf+HKmkk0yLeXxVA4cOiFyY
	YMK7tgseuCS1936uqVRUYqEvSZ73ccp00s5ETadM3t9BUFPkNvbnmU5TavQPLKf6Vnds0cvSKfV
	zAuvu1g9LmQmxZCPIWt5Z1jmbG9sygG5JUnOUlmv0u+EZahVz63d6jG/KQRAvY=
X-Received: by 2002:a05:6000:712:b0:485:8a47:5b9a with SMTP id ffacd0b85a97d-4858a475db8mr21110822f8f.55.1788781297779;
        Mon, 07 Sep 2026 04:41:37 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858d2693e8sm26763182f8f.3.2026.09.07.04.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 04:41:37 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Mon, 07 Sep 2026 13:41:30 +0200
Subject: [PATCH 1/4] arm64: dts: freescale: imx8mp-verdin: Add NAU8822
 Bridge Tied Load
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-verdin-imx8mp-non-camera-overlays-ready-v1-1-ca0c63c2994f@toradex.com>
References: <20260907-verdin-imx8mp-non-camera-overlays-ready-v1-0-ca0c63c2994f@toradex.com>
In-Reply-To: <20260907-verdin-imx8mp-non-camera-overlays-ready-v1-0-ca0c63c2994f@toradex.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Add a device tree overlay for configuring the NAU8822 loudspeaker
outputs as a Bridge Tied Load (BTL) output on the Verdin Development
Board.

The overlay adds the codec property for the BTL-capable output
configuration, where the two loudspeaker outputs are combined for higher
output power.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile                     |  4 ++++
 .../boot/dts/freescale/imx8mp-verdin-dev-nau8822-btl.dtso  | 14 ++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 984642146dd9..8c6fdeaf12af 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -728,6 +728,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw73xx-2x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw74xx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw75xx-2x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw82xx-2x.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-dev-nau8822-btl.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-ivy.dtb
@@ -735,12 +736,15 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-zinnia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-nau8822-btl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-zinnia.dtb
 
+imx8mp-verdin-wifi-dev-nau8822-btl-dtbs := imx8mp-verdin-wifi-dev.dtb imx8mp-verdin-dev-nau8822-btl.dtbo
+
 imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtbo
 imx8mp-evk-lvds0-imx-lvds-hdmi-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds0-imx-lvds-hdmi.dtbo
 imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev-nau8822-btl.dtso b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev-nau8822-btl.dtso
new file mode 100644
index 000000000000..e94c60381c4e
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev-nau8822-btl.dtso
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Enable Bridge Tied Load (BTL) speaker mode on the Verdin Development Board,
+ * combining the two loudspeaker outputs for higher output power.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&nau8822_1a {
+	nuvoton,spk-btl;
+};

-- 
2.43.0

