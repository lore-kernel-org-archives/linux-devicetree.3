Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DD33655C4
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 15:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784733334; cv=none; b=u/glCECJ14fhMi8fEkwXfnujE7Iq32I3mBrqKu8o2j1IRfIo0+vaN1x3K8kogXbN0yBHuFIh0yZJWClj3qYcLi5Ii0kD68EejBIHfBWqzj2TYVY3biIhowo4WT3NsdQ19PGD97WpTC49IjWfCADhFwB7ujD6IRoj93+QjIbSU6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784733334; c=relaxed/simple;
	bh=q3dcpHVSWkzAXGr3iPRgREzgNk7QyK9ayNHDu0LG4fY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WNPhlg6ZMoLAmrC9NErREn/ffHM7bCqUxnb8hYLfFoi9/1mZ0GAfDCIOjge+q7Pkcn59Qae95w35s2pc0pKFW9F+jycmMZU03Iv9zwe90aBcgFjqiP92PirpWeBWDrXtnwjFW/clUcMp0QsyP/tmRbFvwfin59rpnS+36bkdHow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=U9pg9tWB; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="U9pg9tWB"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493f6de72faso43486965e9.0
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 08:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1784733331; x=1785338131; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zvXtHoyutTzc9UQI/R1yf3uc5dETK64DOW+MCP8cwFs=;
        b=U9pg9tWBrHz3pexz2/sIGCPCxdd/6jUb96kgIcraoqSNd5aFJc5ctTvbxTKAhr7jCE
         ZiQg7BHvjs7b4GfSBaW+n/kP9qNMWPEokK/Vds+3yhLrBC7hvELnEZCMyrg8rfDsGSFo
         nZj0OZ+t4yVqBUFUdEjo0nj3qCedmpuUSEXE7ImBdXRhBeXnvGA51yMNSoyEF85Be1sO
         S1F7zGudjWsAU//gSY1hP0i84rUvzQuPpan4VID8odM9/9E7OlvCabpHa4TwdYg8Ezf0
         ayTtLSseogm8NSOazATU/52h+VNA72n48ViQ5falHfTZiHus/lSfJM91olbAUUFcnb+3
         hG7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784733331; x=1785338131;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zvXtHoyutTzc9UQI/R1yf3uc5dETK64DOW+MCP8cwFs=;
        b=VHYeJxUEt+ZJctlzX0z2cweQPkz+srpc8UagOd0o93VcxbwH0T+i6QfmEbAMI9H9cN
         OYS7NRpk2nz2SpQSl5C9PaHfiMr1zurqJ1Jh4UetQQg2y2GCGIfpPxmdCOqL8ai0mP3C
         iUBvUue1hdEyfNFf1nzMbZHrYRGHpEiwvkFkE/aPaE+8EC4kmBWzgiKc+QBQ9ccucgkQ
         25agpNKIFaH8pXRqgtcnBUo+cVaHDHr7FEPRPLWZRF1qx/zg2sKiBNeCulZdlW8pME8b
         WYXnto1SLDIUjW1sTGDfov9tLPaJBk0OR0VjXiaer0i3pKHEsIlwrIuSsdMgefGhG4TX
         +R8w==
X-Forwarded-Encrypted: i=1; AHgh+Rqhw3E3Y8ZAySy35f0XDssaPf56dpLhkFJbxP9DXgab55sG5IHkOyEuFo4eljay82NhCXgbcSCz6t+9@vger.kernel.org
X-Gm-Message-State: AOJu0YzD2NPBX3y7HhmoFN+MVKLe1db+AE1SsLZGwtO1SEwmSsN3YKOx
	jJYo8GsO88vtOMysDI8JzDG9BbUuM2uKJUlQJvLJP372QwjBQ+N8e7MjtTZh0E5ccLw=
X-Gm-Gg: AR+sD10ZXC+F8Xy94QjDIeGzFXx2KGvc4GG0gOKf6YaMaywJnoXAoSV0PjIJ+UPF93u
	rWiKREQTyZKpASXYsoXsK64WoUoi6WbrVlu7hs8i2MYlMWoXv0Tpoz/ryYuHCXB14ZCjk6o+33Y
	tE4M5zd002U+4rC0Qm6ObZ7LQpK8CCXtNjR7qsGhYFLF+IiTMCF0ZUAu0fnpqX8NR8Me03kPoTe
	SsSYC5ko2Cz1zg+ii56663WgqxfDGJIg/ImBhGIJ4ffvC1e9yxMzeURQyMfywMv2XH86yamZJN9
	u9AVKqDZNSSC4/bUS01MlMCEzkW6HJiPgx4FXZgB1uF/wy56ZiXh/y0y6vXBSZQ7DYJxHFaeXQh
	/wD6tO2y2q9teP1y91E4ZgcnU/W3BBTM02ewycO8A1yudzS4trd5Ci+pRMHPNSsW0nS+1JX83bR
	4r4yRCiZYJR8/ENrPNJ8JRnThly8SyLpIAymLtKRJq5Vh5p48bR9N+rwOf6ZJrc8ldzlagc8RLY
	c/txSl7tegVQiI2/g==
X-Received: by 2002:a05:600c:548a:b0:493:f783:c46a with SMTP id 5b1f17b1804b1-4956a4ef5d1mr47012145e9.6.1784733331147;
        Wed, 22 Jul 2026 08:15:31 -0700 (PDT)
Received: from gregwork.sec.9e.network ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956a500dbfsm70595615e9.6.2026.07.22.08.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 08:15:30 -0700 (PDT)
From: =?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corey@minyard.net,
	devicetree@vger.kernel.org
Cc: openipmi-developer@lists.sourceforge.net,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
Subject: [PATCH v2 2/2] ARM: dts: aspeed-g6: add pcie-kcs4
Date: Wed, 22 Jul 2026 15:11:58 +0000
Message-ID: <0b97a66762efc05c9073c14112cc489624871947.1784732161.git.gregoire.layet@9elements.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1784732161.git.gregoire.layet@9elements.com>
References: <cover.1784732161.git.gregoire.layet@9elements.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add pcie_kcs4 node to the LPC bus in the ast2600 g6 common dtsi.

The ASPEED AST2600 has a PCIe to LPC controller. It includes a KCS
interface on channel 4. This is a fully KCS-compatible interface
that is exposed over PCIe.

This can be used by the host for IPMI when the PCIe BMC Device is
activated.

While the datasheet provides interrupt numbers for KCS channels 1, 2,
3 and 4 over PCI, not all 4 are described in the "PCIe to LPC Controller"
section. Since only the KCS channel 4 is described, only this channel is
added.

The pcie_kcs4 uses existing "aspeed,ast2600-kcs-bmc" compatible as it's a
standard KCS interface.

Signed-off-by: Grégoire Layet <gregoire.layet@9elements.com>
---
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
index 56bb3b0444f7..a93fa4cf5d8f 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
@@ -617,6 +617,13 @@ kcs4: kcs@114 {
 					status = "disabled";
 				};
 
+				pcie_kcs4: kcs@914 {
+					compatible = "aspeed,ast2600-kcs-bmc";
+					reg = <0x914 0x1>, <0x918 0x1>, <0x91c 0x1>;
+					interrupts = <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH>;
+					status = "disabled";
+				};
+
 				lpc_ctrl: lpc-ctrl@80 {
 					compatible = "aspeed,ast2600-lpc-ctrl";
 					reg = <0x80 0x80>;
-- 
2.54.0

