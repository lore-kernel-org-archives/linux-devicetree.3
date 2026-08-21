Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1AC51AF0BB
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 01:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787274509; cv=none; b=DpxzP6ixOVqlW/xjqdlHCUdIKgI3BuZATvZVPdYbf+1sFdsJTO9LGniG+pXEC3JxoUuhahnXO6gmcpDwBs8hC9/2l5I1v6fecjv9+WWWVRLNliA2WjLmyfQ1iIsGvLomIgowSZTrjq5djH47zMS1EMdluQr+fM2HcWXW8V5JG8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787274509; c=relaxed/simple;
	bh=Gw68RLwPeS7/BlwRqQdc8VJmyhFkGLZeBDVhjRX8BkU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k6LDCglrGf3GTj63HmhUGdsqbBOyM2q8Wr7EWsaJcIPFgtOln0M8RoFeRYSms4c44cnl3HzCcnji491ym60/8QD6DWdunjP84JlwmcxcTBqlFiqgoAyBwH/zpKtxW7Ou4ARD/NJ6Z5RErDeRw1NldzNCcEDfOGBh+GJtXAA/8vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lsqkw+Iq; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lsqkw+Iq"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6a0a4a28cbdso987600a12.3
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 18:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787274505; x=1787879305; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NAuxUNTNCwVmj4WdPIptKNiVBZM+Hp/Ts4jpkKyFySI=;
        b=lsqkw+IqNGPlvT2O2bq8dy5bj6dLGioNHgKOJLISOLq+jw83tEz6jstxwmqdjcW7E9
         eZCVCg8Go46xQpCbunMza0aQERWPOf8FvV7UYNmLDdEQIK9bun2eJBG999a7mkNxM/am
         +3Ip1tkHOkE1Xjzf22rytPauMa9LSuP/TynasLlKUd1Syu07APyQ2v6ukWVGe+GrNcpI
         SOedee9Y66xm7F4qrKFXBjGa2duHCAHKs4kfWFwmJNvTvqzA203eoGtn/nExkVbILnHi
         eYARwkzHoncD7b3RNC19siTwoWAAFTpPJeIlf3uX9VqhsFDhG83FElPOBipgCAXVBVoe
         KhUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787274505; x=1787879305;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NAuxUNTNCwVmj4WdPIptKNiVBZM+Hp/Ts4jpkKyFySI=;
        b=QqVoJwy5D2mhszyyFiBHcZ5WnKVzmlgCcZqnzst50hWGhWLlZX0d3nkA3n9AltqbM4
         K4vF7laYmRNSobDJb4c3z9a4TXdB7hdzgy0tsduxwQLj+Us8I3jG5lpu3NESsyMPjjAN
         sB9KmfP/xVXfVpJuY/6xtydrlZ7scS04PkdL3/rcGJcU8S09jqt/NZbfNj69QAkbb51M
         jYsn9EsibgPvXcBUowAZT/M2mviz6pttHxLNKgNecPfKMfyTqCuLLSio3SXIOjryJLiU
         /RLTzwcpVP7jJh2AtY0qsIauylOr4GZISY1LcGeI3Lzr0XA/iSP2SaQ4c2DYm+lu0vs4
         yqqw==
X-Forwarded-Encrypted: i=1; AHgh+RoFToemBuU0VFf3l0K3/AD1UyPvvcor+0oOs6mhno5uMrRKCLopnsY5oFlDAKC+wy1e4uggfK/uaad3@vger.kernel.org
X-Gm-Message-State: AFuF++kw6ES4SavHIrk+6Cz3C66OXK+MuypsYF/H/sCLfyso16uvjVy+
	Iu77AJVnNgC2K58rQUrEgsHESByhS0VQpOwMgY8u+glTxGmF3zQRwt1M
X-Gm-Gg: AR+sD12blOLLbehkprXPEbfDp9GFHhA5MhADupM8RvxxI8lXGoC/9rUsmI7DDnhRApG
	NmK2DK6YlteuvzPBc/CxRGSxVFa49OIIVuiM6IzoDyPme4KljJtRwb2jW4+EupQ1x/jxdBH9s5h
	G2h6k5jHn6yRQFYkl18DgvvBQI2FKkq8EUM+5YDD0m9AaVzXjYlb9iR3q9I29w3Yi8bmDMS4Pb9
	LeP6kvg/Mi/Zddroc6ZHpK1mJwbqb4i6lZbZKxphi8X/1rYEC1ffess5hy3djpuCS2d4zRwpF6E
	g77P1/5kJ1mVzPdExNWJCwvz9Pva8BElUAuk419Re5Dnx8pruxI8C3Es5Kyln2oGHI5koen4xGn
	6c6fCSWO1GMbcxvr+PKLCDZ+l+jeL8RKE6kxuq54/y0B9TCbvljLPpK1pGONwj2DzpsQHzXNvDJ
	70VHQ3T672daTup7/jqZl2Fr+2pIn1U51w45c6U0mJSfDf/+Qu944eEjyifLnjcS1gXWYfc2PIO
	M6y+vlw+jTrKSXAopNjxNE9jJi0RTd+mHa6G1TMeKfXjK/hyqqflUi6RJnTYoptcw==
