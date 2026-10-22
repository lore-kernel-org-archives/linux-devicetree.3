Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792673494;
	b=Koe8IwVZ6fBLCy5x/3k4cQWMdWpllisxk4rm3zGH5KX8bqgWosIc2hjZJSCAf7R3B8Rl
	 eJ4oELepOI3UiA8+DSNTPqd3x5Rkw1aj7iZnhXoWBTyymsC9e/tP3IVbV90IAK0wa3U0U
	 sLq2WRQcEdNzjgjoijxf9T80aeXe92eC1dn6KQ2i4Ar3rzOwC4GBCBK0qFgVz0xfm+/HT
	 EcA+vooG+bmzOEdoSd2WTt0k3EyqPl68q8YeeJkxvZpEKDfgSPluyJwHWZBi9ku87O1z8
	 He5v1HchT+0GyuKemqizkD/9tqukJoumQcHUTQ1iFmFAzn3llzRgmLnjeTWKreplqCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792673494;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=gNSgqDyyhaZ70HmmfTV+uZ2yNYG8ouK92EpISbUXQBg=;
	b=xDKiZBRd6fxEr/s//FqmMQaVSB0ZaG74jpgwPDKpU1Xkz8vAoZB2HZbtkFzovl6oqXT1
	 m0hhNWmgIFRRc2JlX1OBfIs6OvtPlX5X/3SLC+qhmY2xX6+NmN43PohBuTex/yONAgFWx
	 zyMqfr+WTaei1Orw5vZB9Nxv+Mtd5PTtqrZ7zCwSbaKrz6HRI4SM7IE//k/VbmTYuUAf2
	 xnDU1pBeqvZdNwOmd8E43l40nM9/JXsS1efFgNjoy1w9sxE4EaM6e7TyMgAmkIcmW2rlv
	 DYeH3rBLV0D9hwU2rORmXuQWwfHuhSLuK6KVg82zszw82w+VcDmR//6qIOB1RloBTeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sPUbiRAZ;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59386606A33C
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 12:51:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59386606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sPUbiRAZ
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso4675685e9.1
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 05:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792673493; x=1793278293; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gNSgqDyyhaZ70HmmfTV+uZ2yNYG8ouK92EpISbUXQBg=;
        b=sPUbiRAZeuEsI5ibMeCBUZheyo5ErKbO1xhV4+I1YNM7O95sJ+j7sWdMlDgqcUjYsw
         C+YoKjRT1SGd2ik3I8rTP50AEznFHgMPseA0iVY/TI+lzp2m3TFo2WTqOgI3SLAQLbw2
         gpw74vPpTkxFSBtIAtFLr3VEQHIVKMMqfhzYwDyCe27vzux6pfgnmda0T6dCjNzRXUMD
         kiT4H3EYXpw8cF3C08Y/kTLPdBhIzCDSE94ejcHzTT9updg+Hdqxu2s87YpgNkO6tSsG
         29Clul0ExBHBbRzNAVpDuhYs7LVo06aEVHCcFO+Wrpej/UjnY656if2zey37aIMvmv0o
         3iGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792673493; x=1793278293;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gNSgqDyyhaZ70HmmfTV+uZ2yNYG8ouK92EpISbUXQBg=;
        b=EMCuHa2vsCcDNMqztI0xUdwUWMURcl8gM4GwRyEU8biSE+vNjcp5dBj2PjgOeTNzhO
         d2Ybo2gRyZXMaslFPPhZRSmNhurIDRwit2byMPaPR023vzK6xruEuVbzPmp+mWpyeMnH
         uytGIzkrzz0UBSorOop8QtGs9La+aQM/n3RwU7LQiClXKPmG1haehgY+92nRVWBrNOjw
         Wv1ZUJHUB2wAs5F75HXAScCPZ0cjyuyQLNvvXxgOk0IbF4scT1f0qLsWMv1mpOB66hjA
         NTBwzK1OnUI6xzI7x1fFBgkcWJcbL3FuMQgIPcvEfuc4Ta3FmpE63kwufk3xEGbqHFva
         f3zg==
