Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECCF72DEA86;
	Wed, 13 May 2026 13:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778678285; cv=none; b=MkUSoayXXz3dM6m+raXElYjnAcn2fUhZp9QMWLrFc6nTNdtnuUoyttL4AgAborVc1J1CRRN8M/awF6YTZdbwQM/tjDHAgc7a71W2N6d/GTvvZKPjGv5XYlF1aGTrhnn1jbPVlI8ZInUKkUOMLhJAQhMTt1VJ/zNFTgOxK06MGBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778678285; c=relaxed/simple;
	bh=nPJzcPekfWg8VQk7v3Ppx+7G3lp2WtkHYg/I3DyeH3I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rouvoa/2asvO5pn6/pPJLxy/rIaKu2LF0e99V4PhTFr4fOI1wvOFZAvnSCGKgoSs5vDo1n8usuQXSATlxXk2D81ReBjh4TK5qRVaDwz4UqZtvEYi4OwYtKvxR/oesbDC2Iqfuxb1KRl5bJTQFSHgYMvvKM8wOJfocgNAm6ImJmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RzS/iuzl; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RzS/iuzl"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 12E782B56;
	Wed, 13 May 2026 15:17:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778678272;
	bh=nPJzcPekfWg8VQk7v3Ppx+7G3lp2WtkHYg/I3DyeH3I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RzS/iuzltOIkYsm+50XK8up8jJdktRZg1TJGbU2TUdm0kYaQZUNgHE/y8NhBIxGmD
	 2FYgJ44cOA5pMd9KfixROGdB9BgwiqwyJRBfjNdOwnHcXhz6yS+omEPbafiwuw2rCz
	 0Htc8gRfIdjJpDLlKFa3VFTjfVLNmvnzumGFF5K4=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 13 May 2026 16:17:26 +0300
Subject: [PATCH v2 04/16] dt-bindings: display: ti,am65x-dss: Add
 ti,dpi-io-ctrl
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-beagley-ai-display-v2-4-9e9bcefde6bc@ideasonboard.com>
References: <20260513-beagley-ai-display-v2-0-9e9bcefde6bc@ideasonboard.com>
In-Reply-To: <20260513-beagley-ai-display-v2-0-9e9bcefde6bc@ideasonboard.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Aradhya Bhatia <aradhya.bhatia@linux.dev>, Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Swamil Jain <s-jain1@ti.com>, 
 Devarsh Thakkar <devarsht@ti.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2200;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=nPJzcPekfWg8VQk7v3Ppx+7G3lp2WtkHYg/I3DyeH3I=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqBHn92BRz7sng2d5pS8QB8Ma8t/id1l5MBxGDP
 pKNT1+yzSaJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCagR5/QAKCRD6PaqMvJYe
 9Vf/EACKrp2Z0E8WBm9BgJ17jayJk9cv+S8+TC4tZs6FEbNZYmosN/YYJYgWSL5j1AAGcwA0+Ec
 fHcuF16HxSg/gN9lRUQX2H6aelw/8oOzM2yQ/6xnzT2TVY2vgc4SVexSTeDBzLM5e7iPAcLjYGM
 yLE0MMNbufp/+ajmWngQvGFZqXySZftX1AW4C/5dJNHbtvu+1g620huAFAz/bTXrysG5wG0YPrl
 UqbBXIZUtk2XuERBzbaRMLmTmKXS/rS/R+LVzRARrisTy2XeRxj+wV4okjldzktE9XZSiz354jp
 mUCepUzy7WmPehQkOJnpaB/+Ppp2haS/PEOTxU1k3zH1H0gc3REi3Pvbj5RohqQKBMRMgQIIRHI
 TkSOjdGOT9Fv6b7FuX7OmLNrJHqe4UdgyGp7BgLsMoN7Mk49sX8ikH9rnlCg1mpRImG/plvboi6
 JMZV6wBwUCELxOfQruJwO0ydigVzG2/4zGKPHkanimMZS70zd1/V9qfZQdDkr8+QYCUtp6mJPf2
 CN+vwGqFrZQ7wOBH8Eb6Ck0JnypiqaPA9IJldd1+2/ZWuO9syJAhtaM2wZgYLAOSedD9tKxMo3v
 wX0eqoKZcrhCLmD5GCkEORydtq6ZXLH+SujPSX36ud7L4dLwDSop1RBp6Htdxs+oOGAtxllznC8
 m404lj4bWA3Wk4w==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

The DPI output pipeline in K3 SoCs contains the display subsystem (DSS)
which produces the in-SoC parallel video signal, and a DPI block which
adjusts the signal to the external MIPI DPI output.

The DSS IP has registers to configure whether the data and sync signals
are driven on rising or falling clock edge, and on some SoCs these are
automatically conveyed to the DPI block which needs that configuration
to properly output the MIPI DPI signal.

However, on some SoCs the DPI block configuration has to be done
manually, using an extra register outside the DSS, DPI0_CLK_CTRL in
MAIN_CTRL_MMR_CFG0 block, which controls the DPI block's behavior.

Currently the DPI0_CLK_CTRL is never written, so it's always 0, meaning
the data and sync are always driven on a rising clock edge regardless of
the DSS configuration.

Add 'ti,dpi-io-ctrl' property, which contains phandle to the
MAIN_CTRL_MMR_CFG0 block and the offset to the DPI0_CLK_CTRL register,
so that the DSS driver can configure the data and sync signals
correctly.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 .../devicetree/bindings/display/ti/ti,am65x-dss.yaml          | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
index 588d72d4ec0d..902ae2122d86 100644
--- a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
+++ b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
@@ -113,6 +113,17 @@ properties:
       and OLDI_CLK_IO_CTRL registers. This property is needed for OLDI
       interface to work.
 
+  ti,dpi-io-ctrl:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      phandle to a syscon device node containing the DPI0_CLK_CTRL register,
+      with the offset to DPI0_CLK_CTRL as an argument.
+    maxItems: 1
+    items:
+      items:
+        - description: phandle to the syscon node
+        - description: DPI0_CLK_CTRL register offset
+
   max-memory-bandwidth:
     $ref: /schemas/types.yaml#/definitions/uint32
     description:

-- 
2.43.0

