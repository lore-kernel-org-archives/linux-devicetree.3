Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0B4396579
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 05:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785734136; cv=none; b=ofXHutYSZ1ORKDoHldyiyvDoMTlAPTazP0+htWRfCxA4GS4QQUnGEu/HvWcpjnGbBrvY30G7ipGTP6VPDiwiyTxsbp/jpJR4y94nvwkz0HhC1WUxlRiLAY2dr1ildFRTZa9gxCKqL6FuRD17hJ1N20i5UTJVgpqVkGt8xk95nkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785734136; c=relaxed/simple;
	bh=LuLd1Fgsqz/EvyuQmaammKLeRagaqJ0vM3tIyUpmvMk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jZdcRIHJ7efSPcaBEdDT6p2PP4KnMSbvmclaDM6acXX++NjqJ/MPmuUx4qu6qFunXihlbP6npE16sGZtmeJt9YWY7mk+XXn2KjnICdHfazvRM2vib2AKnGuPZ6eZYTUIlrsbYC32+TarSYaFlQabUCOmbJM0njK1VDlUToxS6rM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sz7q7cFD; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sz7q7cFD"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7eb6573bd52so2068085a34.3
        for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 22:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785734127; x=1786338927; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SlcJviNfe1A7bPODjwx5akEOsNAeWr5kscTUhAqnE8U=;
        b=sz7q7cFDLfUI5hER/3FUcgdKnyWim/kp/qVqYNZiFnr897gewMdNVVnMxpsoU8bBdB
         2NT6QR08UzEDmgFsVi2sBQwkWePxRwgFDjA1+diT5XeIVWIYqLzh3KgvX08aAqa5NLOU
         pK2orJsfK8D9RQQ8RwPhdwbLF6Kv7SNp8dbGigFvpATGDGFNtJva0X7/Suxt/8e5/t9t
         McVODdMiM/Hmu4RA/NgnPQptQdXgQoTBSS3ffwpDSHGWPRH0n0S6rEjlxIHgE3uFUsRu
         oslikV/P6/X1at+iHfus1hPe8y5c1i6FgOoErDlHC6LCJO9Tsils/TDY/2c2dh8JaIej
         mZow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785734127; x=1786338927;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SlcJviNfe1A7bPODjwx5akEOsNAeWr5kscTUhAqnE8U=;
        b=hjBUdJdMfVuvFEH/8NOudgEH3dlFDLGHo062+4ABei3AVOr1vJ6+y/Nbpt6vHVsfK/
         jc08vR0EkdAscuF9TbHlFkEsneNqQCF2LDKJ4+ZwEbrzFm+VhYYF+J9WC5ITG0CfZ8/S
         HDpqPXs7qfIYIRQ3IxWgxFOq1uilyVBXsYfHqCiCSQckuWJqJQVKe8B2sNrUOCr2P0yT
         04OwjBKJe6fhdqzHqruFyoA4MfAFjnx8tBeWJq8BzdK5IffJ9pcxblaXdNw5is0XU6w2
         BB9JMTBoklRFaFKgKX2orH1PRd8vbSQvphZw4gjAfhf728R3TumLgJa3vjQ8S6t65CVy
         MNtQ==
X-Forwarded-Encrypted: i=1; AHgh+RorzHQPq3G8pxYVwenNL3iUNRKKcMEb0pO0+zHQgnBQcGyV9OnW4ShVEMMFfcYpKd80T+/rFAqSMAsB@vger.kernel.org
X-Gm-Message-State: AOJu0YyQmMUADXm4dUhcNe+CvAXHMZbpmlBCASSdukuSRUbDb3s2giPb
	+6ZJVnwH5mN2migJjYWucQIzYjO0zhbwxvdKWC5z8xoeEgoA5G28Eg6J
