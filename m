Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1933CAE68;
	Wed, 15 Apr 2026 08:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776242052; cv=none; b=Eq2tdHUW+37mwP0nb39MdANjuQiilanPu8u2/Yn7y5Qty9ZVrYuEFaypdR25dk+q/tGqIzwc3s7+NtGiboPR1xqId6ZRdIEkmFzGCXTW0635QjpQ7LWN1t3G4DsjHZ+XyNWJlq38hOHmjRcXgp9yaK2T6nC+DLhICHvDdCNYiBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776242052; c=relaxed/simple;
	bh=gGJkbjQ1NGX6fgwdB9YUsJ0pPiyL6JdM59/u6GrsAC8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lM3ggfPDyeiXpP/AOCvQp0YZqj8Ct2K7rQbTZObjihssDUpsGMn6fXz6pZ7qMYqY9kkSz1wJdOBRDunOOlp2afTYnHrc5xiXUOqmtYesYNLzclqB8bQv3XT9hMQvY0ZPh1N3JVGwrUEuQhU/GdoLYgmYaqvIt+qnS5gvIrSpMhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DHsDKVAl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DHsDKVAl"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D682AC2BCB4;
	Wed, 15 Apr 2026 08:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776242051;
	bh=gGJkbjQ1NGX6fgwdB9YUsJ0pPiyL6JdM59/u6GrsAC8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=DHsDKVAlRdMTwqDHEgZvhEt1FgyxR3QIY0FR2sVtVRaJWqc901JwpKuNON+Q9hcgr
	 TnON9sjJLHf9H1hc4EMRp03VP0pWpOwwqAbMRkn7H5997xwNQlcTvsIf3oCmnaj/f2
	 J+bj/AFq6bgXgsr+KX+Qku9AepMDMTKVuKKu1v+de938cMPTJnYy44MgIEvLghGg85
	 ljlShhYxSMZlLMbrzxRgopHFBf3Gr7DFpTmNbi8k5WcojYrG0yIwSjY63LWJVaxAUu
	 7Jdkcv7Uf3J12tkqBjMn/XADVtZQqkMh4LuZpCICAJ3dn4/mkA5SMH7mcDvQiTrP7j
	 8+GZnpEch2ohw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0239FA0C4C;
	Wed, 15 Apr 2026 08:34:11 +0000 (UTC)
From: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>
Date: Wed, 15 Apr 2026 16:33:41 +0800
Subject: [PATCH v2 1/4] dt-bindings: soc: amlogic: clk-measure: Add A1 and
 T7 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260415-clkmsr_a1_t7-v2-1-02b6314427e6@amlogic.com>
References: <20260415-clkmsr_a1_t7-v2-0-02b6314427e6@amlogic.com>
In-Reply-To: <20260415-clkmsr_a1_t7-v2-0-02b6314427e6@amlogic.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jian Hu <jian.hu@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776242050; l=872;
 i=jian.hu@amlogic.com; s=20260415; h=from:subject:message-id;
 bh=IimYeGQJ3sTp582FUYGP7eCFxCNOvcMVP+spCKBvEZI=;
 b=FTtwbJROifIZYLVA99AKO3wSGTKbZHs98icsYsqYtO8Mg4ZRTH1mFCDUFtUYCdfYrMNBcBx9g
 rFXH34gR4B7DiKr25FVbcU/cYUJM3rIkkFv+1vTLJf5QJdu6By1eyXO
X-Developer-Key: i=jian.hu@amlogic.com; a=ed25519;
 pk=zHUE+rNtH9z+Sb8au1/elWknjFQmy5QDVkBoxleuOIA=
X-Endpoint-Received: by B4 Relay for jian.hu@amlogic.com/20260415 with
 auth_id=735
X-Original-From: Jian Hu <jian.hu@amlogic.com>
Reply-To: jian.hu@amlogic.com

From: Jian Hu <jian.hu@amlogic.com>

Add the Amlogic A1 and T7 compatible for the clk-measurer IP.

Signed-off-by: Jian Hu <jian.hu@amlogic.com>
---
 .../devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml   | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml
index 39d4637c2d08..b1200e6940ac 100644
--- a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml
+++ b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml
@@ -24,6 +24,8 @@ properties:
       - amlogic,meson-sm1-clk-measure
       - amlogic,c3-clk-measure
       - amlogic,s4-clk-measure
+      - amlogic,a1-clk-measure
+      - amlogic,t7-clk-measure
 
   reg:
     maxItems: 1

-- 
2.47.1


