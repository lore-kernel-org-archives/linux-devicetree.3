Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795028384;
	b=LjBGAO2i48pclSal2aDI51lgjYbpDV3ZiF07grW+yU70ib30mD1LENU8Z1RFE5Gl9M0p
	 6rhkBZ2K+GogAhmc7nDM20arHmPVuKAFIhaupOgVzE9J6JsHf8PVJFgdoAZnJdVyVfT31
	 nZ0NcsdOWHY+Tb3CvPkQm9XYLLw055FXKM719gbxZ9SGfq7fPAsPdkmtlGV/2jbxCTRK4
	 rq6z3zsf4peWIAqvRoQxWXI8SVxSWts6NGhud7bx83qz182ihS7KUhlUu1jrG6xFrYq+t
	 jDPcMXiKvKlgTsSUbrC58LASUwB99W6dblII69XlOzaYaWHjT77OTMpxXmgxgYMmVGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795028384;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=BZqKXVZqiOGdZEu0WGQ7on18pEUQ1o2hqL4+MiKX9BY=;
	b=hYUoPhO6iSsPHKUUuG+INgY/Qx46y+gHJP0J45LWr4sjnkICiyPNJHh1TKp9Ni86X1kS
	 1cFFZLxl6Tk6fG9qSjKi0kNrD7U0w9vkdCNfCvFn4942O5vxjPRMmmkUBIHtXSHNs7wOH
	 7bxPzWZ7cEyeAsxb3j6iNJRZp4l5j0DWDbguDqOmpV4YCwJZLuMXoJ/PaCrfTjRQLp/y0
	 RfmHJXptMxFxOVkD18Yuflbexhy2ObgLP5HuuyhDFotu7zFCmMPChSiSWUnrz+tw5/yJ/
	 hIMjKcN9jdVn8u/mVD52bFc9Ud+g4Gk+e6IFrxW+9ugzOoewxjcYj57IZYlyjxZBscQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cxSjKTO8;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54BA606A320
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 18:59:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A54BA606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cxSjKTO8
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb64c99d2fso16083145e9.3
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 10:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795028382; x=1795633182; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BZqKXVZqiOGdZEu0WGQ7on18pEUQ1o2hqL4+MiKX9BY=;
        b=cxSjKTO8m8YacboRtwHDDZ2kk5Pymo90ixZPv8IxdXiPCdTtvYbd73qKU0sElrEcxG
         rEl8W6Jeu86MdEqm/63+2aVHR8cUBipadrwAcm8D4RRGQKagu1wkryE64MDlpL3zjIPs
         xMU7SnyvUGJCjvP3znCbHXg2f4JRGMel4aQ+Rs+RGZyqQ3eQ09dsMt26LRpOoSSp+KpB
         QL0uAZIB46UlSulE8JYXqNexbBgNITRxYFc6Akvktd4OCyklLYKYJwBAuUN1LMNpjC+Q
         Oatbw3tDllQ/YPlKHA9PCJJwD3iIE3D845vHaswq6eKOayc7j0F5IXUAVkb5jaE9hjll
         t4Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795028382; x=1795633182;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=BZqKXVZqiOGdZEu0WGQ7on18pEUQ1o2hqL4+MiKX9BY=;
        b=zrxhuNv/RUjtm86FtpK7eacwEdfXmtcqKKafy6BIH0wsvtWld7nw7hL2jgvXyysm18
         96aclyg9nFkHBvHFFFeb/gdzYy1hvS7+2IeXpRVtipcgm6C2w5CZf5n08CDWNPiiqQJB
         gy1N1Yr2qHxvoOxwr2zBfqPmjOWRVt7EanCVe/sNcsqC3JJ0poLxFAwbdwpvMLvVhUNA
         epryCP+tmPclQyo67YE1JFn+lk5Es3m0SBS/JW4gPWNnxjZRK8BEPahGaUyPDluisUEc
         rOvWUHp7tqqrrl+bBL1MbgHsL3cnZjuItW98l4lSfSIdMC2sPtwSoNi3WvVDm93CzZSK
         8kAA==
X-Forwarded-Encrypted: i=1; AL+hErEPSqhWnN9ZlmreQ1MjyH7/7kdW/Yskn2Mh5rC3MoB6vKG66yxhvvlc9uSF393RGJQ74a+qrlN4hdtB@vger.kernel.org
X-Gm-Message-State: APuU4Z9AiEX4qMXGzQgS1xAIHWPUw2lhFQEtQryNfCR2GqJbuTyqAT08
	zq87BRBPeqAJVMPCJ19Q6DbWPgLx+iUY+RNO2X8vkUJkNud9LBn193/9
X-Gm-Gg: AYBFou3PCBZp2vIv8Vv0oyCS0hk0+RI+kGFsuxCcIVZa+FVhSAAHr13bhk/ZdkafNms
	i4sN2B2rlNV84xYl54ex2RgUPOE4iIMXIyzNOGl67CQtZQVEOAmj1wTEZSXFKY5wCkzOYFl6Cvv
	Gw4NzCRBf04p0JpjX6v2rsGqYuWfJW2O6Kqi/q1R6AIafhUy8YhOrRp8mHngqglKwAV5Nc+dRTT
	nnjjnxhoSBG2H4cXbMNUCMEKunWKaBR6F7U9tYsQFbDWeLj2msJm1JE1E0Deu+rxlgvOdKlw2Ef
	jUPZizEoLxRpv9TXc7euQG3V9mgWaBFzl3C1utiKM2Vz9c9kczi16VIXJnausSTnWdINiMp3SRB
	+iTNdSjWIqaCo36exrRYolEeb8skhaeyVmqrjgm2v5Qkr2dMDzxDaEEQlZrL9/euXO6gxSPO227
	M8dEhzIRPjHvWYrM1E2WD8WlFTmKipRnJtn7iyFmBP7jK7isrOuoUaZAnhY5AR+SPO0FN31FdEZ
	zFiB+2K2g+5SBxqm9X3PGxAP1Z46egEDiFEeCtyqAiGG5phCMExypKAA4KIThDxw7IXzRM31pgj
	OTWGnj85l/7/fshSCHqub/xhYW0U8ZUuYncsYiqaql7mJMznwf6OfkK7l+Cl+mNjhHyBD6A=
