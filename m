Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04613043B2
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 15:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779375664; cv=none; b=QaIJzh3bP5NtAjqRt2QlttNdK3MttyJBsENwj7Ml2G31z0x5sxkenS3u80Kc359p14T7vrs9vWc/8j9xfuBUlTtJ/b1hLYn6jNbNTKQ2ZQdyRYAi0YAxEpcShPAhyEvOyV2tEI3gKPHd8ji7EJqck9hnTAKaHPU/YkiVsB4zJdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779375664; c=relaxed/simple;
	bh=e0Zwo/82wQC7XxfmkLQxcGZmpvIUwVlf9ZtrNhSaMVA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G3gQSXDgqd6HnR2iRWMImTR33X2Ei95lUGYyagiHKvBSLaLnRkFWwVSto0vbjI9MefD/QvDJC0zwlS69WFk00CPLjYuc0ebc+ZgR4+/C9bpP1nCdyGVp0r+bJfEgbXYDVIy7Qv2FiQlMbkHxlg/pQ+xqB6i+kZJ+1WCutga7KvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MGsBFW0h; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MGsBFW0h"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43d77f6092eso3657691f8f.2
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 08:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779375661; x=1779980461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RRbrNVL6NB/TaXW8v79sMJA8urvaGBAFet012ki4EYI=;
        b=MGsBFW0hRxUPjlji0ymwwEuTAoSTmBuVS1k7dzP6UhY7q/h4WNKh20hRJfvo6rynLg
         /LhxsV1yEz1V39QhBPSWwdCVfC0K1tEhEUx8j8KQ6b8fTzzovpcMuayWaDfE2XVsymmU
         CcsYBjlquEZtd+THW3V6Pqkmm6mCIMjho9mgrf+FU3pI+MEHGlDyAg2APc4ZGsbFyatl
         VB0rbXbSePeUqaQBhwqpXCPpy6tV++7PnMxutaGA8emb6hnxp8YMnbGXs5HPJDfTOTrS
         2sW/4tDnTzH20HnE0zoXzs5i7NalyKCRxecGFYfJlR75hhuO8g8lGD5FGNIo85+wpjxB
         SJwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779375661; x=1779980461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RRbrNVL6NB/TaXW8v79sMJA8urvaGBAFet012ki4EYI=;
        b=RmQCbmiiBcDAT7PDRL5f7CBc4Axr5fnEn2kN1T9f7dgcLBstThFtiYVqlqmetLdrY1
         f3cs3RWtrVt0XNSfbMK9RjyXgHxWWlLgZxXGU6UY87NJh6v5b5HVS8XXTZnFcJsjQoja
         UGTRWUw6Ec4uxHXNsqPZm1a0A3FdCeMdrJnH7pzob3Kx8xdl4F6xKsG+92WB6Rd9h52y
         d+/dii9ZRzfkw0/nlPfKK1T0frKBeFYfrACUsNUSD5K/F46FbYOcSpLfi/h1ItykpHs2
         6c+EzyJCssdJR17NdADFM3muv8+bQz5a0GCcl3P6JQnGB7H2OSn2HgP3ozsYsFIb6nx2
         dEGw==
X-Forwarded-Encrypted: i=1; AFNElJ9NYME4GcBP3BdcRBlpbLTAicoxMfaasSu/cZd7nXsgFec1NsjHUvY5VVYooHWf0mpZX2tWx14QXTZ1@vger.kernel.org
X-Gm-Message-State: AOJu0YyuXeS28nvsdUWjQM1xHSkvlMVb5mjRcp275WLlgpvO6DDm3ygj
	svtnvtAvt9B5dXvUDFkkegNrf7NrUiSs2ts/3hYSl48K4uDd/NHK6Y4c
X-Gm-Gg: Acq92OGRhwovmM7gbYYA4pldt58SAZFM/rtG4XwS+nPWV0t+GIfPFY0+YXIJYmkyv5l
	HAAV8guxY9fdRMV2bknt/ZSCUGoZyKJD7fbinCsU2Z0HrWDWkZPJx+jLNOpuDsBKvHyq2HS0uKu
	sehVw/DbGuu2VgtQBqWBTi0wcf/2RgB6FfX41D0BOBMrkScMJtzhLvvqerhv6jJ1ULbpNbJ/DPZ
	rJFpJ0h0i0OiZIgfpF97Ga9tVPnYO99upx71jBLN2OO53HK14/A3iM6p6Ai+r/73AbSTL1R/SLT
	DgppZithXZtLbwt+GSFkXd/x7apeP87n1VVgFKVKL1ja6NuhYY6S8n8jWsXPYvagUSMhPSo0FmV
	qNPgpDcV6FadZe/XvYzy1UeOTZZ72XlnGcGtdaJm33D3GWFUg1cWsBf/kSWXc7NqwkbNzoBfEPB
	0xTZRUcUNhDevAM5YOLbf0xVfL8vSL9Fx3Qa+/NFb9iQ==
X-Received: by 2002:a05:600c:8b18:b0:486:fbd1:9dc0 with SMTP id 5b1f17b1804b1-4903609cf42mr52668395e9.22.1779375661077;
        Thu, 21 May 2026 08:01:01 -0700 (PDT)
Received: from vitor-nb (dsl-113-208.bl27.telepac.pt. [176.79.113.208])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903caede9fsm34056745e9.14.2026.05.21.08.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 08:01:00 -0700 (PDT)
From: Vitor Soares <ivitro@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 01/15] dt-bindings: display: panel: Move Logic Technologies LT170410-2WHC to LVDS
Date: Thu, 21 May 2026 16:00:37 +0100
Message-ID: <20260521150038.103538-18-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260521150038.103538-17-ivitro@gmail.com>
References: <20260521150038.103538-17-ivitro@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Vitor Soares <vitor.soares@toradex.com>

The Logic Technologies LT170410-2WHC is an LVDS panel, so move it to
the correct bindings file.

Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
 Documentation/devicetree/bindings/display/panel/panel-lvds.yaml | 2 ++
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
index b31c67babaa8..9db96dd724b2 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
@@ -58,6 +58,8 @@ properties:
           - hydis,hv070wx2-1e0
           # Jenson Display BL-JT60050-01A 7" WSVGA (1024x600) color TFT LCD LVDS panel
           - jenson,bl-jt60050-01a
+          # Logic Technologies LT170410-2WHC 10.1" 1280x800 IPS TFT Cap Touch Mod.
+          - logictechno,lt170410-2whc
           # Samsung LTN070NL01 7.0" WSVGA (1024x600) TFT LCD LVDS panel
           - samsung,ltn070nl01
           # Samsung LTN101AL03 10.1" WXGA (800x1280) TFT LCD LVDS panel
diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 3e41ed0ef5d5..f7e09f5b1b5e 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -206,8 +206,6 @@ properties:
       - logictechno,lt161010-2nhc
         # Logic Technologies LT161010-2NHR 7" WVGA TFT Resistive Touch Module
       - logictechno,lt161010-2nhr
-        # Logic Technologies LT170410-2WHC 10.1" 1280x800 IPS TFT Cap Touch Mod.
-      - logictechno,lt170410-2whc
         # Logic Technologies LTTD800x480 L2RT 7" 800x480 TFT Resistive Touch Module
       - logictechno,lttd800480070-l2rt
         # Logic Technologies LTTD800480070-L6WH-RT 7” 800x480 TFT Resistive Touch Module
-- 
2.54.0

