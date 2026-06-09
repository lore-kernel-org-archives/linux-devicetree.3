Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA61B4D90B4
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 18:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781031485; cv=none; b=U1S8SpoPsvMRvRLPhAr+KkPBUAzhXybpgB90vCvAfMiFy1SEHri7O2jfqqTmDC66E8dzE4rz6UtPU5+7SxY6+pSzMgapsKEBPNUHLq4N3lRRsfk0fgZf9Mo0L/o6L8eCMtVB3OCEpVBGjJm0rh6nJW5xiFiMwJZukusOddxZMQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781031485; c=relaxed/simple;
	bh=vgTU6IpqehS35f26r2q57NqAGrF/RDXF3lubDqCB+Bg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qSBO127p0x8pQ2x2Wg9ouB9sK+KPyHUOcG0B2k6zEScLREEOoQHfm4qqpq6S7fBOBrXcmaG5xJc91T4cCT1xOs9YAVSMs4d2nIIhD0k7G5usgbgY+6oeFjcWDgiIO9eCVlV6kPsV52QG7xiskIpdZXnFGvpmUcXtYNW+u1ZiWTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=j3FTE+D9; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="j3FTE+D9"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-45ef29c5561so3192743f8f.0
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 11:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781031480; x=1781636280; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r7ceLvJFGDWzpb591woUgz7GBOYPJ1IlL6PiiR38W78=;
        b=j3FTE+D9dSnQBz057NvFONe7sZUpzHhWrY5RGvVmf2BtqjUmPnqcA2TAF3YMqKneaz
         vceIx6k8UPnaOVMaqyGQvpZO1Yw6U22Icwche1pX8LFx3lyT7Re55TX3po5roj7zMBYC
         QaReoSupEN8Jzcl5IhVFwoPEv9OPCsL8abAjs44Ohzyid05imnA3jztCBJQ3nRxnhDp1
         Vs9pzHG1v6vbTuLBJP0EVsjrG8NYxRIdSdt9DVQZLXNUjSNu910psw2aeky87ADBPw13
         88Xm7oWDyw5F+yR17OZCLI72MZyXx9gCdIdFjZuoULJUtQ+4TIqNgxr36z/J/Cp/oOvT
         Udxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781031480; x=1781636280;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=r7ceLvJFGDWzpb591woUgz7GBOYPJ1IlL6PiiR38W78=;
        b=g8nWB4M87vbPYKH4Nc9lYjIGFbXLvdXBbMin1C8NGxYhr1+C4Pv1F4BFkPCp2K8EPh
         ip5R/6mGtcNWWhEY+Q0FjO66BRRxyclnlcBsf6UUcujaL//UXDwQ5FpuPKLj6tVJRZTf
         BOOpNc7tr7Eu7GqpjCXhUBPukoEk/WhxnzOJXfPvZnI8ZxAjdQWOdax3spBV0Fle8qlB
         WrXbpym7PsDaf+KYZ0wyvinfmp3bNOJY+i8n6v+LXdVDqJTmhg635XF9f2LJ37j/vo2z
         Be9JtWbWQBc0O5GQkNSAx7s4yNPSn3S83xMgny46kF1/6RAzlCZ+NHlI2LJIC8OBEQ5M
         a0tQ==
X-Forwarded-Encrypted: i=1; AFNElJ8PE7R/BkgYkkY/smR8A5btDh4TLrRrrpEydajuXpGoTjmYPIsBRFUsspy84U/bEAUgq9nY87grVf0v@vger.kernel.org
X-Gm-Message-State: AOJu0Yx39OvdfdbF2mhwn4PktTprpfyxDRnIrnyDsg0kuBz4Xt01aulV
	Mc9ioPy82v7vWMiLBXeu0pkdjBxTK8VLCLKkjL7Vr5zHodwoOX4ACClxD5MosccgC3w=
