Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D8D38F949
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 08:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785398702; cv=none; b=QLXqwSbMFl/Ua5csz8BiGPIGFd+DIiLrGsn7WIP0wozqg/ngJ0l3jbO91s6O2uVDUPnJmJhtjRzq5YZQlO7XazaxVa0vbbtxpvs5mqOpRXvOMsRun2kBg+/YJ8/2wRxAMEQ20RfBuBdDIrXoIyfcAXaoGG/LlUedW0a/JkSyDrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785398702; c=relaxed/simple;
	bh=MMhFBx3TD2czG+25iLyuy0m4zdD4fN8WtBGrjjmP3aA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=giJjr90ZcQbUvGTRq8ZvvNMUSzYIWTPEgvAlia7H94l4bkla7+wmamU0vzUlo1BOft5WxM3IgSvcjDWpCBC4bheNjzDHNf+Rb14yNr31zN3pDAEbXVoBf0XqKZZPxSWhPRYclTLA9MMXN+yVWIfCuU+bDVl6vLQYjd0UOr5bm1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=DWZ7pNoC; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="DWZ7pNoC"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47f752b3423so1114132f8f.3
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 01:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785398697; x=1786003497; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GFIwwv1ZKlwIh2R3SG739aEFifVFKq7ZdG19KNvDtIc=;
        b=DWZ7pNoCLHvEZ5q3Rm7XZD7bwWDtLDBW0Qqnd/Tx7xuLLiP/R0RMaKBnRI6kGSah6q
         LeuSU8y2BOYOmWZ5xlaEWSt6GXrjyQvQhlR3/opmj5lKOSl9HHqv+AUlOkT9rxjPJrVK
         k3it4tvw0fFFSyv4hIIv6FD/uaOWxP9S32MMmefI4Ty1M/61EgIVPPq5VEbWc10bw2Bo
         jIcK6HG0zKQXieaNXEkjECDTcEom1N+7bhnOIzgXUQ71hCR/RHknjkERfAe0dlNMa72S
         BYlqpWWsNOjB1EDF6lIZU0QBPM4izDLIA7yLkFrDZGq9bQEXAjwaWm2wMvuX/4MzRm8o
         JZaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785398697; x=1786003497;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=GFIwwv1ZKlwIh2R3SG739aEFifVFKq7ZdG19KNvDtIc=;
        b=lcefckXHeFHfl4lX9csl9X1Vyu9lsvWrF36U1ki9+ZnKYI04FR0GYjHusphgfj/gKT
         hLOhln0Bza7/LZw9gri+y0Ej79OD28Te3b2QShfjFdIS/AZH+xpMkFeVZfsllWHw+J9V
         RKhaXaULYv/LrEN7lGMpME10h+/rRGdpWatR+qzrMm1YVPFdq0258bqKOyuTTNnOzJf5
         Jcm0YMN/JrcuoQ3CzfyrLeWPG9XcZpOSseGQS4t6KW1HoC73J+EmGwlMRmFvc1uxXghi
         9EGmyJFOqUqxq+HiQ9K/Z6BBOQdkjirQc9xrvoiE4qZKMdVOwTtX+CB+ZuyVajdUVpTK
         KxLQ==
X-Gm-Message-State: AOJu0Yw5iwwNnQfvl9OoqnaSTh2TWcTNtcXfaPqpQAjlr+oNY3FvdrsK
	RdXaKgQU3ZUfyaAI/BJ9smdSnp3pm2D16MH5BqpPFW1F5uxDbnuI58PtRP4rEn2SdN0=
X-Gm-Gg: AR+sD11qfh68LIu9epRutuL0N6wawQOlBt7WIFhtE3GGsNF1DT85ndllrJ7Ygu7Aw5x
	/jZ1JB8byaPkewFr2loKseGtm9wIDSkH9vpgMTFEpPCIjWAG/Nq/VMcDj8tWApMtlVHY3UfIMcX
	WLZv/s1aH9LdHfjgkQBeXbEhtpSQiRFSjThSGlee2FUdbHrSdi9UimUmc1CczohUWg3hqUffHVO
	sX25AD7xH8w+rwJPUNQeFmXWXQvLKUdgFSo1exTq2AFc2HEFHFdTWbwKNnjkdqHgrpSeUK6nv8W
	Mt7m+fFRsaGdIvbXhmCSKc+8+LJFxPfIO2wpYD9KsZn5KtkR8sVeUxaphCKmGswBLhASmzvJlI8
	9YdXtY++UGhx+7NKk69/ZE+1ZFfd8OqIoAqpB56+asvz0a2BVcOMai9oAl4riqjEI1YZ1w2yUsz
	xc85WePYc+GFw5EHLG2UNYYlWXH3d3VAiBZdk8SPzyXQymtPkAc5CRXRubHYJCtst3ED3wnmmcZ
	B51q+CJooGSolydTcr5URM6grwNdL3+jEvJBbFF+QVPf39+Agg5HZvP/e4=
