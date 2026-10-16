Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A18F45040F
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 08:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792141014; cv=none; b=H7lYFitR1xXnF1BVV+r+mStq6UoCJh4V8nOPGySXYXnnj+DAFv8BpP0KHcQdzJEqmh5yUt1/9+UL44Em2p5R178fsUTuHF4RweYRq+BA+JHSO6N7IjWBHXB62enMEnEhIFB1hUiJoALwMdQ23yD1pvpmBM0UU3Ic+G4Yuwms89w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792141014; c=relaxed/simple;
	bh=YkXszimtwNYxX/s0QEul4OMgnFGKSMEKdd1MDqGTukk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eSt7Du4b/HkjS07/YvC+/ZPbW9TrOC9RDTsWy56tmyMowXXl7e0WIdzmPbj3DSX+UO1pW233jJtptw0KlmiBDRHUiJhx7QFbSj6OmN5bd5j0EvsM0KZXc+YVs6WJpZRtvn34/Y8v8tDE9Z4gGBmBR0OgB1dCA5olf7C2koaUGac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kDa0cDIZ; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kDa0cDIZ"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-ccb5faf0678so418342a12.3
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 01:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792141011; x=1792745811; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4t98YFhToVmXSdqpvYlx+jh33cXkNHD7dPs1AUtblco=;
        b=kDa0cDIZn7saGLH+mUmFYZZPGPuj6l14N9qS7GHtuWxiuJ0V1St84dOkhoyq7UB3Ti
         ACn2po+qbNonpbf8n1/56RImUcSHoMAzhq/U1etcyaWStOtKkWcjIkFkNNWAYzGv9I9k
         rNjanC1fmLGG3VheuvwpfKWKinSAUfnzRHwybcWXpM5yg3Omz4Rke9Q2T1MNHUegcC1R
         LCsoJrDJ+qTZyZ7TbVKj8oaKpw9N2Zr5rhMtYq82CvqIO7/xaSIdoFzdGkpKbIBtdoMv
         a87Y8fh5S64BbS/TTAqm+zEqAwIVJFb0FOYJDRO/U5Mrjtq+s7iXP6ju8nOWuEzzyjN9
         6HLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141011; x=1792745811;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4t98YFhToVmXSdqpvYlx+jh33cXkNHD7dPs1AUtblco=;
        b=omftGh39qNOPykYVaq54S5yW+VRHFgvEMasgI8B64fbVZBjEMmuC7asxnXjaVg10D8
         MKk0biouwW84EBkM54JXyR14NeKLPBlMya/surkahf3zhOIFuPIr1swsCJNeDp2NKSxN
         rouVN12dHE3eBWe+eXwo1u9AU14tjGu5+FYZIxYqeHAA8IqiogYhMRZ4aD12EFhet+M/
         cjH4wOEukhDDyEANzT2kDOJvKynYezgww2grXEWST+5VdxmPme2eJq5L1gfs3ROQ+KRs
         gHzN8LXEA80ja099C534O0Q46geGCxFG1lq/ReEsuOpqHu1oGg6o/6sJfmi330ks45iR
         gIhQ==
X-Forwarded-Encrypted: i=1; AKwUvBzXcYzZb4n5epS5Yp3tDfuBK5EJBYANPa72kVw2yPmWrk8TYilWgrD1MLDmbiQNBKe19yEhASeSgDTl@vger.kernel.org
X-Gm-Message-State: AFq9FYJiSdb04SsweEfko4LgK5ApExbThBgRI3RY+0AswGkZupUFvdL5
	5Pm7J5N6VQfFjPcoaggxQ6PQMeUq36pyAuo28K1FAkdLxJ3942fxGhZR
