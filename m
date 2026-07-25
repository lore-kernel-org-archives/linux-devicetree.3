Received: from mail-pj2-f9.google.com (mail-pj2-f9.google.com [74.125.227.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6908A30C156
	for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 05:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784956343; cv=none; b=OLD07VUA44uDVfKgqVV7dJ9mgl9TGxkVPdH9u2Ry6bZmM1/VGlgZo5Aa3PZIOVyKI2N2TcEnmWLi918ZDm9uuxnG8xzfxYcQp5UdnUfOsa+WB4kyb3r/znM2ITxfDeq8E7QLnQinsYoB6a1AH4hT9afNbgQRkZBYkx7C08Y9s7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784956343; c=relaxed/simple;
	bh=xr0oQcfFPCJzaAeEJhH42CRWzbYWKnP3e2i7y0AjEKQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aStcGmdX8eEnKuponBl1VZ/S4jpxIshBT7ye5Gb0fqLeA2+6oJdEakmPuG+ioObNqpXWPsmpMryI+U39jZWOProRf9z/2al4PHfGA2zPgLBrLTZw7uJPSqPqWhfbKrfk33Hc6PKzhIfHrGoiVDxhiPp299foQ3xcOime/TK5F9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p9aF1NK8; arc=none smtp.client-ip=74.125.227.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p9aF1NK8"
Received: by mail-pj2-f9.google.com with SMTP id 98e67ed59e1d1-38f0f8ab050so898000a91.0
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 22:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784956342; x=1785561142; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fhok3rvowf2V2ZvTr/zIVWuKYiTyiporNQXpy3ArInQ=;
        b=p9aF1NK88nRhdHmh4M+NfsvVnFGgiSxMha+vZSpCR2A0GFeUVZ+TkTSwMaT7Lf3A6f
         v8HofCLcy6ZmaRKEsOd9PphlFJJjQfve082kxs5KLpJd1RIaumPUPxacBhjRH4PdTu78
         7Kjp/K2raWzch81EwyNpGEak+bbsLd/hLzF7YRDbX5yXT1YYO3TDSHWifg2vjjty2iir
         cnGV/xabSDlZjVT/zyR1QyV18P854TDvwYjdi/mh3kjx1KBuU6v0ySWwFv4hJXEk3rBe
         MamraUOjLbGzFmluOzk6Zr83QClUVSzkNq+goCB76fsi2uq1sE7A+NeKxLvILeqj7uPn
         I6BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784956342; x=1785561142;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fhok3rvowf2V2ZvTr/zIVWuKYiTyiporNQXpy3ArInQ=;
        b=kV9WOgZyq4pNHVXn0hlIDfwkIh31dKctDKuJBP3bzDFfnq0P0KJcnPu330p+4wKppy
         L6oAOlkOKpgMhA47FKT0v3x5rMjg14L0CxqOvxKueV+COs2UATWH3V56isGPRdCvPp2C
         LI2LqpBbCm+IbKanjwkW3s87LbrhLd9zp4vZ8BhLIiXn8XZyEiTFSDnlY8sEdO63HWko
         jBpkTddfF/urHI7t7eRfQvaygQT1O/jR7HuT65zTMBEtd2GSqdBcYQcLdQkrX6e6m/Y0
         iAxMi/jqLrdfU80/kZ7Nh+D9bw/2qJP0pux4pKBfFPhOuT40Oz2Xu+F8b/mNuG+Eea9D
         Iigg==
X-Forwarded-Encrypted: i=1; AHgh+RqaYl24r1R4WfJb53jOFc5Iib5B2IIU/QswzSZaUp5n1A2gW+znQX74cAmEOzXJpExMURgVR6oQBsX6@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7WsGlkbpM66HyrE6jFNvXNIW4urJKQpZwC4uMj0nKtTYPa0HQ
	tK5Dksfiz1F+K7a1TnzeSXFW0O/AYP9GbyIcZB8yN0LWcc/7z/NoixfDQ3Ngz/ZYrn7+Tw==
X-Gm-Gg: AR+sD13y+LtOa5C+niBcpFU/DT6Px9svcEq3xOtTQvJKwSHsI8xWtNhHDtEXiF4v5NX
	KfdCVi0PZYKQLbsthtSMR7LKeifzpzEakNgk+ZlMrNNr3eq8iEKcM7QME5QmwaYlLdA12fBKk69
	ojMB3h09N2dvGTvs7yQbnXfG9ZE1F9S5kUkXEz6BCO17KFm949QGHOpc0SHYvUyaESJZ3QpCEN2
	vmmO6mhsGQ+LreaTtd8nMnnF2b5sgqsh7DG4cJvHUS23ROkLWDLGYka4z6AuevpTVFz6K4BnTOA
	IfcuhhSCwXtMjEEvoKxxIwAs8FO5BTaGETXuBmKDuU15n7I7HrhrDcQnTEQ+OPdnxXdGia+9siw
	43L8bL9wUsgCKEQSnqgCl7Fl9Lu0eRDg2Tri5QQMedxv/RhjD9C33Mf2StaFpy0JOlw==
X-Received: by 2002:aa7:8885:0:b0:84e:2bb:2d3e with SMTP id d2e1a72fcca58-84e594330edmr623584b3a.9.1784949446508;
        Fri, 24 Jul 2026 20:17:26 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::403c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e53432834sm640542b3a.50.2026.07.24.20.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 20:17:26 -0700 (PDT)
From: Cody Kang <codykang.hk@gmail.com>
Date: Fri, 24 Jul 2026 23:16:34 -0400
Subject: [PATCH 02/17] dt-bindings: phy: add SpacemiT K3 Innosilicon DP PHY
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-k3-display-v1-2-f22a10a52867@gmail.com>
References: <20260724-k3-display-v1-0-f22a10a52867@gmail.com>
In-Reply-To: <20260724-k3-display-v1-0-f22a10a52867@gmail.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Haylen Chu <heylenay@4d2.org>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-clk@vger.kernel.org, Cody Kang <codykang.hk@gmail.com>
X-Mailer: b4 0.15.1

The SpacemiT K3 DisplayPort controller drives its four transmit lanes
through an integrated Innosilicon DP PHY, one PHY per controller. Add a
binding so the controller can reference its transmit PHY and the pixel
clock the PHY's PLL sources.

The PHY's registers are interleaved with its parent controller's inside
one MMIO window, so it owns neither a reg nor a reset and is modelled as
a child of the controller.

It exposes its PLL-generated pixel clock through #clock-cells, so the
APMU pixel-clock mux can select it as a parent through the clock
framework.

Signed-off-by: Cody Kang <codykang.hk@gmail.com>
---
 .../bindings/phy/spacemit,k3-inno-dp-phy.yaml      | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/spacemit,k3-inno-dp-phy.yaml b/Documentation/devicetree/bindings/phy/spacemit,k3-inno-dp-phy.yaml
new file mode 100644
index 000000000000..f8f1ef372951
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/spacemit,k3-inno-dp-phy.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/spacemit,k3-inno-dp-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SpacemiT K3 Innosilicon DisplayPort PHY
+
+maintainers:
+  - Cody Kang <codykang.hk@gmail.com>
+
+description:
+  Innosilicon four-lane DisplayPort transmit PHY integrated in the SpacemiT
+  K3 SoC, one per DisplayPort controller. Its registers are interleaved with
+  the controller's own inside a single register window, so it is described as
+  a child of the controller and owns neither a reg nor a reset.
+
+  The PHY provides the pixel clock its PLL generates, which the APMU
+  pixel-clock mux takes as one of its inputs.
+
+properties:
+  compatible:
+    const: spacemit,k3-inno-dp-phy
+
+  "#phy-cells":
+    const: 0
+
+  "#clock-cells":
+    const: 0
+
+  clock-output-names:
+    maxItems: 1
+
+required:
+  - compatible
+  - "#phy-cells"
+  - "#clock-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    phy {
+        compatible = "spacemit,k3-inno-dp-phy";
+        #phy-cells = <0>;
+        #clock-cells = <0>;
+        clock-output-names = "edp0_pll_pxclk";
+    };

-- 
2.43.0

