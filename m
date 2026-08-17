Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC303C9EE8
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 08:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786954862; cv=none; b=uCy0oekeep82VDe+1r+08k4uNIe/Y4kWozjBRT6UU6gWLpjJHMdJ1CGQ8z6zFfvCp+CQlTtwa8aH7QvafGjgaIj4+U6GtW4OtfQbp72vkTueaYB8TWCp8lKo8DYkjBiRZEPsJ586uUBit7fs1ItrWHKYUzzMOjFg0bmOk7i4JsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786954862; c=relaxed/simple;
	bh=QFgNYbC5iGgbyr7HDWbqxazTnqPm94Iv99RuR51kLAo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gNPlXzPHq0KvNOBtQm8O5/LryFz6Seg+UjvhNHR68Y4gU9o9bEbtSO95Bz59sLYFwNUldvv4eHo+127G9Ec6gmiGJsTcliwqEhHEjgn/EtBBlB0WLoDBkAj1HHLzQQMQoTv0Bp8AgC/e364qgx1LNWaQOhSVNFNx/TzR3zSnfoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hik27C2P; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hik27C2P"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-495590dde14so38483005e9.0
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 01:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786954858; x=1787559658; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pzi8GymOZsAzDRFxhnMcMsHjxOXoqegqJCBPzRg9+sM=;
        b=hik27C2PaFV92pmWgNH2vq2WiUXsWv1uNAUAN2a3lhttZsmyBEFXWzzCyZ3oWiVbNh
         uUfeCzPVF2818dq/eceyNqls9lCG/zM7QLGFaFWqmmMzHuTByvLTeZ/tCfYDYWo8vCyP
         J4llsfCZyVIM7JkhOTFHuZjX9MQMNlolpv0aNHrlBIGfQQZfOilHe5CabrLxCnTP7YNv
         /QWYJHI8Yxljj8ZvKblrJ+PbCMjyMtBp+Ma1uZsFeMcIXNN3evHLtXQjY/F780xUjrmV
         RoRytLtVhXHu9sp2Zqd5LAaH0/SXlxCv+E34WPytdXZMNbQEOI8cai/mLMJDWRypYsLU
         TGuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786954858; x=1787559658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=pzi8GymOZsAzDRFxhnMcMsHjxOXoqegqJCBPzRg9+sM=;
        b=bAJKvwvgAwTi4klT7vvgu0Tr0/PXbNubn9P/1v65uwDnm9TaC9bzY/nAqZgf1pAXrt
         7KipepHHbDOcljOQNcN0f8LHb8+Urq2Uj6pi32HNwAxXv3S6qCUn9PZoVYIxq5Ba1AZQ
         aMhXY+vuUt2GtOAUXH4bx5FHTfjfCL97CpWbydWqZdGkbg4QfKUjkBMRDOMOhdsIzjIu
         NxD6Ofth+Y+q+xyaCh2O8u9egDIOXwn2S6HFn2/Ttf4f7uqfQG8aLCTFdzI+v5dIbi+I
         c0rl1THEc3/78+sY/drK8rgyvycWxIqtD2j8Z6ATwDBMF+WEwmhaKWpCtzj2Z84EgbhJ
         1jQA==
X-Forwarded-Encrypted: i=1; AHgh+RrX2Dgu4KFe4iHXLTwBe2wnPpqIKm96VU7aPiApQp5oKvde3KNCI1YoQsXbHUOePVVSqBedTgxjKTp7@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw8OpRA3wg7kQKlNA5suGt+BOiIFw7aRIxi835Say9W+ubwjmd
	Uj04y96rmF2BDYTTLqNcSpL2s7p/6fecErI6w3fwbBPPn60G3q/Fv5Qc
X-Gm-Gg: AR+sD13anukaOZlMOMvWN9ecU258z4CCAkLsNc+rjVYE1fD6H7KqDEUIskH0UQr0nir
	wXVP6hO3E65hoTCUI3hDw/HEolrqr05xfCYZFj0fwPuDClrS+QZfNbqIu+zbfTj1Qd+f0ZghFv5
	sMvqK8nYP4JBVW3s9vjK93xS9gV4omm5el+bGLAYz1VSgttG45g+tkBh54mnqHtBNJ+p/1rUWw1
	IPN0uLcZ8WYvngSTNGm83b0sM5hfhh0pVBiYNeFl6T0cddoO0nT3Zuley77LRnRGxN9POgNhmrk
	SOwh8FPsqk9nCK47y/ai5bRmNbYUT4XOviKVBdcu9gv7oEO8y7ad5M4pdwBlh0TyqVMndOV//La
	MSmJuim5BLkypDv/WThx1dq+fAw5/LDxcfrIi6gGj096QgSwHM06lZJv91N4ZE6pwy0beWZzBJN
	c6DCqx+pesajkT3DV7CIZH+jAIWP503CCHp6Jlbmfz148BGhlpXDNzkm4wYpp/s01blt+wA5/cf
	nDVLzJUlGFScBgShcyeX5pehiBhBOKQA+Dm1cAftExkhol912zxAzHY
X-Received: by 2002:a05:600c:34ca:b0:499:7f38:d77 with SMTP id 5b1f17b1804b1-49988cab011mr368103075e9.6.1786954857528;
        Mon, 17 Aug 2026 01:20:57 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-40-190-175.business.telecomitalia.it. [79.40.190.175])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4999d078517sm19684195e9.5.2026.08.17.01.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 01:20:57 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v20 07/10] MAINTAINERS: add myself as maintainer for Airoha AN8855 Switch
Date: Mon, 17 Aug 2026 10:20:29 +0200
Message-ID: <20260817082034.20326-9-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260817082034.20326-1-ansuelsmth@gmail.com>
References: <20260817082034.20326-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add myself as maintainer for AN8855 DSA driver and all the related
subdriver (mfd, mdio, phy, nvmem)

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 MAINTAINERS | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e0e7fae5b92f..d9338fd2f19c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -760,6 +760,22 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
 F:	drivers/net/ethernet/airoha/
 
+AIROHA AN8855 DSA DRIVER
+M:	Christian Marangi <ansuelsmth@gmail.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
+L:	netdev@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
+F:	Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml
+F:	Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
+F:	Documentation/devicetree/bindings/nvmem/airoha,an8855-efuse.yaml
+F:	drivers/mfd/airoha-an8855.c
+F:	drivers/net/dsa/an8855.c
+F:	drivers/net/dsa/an8855.h
+F:	drivers/net/phy/air_an8855.c
+F:	drivers/nvmem/an8855-efuse.c
+
 AIROHA PCIE PHY DRIVER
 M:	Lorenzo Bianconi <lorenzo@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-- 
2.53.0

