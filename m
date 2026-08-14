Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9600C44A40F
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 12:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786711881; cv=none; b=FwujflciXst+iVO/CCd+kwOk6RTzZ3DrOX2qw6B9vUxjLZdBKs4tOAcwdExdc1XyOqLuJhgQPE6Jv2cWbfXkH+2SdE2ygSn7Vxhb0HWGnlBPPqIIijxI2zop/z7bZEW09atwc0eIHQ/kAO+BxzIkE2dim04IGaSPYs6rk1HyZlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786711881; c=relaxed/simple;
	bh=6nWgVQ6K1iD5+9XLXAkupXMvKGBCS3eLIaZ7Es8WIT0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SDSQ/9Jm2upGuTzlIK/3n8gnxEfahMwDHesED6iHVUpWmFzMzN99FIr7Lm0wGRSjao1cT34TQ3YlgPLOBYlCIlsA81rE6fDBZ2+/2VTux3jWEoxFfTL+ZigAeeKyPQ4Fwo6hCaxYUfWWwgywuadvumarBNqo4Oe9SiMn18OVCfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NcUyIm0G; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NcUyIm0G"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso7200215e9.1
        for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 05:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786711875; x=1787316675; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d7kfFCn+GNg9NumksCvYfbd5lgR/VvSMlydTU1rt7oM=;
        b=NcUyIm0GyPHgJzCrTbVC2k1UJgPukP3L1ARr2hrksAqbC9D5Yl8IPIqAh8A8OuTK0B
         t7QIMBOCD2n3qJXWpw6peT6Q/U0I6imD/By9kspLeMW8ekQPT9NsUTdi1MvXkF0wKDFl
         xBCY3xt8f+lsjsgWj2TLmmPn0Rbk2mUcUqHvjr6tw5fazcyyXiUy8EYfBaqY8LrxQgLy
         w0ZQz/LGniq+kh1dR5JA8pM+kEb180UxJGLQ/6r79i3p/v/LDJuQMKUFTvhz9pIqpnLF
         hMFJNGIcjJIWLelMbY2NsZbW7XbjDQt/vdp1kolXo28nqNc+Rche1xpe8wLTSJpjUtGp
         lI3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786711875; x=1787316675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d7kfFCn+GNg9NumksCvYfbd5lgR/VvSMlydTU1rt7oM=;
        b=CPifCSpjMGptp8QUNLPhNrLNUE4xC5Q5HgedAC7XDOP8xz9Ee/UFK3TdtQPsC2GeMR
         HyqREtMhop7VeVUMUVP3D6r4DbHbsQfbPfJsmdEHkb/hlRDMpQf8Z3lHhGmuuf2vJU5m
         19DRWCu2IoH2GDrhfrntHcsDXMeTi/zFwrwfSFnZyxjuCmnq70WdtTiSdfTnyW2GKBu2
         gapIaHwxvgaPhqIKubRy40ree2vKdZGDZHDutnYmQcYz+C3Im4k6IunSsTMPffRJrFnL
         fvKLlrycrSJnKn1Btppz6zgbwMiKIc9g8TjxcmoFFG6c24KeXRrGZ3FzjUaIXwidDTUz
         rmBg==
X-Forwarded-Encrypted: i=1; AHgh+RqYmPa0K1Q7IEDUH7t9oS3Wj6Xv94yX/AZhsCetWWjY4F6QlObcSRQVr9uJZygT3uohbQm6nA2ycUvI@vger.kernel.org
X-Gm-Message-State: AOJu0Ywn3LRo1rYv9lPYTefvkesl/zo4JrdKL4SjvVuriVXcKinZljOH
	SGt9XFIWVmgvMpzxJ0rmNdF0YNiWhqeJyvKnQyeZ51YKqwEWk93+F8IX
X-Gm-Gg: AR+sD11zCwC3eahyMPJgNLpfrdr/s58ARvNK7TNMJ/ifmG8jFc9xjcgudH/XvjsSJqd
	jXz5izJtsoCJlwN1MfLUCI0/RFPPvyK0cdetA9NsZRnqAXoHxT9Xpa9bzuQFQ3eaHYK32//rhLD
	hJkIqok1ytHjPFYjPF/BiDMRhSo/iftmu6ZbdNfrDZEHk3ZXvJ4qVzIn/5cXGsBF8bw+0sxeCHy
	QdGRdoAvQ8Urq8LV24yRqp5jjfzAnAmcY9G3/DazjPNaevJprvNI3C/btnB/mHYGu/dZGwEusaj
	lcJJTaDwVT2NfNyjO8YpZLaTKL1+87DvTJthjy+pAeUZaQC+U5/Mxnpu9y8PmL/Rh306PUXc3gh
	7QeIojAJLWUfe71VD5zA9BhV+gMcxfqwaDCrF2Fbo5Smb1zsfCvLoxxeQNcRZtULI5bUT3suI7/
	q2PDoyi4SUyDAeHCnPWPPEYmsJNRDGZ7Whof8JreMcbznqw3Qrw86/6Luj6h5/XMK9AzY9l//WL
	KAUU/r5iwkVJf9wN+tP4AHaTyQrtLWp5S4KgUputz2K4iDlwVYaxHeW8kgJNsIqRw==
