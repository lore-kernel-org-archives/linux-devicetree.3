Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9EB438FF8
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 09:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778835750; cv=none; b=VpeUfi3BDWQKJO/H/cOIjRyuyZGlZGf/tZoEPmoD2oiqTuEtb8U6qKxMMLFlZACKHKwpWazwgF4mt/LgJZTHwLyXhFYE+8ooMbLTKt+qf7/cHQqc0pBLWGC0rP+luwuh44XX9U5slj8z5P/Z/Jo/G1LNknCNdT2qm0KrdLiKJrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778835750; c=relaxed/simple;
	bh=ZpZa7k5qW6d4O5s2gIExYuE8RnKJzrY7mGSZ7vTtpmM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lS8gbsg9IJppOyCULVTiykzkr7WSkUKzqD/jlH3KO5pvDDWNDRNbBqYwElo3nD9fxckT1br3/G3vha2SHjHxDjMRWPm5rkK2KGyzdojZ08B3zwUYXLLlliReEhEa3v53ngB/HQ6/pVgjnVEpNl5Sdpo7lStb6OG5hEBa7OHnpAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=M1ZKebKz; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="M1ZKebKz"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-369576666d5so249204a91.0
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 02:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778835748; x=1779440548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cmC0iPkEpdT0NyKzeBxGsIEHmhfQRvHGa186Cj4Bsl0=;
        b=M1ZKebKzXgxRYmqadt91sF2wLWIgeZuyblx2pRSUYy433NDojHxvOTfmweZHw6Rpr/
         z+O5zJd0FkNbaCHBCAA95AX8Un9yEksRiBJ7GQUztR4++xhjMUiI9zZV4+5w6lSdiHjk
         nYN8SWqW1GXjG0rgzVuqjmInrVTD/qZJxOtPQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778835748; x=1779440548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cmC0iPkEpdT0NyKzeBxGsIEHmhfQRvHGa186Cj4Bsl0=;
        b=cSGAmrtcRfMIyQvwTwFxsHCI40noU6+qNW4GTqwZL/WdFVFvXDKOCc7GRYOkN2zTE5
         9qPiHtWhMs/FpwJsQ3j/nTYPntpCm5wrKfwKzrUCRM+2gWDHvUOJ6EyeEKSMQYgU6m4q
         z+VitxDHzPZREy5Eup/iQ8zhF03UiPmUDN7AQLh027YHiUyOHQMsCWGKdW85kmUUYf/I
         msWiJ54nrEZH3eBe+036MI4q33OZodcsSunbupREsUiyg7kL3T4t97eF5fN8bpybl+hu
         YzDb+eB+dQPWIhR5pBL2VvwvF/3U1qLGFHJWxK+GpV9iAMJuGhdaiIwyCO4weWnR+yGK
         PzAg==
X-Forwarded-Encrypted: i=1; AFNElJ+XUMEA2dpCqb1EkObGL1jj0TJquQIqfSTF6PrDlyqz++zyCBcxYrNEXiZl4KOciOfUZ+1L45ARk+H5@vger.kernel.org
X-Gm-Message-State: AOJu0YzML5IwUpy4Gr4RWYFxhcVPJ9BisR1M2TIUHbnmVLczakDA9Mnh
	gAOAKArkSuPg4oz5vWL65U+f3/FrL5sunTEN91XiZ5unJHyMkJfgEZn0zqw+kb75Aw==
X-Gm-Gg: Acq92OEi9zLGTEpYvVz0NNC9eMllRMwCWBqLnl26qVt4sp0JDoRAx6VR0kq5fZ5YBSm
	mQXSBp1qkiLMskhj10yI/sRF+aZxrEZhx+o1zQhMhnlzb9qGt+tRnGsCshF7K8Jxl9DFj/YJPWp
	MGGda0HZOQcSadOgvzG6QpVxYQaYplnPzbSfO5WzIwFulYGgvojEHac3jSKOmTC9YFE5yB4KzfD
	dcKn04RrF3nzv/RBP55blSKTfqLrUv7LMAEjqeYDFMdtkbKGDZgVgQ+hDqZt9/TCPWBJ3PbElr5
	EmJHp4AokOThv98aCH8hNovpiH2bPiFmHiCkT+mvAnm/wKJZa2YZC0OXlDObzrdB+U2Cb7YfXsP
	ckz9j/cByDbTP0EMd1ziPi+1l9qnXqc5fQAoWpSnA57jGHNgEQUbwfNBBgdZmR1nWDrO1eQCdrW
	CssblANK5/YNOZ66jnJuw2Kb1HQQJy+HJd6p/xGUEFGYYORQxgP51rVlMb7m9Sh9/5TyoLIC6Bg
	N7DH6qQxSCBa4fCfBA=
X-Received: by 2002:a17:90b:1c82:b0:35f:b7f5:9cd with SMTP id 98e67ed59e1d1-36951c9fad8mr3137430a91.20.1778835748348;
        Fri, 15 May 2026 02:02:28 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:b3d8:e32e:c2fc:c31e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36951584654sm2076537a91.7.2026.05.15.02.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 02:02:27 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH RFC 06/12] Revert "dt-bindings: usb: mediatek,mtk-xhci: Add port for SuperSpeed EP"
Date: Fri, 15 May 2026 17:01:42 +0800
Message-ID: <20260515090149.3169406-7-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
In-Reply-To: <20260515090149.3169406-1-wenst@chromium.org>
References: <20260515090149.3169406-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit 454a1e3cd36c113341d7b71e8e691c6e47ab4a8a.

mtk-xhci handles both USB 2.0 High Speed (HS) and USB 3.x SuperSpeed
(SS) host connections. And there are USB 2.0 only mtk-xhci blocks.
The SSUSB controller handles the device or gadget mode. Saying that
SSUSB handles the HS portion is wrong.

Fixes: 454a1e3cd36c ("dt-bindings: usb: mediatek,mtk-xhci: Add port for SuperSpeed EP")
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
index 231e6f35a986..75ecce3bdc7a 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
@@ -107,10 +107,6 @@ properties:
       - description: USB3/SS(P) PHY
       - description: USB2/HS PHY
 
-  port:
-    $ref: /schemas/graph.yaml#/properties/port
-    description: Super Speed (SS) Output endpoint to a Type-C connector
-
   vusb33-supply:
     description: Regulator of USB AVDD3.3v
 
-- 
2.54.0.563.g4f69b47b94-goog