X-Gm-Gg: Acq92OEQ2nzpUI2jhNTIQV73c+hdMLYdHW25GoZxzqJi/3iHGC1y1l3PUMyqhHNwbHH
	NGP0QyqpHDxye2HXdO/CWd+Zy08rOwHNJ42bHWKOCfFhNuWRkeTiyR7B+QbHLc9aNG+vHpZdPZe
	AdZlJ5Tg9zAfc61vaQu3vUqrZ9CwbzTBNvvst/lSZsxIUeOpMMMgvWuIZ81XXiQoYptkrM/2C5n
	AW/shpgMn+R+qOf+mz6jizaibxaGQC34KiJqGzO6T4pvJvo983/ocuNSUdZTuKCdXZaMG5K5C0g
	PN6FqTisW75vcUze9oy08m4HepG2U5yTO57YZzCkm85ErhsbNEZKFWPfAKB/6oxml/PuLYTKJTn
	9D89HJjoAgsQFUHSDSXMtnrgqrr+vhT4DJRLKba/gxQ0r6Lc+lx3AixjEQ/kmijDSmkBocsp3kp
	HnR/tKqj1+mA03u0smhBhN41HasGqjyrDM6SWGb+D9Og==
X-Received: by 2002:a5d:550f:0:b0:460:3233:f994 with SMTP id ffacd0b85a97d-4603233fa1fmr26772439f8f.43.1781031480394;
        Tue, 09 Jun 2026 11:58:00 -0700 (PDT)
Received: from localhost ([2001:4091:a245:857c:bd97:47c2:83e4:8d45])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2f2710sm50663559f8f.14.2026.06.09.11.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 11:58:00 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Tue, 09 Jun 2026 20:56:23 +0200
Subject: [PATCH v6 11/11] arm64: dts: ti: k3-am62p-ti-ipc-firmware: Add r5f
 nodes to pre-ram bootphase
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-topic-am62a-ioddr-dt-v6-19-v6-11-16afba97fbe0@baylibre.com>
References: <20260609-topic-am62a-ioddr-dt-v6-19-v6-0-16afba97fbe0@baylibre.com>
In-Reply-To: <20260609-topic-am62a-ioddr-dt-v6-19-v6-0-16afba97fbe0@baylibre.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Judith Mendez <jm@ti.com>, Daniel Schultz <d.schultz@phytec.de>, 
 Andrew Davis <afd@ti.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Paresh Bhagat <p-bhagat@ti.com>, Bryan Brattlof <bb@ti.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, Devarsh Thakkar <devarsht@ti.com>, 
 Beleswar Padhi <b-padhi@ti.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Sebin Francis <sebin.francis@ti.com>, Kendall Willis <k-willis@ti.com>, 
 Akashdeep Kaur <a-kaur@ti.com>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Hari Nagalla <hnagalla@ti.com>, 
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1228; i=msp@baylibre.com;
 h=from:subject:message-id; bh=vgTU6IpqehS35f26r2q57NqAGrF/RDXF3lubDqCB+Bg=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhiyNJIWtC9Wd2BVK7G1VZ8l/k5HMmsA25/PcSXd6/2gZ+
 f1sXHq/o5SFQYyLQVZMkaUzMTTtv/zOY8mLlm2GmcPKBDKEgYtTACYy/wDD/7wDn10ljz4x7v5f
 x+0qqP7Fp+UFx/bzO2//fyb2UPHTo/sMf0V3LxBvKiy/5ByoVr9u0vdfkZOXN0z6r+Hv6Wy2VuL
 0DyYA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

For IO+DDR the wkup_r5fss0_core0 and the
wkup_r5fss0_core0_lpm_metadata_region need to be accessed before RAM
setup is done. These are used to read the lpm metadata region in which
data is stored to resume. This needs to be done before RAM is in use to
avoid overwriting data.

Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
index 8f7409da83392d2d1f160a9645ef4d68f7aaa1bf..04fcd5115b9d95e6e23c4e43782c06501a0fa601 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
@@ -40,6 +40,7 @@ wkup_r5fss0_core0_lpm_metadata_region: memory@9ca08000 {
 		compatible = "shared-dma-pool";
 		reg = <0x00 0x9ca08000 0x00 0x1000>;
 		no-map;
+		bootph-pre-ram;
 	};
 
 	wkup_r5fss0_core0_lpm_rest_region: memory@9ca09000 {
@@ -89,6 +90,7 @@ &wkup_r5fss0_core0 {
 			      "lpm-metadata", "lpm-context",
 			      "dm-firmware";
 	status = "okay";
+	bootph-pre-ram;
 };
 
 &mcu_r5fss0 {

-- 
2.53.0