X-Gm-Gg: AR+sD10GS1MW+ZjO1IYXujmUyMXNtrG/P6lfMGQguciHPiN0tb3ratt3iN1/yNT1veK
	mOUCBKoc4Vq37mgaU6qkTl+9VdpzNRQ7c62HfPmWgn+ELQdDpWuv9SQhLnBJUMLKrzG9bCTWhAI
	Rfd1QvL/iVMhIV0uLKfiEGggNqHP6U28OTDEgeSus/5rksutdnH16k0M1C1Y0PI+B3zQjBRoVbi
	wOAw6gOEEVznA2ev+9JWWFvoc1CX/Fc65rONXsWsNKrEtppQRl7Q4cj5xjDYp8LpzzA/mplw6/J
	UvjDHakcQTkVJCqwNjeMMTeaYkaQevYAQChzru4VKWX8V9mEu+qkDLk7Y/YoDBQJdr/+4WP+k6c
	PigIOqRXhah+5qmqO4t/Fvn+iw1//bvXZcB9RmOxEdDIhAR6dDIKKGt7zu//gPcxbBIR13yDCNw
	5QfW1XBMeoJigTllm2OsRSYuGp4BXHQiXubWNNjGC5+R21ATTDat9Z/g7dBBpnHOGN7JlG9BQUm
	25LPIi1+kmykYltuVnaJbMxY5fFbq2Ak1x4xIV/9UTXZyCrepAkvGT2nser2TPP4RCIyQd4shqn
	t8scysJ51+ug9Jx8jo+acrcsYkjsl9KpAwq8NPU9zQJX4ILwyEvrrfFe9douy+nCR9TUB8FUacY
	723+MoF1bNcP6iF5K
X-Received: by 2002:a05:6830:211b:b0:7e9:c102:333d with SMTP id 46e09a7af769-7f196f8ad8cmr14493591a34.9.1785734122667;
        Sun, 02 Aug 2026 22:15:22 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f18f07a5e3sm6787108a34.15.2026.08.02.22.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 22:15:22 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 02 Aug 2026 23:14:12 -0600
Subject: [PATCH 02/21] net: stmmac: sun8i: add support for Allwinner H616
 EMAC1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260802-submit-acx00-of-dynamic-v1-v1-2-0a53cd9e21cc@gmail.com>
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
In-Reply-To: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Saravana Kannan <saravanak@kernel.org>, Lee Jones <lee@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 mfd@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

From: Richard Genoud <richard.genoud@bootlin.com>

The H616 secondary EMAC uses a separate system-control clock register
and supports only RMII at 10/100 Mbps. Its EPHY is provided by a
companion AC200 or AC300 package rather than an internal PHY block.

Add an EMAC1 variant using the dedicated register and mark the PHY as
external. The register retains the standard five-bit RX and three-bit TX
clock delay chains, so expose their supported ranges to the shared
syscon setup.

Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 48c52eb96233..fdc0c3384af8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -81,6 +81,13 @@ static const struct reg_field sun8i_syscon_reg_field = {
 	.msb = 31,
 };
 
+/* EMAC1 clock register @ 0x34 in the "system control" address range */
+static const struct reg_field sun8i_syscon_reg_field_emac1 = {
+	.reg = 0x34,
+	.lsb = 0,
+	.msb = 31,
+};
+
 /* EMAC clock register @ 0x164 in the CCU address range */
 static const struct reg_field sun8i_ccu_reg_field = {
 	.reg = 0x164,
@@ -143,6 +150,18 @@ static const struct emac_variant emac_variant_h6 = {
 	.tx_delay_max = 7,
 };
 
+static const struct emac_variant emac_variant_h616_emac1 = {
+	.syscon_field = &sun8i_syscon_reg_field_emac1,
+	/*
+	 * The "internal PHY" is in a companion AC200 or AC300 package,
+	 * rather than on the H616 die.
+	 */
+	.soc_has_internal_phy = false,
+	.support_rmii = true,
+	.rx_delay_max = 31,
+	.tx_delay_max = 7,
+};
+
 #define EMAC_BASIC_CTL0 0x00
 #define EMAC_BASIC_CTL1 0x04
 #define EMAC_INT_STA    0x08
@@ -1278,6 +1297,8 @@ static const struct of_device_id sun8i_dwmac_match[] = {
 		.data = &emac_variant_a64 },
 	{ .compatible = "allwinner,sun50i-h6-emac",
 		.data = &emac_variant_h6 },
+	{ .compatible = "allwinner,sun50i-h616-emac1",
+		.data = &emac_variant_h616_emac1 },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sun8i_dwmac_match);

-- 
2.53.0