X-Gm-Gg: AYBFou0Ak47eCVjXVilAVPjEWl+NYMaLWJuzH+4qFuAMq6+zRUyxismQniV1LUK3Wu4
	JDFDhMtlhBI7yJvMMLnD5xKPz0qfd8dlY7AzNUQHD8+iyhr6ssDuoPNLTaW9UGM+X7fizhJLDeX
	zfjk7ggprbNAc74Q92TPhYoP5rJE0LbkMAkUowezOxLEdqvJl30uV+VwwdgR1aMrv43HMCRW+SR
	2p1Yg3xivAuiH504e+OrTPcpqyEuWlaHMDpeMYpEUzae5dK9+glCm0UWy1SgA28KD1Quu989Xll
	H3mU/AgHKk6YD+0ee3Py+X+NWANQviTfKm4muw1TjL6ZHJmCtlyGY7PfxgSEIthgVkSDEfBJWKK
	IrVvUsgrkIX7HXIoewgksoudB8OzS9oVqwcaOlP5pDR8OWjDPIomGyPEIIz3//KosP5yPfkfrJC
	x/Fxvk+K+k8Wtvecyoiz+yCh7ZsTr5jSw66H094iCia6s2N+b0lVLx3kLcnmrGv/McdkdaARwk4
	6CAePHTDoJOHYdVqiPk+3zPU/1cVQ==
X-Received: by 2002:a17:902:dac2:b0:2dd:b95a:e1db with SMTP id d9443c01a7336-2e8429a9f89mr307105675ad.3.1792141010736;
        Fri, 16 Oct 2026 01:56:50 -0700 (PDT)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e882a20sm6971025ad.62.2026.10.16.01.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 01:56:50 -0700 (PDT)
From: Jason Yang <jason98166@gmail.com>
Date: Fri, 16 Oct 2026 16:56:35 +0800
Subject: [PATCH v5 1/8] dt-bindings: phy: Add PHY_DIRECTION_TX/RX
 definitions
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-dcphy-rx-v1-v5-1-e63b49eabe2d@gmail.com>
References: <20261016-dcphy-rx-v1-v5-0-e63b49eabe2d@gmail.com>
In-Reply-To: <20261016-dcphy-rx-v1-v5-0-e63b49eabe2d@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Guochun Huang <hero.huang@rock-chips.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Jason Yang <jason98166@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792141002; l=1157;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=YkXszimtwNYxX/s0QEul4OMgnFGKSMEKdd1MDqGTukk=;
 b=LEId1ZHxKIWdktOliHM+CAcf07+0pEcd9I8lHvqF1BdgteiRACfEYBQ+XTP3tpx89PFHzEumx
 aaGdm4smqtiD2t/AMT7acnwO3RJ+9CO4aUpskESVMlXGNjLOdrzRAUn
X-Developer-Key: i=jason98166@gmail.com; a=ed25519;
 pk=xQmD001Q/ooHl39PxyQtusbUQmgbOsSfpFryRVWZ/k4=

A MIPI D-PHY or C-PHY can be a transmitter or a receiver. Some PHY
blocks have one of each and can use them at the same time, so one PHY
node offers two PHYs. The existing cell, PHY_TYPE_DPHY or
PHY_TYPE_CPHY, selects the mode of the whole block, not one of the two
PHYs.

Add PHY_DIRECTION_TX and PHY_DIRECTION_RX for a cell that selects the
transmitter or the receiver. The first user is the Rockchip RK3588 MIPI
DC-PHY, where the transmitter serves a DSI host and the receiver a CSI-2
host.

Suggested-by: Michael Riesch <michael.riesch@collabora.com>
Link: https://lore.kernel.org/r/7425ac83-f6d8-4443-a26e-a47f9306aa24@collabora.com
Signed-off-by: Jason Yang <jason98166@gmail.com>
---
 include/dt-bindings/phy/phy.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/dt-bindings/phy/phy.h b/include/dt-bindings/phy/phy.h
index 979b5dfd8353..9ead74d9a172 100644
--- a/include/dt-bindings/phy/phy.h
+++ b/include/dt-bindings/phy/phy.h
@@ -29,4 +29,7 @@
 #define PHY_POL_INVERT		1
 #define PHY_POL_AUTO		2
 
+#define PHY_DIRECTION_TX	0
+#define PHY_DIRECTION_RX	1
+
 #endif /* _DT_BINDINGS_PHY */

-- 
2.43.0

