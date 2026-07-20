Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA0C30D3E8
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 09:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784539301; cv=none; b=XTndCdFKwpR8/z28ltohglT9OGdirNKrNkrxMDySS68CrVrfOD+9/S3SSQu/wQYzwabrId0z5Skhxurer5mwXGmSq1Ep2P8VTHFA00ZG9eSG6eLItmJfj1ijYUmP+csbZDm99SKui1+/qI/VSA6bkKymo+6tjAZEDWrmSOkTQKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784539301; c=relaxed/simple;
	bh=zaw4S1LTgksTd7JqLX2+9jYrm669Liu7tsZGJ1zxoiI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YF1//v9PPGtSVy5AHRNceTFMCbveU+N1Np/PRoKX1UaqD1mLBOCPe2i8kb5Asdn3rtFy63JKPoeWUWEeQS4XG+OuvkOPsfq580N8Df9tNA2kd5a8Zc/I+d1dzC3sNpp8+0ZJhZqN+EwoRfDzTHuSBHXoGFrQmfUFNNCYWGhvhLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=aWucyKJC; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aWucyKJC"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cca0c5799eso74651165ad.0
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 02:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784539300; x=1785144100; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dEo1zfdAxyxkmckxTePHzZtAsHT/hlKIP/V7KkMgw7A=;
        b=aWucyKJC+y7ujK5kaoN0zyNBK7mGnbcsk3MbQH9+jYVASNAwRpaCDrGOTuRZPDq6kV
         gBZtA2xwrcLzNWh3yHJcwGZGRX74+PD27Mjdzy1i1BjCRcDj6nvSn+7nnzRQ1a8bBeEY
         xVE7UDJHoCh4OwDdJqKuHK1JeHX3ReAAv2x4Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784539300; x=1785144100;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dEo1zfdAxyxkmckxTePHzZtAsHT/hlKIP/V7KkMgw7A=;
        b=UpO0eguu+9fPs982D+Z7DGJEBoSiSNkwh4BlnIbvtx1lafZCyeweWujjnZJKl7/UVc
         gTX/x8rny+6SzslZ00BeIWgEN265ezaQCVKJL/Jrcz0ICqeOBd7B0AWyifYWQVqWntZ2
         5/7HXb5Qj0F6LQj8wau6WWcunMk0v4bjFgMLv5xhqHtWD/hHxhQxXZeoIfrLk0Q9Q/n2
         UgCK/9WtS2h5b75Nxky1FGJg9slTH3fGLoKD2yNWmz6Gk2ZDf5s7X89c3R60uhy0cFh8
         U5kPdg+w/bRTS09tm5qQ+iCkWXrOgDOC6uypXeIwn+3Q8nqbe37girs9hQrAjlmvuCEH
         /2bg==
X-Forwarded-Encrypted: i=1; AHgh+Rrt7yHnFD1EcDegIdMozWLKvdLoUunr4X4AIOJeYiw9N/qz5kWNooHxDnXhyxPgi41OTtausyXE1Yx5@vger.kernel.org
X-Gm-Message-State: AOJu0YyRU32KSbMuQIJWTRk5HOY4fIKY7TGffgO9xepztJv+N55T9v1R
	ZV68tpMlH/mOfKUl6rsqupVBsInR7ZfR/dBl9hSp4+Iv3WCmtlUnPvBo0qSixbLDDA==
X-Gm-Gg: AfdE7cnAgy8GsM/4HQtkof+8E4aVDUc8hKHak9rucmJTKpabObtOuCQ3BqYtCnRPTZx
	moslirCCkxoS5OS3gqUc+dv/DQmoRFJ+h2eeWpmKsIQb7SBLjhJ71d4W2u+joG3Boua8bjT94QT
	pbPt9LRIj2CF0Pjs3nbIGpBx4p8tRGmAZNCptcrFHiPkpAJaNFo5O4xrD3MbLl6sqyHW+63mDid
	8/bURYmAhmqOq2cgvdqt5xF3uSTuqSqRSZssRMUUpkfFqrjhfwqI+O8ol2munfynuWOtOwSVXRZ
	fbj8pDQuPXzDb9+6VNPFsNsdGusPBGYoCbZ+xCyNag5myIHnMePrfv46ziCCOCPeb5L60DeBB2r
	bnMUP4yVb1FRNaruj/ZLOEyOgbI4UI7r65/926oNqr9/m8CpU85y8YHrR+gCXQmLQnbQf/3GbGG
	26n/ukc6Z/RLyRNXWr06ZSCbubKGkf4aPRjKHg2bB5GGHkWqILTJyrKSYfL55bkFO4MhNufQ==
X-Received: by 2002:a17:902:e80e:b0:2cc:8267:31b5 with SMTP id d9443c01a7336-2cf3489a830mr141008405ad.19.1784539299565;
        Mon, 20 Jul 2026 02:21:39 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3916:f048:32c3:931f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf344be458sm53775345ad.25.2026.07.20.02.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 02:21:39 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH RESEND] dt-bindings: PCI: mediatek-gen3: Allow memory-region for restricted DMA buffer
Date: Mon, 20 Jul 2026 17:21:15 +0800
Message-ID: <20260720092116.1823562-1-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On some SoCs without an IOMMU behind the PCIe controller, the PCIe
controller memory access could be limited to a small region by the
firmware configuring a memory protection unit. This memory region
must be assigned to the PCIe controller so that the OS knows to
use that region. Otherwise PCIe devices would not work properly.

Allow the memory-region property with one item pointing to a
restricted DMA buffer.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Can we get this merged for v7.2? A matching device tree change was
already merged in v7.2-rc1.


 Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
index fbc0378392d4..b88717dec1fa 100644
--- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
+++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
@@ -116,6 +116,10 @@ properties:
   power-domains:
     maxItems: 1
 
+  memory-region:
+    maxItems: 1
+    description: phandle to restricted DMA buffer
+
   mediatek,pbus-csr:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     items:
-- 
2.55.0.229.g6434b31f56-goog

