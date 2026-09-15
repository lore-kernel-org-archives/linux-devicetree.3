Received: from mail-oo2-f39.google.com (mail-oo2-f39.google.com [74.125.231.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0774D4C7538
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 19:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789499021; cv=none; b=bBeTXvZkaW+JrA/JX8oaJXl/nXT8ZOnuYNGbRHAmlem4qR0R/ZgPai+HMZGdQ+3fzsX1FRgIQK6GQLAvycTf0yOXoi5scXVxOoUqpOd7e+5PzhQdze2wMIocM258ufG2c11San32TFqkDxfwRbV1Zw/M5/OBcC1A4NlhrR2peBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789499021; c=relaxed/simple;
	bh=8Fq4P+2Ju4lSwhzSxj9aVcUt1KO3M3r6gAx7Y5yu310=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fO4ODJYJAXystJ5fTqrTDS7JhT08ifLw4BQiL/wiWlswrO8NF1gpudkokiLGg2EG9NmoFoXWPDF5Nmc/195XCoXfuYo0vY114BcIFsNyv8s5gp1ZySiUNaW+bNn4/rVOcMKN866o2lZ3v9DVlPaBTzria2JlLU3NURBapH49Qao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SBvOeSf0; arc=none smtp.client-ip=74.125.231.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SBvOeSf0"
Received: by mail-oo2-f39.google.com with SMTP id 006d021491bc7-6c197ff1f53so97568eaf.1
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 12:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789499019; x=1790103819; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7XXNu+ljv2q2jdXLpwbKTjv8fXsZBsxA93MzoFmASwE=;
        b=SBvOeSf0Ndr9XqbOGryF32rtdhESYe+aVpeuBD5T33vfFF/ZJ/QG2VpbuTVJ8zV5EW
         WMSwv4Tnl54bDbNsTbyC83MmqEIz59st4gQy4ktb/PjLpiFjDNV0QMITCoPEr++hVO7D
         mJX7k7dugP3DkcQZxG8DSzGMiboU0MSZs4/tXHU3UwqqUaDqbHgM6+a+L1anRNB1kXs2
         Dg1ISLPdmxKmTm90zTNGxY9OoC3y/1aQ1N9PdNhYMSCQyQetcatJbVJa5HSVg4blksZF
         5VFkBmki6WbhJddLWNG3ZtOLLFHZ0vVQbKGx90z7zlT7VmFPK8ibutd0/7/errVyj8oY
         Z9ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789499019; x=1790103819;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7XXNu+ljv2q2jdXLpwbKTjv8fXsZBsxA93MzoFmASwE=;
        b=h4egBENtmkpdRCAbGfAEiOMEuY9geRUqRIFyhJP22++Foehn804gb68UWBVrKPjWTg
         yN9Y9cmpFQtNVBgwG+d932EHhX7XaPSBgSG2hYKvWnqvK9TD/B5zrPjL9YyWm07asMxi
         Wn7AlExPenUQHhzdKVtD6bXGi6/P4OX221DdLylAySzyA9g32lyWZ86Bto/Vtwv5e1GV
         6LCPb7NKS0t1WFQYbKym6BSCDZDqhouOEwFplidLFgvt5ajFhOA0mVV0o8TZiYI1m4MN
         s9El3J7/OdV/+0WQ3eXZk5b1CXBaMizeYLzMl6yKcSAZ3TCq041dfLQirt1GXf1XdYoi
         eMuA==
X-Forwarded-Encrypted: i=1; AKwUvBxMySNsEREfZhwj/63jVCTcbjAcQW4Ca7wG7uhrXWMTc/XpULcBWGLKShz+tACbxSe9uMrDYooRezRX@vger.kernel.org
X-Gm-Message-State: AFuF++kHky2gUSda43oWjkZlVoKNmcMV/pwshu6gs3MVaDipaL42WQCO
	bNbQTV4jVvkS5X7Xjj9DwdyOm93KEcCRhyWSYbP+Ne1AhkjSUa1xNcLE
X-Gm-Gg: AYBFou3NK4tHOJLqjeO2pFtJakxjCdW8G+igtIOtmDUmEcC3tbA691tk5+WLTWGKLLU
	B5z7Yxxr50trRnfN9Jdiz9QAeRdM6lqBaR9mTRpr/YcfuP0HC2Y5o4hGyvHAOc3GhtfQb4Wu9EO
	wPnsZfiYIGQ7kc6X6vjEQMZNLWRopH7JH/1eJYXLcItplRWnfcf31uuYAZ7KATCMSfcGkr8WB9F
	h/y95VsqnNyLdKn+SL6IhfjhS9fgLYoYcZCJ1yXLQY+rvQAKGU1SfhWnTwLv2BIRX5JtVaNODvq
	0RTd1Zz9HxjNkltXrvkw1pDKOBJtbFa2trLx9cIBqGqIkowAbWE3asxUYp35O7RIMP4dWdqIynk
	dLFvojxP5TQgcj/BX1I22UVuk3w5CV+eSJ2eQdp3CDPeen9TodTyx6nvPA6kBiohLTXdQS0+zrv
	oIqMJrMEi+7q/dFAOL92pmYZL5XabOBobKxhnopBx9rVJ0w3RTCwxDAYRCiF8iqfqmN8rC8+BTA
	hCZqmXVMVyDmdWoweMuVLrdJsW3LXnZc1jpFVlPkwTU55atmmGrxUydr10pJc/Uqpda0HCOinIx
	PFvfMKIezlJnNRiELfC0Jfoeyqpr+uYd5Lw2AK+TRyaIVzY7eRqVap47ZP5LXFSUaxPBM586nm8
	LOuyW9qBnSGfcK+OpgL/FcA==
X-Received: by 2002:a05:6820:169e:b0:6aa:cce3:ab61 with SMTP id 006d021491bc7-6c53f555385mr8191833eaf.9.1789499018615;
        Tue, 15 Sep 2026 12:03:38 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4842546a51bsm836569fac.0.2026.09.15.12.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 12:03:37 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 15 Sep 2026 13:03:19 -0600
Subject: [PATCH net-next 2/2] net: stmmac: sun8i: add support for Allwinner
 H616 EMAC1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-submit-h616-emac1-v1-v1-2-195de0bb1f8a@gmail.com>
References: <20260915-submit-h616-emac1-v1-v1-0-195de0bb1f8a@gmail.com>
In-Reply-To: <20260915-submit-h616-emac1-v1-v1-0-195de0bb1f8a@gmail.com>
To: Richard Genoud <richard.genoud@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The H616 secondary EMAC uses a separate system-control clock register
and supports only RMII at 10/100 Mbps. Its EPHY is provided by a
companion AC200 or AC300 package rather than an internal PHY block.

Add an EMAC1 variant using the dedicated register and mark the PHY as
external. The register retains the standard five-bit RX and three-bit TX
clock delay chains, so expose their supported ranges to the shared
syscon setup.

Co-developed-by: Richard Genoud <richard.genoud@bootlin.com>
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

