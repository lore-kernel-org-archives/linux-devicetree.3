Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795635433;
	b=oJci9xh2Q4twvg3e8srLWYnwfS5jvbc6UCk0pWinNk5ktc7+Bw/g10nHjoFrGTIyuPN9
	 ec6+zxBgQUR+NZDDSuUry4Y2O373sWBoUV1l/Y/CBqbzuo2ed5pgwGRYqKKAFezeL9rdL
	 qXjcSbW7tUM+STVVT9hGkEr/Zerf/SsTkTQ1Zg0ln76XD5YN/tD8WrFOlhqxeufDgm4KE
	 wUhmMMYVlefVXt5whZX034/9cWIrrHbnwFOJ+XiJ+DoYZotN5wrMUSg30/3nMcyQ1GrZR
	 KeZDPiROk2eJWif4hRi0hfXV4ZGNdqIhnNVKmIAJ/LsXAf5HG1Vktm279NkShdKW5Dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795635433;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=ogqpT8rvdF/Gm93BWuS1bNrXpPYIVQ5iqYHH/0ZaQ3I=;
	b=mrOniXcLD7SEha0ZXf98wweJt3BjczhjCaOh2Q06z4KJmdmoapFNNp2TZwAhmaOtw+XW
	 pZBQmTypr3NqGH53DGCyZt1jRmxxLKfgN8GsMGawrDYT20bG15NUQRvbCXNyE/XIIRAyf
	 AsU9/IinDx8VmyYojwMH5jXFzWFh4kyjHSiv/VjEuVtAXtPeuVDn+3BLlo1bxwyO/d3WB
	 2Kdmdss8TJNuaA1nAlX5riAAhxg5zkNq5WsY+8eQB9deaVo/01qX3jS7/Pb8dhzHOrnS/
	 qixS9kIK0SFPvj0H2Lb5YZovqcWj5nbhcp1J4KcyHbBG5fYXZvRUHvcer+0rUFw92Sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=FCQOFZ3d;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F1F606A32E
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 19:37:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0F1F606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=FCQOFZ3d
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4a9be758734so3931699f8f.1
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 11:37:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795635431; x=1796240231; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ogqpT8rvdF/Gm93BWuS1bNrXpPYIVQ5iqYHH/0ZaQ3I=;
        b=FCQOFZ3dUDOL/NRjLrLf4vxVHxioM6QWc4RkPMu93762gXgX8x3csZuprb1AAtJRQp
         mJg8nPMGfsYqjw7zMkH9QdtTiPzTiPk6yBXMJcavbxbhwBY+btH7r5OIs2/n0YQHWWmt
         3z0iBLvYD6r6jS/oQbVEQWVfSt1m9Qex34fzgUjnPgImfxY9xwUELlKY+fQTl5slqkbS
         QV0BguKceV6bLPuNcaf6l2MPE7SBFkjImxp0qWuymUJNAneT2EsCSkwQCsYJwGubNtXe
         23pVE0WImk5zAvA4bbsWRVEKyBAS9UhlIsxROCUFSWcbz9mBZbNVLXAKZxJ8L23hyy1H
         rFZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795635431; x=1796240231;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ogqpT8rvdF/Gm93BWuS1bNrXpPYIVQ5iqYHH/0ZaQ3I=;
        b=Wu4yW61cdUDF0/c9utxtJ7RQzwN8jDt16dTZt5LtMpKOPMEkmDNErpDJQWEatrztOs
         IbyqvPpwE8QhGdd0c1ANwTcc6vx7WF3/izAj/qagYWl8m8LMSApa1EMvgLYrXEBALNQZ
         UfUrAgOOPtQnLDpTO3Wp8/6GUIU0/3NUnKcRuMX6x4cH69V0E2XZQH9/S/WLBxrqC+4Z
         uIcLfqh9epzuy1exFjBsQqtwhcmjOyGKxnFUuJoQa7i2Aa3atZlp3FDDS+KuPzPq5jeV
         SWjjrNWABKqMV2GRuYer7u5bS+ulxete5a5DHmB1MXhpRFACpTs7INwAaF/+4BDyye3m
         Ncnw==
X-Forwarded-Encrypted: i=1; AL+hErHjB94YE79ULFNyr2Fa7SbRFvBAXdpszkdQxCvbY9HmnMxcFFN3IQsbcAqnAzOHsXNIrQ50kWfF0J20@vger.kernel.org
X-Gm-Message-State: APuU4Z9bfNExtVlnInKCGPWnBCE9XMgGvV/G/+5/Corh+ryIeoEtygih
	STYNMb5+2uveACRdSPDJ90YUPV3CSBn1NVvVz7qGMeE2XNuQ2AmJsfnoTrgGuqWpoaI=
