Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7041236606C
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 06:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778222209; cv=none; b=pe/7L1XgDzbcR1mUG5EbG55DWJi1n6orUFZjC4PPo5VbYBvVyGkXMExNM2kJYwMl45lrPuQMw1/RmwxsoD/MOwGGWM3gXnSbhYmXGeoY3LOz+aUM8M0Nt7VsC2ArQKQf6twJ7tqm7gp/O+SpHmi+U5ABOhWX2aul5h5TZcNnwz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778222209; c=relaxed/simple;
	bh=9jqLAACjfGjKanuQVNeQ7eoQMeqQBRzeZ3dpRjunfuQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XvsNoRghi5ZqEXz7bs/uh1nRFNnJ8VonQHqlF+d5BgvTyKGYDLj5uPuofCvAhFoTuP6ZF/sXYfPPAIcU3rsQ76maWpfV1kQ8MpmWf5ETkuwo8AmvUAKQca3cV2LUowz5z/k6hI7upBnKP0g8WdLMcDvabjFq4eNGnGDq7lMUtS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=V4KBoMSO; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="V4KBoMSO"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c80148ae949so723321a12.2
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 23:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778222202; x=1778827002; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=22ncQpWLdF2X8pTtJBnqzgTb5DeYk3+PKhZtvYNM/EM=;
        b=V4KBoMSOVmUilffq/53aV8sUf+yvt7SDCNNXjUJpOemFFhyW9EYBhX91yjFh3+jBOg
         ifnM4Puk0SkxvCcYvKTCy/oQdJ72WZ5zdA5ULyBiCzYc06/hJ1twPiMLI93GqoCrUdoY
         szZCnvJqgbcrrMTv8y0yX6I/5AmrF5NEOreBs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778222202; x=1778827002;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=22ncQpWLdF2X8pTtJBnqzgTb5DeYk3+PKhZtvYNM/EM=;
        b=W7CEAaVkVLfyFu4Lp9093u6SuGf5+MVKLjX6LhbECMcRhiwhfl8XVLLWD3jlKNSvHF
         AU9R6Z5REZZLcsbr0maE+H1OWbPT/eBIIp8C5J5s/edzL416iEWB2NA5A6dcRhobqee/
         ns+Cn7ULqSCVJyBYCpprBP2IcgzByeVGT9reFV6mCfHypU2xyOFAvG/ilfcijm++NI+Z
         tubRZuFnZ5teOFo7F0X28yJifCsUEu3qOqQAwdc7QfnHSDZcOGWm3IxNwhpdi0/a4+7d
         1OVy/pQ1EJcEE5kIkuylJ374+Z31rIwZXd6LfMbGTRSHH/UFujeCnNZPFsZZQL6Xv5iy
         qXYg==
X-Forwarded-Encrypted: i=1; AFNElJ+XFzPY0sIcERTA97v8ZneVXXlVGxhD0y+1pvjgms33UShIChX+3GKLtQ4z1kb7h/Qya47fb0Jypsgq@vger.kernel.org
X-Gm-Message-State: AOJu0YxNQ0CDS2Fr8ecDMam5gdyqGYGXvg3ISsNgW8I+cZyHQLWfwkHw
	RouZGPgc/htsJJCuJPJ4AwfFjnH6zdZtKY44zuMnuHpuFlOmRqEeLcF7aVGNsDhqAA==
X-Gm-Gg: AeBDies8MWqk0xUsSr7fymFpn48UsQ44g/8AvcoWhDoRb7pW/D9f4aDjsCun5BqnpDh
	tHa4JsAUSvuphv72ciIl6Pkz1sMdL9/bW1cEc1n4yeHDi7tFEtcKXNBxUL4sj8JHSmkGKYMQjIS
	0IXDmgH45SRknfpQK31m0FsgGiRELxP3Ifn8wRDQQct2TB5Lw0xwuwoUGJzi9IQqo7RWdKuWA+4
	ZJ+TzDSTxD7dqMBBmXqhaPquwpIv+hph3nufNj6E/15Q2xXcfpAbrT/YnmEHuafFogokWAk92uG
	6tYPcepZXt9H2JmqbrP1Md8hKsRQ0/lfkSKQO2wWnLrf8ylJPmkRN0RyZ3YSgI9oT8aXaCTBfIH
	riB7QmoQEu9UIb5XKv6j/YqFf3YqXG5ZHF7qUSSCJjvN1ifiX/AKB6w2auYS/jtB1JaCKkQoN8K
	M15EFjXmp4R7tDN9RVPb50CJVnlzaPfPuQdcnadds+lQCHdPgnq/ljj2lRF0Bd6FGVloK/Foe4q
	GcjAsB6oX9WjHLsgw==
X-Received: by 2002:a05:6a20:939d:b0:398:6ea8:21f7 with SMTP id adf61e73a8af0-3aa5a9559ebmr11751571637.15.1778222202210;
        Thu, 07 May 2026 23:36:42 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:bac0:e137:a29f:62c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83967dbee14sm14850717b3a.48.2026.05.07.23.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 23:36:41 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: PCI: mediatek-gen3: Allow memory-region for restricted DMA buffer
Date: Fri,  8 May 2026 14:36:32 +0800
Message-ID: <20260508063633.3894348-1-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
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

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
This patch compliments another patch that moved the memory-region from
the PCIe device to the PCIe controller [1].

[1] https://lore.kernel.org/all/20260430120725.241779-1-wenst@chromium.org/

 Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
index 4db700fc36ba..4a9e41d01628 100644
--- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
+++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
@@ -115,6 +115,10 @@ properties:
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
2.54.0.563.g4f69b47b94-goog

