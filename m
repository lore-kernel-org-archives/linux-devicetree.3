Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F661391E59
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 05:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785734138; cv=none; b=cWLVg4v8DgD0YRK4lNYCQEq/mriH1j/QAOOpLc4VIQlrZ2QEaSkMMO8KjIHVcP34fwOuA4nXLGiVCBzyge5JHcb20zlFBUai3uAcadKk/9mdaGfpw9zZkYAZVutw96l2FjfjmfRBQ8EeODVlnQ1mMeSFN5ScUuDavrIQkLkPHRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785734138; c=relaxed/simple;
	bh=vV8lMZbs024nEM6mXjaIv6nOjnfVCGoiA5FCDI8jrNk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cJNCkMAb25KwJezoR6atcKZBxOa1ebRzqOwh7NhpJy/8GJbUEy1rUdTy/ZGve3Qj+u/FGdqXzmadqXpqRaQW8r1IZQPysKURPiNe1Rc2uMvYla4DDnmirB22xNDZFC4nbiTsLdHuLQ/6ySlTNauuiLg0bUaYNhR0NNR4556JnVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f0Slkw3y; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f0Slkw3y"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7ee37dc91f5so1801370a34.3
        for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 22:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785734135; x=1786338935; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ufELgsZA/AuhdmDVFD2N+JzOSgNytpSBYv7TBEiLCKU=;
        b=f0Slkw3ytyDfJQAYfoQObktDbs5eRtwzsQxVSQpx/wGG0q2e6L9jx222fm8Hnf5hhq
         nvUtKOub6TRrlTGB/moPF8QK4mPICCQ/s/er0tLtfGnLvI9O76oxssjOh/1FUDJG4jLs
         C6ylEx5VWz3hg8n9VeXdtnoyCNhmKvzxf1QCj07pHmsM7eICdAdpVQVTV28TBSFCMnCZ
         ahGQmDhrGntqV8Z6u94GZUeGBSMJ4N/ZnME4aLYy8oit4Cb4ADv5uGaKlF4PC+/+Eq0M
         +9bU3qbk4jIQprAyyIO6GyWapTDJRbJTSQkFYGgc85l7yW5rE7lNeoKtI0+/JqlWU0ab
         nkaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785734135; x=1786338935;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ufELgsZA/AuhdmDVFD2N+JzOSgNytpSBYv7TBEiLCKU=;
        b=cq6sWU95xsI+oJZbGSHNsBNn2NDHR5cPuZo9GTA9CTlxaKzkyR40J082I7LaCb5+e7
         GsY4MsgvjkoFRQrH5fnKfj52kqSYyzqUn+a38sefJ9Lo814p9BBGsSIVQC0NZgA81shg
         HwtCH/lLt+AQ2IJHcnTCRK6m6sn3ByCaZr5LvRIIoukClIyN3rDfLvH6cQus0idAaYuc
         7FRF2TyCmORdmlvktHYtazk5AtlrTAl2yHilhFx8uz523/ORTZNevNBHLlbxco7qD9kx
         Tio470Vy/jjdPGuA20h1p9COK1IcX8PK/S/9b5vuL4Wj2U/6rKio0xxJf49aNWKzOwSP
         hrCA==
X-Forwarded-Encrypted: i=1; AHgh+RpRqodOY23fxA77z4kWQkmqOLzl4WdaqbIa+SEi1FU+4oNcxRxBc3oH2wQ9Z50ogYRKbm0HmMv622Sz@vger.kernel.org
X-Gm-Message-State: AOJu0YzXS08CUB45GgJfxplZqTTX367Ir48zOi+kUdB+20VZf2nZgJtl
	j+yJa+rqycs4t7hKMFqKXb1c0YxyVBq7a4KOlaInadMmi9HDSV9uIAAU
