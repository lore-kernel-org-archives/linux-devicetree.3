Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE95838A714
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 14:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781274658; cv=none; b=JgW23HL1+3XcZRykvpM6M/TK2IBbdE078LaL4sxhhhI7mG1vaDJGNuh7y/MJvtTU1epBPQBqhrd/Bauj0bZa0MFJNcDvlLepHynxgX9qbpYwHp4TeC6OIzYY4JyNciUWd+x8mcVcaZWZzF41Dz1szAUOqd85jmv1fJqx3Skw2Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781274658; c=relaxed/simple;
	bh=oT5/vREXYCSMxDUooYQ3Uq+Ce+jvgcghDcj49uYzYFw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gpnVlWA1UTzXl5TqYTUUXibIwuCFrOEZ++4wN9hDL/RQjc5xxVa0KbR2AQLX/z9I/6eLqvPLT+pG8CfWYp4Z8z80ZNk0vElo1opR8pnvbevv6FLnHeIeJlc69crQQfKd9VsC9Je9bd+eAumFMq6XGumoxyGwJtxLmcMWcul6TFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zh70tzCE; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zh70tzCE"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490bb83a3f6so8339105e9.0
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 07:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781274654; x=1781879454; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cZzbdchxZEz6YjPim6DoD1zHzuSoHlBEf2xfHYElE2U=;
        b=Zh70tzCEeRWQXuPriEwj1GRhGJ5NW/t8vN5b3um+O4+atOEe2RMTGBwN8GaDuQSqY7
         BNEEItwmQxtfsxPBxEfMvy9CRiJPS8a0CqUlF09uqq+JBd3f3/Kwigwx6odWeFlPC2ju
         hd0ScVuIPzJ3nszXOM9DrXH37O3Ai9R9xzIvoBu4jiXnaAJLTBkGDzHJHzU+dPqb/tXE
         ECrwoZXcw6RmeCSg3bN952dYaZjxVTPMhOXm1wTH/5SxT5an12QhYe4cduTlHo8DNzGs
         2LV/ZrNLvLiTlxOrmbguYNcbMzCSFq6Q3xNoT0mhPYGo/e6kaK0W22Hvv6gfhOrz7hjb
         HijQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781274654; x=1781879454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cZzbdchxZEz6YjPim6DoD1zHzuSoHlBEf2xfHYElE2U=;
        b=N0//rD2vmhzbApmAyVMcVlkaSdeI2Gk4G7L5AzKi7cRTtIBeGbrr+4q+vEO/4hwEoG
         O0bIHmbi6aR/SekKNZLeYUmApwl/Howcv2Fk7y0Exdrmzfs5hjvkba9Ioy8F9zcLYl5P
         J3b9Ngu6rVTkQY7MATvqfUtaiqf81OrX3GBIruEJlQaIuF8tS3Gw4YdqNuUJ1g4U7CDr
         WPhzx/LPrn2uATm5iIUL3pFMcD/ID2zgTl8GRxHAlntEfbO8eAcuZMcPj4qtdNCWoCZr
         rUnEZ1jjcgcbmsw+kGB2HEdhfehHRsuzxx8cPRtq7ciWTvZ6R5lqlEkYrcoUNyat43qN
         IRgQ==
X-Forwarded-Encrypted: i=1; AFNElJ9P1ZDr9x4vBmLyaURQ3V9KTjiv/5Kg4GyR+Ra+NJkJiuslJ/nmjIAQhiv4ea+GnuaodbLHgA/fFSJO@vger.kernel.org
X-Gm-Message-State: AOJu0YyPB4rYx8OQdleFSYEuiWMnBuFbAV9AzlPTW24am3CRoImhOpUH
	vsUzUxT7Dpagc/xHWu6agbzBmthv2S2y0votIWZDM7mApDcFzbJ39KBg
X-Gm-Gg: Acq92OGAav4gpY8W+xba2kjuJUlbC+Wau0Om2l1EXV7G38pWRsPd/IQIVLmgVsA6uim
	zvZ5cPicKGEtG+QvNFLEX40cN7bwKTg0zzkNeYgdT1VvTxOy8jKXXpfrztPTBuOzyMdlc5hIMBY
	O+0DhgtGPZTq07m0nF2Wkw94DptcMQY1qewsfJb9E9m7aX6MFadu+1ugCm2Sy/vb1hFnr4ZKzyO
	uGK5KX9QuQ9UJ7+9DQutCr2r7vXlPOQDhMmD4Z86SbW3TxvwMZKEIFdSbqEyuubOi3GkgZ0h9v1
	ZOxwcFsVVWBkH4c3NJV+khcn0f9a/SjKAtYjI4cH8NPR7uoUR0Ebol9jy/syqCgHs9vV4koewWw
	pUE4/yOrLVO5xA8W9qMlpHrZihRBBKoLxlepnOnL8GcsajASZpEAMxKMCmoqFyRBHMaTTnutSDo
	oipdjTToW9L/dVI0ilv8Uc88EJtVIzjkneW1O4ITYK27ExS2/q
X-Received: by 2002:a05:600c:5942:b0:490:47e3:929a with SMTP id 5b1f17b1804b1-490ec4cd289mr30178815e9.6.1781274653838;
        Fri, 12 Jun 2026 07:30:53 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:c72c:50c4:8b28:9a3a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2c3782sm5850016f8f.25.2026.06.12.07.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 07:30:53 -0700 (PDT)
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
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 02/11] dt-bindings: phy: renesas,usb2-phy: Document RZ/G3L PHY bindings
Date: Fri, 12 Jun 2026 15:30:30 +0100
Message-ID: <20260612143048.317907-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260612143048.317907-1-biju.das.jz@bp.renesas.com>
References: <20260612143048.317907-1-biju.das.jz@bp.renesas.com>
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

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
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

