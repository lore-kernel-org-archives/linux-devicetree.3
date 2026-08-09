Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F683CF670
	for <devicetree@vger.kernel.org>; Sun,  9 Aug 2026 12:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786277713; cv=none; b=hfEsLaLKbl5hVF1JiBu4u1t21TAe5LRSG73X5/K2XfohBVCuFJeNwr67OmEhp5wyqL6Fo0JjZAgwq8cH2vvS9jQbMx5LX4l+01cZMJSSgdM1L8C2ZMsdLN7i3VWzITiwCcTX6HoY2Rr/R+Xcgi53ksoBL3Nt3GlLuRo9PfTATKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786277713; c=relaxed/simple;
	bh=VT2WkLbrVHZk/VBbTj+r4ElGw6wpo4atU2roVry+mzA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZqY9hr+V+YlLosSE4Plty6HgRxcJYrgs1xr4qug85NCru5kHfxYG1sm3ZFrToITVKNgPsvzfNxc72FOIVZQkfiSbPBksg67N4X9SdVufcKcO/pXI5+q1Ro7gvype50ptmCNTnZVyMZfmRIOKOkAH3zXIGtKB0QHOSp+8XGTZq14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YV5gi6dY; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YV5gi6dY"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4954df200ddso6324505e9.0
        for <devicetree@vger.kernel.org>; Sun, 09 Aug 2026 05:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786277705; x=1786882505; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XHSgNIqpIGMGCDb/vwfax9xQeZ/i97RAydBRvL1DXus=;
        b=YV5gi6dYipeW2cJLZRhHhOiqjTw80r5E03ZeONgFeSMNb5cjUpvKAdjGfWZkuF6JbA
         HGfG8yb5CMSztLGLx/wKv8i7M8KslM2Vc+B+C+MClZZMActHDvgFDCPvdHSGsy1DyqhI
         DYWw/oWkPT53Rj1StwODOcsOnEi65v23AisRNk67hRLk3GbIhinLqCS7sIIO94fcKSl6
         edOeATs/LaY/Y0V4MPdWoXCupowCebo3D/HZEuCiU35SFNLylmwE6+4lrLfioH9hDzaT
         dtcswbIlrgUhVStw8t99l04kPQ9auDJw8mmdL1kMzC/FM7lKzKFmXPIdhJai31Mg5J77
         92Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786277705; x=1786882505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XHSgNIqpIGMGCDb/vwfax9xQeZ/i97RAydBRvL1DXus=;
        b=P3Qh9m9/UUxZcbp0+lrCKufTK90W9H3VvQU2iDgLsSGignZ5Yvzo5LlCf+2C1z39vy
         6+A0g+w3wZ1lNOyXX9lDuKapq3piAlkAQjg4Uvi41qX00PQR8m1Q86bxv4fKRcjZArw9
         I04m2VjLw5Z8lvYAM73MtxKgehvWmyJ/I1lKWnErQEC2Bm+gZchcNH1LsP9ZXS3zsoeU
         qk6dpD5nWyqrW7L+vkkT1kQw2Dh8IXCqahg3UB+0Jgv7w+YqSVpbx5RQfUvfYJoRes0e
         4yHc7BzsaybNkUuHBIdBA8k1Zw0dl3GHOdr6PnxqHtCFQv34IANpo/FcdLsbtdTXmGTE
         wybw==
X-Forwarded-Encrypted: i=1; AHgh+RoAp8gix2fmsPQEtYvA/QEoE2KgVQ/epgwcM+Tvhuk12iEk/y1bLghoOfMgsw27ZNvcDsp8yt3seuOh@vger.kernel.org
X-Gm-Message-State: AOJu0YyKCCoS7VvjAc+QnwJlb6gts7SmpfXLjgBxI+/iP35k/gPWXuA+
	DNpHzZ/SzSUZK4wv52gjPO3Qm8lAHtDPHEOvWbFbZt9LLIYNwyca151w
X-Gm-Gg: AR+sD10bAMZZEmFQL5LtJVKVPSayfrOhg8JsUQcXH3DPeK2vLjcvjbtCW5vGO9c3Mys
	LapHuUByWX8WiHRul6lbKkuvlTaD4Ht/uDbuyiWmnm83lfTppWjAi/PbTw/5/GJkoWrRR6WwjIv
	4Y4k+nxPVBQQao1QCVTdCN46EDcjGuUulPBDVShnu6WRdI5DlCBY3HWPDRHIILhX1o3PkrlAP7y
	R+Pcy9ruwlyZOqJJaUHiEPV+N+gSEgADVAz07eBbCcVoIVeMtZs8bsdEF8fsPKc2Pn7AIKP2di8
	DVynmyVbRmPCFICT7DIuhRJo0+RHBJ2XssF+Dfakx2qWs508bSDMAECwaXHy/FNdLfdm18RKhXv
	kAxFV/XE8REqfW3+tCRQvA8Qayyf3cPCgchOorOFI1mii/S6/dh99YKJpzNdqt942kruQsFStqA
	Y2/Ox3of6WYLrm3A7ltg+R3EgEuF9pbl9tzmFf+jZpk+Q+xOcesrDN71pl0uCBGdwAtYkdmKWgi
	M92qXATCswE0WZ/Ssl7KkAz9nROco8J6FV9gHi83qCqssqnvGsJjyqaGnQU
X-Received: by 2002:a05:600c:a20b:b0:495:737a:7afe with SMTP id 5b1f17b1804b1-4994e7d5b82mr349705485e9.15.1786277705032;
        Sun, 09 Aug 2026 05:15:05 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-20-3-207.retail.telecomitalia.it. [87.20.3.207])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4995ea3361esm194506475e9.15.2026.08.09.05.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 05:15:04 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	John Ogness <john.ogness@linutronix.de>,
	Manuel Lauss <manuel.lauss@gmail.com>,
	Jacques Nilo <jnilo@free.fr>,
	Rong Zhang <rongrong@oss.cipunited.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Gerhard Engleder <eg@keba.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Lubomir Rintel <lkundrak@v3.sk>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Cc: Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 1/2] dt-bindings: serial: 8250: Add Airoha compatibles
Date: Sun,  9 Aug 2026 14:14:46 +0200
Message-ID: <20260809121449.574277-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260809121449.574277-1-ansuelsmth@gmail.com>
References: <20260809121449.574277-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Benjamin Larsson <benjamin.larsson@genexis.eu>

The Airoha SoC family have a mostly 16550-compatible UART
and High-Speed UART hardware with the exception of custom
baud rate settings register.

Signed-off-by: Benjamin Larsson <benjamin.larsson@genexis.eu>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/serial/8250.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Documentation/devicetree/bindings/serial/8250.yaml
index bb7b9c87a807..b6f7e093d8d7 100644
--- a/Documentation/devicetree/bindings/serial/8250.yaml
+++ b/Documentation/devicetree/bindings/serial/8250.yaml
@@ -110,6 +110,11 @@ properties:
       - const: mrvl,pxa-uart
       - const: nuvoton,wpcm450-uart
       - const: nuvoton,npcm750-uart
+      - const: airoha,en7523-uart
+      - items:
+          - const: airoha,an7581-uart
+          - const: airoha,en7523-uart
+      - const: airoha,an7581-hsuart
       - const: nvidia,tegra20-uart
       - const: nxp,lpc3220-uart
       - items:
-- 
2.53.0