X-Received: by 2002:a05:6000:400b:b0:47f:8465:2712 with SMTP id ffacd0b85a97d-47fc8213000mr2091889f8f.56.1785398697420;
        Thu, 30 Jul 2026 01:04:57 -0700 (PDT)
Received: from [127.0.0.1] (host-212-171-227-71.pool212171.interbusiness.it. [212.171.227.71])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fc877dafasm3797373f8f.0.2026.07.30.01.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 01:04:56 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Date: Thu, 30 Jul 2026 10:04:41 +0200
Subject: [PATCH v2] arm64: dts: mediatek: mt8390-genio-common: add boot
 phase tags
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-ccaione-upstream-mt8390-bootph-v2-1-82f67feadf7a@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42OQQ6CMBBFr0K6dgwdK1BX3sOwaMsgNUJJW4iEc
 HcLXsDlS17++ysL5C0FdstW5mm2wbohAZ4yZjo1PAlsk5hhjkVeIgdjVFIIpjFET6qHPlYXmYN
 2Lo4dkCoVCiFQomFpZPTU2s8ReNQ/DpN+kYn76m50NkTnl+PBzHfv79jMgcO1EMhl1cpSNnetl
 rfVns7G9azetu0L93RbKeEAAAA=
X-Change-ID: 20260721-ccaione-upstream-mt8390-bootph-ea7a2444292c
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 David Lechner <dlechner@baylibre.com>, 
 Julien Stephan <jstephan@baylibre.com>, Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.15.2

U-Boot SPL runs after the platform DDR loader has initialized DRAM on
the Genio 510 and Genio 700 EVKs. It needs the debug UART and eMMC
controller, together with their clock, syscon, pinctrl, interrupt and
watchdog providers, to load the firmware FIT.

Mark the nodes consumed by the current SPL configuration with
'bootph-pre-ram' so that the canonical devicetree carries the boot-phase
information and bootloaders do not need local overrides.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
Add the boot-phase annotations needed by U-Boot SPL on the MediaTek
Genio 510 and Genio 700 EVKs. Both boards use the same pre-RAM device
dependency chain, so keep the annotations in their shared
mt8390-genio-common.dtsi.
---
Changes in v2:
- Move the tags from the Genio 700 board DTS to
  mt8390-genio-common.dtsi so they are shared with Genio 510.
- Update the subject and description to cover both EVKs.
- Link to v1: https://patch.msgid.link/20260721-ccaione-upstream-mt8390-bootph-v1-1-5642198f979d@baylibre.com
---
 .../boot/dts/mediatek/mt8390-genio-common.dtsi     | 84 ++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
index b0c97930a0e6..6172160ea9f5 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
@@ -20,6 +20,10 @@
 #include <dt-bindings/usb/pd.h>
 
 / {
+	memory@40000000 {
+		bootph-pre-ram;
+	};
+
 	aliases {
 		dsi0 = &disp_dsi0;
 		ethernet0 = &eth;
@@ -1586,3 +1590,83 @@ &xhci2 {
 	vbus-supply = <&sdio_fixed_3v3>; /* wifi_3v3 */
 	status = "okay";
 };
+
+&apmixedsys {
+	bootph-pre-ram;
+};
+
+&clk26m {
+	bootph-pre-ram;
+};
+
+&gic {
+	bootph-pre-ram;
+};
+
+&infracfg_ao {
+	bootph-pre-ram;
+};
+
+&mmc0 {
+	bootph-pre-ram;
+};
+
+&mmc0_default_pins {
+	bootph-pre-ram;
+
+	pins-clk {
+		bootph-pre-ram;
+	};
+
+	pins-cmd-dat {
+		bootph-pre-ram;
+	};
+
+	pins-rst {
+		bootph-pre-ram;
+	};
+};
+
+&mmc0_uhs_pins {
+	bootph-pre-ram;
+
+	pins-clk {
+		bootph-pre-ram;
+	};
+
+	pins-cmd-dat {
+		bootph-pre-ram;
+	};
+
+	pins-ds {
+		bootph-pre-ram;
+	};
+
+	pins-rst {
+		bootph-pre-ram;
+	};
+};
+
+&pio {
+	bootph-pre-ram;
+};
+
+&topckgen {
+	bootph-pre-ram;
+};
+
+&uart0 {
+	bootph-pre-ram;
+};
+
+&uart0_pins {
+	bootph-pre-ram;
+
+	pins {
+		bootph-pre-ram;
+	};
+};
+
+&watchdog {
+	bootph-pre-ram;
+};

---
base-commit: 11028ab62899e4191e074ee364c712b77823a9c4
change-id: 20260721-ccaione-upstream-mt8390-bootph-ea7a2444292c

Best regards,
--  
Carlo Caione <ccaione@baylibre.com>

