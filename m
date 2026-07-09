Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9B440E8DF;
	Thu,  9 Jul 2026 15:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783611588; cv=none; b=OUU0kKjva17Imph42+ZW14Hp92tkS8sWT1bzOEd/jeu5qFNov8IRbTJ1Ev/jPFFmqzjUXdpNAEUhzUHDJisQKikdcowdRZlM6FrInFLLm8wuB7aatH67GYR+o4TpWBBgqLEFb3SOoKZV6mPHIV+BLs8tSLArPLz89ZEkmPrNlDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783611588; c=relaxed/simple;
	bh=BjW523BruuumCoQSnrc6F3I9k5PsLBLvGJIH0fSBUDo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EG4i4mglRZmInjJ1KZ4vjPMyZIEAwsyKfNCb9gvtYv9lotfDJwcwhnyLpIKAZzXKFRsXxrWhVueHVKW5DDnhTGTnqzLOVhaJnzr/X2c7jfJNN3MZHbtFzdIvOAv9ThB9v4eXHxnwu17LHCal5IZAP3WIyd1mOK6H1DWLTTu9SnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=QTyX1fhp; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=IHGo7TyT; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="QTyX1fhp";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="IHGo7TyT"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4gwzfh0PyGzKvv7;
	Thu, 09 Jul 2026 17:39:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783611580;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YxyneXxmkkxVO68GHRQzBQ9RaQVnrXZvpdY/k0JkhzE=;
	b=QTyX1fhpSC5KPr4Lg3niIxaxCObsqA5pCvkPB5jGLufIHuv4pNxjxGK3AfxJHLmt+awE5m
	nvp1BxscunbqgbD7tFW5H2DwCJSVeTmrWsG5idk6NldpSzybbD7ZHSJXo+/3Z5vMLaQ+Fj
	oyS4tyUvbNF/UANUw2mM9VHxOMb5s2hMAqYTBBW0LCU/eDaHXhrfWmfBysnauLRrbfaGlS
	CeiXKmsfDv9GHTtXpLG4O8otohycuwg42Blgym/tRH9VarM7rhzeQYqzCpvYbQPRppznA3
	SKtwGX81fACRsg2VW1KH3obdm+ry3ZelPHNTTdQucLoGE4tFWGqfw8p3S0rF7Q==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=IHGo7TyT;
	spf=pass (outgoing_mbo_mout: domain of manuelebner@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=manuelebner@mailbox.org
From: Manuel Ebner <manuelebner@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783611578;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YxyneXxmkkxVO68GHRQzBQ9RaQVnrXZvpdY/k0JkhzE=;
	b=IHGo7TyTy0hD7yI7cXx+MPJM5uC3dd7J+0GsWXeaJ8Sc7EemdxI916EJrkfEyy+RIDCEfH
	9xRYvrvhz8pIFfa/Wd06apfJFkDvo7Q4negPbewxk3qg7qvANb/0mipLaKE/TL8vXdjtTv
	c4RPsiePa91hGZ/Z4KaEUbeInB+OHGSfoFFoZ77UeYF4on22HH5mRXUQJfkUhuWSbZT8y6
	ySozpm+xixbETAd7g5yzAmStgMyrwJ0WAeT887MBX5j/e+SCssjj3/KaCz3tdbhy8njT4n
	rnksSGnt56vxFXSS0QC14OlqJVO3G9D8NigfTztuAqh7hgQEw1NwEB7oGtUsPQ==
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Benson Leung <bleung@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>
Cc: Manuel Ebner <manuelebner@mailbox.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] dt-bindings: arm: mediatek: fix brackets
Date: Thu,  9 Jul 2026 17:38:58 +0200
Message-ID: <20260709153858.407734-2-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: usx4qrs8pqm651fziqnnagcipcnjannn
X-MBO-RS-ID: 0cb7372cabee112e174
X-Rspamd-Queue-Id: 4gwzfh0PyGzKvv7

Add missing ')'.

Fixes: 8101382c24b9 ("dt-bindings: arm: mediatek: Add MT8186 Squirtle Chromebooks")
Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 382d0eb4d0af..cd4040ad3437 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -314,7 +314,7 @@ properties:
           - const: google,steelix-sku196608
           - const: google,steelix
           - const: mediatek,mt8186
-      - description: Google Squirtle (Acer Chromebook Spin 311 (R724T)
+      - description: Google Squirtle (Acer Chromebook Spin 311 (R724T))
         items:
           - const: google,squirtle
           - const: mediatek,mt8186
-- 
2.54.0

