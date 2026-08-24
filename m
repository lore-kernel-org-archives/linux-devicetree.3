Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9ED40910F
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787569490; cv=none; b=aJ2bqBZ78H0N13EHtiObligOfg9oly5eBwky/m8LwA0AqIlUHAYBr4hS+EyOE8y1alI9Ou44KadKqjxjbu59fb1hMj3tUWGoi273aPnxtWp9Qk3peLb0h+0CTr0mXpphlCgvti3AptVdoZ7/d/K4U52M7r7+ByYgG96aF1SzSg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787569490; c=relaxed/simple;
	bh=6sOjX178g9suBGxYcRFc9I5M5RJoMeqIT2nUal1phc0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o7pMoLzihQrJMmX1U/bJPO/OQowTrOq/kFSoZ9P/j6LlECPXUYvZ8lGUUTTRRomJpOP/W4JQOANQP4aBpEVJ4n0MV2Mic/WiS6s7cW6tiW2H5mrp490ff7yBCJS//mjOeWx/09XDY7A2UW9BQbtvv5Y8CbviwR+zyAVaBa50USo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=cXAeUfGR; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="cXAeUfGR"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c15e2dab83eso624136866b.1
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 04:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1787569488; x=1788174288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0j4qmzLAQl+sVGlmTA0IeZm9e3K6ICC0PLOlup5PmHM=;
        b=cXAeUfGR8yPcNwONp8GiDOdKtPoQ0EycGYz3lKM/8wEDwS0XWAQ480G/e0qU7hMmKq
         XYto+omCHdRHVITcA1JRN01dWGVq2r0Ij7XrAL/mINjx3ciX0mPSA4wWkscQJjs6TDQt
         J04V/qCMmafoQHzs/ynJhVDEZ7ifhVQr3fbLjIhJ+QF4kIZ8p/3MbOvpZqr9z/yBnlkA
         v3grBbbX3KsBAxwVxQkN8QJ0+HzMDObDzcfvtbqHb0lmvDtTW2xMdVz/YvvRATyrlLUx
         f//hak68Y3mbFy7tIYkH8Lqku0K5DiY3tPrqS1JQSdcsMUJMfhyJV/eE7mNxrARblouj
         id7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787569488; x=1788174288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0j4qmzLAQl+sVGlmTA0IeZm9e3K6ICC0PLOlup5PmHM=;
        b=aDWfbHFKrr6VEBAuz8HPVeTulY0LGI4SzIk+pfa3ePt01rjZHmybDJJ//e9geookrq
         3QP18DyYZIFCkwDxHCeTXB44aamBlgBKbHo0EK36XkYkGwxX+SqOK6TIYspp9zJS69CJ
         cvE0c63G5vMUVfYOb5+HTMEQyqM6okyFTZydyRi8pjiQnzWH6wHtuo63ErsevaDnPOmK
         b0cKiHw5QtAjA7LxGJ8TZbzT4SCQKElJqP3UNy059D7IVbk1xpIOhbNoOvxuPyuopYFW
         4lQF3qQj8qdPI4LjHh6sSJdSScIrOj57Rtt8WN3qNc10v+eSDZHKCfy7CtGrKQJpE6ar
         OuWQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpr8BQcVShUqtY3UapKfeFRF1pWyjAosL/E0iQDKR6aeFk4tAzkqK8Edbj1WmZqGzFuqI84ov5c076Q@vger.kernel.org
X-Gm-Message-State: AFuF++nKt4n9uTw6aa90m/yab4uqZSnMw1WLhTgx6hgvMPHA5GjPAGkA
	MHIvNitxz4CC0AMO1rZZ/8oGxewbAH0HCG6nPcrlvXhk7rtXYVB5ecPDf83hr5Mo3vhRP6nNm8B
	nt4td6TY=
X-Gm-Gg: AR+sD11gD9oa5ZxGGDPt5ozDp1FzhDvZOFSWqkkLgkJSUQJpgZA9KVMRE4X+ya+3e/j
	IEyHtWkRKjzO1br+kc0k71hkKocuSzzS7eEYgc56qy4l/0laMrd82lhmrNf3BBHvELrvSnQXo3+
	/F1NXh8uoxfUn/P6PoCMpRhfwbeUXH7eDOxqC9a9ywQtdpVc/1t5Avbt37g3YZT3qZOTlApyC5f
	6OtK8C8n5IbS6FqMFrY7CkYbkWXDnPcWlY1H+kfpUHFQ8evU6hIAV0yLwPLu0rVHG/+rTixdzc6
	1ma6x/1rKpUa54ArLVo/wLOWcYH1ncmQ+Ud3KT4htec235HmI0GgwNA0/yitf6Tg9iWgPKnhdLx
	BmrZXXopFiftpWArSZ8A8A+4sYtrPfxN9m97zoXeZ9IuY8G2bjTUWgjfZzpTSYp8sbVlKGLpj5/
	7oxTbM7wg/Oc2D0IQl9Mm4BRwaOYnG7kTdhhNWq1i2NONi1LXB+lZlLTSxv0WIHUOdGc2xKCQ7F
	1gtoccg5TDz+giFFrfrlCgHI4VPkwXsRajp9msBgcj39AGozuiYpQiY2ZV5kz9xgrZepTl7+iiw
	UzwmTfa5sWD046SebER1cWID36CUIw12tDM8Uw==
X-Received: by 2002:a17:906:f049:b0:c24:6045:2a94 with SMTP id a640c23a62f3a-c246a39f420mr2623291966b.4.1787569487786;
        Mon, 24 Aug 2026 04:04:47 -0700 (PDT)
Received: from threadripper-fedora-workstation (cpe-109-60-82-103.zg3.cable.xnet.hr. [109.60.82.103])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2496738e7esm1331954166b.46.2026.08.24.04.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:04:46 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: ulfh@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	aubin.constans@microchip.com,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH 3/4] arm64: dts: microchip: ev23x71a: enable QSPI
Date: Mon, 24 Aug 2026 12:56:51 +0200
Message-ID: <20260824110432.1074136-3-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260824110432.1074136-1-robert.marko@sartura.hr>
References: <20260824110432.1074136-1-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the QSPI controller and describe the onboard SPI NOR flash.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 .../arm64/boot/dts/microchip/lan9696-ev23x71a.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts b/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts
index 4012ea7d07bb..985ca31e74e7 100644
--- a/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts
+++ b/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts
@@ -463,6 +463,21 @@ phy27: phy@27 {
 	};
 };
 
+&qspi0 {
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <100000000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		spi-tx-bus-width = <1>;
+		spi-rx-bus-width = <4>;
+		m25p,fast-read;
+	};
+};
+
 &serdes {
 	status = "okay";
 };
-- 
2.55.0

