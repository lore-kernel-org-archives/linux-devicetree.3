Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795580147;
	b=ANJe8r0Yz7ezhs7pmumdnSjhVcnRE6BrmjnWrCbMuLN8gLSDmJbBOlv4xQ/aXxgfjbB2
	 nHdEjO/Q/upH/2364xwMfaUZhcPIbRJfR6j3I/4kWGXLqy9NHdB3CZxp1Lk2SDANztJ0C
	 OGGNnBkMA4TzbhxSvJpwZa8KJoVtxWyoY1Yi2+N5nCdM0R+ckaXm/ovXw353vsIOXb2KQ
	 hu+YmkO41hW1IZwwCFVvcjXQKiulo+DaVk4dwsTlPgBQbsWAB8Q/429XJzz5/bIq4QIGE
	 Vh1CIpc6O1GJpWrdqE1CNjaPzo27WMUeW5SpQwbW58fwllrtLGA/ofz3ETzCi61meBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795580147;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=UBdZz/M5NDcaiH2YNNBzA7mMgFU5hsYYyPrjQqPIGtE=;
	b=KS7G1UpqFL6ZS0ZlgmhYrVJZlkRnwQ/qgHEGwqFwtgCBsEK5CPWzsYH4iNy20xshjWmB
	 DdAkqVunqAeLxiZedsAAyCqCgpl488JJWkYWzD9G0BykO5600i/nG5g0WUqZUa0wCy91R
	 V9aGCxP81eYsGywuNXXSp4ej21rU82UlNYEQ0TPYpqdnWRzUg8QUKqKRR5amlJNzNembM
	 FKvZdMOStRg8cWUWBEsgKpp57qr6IiQbDYvNXPw3RFA8obmLEf4O11DTOsls9bmRb3Zhq
	 ckhWbIjB3jADvliyWKiR0RcGUmm/Yi/Rd4xumskmysPLgmlysVkC7vv1XWViWNVO8ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RY9UffRu;
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4211606A333
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 04:15:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4211606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RY9UffRu
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8b3577deeb0so2396638b3a.3
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 20:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795580146; x=1796184946; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UBdZz/M5NDcaiH2YNNBzA7mMgFU5hsYYyPrjQqPIGtE=;
        b=RY9UffRu/b2u3n5dhx0nPxdAeyUJQhaf+fZ1XpKlVoaBHtN1QcheQI0PhaP5qVgqN6
         8QRqa4tEnEXCM21sRSzXp1x4YhLKv50d29Y+0RrgRjssM3+e0GXv+js4bzR31xJdXK5X
         pmozDbM9tovgNHS0blZx7WxmktDhgT5kSa8Q5uK3O0drzUR9HjHJw1+6nxXZPd2sQTvs
         mpoDTlOviZjjxdxdnJT441Qk2q7bfESj/BVstY3mZ8l33WGetv7c5WvxJoPR862XTtag
         1qWkLuOMZV5TVR4LSVxEd8meTUV4bLmMizPewvZXUvH94g3pcDJwOD7sBffQzyVxgngM
         1NjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795580146; x=1796184946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UBdZz/M5NDcaiH2YNNBzA7mMgFU5hsYYyPrjQqPIGtE=;
        b=fo+rwbkGwRL53yIIFNv/nl0jG97ZWSytaZ+XGkZWxOcj7UXRqBsMHNnm3LuVbv7geK
         MqQzs8wZC7im1nsy8mebKczPSiIX/EvOgGxG+S2D9waAdl8tpEicmoB3QBTepQeirkr+
         HDmMg6plxIl2J2CixD3a0g5eBr4SPcANMkk7+WFe2qfx6ab3GaqJcqdVgN2C71IbX5a0
         o/IXzjjzDeMFJws3uHKRVd/eT442eslkyIr/5es/PTb4fqQf+BHHouSo4ROYEnnveTHN
         XQB73kW48x0TrHEz4z2wpVd5LOaw7oRgDfbP+2PTCQkaPQSQ5zsMeJ2PzrpXGc14iyRT
         iZKw==
