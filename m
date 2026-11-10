Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794278047;
	b=cGQT9PLlBtBzIB0U7/uXmzbXJPASdDYU8VFG7f90LkleTS/VjAsgp+1msIFTYjTHUfrZ
	 QzvKaywmY9PM76IHfoAvtedkIyL1c9EMBorb2cxKba9R5I3eQczWr3Aoy4nV9VG69gvd3
	 qy05U/eVhEoOM7lTRrYpUAOW4TAntoehY18nZob0MHFxzNYqtfBdxcFUf3ZtEBuzco38l
	 CabMSP6MOfdxYJRB/xa+PJGeU7YdqhVe2AduMzAmRn8PdpMGa78frlYL5JygwujjmDiIW
	 BzeWN4iE1FfieqynQQ/37G28/mOIBINKA77ZrFVYdUbxyaCNp+NhRtZe2Ss/9SSf3Jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794278047;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1B2U2TuVq4N1W00mA+TK0e56v5CSnlPbZ2+KI+KYFME=;
	b=eb79x/Ulu4T26+f7wMcxaSyn4Jaa4Fc59iZnv70Ze5PJXZBTdSWEVGOtrl5yei2Rm+/n
	 MVQd9ZTNTFuULmKNrfAhW/yJjlZPM3nTEAVu+4ee4dVbNJyp7Js9kpZJxKKl3ffru0G+I
	 0az/F6KNN3JWfZec4mLZ+L5CT/zRxmphS15h1B6+eitPXer1NT5o05cVey6O3fD30OVsY
	 RWBfQ8BnC/4vl+WG9fMEkmmyTQ8YDdJKNJStUaFrqRmzqBihYC2vyFU5e0ezK2t4+EK+7
	 V3+h4/HQ3HuXDwlF8doTsD4EPy972rwmDjqobVWe7K95EnetIjD/UeJgKsLFgODPCBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M06Yalqk;
	arc=none smtp.remote-ip=74.125.224.44
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8599D606A31C
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 02:34:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8599D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M06Yalqk
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-67c08c7adadso1255394d50.0
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 18:34:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794278046; x=1794882846; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1B2U2TuVq4N1W00mA+TK0e56v5CSnlPbZ2+KI+KYFME=;
        b=M06YalqkLezGJsnQXzxwusvdPuWcMz+CpsT3O7eDME2xauUBpIaL4SSs1Oox+wJKjl
         fZosiUhycBfcQ43Lsted/o5WTBYZ7GMT6xEZDfEXoNNfGAiqXsncWZNzOCJrrxCo4AW+
         cxJxgbAa6HBki5lcHrWlJrjT44fBUQxbbCvkfXYw12W5d4fDQU8rif8TC9lvyiYAB+lD
         UKI2gciKMtxahh7B6Z2HzZrbbZi0rgONSMx4E9v50XUhbtDvs9UyTojkMqiDxyj3QBuL
         lmaEnf0iuyxKmBUV9dvEKSxjeG2ekrRNcLeG/ni6YczVCv8lgtAphExpo3hJwTS/MhFF
         C+/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794278046; x=1794882846;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1B2U2TuVq4N1W00mA+TK0e56v5CSnlPbZ2+KI+KYFME=;
        b=1LDui7tkO/LNAWbbqJHbzt2M/MJy+ROAoCJ+McORYN2r4ZSnxf4sSxbZ65P24f2B1b
         2m1s402NoY4BcJEdHXOfHVFEKttYyy9c/M5uWLgp8hlyoZjfnNdIAal+rOXTNj9O+NLE
         +hUw+q9UxyGMmNOhA1Pt3IUiduOcbKqQyZrEbckl0uNuTu0JOoUzddTENjVVAkbSNv1c
         N5fKFb2jmXSxus+E+Af2BX/WGsUWyz+oKh3scdBZAby+2KhHao962xhnyRj/2PzCot8G
         oS2XqEsX4AHMVp7ZqiaW3TG7jPigANGc2xqPZ3qglsue68QjuT2F4RjucEJvvY2fbSqg
         yw7w==
