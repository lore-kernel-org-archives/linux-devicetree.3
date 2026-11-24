Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795521906;
	b=bxB3/r9zZqN1qD9fAchJKvW3W+OYMscy2RoUlUay+qrNOltizZv8/nPQHOl9xLPTm23T
	 l64LmHg9s9XmFOogI6sOAA73BLQhDHZt/oJmA6Hvp6teyii7v5yG/+FCrdkMZ4CTMKdUW
	 bOSAsNxqhQ2S04rOHvBo+pbil8Tlw/4OrlHhzqYfnzirQSitqMNxXWHqr6UKw/mjGzPDc
	 PGRiryRw5u/vsuZAjf7QSd/WPj0OGbbURDnqsek4zVfORJRHez2EvpDzI78A9JfJRWDiD
	 zOPmNoyaPot6kFu+1aHuNrq3XBHS24g8IPCMCnshGTtAQNkuv2Vx04tEgdP0MrS7WOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795521906;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=EJvIXWSNay6+eoioVal9zFgh6NBH6xoDfIbKyCb3bL4=;
	b=KI20J63nh+Qxyf7gCreU4vyT9mCTdy2xK1K8N6EEgtdt/vBWIK7dWWeHADVvglAzaw0B
	 gupGi0BVcyawk2d1zDVATfCFzn4nz7/1gSFdGNuB6M5tE9bGvqSKAg11Frszwei+KkZvV
	 yljcTKXZbpzzC3E/NEY0vrisA1/k6Y8WvV/OKgfbZeBen/dG8u8/UpHh3dVraKzZ+u5L0
	 hqViqi42w2otM/NLSch992qzl6ATLa9YTDqFHRP3N0sx2l2fNAdsH/eYNZVuV6vEhCFMW
	 mVYlQhFSQwvbSsQFAoUyiD61udT/GCTDrN19629RL2+CRvne/1hezWmSuH5bcuMhSFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=TsbtPaxe;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39FA606A32D
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 12:05:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A39FA606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=TsbtPaxe
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so47182475e9.0
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 04:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795521904; x=1796126704; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EJvIXWSNay6+eoioVal9zFgh6NBH6xoDfIbKyCb3bL4=;
        b=TsbtPaxeVCoTgdwSm/a8nEcqMfW6W9RjrBpAv7QKzpWQAfHV0wxxOfNEYZWfuoIM2U
         z1gkIZKi13A4xXr+1AkfXZePC6umukWNkLy/xXW9qjtT32X+5A12clS/uqWA8ChrA8q2
         i9rxmIydregBEZEDVIlwhzrj8HlGKnRQLvICyC1xxfif1KjvisMweIpyliDQY7A5cwb/
         VT6q3e4YV8IETr4bRi/bEfMICIYcP34xeuFO3ChNjR9eATiq+svlF8clsd69GcG3u/FE
         zwo4LPt9mX1XbMR9BlTYMAkNIodaYSVhFce4nq0Im5/zEXJDCzbHYVEqb1t0WTYSgACT
         qACw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795521904; x=1796126704;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EJvIXWSNay6+eoioVal9zFgh6NBH6xoDfIbKyCb3bL4=;
        b=u7yY/yuqGnZaLsvO0rHw+EagEtUsaH1eCLuPnB8te4HzuM29v7/N7r9XLJetfHfgeK
         pPm2GAhtk04p0pBdUWL8fq6qsPC/tYbrbiHSquiPzd3ZrVup6FFZfv9GHYDou4FN/zKb
         7oT4JgUo5EyHvhaWqN+CUFA9KVWSxiyrKxmO5lVAkbjIsKdTWfambvpZGs+EliWH36Ym
         flBAb87B8Pa1DFLPHDpkCZcXdJJFzn/hG/yfyETgvQwCIWcKJj5yPgwjVFXgs3ns/Cal
         uybfUjaghe5XK/Y/lW7WvhzMr363U0ngavE9QXoA+Vl3bwCz8kBg0mEIUYc8VLIwY7gc
         zfvw==
X-Forwarded-Encrypted: i=1; AL+hErHtJXzkRdC0Jrl5uW1TStZZMWEwwUnfwAZtkDMRnYUOifQsZFgu5CQh+Shct1vCqCOVvEfLl7H22Lun@vger.kernel.org
X-Gm-Message-State: APuU4Z8AOYfMmsA+mMQ/6K2oq6dLgObi6TGpjqD/fAGBrn90nxQ2ZNq1
	uosGmBHGkho6BCw6WtqC/85cL/bA0VKsGm0S5v3jy+cxR3u+tl4WAd0sxKoWPlxa73M=
