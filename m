Received: from mxout3.routing.net (mxout3.routing.net [134.0.28.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CDBD313E17;
	Sun, 12 Apr 2026 09:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.0.28.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775985830; cv=none; b=SVfZI25whoOSssbMoIiztuDVI2yaAgQLh+5e0WhBind4mTDkBVsPT9Ehv0J9/025LhEAuZDnjWiEjFF4yU/A42vPeVErTa4tshKUSAC9UJ6uKwG02/xqS1Wn5l5l+rvAvWlmMj5/CMp/9d7Q79EfIl7YD0F92cJKrMQY+xHAzjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775985830; c=relaxed/simple;
	bh=CC3KT3go5cwWvzBrjluroJdVlgJcS9Jc5IktAQQJQiQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ns/N99vj9tX/c5+gpEZS5u9SJ52NYvwh32Nl/UU4gBXTjXVEviL9XQRH3x49w54PsJyHbxlIGAL+Fv9rfdBaBZVbqy1alI2Cfqc6VzwOYuo5a2UnEDTjpp4YUXnVwnhRnp5SVsLG7OJgcmwEzamtR926Rz56+oOK9xyl9v/pspc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de; spf=pass smtp.mailfrom=fw-web.de; dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b=tQ53KAI0; arc=none smtp.client-ip=134.0.28.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fw-web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="tQ53KAI0"
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout3.routing.net (Postfix) with ESMTP id 72015605EB;
	Sun, 12 Apr 2026 09:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=routing; t=1775985819;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HG8LK3zLvqGGVVFMwLdWbCKig66mmIYOUx5h4FAdTrE=;
	b=tQ53KAI0x7LbPS4VjW5Q/YqSkoji4ud3ajJ44ShQF6x1kdqlsJTzUaKoa7aq5vLkSn0ZS4
	2FoYRb5v/lRhz/sY/2w9QvcbsbeOENDy3d2PBvPz5E9fNTvlXfMyFeLk+zHG97gmCVKJ4k
	EFzjsy73F5lTiPoAYMGhN1C6KVvvKx0=
Received: from frank-u24.. (fttx-pool-80.245.78.225.bambit.de [80.245.78.225])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id 4262E1226F2;
	Sun, 12 Apr 2026 09:23:39 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	Daniel Golle <daniel@makrotopia.org>,
	Andrew LaMarche <andrewjlamarche@gmail.com>
Subject: [PATCH v2 1/4] arm64: dts: mediatek: mt7988a-bpi-r4pro: rename mgmt port to lan5
Date: Sun, 12 Apr 2026 11:23:29 +0200
Message-ID: <20260412092333.6371-2-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260412092333.6371-1-linux@fw-web.de>
References: <20260412092333.6371-1-linux@fw-web.de>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Frank Wunderlich <frank-w@public-files.de>

It turns out that the label mgmt confuses users and now official case is
released where the port is labeled with number 5. So just rename it to
lan5 to follow naming convension (lan1-4 from mxl switch and lan6 for lan-
combo).

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
Reviewed-by: Daniel Golle <daniel@makrotopia.org>
---
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi
index a48132f09411..1175ee156cb3 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi
@@ -207,7 +207,7 @@ &gsw_phy0_led0 {
 };
 
 &gsw_port0 {
-	label = "mgmt";
+	label = "lan5";
 };
 
 /* R4Pro has only port 0 connected, so disable the others */
-- 
2.43.0

