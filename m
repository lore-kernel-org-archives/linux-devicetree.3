Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C634E477E2D;
	Tue, 28 Apr 2026 16:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777392851; cv=none; b=eKS8rKmAkdBUCpbM8vZ+9NSglWw8/bIDdLyJK0o9REsNcOtA0FQhZZLvOmWjdQR9DzXd7Bv0mvmFb/7ZgYmcWA0TdyRYjygW5QCIeshyQ4Q4MQJRp/OicXGCV6i4AUZOnNs/HmESCF1OftAEZiI/gHW1s2MkEMJ3VxfgC5dCo2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777392851; c=relaxed/simple;
	bh=hm1hwqX12MMmcOcx+mUmnef+Uccffb/i9jFQzzEPLQA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jwODVCW27jQlgsE3qS7nG0elcLz9rnliiqXBLCghSXo0dwkwtorjkwM5pQZ+ZYCpMmhvFE8f3jyGokwmxkkfWlFsXucunFylZXU9tqVJMudQUsfgoGcjcFoavPWjY62+Vhi4QiX27Cj14M0bHobjqBSGTwEmM4Tjc8upKByRPak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=U01CRmYc; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="U01CRmYc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777392842;
	bh=hm1hwqX12MMmcOcx+mUmnef+Uccffb/i9jFQzzEPLQA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=U01CRmYcRmVIsSolJHd1twJqHsbhmtWWRlK0ZV+vx8jS5vXHFPjqHJChMZcUk07lr
	 TI1biwMMWOe/J+TH2o2VeAkvCZIjOFLIP8rZ4XFAOKZ5mT8ApTRYYVpFPZSfnvSH/j
	 shNomPytuuz+5ZHTH7L97dWUT+4gH+GcaWgh7JS+qkXkpQLufETX1M6423+Tut+Ffl
	 OOgOyqaNqKsLgZVXFI7J2eVqpJBGF4yDJRNP/i7pFHMy/IbJxvsUD53h7swL8K7VjZ
	 6zurW9x8QdJ4PCyV0mkF+BjV3a63G4XOTzOl9rZBJ91Fp8u+N9K45z4nFUVPVqc5ql
	 Pr2q6QPAthi9w==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 56A6217E15A6;
	Tue, 28 Apr 2026 18:14:02 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 934EF480061; Tue, 28 Apr 2026 18:14:01 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 28 Apr 2026 18:13:52 +0200
Subject: [PATCH v4 13/16] phy: rockchip: usbdp: Rename mode_change to
 phy_needs_reinit
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-rockchip-usbdp-cleanup-v4-13-7775671ece22@collabora.com>
References: <20260428-rockchip-usbdp-cleanup-v4-0-7775671ece22@collabora.com>
In-Reply-To: <20260428-rockchip-usbdp-cleanup-v4-0-7775671ece22@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@gmail.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1849;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=hm1hwqX12MMmcOcx+mUmnef+Uccffb/i9jFQzzEPLQA=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGnw3MkGqm5aAX1UQ2T9KL1PCkegp2zPPVdsU
 UjQTJC2P0pXyIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJp8NzJAAoJENju1/PI
 O/qaUTIQAJtrmZYeZ2/Ua3NtDTAumruL/6iiTtFdfJIoM9DjN2Z7ZYeqo6g6PREZOHin1HyXJp/
 OkpnqJ+BWr2yja2Xdx2cEaDzxg4iUzxtQ6YHOWyBB+fA+2tTCEf1heWwR/DsL2Dtj0yJbJEEQ6u
 LhAJdHXgGSJ4GmZYoHThlvyEvYm50kDk3ZQWh5wFbB57aKc4YcTkxF3uLNVzr3XjyzCWw/JbuTI
 0cw7V8H1aLxk0u6jHzdZ1RMwjULKjcCW8r0I1nB6uTReiR/csnrzJL4ktIzgBe5T69UN9OlqFq8
 Vu6c+pAfuqTvx2zs32pC3Brwx/MMYC2C3dH3Uhu7owtL6yrvzZhBZgSwUYgFwTHJjo7oIt2TorR
 gID9G2GnCYNkqnKBCMeNNqqLlh4r8uegT2s4lMPdBniIY2tJUDE1H4ND4lAShUDpeHwUVHrHrgf
 AXmFPlh8IrMpvOsrO7dunpdINr4C5vBwm8IFlMs/LYejr61HJGukCdOWFasO2T5opD9jfREUmE+
 3b5R2wPUNX4oym36Ga/FAAZUUoN63I/Ne+6CWSTqgkkyBsP85dJwf5ssiFTPZF9Z/VlPadKc07p
 KYPUczLFpZSqL3S7jpIZLGbitCejt7BtZtX9mZJgmRBVvcxDilczoTxW2BVRIeo1bf34XrNsMrB
 OOhBsZ7FT+7ydBQ2LcSYt3Q==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Right now the mode_change property is set whenever the mode changes
between USB-only, DP-only and USB-DP. It is needed, because on any
mode change the PHY needs to be re-initialized. Apparently at least
DP also requires a re-init when the cable orientation is changed,
which is currently not being done (except when the orientation switch
also involves a mode change). Prepare for this by renaming mode_change
to phy_needs_reinit.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 3f1233f50686..694832cc161e 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -172,7 +172,7 @@ struct rk_udphy {
 
 	/* PHY status management */
 	bool flip;
-	bool mode_change;
+	bool phy_needs_reinit;
 	u8 mode;
 	u8 status;
 
@@ -582,7 +582,7 @@ static void rk_udphy_mode_set(struct rk_udphy *udphy, u8 mode)
 	if (udphy->mode == mode)
 		return;
 
-	udphy->mode_change = true;
+	udphy->phy_needs_reinit = true;
 	udphy->mode = mode;
 }
 
@@ -970,15 +970,15 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 	}
 
 	if (udphy->status == UDPHY_MODE_NONE) {
-		udphy->mode_change = false;
+		udphy->phy_needs_reinit = false;
 		ret = rk_udphy_setup(udphy);
 		if (ret)
 			return ret;
 
 		if (udphy->mode & UDPHY_MODE_USB)
 			rk_udphy_u3_port_disable(udphy, false);
-	} else if (udphy->mode_change) {
-		udphy->mode_change = false;
+	} else if (udphy->phy_needs_reinit) {
+		udphy->phy_needs_reinit = false;
 		if (udphy->mode == UDPHY_MODE_DP)
 			rk_udphy_u3_port_disable(udphy, true);
 

-- 
2.53.0