X-Forwarded-Encrypted: i=1; AKwUvBwRkltoo5A0lWWXYMW+ZxzQwt1seJEGz99qM+ZlS9ub7B5nhP5QjhX/qXBM+qFGGImQMbG1BvL3Sumt@vger.kernel.org
X-Gm-Message-State: AFq9FYIL0qwELC6HvQE+iQLbTBxnM7rL7+WaQVcBmruyo1NSzIOozkw3
	zn1ZLnKR2rc946ngRHCDdq+oSZEcc2hDbWvAGCbz4kEttiyf5ufH/50/
X-Gm-Gg: AYBFou3ZGiyzDqjeOsCdT7fjsqsfF+hqXP7JYq8cE0pbr4HLkThMJREz9rTjUs8I5J2
	Pu1iIvaikzvV+RynGeeRm+2oZp6iOzZG6+e60Uu5LgtaayeglmMQFpp+A24jArxQPhgTqian0Ln
	X8H7FN2ec9KYqZjof9wgwsofN7u+Is9bXCYlR0Mh//WeDhJSuKsv5D49duhi71XukU/vAd92i2V
	lZ8gtvssbYOZWCPk41WP4KLngO0WT2cr7uQHsobw9v+pW9n4BsgjPW3j3AWRbO+F1E2By4Kc+V/
	ogewqoedfrYYCwZp3bb9ZV4NxMV8m0kTqDrZ6Pvjm5XpQ9K5Vju2iN9iRRis2vd1D4qlRFkYNyL
	pDtuIXr2UQ4kiuVYkmaaC5OGpC+mm+kDCycvfGLJuYOUtGwI8QaGpn2ID9rphY0Xla5IHhWIyPA
	q7kv2JIFdCupFq8O5Ii88e3j0JaWuj8VBPgcflZd7SkFIuUEEudbsOIxy4XGrkRv7p9IvJhE+HO
	hORNMpRcsddB2CNOdLU1rWA6RL6SVy5tvO92BXEaF7Tip6yTHahGYVNM/mNOIpF+87B/dhdI7Lo
	zJ23ogDk+xAYv2K/CCt8C0ZrclcEhZVGRxEVbsZliTY38L4wl1KDavc=
X-Received: by 2002:a05:600c:628d:b0:4a1:f377:5c6e with SMTP id 5b1f17b1804b1-4a1fdd20a24mr105959715e9.7.1792673492547;
        Thu, 22 Oct 2026 05:51:32 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a203a0f243sm64112995e9.5.2026.10.22.05.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 05:51:32 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 22 Oct 2026 14:51:08 +0200
Subject: [PATCH v2 4/5] arm64: dts: freescale: imx95-verdin: Add NAU8822
 Bridge Tied Load
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
Message-Id: <20261022-imx-nau8822-btl-v2-4-b4221ed43650@toradex.com>
References: <20261022-imx-nau8822-btl-v2-0-b4221ed43650@toradex.com>
In-Reply-To: <20261022-imx-nau8822-btl-v2-0-b4221ed43650@toradex.com>
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

Combine the shared NAU8822 Bridge Tied Load (BTL) overlay with the
Verdin iMX95 Development Board device tree to provide a ready-to-use
DTB.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 0b8f497c5c6e..18d4ed73eba0 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -985,12 +985,15 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-zinnia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-dahlia.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-dev-nau8822-btl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-zinnia.dtb
 
+imx95-verdin-wifi-dev-nau8822-btl-dtbs := imx95-verdin-wifi-dev.dtb imx-tdx-nau8822-btl.dtbo
+
 imx95-15x15-evk-pcie-dtbs += imx95-15x15-evk.dtb imx-m2-pcie.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk-pcie.dtb
 

-- 
2.43.0

