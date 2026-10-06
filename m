Received: from mail-pz2-f6.google.com (mail-pz2-f6.google.com [74.125.228.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7223A3DDDD9
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 16:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791304106; cv=none; b=aOit7F1FqFMaA3rmgDZesNQ93u9h33Yf0BY70cwb6s2GFjAbpnAjBH4rMQEq4nXQAkHUFSEyKhjmcTGWQlgoPQ1syBumZqVbmqTjhCM+Jri6NyuCJsCw6G454T5vINA6lSDEYCuh1wcdn1G2VP/hmd0JFLTOV959QoYaDUzh5XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791304106; c=relaxed/simple;
	bh=sDHHRO7gl8RoIlz2pzAIq0tYPtlBsoMIZAAmczwB9VE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bvRidfvftG3SbpnY94dQZheN7530lwU2xwywFtT15QTG0o9xSkLOwwk5dDy3mAdDMh7Q9FIpQuhUHc5o2pP8XpcQtpinc3RtB4yIzo9ryRf1jw2xvwN9Eo4pmPLPk5MwkNkKyx3wf2nndPXyH67GHYc27buXVcTMhE7QVreCT40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N15AXsrn; arc=none smtp.client-ip=74.125.228.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N15AXsrn"
Received: by mail-pz2-f6.google.com with SMTP id 41be03b00d2f7-cc7e91a4eb3so63732a12.0
        for <devicetree@vger.kernel.org>; Tue, 06 Oct 2026 09:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791304104; x=1791908904; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q02YVAiwMG2tOYv3d1XG68tLbO2rAHXBUJNR5QhKuw0=;
        b=N15AXsrnOVniqrVa+/Tq7j9cyrdqqiOz4Tp3LlCms0dS+zJci/GZWY86yep9CAPD75
         qQLNLnzbd+WdTzBr9kS5QhEzDB9g14FjNTnvviNhY+CTkiDmRw5DXF2jkmBfoU6XaBpV
         VXCDXM2nyrIMaaF4Y+lHtAAQ1ZzBGen8AvCqeDmBX7HinrHLEbj6yZyd8hWnHcY3yNBH
         GrF/RL+UZ+/MXG7Tmnn1z7Uug3iv4fWvGU8wVTeijA7DLyDhmewDOcs+slOcIo/20hJg
         hmwg5QQAroAMXho5Bd+aruVgrzLT1wwFQODC+ZjhNZY39krRgDbywaC7gkZ4kR5I02Wg
         Skcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791304104; x=1791908904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q02YVAiwMG2tOYv3d1XG68tLbO2rAHXBUJNR5QhKuw0=;
        b=sqFs4DAOwYZFaURBUcunS7s9aM1AGhbzdLiNNstHKueDwv/hFM0J5uwPCeYMSBUWlv
         tSeN2Qid4nOyXjmoSt4hWFbK4FoV5oExu9h9oOhC1idYv9R+MgS+TA2354OxM+g9VzBo
         RPpMHA7ZCxZH/yOOjqU138rTZJ7soeERLWADjF6ykfv8iAc8mtWnltEtCcu57ti+fGfl
         l5aW+1ijDxJlo0AZWzS8IL2DSH99tgo/k+xkj3eNOAzDUazLZJsDWs+yGdkHI1RY/lwG
         A806cjRkbdGqJimgJ0yDRp5ysnlDO+PqTiH2NqDn2Mo3M8FIo8Hy6WnPfy4jEOabg9Ny
         S17Q==
X-Forwarded-Encrypted: i=1; AKwUvByRqtrLi/w+89DnmRfo+QBzMMdWF/nM0JeNxz7Q3OclESb2uNN73Z8gsojKcQcMZ24Qk3WS1IvvHhXe@vger.kernel.org
X-Gm-Message-State: AFuF++m+gXDDxGfnUR/YyNOmf9q5D9r14F+o5bIJWjYMgKwmENuqAmFd
	3fjob7CSRh/CnQpY+SRiJsz8Kj/gUy7xULkoJ5ZbpKYC+jO5B7LTCigl
X-Gm-Gg: AYBFou0WlmxtxABdJxQ1bF3D5UnmBJO9czjAx9OEPsjn+RTzvul0gczLqPosC8C42v3
	pHQivoUoxg46ZdKVj//tRSMYy4XGqADC4zjV6ZbqG/3wKrRWGOBuWekZK5hOkVNo2t39uZOqSmV
	cP985NfO1LgbADSCqJ762Rn3Q83A1Z4b6c/hepUMasfxN7NtPVsgmP9FkY0yVwXWWZh0QlBwcmc
	1jGO9y6IBoEV3PxLIG5tQrrPPVuLBNMGPhSPsiVwd5mYqh0ESwymq0KtcpQszpJPxrd0kK16PkM
	JkE2oijuF9MKYAM/KTAS48v7Pl2hgWYjbD9ltyw7+WgODXakypQIrk4E8xU4Dz8CzABARkssBZ2
	j//952LeWeZrwitCHgpqqsncw0rqyQiqyjQ3K2/cu7lrJ7DwE9A2VE+xjmy1gf0Nq1MO0yzGujv
	yOD9a9GCZiAs58TeUzdv7FESfuOWGNFHVGlXj6+OvROmt8q5NuzuvfR2niTSNC7Gvfxojl
X-Received: by 2002:aa7:88c1:0:b0:88d:8074:1a8f with SMTP id d2e1a72fcca58-890ddd021d9mr1195882b3a.7.1791304103604;
        Tue, 06 Oct 2026 09:28:23 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89188a0d603sm259898b3a.19.2026.10.06.09.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 09:28:22 -0700 (PDT)
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
Subject: [PATCH v13 1/2] dt-bindings: phy: rockchip: naneng-combphy: add rockchip,sgmii-mac-sel property
Date: Wed,  7 Oct 2026 00:28:05 +0800
Message-ID: <20261006162807.2843858-2-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006162807.2843858-1-coiaprant@gmail.com>
References: <20261006162807.2843858-1-coiaprant@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On RK3568, the SGMII interface can be routed to either GMAC0 or
GMAC1 via the pipe_sgmii_mac_sel bit in the pipe GRF registers.

Add the optional "rockchip,sgmii-mac-sel" property to allow the
device tree to select which GMAC controller is used for SGMII.

The property takes a value of 0 (GMAC0) or 1 (GMAC1). The hardware
reset value is 1 (GMAC1), but this can be overridden by setting the
property to 0 for boards where SGMII is connected to GMAC0.

If this property is absent, the driver leaves the routing unchanged.

This is necessary for boards such as the Ariaboard Photonicat, where
the SGMII interface is connected to GMAC0 and needs to be explicitly
configured.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 .../bindings/phy/phy-rockchip-naneng-combphy.yaml   | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml b/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
index 379b08bd9e97a..442a1df193ad2 100644
--- a/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
+++ b/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
@@ -80,6 +80,15 @@ properties:
     description:
       Some additional pipe settings are accessed through GRF regs.
 
+  rockchip,sgmii-mac-sel:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1]
+    description:
+      Select gmac0 or gmac1 to be used as SGMII controller.
+      Set this to 0 to route SGMII to GMAC0.
+      Set this to 1 to route SGMII to GMAC1.
+      If this property is absent, the driver leaves the routing unchanged.
+
   "#phy-cells":
     const: 1
 
@@ -105,6 +114,10 @@ allOf:
           maxItems: 1
         reset-names:
           maxItems: 1
+        rockchip,sgmii-mac-sel: true
+    else:
+      properties:
+        rockchip,sgmii-mac-sel: false
   - if:
       properties:
         compatible:
-- 
2.47.3

