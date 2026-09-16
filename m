Received: from mail-oo2-f42.google.com (mail-oo2-f42.google.com [74.125.231.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC3C3B9931
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 03:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789528110; cv=none; b=KSuegMttvhpkUDlqyao28TWjYp8KXx6kiXeM2bh8aq7z+iRFRZiGY8dCweLbmt9t1qhe8QtsQU/yYqxOkvcNHtBybwe1weIy38vdPA7u1ndF00SsstEXTKsMZzdZV+GpE0yqmGAfbUIgv8wU5+Dz4m5BkdSTqoqCbxHPJ1If0ZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789528110; c=relaxed/simple;
	bh=BzeM2wwKwRHzaqQoq07OCW4sqSwwDLJ+43BF/yaIJkc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kU2oFSDKRWSOLCa40DA7UgbVbRVoR85oSB8XkaKJ5RpxxOXG+lqte+YkgGtoVbKrVVYLEW+2deD6amBfmL8L0zpI6LNtDmPSymwgHMSgSkFu1mGzuSSmwmRt8TqCLmM7ZFXPyQUDQulzzdt5PG3HwhrIDGK44qP2vOGnL6mBBrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SB4lTQIq; arc=none smtp.client-ip=74.125.231.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SB4lTQIq"
Received: by mail-oo2-f42.google.com with SMTP id 006d021491bc7-6bff4d6504cso227909eaf.2
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 20:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789528107; x=1790132907; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AxECogFnkMA6SSiFQYeE519yjpa6TKSl2zEHDB706vw=;
        b=SB4lTQIqXQ5CbZIroa8E+mHZSiJOCGHcdj35RUrqEpV7lACip7VV1vMAMSxWxVjGsa
         9EMshe/bNVatZ3a06/8SlLRaT/h91/NjBxfoJdTIJ3Cwy8FoMEkmKS4/GxrqcSK1/1p8
         prvz02RNGQPLfennL12R0nyELlMqDvHz2Liyswcs76BFTnpzB4UH+t8Q+L5g4H2gaIFz
         vfAzm8eCcJpiJLTrZmj27FIFF8EK2wNTml05MmUVleORX2jsllhwr3oEPnU5/3fUHfnv
         fl3Bb7dG6F/rUqJsugQRFdtaXhvES3EJl9TsSt1SewC6YVhAR9fS7kbCgH0AGsCV7Tdd
         TXZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789528107; x=1790132907;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AxECogFnkMA6SSiFQYeE519yjpa6TKSl2zEHDB706vw=;
        b=DGFX3igGO9dROeqBSUcH3v0vQ5oO8h8DFA6/I9IieY048092xl/DZjprbboi0NqxuV
         96YwUco1UkAgmQUBIhCJkkSO13hORZ9cAY4QOPUy5u1Dz8DXEUBspRq9wIr3y045387j
         REdCLy1ZxCj3E7aNvpeFu+A5oS2KmxuugBFDM88TOwyiP5dPuRLkSiLzvRsdp7HRgx0z
         jHsrU3KW+d5Q0NtvPvFXhjrMb/DWGHx6J85xMRhiqwIOb/+lBVWuPhQWSd/+/AV0kpur
         W1FtRjzUKw0H5Fz9bZKvD8IgSmM4WRXSLnBlumbr7ausNQU6QNosAjYg0Xj8oOGJvcol
         Oswg==
X-Forwarded-Encrypted: i=1; AKwUvBzBzvcOH8+qcxU5pDWVQ+V3R4X8Vi4GX4txhM0Slb61GFTu8vcnxiPvFZ0nmyDGRxLANkeVS8F2NKtv@vger.kernel.org
X-Gm-Message-State: AFuF++nL9Nr6dBOEiz8uq7Nrn2GDa+YqvAlhKjNkJ80dFGw+S73GP84E
	rV+qL0X6EEYz3r9LVhW0vq0vZ0sDNMiIEYskdmClVdhOPLbqEmnqha23
X-Gm-Gg: AYBFou2EIG7Ek5hvmElrWfC7Mn8GV7Dp3Jt0UE0BHaAPkpfph5gXgcQNrbO7tmsd9Ol
	PahD8jGhIZmCCin5x8KXaOKpF/fH7M6o8TfQLFf9rBiB4BZzA/wWaiUPlVZjSIZxEYVuesmZRoK
	ktSIE0c+SjPX14rBphumHCJjYOBhOFQxLoNiV1NSBrkhgUoTgFLyy/O99kbKWo6J/jiQVx0YUSc
	aTi2cAwiE6fWB4Y5oA64hXZLsve6b/hQYyJmymkSE5uEu8quKgQHFrXAc0/FpBFJbsfjGzWHXzX
	RRcKCaMGBlzqyPf0Vgn/yRoHVJldNCrOEdNlsdixQ/soYPzDN8RCz5Of3H9IsOmGbLLz/vm6yE/
	tuNZTj7pYUZnbbmZAcgr2V7PjnmnUYL59+71XUPCkhExDn7vOVyEQ7P4ebJWJDPg+loLPVhyYcW
	RT2t/j7fzJ0ieuj1sUbFHgPXuwHtMPZ3f36kGbjBg/+wNFyCT4EuH+3KmKJcyrPB32NoYMRSSti
	DCvCI1k4lKgNfYED9UM18uMHB+cCRGExftJeI7ZEygCNy/AGGPdn8PVOiS0wNjrHe2MVp0M7KaR
	bfqCXfUI/ugmMtT0cFSq9JWkcVu7esobshkF8pI2wD7N2CGmwAy4MTcQ/Fow1cybmYIuwIzNuBe
	23ZJNJ0Yr9zL5MAg4OeL9JADM2EjXTvG7
X-Received: by 2002:a05:6820:f0c:b0:6b1:6636:e919 with SMTP id 006d021491bc7-6c7d1cc53f8mr2704731eaf.11.1789528106832;
        Tue, 15 Sep 2026 20:08:26 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c7a677b3bdsm1718078eaf.6.2026.09.15.20.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 20:08:26 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 15 Sep 2026 21:07:41 -0600
Subject: [PATCH net-next v2 2/2] net: stmmac: sun8i: add support for
 Allwinner H616 EMAC1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-submit-h616-emac1-v1-v2-2-322b32e40eb9@gmail.com>
References: <20260915-submit-h616-emac1-v1-v2-0-322b32e40eb9@gmail.com>
In-Reply-To: <20260915-submit-h616-emac1-v1-v2-0-322b32e40eb9@gmail.com>
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
and supports only RMII at 10/100 Mbps. It connects internally to the
co-packaged AC200 or AC300 EPHY and has no external PHY pins.

Add an EMAC1 variant using the dedicated register and enable only RMII.
Leave PHY initialization to the PHY driver instead of using the H3
internal-PHY controls. No RX or TX clock delays are configured for this
RMII-only variant.

Co-developed-by: Richard Genoud <richard.genoud@bootlin.com>
Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 48c52eb96233..e8f86df50060 100644
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
@@ -143,6 +150,13 @@ static const struct emac_variant emac_variant_h6 = {
 	.tx_delay_max = 7,
 };
 
+static const struct emac_variant emac_variant_h616_emac1 = {
+	.syscon_field = &sun8i_syscon_reg_field_emac1,
+	/* The co-packaged AC200/AC300 PHY does not use the H3 PHY controls. */
+	.soc_has_internal_phy = false,
+	.support_rmii = true,
+};
+
 #define EMAC_BASIC_CTL0 0x00
 #define EMAC_BASIC_CTL1 0x04
 #define EMAC_INT_STA    0x08
@@ -1278,6 +1292,8 @@ static const struct of_device_id sun8i_dwmac_match[] = {
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

