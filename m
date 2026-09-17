Received: from mail-oa2-f32.google.com (mail-oa2-f32.google.com [74.125.231.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0064650B401
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 17:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789667724; cv=none; b=YhtY0ikeKNEfsffQsD7xpCOOL0qmeXJcFG7lTUJMEJ9tfog1Fm9NA90QFNJh94cOnojLhpKf1TFV1hi2vt/rMYrR6B6uPbQwgh6U5M9jKAvEUGawPipf+6BneKeJxssiSOIwsrhWlSKljg9c2RzXAwSQbDOtF8/TpS1IRQjnigs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789667724; c=relaxed/simple;
	bh=V3VlQ/ggAL7FMDjaee6fyKxwwR97SAVyTjtCuxfkY6c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YVuD01HmrO7Myfy55iFKTd4fXwTIfnffy4XvIm/L6Q9Q+5Ws1B9NBsk0YxRKNjFjBYAdDDvlUvowmTFn6eXy2Zz4FCe0Wuk38/bWDIYdpkbifyY8KZ/x1rV1ABoLLztehbErOYyp8HWlq345zgxuMnUQ709+rLDEKibIjJhuQwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qnqiZVU1; arc=none smtp.client-ip=74.125.231.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qnqiZVU1"
Received: by mail-oa2-f32.google.com with SMTP id 586e51a60fabf-46a63c34533so1242168fac.1
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 10:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789667721; x=1790272521; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rtt5XejF/bWF3GOuFvls4LbhkcGw1Hah+9I1v10tav4=;
        b=qnqiZVU1xk2ci0JununmEKYH498dXr6yEVWpzQbyXyygkr+YPeNSI34rderpBDAaQ5
         soZ2FITYXg9D9ENk+ijlqDQ5Je5hXT/jhmgNLlft1U8rd6TbaipRQRMNI8vEFWFL6FC6
         xQTrFVEiruWbziLrrb36yEu638j+HIopMO0hp3xe8EHIbZLziGcGnju4g2gNxpOfDi03
         wPjGBG3wiaNqfbW2UkqmjLht6FuS8xA08y9mnMLY+exkD7+jyCLLqywdqkx2kW+6I2Iu
         UNJlCo6mL3Cs+qBSiZa5buBgK6xrUYDNJy7N9eaYMEHppW9Tu/rjPI25fke4txXO72I2
         WdwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789667721; x=1790272521;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rtt5XejF/bWF3GOuFvls4LbhkcGw1Hah+9I1v10tav4=;
        b=y4svI8y96yfsX0iIwLEDQKzoTl54NQgj8uhbSNXIuwNrh60GO0RJ5jPqANszJafh5P
         bt2Ozln+SmPi2ct0zhJZgWRV9H0yD9SnPdufRns5RjHK7WLEK4UJWLOPWxbciG28+mq7
         oxXv/oejDXBWsE2vxsGdiQx1r1Qstv4gnMuLhrgkTVo/lhS0lol0wqhY9XjRlyuT+duc
         /hA6+drQChZoSVPLBt2VrW0uuCN7l7QtTchyeCxYvNETCrxjNMvZ2oWDuQlD0qYTeDLi
         A2FEM49Av/SRVmu+hq9CMIktux3LlIZwNX6lnwXA3Qff95OOnYNSWuN8lgZutTk3eNvo
         tIWw==
X-Forwarded-Encrypted: i=1; AKwUvBwsFw0uySaOm/TCxr9ctK9ZKfo3vM0ftmP6/q+W01NluG5abwY+Ht1IaOBnhAOssQqjm0LYm1Gk7Xpk@vger.kernel.org
X-Gm-Message-State: AFuF++m7sa/UMAWp5+0yC+bB4KgogyUdBQTWsJP51KiTvC+m7eyvQu9q
	IVDzQP4yBQrhJhQm07ix+TAsn9128zmSuiFG4T031Bn6NM+eKdsqPLJE
X-Gm-Gg: AYBFou2F1hMrygWv2/J31B6HuR73ZBxP20EuKsU83DMi9KiImrvmbFNZ/4kHAuyBBPd
	MqvF05AhSgbEvON2Xk1MHEDBmRKA1z6Y0ppDss+Bd2C6BQJcZXkBinAOJ1qlrhB4tEB1uEHHIvO
	rEIxLrMWS9XmeBonNB1iLYYQ7s2WFqf7Pgk2MJ4EbO8M7zFZJcVmOtERxFnzSNNR6w2haItbjxZ
	WvrdoeFHEGySvUurcxVdilSfzTguKnlYQfHgIcnU+z8FuoE1T5h5oprXPNlc62BNcY5T2D2l7Gr
	I1T71U8injN3Vwmh2UHwu6yIY7wJMYoBh8KzgOtFeKeded0LheY1+wEW8+Uxbf3QkKDnvZ+++Pp
	NXhiWvpUSI55uGV9+08EVk0/7NqNfFpw9Pin19yqpIf0+VNUYyOJs2ucFBof+TKBCVWXiJN2Jtc
	5U4DX63VmxZYUpShtPCCVYgQ8lU62+qXrr8sEmjLFm9Zz6hcSAqfEFNWYONofnXHN1fZed4gdCs
	582BmX2lwan+WX3Sn9k9USjNYeaH8krLxSgsU3KN4OBPZcMBvXM9vXXVGO+AbPMx6FoMy+qfJHi
	IwWrGg2XvGx/5bJFO04M7f6yAln3A/7dfoCCXgBhrlkITvAQpxdl+5PsrKeIfUNSG3PxDg3ASGc
	GHJpq8SuFCbXm1kXvKSpL
X-Received: by 2002:a05:6870:41d2:b0:475:a1ec:9613 with SMTP id 586e51a60fabf-48476c61b11mr7860909fac.21.1789667720572;
        Thu, 17 Sep 2026 10:55:20 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-486ab6c1f31sm578446fac.10.2026.09.17.10.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 10:55:20 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH net-next v3 0/3] net: stmmac: add Allwinner H616 EMAC1
 support
Date: Thu, 17 Sep 2026 11:55:11 -0600
Message-Id: <20260917-submit-h616-emac1-v1-v3-0-62cb8316e19b@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42Oyw6CMBBFf4V0bU1fILjyP4yLtgxQI8W0tcEQ/
 t1SXbhwYTKbm5l7zizIgzPg0bFYkINovJlsCnxXID1I2wM2bcqIEVaRhgrsH2o0AQ8VrTCMUlM
 cKaaCHwivBZNKoVS9O+jMnLFnZCFgC3NAl/cmEa6gw0bdbgfjw+Se+YNIc+MjK3/L0hBMm7IFo
 hTtannqR2luez2NWRHZPxCWIJwxxRkIAqr5hqzr+gK92Q3iGQEAAA==
X-Change-ID: 20260914-submit-h616-emac1-v1-143703842abb
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
Cc: Maxime Ripard <mripard@kernel.org>, 
 Alastair D'Silva <alastair@d-silva.org>, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The H616 secondary EMAC supports RMII at 10/100 Mbps and uses a separate
system-control clock register at offset 0x34. Add its binding and a
sun8i stmmac variant using that register. A distinct compatible without
an older fallback prevents the driver from using EMAC0's clock register.

EMAC1 connects internally to the co-packaged AC200 or AC300 EPHY and has
no external PHY pins. Leave PHY initialization to the PHY driver instead
of using the H3 internal-PHY controls. The RMII-only variant does not
expose the RGMII clock-delay properties.

First move the MAC software reset from probe to the DMA reset callback,
after PHY initialization. This lets the MAC and its MDIO bus remain
registered when the PHY driver or one of its suppliers is not ready yet.
Keep the separate H3 MDIO-mux reset sequence unchanged.

The AC200/AC300 EPHY driver and package bindings are already in
net-next. This series separates the H616 EMAC1 MAC driver and binding
support from the earlier combined series. PWM, MFD and device-tree
enablement are being handled separately.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v3:
- Add a prerequisite fix moving the MAC software reset to the DMA reset
  callback, after PHY initialization, so delayed module loading and
  deferred PHY probes do not tear down the MAC and its MDIO bus.
- Preserve the H3 MDIO-mux reset and propagate hardware-reset failures
  through the normal stmmac hardware-setup error path.
- Add Alastair D'Silva to Cc and rebase onto current net-next.
- Link to v2: https://patch.msgid.link/20260915-submit-h616-emac1-v1-v2-0-322b32e40eb9@gmail.com

Changes in v2:
- Drop EMAC1 TX/RX clock-delay property support and keep the existing
  RGMII-only delay descriptions unchanged, as requested by Maxime Ripard.
- Clarify that EMAC1 connects internally to a co-packaged PHY, not an
  external PHY or the H3-style internal-PHY controls.
- Rebase onto current net-next.
- Link to v1: https://patch.msgid.link/20260915-submit-h616-emac1-v1-v1-0-195de0bb1f8a@gmail.com

---
James Hilliard (3):
      net: stmmac: sun8i: reset the MAC after PHY initialization
      dt-bindings: net: allwinner: add H616 EMAC1
      net: stmmac: sun8i: add support for Allwinner H616 EMAC1

 .../bindings/net/allwinner,sun8i-a83t-emac.yaml    | 13 +++++
 .../devicetree/bindings/net/snps,dwmac.yaml        |  2 +
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c  | 66 +++++++++++++---------
 3 files changed, 55 insertions(+), 26 deletions(-)
---
base-commit: 26ee8cd69d46a14b37ba5e512084fe80d730127a
change-id: 20260914-submit-h616-emac1-v1-143703842abb

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