X-Received: by 2002:a05:6402:3242:b0:698:3469:fa99 with SMTP id 4fb4d7f45d1cf-6a42eeaf740mr2519534a12.0.1787274505008;
        Thu, 20 Aug 2026 18:08:25 -0700 (PDT)
Received: from localhost.localdomain ([151.251.247.22])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff1563c5sm3913104a12.14.2026.08.20.18.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 18:08:24 -0700 (PDT)
From: Georgi Valkov <gvalkov@gmail.com>
To: briannorris@chromium.org,
	johannes@sipsolutions.net,
	andrew@lunn.ch,
	krzk+dt@kernel.org
Cc: francesco@dolcini.it,
	johannes.berg@intel.com,
	kees@kernel.org,
	miriam.rachel.korenblit@intel.com,
	wenst@chromium.org,
	rafael.beims@toradex.com,
	avraham.stern@intel.com,
	error27@gmail.com,
	s.kerkmann@pengutronix.de,
	gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com,
	robh@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	chunfan.chen@gmail.com,
	arend.vanspriel@broadcom.com,
	peddolla.reddy@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	stable@vger.kernel.org,
	gvalkov@gmail.com
Subject: [PATCH v6 1/3] dt-bindings: net: wireless: add flag marvell,invalid-reg-hint-in-rom
Date: Fri, 21 Aug 2026 04:07:26 +0300
Message-ID: <20260821010728.45065-1-gvalkov@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

WRT3200ACM and WRT32x routers always report a fixed US regulatory domain
from the mwifiex ROM, which conflicts with the platform regulatory
configuration on units sold outside the US market. For example:
- phy0 mwlwifi 5 GHz, hard-coded region 98 EU mapped to FR
- phy1 mwlwifi 2.4 GHz, hard-coded region 98 EU mapped to FR
- phy2 mwifiex 2.4 and 5 GHz, hard-coded region US

When the system boots, it detects a conflict between the user selected
region and the radios, e.g. BG FR US, and applies extreme restrictions,
preventing phy0 from starting on any DFS channel. phy2 works.

Add a device-tree flag, which allows affected devices, where the radio
conflicts with the platform to ignore the incorrect regulatory hint in
the ROM of the radio, so the platform regulatory domain can be used.
This does not allow the user to change the regulatory configuration of
any radio. It only allows phy0 to start and operate according to its
certified configuration.

[1] https://github.com/kaloz/mwlwifi/issues/173#issuecomment-307879699
[2] https://github.com/openwrt/openwrt/issues/9956

Cc: stable@vger.kernel.org
Signed-off-by: Georgi Valkov <gvalkov@gmail.com>
---
v6:
Rename flag:
marvell,ignore-regulatory-hint -> marvell,invalid-reg-hint-in-rom

Clarify commit description:
The patch series allows affected devices, where the radio conflicts with
the platform to ignore the incorrect regulatory hint in the ROM of the
radio, so the platform regulatory domain can be used.

This does not allow the user to change the regulatory configuration of
any radio. It only allows phy0 to start and operate according to its
certified configuration.

The change affects only platforms which explicitly define this flag, and
helps overcome the incorrect behaviour of proprietary radio firmware.

Rearrange patches so that the flag is implemented in the driver, before
being added to the board for WRT3200ACM.

Link:
https://lore.kernel.org/linux-wireless/20260728103536.25012-1-gvalkov@gmail.com/T/#u

v5:
1. description: remove tag Tested-on
2. add #address-cells = <1>, #size-cells = <0> to fix a warning:
arch/arm/boot/dts/marvell/armada-385-linksys-rango.dts:183.3-13:
Warning (reg_format): /soc/internal-regs/sdhci@d8000/wifi@1:reg:
property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)

3. description: add info about testing

v4:
1. Add binding documentation for flag marvell,ignore-regulatory-hint
2. Add dt for sd8897 and move the flag there, I used sample from docs
3. Use device_property_read_bool in the driver

v3:
I implemented and tested a better approach with no board specific code:
1. check for a device-tree flag in mwifiex_register_cfg80211in()
  !of_property_read_bool(of_root, "marvell,ignore-regulatory-hint")
2. add this flag to the root device tree of each affected board
Currently this affects only armada-385-linksys-rango.dts,
because Linux has no dts for venom. OpenWrt will take care of that.
This approach is more flexible and scalable, because the flag can
also be used in other drivers, e.g. mwlwifi (not part of Linux).

v2:
Replace the compatible device names, which are currently only available on
OpenWrt with board names which are available on both Linux and OpenWrt.

 .../devicetree/bindings/net/wireless/marvell,sd8787.yaml    | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/marvell,sd8787.yaml b/Documentation/devicetree/bindings/net/wireless/marvell,sd8787.yaml
index 930b700b73d0..9f905ef5c2c0 100644
--- a/Documentation/devicetree/bindings/net/wireless/marvell,sd8787.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/marvell,sd8787.yaml
@@ -59,6 +59,12 @@ properties:
     description: Calibration data for sub-band 3 in the 5GHz band.
     maxItems: 502
 
+  marvell,invalid-reg-hint-in-rom:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      The regulatory hint in ROM conflicts with platform configuration.
+      It should be ignored, so the platform regulatory domain can be used.
+
   marvell,wakeup-pin:
     $ref: /schemas/types.yaml#/definitions/uint32
     description:
-- 
2.55.0

