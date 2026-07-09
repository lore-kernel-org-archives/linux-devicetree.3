Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB323F1AB4
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 08:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783585877; cv=none; b=XUby5qfnBypUU1ZUI9HZ0zJNFTSPWqNv2pqLP0F56Ak8Z7rdIZo27L/HjK0eSwco+jLqwAQkuZQUpRj6h5s4PpYj7n0MND15xyiX7waLiHbfOJrPHUnwpyGSg039NBYcXkQyyU+0XmEN6ecsxhU6c4WcyKRbnRSjTslUsrsVzVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783585877; c=relaxed/simple;
	bh=IZleYUi6PiorkGYkY8alOYue1tOL3isz2tFad7k8jAE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W5JmrGaL9HSHsThCf7YlJnWyazPI4GGPK2VeZvNqi/ejceVfkJkayyQoD8gOeD6H50aheeTXipI1O5QdqTvK3XMx98qa2Fk7inJhd+M2I+4+v8q/nsCPT9f+2CJLELzB2xM8tl9+A7Pi5MGe2m6UuC0C2W67lALdcOxAw6gU3WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QJIhOsWN; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QJIhOsWN"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493d92b7db3so16612845e9.2
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 01:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783585874; x=1784190674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AM1zEpcKvD6W7WPG9CZWunBD7IXZLxdUb+DuWtxzpK4=;
        b=QJIhOsWN0F+zaoQCqKbEXlFIdSYq2MJFthUBbuxWetkhaF5bShknRfZ0cwQdtNx8V4
         /0oOhI9S44cs/QiY/etOGa5pSG9hh3dzSJ6wgC/n7pqRajridJI4Kt6czKV3ElAJ/oAL
         cOD5dXzzdzrmJg90hw+hxOZwU030IQd5IM0ur4PHM4Cm5I/qOUI5v1tcZrSk+SazSLRV
         MT+5Ho9Uozs1REJ0mDP+bErSEBGPxerapu6032da/gblzduEaJkQVQkZflA6z9m44mut
         SBecp4vtWqdomasuk89MkE+5ND2Xcb4XX9saMDqoh8oPSVAOdrQmSMR56wQ3VjjC6ENi
         xlcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783585874; x=1784190674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AM1zEpcKvD6W7WPG9CZWunBD7IXZLxdUb+DuWtxzpK4=;
        b=dStntjJULhMtuZ8nLX5A8UKrRb3wpA30ALEhQ6l6ujbfYHjwn6ZAt7a7OK4TRt9TXO
         Ka+NN20ay+rkxUKNbQYE4HY1PnpLmg17CSOi7PM3fvD6iI7jbcOlSKmU8dB9e8GU6GDe
         eaXwUi+xTsJEQJESHgIHBvy4oiRtDOWuGxwjX0QeCoHVLWBim/1SYXTW5zdMT7HIkKRE
         M1k0JhGJlpsjLPwU/0krKeHpyvlAhOq17aOyesFVUavOCZf9tvo9TXs/p991WKZTmxuk
         S0W8iIT6CGZOqYgaEfNNA0Qlgx5UWo1U/EQMKipRW6sPHseZN00QCW+Sbi8FjhXrQdzA
         B5gA==
X-Forwarded-Encrypted: i=1; AHgh+RpJK/JpTbQ0Isn9Mbo1NjvwVriLWjxq5ZjTiwVdvRuKHAeubR3xIhTmYmUBmkXRLHqanbEQavu04g7O@vger.kernel.org
X-Gm-Message-State: AOJu0YwsuZa3iI8CQIrdC9pQJEc59LA3SAP08RtM//1haccQfpPxEY5y
	CyjWmFW4oM2HMcsU9E5FzYOkyPpPeA8MWd5g588Uq06hHoEBaTLhEejf
X-Gm-Gg: AfdE7cll3Ccc0zjhwceHhhQEHKnn8xTeMvNdl489ml42Hk7ssJYNYzzoFu3PoH7oD4f
	yhljYzkMWvk1OJjKVlfakBeXNDP8eIOCcxzpy1+dI2Q8K6MuX52VMUViTK0AN8XJGFHvH0tOxhN
	Omwg8SbmFQp3nrGNxrRB6C8r0zZ6SKwaVnI67mKphNiMqZ+JaVWDNKCELI7wuOVGw0e1S/QzWFo
	iqEJs63IUxCgrJTzpvrtlSVe6bBDvXyg5FDmvRi90kt6XHtHTBcsyEIJwfAXLPATWUARiPJWtRZ
	fmkfEg6BNfMlSMyRc6mrHxV09jlBA0Xi4UwTAoCJ5xC7mVcal83waIJ4RA+NwkG3Iq4MlYyRoxe
	Qm4KZEJ38fa+bYP3tGf85gNMTg++9OLKoAvnjuAldW6HIL27lOiMRmL1eiZ/2TRA/DPgZqZ/4kM
	lPTcRsgZ3QPLGGNBuGuINy
X-Received: by 2002:a05:600c:5308:b0:493:d0f7:69c3 with SMTP id 5b1f17b1804b1-493e68eefecmr55543765e9.33.1783585874216;
        Thu, 09 Jul 2026 01:31:14 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a702:d301:8fb6:1d85:3dc1:42ab])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d780csm50316543f8f.11.2026.07.09.01.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 01:31:14 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 5/9] dt-bindings: phy: renesas,usb2-phy: Document RZ/G3L PHY bindings
Date: Thu,  9 Jul 2026 09:30:58 +0100
Message-ID: <20260709083108.108370-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260709083108.108370-1-biju.das.jz@bp.renesas.com>
References: <20260709083108.108370-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add device tree binding support for the RZ/G3L (r9a08g046) USB2 PHY.
The RZ/G3L USB PHY is almost identical to the RZ/G3S USB PHY, the
difference being 2 OTG blocks on RZ/G3L compared to 1 on RZ/G3S.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
 * Moved the patch for easy merging.
v2->v3:
 * No change
v1->v2:
 * Collected tag.
---
 Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
index 9740e5b335f9..d6b9d08ceec6 100644
--- a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
@@ -16,6 +16,7 @@ properties:
           - enum:
               - renesas,usb2-phy-r8a77470  # RZ/G1C
               - renesas,usb2-phy-r9a08g045 # RZ/G3S
+              - renesas,usb2-phy-r9a08g046 # RZ/G3L
               - renesas,usb2-phy-r9a09g057 # RZ/V2H(P)
 
       - items:
@@ -132,6 +133,7 @@ allOf:
             enum:
               - renesas,usb2-phy-r9a09g057
               - renesas,usb2-phy-r9a08g045
+              - renesas,usb2-phy-r9a08g046
               - renesas,rzg2l-usb2-phy
     then:
       properties:
-- 
2.43.0

