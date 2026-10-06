Received: from mail-pz2-f6.google.com (mail-pz2-f6.google.com [74.125.228.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438F249CF40
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 16:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791304100; cv=none; b=R9hQLdCDXZGL7LqpP6oe8s66CxQMWd31pvi11osTJJjY9Rh56UGb/GWOf11ucE25qdehTn/ZvdMCZKC6GoCEhA2ZVQeax7BOX4sHzSBcAXa28a56gN1G2eiFoIaBaYHzRirAOeEaaaz+oaR163ORlfjUBwQRjwRKub8dwX0baKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791304100; c=relaxed/simple;
	bh=hiyW8Ip4dlaQ0Aem4POCsGZGRN80n8JOfwWDEi4ASNM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DAJTqPvNC3zYEeUb6J/NbPOQ01MMoTlMmqdDtAbm9m6QfqxxJMoOfkTfIzdMiM3jFpHTJnXCkzGGyCu8FSQkbw2+Q4HnXSM7l+yRWMqx5wV6J7Aa64CjXGjTIWr5kkM0y1QZu1PKZK0zUgBKo3exvZ8VP1LBB1bMyvQhNsCIkXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L+dYQeSz; arc=none smtp.client-ip=74.125.228.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L+dYQeSz"
Received: by mail-pz2-f6.google.com with SMTP id 41be03b00d2f7-cc790c60953so415138a12.1
        for <devicetree@vger.kernel.org>; Tue, 06 Oct 2026 09:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791304097; x=1791908897; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iyS59LHL863YniTBRLDQIsOwBigLIOw+B5p59bUiqbM=;
        b=L+dYQeSzm/fAIbCgqtrhUyusjiQF/TQDET24kidMYbTqR81/kNljoj6DHLgo1KDYa3
         1Iamww6KgUssGhLE63wOM5I0OVOR66fVQ2Z/b+npoOq4C+hzoWnfTS8fzV7LMsHUZksC
         jjxjwbuSalNoBZDL0tssjVsCGmVMddwQy/ztFZT8Zm01SNKJwad2H2l5HFnffQYs19mX
         zvpsbb0Sbl6F1rdyLo1znxdnieqC/3o8znsKm4zdhU8NSPQetT4+9o0NS6bvNqpUtiun
         M1uzYSIvp8Ha2/+9rv4P9pVktawGGvFTx8VZrP3fGUiJJsbUTwfaEWsBw6l7J4WEBvgu
         Feaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791304097; x=1791908897;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iyS59LHL863YniTBRLDQIsOwBigLIOw+B5p59bUiqbM=;
        b=uuDaMLGIMmt+cBRfHKVA5nyXDJWRh8I+9s/9Etp5doxZB3anPtR3r6LsLOcOSv/td0
         T0XNn0zG70gPLQN4ckhayXehEFh0aBorau/6zO8KLvyKqXFrXUjX9qWEz9FVWOwLDkXX
         Y3zqAvRONgs/Med2hw8vkIzLQKQSnLUL/BvDmoqOKlWZUa09jNvdG8pttpHXjQCRgOM7
         H1KVKwAg43ygzfpPaDJMx1NFq3jlUv8jOvqScaDl39eYPmyCqyQgPi+njalSMJu5dCYY
         4sI1S2/cVAGmWblK8J1mEcSiCNtKAkBnPnqupixoDzPDNusYRUqEespRI+No8Bqqs73k
         EPqg==
X-Forwarded-Encrypted: i=1; AKwUvByiOGOw6Pg97jrIEkWJsj68L07VXlXWIUwhqyQG+VPBqESitOLaqhYLPoNwn30wfnRFrSfPbF6qb2z/@vger.kernel.org
X-Gm-Message-State: AFq9FYKbjoeCnKvpGKTwkBXVckDcB5+wYGcsKzeuWNYD9w4ZFDX9THuE
	kR7gxKqybtdrdbWf/XiLGvXb/zSOmpF5xHoTiyCbkrtZAZoBWUFrkXM5
X-Gm-Gg: AYBFou0mt2VdatZ/RdvX9qpPBtDxQtKGaA5J5EI8/dI/5pECEOhMOheCphOsPowsf2V
	dG/4iSIkTguIdtBgFMNQJBQF2Ce/dyPjOmBf2pVX5Pm5ZRFvTtccQhY643MDA+lS37AfaDI9cUs
	n+dD9Z15DIm4mHFK1ier8KEg0p/kdAqbGf2a58b9AX2dCJR9+7Mg0umzvIZL6oiU38Hgr4jZsk7
	Bqhn6aCx8GJicF1/LOYDKDWmNB3dFXtLMNFoEdp+967TkDh194MG/KplsnjOx9KObsZdO8v1z2c
	6Z6XN6eUN5PQtRq3Rcc3hKQR2t3FxqSMKMdYFCl1Qp7iGJXsToWuahysKPYGM3lPc42iecEaUZV
	XCz1eG7u6O5aP/8xflrEypIPdOPp9hDdafpgGQAK2SvEbAgmKh7LueaDHz5E/UuUFuiSXJ44lKn
	okUASuJrcb/lSKVcJXXlEeNziZHZLwYuUraXRH/6eUSuNsU/mG7lp8mZwmPLNfGONc+cWW
X-Received: by 2002:a05:6a00:3cc7:b0:881:f5e1:6e8c with SMTP id d2e1a72fcca58-890df4ab129mr1783463b3a.33.1791304097548;
        Tue, 06 Oct 2026 09:28:17 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89188a0d603sm259898b3a.19.2026.10.06.09.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 09:28:16 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH v13 0/2] phy: rockchip: naneng-combphy: add SGMII MAC selection for RK3568
Date: Wed,  7 Oct 2026 00:28:04 +0800
Message-ID: <20261006162807.2843858-1-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes since v12:

- Only write pipe_sgmii_mac_sel when the property is present, leaving the
  routing unchanged otherwise (Shawn).
- Validate the value in the driver and reject anything other than 0 or 1
  (Shawn).
- Drop "default: 1" from the binding; the property is tri-state, so no
  'default' in the schema is appropriate (Rob).

This is the PHY part split out from the v10 RK3568 SGMII series, sent
separately to linux-phy as suggested by Vinod and Jakub.

On RK3568, the SGMII interface can be routed to either GMAC0 or GMAC1 via
the GRF register pipe_sgmii_mac_sel. Patch 1 documents the
"rockchip,sgmii-mac-sel" DT property, patch 2 adds the driver support.

From the RK3568 TRM (Part1, Page 229), PIPE_GRF_XPCS_CON0 bit 1
(pipe_sgmii_mac_sel) is defined as:

    0: SGMII routed to GMAC0
    1: SGMII routed to GMAC1

The hardware reset value is 1 (GMAC1). If the property is set to 0, the
driver routes SGMII to GMAC0; if set to 1, it routes to GMAC1. If the
property is absent, the driver leaves the routing unchanged, so the
effective value is whatever the bootloader or hardware reset left.

This is necessary for boards such as the Ariaboard Photonicat, which
uses the SGMII interface connected to GMAC0.

The DTS changes using this property are sent separately to
Heiko/linux-rockchip, and the net-next parts (XPCS glue, dwmac-rk SGMII
support) are sent separately to net-next. There is no hard dependency;
the pieces can converge during the merge window.
---
Coia Prant (2):
  dt-bindings: phy: rockchip: naneng-combphy: add rockchip,sgmii-mac-sel
    property
  phy: rockchip: naneng-combphy: add SGMII MAC selection for RK3568

 .../phy/phy-rockchip-naneng-combphy.yaml      | 13 ++++++
 .../rockchip/phy-rockchip-naneng-combphy.c    | 42 +++++++++++++++++++
 2 files changed, 55 insertions(+)

-- 
2.47.3