X-Gm-Gg: AZFdTZcAfiGn9gUQ5ruACnVCdH7lLek50YPXrRe6Knvnqw/tagPDDEZY2JrUf6RMJBE
	U/7QghrqwWlKmgLQRZ+VYk8NoKU0xrcxw9/S2aTYrmkWUS0gL24bqxC+zblGVQ/bMsXMW6uAEAy
	t5U/1k0u7SHXwkAF/5DgnEfgChdCvezMtt0gd/tZ3Ul5vUuLZtD2z6dG6vXUfgHeQyamBRX6kL2
	2XRIWnqpFWXtDkqmK48fwadZAaE72Xmuuvue1KbUOqeWIV1hx4U9CmJf0QYDijGHfARg/vc3t7k
	PtJojcRDZoZCvJwJU1A68KbpuZ95P3Bmsn4YSZVrtDuQ3tnt2Pr8X9HSsZEA4tu+LyVrm//Dd8z
	CWsp7Sq4G/SBRtEprhl4XBypjhhrYaB5HcElS3CQ0tiJfrMqWddoQKmZyOog+wWSKLoqJURMl2p
	GFF0VbDp4NRQMVv0tAYdpGjOVUzPYRXOVVfpekT37dV0LSJMURJlE5+dw0+gT5qc4WfJkRBWqt0
	quuyIFq46jx4Jn0VoAaykCa/Y/p66VquiU9SNcYrQeDc+eRsNXVMyjjunslK+ZIrs2yGKj7D2i4
	SdE1PtK3uDxnJ6vysTQIfbb+XQI0dBYsK7CkGa6Z8m8fHm+6uCzxqs1TSmeIec8VAbl1vma2wO4
	t29eGJih7
X-Received: by 2002:a05:600c:530f:b0:4a2:677:ad8e with SMTP id 5b1f17b1804b1-4bb8892a21amr273175025e9.34.1795521903923;
        Tue, 24 Nov 2026 04:05:03 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906635c7sm242405235e9.2.2026.11.24.04.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 04:05:03 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 24 Nov 2026 16:04:35 +0400
Subject: [PATCH v4 5/5] arm64: dts: rockchip: Derive GMAC MAC addresses
 from OTP on RK3576
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
Message-Id: <20261124-rk3576-otp-cpuid-mac-v4-5-d403b8a25113@flipper.net>
References: <20261124-rk3576-otp-cpuid-mac-v4-0-d403b8a25113@flipper.net>
In-Reply-To: <20261124-rk3576-otp-cpuid-mac-v4-0-d403b8a25113@flipper.net>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Willem de Bruijn <willemb@google.com>, Simon Horman <horms@kernel.org>
Cc: Ryan Leung <untilscour@protonmail.com>, 
 Ricardo Pardini <ricardo@pardini.net>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2032; i=alchark@flipper.net;
 h=from:subject:message-id; bh=tZOur1/QC2p0pVqmEykIV1YH8t0mT0OobMPfGwIip6s=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWSz1gZzMG2ZIVa1VaHNpl5i+Uabx29mRjirng3cKjfv8
 przth/OdUxkYRDjYrAUU2SZ+22J7VQjvlm7PDy+wsxhZQIZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6
 hkY6xjpGDFycAjDVrQmMDLPE63JuX70qZ+aS+dFd/8Xf5FePN6WYKmtVc1981MhzvoeR4WagBYe
 7mGGu3MfyE5uP9na396055ZHrZC64m1Eobu5dPgA=
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

RK3576 boards without dedicated storage for a MAC address only get a
stable one if the bootloader derives it from the CPU ID and patches it
into the device tree, which not every boot flow does.

Mark the CPU ID cell as such and reference it from both GMACs, so that
the addresses can be derived from the device tree alone, whatever the
bootloader. Boards which store a MAC address of their own can override
the reference with a cell of their choosing.

Note that the GMACs then depend on the OTP memory being accessible, as
the thermal sensors already do for their trim values.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index 2e83a73ddbb2..55892f4afe60 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -2070,6 +2070,8 @@ gmac0: ethernet@2a220000 {
 			interrupts = <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq", "eth_wake_irq";
+			nvmem-cells = <&otp_id 0>;
+			nvmem-cell-names = "mac-address";
 			power-domains = <&power RK3576_PD_SDGMAC>;
 			resets = <&cru SRST_A_GMAC0>;
 			reset-names = "stmmaceth";
@@ -2118,6 +2120,8 @@ gmac1: ethernet@2a230000 {
 			interrupts = <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq", "eth_wake_irq";
+			nvmem-cells = <&otp_id 1>;
+			nvmem-cell-names = "mac-address";
 			power-domains = <&power RK3576_PD_SDGMAC>;
 			resets = <&cru SRST_A_GMAC1>;
 			reset-names = "stmmaceth";
@@ -2317,7 +2321,9 @@ otp_cpu_version: cpu-version@5 {
 					bits = <3 3>;
 				};
 				otp_id: id@a {
+					compatible = "rockchip,cpuid";
 					reg = <0x0a 0x10>;
+					#nvmem-cell-cells = <1>;
 				};
 				cpub_leakage: cpub-leakage@1e {
 					reg = <0x1e 0x1>;

-- 
2.56.0