X-Gm-Gg: AZFdTZftIl2xgyrpP3Z8UC2PzbwJn+RzX1Simm4iYl2DS/CLKYVuhBRuYkMIJfhvsmH
	KFwwZ2i+rA6V/4QAFPC4mx/hkaVEJECAg158Mi5XtbHR8K7ADa4CuNP6byC9JPSEVGLk+7cqQf3
	3eDHEkltPUNasRTn21aYekLzNzVDc7Sl+u+DdLqaNkgaI1sGUPzjYUrm6JwXhZ2qi5yawQfW2qT
	ZWvEzYIQEjcJG4KVGZBDbwLqM84bZYt/yobOCO78ZzHmkI5Fg5DkwJcMy+3ClOR7OZ9hfyj2apt
	HqyNdVKup+8+kL2sD02Hj8LH9bz9qE8A9+m180ZrR4+zhy0IHbDgcBrXuwu2XHGySyetToVfWQy
	nEY06u+v1qutdBxRKsB8th2Xcdj337iiu2H7JJZPZfmQdQgRxx1G9rMWEJ2Rc11iOKNlv9qogJd
	vvu34WV4uOKvcWRLdCcm3GK8R+5IxUS/6pymFEDig51vu40Jq8NRjq7+s0wlfpa0vIzd9mv0Ycj
	aDFl0EcOXEzcLYyHiUt+kzxc5SmQJ4pT3s2t16b3Wo6KUvdB0qXiBC+EHfTayeFR3OLULt87hIj
	87A7C7U1VWmNb0cEC1Aa5FUQIq22KyzNRbU50CXeta21iSUwj6y2TwRkXxQUwPXDYcMGCYU/EQf
	m4yaYyVoSPRFhgHOq/NuJ0gGGLy1dFq4=
X-Received: by 2002:a5d:64c9:0:b0:4a7:69c3:94d5 with SMTP id ffacd0b85a97d-4abb0e469cfmr35425907f8f.28.1795635431246;
        Wed, 25 Nov 2026 11:37:11 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa3882sm35614063f8f.49.2026.11.25.11.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:37:11 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 25 Nov 2026 23:36:42 +0400
Subject: [PATCH v5 5/5] arm64: dts: rockchip: Derive GMAC MAC addresses
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
Message-Id: <20261125-rk3576-otp-cpuid-mac-v5-5-b3125c9a5fc8@flipper.net>
References: <20261125-rk3576-otp-cpuid-mac-v5-0-b3125c9a5fc8@flipper.net>
In-Reply-To: <20261125-rk3576-otp-cpuid-mac-v5-0-b3125c9a5fc8@flipper.net>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Willem de Bruijn <willemb@google.com>, 
 Simon Horman <horms@kernel.org>
Cc: Ryan Leung <untilscour@protonmail.com>, 
 Ricardo Pardini <ricardo@pardini.net>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2032; i=alchark@flipper.net;
 h=from:subject:message-id; bh=JAiuEnOZimha69/KVwMW0+w3glgeOUOuX9RVnjpc4yU=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWSzW5xrWM62Y/37+T53Hwe17wu9ny+vGuP4jmV57fU++
 Va1cysKOiayMIhxMViKKbLM/bbEdqoR36xdHh5fYeawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyMdYx0jBi5OAZjqqmWMDNfbjKIlv9QFCs1NZY+oPnLYv9+6Jm/iyitLZfmfTruxRZ3hf1DXm2i
 hwzpxLP1yR8r+vf1r9+22xYz5F1fNV5wutjFDjwkA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

RK3576 boards without dedicated storage for a MAC address only get a
stable one if the bootloader derives it from the CPU ID and patches it
into the device tree, which not every boot flow does.

Mark the CPU ID cell as such and reference it from both GMACs as their
unique ID, so that the addresses can be derived from the device tree
alone, whatever the bootloader. Each GMAC gets the address of its
"ethernetN" alias, as with the bootloaders. Boards which store a MAC
address of their own can reference it instead.

Note that the GMACs then depend on the OTP memory being accessible, as
the thermal sensors already do for their trim values.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index 2e83a73ddbb2..d14236c783b5 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -2070,6 +2070,8 @@ gmac0: ethernet@2a220000 {
 			interrupts = <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq", "eth_wake_irq";
+			nvmem-cells = <&otp_id>;
+			nvmem-cell-names = "unique-id";
 			power-domains = <&power RK3576_PD_SDGMAC>;
 			resets = <&cru SRST_A_GMAC0>;
 			reset-names = "stmmaceth";
@@ -2118,6 +2120,8 @@ gmac1: ethernet@2a230000 {
 			interrupts = <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq", "eth_wake_irq";
+			nvmem-cells = <&otp_id>;
+			nvmem-cell-names = "unique-id";
 			power-domains = <&power RK3576_PD_SDGMAC>;
 			resets = <&cru SRST_A_GMAC1>;
 			reset-names = "stmmaceth";
@@ -2317,6 +2321,7 @@ otp_cpu_version: cpu-version@5 {
 					bits = <3 3>;
 				};
 				otp_id: id@a {
+					compatible = "rockchip,cpuid";
 					reg = <0x0a 0x10>;
 				};
 				cpub_leakage: cpub-leakage@1e {

-- 
2.56.0