X-Forwarded-Encrypted: i=1; AL+hErEfEewpVj240p3wVzBru4UZXVupQT7qHwDThSVttGuhxxFFysvhIW4EzORB9ej0I6H5d3dXbMydpSao@vger.kernel.org
X-Gm-Message-State: APuU4Z/P/jqj4Dhz9Ni9rUX040LL67wBy8KpWLGW06lHH1rBl6cHYeeN
	E4AqiCk+QNpZgG47gevNG+XURrz7W1C6DI4GUKySMSSDG83hEsnVtgUd
X-Gm-Gg: AZFdTZcWZn4pRrUp7Uotolf5p3IyHfmuUSDw1+F8RPP5M7bZJ2aiEjMjf/JbD/9b3SF
	JgR7fldhkoCmRBAxnIdJTkdDp12lgzIGVgDkF3XaBG4pvuzWu6Vg2RbET88m2uXGx+y/Fhyi1eb
	R54+sPUzfNjYtWGXcJH1jJOHT0fWWcNEjWPwFdxPs31gw7jrRMKbPhJugMLb0rNnrVO98UGpj+j
	ifS9aYd9T6PE7PHKsCJplimbPnqaiiH8UR5AwJMgdDrx7yzBwjNANmkj+aZ/W44+opptJOcTWuF
	VfA9jEBX2PvrFPkoigi6rMYt6nJPxHyChXqQkueOtDhn6ZcCl2md4nLMB4HHbC6mNwKvuSZ1Qdd
	Ps07qpsFUShWjZd8jty2oj85KB7bWRzJoA0XgGSN7XNwBHthQKUQ8zj4L7z3djttrQ6poqa5Vwe
	UrDsVNWzgd9Oy0wCKtFCNStppuzm5jJgMV7iyin5C3EQEAHP73BHDHbMByf4guRfCCQGsrIkWWG
	uv7ejPmLLO2GaBJ20mDxxOq3VU3mKx17kvqHuZCwF1EPUmG/5LLOmd1cSRQx+oD+CpSQfYOSvnN
	htEQfnPDZuEoASC5QIpMpilVUAg=
X-Received: by 2002:a05:6a21:3b8d:b0:3e2:1a24:fb82 with SMTP id adf61e73a8af0-4014c94a7a3mr16524789637.16.1795580145986;
        Tue, 24 Nov 2026 20:15:45 -0800 (PST)
Received: from localhost ([2001:19f0:8000:4ce8:5400:7ff:fe0e:e6b2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285c272sm8306084b3a.19.2026.11.24.20.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 20:15:45 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Frank Li <Frank.Li@nxp.com>,
	Sherry Sun <sherry.sun@nxp.com>,
	Niklas Cassel <cassel@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	LECOINTRE Philippe <philippe.lecointre@thalesgroup.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Randolph Lin <randolph@andestech.com>,
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	Alex Elder <elder@riscstar.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v8 4/6] dt-bindings: PCI: snps,dw-pcie: Add msi-parent for MSI handle check
Date: Wed, 25 Nov 2026 12:15:18 +0800
Message-ID: <20261125041523.242588-5-inochiama@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125041523.242588-1-inochiama@gmail.com>
References: <20261125041523.242588-1-inochiama@gmail.com>
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

The IMSIC device on RISC-V based system does not require ID
remapping for MSI. So this device only needs "msi-parent"
property for IMSIC-based SoC, and the "msi-map" is not a
necessary property.

Add new condition for MSI handling on IMSIC based SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml b/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml
index b3216141881c..91bbbc8924f6 100644
--- a/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml
@@ -27,8 +27,11 @@ allOf:
   - $ref: /schemas/pci/snps,dw-pcie-common.yaml#
   - if:
       not:
-        required:
-          - msi-map
+        anyOf:
+          - required:
+              - msi-map
+          - required:
+              - msi-parent
     then:
       properties:
         interrupt-names:
-- 
2.56.1