X-Received: by 2002:a05:600c:46c7:b0:4bb:76f6:d23a with SMTP id 5b1f17b1804b1-4bb7da45409mr75914615e9.21.1795028381836;
        Wed, 18 Nov 2026 10:59:41 -0800 (PST)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.234.80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d4e670dsm95966965e9.1.2026.11.18.10.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 10:59:41 -0800 (PST)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Wed, 18 Nov 2026 19:59:01 +0100
Subject: [PATCH v2] riscv: dts: spacemit: k1: add PowerVR GPU device node
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-orangepi-gpu-v2-1-f68676f844eb@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/1WMwQrDIBAFfyXsuZZVq7Q95T9KDhKNWWhi0FZag
 v9e462XBzPwZofkIrkE926H6DIlCmsFcepgnM3qHSNbGQQKjRcuWYiH3Yj57c1Q2Ku8Wa1QT1A
 vW3QTfVruMVSeKb1C/LZ65odtIY5c/YcyZ8hQKq2N5nWx94uh53kMCwyllB/fEJ7+qAAAAA==
X-Change-ID: 20260413-orangepi-gpu-02d839d6506f
To: Alessio Belle <alessio.belle@imgtec.com>, 
 Luigi Santivetti <luigi.santivetti@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Iker Pedrosa <ikerpedrosam@gmail.com>
X-Mailer: b4 0.14.3

Add PowerVR Rogue GPU device node for SpacemiT K1 SoC.

The GPU is integrated within the SoC and enabled by default.

Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
Add PowerVR Rogue GPU (BXE-2-32) device tree node for SpacemiT K1 SoC.

This series depends on:
- Yixun Lan's power domain series [1], which provides the genpd-based
  GPU power domain driver required for proper power sequencing.
- Baihui Liang's dt-bindings patch [2], which adds the spacemit,k1-gpu
  compatible string to the img,powervr-rogue binding.

The GPU firmware is not yet available upstream. A copy can be found
at [3].

With this series applied on top of [1] and [2], the full GPU bring-up
path works end-to-end on hardware:
- Power domain: GPU power island on/off via APMU
- Clock: GPU clock enabled/gated through CCU
- Reset: GPU reset line deasserted
- Firmware: PowerVR RISC-V firmware loads and signals ready
- DMA: dma-ranges correctly maps CPU-to-GPU physical addresses
- DRM: kernel exposes /dev/dri/card0 and /dev/dri/renderD128
- IRQ: GPU interrupt registered, firmware watchdog running

Userspace rendering requires Mesa's PowerVR Vulkan driver
(imagination-experimental).

[1] https://lore.kernel.org/linux-riscv/20261008-04-k3-pm-support-v2-0-6f778a53dd2d@kernel.org/
[2] https://lore.kernel.org/linux-riscv/20261015-spacemit-gpu-binding-v1-1-a7a23c7e7788@linux.spacemit.com/
[3] https://gitlab.freedesktop.org/imagination/linux-firmware/-/blob/powervr/powervr/rogue_36.29.52.182_v1.fw
---
Changes in v2:
- Removed board-specific enablement (GPU now enabled by default in SoC)
- Simplified commit message as per maintainer feedback
- Dropped redundant status = "disabled" from GPU node
- Link to v1: https://lore.kernel.org/r/20261015-orangepi-gpu-v1-0-03566a615660@gmail.com
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 3fabfd34114b..7f2573d869ca 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -5,6 +5,7 @@
 
 #include <dt-bindings/clock/spacemit,k1-syscon.h>
 #include <dt-bindings/phy/phy.h>
+#include <dt-bindings/power/spacemit,k1-power.h>
 
 #include "k1-pdma.h"
 
@@ -1119,6 +1120,16 @@ multimedia-bus {
 			#size-cells = <2>;
 			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>,
 				     <0x0 0x80000000 0x1 0x00000000 0x3 0x80000000>;
+
+			gpu: gpu@cac00000 {
+				compatible = "spacemit,k1-gpu", "img,img-bxe-2-32", "img,img-rogue";
+				reg = <0x0 0xcac00000 0x0 0x80000>;
+				interrupts = <75>;
+				clocks = <&syscon_apmu CLK_GPU>;
+				clock-names = "core";
+				resets = <&syscon_apmu RESET_GPU>;
+				power-domains = <&syscon_apmu K1_PMDOMAIN_GPU>;
+			};
 		};
 
 		network-bus {

---
base-commit: be95fa81c04dd67616faaa2872babb9ac39d4251
change-id: 20260413-orangepi-gpu-02d839d6506f

Best regards,
-- 
Iker Pedrosa <ikerpedrosam@gmail.com>