X-Gm-Gg: AR+sD10vEf5Um7fzIxbWj8fLuudxnBg0JvkOGJUtL1qVK1yR1CFZWxJK26M3Qik5NlY
	RJ9slV+hHU1qKvqoS9vQ+3ld0yp0+ncP1sO81dHHUnvY/UFfs9O4UmRnKRU5DXmB5rd8tQTsToE
	+bsnjMPrkso/NL3FcZZDsYWOUCW1ad/6ZppBGqF3n87eR+jbG8QhFSFi94G0wuAlZIdr4DbBe0s
	+HyaCJ2GOw01YRE6Br0/vf80gm3oBqyfJM9jZjKnWg7rs3oyQOnA5eQ9tG8Tr9Q3I2zpF6DRwoT
	ddOhZDWIowYkcnrINVAS4hjuwiTea4h95lT+oY6a0I4iOR9e8eFw4kWBSFBu0dsUXf/F9+Zq0J8
	2Cxc/RBWfvTKPRIO+lZrB41HDy2d/wmV4sqsn2R4SHW5fdpl4iNnYoqnROCTzvamo2oi0cGkdIv
	tgODy09FDSxfFvtHdqMGBBfeTPXDvoajUGgUWl9wN0Sa6bZ5r6OWmQT/sAji87Naz8TsssoD9ql
	vqSUSkiiDKnuRqFQcy15hTAhTAscifTrpbWZtSiBGricu7jHL9yEEuKh5u1rq2unEvjMPP1dax6
	Hg3AUaeK/5g6R4Mo4Pn0kzCvAVG1nSILUyyE0Isfwngs9Pwg7v3ktLGmnNsB2KnENNFLisd32ZX
	UX/mYCXfQ7olaN4H5ssUcfUjolS3C
X-Received: by 2002:a05:6830:81f0:b0:7e9:cad9:4bd0 with SMTP id 46e09a7af769-7f196b1550cmr14686937a34.3.1785734130353;
        Sun, 02 Aug 2026 22:15:30 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f18f07a5e3sm6787108a34.15.2026.08.02.22.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 22:15:29 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 02 Aug 2026 23:14:17 -0600
Subject: [PATCH 07/21] dt-bindings: net: x-powers: add AC200 EPHY control
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260802-submit-acx00-of-dynamic-v1-v1-7-0a53cd9e21cc@gmail.com>
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
In-Reply-To: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Saravana Kannan <saravanak@kernel.org>, Lee Jones <lee@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 mfd@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The AC200 companion IC contains a Fast Ethernet PHY controlled through
the parent AC200 I2C regmap.

Describe its control function, including the interface mode and optional
SoC SID calibration cell. The vendor sequence adds three to the calibration
value modulo 16 before writing the BPS_EFFUSE field. If the SID cell is
omitted, the driver can use the AC200's internal copy of the calibration
eFuse. The link-PHY driver supplies its Clause 22 address when enabling the
control function.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../bindings/net/x-powers,ac200-ephy-ctl.yaml      | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/x-powers,ac200-ephy-ctl.yaml b/Documentation/devicetree/bindings/net/x-powers,ac200-ephy-ctl.yaml
new file mode 100644
index 000000000000..b3337c3aa62a
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/x-powers,ac200-ephy-ctl.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/x-powers,ac200-ephy-ctl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: X-Powers AC200 Ethernet PHY control
+
+maintainers:
+  - James Hilliard <james.hilliard1@gmail.com>
+
+description:
+  The AC200 Ethernet PHY control function configures and powers the Fast
+  Ethernet PHY in the AC200. Its registers are accessed through the parent
+  AC200 I2C regmap.
+
+properties:
+  compatible:
+    const: x-powers,ac200-ephy-ctl
+
+  nvmem-cells:
+    maxItems: 1
+    description:
+      Optional SoC SID cell containing the Ethernet PHY calibration value
+      written to the AC200 BPS_EFFUSE field after adding 3 modulo 16, as
+      prescribed by the vendor initialization sequence. If omitted, the
+      driver reads the AC200's internal copy of the calibration eFuse.
+
+  nvmem-cell-names:
+    const: calibration
+
+  phy-mode:
+    enum:
+      - mii
+      - rmii
+
+required:
+  - compatible
+  - phy-mode
+
+dependentRequired:
+  nvmem-cells: [ nvmem-cell-names ]
+  nvmem-cell-names: [ nvmem-cells ]
+
+additionalProperties: false
+...

-- 
2.53.0