X-Received: by 2002:a05:600c:6986:b0:499:79ba:ed92 with SMTP id 5b1f17b1804b1-49988c5efe7mr59441285e9.13.1786711875179;
        Fri, 14 Aug 2026 05:51:15 -0700 (PDT)
Received: from localhost.localdomain ([151.251.241.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49988ae8b62sm49727315e9.5.2026.08.14.05.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 05:51:14 -0700 (PDT)
From: Georgi Valkov <gvalkov@gmail.com>
To: briannorris@chromium.org,
	johannes@sipsolutions.net,
	andrew@lunn.ch
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
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	chunfan.chen@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	stable@vger.kernel.org,
	gvalkov@gmail.com
Subject: [PATCH 1/3] dt-bindings: net: wireless: add flag marvell,ignore-regulatory-hint
Date: Fri, 14 Aug 2026 15:50:23 +0300
Message-ID: <20260814125025.90522-1-gvalkov@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <anoYr9H4KojJv-aZ@google.com>
References: <anoYr9H4KojJv-aZ@google.com>
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
preventing use of 5 GHz and DFS channels. This also affects phy0.

Add a device-tree flag, which allows affected platforms to ignore
an incorrect regulatory hint from ROM, so userspace can set the
correct platform regulatory domain.

[1] https://github.com/kaloz/mwlwifi/issues/173#issuecomment-307879699
[2] https://github.com/openwrt/openwrt/issues/9956

Tested-on: WRT3200ACM, OpenWrt
Cc: stable@vger.kernel.org
Signed-off-by: Georgi Valkov <gvalkov@gmail.com>
---
Thank you Brian and Johannes!

> Just because you found it difficult doesn't mean we should accept the
> wrong approach.

I agree. Guidance and careful inspection helps reach a good solution.

> IIUC, you're using a PCIe-based WiFi card, and that's enabled in
> arch/arm/boot/dts/marvell/armada-385-linksys.dtsi:
>
> &pcie1 {
>         /* Marvell 88W8864, 5GHz-only */
>         status = "okay";
> };
>
> &pcie2 {
>         /* Marvell 88W8864, 2GHz-only */
>         status = "okay";
> };

No, you are referring to the main radios, which are not part of these
patch series. Would you allow me to also add the flag to them? Their
driver is not part of Linux so only dt bindings need to be added.

The changes here target the third radio:
- phy2: Marvell 88W8887 802.11ac/b/g/n 2.4 / 5 GHz, region US
- compatible = marvell,sd8897 works

I cannot confirm if any other devices from the family need the fix
or not, so I intentionally target the board dts, and not the include:
armada-385-linksys.dtsi

> Side question: did you consider Jeff's suggestion from v2, to try the
> 'reg_alpha2' module param? It might already do what you need, and it
> only requires you configure your OpenWrt builds properly, I think.

A universal solution is better than targeting OpenWrt only.
And unfortunately I have no idea how to implement this.

> I'm not sure what you're saying here

In v3 I wanted to reuse a flag for both drivers. Using a root flag was
objected, so in v4 I added a flag for mwifiex, and I would like to add
the same flag to mwlwifi later.

- driver
dev_name(adapter->dev) = mmc0:0001:1
dev_fwnode(adapter->dev) = wifi@1
marvell,ignore-regulatory-hint = 1

- procfs
/proc/device-tree/soc/internal-regs/sdhci@d8000/wifi@1
compatible = marvell,sd8897
marvell,ignore-regulatory-hint
name = wifi
reg

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
index 930b700b73d0..5f235cb9f3e5 100644
--- a/Documentation/devicetree/bindings/net/wireless/marvell,sd8787.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/marvell,sd8787.yaml
@@ -59,6 +59,12 @@ properties:
     description: Calibration data for sub-band 3 in the 5GHz band.
     maxItems: 502
 
+  marvell,ignore-regulatory-hint:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Ignore an incorrect regulatory hint from ROM,
+      so userspace can set the correct regulatory domain.
+
   marvell,wakeup-pin:
     $ref: /schemas/types.yaml#/definitions/uint32
     description:
-- 
2.55.0

