Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873F24A485D
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 12:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789475922; cv=none; b=Q2gdKynfYYZoUGcrf8WM0NqLOY8Fh8x5MJZ8856WXWQHz6GZbu4qK1nOd/C35HudtQ9b5PbJIAlxOGOmFwYqBRoOYK1DoQzHB8fKCk0vPQl7GYC4Ms0xXPgeELwDm5evyTx+rsduyIVmyzppbKnkoELLnQ8I3DGE1ZwICOQCNLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789475922; c=relaxed/simple;
	bh=EcLMSIMPzyh+0/FB0Gs6lMGD0LoZklRZjkrW967TF1M=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H+VuKV6iTUy1Gy7nzSsw0Ymc4lVW+LRUnC5ZkP1c1Ot1eKIkmIErRbxy19QV2w65IC7CnIbIvmIgBepAApsHqFxIEwVz24diNaaH9ZWtL34auqHF/QOEh6LHc+VS8/0T5AtWgGys5Q9LU5+FjCorSNHtnXZnwY2eZEh6VoALHWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OmUEU6Mf; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OmUEU6Mf"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e4ad9so1237215e9.2
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 05:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789475918; x=1790080718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9DiXn+phYCGaEDpGaEGNQSOv3DEFlZqBn0YDd/SEo94=;
        b=OmUEU6Mft5xtkdH29u3QXVXMsJaQUQTqRt2HygZlikmQeoWryuWvEXpNzLwJy7FQf6
         DO4wZrdS4SGLixWrOokbrtRcPm6It2N0E7885rgu/LszreIzG0CYZPIjqPv/SJ5Le82x
         GDYxxAcYWX6Rl/OIehOOTRRGGtM/A3imLbXXosDreHNS1TzTXnsAhrHBspyPUdodovW8
         pNSiwf6GpDvV23Xn6N1eA8geqF6OhZ6Pb+uiEkeCCb3uJ4/12W71Z+C5EsyJknBQ1kkl
         sdChuJ2caJLXuj8yLnfdYOf1ZHunigsOWxB8FUv1Tpt8UCixGV+rE0/lC332J/mvDC5l
         YF+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789475918; x=1790080718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=9DiXn+phYCGaEDpGaEGNQSOv3DEFlZqBn0YDd/SEo94=;
        b=gm3UP4BdLWjxVQAhTK+GpOl9ON5fQPVNRajys7C6J6rd9zFbvPeVq12iHXJ8FFjSIk
         P5iNhF7hpAOQNtb3HEijNdYzyGEMda6RGdEcXkeDaIxSiKMYheBhiNGV3G9apEXKFyXd
         edT2U6rcfZmSuFeTUIUiqrU24+4g05WXQhX4QDbwFItNm+HNwQxmbxyeNfiWsOpLqH+o
         Kc4ogby95/hHuULXg7A6fNrp7BfsDu3Ip0ewditV+ZTV73BXOFkeKPjl0QcbPBdYMFVu
         JuToG8jd879lB+4Wa9ouMeh6d+k+eH5rO3C5EE7s547oXm7PjE02ajEdRxhltZ9NnCSs
         svEg==
X-Forwarded-Encrypted: i=1; AKwUvBzt/ynLKpY78V64RnTGRWfAhf8seazMg2FwhGzuIAfdQluimlMVGP+VtZWOxVS01UCFkqZvsRlsnLb3@vger.kernel.org
X-Gm-Message-State: AFuF++kOpv6dOBO/RNnYBK1RXtLbtJhVLAxsIKPWzBu6R7KOifF6dpSn
	UqGiv4p+raXdykWfUkNkhZ+rqJ211Ni9bNW2Ez+cgL3aRr4gDrly6j6Q
X-Gm-Gg: AYBFou3UPmBIURYOSQgtjA8LVtTVuSrcSRodKCOao3XcC5RpzQVkYZT1LiH6kRoIfyG
	95rPqUyr3rs8AIEti7MZ3nievBZ99j9FY7Bca8+J+XW6xnVReoHiNyUDaJPlizrlNF1kart9Wu8
	qhrZ0PEcKXPhh6A+sEbGD5aV0W9GRo56U4qT89OsFWMdrZDsgjQtGsLp/UfPPKV7yupoGdSWUHk
	UOdx7x8ovHEZ9ndThDmLQ1a9BskQP3OXR2HLtfG8dqgvzM58uMCaKkFyqhnIuhik0knu6mpK7/n
	OfyaMLIPchPLoU0TPzX5GLCYzmORCSG4zrxhb8zCxMNt33u4e3x6YHIiwpw1NfRWvZBkdijZSFN
	Fh7F2uREIRTyyzVfSD5XBfMBpnUsYgPoe6jJcjxwsQSpScu7QYk1bOMQpRDd54auJFILzXClVB4
	E0jFz4x6C7inNYITz8jSgx3vbwmS72XKvIdoW2JfXNSdLZWGGM1NWwLGNkolFLIXy9ndalWPv7F
	zWfmpLyZxFoHw7zxhfSWJrPLY9MmVlc/wx9Bm6mA9T5VLkh1gTKmbSvrF8UG0S4a25u/J0KuLw=
X-Received: by 2002:a05:600c:1d01:b0:49e:6de9:62e8 with SMTP id 5b1f17b1804b1-49e8222c825mr13854845e9.6.1789475917733;
        Tue, 15 Sep 2026 05:38:37 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49e7d6a8d5asm62958635e9.9.2026.09.15.05.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:38:37 -0700 (PDT)
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
Subject: [PATCH net-next v22 7/9] MAINTAINERS: add myself as maintainer for Airoha AN8855 Switch
Date: Tue, 15 Sep 2026 14:38:04 +0200
Message-ID: <20260915123812.14747-8-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260915123812.14747-1-ansuelsmth@gmail.com>
References: <20260915123812.14747-1-ansuelsmth@gmail.com>
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
index 0e04d92d1b09..afe9d363ddf4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -759,6 +759,22 @@ S:	Maintained
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

