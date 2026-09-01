Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA22B47669B
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 13:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788268824; cv=none; b=gfbmCZ4H4BBYXbzfEOMOAIdhudmni15F7y9xNyaC4SfRK/1R0RhfQmQnIO1+Vx5Hsk5U+Vc5Gu/fuYSDSWxUIVCGlY9uQJw6m9Ta1YeiFoGtI0PxJugm8BHjd6VUq2ljsHPj0mQwrOpEuf+JrZmr0COh+l7Jt8ianx4J8Ikx8wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788268824; c=relaxed/simple;
	bh=otjLY8M+I6ZgbZOeUnR9kBIt/DE5V0fH5Sljc8GFFI8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c63hykQfhxzS15V6dN11z3A/1hesBwrxYE0gV5v8KLcAmnH5Z9AacF4UWT9OylxhyoYVQ7kSnTuFE5h5+adtE31nitS7wMQH0KOuBO2JtamZUdTxGrPXrfilvkvoNydHzRzo74hWU3b8cngbH+fk7H7Qp255NK0SiIrH589VJNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lt8GSh42; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lt8GSh42"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c250c6a6a6eso112861266b.0
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 06:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788268821; x=1788873621; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TqkMmON3N0nWAQFU0GAIUZAQN0hk7LFNlz724oqocVQ=;
        b=lt8GSh42dhDmLaoec6DHaW6bK6D/AdnKx1xR+UDrzcaYOLZQgQhTSx0h+jgUjc211M
         dwvYRldhke0bl04Ptxzh2ErPrvW6HftqYeWkeZcF8dYL+r2CCpxfPlMkTeyf//v2RHJZ
         17fZYKv54fs0TuEgCDzE1WUYd/XJSiy04wBmMvBJb9vbBEOXuU0DOsY2vvL/w9UR0ySg
         aYlMgApOCDB7RkxYgu6grkh6lLSk3Ah7Bp775vWfiLnEnzrqz1bTvYIAHZu77EnUOZLg
         RlmSauZu5epfZfxwBeMNBHrWXXsG2cwbqLU8GsmMt8GaRFPHUUujsZ9gYdNAF8wupIFZ
         IeoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788268821; x=1788873621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TqkMmON3N0nWAQFU0GAIUZAQN0hk7LFNlz724oqocVQ=;
        b=MEPozzoCvCB5gf0gSklT4sK8qoaFF7fZf91kWSexy9cJP3475ov56PFB7UUiHv/cUb
         DdlHEU7uusqNUUZW1GuJmTb1cLJFqskZQTbk0LcPnjInA8sUt3CRQQX3SQRCqD/OxSQ7
         3h3UYAcmd+9XNBF1j6pd+QnLbNBjXrDwr+redOdcf53SqHPB2qcRaxGygbYkpJ2e21gE
         B8LF+KbyaStHrUYVTlPI6JldjgFjnSP5TiKS2AHhhfYjkcjZ3CjjhnE3XTnOGcgoKmWR
         ZTpoY0LkMC+gVq6OMKmUFa5cHiztHfwettEiCRWgpQUbEhRHNgLJM43dwdqNyPCrKOnr
         4qSw==
X-Forwarded-Encrypted: i=1; AKwUvBzN9O57wh8ggYVcNkfQHkG/j4SYBXtIVazHLrB1PSwYXJB47VYcXF3P5TkIda2CnMoQuMn3h5jXNF/4@vger.kernel.org
X-Gm-Message-State: AFuF++lX+W5dUerNLWzjP2hnH0tmiHYVjlL4wBtyR1Mu5YyhOK4qK3CU
	kZRPCocyc1hssao7/kX4G9PGfHQtf2/O4/ZR3zKPt1WZx/pqFVwxy3Ql
X-Gm-Gg: AR+sD10R4z1lZhgt/nwp8V0J5J4JDWgaqh0FPhcDa+W8l95etU79+1lmBYIsvgemHYG
	JsD+jTIbztP/xkckeosf6ssZDXtfrQEMzimeeTtNfdqTjbWdCd/ieWyhH9S2ktj3l9676Z9ybYL
	RzQ8ORmrr7vXbHMbEFB+2TSbX6VkhyyJrtbBtOiLoiv2GLDaNyTJNRdw+Iwrewko4EqZD9ZHj6l
	p092rZq0HtJ1+rypB65xPvUYhgrxi6Z8Edr5uEbePv4K9xFXVSwx6sqBw17bdx9Q+Au1CmXqLAg
	L+zFVE+J1nA2x2cXTRlGqn19IHIQ3aYk/Ivc0KVG1rW3rzzKe8gV2JfBKrviRB4IXiDr90hTZbl
	9J6WnUSDAIXz5deRNYvluPfZnerjFwQ86iWmUJ0iplr0DXnbI3oIfnKyVIoWIXv5+cSCsPSo5Ig
	hp30uhJtJilf5blHZyl7aBFJ30wbTdYlDNhDF9VMZYXl/1M+JRyXnKggpKUVrJZUzzPhSf38nYo
	n6TxxRGKb8wlVud
X-Received: by 2002:a17:907:9618:b0:c24:457b:86fc with SMTP id a640c23a62f3a-c25571d3b0dmr2071588666b.21.1788268820741;
        Tue, 01 Sep 2026 06:20:20 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25618430fasm580304366b.22.2026.09.01.06.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 06:20:20 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	elena.popa@nxp.com,
	cosmin.stoica@nxp.com
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 1/2] dt-bindings: arm: fsl: add MR-NAVQ95 board
Date: Tue,  1 Sep 2026 06:19:17 -0700
Message-ID: <20260901131918.1189-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901131918.1189-1-laurentiumihalcea111@gmail.com>
References: <20260901131918.1189-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add DT compatible string for the MR-NAVQ95 board.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 656f2596e1d5..5d9da745b715 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1535,6 +1535,7 @@ properties:
               - fsl,imx95-15x15-frdm      # i.MX95 15x15 FRDM Board
               - fsl,imx95-19x19-evk       # i.MX95 19x19 EVK Board
               - fsl,imx95-19x19-frdm-pro  # i.MX95 19x19 FRDM PRO Board
+              - fsl,imx95-navq            # MR-NAVQ95 board
               - toradex,verdin-imx95-19x19-evk  # i.MX95 Verdin Evaluation Kit (EVK)
           - const: fsl,imx95
 
-- 
2.53.0