X-Forwarded-Encrypted: i=1; AL+hErGthoJAgxvTwcGOLde5PzYfphHFjaLlD5gLmSCVb4+5wbDdy7Akpz9SomyrP9AUwcNucth9xeDBsLLL@vger.kernel.org
X-Gm-Message-State: APuU4Z9rBBCkNlkeRPg+j+/UQ3dFCjVlno3yzks0O7P30VpFiB9fW/UX
	FEyavhn1vqjgYBCKx3Vi3+4+ul7J25jeVDEDDaowJAwoRUkKKt8wcRVD
X-Gm-Gg: AYBFou1VBXZX4g53NZCVYMEQ82Fwh173zQu3Ry/u/OZTQzlJsA8pFu73jEifNUEFgAY
	eam+EKFVQ98xPy3jeZss95mU0kKVc6W+9skB0HweCRVIS6H/QIERhYx2JtkVA6ImqVC6lVTRiDC
	px9nAmpyk0eQfI4Ui2lcM5iKEgQEJcjBD/GCF8yv6k/mFxgriya5mrsmI90f2XA6TekI8OKfxW6
	EQf3Pf1XuWQY7FeeySO8ib9adPBQLL4RCt6I68NQJoEsdMi2Bhdkp2iJVUwKP8/U8WRUfXbTA7P
	O0f59EJ/JC1jQwXvAFWT8FC1UMz33a2tx1SPu/P9hFC9dvbccuH/BMtVCNaII+emm/VFebLAdAU
	mAVVopcJm5q88E2wGJsx3xLYaqKQMHPlp/aoP0tmbdgLAZueXyDd2ltdAQy+JaZv3USw7rSg7oz
	FhAANZVTzXHhAd9itsfLV9IwZkoTDh08ijYic77pDqApwZ2FUJwCJg0PSZOzz1/QAw8Ps8N0eYd
	fZpbNgNThQGM9FFLuOCALNpUWmbfXHbb6+a/d8I6B7MUvW3p7c40oJ4ViiEDx+11k1eh9X99xBu
	WNzSrLmsDWrnwoFvdVDGv3FaKkJQ5i9eJjn5K+DoyTvjFxuI+GwBMN4IyqHY7eSq467rWx4AO3J
	0vBaGnp2CPq+7GHwFeqemq7aBIC9G0OaHrsNxANxK8uKU
X-Received: by 2002:a05:690e:b87:b0:67c:ace:30f0 with SMTP id 956f58d0204a3-67c56791a84mr736072d50.40.1794278046287;
        Mon, 09 Nov 2026 18:34:06 -0800 (PST)
Received: from fabio-X870-EAGLE-WIFI7.tail2bb604.ts.net ([2804:1b3:a802:b7f6:9a06:df51:6e93:24d0])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c589a229csm763960d50.5.2026.11.09.18.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 18:34:05 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: p.zabel@pengutronix.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2] dt-bindings: display: imx: Document fsl,pcr
Date: Mon,  9 Nov 2026 23:33:59 -0300
Message-ID: <20261110023400.319579-1-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some i.MX25 and i.MX27 devicetree display nodes contain fsl,pcr, but
the property has no schema type. As a result, dt-core.yaml reports
its raw bytes as an invalid property:

  imx27-phytec-phycard-s-rdk.dtb: display: fsl,pcr:
  b'\xf0\xc8\x80\x80' is not of type
  'object', 'integer', 'array', 'boolean', 'null'

Document fsl,pcr as a uint32. The property belongs to the display node
referenced by the display phandle and is not valid on the LCD controller
node.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:
- Explicitly forbid fsl,pcr on the controller through allOf, addressing
  the Sashiko review, while retaining its uint32 type for decoding the
  property in legacy display nodes.

 .../devicetree/bindings/display/imx/fsl,imx-lcdc.yaml  | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx-lcdc.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx-lcdc.yaml
index 84610b5690c4..450f95098c99 100644
--- a/Documentation/devicetree/bindings/display/imx/fsl,imx-lcdc.yaml
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx-lcdc.yaml
@@ -65,7 +65,17 @@ properties:
     description:
       LCDC Sharp Configuration Register value.
 
+  fsl,pcr:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      LCDC Panel Configuration Register value used in the display node
+      referenced by the display property.
+
 allOf:
+  # Define the type above for decoding, but forbid it on the controller.
+  - properties:
+      fsl,pcr: false
+
   - if:
       properties:
         compatible:
